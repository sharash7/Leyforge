# FANTASY VOXEL CIVILISATION SANDBOX

## DOCUMENT SET 29

# 29D - Temperature, Wetness, Shelter, Sleep and Environmental Exposure

*Version 0.1 - Detailed Design Bible, Runtime Rules and Integration Contract Draft*

A data-driven environmental-survival system for body temperature, heat and cold exposure, wetness, shelter protection, thermal equipment, sleep pressure, sleep quality, environmental recovery and large-population simulation - designed to make climate, weather, buildings, clothing, camps and rest matter without turning ordinary travel into constant meter maintenance.

**Project Lead and Final Authority: Ash**

Architecture, systems planning, documentation and production support: GPT-5.6 Sol

---

> **Temperature, Wetness, Shelter, Sleep and Environmental Exposure Statement**
>
> Leyforge environmental survival should make a frozen pass, tropical heat, soaked clothing, a storm-exposed camp, a warm hearth and a safe bed feel meaningfully different without forcing the player to babysit five separate meters. The environment supplies external conditions. Set 29 converts those conditions into biological temperature, wetness, sleep pressure and recovery consequences. Shelter, clothing, heat sources, movement, food, medicine, magic and settlement services mitigate those consequences through explicit interfaces rather than hidden exceptions.

| Field | Locked Direction |
| --- | --- |
| Document Set | This is Document 29D in Document Set 29: Survival, Health & Biological Systems. |
| Governing Contract | The **Leyforge Document Sets 27-30 Cross-Set Interface Register v1.0** remains mandatory. 29D owns biological temperature, wetness and sleep response only. |
| Temperature Direction | Temperature is an environmental challenge, not a constantly punitive meter. Safe climates should be stable; meaningful pressure comes from extreme weather, altitude, immersion, realms, poor preparation or prolonged exposure. |
| Representation | Use a normalised biological thermal-load model rather than pretending one Celsius value can describe every ancestry, creature, dimension and magical body. External systems may still provide real or authored temperature values. |
| Wetness Direction | Wetness is a biological/exposure modifier. It changes thermal response, drying, comfort and selected recovery conditions. Wetness does not itself invent disease. |
| Shelter Direction | Buildings, tents, caves, vehicles, vessels and temporary camps provide externally validated shelter traits. 29D calculates biological protection from those traits; it does not decide building validity or structural ownership. |
| Sleep Direction | Sleep exists as a soft biological requirement in Standard. It is largely optional in Peaceful/Relaxed and stronger in Harsh. Sleep restores sleep pressure and supports 29B recovery; it does not own world-clock advancement or respawn. |
| Equipment Direction | Item/gear systems own clothing, armour, liners, bedding and equipment. 29D consumes thermal/wetness/sleep traits and applies biological effects. |
| Movement Direction | Set 30 owns locomotion. It supplies movement/activity state. 29D may change biological demand or expose impairment modifiers but never defines speed, climbing, swimming or vehicle handling. |
| Maritime Direction | Set 26 retains aquatic environment, breath, pressure and specialist maritime contracts. 29D is universal biological thermal/wetness truth and consumes marine snapshots without redefining waves, currents, swimming or drowning. |
| Difficulty Direction | Peaceful, Relaxed, Standard, Harsh and Custom alter exposure rates, warning windows, sleep pressure and consequence severity without changing ownership. |
| UI Direction | The player sees contextual hot/cold/wet/tired warnings and causes. Exact numeric thermal-load or sleep-pressure values are optional, not mandatory HUD bars. |
| Engine Direction | Registry-driven Godot/Summer implementation, authoritative simulation, deterministic scheduled updates, stable IDs, save-safe state and bounded LOD. |

# Document Purpose

Document 29D defines how external environmental conditions become biological consequences. Earlier Leyforge sources already establish climate, seasons, weather, cold regions, hot regions, underwater temperature, shelter, beds, clothing, campfires, temperature-sensitive gear and contextual temperature UI. Those sources deliberately stop short of defining one production-ready biological temperature and sleep model. 29D fills that ownership gap while preserving the external systems that create weather, structures, equipment, movement and maritime conditions.

The document separates **environmental fact** from **biological response**. A biome or weather system may say the current air is cold, windy and raining. A shelter system may say the player is under a roof with wind protection. An equipment system may say the actor wears an insulated cloak that retains water. Set 29 then determines whether the actor is comfortable, cooling, dangerously cold, wet, fatigued or recovering. This separation lets the same storm affect a prepared mountain traveller, an unprepared villager, a fire-adapted creature and a magically protected companion differently without creating four competing weather systems.

29D also establishes sleep as an actual biological system rather than a button that exists only to skip night. Sleep quality is affected by safety, shelter, temperature, wetness, bed/rest-site quality and biological conditions. World-time skipping remains external; 29D simply reports how much restorative sleep occurred.

The values in this document are first-pass production balance locks. They exist so implementation, automated tests and later tuning have a concrete baseline. They may be adjusted through controlled balancing without changing the ownership model.

# Design Sources, Authority and Treatment

| Source | Relevant Direction | Treatment in 29D |
| --- | --- | --- |
| Cross-Set Interface Register v1.0 | Set 29 owns temperature, wetness, fatigue, sleep and biological modifiers; Set 30 owns locomotion. | Governing ownership contract. No movement mechanics are redefined here. |
| 00 - Master Game Design Bible | Survival, building, civilisation and exploration coexist; difficulty ranges from cosy to harsh. | Environmental survival must matter without dominating the sandbox. |
| 01 - Core Gameplay Loop | Shelter, exploration, preparation and recovery are part of the wider loop. | Exposure should create goals such as building shelter or preparing gear, not constant maintenance. |
| 02 - Player Progression | Temperature is a core environmental challenge; clothing, shelter, fire, insulation, magic and potions mitigate it. Sleep/fatigue was deliberately optional/configurable. | Retained and expanded into the full production model. |
| 03-05 - Blocks, Items and Recipes | Fire, hazard blocks, clothing, bedding, shelter materials, cooking/preservation and equipment are data-driven content. | 29D consumes their traits; it does not own their definitions or recipes. |
| 11 / World Content Atlas 24B | Climate uses temperature, moisture, seasonality, altitude, exposure, storm pressure and hydrology; regions change through seasons and disasters. | World/environment systems supply snapshots; 29D converts them into actor exposure. |
| 16 - Combat, Gear and Defence | Temperature gear, stamina, injuries, status effects and recovery interact with danger and equipment. | Combat remains owner of attacks/damage. 29D supplies thermal/sleep modifiers and can hand thermal injury exposure to 29E. |
| 17 - UI/UX System | Temperature is contextual, showing hot/cold trend, protection, cause and safe options; critical warnings require non-colour channels. | 29D defines the biological information contract, not screen layout. |
| 19-20 - Settlement and Buildings | Camps, beds, household climate protection, refuge and recovery facilities are physical validated services. | Structures expose shelter/rest traits; 29D calculates actor response. |
| 24B - Overworld Regions, Climate and Surface Biomes | Production worlds use coherent climate fields rather than fixed POC weather; settlement suitability responds to climate and season. | The biological model must accept many climates and seed-derived conditions. |
| 26D - Marine Climate, Wind, Waves, Tides, Currents and Storm Systems | Weather/environment snapshots own wind, precipitation, sea state and marine atmospheric conditions. | 29D consumes shared atmospheric fields where available. |
| 26E - Swimming, Diving and Underwater Player Interaction | Water changes body temperature faster than air; wetness persists after exit; thermal clothing, shelters, heat and magic mitigate cold. Breath/pressure remain specialist maritime concerns. | Those principles are retained while universal thermal/wetness truth is centralised in Set 29. |
| 29A | Temperature is contextual; wetness modifies temperature/recovery; sleep is soft in Standard; external environment provides conditions. | Governing Set 29 foundation. |
| 29B | Health, Stamina, Exertion, Fatigue and biological recovery are already defined. | 29D publishes environmental modifiers and sleep/rest results to 29B rather than duplicating them. |
| 29C | Hunger, hydration and nutrition are already defined; environmental metabolic/hydration demand interface is reserved. | 29D supplies heat/cold demand multipliers to 29C. |

# Static Table of Contents

