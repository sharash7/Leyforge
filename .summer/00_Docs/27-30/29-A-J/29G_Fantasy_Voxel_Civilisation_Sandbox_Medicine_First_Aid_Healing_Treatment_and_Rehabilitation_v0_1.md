# FANTASY VOXEL CIVILISATION SANDBOX

## DOCUMENT SET 29

# 29G - Medicine, First Aid, Healing, Treatment and Rehabilitation

**Version 0.1 - Detailed Design Bible, Runtime Rules and Integration Contract Draft**

A registry-driven treatment system for first aid, medicine, diagnosis, specialist care, magical healing and rehabilitation - designed to make preparation, healers, clinics, hospitals, alchemy, magic and recovery meaningful without turning Leyforge into a medical micromanagement simulator.

**Project Lead and Final Authority:** Ash

> **Medicine, Treatment and Recovery Statement**
>
> Leyforge treatment is the action layer between biological need and biological recovery. Injuries, disease, poison, Health loss, blood loss and other conditions remain owned by their biological systems; items, recipes, magic, buildings, economy, dialogue and movement remain owned by theirs. 29G decides whether a proposed treatment is valid, what resources and capabilities it requires, how it is performed, and which explicit biological outcomes it may request. First aid should save time and create options, specialist medicine should make settlements valuable, and powerful magic should remain extraordinary without erasing the purpose of food, rest, medicine, infrastructure or long-term recovery.

| Field | Locked Direction |
| --- | --- |
| Document | 29G in Document Set 29 - Survival, Health & Biological Systems. |
| Governing Contract | Leyforge Document Sets 27-30 Cross-Set Interface Register v1.0 plus 29A-29F amendments. |
| Core Ownership | 29G owns treatment actions, first aid, medicine application, dosing/saturation rules, treatment procedures, treatment validation, treatment plans and rehabilitation procedures. |
| Biological Boundary | 29B owns Health/Stamina/Fatigue; 29E owns physical injury/bleeding/blood loss/pain; 29F owns disease/poison; 29G requests explicit outcomes through their APIs and never edits those states directly. |
| Items/Recipes | Items and Recipes own item identity, crafting, ingredients and production. 29G consumes treatment-capability payloads and performs authoritative resource transactions. |
| Magic | Document 09 owns spells, mana, casting and magical progression. 29G validates biological healing capability and routes the requested outcome to the correct biological owner. |
| Facilities | Set 20 owns clinics, hospitals, beds, treatment rooms, sanitation, utilities and service capacity. 29G consumes validated treatment context; appearance alone never heals. |
| Social | Set 28 owns dialogue, willingness, trust, companion care choices and doctor social behaviour. 29G owns treatment validity after a provider and patient have actually agreed/been assigned. |
| Economy | Set 27 owns prices, fees, wages, insurance and scarcity. 29G exposes treatment demand, resource use and service complexity only. |
| Movement | Set 30 owns locomotion, carrying, transport and movement execution. 29G may expose treatment-safe activity/transport requirements and rehabilitation intent. |
| Combat/Death | Document 16 owns attacks, damage packets, downing/death and combat actions. 29G may heal/stabilise biological state but does not decide revival or death. |
| Design Tone | Deep but readable. Routine care is reliable and understandable; advanced care may require skill, facilities and scarce resources without becoming a real-world medical simulator. |
| Engine | Godot/Summer Engine, authoritative, registry-driven, save-safe, multiplayer-compatible and governed by Set 25 schema/validation rules. |

# Document Purpose

Document 29G defines how biological problems are actively treated. Earlier Set 29 documents deliberately stop at the treatment boundary: 29B says when Health can recover, 29E records wounds, bleeding, pain and injury recovery, and 29F records disease, infection and toxin state. This document supplies the missing action layer that lets players, companions, NPC healers, magical specialists and settlement healthcare convert real items, time, skill, facilities and mana into validated biological outcomes.

The system preserves the existing Leyforge direction that food and rest are mainly preparation and long-term recovery, bandages control bleeding rather than magically replacing lost Health, splints support fractures, potions are bounded by use time and diminishing-return controls, healers need real medicine and functioning facilities, and magical healing can be powerful without bypassing biological authority.

29G does **not** create medicine items, craft recipes, clinic buildings, healer personalities, prices, spells, movement animations, injury definitions or disease definitions. It consumes those systems through explicit interfaces. A bandage is an Item definition; its recipe belongs to Crafting; the decision to help may belong to Set 28; the clinic belongs to Set 20; the wound belongs to 29E. 29G is the authority that says: this actor can perform this treatment, on this target, using these resources, in this context, producing these approved biological outcomes, exactly once.

> **Locked 29G Rule**
>
> No treatment may mutate biological state merely because an item was clicked, a spell animation played, a bed exists, or a healer NPC is nearby. Every treatment must resolve through an authoritative treatment transaction that validates target, capability, provider, context, cost and biological compatibility before committing explicit outcomes to the owning biological systems.

# Design Sources, Authority and Treatment

| Source | Relevant Direction | Treatment in 29G |
| --- | --- | --- |
| 00 - Master Game Design Bible | Survival, magic, civilisation, NPC life and player freedom must reinforce each other. | Medicine creates meaningful links between gathering, alchemy, healers, settlements, exploration and recovery. |
| 01 - Core Gameplay Loop | Preparation and consequence should feed the next player goal rather than exist as detached chores. | Injury/illness creates optional gather-craft-seek-care-rest loops with multiple valid solutions. |
| 02 - Player Progression | Health/Stamina are derived resources; skills/perks may improve healing; no fixed class prevents mastery. | 29G consumes provider/patient progression modifiers but does not define the skill tree. |
| 04 - Items Registry | Medicine, food, potions, consumables, utility equipment and physical supplies exist as item data. | 29G consumes item treatment facets; it never creates item identity, stack, value or recipe. |
| 05 - Crafting/Recipe Registry | Medicine, alchemy, antidotes and consumable production are resource-conserving recipes. | 29G consumes finished treatment items/services and never invents crafting outputs. |
| 07 / 20 - NPC and Settlement Systems | Healers, medicine stock, clean water, beds, clinics, hospitals and specialist rooms support healthcare. | 29G consumes provider and facility capability; settlement owners decide whether those resources exist and are staffed. |
| 09 - Magic System | Healing, cleansing, nature magic, alchemy, wards and rituals may support recovery. | Magic supplies authorised treatment capabilities; 29G validates biological result while Magic retains mana/casting ownership. |
| 15 - Quest/Event | Illness, injury, medicine shortage and recovery may generate quests/events. | 29G emits treatment facts only; it does not create quest stages. |
| 16 - Combat | Bandages, poultices, potions, healing spells, NPC healers, shrines and rest are existing recovery concepts. | 29G operationalises those treatment concepts without taking combat/downed/death ownership. |
| 17 - UI/UX | Status and treatment information must use progressive disclosure, accessibility and authoritative view models. | 29G exposes reason codes, recommendations and treatment progress; UI never decides success. |
| 20 / 20F | Clinics/hospitals require validated rooms, staff, stock, sanitation, water and infrastructure. | Facility context modifies treatment eligibility/quality; decorative facilities provide no effect. |
| 25A-25L | Stable IDs, schemas, relationships, validation, content packs and migration govern production data. | Treatment definitions and capability tags conform to Set 25 rather than creating parallel ID governance. |
| 29A | Set 29 owns biological health/medicine; Set 27/28/30 ownership is fixed. | 29G is bound to the Cross-Set Interface Register. |
| 29B | Health, Stamina, Fatigue and generic biological recovery are independent authoritative channels. | 29G requests Health restoration/recovery modifiers; it does not write Health or Stamina directly. |
| 29C | Hunger, Hydration and Nutrition are distinct; food consumption is atomic. | 29G may request supportive nutrition/hydration outcomes only through 29C and does not turn medicine into free food/water. |
| 29D | Sleep, shelter, temperature and wetness affect recovery. | 29G consumes rest/shelter quality and may recommend care; it does not own sleep or environmental exposure. |
| 29E | Injuries, bleeding, Blood Loss, Pain and impairment are persistent biological truth. | 29G performs care and submits explicit `InjuryTreatmentOutcome` requests to 29E. |
| 29F | Disease, infection, poison, toxin burden and treatment requirements are persistent biological truth. | 29G performs treatment and submits atomic `DiseasePoisonTreatmentOutcome` requests to 29F. |
| Set 27 | Owns treatment prices, insurance, wages, market scarcity and medical economy. | 29G exposes service complexity, consumed resources and demand only. |
| Set 28 | Owns doctor/companion relationship, dialogue, consent/willingness and social care decisions. | 29G receives provider assignment/consent and returns medical facts/results. |
| Set 30 | Owns locomotion, transport, carrying and traversal. | 29G exposes medical transport/rehab constraints; Set 30 executes physical movement. |

# Static Table of Contents

1. Locked 29G System Identity  
2. Approved Decision Summary  
3. Ownership and Non-Ownership Boundary  
4. Treatment Architecture and Source-of-Truth Model  
5. Treatment Capability Taxonomy  
6. Treatment Definitions, Providers and Context  
7. Authoritative Treatment Transaction  
8. Treatment Eligibility, Consent and Target Validation  
9. Diagnosis, Assessment and Clinical Knowledge  
10. First Aid and Immediate Stabilisation  
11. Bleeding Control, Wound Cleaning and Dressing  
12. Immobilisation, Splinting and Physical Support  
13. Medicine Administration, Dose and Treatment Saturation  
14. Health Restoration and Heal-Over-Time  
15. Pain Relief and Symptom Management  
16. Disease, Infection and Antiparasitic Treatment  
17. Poison, Venom, Toxin Neutralisation and Elimination Support  
18. Blood-Loss Restoration and Recovery Support  
19. Thermal Injury and Environmental Aftercare  
20. Specialist Procedures and Advanced Care  
21. Magical Healing, Cleansing and Ritual Treatment  
22. Treatment Quality, Skill and Facility Modifiers  
23. Treatment Failure, Complications and Adverse Effects  
24. Treatment Plans, Follow-Up and Recovery Ceilings  
25. Rehabilitation and Functional Recovery  
26. Health, Stamina, Fatigue, Nutrition and Sleep Integration  
27. Injury, Disease and Poison Integration  
28. Combat, Downed State and Emergency-Care Boundary  
29. NPCs, Companions, Healers and Social Care  
30. Clinics, Hospitals, Pharmacies and Settlement Healthcare  
31. Economy, Medical Demand, Scarcity and Service Cost Boundary  
32. Quests, Events, Knowledge and Progression Integration  
33. Simulation LOD, Population Treatment and Distant Care  
34. Multiplayer Authority, Persistence and Transaction Safety  
35. UI, Feedback, Accessibility and Treatment Explainability  
36. Difficulty Profiles and Custom World Settings  
37. Registry Definitions and Runtime Records  
38. Balance, Anti-Grind and Anti-Exploit Rules  
39. Validation, Test Cases and Acceptance Criteria  
40. Cross-Set Interface Amendments  
Appendix A. Reference Treatment Parameters  
Appendix B. Provisional 29G API Contract  
Appendix C. Treatment Capability Tag Library  
Appendix D. Runtime Record Templates  
Appendix E. Worked Gameplay Examples  
Appendix F. Migration and Supersession Notes  
Appendix G. Terminology Register  
Appendix H. Cross-Set Interface Amendments Register

