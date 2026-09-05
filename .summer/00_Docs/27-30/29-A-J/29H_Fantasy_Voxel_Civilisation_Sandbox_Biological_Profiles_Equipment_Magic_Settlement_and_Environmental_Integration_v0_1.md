# FANTASY VOXEL CIVILISATION SANDBOX

## DOCUMENT SET 29

# 29H - Biological Profiles, Equipment, Magic, Settlement and Environmental Integration

*Version 0.1 - Detailed Design Bible, Compatibility Architecture and Cross-System Integration Contract Draft*

A registry-driven compatibility layer defining how Leyforge's universal survival and biological rules adapt to different body plans and physiological profiles, consume equipment and magical protection, interact with settlement services, and respond to biome, realm and environmental context without stealing ownership from the systems that create those inputs.

**Project Lead and Final Authority: Ash**

> **Biological Integration Statement**
>
> Leyforge should support many kinds of people and creatures without pretending that every body is biologically identical, and without turning ancestry into a class, morality, profession or universal power ranking. A Biological Profile describes only the physiological facts needed by Set 29. Equipment, magic, settlements and environments then provide explicit capabilities or exposures that Set 29 interprets through the correct specialist owner. The result must remain readable, fair, moddable, save-safe and compatible with mixed settlements, unusual body plans, magical adaptation and future playable peoples.

| Field | Locked Direction |
| --- | --- |
| Document | 29H in Document Set 29 - Survival, Health & Biological Systems. |
| Governing Contract | Leyforge Document Sets 27-30 Cross-Set Interface Register v1.0. One owner per gameplay system; Set 29 consumes external interfaces rather than redefining economy, social behaviour or locomotion. |
| Core Role | Defines Biological Profile composition and the integration contracts that feed 29B-29G from actor identity, equipment, magic, settlements and environment. |
| Biological Authority | Set 29 owns biological interpretation only. Ancestry/entity content owns identity; Items/Combat owns equipment; Magic owns spell/enchantment activation; Settlements own services/buildings; Worldgen/Dimensions/Set 26 own external environment. |
| Culture Boundary | Culture, faction, religion, profession, morality and social identity are never inferred from biology. |
| Playable Fairness | Playable biological differences create contextual identity and adaptation, never a permanently best ancestry for all content. Every material weakness should normally have gear, magic, infrastructure, knowledge, cooperation or world-setting mitigation. |
| Body-Plan Direction | Set 29 queries semantic regions and capability tags rather than assuming every actor has a human body. |
| Equipment Direction | Set 29 consumes resolved biological protection/coverage traits; it does not decide equip eligibility, armour defence, durability, item value or movement handling. |
| Magic Direction | Validated magical effects may protect, treat or temporarily adapt biology through explicit capability bundles. Magic cannot bypass 29E/29F/29G condition ownership merely because a spell says "heal" or "cleanse". |
| Settlement Direction | Settlements expose real food, water, shelter, sanitation, treatment, recovery and environmental-support capability. Decorative buildings never create biological benefit by appearance alone. |
| Environment Direction | Set 29 consumes authoritative exposure snapshots. It never creates duplicate weather, ocean, realm or hazard simulation. |
| Non-Biological Actors | Actors that do not use biological survival channels opt out explicitly and hand maintenance/repair needs to their owning system. They do not bleed, starve or catch disease merely because they use a humanoid rig. |
| Data Direction | Registry-driven profiles, semantic tags, explicit overlays, source references, bounded modifiers, reason codes, validation and final schema reconciliation in 29J. |
| Engine Direction | Godot with Summer Engine; authoritative services, deterministic composition where practical, stable IDs, migration-safe records and bounded runtime aggregation. |

# Document Purpose

Document 29H is the integration bridge between the biological mechanics defined by Documents 29B-29G and the rest of Leyforge. Earlier Set 29 documents deliberately define universal rules first: Health and Stamina do not care whether an actor is a Tidekin or a Rootborn; a disease instance does not invent the creature that transmitted it; a temperature system does not create the coat being worn; and a treatment transaction does not create the clinic in which it occurs. 29H tells those systems how to consume identity-safe, explicitly authored capability data from external owners.

The document has five major responsibilities. First, it turns the high-level Biological Profile concept from 29A into a bounded compositional contract. Second, it defines what equipment may tell biology about protection, insulation, contamination barriers, treatment support and load without moving equipment ownership into Set 29. Third, it defines how magic may add temporary protection, adaptation or treatment capability while preserving Magic System costs and 29G treatment authority. Fourth, it defines how mixed settlements provide appropriate food, shelter, sanitation and healthcare to residents with different requirements. Fifth, it formalises how biome, weather, liquid, dimension and vehicle/vessel contexts become biological inputs rather than duplicate simulations.

29H is not a race-balance catalogue and does not assign final numerical traits to every ancestry in the World Content Atlas. Those are content records to be populated under Set 25/29J governance using the rules here. It is also not a substitute for Set 30 movement, Document 16 combat, Document 09 magic, Document 20 settlement services, Document 24 ancestry lore or Document 26 aquatic survival. Where another owner already defines a capability, 29H consumes a validated summary.

> **Locked 29H Rule**
>
> Biological difference may change what an actor needs, tolerates or recovers from. It may never silently decide what that actor believes, how they behave socially, what job they may perform, which faction they support or whether they deserve personhood.

# Design Sources, Authority and Treatment

| Source | Relevant Direction | Treatment in 29H |
| --- | --- | --- |
| 00 - Master Game Design Bible | Survival, magic, civilisation, player freedom and many peoples must interconnect from cosy to harsh settings. | Biological differences support the sandbox rather than becoming hard classes or mandatory optimisation choices. |
| 02 - Player Progression | No classic attributes or starting classes; Health/Stamina are derived resources; resistance/protection can come from gear, enchants, wards, potions and progression. | 29H permits bounded physiological inputs while progression remains externally owned. |
| 04 - Items Registry | Items own equipment identity, durability, quality, food, medicine and inventory state. | Items expose biological trait facets; 29H never redefines an item or its inventory rules. |
| 09 - Magic System v0.2 | Healing, cleansing, environmental wards, enchanting and biomancy are bounded magic capabilities with costs, consent and risk. | Magic emits validated biological capability/effect bundles that route to 29D/29F/29G as appropriate. |
| 10 - Creatures and Monsters | Creatures have distinct anatomy, habitats, hazards, drops and behaviours. | Creature/entity records reference Biological Profiles; Set 29 does not define creature AI or ecology. |
| 11 - Biomes and World Generation | Climate, weather, seasons, hazards, leylines and dynamic environments are world-owned. | 29H standardises the exposure/adaptation handoff and forbids duplicate environment logic. |
| 16 - Combat, Gear and Defence | Armour classes, load, resistances, environmental gear and damage resolution are combat/equipment concerns. | Combat resolves defence first; 29H consumes post-defence biological protection and load traits only where relevant. |
| 19-20G - Settlements and Building Systems | Housing, provisions, healthcare, sanitation, utilities, culture/biome/realm adaptation and mixed-population access are real service contracts. | 29H defines resident biological demand/suitability summaries without creating service capacity. |
| 24E - Peoples, Cultures, Factions and Settlement Atlas | Ancestry profiles may describe body range, environmental adaptation, repair/healing, equipment fit and accessibility; culture is separate from ancestry. | 29H provides the biological schema those ancestry records may reference while preserving equal personhood and mixed-culture rules. |
| Set 25 | Qualified IDs, schemas, migration, validation, production classification and source-of-truth governance. | 29H proposes semantic fields; 29J/Set 25 lock final qualified schema. |
| 26E - Aquatic Player Interaction | Aquatic capability may vary by ancestry, gear, training and magic; breath/pressure/swimming remain maritime/movement-owned. | 29H exposes trait hooks but does not take ownership of breath, pressure or aquatic locomotion. |
| 29A | Biological Profiles are registry-driven and culture-neutral; NPC cohorts may use shared profiles. | 29H operationalises that foundation. |
| 29B | Health/Stamina/Fatigue own universal biological resources and recovery. | 29H supplies bounded baseline and context modifiers only. |
| 29C | Hunger, hydration and nutrition own consumption biology. | 29H supplies diet/hydration applicability and compatibility tags without redefining food items. |
| 29D | Temperature, wetness, shelter, sleep and exposure own environmental response. | 29H supplies comfort/resistance/profile traits and consumes 29D's existing equipment/environment interfaces. |
| 29E | Injuries use semantic body regions and may exclude non-biological actors. | 29H provides body-plan/profile references; 29E remains injury authority. |
| 29F | Disease/poison uses susceptibility, resistance and immunity with source-driven exposure. | 29H supplies profile resistance/immunity tags and equipment/magic protection inputs. |
| 29G | Treatments are capability-driven transactions; items/spells/facilities do not directly mutate biology. | 29H standardises treatment compatibility and profile-aware capability filtering. |
| Cross-Set Register v1.0 | Set 29 owns survival/health biology and consumes Sets 27, 28 and 30. | All interfaces added here are amendments only; no ownership transfer occurs. |

# Static Table of Contents