- 1. Locked 29D System Identity
- 2. Approved Decision Summary
- 3. Ownership and Non-Ownership Boundary
- 4. Environmental Exposure Architecture
- 5. Temperature Representation and Thermal-Load Model
- 6. Environmental Thermal Pressure
- 7. Biological Thermal Bands and Player Consequences
- 8. Cold Exposure Accumulation and Recovery
- 9. Heat Exposure Accumulation and Recovery
- 10. Extreme Temperature and Thermal Injury Handoff
- 11. Wetness State Architecture
- 12. Wetness Gain, Retention and Drying
- 13. Wetness Interaction With Heat, Cold and Recovery
- 14. Shelter Protection Contract
- 15. Temporary Shelter, Camps, Caves, Vehicles and Vessels
- 16. Heat Sources, Cooling Sources and Environmental Mitigation
- 17. Clothing, Armour, Liners and Thermal Equipment
- 18. Sleep Pressure and Sleep Need
- 19. Sleep Quality and Restorative Sleep
- 20. Beds, Bedrolls, Camps and Sleeping Locations
- 21. Sleep Interruption, Safety and Forced Wake Events
- 22. Sleep Interaction With Fatigue, Health and Recovery
- 23. Hunger, Hydration and Nutrition Interaction
- 24. Injury, Disease, Poison and Medicine Interaction
- 25. Biological Profiles, Ancestry, Creatures, Magic and Realms
- 26. NPCs, Companions, Settlements and Population Exposure
- 27. Worldgen, Weather, Seasons and Maritime Integration
- 28. Movement, Traversal and Activity Integration
- 29. Difficulty Profiles and Custom World Settings
- 30. Simulation LOD, Persistence and Offline Rules
- 31. Multiplayer Authority and Prediction
- 32. UI, Feedback and Accessibility
- 33. Registry Definitions and Runtime Records
- 34. Balance, Anti-Grind and Anti-Exploit Rules
- 35. Validation, Test Cases and Acceptance Criteria
- 36. Cross-Set Interface Amendments
- Appendix A. Reference Balance Tables
- Appendix B. Provisional 29D API Contract
- Appendix C. Runtime Record Templates
- Appendix D. Worked Gameplay Examples
- Appendix E. Migration and Supersession Notes
- Appendix F. Terminology Register

# 1. Locked 29D System Identity

29D is the biological environmental-exposure authority. It owns the actor-side interpretation of ambient temperature, immersion, wetness, shelter, thermal protection and sleep. It does not own the rain cloud, snow biome, bed item, house, campfire, movement mode or spell that supplies those inputs.

> **Locked 29D Rule**
>
> Safe, prepared everyday life should be thermally stable. Temperature becomes a meaningful survival problem when the environment, duration or preparation creates one. The player should usually solve exposure by changing place, clothing, shelter, heat/cooling, activity, timing or preparation - not by staring at a meter until it changes.

| Identity Layer | Design Meaning | Player-Facing Result |
| --- | --- | --- |
| Environmental Readability | Weather and terrain communicate risk before biology becomes critical. | Snow, wind, rain, sun, water and shelter visibly matter. |
| Biological Response | The same environment affects actors differently according to protection and biological profile. | Gear and ancestry are useful without rewriting climate. |
| Shelter Value | Physical buildings and camps reduce exposure and improve sleep/recovery. | Building a roof, hearth or camp has survival purpose. |
| Recovery Loop | Warmth, dryness and sleep help 29B recovery. | Returning home after a dangerous expedition has tangible value. |
| Configurable Pressure | Standard is forgiving; Harsh makes preparation materially more important. | Cosy and survival-focused players use the same systems. |
| Explainability | Every thermal/wetness/sleep modifier has source tags and trend. | Players know why they are cold, wet or unable to sleep well. |

# 2. Approved Decision Summary

| Area | Locked 29D Decision |
| --- | --- |
| Temperature state | Use `thermal_load` from -100 (critical cold) through 0 (thermally neutral) to +100 (critical heat). UI normally shows semantic bands rather than this number. |
| BodyTemperature API | `BodyTemperature()` returns band, direction, severity, trend, principal causes and mitigation; it does not promise literal human core temperature in Celsius. |
| Neutral stability | When total environmental pressure is inside the actor's protected comfort envelope, thermal load naturally returns toward 0. |
| Standard exposure | Mild ordinary weather creates little or no load for suitably clothed actors. Severe/unprepared environments create meaningful load over tens of minutes, not seconds. |
| Critical consequences | Thermal load itself does not silently invent combat damage. At critical exposure it emits a thermal-injury exposure to 29E/29B according to configured severity. |
| Wetness | `wetness` uses 0..100 saturation. It persists after rain/immersion until drying occurs. |
| Wetness and disease | Wetness alone does not cause infection. 29F may consume environmental contamination/exposure where a pathogen source exists. |
| Water temperature | Immersion applies stronger thermal transfer than air exposure, preserving Set 26's direction. |
| Shelter | Shelter is expressed as validated protection traits such as precipitation block, wind block, shade, insulation, enclosure, heating/cooling support and sleep suitability. |
| Clothing | Items expose thermal/wetness traits. 29D calculates final biological protection; armour/item owners retain gear identity and durability. |
| Sleep pressure | `sleep_pressure` uses 0..100. It rises gradually while awake and falls during valid sleep. Standard is soft-pressure rather than a daily hard fail state. |
| Standard sleep cadence | Reference baseline is approximately 16-18 simulation hours awake before clear Tired pressure and 7-9 hours of good-quality sleep for full restoration from a normal day. |
| Sleep quality | Quality is a 0..1 multiplier from rest-site quality, safety, shelter, temperature, wetness, interruptions and relevant biological conditions. |
| Time skipping | 29D never advances the world clock itself. It reports requested/actual sleep and restorative result to the external world-time authority. |
| Fatigue | 29B remains owner. Sleep result reduces or modifies Fatigue through an interface; 29D does not create a second long-term fatigue meter. |
| NPC sleep | Nearby named NPCs can visibly use beds/shelter; distant populations use schedule/cohort summaries. |
| Offline player | Closing the game cannot silently create dangerous sleep deprivation or temperature exposure. |

# 3. Ownership and Non-Ownership Boundary

## 3.1 29D Owns

- Biological thermal load and direction.
- Actor-specific protected comfort envelope.
- Biological heat/cold accumulation and dissipation.
- Wetness state as an actor exposure state.
- Wetness gain/retention/drying calculation from supplied environment/equipment inputs.
- Biological consequences of wetness on thermal response, comfort and recovery.
- Sleep pressure.
- Sleep eligibility from biological/environmental conditions.
- Sleep quality calculation.
- Restorative sleep amount.
- Thermal/wetness/sleep modifiers sent to 29B/29C/29E/29F.
- Population-level environmental exposure summaries.

## 3.2 29D Does Not Own

- Weather generation, forecast, storms, seasons or climate fields - world/environment owners.
- Biome temperatures, altitude, precipitation or magical weather definitions - worldgen/Atlas/dimension owners.
- Block construction, roof validity, building function or housing ownership - Blocks/Structures/Documents 19-20.
- Campfire, stove, cooling block or bed item identity - Items/Blocks/Recipes.
- Armour/clothing statistics unrelated to thermal/wetness biology - Items/Combat.
- Movement speed, sprinting, climbing, swimming, riding, vehicles or pathfinding - Set 30/Set 26 as reconciled.
- Breath, drowning, pressure/decompression or marine current/wave physics - Set 26.
- Health, Stamina and Fatigue resource truth - 29B.
- Hunger, Hydration and Nutrition resource truth - 29C.
- Thermal injuries after they become persistent injury records - 29E.
- Disease or poison lifecycle - 29F.
- Healing/treatment procedures - 29G.
- Dialogue, companion social care or relationship reaction - Set 28.
- Prices, fuel economics or housing costs - Set 27.
- World-clock/time-skip authority - technical/world simulation owner.

## 3.3 Cause-Response Pattern

A normal cold-weather update follows:

1. Environment owner publishes an `EnvironmentExposureSnapshot`.
2. Shelter/structure owner supplies current protection context.
3. Equipment owner supplies thermal and wetness traits.
4. Set 30/Set 26 supplies activity/movement/contact state.
5. 29D resolves actor-specific thermal pressure and wetness change.
6. 29D updates `thermal_load`, `wetness` and sleep context.
7. 29D publishes resulting Stamina/Fatigue, metabolic, recovery and impairment modifiers.
8. 29B/29C/29E/29F consume only the interfaces they own.
9. UI shows the readable cause and trend.

No weather, structure or movement system may directly subtract Health for ordinary exposure unless a separate explicit hazard/damage owner is involved.

# 4. Environmental Exposure Architecture

## 4.1 Environment Exposure Snapshot

29D requires one coherent environmental snapshot rather than independently querying rain, wind, biome, water and building systems in arbitrary order.

Minimum fields:

- snapshot ID/revision;
- world timestamp;
- position/region reference;
- ambient thermal value or band;
- ambient thermal severity/class;
- wind exposure/intensity;
- precipitation type and intensity;
- humidity/moisture pressure where used;
- direct solar/radiant heat exposure;
- water/liquid contact fraction;
- liquid temperature or thermal class where relevant;
- surface/ground thermal hazard where relevant;
- magical/realm thermal modifier;
- contamination/hazard tags owned externally;
- source confidence/knowledge fields for UI if required.

