# FANTASY VOXEL CIVILISATION SANDBOX

## DOCUMENT SET 29

# 29E - Injuries, Wounds, Bleeding, Pain and Functional Impairment

*Version 0.1 - Detailed Design Bible, Runtime Rules and Integration Contract Draft*

A data-driven persistent-injury system for Leyforge where resolved damage and environmental trauma can leave readable wounds, bleeding, pain and temporary functional impairment without turning combat into a medical simulator, taking ownership away from Combat or Movement, or making one unlucky hit ruin a long-running character.

**Project Lead and Final Authority: Ash**

Architecture, systems planning, documentation and production support: GPT-5.6 Sol

---

> **Injury, Wound and Functional Impairment Statement**
>
> Leyforge injuries are the persistent biological consequence layer between immediate damage and long-term recovery. Combat, falls, hazards and environmental systems decide what happened. Set 29 decides what that event did to the body after protection and external resolution are complete. Injuries should make bandages, splints, healers, rest, hospitals, protective equipment and rescue matter while remaining understandable, recoverable and configurable. A wound may reduce how effectively an arm, leg, head or torso can function, but Set 29 never decides weapon damage, movement speed, attack controls, death, dialogue, prices or vehicle behaviour. Those owners consume the biological state through interfaces.

| Field | Locked Direction |
| --- | --- |
| Document Set | This is Document 29E in Document Set 29: Survival, Health & Biological Systems. |
| Governing Contract | The Leyforge Document Sets 27-30 Cross-Set Interface Register v1.0 is mandatory. Set 29 owns injuries and biological impairment; it consumes Economy, Social and Movement interfaces without redefining them. |
| Injury Direction | Injuries are persistent condition records separate from Health. Most ordinary hits reduce Health without creating a lasting wound. Significant or repeated trauma can create or worsen an injury. |
| Region Direction | Humanoid players use Head, Torso, Left Arm, Right Arm, Left Leg and Right Leg biological regions. Non-humanoids use profile-defined semantic regions rather than being forced into humanoid anatomy. |
| Severity Direction | Use Minor, Moderate, Severe and Critical injury severities. Severity changes treatment need, pain, bleeding, impairment, worsening risk and recovery time. |
| Wound Direction | Core injury families include laceration, puncture, contusion, sprain/strain, fracture, dislocation, crush trauma, head trauma, burns and frost injury. Disease and poison remain 29F. |
| Bleeding Direction | Open injuries may create active bleeding. Bleeding feeds an abstract Blood Loss state rather than litre-accurate simulation. Severe uncontrolled bleeding can create a Critical Condition but does not own death resolution. |
| Pain Direction | Pain is a biological 0-100 load derived from injuries and selected conditions. It affects stamina/recovery and exposes impairment interfaces, but does not force camera blur, input loss or morale changes. |
| Impairment Direction | Injuries expose biological function modifiers such as Manual Function, Mobility Function and Cognitive/Head Function. Combat and Movement decide how those modifiers affect actions. |
| Treatment Direction | 29E defines stabilisation and recovery requirements. Document 29G owns treatment actions and medicine effects; Items/Recipes own physical treatment items and recipes. |
| Recovery Direction | Injuries progress through Acute, Stabilised, Recovering and Healed states. Standard mode allows complete recovery from ordinary injuries with appropriate care; permanent disability is not a default punishment. |
| NPC Direction | Named NPCs can carry persistent injuries. Distant populations use bounded injury cohorts and work-capacity summaries rather than full per-wound simulation. |
| Difficulty Direction | Peaceful, Relaxed, Standard, Harsh and Custom use the same architecture with different trauma thresholds, bleeding rates, recovery speeds and long-term consequence rules. |
| Data Direction | Injury definitions, biological-region profiles, wound state, bleeding, pain, treatment requirements and recovery are stable-ID, registry-driven and validated under Set 25 governance. |

# Document Purpose

Document 29E defines Leyforge's persistent physical-injury layer. It answers what happens after an authoritative external system has already resolved an impact, fall, burn, crushing event or other physical hazard. It defines biological regions, trauma accumulation, injury creation, severity, open wounds, bleeding, blood loss, pain, functional impairment, stabilisation, worsening, recovery and large-population abstraction.

The document intentionally does **not** resolve attacks. Document 16 remains owner of attacks, armour, blocking, parrying, critical hits, damage packets, combat actions, downing and death. Set 30 remains owner of locomotion and traversal. 29E consumes the final result and exposes biological state back to those systems.

A character can therefore be at high Health while recovering from a fractured arm, or at low Health with no lasting wound after a non-traumatic magical blast. Health measures current biological survivability under 29B. Injuries are persistent records with their own location, severity, pain, bleeding, treatment and recovery state.

The system also preserves the existing Combat direction that bandages stabilise bleeding, splints support fractures, healers need real medicine and facilities, and rest is a long-term recovery tool rather than an instant combat reset. It converts those older broad rules into a dedicated Set 29 authority without duplicating item recipes, NPC dialogue, building services or economy.

> **Locked 29E Rule**
>
> A lasting injury must be caused by an authoritative biological-trauma event, represented by a stable injury record, and resolved through explicit biological recovery. It may never be invented by UI, created solely because Health is low, or used as a backdoor for another system to redefine combat, movement, social behaviour or economy.

# Design Sources, Authority and Treatment

| Source | Relevant Direction | 29E Treatment |
| --- | --- | --- |
| 00 - Master Game Design Bible | Survival, civilisation, combat and player freedom coexist across cosy-to-harsh settings. | Injuries create meaningful preparation and aftermath without making ordinary play constantly punitive. |
| 01 - Core Gameplay Loop | Danger and recovery feed back into preparation, settlement support and world consequence. | Injuries produce reasons to retreat, rest, seek care, improve infrastructure or alter plans. |
| 02 - Player Progression | Health and Stamina are derived resources; death does not remove level/skills by default; skills/perks may improve survival. | 29E consumes derived-resource and perk modifiers but does not create a new attribute system. |
| 04 - Items Registry | Medicine, healing consumables, armour, equipment and physical item tags already exist. | Item identity and inventory remain external. 29E consumes biological trait payloads from approved treatment items through 29G. |
| 05 - Crafting and Recipe Registry | Medicine, repair, alchemy and consumable production use the shared recipe foundation. | 29E never creates recipes or free medicine. Treatment consumes real items through their owning systems. |
| 09 - Magic System | Healing, cleansing, wards and magical support exist with mana, knowledge and progression costs. | Magic may request injury treatment through 29G/29E interfaces but cannot bypass biological authority without an explicit capability. |
| 16 - Combat, Gear and Defence | Combat already includes bleeding, fractures, burns/frost injury, persistent NPC injuries, bandages, splints, healers, rest and no instant combat reset. | Preserve intent while moving persistent injury truth to Set 29. Combat supplies resolved impact and consumes resulting impairment. |
| 17 - UI/UX System | Status, injuries, warnings and treatment suggestions must be contextual, readable, configurable and accessible. | Injury UI uses progressive disclosure, non-colour cues and optional exact values rather than permanent medical dashboards. |
| 20 - Buildings and Facilities | Clinics, hospitals, beds, medicine stock, staff, safety and infrastructure enable real healthcare services. | Facilities supply treatment context/capacity. A building never heals by appearance alone. |
| 25A-25L - Production Governance | Stable IDs, schemas, relationships, validation and migration govern production data. | Injury and biological-region registries must conform to Set 25 rather than create parallel registry rules. |
| 29A - Survival Foundation | Set 29 owns biological state; Combat owns damage/death; Movement owns locomotion; economy/social are consumed through APIs. | 29E is bound by those ownership rules. |
| 29B - Health, Stamina and Fatigue | Health, Stamina, Exertion, Fatigue and natural recovery are distinct. Natural Health recovery does not cure injuries. | Injuries modify recovery and stamina through published modifier bundles. |
| 29D - Temperature and Sleep | Extreme temperature hands thermal injury to 29E; shelter/sleep support recovery but do not directly erase injuries. | 29E owns burn/frost injury records after exposure thresholds are crossed. |
| Set 27 | Owns medical prices, wages, workforce economy and costs. | 29E exposes injury downtime/demand; it never prices treatment. |
| Set 28 | Owns doctor interaction, companion care, relationships and social response. | 29E exposes care need and injury state; it never writes dialogue or loyalty behaviour. |
| Set 30 | Owns movement, traversal and transportation. | 29E exposes mobility-related biological function only; Set 30 decides locomotion consequences. |

# Static Table of Contents

1. Locked 29E System Identity  
2. Approved Decision Summary  
3. Ownership and Non-Ownership Boundary  
4. Injury-State Architecture  
5. Biological Regions and Morphology Profiles  
6. Resolved Trauma Input and Injury Generation  
7. Regional Trauma Accumulation and Deterministic Thresholds  
8. Injury Severity, Priority and Record Consolidation  
9. Core Injury Families and Compatibility Tags  
10. Lacerations and Open Wounds  
11. Puncture and Penetrating Trauma  
12. Contusions, Sprains and Soft-Tissue Trauma  
13. Fractures and Dislocations  
14. Crush and Head Trauma  
15. Burns, Frost Injury and Special Physical Trauma  
16. Bleeding Architecture  
17. Blood Loss, Critical Condition and Restoration  
18. Pain Architecture and Pain Load  
19. Functional Impairment Model  
20. Region-Specific Functional Outputs  
21. Stabilisation and Immediate Care State  
22. Worsening, Re-Injury and Complication Handoffs  
23. Injury Recovery Stages and Eligibility  
24. Recovery Rates, Ceilings and Long-Term Consequences  
25. Health, Stamina, Fatigue and Sleep Integration  
26. Combat and Equipment Integration  
27. Movement, Carrying and Rescue Integration  
28. Disease, Contamination and Poison Boundaries  
29. Medicine, First Aid, Magic and 29G Handoff  
30. NPCs, Companions and Workforce Injury  
31. Settlement Healthcare, Triage and Population Injury  
32. Difficulty Profiles and Custom Settings  
33. Simulation LOD, Persistence and Offline Rules  
34. Multiplayer Authority and Transaction Safety  
35. UI, Feedback and Accessibility  
36. Registry Definitions and Runtime Records  
37. Balance, Anti-Grind and Anti-Exploit Rules  
38. Validation, Test Cases and Acceptance Criteria  
39. Cross-Set Interface Amendments  
Appendix A. Reference Balance Tables  
Appendix B. Provisional 29E API Contract  
Appendix C. Initial Injury Definition Set  
Appendix D. Runtime Record Templates  
Appendix E. Worked Gameplay Examples  
Appendix F. Migration and Supersession Notes  
Appendix G. Terminology Register

