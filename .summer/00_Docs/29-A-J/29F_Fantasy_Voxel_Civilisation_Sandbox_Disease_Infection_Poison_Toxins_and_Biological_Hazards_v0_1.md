# FANTASY VOXEL CIVILISATION SANDBOX

## DOCUMENT SET 29

# 29F - Disease, Infection, Poison, Toxins and Biological Hazards

*Version 0.1 - Detailed Design Bible, Runtime Rules and Integration Contract Draft*

A registry-driven biological hazard system for disease, infection, parasites, poison, venom, toxins, contaminated exposure and population health pressure - designed to create preparation, medicine, sanitation, ecology and settlement gameplay without turning ordinary Leyforge play into random sickness or unavoidable attrition.

**Project Lead and Final Authority: Ash**

> **Disease, Poison and Biological Hazard Statement**
>
> Leyforge disease and poison must be understandable biological consequences of real sources, not arbitrary debuff lotteries. Pathogens, contaminated food or water, infected wounds, creature-borne disease, spores, parasites, venom, toxins and hazardous environments may create meaningful risk, but each risk must have traceable cause, readable progression and reachable counterplay. Set 29 owns the biological exposure, infection, disease and toxin truth. Creature, world, item, settlement, quest, economy, social and movement systems remain owners of the sources and consequences they already control.

| Field | Locked Direction |
| --- | --- |
| Document | 29F in Document Set 29 - Survival, Health & Biological Systems. |
| Governing Contract | The **Leyforge Document Sets 27-30 Cross-Set Interface Register v1.0** remains mandatory. No ownership is transferred by convenience. |
| Core Ownership | Disease exposure resolution, infection instances, incubation, symptoms, progression, transmission-relevant biological state, recovery, acquired biological resistance where applicable, poison/toxin burden, venom/toxin progression and biological hazard response. |
| Standard Frequency | Disease is uncommon in ordinary healthy Standard play. Meaningful risk comes from identifiable exposure: unsafe food/water, infected wounds, outbreaks, vectors, contaminated environments, poor sanitation, specific creatures or authored hazards. |
| Standard Fairness | No hidden flat random sickness roll simply because time passed, rain fell, the player slept outside or entered a normal biome. |
| Disease Model | Exposure -> Infection Threshold -> Incubating -> Symptomatic/Active -> Resolving -> Recovered, with optional Severe, Chronic or Carrier branches declared per disease. |
| Poison Model | Exposure Dose -> Toxin Load -> Onset/Active -> Peak -> Clearing -> Cleared, with toxin-specific accumulation and elimination. |
| Infection Model | Wound infection is a disease/infection instance linked to the wound; 29E remains owner of the physical wound. |
| Contamination | External systems own world/item/fluid contamination. 29F consumes explicit pathogen/toxin exposure payloads; it does not create a universal cleanliness meter. |
| Medicine | 29F owns biological disease/toxin response and treatment requirements. 29G owns treatment actions, medicine application and validated treatment outcomes. |
| Settlements | Set 20 owns sanitation, clean water, clinics, quarantine buildings and service capacity. 29F exposes population disease pressure, care demand and transmission risk. |
| Quests/Events | Document 15 owns outbreak events, objectives, crises and narrative consequences. 29F emits biological state/events only. |
| Economy | Set 27 owns prices, wages, shortages, insurance and costs. 29F exports medical demand, workforce impact and outbreak burden. |
| Social | Set 28 owns doctor/companion behaviour, care choices, social reactions and dialogue. 29F exports illness, urgency, contagiousness and recovery state. |
| Movement | Set 30 owns locomotion. 29F may reduce biological capacity through 29B modifiers but never edits speed, climbing or travel rules directly. |
| Radiation | Reserved extension only. No Core radiation system is activated by 29F. |
| Engine | Godot/Summer Engine; authoritative, registry-driven, save-safe, deterministic where practical and compatible with Set 25 governance. |

# Document Purpose

Document 29F is the authoritative disease, infection, poison and biological-hazard layer of Leyforge. It receives validated exposure from food, water, wounds, creatures, environments, fluids, traps, magic, items and world events; resolves whether biological conditions develop; advances those conditions through time; publishes symptoms and physiological modifiers; and hands treatment requirements to 29G without taking ownership of the source systems.

Earlier Leyforge documents already contain poison sludge, venom drops, poisoned combat status, disease references, food contamination, sanitation, quarantine shelters, hospital services, creature illness, environmental hazards and world-event disease concepts. Those sources establish content intent but do not provide one universal biological runtime. 29F consolidates the biology while preserving all existing source-of-truth boundaries.

29F deliberately does **not** model medicine application in full, generate outbreak quests, price antidotes, decide whether a doctor agrees to help, create contaminated water, simulate fluid chemistry, invent creature attack damage or define settlement sanitation buildings. Those systems provide inputs or consume outputs through explicit interfaces.

# Design Sources, Authority and Treatment

| Source | Relevant Direction | Treatment in 29F |
| --- | --- | --- |
| 00 - Master Game Design Bible | Survival, civilisation, magic, automation and danger must connect while remaining configurable from cosy to harsh. | Disease/poison supports preparation and civilisation but cannot dominate ordinary play. |
| 01 - Core Gameplay Loop | Survival pressure should create gathering, crafting, building, interaction and recovery goals without forcing one playstyle. | Disease/poison creates optional preparation, medicine, sanitation and exploration loops. |
| 02 - Player Progression | Health/Stamina are derived resources; survival is configurable; perks may improve disease resistance or medicine effectiveness. | 29F exposes capability surfaces; progression remains external. |
| 03 - Blocks Registry | Poison sludge, cursed terrain, hazards and contaminated world blocks may exist. | Blocks/world owners supply hazard exposure; 29F owns biological toxin/disease result. |
| 04 - Items Registry | Food, medicine, creature venom and contaminated items may exist as data. | Item owner supplies traits/state; 29F never mutates item identity or price. |
| 05 - Crafting/Recipe Registry | Cooking, preservation, alchemy, antidotes and medicine transformations are resource-conserving recipes. | 29F consumes treatment capabilities and unsafe-consumption exposure; does not own recipes. |
| 07 / 20A-20F - NPC and Settlement Health | Clean water, sanitation, healer capacity, clinics, quarantine and hospital services affect health/outbreak outcomes. | Facilities expose service/capacity; 29F resolves population biological pressure. |
| 09 - Magic System | Cleansing, healing, wards and realm/magic hazards may alter health. | Magic supplies authorised protection/treatment/exposure capabilities. Corruption remains Magic-owned. |
| 10 / 24F - Creatures and Ecology | Creature venom, illness, parasites, migration and ecology can create biological risk. | Creature/ecology supplies source/vector/host traits; 29F owns actor disease/toxin runtime. |
| 11 / 24A-24F - World and Biomes | Swamps, climate, contamination, spores, disaster and biome hazards can matter. | World systems provide exposure context; ordinary biome presence alone never creates hidden disease. |
| 15 - Quest and Event System | Outbreaks, disasters and crises may progress and leave consequences. | 29F emits biological pressure/events; Quest/Event owns narrative lifecycle. |
| 16 - Combat | Poisoned/diseased status, toxin damage, antidotes and injury interactions are anticipated. | Combat status entries become compatibility/migration inputs; persistent biology is Set 29-owned. |
| 17 - UI/UX | Conditions must be contextual, readable, accessible and knowledge-aware. | 29F exposes symptoms, trend, urgency, known/unknown state and counter information. |
| 18 / Set 25 | Stable IDs, authoritative transactions, simulation LOD, migrations, validation and Godot architecture. | 29F uses qualified definitions/runtime records and no client-authored cures. |
| 26B / 26J | Water contamination, purification, ports, infirmaries and quarantine exist in maritime play. | Set 26 supplies maritime contamination/service inputs; 29F supplies universal biological consequences. |
| 29A-29E | Health, Stamina, Hunger, Temperature, Sleep, Injury and wound contamination contracts are already locked. | 29F consumes those interfaces and must not recreate them. |
| Sets 27-30 Interface Register | Economy, Social and Movement ownership is protected. | 29F exports biological state only and records new interface needs in Section 42. |

> **Source-of-Truth Caution**
>
> Set 25 currently associates a `disease` registry domain with ecology/creature content sources. The newer Set 29 ownership contract makes disease gameplay a Set 29 responsibility. 29F does not silently transfer content ownership. This discrepancy is recorded for the final Set 25/29J integration pass: ecology may author disease sources, hosts and world-content packages, while Set 29 owns universal disease mechanics and actor condition truth.

# Static Table of Contents

1. Locked 29F System Identity  
2. Approved Decision Summary  
3. Ownership and Non-Ownership Boundary  
4. Disease, Poison and Exposure State Architecture  
5. Biological Hazard Taxonomy  
6. Exposure Source Contract  
7. Exposure Routes and Route Compatibility  
8. Disease Exposure Accumulators and Infection Thresholds  
9. Susceptibility, Resistance and Immunity  
10. Disease Instance Architecture  
11. Disease Lifecycle and Stage Progression  
12. Symptoms, Severity and Physiological Modifier Bundles  
13. Transmission and Communicability  
14. Contact, Airborne, Food/Water, Wound, Vector and Environmental Transmission  
15. Contamination, Sanitation and Cleanliness Boundary  
16. Wound Infection and 29E Complication Handoff  
17. Food, Water and Ingestion-Borne Disease  
18. Creature, Vector, Parasite and Ecology Integration  
19. Magical, Dimensional and Corruption Boundary  
20. Disease Recovery, Resistance Memory, Carrier and Chronic States  
21. Poison and Toxin System Architecture  
22. Toxin Exposure Dose, Accumulation and Thresholds  
23. Poison Onset, Active Effects, Peak and Elimination  
24. Venom, Ingested, Inhaled, Contact and Environmental Toxins  
25. Multi-Toxin Interaction, Resistance and Protection  
26. Biological Hazards, Pollution, Spores and Reserved Radiation  
27. Health, Stamina, Exertion and Fatigue Integration  
28. Hunger, Hydration, Temperature, Wetness and Sleep Integration  
29. Injury, Bleeding and Pain Integration  
30. Medicine, Antidotes, Diagnosis and 29G Handoff  
31. NPCs, Companions, Doctors and Social Care Integration  
32. Settlements, Sanitation, Quarantine and Population Health  
33. Economy, Workforce and Resource-Demand Integration  
34. Quests, Events, Outbreaks and World Consequences  
35. Difficulty Profiles and Custom World Settings  
36. Simulation LOD, Population Cohorts and Offline Rules  
37. Multiplayer Authority, Transactions and Replication  
38. UI, Knowledge, Diagnosis Feedback and Accessibility  
39. Registry Definitions, Runtime Records and Data Contracts  
40. Balance, Anti-Grind and Anti-Exploit Rules  
41. Validation, Test Cases and Acceptance Criteria  
42. Cross-Set Interface Amendments  
Appendix A. Reference Disease and Toxin Balance Tables  
Appendix B. Provisional 29F API Contract  
Appendix C. Initial Disease and Poison Parent Definition Set  
Appendix D. Runtime Record Templates  
Appendix E. Worked Gameplay Examples  
Appendix F. Migration and Supersession Notes  
Appendix G. Terminology Register