The snapshot may include physical units internally, but 29D must also accept normalised authored bands so fantasy realms and magical climates do not require fake Earth science.

## 4.2 Shelter Snapshot

A separate `ShelterExposureContext` provides:

- precipitation protection 0..1;
- wind protection 0..1;
- solar/shade protection 0..1;
- thermal insulation 0..1 or signed modifier;
- enclosure class;
- active heating/cooling contributions;
- sleep-suitable flag;
- safety/occupancy restrictions from external owners;
- source structure/site IDs.

## 4.3 Equipment Exposure Profile

Equipment systems expose aggregate actor thermal traits:

- cold protection;
- heat protection;
- wind protection;
- waterproofing/water resistance;
- moisture retention;
- drying rate modifier;
- active warming/cooling effect if valid;
- coverage class/tags;
- damaged-equipment effectiveness multiplier supplied by item owner.

29D may aggregate these traits for biology but may not change item durability or repair state.

# 5. Temperature Representation and Thermal-Load Model

## 5.1 Thermal Load

`thermal_load` is the canonical actor-side temperature pressure:

- -100 = critical cold load;
- 0 = thermally neutral;
- +100 = critical heat load.

The value is not displayed as a literal body temperature by default. It is a gameplay abstraction that works for humans, dwarves, fae, magically altered actors, creatures and future realm-adapted bodies.

## 5.2 Why Not Literal Core Temperature

Literal Celsius-based physiology would create false precision, species conflicts and balancing problems. The external environment may still use real temperature-like values, but the biological result is normalised through the actor's `BiologicalThermalProfile`.

A cold-adapted actor can therefore have a lower comfort envelope and slower negative-load accumulation without changing the biome itself.

## 5.3 Thermal Trend

Every update records:

- `warming_fast`;
- `warming`;
- `stable`;
- `cooling`;
- `cooling_fast`.

Trend is more useful to the player than raw value because it answers whether current action is improving or worsening the situation.

# 6. Environmental Thermal Pressure

29D converts the environment, shelter, equipment and activity context into a signed `effective_thermal_pressure`.

Reference stages:

1. Resolve external ambient thermal challenge.
2. Apply actor biological comfort envelope.
3. Apply shelter protection.
4. Apply clothing/equipment mitigation.
5. Apply wind and precipitation effects.
6. Apply wetness and water-contact transfer.
7. Apply activity heat generation from Set 30/29B activity intensity.
8. Apply magical/temporary biological modifiers.
9. Clamp to configured extreme-pressure bounds.

## 6.1 Pressure Classes

| Effective Pressure | Meaning | Standard Expected Result |
| --- | --- | --- |
| 0 - Neutral | Inside protected comfort envelope. | Thermal load trends toward 0. |
| 1 - Mild | Noticeable but safe for long periods. | Slow load; usually solved by routine clothing or shade. |
| 2 - Moderate | Meaningful preparation challenge. | Load becomes relevant over extended travel. |
| 3 - Severe | Unsafe without mitigation. | Strong warnings and meaningful penalties over tens of minutes. |
| 4 - Extreme | Expedition/emergency condition. | Critical load can occur rapidly if ignored. |

## 6.2 Activity Heat

Activity does not directly set temperature. Set 30/29B supplies activity intensity; 29D interprets it as biological heat production. In cold conditions this may partially help. In hot conditions it may worsen heat pressure and increase 29C hydration demand.

The player should not exploit infinite sprinting as free heating because activity also consumes Stamina and builds Fatigue through 29B.

# 7. Biological Thermal Bands and Player Consequences

| Absolute Thermal Load | Semantic Band | Typical Consequence |
| ---: | --- | --- |
| 0-20 | Comfortable / Adapting | No significant penalty; contextual trend only. |
| 21-40 | Chilled / Warm | Mild warning; small recovery or comfort effect only. |
| 41-60 | Cold / Hot | Stamina regeneration and recovery begin to reduce; demand modifiers increase. |
| 61-80 | Severe Cold / Severe Heat | Strong impairment; Fatigue pressure increases; persistent exposure risk. |
| 81-99 | Dangerous Cold / Dangerous Heat | Critical warnings; thermal injury exposure begins according to profile. |
| 100 | Critical | Maximum exposure; repeated injury/Health consequences possible through owning biological systems. |

Sign determines cold versus heat. Severity is the absolute value.

## 7.1 Standard Modifier Reference

At Cold/Hot (41-60):

- Stamina regeneration modifier target: about -10% at band midpoint.
- 29B natural Health recovery modifier: up to -10% if exposure remains unresolved.
- Fatigue gain modifier: up to +10% during strenuous activity.

At Severe (61-80):

- Stamina regeneration modifier: approximately -20% to -30%.
- natural recovery may pause if the actor is actively deteriorating;
- exertion cost may rise modestly;
- Set 30/Combat may consume a bounded functional impairment modifier.

At Dangerous/Critical:

- severe warnings;
- 29E thermal injury exposure;
- 29B may receive Health-deterioration permission only through explicit injury/hazard output;
- actions remain possible unless another owning system imposes a valid capability restriction.

# 8. Cold Exposure Accumulation and Recovery

## 8.1 Standard Reference Rates

Cold load gain is based on effective pressure after protection:

| Pressure Class | Reference Load Gain |
| --- | ---: |
| Mild | 0.15 points / simulation minute |
| Moderate | 0.50 points / simulation minute |
| Severe | 1.50 points / simulation minute |
| Extreme | 4.00 points / simulation minute |

These are baseline design values, not real physiology. Extreme unprotected cold can therefore move a neutral actor toward critical load in roughly 25 simulation minutes; severe cold takes much longer and is highly responsive to preparation.

## 8.2 Cold Recovery

When effective pressure becomes neutral or warm enough to recover, cold load trends toward 0.

Reference Standard recovery:

- ordinary dry indoor shelter: 0.75 points/minute;
- warm shelter/hearth: 1.5 points/minute;
- strong validated heat treatment: up to 3.0 points/minute;
- wet clothing may reduce effective recovery until drying begins;
- severe injury/illness can modify recovery through 29E/29F.

Rapid magical heating may accelerate load recovery only if the magic definition declares a biological warming effect. Visual fire VFX alone never changes body temperature.

# 9. Heat Exposure Accumulation and Recovery

Heat uses the same signed thermal-load model but has distinct pressure causes and interactions.

## 9.1 Heat Sources

- hot ambient climate;
- direct sun/radiant exposure;
- enclosed hot industrial spaces;
- fires/lava where environment owners provide radiant hazard;
- hot liquids;
- heavy activity;
- insulating gear in hot conditions;
- magical or dimensional heat.

## 9.2 Standard Reference Rates

Use the same pressure-class load rates as cold unless a specific profile overrides them. This keeps balancing explainable while allowing heat-specific mitigation and hydration effects.

## 9.3 Heat Recovery

Cooling may come from:

- shade;
- cooler interior spaces;
- reduced activity;
- water contact where the liquid is thermally safe;
- airflow where appropriate;
- cooling blocks/machines;
- clothing changes;
- potions/magic with declared cooling effects.

A cooling source may reduce thermal load without automatically hydrating the player. 29C hydration remains separate.

# 10. Extreme Temperature and Thermal Injury Handoff

29D owns exposure state. 29E owns persistent injuries such as frostbite-like or heat-damage injuries.

When a configured Dangerous/Critical exposure threshold is maintained, 29D emits `ThermalInjuryExposure` containing:

- actor ID;
- cold/heat type;
- severity;
- accumulated duration;
- body-region weighting if supplied by equipment coverage;
- protection-failure context;
- source environment IDs/tags;
- transaction/evidence ID;
- timestamp.

29E decides whether an injury is created or worsened. This preserves one injury system.

29D may continue accumulating thermal load after injury occurs; treating the injury does not automatically make the environment safe.

# 11. Wetness State Architecture

`wetness` uses 0..100 actor saturation.

| Wetness | Band | Meaning |
| ---: | --- | --- |
| 0-10 | Dry | No meaningful wetness. |
| 11-30 | Damp | Light rain/spray/sweat exposure. |
| 31-60 | Wet | Clothing/body meaningfully wet. |
| 61-85 | Soaked | Heavy rain, repeated immersion or poor waterproofing. |
| 86-100 | Saturated | Full immersion or prolonged severe exposure. |

Wetness is not a cleanliness meter and not a disease meter.

## 11.1 Canonical Meaning

Wetness represents the biological and clothing-level water exposure relevant to temperature, drying and comfort. It does not attempt to track litres of water inside every garment.

# 12. Wetness Gain, Retention and Drying

## 12.1 Wetness Gain Sources