# 1. Locked 29E System Identity

29E is the authoritative persistent-injury layer of Leyforge. It translates sufficiently significant biological trauma into wounds and impairments that continue after the immediate damage event.

| Identity Layer | Meaning | Player-Facing Result |
| --- | --- | --- |
| Trauma Consequence | Significant impacts can leave persistent injury even after immediate Health is restored. | Combat aftermath matters without making every hit a permanent problem. |
| Readable Location | Injuries attach to semantic biological regions. | A hurt leg, arm or torso has understandable consequences and treatment needs. |
| Wound State | Open wounds may bleed, require stabilisation and create contamination exposure. | Bandages, clean treatment and medical supplies have concrete purpose. |
| Pain | Injuries can create temporary biological strain. | Serious wounds feel consequential without mandatory camera distortion. |
| Functional Impairment | Biological regions expose reduced function. | Combat, traversal and work systems can respond without Set 29 owning their mechanics. |
| Recovery | Injury healing depends on severity, care, safety, nutrition, sleep and re-injury. | Rest and healthcare matter, but the player is rarely forced into total inactivity. |
| Civilisation Consequence | Injured NPCs need care and lose some work capacity. | Clinics, hospitals, medicine production and workforce resilience matter to settlements. |
| Configurable Severity | Difficulty changes injury frequency and consequence. | Peaceful builders and harsh-survival players use one compatible system. |

## 1.1 Injuries Are Not Random Punishment

Standard mode should not roll a hidden dice after every attack and occasionally ruin a character. Injury generation is primarily deterministic and based on the severity and repetition of resolved trauma. Randomness may vary cosmetic wound wording, exact pain within a narrow range or which compatible minor wound definition is selected, but it should not determine whether a trivial hit becomes catastrophic.

## 1.2 Injury Is Not Health

Health and Injury must remain separate:

- Health can be lost without a persistent injury.
- An injury can remain after Health returns to maximum.
- Healing Health does not automatically cure fractures, open wounds or severe burns.
- Treating an injury can improve recovery without instantly restoring Health.
- A critically injured character may still have non-zero Health.
- Zero Health is handed to the existing downed/death owner; 29E does not decide death.

# 2. Approved Decision Summary

| Area | Locked Decision |
| --- | --- |
| Injury Frequency | Ordinary low-severity hits generally do not create persistent injuries. Significant single impacts, repeated regional trauma and explicit injury-capable hazards do. |
| Randomness | Deterministic accumulation and thresholds are preferred over hidden injury chance. |
| Body Regions | Default humanoid regions: Head, Torso, Left Arm, Right Arm, Left Leg, Right Leg. Other morphologies use semantic profile definitions. |
| Region Detail | No organ-by-organ simulation. Internal injury may be represented by Torso/Head trauma definitions where needed. |
| Severity | Minor, Moderate, Severe, Critical. |
| Active Injury Count | Duplicate injuries on the same region/family consolidate or worsen rather than producing an unreadable list of twenty cuts. |
| Core Injury Families | Laceration, puncture, contusion, sprain/strain, fracture, dislocation, crush trauma, head trauma, burn, frost injury. |
| Limb Loss | Not part of Core Set 29. Amputation/dismemberment requires a later explicit content, animation, equipment, accessibility and narrative decision. |
| Bleeding | Open wounds carry a bleed class and contribute to abstract Blood Loss. |
| Blood Loss | 0-100 abstract state. Severe loss causes biological penalties and can create Critical Condition; it does not own death. |
| Pain | 0-100 derived biological load. It is contextual, not necessarily a permanent HUD bar. |
| Functional Impairment | Expressed as biological function modifiers. External gameplay systems decide action-specific consequences. |
| Permanent Disability | Disabled by default. Standard permits full eventual recovery from ordinary injuries with valid care. Chronic states may exist but remain treatable unless authored content explicitly says otherwise. |
| Re-Injury | Repeated stress or trauma can regress recovery and raise severity. |
| Recovery | Uses Acute -> Stabilised -> Recovering -> Healed. Severe injuries may take multiple simulation days but can improve through specialist care/magic. |
| Infection | 29E emits contamination/open-wound exposure; 29F owns infection/disease. |
| Poison | 29F owns toxin/venom state. A physical puncture and poison may coexist as separate conditions. |
| Treatment | 29E owns treatment requirements/state. 29G owns first-aid/medicine effects and treatment actions. |
| Movement | 29E outputs Mobility Function; Set 30 decides speed, climbing, jumping and traversal behaviour. |
| Combat | 29E outputs Manual/Head Function and pain/bleeding state; Combat decides attacks, aiming, blocking, action timing and damage. |
| Peaceful | Persistent traumatic injuries are strongly reduced; severe/critical injury from routine combat is normally disabled unless explicitly enabled. |

# 3. Ownership and Non-Ownership Boundary

## 3.1 29E Owns

- persistent injury records;
- biological region mapping;
- regional trauma accumulation;
- injury creation and severity;
- wound open/closed state;
- bleeding class;
- Blood Loss;
- pain load caused by physical injury;
- functional biological impairment;
- stabilisation state;
- re-injury and worsening;
- injury recovery stage and progress;
- injury-to-Health/Stamina/Fatigue recovery modifiers;
- wound contamination exposure handoff;
- injury simulation LOD;
- population injury summaries.

## 3.2 29E Does Not Own

29E does not own:

- attack resolution, weapon damage, critical hits or armour mitigation;
- hit detection or collision;
- fall physics;
- movement speed, climbing, sprinting, swimming or mount controls;
- downed/death/respawn rules;
- medicine item definitions or recipes;
- first-aid interaction controls;
- healer dialogue, trust or companion loyalty;
- hospital prices or wages;
- building service activation;
- disease/infection progression;
- poison/venom simulation;
- magical spell design;
- corruption;
- cosmetic gore systems.

## 3.3 Cause -> Biology -> Consequence Pattern

The required pattern is:

1. An owning external system resolves what happened.
2. It sends an authoritative `ResolvedBiologicalTrauma` payload.
3. 29E validates biological applicability and region mapping.
4. 29E applies regional trauma and creates/worsens injuries where thresholds are crossed.
5. 29E updates bleeding, blood loss, pain, impairment and recovery state.
6. 29E publishes modifiers and events.
7. Combat, Movement, Economy, Social, Quest and UI systems consume those outputs without editing injury truth directly.

# 4. Injury-State Architecture

Each persistent injury is a stable runtime record attached to an actor and a semantic biological region.

| State Component | Purpose |
| --- | --- |
| `injury_definition_id` | Stable registry definition for the injury family/type. |
| `biological_region_id` | Semantic body region affected. |
| `severity` | Minor, Moderate, Severe or Critical. |
| `phase` | Acute, Stabilised, Recovering, Healed or Chronic. |
| `wound_open_state` | Closed, Open, Contaminated/Exposed flag interface. |
| `bleed_class` | None, Seep, Light, Heavy or Critical. |
| `pain_contribution` | Base pain contribution before combination and treatment. |
| `function_penalties` | Region-compatible biological function modifiers. |
| `recovery_progress` | 0-100 healing progress inside the current injury record. |
| `recovery_ceiling` | Maximum progress until required care is satisfied. |
| `treatment_flags` | Stabilised, dressed, immobilised, cleaned, specialist-reviewed, magical-treated, etc. |
| `last_trauma_time` | Used for re-injury and acute-risk windows. |
| `source_event_id` | Traceable source without requiring the source actor to remain loaded. |
| `history_flags` | Upgraded severity, reopened, relapsed, chronic, scar eligible. |

## 4.1 Injury Phase Model

**Acute** means the injury is fresh or currently unstable. Bleeding, pain and worsening risk are highest.

**Stabilised** means immediate deterioration has been controlled where possible. Stabilisation does not equal healing.

**Recovering** means recovery prerequisites are satisfied and progress can advance.

**Healed** means biological penalties are removed. A cosmetic scar or history entry may remain.

**Chronic** is a rare long-term state for unresolved severe injury, authored conditions or Harsh/Custom settings. Chronic is not synonymous with permanent; advanced care may still resolve it.

# 5. Biological Regions and Morphology Profiles

The default player profile is humanoid, but the underlying system must support non-humanoid NPCs, creatures and future playable peoples without hardcoding six limbs into every biological system.

## 5.1 Default Humanoid Regions

| Region | Semantic Role | Typical Injury Consequences |
| --- | --- | --- |
| Head | sensory/cognitive/control region | head-trauma pain, concentration burden, consciousness-risk interface |
| Torso | core/respiratory/protective region | recovery burden, pain, severe trauma risk, major bleeding compatibility |
| Left Arm | manipulator | manual-function reduction, grip/load handling interface |
| Right Arm | manipulator | manual-function reduction, grip/load handling interface |
| Left Leg | locomotor | mobility-function reduction, carry penalty interface |
| Right Leg | locomotor | mobility-function reduction, carry penalty interface |

