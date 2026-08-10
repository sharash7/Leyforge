# LEYFORGE

## 02 - Player Progression System

### Production Character Growth, Skills, Perks, Knowledge and Capability Progression

**Version 1.0 - Reconciled Production Foundation Draft**  
**Date:** 8 August 2026  
**Supersedes:** `02_Fantasy_Voxel_Civilisation_Sandbox_Player_Progression_System_v0_1.md` for active production direction  
**Primary Vision Authority:** `00_Fantasy_Voxel_Civilisation_Sandbox_Master_Game_Design_Bible_v1_0.md`  
**Primary Loop Authority:** `01_Fantasy_Voxel_Civilisation_Sandbox_Core_Gameplay_Loop_v1_0.md`  
**Reconciliation Guardrail:** `Leyforge_Foundation_00-20_POC_to_Production_Reconciliation_Register_v0_1.md`  
**Project Lead and Final Authority:** Ash

A production-scale progression framework for a sandbox-first fantasy voxel civilisation game in which character growth comes from meaningful practice, knowledge, equipment, perks, social and institutional access, physical capability, settlement development and world discovery rather than a fixed class, attribute build or scripted progression route.

> **Progression Statement**
>
> **Leyforge uses layered progression rather than one master ladder. The player has an uncapped overall level, many use-based skills, large perk trees, learned knowledge, recipes and research, physical tools and equipment, magical mastery, social and institutional access, settlement relationships, transport and maritime capability, and world-state progression. No single layer is allowed to replace the others. A high-level character still needs real materials, valid knowledge, suitable tools, legal or social access where relevant, reachable routes and the specialist-system conditions required by the action.**

> **Production Progression Rule**
>
> **Progression must expand capability, information, efficiency, reliability and choice without allowing a number on the character sheet to create resources, override physical impossibility, bypass consent, manufacture trust, invent market value, ignore biological state or grant a movement capability that the player does not actually possess.**

---

# Document Purpose

Document 02 defines how the player grows across the entire Leyforge sandbox. It owns the global structure for:

- overall player level and general XP;
- use-based skills and skill XP;
- perk points, perk eligibility, specialisation and respec;
- permanent progression modifiers exposed to specialist systems;
- knowledge/research progression as an unlock framework without owning every knowledge fact;
- progression-facing material, equipment, magic, automation, settlement, economic, social, traversal, maritime, combat and realm capability bands;
- mastery and long-term character development;
- anti-grind, anti-exploit and seed-reachability rules;
- shared progression requirements for solo, co-op and companion/NPC integration.

The original v0.1 established the correct foundation: classless growth, no traditional attributes, an uncapped overall level, use-based skills, large perk trees, eventual mastery, multiple unlock sources and progression through tools, knowledge, magic, automation, civilisation and exploration. Version 1.0 preserves those decisions while reconciling them with the production systems created since the original document.

The most important reconciliation is **ownership**. This document owns how progression is earned and what progression modifiers or eligibility it exposes. It does not own the specialist system that consumes those values.

Examples:

- Set 29 owns authoritative Health, Stamina, Fatigue and biological recovery. Document 02 may grant a bounded permanent Max Health or Max Stamina modifier, but Set 29 applies it and owns the resulting biological state.
- Set 28 owns relationships, trust, loyalty, persuasion resolution and companion agreements. Document 02 owns Diplomacy and Leadership skill/perk progression, but cannot turn XP into automatic trust or consent.
- Set 27 owns prices, wages, contracts, finance and market state. Document 02 owns Trading progression, but cannot directly calculate a market price or create currency.
- Set 30 owns terrestrial movement, traversal execution, route feasibility and transport physics. Document 02 may improve traversal proficiency or expose movement-related progression modifiers, but cannot make an inaccessible route valid by itself.
- Document 26E owns detailed swimming/diving action truth and Set 26 owns vessel/maritime systems. Document 02 owns the progression skills that those systems consume.
- Magic owns spell rules, schools, mana and ritual execution. Document 02 owns how practice, perks and learning contribute to magical progression.

Document 02 therefore acts as the **character-growth coordinator**, not the universal gameplay calculator.

---

# Production Status and Authority

| Field | Reconciled Direction |
| --- | --- |
| Progression Model | Hybrid layered progression: overall level + use-based skills + perks + knowledge/research + physical capability + social/institutional access + settlement/world progression. |
| Overall Level | Yes. Uncapped. Represents broad accumulated experience and grants general progression rewards; it does not directly own specialist gameplay truth. |
| Classes | None by default. No mandatory starting class, profession or background locks. |
| Traditional Attributes | None. No Strength/Dexterity/Intelligence/Charisma-style core attribute array. |
| Skills | Many use-based skills with validated action XP, milestone XP and teaching/training support. |
| Perks | Large skill and cross-system perk trees. Perks specialise the current character but do not create permanent class lockout. |
| Mastery | One character may eventually master all normal progression paths, subject to world-state, knowledge, physical and social access. |
| Knowledge | Learned through observation, practice, books, NPCs, research, ruins, experimentation, institutions and world evidence. Knowledge never fabricates unseen world truth. |
| Capability Model | Hard progression requirements prefer Set 25 capability requirements and eligible provider groups over one named item, settlement, teacher, biome or quest. |
| Biological Boundary | Set 29 owns Health/Stamina/Fatigue and biological formulas. Document 02 exposes permanent progression modifiers only. |
| Social Boundary | Set 28 owns social state and resolution. Skills/perks contribute but cannot force trust, loyalty, consent or companionship. |
| Economy Boundary | Set 27 owns prices, wages, contracts and finance. Trading/leadership progression may contribute expertise or negotiation inputs only. |
| Movement Boundary | Set 30 owns terrestrial movement execution and route validity. Set 26E owns detailed aquatic locomotion. Progression cannot bypass missing physical capability. |
| Maritime Boundary | Set 26 owns maritime action/system truth. Document 02 owns global character skill/perk integration for maritime practice. |
| POC Status | Fixed Forest Hamlet progression chain is Archived Validation only. Reusable progression mechanics remain. |
| Seed Rule | No normal seed may require one fixed named progression provider. Equivalent capability providers, trade, teaching, salvage, research, migration or deterministic repair must preserve reachability. |
| Balance Status | Progression architecture and ownership are locked by this draft; exact XP curves, point costs and numerical modifiers remain balance-registry data unless explicitly frozen elsewhere. |

---

# Source and Supersession Hierarchy

For progression interpretation, use this order:

1. explicit approved project direction and later approved amendments;
2. `00 - Master Game Design Bible v1.0` and `01 - Core Gameplay Loop v1.0` for production identity and pacing;
3. the final Sets 27-30 Cross-Set Interface Register v1.1 and Final Reconciliation Report v1.1 for economy/social/biology/movement ownership;
4. specialist Sets 26-30 for maritime, economy, social, biological and movement gameplay;
5. Set 25 for canonical registries, capabilities, suitability, fallbacks, progression reachability and validation;
6. Set 24 for generated-world relationships and seed-independent content topology;
7. Documents 19-20 and companions for settlement growth, buildings, facilities and project capability;
8. revised Foundation Documents as approved;
9. original Document 02 v0.1 for valid progression intent not superseded above;
10. Document 99 and fixed POC milestones as historical/regression evidence only.

> **Non-Supersession Rule**
>
> A later specialist document does not delete a progression idea merely because it now owns the underlying gameplay state. If an old perk improved Stamina efficiency, the concept may survive; the rewritten perk must expose a typed modifier to Set 29 rather than reproducing a Stamina formula in this document.

# Static Table of Contents

1. Locked Progression Identity  
2. Progression Architecture  
3. Overall Player Level  
4. Overall XP and Meaningful-Action Rewarding  
5. Skill System  
6. Canonical Skill Families and Global Skill Registry  
7. Skill XP, Practice and Anti-Abuse  
8. Skill Levels, Proficiency Bands and Mastery  
9. Perk Architecture  
10. Perk Points, Eligibility and Acquisition  
11. Respec, Specialisation and Eventual Mastery  
12. No-Class and No-Traditional-Attribute Rule  
13. Permanent Character Modifier Interface  
14. Health, Stamina, Fatigue and Biological Progression  
15. Mana and Magical Progression  
16. Knowledge, Research, Discovery and Teaching  
17. Recipes, Techniques and Unlock Eligibility  
18. Tools, Materials, Equipment and Physical Capability  
19. Capability-Based Progression and Seed Reachability  
20. Gathering, Production and Craft Progression  
21. Automation and Engineering Progression  
22. Building, Construction and Settlement-Capability Progression  
23. Economy, Trading and Enterprise Progression  
24. Dialogue, Diplomacy, Reputation and Social Progression  
25. Leadership, Companions and Delegation Progression  
26. Survival, Fieldcraft, Medicine and Biological Knowledge  
27. Movement, Traversal and Land-Transport Progression  
28. Maritime, Diving, Vessel and Port Progression  
29. Combat, Defence and Adventure Progression  
30. Exploration, Navigation and World-Knowledge Progression  
31. Faction, Law, Crime, Conquest and Political Progression  
32. Realm and Inter-Realm Progression  
33. Death, Failure, Recovery and Progression Protection  
34. Multiplayer and Shared Progression  
35. NPC and Companion Development Hooks  
36. UI, Feedback, Accessibility and Explainability  
37. Difficulty, World Settings and Progression Scaling  
38. Anti-Grind, Anti-Exploit and AFK Rules  
39. POC Retirement and Preservation Doctrine  
40. Progression Reachability and Production Validation  
41. Cross-System Ownership and Interface Map  
42. Balancing Principles  
43. Example Production Progression Paths  
44. Revision Requirements for Foundation Documents 03-20  
45. Closing Direction  

Appendix A. Canonical Skill Registry Summary  
Appendix B. Progression Modifier Interface Catalogue  
Appendix C. Progression Source-to-Reward Matrix  
Appendix D. Capability Gate and Fallback Examples  
Appendix E. Anti-Exploit Acceptance Checklist  
Appendix F. POC-to-Production Progression Conversion Matrix  
Appendix G. Cross-System Progression Consumption Matrix

---

# 1. Locked Progression Identity

Leyforge progression is **growth through participation in a living world**.

The player becomes more capable because they have:

- practiced meaningful actions;
- learned techniques and facts;
- discovered or researched recipes;
- earned or chosen perks;
- acquired better tools, gear and resources;
- gained access to specialists, institutions and infrastructure;
- built or joined settlements with greater capability;
- established relationships, legal standing and economic access;
- found routes, charts, sites and realm connections;
- survived difficult conditions and completed meaningful milestones.

None of those layers should be reducible to a single number.

> **Locked Rule**
>
> **A Level 80 player with no suitable vessel cannot cross an ocean as if they own one. A master trader cannot conjure market stock. A skilled diplomat cannot force consent. A legendary climber cannot mantle through a solid ceiling. A survival perk cannot erase a broken leg. Progression makes valid actions better, broader or easier; it does not make invalid world state disappear.**