- precipitation;
- wading/immersion;
- spray/surf;
- swimming/diving state from Set 26/30 interface;
- wet environmental interactions;
- specific magic/liquid effects.

## 12.2 Reference Gain Rates

| Exposure | Reference Wetness Gain |
| --- | ---: |
| Light rain, no cover | +0.4 / min |
| Heavy rain | +1.5 / min |
| Repeated spray/wading | +2.0 / min |
| Full immersion | Rapidly approaches 100; target +15 / min minimum or direct saturation by long immersion. |

Waterproofing reduces gain. Full immersion may overwhelm ordinary rain resistance unless the equipment declares sealed protection.

## 12.3 Drying

Drying is based on:

- precipitation stopped/blocked;
- ambient temperature;
- airflow;
- shelter;
- active heat/cooling suitability;
- equipment moisture retention;
- whether equipment remains worn;
- magical drying effects.

Reference Standard rates:

- mild outdoor drying: 0.3/min;
- sheltered dry environment: 0.75/min;
- warm hearth/drying area: 1.5/min;
- strong magical/industrial drying: up to 3.0/min unless content explicitly supports more.

No item needs individual per-fibre water simulation.

# 13. Wetness Interaction With Heat, Cold and Recovery

Wetness primarily changes heat transfer and comfort.

## 13.1 Cold Conditions

Wetness amplifies cold pressure after equipment mitigation. Reference amplification:

- Damp: up to 1.05x cold pressure;
- Wet: up to 1.15x;
- Soaked: up to 1.30x;
- Saturated: up to 1.50x.

Water immersion uses stronger transfer rules supplied by liquid contact and may exceed these ordinary clothing multipliers.

## 13.2 Hot Conditions

Wetness can modestly help cooling when the environment allows evaporation, but high humidity or hot liquid contact may remove that benefit. 29D uses the environment snapshot rather than assuming all wetness cools.

## 13.3 Recovery

Being wet does not always stop recovery. It reduces sleep/recovery quality when it causes thermal discomfort, contamination or unsuitable rest conditions. A warm protected bath or magically controlled wet environment may be fully safe.

# 14. Shelter Protection Contract

Shelter is a major survival bridge between voxel building and biology.

29D does not decide whether a structure qualifies as a house. It consumes a validated shelter context.

## 14.1 Shelter Traits

A shelter provider may expose:

- `precipitation_block`;
- `wind_block`;
- `solar_shade`;
- `thermal_insulation`;
- `enclosure_class`;
- `ground_separation`;
- `active_heat_capacity`;
- `active_cooling_capacity`;
- `drying_support`;
- `sleep_suitability`;
- `safe_occupancy` supplied by owning system;
- `air_quality/hazard` tags where relevant.

## 14.2 No Appearance-Only Shelter

A roof-looking decorative object does not automatically provide protection if the structure/voxel system does not validate its physical coverage. Conversely, a cave, improvised lean-to or vessel cabin may provide excellent environmental protection without being classified as permanent housing.

## 14.3 Partial Shelter

Protection is continuous rather than binary. A roof may block rain but not wind. A wall may block wind but not sun. A tent may reduce both but have poor insulation. This allows meaningful camping and construction choices without a full fluid-dynamics building simulator.

# 15. Temporary Shelter, Camps, Caves, Vehicles and Vessels

## 15.1 Camps

A simple camp can combine:

- bedroll/rest surface;
- roof/tent protection;
- fire/heat source;
- dry storage;
- light/ward/safety support from external systems.

29D consumes these traits and calculates thermal/sleep results.

## 15.2 Caves

Caves may provide wind and precipitation protection while retaining cold, dampness, creatures, smoke or other hazards. A cave is not automatically safe simply because rain cannot enter.

## 15.3 Vehicles and Vessels

Set 30/Set 26 owns vehicle/vessel state. Interiors may expose shelter, heating, cooling and sleep traits. 29D treats them like any other rest environment.

A moving wagon with a covered bed can therefore allow partial rest if the movement/vehicle owner says the sleeping interaction is valid. 29D does not decide vehicle handling.

# 16. Heat Sources, Cooling Sources and Environmental Mitigation

## 16.1 Effect Contract

Blocks, machines, items, magic or structures that genuinely change biological temperature expose a `ThermalMitigationEffect`.

Required fields:

- source ID;
- heat/cool direction;
- strength;
- radius/zone or attachment context;
- fuel/power/active-state validation owned externally;
- exposure falloff if relevant;
- safety/hazard tags;
- duration;
- effect stacking group.

## 16.2 Visuals Are Not Authority

A flame animation, glowing rune or warm-coloured light does not create heat unless the owning gameplay definition exposes a thermal effect.

Likewise, a powered heater cannot warm the player if its external power/fuel state is invalid.

## 16.3 Stacking

Multiple sources may combine, but ordinary heat/cooling has diminishing returns and a cap. This prevents stacking twenty campfires into an instant thermal reset or freezing a boss arena by placing many minor cooling decorations.

# 17. Clothing, Armour, Liners and Thermal Equipment

## 17.1 Equipment Traits

Items may expose:

- cold insulation;
- heat shedding;
- waterproofing;
- wind resistance;
- moisture retention;
- drying modifier;
- thermal mass/load class;
- body coverage tags;
- active magical thermal effect;
- compatibility tags for liners/modules.

## 17.2 No Universal Best Outfit

A high-insulation outfit is useful in cold climates but may become a liability in extreme heat. Lightweight heat gear may provide poor cold protection. Waterproof gear may retain more internal moisture unless designed otherwise.

This supports regional preparation and trade without turning clothing into a single linear armour tier.

## 17.3 Armour Interaction

Combat owns armour defence. 29D reads thermal traits only. Heavy armour may affect heat management or drying if the item definition exposes those fields; 29D must not infer them from armour class alone.

## 17.4 Damage and Condition

The item owner supplies the effectiveness multiplier for damaged gear. 29D applies the supplied result but does not repair or degrade equipment.

# 18. Sleep Pressure and Sleep Need

Sleep is a longer-term biological state distinct from 29B Fatigue.

`SleepPressure` answers: **how strongly the body currently needs restorative sleep?**

Fatigue answers: **how impaired is the actor by accumulated strain and insufficient recovery?**

The two interact but are not duplicates.

## 18.1 Sleep Pressure Bands

| Sleep Pressure | Band | Standard Meaning |
| ---: | --- | --- |
| 0-30 | Rested | No meaningful sleep pressure. |
| 31-50 | Normal Awake | Sleep will help but no penalty. |
| 51-65 | Drowsy | Contextual reminder; small recovery penalty. |
| 66-80 | Tired | Modest Stamina/Fatigue/recovery effects. |
| 81-95 | Very Tired | Stronger impairment and clear sleep need. |
| 96-100 | Sleep Deprived | Severe biological strain; Harsh may permit stronger consequences. |

## 18.2 Standard Accumulation

Reference baseline while awake: **3.2 SleepPressure points per simulation hour**.

This yields:

- Drowsy around 16 hours awake from fully rested;
- Tired around 20-21 hours;
- Very Tired around 25 hours;
- maximum pressure after roughly 31 hours.

Ordinary play should therefore not require a rigid once-per-short-game-day sleep schedule unless the world's day length is deliberately calibrated that way.

## 18.3 Activity and Conditions

Strenuous activity, illness, severe thermal stress and some magic may increase sleep pressure modestly. Ordinary sprint actions should not individually add visible sleep pressure.

# 19. Sleep Quality and Restorative Sleep

Sleep pressure falls only during valid sleep.

Reference restoration at quality 1.0: **12 SleepPressure points per simulation hour**.

A normal 7-9 hour good sleep therefore restores a typical day's pressure and can clear near-maximum pressure with sufficient duration.

## 19.1 Sleep Quality Formula Inputs

Quality begins at the rest site's base value and is modified by:

- shelter protection;
- thermal comfort;
- wetness/dryness;
- safety/hostility context supplied externally;
- bed/rest-surface quality;
- noise/disturbance context if a gameplay owner supplies it;
- injury/disease/poison discomfort from 29E/29F;
- magical effects;
- interruptions.

Standard quality is clamped 0..1.25. Above 1.0 represents unusually restorative specialist lodging, magic or care, but cannot erase unlimited Fatigue or injury.

## 19.2 Minimum Restorative Sleep

A sleep interval under 30 simulation minutes is treated as a brief doze and cannot receive the full deep-sleep recovery multiplier. Short naps can still reduce some pressure.

This prevents rapid repeated sleep interaction spam from replacing meaningful rest.

# 20. Beds, Bedrolls, Camps and Sleeping Locations

## 20.1 Rest-Surface Interface

Item/structure systems expose a `RestSiteProfile`:

- site ID;
- base sleep quality;
- capacity;
- allowed body/profile tags;
- shelter requirement or embedded shelter traits;
- ownership/permission result;
- cleanliness/condition context if owned externally;
- temperature/wetness mitigation traits;
- respawn functionality if another system owns it;
- occupancy reservation token.

## 20.2 Reference Quality Classes

| Rest Site | Base Quality |
| --- | ---: |
| Ground/no bedding | 0.45 |
| Simple bedroll | 0.65 |
| Camp bed / basic cot | 0.75 |
| Normal household bed | 0.90 |
| Good inn/quality bed | 1.00 |
| Specialist recovery bed | 1.10 before medical modifiers |

These values describe sleep biology only. They do not define building prestige, rent or social meaning.

## 20.3 Sleeping Anywhere

The player may attempt sleep on valid terrain where world settings permit it, but poor safety/shelter/temperature can reduce quality or make the action invalid for clear reasons.

The system should favour player freedom: "You can sleep here, but it will be poor and exposed" is often better than an arbitrary hard denial.

# 21. Sleep Interruption, Safety and Forced Wake Events

29D owns biological sleep state, but external systems can emit wake events.

Valid interruption sources include:

- damage or combat engagement;
- nearby hostile threat when the threat/AI owner says the actor notices it;
- structure destruction;
- severe temperature escalation;
- drowning/liquid hazard from Set 26;
- scripted quest/event wake;
- multiplayer host/world rules;
- explicit player input.

## 21.1 No Hidden Enemy Immunity

Sleeping does not freeze world threats unless the external world-time/simulation rule explicitly does so.

## 21.2 Time Skip Boundary

When the player requests sleep:

1. 29D validates biological/rest-site conditions.
2. External time authority decides whether and how world time advances.
3. World simulation progresses authoritative events.
4. 29D receives actual elapsed sleep duration and interruption result.
5. 29D applies restorative sleep once.

29D never assumes requested sleep time equals elapsed safe sleep.

# 22. Sleep Interaction With Fatigue, Health and Recovery

29B remains owner of Fatigue, Health and natural recovery.

29D publishes:

- `SleepPressure()`;
- `SleepQuality()`;
- `RestorativeSleepResult`;
- `RecoveryEnvironmentModifier()`;
- `ThermalRecoveryModifier()`.

Reference Standard effects:

- Rested/Normal Awake: no Fatigue penalty.
- Drowsy: up to -5% Stamina regeneration/recovery efficiency if prolonged.
- Tired: around -10% Stamina regeneration and modest Fatigue resistance loss.
- Very Tired: around -20% Stamina regeneration, stronger Fatigue gain and reduced natural recovery.
- Sleep Deprived: stronger bounded impairment; direct Health damage is not default Standard behaviour.

A high-quality sleep can reduce 29B Fatigue according to 29B's own rules. 29D sends the sleep result; it does not directly rewrite Fatigue.

# 23. Hunger, Hydration and Nutrition Interaction

29C owns nourishment.

29D supplies environmental demand modifiers through AM-29-016 refinement.

## 23.1 Heat

Hot conditions may increase hydration demand when Thirst is enabled.

Reference Standard/Harsh interface values:

- Warm band: up to +5% hydration demand.
- Hot: up to +15%.
- Severe Heat: up to +30%.
- Dangerous/Critical: up to +50%, subject to 29C combined-demand cap.

When Thirst is disabled, 29C does not secretly turn hydration into a hidden penalty. Heat still affects thermal state and may affect Fatigue/Stamina through 29B.

## 23.2 Cold

Cold may increase metabolic demand modestly:

- Cold: +5% hunger/metabolic demand;
- Severe Cold: +10%;
- Dangerous/Critical: up to +15%.

These values must remain small enough that a blizzard does not consume an entire meal in minutes.

## 23.3 Nutrition

Good nutrition supports recovery through 29C/29B but does not grant cold immunity or replace clothing/shelter.

# 24. Injury, Disease, Poison and Medicine Interaction

## 24.1 Injuries

Existing injuries may:

- reduce thermal tolerance;
- reduce activity-based warming ability;
- reduce sleep quality;
- require warmer/drier recovery conditions.

29E supplies these modifiers.

## 24.2 Disease

Disease may alter temperature tolerance, sleep quality or sweating/chills through 29F. 29D does not invent fever diseases; it merely applies declared disease modifiers.

## 24.3 Wetness and Infection

Being wet is not automatically an infection roll. 29F receives disease exposure only when a valid pathogen/contamination source exists, such as contaminated floodwater, unsanitary shelter or a disease-specific environment tag.

## 24.4 Treatment Environment

29G may require warmth, dryness, sleep or stable temperature as treatment conditions. 29D exposes those states but does not own medicine procedures.

# 25. Biological Profiles, Ancestry, Creatures, Magic and Realms

29H will own final universal biological-profile integration, but 29D requires thermal/sleep fields now.

## 25.1 Provisional Thermal Profile

- comfort-band offset/range;
- cold accumulation multiplier;
- heat accumulation multiplier;
- immersion transfer multiplier;
- wetness retention modifier;
- drying modifier;
- sleep-pressure gain modifier;
- sleep restoration modifier;
- sleep-duration preference band;
- magical/realm adaptation tags.

## 25.2 Ancestry Is Not a Hardcoded Climate Stereotype

Culture, ancestry and habitat remain separate. A cultural clothing pack may support cold travel independently of ancestry. Biological traits require explicit profile data rather than assumptions.

## 25.3 Magic

Magic may supply:

- active warming/cooling;
- insulation;
- dryness/waterproofing;
- sleep induction or resistance;
- realm adaptation;
- environmental shielding.

Spell/magic systems own the capability and cost. 29D owns the declared biological effect.

## 25.4 Realm Rules

Dimensions may expose nonstandard thermal laws through the same environment contract: magical cold, ash heat, dream-state sleep distortion or other authored effects. If a realm mechanic is not biologically temperature/sleep related, it remains with the realm owner.

# 26. NPCs, Companions, Settlements and Population Exposure

## 26.1 Named NPCs

Nearby important NPCs can use the same thermal/wetness/sleep logic as the player with schedule-aware simulation.

They should seek available shelter/rest through NPC AI ownership rather than 29D pathfinding them to beds.

29D exposes care/need signals such as:

- `ExposureNeed()`;
- `SleepNeed()`;
- `ThermalRisk()`;
- `DryingNeed()`.

Set 28/NPC systems decide social/AI response.

## 26.2 Population Cohorts

Distant settlements do not simulate every raindrop on every villager. They use deterministic cohort exposure based on:

- climate/weather severity;
- available housing/shelter capacity;
- heating/cooling resources/service;
- clothing readiness;
- population vulnerability;
- sleep capacity/overcrowding;
- current emergencies.

The result is a population `ExposureSatisfaction` and `SleepSatisfaction` summary that can affect Health, workforce and service demand without spawning thousands of per-actor updates.

## 26.3 Housing and Settlement Services

Set 20 remains owner of housing and facilities. It may report:

- protected beds available;
- climate-protected capacity;
- heating/cooling service availability;
- emergency shelter capacity;
- displacement/overcrowding;
- recovery-bed capacity.

29D uses those services to resolve biological exposure and sleep quality.

# 27. Worldgen, Weather, Seasons and Maritime Integration

## 27.1 Worldgen and Atlas

Worldgen/Atlas defines climate. 29D never changes biome temperature because the player is cold. It only changes the actor.

Seasonal transitions can alter exposure snapshots, producing natural preparation loops:

- winter clothing and fuel demand;
- summer shade/water planning;
- mountain expedition windows;
- wet-season shelter and route changes;
- settlement emergency preparation.

## 27.2 Weather

Weather systems own fronts, storms, precipitation, wind and forecasts. 29D uses those outputs.

A weather forecast can therefore warn of thermal risk before the player is exposed, but forecast accuracy belongs to the weather/knowledge owner.

## 27.3 Maritime

26D/26E own marine environment and aquatic-specialist rules. The universal integration is:

- marine system supplies liquid temperature, wind/spray, immersion and exposure;
- 29D updates thermal load/wetness;
- 26E retains breath, pressure, drowning and aquatic interaction;
- Set 30/26E resolution of swimming ownership is deferred to final reconciliation.

Water generally has a higher thermal-transfer multiplier than air, preserving 26E's established design direction.

# 28. Movement, Traversal and Activity Integration

Set 30 owns movement.

29D consumes:

- `CurrentMovementMode()`;
- bounded activity intensity;
- movement contact state;
- whether actor is swimming/wading/riding/inside vehicle as exposed by owner;
- traversal exposure tags such as open-air/covered where available.

29D may publish:

- `ThermalFunctionModifier()`;
- `SleepDeprivationFunctionModifier()`;
- `EnvironmentalStaminaModifier()`.