## 5.2 Semantic Morphology Roles

A `BiologicalRegionProfile` may define semantic tags such as:

- `core`;
- `head`;
- `manipulator`;
- `locomotor`;
- `wing`;
- `tail`;
- `shell`;
- `distributed_body`;
- `non_bleeding_construct`;
- `regenerative_region`;
- `redundant_limb`.

The gameplay system queries semantic functions rather than assuming that every creature has human arms and legs.

## 5.3 Culture Is Not Biology

Culture, faction, profession, clothing style and social identity never change biological injury rules by themselves. Any species/ancestry or creature difference must be an explicit biological profile field and remain compatible with the project's wider anti-essentialism rules.

## 5.4 Non-Biological Actors

Constructs, machines, summoned objects and some magical entities may set `uses_biological_injury_system=false`. Their damage/repair state remains with their owning systems. A golem should not bleed merely because it has a humanoid rig.

# 6. Resolved Trauma Input and Injury Generation

29E never inspects raw attack intent. It receives an already-resolved biological-trauma payload.

## 6.1 Required Resolved Trauma Fields

A `ResolvedBiologicalTrauma` payload should contain:

- authoritative event ID;
- target actor ID;
- final Health damage already accepted by 29B, or paired Health transaction reference;
- damage/trauma tags;
- resolved external hit location or region hint;
- impact class: Trivial, Light, Significant, Heavy, Extreme;
- open-wound compatibility tags;
- thermal/crush/fall/penetration flags where applicable;
- source category for history/explainability;
- whether the event explicitly permits injury generation;
- optional authored minimum injury severity for boss/event hazards;
- server/world timestamp.

Combat calculates armour, blocking, penetration and attack outcome before this payload. 29E must not re-run those rules.

## 6.2 Events That Can Produce Injury

Potential sources include:

- resolved combat impacts;
- significant falls after Set 30/world physics resolution;
- crushing/collapse hazards;
- traps;
- environmental extreme-temperature handoff from 29D;
- authored industrial accidents;
- selected creature attacks;
- magical effects explicitly tagged as biological trauma;
- scripted quest/event consequences that use the same validated transaction.

Routine hunger, thirst, disease and poison do not create physical injury records unless their owning specialist explicitly emits a compatible secondary-trauma event.

# 7. Regional Trauma Accumulation and Deterministic Thresholds

To avoid hidden injury lottery behaviour, 29E uses an internal **Regional Trauma** state.

Regional Trauma is a short-lived 0-100 value stored per biological region. It represents repeated unresolved physical stress to that region, not permanent damage and not a player-facing resource.

## 7.1 Trauma Contribution

Reference impact contributions:

| Impact Class | Regional Trauma Added | Typical Meaning |
| --- | ---: | --- |
| Trivial | 0-3 | cosmetic/glancing event; generally cannot create persistent injury |
| Light | 4-10 | small hit, short fall, weak hazard |
| Significant | 12-24 | meaningful hit that can contribute to Minor/Moderate injury |
| Heavy | 25-44 | major impact capable of immediate injury |
| Extreme | 45-70 | catastrophic impact likely to create Severe/Critical injury |

Registry tags can modify the contribution within bounded limits. A penetrating or crushing event may add more trauma to compatible injury families; armour has already done its mitigation upstream.

## 7.2 Reference Injury Thresholds

| Regional Trauma | Result |
| ---: | --- |
| 0-19 | No persistent injury required. |
| 20-44 | Minor injury candidate. |
| 45-69 | Moderate injury candidate. |
| 70-89 | Severe injury candidate. |
| 90-100 | Critical injury candidate. |

Crossing a threshold generates or upgrades the most compatible injury. An Extreme event may cross several bands immediately.

## 7.3 Trauma Decay

If a region has not taken new trauma and has no unstable injury requiring the value, Regional Trauma decays toward zero. Standard reference decay is **4 points per simulation minute** after a **30-second calm delay**.

This lets repeated blows matter during one encounter without making small damage accumulated over several peaceful days eventually break a limb.

## 7.4 No Injury Farming

Regional Trauma itself does not grant XP, medicine skill or progression. Repeatedly injuring a cooperative actor cannot be used as a high-value training loop; progression owners should use diminishing or zero rewards for artificial harm cycles.

# 8. Injury Severity, Priority and Record Consolidation

Severity represents the current biological seriousness of a persistent injury.

| Severity | Meaning | Standard Consequence |
| --- | --- | --- |
| Minor | noticeable but stable with basic care | small pain/impairment; usually same-day recovery |
| Moderate | meaningful injury requiring care/rest | clear function loss and recovery delay |
| Severe | major injury with substantial impairment | specialist care useful or required; multi-day recovery possible |
| Critical | unstable or life-threatening biological injury | urgent stabilisation, strong impairment and Critical Condition risk |

## 8.1 Severity Does Not Equal Health Percentage

Severity is influenced by trauma, injury family, location, open-wound state and event tags. A small penetrating wound can bleed seriously despite modest Health loss; a large magical Health hit may leave no persistent physical wound.

## 8.2 Consolidation Rule

To keep the system readable:

- identical injury family + region records normally merge;
- a new compatible injury may raise severity, reopen a wound or regress recovery;
- one region should normally hold no more than **two active detailed injuries**;
- player/NPC actors should normally hold no more than **six detailed physical injury records** at once in Standard;
- excess minor records consolidate into the most relevant existing record or an aggregate `general_minor_trauma` record;
- Critical authored injuries may bypass the soft cap.

This cap is a readability/performance rule, not a claim that only six body injuries can exist in fiction.

# 9. Core Injury Families and Compatibility Tags

| Injury Family | Common Source Tags | Can Bleed | Typical Regions | Common Care Gate |
| --- | --- | --- | --- | --- |
| Laceration | slash, sharp, debris | Yes | any exposed biological region | dressing/bleed control |
| Puncture | pierce, projectile, bite | Yes | most regions | bleed control, cleaning, specialist for severe |
| Contusion | blunt, impact | No | any | rest, cooling/support, time |
| Sprain/Strain | twist, fall, overload | No | manipulators/locomotors | support/rest |
| Fracture | blunt, crush, fall | Sometimes secondary | limbs/core profile dependent | immobilisation; specialist for severe |
| Dislocation | twist, impact | No | jointed limbs | reduction/specialist/support |
| Crush Trauma | crush, collapse, heavy impact | Possible | torso/limbs | urgent stabilisation/specialist |
| Head Trauma | head impact, blast, fall | Possible | head | monitoring/rest/specialist by severity |
| Burn | fire, thermal, alchemical heat | Possible at high severity | exposed regions | cooling, salve, sterile care |
| Frost Injury | extreme cold/ice | Rare | exposed regions | controlled warming, specialist at severity |

Disease, infection, poison, curse and corruption are not physical-injury families in 29E.

# 10. Lacerations and Open Wounds

Lacerations represent cuts and tears caused by sharp trauma. They are the most common source of visible open wounds and routine bleeding.

## 10.1 Severity Direction

- **Minor:** shallow cut; low pain; None/Seep bleeding; basic dressing may be sufficient.
- **Moderate:** deeper wound; Light bleeding; noticeable function penalty when on a limb.
- **Severe:** deep/large wound; Heavy bleeding potential; stabilisation and specialist treatment strongly recommended.
- **Critical:** catastrophic open wound; Critical bleed potential; urgent stabilisation required.

## 10.2 Open-Wound State

A laceration can be:

- `open_uncontrolled`;
- `open_controlled`;
- `dressed`;
- `closed_healing`;
- `reopened`;
- `healed`.

29G defines how a bandage, suture-equivalent, healing spell or specialist treatment changes these states. 29E defines what those states mean biologically.

# 11. Puncture and Penetrating Trauma

Punctures represent arrows, spears, teeth, spikes and other penetrating events after Combat has resolved penetration and Health damage.

29E does not model retained projectiles unless the Projectile/Item owner exposes a `retained_foreign_object` flag. If present, the injury may have a recovery ceiling until safely removed through an appropriate external treatment interaction.

## 11.1 Puncture Distinctions

- Punctures may have lower visible bleeding but higher contamination or internal-trauma risk than equivalent lacerations.
- Severe torso/head punctures may create Critical Condition without requiring huge external bleeding.
- Poison delivered by a bite or weapon is a separate 29F toxin event. The puncture injury and poison state coexist.

# 12. Contusions, Sprains and Soft-Tissue Trauma

Contusions and sprains provide persistent consequences for blunt hits, falls and twisting events without requiring every impact to break bones.

## 12.1 Contusion

Contusions generally:

- do not bleed externally;
- create pain and temporary function loss;
- recover faster than fractures at equivalent severity;
- can worsen when the same region is repeatedly struck.

## 12.2 Sprain/Strain

Sprain/strain injuries are most compatible with limb regions and can be created by significant twisting, fall or overload events supplied by Movement/world physics. Ordinary sprinting or climbing does not randomly sprain a player in Standard.

Harsh/Custom may allow overuse to contribute to regional trauma, but this is never the Standard chore loop.

# 13. Fractures and Dislocations

Fractures and dislocations are high-consequence but recoverable injury families.

## 13.1 Fracture Direction

- Minor fracture represents a small stable break or equivalent fantasy biological injury.
- Moderate fracture requires immobilisation for efficient recovery.
- Severe fracture strongly limits regional function and normally requires specialist care for full recovery.
- Critical fracture may create crush/open-wound complications and Critical Condition depending on region.