## 1.1 Player Fantasy

The same character can evolve through many identities over one long-lived world:

- survivor;
- miner or forester;
- farmer or fisher;
- builder or architect;
- smith or craft specialist;
- engineer or automation designer;
- mage, alchemist or enchanter;
- explorer, navigator or diver;
- fighter, hunter or defender;
- merchant, caravan operator or entrepreneur;
- diplomat, negotiator or faction intermediary;
- companion leader or expedition organiser;
- shipwright, sailor or captain;
- settlement founder, administrator or ruler;
- dimensional explorer;
- conqueror, criminal power or feared political actor;
- broad generalist who eventually learns nearly everything.

Role identity comes from **what the player has done and built**, not a permanent character-creation class.

# 2. Progression Architecture

| Layer | Owner in Document 02 | What It Does | What It Does Not Replace |
| --- | --- | --- | --- |
| Overall Level | Yes | Broad lifetime experience, general perk economy, milestone recognition. | Skills, gear, knowledge, specialist state or physical capability. |
| Skill Proficiency | Yes | Improves practiced domains and unlocks skill-specific options/perks. | Actual action execution owned by specialist systems. |
| Perks | Yes | Specialisation, efficiency, new choices, modifiers and information. | Hard world constraints, consent, resource conservation or specialist authority. |
| Knowledge/Research Progression | Shared framework | Tracks progression eligibility and learning sources through owner-provided knowledge facts. | Set 28 knowledge truth, world discovery truth or specialist registries. |
| Physical Equipment Capability | Consumes | Tools, gear, machines, vehicles, vessels and infrastructure provide capabilities. | Definition ownership in Blocks/Items/Recipes/Automation/Maritime/etc. |
| Magic Mastery | Progression side | Practice/perks and skill/mastery eligibility. | Spell/mana/ritual truth owned by Magic. |
| Biological Growth | Modifier source | Permanent health/stamina/recovery-related progression modifiers. | Set 29 biology. |
| Economic Career | Progression side | Trading/leadership/stewardship expertise and milestones. | Set 27 prices, wages, contracts, banking or public finance. |
| Social Growth | Progression side | Diplomacy/leadership skill growth and social perks. | Set 28 trust, affection, loyalty, persuasion outcome or companion agreement. |
| Settlement/Civilisation Access | Consumes | Services, specialists, projects and institutional capability become available. | Documents 07/19/20 settlement truth. |
| World/Realm Progression | Consumes | New regions, routes, sites, realm capabilities and opportunities. | Worldgen, Atlas or Dimension truth. |

## 2.1 Progression Is a Graph, Not a Staircase

A player may reach the same capability through different routes. For example, advanced metalworking might be obtained through:

- personal Smithing practice plus a suitable forge;
- apprenticeship with a specialist;
- settlement/faction access to a trained smith;
- recovered technical knowledge;
- trade for the finished component;
- an alternative material or magical process if the recipe/capability contract permits it.

This follows Set 25's capability model. Production progression should ask **what capability is required and what valid providers can supply it**, not "did the player visit the one correct village?"

## 2.2 Three Kinds of Gate

Progression gates should be classified before implementation:

1. **Hard world gate** - a real physical, legal, biological, knowledge or system requirement. A perk cannot simply ignore it unless its owner explicitly says it provides the missing capability.
2. **Soft proficiency gate** - the action is possible, but low proficiency may make it slower, less efficient, less precise, more exhausting or less informative.
3. **Discovery/access gate** - the player does not yet know, own, reach or have permission to use a provider. Multiple valid routes should normally exist.

Hard gates are used carefully. Leyforge should prefer **difficulty, cost and preparation** over arbitrary level locks.

# 3. Overall Player Level

The player retains an overall level from the original progression design. It is a broad record of accumulated meaningful experience across the sandbox, not a combat rating or class level.

| Question | Production Rule |
| --- | --- |
| Hard cap? | No hard cap by default. XP requirements may increase over time and post-mastery levels may be mostly recognition/general perk economy. |
| Does level gate the world? | Normally no. Major progression uses capabilities, knowledge, resources, routes, relationships and world state. |
| Does level increase every stat? | No. There is no automatic level -> Health/Stamina/Mana formula. |
| What does level grant? | General perk points, milestone recognition, optional bounded progression-modifier selections and convenience/knowledge eligibility where specifically defined. |
| Can peaceful play level? | Yes. Building, farming, trade, research, social play, exploration, rescue, production and settlement work all produce valid progression. |
| Can repetitive play level? | Yes at diminishing efficiency when the action remains meaningful; no-effect spam does not. |
| Can one player master everything? | Yes over a long enough sandbox history, subject to content/world access. |

## 3.1 Level Bands Are Descriptive, Not Mandatory Gates

Level bands may be used for UI pacing, achievement summaries, tutorial recommendations or expected balance ranges. They are **not** promises that a specific level automatically grants iron, a settlement, magic, a vessel, a companion, a realm or political authority.

A Level 10 character might possess advanced maritime knowledge through an unusual seed relationship. A Level 70 character might deliberately avoid magic. The world remains systemic rather than level-scaled into sameness.

| Descriptive Band | Typical Player History | Important Note |
| --- | --- | --- |
| 1-5 | First survival, first tools, first discoveries, initial contacts. | No fixed opening provider required. |
| 6-15 | Developing personal capability, early specialists, local projects, first strong skill identity. | Material and service availability remain seed/context driven. |
| 16-30 | Several mature skills, meaningful perks, regional travel, automation/magic/social/economic branches. | Not a mandatory mid-game gate. |
| 31-60 | Regional influence, advanced professions, larger infrastructure, deep exploration, leadership or specialist mastery. | Different players may reach this with very different world histories. |
| 61+ | Long-lived world-shaper, multi-domain mastery and civilisation/realm-scale influence. | Level remains broad recognition; real capability still comes from systems. |

# 4. Overall XP and Meaningful-Action Rewarding

Overall XP rewards **meaningful participation**, not raw button presses.

## 4.1 Valid XP Sources

| Source Family | Examples | Milestone Examples |
| --- | --- | --- |
| Gathering | Mining, chopping, harvesting, fishing, salvage. | New resource family discovered; difficult deposit safely exploited. |
| Production | Crafting, smithing, cooking, alchemy, enchanting, machine work. | First functional production chain; high-quality complex work. |
| Construction | Building, blueprint delivery, repair, infrastructure. | Functional project completed; settlement capability restored. |
| Automation | Designing, commissioning, diagnosing and maintaining systems. | Stable production network; major bottleneck solved. |
| Magic | Casting, ritual practice, rune work, magical infrastructure. | School milestone; difficult ritual or infrastructure success. |
| Exploration | Discoveries, mapping, route learning, ruins, ecology. | Major site, region or realm relationship discovered. |
| Combat/Defence | Valid combat, protection, rescue, defence preparation. | Major threat resolved; settlement defence outcome changed. |
| Economy | Trade, enterprise, logistics, contracts. | Difficult contract fulfilled; sustainable regional trade capability established. |
| Social | Negotiation, teaching, mediation, leadership and relationship-relevant actions. | Major peaceful resolution; long-term companion/settlement milestone. |
| Settlement | Supplying, repairing, planning, administering, restoring. | Settlement stage/capability milestone where the player materially contributed. |
| Travel/Transport | Meaningful traversal, navigation, hauling, riding, sailing. | New route completed; difficult expedition or voyage milestone. |
| Survival/Medicine | Fieldcraft, treatment, rescue, preparation, hazard management. | Severe exposure survived through valid preparation; life-saving treatment. |
| Quests/Events | Objectives and event contributions. | Major authored/systemic arc outcome. |

## 4.2 No-Effect XP Rule

The following should not award meaningful XP:

- repeatedly clicking an invalid action;
- mining an indestructible target;
- crafting and destroying the same zero-cost object in a closed exploit loop;
- issuing orders that are refused or never performed;
- walking into a wall;
- repeatedly opening UI panels;
- buying and selling the same good solely to farm progression where the economy records no meaningful service or risk;
- repeatedly injuring and healing an ally through an exploit loop;
- AFK machine operation where the player contributes no relevant progression action.

Automation output can contribute to **milestone progression** when the player designs, commissions, expands, repairs or meaningfully manages the system. Continuous unattended output should not passively level unrelated manual skills.

## 4.3 Milestone Weighting

Milestones should usually award more memorable progression than repetitive actions. This encourages players to build, explore, solve and integrate systems instead of optimising one low-risk action forever.

# 5. Skill System

Skills represent learned proficiency in recurring actions. They primarily grow through **validated use**, with secondary support from teaching, training, books, institutions, research and milestone awards where appropriate.

> **Skill Rule**
>
> Low skill should usually mean **less efficiency, less information, lower quality, higher cost, slower execution, narrower technique choice or greater recovery demand** rather than constant random failure. Hard failure should come from real constraints or specialist-system risk, not a generic dice penalty attached to every action.

## 5.1 Skill Ownership

Document 02 owns:

- skill identity and registry;
- skill XP and proficiency thresholds;
- perk eligibility from skill levels;
- training/teaching progression contracts;
- anti-abuse rules;
- progression modifiers exposed to action owners.

The action owner still owns:

- whether the action is valid;
- the action's base cost and physical result;
- resource transactions;
- damage, biology, price, relationship or movement outcomes;
- environmental and world-state requirements.

# 6. Canonical Skill Families and Global Skill Registry

Version 1.0 freezes the following top-level **global skill identities** for the production foundation. Specialist systems may register subskills, techniques or mastery tracks through the canonical registry, but should not create duplicate top-level skills without governance review.

Some systems generate multiple child mastery records. In particular, **Magic School Mastery** is a family: each approved magic school may have its own mastery skill while still using one global progression contract.