# 1. Locked 29F System Identity

29F is the universal actor-facing disease and toxin layer. It answers three questions:

1. **What biological exposure actually reached this actor?**
2. **Did that exposure establish an infection or toxin burden?**
3. **What symptoms, progression, recovery and transmission-relevant state result?**

It does not answer who created the contaminated river, how a spider decided to bite, what a healer charges, whether a settlement builds a quarantine shelter, whether a quest starts, or how fast an ill player walks.

> **Locked 29F Rule**
>
> Disease and poison require a valid biological source. Standard mode never rolls generic sickness from weather, travel, sleeping outdoors, ordinary wetness or the passage of time alone.

## 1.1 Disease Is Not a Random Punishment Timer

Every infection must retain a source/evidence chain when practical. The player may not know that chain immediately, but the simulation must.

Examples:

- contaminated meal -> ingestion exposure -> foodborne disease;
- cave-spider bite -> puncture injury + venom exposure -> separate injury and poison records;
- untreated open wound in sewage-contaminated floodwater -> wound exposure -> local infection;
- prolonged close contact with an infectious NPC -> contact/airborne exposure -> respiratory disease;
- breathing spores in a tagged fungal chamber -> inhalation exposure -> spore illness;
- mosquito-like vector from marsh ecology -> vector exposure -> fever disease.

## 1.2 Disease and Poison Are Separate

Disease represents infection, parasitic biological invasion or analogous biological processes with staged progression and possible transmission.

Poison/toxin represents harmful chemical, venomous, alchemical or biologically toxic burden that does not reproduce through an infection lifecycle.

A source may produce both. A diseased venomous creature may bite the player, creating:

- physical puncture - 29E;
- venom - 29F Poison;
- disease exposure - 29F Disease;
- Health damage - 29B after the owning source submits an authorised request.

## 1.3 No Universal Hygiene Meter

Leyforge does not add a mandatory personal hygiene bar. Clean water, sanitation, safe food, wound care, contaminated environments and settlement services already provide meaningful prevention. 29F uses those real systems rather than creating daily washing chores.

# 2. Approved Decision Summary

| Area | Locked Decision |
| --- | --- |
| Disease Frequency | Uncommon in ordinary Standard play; common only where source/content makes risk meaningful. |
| Infection Resolution | Exposure-based and threshold-driven, not a flat hourly sickness roll. |
| Randomness | Routine infection should be deterministic or stable-seeded where variation is needed. No trivial exposure -> catastrophic hidden RNG in Standard. |
| Exposure Scale | Disease-specific exposure accumulator, normally normalised 0-100 for reference and debugging. |
| Disease Severity | Mild, Moderate, Severe, Critical biological severity bands, separate from lifecycle stage. |
| Disease Lifecycle | Incubating -> Early/Symptomatic -> Active/Peak -> Resolving -> Recovered; optional Severe, Chronic or Carrier states. |
| Transmission | Explicit transmission routes. A disease can be non-communicable after infection. |
| Immunity | Biological profiles may have innate resistance/immunity; recovered disease may grant temporary or persistent resistance where definition allows. |
| Reinfection | Allowed only according to disease definition and current resistance memory. |
| Wound Infection | 29F infection linked to a 29E wound; 29F reports complication effects back through interface. |
| Wetness | Wetness alone never causes infection. It may affect exposure only when a valid contaminated/pathogen source exists. |
| Food/Water | 29C sends ingestion exposure; 29F decides infection/toxin result. |
| Quarantine | Set 20/governance owns facilities/policy; 29F supplies transmissibility and isolation recommendation. |
| Poison Model | Each toxin/venom uses dose/load and elimination. Poison is not one universal DOT status. |
| Poison Scale | Per-toxin `toxin_load` normally 0-100; `PoisonLevel()` is a summary, not the only stored state. |
| Poison Damage | 29F may originate toxin-derived Health damage through 29B's authorised biological damage/healing interface. 29F does not bypass Health authority. |
| Antidotes | 29G owns treatment actions and medicine use; 29F defines toxin compatibility, neutralisation and post-treatment state. |
| Contamination | World/fluid/item systems own contamination state. 29F consumes explicit exposure only. |
| Population Simulation | Individual named/important cases; cohorts and pressure summaries at distance. |
| Offline | No wall-clock outbreak escalation or player death while game is closed unless a future explicit server simulation policy owns it. |
| Accessibility | Symptoms and danger cannot rely on colour, blur, nausea camera or audio alone. |
| Radiation | Reserved extension only. |

# 3. Ownership and Non-Ownership Boundary

## 3.1 29F Owns

- disease exposure resolution;
- infection-threshold logic;
- active Disease Instances;
- disease incubation and progression;
- biological disease severity;
- disease symptoms as biological modifier declarations;
- communicability state and transmission-risk output;
- disease recovery state;
- disease resistance/immunity memory where biologically appropriate;
- wound-infection instances;
- parasite/infection biological state where content uses the universal disease framework;
- poison/toxin exposure resolution;
- per-toxin burden/load;
- poison onset, active stage, peak, elimination and clearing;
- toxin-derived biological modifiers;
- toxin-derived biological damage requests;
- disease/poison care need and urgency;
- disease/poison simulation LOD;
- population disease/toxin summaries;
- biological-hazard exposure accumulators.

## 3.2 29F Does Not Own

29F does not own:

- creature attack selection, hit detection or venom delivery animation;
- creature ecology, migration, nest logic or vector population simulation;
- worldgen placement of swamps, contaminated sites or spore caves;
- fluid contamination, mixing or purification simulation;
- item spoilage clocks or food safety definitions;
- cooking or preservation recipes;
- medical item definitions, crafting or prices;
- treatment interaction controls or healer AI;
- hospital/clinic/quarantine building operation;
- sanitation infrastructure construction;
- dialogue, fear, friendship, loyalty or care decisions;
- quests, outbreak event stages or political consequences;
- economy, wage loss, market shortage or insurance;
- movement speed, pathfinding or travel restrictions;
- combat damage, armour, block/parry or death/downed resolution;
- corruption, curses or magical realm-law truth;
- general respiration, drowning or aquatic pressure;
- a universal personal hygiene meter;
- public-health law/enforcement policy.

## 3.3 Cause -> Exposure -> Biology -> Consequence Pattern

The mandatory pattern is:

1. External owner resolves the source condition/action.
2. External owner submits a validated `BiologicalExposure` or specialist exposure payload.
3. 29F validates actor applicability, route, definition and duplicate event ID.
4. 29F updates disease exposure or toxin load.
5. If thresholds are met, 29F creates/updates a Disease or Poison Instance.
6. 29F advances the condition and publishes biological modifiers/events.
7. 29B/29C/29D/29E apply their own owned consequences through interfaces.
8. Set 27/28/30, Settlements, Quest/Event and UI consume outputs without mutating 29F truth.

# 4. Disease, Poison and Exposure State Architecture

29F keeps source exposure, established disease and toxin burden separate.

| State Family | Meaning | Persistence |
| --- | --- | --- |
| Exposure Accumulator | Recent disease-specific exposure not yet established as infection. | Short-lived / scheduled. |
| Disease Instance | Established infection/disease with lifecycle, severity and symptoms. | Persistent until resolved/migrated. |
| Resistance Memory | Innate/acquired disease resistance or immunity state. | Profile/runtime depending source. |
| Poison Instance | Active toxin/venom burden with onset/elimination state. | Persistent while load matters. |
| Biological Hazard Context | Validated external exposure context such as spores, contaminated water or toxic fumes. | Event/snapshot; world owner remains authoritative. |
| Population Health Summary | Cohort-level disease pressure, cases and care demand. | Persistent summary at distant LOD. |

## 4.1 Public Summary API

The Cross-Set Register requires:

- `DiseaseState()`;
- `PoisonLevel()`.

29F interprets these as **summary queries**, not permission to collapse all detail into one bar.

`DiseaseState(actor)` should expose at minimum:

- none / incubating / symptomatic / severe / resolving / chronic;
- worst known biological severity;
- active disease count;
- care urgency;
- transmission-risk band if applicable;
- player-knowledge-safe summary.

`PoisonLevel(actor)` returns the actor's current overall toxin danger as 0-100 or a semantic band derived from active toxin instances. Individual toxin records remain queryable.

## 4.2 State Independence

- Exposure is not automatically infection.
- Infection is not automatically contagious.
- Contagious does not mean every nearby NPC is infected.
- Disease severity is not the same as disease lifecycle stage.
- Poison load is not disease severity.
- Recovery of Health does not cure disease or poison.
- Treatment may control symptoms without removing the underlying disease/toxin immediately.

# 5. Biological Hazard Taxonomy

| Hazard Family | Examples | 29F Role |
| --- | --- | --- |
| Infectious disease | respiratory fever, wound infection, foodborne illness | exposure, infection, lifecycle, transmission |
| Parasitic disease | blood parasite, intestinal parasite, fungal colonisation | disease framework with content-specific lifecycle |
| Venom | spider, serpent, aquatic creature, magical beast | toxin load and poison progression |
| Ingested toxin | poisonous plant, spoiled toxic by-product, alchemical contaminant | toxin exposure via ingestion |
| Inhaled toxin | toxic smoke, industrial fumes, alchemical gas | toxin exposure via inhalation |
| Contact toxin | poison sludge, stinging resin, toxic sap | dermal/contact exposure |
| Environmental pathogen | spores, contaminated mud/water, plague site | explicit exposure source; no automatic biome disease |
| Wound contamination | dirty weapon/soil/sewage entering open wound | linked infection exposure |
| Vector exposure | biting insect/parasite carrier | ecology supplies vector event; 29F resolves disease exposure |
| Magical biological hazard | spell/realm emits approved disease/toxin effect | Magic/realm owns source; 29F owns biology |
| Radiation | reserved | not active in Core Production |

# 6. Exposure Source Contract

29F accepts exposures only from authoritative owners.

## 6.1 Universal `BiologicalExposure`

Recommended fields:

- `exposure_event_id`;
- target actor ID;
- source actor/entity/block/item/fluid/site ID;
- hazard definition or hazard tag;
- exposure family: disease / toxin;
- route;
- raw magnitude/dose;
- duration where continuous;
- concentration/intensity band if provided;
- source viability/potency;
- protection context references;
- world/simulation timestamp;
- evidence/authority token;
- optional linked wound ID;
- optional source disease instance ID for transmission.

## 6.2 Duplicate Protection