## 13.2 Immobilisation Gate

A Moderate+ fracture has a recovery ceiling while `immobilised=false`.

Reference Standard ceilings:

| Severity | Untreated/Unimmobilised Recovery Ceiling |
| --- | ---: |
| Minor | 70% |
| Moderate | 35% |
| Severe | 15% |
| Critical | Stabilisation only; no meaningful recovery |

A splint or equivalent support does not instantly heal the fracture. It raises the recovery ceiling and reduces re-injury risk. The actual splint item and interaction belong to Items/29G.

## 13.3 Dislocation

Dislocation is usually a joint-function injury with high immediate impairment. Specialist reduction or approved magical treatment may move it quickly from Acute to Stabilised, but residual pain/recovery remains.

# 14. Crush and Head Trauma

## 14.1 Crush Trauma

Crush trauma represents cave-ins, heavy machinery, large creature impacts, siege debris and other compressed-body events. It may combine:

- severe pain;
- reduced regional function;
- internal-trauma tags;
- fracture compatibility;
- high re-injury sensitivity;
- major specialist-care demand.

Crush trauma is deliberately uncommon and should be strongly telegraphed where the player can reasonably avoid it.

## 14.2 Head Trauma

Head trauma is an abstract gameplay representation, not a clinical simulation. It may create:

- Head Function reduction;
- increased Stamina/Exertion burden;
- reduced recovery quality;
- pain;
- temporary `consciousness_risk` flag at Severe/Critical levels.

Combat/UI may use Head Function for aim/awareness presentation, but 29E does not blur the screen, steal input or alter camera by default.

## 14.3 No Mandatory Concussion Minigame

There is no mandatory memory test, balance minigame or forced visual distortion. Accessibility settings can remove optional audiovisual effects without altering authoritative injury state.

# 15. Burns, Frost Injury and Special Physical Trauma

Burn and frost injuries are created after 29D or another hazard owner crosses an injury threshold and submits a thermal-trauma handoff.

## 15.1 Burn

Burn severity controls:

- pain;
- recovery delay;
- contamination susceptibility;
- equipment-contact sensitivity where relevant;
- specialist-care need.

A burn is not the same as current Heat Exposure. Once tissue injury exists, returning to normal temperature stops further exposure but does not erase the burn.

## 15.2 Frost Injury

Frost injury likewise persists after the actor is warm. Rapid warming, treatment quality and specialist care are handled through 29G inputs; 29E owns the injury state and recovery gate.

## 15.3 Magical/Alchemical Physical Trauma

Magic, alchemy or realm effects may create physical injury only when their owning definition explicitly outputs compatible biological-trauma tags. `arcane` is not itself an injury family. The payload should resolve to a physical injury or remain with the magic/status owner.

# 16. Bleeding Architecture

Bleeding belongs to 29E because it is a biological consequence of wounds.

Each active wound may carry one Bleed Class:

| Bleed Class | Meaning | Standard Blood-Loss Rate |
| --- | --- | ---: |
| None | no active external/major bleeding | 0/min |
| Seep | minor controlled seepage | 0.2/min |
| Light | clear but non-immediate bleed | 0.7/min |
| Heavy | urgent bleed | 2.0/min |
| Critical | catastrophic bleed | 4.5/min |

Rates are reference values before biological profile, difficulty and treatment modifiers. They intentionally use abstract Blood Loss rather than real volume.

## 16.1 Multiple Bleeds

Bleed rates add with diminishing contribution:

`TotalBleed = Largest + 0.6*Second + 0.35*Third + 0.2*Remaining`

This keeps multiple injuries dangerous without making three small cuts more lethal than a major traumatic wound.

## 16.2 Bleed Control

A treatment can change a wound from Heavy to Light, Light to Seep or controlled None without healing the injury. Bandages, pressure, magical clotting or surgical care request these state changes through 29G/29E transactions.

## 16.3 Reopening

Strenuous use, major new impact, failed treatment or specific movement hazards may reopen a wound. Set 30/Combat submit events; 29E decides whether the current wound state reopens.

# 17. Blood Loss, Critical Condition and Restoration

Blood Loss is a 0-100 abstract biological burden where **0 means normal reserve** and **100 means maximum critical loss represented by this system**.

## 17.1 Blood-Loss Bands

| Blood Loss | Band | Standard Biological Effect |
| ---: | --- | --- |
| 0-14 | Normal/trace | no material penalty |
| 15-34 | Mild | small Stamina regeneration and recovery penalty |
| 35-59 | Significant | clear fatigue/exertion burden and reduced recovery |
| 60-79 | Severe | strong stamina/recovery penalties; urgent treatment warning |
| 80-94 | Critical | `CriticalCondition=true`; major function penalty; ongoing Health-loss request may occur |
| 95-100 | Maximum represented | emergency state; death/downed owner evaluates through existing authority |

## 17.2 Health-Loss Handoff

At Critical Blood Loss, 29E may submit periodic biological Health-loss transactions to 29B. It still does not call death directly. If Health reaches zero, the existing Combat/death owner handles the result.

## 17.3 Blood-Loss Restoration

Once active bleeding is controlled, Blood Loss recovers slowly through biological restoration.

Standard reference baseline: **3 Blood-Loss points per simulation hour** under safe conditions, modified by nutrition, sleep, Health state, treatment and biological profile.

Specialist/magical treatment may accelerate restoration through 29G but cannot create free blood/restoration without an authorised treatment capability.

## 17.4 No Instant Potion Reset by Default

A generic Health potion should not simultaneously erase severe Blood Loss unless its explicit biological treatment definition says it restores blood reserve. This preserves distinct injury consequences.

# 18. Pain Architecture and Pain Load

Pain is a 0-100 biological load derived from current physical injuries and selected treatment states.

Pain is not morale, fear, relationship state or psychological trauma. Those belong elsewhere.

## 18.1 Injury Pain Contributions

Reference base pain:

| Severity | Base Pain Contribution |
| --- | ---: |
| Minor | 8 |
| Moderate | 22 |
| Severe | 45 |
| Critical | 70 |

Injury definitions apply a bounded family multiplier. Burns may be high-pain; a stable minor fracture may be lower after immobilisation.

## 18.2 Pain Combination

Pain uses diminishing stacking:

`PainLoad = Highest + 0.45*Second + 0.25*Third + 0.1*Remaining`, capped at 100.

This prevents six minor injuries from mechanically exceeding one catastrophic injury by simple addition.

## 18.3 Pain Bands

| Pain Load | Band | Typical Biological Result |
| ---: | --- | --- |
| 0-14 | Comfortable | no material penalty |
| 15-34 | Noticeable | small exertion/recovery penalty |
| 35-59 | Distracting | moderate stamina-regeneration and function burden |
| 60-79 | Severe | strong biological strain; recovery and precision interfaces affected |
| 80-100 | Overwhelming | maximum configured biological penalties; Critical-care prompt where appropriate |

## 18.4 Analgesia Boundary

29G owns analgesic treatment effects. Pain reduction does not equal injury healing. Strong analgesia may allow better function while increasing re-injury risk if the player ignores the underlying wound; 29E may expose that risk without forcing it.

## 18.5 Accessibility

Pain must never require:

- camera shake;
- screen blur;
- chromatic aberration;
- controller drift;
- forced slow menus;
- input reversal.

Optional effects can be disabled independently of authoritative pain.

# 19. Functional Impairment Model

Functional impairment translates injury location/severity into biological capacity outputs.

29E publishes capacities; consuming systems decide action-specific consequences.

## 19.1 Core Functional Outputs

- `ManualFunction()` - manipulation/grip/upper-limb biological capacity.
- `MobilityFunction()` - lower-body locomotor capacity.
- `HeadFunction()` - head/cognitive/sensory biological capacity.
- `CoreFunction()` - torso/core physiological capacity.
- `CarryPenalty()` - additional physiological carrying burden for 29B/Set 30.
- `StaminaModifier()` - injury-driven stamina cost/regeneration modifier.
- `RecoveryModifier()` - injury/pain/blood-loss influence on 29B recovery.

All function values are normalised 0.0-1.0 where 1.0 is normal biological capability.

## 19.2 Reference Per-Injury Function Penalty

| Severity | Relevant Region Penalty |
| --- | ---: |
| Minor | 0-5% |
| Moderate | 10-20% |
| Severe | 25-45% |
| Critical | 50-75% |

Specific injury definitions select a value inside the band.

## 19.3 Composition

Multiple penalties combine multiplicatively rather than simple addition. Standard mode caps ordinary non-critical combined function reduction so that a character is not completely unable to perform basic interactions from several Moderate injuries.

Critical injuries may expose `requires_assistance` or `cannot_safely_perform_strenuous_action` flags, but the consuming owner decides actual controls and allowed actions.

# 20. Region-Specific Functional Outputs

## 20.1 Arm/Manipulator Injury

29E may reduce `ManualFunction` and increase `CarryPenalty`.

Combat may interpret this as slower/heavier weapon handling, reduced block efficiency or aim stability according to its own rules. Building/crafting systems may interpret it as slower manual work if they choose. Set 29 does not define those formulas.

## 20.2 Leg/Locomotor Injury

29E reduces `MobilityFunction` and may increase Stamina cost.

Set 30 decides changes to walking, sprinting, jumping, climbing, mount interaction and traversal.

## 20.3 Head Injury

29E reduces `HeadFunction`, can raise pain and can expose `consciousness_risk`.

Combat/UI decide target/aim feedback. Social dialogue is not automatically altered unless Set 28 consumes a relevant state.

## 20.4 Torso/Core Injury

