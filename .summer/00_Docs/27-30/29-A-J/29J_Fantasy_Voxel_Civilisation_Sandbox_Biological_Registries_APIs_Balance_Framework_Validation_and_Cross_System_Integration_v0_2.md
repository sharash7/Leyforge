# FANTASY VOXEL CIVILISATION SANDBOX

## DOCUMENT SET 29

# 29J - Biological Registries, APIs, Balance Framework, Validation and Cross-System Integration

**Version 0.2 - Final Set Reconciliation, Canonical Data Contract and Production Acceptance Draft**

*A canonical registry, interface, balance and validation contract that closes Leyforge Document Set 29 by reconciling every Survival, Health and Biological rule from 29A-29I into one implementation-ready source of truth without transferring Economy, Social, Movement, Combat, Worldgen, Item, Recipe, Magic, Settlement or Maritime ownership.*

**Project Lead and Final Authority: Ash**

> **29J System Statement**  
> Set 29 is complete only when every biological rule can be represented by one owned definition or runtime record, queried through one stable interface, modified through one authoritative transaction path, balanced through bounded and explainable reference profiles, preserved through save/LOD/networking, and validated against every external system it consumes. 29J does not invent another survival mechanic. It turns the mechanics already locked in 29A-29I into a coherent production contract that Godot/Summer Engine, Set 25 registries, future content packs and Sets 27-30 can implement without duplicate truth.

| Field | Locked Direction |
| --- | --- |
| Document Role | 29J is the final Set 29 reconciliation authority for canonical schema families, registry mappings, public APIs, command/transaction envelopes, balance-profile contracts, validation suites, dependency mapping, interface amendments and Set 29 Definition of Done. |
| Governing Contract | The Leyforge Document Sets 27-30 Cross-Set Interface Register v1.0 remains binding. Set 29 owns survival/health biology only and consumes Economy, Social and Movement interfaces. |
| Registry Direction | Follow Set 25's qualified-ID grammar, namespace governance, field-level ownership, immutable-definition/runtime-state separation, migration and validation contracts. No ad hoc Set 29 registry universe is permitted. |
| Identity Direction | Existing Set 25 domains are reused wherever semantically safe. New top-level domain prefixes are not introduced by 29J. Biological content is represented through existing `disease`, `status`, `action`, `hazard`, `effect`, `capability`, `schema`, `interface`, `lod_profile` and related registered domains/facets. |
| API Direction | The Cross-Set Survival API names from the governing register remain stable. Specialist APIs are consolidated into one query surface and one command/transaction surface; direct external writes to biological state are prohibited. |
| Balance Direction | Peaceful, Relaxed, Standard, Harsh and Custom share one rules/schema model. Standard is the reference tuning profile; other presets modify bounded parameters rather than running separate code paths. |
| Validation Direction | Data, runtime, cross-system, persistence, multiplayer, accessibility, LOD, exploit and migration validation are mandatory before Set 29 content reaches Data Ready or shipping status. |
| Disease Reconciliation | Set 29 is the executable biological disease owner. Existing `disease` identity/ecology context from 24F/Document 10 may remain as separately owned facets; no duplicate disease gameplay state is allowed. |
| Aquatic Reconciliation | Set 29 consumes Swimming/Diving state but does not resolve the remaining Set 26 versus Set 30 locomotion-ownership question. Breath, drowning and pressure remain outside Set 29 unless explicitly reassigned. |
| Death Boundary | Set 29 owns biological critical condition, stabilisation and recovery possibility; it does not own downed/death/respawn/tombstone rules. |
| Engine Direction | Godot/Summer Engine implementation consumes generated, validated registries and authoritative runtime records. Final Godot class names and binary storage remain Document 18 implementation decisions. |
| Set Completion | 29A-29J together constitute the complete v0.1 Survival, Health and Biological design authority once this reconciliation document is accepted. |

# Document Purpose

Documents 29A-29I intentionally separated biological gameplay into manageable authorities: universal survival architecture; Health/Stamina/Fatigue; Hunger/Hydration/Nutrition; Temperature/Wetness/Sleep; Injuries; Disease/Poison; Treatment/Rehabilitation; Biological Profiles and integration; and Simulation LOD/Multiplayer/Persistence/UI/Accessibility. That separation made the systems easier to reason about, but implementation now requires a final contract that removes provisional naming, identifies canonical record families, freezes cross-set API semantics and states exactly what must be validated.

29J therefore performs six jobs:

1. reconcile source-of-truth ownership across 29A-29I and the wider project;
2. map Set 29 definitions into the Set 25 Registry Kernel without creating conflicting domains;
3. freeze Survival API v1.0 and the command/transaction boundaries used by other systems;
4. establish the Standard reference balance framework and bounded preset scaling rules;
5. define the complete validation and production acceptance suite;
6. close the Cross-Set Interface Amendment register for the final Sets 27-30 integration pass.

29J is not a spreadsheet dump of every future disease, potion or injury. Content rosters may grow through the canonical registries. This document defines the schema, ownership, constraints and evidence that every such entry must satisfy.

# Design Sources, Authority and Treatment

| Source | Relevant Direction | 29J Treatment |
| --- | --- | --- |
| Cross-Set Interface Register v1.0 | One owner per gameplay system; Set 29 owns survival/health biology; Sets 27/28/30 consume or provide defined interfaces. | Binding ownership contract. No transfer is made here. |
| 25B v0.2 | Qualified IDs use `<namespace>.<domain>.<identity_path>`; one mutable truth; no new top-level domain without architecture approval. | All Set 29 schema/ID recommendations comply. |
| 25C | Schemas, facets, relationships, capabilities, completeness and one-owner field rules. | Set 29 registers owned gameplay facets and consumes external identity/context fields. |
| 25D-25E | Packs, migrations, validation and release gates. | Set 29 content must compile, migrate and validate through the shared production pipeline. |
| 02 | Health/Stamina and survival progression; Standard has no thirst by default. | Preserved. Progression modifies Set 29 through bounded interfaces. |
| 04-06 | Food, medicine, items, recipes, resources and spoilage remain physical registries. | Set 29 consumes biological trait/capability facets; it does not redefine item/recipe identity. |
| 07/19/20 | NPC identity, settlements, services, sanitation, healthcare, food and shelter are world capabilities requiring real resources/staff. | Set 29 converts those capabilities into biological outcomes/demand; no abstract healing or food creation. |
| 09 | Magic owns spells, mana and magical activation. | Set 29 accepts validated biological effect/treatment/protection payloads. |
| 10/11 | Ecology/worldgen own hosts, habitats, climate, hazards and environment sources. | Set 29 owns biological interpretation and executable disease/poison state, not world placement or creature behaviour. |
| 16 | Combat owns attacks, damage packets, armour/defence and downed/death combat rules. | Set 29 owns resulting biological Health, injury, bleeding, poison and recovery state. |
| 17 | UI owns screens/layout/presentation. | Set 29 owns biological view-model, visibility and alert data only. |
| 26 | Maritime systems own aquatic specialist mechanics and vessel environment context. | Set 29 consumes exposure/movement/interior support interfaces only. |
| 29A-29I | Detailed specialist rules and provisional APIs. | Consolidated here without changing their gameplay meaning. |

> **Final Source-of-Truth Rule**  
> If 29J and an earlier Set 29 document use different names for the same implementation contract, 29J's canonical name is the integration name while the earlier document remains the design authority for the mechanic itself. If 29J appears to change gameplay meaning rather than naming, the specialist document wins until an explicit approved amendment changes it.

# Static Table of Contents

1. Locked 29J System Identity  
2. Final Decision Summary  
3. Governing Ownership Boundary  
4. Set 29 Document Suite Ownership Map  
5. Canonical Terminology  
6. Registry Kernel and Qualified-ID Compliance  
7. Canonical Set 29 Schema Architecture  
8. Biological Profile and Region Schemas  
9. Health, Stamina and Fatigue Schemas  
10. Nourishment, Hydration and Nutrition Schemas  
11. Environment, Wetness and Sleep Schemas  
12. Injury, Wound, Bleeding and Pain Schemas  
13. Disease, Infection, Poison and Toxin Schemas  
14. Treatment, Medicine and Rehabilitation Schemas  
15. Protection, Compatibility and Integration Schemas  
16. Runtime State and Persistent Record Families  
17. Population and Cohort Summary Schemas  
18. Definitions, Runtime State, Snapshots and Derived Values  
19. Canonical Survival API v1.0  
20. Query Interface  
21. Command and Transaction Interface  
22. Economy Interface Contract  
23. Social and Companion Interface Contract  
24. Movement and Travel Interface Contract  
25. Existing-System Integration Contracts  
26. API Versioning, Results and Error Semantics  
27. Balance Philosophy and Numeric Conventions  
28. Standard Reference Balance Baseline  
29. Difficulty and World-Preset Scaling  
30. Modifier Composition, Ordering and Clamps  
31. Content Authoring and Completeness Contract  
32. Validation Architecture  
33. Definition and Registry Validation  
34. Runtime and Simulation Validation  
35. Cross-System Contract Validation  
36. Persistence, Migration and Multiplayer Validation  
37. Accessibility, Knowledge and Explainability Validation  
38. Performance, LOD and Scale Evidence  
39. Exploit and Regression Suite  
40. Cross-Set Interface Amendment Reconciliation  
41. Final Interface Amendments AM-29-101 to AM-29-110  
42. Remaining External Decisions  
43. Production Handoff and Required Document Revisions  
44. Set 29 Definition of Done  
45. Set 29 Completion Statement  
Appendix A. Canonical Registry Family Matrix  
Appendix B. Survival API v1.0 Reference  
Appendix C. Standard Balance Reference Tables  
Appendix D. Validation Scenario Catalogue  
Appendix E. Cross-System Dependency Matrix  
Appendix F. Save and Migration Record Matrix  
Appendix G. Cross-Set Interface Amendment Register AM-29-001 to AM-29-110  
Appendix H. Final Terminology Register

# 1. Locked 29J System Identity

29J is the **integration closure document** for Set 29. It exists to remove ambiguity between otherwise-correct specialist documents.

A valid implementation must be able to answer, for every biological field:

- which immutable definition describes it;
- which system owns mutable state;
- what qualified identity is stored;
- which external systems may request a change;
- which API exposes the result;
- how difficulty modifies it;
- how it behaves at LOD and across save/load;
- how clients receive it;
- what evidence proves the system works.

The Set 29 runtime may be implemented in several Godot services/resources, but implementation decomposition may not create duplicate mutable truth.

## 1.1 Final Set Identity

The complete Set 29 system covers:

- universal biological Health and recovery;
- Stamina regeneration, biological expenditure modifiers, exertion and Fatigue;
- Hunger, optional Thirst, Hydration and Nutrition;
- body thermal response, Wetness, Sleep Pressure and rest biology;
- Injuries, Wounds, Bleeding, Blood Loss, Pain and functional impairment;
- Disease, infection, biological contamination, poison and toxins;
- Medicine, first aid, healing, treatment and rehabilitation;
- Biological Profiles, body applicability and protection integration;
- population biological demand and healthcare burden;
- biological LOD, persistence, authority, view models and accessibility;
- stable APIs and validation.

## 1.2 Explicit Non-Ownership

Set 29 does not own:

- currency, prices, wages, trade, banking or market simulation;
- dialogue, romance, loyalty, persuasion or companion social decisions;
- locomotion, speed, climbing, swimming movement, mounts or vehicle handling;
- attack resolution, armour defence, weapon damage or death/respawn;
- food item definitions, cooking recipes or spoilage transforms;
- weather generation, climate simulation or biome placement;
- spell casting, mana costs or magical school behaviour;
- building/service identity, staffing or settlement construction;
- creature AI/ecology, vessel mechanics or aquatic pressure/breath systems.

# 2. Final Decision Summary