Set 30 chooses how those modifiers affect movement within its own rules.

29D never sets walk speed directly.

# 29. Difficulty Profiles and Custom World Settings

## 29.1 Peaceful

- temperature system retained for ambience/preparation but direct thermal injury disabled by default;
- load accumulation approximately 0.35x Standard;
- wetness thermal amplification reduced;
- sleep pressure optional/very soft;
- poor sleep does not create severe impairment;
- strong warnings remain available.

## 29.2 Relaxed

- load accumulation approximately 0.60x Standard;
- generous safe envelopes and recovery;
- sleep pressure approximately 0.65x Standard;
- direct thermal injury heavily delayed;
- wetness dries faster.

## 29.3 Standard

- rates in this document are baseline;
- ordinary clothing/shelter handles ordinary temperate conditions;
- extreme climates require preparation;
- sleep is soft but meaningful;
- critical exposure can create injury after warnings.

## 29.4 Harsh

- load accumulation approximately 1.35x Standard;
- narrower comfort margin;
- wetness amplification stronger;
- sleep pressure approximately 1.25x;
- poor sleep and severe exposure have stronger recovery/Stamina effects;
- thermal injury thresholds activate sooner;
- hydration may also be enabled through 29C Harsh profile.

## 29.5 Custom

Expose independent settings for:

- temperature enabled/severity;
- thermal injury enabled;
- cold/heat accumulation rate;
- wetness impact;
- drying speed;
- shelter protection strength;
- sleep pressure enabled/severity;
- sleep restoration speed;
- sleep interruption strictness;
- exact-number UI visibility;
- accessibility warning intensity.

Changing these settings does not transfer ownership or modify content definitions.

# 30. Simulation LOD, Persistence and Offline Rules

## 30.1 Active Actors

Detailed updates may run on a scheduled cadence such as 1-5 simulation seconds rather than every render frame.

Thermal and wetness changes should integrate elapsed time deterministically so frame rate cannot change survival outcomes.

## 30.2 Medium-Distance Actors

Use coarser updates based on environment region, shelter and schedule state.

## 30.3 Distant Populations

Use cohort summaries as described in Section 26.

## 30.4 Persistence

Persist only what has meaningful future consequence:

- thermal load if outside neutral band;
- wetness if meaningful;
- sleep pressure;
- current sleep session if save system permits saving during sleep;
- last biological update world time;
- active exposure source/context IDs needed for reconciliation;
- migration version.

## 30.5 Offline Player

Default offline wall-clock time does not accumulate dangerous temperature, wetness or sleep deprivation. Reopening a save should not kill a player because the computer was off overnight.

If a future server continues simulating while the player is absent, server-owned offline-player policy must explicitly determine whether the actor remains in world and exposed.

# 31. Multiplayer Authority and Prediction

The authoritative host/server owns consequential exposure state.

Clients may predict:

- temperature trend;
- wetness visual state;
- sleep UI progress;
- immediate comfort feedback.

The server validates:

- environment snapshot;
- shelter/equipment effects;
- thermal/wetness state;
- sleep start/end;
- elapsed restorative time;
- injury exposure events;
- persistence.

## 31.1 Sleep in Multiplayer

29D does not decide whether one player can skip time for everyone. Multiplayer/world-time owner defines:

- unanimous sleep;
- majority sleep;
- per-player rest without time skip;
- server accelerated night;
- no skip.

29D works with all modes by applying biological sleep based on actual authoritative elapsed sleep time.

## 31.2 Anti-Cheat

Reject:

- client-forced thermal reset;
- client claiming shelter not validated by world state;
- repeated sleep completion without elapsed time;
- impossible instant drying unless a valid effect exists;
- spoofed equipment thermal values;
- duplicated sleep/rest transactions.

# 32. UI, Feedback and Accessibility

Document 17 owns presentation. 29D requires the following information contract.

## 32.1 Normal Play

Do not show permanent temperature, wetness and sleep bars by default.

Contextual states:

- `Cooling` / `Warming`;
- `Cold` / `Hot`;
- `Wet` / `Soaked`;
- `Drowsy` / `Tired`;
- shelter/heat/drying improvement cues.

## 32.2 Explainability

Expanded inspection can show:

- current band;
- trend;
- strongest causes;
- strongest protection sources;
- estimated direction (improving/worsening);
- suggested safe actions based on known mechanics;
- sleep site quality and blockers.

## 32.3 Critical Warnings

Dangerous exposure must not rely on colour alone. Use a combination of:

- icon shape;
- text;
- optional sound/caption;
- controller feedback where appropriate;
- screen effects with reduced-motion/flash alternatives.

## 32.4 Accessibility

Support:

- reduced/disabled temperature consequences;
- reduced wetness effects;
- optional sleep pressure;
- longer warning windows;
- simplified environment feedback;
- reduced camera/audio discomfort from shivering, heat haze, panting or storm effects;
- text labels for all sensory-only cues;
- no requirement to distinguish red/blue temperature colours.

# 33. Registry Definitions and Runtime Records

Final canonical schemas belong to 29J/Set 25, but 29D requires these families.

## 33.1 `BiologicalThermalProfile`

Suggested fields:

- qualified ID;
- revision;
- comfort range/band mapping;
- cold/heat accumulation multipliers;
- neutral recovery rate;
- immersion transfer multiplier;
- wetness amplification profile;
- drying modifier;
- injury exposure thresholds;
- sleep-pressure modifier;
- sleep-restoration modifier;
- compatibility/adaptation tags;
- difficulty overrides;
- validation status.

## 33.2 `EnvironmentExposureSnapshot`

Fields from Section 4 plus source IDs and authority timestamp.

## 33.3 `ShelterExposureContext`

Fields from Section 14 plus source structure/zone IDs.

## 33.4 `ThermalEquipmentTraits`

- source item definition ID;
- cold/heat protection;
- waterproofing;
- wind resistance;
- moisture retention;
- drying modifier;
- coverage tags;
- active-effect reference;
- condition effectiveness supplied externally.

## 33.5 `RestSiteProfile`

Fields from Section 20.

## 33.6 `EnvironmentalBiologyState`

Suggested runtime fields:

- actor ID;
- thermal load;
- thermal band/trend;
- wetness;
- sleep pressure;
- active sleep session ID if any;
- last sleep end time;
- current environment/shelter snapshot refs;
- current protection summary;
- last thermal injury exposure timestamp;
- last update world time;
- migration version.

# 34. Balance, Anti-Grind and Anti-Exploit Rules

## 34.1 No Temperate Chore Loop

A properly equipped player in ordinary safe weather should remain thermally stable without repeatedly changing clothes, drinking potions or standing beside fires.

## 34.2 No Instant Extreme Death

Ordinary environmental exposure must provide readable escalation. Instant or near-instant lethal temperature is reserved for explicit hazards such as lava, supernatural zones or scripted extreme effects owned by their source systems.

## 34.3 No Campfire Pyramid Exploit

Thermal source stacking is bounded and diminishing. Many small fires cannot multiply linearly into an instant full reset.

## 34.4 No Wetness Disease Myth

Wetness alone never rolls generic infection. Disease requires a valid disease/pathogen exposure interface.

## 34.5 No Sleep-Spam Reset

Very short sleep intervals provide limited restoration. Repeated 5-minute naps cannot clear maximum sleep pressure/Fatigue faster than normal good sleep.

## 34.6 No Bed Quality Power Creep

Luxury beds may improve sleep quality modestly but cannot become mandatory stat equipment or multiply recovery without bound.

## 34.7 No Shelter by Visual Guess

Biological protection comes from validated shelter traits, not mesh appearance or UI labels.

## 34.8 No Movement Ownership Leakage

Temperature can expose a movement-function modifier; only Set 30 decides actual locomotion behaviour.

## 34.9 No Thirst Backdoor

Heat may request higher hydration demand only if 29C Thirst is enabled. Standard Thirst-off remains genuinely off.

## 34.10 No Offline Punishment

Default offline wall-clock time cannot accumulate dangerous exposure or sleep deprivation.

# 35. Validation, Test Cases and Acceptance Criteria

## 35.1 Data Validation

Reject or warn on:

- thermal bands with gaps/overlap;
- comfort profile with invalid min/max order;
- negative exposure rates without explicit recovery semantics;
- shelter values outside allowed range;
- item thermal traits with unknown coverage tags;
- waterproofing above cap without sealed-equipment classification;
- active heater/cooler with no source authority state;
- rest site quality below zero or above configured specialist cap;
- sleep restoration rate <= 0 for normal profiles;
- duplicate sleep session IDs;
- environment snapshot missing timestamp/source revision;
- direct disease trigger from wetness without pathogen exposure;
- direct movement-speed field authored inside Set 29;
- thermal injury that bypasses 29E injury interface without explicit external hazard owner.