# 1. Locked 29G System Identity

29G is the authoritative **treatment-action layer** of Set 29. It does not own the wound, disease, poison or missing Health that creates the need for care. It owns the validated process that attempts to improve those states.

| Identity Layer | Meaning | Player-Facing Result |
| --- | --- | --- |
| Immediate Care | First aid can stop deterioration and buy time. | Bandages, pressure, splints and emergency care matter before full healing. |
| Resource-Conserving Medicine | Treatment consumes real medicine, tools, mana, time or service capacity when required. | Preparation and settlement supply chains have meaningful purpose. |
| Readable Capability | Treatment is expressed through clear capability tags rather than item-name hardcoding. | Many cultural, magical and crafted items can satisfy the same biological need. |
| Specialist Value | Some conditions require skill, diagnosis, equipment or facilities. | Healers, clinics and hospitals become valuable without making ordinary scratches tedious. |
| Biological Authority | Every outcome is applied by the biological owner. | A bandage controls bleeding; it does not silently delete the injury or disease. |
| Magical Compatibility | Magic can be fast and powerful but uses the same biological handoff. | Healing magic feels exceptional without bypassing balance or state ownership. |
| Rehabilitation | Severe injury may require gradual return of function after basic stabilisation. | Recovery has meaningful aftermath without permanent character ruin by default. |
| Scalable Care | Named actors can receive detailed treatment while populations use service summaries. | City-scale healthcare remains computationally feasible. |

> **Locked Treatment Philosophy**
>
> Treatment should reduce danger, shorten downtime and create multiple recovery paths. It should not require the player to perform repetitive medical chores after every minor action, and it should not allow one cheap consumable to erase every biological consequence.

## 1.1 Treatment Is Not the Condition

A treatment record and a biological condition record are separate. The treatment may fail, partially succeed, stabilise rather than cure, or produce one of several authorised outcomes. The original condition remains owned by 29B/29E/29F.

## 1.2 Treatment Is Not an Item

A treatment may be delivered by an item, an NPC service, a spell, a ritual, a facility procedure or a combination. The treatment capability is therefore semantic and registry-driven. `item.medicine.bandage_basic` may provide `treatment.bleed_control.light`, but the item ID is not itself the biological rule.

## 1.3 Treatment Is Not a Building Bonus

A hospital contributes rooms, beds, clean treatment zones, tools, utilities, specialists and throughput. It does not emit healing points because its blueprint looks like a hospital.

# 2. Approved Decision Summary

| Area | Locked Decision |
| --- | --- |
| General Model | Use Capability -> Validate -> Reserve/Commit Cost -> Perform -> Biological Outcome -> History. |
| Routine Reliability | Routine first aid and correctly matched common medicine should be reliable. Low skill reduces speed/effect or blocks advanced care rather than adding frequent catastrophic RNG. |
| First Aid | First aid primarily stabilises, controls bleeding, protects wounds, immobilises injury and prevents worsening. It is not an instant full heal. |
| Health Healing | Health restoration is separate from injury/disease cure. Treatment can request bounded Health restoration through 29B. |
| Potion Direction | Healing potions may provide strong bounded recovery, but use time, treatment saturation and item scarcity prevent potion-spam resets. |
| Medicine Dose | Use simple authored dose/charge units and category saturation, not real-world milligrams or pharmacokinetics. |
| Overuse | Routine overuse causes diminishing returns or temporary saturation first. Explicit toxic overdose is handed to 29F as a toxin exposure rather than simulated inside 29G. |
| Diagnosis | True condition identity remains in 29E/29F. 29G owns assessment procedures and produces evidence/confidence; knowledge/UI owners decide what the player is shown. |
| Specialist Care | Advanced procedures may require provider capability, clean context, tools, facility class, assistants and medicine. |
| Surgery | Represent as a high-level specialist treatment procedure, not a real surgical simulator. |
| Rehabilitation | Severe injury recovery may use bounded rehabilitation sessions/progress. Rehab improves recovery/function but does not override 29E injury state. |
| Magic | Magic supplies a treatment capability and pays mana/components through its own system. Biological owners still validate the requested result. |
| Revival | Not owned by 29G. Treatment may stabilise or heal a living/downed actor where Combat permits, but death/revival remain external. |
| NPC Care | Set 28 decides willingness/dialogue; NPC/settlement systems provide assignment/availability; 29G validates treatment execution. |
| Settlement Care | Clinics/hospitals provide real capacity only when staffed, supplied, accessible and functional. |
| Economy | 29G never chooses prices. It exposes treatment class, consumed resources, provider time and demand to Set 27. |
| Multiplayer | Server/host owns treatment state, resource consumption and biological outcomes. |
| Difficulty | Peaceful/Relaxed reduce treatment burden and long-term downtime; Harsh increases requirements/importance without changing ownership schemas. |
| Accessibility | Exact timers and values are optional; all urgent state uses non-colour cues; treatment can use hold/toggle/assist controls. |

# 3. Ownership and Non-Ownership Boundary

## 3.1 29G Owns

- treatment action definitions;
- first-aid procedures;
- medicine application and administration rules;
- treatment capability tags;
- treatment plan records;
- treatment target validation;
- treatment context validation;
- treatment procedure time and interruption rules;
- treatment saturation/cooldown groups;
- generic treatment quality calculation;
- assessment/diagnostic procedures as actions;
- rehabilitation procedures and progress requests;
- treatment transaction atomicity;
- treatment history and result reason codes;
- treatment handoffs to 29B/29E/29F;
- population treatment-service abstraction;
- medicine/treatment UI view models and explainability reasons.

## 3.2 29G Does Not Own

- item definitions, inventories, stack sizes, item prices or crafting recipes;
- provider personality, trust, dialogue, recruitment, refusal or social consent;
- Health, Stamina or Fatigue state;
- injury/wound/bleeding/Blood Loss/Pain truth;
- disease/infection/poison/toxin truth;
- food, Hunger, Hydration or Nutrition state;
- sleep, temperature, wetness or shelter simulation;
- attack resolution, damage, death, downed state or revival rules;
- magic casting, mana costs, spell unlocks or ritual world state;
- clinic/hospital construction, staffing policy, utilities or service capacity;
- medicine prices, hospital fees, wages, taxes, insurance or market scarcity;
- movement, carrying, stretcher physics, vehicle seating or travel time;
- quest generation or narrative outcomes.

## 3.3 Owner Handoff Pattern

The standard chain is:

**Need Owner -> Treatment Requirement -> 29G Treatment Transaction -> Biological Owner Outcome -> External Consequence Owners**

Examples:

- 29E reports Heavy bleeding -> 29G validates a bleed-control treatment -> 29E changes bleed state -> Set 28 may react socially.
- 29F reports venom requiring an antidote family -> 29G validates the medicine -> 29F reduces toxin load -> Set 27 records consumed medical demand.
- 29B reports missing Health -> 29G validates healing capability -> 29B restores Health -> Combat receives updated Health state.

# 4. Treatment Architecture and Source-of-Truth Model

The treatment system separates definitions, capabilities, runtime procedures and outcomes.

| Record | Purpose | Example |
| --- | --- | --- |
| `TreatmentDefinition` | Declares a procedure pattern. | Apply dressing, administer restorative, set splint, specialist wound closure. |
| `TreatmentCapability` | Semantic capability supplied by item/spell/provider/facility combination. | `bleed_control.medium`, `antidote.venom_spider`, `heal.health.gradual`. |
| `TreatmentProviderContext` | Provider skill, tools, permissions and assignment. | Player with First Aid 15; village healer; hospital physician. |
| `TreatmentEnvironmentContext` | Safe/clean/facility/bed/utility context. | Field, sheltered camp, clinic treatment room, hospital surgery room. |
| `TreatmentRuntimeState` | Active treatment timer/progress, reservation and interruption state. | Bandaging actor A's arm wound. |
| `TreatmentOutcomeRequest` | Explicit mutation requested from biological owner. | Reduce bleed Heavy -> Light; restore 12 Health over 8 seconds. |
| `TreatmentHistoryEntry` | Bounded authoritative history. | Who treated whom, capability, resources, outcome and reason. |

## 4.1 Capability Composition

A treatment may require multiple sources:

`Provider Capability + Treatment Item + Facility Context + Tool/Station + Target Condition`

A simple bandage may require only an item and a target wound. Advanced surgery may require a skilled provider, surgical tools, clean room, assistant capacity, medicine and a stable patient.

## 4.2 No Item-Name Hardcoding

Condition definitions request capability tags. Content packs can then supply multiple valid providers:

- cloth bandage;
- herbal dressing;
- enchanted field wrap;
- culture-specific compress;
- healing-rune dressing.

Each can satisfy `bleed_control.light` while differing in quality, secondary effects, rarity and crafting source.

# 5. Treatment Capability Taxonomy

Core capability families are semantic and composable.