1. Locked 29H System Identity  
2. Approved Decision Summary  
3. Ownership and Non-Ownership Boundary  
4. Biological Profile Architecture  
5. Profile Layers, Composition and Precedence  
6. Biological Applicability and Personhood-Safe Classification  
7. Playable-Ancestry Fairness and Balance Guardrails  
8. Ancestry, Heritage, Transformation and Culture Boundary  
9. Body Plan, Morphology and Semantic Biological Regions  
10. Health, Stamina, Fatigue and Recovery Profile Inputs  
11. Hunger, Diet, Nutrition and Consumption Compatibility  
12. Hydration and Fluid-Need Applicability  
13. Thermal Comfort, Wetness and Environmental Adaptation Traits  
14. Sleep, Rest Pattern and Recovery Compatibility  
15. Injury, Bleeding and Regeneration Profile Traits  
16. Disease, Infection, Poison and Toxin Resistance Traits  
17. Respiration, Aquatic, Pressure and Realm-Survival Handoffs  
18. Non-Biological, Constructed, Hybrid and Unusual Actors  
19. Equipment Integration Architecture  
20. Biological Protection Trait Bundle  
21. Equipment Coverage, Fit, Load and Condition  
22. Magic Integration Architecture  
23. Wards, Enchantments, Consumables and Protective Effects  
24. Biomancy, Temporary Adaptation and Profile Overlays  
25. Settlement Biological Support Architecture  
26. Mixed-Population Settlements and Suitability  
27. Healthcare, Sanitation and Recovery-Service Integration  
28. Food, Water, Shelter and Sleep-Service Integration  
29. Environmental Snapshot and Exposure Integration  
30. Biome, Realm and Dynamic-World Adaptation  
31. Vehicles, Vessels, Interior Environments and Mobile Shelter  
32. NPCs, Companions, Creatures and Population Cohorts  
33. Progression, Perks, Knowledge and Specialist Training  
34. Difficulty, Accessibility and Player-Choice Rules  
35. Persistence, Multiplayer and LOD Handoff to 29I  
36. UI, Codex and Explainability Handoff  
37. Registry and Schema Requirements for 29J  
38. Worked Integration Examples  
39. Validation and Acceptance Criteria  
40. Cross-Set Interface Amendments  
41. Open Decisions and Handoff to 29I  
Appendix A. Biological Profile Field Template  
Appendix B. Biological Protection Bundle Template  
Appendix C. Profile Overlay and Composition Template  
Appendix D. Settlement Biological Demand Template  
Appendix E. Worked Profile Examples  
Appendix F. Validation Scenario Catalogue  
Appendix G. Terminology Register  
Appendix H. Cross-Set Interface Amendments Register

# 1. Locked 29H System Identity

29H is a **compatibility and composition document**. It does not create a parallel survival simulation for each ancestry, item, spell or settlement. Universal biological systems remain universal; actor profiles and external capabilities only parameterise those systems through explicit, bounded interfaces.

| Identity Layer | Meaning | Player-Facing Result |
| --- | --- | --- |
| Universal Biology | 29B-29G own the shared rules. | Learning how hunger, injury, disease and treatment work remains transferable between characters. |
| Profile Identity | A Biological Profile declares which biological channels apply and their bounded physiological traits. | Different peoples and creatures feel meaningfully adapted without needing separate rulebooks. |
| Equipment Mitigation | Worn/used equipment exposes protection or support traits. | Clothing, armour and specialist gear matter in obvious situations. |
| Magical Mitigation | Valid magical effects expose bounded protection, adaptation or treatment capability. | Magic expands options but does not erase the physical sandbox. |
| Settlement Support | Buildings/services expose real capacity and suitability. | A functioning town can keep residents fed, warm, rested and treated for understandable reasons. |
| Environmental Input | World systems provide exposure snapshots. | The same snowstorm, toxic swamp or realm affects different actors according to real preparation and biology. |
| Identity Safety | Biology is separate from culture, morality and social role. | No ancestry is automatically heroic, hostile, primitive, magical, criminal or suited to one profession. |

## 1.1 One Biology, Many Profiles

Set 29 should avoid `if ancestry == X` branches. Runtime code asks questions such as:

- does Hunger apply to this actor?;
- what is this actor's thermal comfort band?;
- which biological regions exist?;
- does this pathogen family have a susceptibility modifier?;
- does the actor bleed?;
- what treatment families are compatible?;
- what protection does current equipment provide?;
- what temporary adaptation overlays are active?

Content answers through registries rather than bespoke code.

## 1.2 Profiles Are Not Character Sheets

A Biological Profile contains only physiology relevant to Set 29. It does **not** contain personality, dialogue style, intelligence, values, faction, profession, culture, class, morality, economic preference or social status.

# 2. Approved Decision Summary

| Area | Locked Decision |
| --- | --- |
| Profile Model | Use one base Biological Profile plus explicit permanent/temporary overlays; do not copy a complete profile for every minor variant. |
| Culture Separation | Culture/faction never modifies biological state unless a separate item, environment, training, magical or transformation source actually changes physiology. |
| Playable Balance | Inherent playable modifiers are contextual and bounded. Broad rate/resource modifiers should normally stay within approximately 0.80x-1.25x of the common baseline unless a signature trait has a clear counter-cost and mitigation path. |
| Immunity | True immunity is reserved for anatomical inapplicability or narrow signature traits. General "immune to disease/poison/environment" playable profiles are prohibited by default. |
| Resource Maxima | Playable inherent Max Health/Max Stamina modifiers should normally remain within about 0.90x-1.10x before external progression/equipment. Larger differences need explicit project-lead review. |
| Diet | Profiles may define diet/consumption compatibility and nutrient conversion tags; 29C still owns Hunger/Nutrition outcomes and Items own food definitions. |
| Hydration | Hydration may be inapplicable or differently supplied for unusual bodies, but Standard world's global Thirst-off rule still applies. |
| Temperature | Profiles may shift comfort bands and thermal response; environmental weather remains external and 29D owns Thermal Load. |
| Sleep | Profiles may alter normal rest pattern/requirement in bounded ways; no playable ancestry bypasses all fatigue/recovery requirements without an equivalent support mechanic. |
| Injury | 29E semantic regions remain authoritative. Profiles may declare non-bleeding, regenerative or redundant-region traits where biologically justified. |
| Disease/Poison | 29F consumes susceptibility/resistance tags and final protection bundles. Resistance does not change exposure-source ownership. |
| Non-Biological Actors | `uses_biological_system=false` or channel-specific applicability is explicit. Mechanical repair/charging/maintenance belongs to external owners rather than being renamed Hunger or Disease. |
| Equipment | Items/Combat resolve equipped state, fit, durability and combat defence. Set 29 receives effective coverage/protection traits only. |
| Protection Stacking | Biological protection uses diminishing/strongest-source-aware composition rather than unlimited additive stacking. |
| Magic | Magic validates cast/charge/cost first, then provides effect capabilities. Biological state changes route through 29D/29F/29G. |
| Permanent Transformation | A permanent biological transformation is an explicit profile-overlay/migration event with consent, save and reversibility rules owned by the transformation source. |
| Settlement | Settlement services expose capacity and supported-profile tags. Mixed settlements evaluate actual resident needs rather than assuming the majority ancestry is the default body. |
| Accessibility | Biological variation must not create unavoidable control barriers. Buildings, equipment and UI should support actual body/accessibility profiles through their owning systems. |
| Runtime | Effective profile composition is cached and recalculated only when relevant sources change. No per-frame full-registry recomposition. |

# 3. Ownership and Non-Ownership Boundary

## 3.1 29H Owns

29H owns:

- Biological Profile semantic architecture;
- biological-channel applicability;
- profile composition/overlay precedence;
- bounded inherent physiological modifier policy;
- diet/hydration/thermal/sleep compatibility fields;
- injury/disease/poison susceptibility profile fields;
- biological interpretation of equipment protection traits;
- biological interpretation of magical protection/adaptation traits;
- settlement biological demand/suitability summaries;
- environment/profile compatibility interpretation;
- non-biological opt-out and biological-support handoff rules;
- integration reason codes and validation rules;
- interfaces added in Section 40.

## 3.2 29H Does Not Own

29H does not own:

- ancestry names, lore, culture or social identity;
- character customisation meshes, rigs or sockets;
- equip eligibility, inventory slots or item durability;
- armour damage reduction, blocking or combat resistance resolution;
- spell costs, mana, cast timing or magical school progression;
- clinic/hospital construction or staffing AI;
- food production or economy;
- weather, climate, biome generation or realm physics;
- walking, swimming, climbing, riding or vehicle handling;
- dialogue, relationships or companion social behaviour;
- prices, wages, treatment fees or shortages;
- quest/event generation;
- final persistence/replication/UI architecture owned by 29I;
- final qualified schema and migration governance owned by 29J/Set 25.

## 3.3 Integration Pattern

The canonical pattern is:

**External owner resolves source -> 29H composes compatibility/protection -> Set 29 specialist resolves biology -> external consumers receive biological outputs.**

Examples:

- Equipment owner says a fitted cloak provides Cold Protection 0.25 and Rain Protection 0.40 over torso/arms. 29H composes the protection bundle; 29D resolves Thermal Load/Wetness.
- Magic owner validates an Environmental Ward and emits `thermal_cold_resistance=0.30` for 90 seconds. 29H adds the temporary overlay; 29D consumes it.
- Settlement owner exposes eight clean recovery beds and a treatment capability profile. 29H evaluates resident compatibility; 29G uses the capability for actual care.
- Ancestry content references a heat-adapted profile. 29H shifts thermal comfort; 29D still decides actual overheating from the current environment.

# 4. Biological Profile Architecture

A `BiologicalProfileDefinition` is immutable authored content referenced by an actor/entity definition. It describes the biological rules needed by Set 29 without duplicating full actor identity.

## 4.1 Core Profile Domains

A profile may contain:

1. **Applicability** - which biological channels exist.
2. **Baseline resource inputs** - bounded Max Health/Stamina/recovery inputs.
3. **Metabolic traits** - hunger, nutrition, hydration and diet compatibility.
4. **Thermal/wetness traits** - comfort, heat/cold response and moisture sensitivity.
5. **Rest traits** - sleep pressure and rest compatibility.
6. **Morphology traits** - semantic biological regions and special tissue properties.
7. **Hazard traits** - disease, poison, toxin and biological-exposure response.
8. **Recovery/treatment traits** - recovery style, treatment compatibility and regeneration rules.
9. **External survival links** - respiration/aquatic/realm traits whose mechanics remain external.
10. **Presentation hints** - player-readable biological summary keys, never hidden gameplay authority.