| Area | Final v0.1 Lock |
| --- | --- |
| Standard Survival | Hunger and Temperature enabled; Thirst disabled by default; Sleep/Fatigue soft; Disease uncommon and source-driven; injuries persistent but bounded. |
| Health Ownership | Set 29 owns universal biological Health state and natural recovery. Document 16 owns combat damage generation and combat/downed/death rules. |
| Stamina | 29B owns Stamina pool/regeneration/biological cost response; action owners request cost and own the action. |
| Encumbrance | No hidden kilogram inventory. Set 29 consumes equipment/load classes and exposes physiological carry/exertion penalty. |
| Hunger | 0-100 severity derived from satiety reserve; Standard baseline reaches maximum in about 25 simulation hours before modifiers. |
| Thirst | Full implementation exists but is off in Peaceful/Relaxed/Standard and enabled by default in Harsh. |
| Nutrition | Energy, Protein, Produce and Variety over a rolling window; no micronutrient spreadsheet. |
| Thermal | Signed/semantic Thermal Load; external environment supplies pressure, Set 29 owns body response. |
| Wetness | 0-100; modifies thermal/recovery context; wetness alone never creates disease. |
| Sleep | Sleep Pressure 0-100; Standard becomes clearly drowsy after roughly 16 hours awake; good sleep target about 7-9 hours. |
| Injury | Persistent record separate from Health; semantic body regions; no limb-loss system in Core. |
| Disease | Source-driven exposure and transmission; no random safe-settlement sickness roll. |
| Poison | Per-toxin load records; public PoisonLevel is a bounded summary, not one hidden global DOT. |
| Treatment | Capability-driven, transactional and idempotent. Items/spells/facilities never write biological fields directly. |
| Profiles | One universal biology parameterised by Biological Profiles/overlays; no ancestry-specific code branches. |
| LOD | Five biological LODs; detail may compress but consequence may not disappear. |
| Offline | Local application closure does not advance dangerous biological time. Persistent servers use explicit world policy. |
| Multiplayer | Host/server authoritative; client prediction is bounded and reconciled. |
| IDs | Full qualified IDs; no display names/file paths as persistent identity. |
| API | Survival API v1.0 is stable for Sets 27-30 and authorised consumers. |
| Validation | Data + runtime + cross-system + save/migration + multiplayer + accessibility + scale evidence required. |

# 3. Governing Ownership Boundary

The Cross-Set Interface Register controls ownership between Sets 27-30. Set 29 consumes external interfaces and never reimplements them.

| Domain | Owner | Set 29 Relationship |
| --- | --- | --- |
| Economy | Set 27 | Exposes food/medical/workforce demand; receives prices/scarcity/costs. |
| Social | Set 28 | Exposes care need, injury/illness/recovery summaries; receives provider/companion social outcomes. |
| Movement | Set 30 | Receives movement/activity/load/travel context; exposes stamina/carry/injury/fatigue modifiers. |
| Combat | Document 16 | Receives resolved biological damage/trauma; exposes biological state/modifiers/critical condition. |
| Items/Recipes | 04/05/Set 25 replacements | Receives food/medicine/equipment traits and committed consumption; does not define item identity. |
| World/Environment | 11 replacement/26 | Receives exposure snapshots; owns body response only. |
| Settlements | 07/19/20 | Receives real service capacity; exposes biological demand/suitability/outbreak burden. |
| Magic | 09 | Receives validated biological effects/treatment/protection capabilities. |
| Quest/Event | 15 | Exposes stable state/events; does not own quest generation. |
| UI | 17 | Exposes view models/alerts/visibility; does not own screens. |
| Technical | 18/25 | Uses shared authority, save, Registry Service, schema and validation architecture. |

# 4. Set 29 Document Suite Ownership Map

| Document | Canonical Specialist Authority | 29J Treatment |
| --- | --- | --- |
| 29A | System foundation, ownership, difficulty philosophy and base Survival API. | Governing Set 29 contract retained. |
| 29B | Health, Stamina, Exertion, Fatigue and natural biological recovery. | Numeric/API names consolidated. |
| 29C | Hunger, Hydration, Nutrition and consumption biology. | Consumption and population demand schemas consolidated. |
| 29D | Temperature, Wetness, Shelter-context biology, Sleep and exposure response. | Exposure/sleep schemas consolidated. |
| 29E | Injuries, Wounds, Bleeding, Blood Loss, Pain and functional impairment. | Status/region/runtime records consolidated. |
| 29F | Disease, infection, poison, toxins and biological hazards. | Disease identity/facet conflict reconciled. |
| 29G | Medicine, first aid, healing, treatment and rehabilitation transactions. | Treatment capability/action schemas consolidated. |
| 29H | Biological Profiles, equipment/magic/settlement/environment compatibility. | Profile/protection schema names finalised. |
| 29I | LOD, persistence, multiplayer, view models and accessibility. | Runtime/save/snapshot families finalised. |
| 29J | Registries, API, balance, validation and integration closure. | Final integration authority only. |

# 5. Canonical Terminology

| Term | Final Meaning |
| --- | --- |
| Biological Definition | Immutable authored record describing a biological rule/content identity. |
| Biological Runtime State | Mutable authoritative state for an actor/population, owned by Set 29 services. |
| Biological Profile | Reusable physiology/applicability definition referenced by an actor/entity definition. |
| Profile Overlay | Explicit temporary or persistent physiological modification with source, priority and removal policy. |
| Biological Region | Semantic body region used by 29E and compatibility systems, independent of skeleton bone names. |
| Biological Exposure | Typed source event carrying pathogen/toxin/contamination/thermal or other biological pressure into Set 29. |
| Biological Protection Bundle | Source-traceable resolved protection capabilities from equipment, magic, shelter, vehicle/vessel or profile. |
| Treatment Capability | Validated ability to perform a biological treatment outcome under conditions; not an item identity. |
| Biological Modifier Bundle | Bounded, traceable collection of multipliers/additives consumed by Health/Stamina/Fatigue/Movement/workforce calculations. |
| Biological Snapshot | Revisioned read-only view of authoritative state for consumers; not mutable truth. |
| Population Health Summary | Versioned aggregate of food/medical/workforce/outbreak burden for settlement/economy simulation. |
| Biological LOD | Representation/scheduling level; never a separate rule set. |
| Transaction Envelope | Idempotent authoritative request/result identity protecting one-time state changes. |
| Knowledge Visibility | Rules describing whether biological truth is self-known, observable, suspected, diagnosed or hidden. |

# 6. Registry Kernel and Qualified-ID Compliance

Set 29 follows the Set 25 qualified-ID grammar exactly:

`<namespace>.<domain>.<identity_path>`

Production examples use `leyforge.core`. Protected schemas/interfaces use the system namespace already established by Set 25.

## 6.1 Domain Mapping

29J does not introduce a new `biology` domain. The following mappings reuse the existing kernel:

| Set 29 Concept | Existing Domain Direction | Ownership Treatment |
| --- | --- | --- |
| Disease identity | `disease` | Ecology/Atlas may own identity/context fields; Set 29 owns executable biology facet and runtime state. |
| Injury definition | `status` | Set 29 owns injury-status gameplay definition/facet. |
| Toxin/poison definition | `status` or applied `effect` facet | Set 29 owns biological toxin semantics; source item/creature/hazard remains external. |
| Biological Profile | `status` reusable profile definition plus registered `biological_profile` schema | Set 29 owns physiology fields; ancestry/entity owners reference the profile. |
| Treatment action | `action` with registered treatment facet | 29G owns treatment gameplay fields; item/spell/provider/facility owners supply capabilities. |
| Biological hazard source | `hazard` with biological-exposure facet | Hazard/world owner owns source/placement; 29F owns biological response. |
| Protection/compatibility | `capability`/`effect`/facets | Source system owns capability offer; Set 29 owns biological interpretation. |
| LOD/persistence policy | `lod_profile`, `schema`, `authority_profile` | Shared kernel/technical identity; 29I supplies biological requirements. |
| Public API | `interface` | Set 29 owns Survival interface semantics. |

## 6.2 Canonical Schema IDs

The following interface/schema identities are reserved for implementation registration; schema versions remain metadata rather than ID suffixes:

- `leyforge.system.schema.biological_profile`
- `leyforge.system.schema.biological_region_profile`
- `leyforge.system.schema.biological_profile_overlay`
- `leyforge.system.schema.biological_status_facet`
- `leyforge.system.schema.disease_biology_facet`
- `leyforge.system.schema.biological_exposure`
- `leyforge.system.schema.treatment_capability`
- `leyforge.system.schema.biological_protection_bundle`
- `leyforge.system.schema.biological_runtime_state`
- `leyforge.system.schema.population_health_summary`
- `leyforge.system.schema.biological_transaction`
- `leyforge.system.schema.survival_world_profile`
- `leyforge.system.interface.survival`

These are schema/interface identities, not new content domains.

## 6.3 Content-ID Examples

Examples are patterns, not a forced content roster:

- `leyforge.core.disease.marsh_fever`
- `leyforge.core.status.injury.fracture.simple`
- `leyforge.core.status.toxin.venom.spider_common`
- `leyforge.core.status.biological_profile.humanoid.baseline`
- `leyforge.core.action.treatment.bandage.basic`
- `leyforge.core.hazard.biological.spores.fungal_cloud`

Display names, Godot Resource paths, spreadsheet rows and runtime severity do not enter these identities.

# 7. Canonical Set 29 Schema Architecture

Every compiled Set 29 definition uses the Set 25 universal envelope plus one owned gameplay facet. Field-level ownership is explicit.

## 7.1 Common Biological Definition Fields

Minimum common fields where applicable:

- qualified definition ID;
- schema ID and schema version;
- display/localisation keys where player-visible;
- canonical owner/facet owner;
- source pack and provenance;
- parent/family references;
- tags and capability relationships;
- applicability/compatibility constraints;
- difficulty override profile;
- LOD/persistence requirements;
- validation profile;
- production status;
- deprecation/migration policy.

## 7.2 Definition/State Separation

A disease definition contains incubation/stage/transmission rules. A `DiseaseInstance` contains actor-specific burden, stage and timers. An injury definition contains family/severity behaviour. An `InjuryInstance` contains affected region, progress and treatment state. No runtime state is encoded by changing the definition ID.

# 8. Biological Profile and Region Schemas

## 8.1 BiologicalProfileDefinition

Required field groups:

- applicability flags for Health/Stamina/Hunger/Hydration/Thermal/Wetness/Sleep/Injury/Bleeding/Disease/Poison/Treatment;
- baseline resource modifiers;
- diet/hydration compatibility tags;
- thermal comfort/adaptation traits;
- sleep/rest pattern traits;
- disease/toxin susceptibility/resistance tags;
- injury/bleeding/regeneration traits;
- body-region profile reference;
- treatment compatibility tags;
- respiration/aquatic external handoff tags where needed;
- accessibility/body-support tags;
- bounded playable-balance classification;
- migration hash/revision.

## 8.2 BiologicalRegionProfile

Defines semantic regions and mappings such as:

- humanoid: head, torso, left/right arm, left/right leg;
- quadruped: head, torso, fore-left/right, hind-left/right;
- winged/hybrid forms: optional wing/appendage regions;
- non-bleeding/constructed bodies: channels marked inapplicable rather than faked.

Bone/socket/skeleton mapping belongs to Entity/Forge. Set 29 references semantic regions only.

## 8.3 BiologicalProfileOverlay

Required fields:

- overlay ID;
- source definition/instance;
- affected fields;
- additive/multiplicative/replace mode;
- priority and stacking group;
- duration or permanence;
- start/end simulation time;
- reversibility/removal policy;
- capability revalidation flags;
- migration treatment.

# 9. Health, Stamina and Fatigue Schemas

29B remains mechanic authority. 29J freezes the integration fields.

## 9.1 Health Runtime Core

- `current_health`
- `max_health_resolved`
- `health_band`
- `last_health_damage_time`
- `recovery_eligible`
- `recovery_suppression_reasons`
- `critical_condition`
- `stabilised`
- `biological_revision`

## 9.2 Stamina Runtime Core

- `current_stamina`
- `max_stamina_resolved`
- `regen_delay_until`
- `depletion_state`
- `stamina_modifier_bundle`
- `last_committed_cost_transaction_id`