| Capability Family | Purpose | Biological Owner |
| --- | --- | --- |
| `stabilise` | Prevent immediate worsening of a critical condition. | 29E/29F/29B as applicable |
| `bleed_control` | Reduce/stop wound bleeding. | 29E |
| `wound_clean` | Reduce contamination and improve wound care state. | 29E -> 29F exposure prevention |
| `wound_protect` | Apply dressing/protection state. | 29E |
| `immobilise` | Support fracture/dislocation recovery. | 29E |
| `pain_control` | Reduce injury/systemic discomfort for duration. | 29E or shared biological modifier |
| `health_restore` | Restore missing Health immediately or gradually. | 29B |
| `recovery_support` | Improve generic recovery rate/eligibility. | 29B/29E/29F |
| `disease_suppress` | Reduce disease burden/progression. | 29F |
| `antimicrobial` / `antiparasitic` | Target compatible disease families. | 29F |
| `antidote` | Neutralise compatible toxin. | 29F |
| `toxin_clearance_support` | Increase toxin elimination. | 29F |
| `symptom_control` | Reduce selected symptom bundle without curing cause. | 29F |
| `prophylaxis` | Temporary protection against compatible exposure. | 29F |
| `blood_restore` | Accelerate Blood Loss reserve restoration. | 29E |
| `thermal_aftercare` | Treat compatible burn/frost injury needs. | 29E |
| `hydrate_support` | Medical hydration support where appropriate. | 29C |
| `nutrition_support` | Medical nutrition support where appropriate. | 29C |
| `rehabilitation` | Request functional/recovery progress for compatible injury. | 29E |
| `magical_tissue_restore` | Advanced magical injury repair. | 29E |
| `cleanse_biological` | Magical disease/toxin treatment, not generic curse ownership. | 29F |

Capability levels use readable tiers such as `minor`, `standard`, `advanced`, `specialist`, `ritual` rather than encoding exact real-world procedures.

# 6. Treatment Definitions, Providers and Context

## 6.1 Treatment Definition

A `TreatmentDefinition` includes:

- qualified treatment ID;
- category/family;
- capability tags provided;
- target condition query;
- minimum known/confirmed diagnosis requirement;
- provider capability requirements;
- item/resource capability requirements;
- tool/station requirements;
- facility/context requirements;
- safe/danger state requirements;
- base application time;
- interruption policy;
- self-treatment allowed/penalty;
- target-consciousness requirement where applicable;
- cost reservation policy;
- outcome request templates;
- quality scaling rules;
- saturation/cooldown group;
- adverse/overuse exposure link if authored;
- difficulty overrides;
- UI/reason/localisation keys;
- production status.

## 6.2 Provider Capability

29G consumes a resolved provider capability packet such as:

- first-aid skill band;
- medicine/healing skill band;
- alchemy knowledge where relevant;
- magical-healing capability tags;
- specialist procedure tags;
- valid tools/equipment;
- current impairment/availability;
- assistant count/capability;
- authorisation/permission result from external owner.

29G does not decide whether the provider likes the patient or asks for money.

## 6.3 Environment Context

Suggested context classes:

| Context | Typical Benefit | Typical Limits |
| --- | --- | --- |
| Field | Emergency first aid anywhere safe enough. | Advanced care blocked; lower cleanliness/comfort. |
| Sheltered Field | Camp, tent, wagon interior, safe cave. | Better stabilisation, dressing and rest support. |
| Basic Clinic | Clean treatment area, medicine storage, healer access. | Moderate procedures/diagnosis. |
| Hospital | Beds, sanitation, water, staff, pharmacy, advanced rooms. | Supports advanced/specialist procedures. |
| Specialist/Magical Facility | Ritual/healing chamber, advanced laboratory or cultural specialist space. | Enables specific rare capabilities only. |

# 7. Authoritative Treatment Transaction

Every treatment is atomic at the gameplay-state level.

## 7.1 Transaction Stages

1. **Request** - actor/provider selects treatment and target.
2. **Resolve Target** - authoritative biological condition IDs are resolved.
3. **Validate Capability** - required provider/item/facility/spell capabilities are checked.
4. **Validate Permission/Consent** - consume external consent/assignment result where required.
5. **Reserve Cost** - required item charges, mana reservation, service slot and tools are reserved.
6. **Start Procedure** - runtime treatment state begins.
7. **Interrupt/Complete** - interruption rules are applied.
8. **Commit Cost** - consumables/resources are committed according to policy.
9. **Submit Outcome** - explicit outcome request goes to 29B/29E/29F/29C.
10. **Commit Result** - biological owner validates and applies once.
11. **Write History/Event** - bounded authoritative record is emitted.

## 7.2 Idempotency

Every treatment carries a unique transaction ID. Duplicate network delivery, save reload or repeated UI command cannot consume or apply the same treatment twice.

## 7.3 Reservation/Refund Policy

Definitions choose a policy:

- consume at start;
- consume at completion;
- partial consume on interruption;
- reusable tool/no consumption;
- mana/energy spent continuously;
- service slot/time reserved separately.

Routine bandages should not vanish because the player opened a menu and cancelled before treatment began.

# 8. Treatment Eligibility, Consent and Target Validation

## 8.1 Eligibility

A treatment is eligible when:

- target exists and is biologically valid;
- target condition still exists;
- treatment capability matches the target requirement;
- provider has required capability;
- required resources are available;
- facility/context requirements are satisfied;
- relevant cooldown/saturation rules permit use;
- danger/interruption rules permit starting;
- external permission/consent result permits care where required.

## 8.2 Self-Treatment

Self-treatment is allowed for routine first aid and medicine unless a definition requires another provider. Self-treatment may:

- take longer;
- be blocked by severe arm/manual-function impairment;
- be blocked while unconscious/downed if Combat says interaction is unavailable;
- have reduced quality for complex procedures.

## 8.3 Consent/Social Boundary

Set 28 owns social consent, refusal, trust and dialogue. 29G accepts a simple result such as:

- allowed;
- refused;
- emergency-authorised;
- incapacitated-care-authorised by game/legal rules;
- owner/party permission required.

29G never calculates affection or intimidation to force care.

# 9. Diagnosis, Assessment and Clinical Knowledge

Diagnosis should create useful uncertainty without forcing players to memorise fake medical textbooks.

## 9.1 Truth Versus Knowledge

29E/29F hold true condition identity. 29G holds **assessment procedures**, which inspect exposed symptom/evidence interfaces and produce a knowledge result.

## 9.2 Assessment Outcomes

A `ClinicalAssessmentOutcome` may include:

- identified condition ID, if confirmed;
- possible condition family;
- confidence band: Low / Moderate / High / Confirmed;
- observed symptoms/injury signs;
- treatment requirement tags revealed;
- contraindication/warning tags revealed;
- urgency class;
- whether specialist/lab/magic detection is recommended;
- expiry/reassessment requirement.

## 9.3 Assessment Sources

- player First Aid/Healing skill;
- NPC healer/doctor;
- alchemy/laboratory service;
- magical detection spell;
- obvious source evidence;
- books/research/codex knowledge;
- previous known infection/toxin;
- culture/faction medical knowledge.

## 9.4 No Guessing Punishment for Basic First Aid

A visibly bleeding wound does not require a diagnosis minigame before applying pressure or a basic bandage. Diagnosis matters when treatment choice is condition-specific.

# 10. First Aid and Immediate Stabilisation

First aid exists to keep a problem from becoming worse before definitive care.

Core first-aid actions include:

- apply pressure / control bleeding;
- dress/protect wound;
- clean a wound when resources/context permit;
- immobilise/support a suspected fracture;
- cool/warm compatible thermal injury;
- administer known antidote/medicine;
- stabilise a Critical injury where capability permits;
- place patient into an externally owned safe transport/care state;
- request/mark urgent evacuation.

## 10.1 Standard First-Aid Timing

Reference timings are balance values, not real medicine:

| Action Class | Standard Base Time | Notes |
| --- | ---: | --- |
| Quick pressure/stabilise | 1.5-2.5 sec | Emergency action; may require continued hold or follow-up dressing. |
| Basic bandage/dressing | 3-5 sec | Interruptible; self-treatment may be slower. |
| Wound cleaning | 5-8 sec | Requires compatible clean resource/capability. |
| Basic splint/support | 6-10 sec | Longer for self-treatment or severe impairment. |
| Administer simple medicine | 1.5-3 sec | Oral/topical; capability-specific. |
| Field assessment | 3-6 sec | Produces evidence/confidence, not biological healing. |

## 10.2 Emergency Stabilisation Is Not Cure

Stabilising a Critical wound may:

- reduce active bleeding;
- stop immediate worsening;
- raise transport safety;
- buy time for specialist care.

It does not necessarily restore Health, repair a fracture, cure infection or clear poison.

# 11. Bleeding Control, Wound Cleaning and Dressing

29E remains owner of wound/bleeding state.

## 11.1 Bleed-Control Outcomes

29G may request from 29E:

- Critical -> Heavy;
- Heavy -> Light;
- Light -> Seep;
- Seep -> None/controlled;
- `bleed_controlled=true` for a bounded duration/condition;
- reopen-risk reduction.

The exact permitted step depends on treatment capability and wound type.

## 11.2 Bandage Rule

A basic dressing primarily:

- controls compatible bleeding;
- protects an open wound;
- reduces contamination exposure;
- may modestly improve comfort/recovery context.

It does **not** automatically restore the Health lost when the wound was created.

## 11.3 Wound Cleaning

Wound cleaning consumes a `wound_clean` capability and requests:

- improved wound cleanliness state from 29E;
- reduced pending contamination exposure to 29F where allowed;
- protective dressing state if combined.

It cannot erase an already-established infection; that requires 29F treatment.

# 12. Immobilisation, Splinting and Physical Support

29E owns fracture/dislocation state and recovery ceilings.

29G may apply:

- temporary support;
- standard immobilisation;
- advanced fitted support;
- magical stabilising support.

Reference effects may include:

- raising fracture recovery ceiling;
- reducing re-injury risk;
- reducing pain;
- improving safe-transport status;
- enabling rehabilitation stage later.

Set 30 decides actual locomotion effects and animations from the biological outputs.

# 13. Medicine Administration, Dose and Treatment Saturation

Leyforge uses readable gameplay dosage rather than real pharmacology.

## 13.1 Dose Units

Medicine definitions expose simple units such as:

- `dose.small`;
- `dose.standard`;
- `dose.strong`;
- `dose.single_use`;
- `charge_per_use` for tools/devices.

No real-world milligram values are required.

## 13.2 Administration Routes

Common routes:

- oral/drink;
- topical/salve;
- dressing/poultice;
- inhaled/vapour where fantasy/alchemy content supports it;
- specialist administration;
- magical/ritual;
- future injection-like technology only if content explicitly adds it.

## 13.3 Treatment Saturation

To prevent potion spam, restorative medicines may use category saturation.

Suggested saturation groups:

- restorative Health;
- analgesic;
- stimulant/fatigue support;
- antidote family;
- disease medicine family;
- magical tissue restoration.

Saturation can cause:

- reduced benefit;
- temporary lockout;
- longer application delay;
- explicit 29F toxin exposure only when an item definition declares overdose toxicity.

29G does not invent a hidden universal toxicity bar.

## 13.4 Standard Restorative Saturation Reference

For ordinary Health-restorative consumables:

- first full-strength use: 1.00x;
- another compatible use within ~30 seconds: 0.65x;
- further use within the same saturation window: 0.35x;
- saturation decays back toward full over roughly 60-90 seconds.

Specific rare items/spells may override this. These are balance reference values, not mandatory for every medicine family.

# 14. Health Restoration and Heal-Over-Time

29B owns Health.

## 14.1 Health Treatment Outcome

29G submits a `BiologicalHealingRequest` to 29B containing:

- source transaction ID;
- treatment capability;
- target actor;
- immediate restoration amount or percent;
- heal-over-time amount/duration;
- recovery-delay interaction;
- saturation group/strength;
- source tags;
- interruption/cancel policy;
- difficulty modifier context.

29B validates and commits Health change.

## 14.2 Standard Reference Classes

| Capability | Standard Reference | Intended Role |
| --- | --- | --- |
| Minor restorative | 5-10% Max Health over 8-15 sec | Common field recovery. |
| Standard restorative | 10-18% Max Health over 8-15 sec | Strong routine medicine/potion. |
| Advanced restorative | 18-30% Max Health over 10-20 sec | Scarcer specialist/magical item. |
| Emergency magical heal | 15-30% Max Health, partly immediate | Spell/rare capability; mana and casting risk matter. |
| Long-term care boost | +10-30% natural recovery modifier | Bed/clinic/medicine support, not combat reset. |

These do not cure injuries, disease, poison or Blood Loss unless separate treatment outcomes are present.

## 14.3 No Full-Heal Common Potion

Core common consumables should not restore 100% Health instantly. Exceptional relics, endgame rituals or world-setting variants may exceed ordinary bounds only through explicit high-tier definitions.

# 15. Pain Relief and Symptom Management

Pain relief and symptom control improve function/comfort but do not remove underlying cause.

## 15.1 Analgesia

29G may request from 29E:

- Pain Load reduction;
- pain-contribution suppression for duration;
- comfort/recovery support.

Strong pain control may expose a warning that the underlying injury remains and re-injury risk still exists.

## 15.2 Disease Symptom Control

29G may request 29F to suppress compatible symptom bundles, such as:

- fever pressure;
- nausea/appetite penalty;
- cough/exertion penalty;
- sleep-quality penalty;
- pain/discomfort;
- communicability only when the treatment definition truly supports it.

Symptom suppression is not automatically a cure.

# 16. Disease, Infection and Antiparasitic Treatment

29F supplies true condition, burden, stage and treatment requirement tags.

## 16.1 Treatment Classes

- supportive care;
- disease-family suppressive medicine;
- wound-infection treatment;
- antiparasitic treatment;
- condition-specific curative treatment;
- magical biological cleanse;
- prophylaxis/pre-exposure prevention;
- post-exposure treatment where authored.

## 16.2 Outcome Requests to 29F

29G may request:

- reduce disease burden;
- pause progression for duration;
- accelerate resolution;
- suppress symptoms;
- reduce communicability;
- clear exposure accumulator;
- apply temporary prophylaxis;
- cure condition if capability explicitly permits;
- alter chronic/carrier state only where definition permits.

## 16.3 No Universal Antibiotic/Medicine

Core balance should avoid one cheap medicine that cures every disease family. Generic supportive care may be broad; true cures/antimicrobials use compatibility tags.

# 17. Poison, Venom, Toxin Neutralisation and Elimination Support

29F remains owner of toxin burden.

Treatment families include:

- family-specific antidote;
- broad emergency toxin binding/support with limited effectiveness;
- toxin-elimination support;
- symptom support;
- magical detoxification;
- advanced specialist cleansing.

## 17.1 Antidote Outcome

A compatible antidote may request:

- immediate toxin-load reduction;
- cap on peak progression;
- increased elimination rate;
- reduced symptom bundle;
- temporary resistance to repeat exposure.

## 17.2 Wrong Antidote

Routine wrong-medicine use should usually fail safely with a clear reason when the mismatch is knowable. Harsh or explicitly risky alchemy content may define adverse outcomes, but there is no universal random death chance for choosing the wrong bottle.

# 18. Blood-Loss Restoration and Recovery Support

29E owns Blood Loss.

29G may provide `blood_restore` capabilities through:

- safe rest/medical support;
- nutrition/hydration support interfaces;
- specialised medicine;
- hospital procedure;
- advanced magical restoration.

## 18.1 Standard Reference

29E already defines slow natural Blood Loss restoration under safe conditions. 29G treatments may multiply that rate or request bounded direct reserve restoration.

Suggested normal bounds:

- field supportive care: +10-25% restoration rate;
- clinic supportive care: +25-50%;
- hospital specialist care: +50-100%;
- advanced magical/blood-restoration treatment: explicit bounded direct restoration, typically no more than 20-35 Blood-Loss points per treatment in Standard without rare/endgame capability.

## 18.2 Blood Restoration Is Not Health Restoration

A character may regain Blood Loss reserve while still missing Health or retaining a wound. These remain separate outputs.

# 19. Thermal Injury and Environmental Aftercare

29D creates exposure; 29E owns resulting burn/frost injury.

29G owns treatment procedures such as:

- cooling compatible heat injury;
- warming compatible cold injury;
- protective salve/dressing;
- pain support;
- wound care for severe thermal damage;
- specialist tissue-restoration capability;
- magical restorative treatment.

29G does not change ambient temperature, wetness or shelter. Those are external inputs.

# 20. Specialist Procedures and Advanced Care

Advanced care exists to give hospitals, specialists and progression real value without implementing a real operating-theatre simulator.

## 20.1 Specialist Procedure Requirements

A procedure may require:

- confirmed/adequate diagnosis;
- provider capability tag;
- treatment tools;
- medicine/resource package;
- clean/controlled treatment room;
- stable patient;
- assistant capability;
- minimum time;
- post-procedure recovery context.

## 20.2 Procedure Families

- advanced wound closure;
- fracture setting/advanced immobilisation;
- foreign-object/contamination treatment at game abstraction;
- severe burn/frost treatment;
- advanced infection treatment;
- blood-restoration procedure;
- magical tissue reconstruction;
- rare disease/parasite intervention;
- rehabilitation assessment.

## 20.3 No Graphic/Technical Simulation Requirement

The player sees preparation, resources, time, provider, risk and outcome. The game does not require procedural incision steps, real anatomical knowledge or medical-instruction gameplay.

# 21. Magical Healing, Cleansing and Ritual Treatment

Magic remains a major Leyforge pillar, including healing and cleansing.

## 21.1 Ownership Flow

1. Magic system validates spell/ritual, mana, components, cast time and targeting.
2. Magic submits a `MagicalTreatmentRequest` with treatment capability tags.
3. 29G validates target biological compatibility and treatment saturation.
4. 29G submits outcome requests to 29B/29E/29F.
5. Biological owners commit state.
6. Magic/presentation handles audiovisual result and mana history.

## 21.2 Magical Capability Classes

- quick Health restoration;
- bleeding stabilisation;
- pain relief;
- accelerated tissue recovery;
- fracture/tissue restoration;
- disease cleanse;
- toxin cleanse;
- thermal injury restoration;
- area stabilisation;
- ritual specialist treatment.

## 21.3 Magic Does Not Automatically Cure Everything

A generic heal spell should not simultaneously:

- restore full Health;
- stop every bleed;
- mend every fracture;
- cure every disease;
- clear every toxin;
- restore all Blood Loss;
- remove all Fatigue.

Each effect needs an explicit capability. High-tier magic may bundle several, but cost, progression, cast constraints and rarity must justify it.

## 21.4 Death/Revival Exclusion

29G can treat living/downed biological state only where Combat allows interaction. Resurrection/revival remains outside Set 29 unless explicitly reassigned later.

# 22. Treatment Quality, Skill and Facility Modifiers

Treatment quality is a bounded multiplier/grade, not a hidden roulette.

## 22.1 Inputs

- provider skill/capability;
- item/medicine quality;
- tool quality;
- facility context;
- cleanliness/sanitation context;
- patient stability;
- self-treatment penalty;
- assistant support;
- diagnosis confidence where relevant;
- magical focus/ritual quality where provided by Magic;
- difficulty profile.

## 22.2 Quality Bands

| Quality | Typical Effect |
| --- | --- |
| Improvised | Works for basic compatible care; slower/lower ceiling. |
| Standard | Expected baseline treatment. |
| Skilled | Faster or stronger outcome; lower resource waste. |
| Specialist | Enables advanced capabilities and high recovery ceilings. |
| Exceptional | Rare masterwork/magical care; bounded premium outcomes. |

## 22.3 Standard Quality Rule

A correctly matched routine treatment at Standard quality should normally succeed. Skill primarily affects:

- speed;
- amount of benefit;
- resource efficiency;
- access to advanced procedures;
- duration of protective effect;
- diagnosis confidence.

# 23. Treatment Failure, Complications and Adverse Effects

## 23.1 Failure Types

- invalid target/condition changed;
- treatment interrupted before commit;
- resource missing;
- insufficient provider capability;
- inadequate facility/context;
- wrong/unconfirmed condition family;
- patient instability;
- treatment saturation;
- explicit risky procedure/alchemy failure.

## 23.2 Routine Failure Is Safe

For ordinary first aid, a failed validation should usually consume nothing and explain why. Routine care should not randomly worsen the patient.

## 23.3 Risky Advanced Procedures

Some advanced/forbidden procedures may declare:

- partial outcome;
- resource loss;
- temporary recovery penalty;
- contamination exposure;
- toxin/adverse exposure handed to 29F;
- injury complication request to 29E;
- quest/social consequence emitted externally.

Risk must be visible or discoverable before commitment where practical.

## 23.4 Medicine Adverse/Overdose Boundary

If an authored medicine can become toxic through excessive use, 29G submits an explicit `ToxinExposure` to 29F. 29F owns the poison/toxin state. 29G never maintains a parallel overdose damage system.

# 24. Treatment Plans, Follow-Up and Recovery Ceilings

Complex care can use a treatment plan rather than one button.