| Family | Skill | Primary Training | Typical Progression Benefits | Ownership Boundary |
| --- | --- | --- | --- | --- |
| Gathering | Mining | Mine stone, ore, crystal and deposits. | Harvest efficiency, hazard reading, prospecting techniques, tool handling. | Blocks/Resources own harvest truth. |
| Gathering | Woodcutting & Forestry | Fell, trim, process and manage trees/woodlands. | Efficiency, sustainable forestry techniques, material handling. | World/ecology own regeneration and tree state. |
| Gathering | Foraging | Gather wild plants, fungi, natural reagents and field resources. | Identification support, careful harvest, yield quality, safer handling. | World/ecology owns availability. |
| Food & Ecology | Farming | Plant, tend, harvest and manage cultivated systems. | Crop handling, soil interpretation, quality, efficiency, advanced techniques. | Farming/biology/world owners retain growth truth. |
| Food & Ecology | Fishing & Aquaculture | Catch, handle and manage aquatic food systems. | Gear control, selective catch, handling quality, stock interpretation. | Set 26M/ecology owns aquatic stock truth. |
| Production | Crafting | General hand/station fabrication and assembly. | Efficiency, waste reduction, quality opportunities, technique access. | Recipes own valid transformations. |
| Production | Smithing | Metal forging, repair and precision metalwork. | Quality, repair, specialist recipes, process control. | Recipes/items/resources own material truth. |
| Production | Construction | Voxel construction, staged building work and structural assembly. | Planning, staging, material estimation, repair/renovation proficiency. | Documents 19/20 own project/building truth. |
| Production | Engineering & Automation | Machines, logistics, diagnostics, networks and automation. | Diagnostics, tuning, maintenance, throughput-support modifiers. | Automation owns machine/network execution. |
| Production | Shipwrighting | Vessel survey, framing, sealing, repair, refit and commissioning work. | Quality, defect detection, efficient repair/refit, advanced technique eligibility. | Set 26H/F/I own vessel construction truth. |
| Magic & Knowledge | Alchemy | Reagents, potions, catalysts, preservation and controlled transformation. | Quality, stability, diagnosis, efficient processing. | Magic/Recipes/Medicine owners resolve effects. |
| Magic & Knowledge | Enchanting | Imbue gear, structures and systems with persistent magical effects. | Stability, compatibility, efficiency, advanced enchant patterns. | Magic owns enchant execution. |
| Magic & Knowledge | Runecraft | Create, interpret, tune and maintain rune systems. | Rune precision, diagnostic information, advanced patterns. | Magic owns rune truth. |
| Magic & Knowledge | Magic School Mastery | One generated mastery skill per approved magic school/family. | Control, efficiency, technique eligibility and mastery perks. | Magic registry owns schools/spells/mana. |
| Combat | Melee Combat | Meaningful use of melee weapons and close combat techniques. | Handling, technique options, stamina-efficiency modifiers, recovery. | Combat owns attacks/damage. |
| Combat | Ranged Combat | Bows, crossbows, thrown/ranged weapon families and aimed attacks. | Handling, aim support, reload/draw technique, specialised actions. | Combat owns hit/damage/projectile truth. |
| Combat | Defence | Blocking, parrying, shielding, armour use and defensive positioning. | Timing windows, guard technique, stamina efficiency, defensive options. | Combat owns defence resolution. |
| Survival & Movement | Athletics & Traversal | Running, climbing, vaulting, mantling, controlled falling and land traversal. | Efficiency, recovery, technique options, route assessment support. | Set 30 owns movement validity/physics. |
| Survival & Movement | Watermanship & Diving | Swimming, surf entry, towing, rescue and underwater work. | Control, task stability, recovery and hazard-reading support. | Set 26E owns aquatic action truth. |
| Survival & Movement | Navigation | Route planning, map/chart use, bearings, terrain reading and wayfinding. | Confidence interpretation, route options, planning efficiency. | Route/knowledge owners retain factual route truth. |
| Survival & Movement | Survival & Fieldcraft | Camps, shelter practice, hazard preparation, fire, expedition routines. | Preparation efficiency, equipment use, hazard information and recovery support. | Set 29 owns biology; world systems own hazards. |
| Survival & Movement | First Aid & Medicine | Assessment, first aid, treatment support and rehabilitation practice. | Treatment eligibility, quality support, diagnosis information. | Set 29G/29E/29F own treatment/injury/disease truth. |
| Survival & Movement | Naturalism | Observe ecosystems, creatures, signs, habitats and biological/environmental relationships. | Knowledge confidence, safer handling, research/identification options. | World/creature/ecology owners retain truth. |
| Animals & Transport | Animal Handling & Riding | Care, train, handle, ride and work with animals/mounts. | Control, safety, training technique, mount-handling modifiers. | Creature/Set30 owners retain animal/movement truth. |
| Animals & Transport | Driving & Hauling | Handcarts, wagons, carriages, freight handling and land transport operation. | Handling, loading practices, route planning support, wear reduction. | Set 30 owns transport physics/route execution. |
| Maritime | Seamanship | Lines, anchoring, mooring, rigging, deck work and watches. | Station effectiveness, handoff, response, wear support. | Set 26 owns vessel execution. |
| Social & Civilisation | Trading | Appraisal, market literacy, trade planning and commercial practice. | Information quality, negotiation input, contract/market insight. | Set 27 owns prices and financial outcomes. |
| Social & Civilisation | Diplomacy | Persuasion practice, negotiation, etiquette, mediation and formal interaction. | Approach quality, option eligibility, social-risk understanding. | Set 28 owns social resolution/relationships. |
| Social & Civilisation | Leadership | Command, coordination, teaching, delegation and expedition/settlement leadership. | Order capacity, coordination options, teaching/delegation perks. | Set 28 owns companion consent; settlements own jobs/authority. |
| Social & Civilisation | Stewardship | Settlement administration, public projects, logistics oversight and institutional management. | Planning information, policy option eligibility, administrative efficiency support. | Set 27 owns finance; 19/20 own settlement capabilities. |

## 6.1 Why Skills Are Broad but Not Vague

The list is deliberately broad enough to avoid hundreds of micro-skills, but specific enough that practice has meaning. A player should not gain Smithing from cooking, Leadership from passive companion presence or Navigation from merely opening a map.

Specialist **techniques** provide finer identity. Examples include:

- Mining -> deep prospecting, crystal extraction, controlled blasting;
- Construction -> foundations, bridge work, restoration, blueprint staging;
- Engineering -> power systems, logistics, mana networks, diagnostics;
- Navigation -> terrestrial wayfinding, charting, celestial/magical navigation;
- Seamanship -> rigging, helmsmanship support, damage-control stations;
- Leadership -> expedition command, guard command, teaching, delegation;
- Diplomacy -> mediation, formal etiquette, intimidation technique, negotiation approach;
- First Aid & Medicine -> wound care, stabilisation, rehabilitation support.

Techniques do not need separate XP bars unless later evidence proves that a dedicated skill produces better gameplay.

## 6.2 Specialist Skill Proposal Reconciliation

Later specialist sets proposed several domain-specific skill names before the global progression revision existed. Version 1.0 resolves those proposals into the canonical list rather than creating duplicate XP bars.

| Specialist Proposal | Production Mapping | Reason |
| --- | --- | --- |
| Watermanship | **Watermanship & Diving** | Preserved as the global aquatic personal-skill family consumed by 26E. |
| Diving | **Watermanship & Diving** with Diving techniques/perks | Keeps underwater expertise deep without duplicating the same physical practice across two bars. |
| Seamanship | **Seamanship** | Preserved as a distinct major maritime profession. |
| Navigation | **Navigation** | Shared across land, sea and realm route planning; specialist techniques may vary. |
| Shipwrighting | **Shipwrighting** | Preserved because vessel construction/repair is a substantial profession with its own action owner. |
| Maritime Engineering | **Engineering & Automation** maritime techniques | Avoids duplicating pumps, engines, mana drives and network expertise. |
| Fishing and Aquaculture | **Fishing & Aquaculture** | Preserved because it is both food-production and ecology-facing practice. |
| Marine Naturalism | **Naturalism** marine techniques | Ecology knowledge is one broader observational discipline. |
| Salvage and Recovery | **Shipwrighting / Construction / Mining / Engineering** salvage techniques according to action | Salvage is multi-domain work rather than one universal manual skill. |
| Naval Gunnery | **Ranged Combat** plus vessel/weapon technique requirements | Combat remains one action family; vessel systems supply station context. |
| Maritime Command | **Leadership + Seamanship** | Leadership owns command proficiency while Seamanship supplies maritime expertise. |
| Maritime Trade | **Trading** plus Navigation/Seamanship context | Set 27 remains the economy owner; no separate duplicate trade XP bar. |
| Diplomacy/Reputation | **Diplomacy** | Reputation is now external social/faction state, not a character skill. |
| Exploration/Survival | **Navigation + Survival & Fieldcraft + Naturalism** | Splits route knowledge, field preparation and ecology into clearer practice domains. |
| Combat | **Melee Combat / Ranged Combat / Defence** | Preserves meaningful weapon/defence practice without one catch-all combat bar. |
| Animal Handling/Beast Taming | **Animal Handling & Riding** | Creature/taming systems retain animal-state truth; progression owns handling proficiency. |

This mapping is a reconciliation decision, not a reduction in gameplay. Specialist systems may still expose rich technique trees, certificates, professions, licences, role tags and capability records beneath these skills.

# 7. Skill XP, Practice and Anti-Abuse

Skill XP is awarded when the player meaningfully performs or learns an action associated with that skill.

## 7.1 Valid Practice

Valid skill practice should normally satisfy several conditions:

- the action was valid;
- the action changed authoritative state or produced a meaningful evaluated result;
- the challenge, quantity, complexity or uncertainty was non-trivial for the player's current proficiency;
- the player actually participated in the relevant role;
- the same event has not already paid an unintended duplicate award;
- resource conservation and ownership remained valid.

## 7.2 Diminishing Practice Value

Repeated action remains allowed. Leyforge is a sandbox and players may enjoy dedicated practice. However, trivial repetition should gradually become less efficient than new complexity, difficult conditions, quality work, teaching or milestones.

Examples:

- mining hundreds of ordinary stone blocks may continue to train Mining slowly;
- discovering and safely extracting a new rare deposit gives a stronger award;
- repeatedly crafting an item that is immediately destroyed in a no-cost loop should saturate quickly;
- sailing the same safe harbour circuit can still train Seamanship, but a difficult storm-response milestone is more valuable;
- repeating a social line cannot farm Diplomacy if Set 28 reports no meaningful new social resolution.

## 7.3 Delegated Work

Delegated work does **not** grant manual skill mastery for work the player did not perform.

A player who assigns a companion to forge weapons may gain:

- Leadership or Stewardship practice if they meaningfully planned, supervised or solved the work;
- knowledge or recipe familiarity if a teaching/observation rule supports it;
- quest or overall milestone XP for the completed project.

They do not automatically gain Smithing proficiency equal to the worker.

# 8. Skill Levels, Proficiency Bands and Mastery

Exact XP curves are balance data. The production design uses **proficiency bands** so UI and specialist systems can reason about skill without depending on one numeric curve.

| Band | Meaning | Typical Effect |
| --- | --- | --- |
| Untrained | Little/no validated practice. | Basic actions remain possible where physically valid; advanced techniques are unavailable or inefficient. |
| Novice | Understands basic safe practice. | Improved feedback, basic technique options, reduced obvious waste. |
| Practised | Reliable ordinary practitioner. | Better efficiency, quality support, broader technique access. |
| Skilled | Professional-level competence. | Advanced techniques, stronger diagnostic information, meaningful specialisation. |
| Expert | High-end specialist. | Difficult work becomes reliable; complex options and strong perks become eligible. |
| Master | Deep domain mastery. | Top normal techniques, teaching authority where context permits, highly efficient valid execution. |
| Legendary | Long-term optional post-mastery recognition. | Prestige/rare perks/efficiency ceilings without breaking specialist hard rules. |

## 8.1 Numerical Levels

A numeric skill level may exist beneath the proficiency bands for XP curves and perk thresholds. The numeric scale is registry-driven and should not be treated as fiction by every system. Specialist interfaces should prefer:

- proficiency band;
- explicit perk/technique IDs;
- bounded modifier outputs;
- capability provider IDs;
- reason-coded eligibility.

This avoids hardcoding `if Mining >= 73` throughout unrelated systems.

## 8.2 Mastery Does Not Mean Omnipotence

Mastery means the player is extremely good **when the action is valid**. It does not eliminate:

- missing tools;
- insufficient resources;
- impossible terrain;
- legal restrictions;
- lack of permission;
- biological incapacity;
- environmental extremes;
- lack of evidence;
- missing magical prerequisites;
- unavailable settlement facilities;
- target consent boundaries;
- specialist-system hard limits.

# 9. Perk Architecture

Perks are the main player-controlled specialisation layer. They let two characters with similar skill practice emphasise different strengths without creating permanent classes.

Perks may:

- improve efficiency or quality within a valid action;
- reduce bounded resource, stamina, time or maintenance costs through the owning system;
- reveal additional diagnostic information;
- unlock techniques or alternative action approaches;
- increase progression modifiers such as Max Health/Stamina through approved interfaces;
- expand loadouts, preparation options or planning tools;
- improve teaching, leadership or delegation capacity;
- unlock specialist knowledge eligibility;
- improve recovery from mistakes without deleting consequences;
- create new capability offers when explicitly defined and physically supported.

Perks must not:

- create free physical resources;
- directly set prices;
- force social consent or trust;
- bypass authoritative damage/injury;
- teleport through invalid terrain;
- create a vessel/vehicle/mount that does not exist;
- reveal undiscovered exact world state without an information source;
- override ownership/permission without an explicit legal/social gameplay rule;
- silently change another system's persistent truth.

# 10. Perk Points, Eligibility and Acquisition

| Perk Tree Family | Purpose |
| --- | --- |
| Survival & Fieldcraft | Preparation, shelter, expedition routines, efficient equipment use, hazard-reading support. |
| Health & Recovery | Permanent biological modifier choices, recovery-support skills, treatment efficiency inputs. |
| Mining & Prospecting | Yield-support, tool preservation, prospecting information, difficult extraction techniques. |
| Forestry & Foraging | Efficient harvest, sustainable practices, rare resource recognition. |
| Farming & Food | Cultivation technique, quality handling, preservation and production support. |
| Crafting & Smithing | Quality, repair, substitution knowledge, process efficiency and advanced technique. |
| Construction & Architecture | Blueprint staging, estimation, repair, renovation and construction coordination. |
| Engineering & Automation | Diagnostics, maintenance, tuning, throughput support, network planning. |
| Magic | School-specific mastery, control, efficiency, loadout/ritual support through Magic interfaces. |
| Alchemy / Enchanting / Runecraft | Specialist magical production, stability, diagnosis and technique. |
| Combat | Weapon handling, defence technique, recovery, stamina-efficiency modifiers and tactical options. |
| Traversal | Climbing, gliding, route assessment, controlled movement efficiency without bypassing capability. |
| Animals & Land Transport | Riding, animal care, driving, hauling and route-operation support. |
| Maritime | Water safety, diving, seamanship, navigation, shipwright and maritime command specialisations. |
| Trade & Enterprise | Market information, appraisal, contract literacy, commercial planning; Set 27 keeps economic truth. |
| Diplomacy & Society | Negotiation approaches, etiquette information, mediation and social-risk interpretation. |
| Leadership & Stewardship | Teaching, companion/worker coordination, delegation, public-project and settlement planning. |
| Exploration & Naturalism | Mapping, site interpretation, ecology, ruins, observation and research support. |
| Forbidden / Conquest Paths | High-risk political, magical or coercive techniques that remain subject to law, consent and world consequences. |

## 10.1 Perk Point Sources

The primary general source is **overall level**. Skill-specific milestones may also grant or unlock skill-tree points where balance requires tighter domain progression.

Other sources may unlock **eligibility**, not necessarily free points:

- instructors and mentors;
- research projects;
- culture/faction institutions;
- ruins and recovered knowledge;
- settlement facilities;
- boss/event discoveries;
- realm knowledge;
- companion teaching;
- professional guilds or licences;
- magical schools.

The underlying source must exist in the generated world or be reachable through a valid fallback path. A progression menu cannot invent a missing mentor.

## 10.2 Perk Prerequisites

A perk may require combinations of:

- overall level;
- skill proficiency band;
- parent perk;
- learned technique/knowledge;
- capability access;
- specialist-system eligibility;
- completed research;
- faction/culture permission;
- settlement/institution capability.

Level-only requirements should be used sparingly.

# 11. Respec, Specialisation and Eventual Mastery

Specialisation matters **now**, but should not permanently lock a long-running sandbox character out of other playstyles.

## 11.1 Respec

Respec changes chosen perk allocation. It does not erase:

- practiced skill XP;
- discovered locations;
- learned facts;
- relationship history;
- legal history;
- contracts already completed or breached;
- world-state consequences;
- faction actions;
- settlement history;
- injuries or biological history;
- crafted/owned items;
- routes already discovered;
- completed story outcomes.

The *service* or fiction used for respec may involve a trainer, institution, magical process, time cost or economic cost. The relevant specialist systems own those transactions. Document 02 owns only the progression reset semantics.

## 11.2 Eventual Mastery

One character can eventually learn all normal skills and perks that remain available in their world/content configuration. Some mutually exclusive **world choices** remain mutually exclusive because the world changed, not because the progression tree permanently class-locked the player.

For example, betraying a faction may close its current training route. Another teacher, reconciliation path, research route or future world event may or may not restore access according to that content's rules.

# 12. No-Class and No-Traditional-Attribute Rule

Leyforge does not use a mandatory Strength / Dexterity / Intelligence / Wisdom / Charisma style core attribute system.

The player begins broadly equal in progression terms. Differences emerge through:

- actual biological profile where applicable;
- equipment and carried state;
- learned skills;
- perks;
- magic;
- knowledge;
- injuries/conditions;
- relationships and reputation;
- resources and infrastructure;
- institutions, titles and permissions;
- chosen risks and world history.

## 12.1 Why No Charisma Attribute

Social play is handled through Diplomacy/Leadership/Trading expertise, evidence, knowledge, relationships, culture, etiquette, perceived fairness, authority and the target's actual values. Set 28 explicitly prevents a generic social stat from overriding hard boundaries.

## 12.2 Why No Strength Attribute

Movement, carrying, combat and work already have physical equipment, biological and system-specific models. A universal Strength number would risk duplicating those truths. Progression may expose bounded modifiers where an owner accepts them.

# 13. Permanent Character Modifier Interface

Document 02 must expose progression benefits through typed modifiers rather than writing directly into specialist state.

| Interface | Consumer | Meaning |
| --- | --- | --- |
| ProgressionAdditiveHealth | Set 29 | Permanent additive Max Health contribution selected/earned through progression. Set 29 resolves final Max Health. |
| ProgressionAdditiveStamina | Set 29 | Permanent additive Max Stamina contribution. Set 29 resolves final state. |
| StaminaEfficiencyModifier | Set 29 / action owner | Progression modifier accepted into biological cost composition; does not define base action cost. |
| StaminaRecoveryModifier | Set 29 | Bounded progression input to recovery composition. |
| BiologicalRecoveryModifier | Set 29 | Bounded general recovery progression input where permitted. |
| FatigueResistanceModifier | Set 29 | Bounded modifier consumed by Fatigue system. |
| TreatmentSkillModifier | Set 29G | Skill/perk input for valid treatment; does not invent diagnosis or cure. |
| MovementSkillModifier | Set 30 / 26E | Proficiency/perk support for valid traversal action; cannot grant absent movement mode. |
| CombatSkillModifier | Document 16 | Technique/efficiency input; Combat owns damage and action resolution. |
| MagicMasteryModifier | Document 09 | School/perk input; Magic owns mana/spell/ritual truth. |
| EconomicExpertiseInput | Set 27 | Trading/stewardship expertise input; Economy owns quote/wage/contract results. |
| SocialSkillInput | Set 28 | Diplomacy/leadership approach input; Set 28 owns acceptance/relationship consequences. |
| LeadershipCapacityInput | Set 28 / settlement owners | Eligibility/coordination input; does not create authority or loyalty. |
| CraftQualityModifier | Recipe/item action owner | Progression input to valid craft quality calculation where recipe permits it. |
| KnowledgeEligibility | Knowledge/owner systems | Allows progression to consume learned evidence; never fabricates facts. |

## 13.1 Modifier Design Rules

Every permanent modifier must be:

- source-labelled;
- bounded;
- versioned;
- explainable;
- save-safe;
- migratable;
- composed once by the owning specialist system;
- removable/recomputable when a perk is respecced.

Document 02 should never precompute a final Health, Stamina, price, relationship or movement result that belongs elsewhere.

# 14. Health, Stamina, Fatigue and Biological Progression

The original Document 02 treated Health and Stamina as derived player resources and allowed progression to improve them. That concept remains valid, but Set 29 now owns the biological implementation.

## 14.1 Production Rule

Progression may grant:

- additive Max Health bonuses;
- additive Max Stamina bonuses;
- Stamina efficiency modifiers;
- Stamina recovery modifiers;
- biological recovery modifiers;
- Fatigue-resistance modifiers;
- treatment/fieldcraft proficiency inputs.

Set 29 applies those modifiers and owns:

- current/max biological state;
- Stamina transaction and regeneration;
- Fatigue;
- injury/disease/poison state;
- hunger, thirst, nutrition and exposure;
- treatment outcome composition.

## 14.2 No Automatic Level Inflation

There is **no** universal rule such as `+5 Health every level`. Permanent biological growth should come from explicit progression choices, milestone rewards or approved perk families so that biological balance remains readable and bounded.

## 14.3 Survival Skill Is Not Immunity

A master survivalist may:

- prepare better;
- interpret hazards more accurately;
- use equipment more efficiently;
- choose better shelter/food/treatment options;
- recover from mistakes more effectively within owner rules.

They do not become immune to starvation, extreme cold, disease, drowning or severe injury unless an explicit specialist-system effect provides that protection.

# 15. Mana and Magical Progression

Magic progression remains a major character path, but Document 09 owns magic-system truth.

Document 02 owns:

- use-based Magic School Mastery progression;
- magic-related perk acquisition;
- progression prerequisites for techniques;
- general learning/training rules;
- mastery milestones;
- integration with overall level.

Magic owns:

- personal mana state and regeneration;
- spell definitions and costs;
- runes, rituals, wards and magical infrastructure;
- school definitions;
- corruption/instability where applicable;
- actual casting and magical outcomes.

> **Magic Progression Rule**
>
> Overall level does not automatically grant spells or mana. The player gains magical capability through valid discovery, instruction, research, practice, equipment and magical infrastructure.

## 15.1 School Mastery

Each approved magic school may register a child mastery skill using the shared skill contract. This allows a player to be an expert in one school without forcing a class lock or preventing eventual study of others.