## 9.3 Fatigue Runtime Core

- `fatigue_value` 0-100;
- fatigue band;
- accumulation sources;
- recovery sources;
- long-duration modifiers;
- last evaluated simulation time.

# 10. Nourishment, Hydration and Nutrition Schemas

## 10.1 NourishmentState

- satiety reserve;
- Hunger severity/band;
- starvation debt;
- nutrition rolling-window accumulator;
- Energy/Protein/Produce satisfaction;
- Variety score;
- current Nutrition score/band;
- last nourishment update time.

## 10.2 HydrationState

Hydration fields persist only when the world/profile enables the channel or when migration safety requires preserving dormant state:

- `thirst_enabled`;
- hydration reserve;
- Thirst severity/band;
- dehydration debt;
- hydration-demand modifiers;
- last hydration update time.

Disabled means **disabled**, not `ThirstLevel=0` by coincidence.

## 10.3 FoodBiologicalTraitFacet

Food/item owners supply:

- serving class;
- satiety contribution;
- hydration contribution;
- Energy/Protein/Produce contributions;
- variety/family tags;
- compatibility/unsafe-consumption tags;
- ingestion-exposure references;
- temporary biological-effect capabilities.

Set 29 does not own the item or recipe.

# 11. Environment, Wetness and Sleep Schemas

## 11.1 EnvironmentalExposureSnapshot

External environment provides a revisioned snapshot containing, as applicable:

- ambient thermal pressure/class;
- wind exposure;
- precipitation/contact state;
- solar/heat-source pressure;
- water contact/immersion category;
- shelter/enclosure context;
- magical/environmental hazard references;
- route/interior exposure summary;
- authoritative time window.

29D converts this into biological Thermal Load/Wetness/Sleep effects.

## 11.2 Thermal/Wetness Runtime

- thermal load/band/trend;
- principal cause references;
- Wetness 0-100 and wetness band;
- drying state;
- active protection snapshot revision;
- thermal injury exposure handoff state.

## 11.3 Sleep Runtime

- Sleep Pressure 0-100;
- awake duration;
- active sleeping/resting state;
- rest-site reference;
- sleep-quality snapshot;
- last sleep interval;
- interruption reason history where needed.

# 12. Injury, Wound, Bleeding and Pain Schemas

## 12.1 InjuryDefinition

Required groups:

- injury family;
- compatible body regions;
- trauma/severity thresholds;
- bleeding permissions/profile;
- pain contribution;
- functional impairment profile;
- stabilisation requirements;
- recovery ceilings;
- treatment capability requirements;
- complication hooks;
- difficulty modifiers;
- LOD/persistence class.

## 12.2 InjuryInstance

- persistent injury instance ID;
- definition ID;
- actor ID;
- semantic region;
- severity;
- regional trauma;
- wound state;
- bleeding class;
- recovery progress;
- stabilised/immobilised state;
- contamination/infection references;
- treatment history references;
- complication state;
- created/updated simulation times.

## 12.3 Blood Loss and Pain

Blood Loss and Pain are actor-level biological summaries with source references. They are not separate combat damage types.

# 13. Disease, Infection, Poison and Toxin Schemas

## 13.1 Disease Ownership Reconciliation

The kernel currently reserves the `disease` domain under Ecology. Set 29's governing contract assigns Disease gameplay to Set 29. These are reconciled by field/facet separation:

- 24F/Document 10 may own disease identity context, ecology, host/environment distribution and Atlas relationships;
- Set 29 owns executable exposure, establishment, stages, symptoms/modifiers, communicability, recovery, resistance interaction, treatment requirements and mutable actor/population disease state;
- world/creature systems provide exposure sources/contacts;
- no second disease runtime exists in ecology or creature AI.

This is an ownership **facet reconciliation**, not a duplicate domain or silent transfer of every disease field.

## 13.2 DiseaseDefinition Executable Facet

- disease family/tags;
- compatible host tags;
- transmission routes;
- exposure decay;
- establishment threshold;
- incubation profile;
- stage graph;
- severity rules;
- symptom/modifier bundles;
- communicability by stage;
- natural recovery;
- resistance/immunity rules;
- chronic/carrier permissions;
- treatment/diagnosis capability requirements;
- population LOD parameters.

## 13.3 ToxinDefinition

Toxins use the existing `status`/`effect` framework with Set 29-owned biological fields:

- toxin family;
- exposure routes;
- dose-to-load conversion;
- 0-100 load-band profile;
- onset/peak/elimination;
- modifier bundle;
- Health-deterioration schedule if any;
- accumulation/stacking policy;
- resistance tags;
- antidote/treatment requirements;
- complication hooks.

# 14. Treatment, Medicine and Rehabilitation Schemas

## 14.1 Treatment Capability, Not Duplicate Item

Medicine items, spells, staff and facilities expose capabilities. 29G resolves a treatment action through those capabilities.

Minimum `TreatmentCapability` fields:

- capability ID;
- target condition/family tags;
- allowed provider/self-treatment classes;
- required item/resource/tool capabilities;
- required facility/service capabilities;
- biological compatibility constraints;
- base action time;
- interruptibility;
- outcome payload template;
- saturation group/window;
- adverse/overuse exposure hooks;
- skill/quality scaling bounds;
- knowledge/diagnosis requirements.

## 14.2 TreatmentAction Runtime

- transaction ID;
- provider/patient;
- treatment capability ID;
- source item/spell/facility references;
- reserved resources;
- start/commit/completion times;
- interruption state;
- authoritative result envelope;
- submitted biological outcomes;
- audit/history reference.

## 14.3 Rehabilitation

Rehabilitation uses milestone progress, not repetitive grind counters. Physical activity requirements are supplied by Set 30 or relevant action owners; 29G owns whether a completed valid session advances recovery.

# 15. Protection, Compatibility and Integration Schemas

## 15.1 BiologicalProtectionBundle

A resolved bundle may contain:

- cold/heat mitigation;
- wetness ingress/drying support;
- contamination route protection;
- disease-route resistance;
- toxin-family resistance;
- environmental hazard protection;
- recovery support;
- profile/body compatibility;
- source trace and revision.

Protection composition is bounded and strongest-source/diminishing-aware; unlimited additive immunity stacking is prohibited.

## 15.2 EffectiveBiologicalProfileSnapshot

Cached runtime snapshot containing:

- base profile ID/version;
- active overlays;
- applicability flags;
- resolved baseline modifiers;
- body-region profile;
- diet/rest/treatment compatibility;
- susceptibility/resistance tags;
- current protection bundle revision;
- capability-summary revision.

# 16. Runtime State and Persistent Record Families

Set 29 runtime state is grouped by purpose rather than one enormous actor blob.

| Record Family | Persistence | Owner |
| --- | --- | --- |
| `BiologicalActorCoreState` | Always for persistent actors | 29B/29I service boundary |
| `NourishmentState` | Conditional/always for relevant persistent actors | 29C |
| `EnvironmentalBiologyState` | Consequential fields only | 29D |
| `InjuryInstance[]` | Always while unresolved/history-required | 29E |
| `DiseaseInstance[]` | Always while relevant | 29F |
| `DiseaseResistanceMemory` | Persistent where applicable | 29F |
| `PoisonInstance[]` | Persistent while active | 29F |
| `TreatmentAction/Plan` | Persistent while active/committed | 29G |
| `BiologicalProfileState` | Base ref + persistent overlays | 29H |
| `BiologicalSchedulerState` | Scheduled milestones/reconciliation metadata | 29I |
| `BiologicalTransactionJournal` | Bounded persistence | 29I |
| `BiologicalKnowledgeState` | Persistent only where knowledge system requires | 29I/knowledge owner boundary |

Transient HUD interpolation, temporary caches and derived percentages are not saved as authoritative truth.

# 17. Population and Cohort Summary Schemas

Population simulation must preserve real causes while reducing detail.

## 17.1 PopulationHealthSummary v1.0

Required fields:

- settlement/region/cohort ID;
- summary revision;
- authoritative simulation time;
- population count and profile composition;
- hunger/nutrition coverage;
- hydration coverage when enabled;
- exposure/sleep satisfaction;
- injury burden and expected downtime;
- disease/outbreak burden;
- poison/toxin burden where relevant;
- care/treatment backlog;
- medical resource demand classes;
- workforce capacity modifier;
- named protected-case references/count;
- confidence/coverage and aggregation reason.

Set 27 may consume this summary but may not write it.

## 17.2 Cohort Grouping Dimensions

Default grouping may use only dimensions that materially affect biological outcome:

- Biological Profile family;
- broad age/life-stage only if gameplay content later requires it;
- significant disease/injury class;
- work/exposure group;
- treatment/access group;
- location/service-access band.

Culture, wealth, faction or profession must not become biological grouping dimensions unless they change actual exposure/resources through their owning systems.

# 18. Definitions, Runtime State, Snapshots and Derived Values

A recurring implementation error would be to treat every convenient value as authoritative. 29J locks the following separation:

| Value Type | Example | Rule |
| --- | --- | --- |
| Definition | Disease incubation profile | Immutable registry data. |
| Runtime State | Actor disease stage | Mutable only by Set 29 authority. |
| Derived Value | HealthPercent | Recomputed from authoritative state. |
| Snapshot | BiologicalCapabilitySummary | Read-only, revisioned consumer view. |
| Cache | Effective modifier bundle | Disposable/rebuildable from source refs. |
| History | Treatment result event | Append-only evidence; not mutable state. |
| UI State | Expanded status panel | Presentation-only; never biological truth. |

# 19. Canonical Survival API v1.0

The public interface identity is:

`leyforge.system.interface.survival`

Interface version: **1.0**.

The nine names in the Cross-Set Interface Register remain mandatory compatibility endpoints:

- `HungerLevel()`
- `ThirstLevel()`
- `BodyTemperature()`
- `InjuryState()`
- `DiseaseState()`
- `PoisonLevel()`
- `Fatigue()`
- `StaminaModifier()`
- `CarryPenalty()`

29J adds structured query groups but does not rename those endpoints.

## 19.1 API Principles

1. Queries are side-effect free.
2. Commands carry transaction IDs where duplicate execution matters.
3. Consumers receive semantic values plus reason/source references where useful.
4. Raw internal arrays are not exposed when a stable summary contract exists.
5. Hidden biological knowledge is filtered by caller permission/knowledge context.
6. Disabled channels return an explicit disabled/applicability state.
7. API results carry revision/time information when staleness matters.
8. Cross-set consumers cannot mutate biological fields directly.

# 20. Query Interface

## 20.1 Core Actor Queries

Canonical names:

- `CurrentHealth(actor_id)`
- `MaxHealth(actor_id)`
- `HealthPercent(actor_id)`
- `HealthBand(actor_id)`
- `CurrentStamina(actor_id)`
- `MaxStamina(actor_id)`
- `StaminaPercent(actor_id)`
- `Fatigue(actor_id)`
- `HungerLevel(actor_id)`
- `ThirstLevel(actor_id)`
- `NutritionStatus(actor_id)`
- `BodyTemperature(actor_id)`
- `Wetness(actor_id)`
- `SleepPressure(actor_id)`
- `InjuryState(actor_id)`
- `DiseaseState(actor_id)`
- `PoisonLevel(actor_id)`
- `RecoveryStatus(actor_id)`
- `CareNeed(actor_id)`
- `TreatmentUrgency(actor_id)`
- `CriticalCondition(actor_id)`
- `Stabilised(actor_id)`
- `RecoveryPossible(actor_id)`

## 20.2 Capability/Modifier Queries

- `StaminaModifier(actor_id)`
- `StaminaDrainModifier(actor_id)`
- `ExertionLimit(actor_id)`
- `CarryPenalty(actor_id)`
- `FatigueMovementModifier(actor_id)`
- `InjuryMovementModifier(actor_id)`
- `ManualFunction(actor_id)`
- `MobilityFunction(actor_id)`
- `HeadFunction(actor_id)`
- `CoreFunction(actor_id)`
- `WorkCapacityModifier(actor_id)`
- `CanTravelBiologically(actor_id)`
- `BiologicalCapabilitySummary(actor_id)`