An exposure event ID can apply only once. Continuous hazards use bounded interval/sample identifiers rather than resubmitting the same event each frame.

Examples:

- standing in toxic gas creates scheduled exposure samples, not 60 network writes per second;
- a bite event creates one venom dose;
- drinking a contaminated waterskin creates one ingestion exposure per consumption transaction;
- contact with an infectious actor aggregates meaningful contact time rather than emitting an event every physics tick.

# 7. Exposure Routes and Route Compatibility

29F uses explicit routes because protection and counterplay depend on how a hazard enters the body.

| Route | Typical Sources | Typical Protection Interfaces |
| --- | --- | --- |
| Ingestion | food, drink, contaminated medicine, toxin | food safety, purification, resistance, treatment |
| Inhalation | spores, fumes, airborne pathogen, smoke toxin | mask/filter capability, ventilation, distance, ward |
| Contact | contaminated fluid, toxic plant, skin exposure | gloves/clothing/seal, washing/cleaning treatment |
| Wound | dirty wound, contaminated weapon, bite, floodwater | wound closure/cleaning/dressing, 29E wound state |
| Injection/Venom | bite, sting, poisoned weapon, syringe-like device | armour/source prevention, toxin resistance, antidote |
| Vector | insect/parasite bite, ecological carrier | repellence, shelter, ecology control, prophylaxis |
| Magical biological | spell/ritual/realm effect with explicit biological tag | ward/resistance/cleansing capabilities |

Definitions declare compatible routes. A contact poison cannot infect through merely seeing the source; a foodborne pathogen does not become airborne unless its definition explicitly supports that route.

# 8. Disease Exposure Accumulators and Infection Thresholds

Disease acquisition uses **disease-specific exposure**, not a flat universal random chance.

## 8.1 Exposure Accumulator

For each disease definition that the actor has recently encountered:

`effective_exposure = raw_exposure x route_modifier x susceptibility x source_potency x protection_modifier`

The result adds to a bounded accumulator, normally 0-100 for reference.

## 8.2 Standard Reference Bands

| Exposure Load | Meaning |
| ---: | --- |
| 0-19 | Trace - biologically negligible/recovering exposure. |
| 20-39 | Low - meaningful contact, normally no established infection yet. |
| 40-59 | Elevated - prevention/treatment may matter. |
| 60-79 | High - common Standard parent threshold region for establishment. |
| 80-100 | Extreme - strong exposure; infection highly likely where actor is susceptible. |

Disease definitions may use different thresholds. The common parent reference is **60** effective exposure.

## 8.3 Exposure Decay

Unestablished exposure decays according to the disease definition's viability/clearance profile. Reference common disease exposure half-life is **2-6 simulation hours**, but fast transient hazards may clear in minutes and persistent contamination may continue adding new exposure.

No accumulator decays while a continuing source is still supplying exposure unless the net biological clearance exceeds incoming dose.

## 8.4 Infection Establishment

When effective exposure crosses the disease's establishment threshold:

1. validate susceptibility and immunity;
2. create one Disease Instance;
3. consume/reset the relevant exposure accumulator according to definition;
4. schedule incubation/progression;
5. preserve source evidence;
6. emit `DiseaseEstablished` to authorised consumers.

Repeated exposure to the same disease normally worsens the same established instance rather than spawning dozens of duplicates.

## 8.5 Stable Variation, Not Catastrophic RNG

A disease may use a small actor-specific tolerance variation if design requires it. Such variation must be stable-seeded by actor/disease identity and bounded (for example +/-10% threshold), not rerolled every exposure. Standard should remain explainable and reproducible in debugging.

# 9. Susceptibility, Resistance and Immunity

## 9.1 Susceptibility Inputs

29F may consume:

- biological-profile disease susceptibility;
- disease-family resistance tags;
- acquired resistance memory;
- current nutrition resilience from 29C;
- severe Fatigue/recovery modifiers from 29B;
- active injury/wound state from 29E where route-specific;
- prophylaxis/treatment state from 29G;
- equipment/magic protection capabilities supplied externally.

## 9.2 Innate Immunity

A Biological Profile may declare:

- immune to disease family;
- resistant;
- baseline;
- susceptible.

Immunity should usually be family/tag-based rather than a giant hard-coded species switch statement.

Examples:

- construct body immune to ordinary biological infection but not magical corrosion if content says so;
- plantlike creature resistant to a humanoid respiratory pathogen but susceptible to a fungal blight defined for it;
- undead content may use its own declared profile rather than receiving human diseases by accident.

## 9.3 Acquired Resistance Memory

A recovered disease may grant:

- none;
- short-term resistance;
- long-term resistance;
- near-immunity;
- strain-specific resistance.

This is a disease-definition property. 29F does not assume every infection gives permanent immunity.

## 9.4 No Infinite Resistance Stacking

Multiple sources of disease resistance compose through bounded diminishing rules. A perk, tonic, ward and previous recovery cannot silently produce mathematically absurd 500% immunity unless an explicit immunity capability exists.

# 10. Disease Instance Architecture

Recommended persistent fields:

| Field | Purpose |
| --- | --- |
| `disease_instance_id` | Stable runtime identity. |
| `disease_definition_id` | Parent disease definition. |
| `actor_id` | Host. |
| `source_event_id` | Establishing exposure evidence. |
| `source_actor/site_id` | Optional source. |
| `linked_wound_id` | Optional wound infection link. |
| `stage` | Incubating, Early, Active, Severe, Resolving, Chronic, Recovered/Carrier as allowed. |
| `severity` | Mild, Moderate, Severe, Critical. |
| `disease_burden` | Optional normalised 0-100 progression burden. |
| `communicability_band` | Current transmission state. |
| `symptom_profile_state` | Active declared symptoms/modifiers. |
| `treatment_flags` | Applied prophylaxis/therapy results. |
| `resistance_memory_result` | Pending/result on recovery. |
| `next_progression_time` | Scheduled update. |
| `last_update_time` | Save/LOD reconciliation. |
| `knowledge/diagnosis reference` | External knowledge state link if used. |
| `schema_version` | Migration. |

# 11. Disease Lifecycle and Stage Progression

## 11.1 Canonical Stages

| Stage | Meaning | Typical Player Experience |
| --- | --- | --- |
| Incubating | Infection established; symptoms absent/minimal. | Usually hidden unless diagnosed/known. |
| Early | First mild symptoms; disease becoming apparent. | Contextual warning, uncertainty. |
| Active | Main disease phase. | Clear symptoms, care/recovery impacts. |
| Severe | Optional escalation when burden/conditions justify it. | Strong warning, treatment priority. |
| Resolving | Host is clearing infection. | Symptoms improve; transmission may fall. |
| Recovered | Active disease cleared. | Resistance memory may be applied. |
| Chronic | Optional long-duration persistent branch. | Ongoing management/treatment. |
| Carrier | Optional low/no-symptom but transmission-capable state. | Mostly simulation/diagnosis relevant. |

Not every disease uses every stage.

## 11.2 Stage Timing

Stage durations are definition-driven and expressed in simulation time. Common Standard illnesses should generally unfold over **hours to several in-game days**, not seconds, so disease supports planning rather than behaving like a combat DOT.

Illustrative parent ranges:

- short foodborne illness: 2-8 h incubation, 8-24 h active;
- common respiratory fever: 6-24 h incubation, 1-3 d active;
- wound infection: risk develops over several hours, then worsens over 1-3 d if untreated;
- specialised parasitic/realm disease: content-defined, possibly multi-day.

These ranges are balance references, not a final disease roster.

## 11.3 Progression Drivers

Disease progression may consider:

- elapsed simulation time;
- disease burden;
- actor susceptibility/resistance;
- treatment status;
- rest/recovery quality;
- nutrition/hydration state;
- severe environmental stress;
- linked wound contamination/closure state;
- disease-specific conditions;
- difficulty profile.

Ordinary disease must not require constant player input. Once safe care is established, progression/recovery should advance mostly through time and appropriate resources.

# 12. Symptoms, Severity and Physiological Modifier Bundles

29F does not hard-code every disease into action systems. Disease definitions expose symptom/modifier bundles.

## 12.1 Symptom Families

- fever/thermal disruption;
- chills;
- nausea/appetite disruption;
- dehydration pressure;
- fatigue;
- stamina-regeneration penalty;
- exertion-cost penalty;
- sleep-quality penalty;
- pain/discomfort;
- cough/breath discomfort where not replacing respiration ownership;
- reduced natural Health recovery;
- periodic Health damage for severe disease where explicitly defined;
- reduced work capacity;
- transmission state;
- special authored biological effect.

## 12.2 Severity Bands

| Severity | Intent |
| --- | --- |
| Mild | Noticeable but broadly functional; usually self-care/rest sufficient. |
| Moderate | Meaningful preparation/treatment value; reduced capability. |
| Severe | Strong care need; significant recovery/work impairment. |
| Critical | Biological emergency; may create Critical Condition through 29B but does not own death. |

## 12.3 Modifier Boundaries

29F may publish:

- `stamina_regen_mult`;
- `stamina_cost_mult`;
- `fatigue_gain_mult`;
- `health_recovery_mult`;
- `health_recovery_blocker`;
- `hunger_demand_mult`;
- `hydration_demand_mult` where thirst enabled;
- `thermal_tolerance_mult`;
- `sleep_quality_mult`;
- `work_capacity_mult`;
- care/transmission flags.

29B/29C/29D apply these in their own pipelines.

# 13. Transmission and Communicability

Disease can be transmissible without 29F owning social interaction or settlement movement.

## 13.1 Communicability Band

Suggested summary:

- None;
- Low;
- Moderate;
- High;
- Extreme.

The band is definition/stage-driven and can be modified by treatment, isolation, masking/ward capabilities or route conditions supplied externally.

## 13.2 Transmission Event

A susceptible actor receives disease exposure when an external contact/environment resolver reports sufficient route-compatible contact with an infectious source.

29F should not run an expensive all-to-all distance check between every NPC every frame. Local AI/world systems provide contact sets or environmental exposure volumes; 29F converts them into exposure.

## 13.3 Transmission Does Not Imply Blame

29F stores biological source evidence. Crime/law, social reputation, fear or blame are external systems. Deliberately poisoning a well and unknowingly carrying an illness may produce similar biological exposure but very different legal/social outcomes.

# 14. Contact, Airborne, Food/Water, Wound, Vector and Environmental Transmission

## 14.1 Direct/Close Contact

External interaction/proximity services may aggregate meaningful contact windows. Contact exposure may scale by:

- duration;
- communicability;
- distance/context;
- shared confined space;
- protective capability;
- treatment/isolation state.

## 14.2 Airborne/Respiratory

Environment/structure services may provide enclosure/ventilation context. 29F uses that context but does not calculate building airflow CFD.

A crowded enclosed room may increase exposure; outdoor contact may reduce it. The exact multiplier remains bounded and readable.