Torso trauma usually affects `CoreFunction`, Stamina regeneration, recovery eligibility and Critical Condition risk more than limb-specific manipulation.

# 21. Stabilisation and Immediate Care State

Stabilisation means that the immediate worsening mechanism of an injury has been controlled sufficiently for safe recovery planning.

It does not mean the injury is cured.

## 21.1 Stabilisation Requirements

Depending on injury definition, stabilisation may require one or more of:

- active bleeding reduced to acceptable class;
- fracture/region immobilised;
- dangerous foreign object addressed by specialist rules;
- actor removed from ongoing extreme exposure;
- wound protected from immediate contamination;
- actor in a safe enough state for treatment;
- critical pain or shock-equivalent state reduced below threshold;
- specialist/magical intervention for Critical injuries.

## 21.2 Self-Stabilising Minor Injury

Minor closed injuries can stabilise naturally after a short safe period. Minor open wounds may reduce from Seep to None on their own in Relaxed/Standard when no aggravating factor exists, but bandaging remains useful for faster/safer control.

## 21.3 Severe/Critical Stabilisation

Severe and Critical injuries do not silently become safe while the player continues fighting. Their unstable components require active care, time or an approved ability.

# 22. Worsening, Re-Injury and Complication Handoffs

An injury can worsen when:

- the same region receives new significant trauma;
- an open wound is reopened;
- a fracture is used under high load without support;
- an actor remains in the environmental cause of a burn/frost injury;
- required stabilisation is not achieved;
- 29F reports an infection/complication that explicitly worsens the wound;
- an external treatment fails through an authoritative treatment outcome.

## 22.1 Re-Injury Rule

New trauma first adds to Regional Trauma. If it crosses the next severity threshold and is compatible with an existing injury, the injury upgrades and recovery progress regresses.

Reference regression:

| New Event | Recovery Regression |
| --- | ---: |
| Light re-aggravation | 5% |
| Significant | 15% |
| Heavy | 30% |
| Extreme | may upgrade severity and reset phase to Acute |

## 22.2 No Random Complication Spam

29E itself does not randomly invent infections, blood clots or organ failure. Complications require an owning specialist or explicit injury definition/event.

# 23. Injury Recovery Stages and Eligibility

Recovery progresses only while the injury's current prerequisites are met.

## 23.1 Universal Eligibility Inputs

- no uncontrolled Critical bleeding;
- actor not in active equivalent trauma;
- Health above a minimum stable threshold defined by 29B;
- nutrition/hydration not critically deficient;
- temperature/wetness state compatible with recovery;
- sleep/fatigue state not catastrophically poor;
- required treatment flags satisfied to the current recovery ceiling;
- region not repeatedly subjected to incompatible high load;
- no specialist-reported complication blocking recovery.

## 23.2 Recovery Is Progressive, Not Binary

Injuries have `recovery_progress` from 0-100. Partial recovery can reduce pain and impairment before complete healing.

Reference function restoration is staged:

- 0-24%: acute penalties mostly intact;
- 25-49%: modest improvement;
- 50-74%: substantial improvement;
- 75-99%: residual limitation;
- 100%: healed; functional penalty removed.

## 23.3 Safe Activity

Recovery does not require the player to stand still. Each injury definition can declare:

- unrestricted normal activity;
- avoid strenuous load;
- avoid impact;
- immobilisation required;
- bed/rest strongly recommended;
- specialist-only progression gate.

Basic building, walking around a settlement, inventory work and dialogue should remain possible for most non-critical injuries.

# 24. Recovery Rates, Ceilings and Long-Term Consequences

## 24.1 Standard Reference Recovery Rates

Baseline values assume stabilised injury, safe conditions and adequate general care.

| Severity | Base Recovery per Simulation Hour | Approximate Baseline Time |
| --- | ---: | --- |
| Minor | 20%/h | ~5 h |
| Moderate | 8%/h | ~12.5 h |
| Severe | 2%/h | ~2 days |
| Critical | 0.8%/h | ~5 days |

These are game-balance references, not real medical timelines.

## 24.2 Treatment Quality Multipliers

Approved treatment context may apply:

- basic self-care: x1.0;
- trained first aid: x1.15;
- clinic/healer care: x1.35;
- hospital/specialist care: x1.6;
- powerful authorised magic: definition-driven, normally x1.5-x3.0 or direct progress transaction with caps.

Set 29 never assumes a price or item consumption from these multipliers.

## 24.3 Recovery Ceilings

An injury can have required-care ceilings. Examples:

- Moderate fracture cannot exceed 35% until immobilised.
- Severe open wound cannot exceed 50% while not properly closed/dressed.
- Critical injury may not enter Recovering until specialist/magical stabilisation.

## 24.4 Long-Term/Chronic State

A Severe/Critical injury can become Chronic if:

- repeatedly re-injured;
- left untreated past a long configurable period;
- resolved by an authored story/event outcome;
- Harsh/Custom enables persistent consequences.

In Standard, Chronic usually means **longer specialist recovery**, not irreversible disability.

## 24.5 Scars

Healed open wounds may create cosmetic/history scar records. Scars have no automatic negative stats. Any social/cosmetic use belongs to the appropriate presentation/social systems.

# 25. Health, Stamina, Fatigue and Sleep Integration

29E publishes an `InjuryModifierBundle` consumed by 29B and 29D.

Possible outputs:

- natural Health-recovery multiplier;
- maximum natural-recovery ceiling while untreated;
- Stamina regeneration multiplier;
- strenuous Stamina-cost multiplier;
- Fatigue accrual multiplier;
- sleep-quality penalty due to pain;
- `CriticalCondition`;
- blood-loss burden;
- pain burden.

## 25.1 Health Recovery Does Not Cure Injury

29B may restore Health while an injury remains. Conversely, treating an injury does not automatically restore missing Health unless the treatment explicitly includes a Health-healing effect through 29G.

## 25.2 Sleep

Sleep can improve recovery because 29D supplies restorative rest quality. Sleeping cannot erase an untreated fracture or uncontrolled bleeding simply because time passed.

# 26. Combat and Equipment Integration

Combat supplies authoritative trauma inputs and consumes injury outputs.

## 26.1 Combat Supplies

- resolved damage transaction/event reference;
- external hit location;
- impact class;
- damage/trauma tags;
- open-wound compatibility;
- source/action IDs;
- whether active danger persists.

## 26.2 29E Supplies to Combat

- Manual Function;
- Head Function;
- Core Function;
- Pain Load/band;
- Blood Loss band;
- active bleeding warning;
- relevant injury tags;
- Critical Condition;
- incapacitation/requires-assistance flags where applicable.

Combat decides how those affect attack handling, blocking, aim, stability and action selection.

## 26.3 Armour Boundary

29E does not inspect armour values to reduce trauma. Armour/Combat resolves the protected outcome first. Equipment can separately provide post-impact biological traits such as `splinting_support` or `burn_protection_aftercare` only if explicitly authored and approved.

# 27. Movement, Carrying and Rescue Integration

Set 30 remains locomotion owner.

29E exposes:

- Mobility Function;
- Carry Penalty;
- region load restrictions;
- `requires_assistance`;
- `safe_for_mounting` biological flag if a Critical injury creates a medical restriction;
- `transport_care_requirement` for carried/stretchered actors.

Set 30 decides actual walking speed, limping animation, climb eligibility, mounting, drag/carry mechanics, stretcher handling and vehicle seating.

## 27.1 Injured-Actor Transport

When Set 30 moves an injured actor, it may report transport stress. 29E can translate that into re-injury risk. Smooth wagon/bed transport and rough dragging can therefore differ without Set 29 defining vehicle physics.

# 28. Disease, Contamination and Poison Boundaries

29F owns disease, infection and poison.

29E may expose from an open wound:

- wound cleanliness state;
- contamination exposure magnitude;
- wound age;
- wound family;
- treatment/cleaning flags;
- current recovery state.

29F decides whether infection occurs and what disease state results.

If 29F later reports wound infection, 29E may:

- reduce recovery rate;
- lower recovery ceiling;
- raise pain;
- reopen/worsen the injury only through an explicit complication interface.

Poison delivered through a puncture is entirely separate from the puncture's bleeding and pain.

# 29. Medicine, First Aid, Magic and 29G Handoff

29G will own the treatment-action layer. 29E defines what treatment outcomes are biologically valid.

## 29.1 Treatment Outcome Types Expected From 29G

- control bleeding;
- clean/protect wound;
- immobilise region;
- reduce pain;
- close wound;
- increase recovery ceiling;
- add recovery progress;
- stabilise Critical injury;
- restore Blood Loss reserve;
- reduce scar/chronic risk;
- specialist review flag;
- magical tissue restoration.

## 29.2 Transaction Rule

A treatment must be one authoritative transaction linking:

1. actor/treatment source;
2. item/mana/resource consumption if applicable;
3. valid target injury;
4. treatment capability;
5. biological result;
6. failure/refund policy;
7. event/history record.

This prevents using one bandage twice, healing an injury that disappeared, or consuming medicine without applying an effect.

## 29.3 Magic Does Not Bypass Ownership

A healing spell may be extremely powerful, but it still calls an authorised treatment capability. The Magic system owns mana, spell unlocks and casting. 29E/29G own whether the requested biological treatment is valid and what injury state changes.

# 30. NPCs, Companions and Workforce Injury

Named NPCs use the same injury-state rules where relevant, with profile and simulation-LOD differences.

## 30.1 Named NPCs

Persistent NPC injury records can affect:

- biological work capacity;
- guard availability;
- recovery downtime;
- need for treatment/medicine;
- evacuation/rescue requirement;
- quest/event hooks;
- visible bandages/splints if Presentation supports them.