## 24.1 Treatment Plan

A `TreatmentPlan` may contain:

- current condition references;
- urgency;
- immediate stabilisation actions;
- definitive treatment requirements;
- medicine schedule/cooldown group;
- facility/provider requirement;
- rest/sleep/nutrition recommendations;
- follow-up time or condition;
- rehabilitation eligibility;
- expected recovery status;
- unresolved blockers.

## 24.2 Plans Are Guidance, Not Quest Ownership

A treatment plan can appear in the Health screen or healer service UI. It does not become a Quest unless Document 15 creates one.

## 24.3 Recovery Ceilings

29E/29F remain owners of biological recovery ceilings. 29G can satisfy treatment flags or request a ceiling increase when its capability permits.

# 25. Rehabilitation and Functional Recovery

Rehabilitation provides gameplay meaning after severe injury without forcing weeks of repetitive exercises.

## 25.1 Rehabilitation Eligibility

29E reports whether an injury is ready for rehabilitation based on:

- stabilisation;
- healing stage;
- pain/bleeding state;
- fracture/tissue stability;
- complications;
- safe activity limits.

## 25.2 Rehabilitation Procedure

A rehab session may require:

- treatment provider or self-rehab capability;
- safe environment;
- minimum recovery stage;
- time;
- optional equipment/facility;
- bounded physical activity result from Set 30 where actual movement is used.

## 25.3 Rehab Outcomes

29G may request from 29E:

- recovery progress addition;
- functional-impairment reduction within current healing ceiling;
- chronic-risk reduction;
- safe-activity ceiling increase;
- next-stage readiness.

## 25.4 No Rehab Grind

Standard gameplay should not require dozens of identical sessions. Suggested scale:

- Minor/Moderate: usually no dedicated rehab or 1-2 sessions.
- Severe: roughly 2-4 meaningful sessions across recovery.
- Critical: roughly 3-6 sessions or specialist treatment milestones.

Harsh can increase importance; Relaxed can automate or compress it.

## 25.5 Set 30 Boundary

Set 30 owns actual movement/exercise execution. 29G may request an activity category or consume a completed safe-activity event, but cannot implement walking speed, climbing or animation.

# 26. Health, Stamina, Fatigue, Nutrition and Sleep Integration

## 26.1 Health

29G requests restoration through 29B; it never writes Health directly.

## 26.2 Stamina

Medicine may provide recovery support or temporary modifiers only through 29B. A stimulant cannot redefine sprint costs or movement speed.

## 26.3 Fatigue

29G may provide supportive treatment for extreme fatigue only through 29B. Ordinary sleep remains the primary long-term recovery source under 29D.

## 26.4 Nutrition/Hydration

29C owns Hunger/Nutrition/Hydration. Medical food/drink may submit valid consumption/support payloads, but treatment cannot create hydration from nothing.

## 26.5 Sleep/Rest

29G may require/rest recommend a bed or safe recovery context. 29D owns Sleep Pressure and Sleep Quality; Set 20 owns whether a valid bed/facility exists.

# 27. Injury, Disease and Poison Integration

## 27.1 Injury

29E exposes:

- injury ID/family/region/severity;
- bleeding/Blood Loss/Pain;
- treatment requirement tags;
- recovery ceiling/progress;
- safe activity and care urgency;
- wound contamination state.

29G returns explicit treatment outcome requests only.

## 27.2 Disease/Poison

29F exposes:

- disease/poison instance IDs;
- stage/burden/load;
- treatment requirement tags;
- diagnosis requirements;
- symptom evidence;
- urgency/transmission state;
- compatible cure/antidote families.

29G returns atomic `DiseasePoisonTreatmentOutcome`.

## 27.3 Multiple Conditions

A treatment may target multiple linked states only if capability declares it. Example: an enchanted wound dressing may control bleeding and reduce contamination exposure, but it does not cure an established infection unless it also supplies the relevant disease-treatment capability.

# 28. Combat, Downed State and Emergency-Care Boundary

Combat owns action availability, downed state, death, revival and hostile interruption.

29G may expose/request:

- `EmergencyTreatmentAvailable()`;
- `TreatmentSafeUnderCurrentState()`;
- treatment application time;
- stabilised biological state;
- Health restoration request;
- bleed control;
- patient transport recommendation.

Combat decides whether the interaction can occur during combat and whether a downed actor remains revivable.

## 28.1 No Treatment = Revival Assumption

A powerful heal is not automatically a revive. Revival requires an external death/downed capability from Combat.

# 29. NPCs, Companions, Healers and Social Care

Set 28 owns interpersonal/social behaviour.

## 29.1 Inputs to 29G

- provider assigned/available;
- consent/permission result;
- provider relationship does not need to be known to 29G;
- provider capability/skill from NPC/progression owners;
- companion care intent;
- appointment/service assignment if external systems use one.

## 29.2 Outputs to Set 28

- `CareNeed()`;
- `TreatmentUrgency()`;
- recommended treatment capability;
- whether immediate aid is possible;
- treatment duration/complexity class;
- success/failure result;
- recovery status;
- transmission/isolation caution from 29F;
- patient can/cannot travel biologically.

Set 28 decides whether a companion volunteers, refuses, comforts, negotiates payment or remembers the rescue.

## 29.3 Healer Identity

Different cultures may have physicians, herbalists, apothecaries, shamans, rune healers, nature mages or other specialists. 29G cares about capability tags, not a universal profession name.

# 30. Clinics, Hospitals, Pharmacies and Settlement Healthcare

Set 20 owns physical healthcare facilities and service capacity.

## 30.1 Facility Interface Inputs

29G may consume:

- treatment-room class;
- bed/recovery slot availability;
- sanitation/clean-zone quality;
- clean-water availability;
- medicine/pharmacy stock access;
- power/mana availability where needed;
- diagnostic/lab capability;
- surgery/specialist capability;
- isolation/quarantine capability;
- rehabilitation capability;
- staff/provider availability;
- route/accessibility state;
- facility damage/operational state.

## 30.2 Facility Does Not Auto-Heal

A hospital with no staff, clean water or medicine may provide shelter/bed capacity but not full treatment capability.

## 30.3 Triage Interface

29G computes **medical urgency/required treatment class** from biological inputs. Settlement/NPC scheduling owners allocate workers/beds/resources.

Suggested urgency:

- Routine;
- Soon;
- Urgent;
- Emergency;
- Isolation Priority.

Urgency is not social worth. It must not automatically deprioritise disliked factions unless external law/social systems explicitly decide that.

# 31. Economy, Medical Demand, Scarcity and Service Cost Boundary

Set 27 owns all monetary/economic outcomes.

29G exports:

- treatment capability demanded;
- medicine/resource quantities actually consumed;
- provider-time class;
- facility-time class;
- specialist requirement;
- bed/recovery duration estimate;
- population treatment demand;
- successful/failed procedure count;
- medicine waste from interruption where applicable.

Set 27 may use those to determine prices, shortages, wages, insurance or public-health expenditure.

29G never sets `HospitalCost()` or item value.

# 32. Quests, Events, Knowledge and Progression Integration

## 32.1 Quests/Events

29G may emit facts such as:

- treatment requested;
- treatment unavailable;
- medicine shortage detected;
- treatment started/completed/failed;
- specialist needed;
- rehabilitation milestone reached;
- patient recovered enough for travel.

Document 15 decides whether those facts create objectives or events.

## 32.2 Knowledge

Assessment outcomes may reveal treatment requirement tags. Knowledge systems decide what is added to codex/journal.

## 32.3 Progression

Document 02 may define skills/perks such as First Aid, Healing, Alchemy, Nature Magic or leadership support. 29G consumes modifiers including:

- application-time multiplier;
- treatment-quality bonus;
- resource-efficiency bonus;
- self-treatment penalty reduction;
- diagnosis-confidence bonus;
- advanced capability unlock.

29G does not award XP unless Progression asks it to emit a validated treatment event.

# 33. Simulation LOD, Population Treatment and Distant Care

Healthcare must scale to civilisation size.

## 33.1 Active Named Actors

Use full treatment state, item transactions, providers, timers and conditions.

## 33.2 Medium/Distant Named Actors

Persist:

- condition IDs/severity;
- treatment plan;
- required capability;
- assigned facility/provider if important;
- reserved/consumed resources;
- current treatment/recovery milestone;
- next simulation time.

Visual procedure animation is omitted.

## 33.3 Routine Population Cohorts

Unnamed populations use aggregated values:

- minor injury cases;
- severe injury cases;
- disease cases by family where needed;
- poison cases when events demand;
- treatment slots;
- medicine demand/stock pressure;
- recovery rate;
- untreated backlog;
- workforce-health output.

No per-NPC bandage tick is required.

## 33.4 Population Treatment Throughput

A settlement summary can resolve treatment throughput based on:

- case severity mix;
- available care capacity;
- staff capability;
- medicine stock;
- sanitation/utilities;
- difficulty profile;
- event pressure.

Named/story-critical NPCs never disappear into an anonymous cohort if their condition matters.

# 34. Multiplayer Authority, Persistence and Transaction Safety

## 34.1 Authority

Server/host validates:

- target condition;
- provider capability;
- item ownership;
- resource reservation/consumption;
- mana/service availability;
- application time;
- interruption;
- saturation;
- biological outcome;
- treatment history.

Clients may predict progress UI/animation but cannot decide that treatment succeeded.

## 34.2 Save State

Persist when applicable:

- active treatment transaction and stage;
- reserved resources;
- treatment saturation/cooldowns;
- treatment plans/follow-up;
- rehabilitation progress/session eligibility;
- bounded treatment history;
- provider/facility assignment only where persistent owner systems require it.

## 34.3 Save During Treatment

On save/load, an active procedure must either:

- resume deterministically;
- roll back to pre-commit state with reservation restored;
- resolve through a documented safe checkpoint.

It must never consume the medicine twice.

## 34.4 Offline Safety

Local real-world offline time does not complete risky surgery, poison treatment or bleed control silently unless the game's authoritative world simulation explicitly advanced that state under safe rules.

# 35. UI, Feedback, Accessibility and Treatment Explainability

## 35.1 Contextual Presentation

Normal play should show only useful information:

- urgent treatment prompt;
- available first aid;
- blocked-treatment reason;
- application progress;
- medicine saturation warning;
- follow-up requirement.

Detailed treatment plans remain in the Health/Status or healthcare UI.

## 35.2 Explainable Reasons