## 14.3 Food/Water

29C owns consumption and submits `IngestionExposure`. 29F handles infection/toxin outcome.

## 14.4 Wound

29E exposes open-wound contamination. 29F evaluates infection risk based on:

- wound type/region;
- open/closed/dressed state;
- contamination magnitude;
- elapsed time;
- cleaning/treatment state;
- actor susceptibility.

## 14.5 Vector

Creature/ecology systems resolve the vector contact or local vector pressure. 29F does not simulate insect population ecology itself.

## 14.6 Environmental

A hazard volume or site may expose actors to spores/pathogens. Presence in an ordinary biome is insufficient unless a disease definition/source declares the hazard.

# 15. Contamination, Sanitation and Cleanliness Boundary

## 15.1 Contamination Is External State

Examples of external contamination owners:

- 26B water/liquid contamination;
- Item/Recipe food safety/spoilage;
- settlement sanitation/waste systems;
- world blocks/sites/hazard volumes;
- 29E wound contamination state;
- creature carcass/ecology state.

29F consumes the resulting pathogen/toxin exposure tags and magnitude.

## 15.2 Sanitation Prevention

Set 20/20D may expose service results such as:

- clean-water coverage;
- wastewater/sanitation adequacy;
- clinic clean-zone quality;
- quarantine/isolation capacity;
- waste accumulation risk;
- food-service safety;
- overcrowding pressure.

29F converts those into exposure/transmission modifiers or population disease pressure. It never decides whether the sanitation building exists or is staffed.

## 15.3 No Daily Cleanliness Chore

Standard does not require the player to wash a hidden dirt meter. Cleaning actions matter only when linked to a valid source, such as:

- cleaning a contaminated wound;
- washing toxin from skin/equipment through 29G/item systems;
- purifying contaminated water;
- decontaminating a clinic/site;
- changing contaminated bedding/equipment if content defines it.

# 16. Wound Infection and 29E Complication Handoff

29E already defines the Wound Contamination Exposure interface.

## 16.1 Local Infection Instance

When a wound-associated disease establishes, the Disease Instance stores `linked_wound_id`.

29F may then report to 29E:

- recovery-rate reduction;
- recovery-ceiling reduction;
- pain modifier request;
- worsening/reopening risk request;
- care urgency.

29F **does not** directly edit 29E injury data.

## 16.2 Infection Progression Example

1. Puncture wound exists under 29E.
2. Contaminated floodwater exposure enters the wound.
3. 29E submits wound contamination exposure.
4. 29F accumulates `disease.infection.wound_local` exposure.
5. Threshold crosses; Local Wound Infection Disease Instance is created.
6. Disease reduces injury recovery and raises care need.
7. 29G treatment may clean/treat infection.
8. 29F resolves disease; 29E then removes complication modifier and continues wound recovery.

# 17. Food, Water and Ingestion-Borne Disease

29C's atomic consumption and ingestion-safety logic remains authoritative for eating/drinking.

## 17.1 Ingestion Exposure

29F consumes:

- source consumable;
- serving count;
- safety profile;
- freshness/contamination state;
- actor biological profile;
- pathogen/toxin tags/magnitude;
- transaction ID/time.

## 17.2 Hydration Still Applies

If the player drinks contaminated water, 29C may correctly restore Hydration while 29F separately receives disease/toxin exposure. Unsafe water is not magically non-water.

## 17.3 Food Poisoning Is Not One Generic Debuff

Different unsafe foods may create:

- bacterial-like foodborne disease;
- parasite exposure;
- natural plant toxin;
- alchemical toxin;
- realm-specific biological disease.

The source definition decides exposure; 29F applies the matching disease/toxin rules.

# 18. Creature, Vector, Parasite and Ecology Integration

## 18.1 Creature Source Traits

Creature/ecology definitions may expose:

- venom/toxin definition ID;
- venom dose class;
- disease carrier tags;
- disease reservoir/host tags;
- vector capability;
- bite/sting exposure mapping;
- carcass contamination profile;
- parasite source profile;
- biological immunity/resistance profile.

29F does not decide creature behaviour or spawn ecology.

## 18.2 Parasites

Parasites may use the Disease framework when they create host biological progression. They may add specialised fields such as:

- lifecycle phase;
- host requirement;
- transmission route;
- treatment tags;
- environmental shedding;
- chronic/carrier possibility.

Do not create a separate universal parasite engine unless content demonstrates a real need beyond the Disease schema.

## 18.3 Livestock and Domestic Animals

Animal illness can affect settlement production through the same biological framework where practical. Distant livestock should use herd/cohort disease summaries rather than thousands of individual timers.

# 19. Magical, Dimensional and Corruption Boundary

## 19.1 Magic May Cause Biological Exposure

A spell, curse-like effect, ritual accident or realm hazard may submit a Disease/Toxin exposure only if its definition explicitly declares a biological effect.

Examples:

- fungal nature magic releases infectious spores;
- alchemical cloud carries a toxin definition;
- dimensional parasite exposure uses disease schema.

## 19.2 Corruption Remains External

Corruption, curse, void-touch and similar magical world-state systems remain owned by Magic/Realm systems. They may apply biological modifiers or secondary disease/toxin exposure, but 29F does not rename all corruption into disease.

## 19.3 Magical Cleansing

Magic may supply an authorised treatment capability to 29G. 29F then applies the biological outcome requested by 29G. Visual cleanse effects alone do not cure disease.

# 20. Disease Recovery, Resistance Memory, Carrier and Chronic States

## 20.1 Recovery Eligibility

Disease recovery may depend on:

- disease-specific natural clearance;
- actor resistance;
- rest/sleep;
- adequate nutrition/hydration;
- stable thermal environment;
- linked wound treatment;
- medicine/treatment;
- absence of continued exposure;
- difficulty profile.

## 20.2 Natural Recovery

Many Mild/Moderate Standard illnesses should recover naturally with time and basic care. Specialist treatment should shorten duration, prevent escalation, improve comfort or resolve diseases that do not naturally clear.

## 20.3 Resistance Memory

On recovery, 29F may create a `DiseaseResistanceMemory` with:

- disease/family/strain ID;
- resistance strength;
- start time;
- decay profile;
- reinfection multiplier;
- source history.

## 20.4 Chronic State

Chronic disease is optional and should be uncommon in Core Standard content. A chronic state must have:

- clear management/counter path;
- bounded gameplay penalties;
- accessible UI explanation;
- no permanent character-ruin default;
- explicit content approval.

## 20.5 Carrier State

Carrier state may exist for selected diseases where simulation value justifies it. It must not become a hidden grief mechanic in multiplayer. Transmission risk and diagnosis need appropriate safeguards.

# 21. Poison and Toxin System Architecture

Poison is represented as **per-toxin instances**, not one generic status.

## 21.1 Poison Instance Fields

- poison instance ID;
- toxin definition ID;
- actor ID;
- source event/source ID;
- route;
- current toxin load 0-100;
- onset state;
- active severity;
- elimination rate/profile;
- treatment state;
- target biological systems/modifier bundle;
- next update time;
- schema version.

## 21.2 `PoisonLevel()` Summary

`PoisonLevel()` returns the highest/weighted bounded danger across active toxin instances. It must not simply sum every toxin to values above 100.

Suggested aggregation:

- take highest active toxin danger as primary;
- add diminishing contribution from additional different toxins;
- cap at 100;
- retain reason trace listing dominant toxins.

# 22. Toxin Exposure Dose, Accumulation and Thresholds

## 22.1 Dose Application

`effective_dose = source_dose x route_absorption x susceptibility x protection_modifier`

Dose adds to the toxin's current load after accounting for immediate neutralisation/prophylaxis.

## 22.2 Reference Toxin Load Bands

| Toxin Load | Band | Standard Meaning |
| ---: | --- | --- |
| 0-19 | Trace | Usually no/minimal symptoms; clearing. |
| 20-39 | Mild | Noticeable toxin effect. |
| 40-59 | Moderate | Meaningful stamina/recovery impact. |
| 60-79 | Severe | Strong symptoms, treatment priority. |
| 80-100 | Critical | Biological emergency; may produce Critical Condition/Health damage. |

## 22.3 Repeated Dose

Repeated compatible exposures increase the same toxin instance. This supports venom stacking without status spam.

A toxin definition may declare:

- linear accumulation;
- diminishing absorption;
- dose cap;
- threshold transformation;
- tolerance/prophylaxis response.

# 23. Poison Onset, Active Effects, Peak and Elimination

## 23.1 Poison Lifecycle

| Stage | Meaning |
| --- | --- |
| Latent | Dose received; effects not yet fully active. |
| Onset | Symptoms begin. |
| Active | Main effects apply. |
| Peak | Maximum current burden/effect. |
| Clearing | Elimination exceeds incoming dose. |
| Cleared | Toxin load biologically irrelevant/zero. |
| Persistent | Optional long-lived toxin accumulation for specialist content. |

## 23.2 Elimination

Each toxin has an elimination rate or half-life. Reference parent range is broad: **5-20 toxin-load points per simulation hour** for common short-duration toxins.

Slow cumulative toxins may clear much more slowly. Fast combat toxins may peak/clear in minutes, but persistent poisoning should not be indistinguishable from a 5-second combat status.

## 23.3 Toxin-Derived Health Damage

If a toxin causes Health damage, 29F acts as the biological source and submits a bounded authorised damage request to 29B. 29F never writes Health directly.

No ordinary toxin may secretly bypass `CriticalCondition`/death ownership to kill an actor by setting a death flag.

# 24. Venom, Ingested, Inhaled, Contact and Environmental Toxins

## 24.1 Venom

Venom commonly arrives through injection after a bite/sting/weapon event. Physical trauma and venom remain separate.

Possible toxin families include:

- neurotoxic - stamina/manual/head function pressure;
- hemotoxic - bleeding/recovery interaction through 29E interface;
- cytotoxic - Health/recovery damage;
- paralytic/sedative - severe capacity reduction without direct movement ownership;
- magical/alchemical venom - specialist authored effects.

These are mechanic families, not a mandated final content roster.

## 24.2 Ingested Toxin

29C ingestion creates exposure. The toxin definition controls absorption/onset and whether vomiting/appetite symptoms are produced.

## 24.3 Inhaled Toxin

Environment/hazard owner supplies concentration and exposure duration. 29F handles toxin burden. Ventilation/filter mechanics remain external.

## 24.4 Contact Toxin

External equipment/environment determines contact protection. 29F applies absorbed dose. Persistent external contamination remains with its owner.

## 24.5 Environmental Toxic Fluid

26B/Blocks may report poison sludge or contaminated water. 29F does not simulate fluid spread; it receives contact/ingestion exposure when the actor actually interacts with it.

# 25. Multi-Toxin Interaction, Resistance and Protection

## 25.1 Multiple Toxins

