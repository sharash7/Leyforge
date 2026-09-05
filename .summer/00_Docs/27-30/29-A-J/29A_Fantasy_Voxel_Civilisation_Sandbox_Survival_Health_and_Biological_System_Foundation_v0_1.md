# FANTASY VOXEL CIVILISATION SANDBOX

## DOCUMENT SET 29

# 29A - Survival, Health and Biological System Foundation

*Version 0.1 - Governing Vision, Ownership and Integration Foundation Draft*

A governing foundation for Leyforge's survival, health and biological simulation: hunger, thirst, temperature, wetness, disease, poison, injuries, fatigue, sleep, healing, medicine, stamina-regeneration rules, nutrition and physiological encumbrance - designed to make preparation and civilisation matter without turning ordinary play into constant meter maintenance.

**Project Lead and Final Authority: Ash**

Architecture, systems planning, documentation and production support: GPT-5.6 Sol

---

> **Survival, Health and Biological Systems Statement**
>
> Leyforge survival must make bodies, food, shelter, medicine, climate, rest and care meaningful without demanding that the player constantly service a dashboard of needs. The biological system owns what happens to a living actor when they become hungry, dehydrated, cold, wet, exhausted, injured, poisoned, diseased or treated. Other systems may cause, prevent, price, present or react to those states, but they must consume Set 29's interfaces rather than create competing biological truth. Standard play is forgiving and readable; harsh survival may add deeper pressure; relaxed and peaceful play retain useful food, shelter, medicine and recovery loops without punitive maintenance.

| Field | Locked Direction |
| --- | --- |
| Document Set | This is Document 29A in Document Set 29: Survival, Health & Biological Systems. |
| Governing Contract | The **Leyforge Document Sets 27-30 Cross-Set Interface Register v1.0** is mandatory. Set 29 owns only the biological systems assigned to it and consumes interfaces from Sets 27, 28 and 30. |
| Set 29 Ownership | Hunger, thirst, temperature, wetness, disease, poison, radiation if ever admitted, injuries, fatigue, sleep, healing, medicine, stamina-regeneration rules, nutrition and physiological encumbrance penalties. |
| Health Clarification | Approved: Set 29 owns universal biological Health state and natural biological recovery. Document 16 retains combat-action, damage-packet, armour, defence and death/downing resolution ownership. |
| Core Philosophy | Reward preparation and make the world physically meaningful without turning Leyforge into a maintenance-bar simulator. |
| Standard Survival | Hunger on; thirst off by default; temperature meaningful mainly in relevant environments; wetness contextual; fatigue forgiving; disease uncommon; injuries moderate; poison meaningful; recovery supported by food, rest, medicine, magic and care. |
| Difficulty Direction | Peaceful, Relaxed, Standard, Harsh and Custom profiles alter severity, rates and consequences without changing system ownership or invalidating content. |
| Stamina Direction | Set 29 owns stamina regeneration, exertion response and physiological modifiers. Set 30 owns locomotion, movement modes and traversal mechanics. |
| Inventory Direction | Retain slot-based inventory. Set 29 does not introduce a universal kilogram-weight system; physiological encumbrance consumes equipment-load and tagged-heavy-object states from owning systems. |
| Food Direction | Item and Recipe systems own food definitions, spoilage state, cooking and preservation. Set 29 owns biological consumption, hunger relief, nutrition, hydration and food-safety consequences. |
| Medicine Direction | Item/Recipe systems own medicine objects and transformations; Set 20 owns healthcare buildings; Set 28 owns doctor/companion social interactions; Set 27 owns prices and costs. Set 29 owns biological treatment effects and recovery. |
| Environmental Direction | Worldgen, weather, biome, dimension and maritime systems provide external environment snapshots. Set 29 converts those conditions into body temperature, wetness, fatigue, disease/poison exposure and biological consequences. |
| Maritime Direction | Set 26 remains authority for breath, drowning, aquatic pressure and existing maritime-specific survival contracts unless explicitly reconciled later. Set 29 consumes water/marine environment inputs rather than redefining them. |
| Simulation Direction | Detailed near active actors; scheduled or cohort-level summaries at distance. No per-frame hunger/disease simulation for every unloaded NPC. |
| Engine Direction | Godot with Summer Engine remains the implementation direction. Definitions remain registry-driven, authority-controlled, save-safe and compatible with Set 25's qualified-ID and schema rules. |
| Final Authority | Ash retains final authority over survival severity, default world settings, realism depth, system ownership changes, production scope and final acceptance. |
| Next Deliverable | 29B - Health, Stamina, Exertion, Fatigue and Biological Recovery. |

# Document Purpose

Document 29A establishes the governing architecture for the complete Survival, Health & Biological Systems set. Earlier Leyforge documents already reference health, stamina, hunger, temperature, food, injuries, medicine, poison, disease, fatigue, beds, healers and environmental danger, but those rules are distributed across Player Progression, Items, Recipes, Combat, Biomes, Settlements, UI, technical architecture and the maritime expansion. Set 29 converts that distributed intent into one biological source of truth without taking ownership away from the systems that cause or respond to biological state.

This document does not attempt to finalise every numeric hunger rate, disease incubation time, fracture duration, medicine dose or temperature curve. It locks the design philosophy, ownership model, data flow, biological state architecture, difficulty framework, simulation-level rules, external interfaces and the map for Documents 29B-29J. Detailed mechanics and balancing belong to those specialist documents.

The proof of concept is not the governing production target. Existing POC health, stamina, hunger and injury behaviour remains useful implementation evidence, but production survival must work in fully seed-generated worlds, multiple cultures and settlements, many biomes and dimensions, multiplayer, distant simulation, the Atlas content model and the later economy/social/movement systems.

# Design Sources, Authority and Treatment

| Source | Relevant Direction | Treatment in 29A |
| --- | --- | --- |
| Ash - approved Set 29 scope and Cross-Set Interface Register v1.0 | One owner per gameplay system; Set 29 owns biological survival; other sets consume interfaces. | Primary governing ownership contract. No ownership transfer is made without explicit approval. |
| 00 - Master Game Design Bible | Survival is one of four connected pillars; the game supports cosy through harsh play; food, shelter, civilisation and preparation matter. | Establishes the survival fantasy and configurable-severity requirement. |
| 01 - Core Gameplay Loop | Explore -> gather -> craft -> build -> interact -> automate -> defend -> upgrade -> expand; survival is part of the wider loop, not its sole purpose. | Survival must create goals and preparation choices without dominating the sandbox. |
| 02 - Player Progression | Core resources include health, stamina, mana, hunger/food and temperature; no thirst by default; sleep/fatigue and illness were optional/rare in the early draft. | Retained as the default-facing baseline, then expanded into configurable full systems by Set 29. |
| 04 - Items Registry | Food, medicine, armour, clothing, consumables, spoilage and equipment are item-owned definitions; inventory is slot based. | Set 29 consumes item properties and applies biological effects; it does not duplicate item truth. |
| 05 - Crafting and Recipe Registry | Cooking, preservation, medicine/alchemy and risky transformations are recipe-owned; spoilage can be difficulty-sensitive. | Set 29 consumes food/medicine outputs and owns their effects on actors. |
| 06 - Resource Progression | Food, water, medicines, organics and strategic supplies connect survival to settlements, trade and automation. | Biological demand becomes an input to later economy and settlement simulation. |
| 07 - NPC Village System and Document 20 | NPCs have needs, injuries and health; settlements provide food, water, medicine, healers, clinics, sanitation and recovery infrastructure. | Set 29 owns the actor state those facilities satisfy; settlement systems retain facility and service ownership. |
| 09 - Magic System | Healing, cleansing, wards, corruption and magical conditions can affect biological state. | Magic supplies effects/capabilities; Set 29 applies approved biological outcomes without owning magic schools or corruption truth. |
| 10 - Creatures and Monsters | Venom, disease, attacks, creature ecology and anatomy can cause biological consequences. | Creature systems supply sources and traits; Set 29 owns resulting poison/disease/injury state. |
| 11 - Biomes and World Generation | Climate, weather, temperature, seasons, hazards and magical weather are meaningful but configurable. | Supplies environmental conditions; Set 29 owns actor exposure response. |
| 13-15 - Cultures, Dimensions, Quests and Events | Cultures, realms and events may change available care, hazards, diseases, resources and consequences. | Set 29 consumes those contexts and exposes state; it does not own story or culture. |
| 16 - Combat, Gear and Defence | Health, stamina, equipment load, injuries, poison, bleeding, healing and death are already referenced; damage packets are authoritative combat outputs. | Revised boundary: Combat owns attack/damage/death mechanics; Set 29 owns universal biological health, injury, poison and recovery state. Existing combat registry entries become migration inputs. |
| 17 - UI/UX System | HUD is world-first and contextual; health is immediate, stamina/hunger/temperature are contextual; accessibility and non-colour warning are required. | Set 29 specifies the biological information contract; Document 17 remains presentation owner. |
| 18 v0.2 - Godot/Summer Engine Technical Plan | One authoritative world simulation, immutable definitions, stable IDs, event-driven systems, scheduling, simulation LOD, multiplayer validation and save safety. | Technical architecture principles applied; Set 29 does not create a parallel runtime framework. |
| 19-20 - Settlement Growth and Buildings | Camps require shelter, fire, food and safe sleep; advanced settlements provide clean water, sanitation, healers, clinics, hospitals and emergency shelter. | Biological need and recovery demand become real settlement inputs. Buildings remain owned by Set 20. |
| 25A-25L - Post-Atlas Production Governance | POC retirement, one canonical owner, qualified IDs, schemas, capabilities, validation, migration and production admission. Survival defaults were explicitly pending. | Set 29 resolves the survival design while obeying Set 25 registry and validation governance. |
| 26A-26O - Maritime Expansion | Aquatic environment, swimming/diving, breath, pressure, water-specific temperature and rescue already have specialist rules. | Set 29 consumes maritime environment and movement state. Overlap is recorded for final reconciliation rather than silently overwritten. |
| Sets 27, 28 and 30 - Cross-Set Interface Register | Economy, social/companions and movement each own their own gameplay truth and consume/export defined APIs. | Set 29 exposes biological state and consumes prices/social care/movement modes through interfaces only. |