# 16. Knowledge, Research, Discovery and Teaching

Knowledge is a progression layer, but facts about the world remain owned by the systems that produce or track those facts.

Progression distinguishes **learning access** from **truth ownership**.

A player may learn through:

- direct observation;
- successful practice;
- NPC teaching;
- books, scrolls, records and manuals;
- ruins and inscriptions;
- research stations;
- dismantling or reverse engineering;
- experimentation;
- faction/culture institutions;
- maps and charts;
- companion expertise;
- quest/event outcomes;
- realm exploration.

## 16.1 Knowledge States

Where compatible with the owning knowledge system, progression can consume states such as:

- unknown;
- hinted;
- observed;
- recorded;
- taught;
- researched;
- mastered.

Confidence and truth must remain separate. A damaged chart can be learned as a source without becoming objectively correct.

## 16.2 Teaching

Teaching can accelerate progression when:

- the teacher genuinely possesses the relevant capability/knowledge;
- the learner has access and willingness;
- time/location/equipment requirements are satisfied;
- the social/economic arrangement is valid;
- the teaching action is not an instant replacement for all practical experience.

A master instructor may unlock techniques or give a large skill-learning bonus. They do not automatically transfer full mastery.

# 17. Recipes, Techniques and Unlock Eligibility

Recipes and techniques are not awarded exclusively by level.

Valid unlock routes include:

- first successful discovery/use;
- research;
- teachers;
- books/manuals;
- faction or culture access;
- settlement facilities;
- experimentation;
- dismantling/reverse engineering;
- quest/event reward;
- boss/site/realm discovery;
- trade or purchased knowledge;
- skill/perk threshold when the recipe explicitly uses one.

## 17.1 Known Does Not Mean Buildable

Knowing a recipe does not mean the player currently has:

- materials;
- tools;
- station capability;
- power/mana;
- environmental conditions;
- permission;
- specialist help;
- safe site;
- valid blueprint.

Progression UI must distinguish **known**, **eligible**, **available here**, and **currently executable**.

# 18. Tools, Materials, Equipment and Physical Capability

Material and equipment progression remains one of the most readable early-game anchors, but the production foundation no longer treats the old v0.1 material ladder as the only possible hard sequence.

Documents 03-06 will be replaced/reconciled into production registries. Document 02 therefore defines the progression rule rather than freezing every material order.

## 18.1 Physical Provider Rule

A tool, item, block, machine, vehicle, vessel, facility or magical object can provide one or more registered capabilities.

Examples:

- harvest a hardness band;
- process metal;
- refine magical material;
- preserve food;
- transport medium freight;
- cross a river;
- climb a vertical route;
- provide shelter;
- treat a wound;
- operate a port service;
- stabilise a realm portal.

Content selection can vary by seed and culture so long as the capability graph remains reachable.

## 18.2 Older Materials Remain Useful

Progression should not turn earlier materials into trash. They remain relevant through:

- construction;
- repair;
- maintenance;
- consumable components;
- cultural variants;
- automation parts;
- settlement needs;
- trade;
- decoration;
- specialist recipes;
- replacement/field repair where advanced materials are scarce.

# 19. Capability-Based Progression and Seed Reachability

Set 25 replaces fixed named progression guarantees with **capability requirements, provider groups, suitability rules and deterministic fallbacks**.

> **Reachability Rule**
>
> A normal production seed must not become unwinnable or progression-blocked because one named village, ore, teacher, ruin, creature, item or route failed to generate.

## 19.1 Valid Fallback Families

A required capability may be reachable through:

- alternate local provider;
- trade/import;
- travelling specialist;
- salvage;
- research/experimentation;
- faction access;
- migration or settlement growth;
- alternate route;
- alternate technology or magic provider;
- deterministic generation repair before play;
- explicit world-creation rejection only when no valid repair exists.

Fallbacks preserve **capability**, not the retired POC layout.

## 19.2 Explainable Gates

When progression is blocked, the player-facing reason should say what is missing:

- skill/proficiency;
- knowledge;
- tool/equipment;
- facility;
- material;
- route/access;
- permission;
- relationship/authority;
- environmental condition;
- biological readiness;
- world setting;
- capability provider.

"Requires Level 30" should be the exception, not the universal answer.

# 20. Gathering, Production and Craft Progression

Gathering and production progression should move through four broad experiences:

1. **manual familiarity** - basic tools, common resources, simple hand/station work;
2. **specialist technique** - better tools, stations, knowledge and quality control;
3. **system integration** - automation, NPC labour, logistics, storage and settlement demand;
4. **advanced/extraordinary production** - rare materials, magical processes, realm resources and civilisation-scale industry.

The player may specialise deeply in one production field without needing to personally master every input. Trade, NPC specialists and automation allow civilisation to substitute for personal expertise.

This is intentional. Leyforge progression should support both:

- "I personally mastered Smithing and forged this"; and
- "I built a settlement economy where a master smith produces it for me."

The latter is civilisation progression, not cheating around character progression.

# 21. Automation and Engineering Progression

Automation progression begins as practical machinery and scales into large mechanical, magical and hybrid infrastructure.

Document 02 owns Engineering & Automation skill/perk growth. Automation owns:

- machine definitions;
- networks;
- ports;
- power/mana requirements;
- item flow;
- throughput;
- faults;
- authoritative transactions.

Progression may improve:

- diagnostic information;
- maintenance efficiency;
- configuration options;
- safe tuning limits;
- repair efficiency;
- design/commissioning techniques;
- ability to understand more complex networks.

It may not create output without input or multiply resources beyond recipe/system rules.

## 21.1 Automation Is Not Passive Character Grinding

A machine can run for days because the world simulation supports it. That does not mean the player's Mining or Smithing skill should rise continuously while offline. Character progression comes from design, commissioning, maintenance, diagnosis, expansion and meaningful milestones.

# 22. Building, Construction and Settlement-Capability Progression

Construction progression connects player creativity with functional civilisation systems.

Document 19 owns settlement planning/player blueprints. Document 20 owns universal building/service capability. Document 02 owns Construction skill/perks and progression-facing access.

Progression can improve:

- blueprint understanding;
- material estimation;
- stage planning;
- scaffolding and work efficiency;
- repair/renovation technique;
- complex construction eligibility;
- teaching/supervision of building work.

It must not cause a decorative shell to become a functioning service if Document 20's activation contract is not met.

## 22.1 Settlement Growth Is Not Player Level

A settlement's stage and capabilities are world state, not an extension of the player's level. A low-level player can encounter a city. A high-level player can live alone in the wilderness.

Player progression may influence what they can contribute, understand, lead or propose, but settlements grow according to their own people, resources, services, safety, infrastructure, history and project rules.

# 23. Economy, Trading and Enterprise Progression

Trading remains a full progression path, now reconciled with Set 27.

Document 02 owns:

- Trading skill XP and perks;
- commercial-literacy progression;
- progression milestones for legitimate commerce;
- Stewardship/Leadership progression hooks;
- economic career achievements.

Set 27 owns:

- price formation;
- market stock and demand;
- wages;
- business economics;
- contracts and breach;
- currency/barter valuation;
- debt, banking and insurance;
- taxation, tariffs and public finance;
- trade-route economics.

## 23.1 Trading Skill Benefits

Trading progression may improve:

- appraisal information;
- interpretation of supply/demand trends;
- awareness of contract risks;
- negotiation approach inputs;
- detection of unusual terms;
- planning tools;
- merchant/enterprise technique eligibility.

It does **not** say "10 Trading = 10% cheaper everywhere." Final prices remain local economic outcomes.

## 23.2 Economic Milestone XP

Good economic progression rewards solving real problems:

- supplying a shortage;
- establishing a sustainable route;
- fulfilling a difficult contract;
- creating a functioning enterprise;
- restoring a market after disruption;
- financing or administering a legitimate project;
- understanding and navigating tariffs/law.

Buying and reselling to oneself through an exploit loop is not meaningful progress.

# 24. Dialogue, Diplomacy, Reputation and Social Progression

Diplomacy and Leadership remain progression paths, but social truth belongs to Set 28 and related faction systems.

## 24.1 No Universal Reputation XP Bar

The original foundation used individual, village and faction reputation as progression layers. Production now distinguishes several different truths:

- personal relationships;
- social reputation/shared expectations;
- faction standing;
- legal standing;
- economic standing/contract history;
- settlement authority/role;
- player skill progression.

Document 02 must not collapse these into one universal `Reputation` stat.

## 24.2 Diplomacy Skill

Diplomacy progression can improve:

- understanding of etiquette/context;
- access to sophisticated approaches;
- ability to structure arguments and offers;
- mediation technique;
- social-risk interpretation;
- ability to notice known leverage or contradictions.

Set 28 still decides whether an NPC accepts, refuses, becomes offended, trusts the player or changes a relationship.

## 24.3 Evidence Can Beat Skill

A lower-skill player with strong evidence, legitimate authority and fair terms may outperform a master diplomat making an impossible request. This preserves world truth and player reasoning.

# 25. Leadership, Companions and Delegation Progression

Leadership progression supports companions, expeditions, workers, guards, settlement coordination and teaching without turning named NPCs into level-scaled inventory slots.

Document 02 may use Leadership perks for:

- additional command/coordination tools;
- clearer delegation information;
- teaching efficiency;
- expedition planning;
- reserve/formation management interfaces;
- handling more complex assignments;
- reducing avoidable coordination overhead;
- unlocking leadership techniques.

Set 28 owns:

- whether a person agrees to accompany the player;
- companion agreement/status;
- refusal, loyalty and autonomy;
- social consequences;
- delegation lifecycle where assigned.

## 25.1 No Automatic Follower Unlock

A perk can make the player **eligible** to manage more companions or use advanced commands. It cannot force an NPC to join. A valid companion still needs a relationship, contract, faction assignment, creature bond, magical control rule or other legitimate provider.

## 25.2 No Companion Level Scaling by Default

Companions do not automatically scale to the player's level. Their competence comes from their own identity, skills, equipment, training, health and experience.

# 26. Survival, Fieldcraft, Medicine and Biological Knowledge

Survival progression is now divided cleanly between **player expertise** and **biological state**.

Document 02 owns Survival & Fieldcraft, First Aid & Medicine and Naturalism progression. Set 29 owns actual biological outcomes.

Progression may improve:

- shelter/preparation choices;
- hazard-reading information;
- treatment technique eligibility;
- diagnosis support when evidence permits;
- use of food/medicine/equipment;
- expedition logistics;
- recovery-support modifiers;
- biological permanent modifiers through typed interfaces.

Progression does not own:

- hunger/thirst/nutrition equations;
- temperature/wetness exposure;
- sleep debt;
- Injury;
- disease/infection/poison;
- Health/Stamina/Fatigue transactions;
- final treatment outcomes.

## 26.1 Training Through Harm Is Controlled