## 20.3 Care and Demand Queries

- `FoodDemandProfile(actor_or_population_id)`
- `MedicalDemand(actor_or_population_id)`
- `ExpectedInjuryDowntime(actor_or_cohort_id)`
- `ExpectedDiseaseDowntime(actor_or_cohort_id)`
- `DiseaseWorkforceImpact(population_id)`
- `PopulationHealthSummary(settlement_or_region_id)`
- `OutbreakBurden(settlement_or_region_id)`
- `PopulationTreatmentDemand(settlement_id)`

## 20.4 Runtime/Visibility Queries

- `BiologicalSnapshotRevision(actor_or_cohort_id)`
- `BiologicalKnowledgeVisibility(actor_id, subject_ref, caller_context)`
- `BiologicalReconciliationState(actor_or_cohort_id)`
- `RecoveryReasonTrace(actor_id)`

# 21. Command and Transaction Interface

External systems request biological changes through validated commands.

## 21.1 Core Commands

- `ApplyResolvedBiologicalDamage(request)`
- `ApplyResolvedBiologicalTrauma(request)`
- `TrySpendStamina(request)`
- `ApplyFatigueDelta(request)`
- `ApplyConsumedServing(request)`
- `ApplyBiologicalExposure(request)`
- `ApplyToxinExposure(request)`
- `StartTreatment(request)`
- `CancelTreatment(request)`
- `CompleteTreatment(request)`
- `SubmitBiologicalHealingRequest(request)`
- `SubmitBloodRestorationRequest(request)`
- `ApplyRestInterval(request)`
- `ApplyMovementExertionContext(request)`
- `ApplyProfileOverlay(request)`
- `RemoveProfileOverlay(request)`

## 21.2 Transaction Requirements

Any command that can consume resources or cause persistent consequence includes:

- transaction/command ID;
- actor/target IDs;
- source system/interface ID;
- authoritative simulation time;
- expected prior revision when conflict-sensitive;
- source definition/instance references;
- payload;
- permission/authority context;
- result code;
- resulting revision;
- audit/history reference where needed.

Duplicate committed transaction IDs return the original result rather than executing twice.

# 22. Economy Interface Contract

Set 29 exposes biological demand, never price.

## 22.1 Set 29 -> Set 27

- `FoodDemandProfile()`
- `MedicalDemand()`
- `WorkCapacityModifier()`
- `ExpectedInjuryDowntime()`
- `DiseaseWorkforceImpact()`
- `PopulationHealthSummary()`
- treatment backlog/resource-demand classes.

## 22.2 Set 27 -> Set 29

Set 29 may receive external information for UI/decision context only, such as:

- medical item price;
- hospital/service cost;
- food scarcity/availability;
- trade shortage state.

Those values do not alter biological formulas unless a real resource/service availability consequence occurs through the appropriate owner.

# 23. Social and Companion Interface Contract

## 23.1 Set 29 -> Set 28

- injury/illness summary;
- `CareNeed()`;
- `TreatmentUrgency()`;
- `RecoveryStatus()`;
- Fatigue/survival mood modifier;
- care requested/received/failed result;
- non-hidden contagion/social-risk information;
- travel-readiness summary.

## 23.2 Set 28 -> Set 29

- provider/companion care commitment;
- doctor/healer interaction outcome;
- consent/relationship-gated willingness;
- named biological priority hint;
- social morale/support capability where a concrete biological modifier is explicitly defined.

Set 29 does not decide friendship, affection, loyalty, refusal reasons or dialogue.

# 24. Movement and Travel Interface Contract

## 24.1 Set 30 -> Set 29

- `CurrentMovementMode()`;
- committed activity/intensity event;
- load/carry context;
- sprint/climb/swim/ride/vehicle usage state;
- distant travel duration/intensity/rest/exposure summary;
- route/interior support references.

## 24.2 Set 29 -> Set 30

- `StaminaModifier()`;
- `StaminaDrainModifier()`;
- `ExertionLimit()`;
- `CarryPenalty()`;
- fatigue/injury/thermal/disease/poison movement-affecting modifiers;
- `CanTravelBiologically()`;
- revision/effective time.

Set 30 remains the sole owner of actual MaxSpeed, movement state machine, pathfinding, mounts and vehicle handling.

# 25. Existing-System Integration Contracts

## 25.1 Combat

Combat submits resolved damage/trauma/poison exposures after its own armour/defence/action resolution. Set 29 updates biological state and returns modifiers/critical state. Set 29 does not recalculate the attack.

## 25.2 Items and Recipes

Items/recipes own identity, stacks, durability, crafting, cooking and preservation. They expose biological trait/capability facets and committed consumption results.

## 25.3 Worldgen and Weather

World systems own climate/weather/hazard source. They expose environmental snapshots; 29D/29F resolve biological effects.

## 25.4 Settlements

Settlement/building systems own service existence, staff, stock and network functionality. Set 29 consumes effective capability and returns demand/suitability/health burden.

## 25.5 Magic

Magic validates cast, mana and effect activation first. It then emits biological treatment/protection/exposure/profile-overlay capability. Set 29 never charges mana.

## 25.6 Maritime

Set 26 supplies aquatic exposure/interior capability and retains breath/drowning/pressure specialist ownership. Set 29 persists resulting general biological state.

# 26. API Versioning, Results and Error Semantics

## 26.1 Interface Versioning

The interface qualified ID remains stable. Compatibility version is metadata:

- major version changes when meaning/signature incompatibly changes;
- minor version adds optional backward-compatible fields/endpoints;
- patch fixes documentation/validation without semantic change.

## 26.2 Standard Result Codes

Recommended shared result classes:

- `ok_committed`
- `ok_no_change`
- `rejected_invalid_target`
- `rejected_inapplicable_channel`
- `rejected_missing_capability`
- `rejected_permission`
- `rejected_stale_revision`
- `rejected_invalid_state`
- `rejected_definition_mismatch`
- `retry_reconciliation_pending`
- `duplicate_returning_prior_result`
- `failed_migration_required`

Human-readable UI text is not stored in these codes.

# 27. Balance Philosophy and Numeric Conventions

Set 29 values are game-system values, not claims of medical realism.

## 27.1 Numeric Rules

- 0-100 scales are preferred for readable bounded states.
- Percent-of-maximum is preferred for Health restoration/deterioration across profile variation.
- Multipliers normally use 1.00 as neutral.
- Common biological modifier stacking uses bounded composition rather than unrestricted multiplication.
- Rates use simulation time, never wall-clock time.
- Standard values are references; content can override only through registered fields and validation bounds.
- Extreme authored content may exceed normal bounds only with explicit rarity/risk/counterplay and test evidence.

## 27.2 Player-Trust Rules

- ordinary safe play should not generate random disease;
- a brief sprint should not consume a meal's worth of Hunger;
- one wet minute should not create an illness;
- a minor scratch should not demand hospitalisation;
- one potion should not reset every injury/disease/poison state;
- distance/LOD must not heal or kill actors for free;
- accessibility settings must not be confused with hidden difficulty changes.

# 28. Standard Reference Balance Baseline

The table below consolidates the v0.1 Standard references. Specialist documents remain formula authority.

| System | Standard Reference |
| --- | --- |
| Health | 100-point human-readable reference baseline. |
| Natural Health Recovery Delay | 20 simulation seconds after latest resolved Health damage, if eligible. |
| Natural Health Recovery | 0.10% Max Health/sec in ordinary safe recovery before modifiers. |
| Stamina | 100-point reference baseline. |
| Stamina Regen | 16% Max Stamina/sec after delay. |
| Stamina Regen Delay | 1.25 sec ordinary spend; 2.25 sec after depletion to zero. |
| Biological Stamina Cost Multiplier Clamp | Normally 0.50x-2.00x before exceptional authored effects. |
| Stamina Regen Modifier Clamp | Normally 0.35x-1.50x before specialist abilities. |
| Fatigue | 0-100; no direct Standard death/unconsciousness merely from max Fatigue. |
| Hunger | +4 severity/hour baseline; ~25 h full-to-max before modifiers. |
| Starvation Debt | First 6 h at Hunger 100 no direct Health loss; >6-24 h 0.5% Max Health/h; >24 h 1%/h. |
| Nutrition | Rolling 48 h, weighted toward recent 24 h; Energy/Protein/Produce + Variety. |
| Thirst | Disabled by default in Standard. |
| Thirst When Enabled | +5 severity/hour; ~20 h full-to-max before modifiers. |
| Dehydration Debt | First 2 h at max no direct loss; >2-8 h 1% Max Health/h; >8 h 2%/h. |
| Thermal Mild/Moderate/Severe/Extreme Pressure | 0.15 / 0.50 / 1.50 / 4.00 Thermal Load points per minute baseline. |
| Sleep Pressure | +3.2 points/hour awake; Drowsy around 16 h; full normal sleep target ~7-9 h. |
| Regional Trauma Decay | 4 points/min after 30-sec calm delay when no unstable injury requires persistence. |
| Natural Blood-Loss Restoration | ~3 points/simulation hour under safe conditions before modifiers. |
| Minor Injury Recovery | 20%/h (~5 h baseline). |
| Moderate Injury Recovery | 8%/h (~12.5 h baseline). |
| Severe Injury Recovery | 2%/h (~2 days baseline). |
| Critical Injury Recovery | 0.8%/h (~5 days baseline). |
| Disease Exposure Establishment Reference | Common parent threshold around 60 effective exposure; definition-specific. |
| Routine Disease Mild Modifier Bounds | Stamina regen 0.90-1.00x; cost 1.00-1.10x; fatigue 1.00-1.10x; Health recovery 0.85-1.00x. |
| Basic Bandage | 3-5 sec Standard action time. |
| Wound Cleaning | 5-8 sec. |
| Basic Splint | 6-10 sec. |
| Standard Restorative | 10-18% Max Health over ~8-15 sec, no automatic cure of injuries/disease/poison. |
| Restorative Saturation | 1.00x first; ~0.65x repeat within ~30 sec; ~0.35x further repeat; clears toward full over ~60-90 sec. |
| Playable Inherent Broad Modifiers | Normally about 0.80x-1.25x; Max Health/Stamina inherent range normally about 0.90x-1.10x. |

# 29. Difficulty and World-Preset Scaling

One ruleset supports all presets.

| Channel | Peaceful | Relaxed | Standard | Harsh |
| --- | --- | --- | --- | --- |
| Hunger | Mostly beneficial/low pressure; no starvation damage | Slow, no starvation damage by default | Full reference | Faster/stronger within bounds |
| Thirst | Off | Off | Off | On by default |
| Temperature | Warning/comfort focused | Reduced accumulation | Full reference | Faster accumulation/stronger consequences |
| Wetness | Mostly contextual | Reduced | Full contextual | Stronger cold/recovery impact |
| Sleep | Optional | Very soft | Soft requirement | Stronger pressure |
| Fatigue | Minimal | Reduced | Full | Stronger accumulation |
| Disease | Rare/reduced | Reduced | Uncommon/source-driven | Higher exposure/stronger consequences |
| Injury Persistence | Light | Reduced | Moderate | Stronger/longer |
| Poison | Reduced | Reduced | Full | Stronger within authored bounds |
| Natural Recovery | Faster | Moderately faster | Reference | Slower/stricter eligibility |
| Treatment Need | Minor issues forgiving | Forgiving | Meaningful | More important |

Custom worlds may tune individual channels. A preset changes registered parameter groups, not code ownership.

# 30. Modifier Composition, Ordering and Clamps

## 30.1 Recommended Evaluation Order

1. base definition/profile value;
2. difficulty/world-profile modifier;
3. persistent biological profile/heritage modifier;
4. progression/perk modifier from external owner;
5. equipment/protection result;
6. environment/activity context;
7. active condition modifiers;
8. treatment/rest support;
9. bounded composition/clamp;
10. final semantic result + cause trace.

## 30.2 Stacking Rules