# Static Table of Contents

1. Locked Survival, Health and Biological Identity  
2. Approved Decision Summary  
3. Governing Cross-Set Interface Contract  
4. Document Set 29 Map and Specialist Ownership  
5. Authority Hierarchy and Source-of-Truth Model  
6. Core Survival Philosophy and Player Experience  
7. Biological State Architecture  
8. Universal Biological Health Boundary  
9. Stamina, Exertion and Physiological Modifier Boundary  
10. Hunger, Nutrition and Thirst Boundary  
11. Temperature, Wetness, Shelter, Sleep and Fatigue Boundary  
12. Injury, Disease, Poison and Medicine Boundary  
13. Physiological Encumbrance Boundary  
14. Actor Applicability and Biological Profiles  
15. Environmental Input and Exposure Model  
16. Difficulty and World-Preset Architecture  
17. Time, Scheduling and Simulation LOD  
18. Persistence, Multiplayer and Authority  
19. UI, Feedback and Accessibility Contract  
20. Progression, Skills and Perks Boundary  
21. Settlement, Economy, Social and Movement Integration  
22. Maritime and Dimension Integration Boundary  
23. Registry, ID and Data-Contract Direction  
24. Validation, QA and Explainability  
25. Balance, Anti-Grind and Anti-Exploit Guardrails  
26. Production Scope, Non-Goals and Deferrals  
27. Cross-Set Interface Amendments  
28. Locked Questions for Specialist Documents  
29. Acceptance Criteria for 29A  
Appendix A. Survival API v1.0  
Appendix B. Cross-System Ownership Matrix  
Appendix C. Default Survival Preset Matrix  
Appendix D. Biological State Envelope Template  
Appendix E. Event and Query Contract Library  
Appendix F. Migration Notes from Earlier Documents  
Appendix G. Terminology Register  
Appendix H. Cross-Set Interface Amendments Register

# 1. Locked Survival, Health and Biological Identity

The Survival, Health & Biological Systems set is the authoritative biological layer of Leyforge. It describes the condition of living actors and the biological consequences of what happens to them. It is not the owner of every cause, item, movement action, conversation, building, economy rule or combat calculation that influences that condition.

> **Locked Biological Ownership Rule**
>
> Set 29 owns biological state. External systems provide causes, context, capabilities and consequences through interfaces. Set 29 may calculate biological response, but it may not redefine the external system that supplied the input.

| Identity Layer | Meaning | Player-Facing Result |
| --- | --- | --- |
| Survival Pressure | Hunger, dehydration where enabled, exposure, fatigue and illness make preparation useful. | The player has reasons to cook, shelter, rest, carry medicine and plan difficult journeys. |
| Biological Consequence | Damage, poison, disease, temperature and overexertion can create persistent conditions. | Dangerous actions leave understandable consequences instead of arbitrary hidden penalties. |
| Recovery | Rest, food, treatment, shelter, healers and magic restore capability over time. | Settlements and preparation become valuable without forcing long passive downtime. |
| Civilisation Demand | Populations consume food, medicine and care and lose work capacity when unhealthy. | Farming, medicine, sanitation, hospitals, trade and logistics have living-world purpose. |
| Configurable Severity | World presets change pressure and consequence. | Cosy builders and harsh-survival players use the same world systems at different intensity. |
| Cross-System Readability | Every major modifier has a source and explanation. | The player can understand why stamina is recovering slowly or why an injury is not healing. |
| Bounded Simulation | Detailed biology is reserved for relevant actors; distant populations use summaries. | Large civilisations remain performant while preserving shortages, illness and recovery consequences. |

## 1.1 Survival Is a Supporting Pillar, Not a Chore Engine

Leyforge is not designed around maximising the number of survival meters. Survival succeeds when it changes meaningful decisions: whether to cross a frozen pass, whether to travel injured, whether to carry preserved food or medicine, whether to build a clinic, whether to delay a raid response until guards recover, or whether a settlement can absorb an outbreak.

Routine healthy play should be stable. A well-fed, sheltered and rested character should not require constant attention. Severe penalties should generally result from a readable chain of ignored warnings, extreme environments, dangerous encounters, lack of supplies or deliberate harsh settings.

## 1.2 No Hidden Full-Simulation Requirement

The system does not require detailed organ simulation, calorie chemistry, litre-accurate hydration, microbiology or real-world pharmacokinetics. Those may inspire design but are not the runtime target. Leyforge uses understandable gameplay states, bands, rates, tags and conditions that are deep enough to connect systems while remaining explainable and testable.

# 2. Approved Decision Summary

| Area | Locked Decision |
| --- | --- |
| Ownership | Cross-Set Interface Register v1.0 is governing. Set 29 may not absorb economy, dialogue/social or movement mechanics. |
| Health | Set 29 owns universal biological health state and natural recovery. Combat remains owner of damage packets, mitigation, attack resolution, death/downing and combat actions. |
| Hunger | Enabled in Standard. Designed as a meaningful but forgiving resource. |
| Thirst | Implemented by Set 29 but disabled by default in Standard, preserving Document 02. Harsh/Custom may enable it. |
| Temperature | Environmental challenge, not a constantly punitive meter in temperate safe conditions. |
| Wetness | Contextual biological modifier connecting water/weather to temperature, disease risk, comfort and recovery. |
| Sleep | Exists as a biological recovery system. Standard uses soft pressure; Relaxed/Peaceful may make it largely optional; Harsh increases consequence. |
| Fatigue | Exists separately from momentary stamina. Fatigue reflects longer-term strain and reduces regeneration/capability when severe. |
| Disease | Full system exists; Standard frequency is uncommon and strongly signposted where preventable. |
| Poison | Full system exists for toxins/venoms; exact poison definitions are registry-driven. |
| Injuries | Persistent but abstracted. Body-region and severity tags are preferred over a full limb/organ simulator. |
| Medicine | Biological effects are owned here; items, recipes, price, doctor dialogue and facilities remain external. |
| Natural Recovery | Useful but conditional. Safe shelter, food, warmth, sleep and treatment improve recovery; combat cannot be reset instantly by resting for seconds. |
| Death | Not owned by Set 29. Set 29 exposes critical/stabilised/recovery states to the death/downed owner. |
| Corruption | Not a universal biological meter. Magic/realm systems own corruption; Set 29 may apply declared biological effects. |
| Radiation | Reserved extension category only. No Core radiation system is activated until a world/content owner requires it. |
| Encumbrance | Physiological penalties only; no universal inventory weight model. |
| Difficulty | Peaceful, Relaxed, Standard, Harsh and Custom profiles use the same systems with different severities. |
| Simulation | Detailed near; scheduled/cohort summary far. Wall-clock offline progression may not silently kill or catastrophically injure actors. |
| UI | Contextual and multi-channel; exact numbers optional; critical deterioration must be clear. |