Players should not be incentivised to deliberately starve, poison, freeze or injure themselves repeatedly to grind progression. Survival/medical XP should favour successful preparation, treatment, rescue, diagnosis and meaningful recovery over self-harm exploit loops.

# 27. Movement, Traversal and Land-Transport Progression

Movement progression is capability-aware and specialist-owned.

Document 02 owns progression for:

- Athletics & Traversal;
- Navigation;
- Animal Handling & Riding;
- Driving & Hauling;
- related perk trees.

Set 30 owns:

- movement modes;
- route/path feasibility;
- clearance;
- movement physics;
- terrestrial mounts/vehicles;
- pathfinding and navigation execution;
- long-distance travel execution.

## 27.1 Skill Cannot Grant Missing Movement Mode

A master climber still needs a climbable surface/route or valid climbing capability. A master rider needs a mount. A master driver needs a vehicle and traversable route.

Perks may:

- improve efficiency;
- widen valid technique tolerances where Set 30 explicitly allows;
- reduce recovery overhead;
- improve route assessment;
- unlock valid traversal actions;
- improve handling.

They may not bypass a closed gate, absent bridge, impassable geometry or missing vehicle by themselves.

## 27.2 Route Knowledge

Navigation progression may improve how the player interprets and plans with known route information. It must not reveal undiscovered exact routes or locations without a legitimate information source.

# 28. Maritime, Diving, Vessel and Port Progression

Set 26 established a dedicated maritime progression layer. Version 1.0 integrates it into the global progression system instead of leaving it as an isolated expansion tree.

The global skills used by maritime systems include:

- Watermanship & Diving;
- Navigation;
- Seamanship;
- Shipwrighting;
- Engineering & Automation;
- Fishing & Aquaculture;
- Naturalism;
- Trading;
- Leadership;
- combat skills.

## 28.1 Maritime Capability Bands

Maritime capability bands are readability labels, not a single character level:

| Band | Player-Facing Capability | Typical Providers |
| --- | --- | --- |
| M0 - Shore Readiness | Read basic water danger, wade/swim where valid, use simple flotation/rescue. | Aquatic movement capability, basic gear, local knowledge. |
| M1 - Littoral Work | Fish, dive briefly, operate small craft, work near shore. | Basic craft, tools, Watermanship/Diving, landing access. |
| M2 - Coastal Operations | Operate more capable small vessels, navigate coasts, handle cargo/crew routines. | Vessel, Seamanship, Navigation, supplies, local routes. |
| M3 - Bluewater Capability | Plan and survive multi-day voyages and significant weather. | Seaworthy vessel, crew, navigation, reserves, maintenance. |
| M4 - Maritime Industry | Build/refit larger vessels, operate ports/shipyards/fleets. | Facilities, specialists, materials, law, economy, logistics. |
| M5 - Regional Naval/Commercial Power | Coordinate fleets, major trade, defence or maritime institutions. | Economy, politics, ports, crews, vessels, command. |
| M6 - Extraordinary Maritime | Operate in abyssal, corrupted, frozen, stormbound or realm-linked waters. | Specialised gear/vessels, magic, knowledge and stabilisation. |

A player may reach these in different orders. A skilled diver can access an extraordinary site through faction support without owning a shipyard. A wealthy trader can own a bluewater vessel while personally being only a modest sailor.

# 29. Combat, Defence and Adventure Progression

Combat progression rewards skill and preparation without turning enemy difficulty into pure level arithmetic.

Document 02 owns Melee Combat, Ranged Combat and Defence progression. Document 16 owns combat execution.

Progression can improve:

- weapon/defence technique availability;
- handling efficiency;
- stamina-related progression modifiers through Set 29;
- tactical information;
- equipment proficiency;
- recovery from mistakes within Combat rules;
- training/teaching access.

It does not directly own:

- weapon damage;
- armour resolution;
- hit detection;
- status effects;
- injury;
- enemy AI;
- raid outcomes.

## 29.1 No Global Enemy Auto-Scaling Requirement

Leyforge should preserve dangerous and safe places. The entire world does not need to scale numerically to the player's level. Difficulty can emerge from region, ecology, faction, world settings, equipment, preparation and event state.

## 29.2 Peaceful Progression Remains Complete

Players using peaceful/low-threat settings must retain progression through building, trade, research, exploration, settlement growth, magic, maritime activity, ecology, social play and automation.

# 30. Exploration, Navigation and World-Knowledge Progression

Exploration progression is about **learning the world and becoming better at reaching, reading and surviving it**, not filling a percentage bar.

Progression rewards may include:

- overall XP for meaningful discoveries;
- Navigation/Naturalism/Survival skill XP;
- map/chart annotations;
- research opportunities;
- route-planning tools;
- site/creature/resource knowledge;
- new capability-provider relationships;
- faction/culture contacts;
- recipes, techniques and lore.

## 30.1 Discovery Is Seed-Specific

A progression milestone should reference what this world actually generated. It should not assume every player discovers the same first ruin, cave, settlement or biome.

## 30.2 Knowledge Is Not Omniscience

A perk may show stronger interpretation of known evidence. It does not reveal every hidden dungeon, ore body or hostile patrol on the map.

# 31. Faction, Law, Crime, Conquest and Political Progression

The player may progress through lawful, neutral, criminal, exploitative, conquest or restoration paths. Document 02 provides progression hooks but does not own political/legal truth.

Relevant progression can include:

- Diplomacy;
- Leadership;
- Trading;
- Stewardship;
- combat skills;
- knowledge of law/custom;
- faction-specific training access;
- titles/roles exposed by owning systems;
- forbidden or conquest perk branches.

## 31.1 Consequences Are Not Perks

A perk can improve a coercive or underworld technique. It cannot erase:

- witnesses;
- grievances;
- law;
- faction response;
- market consequences;
- companion refusal;
- biological harm;
- war state.

## 31.2 No Biological Morality

Culture/faction hostility is never treated as an ancestry-wide progression rule. Political access and conflict come from faction, culture, history, law and current world state.

# 32. Realm and Inter-Realm Progression

Realms are persistent worlds with their own hazards, resources, societies and infrastructure. Realm progression therefore combines:

- route/portal access;
- stabilisation capability;
- knowledge;
- environmental preparation;
- social/political access;
- tools/gear;
- magic;
- transport/logistics;
- settlement infrastructure;
- specialist skills.

## 32.1 No One-Level Realm Gate

A realm should not normally be "Level 40 required." The real question is whether the player has the capabilities needed to access and survive the specific route and destination.

## 32.2 Realm Materials Do Not Obsolete the Overworld

Advanced realm materials should extend production, magic and civilisation without making all earlier resources irrelevant.

# 33. Death, Failure, Recovery and Progression Protection

The original decision remains: normal player death does **not** remove character levels or skill mastery by default.

Failure should create consequences through the owning system:

- lost/dropped inventory where configured;
- injury;
- damaged equipment;
- failed/expired opportunity;
- contract breach;
- relationship consequence;
- settlement damage;
- route loss;
- world event outcome;
- resource/time cost.

## 33.1 Progression Loss

Permanent level/skill loss is not a default punishment. Optional high-difficulty modes may introduce stronger consequences only through explicit world settings and clear player consent.

## 33.2 Resilience Without Erasure

Progression may provide recovery perks, but should not make failure meaningless. A veteran can be better prepared and recover faster while still respecting the consequence system.

# 34. Multiplayer and Shared Progression

Progression must support solo as the complete baseline and allow world settings for multiplayer sharing.

## 34.1 Default Principles

- each player normally owns their own character level, skills and perks;
- world discoveries and settlement/faction state may be shared or scoped by their owning systems;
- recipe/knowledge sharing is a world/server policy and knowledge-owner concern;
- group achievements may award milestone XP to valid contributors;
- proximity alone should not grant full manual skill XP;
- contribution must be authoritative and reason-coded;
- one player cannot respec another player;
- client-reported XP is never authoritative.

## 34.2 Cooperative Specialisation

Multiplayer can make specialisation convenient but never mandatory. A solo player can eventually learn everything. A group may naturally divide into smith, navigator, mage, builder, trader and defender roles for efficiency.

# 35. NPC and Companion Development Hooks

Although this document is player-focused, companion and NPC systems need a compatible progression interface.

A companion may expose:

- existing skill/proficiency profile;
- participation history;
- training sessions;
- learned techniques;
- profession expertise;
- equipment capability;
- injuries/biological limitations;
- teaching capability.

Document 02 does not require every NPC to use the exact player XP UI. Distant NPC progression may use bounded summaries so long as it preserves believable identity and does not create impossible expertise.

## 35.1 No Player-Level Mirroring

NPCs and companions do not automatically copy player level. A veteran blacksmith can be more skilled than a new player. A newly recruited villager does not become a master swordsman because the player is Level 80.

## 35.2 Teaching as Relationship/Service

Whether an NPC is willing/allowed/available to teach is owned by social, economy, faction and schedule systems. Document 02 owns the progression effect once valid teaching occurs.

# 36. UI, Feedback, Accessibility and Explainability

Progression UI must answer four questions:

1. **What improved?**
2. **Why did it improve?**
3. **What does that improvement actually affect?**
4. **What is still blocking the action?**

## 36.1 Required Views

The production UI should support:

- overall level and XP;
- skill list and proficiency bands;
- perk trees;
- unlocked techniques;
- known/learnable progression sources;
- progression modifier summaries;
- capability blockers;
- respec preview;
- recent progression history;
- accessibility-safe explanation of locked options.

## 36.2 Avoid False Precision

Normal UI does not need to show every hidden multiplier. It should show meaningful causes such as:

- "Requires a suitable forge";
- "You know the process but lack the material";
- "Route is not passable by wagon";
- "Companion is unwilling to accept this order";
- "Too exhausted for this action";
- "Market price is high due to shortage";
- "Advanced treatment requires a skilled provider."

## 36.3 Accessibility

Progression information must remain readable with scalable text, non-colour cues, controller navigation, screen-reader-ready labels where supported and configurable tutorial/guidance density.

# 37. Difficulty, World Settings and Progression Scaling

World settings may alter the **pace** or **pressure** around progression without silently changing ownership rules.

Possible settings include:

- overall XP rate;
- skill XP rate;
- perk point rate;
- tutorial/guidance intensity;
- survival pressure;
- threat difficulty;
- item-loss rules;
- research speed;
- economy complexity;
- simulation depth;
- spoilage/exposure settings;
- accessibility assistance.

## 37.1 Difficulty Does Not Rewrite Capability Truth

Reducing difficulty may make an action more forgiving. It should not normally turn an absent boat into a boat, a closed legal border into an open one or a nonexistent recipe into a known recipe unless the setting explicitly changes that system.

## 37.2 Low-End Hardware

Simulation/performance profiles must not secretly alter character progression truth. Reduced simulation fidelity can batch work, but XP, inventories, relationships and milestones must reconcile deterministically according to authoritative state.

# 38. Anti-Grind, Anti-Exploit and AFK Rules

Leyforge allows grinding but should not reward meaningless exploit loops more than actual play.