- multiplicative modifiers combine in declared groups;
- identical stacking groups use strongest-source or diminishing composition where defined;
- additive 0-100 state changes clamp to valid range;
- immunities require explicit applicability or narrow authored capability;
- generic resistance cannot silently become universal immunity;
- reason traces keep the top meaningful contributors for UI/debugging.

# 31. Content Authoring and Completeness Contract

A Set 29 definition cannot advance to Data Ready merely because it has a name and effect text.

## 31.1 Universal Biological Completeness

Every selectable/shipping biological definition must declare, where applicable:

- identity/schema/owner;
- source/provenance;
- applicability/compatibility;
- gameplay rules and state transitions;
- interaction/capability requirements;
- difficulty behaviour;
- LOD/persistence class;
- UI/knowledge visibility requirements;
- multiplayer authority;
- migration/deprecation policy;
- automated validators;
- representative gameplay test fixture;
- balance rationale/range;
- production status.

## 31.2 Family-Specific Completeness

Disease additionally requires transmission/host/stage/recovery/treatment. Injury requires region/severity/bleeding/pain/recovery/treatment. Treatment requires provider/resources/facility/outcome/atomic transaction behaviour. Profiles require applicability/body/diet/rest/resistance/treatment compatibility. Missing mandatory fields block compilation or status advancement according to Set 25 severity.

# 32. Validation Architecture

Set 29 validation is layered:

1. schema/identity validation;
2. semantic definition validation;
3. relationship/capability validation;
4. deterministic runtime simulation tests;
5. cross-system contract tests;
6. save/load/migration/recovery tests;
7. multiplayer authority/idempotency tests;
8. LOD equivalence tests;
9. accessibility/knowledge tests;
10. scale/performance evidence;
11. exploit/regression suites.

# 33. Definition and Registry Validation

Mandatory validator classes include:

- qualified ID/domain/schema validity;
- field ownership collision detection;
- unresolved hard references;
- incompatible profile/body-region references;
- invalid 0-100 thresholds/ranges;
- impossible stage graphs or circular transitions;
- treatment capability with no provider/resource path where required;
- disease with no valid host/source/LOD contract;
- toxin with no elimination or terminal rule;
- injury with impossible recovery/treatment contract;
- profile that creates prohibited broad immunity or exceeds playable bounds without approval;
- world preset enabling a channel without required UI/save/schema support;
- external facet attempting to write Set 29 runtime fields.

# 34. Runtime and Simulation Validation

Required deterministic tests include:

- Health recovery delay and eligibility;
- Stamina spend/regeneration/depletion;
- Fatigue accumulation/recovery;
- Hunger baseline and starvation debt;
- Thirst disabled state and enabled hydration baseline;
- nutrition rolling window;
- thermal exposure/protection/wetness;
- Sleep Pressure accumulation/restoration;
- injury creation, bleed, stabilisation and recovery ceilings;
- disease exposure, incubation, stage progression and recovery;
- toxin accumulation/elimination;
- treatment atomicity, interruption and saturation;
- profile overlays and revalidation;
- LOD promotion/demotion/catch-up equivalence.

A fixed seed + fixed inputs must produce the same biological result regardless of frame rate.

# 35. Cross-System Contract Validation

Representative tests must prove:

- Combat damage creates exactly one Health/trauma outcome;
- Set 30 sprint/climb events charge Stamina exactly once;
- food purchase + consumption cannot duplicate the item or biological effect;
- Set 28 companion care can trigger treatment but not directly cure state;
- Set 27 sees health demand without writing disease/Hunger;
- settlement clinic loses treatment throughput when staff/medicine/water become unavailable;
- weather changes exposure without directly mutating body state;
- magic healing respects treatment/injury/disease boundaries;
- vessel/vehicle interior support affects exposure through capabilities only;
- quest/UI consumers cannot reveal hidden diagnosis without knowledge permission.

# 36. Persistence, Migration and Multiplayer Validation

Mandatory cases:

- save during active bleed/injury/disease/poison/treatment;
- save with Thirst disabled and later load under same/different world profile;
- profile definition revision and overlay migration;
- missing optional biological content pack with quarantine/recovery behaviour;
- duplicate network consumption/treatment request;
- stale snapshot rejection;
- reconnect during treatment;
- LOD actor promotion after long elapsed simulation time;
- local application closure causes no wall-time starvation/death;
- persistent-server policy applies only while world authority genuinely advances time;
- old definition IDs resolve through approved alias/migration, never nearest-name substitution.

# 37. Accessibility, Knowledge and Explainability Validation

A shipping build must demonstrate:

- all Critical biological states have text/shape and optional audio/haptic channels;
- no disease, pain, poison or thermal mechanic requires blur, camera shake, flashing, input inversion or colour alone;
- presentation accessibility remains personal in multiplayer;
- mechanical assists obey world/server authority policy;
- hidden disease/toxin names remain hidden until observable/diagnosed;
- cause traces explain major deterioration and blocked recovery;
- notifications are deduplicated and do not spam per tick;
- controller and screen-reader metadata are complete for biological view models.

# 38. Performance, LOD and Scale Evidence

29J deliberately does not invent hard hardware budgets. Those require measured Godot evidence. Set 29 does require that implementation demonstrate:

- active actor processing cost;
- 100/500/1,000+ simulated NPC cohort scaling appropriate to the production slice;
- disease/outbreak batch cost;
- biological save-size growth;
- replication size/frequency by priority;
- LOD promotion/demotion spikes;
- catch-up of large elapsed simulation intervals;
- treatment/population throughput simulation;
- no per-frame full registry/profile recomposition;
- no per-NPC per-bite simulation in distant city cohorts.

Failing measured budgets triggers LOD/data-layout optimisation, not silent gameplay deletion.

# 39. Exploit and Regression Suite

Required regression categories:

- rapid eat/drink retry duplication;
- heal-potion spam bypassing saturation;
- save/reload to clear starvation/fatigue/poison;
- unload/reload to heal injuries;
- disconnect/reconnect to cancel treatment costs after receiving benefit;
- repeated movement packet causing duplicate Stamina drain;
- vehicle/mount entry resetting exposure/fatigue;
- profile transformation resetting injuries/disease;
- Thirst-disabled worlds secretly accumulating hydration debt;
- wetness directly spawning disease;
- wrong antidote curing unrelated toxin;
- economy buying medicine directly setting Health;
- social companion relationship directly setting RecoveryStatus;
- UI/client writing biological values;
- stale network snapshot overriding newer condition state;
- population aggregation creating or deleting food/medicine demand.

# 40. Cross-Set Interface Amendment Reconciliation

AM-29-001 through AM-29-100 are adopted as the Set 29 v0.1 interface backlog for the final Sets 27-30 integration pass. Later refinements/adoptions supersede earlier wording only where they clarify the same interface; they do not erase the historical amendment ID.

Key reconciliation outcomes:

- movement activity is event/envelope based and Set 30-owned;
- biological modifiers are revisioned Set 29 snapshots consumed by Set 30;
- Set 28 receives care/recovery summaries and may request/commit social care actions;
- Set 27 receives versioned population health/demand summaries;
- one authoritative world-time reference supports all four sets;
- one idempotent transaction envelope prevents cross-set duplicate side effects;
- profile changes trigger equipment/movement/aquatic revalidation;
- Set 26 versus Set 30 swimming ownership remains an external unresolved integration item;
- Disease identity/facet ownership requires Set 25 registration, resolved by AM-29-101 below.

# 41. Final Interface Amendments AM-29-101 to AM-29-110

## AM-29-101 - Disease Executable-Facet Ownership Reconciliation

**25B/25C/24F/Document 10 <-> Set 29**

Keep the registered `disease` identity domain. Atlas/ecology may own ecological identity/context/distribution fields. Set 29 owns the executable biological disease facet and all mutable actor/population disease state. Validators reject duplicate gameplay fields or a second disease runtime.

**Ownership transfer:** none. This clarifies facet ownership under the one-identity/multiple-facets model.

## AM-29-102 - Canonical Survival Interface Registration

**Set 29 -> Set 25/Document 18/Sets 27-30**

Register `leyforge.system.interface.survival` with interface version 1.0 and the mandatory Cross-Set endpoints plus the approved extended query/command groups in Sections 19-21.

## AM-29-103 - Biological Status/Profile Definition Mapping

**Set 29 -> 25C**

Use existing `status` plus registered biological schemas for injury, toxin and reusable Biological Profile definitions. No new top-level `biology`, `injury`, `toxin` or `treatment` domain is created by Set 29. Treatment actions use `action`; biological hazards use `hazard` facets.

## AM-29-104 - Canonical Population Health Summary Envelope

**Set 29 -> Set 27/Set 28/Settlement/Quest authorised consumers**

Freeze one revisioned PopulationHealthSummary envelope with count/profile coverage, food/medical demand, workforce capacity, injury/disease/outbreak burden, treatment backlog, protected named cases and authoritative time.

## AM-29-105 - Unified Biological Modifier Bundle

**Set 29 -> Combat/Set 30/AI/Workforce consumers**

Consolidate stamina, recovery, fatigue, movement-affecting and work-capacity modifier outputs into a source-traceable, revisioned bundle while retaining the named compatibility query endpoints. Consumers may cache but not edit the bundle.

## AM-29-106 - Unified Biological Transaction Result Envelope

**Set 29 <-> Inventory/Combat/Magic/Set 28/Set 30**

All persistent biological commands return a standard result with transaction ID, commit status, reason code, prior/result revision, resource-commit reference, biological outcome references and authoritative time.

## AM-29-107 - Survival World-Profile Settings Interface

**World Settings owner -> Set 29/UI/Server Authority**

Expose the resolved Peaceful/Relaxed/Standard/Harsh/Custom biological parameter profile, Thirst enable state, mechanical assist policy and revision. Set 29 applies it; it does not own the main world-creation/settings UI.

## AM-29-108 - Biological Save/Manifest Schema Registration

**Set 29 -> Set 25D/Document 18**

Register biological actor/cohort runtime record schemas, definition/profile versions, active condition IDs, scheduled milestones, transaction-journal policy and migration requirements in the world/save manifest. File format remains technical-owner responsibility.

## AM-29-109 - Set 29 Biological Completeness Contract

**Set 29 -> Set 25C/25E**

Register the completeness requirements from Section 31 so Disease/Injury/Toxin/Treatment/Profile content cannot reach Data Ready without gameplay, state, LOD, persistence, capability and validation coverage.

## AM-29-110 - Set 29 Interface Freeze and Compatibility Versioning

**Set 29 -> Sets 27/28/30 and authorised consumers**

After final integration approval, Survival interface v1.x may add optional compatible fields but may not rename/redefine the nine governing Cross-Set API endpoints or change ownership semantics without a recorded major-version amendment and migration review.

# 42. Remaining External Decisions

The following are not blockers to completing Set 29 v0.1 because they are owned externally or require implementation evidence:

| ID | Remaining Decision | Owner |
| --- | --- | --- |
| EXT-29-001 | Final Set 26 versus Set 30 ownership of swimming locomotion. | Sets 26/30 final integration. |
| EXT-29-002 | Exact Godot service/resource class names and binary/save layout. | Rewritten Document 18. |
| EXT-29-003 | Exact scheduler cadence and CPU/network/save budgets. | Document 18 + 25E profiling. |
| EXT-29-004 | Default official-server offline-player policy. | Multiplayer/world settings authority. |
| EXT-29-005 | Final public multiplayer mechanical accessibility policy. | Product/multiplayer settings authority. |
| EXT-29-006 | Exact first-release playable ancestry roster. | Atlas/production classification/Ash. |
| EXT-29-007 | Whether permanent Biomancy transformations ship Core or later. | Document 09/Set 25 classification/Ash. |
| EXT-29-008 | Whether authored food intolerance/allergy traits ship in Core. | Production classification; not required by Set 29 Core. |
| EXT-29-009 | Exact Health/Status UI screen layout and character-creation presentation. | Document 17 revision. |
| EXT-29-010 | Exact city-scale cohort grouping after profiling. | 29I implementation tuning; must remain within Section 17 constraints. |

# 43. Production Handoff and Required Document Revisions