Different toxin definitions may coexist. Their ordinary physiological modifiers compose with diminishing/bounded rules.

## 25.2 Same Toxin

Same-toxin exposure adds to one load unless definition explicitly uses separate compartments.

## 25.3 Resistance

Biological profiles, equipment, magic, perks or prophylaxis may modify:

- absorption;
- toxin-load gain;
- effect severity;
- elimination rate;
- treatment effectiveness.

Only explicit immunity blocks exposure entirely.

## 25.4 Cross-Toxin Synergy

Dangerous synergy must be authored explicitly. The system does not multiply every poison combination automatically.

Example: two sedative toxins may share a `sedative_stack_group` with diminishing stacking rather than doubling action impairment.

# 26. Biological Hazards, Pollution, Spores and Reserved Radiation

## 26.1 Biological Hazard Interface

29F can represent biological consequences from:

- sewage/pathogen contamination;
- mould/fungal spores;
- decaying carcasses where ecology supplies risk;
- industrial/alchemical fumes;
- toxic dust;
- poison sludge;
- contaminated floodwater;
- disease-bearing waste;
- realm-specific biological hazards.

## 26.2 Pollution Boundary

Automation/industry/world systems own pollution generation and world state. 29F only owns actor biological exposure once a valid hazard interface reports it.

## 26.3 Smoke and Suffocation

Smoke may carry toxins/irritants through 29F, but oxygen depletion/suffocation remains with the relevant respiration/environment owner. Do not duplicate drowning/breath mechanics.

## 26.4 Radiation Reserved

`radiation` remains a schema-reserved hazard family only. No UI meter, decay rule, disease roster or world-generation requirement is activated until another approved system introduces a genuine need.

# 27. Health, Stamina, Exertion and Fatigue Integration

29B remains owner of Health, Stamina, Exertion, Fatigue and generic recovery.

29F publishes a `DiseasePoisonModifierBundle` containing only relevant fields.

## 27.1 Standard Bounds

Ordinary single Mild disease/poison should generally remain within:

- Stamina regeneration: 0.90-1.00x;
- Stamina cost: 1.00-1.10x;
- Fatigue gain: 1.00-1.10x;
- Health recovery: 0.85-1.00x.

Moderate/Severe conditions may exceed these effects, but combined modifiers remain clamped by 29B.

## 27.2 Health Damage

Disease/poison may request Health damage only when its definition declares it. Mild illness should not necessarily deal damage.

Critical disease/toxin may set biological `CriticalCondition` through 29B state/output, but downed/death remains external.

# 28. Hunger, Hydration, Temperature, Wetness and Sleep Integration

## 28.1 Hunger/Nutrition

29F may publish modest metabolic/appetite modifiers. 29C owns actual Hunger/Nutrition state.

## 28.2 Hydration

Fever, vomiting or toxin effects may increase hydration demand when Thirst is enabled. When Thirst is disabled, 29F cannot create a hidden dehydration penalty; the condition expresses itself through other enabled mechanics.

## 28.3 Temperature

Fever/chills may alter thermal tolerance or preferred comfort through 29D. 29F does not edit ambient temperature.

## 28.4 Wetness

Wetness is not disease. Contaminated wet exposure may create disease exposure only when external contamination exists.

## 28.5 Sleep

Disease/poison may reduce Sleep Quality or increase Sleep Need. 29D owns Sleep Pressure and sleep action/results.

# 29. Injury, Bleeding and Pain Integration

## 29.1 Wound Infection

Covered in Section 16; 29F uses linked wound IDs and complication output.

## 29.2 Poison and Bleeding

A hemotoxic poison may request a `BleedingComplicationModifier` to 29E. 29E decides how its Blood Loss/bleeding state changes. 29F never edits Blood Loss directly.

## 29.3 Poison and Pain

Toxin-induced pain/discomfort may contribute a biological pain modifier. 29E remains owner of injury-derived Pain Load. 29J must reconcile whether systemic non-injury pain is represented as a shared biological discomfort channel or a separate condition modifier rather than forcing toxin pain into injury records.

## 29.4 Recovery Interaction

Disease/poison can reduce injury recovery through AM-29-035. Once disease/poison resolves, 29E re-evaluates recovery without deleting the physical injury.

# 30. Medicine, Antidotes, Diagnosis and 29G Handoff

29G will own first-aid, medicine actions, dosing, treatment procedures and validated treatment outcomes.

## 30.1 29F Treatment Requirements

Disease/toxin definitions expose capability tags such as:

- symptom control;
- infection suppression;
- antimicrobial/antiparasitic treatment family;
- antidote family;
- toxin neutralisation;
- toxin elimination support;
- hydration support;
- fever support;
- wound-linked infection treatment;
- quarantine/isolation recommendation;
- specialist diagnosis requirement;
- magical cleansing compatibility.

## 30.2 Diagnosis

29F owns the true disease/toxin identity and observable biological symptoms. It does not automatically reveal that identity to the player.

Diagnosis may be supplied by:

- player knowledge/research;
- healer/doctor capability;
- laboratory/alchemy service;
- magical detection;
- obvious source evidence;
- quest/story knowledge.

29F exposes `diagnosis_requirement_tags` and symptom evidence. UI/knowledge/social owners decide what is known.

## 30.3 Treatment Outcome

29G submits an atomic `DiseasePoisonTreatmentOutcome`, such as:

- reduce disease burden;
- reduce toxin load;
- block progression for duration;
- accelerate resolution;
- reduce communicability;
- clear exposure accumulator;
- apply prophylaxis/resistance;
- suppress symptom bundle;
- cure condition where authorised;
- remove/alter chronic/carrier state where definition permits.

29F validates compatibility and commits the biological state once.

# 31. NPCs, Companions, Doctors and Social Care Integration

Set 28 owns who chooses to care, who trusts whom, doctor dialogue, companion loyalty and recruitment.

29F exports:

- `DiseaseState()`;
- `PoisonLevel()`;
- `CareNeed()`;
- `TreatmentUrgency()`;
- `TransmissionRisk()`;
- `IsolationRecommendation()`;
- `RecoveryStatus()`;
- `CanTravelBiologically()`;
- `ExpectedDiseaseDowntime()`;
- known/unknown symptom summary.

A companion may decide to bring medicine or refuse close contact based on Set 28 personality/relationship logic. 29F does not make that social decision.

# 32. Settlements, Sanitation, Quarantine and Population Health

## 32.1 Population Health Inputs

Settlement systems may supply:

- population/cohort composition;
- housing density/overcrowding;
- clean-water satisfaction;
- sanitation/waste satisfaction;
- healthcare capacity;
- medicine stock availability;
- quarantine/isolation capacity;
- food safety service;
- disaster displacement;
- local disease-source pressure from ecology/world events.

## 32.2 Population Disease Pressure

At distant LOD, 29F may maintain per-settlement/cohort values such as:

- susceptible population;
- exposed count/pressure;
- active cases by disease/severity;
- recovering cases;
- care demand;
- transmission pressure;
- workforce impact;
- medicine capability demand.

This is a bounded simulation summary, not a hidden abstract disease that ignores individual named NPCs.

## 32.3 Named NPC Preservation

Named, quest-relevant, companion, leader or severe-case NPCs retain individual Disease Instances even when settlement simulation is distant.

## 32.4 Quarantine

Set 20/governance decides whether quarantine exists/is enforced. 29F supplies biological isolation value and transmission risk.

A quarantine building with no clean water, staff or capacity cannot magically eliminate disease.

# 33. Economy, Workforce and Resource-Demand Integration

Set 27 owns economics.

29F may export:

- `MedicalDemand()`;
- `DiseaseWorkforceImpact()`;
- `WorkCapacityModifier()`;
- `ExpectedDiseaseDowntime()`;
- `OutbreakBurden()`;
- disease/poison treatment demand tags;
- population care demand.

Set 27 decides:

- medicine price;
- healer wages;
- lost production value;
- scarcity response;
- trade/import opportunity;
- insurance/debt/tax consequences.

29F never increases prices directly.

# 34. Quests, Events, Outbreaks and World Consequences

Document 15 owns quests/events.

29F may emit biological events:

- `DiseaseEstablished`;
- `DiseaseStageChanged`;
- `DiseaseSeverityChanged`;
- `TransmissionRiskChanged`;
- `PopulationDiseasePressureChanged`;
- `OutbreakThresholdSuggested`;
- `DiseaseResolved`;
- `PoisonLoadBandChanged`;
- `CriticalToxinState`;
- `TreatmentFailure/Success` where biological result is relevant.

Quest/Event may then create:

- outbreak response;
- medicine shortage;
- quarantine request;
- source investigation;
- contaminated-water repair;
- healer recruitment;
- vector-control expedition;
- faction/political consequence.

29F does not create the quest graph.

# 35. Difficulty Profiles and Custom World Settings

| Setting | Peaceful | Relaxed | Standard | Harsh |
| --- | --- | --- | --- | --- |
| Routine disease frequency | Very low/off option | Low | Uncommon | Higher |
| Exposure threshold | High | +20% | 1.0x | -15% reference |
| Exposure decay | Fast | Faster | Definition baseline | Slower |
| Disease severity | Strongly reduced | Reduced | Baseline | Stronger |
| Wound infection | Usually off/reduced | Reduced | Requires real contamination | More sensitive |
| Food/water disease | Reduced/off option | Reduced | Source-driven | Stronger |
| Transmission | Low | Reduced | Baseline | Increased |
| Poison dose | Reduced | -20% reference | Baseline | +15% reference |
| Natural toxin elimination | Fast | +25% | Baseline | -20% |
| Chronic outcomes | Off by default | Rare | Explicit content only | More available if enabled |
| Population outbreaks | Strongly reduced | Reduced | Source/capacity-driven | Higher pressure |
| Death ownership | External in all profiles | External | External | External |

## 35.1 Custom Toggles

World settings may separately adjust:

- disease enabled;
- disease transmission;
- wound infection;
- food/water disease;
- parasite content;
- poison severity;
- poison accumulation;
- chronic disease;
- NPC disease simulation;
- settlement outbreaks;
- hidden diagnosis/knowledge depth;
- accessibility warning strength.

Disabling a system should preserve content safely. A venomous creature may still have a venom loot item even if player poison severity is zero; the combat/exposure result simply follows the world profile.

# 36. Simulation LOD, Population Cohorts and Offline Rules

## 36.1 LOD Model

| LOD | Disease/Poison Representation |
| --- | --- |
| L0 Active | Full per-actor exposure, disease/toxin instances, symptoms and treatment. |
| L1 Local Reduced | Same authoritative instances; scheduled updates at reduced frequency. |
| L2 Settlement/Chunk | Named important cases + cohort disease summaries; batch transmission/care. |
| L3 Regional | Disease pressure, active-case counts, workforce/care demand, exceptional named cases. |
| L4 Dormant | Persist state and next scheduled milestones; no continuous ticking. |