## 4.2 Stable Reference, Not Embedded Copy

Actor definitions should store a stable `biological_profile_id` and optional overlay references. They should not embed a copied profile blob unless a migration tool has materialised a frozen legacy snapshot for save compatibility.

## 4.3 Definition Versus Runtime State

The profile definition is not mutable actor condition. A heat-adapted profile may have a wider hot comfort band; the actor's current BodyTemperature remains runtime 29D state. A disease-resistant profile may reduce susceptibility; current DiseaseState remains 29F state.

# 5. Profile Layers, Composition and Precedence

An actor's effective physiology is a composition rather than one monolithic record.

## 5.1 Composition Layers

Recommended order:

1. **Base body/personhood profile** - fundamental biological applicability and morphology.
2. **Heritage/lineage overlay** - bounded inherited/regional physiological variation.
3. **Persistent transformation overlay** - explicit magical, dimensional or authored biological change.
4. **Equipment protection bundle** - resolved currently equipped gear.
5. **Persistent enchantment/ward bundle** - active external magical protection.
6. **Temporary adaptation effects** - potion, spell, ritual, environmental acclimation where supported.
7. **Current condition modifiers** - injury, disease, poison, hunger, fatigue etc. remain owned by their specialist documents.
8. **Difficulty/accessibility clamps** - world/player settings applied by their owning layer.

Conditions never rewrite the profile definition; they modify current effective state.

## 5.2 Precedence Rules

- Applicability flags from a fundamental profile cannot be casually toggled by ordinary gear.
- A permanent transformation may alter applicability only through an explicit authorised transform event.
- Equipment and temporary magic usually mitigate or amplify rates rather than replacing anatomy.
- Specialist conditions always retain their own truth; a profile modifier does not delete a Disease Instance.
- Stronger/unique effects use stacking groups and caps defined by the relevant biological owner.

## 5.3 Effective Profile Cache

The runtime should maintain a compact `EffectiveBiologicalProfileSnapshot` recalculated when:

- base profile changes;
- a persistent overlay changes;
- equipment changes or breaks;
- a relevant enchantment/ward toggles;
- a temporary adaptation starts/expires;
- a difficulty profile changes.

Ordinary per-second Hunger or Temperature updates read the cached snapshot.

# 6. Biological Applicability and Personhood-Safe Classification

Biology and personhood are separate questions.

## 6.1 Applicability Flags

Each profile may declare channel-level applicability such as:

- `uses_health`;
- `uses_stamina`;
- `uses_hunger`;
- `uses_hydration`;
- `uses_temperature`;
- `uses_wetness`;
- `uses_sleep_pressure`;
- `uses_fatigue`;
- `uses_injury_system`;
- `uses_bleeding`;
- `uses_disease_system`;
- `uses_poison_system`;
- `uses_biological_treatment`.

`false` means the biological channel is genuinely inapplicable, not that the actor is "better" than biological people.

## 6.2 Personhood Is External and Equal

A constructed, spiritual, transformed or colony-bodied person can have `uses_hunger=false` while still having full NPC identity, rights, relationships, quests, ownership and social agency. Set 29 never uses biological applicability to determine sentience or legal status.

## 6.3 No "Monster Biology" Shortcut

Hostile faction membership does not change physiology. Two actors using the same biological profile may be allies, civilians, bandits, soldiers or players. Creature-specific biology must be an explicit profile, not a hostility tag.

# 7. Playable-Ancestry Fairness and Balance Guardrails

Playable biological differences should be noticeable enough to create identity but small enough that equipment, knowledge and preparation remain meaningful.

## 7.1 Broad Modifier Guardrails

For playable profiles in ordinary content, broad innate modifiers should normally remain within:

| Modifier Family | Normal Playable Range | Notes |
| --- | ---: | --- |
| Max Health input | 0.90x-1.10x | Larger values need explicit review because they affect every danger. |
| Max Stamina input | 0.90x-1.10x | Movement itself remains Set 30-owned. |
| Hunger/Hydration rate | 0.80x-1.25x | Channel may be inapplicable only for genuinely non-metabolic bodies. |
| Natural recovery | 0.80x-1.25x | Cannot bypass treatment ceilings for severe injury/disease. |
| Thermal response | 0.75x-1.25x within a direction | Prefer comfort-band shifts over universal resistance to both heat and cold. |
| Disease susceptibility | 0.75x-1.25x per family | Narrow tags preferred over universal resistance. |
| Poison/toxin response | 0.75x-1.25x per family | True immunity is rare and specific. |
| Sleep pressure | 0.80x-1.25x | Alternative rest pattern may be used instead of simple multiplier. |

These are balance guardrails, not content mandates. Non-playable creatures/bosses may use wider profiles where their encounter design supports it.

## 7.2 Signature Trait Rule

A playable profile may exceed a normal guardrail when all are true:

- the trait is a defining body property;
- the benefit is narrow or contextual;
- there is meaningful opportunity cost or an opposing vulnerability/requirement;
- other profiles can mitigate the same environment with gear, magic, infrastructure or planning;
- the trait does not create a mandatory choice for broad progression;
- accessibility and multiplayer fairness remain acceptable.

## 7.3 Immunity Rule

True immunity is appropriate when the hazard cannot biologically affect the body at all: for example, a non-bleeding construct may be immune to bleed. It is generally not appropriate to give a normal playable organic ancestry universal immunity to all disease, poison, heat or cold.

# 8. Ancestry, Heritage, Transformation and Culture Boundary

The World Content Atlas correctly separates ancestry from culture. 29H reinforces that distinction.

## 8.1 Ancestry Content

An ancestry definition may reference:

- base biological profile;
- allowed heritage profile overlays;
- body-plan/morphology profile;
- equipment fit/accessibility profile;
- external locomotion/aquatic capability references;
- player-readable adaptation description.

It does not place cultural values inside the Biological Profile.

## 8.2 Heritage and Lineage

Heritage overlays may represent regional, magical, realm-linked, mixed or transformed physiological variation. A heritage overlay must describe a biological difference, not a cultural costume or political identity.

## 8.3 Culture Does Not Grant Biology

Living for generations in a volcanic culture does not automatically grant heat resistance. If a population has biologically adapted, that is an explicit ancestry/heritage profile. If they simply wear specialised clothing and construct cooled buildings, those are equipment/settlement capabilities.

## 8.4 Transformation

Permanent or semi-permanent transformation requires:

- source system and event ID;
- consent/authority as required by fiction and law;
- profile overlay ID;
- duration or permanence;
- reversibility rules;
- save/migration state;
- appearance/entity updates through external owners;
- health/condition reconciliation plan if applicability changes.

29H defines composition only; the source spell, ritual, curse, realm or story system owns why the transformation happens.

# 9. Body Plan, Morphology and Semantic Biological Regions

29E already establishes semantic regions such as `core`, `head`, `manipulator`, `locomotor`, `wing`, `tail`, `shell`, `distributed_body`, `non_bleeding_construct`, `regenerative_region` and `redundant_limb`. 29H makes those profile-addressable.

## 9.1 Morphology Reference

A Biological Profile references a `BiologicalRegionProfile`, rather than embedding six assumed humanoid regions.

## 9.2 Entity/Forge Boundary

Entity Forge and ancestry content own:

- visible mesh/voxel body;
- skeleton/rig;
- attachment points;
- body dimensions;
- animation capability;
- equipment sockets;
- interaction reach where applicable.

Set 29 owns only biological region semantics and resulting physiology.

## 9.3 Region Mapping

A morphology mapping should connect external hit/attachment regions to 29E semantic regions. If a body has four locomotor limbs, 29E may use individual region records or grouped region families according to the authored profile.

## 9.4 Accessibility and World Fit

Body dimensions, doorway clearance, workstation access, mount fit and vehicle seating remain Structure/Entity/Set 30 responsibilities. 29H may expose `body_support_profile_id` so those systems can validate actual residents.

# 10. Health, Stamina, Fatigue and Recovery Profile Inputs

29B remains the owner of Health, Stamina, Exertion, Fatigue and natural recovery.

## 10.1 Allowed Profile Inputs

A profile may provide:

- `max_health_mult` within playable guardrails;
- `max_stamina_mult` within playable guardrails;
- `natural_recovery_mult`;
- `stamina_regen_mult`;
- `fatigue_gain_mult`;
- `fatigue_recovery_mult`;
- `carry_tolerance_mult` as a biological input only;
- reason tags for explainability.

29B applies its own stacking, caps and eligibility rules.

## 10.2 No Direct Mutation

A profile does not set current Health to 120, refill Stamina or erase Fatigue. It modifies baseline calculations. Runtime state remains 29B-owned.

## 10.3 Extreme Bodies

Very large creatures, bosses or non-playable entities may use separate balance profiles beyond playable caps. Those profiles should remain data-driven so common biology can still process damage/recovery where applicable.

# 11. Hunger, Diet, Nutrition and Consumption Compatibility

29C owns Hunger, Hydration and Nutrition. 29H defines which foods a body can meaningfully consume and how biological conversion differs.

## 11.1 Diet Compatibility Interface

A profile may define:

- required/accepted consumption tags;
- incompatible/toxic ingredient tags;
- nutrition-conversion modifiers by broad nutrient group;
- satiety conversion modifier;
- ingestion route requirements;
- non-food energy source references for unusual bodies where owned externally;
- food-allergy/intolerance-like authored traits only when deliberately included as gameplay content.

## 11.2 Items Remain Authority for Food Composition