29J closes Set 29 design, but downstream sources must consume it.

## 43.1 Required Revisions

- Document 02: point survival/derived-resource details to Set 29; preserve progression ownership only.
- Document 04/05 replacements: add canonical biological trait/treatment capability facets, not duplicate formulas.
- Document 07/20: consume population Health/medical demand and treatment-capacity contracts.
- Document 09: route biological magic through AM-29-073/058/064 and profile overlays.
- Document 10/24F: separate disease ecology/context from Set 29 executable disease facet.
- Document 11 replacement: emit environmental exposure snapshots rather than body-state mutations.
- Document 15: use Set 29 event/query outputs; no duplicate illness quest state.
- Document 16: route resolved trauma/damage/poison through Set 29; retain combat/downed/death ownership.
- Document 17: consume biological view models, knowledge visibility and accessibility policy.
- Document 18 rewrite: implement Registry Service bindings, biological authority, scheduler, persistence, networking and tests.
- Set 25B-25E: register schemas/interfaces/completeness and migration/validation rules.
- Sets 27/28/30: adopt final AM-29 interface contracts during the cross-set reconciliation pass.

## 43.2 Implementation Order

Recommended implementation sequence:

1. schema/interface registration and generated data types;
2. Health/Stamina/Fatigue core;
3. Hunger/Temperature/critical HUD surfaces;
4. Injury/bleeding/treatment transaction spine;
5. disease/toxin exposure framework;
6. profile/protection integration;
7. population/LOD summaries;
8. persistence/multiplayer/reconciliation;
9. full accessibility/explainability;
10. content expansion and balance tuning.

# 44. Set 29 Definition of Done

Set 29 is production-ready at the **design-contract level** when all of the following are true:

- 29A-29J are in the active-source manifest;
- no two documents claim mutable ownership of the same biological field;
- the Cross-Set Interface Register is preserved;
- AM-29-001 through AM-29-110 are reviewed in the final Sets 27-30 integration pass;
- 25B/25C accept the schema/interface/facet registrations;
- Disease executable-facet ownership is registered without duplicate runtime state;
- Survival API v1.0 compiles with all mandatory endpoints;
- Standard balance fixtures reproduce the reference values in Appendix C;
- Peaceful/Relaxed/Harsh are parameter profiles over the same code path;
- save/load/LOD do not erase or duplicate biological consequence;
- multiplayer authority prevents client-authored healing/consumption/disease changes;
- transaction idempotency covers food, medicine, healing, poison, movement Stamina and treatment;
- population summaries conserve actual food/medical/service causes;
- UI/knowledge contracts prevent hidden diagnosis leaks;
- accessibility does not depend on motion, blur, flash, colour or audio alone;
- representative city/outbreak/LOD tests meet measured technical budgets or produce an explicit optimisation blocker;
- all unresolved external decisions remain recorded rather than silently invented.

## 44.1 Set 29 Acceptance Gate

| Gate | Pass Condition |
| --- | --- |
| Ownership | One mutable truth for every biological field; external systems use commands/queries only. |
| Registry | Full qualified IDs, registered schemas/facets, no ad hoc domain. |
| Gameplay | All specialist mechanics have deterministic runtime/state contracts. |
| Balance | Standard reference values and preset scaling are reproducible. |
| Cross-System | Economy/Social/Movement/Combat/World/Items/Magic/Settlements integrate without duplicate ownership. |
| Persistence | Consequential state survives save/LOD/migration safely. |
| Multiplayer | Authority, replication revision and idempotency are testable. |
| Accessibility | Critical state is understandable through multiple channels and personal presentation settings. |
| Scale | Cohorts preserve consequence and measured performance is acceptable for selected production targets. |
| Production | Validators, fixtures, migration policy and source manifest are complete. |

# 45. Set 29 Completion Statement

> **Document Set 29 Completion Statement**  
> Leyforge now has a complete Survival, Health and Biological Systems architecture from immediate player needs through injuries, disease, medicine, biological diversity, settlement healthcare, distant-population simulation, multiplayer authority and production validation. The system remains deep enough to make food, shelter, medicine, preparation and civilisation services matter, but it is deliberately bounded so survival does not become a constant meter-maintenance game. Economy, Social and Movement systems remain externally owned and interact through stable interfaces. Set 29 can now move into final cross-set reconciliation, registry registration, prototyping and implementation rather than additional foundational design.

# Appendix A. Canonical Registry Family Matrix

| Family | Primary Schema/Domain | Definition Owner | Runtime Owner | Key External Providers |
| --- | --- | --- | --- | --- |
| Biological Profile | `status` + biological_profile schema | Set 29 | Set 29 profile service | Ancestry/Entity/Creature refs |
| Biological Regions | biological_region_profile schema | Set 29 | Set 29/Entity mapping cache | Entity Forge mapping |
| Health/Stamina/Fatigue | biological_runtime_state | Set 29 | 29B service | Combat, Progression, Movement |
| Nourishment | biological_runtime_state/nourishment facet | Set 29 | 29C service | Items, Recipes, Settlements |
| Environment/Sleep | biological_runtime_state/exposure facet | Set 29 | 29D service | Worldgen, Buildings, Equipment |
| Injury | `status.injury` | Set 29 | 29E service | Combat/Environment trauma |
| Disease | `disease` + disease_biology facet | Identity/context split; gameplay Set 29 | 29F service | Ecology/World/Creature contacts |
| Toxin | `status.toxin` / effect facet | Set 29 gameplay facet | 29F service | Creature/Item/Hazard source |
| Treatment | `action.treatment` + capability | 29G gameplay facet | 29G service | Items, Magic, Staff, Facility |
| Protection | capability/effect/source facet | Source owner + 29H composition | Set 29 cached bundle | Equipment/Magic/Structure/Vehicle |
| Population Health | population_health_summary schema | Set 29 | 29I/cohort service | Settlement/service/resource inputs |
| LOD/Persistence | `lod_profile`/schema/authority_profile | 29I + technical owners | Technical + Set 29 authority | World/session/save/network |

# Appendix B. Survival API v1.0 Reference

## B.1 Mandatory Cross-Set Queries

| Endpoint | Returns | Primary Consumers |
| --- | --- | --- |
| `HungerLevel()` | severity/band/trend + disabled/applicability state | UI, AI, Set 27 |
| `ThirstLevel()` | enabled/applicability + severity/band/trend | UI, AI |
| `BodyTemperature()` | thermal band/direction/severity/trend/cause refs | UI, Set 30, Combat/AI |
| `InjuryState()` | bounded injury summary + detail refs | Combat, Set 28, Set 30 |
| `DiseaseState()` | knowledge-filtered disease summary | Set 28, settlements, events, UI |
| `PoisonLevel()` | bounded overall toxin danger + active refs | Combat, treatment, UI |
| `Fatigue()` | 0-100/band/trend | Set 28, Set 30, AI |
| `StaminaModifier()` | revisioned biological stamina modifier | Combat, Set 30 |
| `CarryPenalty()` | physiological load penalty | Set 30 |

## B.2 Stable Extended Queries

`RecoveryStatus`, `CareNeed`, `TreatmentUrgency`, `CriticalCondition`, `Stabilised`, `RecoveryPossible`, `WorkCapacityModifier`, `FoodDemandProfile`, `MedicalDemand`, `PopulationHealthSummary`, `BiologicalCapabilitySummary`, `BiologicalSnapshotRevision`, `BiologicalKnowledgeVisibility` and `BiologicalReconciliationState` are the recommended stable v1.x extended surface.

# Appendix C. Standard Balance Reference Tables

## C.1 Hunger Bands

| Band | Stamina Regen | Stamina Cost | Health Recovery | Fatigue Gain | Work Capacity |
| --- | ---: | ---: | ---: | ---: | ---: |
| Sated | 1.05x | 1.00x | 1.05x | 0.98x | 1.00x |
| Comfortable | 1.00x | 1.00x | 1.00x | 1.00x | 1.00x |
| Hungry | 0.95x | 1.00x | 0.95x | 1.03x | 0.97x |
| Very Hungry | 0.85x | 1.05x | 0.75x | 1.15x | 0.90x |
| Severe Hunger | 0.70x | 1.10x | 0.25x | 1.30x | 0.75x |
| Starving | 0.55x | 1.20x | 0.00x | 1.50x | 0.50x |

## C.2 Nutrition Bands

| Score | Band | Health Recovery | Stamina Regen | Fatigue Gain | Work Capacity |
| ---: | --- | ---: | ---: | ---: | ---: |
| 80-100 | Excellent | 1.05x | 1.05x | 0.95x | 1.02x |
| 60-79 | Good | 1.02x | 1.02x | 0.98x | 1.01x |
| 40-59 | Adequate | 1.00x | 1.00x | 1.00x | 1.00x |
| 20-39 | Poor | 0.90x | 0.92x | 1.08x | 0.92x |
| 0-19 | Depleted | 0.75x | 0.80x | 1.20x | 0.85x |

## C.3 Hydration Bands When Enabled

| Band | Stamina Regen | Stamina Cost | Health Recovery | Fatigue Gain | Work Capacity |
| --- | ---: | ---: | ---: | ---: | ---: |
| Hydrated | 1.03x | 1.00x | 1.00x | 0.98x | 1.00x |
| Dry | 1.00x | 1.00x | 1.00x | 1.00x | 1.00x |
| Thirsty | 0.95x | 1.00x | 0.95x | 1.05x | 0.97x |
| Dehydrated | 0.85x | 1.08x | 0.75x | 1.15x | 0.88x |
| Severe Dehydration | 0.70x | 1.15x | 0.35x | 1.35x | 0.70x |
| Critical Dehydration | 0.55x | 1.25x | 0.00x | 1.50x | 0.50x |

## C.4 Injury Recovery

| Severity | Base Recovery/h | Approximate Baseline |
| --- | ---: | --- |
| Minor | 20% | ~5 h |
| Moderate | 8% | ~12.5 h |
| Severe | 2% | ~2 days |
| Critical | 0.8% | ~5 days |

## C.5 First-Aid/Restorative References

| Capability | Standard Reference |
| --- | --- |
| Quick pressure/stabilise | 1.5-2.5 sec |
| Bandage/dressing | 3-5 sec |
| Wound cleaning | 5-8 sec |
| Basic splint | 6-10 sec |
| Simple medicine | 1.5-3 sec |
| Field assessment | 3-6 sec |
| Minor restorative | 5-10% Max Health over 8-15 sec |
| Standard restorative | 10-18% over 8-15 sec |
| Advanced restorative | 18-30% over 10-20 sec |
| Emergency magical heal | 15-30% Max Health, partly immediate |
| Long-term care boost | +10-30% natural recovery modifier |

# Appendix D. Validation Scenario Catalogue

The following minimum scenarios must exist as automated or deterministic integration fixtures before Set 29 is considered implementation-ready:

1. fresh Standard actor remains stable in safe settlement;
2. 25-hour Hunger reference;
3. starvation debt grace and Health loss;
4. Thirst disabled returns explicit disabled state;
5. Harsh/custom hydration depletion and dehydration debt;
6. nutrition rolling-window and variety handling;
7. safe Health natural recovery delay/rate;
8. Stamina cost idempotency and regeneration;
9. Fatigue accumulation/recovery under activity/rest;
10. cold/heat pressure and equipment mitigation;
11. Wetness worsens cold but does not spawn disease;
12. Sleep Pressure around 16-hour drowsy reference;
13. injury creation from resolved trauma;
14. bleeding stabilisation and Blood Loss;
15. fracture recovery ceiling until immobilised;
16. injury remains after Health restoration;
17. disease exposure below threshold decays;
18. disease exposure establishes deterministically above threshold;
19. transmission requires valid route/contact;
20. poison repeated dose accumulates and later clears;
21. wrong/incompatible antidote is rejected safely;
22. treatment consumes resources exactly once;
23. duplicate treatment transaction returns prior result;
24. healing does not auto-cure fracture/disease/poison;
25. restorative saturation reduces spam benefit;
26. biological profile changes applicable channels correctly;
27. non-biological actor does not receive fake Hunger/Disease;
28. mixed settlement identifies incompatible food/service coverage;
29. clinic loses throughput without medicine/staff/water;
30. Set 27 reads demand summary but cannot mutate state;
31. Set 28 care result creates social-consumable summary only;
32. Set 30 activity charges Stamina once and consumes modifiers;
33. LOD demotion/promotion preserves injury/disease;
34. large catch-up equals sequential milestone processing within tolerance;
35. local application closure does not apply wall-time starvation/death;
36. persistent-server offline policy is explicit and authoritative;
37. stale client snapshot cannot overwrite new state;
38. hidden disease identity remains hidden before diagnosis;
39. critical alerts remain understandable with colour/audio/motion disabled;
40. save during active treatment resumes/rolls back safely;
41. profile migration revalidates equipment/movement/aquatic capability;
42. missing content pack causes explicit migration/quarantine rather than silent substitution;
43. city population aggregation conserves food/medical/workforce totals;
44. outbreak LOD result matches bounded detailed fixture expectation;
45. no API consumer writes Set 29 mutable fields directly.