## 35.2 Required Gameplay Tests

1. Standard actor in neutral protected conditions trends thermal load toward 0.
2. Mild ordinary rain makes the actor damp slowly rather than instantly soaked.
3. Roof protection blocks precipitation wetness while exposed wind may remain.
4. Heavy rain without cover meaningfully increases wetness over time.
5. Full immersion saturates the actor much faster than rainfall.
6. Wetness amplifies cold pressure but does not automatically create disease.
7. Warm dry shelter reduces cold load and wetness over time.
8. Moving from extreme cold to neutral shelter does not instantly reset thermal load.
9. Strong valid heat source accelerates cold recovery but respects cap.
10. Visual-only fire with no thermal effect does not warm the actor.
11. Severe heat increases thermal load and 29C hydration demand only when thirst is enabled.
12. Standard Thirst-off player receives no hidden hydration depletion from heat.
13. Cold exposure modestly increases metabolic demand without causing meal spam.
14. Dangerous cold emits a thermal-injury exposure through 29E rather than creating a duplicate injury system.
15. Standard sleep pressure reaches Drowsy after approximately 16 hours awake from fully rested.
16. Seven to nine hours of good-quality sleep restores a normal day's sleep pressure.
17. Poor exposed ground sleep restores less than a protected household bed.
18. Very short nap does not outperform full sleep through repeated interaction spam.
19. Interrupted sleep applies only actual elapsed restorative time.
20. Multiplayer client cannot claim sleep completion or shelter protection without server validation.
21. Distant settlement with enough climate-protected beds avoids population sleep/exposure shortage.
22. Distant settlement with storm displacement produces cohort exposure pressure without per-NPC rain simulation.
23. Closing and reopening a single-player save does not add offline temperature/sleep penalties.
24. UI can explain hot/cold/wet/tired state using text and non-colour cues.
25. Set 30 can consume environmental functional modifiers without Set 29 defining movement speed.
26. Set 26 marine snapshot changes thermal/wetness state while breath/pressure remain Set 26-owned.

## 35.3 29D Acceptance Criteria

29D is accepted when:

- Temperature has one universal biological representation.
- External weather/worldgen remains authoritative for environment conditions.
- Wetness is persistent, useful and not a duplicate disease system.
- Shelter, clothing and heat/cooling sources integrate through explicit traits.
- Sleep is meaningful in Standard without forcing daily micromanagement.
- 29B remains owner of Health/Stamina/Fatigue and receives clear environmental/sleep modifiers.
- 29C receives bounded metabolic/hydration demand modifiers.
- 29E receives thermal injury exposure without duplicated injuries.
- Set 30 remains sole owner of locomotion mechanics.
- Set 26 remains owner of breath/pressure/maritime specialist behaviour.
- nearby and distant actors use compatible but bounded simulation.
- multiplayer and offline rules cannot create hidden survival punishment.
- all new interfaces are recorded for final reconciliation.

# 36. Cross-Set Interface Amendments

These amendments add required interfaces only. They do not transfer ownership.

## AM-29-016 Refinement - Environmental Hydration and Metabolic Demand

**29D -> 29C**

Provide:

- `metabolic_demand_mult`;
- `hydration_demand_mult`;
- `thermal_demand_reason_tags`;
- `effective_duration`;
- `source_snapshot_id`.

29C owns final Hunger/Hydration depletion and combined-demand caps.

## AM-29-019 - Environment Exposure Snapshot

**Worldgen / Weather / Dimension / Set 26 -> 29D**

Provide one authoritative `EnvironmentExposureSnapshot` with thermal, wind, precipitation, humidity, solar/radiant, liquid contact/temperature, magical thermal and hazard context.

Environment owners keep climate/weather ownership. 29D owns actor biological response.

## AM-29-020 - Shelter Exposure Context

**Structures / Document 19-20 / Vehicles / Vessels -> 29D**

Provide validated:

- precipitation protection;
- wind protection;
- shade;
- insulation;
- enclosure;
- heating/cooling support;
- drying support;
- sleep suitability;
- source zone/structure ID.

29D does not determine building validity or ownership.

## AM-29-021 - Thermal Equipment Trait Interface

**Items / Combat Gear / Set 25 schemas -> 29D**

Equipment requires stable biological traits for cold protection, heat protection, waterproofing, wind protection, moisture retention, drying and coverage.

29D consumes these traits without owning item durability, armour defence or equipment progression.

## AM-29-022 - Thermal Mitigation Effect Interface

**Blocks / Machines / Magic / Items -> 29D**

Any source intended to warm, cool or dry an actor provides a validated effect definition with source state, strength, range/zone, duration and stacking group.

Visual presentation alone cannot create biological effect.

## AM-29-023 - Rest Site and Sleep Transaction Interface

**Items / Structures / World-Time owner <-> 29D**

Required rest-site fields:

- base sleep quality;
- capacity/reservation;
- shelter linkage;
- permission result;
- condition context;
- source ID.

Required sleep transaction fields:

- sleep session ID;
- actor ID;
- requested duration;
- actual elapsed duration;
- interruption reason;
- authoritative start/end timestamps.

World-time owner remains responsible for time advancement.

## AM-29-024 - Environmental Activity Interface Refinement

**Set 30 / 29B -> 29D**

Provide bounded activity intensity, movement/contact mode and relevant exposure context. 29D uses these to calculate metabolic heat and wetness interaction.

29D may expose `ThermalFunctionModifier()` and `SleepDeprivationFunctionModifier()`; Set 30 decides actual locomotion effects.

## AM-29-025 - Thermal Injury Exposure Handoff

**29D -> 29E**

Provide `ThermalInjuryExposure` with cold/heat type, severity, duration, protection context, body-region weighting where available and source IDs.

29E remains sole owner of persistent injury creation/progression.

## AM-29-026 - Population Climate and Sleep Service Interface

**Document 20 / Settlement systems <-> 29D**

Settlement systems expose protected-bed capacity, climate-protected capacity, heating/cooling service, emergency shelter and displacement state.

29D returns:

- `PopulationExposureSatisfaction()`;
- `PopulationSleepSatisfaction()`;
- `ClimateCareDemand()`;
- `ExposureWorkforceModifier()`.

Settlement systems decide facility operation and construction; Set 27 may consume resulting resource/economic demand.

## AM-29-027 - Social Exposure and Rest Need Interface

**29D -> Set 28**

Expose:

- `ThermalRisk()`;
- `ExposureNeed()`;
- `DryingNeed()`;
- `SleepNeed()`;
- `RestSiteSuitabilitySummary()`.

Set 28 owns companion care decisions, dialogue, hospitality, social reactions and assistance.

## AM-29-028 - Maritime Thermal/Wetness Reconciliation Interface

**Set 26 -> 29D**

Set 26 supplies immersion fraction, liquid thermal state, spray/wind/ice and aquatic exposure context. 29D owns universal actor thermal load and wetness.

Breath, drowning, pressure and maritime movement remain Set 26/Set 30 responsibilities pending final ownership reconciliation.

## Amendment Status Table

| Amendment | Status | Ownership Transfer? | Final Review |
| --- | --- | --- | --- |
| AM-29-016 Refinement | Required | No | 29C/29D/29J |
| AM-29-019 | Proposed/required | No | Environment owners + 29J |
| AM-29-020 | Proposed/required | No | Documents 19-20/Set 26/30 integration |
| AM-29-021 | Proposed/required | No | Items/Combat/Set 25 schema pass |
| AM-29-022 | Proposed/required | No | Blocks/Magic/Automation integration |
| AM-29-023 | Proposed/required | No | World-time/structures/29J |
| AM-29-024 | Proposed/required | No | Set 30/29B reconciliation |
| AM-29-025 | Internal Set 29 required | No | 29E/29J |
| AM-29-026 | Proposed/required | No | Set 20/27/29J |
| AM-29-027 | Proposed/required | No | Set 28 integration |
| AM-29-028 | Proposed/required | No | Set 26/30 final integration |

# Appendix A. Reference Balance Tables

## A.1 Thermal Load Reference

| Metric | Standard Reference |
| --- | ---: |
| Thermal-load range | -100 to +100 |
| Comfortable band | absolute load 0-20 |
| Cold/Hot begins | absolute load 41 |
| Severe begins | 61 |
| Dangerous begins | 81 |
| Mild pressure gain | 0.15 load/min |
| Moderate pressure gain | 0.50 load/min |
| Severe pressure gain | 1.50 load/min |
| Extreme pressure gain | 4.00 load/min |
| Neutral dry recovery | 0.75 load/min |
| Warm/cool safe shelter recovery | 1.50 load/min |
| Strong specialist recovery cap | 3.00 load/min typical |