# 3. Governing Cross-Set Interface Contract

The Cross-Set Interface Register v1.0 has higher priority within Sets 27-30 than any convenience gained by duplicating another set's mechanics. Set 29 therefore treats economy, social behaviour and movement as external services.

## 3.1 Set 29 Owns

- Hunger.
- Thirst.
- Temperature response.
- Wetness state and biological effect.
- Disease.
- Poison.
- Radiation only if a later approved source adds it.
- Injuries.
- Fatigue.
- Sleep.
- Healing and biological recovery.
- Medicine effects.
- Stamina regeneration rules.
- Nutrition.
- Physiological encumbrance penalties.
- Universal biological Health state, as explicitly approved for Set 29.

## 3.2 Set 29 Receives from Set 27

- Medical item prices.
- Food economy state.
- Hospital/service costs.
- Resource scarcity.
- Trade shortages.

Set 29 never calculates buy/sell price, wage, tariff, market availability, settlement wealth or merchant stock.

## 3.3 Set 29 Receives from Set 28

- Companion care state.
- Doctor/healer interaction outcomes.
- NPC treatment interaction results.
- Social morale/support bonuses where a social system creates them.

Set 29 never writes dialogue, relationships, affection, trust, companion loyalty or social memory.

## 3.4 Set 29 Receives from Set 30

- Current movement mode.
- Sprinting state.
- Climbing state.
- Swimming state as reconciled with Set 26.
- Riding state.
- Vehicle usage state.
- Activity intensity/traversal context through approved amendments.

Set 29 never determines walk speed, sprint acceleration, jump height, climbing controls, mount handling, vehicle physics or pathfinding.

## 3.5 Set 29 Exposes

The mandatory base Survival API is:

- `HungerLevel()`
- `ThirstLevel()`
- `BodyTemperature()`
- `InjuryState()`
- `DiseaseState()`
- `PoisonLevel()`
- `Fatigue()`
- `StaminaModifier()`
- `CarryPenalty()`

Additional non-ownership-transferring interfaces are proposed in Section 27 and Appendix H.

# 4. Document Set 29 Map and Specialist Ownership

| Document | Title | Owns / Resolves |
| --- | --- | --- |
| 29A | Survival, Health and Biological System Foundation | Governing vision, ownership, state architecture, difficulty, interfaces, LOD, document map and amendments. |
| 29B | Health, Stamina, Exertion, Fatigue and Biological Recovery | Health resource, natural recovery, stamina regeneration, exertion response, long-term fatigue and recovery gating. |
| 29C | Hunger, Thirst, Nutrition and Consumption | Hunger, satiety, hydration when enabled, nutrition profiles, consumption effects and starvation/dehydration severity. |
| 29D | Temperature, Wetness, Shelter, Sleep and Environmental Exposure | Thermal response, wetness, drying, shelter effects, sleep pressure, rest quality and exposure integration. |
| 29E | Injuries, Wounds, Bleeding, Pain and Functional Impairment | Injury taxonomy, severity, body-region tags, bleeding, wounds, burns, frost injury, fractures, stabilisation and impairment. |
| 29F | Disease, Infection, Poison, Toxins and Biological Hazards | Disease lifecycle, contagion, infection, poison/venom, toxins, contamination and reserved biological hazard extensions. |
| 29G | Medicine, First Aid, Healing, Treatment and Rehabilitation | Treatment actions, biological medicine effects, diagnosis inputs, rehabilitation, healing-magic boundaries and recovery plans. |
| 29H | Biological Profiles, Equipment, Magic, Settlement and Environmental Integration | Species/ancestry physiology profiles, equipment/environment modifiers and external capability integration. |
| 29I | Simulation LOD, Multiplayer, Persistence, UI and Accessibility | Scheduling, distant health simulation, replication, saves, world settings, view-model contracts and accessibility requirements. |
| 29J | Biological Registries, APIs, Balance, Validation and Cross-System Integration | Final schemas, qualified IDs, API contracts, validators, balance framework, migration and full Set 29 reconciliation. |

> **Specialist Rule**
>
> 29A establishes boundaries. Later documents may deepen their assigned domains but may not silently redefine another 29 document or any external owner.

# 5. Authority Hierarchy and Source-of-Truth Model

| Priority | Authority | Set 29 Decision Rights |
| --- | --- | --- |
| 1 | Ash - Project Lead and Final Authority | Final ownership changes, survival severity, presets, realism depth, production admission and major mechanics. |
| 2 | Cross-Set Interface Register v1.0 | Ownership boundaries between Sets 27-30. |
| 3 | Set 25 Governance and Registry Kernel | Qualified IDs, namespaces, field ownership, schema admission, migrations, validation and production lifecycle. |
| 4 | Existing active gameplay owners | Combat, Items, Recipes, Magic, Worldgen, Settlements, UI, Quests and other systems retain their non-biological fields. |
| 5 | Set 29 specialist documents | Biological mechanics and executable state within assigned scope. |
| 6 | Runtime biological services and saves | Mutable health/need/condition state, schedules and persistent recovery data. |
| 7 | Presentation and tools | Read biological state and emit player feedback; never become authority. |

## 5.1 Definition, Instance and State Separation

Set 29 follows the Set 25 rule that definitions are immutable authored content while runtime actor state is mutable save-owned data.

Examples:

- A Disease Definition describes incubation, symptom stages, transmission tags and treatment capabilities.
- An actor's Disease Instance records exposure source, current stage, severity, timers and treatment progress.
- A Medicine Definition belongs to the Item Registry and may expose treatment capabilities.
- A treatment action creates a biological treatment result; it does not mutate the medicine definition.
- An Injury Definition describes a wound family; an Injury Instance stores body region, severity, source and recovery progress.

## 5.2 One Field, One Owner

If Set 29 needs a value another system owns, it stores a stable reference or resolved snapshot only when required for persistence/explainability. It does not duplicate the editable source field.

Examples:

- `ambient_temperature` is environmental truth. Set 29 may store the sampled exposure context that caused an injury, but not redefine the biome's climate.
- `food_base_value` belongs to economy/item sources. Set 29 stores nutritional effects, not price.
- `movement_mode` belongs to Set 30. Set 29 may store exertion accumulated while sprinting, not redefine sprinting.

# 6. Core Survival Philosophy and Player Experience

## 6.1 Preparation Over Maintenance

The best survival outcome is usually produced before danger starts: suitable clothing, enough food, a dry shelter, medicine, a rested body, a safe route, a healer, a campfire, a mount, a convoy, a ward or a settlement service. Systems should reward those choices more than rapid meter micromanagement.

## 6.2 Stable Healthy Baseline

A character in ordinary temperate conditions who is fed, sheltered, rested and not injured should remain biologically stable for meaningful play periods. Standard mode should not create a constant sequence of hunger, thirst, sleep and temperature popups.

## 6.3 Escalating Warning

Critical biological states should normally pass through readable bands:

1. Normal / stable.
2. Mild pressure or early warning.
3. Meaningful impairment.
4. Severe danger.
5. Critical biological state.

Systems may skip bands for extraordinary causes such as catastrophic combat injury or scripted magical hazards, but ordinary survival deterioration should be gradual enough to understand and respond.

## 6.4 Multiple Valid Solutions

A biological problem should usually permit more than one systemic response. Cold can be addressed with clothing, fire, shelter, warm food, magic, route choice, weather delay or settlement refuge. Injury can be addressed with first aid, healer care, medicine, magic, rest or specialist treatment. Disease can be managed through prevention, isolation, medicine, sanitation or resilience.

## 6.5 No Survival Tax on Every Playstyle

Builders, traders, mages, explorers, combat players and civilisation managers all interact with survival differently. Difficulty settings must allow food and medicine to retain value even when punitive need pressure is reduced. Relaxed players may gain positive meal/rest benefits rather than severe starvation penalties.

# 7. Biological State Architecture

Set 29 uses a layered biological model rather than one monolithic "survival" number.

## 7.1 Core State Channels