# Appendix E. Cross-System Dependency Matrix

| Consumer/Provider | Receives From Set 29 | Provides To Set 29 | Forbidden Duplication |
| --- | --- | --- | --- |
| Set 27 Economy | food/medical demand, workforce/downtime, population health | prices/scarcity/cost context | Hunger, disease, health |
| Set 28 Social | injury/illness/care/recovery/social-risk summaries | care commitment, social support, priority hints | dialogue/relationship in Set 29 |
| Set 30 Movement | stamina/carry/fatigue/injury/thermal modifiers, travel readiness | movement/activity/load/travel context | locomotion in Set 29 |
| Combat 16 | Health/injury/poison/critical results | resolved damage/trauma/exposure | attack/armour/death in Set 29 |
| Items/Recipes | biological result after committed consume/treatment | trait/capability/resource transactions | item/recipe definitions in Set 29 |
| Worldgen/Weather | biological exposure response | environmental snapshot | weather generation in Set 29 |
| Settlements | biological demand/suitability/outbreak/treatment backlog | real services/staff/stock/sanitation | abstract healing/food creation |
| Magic | biological state/treatment result | validated magical effect capability | cast/mana logic in Set 29 |
| UI | view models/alerts/visibility | input/inspection requests | gameplay state in UI |
| Technical 18 | owned schemas/state/scheduler requirements | authority/time/save/network runtime | gameplay formula ownership |

# Appendix F. Save and Migration Record Matrix

| Record | Save Requirement | Migration Rule |
| --- | --- | --- |
| Biological actor core | Always for persistent actors | versioned schema migration; never infer from UI state |
| Hunger/Nutrition | Persistent if applicable | legacy missing history receives neutral grace state |
| Hydration | Persist if enabled/relevant; preserve dormant state when needed | Standard legacy worlds remain Thirst-off unless profile says otherwise |
| Thermal/Wetness | persist consequential load/injury-related state; reconstruct harmless transient pressure | do not reset dangerous condition silently |
| Sleep/Fatigue | persist consequential pressure/fatigue | world-time references migrate explicitly |
| Injury instances | persist unresolved/history-required | definition alias/tombstone or explicit migration |
| Disease/Poison | persist active/resistance memory as required | no nearest-name replacement |
| Treatment | persist active committed transaction/reservations | resume, complete or roll back atomically |
| Profile/overlays | persist base ref + persistent overlays | applicability changes trigger AM-29-100 revalidation |
| Transaction journal | bounded persistence | retain enough IDs to prevent replay after recovery/reconnect |
| Population summary | persist when authoritative/distant | rebuild only from equivalent preserved causes, never invent health |

# Appendix G. Cross-Set Interface Amendment Register AM-29-001 to AM-29-110


| ID | Latest Recorded Title / Status | Final 29J Treatment |
| --- | --- | --- |
| AM-29-001 | AM-29-001 Refinement - Movement Exertion Interface | Adopt for final integration; later refinement wording takes precedence where applicable. |
| AM-29-002 | AM-29-002 - Social Care Interface | Adopt for final integration; later refinement wording takes precedence where applicable. |
| AM-29-003 | AM-29-003 Refinement - Economy Food Demand Interface | Adopt for final integration; later refinement wording takes precedence where applicable. |
| AM-29-004 | AM-29-004 Refinement - Combat/Biology Resource Transaction | Adopt for final integration; later refinement wording takes precedence where applicable. |
| AM-29-005 | AM-29-005 - Food and Medicine Definition Boundary | Adopt for final integration; later refinement wording takes precedence where applicable. |
| AM-29-006 | AM-29-006 - Environmental Exposure Interface | Adopt for final integration; later refinement wording takes precedence where applicable. |
| AM-29-007 | AM-29-007 - Death Boundary | Adopt for final integration; later refinement wording takes precedence where applicable. |
| AM-29-008 | AM-29-008 - Set 26 / Set 30 Aquatic Ownership Reconciliation | Adopt for final integration; later refinement wording takes precedence where applicable. |
| AM-29-009 | AM-29-009 - Population Health Summary Interface | Adopt for final integration; later refinement wording takes precedence where applicable. |
| AM-29-010 | AM-29-010 - Progression Derived-Resource Interface | Adopt for final integration; later refinement wording takes precedence where applicable. |
| AM-29-011 | AM-29-011 - Generic Healing Request Interface | Adopt for final integration; later refinement wording takes precedence where applicable. |
| AM-29-012 | AM-29-012 - Food Biological Trait Interface | Adopt for final integration; later refinement wording takes precedence where applicable. |
| AM-29-013 | AM-29-013 - Atomic Consumption Transaction Interface | Adopt for final integration; later refinement wording takes precedence where applicable. |
| AM-29-014 | AM-29-014 - Social Nourishment/Care Interface | Adopt for final integration; later refinement wording takes precedence where applicable. |
| AM-29-015 | AM-29-015 - Activity Demand Interface Refinement | Adopt for final integration; later refinement wording takes precedence where applicable. |
| AM-29-016 | AM-29-016 Refinement - Environmental Hydration and Metabolic Demand | Adopt for final integration; later refinement wording takes precedence where applicable. |
| AM-29-017 | AM-29-017 Refinement - Ingestion Exposure Handoff | Adopt for final integration; later refinement wording takes precedence where applicable. |
| AM-29-018 | AM-29-018 - Population Provisions Satisfaction Interface | Adopt for final integration; later refinement wording takes precedence where applicable. |
| AM-29-019 | AM-29-019 - Environment Exposure Snapshot | Adopt for final integration; later refinement wording takes precedence where applicable. |
| AM-29-020 | AM-29-020 - Shelter Exposure Context | Adopt for final integration; later refinement wording takes precedence where applicable. |
| AM-29-021 | AM-29-021 - Thermal Equipment Trait Interface | Adopt for final integration; later refinement wording takes precedence where applicable. |
| AM-29-022 | AM-29-022 - Thermal Mitigation Effect Interface | Adopt for final integration; later refinement wording takes precedence where applicable. |
| AM-29-023 | AM-29-023 - Rest Site and Sleep Transaction Interface | Adopt for final integration; later refinement wording takes precedence where applicable. |
| AM-29-024 | AM-29-024 - Environmental Activity Interface Refinement | Adopt for final integration; later refinement wording takes precedence where applicable. |
| AM-29-025 | AM-29-025 Refinement - Thermal Injury Exposure Handoff | Adopt for final integration; later refinement wording takes precedence where applicable. |
| AM-29-026 | AM-29-026 - Population Climate and Sleep Service Interface | Adopt for final integration; later refinement wording takes precedence where applicable. |
| AM-29-027 | AM-29-027 - Social Exposure and Rest Need Interface | Adopt for final integration; later refinement wording takes precedence where applicable. |
| AM-29-028 | AM-29-028 - Maritime Thermal/Wetness Reconciliation Interface | Adopt for final integration; later refinement wording takes precedence where applicable. |
| AM-29-029 | AM-29-029 - Resolved Biological Trauma Interface | Adopt for final integration; later refinement wording takes precedence where applicable. |
| AM-29-030 | AM-29-030 - Biological Region Mapping Interface | Adopt for final integration; later refinement wording takes precedence where applicable. |
| AM-29-031 | AM-29-031 - Mobility Function Interface | Adopt for final integration; later refinement wording takes precedence where applicable. |
| AM-29-032 | AM-29-032 - Manual and Head Function Interface | Adopt for final integration; later refinement wording takes precedence where applicable. |
| AM-29-033 | AM-29-033 Adoption - Injury Treatment Outcome Interface | Adopt for final integration; later refinement wording takes precedence where applicable. |
| AM-29-034 | AM-29-034 Adoption - Wound Contamination Exposure Interface | Adopt for final integration; later refinement wording takes precedence where applicable. |
| AM-29-035 | AM-29-035 Adoption - Injury Complication Feedback Interface | Adopt for final integration; later refinement wording takes precedence where applicable. |
| AM-29-036 | AM-29-036 - Social Care and Travel Readiness Interface | Adopt for final integration; later refinement wording takes precedence where applicable. |
| AM-29-037 | AM-29-037 - Workforce Injury Downtime Refinement | Adopt for final integration; later refinement wording takes precedence where applicable. |
| AM-29-038 | AM-29-038 - Injured Actor Transport Stress Interface | Adopt for final integration; later refinement wording takes precedence where applicable. |
| AM-29-039 | AM-29-039 - Combat Death/Downed Biological Critical Handoff | Adopt for final integration; later refinement wording takes precedence where applicable. |
| AM-29-040 | AM-29-040 - Universal Biological Exposure Source Interface | Adopt for final integration; later refinement wording takes precedence where applicable. |
| AM-29-041 | AM-29-041 - Disease Transmission Contact Interface | Adopt for final integration; later refinement wording takes precedence where applicable. |
| AM-29-042 | AM-29-042 - Disease and Poison Modifier Bundle | Adopt for final integration; later refinement wording takes precedence where applicable. |
| AM-29-043 | AM-29-043 - Disease/Poison Social Care Interface | Adopt for final integration; later refinement wording takes precedence where applicable. |
| AM-29-044 | AM-29-044 - Population Disease and Workforce Interface | Adopt for final integration; later refinement wording takes precedence where applicable. |
| AM-29-045 | AM-29-045 - Sanitation and Quarantine Service Interface | Adopt for final integration; later refinement wording takes precedence where applicable. |
| AM-29-046 | AM-29-046 - Outbreak Pressure Event Interface | Adopt for final integration; later refinement wording takes precedence where applicable. |
| AM-29-047 | AM-29-047 - Toxin Exposure Interface | Adopt for final integration; later refinement wording takes precedence where applicable. |
| AM-29-048 | AM-29-048 Adoption - Disease/Poison Treatment Outcome Interface | Adopt for final integration; later refinement wording takes precedence where applicable. |
| AM-29-049 | AM-29-049 - Creature/Ecology Host and Vector Interface | Adopt for final integration; later refinement wording takes precedence where applicable. |
| AM-29-050 | AM-29-050 - Disease Registry Ownership Reconciliation | Adopt for final integration; later refinement wording takes precedence where applicable. |
| AM-29-051 | AM-29-051 - Maritime Contamination Exposure Interface | Adopt for final integration; later refinement wording takes precedence where applicable. |
| AM-29-052 | AM-29-052 Adoption - Protection and Prophylaxis Capability Interface | Adopt for final integration; later refinement wording takes precedence where applicable. |
| AM-29-053 | AM-29-053 - Universal Treatment Capability Interface | Adopt for final integration; later refinement wording takes precedence where applicable. |
| AM-29-054 | AM-29-054 - Atomic Treatment Transaction Interface | Adopt for final integration; later refinement wording takes precedence where applicable. |
| AM-29-055 | AM-29-055 - Treatment Provider Capability Interface | Adopt for final integration; later refinement wording takes precedence where applicable. |
| AM-29-056 | AM-29-056 - Facility Treatment Context Interface | Adopt for final integration; later refinement wording takes precedence where applicable. |
| AM-29-057 | AM-29-057 - Medicine Item Treatment-Facet Interface | Adopt for final integration; later refinement wording takes precedence where applicable. |
| AM-29-058 | AM-29-058 - Magical Treatment Request Interface | Adopt for final integration; later refinement wording takes precedence where applicable. |
| AM-29-059 | AM-29-059 - Medical Service Demand Interface | Adopt for final integration; later refinement wording takes precedence where applicable. |
| AM-29-060 | AM-29-060 - Rehabilitation Activity Interface | Adopt for final integration; later refinement wording takes precedence where applicable. |
| AM-29-061 | AM-29-061 - Clinical Assessment Evidence Interface | Adopt for final integration; later refinement wording takes precedence where applicable. |
| AM-29-062 | AM-29-062 - Medicine Adverse/Overuse Exposure Interface | Adopt for final integration; later refinement wording takes precedence where applicable. |
| AM-29-063 | AM-29-063 - Blood-Loss Restoration Treatment Interface | Adopt for final integration; later refinement wording takes precedence where applicable. |
| AM-29-064 | AM-29-064 - Generic Biological Healing Request Interface | Adopt for final integration; later refinement wording takes precedence where applicable. |
| AM-29-065 | AM-29-065 - Population Treatment Throughput Interface | Adopt for final integration; later refinement wording takes precedence where applicable. |
| AM-29-066 | AM-29-066 - Emergency Care / Downed Interaction Interface | Adopt for final integration; later refinement wording takes precedence where applicable. |
| AM-29-067 | AM-29-067 - Treatment Supply and Automation Interface | Adopt for final integration; later refinement wording takes precedence where applicable. |
| AM-29-068 | AM-29-068 - Biological Profile Reference Interface | Adopt for final integration; later refinement wording takes precedence where applicable. |
| AM-29-069 | AM-29-069 - Effective Biological Profile Snapshot | Adopt for final integration; later refinement wording takes precedence where applicable. |
| AM-29-070 | AM-29-070 - Biological Equipment Snapshot | Adopt for final integration; later refinement wording takes precedence where applicable. |
| AM-29-071 | AM-29-071 - Equipment Body-Fit and Coverage Interface | Adopt for final integration; later refinement wording takes precedence where applicable. |
| AM-29-072 | AM-29-072 - General Biological Protection Bundle | Adopt for final integration; later refinement wording takes precedence where applicable. |
| AM-29-073 | AM-29-073 - Magical Biological Effect Interface | Adopt for final integration; later refinement wording takes precedence where applicable. |
| AM-29-074 | AM-29-074 - Biological Profile Overlay Interface | Adopt for final integration; later refinement wording takes precedence where applicable. |
| AM-29-075 | AM-29-075 - Diet and Consumption Compatibility Interface | Adopt for final integration; later refinement wording takes precedence where applicable. |
| AM-29-076 | AM-29-076 - Rest and Sleep Compatibility Interface | Adopt for final integration; later refinement wording takes precedence where applicable. |
| AM-29-077 | AM-29-077 - Treatment Compatibility Interface | Adopt for final integration; later refinement wording takes precedence where applicable. |
| AM-29-078 | AM-29-078 - Mixed-Population Biological Demand Interface | Adopt for final integration; later refinement wording takes precedence where applicable. |
| AM-29-079 | AM-29-079 - Settlement Biological Suitability Interface | Adopt for final integration; later refinement wording takes precedence where applicable. |
| AM-29-080 | AM-29-080 - Realm and Environment Adaptation Interface | Adopt for final integration; later refinement wording takes precedence where applicable. |
| AM-29-081 | AM-29-081 - Mobile Interior Biological Support Interface | Adopt for final integration; later refinement wording takes precedence where applicable. |
| AM-29-082 | AM-29-082 - Non-Biological Maintenance Handoff | Adopt for final integration; later refinement wording takes precedence where applicable. |
| AM-29-083 | AM-29-083 - Biological Capability Summary Interface | Adopt for final integration; later refinement wording takes precedence where applicable. |
| AM-29-084 | AM-29-084 - Profile Change Revalidation Event | Adopt for final integration; later refinement wording takes precedence where applicable. |
| AM-29-085 | AM-29-085 - Authoritative Movement Activity Event Envelope | Adopt for final integration; later refinement wording takes precedence where applicable. |
| AM-29-086 | AM-29-086 - Biological Mobility Modifier Snapshot Revision | Adopt for final integration; later refinement wording takes precedence where applicable. |
| AM-29-087 | AM-29-087 - Named Biological Priority Hint | Adopt for final integration; later refinement wording takes precedence where applicable. |
| AM-29-088 | AM-29-088 - Companion Care Outcome Summary | Adopt for final integration; later refinement wording takes precedence where applicable. |
| AM-29-089 | AM-29-089 - Versioned Population Health Summary | Adopt for final integration; later refinement wording takes precedence where applicable. |
| AM-29-090 | AM-29-090 - Cross-Set Authoritative World-Time Reference | Adopt for final integration; later refinement wording takes precedence where applicable. |
| AM-29-091 | AM-29-091 - Actor Presence and Offline Policy Interface | Adopt for final integration; later refinement wording takes precedence where applicable. |
| AM-29-092 | AM-29-092 - Biological Snapshot Revision Interface | Adopt for final integration; later refinement wording takes precedence where applicable. |
| AM-29-093 | AM-29-093 - Idempotent Cross-Set Transaction Envelope | Adopt for final integration; later refinement wording takes precedence where applicable. |
| AM-29-094 | AM-29-094 - Biological Critical Alert Interface | Adopt for final integration; later refinement wording takes precedence where applicable. |
| AM-29-095 | AM-29-095 - Survival Accessibility Policy Interface | Adopt for final integration; later refinement wording takes precedence where applicable. |
| AM-29-096 | AM-29-096 - Biological Knowledge Visibility Query | Adopt for final integration; later refinement wording takes precedence where applicable. |
| AM-29-097 | AM-29-097 - Cohort Promotion/Demotion Reason Interface | Adopt for final integration; later refinement wording takes precedence where applicable. |
| AM-29-098 | AM-29-098 - Distant Travel Biological Summary Interface | Adopt for final integration; later refinement wording takes precedence where applicable. |
| AM-29-099 | AM-29-099 - Biological Reconciliation Barrier Interface | Adopt for final integration; later refinement wording takes precedence where applicable. |
| AM-29-100 | AM-29-100 - Profile Migration Revalidation Event Refinement | Adopt for final integration; later refinement wording takes precedence where applicable. |
| AM-29-101 | AM-29-101 - Disease Executable-Facet Ownership Reconciliation | New in 29J; submit to Set 25 / Sets 27-30 final reconciliation as specified in Section 41. |
| AM-29-102 | AM-29-102 - Canonical Survival Interface Registration | New in 29J; submit to Set 25 / Sets 27-30 final reconciliation as specified in Section 41. |
| AM-29-103 | AM-29-103 - Biological Status/Profile Definition Mapping | New in 29J; submit to Set 25 / Sets 27-30 final reconciliation as specified in Section 41. |
| AM-29-104 | AM-29-104 - Canonical Population Health Summary Envelope | New in 29J; submit to Set 25 / Sets 27-30 final reconciliation as specified in Section 41. |
| AM-29-105 | AM-29-105 - Unified Biological Modifier Bundle | New in 29J; submit to Set 25 / Sets 27-30 final reconciliation as specified in Section 41. |
| AM-29-106 | AM-29-106 - Unified Biological Transaction Result Envelope | New in 29J; submit to Set 25 / Sets 27-30 final reconciliation as specified in Section 41. |
| AM-29-107 | AM-29-107 - Survival World-Profile Settings Interface | New in 29J; submit to Set 25 / Sets 27-30 final reconciliation as specified in Section 41. |
| AM-29-108 | AM-29-108 - Biological Save/Manifest Schema Registration | New in 29J; submit to Set 25 / Sets 27-30 final reconciliation as specified in Section 41. |
| AM-29-109 | AM-29-109 - Set 29 Biological Completeness Contract | New in 29J; submit to Set 25 / Sets 27-30 final reconciliation as specified in Section 41. |
| AM-29-110 | AM-29-110 - Set 29 Interface Freeze and Compatibility Versioning | New in 29J; submit to Set 25 / Sets 27-30 final reconciliation as specified in Section 41. |