29E does not decide NPC dialogue, morale, family response or wages.

## 30.2 Companion Care

Set 28 may query:

- injury severity;
- care urgency;
- can-travel state;
- recovery status;
- treatment need.

Set 28 decides whether a companion offers help, refuses travel, comments, becomes worried or changes loyalty.

## 30.3 Workforce Capacity

29E exposes a biological `WorkCapacityModifier()` based on injury severity/function. Set 27/settlement simulation decides economic output and wages.

Reference Standard modifiers:

| Worst Active Injury | Approx. General Work Capacity Before Job-Specific Interpretation |
| --- | ---: |
| Minor | 90-100% |
| Moderate | 70-90% |
| Severe | 35-70% |
| Critical | 0-35% |

Job owners may care about region. A leg injury affects a runner differently from a seated scribe, but 29E does not own job logic.

# 31. Settlement Healthcare, Triage and Population Injury

Settlements may contain clinics, hospitals, healers, beds, sanitation and medicine stock through Documents 20/07 and other owners.

29E consumes healthcare-service outputs such as:

- available treatment slots;
- care quality tier;
- specialist capability tags;
- safe bed/rest quality;
- medicine availability confirmation;
- sanitation/clean-treatment context.

## 31.1 Triage Priority

29E may publish a biological Triage Priority:

| Priority | Meaning |
| --- | --- |
| Routine | Minor stable injury; can wait. |
| Priority | Moderate injury or meaningful pain/bleeding. |
| Urgent | Severe injury, Heavy bleeding or major function loss. |
| Emergency | Critical injury, Critical bleed/Blood Loss or Critical Condition. |

The settlement service owner decides queue policy and ethics. 29E provides biological urgency only.

## 31.2 Population Injury Cohorts

Distant settlements use summary cohorts such as:

- minor_injured_count;
- moderate_injured_count;
- severe_injured_count;
- critical_injured_count;
- treatment_slots_available;
- medicine_demand_units;
- average_recovery_hours;
- workforce_capacity_modifier.

Cohort simulation must conserve casualties and recovery. It may not magically heal everyone when a clinic exists without staff/resources.

# 32. Difficulty Profiles and Custom Settings

| Rule | Peaceful | Relaxed | Standard | Harsh |
| --- | --- | --- | --- | --- |
| Injury generation from routine combat | strongly reduced / severe off by default | reduced | full | increased |
| Regional Trauma thresholds | +35% | +15% | baseline | -15% |
| Bleeding rates | x0.35 | x0.7 | x1.0 | x1.3 |
| Blood-Loss penalties | light | reduced | baseline | stronger |
| Pain penalties | mostly informational | reduced | baseline | stronger |
| Recovery rate | x2.0 | x1.35 | x1.0 | x0.75 |
| Re-injury regression | low | reduced | baseline | stronger |
| Chronic risk | off | off by default | very rare/treatable | enabled/configurable |
| Permanent disability | off | off | off | off by default; Custom opt-in only |
| Minor self-stabilisation | generous | generous | normal | limited |

## 32.1 Peaceful Is Not No Biology

Peaceful can still show cosmetic bruises, minor injury history, care interactions and positive healthcare gameplay. It simply avoids harsh impairment and catastrophic routine injury.

## 32.2 Custom Controls

World settings may separately control:

- persistent injury frequency;
- trauma threshold multiplier;
- bleeding severity;
- pain mechanical effects;
- recovery speed;
- fracture/dislocation frequency;
- head-trauma severity;
- chronic injury risk;
- permanent impairment (default off);
- NPC injury consequence;
- visible wound/gore presentation independently of mechanics.

# 33. Simulation LOD, Persistence and Offline Rules

## 33.1 Active Actors

Near active actors use detailed regional trauma, injury, bleeding, pain and recovery state.

## 33.2 Medium-Distance Named Actors

Bleeding and recovery update on bounded scheduled intervals. Presentation actors may unload while injury records persist.

## 33.3 Distant Named Actors

The system stores persistent injury records but advances them using coarse deterministic intervals. Critical unstable injuries require an event/settlement-resolution pathway; distant simulation may not silently kill a named NPC merely because the player crossed a chunk boundary unless the wider consequence system has explicitly authorised that outcome.

## 33.4 Routine Population Cohorts

Routine unnamed populations use aggregated severity cohorts and treatment capacity.

## 33.5 Save Fields

Persistent save state includes:

- active injury records;
- regional trauma where still relevant;
- Blood Loss;
- pain treatment state where persistent;
- recovery progress/ceilings;
- stabilisation/treatment flags;
- last update world time;
- source/history IDs required for consequence;
- chronic/scar history where applicable.

## 33.6 Offline Player Safety

Real-world time while the application is closed does not:

- worsen bleeding;
- advance Blood Loss toward death;
- create new injuries;
- complete high-risk treatment;
- regress injury due to imagined activity.

Only authoritative simulation time advances the state.

# 34. Multiplayer Authority and Transaction Safety

The authoritative host/server owns:

- trauma application;
- injury creation/upgrading;
- bleed and Blood Loss state;
- treatment transactions;
- recovery advancement;
- re-injury;
- published function modifiers.

Clients may predict presentation but cannot decide that a wound did not occur or that a bandage succeeded.

## 34.1 Transaction IDs

Every trauma and treatment event should carry an idempotent transaction/event ID. Duplicate network delivery must not apply the same injury, bleed or treatment twice.

## 34.2 Split-Screen

Each local player receives only their own detailed injury HUD unless party/medical permissions expose another actor's status. One player's pain effects cannot alter another local player's camera.

## 34.3 PvP

PvP world settings may independently scale persistent-injury frequency. Competitive modes should avoid a snowball where the first Moderate injury makes subsequent combat unwinnable unless that is explicitly the chosen server rule.

# 35. UI, Feedback and Accessibility

29E follows Document 17's world-first, progressive-disclosure philosophy.

## 35.1 Normal HUD

The normal HUD should not permanently display six body-region bars, a Blood Loss bar and a Pain bar.

Instead:

- brief injury icon/region indicator appears on injury;
- active Heavy/Critical bleeding receives a persistent urgent warning;
- severe impairment may add a concise status chip;
- exact region/severity/treatment needs appear in the Health/Status inspection screen;
- blood-loss and pain exact numbers are optional information-density settings.

## 35.2 Injury Panel

An injury detail should show:

- plain-language name;
- region;
- severity;
- stable/unstable state;
- bleeding status;
- known treatment needs;
- current recovery progress/band;
- relevant function impacts;
- why recovery is blocked;
- source/history when useful;
- knowledge confidence if diagnosis is incomplete.

## 35.3 World Presentation

Optional presentation may include:

- bandage/splint attachments;
- guarded limb animation;
- reduced idle comfort;
- blood decal/trail within content settings;
- NPC limping or protected posture through animation owners.

These visuals reflect state; they do not own it.

## 35.4 Accessibility

Support:

- no mandatory gore;
- no mandatory blood colour dependence;
- text/icon warnings for bleeding;
- reduced motion/pain presentation;
- disable camera shake/blur independently;
- simplified injury readouts;
- larger injury icons/text;
- optional exact numbers;
- audio captions for pain/bleed cues;
- controller-safe treatment navigation;
- reduced injury mechanical severity through world settings.

# 36. Registry Definitions and Runtime Records

## 36.1 `InjuryDefinition`

Recommended fields:

- `id`;
- `display_name_key`;
- `family`;
- `compatible_trauma_tags`;
- `compatible_region_tags`;
- `min_severity` / `max_severity`;
- `open_wound_capable`;
- `default_bleed_class_by_severity`;
- `pain_multiplier`;
- `function_penalty_profile`;
- `stabilisation_requirements`;
- `recovery_rate_multiplier`;
- `recovery_ceiling_requirements`;
- `reinjury_sensitivity`;
- `contamination_exposure_profile`;
- `treatment_capability_tags`;
- `chronic_eligible`;
- `scar_eligible`;
- `difficulty_tags`;
- `ui_icon_key`;
- `localisation_keys`;
- `planning_status`.

## 36.2 `BiologicalRegionProfile`

Fields:

- `id`;
- `region_id`;
- `semantic_tags`;
- `parent_region`;
- `paired_region_id`;
- `bleeding_multiplier`;
- `pain_multiplier`;
- `function_channels`;
- `criticality_weight`;
- `injury_family_allowlist/denylist`;
- `presentation_socket` where external visuals need one;
- `migration_aliases`.

## 36.3 `InjuryRuntimeState`

Fields:

- runtime injury ULID;
- definition ID;
- region ID;
- severity;
- phase;
- regional trauma at creation;
- open-wound state;
- bleed class;
- current pain contribution;
- recovery progress;
- recovery ceiling;
- treatment flags;
- contamination state interface;
- last trauma time;
- last treatment time;
- last recovery update;
- source event ID;
- history flags.

## 36.4 `ActorPhysicalInjuryState`

Fields:

- actor ID;
- active injury IDs;
- regional trauma map;
- Blood Loss;
- Pain Load cache;
- function modifier bundle;
- Critical Condition;
- care urgency;
- last update world time;
- revision/version.

# 37. Balance, Anti-Grind and Anti-Exploit Rules

## 37.1 No Every-Hit Injury Spam

Most ordinary combat hits should not create persistent wounds. Trauma thresholds and decay protect the player from condition-list spam.

## 37.2 No Injury-Lottery Catastrophe

Hidden random rolls cannot turn a trivial event into a Critical injury in Standard.

## 37.3 No Full-Heal Injury Erasure

Restoring Health to maximum does not delete physical injury records.

## 37.4 No Medicine Duplication

Treatment is an atomic transaction with inventory/resource owners.