Examples:

- "Bandage available: controls Heavy bleeding, does not restore lost Health."
- "Splint required before this fracture can recover further."
- "Antidote mismatch: this venom family is not confirmed."
- "Treatment blocked: clean clinic room unavailable."
- "Healing potion reduced: restorative saturation active."
- "Recovery slowed: infection still active."

## 35.3 Accessibility

- all urgency uses icon + text, not colour alone;
- treatment hold actions can be toggle/hold-configurable;
- exact timers/numbers can be hidden or shown;
- no mandatory rapid button sequences;
- no mandatory camera shake/blur for pain/treatment;
- controller focus order remains predictable;
- screen-reader-ready labels/localisation keys;
- reduced-motion treatment presentation;
- confirmation for rare/expensive/irreversible treatment where appropriate.

# 36. Difficulty Profiles and Custom World Settings

All profiles use the same core data model.

| Area | Peaceful | Relaxed | Standard | Harsh |
| --- | --- | --- | --- | --- |
| First-aid burden | Very low | Low | Meaningful | Important |
| Routine treatment time | Short | Reduced | Baseline | Longer |
| Medicine saturation | Minimal | Light | On | Stronger |
| Specialist requirements | Often waived/compressed | Reduced | By severity | More important |
| Treatment resource use | Reduced | Reduced | Baseline | Baseline/high |
| Rehab | Mostly automatic | Compressed | Severe injuries only | More significant |
| Failure risk | Minimal | Low | Routine reliable | Advanced care risk increased where authored |
| Disease/poison treatment | Simplified | Forgiving | Capability-based | More diagnosis/resource pressure |
| Magical healing | Strong | Strong | Bounded | Cost/requirements matter more |
| Hospital value | Convenience | Helpful | Important for severe cases | Very important |

## 36.1 Custom Controls

Possible settings:

- treatment application-time multiplier;
- medicine resource-consumption multiplier;
- saturation enabled/strength;
- self-treatment penalties;
- specialist requirement strictness;
- rehab requirement;
- diagnosis uncertainty;
- treatment UI detail;
- population healthcare severity;
- magical-healing effectiveness;
- treatment failure/risk for advanced procedures.

Settings should not create incompatible save schemas.

# 37. Registry Definitions and Runtime Records

## 37.1 `TreatmentDefinition`

Minimum fields:

- qualified ID;
- display/localisation key;
- category/family;
- capability tags;
- target condition query;
- diagnosis requirement;
- provider requirements;
- item/tool requirements;
- facility/context requirements;
- base time;
- interruption policy;
- self-treatment policy;
- cost reservation/commit policy;
- outcome templates;
- quality scaling;
- saturation group;
- adverse exposure link;
- UI reason keys;
- difficulty overrides;
- content/production status.

## 37.2 `TreatmentCapabilityFacet`

Attachable to item/spell/service/provider definitions through Set 25 relationships:

- capability tags;
- strength/tier;
- compatible target families;
- dose/charge;
- quality;
- duration;
- secondary effects;
- saturation contribution;
- resource/charge consumption;
- provider/context restrictions.

## 37.3 `TreatmentRuntimeState`

- transaction ID;
- provider actor/service ID;
- patient actor ID;
- target condition IDs;
- treatment definition ID;
- source item/spell/service refs;
- reserved resources;
- start/end/progress;
- context snapshot hash;
- interruption state;
- quality result;
- committed outcomes;
- history/event refs.

## 37.4 `TreatmentPlan`

- plan ID;
- patient;
- condition refs;
- urgency;
- required capabilities;
- completed capabilities;
- provider/facility requirement;
- follow-up conditions/time;
- rehab stage;
- unresolved blockers;
- knowledge visibility state.

## 37.5 `TreatmentSaturationState`

- actor;
- saturation group;
- current level/band;
- last application time;
- decay schedule;
- source transaction refs;
- adverse-exposure threshold link if any.

## 37.6 `PopulationTreatmentSummary`

- settlement/cohort ID;
- cases by urgency/treatment family;
- available treatment throughput;
- medicine demand;
- untreated backlog;
- expected recovery throughput;
- specialist deficit;
- isolation demand link;
- workforce-impact summary.

# 38. Balance, Anti-Grind and Anti-Exploit Rules

## 38.1 No Bandage = Full Heal

Bleed control is not Health restoration.

## 38.2 No Generic Potion Solves Everything

A Health potion does not automatically mend fractures, cure disease, neutralise poison or restore Blood Loss.

## 38.3 No Every-Scratch Treatment Chore

Minor injuries and ordinary Health loss can often recover naturally under 29B/29E. Standard should not require manual dressing after every small hit.

## 38.4 No Infinite Potion Spam

Restorative saturation and resource costs bound repeated emergency healing.

## 38.5 No Fake Hospital Healing

Buildings provide only validated capabilities/capacity.

## 38.6 No Free NPC Medicine

NPC/settlement treatment consumes real medicine/service capacity unless an explicitly magical/renewable source supplies the capability.

## 38.7 No Random Catastrophic Routine Care

Basic correctly matched care is reliable. Advanced risky procedures must declare risk and counterplay.

## 38.8 No Universal Best Medicine

Different treatment families remain useful. Older/common medicine should retain roles in field care and settlement supply.

## 38.9 No Diagnosis Grind for Obvious Problems

Basic first aid remains accessible without specialist identification.

## 38.10 No Skill-Gated Survival Dead Ends

Core routine treatment must have reachable provider/item/facility routes. Specialist content cannot make ordinary Standard survival permanently unwinnable if one NPC dies.

## 38.11 No Treatment Duplication

Transaction IDs and resource reservation prevent double healing/consumption.

## 38.12 No Cross-Set Leakage

29G never writes prices, dialogue, movement speed, attack state, building service capacity or quest stages.

## 38.13 No Offline Procedure Exploit

Players cannot start a risky treatment, quit for hours and return to a free deterministic cure unless the authoritative simulation explicitly supports it.

## 38.14 No Permanent Rehab Grind

Standard rehab is milestone-based and bounded.

# 39. Validation, Test Cases and Acceptance Criteria

## 39.1 Data Validation

Validators should reject:

- duplicate treatment IDs;
- treatment capability with no provider source in Core content;
- treatment targeting condition families it cannot affect;
- item capability referencing missing item/relationship ID;
- facility requirement referencing missing service capability;
- biological outcome that writes directly to another owner's fields;
- treatment with resource cost but no reservation/commit policy;
- consumable treatment with no idempotency transaction path;
- routine Standard treatment with unavoidable catastrophic failure;
- Health-restoration capability that also silently deletes injury/disease without explicit outcomes;
- antidote with no compatible toxin family;
- rehab treatment without 29E eligibility link;
- magical treatment bypassing Magic resource/cast validation;
- treatment cooldown/saturation with no decay/reset policy;
- treatment plan with cyclic impossible dependency;
- save migration with removed treatment IDs and no alias/fallback.

## 39.2 Required Gameplay Tests

1. A basic bandage controls a compatible Light/Heavy bleed without restoring Health by itself.
2. Reusing the same consumed bandage transaction cannot apply twice.
3. Cancelling before commit does not consume the bandage under completion-consume policy.
4. Interrupted treatment uses its defined partial-consumption policy exactly once.
5. A fracture remains after Health is restored to maximum.
6. A valid splint raises the fracture recovery ceiling through 29E.
7. Self-splinting is slower or blocked when Manual Function is too impaired.
8. Wound cleaning reduces contamination exposure but does not cure an established infection.
9. Treating wound infection through 29G reduces 29F disease state while the physical wound remains.
10. A correct antidote reduces the matching toxin load.
11. A wrong antidote is rejected safely in Standard when incompatibility is known.
12. Repeated restorative potion use receives diminishing benefit through saturation.
13. Saturation decays and later medicine returns to normal strength.
14. An authored overdose-toxic medicine submits exactly one toxin exposure to 29F.
15. Health restoration routes through 29B and cannot directly change injury records.
16. A magical heal consumes mana through Magic and requests Health/injury outcomes through 29G.
17. A generic heal spell does not cure poison unless it carries the explicit toxin-cleanse capability.
18. A hospital with no staff/medicine fails advanced treatment validation.
19. A fully functional hospital enables its declared specialist procedure.
20. Set 28 can refuse a social treatment interaction without 29G modifying Trust/Affection.
21. Once consent/provider assignment is granted, 29G validates treatment independently of relationship values.
22. Set 27 receives treatment demand/resource use but 29G never sets a price.
23. Set 30 receives a rehab/safe-activity intent but 29G never changes movement speed.
24. Severe injury rehab requires only bounded milestone sessions in Standard.
25. Distant routine population treatment resolves by throughput summary, not per-NPC frame simulation.
26. Named story NPC condition/treatment persists individually through LOD demotion/promotion.
27. Save/load during treatment resumes or rolls back without duplicate consumption/outcome.
28. Split-screen players can treat different targets without shared UI state corruption.
29. Multiplayer client prediction cannot create Health or consume medicine authoritatively.
30. Peaceful profile can compress/waive routine treatment burden without deleting registry compatibility.
31. Harsh profile increases treatment pressure without moving ownership of disease/injury/economy.
32. Blood restoration changes Blood Loss state without automatically restoring Health.
33. Pain control lowers Pain Load but does not repair the injury.
34. Symptom-control medicine reduces symptoms without curing the disease unless explicit.
35. A treatment plan can recommend sleep/nutrition without 29G editing Sleep/Hunger directly.
36. An unavailable specialist produces a clear blocker and alternative route where Core content requires one.
37. A clinic service whose route becomes inaccessible cannot treat a patient until the owning settlement/navigation systems restore access.
38. Treatment history records source, target, capability and result without exposing hidden diagnosis knowledge to the player UI.
39. Duplicate network delivery of `TreatmentOutcome` is idempotent.
40. A downed actor is only treatable/revivable according to Combat's externally supplied interaction permission.

## 39.3 29G Acceptance Criteria

29G is acceptable when:

- treatment action ownership is clear and separate from condition ownership;
- routine first aid is useful, reliable and not tedious;
- medicine consumes real resources through authoritative transactions;
- Health healing cannot silently erase injury/disease/poison;
- 29E and 29F treatment handoffs are fully operational;
- magical healing uses the same biological contract without losing fantasy power;
- clinics/hospitals materially improve care without being decorative healing auras;
- NPC/social/economy/movement ownership is preserved;
- treatment scales from one player to city populations;
- multiplayer/save safety prevents duplicate consumption/healing;
- rehabilitation is meaningful but bounded;
- all new interfaces are recorded for 29J reconciliation.