| State Channel | Purpose | Default Visibility |
| --- | --- | --- |
| Biological Health | Overall capacity to remain alive and recover from harm. | Immediate when damaged; minimal when healthy. |
| Stamina Reserve | Short-term physical action resource shared with combat/traversal. | Contextual during use/recovery. |
| Hunger / Satiety | Food need and recent nourishment. | Contextual; warning bands. |
| Hydration | Water need when enabled. | Hidden/off in Standard unless content creates temporary hydration mechanic; active in Harsh/Custom when enabled. |
| Nutrition | Longer-term meal quality and beneficial/deficient profile at chosen abstraction. | Usually summary/buff-level, not a constant bar. |
| Core Temperature State | Biological thermal condition relative to safe band. | Contextual in meaningful exposure. |
| Wetness | Water saturation/exposure affecting heat loss and related risk. | Contextual; icon/band where relevant. |
| Fatigue | Long-term strain and sleep debt separate from momentary stamina. | Contextual; more visible when impaired. |
| Injury Set | Persistent physical injuries and treatment state. | Condition list/body summary when present. |
| Disease Set | Active disease/infection instances. | Known symptoms first; exact disease may require diagnosis/knowledge. |
| Poison/Toxin Load | Active poison or toxin instances/buildup. | Warning/status when exposed or symptomatic. |
| Recovery Status | Whether natural recovery is supported, reduced, blocked or accelerated and why. | Inspectable explanation. |
| Physiological Modifiers | Final modifiers exported to movement, combat, work, social and economy systems. | Usually expressed as consequences, not a raw debug list. |

## 7.2 State Independence

Channels interact but do not collapse into each other. Hunger does not directly become health damage merely because the hunger bar reached a threshold unless 29C defines that consequence. Fatigue is not identical to zero stamina. Wetness is not identical to being cold. Disease is not just a generic debuff timer. This separation makes treatment and explanation possible.

## 7.3 Normalised Values and Semantic Bands

Specialist documents may use normalised internal ranges where useful, but player-facing presentation should prioritise semantic bands. The UI must be able to say "Cold and getting worse because your clothing is soaked" even if the internal model uses several numerical fields.

Suggested common bands are:

- Stable.
- Mild.
- Moderate.
- Severe.
- Critical.

Definitions may add domain-specific stages, such as Incubating or Recovering, where required.

# 8. Universal Biological Health Boundary

The approved ownership split is:

> **Combat determines how an attack resolves. Set 29 determines the body's persistent biological result.**

## 8.1 Combat -> Biology Flow

1. Combat owner resolves hit, defence, armour, resistance and final `DamagePacket`.
2. Damage packet is delivered to the biological health interface.
3. Set 29 applies biological health loss and, when rules qualify, injury/bleeding/poison exposure.
4. Set 29 publishes updated health and condition state.
5. Combat consumes resulting modifiers such as reduced stamina regeneration, impaired limb function or critical condition.
6. Death/downed owner resolves zero-health/downed/death outcomes using Set 29 state plus its own rules.

## 8.2 What Set 29 May Not Do

Set 29 does not decide:

- weapon damage;
- attack timing;
- armour mitigation;
- parry/block/dodge outcomes;
- critical-hit calculations;
- friendly-fire rules;
- downed timers;
- death penalties;
- tombstone rules;
- respawn rules.

## 8.3 Natural Recovery

Set 29 owns the biological conditions that allow or suppress health recovery. Recovery should be strongly affected by safety, rest, nutrition, temperature, active bleeding, untreated injury, disease, poison and treatment. Exact health-recovery rates are reserved for 29B and validation.

# 9. Stamina, Exertion and Physiological Modifier Boundary

Stamina is a shared resource whose biological regeneration and long-term strain are owned by Set 29 while action costs and locomotion mechanics remain external.

## 9.1 Inputs

Set 29 may consume:

- action exertion requests from combat;
- movement mode and activity intensity from Set 30;
- swimming/diving context from the reconciled Set 26/30 interface;
- equipment-load class from gear/items;
- temperature/wetness state from itself based on environmental inputs;
- injury, disease, poison, hunger and fatigue state from itself;
- perks, magic and temporary buffs from their owners.

## 9.2 Outputs

Set 29 exports:

- stamina regeneration multiplier;
- stamina drain multiplier where the consuming system asks for biological cost adjustment;
- exertion limit;
- fatigue accumulation modifier;
- recovery delay modifier;
- physiological carry penalty;
- emergency-capability state where required.

## 9.3 Walking Rule

Existing Leyforge direction is retained: ordinary walking and routine gathering do not drain stamina by default. Stamina is primarily spent by strenuous traversal, sprinting, combat actions and selected abilities. Harsh settings may add modest exertion elsewhere but should not make normal walking irritating.

# 10. Hunger, Nutrition and Thirst Boundary

## 10.1 Hunger

Hunger is enabled by default in Standard because it creates useful links to farming, cooking, storage, trade, settlement needs and preparation. It should progress slowly enough that a player can focus on exploration or construction without constant interruption.

29C will define hunger, satiety, meal effects, starvation stages and nutritional interactions.

## 10.2 Nutrition

Nutrition exists to distinguish a cooked meal from repeatedly consuming the easiest raw food, but it should not become a micronutrient spreadsheet. The preferred direction is a small set of nutrition qualities or meal-balance tags that affect recovery, stamina support, resilience and beneficial buffs over time.

Culture-specific foods, recipes and ingredients remain owned by Items/Recipes/Atlas content. Set 29 interprets their nutritional traits.

## 10.3 Thirst

Thirst is a complete supported system but is **off by default in Standard**. This preserves the existing progression lock while allowing Harsh and Custom worlds to use hydration, dehydration and water-safety mechanics.

When thirst is disabled:

- drink items may still provide buffs, culture, medicine, temperature effects or roleplay value;
- water infrastructure still matters to NPC settlements, farming, industry, hygiene and recipes through their owning systems;
- temporary special hazards may not silently activate the full thirst system unless the world/profile permits it.

# 11. Temperature, Wetness, Shelter, Sleep and Fatigue Boundary

## 11.1 Temperature

Environment owners provide ambient temperature and related fields. Set 29 calculates biological thermal state using environment, wetness, wind exposure, activity, clothing/equipment capability, shelter, fire/heat sources, magic and biological profile.

Ordinary temperate environments should not produce constant thermal micromanagement. Extreme cold, heat, storms, exposed mountains, deserts, magical regions and certain dimensions should create meaningful preparation pressure.

## 11.2 Wetness

Wetness is a biological/exposure state, not a duplicate water simulation. Water and weather systems report contact and precipitation; Set 29 tracks relevant actor wetness and applies consequences such as faster cooling, slower warming, discomfort/recovery effects or disease-risk modifiers where appropriate.

## 11.3 Shelter

Set 29 does not decide whether a building is valid shelter. Structure/building/environment systems expose shelter capability, enclosure, bed quality, heating/cooling and hazard protection. Set 29 consumes those values to determine recovery and exposure reduction.

## 11.4 Sleep and Fatigue

Sleep is a recovery tool and a configurable biological pressure. Fatigue represents accumulated strain and insufficient recovery over longer timescales.

Standard mode should use soft fatigue pressure: reduced recovery or efficiency before severe impairment. Relaxed/Peaceful can minimise mandatory sleep. Harsh may create stronger fatigue accumulation and require safe rest on long expeditions.

# 12. Injury, Disease, Poison and Medicine Boundary

## 12.1 Injury

Set 29 owns persistent biological injuries after a cause is resolved. The recommended abstraction is body-region plus severity and functional tags, not a detailed organ simulator.

Candidate body regions:

- Head.
- Torso.
- Arm / upper limb.
- Leg / lower limb.
- General / systemic.

Candidate injury classes include bruising/strain, deep wound, fracture, burn, frost injury and other content-specific trauma defined later.

## 12.2 Bleeding

Bleeding belongs to the injury/biological domain when it represents ongoing blood loss from a wound. Combat may apply a bleeding source/status through a damage packet; Set 29 owns persistence, severity, stabilisation and recovery of the biological bleed state.

## 12.3 Disease

Disease is a staged biological condition. Sources may include creatures, food safety, contaminated areas, events, environmental exposures or scripted content. Set 29 owns exposure resolution, infection instance, incubation, symptoms, progression, recovery and treatment response.

The Quest/Event system owns outbreak events, objectives and narrative consequences. Settlement systems own quarantine facilities and sanitation services. Set 29 exposes disease burden and transmission-relevant state.

## 12.4 Poison and Toxins