## 37.5 No Bandage = Instant Heal

Bleed control stabilises; it does not restore full Health or complete injury recovery.

## 37.6 No Permanent-Character Ruin by Default

Permanent impairment is off by default. Standard severe injuries remain treatable and recoverable.

## 37.7 No Limbo Lock

If an injury requires a specialist that becomes impossible to access because the relevant settlement is destroyed, fallback treatment routes, migration or world-generation access must exist for non-story-critical standard injuries.

## 37.8 No Pain-Control Theft

Pain cannot randomly cancel player inputs or force camera movement in the authoritative rules.

## 37.9 No Movement Ownership Leakage

29E never hardcodes walk speed, jump height, climb lock or sprint multiplier. It exports biological capacity.

## 37.10 No Combat Ownership Leakage

29E never recalculates armour, damage, crits, penetration or hit detection.

## 37.11 No Offline Bleed-Out

Closing the game cannot silently kill the player through wall-clock bleeding.

## 37.12 No Population Magic Healing

A settlement with one clinic cannot instantly remove all distant injuries. Capacity, staff, medicine and time remain bounded.

# 38. Validation, Test Cases and Acceptance Criteria

## 38.1 Data Validation

Validators should reject:

- duplicate injury IDs;
- missing compatible region/family data;
- Critical injuries with no stabilisation path unless explicitly authored as exceptional;
- injury definitions that directly modify movement speed instead of exposing function;
- injury definitions that set prices/dialogue/reputation;
- open wounds lacking bleed/contamination policy;
- fractures with impossible recovery ceilings;
- treatment tags with no registered provider/capability;
- permanent impairment enabled in Standard without explicit approved exception;
- morphology profiles with no `core` or equivalent survival region where required;
- cyclic treatment dependencies;
- save records referring to removed IDs without migration aliases.

## 38.2 Required Gameplay Tests

1. Ten low-impact hits across several minutes do not create a wound after trauma decay.
2. Repeated Significant hits to one arm cross the Minor then Moderate threshold deterministically.
3. A Heavy laceration creates expected bleeding and Blood Loss.
4. Bandage treatment reduces bleeding without restoring injury recovery to 100%.
5. A Moderate fracture stops at its unimmobilised recovery ceiling.
6. Applying a valid splint raises the fracture ceiling and allows recovery.
7. Full Health does not remove the fracture.
8. A Severe leg injury reduces Mobility Function but does not directly edit Set 30 speed.
9. Set 30 consumes Mobility Function and produces its own movement result.
10. A Severe arm injury exports Manual Function for Combat without 29E editing attack definitions.
11. Pain reaches the correct band with multiple injuries using diminishing stacking.
12. Accessibility settings remove blur/shake while pain mechanics remain authoritative.
13. Extreme cold handoff creates frost injury only after 29D threshold/event.
14. A puncture plus poison creates one physical injury and one 29F poison state rather than one merged status.
15. Open-wound contamination generates an exposure payload but 29E does not invent infection.
16. Named NPC injury persists through unload/reload.
17. Distant cohort injury consumes healthcare capacity without creating free medicine.
18. Duplicate network trauma event ID applies only once.
19. Duplicate treatment request consumes/applies only once.
20. Closing the game during Heavy bleeding and reopening does not advance wall-clock Blood Loss.
21. Peaceful routine combat rarely/never creates Severe injury under default settings.
22. Harsh lowers trauma thresholds and increases bleed/recovery consequence without changing data ownership.
23. A destroyed clinic does not delete injuries; it removes care capacity supplied by the building owner.
24. A powerful healing spell uses the treatment interface and does not directly mutate injury data from the Magic system.
25. Legacy POC persistent injuries migrate to valid 29E records without losing named-NPC history.

## 38.3 29E Acceptance Criteria

29E is acceptable when:

- physical injury truth has one clear Set 29 owner;
- Combat, Movement, Social and Economy ownership remain intact;
- injury generation is deterministic/readable enough for player trust;
- Health and injury remain separate;
- bleeding and Blood Loss have bounded, testable rules;
- pain is meaningful without inaccessible audiovisual punishment;
- region impairment uses interfaces rather than action-specific hardcoding;
- Standard injury recovery is consequential but not character-ruining;
- distant NPC/population injury can be simulated without per-tick full biology;
- treatment handoff to 29G is complete;
- cross-set amendments are recorded for final reconciliation.

# 39. Cross-Set Interface Amendments

The following additions do not transfer ownership. They formalise data required by existing owners.

## AM-29-025 Refinement - Thermal Injury Exposure Handoff

**Owner:** 29D environmental biology -> 29E injury biology.

29D should submit:

- actor ID;
- affected region(s) or exposure distribution;
- `thermal_injury_type = burn|frost`;
- exposure severity/impact class;
- event ID/time;
- whether the actor remains in the causal exposure.

29E creates/updates the injury. 29D continues to own current thermal load and exposure.

## AM-29-029 - Resolved Biological Trauma Interface

**External impact owners -> 29E**

Proposed payload:

- `event_id`;
- `actor_id`;
- `resolved_health_transaction_id`;
- `external_hit_location`;
- `impact_class`;
- `trauma_tags[]`;
- `open_wound_tags[]`;
- `injury_generation_allowed`;
- optional `authored_min_severity`;
- timestamp.

Combat/physics owners remain responsible for their own calculations.

## AM-29-030 - Biological Region Mapping Interface

**Entity/Creature/Combat definitions -> 29E**

Requires a stable mapping from external hit zones/sockets to semantic `BiologicalRegionProfile` regions. This lets humanoids, quadrupeds, winged creatures and other bodies use the same injury framework without Combat owning biology.

## AM-29-031 - Mobility Function Interface

**29E -> Set 30**

Expose:

- `MobilityFunction()`;
- `lower_region_load_restrictions`;
- `requires_assistance`;
- `transport_care_requirement`;
- injury-derived `CarryPenalty()` refinement.

Set 30 decides actual locomotion/traversal.

## AM-29-032 - Manual and Head Function Interface

**29E -> Combat/interaction owners**

Expose:

- `ManualFunction()`;
- `HeadFunction()`;
- `CoreFunction()`;
- Pain band;
- relevant injury tags.

Consuming systems decide aim, handling, block, crafting or interaction consequences.

## AM-29-033 - Injury Treatment Outcome Interface

**29G -> 29E**

Treatment outcomes request explicit biological mutations such as bleed control, immobilisation, pain reduction, recovery-ceiling change, progress addition or stabilisation. 29G owns treatment actions/medicine; 29E validates and stores injury state.

## AM-29-034 - Wound Contamination Exposure Interface

**29E -> 29F**

Expose:

- wound ID/family;
- region;
- open/closed state;
- contamination magnitude/source tags;
- cleaning/dressing state;
- wound age;
- actor resistance profile reference.

29F decides infection/disease.

## AM-29-035 - Injury Complication Feedback Interface

**29F -> 29E**

29F may report a validated complication modifier such as:

- recovery-rate reduction;
- recovery-ceiling reduction;
- pain modifier;
- wound reopening/worsening request.

29F does not directly edit injury records.

## AM-29-036 - Social Care and Travel Readiness Interface

**29E -> Set 28**

Expose:

- `CareNeed()`;
- `TreatmentUrgency()`;
- `RecoveryStatus()`;
- `CanTravelBiologically()`;
- `RequiresAssistance()`.

Set 28 decides companion/doctor social behaviour.

## AM-29-037 - Workforce Injury Downtime Refinement

**29E -> Set 27 / settlement simulation**

Expose:

- `WorkCapacityModifier()`;
- `ExpectedInjuryDowntime()`;
- treatment demand class;
- affected functional channels.

Set 27 decides wage/cost/economic effects.

## AM-29-038 - Injured Actor Transport Stress Interface

**Set 30 -> 29E**

Set 30 may report a bounded `transport_stress_class` from carrying, dragging, wagon travel, mount travel or similar movement. 29E uses it only for re-injury/recovery; Set 30 owns the transport mechanic.

## AM-29-039 - Combat Death/Downed Biological Critical Handoff

**29E/29B -> existing death/downed owner**

Expose:

- `CriticalCondition()`;
- Blood Loss band;
- consciousness-risk flag;
- stabilised state;
- recovery possible flag.

The existing owner remains responsible for downed, death, revival and respawn.

## Amendment Status Table

| Amendment | Status | Ownership Transfer? | Final Reconciliation Target |
| --- | --- | --- | --- |
| AM-29-025 Refinement | Required | No | 29D/29E/29J |
| AM-29-029 | Proposed/required | No | Document 16 / physics owners / 29J |
| AM-29-030 | Proposed/required | No | Entity/Creature/Combat/Set 25 schema pass |
| AM-29-031 | Proposed/required | No | Set 30 / 29J |
| AM-29-032 | Proposed/required | No | Document 16 and interaction owners |
| AM-29-033 | Internal Set 29 required | No | 29G/29J |
| AM-29-034 | Internal Set 29 required | No | 29F/29J |
| AM-29-035 | Internal Set 29 required | No | 29F/29J |
| AM-29-036 | Proposed/required | No | Set 28 final integration |
| AM-29-037 | Proposed/required | No | Set 27 / settlements final integration |
| AM-29-038 | Proposed/required | No | Set 30 final integration |
| AM-29-039 | Proposed/required | No | Document 16/death architecture integration |

# Appendix A. Reference Balance Tables

## A.1 Trauma and Severity

| Parameter | Standard Reference |
| --- | --- |
| Regional Trauma range | 0-100 |
| Calm decay delay | 30 seconds |
| Trauma decay | 4/min |
| Minor threshold | 20 |
| Moderate threshold | 45 |
| Severe threshold | 70 |
| Critical threshold | 90 |
| Region active detailed-injury soft cap | 2 |
| Actor active detailed-injury soft cap | 6 |