## 36.2 Scheduled Progression

Disease/toxin progression uses world simulation time and scheduled milestones rather than per-frame timers.

## 36.3 Promotion/Demotion

Demotion commits:

- disease stage/severity;
- toxin load/stage;
- next update time;
- treatment state;
- transmission risk;
- resistance memory;
- source/history references.

Promotion reconstructs presentation without rerolling infection or changing stage arbitrarily.

## 36.4 Offline Safety

Closing a local world does not advance wall-clock disease into death by default.

Dedicated-server worlds may continue because authoritative simulation is genuinely running; this is not offline catch-up.

# 37. Multiplayer Authority, Transactions and Replication

## 37.1 Server Authority

The authoritative world owns:

- exposure application;
- infection establishment;
- disease/toxin progression;
- treatment outcome;
- transmission events;
- Health damage requests;
- population summaries.

Clients cannot cure themselves or apply poison to another player by editing local status.

## 37.2 Transaction IDs

Required one-time IDs for:

- ingestion exposure;
- bite/sting venom exposure;
- disease contact exposure batches;
- treatment outcomes;
- antidote/medicine consumption;
- toxin-derived damage ticks/transactions.

## 37.3 PvP/Grief Prevention

Poisoning players, food or wells may be permitted by server/world rules, but:

- source actions must be authoritative and auditable;
- protection/ownership permissions remain external;
- biological state must retain source evidence;
- Set 28/law systems decide social/legal consequences;
- accessibility/difficulty settings may reduce or disable hostile biological effects.

# 38. UI, Knowledge, Diagnosis Feedback and Accessibility

Document 17 owns UI. 29F supplies the data contract.

## 38.1 Condition Presentation

Routine HUD should remain contextual.

Recommended display progression:

- exposure warning only when the actor can reasonably perceive/know it;
- symptoms shown first;
- disease name shown when known/diagnosed;
- severity/trend shown when useful;
- cause/counter explanation available on inspection.

## 38.2 Knowledge-Sensitive Disease

Possible UI states:

- "Feeling feverish";
- "Unidentified illness";
- "Marsh Fever - Moderate" after diagnosis;
- "Likely source: contaminated water" only when knowledge/evidence supports it.

The simulation does not lie to the UI, but the UI does not reveal hidden knowledge for free.

## 38.3 Poison Feedback

Rapid toxins require faster warning than slow disease. The player should receive clear multi-channel cues for Severe/Critical toxin load.

## 38.4 Accessibility

Authoritative symptoms may not require:

- camera sway;
- blur;
- forced field-of-view change;
- colour-only screen tint;
- heartbeat audio alone;
- input reversal;
- flashing.

Accessibility may remove or reduce these presentation effects without changing biological severity.

Text, icon shape, captions and optional stronger alerts must convey critical deterioration.

# 39. Registry Definitions, Runtime Records and Data Contracts

Set 25 governance remains mandatory.

## 39.1 Definition Families

- `DiseaseDefinition`;
- `DiseaseFamilyDefinition`;
- `DiseaseTransmissionProfile`;
- `DiseaseSymptomProfile`;
- `DiseaseResistanceProfile`;
- `ToxinDefinition`;
- `ToxinFamilyDefinition`;
- `BiologicalExposureProfile`;
- `TreatmentRequirementProfile`;
- `PopulationDiseaseProfile`;
- `HazardBiologyFacet` where allowed by Set 25.

## 39.2 Disease Definition Fields

Minimum candidate fields:

- qualified ID;
- display/localisation keys;
- disease family/tags;
- compatible host profile tags;
- transmission routes;
- establishment threshold;
- exposure-decay profile;
- incubation range;
- stage graph;
- severity rules;
- symptom/modifier bundles;
- communicability by stage;
- natural recovery rules;
- resistance/immunity result;
- chronic/carrier permissions;
- treatment capability requirements;
- diagnosis requirements;
- population LOD parameters;
- difficulty overrides;
- content/production status.

## 39.3 Toxin Definition Fields

- qualified ID;
- toxin family/tags;
- compatible exposure routes;
- dose conversion;
- load bands;
- onset profile;
- modifier bundles;
- Health damage schedule if any;
- elimination profile;
- accumulation/stacking policy;
- resistance tags;
- antidote/treatment capability tags;
- injury complication hooks;
- difficulty overrides;
- production status.

## 39.4 Runtime Records

- `DiseaseExposureAccumulator`;
- `DiseaseInstance`;
- `DiseaseResistanceMemory`;
- `PoisonInstance`;
- `PopulationDiseaseSummary`;
- `BiologicalExposureHistoryEntry` for bounded audit/history where needed.

## 39.5 Qualified ID Governance Conflict

Set 25's earlier ecology ownership for the `disease` domain must be reconciled in 29J/Set 25 final integration. Until then:

- 29F examples use conceptual qualified IDs only;
- no existing 24F/10 content identity is silently deleted;
- migration may separate disease **source ecology** from disease **biological condition definition**;
- one final canonical owner must be selected before production registry admission.

# 40. Balance, Anti-Grind and Anti-Exploit Rules

## 40.1 No Random Daily Sickness

Healthy players in safe Standard conditions do not randomly become ill because a hidden timer fired.

## 40.2 No Wetness Disease Myth

Wetness without a valid pathogen source creates no infection exposure.

## 40.3 No Every-Bite Fatal Poison

Routine venom should create readable load and counterplay. Critical toxins may exist but must be telegraphed/content-gated.

## 40.4 No Universal Antidote

One cheap item must not clear every toxin/disease unless an explicitly rare high-tier capability is designed for that purpose.

## 40.5 No Treatment Duplication

Treatment and medicine transactions apply once and consume real items/services through owning systems.

## 40.6 No Invisible Reinfection Spam

Exposure accumulators consolidate by disease. Established disease does not spawn duplicate identical instances every contact tick.

## 40.7 No Population Exponential Explosion by Tick

Distant disease uses bounded cohort equations/pressure, not pairwise every-NPC contact simulation.

## 40.8 No Offline Death Trap

Local offline wall-clock time does not silently progress disease/poison to death.

## 40.9 No Quarantine Magic

A quarantine building is a capacity/modifier source, not an instant cure.

## 40.10 No Hidden Hygiene Chore

Prevention is tied to real water, sanitation, food safety, wound care and hazard systems.

## 40.11 No Cross-Set Leakage

29F never writes prices, dialogue, movement speed, quest stages, building capacity or creature AI.

## 40.12 No Uncounterable Core Disease

Routine Core diseases must have at least one reachable prevention, recovery or treatment route consistent with the selected difficulty. Exceptional story diseases may break this only when authored intentionally and clearly.

# 41. Validation, Test Cases and Acceptance Criteria

## 41.1 Data Validation

Validators should reject:

- duplicate disease/toxin IDs;
- disease with no compatible host or route;
- transmissible disease with no transmission profile;
- disease stages with impossible/cyclic transitions;
- routine Standard disease with no recovery/treatment route;
- toxin with negative/undefined elimination policy;
- toxin directly setting player death;
- disease directly editing movement speed;
- disease setting prices/dialogue/reputation;
- wound infection missing valid 29E link policy;
- contamination source that bypasses exposure interface;
- treatment requirement with no capability/provider path for Core content;
- chronic state enabled by default without explicit approval;
- a `disease` registry ownership declaration conflicting with Set 25 without reconciliation flag;
- save records using removed IDs without alias/migration.

## 41.2 Required Gameplay Tests

1. A healthy Standard player in a safe settlement for seven in-game days does not randomly acquire disease.
2. Standing in normal rain while wet does not create infection exposure.
3. Drinking confirmed clean water restores Hydration and creates no disease exposure.
4. Drinking contaminated water creates exactly one 29F ingestion exposure per consumption transaction.
5. Repeated low disease exposures below threshold decay and do not establish infection.
6. Sufficient repeated exposure crosses the deterministic infection threshold and creates one Disease Instance.
7. Repeated contact after infection worsens/refreshes the same compatible disease rather than creating duplicates.
8. An Incubating disease has no free identity reveal to the player without knowledge/diagnosis.
9. Disease progresses from incubation to symptoms using simulation time after save/reload.
10. A recovered disease applies its configured resistance memory.
11. A disease without acquired immunity allows later reinfection after exposure.
12. An immune biological profile rejects an incompatible ordinary disease.
13. An open contaminated wound hands exposure from 29E to 29F and may establish linked wound infection.
14. Wound infection slows 29E recovery through complication interface without 29F editing wound data directly.
15. Treating the infection removes complication modifier while the physical wound remains.
16. A spider bite creates a puncture injury and a separate venom Poison Instance.
17. Repeated same-venom doses raise one toxin load rather than creating many statuses.
18. Toxin load clears according to its elimination profile when exposure stops.
19. Antidote treatment through 29G reduces the correct toxin and consumes exactly one authoritative item/service transaction.
20. A toxin Health-damage effect routes through 29B and cannot apply duplicate damage event IDs.
21. Two different toxins combine through bounded/diminishing aggregation and `PoisonLevel()` never exceeds 100.
22. Set 30 receives biological capacity modifiers but 29F never edits movement speed.
23. Set 28 receives care/transmission state but 29F never chooses companion behaviour.
24. Set 27 receives workforce/medical demand but 29F never changes prices.
25. A clinic with no clean water/medicine does not provide full disease-care benefit.
26. Quarantine capacity lowers transmission pressure but does not cure existing cases.
27. Distant settlement simulation preserves case counts/medicine demand without per-NPC frame updates.
28. Named severe-case NPC disease remains individually traceable after LOD demotion/promotion.
29. Closing a local world for real-world hours does not cause wall-clock disease death on reload.
30. Peaceful mode strongly reduces/blocks routine disease/poison while preserving content compatibility.
31. Harsh mode increases exposure/toxin consequence without changing ownership/data schemas.
32. Maritime contaminated water from 26B produces exposure only after actual contact/ingestion.
33. Creature ecology vector pressure creates disease exposure through explicit vector events, not 29F-spawned insects.
34. Magical cleansing only cures when a valid treatment capability/outcome exists.
35. Legacy generic `status.poisoned` migrates into a valid Poison Instance or compatibility wrapper without data loss.

## 41.3 29F Acceptance Criteria

29F is acceptable when:

- disease and poison have one authoritative biological runtime;
- routine disease requires valid exposure;
- disease acquisition/progression is explainable and testable;
- poison uses per-toxin burden rather than one generic DOT;
- injury, nutrition, temperature, Health and treatment owners remain intact;
- settlement sanitation/quarantine can materially affect disease without being redefined;
- population simulation scales to civilisation size;
- Standard is meaningful but not maintenance-heavy;
- Peaceful/Relaxed/Harsh use the same compatible data model;
- Set 27/28/30 ownership remains intact;
- all new interfaces are recorded for final reconciliation.