Poison is not one generic damage-over-time icon. Poison definitions may differ in onset, buildup, symptoms, affected systems and treatment. Sources remain with items, creatures, traps, hazards or magic; Set 29 owns poison burden and biological effects after exposure.

## 12.5 Medicine

Set 29 owns what a treatment does biologically, including stabilisation, recovery support, symptom control, antidote effect, infection treatment, pain relief where used and treatment risk. It does not own the item's price, crafting recipe, healer dialogue or hospital construction.

# 13. Physiological Encumbrance Boundary

Leyforge retains slot-based inventory. Set 29 does not introduce hidden total-weight simulation across every stack.

Physiological encumbrance is driven by explicit load states provided by external owners, for example:

- equipment load band;
- heavy armour state;
- bulky pack state;
- carried unconscious actor;
- carried large object;
- special resource burden;
- magical burden or compensation where defined externally.

Set 29 converts those states into biological consequences such as:

- stamina-regeneration penalty;
- fatigue accumulation;
- heat generation/thermal burden;
- recovery penalty;
- carry tolerance modifier.

Set 30 converts the resulting `CarryPenalty()` into actual movement/traversal behaviour.

# 14. Actor Applicability and Biological Profiles

Set 29 must support players, named NPCs, companions and relevant creatures without assuming identical human physiology.

## 14.1 Biological Profile

A Biological Profile is a registry-driven set of physiological traits referenced by an actor/entity definition. It may define:

- baseline health scaling interface;
- hunger applicability and rate class;
- hydration applicability;
- temperature comfort/resistance bands;
- wetness sensitivity;
- sleep pattern;
- disease susceptibility/resistance tags;
- poison resistance/immunity tags;
- injury anatomy/body-region availability;
- recovery traits;
- respiration/aquatic traits where owned externally and referenced;
- special biological tags such as construct, undead, plantlike or elemental if later content requires them.

A biological profile does not define culture, personality, morality, job, faction or dialogue.

## 14.2 Player Fairness

Playable ancestry/species differences should create identity and adaptation rather than a permanent best choice for all content. Strong resistance in one environment should be balanced by opportunity cost, limited scope or alternative counterplay available to others.

## 14.3 NPC Cohorts

Unnamed distant populations may use shared cohort profiles for health demand and disease/recovery simulation. Named NPC identity and important conditions must survive promotion/demotion.

# 15. Environmental Input and Exposure Model

External environments supply snapshots. Set 29 interprets them.

## 15.1 Minimum Environment Snapshot

A general exposure snapshot may contain:

- ambient temperature class/value;
- wind/exposure factor;
- precipitation/contact state;
- shelter/enclosure factor;
- heat/cold source proximity/capability;
- humidity or drying factor where needed;
- toxic/contaminant exposure tags;
- magical hazard tags;
- biome/realm context ID;
- water contact/submersion state;
- time duration and confidence/authority stamp.

Not every field is required for every environment.

## 15.2 No Duplicate Weather

Set 29 never creates a second weather or ocean model. If a storm system says the player is in cold rain with strong wind, Set 29 calculates biological exposure from that snapshot. It does not recalculate whether rain or wind should exist.

## 15.3 Exposure Accumulation

Short exposure may create warning or temporary discomfort; sustained or extreme exposure may create conditions such as chilled, overheated, frost injury, burns, exhaustion or disease-risk changes. Exact curves belong to 29D/29F.

# 16. Difficulty and World-Preset Architecture

All presets use the same data model. Presets modify enablement, rates, thresholds, recovery and consequence rather than substituting entirely different code paths.

## 16.1 Default Presets

| System | Peaceful | Relaxed | Standard | Harsh |
| --- | --- | --- | --- | --- |
| Hunger | Optional/benefit-focused | Very forgiving | On, forgiving | Stronger pressure |
| Thirst | Off | Off | Off | On by default |
| Temperature | Mostly warning/benefit | Mild | Relevant extremes | Broader and stronger |
| Wetness | Mostly informational | Mild | Contextual | Significant |
| Sleep | Optional | Mostly optional | Soft requirement | Important |
| Fatigue | Minimal | Light | On, forgiving | Stronger |
| Disease | Very rare/off option | Reduced | Uncommon | Increased |
| Injury persistence | Light | Light-moderate | Moderate | Strong |
| Poison | Reduced | Reduced | On | Full/strong |
| Food spoilage input | Off/slow option | Slow | Forgiving | Faster, still configurable |
| Natural recovery | Fast | Faster | Moderate | Slower without support |
| Medicine requirement | Optional for most minor states | Helpful | Important for significant states | Strongly important |
| Biological death pressure | Delegated to death owner; low settings may protect | Delegated | Delegated | Delegated; permadeath remains separate world choice |
| Survival micromanagement target | Very low | Very low | Low | Moderate |

## 16.2 Custom World Controls

Custom worlds should be able to change individual dimensions such as hunger rate, thirst enablement, temperature severity, disease frequency, injury persistence, fatigue pressure and recovery speed without invalidating save schemas.

## 16.3 Difficulty Does Not Remove Content

Disabling a punitive need should not delete food, kitchens, healers, hospitals, medicine, beds, warm clothing or water infrastructure. Those systems retain positive buffs, settlement demand, culture, trade, story, crafting and roleplay value.

# 17. Time, Scheduling and Simulation LOD

## 17.1 Time Sources

Set 29 uses authoritative simulation time for persistent needs and recovery. Real frame time is presentation/input time only. Wall-clock/offline progression is optional, bounded and never allowed to create catastrophic surprise loss.

## 17.2 Suggested Biological LOD

| LOD | Representation | Biological Behaviour |
| --- | --- | --- |
| L0 - Active | Player and directly relevant local actors. | Full health/condition state, action-level stamina, exposure and treatment events. |
| L1 - Local Reduced | Nearby but not directly engaged actors. | Reduced update frequency; same authoritative conditions; no presentation-only ticks. |
| L2 - Settlement/Chunk Summary | Unseen local population or active settlement cohorts. | Scheduled needs, injury recovery, disease checks and medicine consumption in batches. |
| L3 - Regional Abstract | Distant settlements, caravans, fleets or populations. | Cohort health burden, food/medical demand, disease pressure and work-capacity summaries. |
| L4 - Dormant | Very distant or inactive records. | Persistent identity/conditions plus scheduled wake events; no continuous ticking. |

## 17.3 Promotion and Demotion

Promotion reconstructs local biological state from persistent summaries without healing or harming actors arbitrarily. Demotion commits current injuries, disease stage, recovery plan, relevant hunger/fatigue state and scheduled events before actor presentation is removed.

## 17.4 Population Aggregation

Distant settlements may aggregate routine hunger and common illness into population/cohort demand, but named NPC injuries, severe diseases, quest-relevant conditions and exceptional treatment must remain individually traceable.

# 18. Persistence, Multiplayer and Authority

## 18.1 Authoritative State

The world host/server owns persistent biological state. Clients may predict stamina presentation or local warning responsiveness where safe, but cannot authoritatively heal, remove poison, consume medicine, cure disease or alter injury state without validated commands/transactions.

## 18.2 Save Requirements

Persistent biological state may include:

- current health;
- relevant hunger/hydration/fatigue state;
- temperature/wetness only when persistence is meaningful;
- injury instances;
- disease/poison instances;
- treatment/recovery progress;
- scheduled progression timestamps;
- source/evidence references needed for quests/history;
- schema version and migration data.

Transient presentation values should not bloat saves.

## 18.3 Reconnect Safety

On reconnect, the client receives authoritative condition snapshots. UI animations may catch up smoothly, but no lost packet may duplicate medicine use, food consumption or healing.

## 18.4 Split-Screen

Each local player has an independent biological state and accessible HUD. Shared settlement care, bed use, inventory consumption and treatment still resolve through the single authoritative world.

# 19. UI, Feedback and Accessibility Contract

Document 17 owns actual UI. Set 29 requires the biological system to expose enough information for a clear world-first presentation.

## 19.1 Contextual HUD

- Health is always available when relevant and immediate during damage.
- Stamina appears during use, depletion or impaired recovery.
- Hunger appears when meaningful rather than occupying permanent space by necessity.
- Temperature appears when outside safe bands or when the player asks for detail.
- Thirst UI is absent when thirst is disabled.
- Wetness, poison, disease, injury and fatigue use contextual condition presentation.

## 19.2 Explainability

The player should be able to inspect a condition and receive a short cause/effect statement, for example:

- "Stamina recovery reduced: exhausted + fractured leg."
- "Cold worsening: soaked clothing + strong wind."
- "Natural healing slowed: hungry + active infection."
- "Poison stabilised: antidote active."

Exact internal formulas may remain hidden unless advanced UI/debug settings enable them.

## 19.3 Accessibility

Biological danger must not depend on colour alone. Use combinations of icon shape, text, audio/captions, controller feedback where appropriate and scalable UI. Options should include reduced screen effects, reduced heartbeat/pulse effects, less intrusive warnings, stronger warning cues, simplified status detail and survival-assist settings.

# 20. Progression, Skills and Perks Boundary

Document 02 owns player progression, skills and perks. Set 29 provides biological capability surfaces that progression can modify.

Examples of valid progression effects:

- slower hunger accumulation;
- improved meal efficiency;
- improved stamina recovery;
- better acclimatisation;
- faster first aid;
- improved disease resistance;
- improved medicine effectiveness;
- reduced fatigue from strenuous activity;
- improved recovery when resting.

Set 29 does not create an independent survival skill tree unless Document 02 explicitly allocates one. Perks should modify the shared biological mechanics rather than bypass them completely.

# 21. Settlement, Economy, Social and Movement Integration

## 21.1 Settlement Integration

Set 29 exposes demand and condition state to NPC/settlement systems:

- food demand;
- medical demand;
- recovery-bed need;
- outbreak/isolation need;
- work-capacity reduction;
- injury downtime;
- disease pressure;
- population-health summary.

Settlement systems decide which buildings, jobs, policies and stock respond.

## 21.2 Economy Integration - Set 27

Set 27 consumes demand and downtime. It decides:

- food/medicine prices;
- hospital costs;
- shortages;
- wages;
- market response;
- insurance or financial consequences.

Set 29 may ask Set 27 whether an actor can afford a service only through the economy interface; affordability does not change biological truth.

## 21.3 Social Integration - Set 28

Set 28 owns who cares, whether a companion assists, how a healer speaks, whether trust changes and how relationships react. Set 29 owns the treatment need and biological outcome after an authorised social/treatment action occurs.

## 21.4 Movement Integration - Set 30

Set 30 provides movement mode and activity. Set 29 returns physiological limits/modifiers. A broken leg does not directly set `MaxSpeed()` inside Set 29; it exposes impairment/carry/stamina modifiers that Set 30 consumes.

# 22. Maritime and Dimension Integration Boundary

## 22.1 Set 26 Compatibility

Document 26E currently defines aquatic locomotion, breath, drowning, pressure response, water-specific temperature consequences, equipment-load interactions and rescue. The new Cross-Set Register later gives Set 30 ownership of swimming and Set 29 universal physiology.

29A does not transfer ownership. Until the final integration pass:

- Set 29 consumes `Swimming`/`Diving` movement state from the resolved movement provider.
- Set 26 remains authority for breath, drowning and pressure.
- Set 26D supplies marine environment temperature/current/weather snapshots.
- Set 29 owns universal hunger, fatigue, injury, disease, poison, health and general recovery as they interact with maritime play.

The Set 26/30 swimming boundary is formally recorded as an interface amendment/reconciliation item.

## 22.2 Dimensions

Dimensions may provide extreme atmosphere, temperature, toxins, magical hazards, food scarcity or altered rest conditions. Realm owners define the environmental rule; Set 29 applies biological consequences through declared interfaces.

A dimension may not silently replace Set 29 with an unrelated health system. It may define modifiers, immunity requirements, new disease/poison definitions or realm-specific exposure types through approved schemas.

# 23. Registry, ID and Data-Contract Direction

Set 29 follows the Set 25 qualified-ID grammar: lowercase qualified paths in registered namespaces and domains. Exact domains/facets are finalised in 29J with Set 25 governance.

Illustrative identities may include:

- `leyforge.core.condition.injury.deep_wound`
- `leyforge.core.condition.disease.example_family`
- `leyforge.core.condition.poison.example_toxin`
- `leyforge.core.biological_profile.humanoid.baseline`
- `leyforge.core.survival_profile.standard`

These examples demonstrate grammar only; they are not a final production roster.

## 23.1 Definition Families Expected

- Biological Profile Definition.
- Survival/Difficulty Profile Definition.
- Injury Definition.
- Disease Definition.
- Poison/Toxin Definition.
- Nutrition Effect Definition or facet where 25C ownership permits.
- Treatment Effect Definition/facet.
- Exposure Response Definition/facet.
- Biological Modifier Definition.
- Recovery Rule Definition.

## 23.2 Runtime Records Expected

- Biological State Record.
- Injury Instance.
- Disease Instance.
- Poison Instance.
- Treatment/Recovery State.
- Exposure Accumulator where needed.
- Population Health Summary for distant simulation.

# 24. Validation, QA and Explainability

Set 29 must be testable as a system rather than judged only by whether individual meters move.

## 24.1 Required Validation Classes

- Schema validation.
- Cross-owner reference validation.
- Difficulty-profile completeness.
- Treatment reachability.
- Recovery reachability.
- Food/medicine capability coverage.
- Condition counter availability.
- LOD conservation/reconciliation.
- Save/load migration.
- Multiplayer authority.
- UI explainability.
- Accessibility warning-channel coverage.
- Seed/world reachability where survival-critical capabilities are required.

## 24.2 No Uncounterable Routine Failure

Ordinary generated worlds must not strand the player in unavoidable recurring biological failure without a reasonable counter path. Harsh worlds may be dangerous, but capability validation should ensure that required survival responses are discoverable/reachable according to the selected profile.

## 24.3 Explainability Trace

For debugging and advanced inspection, each meaningful biological modifier should be traceable to:

- source definition/instance;
- owning system;
- magnitude/band;
- start/change time;
- applicable difficulty/profile;
- reason it currently affects the actor;
- counter or recovery capability where known.

# 25. Balance, Anti-Grind and Anti-Exploit Guardrails

## 25.1 No Meter Spam

Standard mode should not commonly show more than one or two survival pressures at once during routine healthy play. Contextual UI and slow baseline rates protect attention.

## 25.2 No Infinite Healing Loops

Food, low-cost medicine, rest, magic and infrastructure must not combine into unbounded instant combat healing. Treatment categories may use time, diminishing return, condition gating, resource cost, cooldown, toxicity or interruption where appropriate.

## 25.3 No Punishment for Pausing/Offline Time

Wall-clock progression cannot silently starve, dehydrate, infect or kill the player while the game is closed. Offline NPC simulation, if enabled, is bounded and must respect settlement resources and safety caps.

## 25.4 No Duplicate Cost Stacking

A single movement action should not independently apply three stamina costs because Combat, Set 30 and Set 29 each subtract stamina. One action owner requests a cost; Set 29 returns biological modifiers; the authoritative resource transaction occurs once.

## 25.5 No Universal Best Food/Medicine

Advanced food and medicine should create specialisation and convenience, not permanently invalidate common supplies. Cultural meals, preserved foods, field rations, fresh meals and specialist medicine can remain useful in different contexts.

## 25.6 No Perfect Immunity Without Cost

Permanent immunity to major survival systems should be rare, scoped and justified. Gear/magic may mitigate harsh environments, but broad immunity should normally require progression, maintenance, limited capacity or explicit endgame capability.

# 26. Production Scope, Non-Goals and Deferrals

## 26.1 Included in Set 29

- Complete biological system architecture.
- Configurable survival presets.
- Health and recovery ownership clarification.
- Hunger, thirst, nutrition, temperature, wetness, fatigue and sleep.
- Injuries, disease, poison and medicine.
- Biological profiles.
- Stamina regeneration and physiological encumbrance.
- Population-health abstraction and work-capacity outputs.
- Multiplayer/persistence/LOD contracts.
- Registry/API/validation architecture.

## 26.2 Explicit Non-Goals

- Real-world medical simulation.
- Full organ-by-organ damage.
- Universal item-weight simulation.
- Replacing combat damage mechanics.
- Replacing movement mechanics.
- Writing dialogue or companion AI.
- Calculating prices or hospital fees.
- Designing hospital buildings.
- Defining weather or biome generation.
- Defining cooking recipes or item inventories.
- Owning player death, respawn or tombstones.
- Adding a universal sanity meter.
- Adding a universal corruption meter.
- Adding Core radiation content without a later approved source.

## 26.3 Production Admission