# 40. Cross-Set Interface Amendments

The following amendments add required interfaces without transferring ownership.

## AM-29-033 Adoption - Injury Treatment Outcome Interface

**29G -> 29E**

29G submits explicit injury-treatment outcomes including bleed control, wound cleaning/protection, immobilisation, pain reduction, stabilisation, recovery-ceiling change, recovery progress and blood-restoration requests. 29E validates and stores injury state.

**Ownership transfer:** No.

## AM-29-048 Adoption - Disease/Poison Treatment Outcome Interface

**29G -> 29F**

29G submits disease/toxin treatment outcomes such as burden/load reduction, progression suppression, symptom control, antidote effect, clearance support, prophylaxis and authorised cure. 29F validates and stores disease/poison state.

**Ownership transfer:** No.

## AM-29-052 Adoption - Protection and Prophylaxis Capability Interface

29G may provide prophylaxis capability from approved medicines/magic; 29F owns resulting biological resistance/protection state. Equipment/Magic/Progression remain owners of source capability.

**Ownership transfer:** No.

## AM-29-053 - Universal Treatment Capability Interface

**Items / Magic / Facilities / Providers -> 29G**

Proposed payload:

- capability tags;
- strength/tier;
- compatible target families;
- dose/charge;
- quality;
- duration;
- required provider/context tags;
- saturation group/contribution;
- secondary biological outcome tags;
- source stable ID.

29G composes these capabilities into a treatment. Source systems retain ownership of the item/spell/service/provider.

**Ownership transfer:** No.

## AM-29-054 - Atomic Treatment Transaction Interface

**29G <-> Inventory / Magic / Service / Biological Owners**

Required fields:

- transaction ID;
- provider;
- patient;
- treatment definition;
- target condition IDs;
- reserved resources;
- service/mana reservation refs;
- start/commit/interruption state;
- outcome requests;
- final result/reason.

All consumers must treat the transaction ID as idempotent.

**Ownership transfer:** No.

## AM-29-055 - Treatment Provider Capability Interface

**NPC/Progression/Set 28 assignment -> 29G**

Provider systems expose:

- capability/skill bands;
- specialist tags;
- tool/equipment access;
- current impairment/availability;
- assistant capability;
- consent/assignment result reference.

29G does not define personality, social willingness, job schedule or skill progression.

**Ownership transfer:** No.

## AM-29-056 - Facility Treatment Context Interface

**Set 20 -> 29G**

Facility services expose:

- treatment-room class;
- sanitation/clean-zone quality;
- water/utilities state;
- bed/recovery slots;
- pharmacy/medicine access;
- diagnosis/lab capability;
- specialist/surgery capability;
- rehabilitation capability;
- operational/accessibility state.

29G consumes the context; Set 20 remains owner of facilities and capacity.

**Ownership transfer:** No.

## AM-29-057 - Medicine Item Treatment-Facet Interface

**Items/Recipes -> 29G**

Item definitions may expose a treatment facet containing capability tags, dose/charge, quality, administration route, saturation group and adverse-exposure link. 29G never changes item identity, recipe or price.

**Ownership transfer:** No.

## AM-29-058 - Magical Treatment Request Interface

**Document 09 -> 29G**

Magic submits:

- cast/ritual transaction reference;
- target;
- treatment capability tags;
- strength/duration;
- paid mana/component reference;
- school/source tags;
- interruption result.

29G validates biological compatibility and routes outcome to 29B/29E/29F. Magic retains casting/mana ownership.

**Ownership transfer:** No.

## AM-29-059 - Medical Service Demand Interface

**29G -> Set 27 / Set 20 / NPC systems**

Expose:

- treatment family;
- urgency;
- provider-time class;
- facility-time class;
- medicine/resource demand;
- specialist requirement;
- expected follow-up/recovery duration;
- population backlog/throughput.

Set 27 prices it; Set 20/NPC systems schedule/provide it.

**Ownership transfer:** No.

## AM-29-060 - Rehabilitation Activity Interface

**29G <-> Set 30 / 29E**

29G may request/consume semantic rehab activity such as `gentle_mobility`, `supported_load`, `manual_retraining` with duration/intensity limits supplied by 29E. Set 30 executes movement where physical activity is needed and returns completion/stress events. 29G submits recovery progress to 29E.

**Ownership transfer:** No.

## AM-29-061 - Clinical Assessment Evidence Interface

**29G -> UI / Knowledge / Set 28**

Assessment outputs:

- possible/confirmed condition family;
- confidence band;
- observed evidence;
- revealed treatment requirement tags;
- urgency;
- specialist/lab recommendation;
- knowledge visibility flags.

True disease/injury identity remains in 29E/29F; presentation/knowledge owners decide what the player knows.

**Ownership transfer:** No.

## AM-29-062 - Medicine Adverse/Overuse Exposure Interface

**29G -> 29F**

When an authored treatment defines toxic overuse or adverse biological exposure, 29G submits the declared toxin/exposure payload to 29F with the treatment transaction ID. 29F owns resulting poison/toxin state.

**Ownership transfer:** No.

## AM-29-063 - Blood-Loss Restoration Treatment Interface

**29G -> 29E**

Treatment may request a bounded Blood Loss restoration amount/rate modifier with source capability and transaction ID. 29E validates and stores Blood Loss state.

**Ownership transfer:** No.

## AM-29-064 - Generic Biological Healing Request Interface

**29G -> 29B**

Proposed request:

- transaction ID;
- target actor;
- immediate Health restoration;
- heal-over-time amount/duration;
- generic recovery modifier/duration;
- source/capability tags;
- saturation result;
- difficulty context.

29B validates/commits Health and generic recovery.

**Ownership transfer:** No.

## AM-29-065 - Population Treatment Throughput Interface

**29G -> Settlements / Set 27 / 29J**

Expose cohort-level:

- cases by urgency/treatment family;
- available treatment throughput;
- untreated backlog;
- medicine demand;
- specialist deficit;
- expected recovery throughput;
- workforce-health effect references.

This supports city-scale simulation without per-NPC treatment ticks.

**Ownership transfer:** No.

## AM-29-066 - Emergency Care / Downed Interaction Interface

**Document 16 -> 29G**

Combat exposes whether a downed/critical actor may receive biological treatment and which actions are permitted. 29G can stabilise/heal only within that permission. 29G never sets revival/death state.

**Ownership transfer:** No.

## AM-29-067 - Treatment Supply and Automation Interface

**Automation/Inventory/Set 20 -> 29G**

Healthcare services may expose reserved medicine stock, delivery availability and treatment-resource reservation through existing logistics contracts. 29G consumes/commits real resources but never creates automation routes or stock.

**Ownership transfer:** No.

## Amendment Status Table

| Amendment | Status | Ownership Transfer? | Final Reconciliation |
| --- | --- | --- | --- |
| AM-29-033 Adoption | Required | No | 29E/29G/29J |
| AM-29-048 Adoption | Required | No | 29F/29G/29J |
| AM-29-052 Adoption | Required | No | 29F/29G/Equipment/Magic |
| AM-29-053 | Proposed/required | No | Set 25 + source systems + 29J |
| AM-29-054 | Required | No | Inventory/Magic/Services/29J |
| AM-29-055 | Proposed/required | No | Set 28/NPC/Progression |
| AM-29-056 | Proposed/required | No | Set 20 final integration |
| AM-29-057 | Proposed/required | No | Items/Recipes/Set 25 |
| AM-29-058 | Proposed/required | No | Document 09 / 29J |
| AM-29-059 | Proposed/required | No | Set 27/Set 20/NPC integration |
| AM-29-060 | Proposed/required | No | Set 30/29E/29J |
| AM-29-061 | Proposed/required | No | UI/Knowledge/Set 28 |
| AM-29-062 | Internal Set 29 required | No | 29F/29G/29J |
| AM-29-063 | Internal Set 29 required | No | 29E/29G/29J |
| AM-29-064 | Internal Set 29 required | No | 29B/29G/29J |
| AM-29-065 | Proposed/required | No | Settlements/Set 27/29J |
| AM-29-066 | Proposed/required | No | Document 16/29J |
| AM-29-067 | Proposed/required | No | Automation/Inventory/Set 20 |

# Appendix A. Reference Treatment Parameters

## A.1 First-Aid Timing

| Treatment Class | Standard | Relaxed | Harsh |
| --- | ---: | ---: | ---: |
| Quick stabilise | 1.5-2.5 sec | 1-2 sec | 2-3.5 sec |
| Basic dressing | 3-5 sec | 2-4 sec | 4-7 sec |
| Wound cleaning | 5-8 sec | 3-6 sec | 6-10 sec |
| Splint/support | 6-10 sec | 4-7 sec | 8-14 sec |
| Field assessment | 3-6 sec | 2-4 sec | 4-8 sec |

## A.2 Restorative Health Classes

| Class | Reference Health Effect | Saturation Group |
| --- | --- | --- |
| Minor | 5-10% Max Health over time | restorative |
| Standard | 10-18% | restorative |
| Advanced | 18-30% | restorative |
| Emergency magical | 15-30%, partly immediate | magical restorative |
| Long-term care | recovery-rate modifier | recovery support |

## A.3 Treatment Saturation

| Recent Compatible Uses | Reference Strength |
| ---: | ---: |
| 0 | 1.00x |
| 1 within ~30 sec | 0.65x |
| 2+ within same window | 0.35x |
| After ~60-90 sec decay | returns toward 1.00x |

## A.4 Rehabilitation Session Scale

| Severity | Standard Dedicated Rehab |
| --- | --- |
| Minor | Usually none |
| Moderate | None or 1-2 sessions if functional impairment persists |
| Severe | 2-4 meaningful milestones |
| Critical | 3-6 milestones / specialist progression |

# Appendix B. Provisional 29G API Contract

## B.1 Queries

- `AvailableTreatments(provider_id, patient_id, condition_filter?)`
- `CanStartTreatment(provider_id, patient_id, treatment_id)`
- `TreatmentBlockers(provider_id, patient_id, treatment_id)`
- `TreatmentEstimate(provider_id, patient_id, treatment_id)`
- `TreatmentUrgency(patient_id)`
- `CareNeed(patient_id)`
- `RecoveryStatus(patient_id)`
- `AssessmentEvidence(patient_id)`
- `TreatmentPlan(patient_id)`
- `TreatmentSaturation(patient_id, group_id)`
- `RehabilitationEligibility(patient_id, injury_id)`
- `PopulationTreatmentDemand(settlement_id)`