## 38.1 Core Anti-Exploit Rules

- no XP for invalid/no-effect actions;
- repeated trivial actions use saturation/diminishing value;
- no duplicate XP from the same committed event unless explicitly repeatable;
- no manual skill XP from delegated/automated work not personally performed;
- no infinite buy/sell progression loop;
- no self-created injury/healing farm as the optimal medicine progression path;
- no movement XP from walking against obstruction;
- no social XP from repeatedly selecting an exhausted dialogue option;
- no combat XP from harmless target loops where the combat owner flags exploit conditions;
- no resource duplication through progression rewards;
- no client-authoritative progression commits.

## 38.2 Positive Alternative

Instead of only nerfing repetition, progression should actively reward:

- first-time complexity;
- quality work;
- difficult conditions;
- teaching/learning;
- integrated systems;
- expeditions;
- discoveries;
- rescue and recovery;
- meaningful contracts;
- settlement/world milestones.

# 39. POC Retirement and Preservation Doctrine

The fixed Forest Hamlet progression chain is Archived Validation. Production does not guarantee:

- Forest Hamlet;
- one fixed village reputation sequence;
- one watchtower quest;
- one goblin raid;
- one mana ruin;
- one exact tool/material chain;
- one first teacher;
- one first realm;
- one fixed progression order.

The following progression mechanics **survive**:

- starting with broad low capability and growing through practice;
- tool/material progression;
- skills and perks;
- knowledge/research;
- settlement contribution;
- automation progression;
- practical magic progression;
- defence preparation changing outcomes;
- real resource deliveries;
- reputation/relationship/faction consequences under their current owners;
- staged construction;
- persistent aftermath;
- exploration discovery;
- capability-based access.

> **POC Conversion Rule**
>
> "Deliver iron to Forest Hamlet to unlock the watchtower before the goblin raid" becomes "Generated settlements can expose valid projects and threats based on actual needs, knowledge, resources and local conditions. Player contribution can advance the relevant skills, relationships, projects and overall progression without requiring a fixed settlement or sequence."

# 40. Progression Reachability and Production Validation

Progression is not production-ready until automated and manual validation can prove that generated worlds support viable capability growth.

## 40.1 Required Validation Questions

For representative seeds and content-pack combinations:

- can the player obtain basic survival capability without a fixed POC provider?
- can they reach at least one valid material/tool progression path?
- can knowledge/research providers be found or substituted?
- can settlements/world content expose multiple valid progression hooks?
- can movement routes reach required provider categories?
- can economy/trade substitute for some locally absent resources?
- can maritime starts/regions expose valid water capability paths where relevant?
- can realm access avoid one fixed portal requirement?
- can a peaceful world still progress?
- can a hostile/high-difficulty world still avoid hard deadlocks?
- do all perk modifiers resolve through their owning specialist interfaces?
- do migrations preserve level, skill XP, perk choices and permanent modifiers?

## 40.2 Reachability Failure

If a generated world lacks a required progression capability, the system should:

1. try an approved equivalent provider;
2. try a valid relationship/fallback route;
3. perform deterministic pre-play repair if allowed;
4. reject world creation with a clear validation reason only if no safe repair exists.

It must **not** recreate the retired POC valley as a hidden fallback.

# 41. Cross-System Ownership and Interface Map

| Source | Owns | Progression Relationship |
| --- | --- | --- |
| 00 | Vision | Defines the fantasy and cross-system promise; progression consumes vision. |
| 01 | Gameplay Loop | Defines when progression appears and how it feeds loops. |
| 02 | Player Progression | Owns overall level, skill/perk acquisition, mastery, progression modifiers and global progression structure. |
| 03-06 | Blocks/Items/Recipes/Resources | Own physical definitions, recipes and material/resource truth; expose progression capability providers. |
| 07 | NPC Village | Own persistent NPC/settlement person/job state; progression consumes opportunities and exposes training modifiers. |
| 08 | Automation | Own machine/logistics execution; consumes Engineering progression inputs. |
| 09 | Magic | Own mana/spells/runes/rituals; consumes magic mastery/perk inputs. |
| 10 | Creatures | Own creature ecology/AI; exposes training/discovery/combat contexts. |
| 11-14 | World/Structures/Cultures/Realms | Own world opportunities and provider relationships; progression consumes access/discovery. |
| 15 | Quests/Events | Own objective/event truth; may award validated progression milestones. |
| 16 | Combat | Own combat actions/damage/defence; consumes combat skill/perk inputs. |
| 17 | UI/UX | Own presentation; consumes progression view models/reason codes. |
| 19-20 | Settlements/Buildings | Own settlement growth, blueprints, services/projects; expose progression contexts/capabilities. |
| 21-23 | Forge | Own content authoring/presentation tooling; not character progression. |
| 24 | Atlas | Own generated content relationships/world topology used by progression discovery. |
| 25 | Production Governance | Own registry/capability/reachability/validation contracts. |
| 26 | Maritime | Own aquatic/vessel/port/naval gameplay; consumes global progression skills. |
| 27 | Economy | Own prices, wages, contracts, finance; consumes Trading/Stewardship expertise. |
| 28 | Social | Own relationships, persuasion, companions, delegation; consumes Diplomacy/Leadership progression. |
| 29 | Biology | Own Health/Stamina/Fatigue/survival state; consumes progression biological modifiers. |
| 30 | Movement | Own terrestrial traversal/routes/transport; consumes movement/handling progression inputs. |

# 42. Balancing Principles

1. **Sandbox before treadmill.** Progression supports play; it does not become the only reason to act.
2. **Meaningful practice over spam.** Skill grows from valid use and complexity.
3. **Multiple paths.** Important capabilities should rarely depend on one named provider.
4. **Low skill is playable.** It usually means less efficiency/options, not constant failure.
5. **Perks create identity.** They should feel useful without deleting hard system rules.
6. **Eventual mastery is allowed.** Specialisation is temporary/current identity, not permanent class lockout.
7. **Physical world remains relevant.** Levels do not replace tools, materials, routes, facilities or transport.
8. **Knowledge matters.** Learning and evidence can open options that raw level cannot.
9. **Civilisation is progression.** Institutions and specialists provide capabilities beyond personal crafting.
10. **Older resources remain useful.** Progression expands the economy rather than invalidating it.
11. **Consequences survive progression.** High skill does not erase law, trust, injury or world history.
12. **No hidden ownership collisions.** Final state is always composed by the specialist owner.
13. **Explainability.** The player can understand what improved and what still blocks them.
14. **Seed independence.** Progression reachability is validated across generated worlds.
15. **Solo completeness.** No core progression path requires another human player.

# 43. Example Production Progression Paths

These are examples, not prescribed campaigns.

## 43.1 Wilderness Builder -> Settlement Architect

1. Gather local wood/stone and learn basic Crafting/Construction through use.
2. Discover a generated settlement or begin a personal build.
3. Learn better construction techniques from practice, books or builders.
4. Create reusable blueprints and participate in staged projects.
5. Build logistics/automation support.
6. Develop Leadership/Stewardship to coordinate larger projects.
7. Found or reshape settlements through Documents 19/20 systems.
8. Eventually coordinate district/megaproject work while still needing real materials, workers, routes and services.

## 43.2 Miner -> Mage-Engineer

1. Practice Mining and discover unusual resource evidence.
2. Obtain magical knowledge through a valid generated source.
3. Develop Runecraft/Magic School Mastery.
4. Learn Engineering & Automation and build resource-conserving machines.
5. Integrate mana infrastructure through Magic/Automation systems.
6. Develop advanced material capability through research/trade/realm access.
7. Build civilisation-scale magical production without the level number creating any resources.

## 43.3 Trader -> Regional Economic Power

1. Learn Trading through real market interactions and contracts.
2. Use Navigation/Driving or hire transport providers.
3. Understand shortages and establish reliable routes.
4. Build social/faction relationships and contract history.
5. Develop Stewardship/Leadership for enterprises or public projects.
6. Use Set 27 systems for finance, labour, tax and regional trade.
7. Become economically influential without receiving a universal "merchant discount" divorced from local markets.

## 43.4 Explorer -> Maritime Navigator

1. Develop Survival, Navigation and Watermanship through real travel.
2. Learn local shoreline/water capability.
3. Work with or build small craft.
4. Develop Seamanship and vessel knowledge.
5. Complete coastal voyages and learn charts/weather/port systems.
6. Reach bluewater capability with crew, supplies and vessel support.
7. Explore extraordinary waters/realms through specialised equipment and knowledge.

## 43.5 Diplomat -> Companion Leader

1. Develop Diplomacy through meaningful negotiation and mediation.
2. Build actual relationships; skill does not substitute for trust.
3. Develop Leadership through coordinated tasks/expeditions.
4. Recruit willing companions through Set 28 agreements.
5. Teach/delegate while respecting companion autonomy and expertise.
6. Coordinate large expeditions, settlements or factions without automatically controlling every NPC.

## 43.6 Combat Specialist -> Defender

1. Practice Melee/Ranged/Defence through valid combat.
2. Develop gear, treatment and survival support.
3. Learn threat/ecology information through exploration.
4. Contribute to settlement defences and training.
5. Coordinate guards/companions with Leadership if desired.
6. Handle regional threats through preparation, logistics, diplomacy and combat rather than pure level scaling.

# 44. Revision Requirements for Foundation Documents 03-20

The revised foundation must consume this progression model consistently.

- **03 Blocks:** expose capability providers, harvest requirements and progression metadata without hardcoding POC status into shipped block truth.
- **04 Items:** expose equipment capability, skill/perk interactions and knowledge requirements without treating rarity as progression tier.
- **05 Recipes:** separate known/eligible/executable states; consume skill/perk modifiers and capability requirements.
- **06 Resources:** express material progression through capability and provenance, not one mandatory named ladder.
- **07 NPC Village:** expose teachers, specialists, jobs and opportunities; do not own player XP/perk formulas.
- **08 Automation:** consume Engineering progression and expose diagnostic/commissioning milestones.
- **09 Magic:** consume mastery/perk progression; own mana, spells and magical execution.
- **10 Creatures:** expose ecology, taming and combat/training contexts without becoming an XP dispenser detached from world state.
- **11 Worldgen:** validate progression reachability and provider fallbacks per seed.
- **12 Structures:** expose learning, access and capability-provider relationships.
- **13 Cultures/Factions:** expose institutions, permissions, teaching and faction access; no ancestry-wide skill destiny.
- **14 Dimensions:** use capability-based realm access rather than one level gate.
- **15 Quests/Events:** award progression from authoritative contribution and meaningful milestones.
- **16 Combat:** consume combat/perk/biological interfaces; no duplicate progression truth.
- **17 UI/UX:** show progression explainability and blockers without leaking hidden owner state.
- **18 Technical:** implement authoritative progression records, migration, validation, anti-cheat and event-driven XP commits in Godot/Summer.
- **19-20:** expose settlement/capability opportunities and skill/perk inputs while keeping settlement/world state separate from player level.