29A approves architecture, not final release scope for every specialist mechanic. Exact first-release condition families, disease counts, medicine depth, nutrition complexity and harsh-mode options remain production-classification decisions under Set 25 and 29J.

# 27. Cross-Set Interface Amendments

The following amendments are proposed for final reconciliation. They add interfaces without moving ownership.

## AM-29-001 - Movement Exertion Interface

**Set 30 -> Set 29**

- `CurrentMovementMode()`
- `ActivityIntensity()`
- sprinting/climbing/swimming/riding/vehicle state
- carried-object movement state

**Set 29 -> Set 30**

- `StaminaDrainModifier()`
- `ExertionLimit()`
- `StaminaModifier()`
- `CarryPenalty()`
- `FatigueMovementModifier()`
- `InjuryMovementModifier()`

Ownership remains unchanged: Set 30 owns movement; Set 29 owns physiology.

## AM-29-002 - Social Care Interface

**Set 29 -> Set 28**

- `RecoveryStatus()`
- `CareNeed()`
- `TreatmentUrgency()`
- `SurvivalMoodModifier()`
- `ContagionSocialRisk()` where knowledge/visibility permits

Set 28 continues to own the actual relationship, dialogue and care behaviour.

## AM-29-003 - Economy Demand Interface

**Set 29 -> Set 27**

- `FoodDemandProfile()`
- `MedicalDemand()`
- `WorkCapacityModifier()`
- `ExpectedInjuryDowntime()`
- `DiseaseWorkforceImpact()`
- `RecoveryResourceDemand()`

Set 27 converts these into market demand, costs, wages and settlement wealth effects.

## AM-29-004 - Combat/Biology Boundary

**Document 16 -> Set 29**

- authoritative final damage packet;
- damage type/tags;
- hit region where available;
- combat-applied exposure/status request.

**Set 29 -> Document 16**

- biological health;
- injury impairment;
- bleeding state;
- poison/disease biological state;
- stamina/recovery modifier;
- `CriticalCondition()`;
- `Stabilised()`.

Combat retains attack, defence, damage and death/downing ownership.

## AM-29-005 - Food and Medicine Definition Boundary

**Items/Recipes -> Set 29**

- nutrition/hydration capability tags;
- food safety/spoilage state;
- medicine/treatment capability tags;
- dose/use transaction result.

**Set 29 -> Items/Recipes/UI**

- biological effect result;
- contraindication/ineffective reason;
- recovery/support status.

## AM-29-006 - Environmental Exposure Interface

**World/environment owners -> Set 29**

- ambient temperature;
- wind/exposure;
- precipitation/water contact;
- shelter capability;
- hazard/toxin tags;
- realm/biome context;
- marine environment snapshot where applicable.

**Set 29 -> world/UI/event consumers**

- body temperature state;
- wetness state;
- exposure severity;
- environmental-injury risk/status.

## AM-29-007 - Death Boundary

**Set 29 exports**

- `CriticalCondition()`
- `Stabilised()`
- `RecoveryPossible()`
- `MedicalRescueWindowClass()` if later required

Set 29 does not own death, respawn or inventory recovery.

## AM-29-008 - Set 26 / Set 30 Aquatic Ownership Reconciliation

Existing Set 26 assigns aquatic locomotion to 26E while the new Cross-Set Register assigns swimming to Set 30. Set 29 will consume a resolved swimming/diving movement state and will not choose the owner. Breath, drowning and pressure remain Set 26 until explicit integration approval.

## AM-29-009 - Population Health Summary Interface

**Set 29 -> Settlement/27/Quest/Event systems**

- `PopulationHealthIndex()`
- `ActiveCareDemand()`
- `OutbreakPressure()`
- `InjuryBurden()`
- `WorkforceAvailabilityModifier()`

This summary is derived from biological state and does not redefine settlement needs, economy or events.

# 28. Locked Questions for Specialist Documents

The following questions are intentionally assigned rather than solved in 29A:

| Question | Owner |
| --- | --- |
| Exact health scale, regeneration delays and natural-recovery curves. | 29B |
| Exact stamina regeneration, exertion and fatigue curves. | 29B |
| Exact hunger duration, starvation penalties and meal satiety values. | 29C |
| Nutrition complexity: simple quality bands versus a small macro-group model. | 29C |
| Hydration rates and Harsh-mode dehydration timings. | 29C |
| Thermal comfort bands and wetness/drying rates. | 29D |
| Sleep debt and rest-quality model. | 29D |
| Injury severity count, body regions and impairment curves. | 29E |
| Whether pain is an explicit state or an injury-derived modifier only. | 29E |
| Disease transmission and incubation abstractions. | 29F |
| Poison stacking and toxin families. | 29F |
| Treatment timing, medicine effectiveness, toxicity and diminishing returns. | 29G |
| Biological-profile differences for playable peoples and creatures. | 29H |
| Exact distant-simulation batching and outbreak aggregation. | 29I |
| Final qualified IDs, schema fields, API signatures and validator rules. | 29J |

# 29. Acceptance Criteria for 29A

29A is accepted when all of the following are true:

1. The Cross-Set Interface Register v1.0 is explicitly adopted.
2. Every major biological mechanic has one declared owner.
3. Economy, dialogue/social and movement are consumed through interfaces, not redefined.
4. Universal biological Health ownership is assigned to Set 29 without taking combat damage/death ownership from Document 16.
5. Standard mode retains hunger and temperature while thirst remains off by default.
6. Peaceful/Relaxed/Harsh/Custom settings can vary severity without separate incompatible systems.
7. Slot inventory remains authoritative; no hidden weight simulator is introduced.
8. Food/medicine biological effects are separated from item/recipe/economy ownership.
9. Environmental state is consumed rather than recalculated.
10. Set 26 aquatic overlap is recorded for reconciliation rather than silently overwritten.
11. Detailed local and distant biological simulation can coexist without losing named-NPC condition state.
12. Persistence and multiplayer remain authoritative and duplication-safe.
13. UI can explain causes and counters through accessible multi-channel feedback.
14. Proposed cross-set interfaces do not transfer ownership.
15. Specialist questions are assigned to 29B-29J.

# Appendix A. Survival API v1.0

## A.1 Mandatory Cross-Set API

| Function | Owner | Consumer Examples | Meaning |
| --- | --- | --- | --- |
| `HungerLevel()` | Set 29 | UI, Set 27, AI | Current hunger/satiety state in stable machine-readable form. |
| `ThirstLevel()` | Set 29 | UI, AI | Current hydration need; disabled-state must be distinguishable from zero thirst. |
| `BodyTemperature()` | Set 29 | UI, movement/combat, AI | Biological thermal state, not ambient temperature. |
| `InjuryState()` | Set 29 | Combat, Set 28, Set 30, economy, AI | Resolved injury summary plus stable references for detail. |
| `DiseaseState()` | Set 29 | Set 28, settlement, quest/event, UI | Active disease summary respecting knowledge/privacy rules. |
| `PoisonLevel()` | Set 29 | Combat, UI, treatment | Active poison/toxin burden summary. |
| `Fatigue()` | Set 29 | Set 28, Set 30, AI | Long-term fatigue state. |
| `StaminaModifier()` | Set 29 | Combat, Set 30 | Physiological modifier to stamina recovery/capability. |
| `CarryPenalty()` | Set 29 | Set 30 | Physiological load penalty derived from external load state. |

## A.2 Proposed Additions

- `RecoveryStatus()`
- `CareNeed()`
- `TreatmentUrgency()`
- `CriticalCondition()`
- `Stabilised()`
- `RecoveryPossible()`
- `FoodDemandProfile()`
- `MedicalDemand()`
- `WorkCapacityModifier()`
- `ExpectedInjuryDowntime()`
- `DiseaseWorkforceImpact()`
- `PopulationHealthIndex()`
- `OutbreakPressure()`
- `StaminaDrainModifier()`
- `ExertionLimit()`
- `FatigueMovementModifier()`
- `InjuryMovementModifier()`

Final signatures and return schemas belong to 29J and the technical owner.

# Appendix B. Cross-System Ownership Matrix