# 42. Cross-Set Interface Amendments

The following additions formalise required interfaces without transferring gameplay ownership.

## AM-29-017 Refinement - Ingestion Exposure Handoff

**29C -> 29F**

Retain the existing `IngestionExposure` payload and add optional:

- explicit `hazard_definition_ids[]`;
- exposure route = ingestion;
- concentration/potency band;
- external protection/treatment context if already active.

29C continues to own consumption/Hydration/Nutrition; 29F owns disease/toxin resolution.

## AM-29-034 Adoption - Wound Contamination Exposure Interface

**29E -> 29F**

29F adopts the existing payload:

- wound ID/family;
- region;
- open/closed state;
- contamination magnitude/source tags;
- cleaning/dressing state;
- wound age;
- actor resistance profile reference.

29F creates disease exposure; 29E remains wound owner.

## AM-29-035 Adoption - Injury Complication Feedback Interface

**29F -> 29E**

29F may request:

- recovery-rate modifier;
- recovery-ceiling modifier;
- pain/discomfort modifier;
- worsening/reopening evaluation;
- infection care urgency.

29E validates/applies physical injury consequences.

## AM-29-040 - Universal Biological Exposure Source Interface

**Creatures / Items / Blocks / World / Fluids / Magic / Hazards -> 29F**

Requires stable `BiologicalExposure` with event ID, actor, source, hazard definition/tag, route, magnitude/dose, timestamp and authority token.

Source systems retain all source/world behaviour ownership.

## AM-29-041 - Disease Transmission Contact Interface

**Local actor/environment contact resolver -> 29F**

Provides bounded contact/exposure batches containing:

- source Disease Instance or disease ID;
- susceptible actor IDs/cohort;
- route;
- contact duration/intensity band;
- enclosure/ventilation/protection context;
- event/batch ID.

29F resolves exposure. Set 28 does not own transmission biology; AI/world systems do not own infection outcome.

## AM-29-042 - Disease and Poison Modifier Bundle

**29F -> 29B / 29C / 29D**

Expose per-actor bounded fields:

- stamina regeneration/cost multipliers;
- fatigue gain modifier;
- natural Health recovery modifier/blocker;
- hunger/metabolic demand modifier;
- hydration demand modifier (only when enabled);
- thermal tolerance/fever/chills modifier;
- sleep-quality modifier;
- reason trace.

Consuming Set 29 documents apply values in their own pipelines.

## AM-29-043 - Disease/Poison Social Care Interface

**29F -> Set 28**

Expose:

- `DiseaseState()`;
- `PoisonLevel()`;
- `CareNeed()`;
- `TreatmentUrgency()`;
- `TransmissionRisk()`;
- `IsolationRecommendation()`;
- `RecoveryStatus()`;
- `CanTravelBiologically()`.

Set 28 owns doctor/companion/social behaviour.

## AM-29-044 - Population Disease and Workforce Interface

**29F -> Set 27 / Settlement systems**

Expose:

- active-case counts/bands;
- population disease pressure;
- treatment/medicine demand classes;
- `DiseaseWorkforceImpact()`;
- `ExpectedDiseaseDowntime()`;
- outbreak burden;
- quarantine/isolation demand.

Set 27 owns financial/economic consequence. Settlements own services/buildings.

## AM-29-045 - Sanitation and Quarantine Service Interface

**Document 20/20D/20F -> 29F**

Expose bounded service state:

- clean-water satisfaction;
- sanitation/wastewater satisfaction;
- food-service safety;
- overcrowding pressure;
- healthcare treatment capacity;
- quarantine/isolation capacity;
- clean/dirty route validation;
- medicine availability summary.

29F uses these only for biological risk/progression.

## AM-29-046 - Outbreak Pressure Event Interface

**29F -> Document 15 Quest/Event**

Emit threshold events with:

- settlement/region;
- disease ID/family;
- case/severity pressure;
- transmission trend;
- care shortfall;
- source confidence/evidence where available.

Document 15 decides whether an outbreak event/quest exists and how it progresses.

## AM-29-047 - Toxin Exposure Interface

**Creatures / Combat / Items / Blocks / Fluids / Magic -> 29F**

Specialised toxin payload may include:

- toxin definition ID;
- route;
- raw dose;
- concentration;
- source attack/action/item ID;
- linked physical injury ID if any;
- event ID/time.

29F owns toxin burden; Combat/Creature/Item systems retain source mechanics.

## AM-29-048 - Disease/Poison Treatment Outcome Interface

**29G -> 29F**

Treatment outcomes may request:

- exposure reduction;
- disease-burden reduction;
- toxin-load reduction;
- progression suppression;
- communicability reduction;
- resolution acceleration;
- cure/clear where capability permits;
- resistance/prophylaxis addition;
- symptom suppression.

29F validates and persists result. 29G owns treatment action/resources.

## AM-29-049 - Creature/Ecology Host and Vector Interface

**Document 10 / 24F -> 29F**

Expose:

- host susceptibility/reservoir tags;
- carrier/vector tags;
- venom/toxin definition references;
- vector exposure event contract;
- carcass/environment shedding profile;
- ecology pressure summaries where used.

29F does not own creature spawning/migration.

## AM-29-050 - Disease Registry Ownership Reconciliation

**Set 25 / Document 10 / 24F / Set 29**

Set 25 currently associates the `disease` domain with ecology content. Set 29 now owns disease gameplay and actor biological truth.

Final integration must decide one canonical registry ownership arrangement, recommended as:

- ecology/creature definitions own sources, reservoirs, vectors and habitat links;
- Set 29 owns universal Disease Definition mechanics/condition schema and runtime instances;
- content packs may contribute disease content through the Set 29 schema under declared namespace/package governance.

This is a reconciliation proposal only; no ownership transfer is executed inside 29F.

## AM-29-051 - Maritime Contamination Exposure Interface

**Set 26B/26C/26J -> 29F**

Set 26 supplies:

- liquid contamination tags/concentration;
- water-body contamination state;
- maritime quarantine/service state;
- actual actor contact/ingestion context when resolved by relevant owner.

29F applies disease/toxin biology only. Fluid/world simulation remains Set 26.

## AM-29-052 - Protection and Prophylaxis Capability Interface

**Equipment / Magic / Progression / 29G -> 29F**

Expose capability tags/modifiers for:

- route blocking/filtering;
- disease resistance;
- toxin resistance;
- prophylaxis;
- temporary immunity;
- toxin neutralisation/elimination support.

29F applies biological effectiveness; source systems own unlocks/items/spells/perks.

## Amendment Status Table

| Amendment | Status | Ownership Transfer? | Final Review |
| --- | --- | --- | --- |
| AM-29-017 Refinement | Required | No | 29C/29F/29J |
| AM-29-034 Adoption | Required | No | 29E/29F/29J |
| AM-29-035 Adoption | Required | No | 29E/29F/29J |
| AM-29-040 | Proposed/required | No | Source systems + 29J |
| AM-29-041 | Proposed/required | No | AI/world/contact resolver + 29J |
| AM-29-042 | Internal Set 29 required | No | 29B/29C/29D/29J |
| AM-29-043 | Proposed/required | No | Set 28 final integration |
| AM-29-044 | Proposed/required | No | Set 27/Settlements integration |
| AM-29-045 | Proposed/required | No | Set 20 integration |
| AM-29-046 | Proposed/required | No | Document 15 integration |
| AM-29-047 | Proposed/required | No | Combat/Creature/Item/World integration |
| AM-29-048 | Internal Set 29 required | No | 29G/29J |
| AM-29-049 | Proposed/required | No | Document 10/24F/29J |
| AM-29-050 | Reconciliation required | No in 29F | Set 25/29J final integration |
| AM-29-051 | Proposed/required | No | Set 26/29J |
| AM-29-052 | Proposed/required | No | Equipment/Magic/Progression/29G |

# Appendix A. Reference Disease and Toxin Balance Tables

## A.1 Disease Exposure

| Parameter | Standard Reference |
| --- | --- |
| Exposure accumulator | 0-100 per disease |
| Common establishment threshold | 60 |
| Stable threshold variation | Optional, max +/-10% |
| Common exposure half-life | 2-6 simulation hours |
| Routine safe-condition disease roll | None |
| Wound infection | Requires valid wound contamination exposure |
| Wetness infection | Never by wetness alone |

## A.2 Disease Severity

| Severity | Typical Recovery/Care Intent |
| --- | --- |
| Mild | Self-care/rest; minimal medicine demand. |
| Moderate | Meaningful care/treatment benefit; some work/stamina loss. |
| Severe | Strong treatment priority; significant recovery/work loss. |
| Critical | Emergency biological state; external death/downed system may react. |

## A.3 Toxin Load

| Load | Band |
| ---: | --- |
| 0-19 | Trace |
| 20-39 | Mild |
| 40-59 | Moderate |
| 60-79 | Severe |
| 80-100 | Critical |

| Parameter | Standard Reference |
| --- | --- |
| Common short toxin elimination | 5-20 load/hour |
| Same toxin stacking | Adds to one instance |
| Multi-toxin summary | Bounded/diminishing, max 100 |
| Routine toxin instant death | Not permitted |

# Appendix B. Provisional 29F API Contract

## B.1 Core Queries

- `DiseaseState(actor_id)`
- `ActiveDiseases(actor_id)`
- `DiseaseSeverity(actor_id, disease_id)`
- `DiseaseBurden(actor_id, disease_id)`
- `TransmissionRisk(actor_id, disease_id=None)`
- `IsolationRecommendation(actor_id)`
- `DiseaseResistance(actor_id, disease_or_family_id)`
- `PoisonLevel(actor_id)`
- `ActivePoisons(actor_id)`
- `ToxinLoad(actor_id, toxin_id)`
- `CareNeed(actor_id)`
- `TreatmentUrgency(actor_id)`
- `RecoveryStatus(actor_id)`
- `CanTravelBiologically(actor_id)`
- `MedicalDemand(actor_or_population_id)`
- `WorkCapacityModifier(actor_id)`
- `DiseaseWorkforceImpact(population_id)`
- `ExpectedDiseaseDowntime(actor_or_cohort_id)`
- `OutbreakBurden(settlement_or_region_id)`

## B.2 Commands / Transactions

- `ApplyBiologicalExposure(payload)`
- `ApplyIngestionExposure(payload)`
- `ApplyWoundContaminationExposure(payload)`
- `ApplyToxinExposure(payload)`
- `ApplyDiseasePoisonTreatmentOutcome(payload)`
- `AdvanceDiseaseState(actor_id, elapsed_sim_time, context)`
- `AdvancePoisonState(actor_id, elapsed_sim_time, context)`
- `ResolveTransmissionBatch(payload)`
- `ApplyResistanceMemory(payload)`
- `MigrateLegacyDiseasePoison(payload)`

## B.3 Events