# 45. Closing Direction

Player progression in Leyforge should feel like a **history of what the character has learned, practised, built, survived and become capable of doing**, not a number that replaces the world.

The original progression vision remains intact: players can grow through gathering, crafting, magic, automation, combat, exploration, trade, leadership and civilisation without choosing a permanent class. Version 1.0 strengthens that vision by making every progression reward respect the physical world and the specialist system that owns its consequences.

A veteran character is powerful because they have accumulated:

- broad experience;
- deep practical skills;
- chosen perks;
- learned knowledge;
- trusted relationships and institutions;
- equipment and infrastructure;
- routes and world knowledge;
- settlement and economic capability;
- magical and technological mastery;
- a persistent history of successes, mistakes and consequences.

That combination is the Leyforge progression fantasy.

> **Final Progression Lock**
>
> **Grow the character without shrinking the world.**

---

# Appendix A. Canonical Skill Registry Summary

| Skill | Family | Primary Owner of Action Truth |
| --- | --- | --- |
| Mining | Gathering | Blocks/Resources own harvest truth. |
| Woodcutting & Forestry | Gathering | World/ecology own regeneration and tree state. |
| Foraging | Gathering | World/ecology owns availability. |
| Farming | Food & Ecology | Farming/biology/world owners retain growth truth. |
| Fishing & Aquaculture | Food & Ecology | Set 26M/ecology owns aquatic stock truth. |
| Crafting | Production | Recipes own valid transformations. |
| Smithing | Production | Recipes/items/resources own material truth. |
| Construction | Production | Documents 19/20 own project/building truth. |
| Engineering & Automation | Production | Automation owns machine/network execution. |
| Shipwrighting | Production | Set 26H/F/I own vessel construction truth. |
| Alchemy | Magic & Knowledge | Magic/Recipes/Medicine owners resolve effects. |
| Enchanting | Magic & Knowledge | Magic owns enchant execution. |
| Runecraft | Magic & Knowledge | Magic owns rune truth. |
| Magic School Mastery | Magic & Knowledge | Magic registry owns schools/spells/mana. |
| Melee Combat | Combat | Combat owns attacks/damage. |
| Ranged Combat | Combat | Combat owns hit/damage/projectile truth. |
| Defence | Combat | Combat owns defence resolution. |
| Athletics & Traversal | Survival & Movement | Set 30 owns movement validity/physics. |
| Watermanship & Diving | Survival & Movement | Set 26E owns aquatic action truth. |
| Navigation | Survival & Movement | Route/knowledge owners retain factual route truth. |
| Survival & Fieldcraft | Survival & Movement | Set 29 owns biology; world systems own hazards. |
| First Aid & Medicine | Survival & Movement | Set 29G/29E/29F own treatment/injury/disease truth. |
| Naturalism | Survival & Movement | World/creature/ecology owners retain truth. |
| Animal Handling & Riding | Animals & Transport | Creature/Set30 owners retain animal/movement truth. |
| Driving & Hauling | Animals & Transport | Set 30 owns transport physics/route execution. |
| Seamanship | Maritime | Set 26 owns vessel execution. |
| Trading | Social & Civilisation | Set 27 owns prices and financial outcomes. |
| Diplomacy | Social & Civilisation | Set 28 owns social resolution/relationships. |
| Leadership | Social & Civilisation | Set 28 owns companion consent; settlements own jobs/authority. |
| Stewardship | Social & Civilisation | Set 27 owns finance; 19/20 own settlement capabilities. |

# Appendix B. Progression Modifier Interface Catalogue

| Modifier / Output | Primary Consumer | Required Properties |
| --- | --- | --- |
| ProgressionAdditiveHealth | Set 29 | Bounded, source-labelled, versioned, explainable, recomputable |
| ProgressionAdditiveStamina | Set 29 | Bounded, source-labelled, versioned, explainable, recomputable |
| StaminaEfficiencyModifier | Set 29 / action owner | Bounded, source-labelled, versioned, explainable, recomputable |
| StaminaRecoveryModifier | Set 29 | Bounded, source-labelled, versioned, explainable, recomputable |
| BiologicalRecoveryModifier | Set 29 | Bounded, source-labelled, versioned, explainable, recomputable |
| FatigueResistanceModifier | Set 29 | Bounded, source-labelled, versioned, explainable, recomputable |
| TreatmentSkillModifier | Set 29G | Bounded, source-labelled, versioned, explainable, recomputable |
| MovementSkillModifier | Set 30 / 26E | Bounded, source-labelled, versioned, explainable, recomputable |
| CombatSkillModifier | Document 16 | Bounded, source-labelled, versioned, explainable, recomputable |
| MagicMasteryModifier | Document 09 | Bounded, source-labelled, versioned, explainable, recomputable |
| EconomicExpertiseInput | Set 27 | Bounded, source-labelled, versioned, explainable, recomputable |
| SocialSkillInput | Set 28 | Bounded, source-labelled, versioned, explainable, recomputable |
| LeadershipCapacityInput | Set 28 / settlement owners | Bounded, source-labelled, versioned, explainable, recomputable |
| CraftQualityModifier | Recipe/item action owner | Bounded, source-labelled, versioned, explainable, recomputable |
| KnowledgeEligibility | Knowledge/owner systems | Bounded, source-labelled, versioned, explainable, recomputable |

# Appendix C. Progression Source-to-Reward Matrix

| Source | Possible Reward | Repeatable | Guardrail |
| --- | --- | --- | --- |
| Validated repeated action | Skill XP + small overall XP | Yes | Must remain meaningful; saturation applies. |
| First-time discovery | Overall XP + relevant skill/knowledge | Usually | Discovery must be authoritative. |
| Teaching session | Skill/technique/knowledge progression | Yes | Teacher capability and access required. |
| Research completion | Knowledge/recipe/perk eligibility + XP | Often | Research owner validates inputs/time/result. |
| Quest/event milestone | Overall XP + specific unlocks | Yes | Only valid contribution/outcome. |
| Settlement project | Overall XP + relevant skill XP | Yes | Real contribution required. |
| Automation running unattended | Normally none continuously | No | Milestones/diagnosis/expansion can award. |
| Companion delegated work | Leadership/Stewardship where meaningful | No for manual skill | No manual mastery for work not performed. |
| Trade transaction | Trading + overall XP if meaningful | Yes | Set 27 validates economic transaction. |
| Combat encounter | Combat skill + overall XP | Yes | Combat owner validates participation. |
| Survival hardship | Survival XP only for meaningful management | Yes | No self-harm exploit loop. |
| Travel/voyage | Relevant travel skill + milestones | Yes | Route/action owner validates movement. |

# Appendix D. Capability Gate and Fallback Examples

| Goal | Capability Requirement | Valid Provider/Fallback Examples |
| --- | --- | --- |
| Cross a major river | Water crossing capability | Bridge, ferry, swim where safe, small craft, magic provider, alternate route. |
| Refine advanced metal | Metal-refining capability | Personal forge, settlement specialist, trade/import, alternate approved process. |
| Reach high ruin entrance | Vertical traversal capability | Ladder, rope, mantle route, glider from higher point, magic, alternate entrance. |
| Treat severe wound | Advanced treatment capability | Player medicine skill + tools/facility, healer NPC, settlement clinic, magic if valid. |
| Begin maritime trade | Cargo sea-transport capability | Own/hire vessel, faction/merchant service, port contract, alternate land route. |
| Learn a spell family | Valid magic-teaching/knowledge provider | Mage, book, ruin, research, experiment, culture institution. |
| Open realm route | Realm-access capability | Portal/ritual/infrastructure/faction route defined by Dimension system. |

# Appendix E. Anti-Exploit Acceptance Checklist

- [ ] Invalid actions produce no progression.
- [ ] Duplicate event commits cannot pay duplicate XP accidentally.
- [ ] Repetitive trivial action saturation is deterministic and explainable.
- [ ] Automation cannot passively train unrelated manual skills.
- [ ] Delegation cannot grant manual mastery for work never performed.
- [ ] Buy/sell loops cannot create infinite Trading XP without meaningful economic service/risk.
- [ ] Social choices cannot be spammed for unlimited Diplomacy XP after context is exhausted.
- [ ] Self-created biological harm is not the optimal medicine/survival XP strategy.
- [ ] Client cannot authoritatively award XP, levels or perks.
- [ ] Respec removes/recomputes modifier sources cleanly.
- [ ] Save/load preserves XP, skills, perks and modifier provenance.
- [ ] LOD/off-screen simulation cannot double-award milestones.
- [ ] Progression rewards cannot create items/currency/relationships/world facts outside owner systems.

# Appendix F. POC-to-Production Progression Conversion Matrix

| POC Element | Treatment | Production Conversion |
| --- | --- | --- |
| First crude/stone/iron tool chain | Preserve principle; generalise provider/material order. | Tool/material progression remains, but production registries/capabilities decide actual path. |
| Forest Hamlet reputation progression | Archive fixed identity; preserve social/settlement progression. | Generated settlements/factions/people expose real relationship and access paths. |
| Watchtower delivery unlock | Archive fixed sequence; preserve project contribution. | Any valid project can grant progression from real contribution. |
| First automation chain | Preserve automation learning. | No fixed machine/settlement route required; Engineering grows through valid systems. |
| First magic ruin/teacher | Archive fixed provider; preserve discovery/learning. | Any valid teacher, ruin, book, research or experiment path may provide capability. |
| Goblin raid milestone | Archive fixed raid; preserve defence milestone progression. | Generated threats/events can reward preparation/defence contribution. |
| POC skill checklist | Archive checklist; preserve global skill architecture. | Production skill registry replaces POC subset. |

# Appendix G. Cross-System Progression Consumption Matrix

| Consumer | Progression Inputs | Consumer Keeps Ownership Of |
| --- | --- | --- |
| Set 27 Economy | Trading, Leadership, Stewardship expertise/perks | Prices, wages, contracts, finance, market state. |
| Set 28 Social | Diplomacy, Leadership, social technique/perks | Relationships, trust, loyalty, persuasion outcome, companion agreement. |
| Set 29 Biology | Permanent Health/Stamina and efficiency/recovery modifiers; Medicine skill | Health/Stamina/Fatigue, survival state, injury/disease/treatment composition. |
| Set 30 Movement | Athletics, Navigation, Riding, Driving skill/perks | Movement physics, route feasibility, pathfinding, terrestrial transport. |
| Set 26 Maritime | Watermanship, Diving, Seamanship, Navigation, Shipwrighting, relevant combat/trade skills | Aquatic actions, vessels, ports, naval/marine gameplay. |
| Document 09 Magic | Magic school mastery, Runecraft, Enchanting, Alchemy perks | Mana, spells, rituals, wards and magic execution. |
| Document 16 Combat | Melee, Ranged, Defence skill/perks | Attacks, damage, armour, status and combat resolution. |
| Documents 19-20 | Construction, Leadership, Stewardship progression inputs | Settlement growth, building/service activation, projects. |