The food item says what it contains. The Biological Profile says whether/how the actor can use it. 29C calculates final Hunger/Nutrition effect.

## 11.3 No Mandatory Diet Spreadsheet

Diet compatibility is broad and semantic. The game does not need individual amino-acid, vitamin or digestive-enzyme simulation.

## 11.4 Mixed-Settlement Food Support

Settlement Provision systems can query resident `FoodDemandProfile()` and profile compatibility to determine whether actual stock satisfies the population. A storehouse full of food that half the settlement cannot safely consume is not full provision coverage.

# 12. Hydration and Fluid-Need Applicability

Hydration is optional by world settings and owned by 29C.

## 12.1 Profile Traits

Profiles may expose:

- `uses_hydration`;
- hydration depletion multiplier when enabled;
- valid hydration-source tags;
- saline/freshwater compatibility where content requires it;
- heat/exertion sensitivity inputs;
- external water-absorption capability only if an owning system explicitly supports it.

## 12.2 World Setting Takes Priority

If Thirst is disabled in Standard/Relaxed settings, profile differences do not secretly re-enable it for specific playable ancestries unless an explicit Custom/ancestry rule has been approved. The global experience remains predictable.

## 12.3 Swimming Is Still Not Drinking

Being in water does not automatically restore Hydration. Any absorption or aquatic physiology exception requires an explicit capability and remains separate from Set 30 swimming.

# 13. Thermal Comfort, Wetness and Environmental Adaptation Traits

29D owns Thermal Load, BodyTemperature, Wetness and exposure response.

## 13.1 Profile Thermal Traits

A Biological Profile may provide:

- preferred/comfortable thermal band shift;
- cold-pressure multiplier;
- heat-pressure multiplier;
- radiant-heat sensitivity;
- wetness sensitivity/retention modifier;
- evaporative-cooling effectiveness modifier;
- drying modifier where biological surface matters;
- extreme-exposure injury susceptibility tags.

## 13.2 Directional Adaptation

Prefer directional identity. A heat-adapted ancestry may tolerate hot conditions better without also receiving equal cold protection. This preserves equipment and settlement adaptation.

## 13.3 Wetness Is Not Culture

Aquatic or amphibious biological adaptation may reduce wetness penalties, but a coastal culture does not gain wetness resistance unless its residents use gear/buildings or actually have an adapted profile.

# 14. Sleep, Rest Pattern and Recovery Compatibility

29D owns Sleep Pressure and rest quality.

## 14.1 Profile Sleep Traits

A profile may provide:

- `uses_sleep_pressure`;
- sleep-pressure gain multiplier;
- restorative-sleep requirement multiplier;
- preferred sleep-pattern tag such as consolidated, segmented or low-duration;
- rest-surface compatibility tags;
- circadian preference as a soft comfort/presentation hint if later required;
- special dormancy/meditation/rest modes through explicit capability tags.

## 14.2 No Free Fatigue Immunity

A playable person who does not biologically sleep should normally have an alternative rest/maintenance requirement if they still use Fatigue or recovery systems. 29H does not turn "does not sleep" into permanent full recovery.

## 14.3 Settlement Rest Support

Housing exposes actual rest-site traits. 29H checks compatibility; 29D calculates sleep quality. A construct charging alcove or Rootborn sun-garden may be valid for an authored profile without pretending every bed works identically for every body.

# 15. Injury, Bleeding and Regeneration Profile Traits

29E owns injury generation, wounds, bleeding, pain, function and recovery.

## 15.1 Injury Profile Inputs

Profiles may define:

- biological region profile;
- tissue/structure tags relevant to compatible injury families;
- `uses_bleeding` and blood-loss applicability;
- bleed-rate multiplier by tissue family;
- fracture compatibility;
- burn/frost susceptibility modifiers;
- regeneration traits;
- redundant-region rules;
- recovery modifiers;
- treatment compatibility tags.

## 15.2 Regeneration

Natural regeneration is not permission to bypass 29E. A regenerative profile may:

- increase recovery rate;
- increase recovery ceiling for specified injury families;
- reduce chronic-state risk;
- regenerate selected lost function if future content permits it.

It does not instantly remove untreated severe injuries unless the authored signature trait explicitly says so and passes playable balance review.

## 15.3 Non-Bleeding Bodies

If `uses_bleeding=false`, 29E does not create Blood Loss from ordinary trauma. That actor may still suffer structural damage/injury if `uses_injury_system=true`.

# 16. Disease, Infection, Poison and Toxin Resistance Traits

29F owns exposure, infection, disease lifecycle, poison load and biological-hazard outcomes.

## 16.1 Profile Resistance Fields

A profile may expose:

- disease-family susceptibility multipliers;
- infection-route modifiers;
- innate immunity tags where anatomically justified;
- poison/toxin-family response multipliers;
- venom susceptibility;
- parasite compatibility;
- chronic/carrier compatibility where authored;
- natural clearance/recovery modifier inputs;
- contamination-contact surface traits.

## 16.2 Narrow Tags Over Universal Resistance

Use `resistance.disease.fungal` or `resistance.toxin.plant_alkaloid` rather than `resistance.all_disease=0.5`. Narrow traits create readable identity and preserve varied threats.

## 16.3 Equipment and Magic Join After Profile

Final 29F susceptibility is composed from base profile plus validated protection effects. A sealed mask may reduce airborne exposure; an antidote ward may reduce one toxin family. Neither changes the ancestry definition.

# 17. Respiration, Aquatic, Pressure and Realm-Survival Handoffs

The Cross-Set register and Set 26 create deliberate external ownership for aquatic locomotion and specialist hazards.

## 17.1 Trait References

A profile may reference external capability tags such as:

- breathable-medium compatibility;
- breath-capacity class;
- amphibious/aquatic capability;
- pressure-adaptation class;
- buoyancy/body-density hint;
- altitude/low-atmosphere compatibility where a future owner defines it;
- realm-specific exposure adaptation tags.

These are **references**, not duplicate mechanics.

## 17.2 Set 26 Boundary

Breath, drowning and pressure remain Set 26-owned unless formally reassigned. 29H can expose whether a profile is adapted but does not calculate oxygen depletion or decompression.

## 17.3 Set 30 Boundary

Swimming/flying/riding movement remains Set 30/Set 26 as governed by final reconciliation. A Biological Profile may state physical capability but does not own control, speed or pathfinding.

# 18. Non-Biological, Constructed, Hybrid and Unusual Actors

Leyforge's Atlas includes constructed, spiritual, plant-bodied, fungal/colony and other unusual persons. 29H must support them without forcing every person into human metabolism.

## 18.1 Applicability Modes

| Mode | Example Direction | Set 29 Behaviour |
| --- | --- | --- |
| Conventional biological | Most organic humanoids/creatures | Normal Set 29 channels as configured. |
| Modified biological | Amphibious, heat-adapted, plantlike, fungal etc. | Same systems with profile differences. |
| Hybrid biological/constructed | Symbiotic or magitech body | Selected biological channels plus external maintenance. |
| Constructed non-biological | Awakened machine/material person | Biological channels may be disabled; repair/charge belongs externally. |
| Spirit-material/manifested | Veilborn-like person | Profile selects only meaningful channels; anchor/manifestation systems remain external. |
| Collective/distributed | Colony-bodied person | Semantic regions and disease/injury may aggregate differently through explicit profile. |

## 18.2 Do Not Rename Maintenance as Hunger

A construct may need charge, lubricant, parts, memory continuity or repairs. Those can be important survival-like gameplay, but they are not automatically Set 29 Hunger, Disease or Medicine. The responsible entity/magic/item/settlement system should own the maintenance mechanic and expose only compatible care-demand summaries where needed.

## 18.3 Settlement Equality

Settlement Health/Housing systems must be able to support non-biological residents through compatible service modules without treating them as furniture or machines. 29H supplies compatibility tags; personhood and law remain social/governance systems.

# 19. Equipment Integration Architecture

Equipment can affect survival through protection, insulation, filtering, load, environmental sealing and treatment support. Items and Combat remain authoritative for what is equipped and whether it functions.

## 19.1 Equipment Handoff

Equipment owner provides a resolved `BiologicalEquipmentSnapshot` containing only biologically relevant traits after:

- equip-slot validation;
- body-fit validation;
- durability/condition;
- active modules/enchantments;
- coverage;
- wet/damaged/broken state;
- power/charge where required.

Set 29 does not inspect raw inventory to guess protection.

## 19.2 No Double Armour

Physical armour mitigation is resolved by Combat before biological trauma. 29H must not apply armour defence again as Health or injury reduction. Biological traits are used only for environmental/hazard exposure or post-defence compatibility explicitly designed for Set 29.

# 20. Biological Protection Trait Bundle

The standard equipment/magic/environment protection payload should be semantic and source-traceable.

## 20.1 Core Trait Families

Possible traits include:

- cold insulation;
- heat shielding;
- radiant-heat protection;
- wind protection;
- rain/waterproofing;
- moisture retention/drying;
- airborne contaminant filtering;
- contact contamination barrier;
- wound contamination protection;
- poison/toxin-family protection;
- biological-hazard sealing;
- UV/light/realm exposure where a specialist hazard owner exists;
- sleep/rest support;
- treatment support;
- load/heat-burden contributions;
- region coverage.

## 20.2 Normalised Protection

Protection values should usually be expressed as 0.0-1.0 effectiveness or a small semantic band that the receiving specialist converts. A value of 1.0 does not automatically mean absolute immunity unless the trait explicitly declares sealed/immune capability and passes condition checks.

## 20.3 Stacking

Default protection composition uses diminishing returns:

`combined = 1 - product(1 - effective_source_i)`

with specialist caps and stacking groups. This makes multiple layers useful without allowing five small charms to create impossible immunity.