# Appendix H. Final Terminology Register

| Term | Do Use | Do Not Use As Canonical Replacement |
| --- | --- | --- |
| Health | Universal biological Health resource | vitality/life as a second mutable pool without owner |
| Stamina | Short-term exertion resource | energy when referring to item/power economy |
| Fatigue | Long-term biological strain | sleepiness as a complete replacement |
| Hunger | 0-100 biological need severity | fullness when API says HungerLevel |
| Hydration/Thirst | Optional hydration reserve/severity | hidden water meter in Standard |
| Thermal Load | Biological hot/cold pressure state | ambient temperature itself |
| Wetness | Body/equipment moisture state | automatic disease chance |
| Sleep Pressure | Need for restorative sleep | world time ownership |
| Injury | Persistent biological trauma record | generic combat debuff only |
| Blood Loss | Biological reserve/depletion state | Health synonym |
| Disease | Established biological illness state | random negative status without source |
| Toxin Load | Per-toxin biological burden | one universal poison DOT |
| Treatment | Authoritative medical/healing action transaction | direct item/spell stat mutation |
| Biological Profile | Physiology/applicability definition | race/culture/personality definition |
| Protection Bundle | Resolved biological mitigation snapshot | armour defence calculation |
| Population Health Summary | Versioned aggregate biological demand/burden | economy or settlement wealth |
| Biological LOD | Representation/scheduling level | different biological rules |
| RecoveryStatus | Biological recovery summary | dialogue/social attitude |
| CriticalCondition | Biological critical-state handoff | death state |

# Final Cross-Set Reconciliation Addendum - v0.2

**Governing contract:** Leyforge Document Sets 27-30 Cross-Set Interface Register v1.1 - Final Reconciled Contract.

The original AM-29 amendment history remains valid. This addendum freezes the canonical cross-set forms relevant to Sets 27, 28 and 30.

## Final Set 29 Contract Mapping

- `PopulationHealthSummary` remains the canonical economic/population envelope under **XSET-003**.
- Social care/recovery/disclosure summaries use **XSET-005**.
- AM-29-001, AM-29-085, AM-29-086 and AM-29-105 consolidate into **XSET-008 - Movement Exertion and Biological Mobility**.
- AM-29-029/031 consolidate into **XSET-009 - Physical Impact and Biological Consequence**.
- AM-29-090/091/093 and LOD-related AM-29-097/099 coordinate through **XSET-001** and **XSET-010**.

## Movement Exertion Ownership Freeze

Set 30 owns the physical movement action, movement mode, intensity and movement context. Set 29 owns conversion of that context into actual Stamina expenditure, Fatigue/recovery effects and biological permission. A route-estimation query is non-mutating.

The movement-facing Set 29 response includes begin/continue permission, Stamina availability/spend result, movement/recovery modifier, hard restrictions, reason codes and a source revision. Set 29 also exposes a revisioned biological mobility snapshot retaining compatibility endpoints such as `StaminaModifier()` and `CarryPenalty()`.

## Fall Impact Ownership Freeze

Set 30 sends physical impact facts. Set 29 decides Health/injury consequences and returns movement restrictions/modifiers. Set 30 does not calculate biological injury severity.

## Swimming Reconciliation

The external Set 26 versus Set 30 swimming item recorded in original v0.1 is now resolved: **26E remains the detailed aquatic locomotion provider; Set 30 owns the universal Aquatic Movement API facade and cross-medium handoff.** Set 29 continues to own the biological consequences of exertion, exposure and injury.

## Final Status

There is no unresolved Set 29 gameplay-ownership conflict with Sets 27, 28 or 30.


---

---

**End of Document 29J - Biological Registries, APIs, Balance Framework, Validation and Cross-System Integration v0.1**

**End of Leyforge Document Set 29 - Survival, Health and Biological Systems v0.1**