| Concern | Set 29 Owns | External Owner |
| --- | --- | --- |
| Hunger effect | Yes | Food item source: Items/Recipes |
| Food price | No | Set 27 |
| Food recipe | No | Document 05 |
| Food item/spoilage state | No | Document 04/05 |
| Hydration biology | Yes | Water item/source: Items/World/Set 26 as applicable |
| Ambient temperature | No | Worldgen/weather/dimension/26D |
| Body temperature | Yes | - |
| Wetness biology | Yes | Water contact/weather source external |
| Sprinting | No | Set 30 |
| Stamina regeneration | Yes | Combat/Set 30 consume |
| Attack stamina cost request | No | Combat/action owner |
| Injury biology | Yes | Damage cause external |
| Damage mitigation | No | Document 16 |
| Death/downed | No | Document 16/related death owner |
| Disease state | Yes | Outbreak event: Document 15; source may be creature/world/item |
| Poison biology | Yes | Poison source item/creature/trap/magic external |
| Medicine biological effect | Yes | Item/recipe/price/facility/social interaction external |
| Doctor dialogue | No | Set 28 |
| Clinic/hospital capacity | No | Set 20 |
| Medical cost | No | Set 27 |
| Companion loyalty/care choice | No | Set 28 |
| Movement penalty calculation | Biological modifier only | Set 30 applies movement result |
| Corruption source/state | No | Magic/world owner |
| Biological consequence of corruption | Only declared effect | Corruption owner remains authoritative |
| Breath/drowning/pressure | No in current contract | Set 26 unless later explicitly reconciled |

# Appendix C. Default Survival Preset Matrix

| Profile | Design Intent | Hunger | Thirst | Temperature | Sleep/Fatigue | Disease | Injuries | Recovery |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| Peaceful | Cosy building/civilisation with positive survival flavour. | Optional/benefit-focused | Off | Mild warnings | Optional | Very rare/off option | Light | Fast |
| Relaxed | Adventure with low maintenance. | Slow | Off | Mild | Light | Reduced | Light-moderate | Faster |
| Standard | Intended default. Preparation matters; routine play stays comfortable. | On, forgiving | Off | Relevant extremes | Soft | Uncommon | Moderate | Moderate |
| Harsh | Survival-focused world. | Strong | On | Broad/strong | Important | Increased | Strong | Slower without care |
| Custom | Player/server chooses dimensions individually. | Configurable | Configurable | Configurable | Configurable | Configurable | Configurable | Configurable |

# Appendix D. Biological State Envelope Template

```text
BiologicalStateRecord
- actor_instance_id
- biological_profile_id
- current_health
- health_capacity_snapshot_or_reference
- stamina_state_reference
- hunger_state
- hydration_state
- nutrition_state
- body_temperature_state
- wetness_state
- fatigue_state
- injury_instance_ids[]
- disease_instance_ids[]
- poison_instance_ids[]
- recovery_state
- treatment_state_refs[]
- physiological_modifier_summary
- last_authoritative_sim_time
- scheduled_biological_events[]
- lod_state
- schema_version
```

This is an architectural template, not the final 29J schema.

# Appendix E. Event and Query Contract Library

Suggested biological events:

- `BiologicalHealthChanged`
- `StaminaRecoveryModifierChanged`
- `HungerBandChanged`
- `HydrationBandChanged`
- `BodyTemperatureBandChanged`
- `WetnessBandChanged`
- `FatigueBandChanged`
- `InjuryApplied`
- `InjuryStabilised`
- `InjuryRecovered`
- `DiseaseExposureRegistered`
- `DiseaseStageChanged`
- `DiseaseRecovered`
- `PoisonApplied`
- `PoisonLevelChanged`
- `PoisonCleared`
- `TreatmentStarted`
- `TreatmentResolved`
- `RecoveryStatusChanged`
- `CriticalConditionChanged`
- `PopulationHealthSummaryChanged`

Suggested input requests:

- `ApplyResolvedDamageBiology()`
- `ApplyExposure()`
- `ApplyFoodConsumption()`
- `ApplyDrinkConsumption()`
- `ApplyTreatment()`
- `ApplyRestInterval()`
- `ApplyMovementExertionContext()`
- `QueryBiologicalModifiers()`
- `QueryCareNeed()`

Final command authority and schemas belong to 29J/rewritten technical plan.

# Appendix F. Migration Notes from Earlier Documents

| Earlier Rule | 29A Treatment |
| --- | --- |
| Document 02: health, stamina, mana, hunger and temperature are core; no thirst by default. | Retained. Set 29 adds full but configurable thirst, sleep/fatigue and disease mechanics without changing Standard default. |
| Document 16: health, stamina, injuries, poison, healing and death all described inside Combat. | Split by ownership. Damage/death remain Combat; persistent biology moves to Set 29. Existing entries become migration inputs, not duplicate authorities. |
| Document 16: food mainly preparation/slow recovery; bandage stabilises; rest/shelter support recovery. | Retained as biological design direction for 29B/29G. |
| Items/Recipes: food spoilage and cooking are registry/recipe concerns. | Retained; Set 29 owns consumption effects only. |
| Document 11: climate/weather/temperature meaningful but configurable. | Retained; Set 29 consumes environmental outputs. |
| Document 17: health immediate; stamina/hunger/temperature contextual; accessibility first-class. | Retained as required UI contract. |
| Document 20: healthcare requires real staff, beds, medicine, clean water and sanitation. | Retained; facilities satisfy biological demand but are not defined by Set 29. |
| Set 25A: survival defaults pending. | Resolved at architecture level by 29A and detailed by 29B-29J. |
| Document 26E: aquatic locomotion/breath/pressure/temperature survival. | Preserved pending final Set 26/30 reconciliation; Set 29 owns universal biology only. |

# Appendix G. Terminology Register

| Term | Definition |
| --- | --- |
| Biological Health | Universal living-actor health state owned by Set 29. |
| Damage Packet | Resolved combat/environment damage input owned by its cause/resolution system, consumed by biology. |
| Stamina | Short-term physical action resource; biological regeneration/modification is Set 29-owned. |
| Fatigue | Longer-term accumulated strain/sleep debt distinct from current stamina. |
| Hunger | Current food-need/satiety state. |
| Nutrition | Longer-term beneficial/deficient food-quality state at an intentionally simplified abstraction. |
| Hydration | Biological water-need state; supported but not enabled by default in Standard. |
| Body Temperature | Actor biological thermal state; distinct from ambient/world temperature. |
| Wetness | Actor exposure/saturation state derived from external water/weather contact. |
| Injury | Persistent physical biological damage with severity, region and recovery state. |
| Disease | Staged biological illness/infection instance. |
| Poison/Toxin | Harmful substance burden/effect instance caused by an external source. |
| Treatment | Authorised action or effect intended to stabilise, relieve, cure or accelerate recovery. |
| Recovery Status | Resolved state describing whether and why natural/treatment recovery is active, reduced, blocked or accelerated. |
| Biological Profile | Definition describing physiology-relevant traits for an actor type without owning culture/personality. |
| Physiological Encumbrance | Biological burden derived from externally defined equipment/heavy-carry state; not total inventory weight. |
| Population Health Summary | Distant/cohort abstraction of biological demand and impairment while preserving exceptional named conditions. |

# Appendix H. Cross-Set Interface Amendments Register

| ID | Interface | Direction | Ownership Transfer? | Status |
| --- | --- | --- | --- | --- |
| AM-29-001 | Movement exertion and physiological movement modifiers | Set 30 <-> Set 29 | No | Proposed for final integration |
| AM-29-002 | Recovery/care need to social systems | Set 29 -> Set 28 | No | Proposed for final integration |
| AM-29-003 | Food/medical/workforce demand to economy | Set 29 -> Set 27 | No | Proposed for final integration |
| AM-29-004 | Combat damage -> biology; biology modifiers -> combat | Document 16 <-> Set 29 | No; clarifies approved split | Approved concept, final schema pending |
| AM-29-005 | Food/medicine definition capability boundary | Items/Recipes <-> Set 29 | No | Proposed |
| AM-29-006 | Environmental exposure snapshot | World/Weather/26D -> Set 29 | No | Proposed |
| AM-29-007 | Critical/stabilised/recovery state to death owner | Set 29 -> Combat/death owner | No | Proposed |
| AM-29-008 | Aquatic movement owner reconciliation | Set 26 / Set 30 | No decision in Set 29 | Integration review required |
| AM-29-009 | Population health summary | Set 29 -> Settlement/27/Quest/Event | No | Proposed |

---

**End of Document 29A - Survival, Health and Biological System Foundation v0.1**

**Next Document:** 29B - Health, Stamina, Exertion, Fatigue and Biological Recovery