Specialist owners may override composition for coverage, sealing or mutually exclusive gear.

# 21. Equipment Coverage, Fit, Load and Condition

## 21.1 Coverage

Biological protection may be regional. A respirator can reduce inhalation exposure without protecting skin contact. Boots can protect feet/locomotor regions from cold ground without insulating the head.

## 21.2 Fit

Fit is resolved externally. 29H receives `fit_valid=true/false` and effective coverage. It never stretches a human helmet onto an incompatible body plan through hidden logic.

## 21.3 Condition

Damaged, soaked, clogged, unpowered or broken equipment may lose protection. The item owner reports effective traits based on current state; Set 29 does not directly damage the item.

## 21.4 Load

Equipment owner/Combat supplies load band. 29B/29D calculate biological fatigue/heat effects; Set 30 calculates movement consequences. 29H merely ensures one consistent handoff.

# 22. Magic Integration Architecture

Magic is a capability source, not an exemption from biology.

## 22.1 Validated Magic First

Document 09 validates:

- spell known/available;
- mana/reagent/charge;
- focus/target;
- cooldown/channel;
- ward ownership/zone;
- legal/social consequences where appropriate;
- effect definition.

Only then does it emit biological capability/effect data.

## 22.2 Effect Destinations

| Magical Effect | Biological Owner |
| --- | --- |
| Health restoration / recovery support | 29G -> 29B |
| Wound stabilisation / bleed control | 29G -> 29E |
| Disease cleansing / toxin reduction | 29G -> 29F |
| Cold/heat protection | 29H bundle -> 29D |
| Wetness/drying alteration | Magic effect -> 29D through 29H contract |
| Hunger/hydration/nutrition change | 29G/29C compatible treatment/consumption interface |
| Temporary physiological adaptation | 29H profile overlay -> relevant specialist |
| Corruption/curse state | External Magic/Quest owner; biological symptoms may be separately emitted to Set 29 |

## 22.3 No Universal "Magic Resistance" Biology

Combat magic resistance remains Combat/Magic. 29H deals only with biological consequences or environmental/hazard protection explicitly tagged for Set 29.

# 23. Wards, Enchantments, Consumables and Protective Effects

## 23.1 Persistent Wards

A ward or settlement magical field may expose a zone-based protection bundle. The ward owner reports:

- zone/source ID;
- active state;
- capability tags;
- strength;
- allowed targets/permissions;
- charge/power status;
- stacking group.

29H composes the biological portion for residents inside the valid zone.

## 23.2 Enchanted Equipment

Enchantment owner adds traits to the equipment snapshot only while the enchantment is active and compatible. A frost ward on boots might reduce cold ground exposure; it does not grant universal frost immunity to the whole body unless specified and balanced.

## 23.3 Potions and Consumables

Consumables that change physiology route through 29G/29C. A temporary resistance potion may produce a timed profile overlay after a valid consumption/treatment transaction rather than directly editing 29F or 29D state.

# 24. Biomancy, Temporary Adaptation and Profile Overlays

Document 09 identifies Biomancy as Nature/Blood/Alchemy healing/adaptation/transformation with consent and risk controls. 29H defines the receiving biological overlay architecture.

## 24.1 Overlay Classes

- **Temporary adaptation** - minutes/hours; environment or hazard focused.
- **Sustained adaptation** - maintained by equipment, spell, ritual or settlement field.
- **Persistent transformation** - saved profile change with explicit source/reversal.
- **Condition-derived adaptation** - rare disease/curse/mutation effects; condition owner remains source.

## 24.2 Overlay Fields

An overlay may change only declared profile fields, with:

- source ID/event;
- priority;
- stacking group;
- start/end or permanence;
- affected fields;
- magnitude;
- removal/reversal rule;
- visibility/knowledge state;
- save policy;
- consent/permission metadata where required.

## 24.3 Safety Rules

- Temporary adaptation cannot silently alter culture/identity.
- A transformation that changes body plan must trigger external Entity/Equipment/Set 30 revalidation.
- Applicability changes require careful condition reconciliation; a transformation cannot delete an active disease/injury simply because the old channel disappears.
- Multiplayer authority must prevent duplicate overlays or client-forged physiology.

# 25. Settlement Biological Support Architecture

Settlements are major survival infrastructure. 29H lets settlement services understand actual resident needs without becoming the service owner.

## 25.1 Service Inputs

Relevant settlement capabilities include:

- food/provision availability;
- potable water access;
- shelter and thermal protection;
- rest/sleep capacity;
- sanitation and waste handling;
- treatment/recovery capacity;
- quarantine/isolation;
- clean/dirty route separation;
- heating/cooling/drying;
- magical protection/cleansing;
- emergency response;
- profile-compatible equipment/medicine supply.

## 25.2 Suitability, Not Decoration

A building or service provides biological support only when its external owner says the service is active. 29H does not award protection because a building looks warm or a room looks clinical.

## 25.3 Weakest-Link Compatibility

The existing settlement weakest-link rule applies. A clinic may have beds but fail a profile's treatment need because it lacks compatible staff, medicine, clean water, required power/mana or accessible treatment space.

# 26. Mixed-Population Settlements and Suitability

Leyforge explicitly supports mixed and diaspora settlements. Biological support must evaluate the actual population.

## 26.1 Population Demand Composition

A settlement's biological demand summary is built from:

- resident/visitor profile counts;
- age/life-stage only where an owning system supplies relevant biological traits;
- current Hunger/Hydration/Fatigue/condition summaries;
- climate/season exposure;
- active outbreaks/hazards;
- food/diet compatibility;
- shelter/rest compatibility;
- treatment compatibility;
- temporary refugee/army/workforce populations.

## 26.2 No Majority-Body Assumption

A mixed Tidekin/dry-land settlement cannot mark Housing/Health complete merely because most beds suit the majority. Service UI should expose uncovered demand categories and their causes.

## 26.3 Service Coverage Output

29H may produce bounded summaries such as:

- `population_food_compatibility_coverage`;
- `population_rest_compatibility_coverage`;
- `population_thermal_protection_coverage`;
- `population_treatment_compatibility_coverage`;
- `population_sanitation_risk`;
- uncovered profile-demand tags.

The seven main settlement needs remain owned by Document 20; 29H does not add new top-level need meters.

# 27. Healthcare, Sanitation and Recovery-Service Integration

## 27.1 Treatment Capability

29G owns treatment transactions. Settlement services expose:

- staffed treatment capability tags;
- capacity/queue;
- medicine stock access;
- clean water/sanitation state;
- recovery-bed traits;
- specialist tools/power/mana;
- isolation capability;
- profile/body-plan compatibility;
- emergency access.

## 27.2 Non-Biological Care

A construct-oriented clinic may expose repair/continuity capability owned by external systems. 29H can include it in a general resident-support summary, but 29G does not pretend a mechanical repair is a biological treatment unless the actor is hybrid and an actual biological channel is being treated.

## 27.3 Sanitation

Settlement sanitation affects disease/contamination through 29F exposure interfaces. 29H may apply profile-specific sensitivity, but it never invents sewage, clean water or contamination state.

# 28. Food, Water, Shelter and Sleep-Service Integration

## 28.1 Provision Compatibility

A settlement food service reports actual stock/meal traits. 29H combines those with resident diet profiles; 29C resolves consumption and nutrition.

## 28.2 Water Compatibility

Water utility/service reports source quality and access. 29H checks profile compatibility; 29C/29F resolve Hydration and exposure.

## 28.3 Shelter Compatibility

Structures report shelter traits through AM-29-020. 29H adds resident profile requirements such as thermal band, humidity/wetness needs or rest-surface compatibility. 29D resolves actual exposure/sleep.

## 28.4 No Perfect Universal Building Requirement

Settlements may solve mixed needs through separate rooms, modules, districts, equipment, magical fields or specialist facilities. Every building does not need to support every body plan if the settlement as a whole provides reasonable coverage.

# 29. Environmental Snapshot and Exposure Integration

29D already defines the Environment Exposure Snapshot. 29H extends profile-aware interpretation without creating environment truth.

## 29.1 Flow

1. World/Weather/Dimension/Set 26 provides authoritative environment snapshot.
2. Structures/vehicles may modify it through validated interior/shelter context.
3. Equipment and magic provide active protection bundles.
4. 29H composes actor profile + protection + temporary overlays.
5. 29D resolves thermal/wetness/sleep exposure.
6. 29F resolves biological hazards from explicit exposure sources.
7. 29B/29C receive resulting modifiers.

## 29.2 Source Traceability

Every effective mitigation should retain reason/source IDs so UI can explain:

- "Cold pressure reduced: Emberkin heat profile does not help here; wool cloak + hearth shelter are providing protection."
- "Airborne exposure reduced: sealed mask filter 72%."
- "Wetness gain reduced: Tidekin profile + oiled cloak."

# 30. Biome, Realm and Dynamic-World Adaptation

## 30.1 Biome Adaptation

Biome does not directly alter a Biological Profile. It provides environment and hazard state. The profile determines response.

## 30.2 Realm Adaptation

A realm may introduce special biological hazards or physical laws. Realm/Dimension owners expose typed effects such as:

- thermal anomaly;
- toxic atmosphere;
- mana saturation;
- corruption exposure;
- pressure/respiration requirement;
- altered rest environment;
- food/water incompatibility;
- time-related recovery context where Time system permits it.

29H routes only the biological portion to specialist Set 29 owners.

## 30.3 Dynamic World State

Corruption, cleansing, fires, floods, storms, industrial pollution and magical accidents may change exposure snapshots over time. An actor's profile remains stable unless a specific transformation effect changes it.

# 31. Vehicles, Vessels, Interior Environments and Mobile Shelter