## A.2 Wetness Reference

| Metric | Standard Reference |
| --- | ---: |
| Wetness range | 0-100 |
| Damp | 11-30 |
| Wet | 31-60 |
| Soaked | 61-85 |
| Saturated | 86-100 |
| Light rain | +0.4/min before protection |
| Heavy rain | +1.5/min before protection |
| Spray/wading | +2.0/min reference |
| Sheltered drying | -0.75/min |
| Warm drying | -1.50/min |
| Saturated cold amplification cap | ~1.50x ordinary cold pressure |

## A.3 Sleep Reference

| Metric | Standard Reference |
| --- | ---: |
| Sleep pressure range | 0-100 |
| Baseline awake gain | +3.2/hour |
| Drowsy | 51-65 |
| Tired | 66-80 |
| Very Tired | 81-95 |
| Sleep Deprived | 96-100 |
| Good sleep restoration | -12/hour at quality 1.0 |
| Typical good sleep | 7-9 simulation hours |
| Ground base quality | 0.45 |
| Bedroll | 0.65 |
| Normal bed | 0.90 |
| Quality bed | 1.00 |
| Specialist recovery bed | 1.10 before other modifiers |

# Appendix B. Provisional 29D API Contract

## B.1 Core Queries

`BodyTemperature(actor_id)` returns:

- signed thermal load;
- semantic band;
- cold/heat direction;
- trend;
- effective pressure class;
- top cause tags;
- top mitigation tags;
- critical-risk flag.

`Wetness(actor_id)` returns:

- saturation 0..100;
- semantic band;
- trend;
- primary source tags;
- drying-state summary.

`SleepPressure(actor_id)` returns:

- pressure 0..100;
- semantic band;
- trend;
- recommended-rest context where known.

`SleepQuality(actor_id, rest_site_id)` returns:

- predicted quality;
- blockers;
- dominant penalties;
- dominant bonuses;
- suitability result.

## B.2 Published Modifier Bundle

`EnvironmentalBiologyModifiers()` may contain:

- stamina regeneration multiplier for 29B;
- Fatigue gain/resistance multiplier for 29B;
- natural Health recovery multiplier for 29B;
- metabolic demand multiplier for 29C;
- hydration demand multiplier for 29C;
- thermal injury exposure status for 29E;
- sleep/rest result for 29B;
- bounded functional impairment values for owning action systems;
- reason tags and revision.

## B.3 Population Queries

- `PopulationExposureSatisfaction(settlement_id)`;
- `PopulationSleepSatisfaction(settlement_id)`;
- `ClimateCareDemand(settlement_id)`;
- `ExposureWorkforceModifier(settlement_id)`.

# Appendix C. Runtime Record Templates

## C.1 Environmental Biology State

```text
EnvironmentalBiologyState
  actor_id
  thermal_load
  thermal_band
  thermal_trend
  wetness
  wetness_band
  sleep_pressure
  sleep_band
  last_sleep_end_world_time
  active_sleep_session_id?
  environment_snapshot_ref
  shelter_context_ref?
  equipment_profile_hash
  last_thermal_injury_exposure_time?
  last_update_world_time
  schema_revision
```

## C.2 Sleep Session

```text
SleepSession
  session_id
  actor_id
  rest_site_id?
  requested_duration
  start_world_time
  end_world_time?
  actual_sleep_duration
  mean_sleep_quality
  interruption_reason?
  authoritative_result
  transaction_revision
```

## C.3 Population Exposure Summary

```text
PopulationExposureSummary
  settlement_id
  cohort_id
  population_count
  climate_pressure_band
  protected_capacity_ratio
  heating_cooling_service_ratio
  sleep_capacity_ratio
  exposure_satisfaction
  sleep_satisfaction
  vulnerable_population_factor
  workforce_modifier
  medical_demand_modifier
  last_update_world_time
```

# Appendix D. Worked Gameplay Examples

## D.1 Cold Rain Expedition

A player leaves a town in cool rain wearing ordinary clothes. The weather owner reports cool ambient temperature, moderate wind and rain. The equipment owner reports weak water resistance. Thermal load initially remains near neutral, but Wetness rises. As Wetness reaches the Wet band, cold pressure increases and the player begins Cooling. The HUD shows `Wet - Cooling` and identifies rain/wind as causes.

The player enters a cave. Rain input stops and wind protection improves, but the cave is still cold and damp. Wetness begins drying slowly. The player places a valid campfire. The fire definition exposes heat and drying support, so thermal load trends back toward neutral and Wetness falls faster. No weather or movement rule was redefined by Set 29.

## D.2 Desert Crossing

A player crosses a hot dry region at midday. Shade is low and activity is high. Thermal load rises positive. Set 29 publishes increased hydration demand, but in Standard Thirst is disabled, so no hidden hydration meter appears. Stamina recovery becomes mildly reduced as heat reaches the Hot band.

The player rests under a validated shade structure and removes an insulating outer garment. Heat pressure falls and thermal load trends toward neutral. In Harsh mode, where Thirst is enabled, 29C also increases Hydration depletion.

## D.3 Soaked After River Crossing

The movement/aquatic owner reports immersion. Wetness rapidly approaches Saturated and water temperature creates strong cold transfer. After exiting, Set 26 stops immersion but Wetness persists. The player is still cooling quickly until they reach shelter and dry. Breath and drowning never enter 29D.

## D.4 Poor Camp Sleep

The player tries to sleep on bare ground under a tree. The rest site has low base quality; shelter blocks some rain but not wind. The player is Damp and Chilled. Sleep is allowed, but predicted quality is 0.42. A three-hour nap lowers SleepPressure somewhat but does not fully restore the player or erase 29B Fatigue.

The next night the player sleeps in a dry cottage bed near a hearth. Sleep quality is close to 1.0 and a full sleep clears the normal day's pressure while supporting recovery.

## D.5 Settlement Blizzard

A distant settlement encounters a severe cold event. Set 20 reports 120 residents but only 95 climate-protected beds because several houses were damaged. Heating fuel service is also constrained. 29D does not simulate 120 individual shivering actors. It calculates cohort exposure and sleep satisfaction, producing increased Health/workforce risk for the unprotected group. Set 27 can consume higher fuel/medicine demand; Set 28 can consume social-care context; the settlement planner may respond through its own rules.

# Appendix E. Migration and Supersession Notes

1. Earlier references treating temperature as a single simple meter are superseded by the signed thermal-load model while preserving contextual UI.
2. Earlier Set 26 aquatic temperature/wetness behaviour becomes an input/source integration to universal Set 29 thermal/wetness state. Breath, drowning and pressure remain Set 26-owned.
3. Existing clothing and armour entries do not need replacement IDs solely because thermal fields are added; Set 25 schema migration should add optional trait payloads with defaults.
4. Existing beds/rest sites can receive default `RestSiteProfile` values during migration.
5. Existing POC worlds should migrate players to neutral thermal load, Dry unless the save already has meaningful aquatic exposure, and a neutral/rested sleep-pressure grace state to avoid punitive migration.
6. No explored world terrain is rewritten by this biological-system migration.

# Appendix F. Terminology Register

| Term | Definition |
| --- | --- |
| Ambient Thermal Condition | External environment temperature/thermal context supplied to 29D. |
| Thermal Load | Signed biological temperature pressure from -100 cold to +100 heat. |
| Effective Thermal Pressure | Post-protection environmental force causing thermal load to change. |
| Comfort Envelope | Actor-specific environment range in which thermal load tends toward neutral. |
| Wetness | Actor/clothing-level water saturation relevant to biology, 0..100. |
| Shelter Context | Validated environmental protection supplied by structure/vehicle/vessel owners. |
| Thermal Mitigation Effect | Explicit gameplay effect that warms, cools or dries an actor. |
| Sleep Pressure | Biological need for restorative sleep, 0..100. |
| Sleep Quality | Multiplier describing how restorative a valid sleep interval is. |
| Rest Site | External bed, bedroll, ground, cabin or facility providing a sleep profile. |
| Thermal Injury Exposure | 29D handoff requesting 29E to evaluate persistent cold/heat injury. |
| Exposure Satisfaction | Population-level summary of how well shelter/climate services protect a cohort. |

---

> **29D Completion Statement**
>
> Document 29D establishes Leyforge's universal biological environmental-survival model. Climate, weather, water, structures, clothing, movement and magic remain owned by their existing systems; Set 29 now has one authoritative way to convert those inputs into temperature, wetness, sleep pressure and recovery consequences. Standard play remains forgiving in ordinary conditions while extreme travel, storms, immersion, poor shelter and prolonged wakefulness create readable preparation challenges. The document is ready to hand injury-specific thermal consequences to 29E and disease/poison-specific environmental exposure to 29F without redefining their ownership.