## A.2 Bleeding and Blood Loss

| Parameter | Standard Reference |
| --- | --- |
| Seep | +0.2 Blood Loss/min |
| Light | +0.7/min |
| Heavy | +2.0/min |
| Critical | +4.5/min |
| Severe Blood Loss band | 60-79 |
| Critical Condition band | 80+ |
| Natural restoration after control | 3/hour |

## A.3 Recovery

| Severity | Recovery Rate | Typical Baseline |
| --- | ---: | --- |
| Minor | 20%/h | ~5 h |
| Moderate | 8%/h | ~12.5 h |
| Severe | 2%/h | ~50 h |
| Critical | 0.8%/h | ~125 h |

# Appendix B. Provisional 29E API Contract

## B.1 Core Queries

- `InjuryState(actor_id)`
- `InjuriesForRegion(actor_id, region_id)`
- `WorstInjurySeverity(actor_id)`
- `BleedingState(actor_id)`
- `BloodLoss(actor_id)`
- `PainLoad(actor_id)`
- `ManualFunction(actor_id)`
- `MobilityFunction(actor_id)`
- `HeadFunction(actor_id)`
- `CoreFunction(actor_id)`
- `CriticalCondition(actor_id)`
- `CareNeed(actor_id)`
- `TreatmentUrgency(actor_id)`
- `RecoveryStatus(actor_id)`
- `WorkCapacityModifier(actor_id)`
- `ExpectedInjuryDowntime(actor_id)`

## B.2 Commands / Transactions

- `ApplyResolvedBiologicalTrauma(payload)`
- `ApplyTreatmentOutcome(payload)`
- `ApplyTransportStress(payload)`
- `ApplyInjuryComplication(payload)`
- `AdvanceInjuryRecovery(actor_id, elapsed_sim_time, context)`
- `MigrateLegacyInjury(payload)`

## B.3 Events

- `InjuryCreated`
- `InjurySeverityChanged`
- `InjuryStabilised`
- `InjuryReopened`
- `BleedingChanged`
- `BloodLossBandChanged`
- `PainBandChanged`
- `FunctionBandChanged`
- `CriticalConditionChanged`
- `InjuryRecoveryBlocked`
- `InjuryRecovered`
- `ChronicStateEntered`

# Appendix C. Initial Injury Definition Set

| ID | Family | Core Role |
| --- | --- | --- |
| `injury.wound.laceration` | Laceration | general open cut/tear |
| `injury.wound.puncture` | Puncture | penetrating trauma |
| `injury.trauma.contusion` | Contusion | blunt bruising/impact |
| `injury.trauma.sprain` | Sprain/Strain | joint/soft-tissue functional injury |
| `injury.trauma.fracture` | Fracture | broken structural tissue/bone analogue |
| `injury.trauma.dislocation` | Dislocation | displaced joint/limb connection |
| `injury.trauma.crush` | Crush Trauma | heavy compression/internal trauma |
| `injury.trauma.head` | Head Trauma | abstract persistent head injury |
| `injury.thermal.burn` | Burn | persistent heat/fire tissue injury |
| `injury.thermal.frost` | Frost Injury | persistent cold tissue injury |

These are parent definitions. Culture, creature, dimension and magic content should extend them through approved variants/tags rather than cloning duplicate mechanics unnecessarily.

# Appendix D. Runtime Record Templates

## D.1 Example Moderate Arm Laceration

```yaml
injury_runtime_id: injury_instance:01K...
actor_id: npc:riverward.guard_0042
injury_definition_id: injury.wound.laceration
biological_region_id: region.right_arm
severity: moderate
phase: stabilised
wound_open_state: dressed
bleed_class: seep
pain_contribution: 20
recovery_progress: 18
recovery_ceiling: 100
treatment_flags:
  - bleed_controlled
  - dressed
last_trauma_world_time: 184233.2
source_event_id: combat_event:01K...
```

## D.2 Example Actor Physical Injury State

```yaml
actor_id: player:local_1
regional_trauma:
  head: 0
  torso: 12
  left_arm: 0
  right_arm: 18
  left_leg: 6
  right_leg: 0
active_injuries:
  - injury_instance:01K...
blood_loss: 22
pain_load: 27
manual_function: 0.84
mobility_function: 1.0
head_function: 1.0
core_function: 0.97
critical_condition: false
revision: 14
```

# Appendix E. Worked Gameplay Examples

## E.1 Forest Raid - Cut Arm

A goblin sword attack is resolved by Combat after armour. Combat sends a Significant slash impact to the player's right-arm hit zone. 29E maps the hit zone to `region.right_arm`, adds Regional Trauma and crosses the Minor threshold. A Minor laceration is created with Light bleeding.

The player uses a bandage. Items/29G consume one bandage and submit a valid treatment outcome. 29E changes Light bleeding to Seep and marks the wound dressed. Health remains whatever 29B says; the bandage does not magically restore the attack's Health loss unless the treatment definition also contains an authorised heal-over-time component.

## E.2 Repeated Hammer Hits - Fractured Leg

Two Heavy blunt impacts strike the same leg during a boss fight. Regional Trauma crosses Severe. 29E selects a Severe fracture-compatible injury. Mobility Function drops substantially and the injury has an immobilisation recovery gate.

Set 30 receives Mobility Function and decides how the player's locomotion changes. 29E does not set the speed. The player can still retreat with help rather than receiving an automatic "cannot move" lock from the injury system.

At camp, a splint treatment through 29G raises the recovery ceiling. The player sleeps eight good-quality hours through 29D; the injury gains recovery progress but is not fully healed overnight.

## E.3 Cave-In - Critical Crush Trauma

World hazard resolution reports an Extreme crush event to the torso. 29E creates Critical crush trauma and `CriticalCondition=true`. The injury itself does not kill the player. Health and downed/death authority remain with 29B/Combat.

Nearby companions can query `TreatmentUrgency=Emergency` through Set 28. A rescue interaction may transport the player through Set 30. A settlement hospital can provide care if its external service contract is actually active.

## E.4 Frost Injury After Mountain Expedition

29D tracks Thermal Load while the player crosses a severe cold region. After prolonged unprotected exposure, 29D submits a Severe frost-injury handoff for exposed regions. 29E creates the injury. Returning to a warm inn stops further cold exposure, but the frost injury remains and must recover under 29E/29G rules.

## E.5 Puncture Plus Poison

A venomous creature bite resolves as a Moderate puncture plus a toxin payload. 29E owns the puncture and bleeding. 29F owns the venom. Antidote treatment can resolve poison without closing the puncture, while wound treatment can close the puncture without neutralising venom. This preserves clean system ownership.

## E.6 Injured Settlement Workforce

After a raid, 12 routine residents are injured. Nearby named guards retain individual records. The unloaded settlement stores injury cohorts: seven Minor, three Moderate, two Severe. The clinic has only one active treatment slot and limited medicine stock.

29E advances cohort recovery using real care capacity supplied by the settlement system. Set 27 consumes `WorkCapacityModifier` and medical demand to affect production/economy. No system invents free medicine or wages inside 29E.

# Appendix F. Migration and Supersession Notes

1. Document 16's broad status/injury examples remain valid design intent where they do not conflict with Set 29 ownership.
2. Persistent injury truth moves to Set 29; Combat retains damage, downed/death and action authority.
3. Existing POC generic injury records should migrate to the nearest parent injury definition and preserve source/history.
4. Legacy `bleeding` combat status should migrate to wound bleed state when tied to a physical wound; purely temporary scripted bleed can remain a compatibility wrapper that resolves into 29E.
5. Legacy fracture status becomes `injury.trauma.fracture` with mapped region/severity.
6. Legacy burn/frost statuses become persistent injury records only after the configured injury threshold; current exposure remains 29D.
7. Poisoned/diseased statuses migrate to 29F, not 29E.
8. Exhausted status is superseded by 29B Fatigue/Exertion.
9. Trauma/morale wound concepts belong to Set 28/social systems unless there is a separate physical injury.
10. Unreal-specific technical class names from old Document 18 are not authoritative implementation requirements; current Godot/Summer architecture and Set 25 schema governance control implementation.

# Appendix G. Terminology Register

| Term | Definition |
| --- | --- |
| Biological Region | Semantic body area used for injury location and function. |
| Regional Trauma | Short-lived internal 0-100 accumulation used to determine persistent injury deterministically. |
| Injury | Persistent physical biological condition record. |
| Wound | Injury involving damaged/open tissue; often but not always capable of bleeding. |
| Severity | Minor, Moderate, Severe or Critical seriousness classification. |
| Phase | Acute, Stabilised, Recovering, Healed or Chronic lifecycle state. |
| Bleed Class | None, Seep, Light, Heavy or Critical active bleeding intensity. |
| Blood Loss | Abstract 0-100 biological reserve burden caused by bleeding. |
| Pain Load | Abstract 0-100 biological pain burden derived primarily from injuries. |
| Functional Impairment | Reduction in semantic biological capability exposed to other systems. |
| Stabilisation | Control of immediate worsening sufficient to begin safe recovery planning. |
| Recovery Ceiling | Maximum injury recovery progress allowed until a prerequisite is satisfied. |
| Re-Injury | New trauma that regresses or worsens an existing injury. |
| Chronic | Long-term injury state requiring extended/specialist resolution; not automatically permanent. |
| Critical Condition | Biological emergency flag consumed by existing death/downed, treatment and UI owners. |
| Treatment Outcome | Authorised result from 29G/medicine/magic that requests a specific biological state change. |