Set 30 owns land vehicles; Set 26 owns vessels and specialist maritime systems.

## 31.1 Interior Environment Contract

A vehicle/vessel may expose a validated interior support context:

- enclosure/wind/rain protection;
- heating/cooling;
- drying;
- breathable-space state from Set 26 where relevant;
- contamination sealing/filtration;
- rest-site capability;
- medical/support module capability;
- current damage/power state;
- occupant capacity and compatible body-profile tags.

29H does not decide whether the vehicle exists, moves or is seaworthy.

## 31.2 Mobile Shelter Failure

If a wagon loses its roof, a ship compartment floods or a vehicle heater loses power, the owning system updates its context. Set 29 then receives the changed biological environment rather than duplicating damage logic.

# 32. NPCs, Companions, Creatures and Population Cohorts

## 32.1 Named Actors

Named players/NPCs/companions maintain full effective profile references and important condition state.

## 32.2 Creatures

Creatures may use the same Biological Profile architecture where useful. Ecology/AI remains Document 10/24-owned. Simplified wildlife can use lightweight profiles if full Hunger/Sleep/Disease simulation would not improve gameplay.

## 32.3 Distant Cohorts

Population cohorts may aggregate by:

- biological profile family;
- current condition class;
- diet/shelter/treatment demand family;
- hazard susceptibility group.

29I owns the final LOD scheduler; 29H ensures aggregation does not erase medically/socially important named differences.

## 32.4 Companions

Set 28 owns companion care decisions and behaviour. 29H/Set 29 expose what the companion biologically needs; Set 28 decides whether they ask for help, provide care or accept a risky journey.

# 33. Progression, Perks, Knowledge and Specialist Training

Progression remains Document 02-owned.

## 33.1 Progression May Modify Capability

Perks/skills/knowledge may provide validated modifiers such as:

- improved acclimation;
- better stamina efficiency;
- disease resistance training where plausible;
- toxin handling;
- survival gear effectiveness;
- treatment compatibility/skill;
- environmental knowledge warnings.

29H treats these as external overlays or capability inputs.

## 33.2 Knowledge Versus Physiology

Knowing that a plant is poisonous does not make the actor biologically resistant. Knowledge affects avoidance, UI and action choices; biology changes only through actual protection/adaptation.

## 33.3 No Ancestry-Locked Profession

A profile may change ease of surviving a work environment, but no biological profile locks a player out of being a miner, mage, farmer, sailor, healer or ruler. Equipment, infrastructure and training provide mitigation.

# 34. Difficulty, Accessibility and Player-Choice Rules

## 34.1 Difficulty

Peaceful/Relaxed/Standard/Harsh presets remain defined across 29A-29G. Profile differences scale through the same world settings rather than receiving secret per-ancestry difficulty.

## 34.2 Accessibility

Accessibility may:

- increase warning time;
- simplify biological displays;
- reduce condition severity;
- reduce required timing precision for treatment;
- provide stronger route/environment warnings;
- reduce motion/visual effects;
- enable simplified survival presets.

Accessibility does not need to remove ancestry identity. It can preserve contextual traits while reducing punishment.

## 34.3 Character Selection Transparency

If playable biological profiles differ, character creation/codex must explain meaningful traits in plain language before selection. Hidden vulnerabilities that only appear after hours of play are prohibited.

# 35. Persistence, Multiplayer and LOD Handoff to 29I

29I owns the final persistence/replication/LOD architecture. 29H requires it to preserve:

- base profile ID/version;
- persistent overlay IDs/versions;
- active temporary overlay runtime state where saveable;
- effective-profile revision/hash for diagnostics;
- source references for equipment/magic protection;
- named actor compatibility state;
- population cohort profile composition;
- migration rules when a profile definition changes.

Clients may predict presentation but cannot authoritatively change profile, immunity or protection values.

# 36. UI, Codex and Explainability Handoff

UI remains Document 17/29I-owned.

29H requires view models to support:

- player-readable profile summary;
- current active adaptations/protections;
- why a hazard is mitigated or amplified;
- incompatible food/rest/treatment reasons;
- settlement uncovered biological demand;
- accessible text/non-colour warning;
- known versus hidden information where diagnosis/knowledge matters.

The UI should not expose raw ancestry multipliers by default unless the selected information-density setting requests detailed stats.

# 37. Registry and Schema Requirements for 29J

29J must reconcile final qualified schemas for at least:

- `BiologicalProfileDefinition`;
- `BiologicalRegionProfile`;
- `BiologicalProfileOverlay`;
- `BiologicalApplicabilityFlags`;
- `BiologicalEquipmentSnapshot`;
- `BiologicalProtectionBundle`;
- `BiologicalTraitFacet` on items/effects;
- `SettlementBiologicalDemandSummary`;
- `SettlementBiologicalSuitabilitySummary`;
- `EffectiveBiologicalProfileSnapshot`;
- `ProfileCompatibilityReason`;
- migration aliases and version hashes.

## 37.1 Validation Principle

A schema field must have one owner. `cold_protection` belongs to the equipment/effect definition as a capability; 29D owns how that protection changes Thermal Load. `disease_resistance.fungal` belongs to the profile; 29F owns final infection math.

# 38. Worked Integration Examples

## 38.1 Emberkin Traveller in a Winter Biome

1. An Emberkin profile has improved heat tolerance but modestly increased cold pressure.
2. Worldgen/Weather reports - severe cold, wind and snow.
3. A wool cloak and insulated boots provide cold/wind protection.
4. A village inn provides enclosed heated shelter and compatible bed.
5. 29H composes profile + gear + shelter.
6. 29D resolves manageable Thermal Load.
7. Player survives because preparation compensates for a contextual biological weakness; no ancestry is locked out of winter exploration.

## 38.2 Tidekin Resident in a Mixed River Town

1. Tidekin profile references aquatic external capabilities and reduced ordinary wetness burden.
2. The settlement contains both dry houses and water-access residences.
3. 29H population summary finds Tidekin rest/hydration/access support covered while dry residents also retain suitable housing.
4. 20G/20A planners can see uncovered demand without declaring one architecture universally correct.
5. Set 30/26 handle actual swimming/routes; 29D handles temperature/wetness.

## 38.3 Awakened Construct Citizen

1. Actor references a non-biological Construct profile: no Hunger, Hydration, bleeding or disease.
2. Health/damage may be owned by Combat/construct maintenance architecture rather than 29B if the final entity system chooses that boundary.
3. A city provides charging/repair/memory-care services through construct-compatible modules.
4. 29H marks ordinary biological healer services incompatible but does not reduce personhood or social rights.
5. Set 28/20C handle citizenship, relationships and law.

## 38.4 Mycelian and Airborne Fungal Disease

1. Mycelian profile has authored resistance to one fungal family but not universal disease immunity.
2. 29F receives airborne exposure from a cave spore hazard.
3. A filter mask reduces inhalation exposure by 60% after condition/fit.
4. 29H combines profile + mask.
5. 29F resolves final susceptibility and possible infection.
6. A different bacterial disease remains unaffected by the fungal resistance tag.

## 38.5 Temporary Water-Breathing Biomancy

1. Magic validates a Biomancy/Alchemy adaptation spell.
2. It creates a timed profile overlay referencing external breathable-medium capability.
3. 29H activates the overlay for its duration.
4. Set 26 consumes the capability and changes breath handling.
5. 29H does not calculate swimming speed or pressure.
6. When the overlay expires, Set 26 receives the profile-change event and resumes ordinary breath rules safely.

## 38.6 Heavy Armour in a Desert

1. Combat/Items report Heavy load, high physical armour, low ventilation and high heat burden.
2. 29H passes biological equipment traits to 29D/29B.
3. 29D increases thermal pressure; 29B increases fatigue/stamina burden as already defined.
4. Set 30 applies movement behaviour from load/physiological outputs.
5. Combat physical mitigation remains unchanged and is not double-counted.

## 38.7 Hospital Serving Multiple Body Profiles

1. Hospital exposes staffed treatment capabilities, clean water, beds, mana support and specialist tools.
2. 29H compares current patients' profile/treatment compatibility.
3. Most organic residents are covered; one hybrid construct requires a repair-capable specialist module.
4. 29G treats biological injuries for the organic portion of that hybrid actor.
5. External maintenance system treats construct components.
6. Settlement Health UI reports the uncovered support without inventing a new need meter.

## 38.8 Rootborn in Drought

1. Rootborn profile uses Hunger/Nutrition but has authored hydration/thermal modifiers and plantlike tissue traits.
2. Drought environment raises heat and water demand through 29D/29C.
3. Settlement irrigation/garden shade provides environmental support.
4. Rootborn remains affected by drought; plantlike identity is not automatic immunity to lack of water.
5. Culture and social role remain unrelated to this physiology.

# 39. Validation and Acceptance Criteria

## 39.1 Required Validation Scenarios

29H must be tested against at least the following:

1. Humanoid baseline profile produces unchanged 29B-29G reference behaviour.
2. Heat-adapted playable profile gains contextual heat benefit without universal survival superiority.
3. Cold vulnerability can be fully mitigated to playable viability through gear/shelter.
4. Culture swap does not change Biological Profile.
5. Faction hostility does not change Biological Profile.
6. Heritage overlay changes only declared physiological fields.
7. Temporary magic overlay expires deterministically and restores the prior effective profile.
8. Permanent transformation survives save/load and revalidates equipment/body plan.
9. `uses_bleeding=false` prevents Blood Loss while compatible injuries still function.
10. Non-biological actor does not receive Hunger/Disease updates.
11. Mixed biological/construct actor routes biological and maintenance needs to different owners.
12. Diet-incompatible food is rejected/explained without deleting the item.
13. Thirst-disabled world does not secretly enable hydration pressure for a profile.
14. Equipment cold protection respects condition/coverage and does not double armour mitigation.
15. Broken respirator loses biological filtration after Item owner reports failure.
16. Two protection sources use diminishing composition rather than additive immunity.
17. Ward shutdown immediately removes zone protection on authoritative update.
18. Magic healing still routes through 29G and cannot directly erase a fracture/disease.
19. Fungal resistance does not reduce unrelated bacterial disease.
20. Profile poison resistance applies only to compatible toxin family.
21. Mixed settlement reports uncovered rest/food/treatment compatibility accurately.
22. Decorative clinic with no active service provides no biological support.
23. Vehicle/vessel interior protection changes when owning system reports damage/flooding/power loss.
24. Set 30 receives movement-relevant biological modifiers without Set 29 editing movement speed.
25. Set 26 receives aquatic capability tags without 29H owning breath/pressure.
26. Named NPC profile/conditions survive cohort demotion/promotion.
27. Client cannot forge profile overlay or immunity in multiplayer.
28. Profile migration preserves actor identity and current biological conditions.
29. Character creation can explain all significant playable inherent strengths/weaknesses.
30. Accessibility preset can reduce survival severity without corrupting profile identity.

## 39.2 Acceptance Criteria

29H is accepted when:

- every biological difference is data-driven and source-traceable;
- culture/faction/social identity cannot mutate biology by accident;
- playable profile differences are bounded and counterplay exists;
- non-humanoid morphology works through semantic regions;
- non-biological actors can opt out without losing personhood or settlement support;
- equipment contributes biology through explicit resolved traits and never duplicates Combat armour;
- magic contributes protection/treatment/adaptation through explicit capabilities and never bypasses specialist Set 29 owners;
- mixed settlements can calculate real support compatibility;
- environment remains externally authoritative;
- Set 26 and Set 30 boundaries are preserved;
- 29I receives complete persistence/LOD/UI requirements;
- 29J has sufficient schema/interface requirements to perform final reconciliation;
- all new interfaces are recorded below without ownership transfer.

# 40. Cross-Set Interface Amendments

These amendments add or refine interfaces only. They do not transfer gameplay ownership.

## AM-29-068 - Biological Profile Reference Interface

**Ancestry / Entity / Creature definitions -> Set 29**

Provide:

- `biological_profile_id`;
- `biological_region_profile_id`;
- optional heritage/persistent overlay IDs;
- body-support/accessibility profile reference;
- actor/content version.

Set 29 owns biological interpretation only. Ancestry/entity owner retains identity, appearance and lore.

## AM-29-069 - Effective Biological Profile Snapshot

**29H -> 29B/29C/29D/29E/29F/29G**

Provide a cached, source-traceable snapshot containing applicable channels, bounded baseline modifiers, resistance/adaptation tags and active profile overlays.

Specialist documents retain final calculations.

## AM-29-070 - Biological Equipment Snapshot

**Items / Combat Gear / Entity equipment -> 29H**

Provide resolved biological traits after fit, durability, coverage, active modules and power/charge are evaluated.

Required minimum fields:

- actor ID;
- equipped-instance IDs;
- coverage/region tags;
- biological trait facets;
- load/heat-burden class;
- condition/effectiveness;
- snapshot revision.

29H does not own equip or armour defence.

## AM-29-071 - Equipment Body-Fit and Coverage Interface

**Entity Forge / Equipment -> 29H and Structures/Set 30 consumers**

Expose valid body-profile compatibility and semantic coverage. Invalid fit produces no hidden protection.

## AM-29-072 - General Biological Protection Bundle

**Equipment / Magic / Structures / Vehicles / Vessels -> 29H**

Provide source-traceable protection capabilities for thermal, wetness, contamination, disease-route, toxin-family and other biological hazards.

29H composes; receiving specialists resolve final state.

## AM-29-073 - Magical Biological Effect Interface

**Document 09 / magic effects -> 29H/29G**

After valid magic activation, emit one or more:

- treatment capability;
- environmental protection capability;
- hazard resistance capability;
- temporary adaptation overlay;
- biological exposure/harm payload.

Magic retains mana, cast, effect and school ownership.

## AM-29-074 - Biological Profile Overlay Interface

**Transformation / Magic / Item / Condition owners <-> 29H**

Profile-changing sources provide overlay ID, affected fields, magnitude, priority, stacking group, duration/permanence, source event and removal/reversal policy.

Permanent morphology/applicability changes require external revalidation and save migration.

## AM-29-075 - Diet and Consumption Compatibility Interface

**29H <-> Items / 29C**

Items expose ingredient/consumption/nutrition tags. Biological Profiles expose compatibility/conversion tags. 29C owns final Hunger/Hydration/Nutrition effect.

## AM-29-076 - Rest and Sleep Compatibility Interface

**Biological Profiles <-> Structures/Items/29D**

Profiles expose rest/sleep compatibility tags. Rest sites expose support traits. 29D owns Sleep Pressure and sleep quality.

## AM-29-077 - Treatment Compatibility Interface

**29H <-> 29G / Settlement Health services**

Provide profile/body-plan/treatment-family compatibility and required specialist support. 29G owns actual treatment transaction and outcomes.

## AM-29-078 - Mixed-Population Biological Demand Interface

**29H -> Document 20 / Set 27 / Set 28 as consumers**

Expose aggregated food, hydration-if-enabled, shelter, rest, healthcare and hazard-support demand by profile family plus uncovered compatibility tags.

Document 20 owns settlement needs/capacity; Set 27 owns economic consequences; Set 28 owns social response.

## AM-29-079 - Settlement Biological Suitability Interface

**Document 19/20/20G -> 29H**

Provide active service/support capability by building/zone/district including food, water, shelter, rest, sanitation, treatment, isolation, heating/cooling, cleansing and profile compatibility.

29H returns coverage/suitability summaries only.

## AM-29-080 - Realm and Environment Adaptation Interface

**Worldgen / Dimensions / Set 26 -> 29H/29D/29F**

Environment owners expose typed hazard/exposure/adaptation requirements. Biological Profiles expose matching susceptibility/adaptation tags. Environment ownership remains external.

## AM-29-081 - Mobile Interior Biological Support Interface

**Set 30 Vehicles / Set 26 Vessels -> 29H**

Provide validated enclosure, thermal, wetness, filtration, breathable-space reference, rest and treatment-support context plus damage/power state.

Set 30/26 retain vehicle/vessel ownership.

## AM-29-082 - Non-Biological Maintenance Handoff

**29H -> Entity/Construct/Magic/Settlement owners**

When a profile marks a biological channel inapplicable, expose a structured reason and optional external maintenance-system reference. Set 29 does not invent replacement hunger/disease/medicine mechanics.

## AM-29-083 - Biological Capability Summary Interface

**29H -> Sets 27/28/30 and other consumers**

Provide a bounded summary of biologically relevant current capability/need, including:

- care need/urgency references;
- workforce capacity modifier;
- carry/stamina/fatigue outputs from existing Set 29 APIs;
- environment-support requirement tags;
- active significant adaptation/protection reason codes.

Consumers may react but not mutate biology directly.

## AM-29-084 - Profile Change Revalidation Event

**29H -> Equipment / Entity / Set 30 / Set 26 / 29I**

Emit `BiologicalProfileChanged` when a persistent or temporary overlay materially changes body/applicability/external-capability fields. Consumers revalidate fit, traversal/aquatic capability and persistence as required.

# 41. Open Decisions and Handoff to 29I

29H deliberately leaves the following for 29I/29J/final integration:

| Decision ID | Question | Owner / Handoff |
| --- | --- | --- |
| DEC-29H-001 | Final qualified namespace/field names for profile traits and overlays. | 29J + Set 25. |
| DEC-29H-002 | Exact playable inherent modifier caps after prototype balance. | 29J balance pass / Ash. Current guardrails are v0.1 defaults. |
| DEC-29H-003 | Which Atlas ancestries are playable at first release versus expansion. | Production classification / World Content Atlas / Ash. |
| DEC-29H-004 | Final non-biological maintenance-system owner and whether a universal non-biological care interface is needed. | Entity/Set 25/future integration. |
| DEC-29H-005 | Final Set 26 versus Set 30 ownership of swimming after cross-set reconciliation. | Final Sets 26/30 integration. |
| DEC-29H-006 | Exact profile data shipped to clients versus server-only diagnostics. | 29I. |
| DEC-29H-007 | Cohort aggregation dimensions and update frequency for mixed-population biological demand. | 29I. |
| DEC-29H-008 | Character-creation presentation of biological traits and custom-world overrides. | 29I + Document 17 revision. |
| DEC-29H-009 | Whether permanent biomancy transformations are Core, Expansion or Deferred content. | Document 09/Set 25 classification / Ash. |
| DEC-29H-010 | Whether authored food intolerance/allergy traits ship in Core. | 29J/content classification; default not required. |
| DEC-29H-011 | Whether acclimation becomes a persistent learned physiological overlay or remains equipment/knowledge-based. | 29J/Progression revision; default minimal. |
| DEC-29H-012 | Final migration behaviour when a profile applicability flag changes between game versions. | 29I/29J. |

> **29H Completion Statement**
>
> Document 29H establishes Leyforge's biological compatibility layer. Universal Set 29 rules can now support diverse bodies, unusual physiology, equipment, magical adaptation, mixed settlements and changing environments without hardcoding ancestry branches or transferring ownership from Items, Magic, Settlements, Worldgen, Set 26 or Set 30. The remaining Set 29 work can now focus on simulation/persistence/presentation in 29I and final registry/API/balance reconciliation in 29J.

# Appendix A. Biological Profile Field Template