## B.2 Commands / Transactions

- `RequestClinicalAssessment()`
- `StartTreatment()`
- `CancelTreatment()`
- `CompleteTreatment()`
- `SubmitInjuryTreatmentOutcome()`
- `SubmitDiseasePoisonTreatmentOutcome()`
- `SubmitBiologicalHealingRequest()`
- `SubmitBloodRestorationRequest()`
- `SubmitMedicalConsumptionSupport()`
- `RecordRehabilitationSession()`

## B.3 Events

- `TreatmentRequested`
- `TreatmentStarted`
- `TreatmentInterrupted`
- `TreatmentCompleted`
- `TreatmentFailed`
- `TreatmentResourceConsumed`
- `TreatmentSaturationChanged`
- `AssessmentCompleted`
- `TreatmentPlanChanged`
- `RehabilitationMilestoneReached`
- `MedicalServiceDemandChanged`

# Appendix C. Treatment Capability Tag Library

Initial conceptual capability tags:

- `treatment.stabilise.minor`
- `treatment.stabilise.critical`
- `treatment.bleed_control.light`
- `treatment.bleed_control.heavy`
- `treatment.wound.clean`
- `treatment.wound.protect`
- `treatment.immobilise.basic`
- `treatment.immobilise.advanced`
- `treatment.pain_control.minor`
- `treatment.pain_control.strong`
- `treatment.health_restore.minor`
- `treatment.health_restore.standard`
- `treatment.health_restore.advanced`
- `treatment.recovery_support.general`
- `treatment.disease.suppress`
- `treatment.infection.wound`
- `treatment.antiparasitic`
- `treatment.antidote.<family>`
- `treatment.toxin_clearance_support`
- `treatment.prophylaxis.<family>`
- `treatment.blood_restore.support`
- `treatment.blood_restore.advanced`
- `treatment.thermal.burn_aftercare`
- `treatment.thermal.frost_aftercare`
- `treatment.rehabilitation.mobility`
- `treatment.rehabilitation.manual`
- `treatment.magical.tissue_restore`
- `treatment.magical.biological_cleanse`

Final qualified-ID and facet syntax is subject to Set 25/29J schema reconciliation.

# Appendix D. Runtime Record Templates

## D.1 Basic Field Dressing

```yaml
transaction_id: <ULID>
provider_id: player:<id>
patient_id: player:<id>
treatment_id: treatment.first_aid.field_dressing
condition_refs:
  - injury:<id>
source_refs:
  - item:<bandage-instance>
capabilities:
  - treatment.bleed_control.light
  - treatment.wound.protect
context: field_safe
status: completed
outcomes:
  - target_owner: 29E
    operation: reduce_bleeding
    result: light_to_seep
  - target_owner: 29E
    operation: set_wound_protected
    result: true
health_restore: 0
```

## D.2 Venom Antidote

```yaml
transaction_id: <ULID>
provider_id: npc:<healer-id>
patient_id: player:<id>
treatment_id: treatment.medicine.antidote_family
condition_refs:
  - poison:<id>
capabilities:
  - treatment.antidote.venom_spider
context: clinic
outcomes:
  - target_owner: 29F
    operation: reduce_toxin_load
    magnitude: 35
  - target_owner: 29F
    operation: increase_elimination_rate
    duration_minutes: 10
```

## D.3 Rehabilitation Milestone

```yaml
plan_id: treatment_plan:<ULID>
patient_id: npc:<id>
injury_id: injury:<id>
rehab_type: treatment.rehabilitation.mobility
required_activity: gentle_mobility
session_index: 2
session_target: 3
set30_activity_event: movement_event:<id>
outcome_request:
  owner: 29E
  operation: add_recovery_progress
```

# Appendix E. Worked Gameplay Examples

## E.1 Raider Slash During Village Defence

1. Combat resolves a slash and sends trauma/damage.
2. 29B loses Health; 29E creates an arm laceration with Heavy bleeding.
3. UI shows urgent bleed warning.
4. Player retreats behind the gate and selects a field dressing.
5. 29G validates the wound, bandage capability and safe-enough interaction.
6. One bandage is reserved and applied over four seconds.
7. 29G submits bleed-control/wound-protection outcome to 29E.
8. 29E reduces Heavy to Light and marks dressing active.
9. Health remains low; natural recovery/other medicine is separate.
10. Later, a clinic healer cleans the wound and raises recovery quality.

## E.2 Spider Venom

1. Creature attack creates a puncture through Combat/29E and venom exposure through 29F.
2. Toxin Load rises to Severe.
3. 29F exposes compatible antidote family and Emergency urgency.
4. Player reaches a village healer.
5. Set 28 resolves the interaction and Set 27 may quote a fee.
6. 29G validates antidote stock, provider and toxin family.
7. Medicine is consumed once.
8. 29G requests toxin-load reduction and clearance support from 29F.
9. 29F reduces the poison state; puncture injury remains under 29E.

## E.3 Fractured Leg and Rehabilitation

1. Fall resolution creates a Severe leg fracture.
2. Field splint raises immediate stability/transport safety.
3. Set 30 transports the actor by wagon; 29E monitors transport stress.
4. Hospital specialist procedure improves immobilisation/recovery ceiling.
5. Sleep, nutrition and safe rest support ongoing recovery.
6. Once 29E marks rehabilitation eligible, 29G creates three milestone sessions.
7. Set 30 reports completed safe mobility activities.
8. 29G submits bounded recovery progress to 29E.
9. Full Health may have returned earlier; fracture recovery completes separately.

## E.4 Magical Battlefield Heal

1. Player is at 35 Health with a Moderate wound and Light bleeding.
2. Ally casts a healing spell. Magic validates mana/cast and emits `MagicalTreatmentRequest`.
3. Spell provides `health_restore.standard` and `bleed_control.light`, but no fracture/disease cure.
4. 29G validates both capabilities.
5. 29B restores Health over time; 29E controls bleeding.
6. The physical wound persists until its recovery requirements are satisfied.

## E.5 City Outbreak Healthcare

1. 29F reports rising disease cases and treatment requirements.
2. 29G aggregates routine cases into treatment demand/urgency cohorts.
3. Set 20 exposes hospital beds, staff, sanitation and medicine capacity.
4. Set 27 resolves medicine scarcity/prices/public spending separately.
5. 29G resolves bounded treatment throughput each simulation interval.
6. Named severe NPCs remain individually tracked.
7. Document 15 may create an outbreak event from the same facts.

# Appendix F. Migration and Supersession Notes

29G supersedes or narrows older broad assumptions where later specialist ownership now exists:

- Combat's generic `status.bleeding` treatment becomes compatibility input to 29E/29G.
- Combat's broad potion/healer table remains design intent but actual biological outcomes use 29G transactions.
- Item `healing` tags must migrate to treatment capability facets rather than directly mutating Health.
- Older scripts that call `Heal(amount)` directly should route generic treatment effects through AM-29-064 unless the effect is an internal 29B natural-recovery operation.
- Clinic/hospital scripts that apply periodic healing because a player is inside a volume must migrate to validated facility/service treatment contexts.
- Magic scripts that directly delete injury/disease state must route through AM-29-058 and the relevant biological owner.
- Disease/poison cure item scripts must route through AM-29-048.
- Bandage scripts must route through AM-29-033.
- Any item that silently combines Health heal + poison cure + fracture repair must be decomposed into explicit capability tags for validation and balance.

# Appendix G. Terminology Register

| Term | Meaning |
| --- | --- |
| Treatment | Authoritative action/procedure intended to improve biological state. |
| Treatment Capability | Semantic effect a provider/item/spell/facility can contribute. |
| Provider | Actor or service performing/authorising a treatment procedure. |
| Treatment Context | Environmental/facility conditions required for a treatment. |
| Treatment Transaction | Atomic request-reserve-perform-commit-outcome record. |
| First Aid | Immediate low/medium-complexity care focused on stabilisation. |
| Stabilisation | Preventing immediate worsening without necessarily curing the cause. |
| Diagnosis/Assessment | Procedure that produces evidence/confidence about a true condition. |
| Treatment Saturation | Gameplay anti-spam state that reduces repeated same-family medicine benefit. |
| Treatment Plan | Readable set of required/optional care steps and blockers. |
| Rehabilitation | Bounded treatment process supporting functional recovery after injury. |
| Specialist Procedure | High-level advanced treatment requiring specialist capability/context. |
| Biological Outcome Request | Explicit mutation request sent to 29B/29E/29F/29C. |
| Supportive Care | Treatment that improves recovery/symptoms without necessarily curing the cause. |
| Curative Capability | Explicit capability allowed to resolve a compatible disease/injury state. |

# Appendix H. Cross-Set Interface Amendments Register

29G carries forward all applicable Set 29 amendments. New/modified interfaces introduced here are:

- AM-29-033 Adoption - Injury Treatment Outcome Interface.
- AM-29-048 Adoption - Disease/Poison Treatment Outcome Interface.
- AM-29-052 Adoption - Protection and Prophylaxis Capability Interface.
- AM-29-053 - Universal Treatment Capability Interface.
- AM-29-054 - Atomic Treatment Transaction Interface.
- AM-29-055 - Treatment Provider Capability Interface.
- AM-29-056 - Facility Treatment Context Interface.
- AM-29-057 - Medicine Item Treatment-Facet Interface.
- AM-29-058 - Magical Treatment Request Interface.
- AM-29-059 - Medical Service Demand Interface.
- AM-29-060 - Rehabilitation Activity Interface.
- AM-29-061 - Clinical Assessment Evidence Interface.
- AM-29-062 - Medicine Adverse/Overuse Exposure Interface.
- AM-29-063 - Blood-Loss Restoration Treatment Interface.
- AM-29-064 - Generic Biological Healing Request Interface.
- AM-29-065 - Population Treatment Throughput Interface.
- AM-29-066 - Emergency Care / Downed Interaction Interface.
- AM-29-067 - Treatment Supply and Automation Interface.

All amendments remain subject to final 29J and Document Sets 27-30 reconciliation. None transfers gameplay ownership.

---

**End of Document 29G - Medicine, First Aid, Healing, Treatment and Rehabilitation v0.1**