- `DiseaseExposureBandChanged`
- `DiseaseEstablished`
- `DiseaseStageChanged`
- `DiseaseSeverityChanged`
- `TransmissionRiskChanged`
- `DiseaseResolving`
- `DiseaseRecovered`
- `ChronicStateEntered`
- `CarrierStateChanged`
- `PoisonEstablished`
- `PoisonLoadBandChanged`
- `CriticalToxinState`
- `PoisonCleared`
- `PopulationDiseasePressureChanged`
- `OutbreakThresholdSuggested`

# Appendix C. Initial Disease and Poison Parent Definition Set

These are **parent mechanic examples**, not a final lore/content roster.

## C.1 Disease Parents

| Conceptual ID | Family | Purpose |
| --- | --- | --- |
| `condition.disease.foodborne_gut` | Foodborne | General unsafe-food/water illness parent. |
| `condition.disease.respiratory_fever` | Respiratory | Common transmissible fever parent. |
| `condition.disease.wound_infection` | Wound infection | Linked physical-wound infection parent. |
| `condition.disease.spore_exposure` | Environmental/fungal | Spore/inhalation illness parent. |
| `condition.disease.vector_fever` | Vector-borne | Marsh/vector disease parent. |
| `condition.disease.parasitic_general` | Parasite | Generic parasite lifecycle parent. |

## C.2 Toxin Parents

| Conceptual ID | Family | Purpose |
| --- | --- | --- |
| `condition.poison.venom_neurotoxic` | Venom/neurotoxin | Stamina/function pressure. |
| `condition.poison.venom_hemotoxic` | Venom/hemotoxin | Bleeding/recovery complication. |
| `condition.poison.toxin_cytotoxic` | Cytotoxin | Health/recovery harm. |
| `condition.poison.toxin_ingested` | Ingested toxin | Plant/food/alchemical poison parent. |
| `condition.poison.toxin_inhaled` | Inhaled toxin | Gas/fume/toxic dust parent. |
| `condition.poison.toxin_contact` | Contact toxin | Sludge/sap/contact poison parent. |

Final IDs must use the Set 25/29J canonical namespace decision.

# Appendix D. Runtime Record Templates

## D.1 Example Respiratory Disease Instance

```yaml
disease_instance_id: disease_instance:01K...
actor_id: npc:frontier.smith_0021
disease_definition_id: condition.disease.respiratory_fever
stage: active
severity: moderate
disease_burden: 54
communicability_band: moderate
source_event_id: transmission_batch:01K...
source_actor_id: npc:frontier.trader_0107
symptom_state:
  fever: moderate
  fatigue_gain_mult: 1.15
  stamina_regen_mult: 0.90
  health_recovery_mult: 0.85
next_progression_world_time: 247922.0
schema_version: 1
```

## D.2 Example Venom Poison Instance

```yaml
poison_instance_id: poison_instance:01K...
actor_id: player:local_1
toxin_definition_id: condition.poison.venom_neurotoxic
route: injection
toxin_load: 63
stage: active
severity: severe
source_event_id: creature_attack:01K...
linked_injury_id: injury_instance:01K...
elimination_rate_per_hour: 9.0
treatment_flags: []
next_update_world_time: 188422.0
schema_version: 1
```

## D.3 Example Population Disease Summary

```yaml
settlement_id: settlement:seed_4421.region_3_7.village_01
disease_definition_id: condition.disease.respiratory_fever
susceptible_count: 86
exposed_pressure: 0.28
active_cases:
  mild: 7
  moderate: 3
  severe: 1
recovering_cases: 4
quarantine_capacity_used: 6
care_capacity_shortfall: 2
medicine_demand_class: moderate
workforce_modifier: 0.91
next_update_world_time: 298000.0
```

# Appendix E. Worked Gameplay Examples

## E.1 Contaminated River Water

The player fills a container from a river whose fluid owner reports a disease-risk contamination tag. The container/item preserves that safety state. Later the player drinks it.

29C performs one atomic consumption: Hydration increases, then `IngestionExposure` is sent to 29F. Effective disease exposure reaches 34 - below the disease's 60 establishment threshold. The player does not become ill immediately. Several further drinks from the same unsafe source before exposure decays cross the threshold and create an Incubating food/water disease.

The UI initially shows no exact disease name because the source looked clear and the player lacked diagnosis knowledge. Symptoms appear later. A healer or water-testing knowledge can reveal the likely source. 29F never changes the river's contamination state; Set 26/world systems own that.

## E.2 Cave Spider Bite

Combat resolves a cave-spider bite. 29E creates a Minor puncture injury. Creature data supplies `venom_neurotoxic` dose 28 through AM-29-047. 29F creates a Mild Poison Instance.

A second bite adds dose to the same toxin instance and raises load to 52 Moderate. Stamina regeneration drops through 29B's modifier pipeline. Set 30 may make strenuous climbing harder because Stamina is affected, but 29F never sets climb speed.

The player uses an antidote. 29G consumes the item and sends a valid treatment outcome reducing toxin load by 35. The puncture wound remains until 29E heals it.

## E.3 Infected Wound After Flood

A guard has a Moderate leg laceration. Floodwater is externally tagged with sewage/pathogen contamination. 29D tracks Wetness but does not invent disease. 29E reports the open wound plus contamination exposure to 29F.

After repeated exposure the wound-infection threshold is crossed. The infection becomes Moderate, reducing the injury recovery rate. The settlement clinic has clean water and medicine but is overloaded, so care is delayed. Set 27 sees medical demand/workforce downtime. Set 28 may have a companion escort the guard. Document 15 may create an outbreak/flood-health event if conditions warrant.

No system duplicates the wound, clinic, economy or dialogue logic inside 29F.

## E.4 Settlement Respiratory Outbreak

A trader arrives while Incubating. After symptoms begin, local social/proximity simulation reports several meaningful indoor contact batches. 29F creates exposure in susceptible residents.

The village has good sanitation but limited quarantine beds. Sanitation helps other disease routes but does not magically stop this respiratory disease. A quarantine shelter reduces high-risk contacts, a healer treats Severe cases and the settlement imports medicine through Set 27 economy.

At distant LOD, routine cases become cohort counts while the named trader and village healer remain individually tracked. Document 15 may generate a response event after `OutbreakThresholdSuggested` is emitted.

## E.5 Poison Sludge

A player falls into `hazard.sludge.poison`. The block/fluid owner resolves contact and submits a toxin exposure every bounded interval. 29F accumulates contact toxin load. Armour with sealed-contact protection lowers effective dose.

Leaving the sludge stops incoming exposure but the toxin remains until it clears naturally or is treated. Washing contaminated equipment or purifying the pool belongs to item/fluid/settlement systems, not 29F.

## E.6 Magical Spore Realm

A dimension contains a fungal storm whose realm definition emits a biological spore exposure. 29F handles infection according to the player's biological profile and protection. The realm remains owner of storm timing and atmosphere.

A magical ward may reduce inhalation exposure if its spell/capability definition says so. A cleansing spell only clears the disease through 29G treatment interface; a pretty VFX is not enough.

# Appendix F. Migration and Supersession Notes

1. Document 16's `status.poisoned` becomes a compatibility source/presentation state for 29F Poison Instances rather than a separate persistent poison truth.
2. Document 16's broad `poisoned/diseased` injury/status category is superseded by separate 29F Disease and Poison systems.
3. Document 10 venom drops and creature venom concepts remain valid source/content data and should reference 29F toxin definitions.
4. 24F disease/ecology content remains valid content intent; registry ownership must be reconciled through AM-29-050 rather than silently deleted.
5. 20A quarantine/clinic/sanitation service rules remain external facility truth and become prevention/care inputs.
6. 26B contamination remains fluid truth. 29F consumes actor exposure only.
7. 29C food/water safety remains consumption truth; 29F owns subsequent disease/toxin lifecycle.
8. 29D Wetness remains exposure/thermal truth and never becomes generic disease.
9. 29E wound contamination remains injury truth; 29F owns infection.
10. 29B retains Health and condition-modifier composition; disease/toxin damage uses the authoritative Health interface.
11. Unreal-specific classes from old Document 18 are not implementation authority; Godot/Summer + Set 25 registry governance applies.
12. Legacy POC disease/poison flags should migrate with source/history where available rather than being silently cleared.

# Appendix G. Terminology Register

| Term | Definition |
| --- | --- |
| Biological Exposure | Authoritative event indicating that a pathogen/toxin source reached an actor by a compatible route. |
| Exposure Accumulator | Short-lived disease-specific exposure burden before infection establishes. |
| Infection Establishment | Threshold crossing that creates a Disease Instance. |
| Disease Instance | Persistent actor biological record for an established disease/infection. |
| Disease Burden | Optional 0-100 internal measure of active disease progression/severity pressure. |
| Disease Stage | Lifecycle position such as Incubating, Active or Resolving. |
| Disease Severity | Mild, Moderate, Severe or Critical biological seriousness, independent of stage. |
| Communicability | Current ability of a disease instance to generate transmission exposure. |
| Transmission Route | Compatible pathway such as contact, inhalation, ingestion, wound or vector. |
| Resistance | Reduced susceptibility/effect without absolute blocking. |
| Immunity | Explicit capability preventing establishment/effect for compatible disease/toxin. |
| Resistance Memory | Acquired post-recovery biological protection record. |
| Carrier | Optional disease state with persistent transmissibility and limited/no symptoms. |
| Chronic | Long-duration disease state requiring management/specialist resolution. |
| Contamination | External world/item/fluid/wound state capable of producing exposure; not owned universally by 29F. |
| Toxin | Harmful non-infectious biological/chemical/alchemical substance represented by toxin definition. |
| Venom | Toxin normally delivered by injection through bite/sting/weapon. |
| Toxin Load | Per-toxin 0-100 burden representing absorbed active toxin. |
| Poison Instance | Persistent runtime toxin record attached to an actor. |
| PoisonLevel | Bounded actor summary of current toxin danger. |
| Biological Hazard | External source capable of producing disease/toxin exposure. |
| Prophylaxis | Preventive biological treatment/capability reducing establishment or toxin effect. |
| Treatment Outcome | Authorised 29G request to change disease/toxin state. |
| Population Disease Pressure | Bounded LOD summary of exposure/cases/transmission in a population. |

> **29F Completion Statement**
>
> Document 29F establishes Leyforge's universal disease, infection, poison, toxin and biological-hazard runtime. Unsafe food, contaminated water, infected wounds, creature vectors, spores, toxic fluids, venoms, alchemical hazards and realm effects may now feed one traceable biological framework without stealing ownership from the systems that create those sources. Disease is exposure-driven rather than random; poison is dose/load-driven rather than a generic DOT; sanitation and quarantine matter through real settlement services; and population simulation remains scalable. The set is now ready to hand medicine actions, dosing, treatment procedures and rehabilitation to 29G while preserving all recorded cross-set interfaces for final reconciliation.