```yaml
profile_id: biological_profile:<qualified_id>
schema_version: <version>
display_summary_key: <loc_key>
applicability:
  uses_health: true
  uses_stamina: true
  uses_hunger: true
  uses_hydration: true
  uses_temperature: true
  uses_wetness: true
  uses_sleep_pressure: true
  uses_fatigue: true
  uses_injury_system: true
  uses_bleeding: true
  uses_disease_system: true
  uses_poison_system: true
  uses_biological_treatment: true
morphology:
  biological_region_profile_id: biological_regions.humanoid.standard
  body_support_profile_id: body_support.humanoid.medium
baseline_modifiers:
  max_health_mult: 1.0
  max_stamina_mult: 1.0
  natural_recovery_mult: 1.0
  stamina_regen_mult: 1.0
  fatigue_gain_mult: 1.0
metabolism:
  hunger_rate_mult: 1.0
  hydration_rate_mult: 1.0
  diet_accept_tags: [food.general]
  diet_reject_tags: []
thermal:
  comfort_shift: 0
  cold_pressure_mult: 1.0
  heat_pressure_mult: 1.0
  wetness_sensitivity_mult: 1.0
sleep:
  sleep_pressure_mult: 1.0
  restorative_requirement_mult: 1.0
  rest_compatibility_tags: [rest.bed.general, rest.bedroll.general]
injury:
  bleed_rate_mult: 1.0
  recovery_mult: 1.0
  regenerative_tags: []
hazards:
  disease_susceptibility: {}
  poison_susceptibility: {}
  immunity_tags: []
external_capability_refs:
  respiration_profile_id: null
  aquatic_capability_profile_id: null
  pressure_adaptation_profile_id: null
source:
  owner_document: <content_owner>
  content_version: <version>
  migration_aliases: []
```

Final syntax belongs to 29J/Set 25.

# Appendix B. Biological Protection Bundle Template

```yaml
bundle_id: biological_protection:<runtime_or_definition_id>
actor_id: <actor>
sources:
  - source_id: item:<instance>
    source_type: equipment
    coverage: [torso, left_arm, right_arm]
    condition: 0.82
traits:
  cold_protection: 0.35
  wind_protection: 0.30
  waterproofing: 0.20
  airborne_filtering: 0.00
  contact_contamination_barrier: 0.10
  toxin_family_protection: {}
  heat_burden: 0.08
stacking_groups:
  thermal: clothing_outer
  contamination: garment_barrier
snapshot_revision: <hash_or_counter>
```

# Appendix C. Profile Overlay and Composition Template

```yaml
overlay_id: biological_overlay:<ULID_or_definition>
source_id: magic_effect:<id>
source_event_id: <event>
actor_id: <actor>
overlay_class: temporary_adaptation
priority: 40
stacking_group: adaptation.aquatic
start_time: <world_time>
end_time: <world_time>
changes:
  external_capability_refs.aquatic_capability_profile_id: aquatic.water_breathing.temporary
  thermal.cold_pressure_mult: 0.90
revalidation_flags:
  - aquatic_capability
  - ui_summary
save_policy: save_if_active
removal_policy: expire
```

# Appendix D. Settlement Biological Demand Template

```yaml
settlement_id: <settlement>
summary_time: <world_time>
population_profiles:
  biological_profile.humanoid.baseline: 42
  biological_profile.tidekin.river: 11
  biological_profile.construct.awakened_stone: 5
coverage:
  food_compatibility: 0.96
  rest_compatibility: 0.90
  thermal_support: 0.88
  biological_treatment: 0.92
uncovered_demands:
  - demand_tag: rest.aquatic_wet_dry
    actors: 4
  - demand_tag: care.construct_repair
    actors: 5
    biological_owner: false
external_links:
  provision_service_summary_id: <id>
  health_service_summary_id: <id>
  shelter_summary_id: <id>
```

# Appendix E. Worked Profile Examples

These are **illustrative v0.1 integration examples**, not final Atlas balance entries.

## E.1 Baseline Organic Humanoid

- All standard biological channels enabled.
- 1.0 baseline modifiers.
- Standard humanoid region profile.
- General diet and rest compatibility.
- No innate immunities.

## E.2 Heat-Adapted Emberkin Example

- All ordinary biological channels enabled.
- Heat pressure multiplier 0.80.
- Cold pressure multiplier 1.10.
- Burn susceptibility modestly reduced for ordinary heat, not magical fire unless separately tagged.
- No culture/profession fields.
- Equipment and shelter can fully compensate for cold environments.

## E.3 River Tidekin Example

- Ordinary Health/Hunger/Fatigue enabled.
- Wetness sensitivity reduced.
- External aquatic capability reference present.
- General dry-land thermal rules still apply.
- Water-breathing/breath details remain Set 26-owned.
- Mixed-settlement rest profile accepts both specialised wet/dry rest sites where authored.

## E.4 Rootborn Example

- Biological system enabled with plantlike tissue tags.
- Hunger/Nutrition uses compatible food/light/nutrient tags defined by content; no assumption of free photosynthesis unless authored.
- Hydration remains relevant if enabled.
- Injury regions may use regenerative tissue tags.
- Disease susceptibility can differ by fungal/plant pathogen family without universal immunity.

## E.5 Awakened Construct Example

- Hunger/Hydration/Disease/Bleeding disabled.
- Biological treatment disabled unless hybrid tissue exists.
- External maintenance profile required.
- Personhood unaffected.
- Settlement support uses construct-compatible rest/charge/repair services owned externally.

# Appendix F. Validation Scenario Catalogue

| ID | Scenario | Expected Result |
| --- | --- | --- |
| 29H-VAL-001 | Culture changed, same ancestry/profile. | Biological snapshot unchanged. |
| 29H-VAL-002 | Armour equipped then removed. | Biological equipment snapshot updates once; Combat defence and 29D effects remain separately owned. |
| 29H-VAL-003 | Ward overlaps cloak cold protection. | Diminishing composition, source-traceable result. |
| 29H-VAL-004 | Broken ward loses power. | Protection removed on authoritative ward state change. |
| 29H-VAL-005 | Character transforms body plan. | Entity/equipment/Set 30 revalidation event emitted. |
| 29H-VAL-006 | Thirst disabled globally. | No Hydration depletion despite profile hydration multiplier. |
| 29H-VAL-007 | Non-bleeding construct receives slash. | No Blood Loss; external damage/repair handles appropriate consequences. |
| 29H-VAL-008 | Food incompatible with profile. | Consumption blocked/warned or reduced per 29C rules; item remains authoritative. |
| 29H-VAL-009 | Mixed town lacks one profile-specific rest facility. | Settlement coverage reports uncovered demand rather than marking all housing invalid. |
| 29H-VAL-010 | Client sends forged immunity overlay. | Server rejects; authoritative profile unchanged. |
| 29H-VAL-011 | Tidekin water-breath overlay active. | Set 26 consumes capability; Set 29 does not run duplicate breath simulation. |
| 29H-VAL-012 | Profile version migration narrows disease resistance. | Current Disease Instances persist; future susceptibility uses migrated profile. |

# Appendix G. Terminology Register

| Term | Meaning |
| --- | --- |
| Biological Profile | Immutable physiology definition referenced by an actor/entity. |
| Effective Biological Profile | Cached composition of base profile plus authorised overlays/protection relevant to Set 29. |
| Biological Applicability | Flags indicating which Set 29 channels genuinely apply to an actor. |
| Biological Region Profile | Semantic body-region definition consumed primarily by 29E. |
| Heritage Overlay | Bounded physiological variation layered on a base profile; not culture. |
| Transformation Overlay | Explicit persistent/semi-persistent biological change from an external source. |
| Temporary Adaptation | Time-bounded profile modification from spell, potion, ritual, environment or similar source. |
| Biological Protection Bundle | Resolved protection traits from equipment, magic, shelter, vehicle or other capability source. |
| Suitability | Whether an external service or item is biologically compatible with a profile; not whether the service exists. |
| Body-Support Profile | External accessibility/fit reference for equipment, structures, vehicles and rigs. |
| Non-Biological Actor | Person/entity for which some or all biological channels do not apply. |
| Maintenance Handoff | Explicit reference to an external system that owns non-biological upkeep rather than abusing Set 29 channels. |
| Profile Revalidation | Required external checks after a profile/body/applicability change. |
| Contextual Advantage | Biological benefit useful in a particular environment/hazard rather than universal superiority. |

# Appendix H. Cross-Set Interface Amendments Register

29H carries forward all applicable Set 29 amendments. New interfaces introduced here are:

- AM-29-068 - Biological Profile Reference Interface.
- AM-29-069 - Effective Biological Profile Snapshot.
- AM-29-070 - Biological Equipment Snapshot.
- AM-29-071 - Equipment Body-Fit and Coverage Interface.
- AM-29-072 - General Biological Protection Bundle.
- AM-29-073 - Magical Biological Effect Interface.
- AM-29-074 - Biological Profile Overlay Interface.
- AM-29-075 - Diet and Consumption Compatibility Interface.
- AM-29-076 - Rest and Sleep Compatibility Interface.
- AM-29-077 - Treatment Compatibility Interface.
- AM-29-078 - Mixed-Population Biological Demand Interface.
- AM-29-079 - Settlement Biological Suitability Interface.
- AM-29-080 - Realm and Environment Adaptation Interface.
- AM-29-081 - Mobile Interior Biological Support Interface.
- AM-29-082 - Non-Biological Maintenance Handoff.
- AM-29-083 - Biological Capability Summary Interface.
- AM-29-084 - Profile Change Revalidation Event.

All amendments remain subject to 29J and the final Document Sets 27-30 reconciliation pass. None transfers gameplay ownership.

---

**End of Document 29H - Biological Profiles, Equipment, Magic, Settlement and Environmental Integration v0.1**
