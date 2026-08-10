# LEYFORGE

## 05 - Canonical Crafting, Recipe Registry and Transformation System

### Conserved Transformations, Recipe Definitions, Capability Substitution, Projects, Repair, Automation and Cross-System Transactions

**Version 1.0 - Reconciled Production Foundation Draft**  
**Date:** 8 August 2026  
**Supersedes:** `05_Fantasy_Voxel_Civilisation_Sandbox_Crafting_Recipe_Registry_v0_1.md` for active production direction  
**Project Lead and Final Authority:** Ash

A production-scale, data-driven crafting and transformation authority for Leyforge defining how canonical Blocks and Items are transformed, assembled, cooked, refined, repaired, salvaged, installed, commissioned, reserved, transferred and consumed without duplicating physical identities or bypassing the specialist systems that own the world around them.

> **Canonical Transformation Rule**
>
> **A recipe owns the transformation between authoritative inputs and authoritative outputs. It never owns duplicate copies of those inputs or outputs, and it never creates a fake Item solely because the result is a placeable Block.**

> **Block Output Rule**
>
> **If a recipe produces a placeable Block whose carried state is that same Block, the output is the canonical Block through its Block Inventory Projection. `item.block.*`, “Block Item”, or equivalent duplicate output definitions are prohibited.**

> **Conservation Rule**
>
> **No player, NPC, machine, automation network, project, ritual, settlement, vessel worksite, quest or distant-simulation process may create, consume, duplicate, lose or move authoritative goods except through an explicit validated transaction, reservation, transfer, transformation, recovery or declared world-source rule.**

> **Capability Rule**
>
> A recipe may accept typed capability-equivalent substitutions, but never unrestricted “anything” wildcards where physical, biological, magical, cultural, legal, quality, safety or progression properties matter.

---

# Document Purpose

Document 05 is the production authority for Leyforge's **recipe and physical transformation domain**. It replaces the original POC-oriented recipe registry and converts the post-Atlas production-chain architecture into a registry-safe system that can be executed by players, NPC specialists, machines, automation, construction projects, rituals and other authorised services without creating parallel truths.

The original document established several strong foundations that remain valid: one unified recipe registry, hand and station crafting, shaped and shapeless assembly, timed processes, batch processing, by-products, repair, cooking, magic, automation, project recipes, culture recipes, unlock paths and reusable data fields. Those concepts are retained.

Version 1.0 removes or supersedes the parts that no longer match production Leyforge:

- the fixed Forest Hamlet/watchtower chain as a production dependency;
- POC Required, Alpha and similar stage flags as shipped gameplay properties;
- recipes that output duplicate “Block Item” identities;
- a single universal material ladder as the only progression path;
- universal `any_ingot` or `any_material` substitution where capability matters;
- abstract village supply tokens that can stand in for real physical goods;
- recipe-owned prices, biological outcomes, movement execution, social outcomes or world distribution;
- assumptions that vessel construction is equivalent to crafting one boat item;
- assumptions that all repair is an inventory-button replacement rather than state-aware work;
- any Unreal-specific runtime/asset identity.

The replacement consumes Document 25J's **105 production chain contracts**, 15 substitution groups and capability-based progression requirements. It also adopts the Block/Item identity reconciliation from Documents 03-04 v1.0: recipes reference canonical Blocks and Items directly and never reintroduce the duplicate block-item model that those registries removed.

Document 05 therefore owns:

- canonical Recipe and Recipe Family identity;
- exact recipe inputs, outputs, quantities and units once a concrete recipe is admitted;
- typed substitutions and compatibility checks;
- station, tool, environment, time, batch, power/fuel/mana and permission requirements;
- by-products, waste, state transfer and declared failure results;
- recipe unlock/discovery metadata and knowledge references;
- repair, maintenance, salvage and recycling transformations;
- generated shape/variant transformation contracts;
- project recipe resource-stage contracts, while Documents 19-20 own project/structure meaning;
- machine-process definitions, while Document 08 owns automation execution and network behaviour;
- rune/magic transformation definitions, while Document 09 owns mana, spell and ritual-system consequence;
- cooking/preservation/medicine transformations, while Set 29 owns biological outcomes;
- maritime recipe admission and shared recipe primitives, while Set 26 owns vessel-work and specialist maritime execution;
- transaction-safe runtime requirements consumed by rewritten Document 18.

It does **not** own:

- canonical Block identity or Block Inventory Projections - Document 03;
- canonical Item identity, stack or persistent Item instance state - Document 04;
- material ecology, source distribution, capability progression or resource provenance meaning - Document 06 and Atlas/25J;
- market value, prices, wages, taxes or economic contract resolution - Set 27;
- trust, loyalty, willingness, social assignment or companion relationships - Set 28;
- health, stamina, fatigue, hunger, hydration, disease, toxin or treatment resolution - Set 29;
- ground/air/traversal/transport movement execution - Set 30;
- swimming/diving or vessel construction/motion/naval systems - Set 26;
- settlement planning, building function or blueprint source - Documents 19-20 and Blueprint Forge;
- machine-network scheduling/throughput ownership - Document 08;
- world generation or resource spawning - Document 11/Atlas;
- visual models, icons, VFX, audio or presentation - Forge/Presentation systems;
- runtime transaction implementation, persistence format or networking - Document 18.

---

# Production Status and Authority

| Field | Reconciled Direction |
| --- | --- |
| Registry Model | Qualified Recipe definitions grouped by Recipe Families and linked to 25J chain contracts. |
| Primary Namespace | `leyforge.core.recipe.*` for Core definitions; approved expansion namespaces for optional packages. |
| Chain Intake | All 105 25J chain contracts are admitted as required transformation/progression coverage. |
| Block Output | Placeable same-identity outputs resolve to canonical Block Inventory Projections, never duplicate Items. |
| Item Output | Separate Item output only where a genuinely distinct carried/consumed/equipped/component identity exists. |
| Quantities | Concrete recipes own exact integer/fixed-point quantities and units; numbers remain balanceable without changing identity. |
| Progression | Capability graph CAP-00 to CAP-10 replaces the old one-path POC ladder. |
| Substitution | Typed substitution groups with compatibility predicates; unrestricted wildcards are prohibited. |
| Execution | Player, NPC, machine, automation, project and ritual transformations use one authoritative transaction contract. |
| Economy Boundary | Recipes may reference economic permissions/contracts but never own prices or market state. |
| Biology Boundary | Recipes define food/medicine products and treatment inputs; Set 29 resolves biological effects. |
| Movement Boundary | Recipes may produce traversal equipment/components; Set 30 resolves terrestrial movement. |
| Maritime Boundary | Set 26 owns detailed vessel construction/refit/repair/fishing/naval production; Document 05 supplies shared recipe and transaction semantics plus admitted recipe IDs/families. |
| POC Status | Fixed Forest Hamlet, fixed watchtower project and scripted POC delivery chains are Archived Validation only. Reusable recipes and mechanics survive. |
| Engine Direction | Definitions compile to validated Godot Resources/runtime registry data; runtime execution is Document 18-owned. |

---

# Source and Supersession Hierarchy

For recipe-domain interpretation, use this order:

1. explicit approved project direction and later approved reconciliation amendments;
2. Foundation Reconciliation Register v0.2, especially the single canonical Block/Item identity rule;
3. Documents 00-04 v1.0;
4. Document 25B for stable IDs, one-owner truth, aliases, migration and facets;
5. Document 25J for the 105 chain contracts, 15 substitution groups, CAP-00 to CAP-10 and replacement gate;
6. Documents 25C-25I and 25K-25L for schemas, packs, capabilities, validation, block/item families and production handoff;
7. Set 24 Atlas for ecology, culture, world context and contextual resource meaning;
8. Documents 19-20 for settlement projects, building function, construction stages and resource reservations;
9. Sets 21-23 for Forge/Blueprint/Presentation authoring boundaries;
10. Set 26 for maritime recipe, vessel-work, fishing, shipyard, repair/refit and naval production authority;
11. Sets 27-30 final reconciled ownership contract for economy, social systems, biology and movement;
12. original Document 05 v0.1 as legacy recipe intent and balance-draft evidence;
13. Document 99 and fixed POC recipes as historical/regression evidence only.

> **Reconciliation Amendment to Earlier Recipe Language**
>
> Where an earlier recipe says its output is “Oak Planks Block Item”, “Stone Brick Block Item”, “Workbench Item”, “Furnace Item”, “Ward Lantern Item”, “Item Chute Block Item” or equivalent same-placeable representation, production interpretation is **the canonical Block through its Block Inventory Projection**. The recipe does not create a canonical Item record.

---

# Static Table of Contents

1. Locked Recipe-System Identity  
2. Canonical Terminology  
3. Recipe Registry Architecture  
4. Recipe Definition, Runtime Job and Transaction Separation  
5. Stable IDs, Namespaces, Aliases and Lifecycle  
6. Recipe Families and Transformation Classes  
7. Universal Recipe Definition Schema  
8. Input Reference Types and Quantity Units  
9. Output Reference Types and Block Inventory Projections  
10. Typed Substitution and Capability Compatibility  
11. Reservation, Commit and Conservation Semantics  
12. State Transfer, Quality, Condition, Purity and Provenance  
13. By-products, Waste, Pollution and Disposal  
14. Stations, Tools, Worksites and Environment Requirements  
15. Time, Batching, Queues and Throughput Contracts  
16. Fuel, Mechanical Power, Mana and Energy Requirements  
17. Unlocks, Knowledge, Culture, Faction and Research  
18. Permission, Ownership, Claims, Theft and Restitution  
19. Failure, Interruption, Cancellation and Rollback  
20. Hand and Primitive Crafting  
21. Workbench, Forge, Kiln and Material Processing  
22. Generated Shape and Construction-Variant Recipes  
23. Cooking, Preservation, Water and Food Preparation  
24. Medicine, Cleansing and Treatment Inputs  
25. Metallurgy, Refinement and Industrial Components  
26. Automation and Machine Recipes  
27. Repair, Maintenance, Recycling and Salvage  
28. Mana, Rune, Ward and Magical Transformation  
29. Project Recipes and Settlement Construction  
30. Trade Cargo, Supply Packages and Contract Transfers  
31. Culture and Faction Technique Facets  
32. Adventure, Loot, Restoration and Event Transformations  
33. Realm Recipes and Conditional Content  
34. Maritime and Vessel-Work Integration Boundary  
35. Traversal, Transport and Equipment Recipe Boundary  
36. NPC Crafting and Specialist Services  
37. Automation Execution and Network Boundary  
38. Multiplayer Authority and Concurrent Crafting  
39. Persistence, Save Recovery and Simulation LOD  
40. Optional Packs, Missing Definitions and Migration  
41. Recipe Book, UI/UX, Accessibility and Localisation  
42. Validation, Diagnostics and Release Gates  
43. POC Retirement and Preservation Register  
44. 25J Production Chain Admission Matrix  
45. Main-Document and Specialist-Set Integration  
46. Production Implementation Sequence  
47. Open Balance Variables and Deferred Tuning  
Appendix A. 105 Production Chain Contracts  
Appendix B. 15 Typed Substitution Groups  
Appendix C. Core Concrete Recipe Baseline  
Appendix D. Universal Recipe Record Template  
Appendix E. Transaction and State-Transfer Matrix  
Appendix F. Validation Reason Codes  
Appendix G. Legacy POC Recipe Migration Register  
Appendix H. Cross-System Ownership Matrix  
Appendix I. Document 05 v1.0 Acceptance Checklist

---

# 1. Locked Recipe-System Identity

The Recipe System is Leyforge's **authoritative transformation layer**. It answers a narrow but fundamental question: given a validated set of physical inputs, tools, stations, permissions, energy, knowledge and world conditions, what transformation may occur and what exact conserved outputs result?

It must remain broad enough to support a survival sandbox, living settlements, automation, magic, shipbuilding and realm progression without becoming the owner of those systems.

| Identity Layer | Meaning | Player-Facing Result |
| --- | --- | --- |
| Physical transformation | Real inputs become real outputs. | Crafting feels connected to the voxel world rather than a detached menu economy. |
| One-source identity | Recipe references canonical Block/Item definitions. | No duplicated Oak Plank, Furnace, Door or machine identity. |
| Capability progression | Recipes require/provide capabilities rather than one fixed material sequence. | Different seeds and cultures can support valid progression. |
| Shared execution | Player, NPC and machine work obey the same conservation semantics. | Automation and settlement production cannot cheat. |
| Persistent consequence | Repair, salvage, projects and rituals can change world state. | Crafting contributes to the living-world simulation. |
| Explainability | Inputs, blockers, permissions, state transfer and failure are inspectable. | Players understand why a process can or cannot run. |

> **Locked Identity Test**
>
> If a process changes authoritative physical stock, item/block condition, project material state, equipment installation, recoverable salvage, or a declared world-state output, it must resolve through an approved transformation/transaction contract or another explicitly owning system with equivalent conservation guarantees.

# 2. Canonical Terminology

| Term | Production Definition |
| --- | --- |
| Recipe Family | A reusable transformation pattern sharing category, fields and compatibility rules. |
| Concrete Recipe | Stable executable definition with exact references, quantities, station/tool requirements and outputs. |
| Chain Contract | 25J planning contract proving source-to-consumer reachability; may map to one or several recipes. |
| Recipe Job | Runtime work instance created from a recipe and actor/station/context. |
| Reservation | Temporary authoritative claim on required quantities/instances before irreversible work. |
| Transaction | Atomic commit that consumes/transfers inputs and creates/transforms outputs exactly once. |
| Block Inventory Projection | Inventory representation of a canonical Block; not an Item definition. |
| Item Reference | Reference to a canonical Item definition from Document 04. |
| Substitution Group | Typed set of capability-equivalent providers with explicit compatibility predicates. |
| State Transfer | Rules carrying quality, provenance, charge, contamination, ownership or other approved state from input to output. |
| By-product | Declared secondary output. |
| Waste | Declared output requiring storage, treatment, world consequence or explicit safe abstraction. |
| Project Recipe | Staged recipe whose transaction contributes to construction/repair/restoration state rather than simply spawning one inventory object. |
| Service Recipe | Recipe that requires a specialist/service but still conserves physical inputs and outputs. |
| Generated Recipe | Deterministically generated concrete recipe from an approved family template, such as shape conversion. |
| Commissioning | Validation step converting constructed components into an operational world instance when the owning system approves it. |

# 3. Recipe Registry Architecture

The production registry has four layers:

| Layer | Role | Example |
| --- | --- | --- |
| Recipe Family | Shared schema/behaviour. | Smelting, cooking, repair, project, rune inscription. |
| Concrete Recipe | Exact transform. | Raw Copper Ore -> Copper Ingot. |
| Runtime Job | Current work and reservations. | Furnace batch currently 62% complete. |
| Transaction Journal | Irreversible committed result. | 4 ore consumed; 2 ingots + slag produced. |

A recipe definition never stores current progress, current stock, current owner, current market price or current machine queue. Those are runtime truths.

## 3.1 Registry relationships

Every concrete recipe may reference:

- input Item IDs;
- input Block IDs through projections where the carried Block is consumed;
- installed/placed Block IDs where the process modifies world state;
- fluid/resource units from their owning registry;
- typed substitution groups;
- required tools/stations/services;
- required capability IDs;
- output Items;
- output Blocks through projections;
- state-change targets such as repaired instance/project stage;
- knowledge, culture, faction, realm, quest or permission references;
- by-product and waste outputs;
- presentation keys without owning the presentation asset.

# 4. Recipe Definition, Runtime Job and Transaction Separation

| Question | Owner |
| --- | --- |
| What ingredients does the recipe accept? | Recipe definition. |
| Does the player currently have them? | Inventory/storage/runtime query. |
| Which exact stacks are reserved? | Recipe job/reservation service. |
| How long has this batch run? | Recipe job/station runtime. |
| Which machine network powers it? | Automation/power system. |
| What did it finally consume/produce? | Transaction journal. |
| Who owns the output now? | Runtime ownership/custody system. |
| What is the output worth here? | Set 27 economy. |
| What does eating/using it do biologically? | Set 29. |

> **No Timer Authority Rule**
>
> A timer reaching zero does not itself create an output. Completion requests a transaction commit; only a successful commit changes authoritative stock or state.

# 5. Stable IDs, Namespaces, Aliases and Lifecycle

Concrete recipe IDs use qualified stable namespaces. Examples are illustrative of naming structure:

- `leyforge.core.recipe.hand.primitive.cordage`
- `leyforge.core.recipe.smelting.copper_ingot`
- `leyforge.core.recipe.cooking.basic_stew`
- `leyforge.core.recipe.magic.rune.basic_inscription`
- `leyforge.core.recipe.project.settlement.small_bridge_stage_foundation`

Expansion-specific definitions use their approved namespace. A maritime definition unique to Set 26 must not be hidden in Core under a misleading general name.

Lifecycle states:

| State | Meaning |
| --- | --- |
| Active | Eligible for normal production use. |
| Conditional | Requires optional package/realm/culture/system capability. |
| Teaser | Deliberately bounded; cannot become an unintended full production loop. |
| Deprecated | Existing references migrate through alias/replacement rules. |
| Tombstoned | ID retained for save integrity but cannot be newly created. |
| Archived Validation | Historical POC/test recipe only. |

Display-name changes do not change identity. Balance changes do not change identity unless the semantic transformation itself changes incompatibly.

# 6. Recipe Families and Transformation Classes

| Class | Required Behaviour | Representative Use |
| --- | --- | --- |
| Hand | Immediate, low-complexity, no persistent station. | Primitive tools, cordage, field bundles. |
| Station | Placed station owns workspace, queue and permissions. | Workbench, forge, kiln, kitchen. |
| Machine | Power/ports/throughput/LOD aware. | Crusher, sawmill, powered furnace. |
| Cooking/Preservation | Freshness, food-safety and culture-aware. | Meals, drying, smoking, fermentation. |
| Repair/Maintenance | Changes condition/state without replacing identity by default. | Tool repair, machine service, infrastructure repair. |
| Salvage/Recovery | Controlled dismantling and bounded recovery. | Wrecks, machines, ruined structures. |
| Project | Staged reservation/labour/world-state transformation. | Buildings, roads, public works. |
| Automation Network Contract | Moves/feeds production through authoritative endpoints. | Extraction -> processing -> storage. |
| Rune/Magic | Mana, purity, substrate, knowledge and risk. | Runes, wards, couplers. |
| Ritual/Route | Multi-participant/world-state change with safe failure. | Realm-route stabilisation. |
| Culture Technique | Adds approved technique/quality/presentation constraints. | Signature goods. |
| Quest/Event Resolution | Consumes/reserves/returns goods as an objective/outcome. | Relief, restitution, restoration. |
| Realm | Realm-law-aware transform with native demand. | Verdant materials. |
| Generated Shape/Variant | Deterministically generated conversion for valid material/shape sets. | Slabs, stairs, beams, walls. |

# 7. Universal Recipe Definition Schema

Every concrete recipe must support the following field groups. Fields may be null only where the family schema permits it.

| Field Group | Required Fields |
| --- | --- |
| Identity | `recipe_id`, family, version, namespace, lifecycle, pack owner, localisation key. |
| Classification | class, category, tags, chain refs, capability refs, difficulty/scalability policy. |
| Inputs | typed refs, quantities, units, acceptable state, substitution group, reservation semantics. |
| Outputs | typed refs, quantities, units, state-transfer rules, ownership destination. |
| Process | station/tool/service, time, batch, environment, power/fuel/mana, skill/knowledge. |
| Authority | owner/permission checks, claim handling, contract/project context, multiplayer authority. |
| Failure | interruptibility, cancellation, rollback, consumed-on-failure, damaged outputs, hazards. |
| Unlock | known/hinted/hidden/research/NPC/culture/faction/quest/realm relationships. |
| Presentation | icon/presentation key, warning text key, search/filter tags, accessibility descriptors. |
| Persistence | save policy, missing-definition behaviour, migration alias, LOD execution policy. |
| Validation | conservation, reachability, reference, station, state, duplicate-output and package tests. |

## 7.1 Reference schema

A recipe input/output reference must declare its domain:

- `item_ref`
- `block_projection_ref`
- `world_block_state_ref`
- `fluid_ref`
- `resource_measure_ref`
- `substitution_group_ref`
- `service_ref`
- `project_state_ref`
- `knowledge_ref`
- `world_state_ref`

A plain ambiguous string such as `"stone"` is not sufficient in executable data.

# 8. Input Reference Types and Quantity Units

Inputs are explicit physical or capability requirements. Supported quantity semantics include:

| Unit Class | Examples | Rule |
| --- | --- | --- |
| Count | 3 fibre bundles, 2 ingots, 1 tool. | Integer authoritative stock. |
| Charge | mana charge, battery units. | Fixed-point/defined unit owned by power/magic contract. |
| Volume | fluid/process liquid. | Fixed-point standard unit; no floating inventory truth. |
| Mass class | bulk cargo/process where a system explicitly owns mass. | Used only where owning system requires it. |
| Condition fraction | repair need, purity/contamination threshold. | Never used as hidden free quantity. |
| Service capacity | specialist time/capability. | Does not substitute for physical inputs unless the recipe says so. |

Tool requirements do not consume the tool unless the process explicitly spends/destroys it. Durability wear is a declared state transformation.

# 9. Output Reference Types and Block Inventory Projections

A recipe output may be:

- a canonical Item;
- a canonical Block through Block Inventory Projection;
- a placed Block/world-state change when the recipe class and owning system allow direct installation;
- a repaired/modified existing Item or Block instance;
- project-stage progress;
- declared by-products/waste;
- knowledge/recipe unlock evidence;
- an owning-system outcome reference.

## 9.1 Prohibited duplicate outputs

The following pattern is invalid:

`recipe -> item.block.oak_planks -> place -> block.oak_planks`

when `item.block.oak_planks` adds no independent lifecycle.

The valid pattern is:

`recipe -> block_projection(block.oak_planks) -> place -> block.oak_planks`

The same applies to doors, windows, furnaces, storage blocks, machines, rails, wards, construction pieces and any other recover-as-self Block.

## 9.2 Distinct lifecycle outputs

Separate Item output remains correct when transformation produces a genuinely different carried object:

- Ore Block -> Raw Ore Item;
- tree/plant Block -> processed timber/fibre/fruit/seed Items;
- crystal deposit Block -> crystal/shard Item;
- installed machine Block -> salvage components where dismantled rather than packed as self;
- crop Block -> food/seed Items;
- damaged object -> scrap Item when the original identity is intentionally destroyed.

# 10. Typed Substitution and Capability Compatibility

Substitution is allowed only through an explicit group or family rule. Each substitution evaluates compatibility against the recipe's requirements.

Compatibility may include:

- hardness/strength/load class;
- cutting edge or tool capability;
- conductivity;
- mana affinity/purity;
- wetness/heat/fire tolerance;
- food/nutrition/preservation role;
- medicine/treatment coverage;
- cultural or legal acceptability;
- realm compatibility;
- provenance or ownership restrictions;
- quality threshold;
- visual/structural role for blueprint construction.

`any_material`, universal `any_ingot`, and “any food” are prohibited where those distinctions matter.

# 11. Reservation, Commit and Conservation Semantics

Every non-trivial transformation follows the same high-level sequence:

1. resolve recipe and version;
2. resolve authority, owner and permission context;
3. resolve exact inputs/substitutions;
4. validate station/tool/environment/power/knowledge;
5. reserve physical inputs and required capacity;
6. start or continue runtime work;
7. revalidate irreversible completion conditions;
8. atomically consume/transform reserved inputs;
9. atomically create/transfer outputs and by-products;
10. write provenance/ownership/state-transfer results;
11. release reservations;
12. record transaction evidence and notify consumers.

If commit fails, authoritative stock remains unchanged or follows the recipe's explicit recovery transaction. There is no “best effort” partial duplication.

# 12. State Transfer, Quality, Condition, Purity and Provenance

State propagates only where semantically justified.

| State | Default Transfer Rule |
| --- | --- |
| Material provenance | Aggregate to output lot when source matters. |
| Maker | Add actor/service identity when meaningful. |
| Ownership | Output belongs to transaction destination/contract, not automatically the crafter. |
| Quality | Recalculate from recipe/material/station/skill rules where family supports quality. |
| Durability | New items start from output rule; repair modifies existing instance. |
| Charge | Conserved/converted according to recipe; never copied for free. |
| Purity | Weighted/recipe-defined transform; contaminants may produce waste or lower purity. |
| Freshness | Cooking/preservation recipe defines reset/extension/degradation. |
| Contamination | Must be explicitly removed, transferred, concentrated or emitted. |
| Unique/relic identity | Never merged into ordinary stack output unless an owning migration says so. |

# 13. By-products, Waste, Pollution and Disposal

By-products are first-class outputs. Examples include slag, ash, sawdust, offcuts, brine, spoiled residue, broken components, contaminated fluid and ritual residue.

A process must declare whether each secondary output is:

- useful stock;
- recyclable stock;
- compostable/biological material;
- hazardous waste;
- environmental emission owned by another system;
- safe abstract disposal allowed by a specific facility/service;
- intentionally lost only through an explicit sink transaction.

No process silently deletes material merely to simplify a UI queue.

# 14. Stations, Tools, Worksites and Environment Requirements

Recipes may require one or more of:

- hand/inventory workspace;
- workbench;
- furnace/smelter;
- forge/anvil;
- kiln;
- kitchen/hearth;
- drying/smoking/preservation station;
- alchemy/medical workstation;
- rune table/magic station;
- machine assembler;
- powered machine;
- construction site/project;
- specialist service;
- shipyard/slipway/dry dock under Set 26;
- realm-specific site;
- environmental condition such as heat, water access, ventilation, clean workspace or warded area.

Station definitions are Blocks/structures; recipes reference them rather than redefining them.

# 15. Time, Batching, Queues and Throughput Contracts

Recipe time is a balanceable process parameter, not identity. Hand transformations may be immediate or brief. Station and machine transformations may run in batches. Projects may take staged labour/time.

Rules:

- queue position does not reserve inputs unless the configured reservation policy says so;
- active jobs cannot overbook station capacity;
- batching changes quantity per transaction but not conservation;
- remote/distant execution must yield the same net result as near simulation;
- blocked outputs halt or redirect according to the process contract rather than deleting goods;
- time skips must not double-complete jobs;
- pausing/unloading preserves authoritative job progress.

# 16. Fuel, Mechanical Power, Mana and Energy Requirements

Recipes declare **requirements**, while owning power systems resolve supply.

Possible requirement classes include:

- none;
- thermal fuel/heat class;
- mechanical power;
- electrical/technical power if later admitted;
- mana charge/flow;
- water/wind/steam provider;
- leyline/realm provider;
- mixed mechanical-magical requirement.

The recipe may state energy consumed per batch/unit where the owning system exposes that unit. It does not simulate the network itself.

# 17. Unlocks, Knowledge, Culture, Faction and Research

Recipe availability may be:

- known at start;
- discovered from material interaction;
- exposed by station construction;
- learned from NPC/culture specialist;
- learned from book/record/ruin;
- researched/experimented;
- granted by faction permission/reputation;
- unlocked by quest/event/boss outcome;
- realm relationship or route dependent;
- hidden/forbidden;
- world-setting/tutorial revealed.

A station does not automatically teach every recipe it can execute. Knowledge and permission remain separate from physical capability.

# 18. Permission, Ownership, Claims, Theft and Restitution

A recipe/job may require:

- use permission for station/worksite;
- ownership or contract permission for inputs;
- salvage claim;
- public/project inventory authority;
- faction/culture legality;
- dangerous/forbidden-process permission;
- multiplayer contribution/allocation authority.

Using stolen goods may be mechanically possible if the relevant systems allow it, but ownership/provenance is not erased by crafting. Laundering provenance requires an explicit system rule; ordinary crafting is not automatically laundering.

# 19. Failure, Interruption, Cancellation and Rollback

Every interruptible process declares:

- whether work can pause safely;
- whether reserved inputs remain reserved;
- which inputs are returned on cancellation;
- which inputs have already transformed irreversibly;
- whether station/tool condition is damaged;
- whether by-products/waste are produced;
- whether a hazard/world event is emitted;
- how save recovery reconstructs the job.

Routine hand recipes should generally be deterministic and forgiving. Failure belongs where fiction and gameplay justify it: unstable magic, advanced alchemy, damaged machinery, poor-quality materials, hazardous conditions, forbidden practices or interrupted irreversible work.

# 20. Hand and Primitive Crafting

Primitive crafting provides CAP-00/CAP-01 survival without forcing one exact regional material.

The system supports:

- cordage/binding;
- primitive cutting/mining tools;
- emergency fire/light materials;
- simple shelter bundles;
- field repair;
- basic containers/carry aids where the underlying output is a true Item;
- direct Block projection output for recoverable placeable construction pieces.

The seed contract must provide either local inputs or a supported salvage/service/trade alternative.

# 21. Workbench, Forge, Kiln and Material Processing

Core station transformations include:

- timber cutting and component shaping;
- masonry shaping;
- clay/ceramic firing;
- glass production;
- copper and iron refinement;
- plates, rods, fasteners, wire and mechanisms;
- tool/equipment assembly;
- machine components;
- construction components;
- repair parts.

Earlier materials remain useful. A later forge does not invalidate wood, fibre, stone, copper, iron, clay or glass recipes; it expands precision, throughput, quality, scale or capability.

# 22. Generated Shape and Construction-Variant Recipes

Document 03 owns Block shapes/families; Document 05 owns their transformations.

For eligible families, generated recipes may cover:

- full block -> slabs;
- full block -> stairs;
- full block -> walls/fences/railings;
- logs/planks -> beams/posts;
- masonry -> arches/pillars;
- approved roof pieces;
- reversible conversions where balance permits.

Generated recipes are produced from one validated template and material-family eligibility rules. Important exceptions may use explicit concrete recipes. Generation cannot create a shape unsupported by the Block family.

# 23. Cooking, Preservation, Water and Food Preparation

Food transformations define physical preparation, not biological outcome.

Recipe-side responsibilities include:

- ingredients and substitutions;
- safe/unsafe preparation states;
- cooking/preservation method;
- freshness/spoilage transformation;
- portion/output count;
- fuel/time/station requirements;
- contamination transfer/removal;
- culture technique facet;
- by-products and waste.

Set 29 consumes the resulting food/medicine capability data to resolve hunger, hydration, nutrition, illness or treatment effects. Document 05 does not calculate the body.

# 24. Medicine, Cleansing and Treatment Inputs

Medicine recipes may create bandages, remedies, antidotes, cleansing agents, sterile supplies or treatment kits using approved Item/resource families.

The recipe may require diagnosis-class knowledge or specialist tools but must not claim “heals 40 HP” as its own authoritative rule. Set 29 owns treatment outcome, contraindications, disease/toxin resolution and biological modifiers.

# 25. Metallurgy, Refinement and Industrial Components

Copper and iron remain important Core anchors but are not the only possible capability providers.

The production model supports:

- ore/source -> raw/concentrated material;
- smelting/refining;
- ingot/bloom or equivalent stock;
- plates/sheets;
- rods/fasteners;
- wire/connectors;
- gears/mechanisms;
- structural frames;
- tool/weapon blanks;
- scrap recovery;
- optional alloy branches.

A recipe requiring CAP-03 conductive/mechanical capability may accept an approved equivalent through SUB-09 rather than hardcoding one ore in every world.

# 26. Automation and Machine Recipes

Document 05 defines machine/component assembly and machine-processing recipes. Document 08 owns the actual network scheduling, routing, power flow and near/far automation execution.

Machine recipes must declare:

- input/output ports or station interface class;
- batch/throughput parameters;
- power requirement;
- output-blocking behaviour;
- maintenance/wear interaction;
- automation eligibility;
- conservation and LOD policy;
- fault-safe rollback.

Automation must never gain a “distant efficiency bonus” that creates extra matter.

# 27. Repair, Maintenance, Recycling and Salvage

Repair modifies an existing identity where possible.

| Operation | Default Identity Rule |
| --- | --- |
| Tool repair | Preserve Item instance; consume compatible repair stock; improve condition. |
| Block repair | Preserve Block instance where state model supports it; consume material. |
| Machine maintenance | Preserve machine Block/instance; consume parts/lubricants/etc. |
| Structure repair | Project/work-package transaction; preserve structure history. |
| Vessel repair | Set 26H work package; Document 05 supplies admitted recipe/material references. |
| Salvage | Destroy/alter source identity and create bounded declared recovered outputs. |
| Recycling | Transform eligible scrap/waste into lower/higher processing stock according to recipe. |

Repair may not duplicate an Item by returning a “new repaired copy” while leaving the damaged original present.

# 28. Mana, Rune, Ward and Magical Transformation

Magic recipes preserve the original project's practical-magic direction while respecting Document 09 ownership.

Recipe-side examples include:

- mana crystal -> shard/dust processing;
- rune substrate preparation;
- rune inscription;
- ward components;
- charge-storage components;
- mana-mechanical couplers;
- cleansing reagents;
- realm-route stabilisation supplies.

Magic recipes may use purity, charge, instability, contamination, knowledge and warding requirements. Document 09 resolves mana-system behaviour, spell effects, magical risk and ritual consequence.

# 29. Project Recipes and Settlement Construction

Project recipes are not “craft building instantly” buttons. They are resource-stage contracts consumed by Documents 19-20 and settlement construction systems.

A project recipe may define:

- stage ID;
- exact required goods and substitutions;
- reservation policy;
- required tools/services;
- labour capability class;
- terrain/site prerequisites owned elsewhere;
- install/consume/return rules;
- salvage on cancellation;
- completion outputs as project/structure state;
- provenance/contributor evidence.

The fixed Forest Hamlet watchtower stages are Archived Validation. Generic tower, road, bridge, warehouse, housing, dock, shipyard and other project families remain valid production capabilities when defined by their owning building/structure systems.

# 30. Trade Cargo, Supply Packages and Contract Transfers

A “supply package” is a conserved manifest/grouping of real goods, not an abstract coupon.

Document 05 may define packing/unpacking, provisioning and contract-delivery transformations. Set 27 owns the economic contract, value, payment, tax and market result.

Physical crates/barrels remain canonical Blocks where applicable; cargo/package Items from Document 04 represent manifests/lots only where they have a distinct lifecycle.

# 31. Culture and Faction Technique Facets

Culture-specific recipes should usually add technique, material preference, quality practice, presentation or knowledge constraints to common physical systems rather than duplicating the entire economy.

A culture technique facet may control:

- approved substitutions;
- specialist station/service;
- quality bonus/requirement;
- ceremonial or legal constraints;
- presentation variant;
- knowledge unlock source;
- characteristic by-product or process.

Biological ancestry does not automatically own a recipe. Culture, faction, school, profession or learned knowledge is the normal technique owner.

# 32. Adventure, Loot, Restoration and Event Transformations

Adventure/event transformations include controlled salvage, relic restoration, evidence processing, repair after disasters, public-works recovery and quest-linked resource delivery.

Loot selection itself remains owned by site/event/loot grammars. A recipe does not turn a container into a random reward table.

Unique/relic objects require reservation and loss/recovery rules. Repair/restoration must preserve provenance and cannot duplicate the original.

# 33. Realm Recipes and Conditional Content

Realm recipes are conditional content admitted only when the required realm package is active and validated.

The Verdant Covenant chains are the first complete conditional realm transformation set in 25J. Ancestral Veil remains Teaser Only at this stage and must not accidentally become a renewable production farm through generic recipe expansion.

When a package is disabled/removed, existing Items/Blocks/jobs follow missing-definition preservation and migration policy. They are not silently deleted or converted to unrelated Core goods.

# 34. Maritime and Vessel-Work Integration Boundary

Set 26 requires the replacement Document 05 to admit maritime recipes and supply chains, but the detailed vessel-work lifecycle remains Set 26-owned.

Document 05 supplies shared recipe definitions/primitives for:

- shipwright tools and components;
- sealants/caulking and marine-compatible materials;
- fishing and catch processing where admitted;
- preservation/provisions;
- maritime automation and magic components;
- port/shipyard supply packages;
- naval ammunition/repair supply where defined by combat owners;
- salvage processing;
- vessel-component fabrication.

Set 26H owns construction, launch, haul-out, refit, repair, conversion, decommissioning and salvage work packages for commissioned vessels. A vessel is **not** produced as a single generic “boat item recipe” unless a genuinely tiny portable craft is explicitly designed that way by Set 26.

Vessel work consumes exact Blocks, Items, fluids, components and labour through authoritative reservations and transactions. Document 05 provides the recipe references; Set 26 decides when those recipes/work packages are valid for a vessel.

# 35. Traversal, Transport and Equipment Recipe Boundary

Document 05 may craft:

- climbing/traversal equipment;
- saddles/harnesses;
- cart/wagon components;
- rail/guided-transport components;
- gliding equipment;
- maintenance parts;
- route infrastructure Blocks/projects.

Set 30 determines movement modes, route accessibility, speed, traversal cost, vehicle/mount status and travel-time execution. Set 29 supplies biological exertion/carry modifiers. Recipe unlocks never directly grant movement physics.

# 36. NPC Crafting and Specialist Services

NPCs use the same canonical recipes as players unless a recipe explicitly requires a specialist service inaccessible to ordinary player execution.

NPC crafting requires:

- real inputs or valid service inventory;
- known technique/capability;
- station/worksite access;
- time/labour;
- authority/ownership;
- transaction evidence.

A distant NPC workshop may summarise work, but it may not generate stock without the same net inputs and outputs.

# 37. Automation Execution and Network Boundary

Automation may start and supply recipes, but Document 08 owns scheduling, routing and network state.

The recipe exposes:

- accepted input domains;
- required station/machine capability;
- power class;
- process duration/batch;
- outputs and by-products;
- blocked-output behaviour;
- maintenance/wear refs;
- LOD-safe execution flag.

The automation system exposes whether those requirements are currently satisfied.

# 38. Multiplayer Authority and Concurrent Crafting

All authoritative recipe starts, reservations, cancellations and commits occur on the authoritative world host/server.

Concurrency rules:

- one stack/instance quantity cannot be reserved twice;
- station slots/capacity cannot be overbooked;
- project and contract reservations are visible to inventory queries;
- UI prediction may show expected output but never creates state;
- disconnect/reconnect preserves jobs and reservations;
- duplicate client requests are idempotent or rejected;
- contribution records distinguish supplied materials from actual ownership of the final result where applicable.

# 39. Persistence, Save Recovery and Simulation LOD

Persistent jobs store enough information to recover safely:

- recipe ID/version;
- station/worksite/project reference;
- exact reserved input refs/quantities;
- progress/time state;
- owner/requester/contributor context;
- power/process state where required;
- output destination/reservation;
- interruption state;
- migration version;
- transaction nonce/idempotency key.

Near and far simulation must reconcile to the same net material transformation. If a job cannot safely run in distant simulation, it pauses or is represented by an owning-system work summary rather than inventing an approximation.

# 40. Optional Packs, Missing Definitions and Migration

Recipes may reference optional definitions only through declared package dependencies or fallback/substitution contracts.

When a definition becomes unavailable:

- active jobs do not silently substitute unrelated goods;
- reserved goods remain preserved;
- compatible alias/migration may resolve the reference;
- otherwise the job pauses/quarantines with a readable reason;
- existing outputs remain preserved through missing-definition placeholders/tombstones where required;
- optional-pack removal never destroys inventories or duplicates refunds.

# 41. Recipe Book, UI/UX, Accessibility and Localisation

Player-facing recipe presentation must show, at minimum where relevant:

- output and amount;
- required station/tool;
- exact missing inputs;
- accepted substitutions and why one is invalid;
- process time/batch;
- power/fuel/mana requirement;
- locked/known/hinted state;
- permission/ownership blocker;
- quality/risk warning;
- by-products/waste;
- destination/output-blocked state;
- project-stage relation;
- accessibility-safe icons/text and non-colour warnings.

The UI should hide the internal distinction between an ordinary Item and Block Inventory Projection when that distinction is irrelevant to the player, while preserving correct tooltip, placement and ownership behaviour.

# 42. Validation, Diagnostics and Release Gates

Recipe validation is release-blocking for correctness failures.

Required test classes:

| Test | Blocking Failure |
| --- | --- |
| Identity | Duplicate/invalid recipe ID, alias loop or missing owner. |
| Reference | Missing Item/Block/station/capability/substitution reference. |
| Block/Item Dedup | Recipe outputs duplicate Item and Block projection for same identity. |
| Conservation | Net unexplained gain/loss outside declared world-source/sink rule. |
| Reservation | Same stock can be double-spent. |
| State Transfer | Charge/provenance/quality/contamination duplicated or silently discarded. |
| Reachability | Core capability chain has no valid provider/recipe path in supported seed profile. |
| Project | Project stage can progress without material commit. |
| Automation | Near/far or manual/automated execution changes net result unexpectedly. |
| Persistence | Save/load, crash recovery or migration duplicates/loses job state. |
| Multiplayer | Concurrent starts/commits can duplicate or overspend stock. |
| Optional Pack | Missing/removed pack corrupts jobs or inventories. |
| UI | Blocker/risk/permission cannot be explained to player. |

# 43. POC Retirement and Preservation Register

The fixed POC scenario is not a production recipe dependency. The following distinction is mandatory:

| Original POC Element | Production Treatment |
| --- | --- |
| Forest Hamlet-specific supply chain | Archive scenario wrapper; preserve generic settlement supply/project mechanics. |
| Fixed watchtower supply crate | Archive named scenario object; preserve generic exact project-supply packages and tower construction. |
| Fixed staged watchtower recipe | Archive fixed blueprint/stages; generic tower/building project recipes remain. |
| Basic Mechanical/Mana Miner | Preserve automation capability if admitted by current automation registry; remove POC-only naming/guaranteed placement. |
| Mana Crystal -> Shard -> Dust | Preserve generic magic resource processing unless later resource/magic owner explicitly supersedes it. |
| Basic Rune/Ward chain | Preserve practical rune/ward transformation capability; exact concrete definitions remain subject to current magic registry. |
| Oak/Stone/Copper/Iron basic processing | Preserve as ordinary Core production where current registries admit those materials. |
| Fixed goblin-raid preparation recipes | Archive scenario dependency; preserve guard/defence/repair/provision recipe families. |
| POC Required planning flag | Archive documentation metadata only. |

> **No-Orphaned-Capability Check**
>
> Removing a legacy POC recipe is only valid when its underlying production capability is either preserved through a production recipe/chain, explicitly superseded by later authority, or intentionally removed with recorded approval.

# 44. 25J Production Chain Admission Matrix

All 105 chain contracts are accepted as the production coverage baseline for Documents 05-06. A chain contract does not imply exactly one recipe: some map to several transformations, some are runtime recovery contracts, and some are project/service/realm operations.

The recipe registry must prove that every chain whose transformation layer belongs to Document 05 has at least one admitted concrete recipe family, generated recipe family or explicitly delegated specialist owner.

# 45. Main-Document and Specialist-Set Integration

| Consumer/Owner | Document 05 Contract |
| --- | --- |
| 03 Blocks | Consume canonical Block refs/projections; never invent block-item outputs. |
| 04 Items | Consume canonical Item refs/state profiles; never redefine Items in recipe data. |
| 06 Resources | Map recipes to resource progression/provenance/capabilities. |
| 07 NPC/Settlement | Shared NPC crafting, supply, labour and service execution. |
| 08 Automation | Machine recipes, throughput requirements and conserved transaction interface. |
| 09 Magic | Rune/mana/ritual inputs and outputs; magic system owns magical consequence. |
| 10 Creatures | Creature harvest eligibility and resource inputs; no recipe-owned personhood rule. |
| 11 Worldgen | Source availability only; recipe never forces world spawn. |
| 12 Structures | Repair/restoration/salvage references. |
| 13 Cultures/Factions | Technique/permission/culture recipe facets. |
| 14 Realms | Realm recipe/package dependency. |
| 15 Quests/Events | Objective delivery/resolution transactions. |
| 16 Combat | Weapon/ammo/repair/defence supply recipes; combat owns effects. |
| 17 UI/UX | Recipe book, station panels, blockers, risk, accessibility. |
| 18 Technical | Registry compilation, transaction service, persistence, networking, validation. |
| 19-20 | Project recipe stages, exact resource reservation and construction handoff. |
| 21-23 Forge | Presentation references and blueprint/component authoring boundaries. |
| Set 24 | World/resource/culture context only. |
| Set 25 | Governance, families, capabilities, validation and chain intake. |
| Set 26 | Maritime specialist recipes/work packages and vessel production authority. |
| Set 27 | Economy/price/contract ownership. |
| Set 28 | Social permission/willingness ownership. |
| Set 29 | Biological outcome ownership. |
| Set 30 | Movement/transport execution ownership. |

# 46. Production Implementation Sequence

Recommended implementation order:

1. registry schema + validator;
2. Block/Item reference and projection handling;
3. reservation/transaction core;
4. primitive/hand recipes;
5. station queues and processing;
6. repair/state-transfer operations;
7. core material chains;
8. cooking/preservation/medicine inputs;
9. machine recipes and automation handoff;
10. project recipes;
11. magic/rune recipes;
12. culture/faction unlocks;
13. realm/conditional recipes;
14. Set 26 maritime admission;
15. migration/optional-pack/recovery tests;
16. multiplayer/LOD/packaged-build validation.

# 47. Open Balance Variables and Deferred Tuning

The following remain balance variables rather than design uncertainty:

- exact craft times;
- exact fuel/power/mana use;
- final input/output ratios where no approved old value exists;
- station throughput and queue sizes;
- quality formulas;
- salvage yield percentages;
- failure probabilities for risky processes;
- spoilage/preservation times;
- project bulk quantities;
- skill influence on speed/quality;
- economy-facing labour/service fees owned by Set 27.

These values may change through testing without altering the source-of-truth boundaries above.

---

## 44.1 Complete Chain-to-Recipe Admission Table

| Chain | Name | 25J Status | Recipe-Side Implementation | Production Disposition |
| --- | --- | --- | --- | --- |
| RC-REC-01 | Quantity Reconciliation and Quarantine | Core Required | Migration/Recovery Transaction | Runtime/migration transaction contract; not ordinary player recipe. |
| RC-REC-02 | Definition Supersession Migration | Core Required | Migration/Recovery Transaction | Runtime/migration transaction contract; not ordinary player recipe. |
| RC-REC-03 | Optional-Pack Removal Preservation | Core Required | Migration/Recovery Transaction | Runtime/migration transaction contract; not ordinary player recipe. |
| RC-REC-04 | Interrupted Production Rollback | Core Required | Migration/Recovery Transaction | Runtime/migration transaction contract; not ordinary player recipe. |
| RC-SUR-01 | Local Forage to Immediate Food | Core Required | Hand/Station/Repair | Requires one or more concrete/generated/delegated recipe definitions. |
| RC-SUR-02 | Firewood and Emergency Heat | Core Required | Hand/Station/Repair | Requires one or more concrete/generated/delegated recipe definitions. |
| RC-SUR-03 | Primitive Cutting Tool | Core Required | Hand/Station/Repair | Requires one or more concrete/generated/delegated recipe definitions. |
| RC-SUR-04 | Primitive Mining Tool | Core Required | Hand/Station/Repair | Requires one or more concrete/generated/delegated recipe definitions. |
| RC-SUR-05 | Immediate Shelter Materials | Core Required | Hand/Station/Repair | Requires one or more concrete/generated/delegated recipe definitions. |
| RC-SUR-06 | Simple Storage and Carrying | Core Required | Hand/Station/Repair | Requires one or more concrete/generated/delegated recipe definitions. |
| RC-SUR-07 | Clean-Water Access and Container | Core Required | Hand/Station/Repair | Requires one or more concrete/generated/delegated recipe definitions. |
| RC-SUR-08 | Field Repair and Salvage | Core Required | Hand/Station/Repair | Requires one or more concrete/generated/delegated recipe definitions. |
| RC-ORG-01 | Hardwood Timber Processing | Core Required | Hand/Station/Machine | Requires one or more concrete/generated/delegated recipe definitions. |
| RC-ORG-02 | Softwood Framing and Polework | Core Required | Hand/Station/Machine | Requires one or more concrete/generated/delegated recipe definitions. |
| RC-ORG-03 | Charcoal Production | Core Required | Hand/Station/Machine | Requires one or more concrete/generated/delegated recipe definitions. |
| RC-ORG-04 | Resin, Pitch and Sealant | Core Required | Hand/Station/Machine | Requires one or more concrete/generated/delegated recipe definitions. |
| RC-ORG-05 | Plant-Fibre Cordage | Core Required | Hand/Station/Machine | Requires one or more concrete/generated/delegated recipe definitions. |
| RC-ORG-06 | Reed and Cane Goods | Core Required | Hand/Station/Machine | Requires one or more concrete/generated/delegated recipe definitions. |
| RC-ORG-07 | Textile Fibre to Cloth | Core Required | Hand/Station/Machine | Requires one or more concrete/generated/delegated recipe definitions. |
| RC-ORG-08 | Wool to Insulating Textile | Core Required | Hand/Station/Machine | Requires one or more concrete/generated/delegated recipe definitions. |
| RC-ORG-09 | Hide to Leather and Parchment | Core Required | Hand/Station/Machine | Requires one or more concrete/generated/delegated recipe definitions. |
| RC-ORG-10 | Paper, Ink and Record Media | Core Required | Hand/Station/Machine | Requires one or more concrete/generated/delegated recipe definitions. |
| RC-MIN-01 | Common Stone to Rubble and Cut Stone | Core Required | Station/Machine/Generated Variant | Requires one or more concrete/generated/delegated recipe definitions. |
| RC-MIN-02 | Limestone to Lime and Mortar | Core Required | Station/Machine/Generated Variant | Requires one or more concrete/generated/delegated recipe definitions. |
| RC-MIN-03 | Clay to Brick and Ceramic | Core Required | Station/Machine/Generated Variant | Requires one or more concrete/generated/delegated recipe definitions. |
| RC-MIN-04 | Sand to Glass | Core Required | Station/Machine/Generated Variant | Requires one or more concrete/generated/delegated recipe definitions. |
| RC-MIN-05 | Aggregate to Road and Drainage Fill | Core Required | Station/Machine/Generated Variant | Requires one or more concrete/generated/delegated recipe definitions. |
| RC-MIN-06 | Salt and Mineral Preservative | Core Required | Station/Machine/Generated Variant | Requires one or more concrete/generated/delegated recipe definitions. |
| RC-MIN-07 | Peat and Wetland Fuel | Core Required | Station/Machine/Generated Variant | Requires one or more concrete/generated/delegated recipe definitions. |
| RC-MIN-08 | Prospecting Sample and Grade Analysis | Core Required | Station/Machine/Generated Variant | Requires one or more concrete/generated/delegated recipe definitions. |
| RC-MIN-09 | Deepstone and Specialist Masonry | Core Conditional | Station/Machine/Generated Variant | Requires one or more concrete/generated/delegated recipe definitions. |
| RC-FOD-01 | Staple Grain Agriculture | Core Required | Cooking/Preservation/Medicine | Requires one or more concrete/generated/delegated recipe definitions. |
| RC-FOD-02 | Root-Crop Agriculture | Core Required | Cooking/Preservation/Medicine | Requires one or more concrete/generated/delegated recipe definitions. |
| RC-FOD-03 | Orchard and Berry Production | Core Required | Cooking/Preservation/Medicine | Requires one or more concrete/generated/delegated recipe definitions. |
| RC-FOD-04 | Mushroom and Fungal Food | Core Required | Cooking/Preservation/Medicine | Requires one or more concrete/generated/delegated recipe definitions. |
| RC-FOD-05 | Domestic Animal Products | Core Required | Cooking/Preservation/Medicine | Requires one or more concrete/generated/delegated recipe definitions. |
| RC-FOD-06 | Wild Game and Ethical Harvest | Core Required | Cooking/Preservation/Medicine | Requires one or more concrete/generated/delegated recipe definitions. |
| RC-FOD-07 | Basic Meal Preparation | Core Required | Cooking/Preservation/Medicine | Requires one or more concrete/generated/delegated recipe definitions. |
| RC-FOD-08 | Preserved Rations | Core Required | Cooking/Preservation/Medicine | Requires one or more concrete/generated/delegated recipe definitions. |
| RC-FOD-09 | Animal Feed and Fodder | Core Required | Cooking/Preservation/Medicine | Requires one or more concrete/generated/delegated recipe definitions. |
| RC-FOD-10 | Herbal Remedy and Bandage | Core Required | Cooking/Preservation/Medicine | Requires one or more concrete/generated/delegated recipe definitions. |
| RC-FOD-11 | Antidote and Cleansing Medicine | Core Required | Cooking/Preservation/Medicine | Requires one or more concrete/generated/delegated recipe definitions. |
| RC-FOD-12 | Relief and Emergency Supply Pack | Core Required | Cooking/Preservation/Medicine | Requires one or more concrete/generated/delegated recipe definitions. |
| RC-MET-01 | Copper Ore Extraction and Concentration | Core Required | Station/Machine/Forge | Requires one or more concrete/generated/delegated recipe definitions. |
| RC-MET-02 | Copper Smelting | Core Required | Station/Machine/Forge | Requires one or more concrete/generated/delegated recipe definitions. |
| RC-MET-03 | Copper Plate and Sheet | Core Required | Station/Machine/Forge | Requires one or more concrete/generated/delegated recipe definitions. |
| RC-MET-04 | Copper Wire and Connectors | Core Required | Station/Machine/Forge | Requires one or more concrete/generated/delegated recipe definitions. |
| RC-MET-05 | Copper Gears and Mechanisms | Core Required | Station/Machine/Forge | Requires one or more concrete/generated/delegated recipe definitions. |
| RC-MET-06 | Copper-Alloy Capability Branch | Core Conditional | Station/Machine/Forge | Requires one or more concrete/generated/delegated recipe definitions. |
| RC-MET-07 | Iron Ore Extraction and Concentration | Core Required | Station/Machine/Forge | Requires one or more concrete/generated/delegated recipe definitions. |
| RC-MET-08 | Iron Smelting and Bloom/Ingots | Core Required | Station/Machine/Forge | Requires one or more concrete/generated/delegated recipe definitions. |
| RC-MET-09 | Iron Plate, Rod and Fasteners | Core Required | Station/Machine/Forge | Requires one or more concrete/generated/delegated recipe definitions. |
| RC-MET-10 | Tool and Weapon Blank | Core Required | Station/Machine/Forge | Requires one or more concrete/generated/delegated recipe definitions. |
| RC-MET-11 | Structural Frame and Project Ironwork | Core Required | Station/Machine/Forge | Requires one or more concrete/generated/delegated recipe definitions. |
| RC-MET-12 | Mixed Scrap Recovery | Core Required | Station/Machine/Forge | Requires one or more concrete/generated/delegated recipe definitions. |
| RC-AUT-01 | Basic Mechanical Power Interface | Core Required | Machine/Assembly/Network Contract | Requires one or more concrete/generated/delegated recipe definitions. |
| RC-AUT-02 | Chute and Gravity Logistics | Core Required | Machine/Assembly/Network Contract | Requires one or more concrete/generated/delegated recipe definitions. |
| RC-AUT-03 | Cart, Wheel and Bounded Track | Core Required | Machine/Assembly/Network Contract | Requires one or more concrete/generated/delegated recipe definitions. |
| RC-AUT-04 | Machine Frame and Processing Assembly | Core Required | Machine/Assembly/Network Contract | Requires one or more concrete/generated/delegated recipe definitions. |
| RC-AUT-05 | Filter, Sorter and Routing Control | Core Required | Machine/Assembly/Network Contract | Requires one or more concrete/generated/delegated recipe definitions. |
| RC-AUT-06 | Machine Maintenance and Wear Recovery | Core Required | Machine/Assembly/Network Contract | Requires one or more concrete/generated/delegated recipe definitions. |
| RC-AUT-07 | Portable Fuel and Mana Supply | Core Required | Machine/Assembly/Network Contract | Requires one or more concrete/generated/delegated recipe definitions. |
| RC-AUT-08 | Automation-to-Settlement Supply Contract | Core Required | Machine/Assembly/Network Contract | Requires one or more concrete/generated/delegated recipe definitions. |
| RC-CRE-01 | Meat, Fat and Food Recovery | Core Required | Harvest/Processing/Research | Requires one or more concrete/generated/delegated recipe definitions. |
| RC-CRE-02 | Hide, Fur and Fibre Recovery | Core Required | Harvest/Processing/Research | Requires one or more concrete/generated/delegated recipe definitions. |
| RC-CRE-03 | Bone, Horn, Chitin and Shell Processing | Core Required | Harvest/Processing/Research | Requires one or more concrete/generated/delegated recipe definitions. |
| RC-CRE-04 | Venom, Toxin and Antidote Research | Core Conditional | Harvest/Processing/Research | Requires one or more concrete/generated/delegated recipe definitions. |
| RC-CRE-05 | Silk and Web Fibre | Core Required | Harvest/Processing/Research | Requires one or more concrete/generated/delegated recipe definitions. |
| RC-CRE-06 | Essence and Magical Sample | Core Required | Harvest/Processing/Research | Requires one or more concrete/generated/delegated recipe definitions. |
| RC-CRE-07 | Construct Component Salvage | Core Required | Harvest/Processing/Research | Requires one or more concrete/generated/delegated recipe definitions. |
| RC-MAG-01 | Mana Source Discovery and Harvest | Core Required | Rune/Magic/Ritual | Requires one or more concrete/generated/delegated recipe definitions. |
| RC-MAG-02 | Mana Crystal to Shard and Dust | Core Required | Rune/Magic/Ritual | Requires one or more concrete/generated/delegated recipe definitions. |
| RC-MAG-03 | Rune Substrate Preparation | Core Required | Rune/Magic/Ritual | Requires one or more concrete/generated/delegated recipe definitions. |
| RC-MAG-04 | Basic Rune Inscription | Core Required | Rune/Magic/Ritual | Requires one or more concrete/generated/delegated recipe definitions. |
| RC-MAG-05 | Mana Charge and Storage | Core Required | Rune/Magic/Ritual | Requires one or more concrete/generated/delegated recipe definitions. |
| RC-MAG-06 | Ward Component and Maintenance | Core Required | Rune/Magic/Ritual | Requires one or more concrete/generated/delegated recipe definitions. |
| RC-MAG-07 | Cleansing Reagent and Restoration | Core Required | Rune/Magic/Ritual | Requires one or more concrete/generated/delegated recipe definitions. |
| RC-MAG-08 | Mana-Mechanical Coupler | Core Required | Rune/Magic/Ritual | Requires one or more concrete/generated/delegated recipe definitions. |
| RC-MAG-09 | Realm Route Stabilisation Supply | Core Conditional | Rune/Magic/Ritual | Requires one or more concrete/generated/delegated recipe definitions. |
| RC-SET-01 | Construction Supply Bundle | Core Required | Project/Package/Transfer | Requires one or more concrete/generated/delegated recipe definitions. |
| RC-SET-02 | Guard and Defence Supply | Core Required | Project/Package/Transfer | Requires one or more concrete/generated/delegated recipe definitions. |
| RC-SET-03 | Health and Infirmary Supply | Core Required | Project/Package/Transfer | Requires one or more concrete/generated/delegated recipe definitions. |
| RC-SET-04 | Food Reserve and Granary Stock | Core Required | Project/Package/Transfer | Requires one or more concrete/generated/delegated recipe definitions. |
| RC-SET-05 | Culture Signature Good Production | Core Required | Project/Package/Transfer | Requires one or more concrete/generated/delegated recipe definitions. |
| RC-SET-06 | Trade Cargo and Shipment Manifest | Core Required | Project/Package/Transfer | Requires one or more concrete/generated/delegated recipe definitions. |
| RC-SET-07 | Tax, Tribute, Donation and Contract Transfer | Core Required | Project/Package/Transfer | Requires one or more concrete/generated/delegated recipe definitions. |
| RC-SET-08 | Repair, Restoration and Public Works | Core Required | Project/Package/Transfer | Requires one or more concrete/generated/delegated recipe definitions. |
| RC-ADV-01 | Site Salvage and Evidence Recovery | Core Required | Salvage/Restoration/Event Resolution | Requires one or more concrete/generated/delegated recipe definitions. |
| RC-ADV-02 | Contextual Container Resolution | Core Required | Salvage/Restoration/Event Resolution | Loot/event owner selects reward; Document 05 handles any physical restore/processing step. |
| RC-ADV-03 | Boss Proof and Reward Package | Core Required | Salvage/Restoration/Event Resolution | Loot/event owner selects reward; Document 05 handles any physical restore/processing step. |
| RC-ADV-04 | Relic Fragment Restoration | Core Conditional | Salvage/Restoration/Event Resolution | Requires one or more concrete/generated/delegated recipe definitions. |
| RC-ADV-05 | Map, Key and Access Knowledge | Core Required | Salvage/Restoration/Event Resolution | Requires one or more concrete/generated/delegated recipe definitions. |
| RC-ADV-06 | Dungeon Maintenance and Consumables | Core Required | Salvage/Restoration/Event Resolution | Requires one or more concrete/generated/delegated recipe definitions. |
| RC-ADV-07 | Event Aftermath Recovery | Core Required | Salvage/Restoration/Event Resolution | Requires one or more concrete/generated/delegated recipe definitions. |
| RC-ADV-08 | Unique Object Loss and Recovery | Core Required | Salvage/Restoration/Event Resolution | Requires one or more concrete/generated/delegated recipe definitions. |
| RC-VRD-01 | Living Heartwood Harvest and Consent | Core Conditional | Realm Recipe/Project | Conditional realm recipe/project family. |
| RC-VRD-02 | Season Sap Collection | Core Conditional | Realm Recipe/Project | Conditional realm recipe/project family. |
| RC-VRD-03 | Thornsilver Fibre Processing | Core Conditional | Realm Recipe/Project | Conditional realm recipe/project family. |
| RC-VRD-04 | Pollen Amber Stabilisation | Core Conditional | Realm Recipe/Project | Conditional realm recipe/project family. |
| RC-VRD-05 | Memory Seed Cultivation | Core Conditional | Realm Recipe/Project | Conditional realm recipe/project family. |
| RC-VRD-06 | Bloomstone Extraction and Cleansing | Core Conditional | Realm Recipe/Project | Conditional realm recipe/project family. |
| RC-VRD-07 | Living Construction Commission | Core Conditional | Realm Recipe/Project | Conditional realm recipe/project family. |
| RC-VRD-08 | Verdant Resolution Reward and Overworld Use | Core Conditional | Realm Recipe/Project | Conditional realm recipe/project family. |
| RC-VEI-01 | Ancestral Threshold Stabilisation | Teaser Only | Ritual/Knowledge Teaser | Teaser-only recipe/knowledge contract; must remain bounded. |
| RC-VEI-02 | Threshold Evidence and Memory Record | Teaser Only | Ritual/Knowledge Teaser | Teaser-only recipe/knowledge contract; must remain bounded. |


# Appendix A. 105 Production Chain Contracts

The following register is adopted from the approved Document 25J chain intake. Chain IDs remain production-planning identities; concrete Recipe IDs are owned by this document.

## Technical Recovery and Migration Chains

| Chain Code | Name | Status | Primary Owner |
| --- | --- | --- | --- |
| RC-REC-01 | Quantity Reconciliation and Quarantine | Core Required | 25D-25E / Runtime |
| RC-REC-02 | Definition Supersession Migration | Core Required | 25B-25D |
| RC-REC-03 | Optional-Pack Removal Preservation | Core Required | 25D / Set 26 Admission |
| RC-REC-04 | Interrupted Production Rollback | Core Required | Document 18 / 25E |

## Immediate Survival and Primitive Capability Chains

| Chain Code | Name | Status | Primary Owner |
| --- | --- | --- | --- |
| RC-SUR-01 | Local Forage to Immediate Food | Core Required | Seed Start / Ecology |
| RC-SUR-02 | Firewood and Emergency Heat | Core Required | Survival / Frontier |
| RC-SUR-03 | Primitive Cutting Tool | Core Required | Primitive Tools |
| RC-SUR-04 | Primitive Mining Tool | Core Required | Primitive Tools |
| RC-SUR-05 | Immediate Shelter Materials | Core Required | Seed Start / Building |
| RC-SUR-06 | Simple Storage and Carrying | Core Required | Inventory / Storage |
| RC-SUR-07 | Clean-Water Access and Container | Core Required | Survival / Health |
| RC-SUR-08 | Field Repair and Salvage | Core Required | Repair / Player Trust |

## Timber, Fibre, Leather and Record-Media Chains

| Chain Code | Name | Status | Primary Owner |
| --- | --- | --- | --- |
| RC-ORG-01 | Hardwood Timber Processing | Core Required | Temperate Forestry |
| RC-ORG-02 | Softwood Framing and Polework | Core Required | Boreal / Upland Forestry |
| RC-ORG-03 | Charcoal Production | Core Required | Forestry / Industry |
| RC-ORG-04 | Resin, Pitch and Sealant | Core Required | Forestry / Routes |
| RC-ORG-05 | Plant-Fibre Cordage | Core Required | All Regions |
| RC-ORG-06 | Reed and Cane Goods | Core Required | Wetland / Mirelight |
| RC-ORG-07 | Textile Fibre to Cloth | Core Required | Agriculture / Textile |
| RC-ORG-08 | Wool to Insulating Textile | Core Required | Domestic Ecology |
| RC-ORG-09 | Hide to Leather and Parchment | Core Required | Creature Resources / Craft |
| RC-ORG-10 | Paper, Ink and Record Media | Core Required | Knowledge / Civilisation |

## Stone, Ceramic, Glass and Mineral Chains

| Chain Code | Name | Status | Primary Owner |
| --- | --- | --- | --- |
| RC-MIN-01 | Common Stone to Rubble and Cut Stone | Core Required | Geology / Building |
| RC-MIN-02 | Limestone to Lime and Mortar | Core Required | Karst / Construction |
| RC-MIN-03 | Clay to Brick and Ceramic | Core Required | Clayworks / Settlement |
| RC-MIN-04 | Sand to Glass | Core Required | Industry / Magic |
| RC-MIN-05 | Aggregate to Road and Drainage Fill | Core Required | Routes / Infrastructure |
| RC-MIN-06 | Salt and Mineral Preservative | Core Required | Food / Health / Trade |
| RC-MIN-07 | Peat and Wetland Fuel | Core Required | Wetland / Moorland |
| RC-MIN-08 | Prospecting Sample and Grade Analysis | Core Required | Exploration / Extraction |
| RC-MIN-09 | Deepstone and Specialist Masonry | Core Conditional | Underground / Adventure |

## Agriculture, Food, Water and Health Chains

| Chain Code | Name | Status | Primary Owner |
| --- | --- | --- | --- |
| RC-FOD-01 | Staple Grain Agriculture | Core Required | Agriculture / Provisions |
| RC-FOD-02 | Root-Crop Agriculture | Core Required | Frontier Agriculture |
| RC-FOD-03 | Orchard and Berry Production | Core Required | Temperate Agriculture |
| RC-FOD-04 | Mushroom and Fungal Food | Core Required | Forest / Fungal Cavern |
| RC-FOD-05 | Domestic Animal Products | Core Required | Domestic Ecology |
| RC-FOD-06 | Wild Game and Ethical Harvest | Core Required | Wildlife / Combat |
| RC-FOD-07 | Basic Meal Preparation | Core Required | Cooking / Survival |
| RC-FOD-08 | Preserved Rations | Core Required | Provisions / Trade |
| RC-FOD-09 | Animal Feed and Fodder | Core Required | Agriculture / Ecology |
| RC-FOD-10 | Herbal Remedy and Bandage | Core Required | Health / Settlement |
| RC-FOD-11 | Antidote and Cleansing Medicine | Core Required | Health / Magic |
| RC-FOD-12 | Relief and Emergency Supply Pack | Core Required | Settlement / Events |

## Copper, Iron, Salvage and Industrial Chains

| Chain Code | Name | Status | Primary Owner |
| --- | --- | --- | --- |
| RC-MET-01 | Copper Ore Extraction and Concentration | Core Required | Extraction / CAP-03 |
| RC-MET-02 | Copper Smelting | Core Required | Refinement / CAP-03 |
| RC-MET-03 | Copper Plate and Sheet | Core Required | Automation / Building |
| RC-MET-04 | Copper Wire and Connectors | Core Required | Automation / Magic |
| RC-MET-05 | Copper Gears and Mechanisms | Core Required | Automation / CAP-03 |
| RC-MET-06 | Copper-Alloy Capability Branch | Core Conditional | 25J Capability Alternatives |
| RC-MET-07 | Iron Ore Extraction and Concentration | Core Required | Extraction / CAP-04 |
| RC-MET-08 | Iron Smelting and Bloom/Ingots | Core Required | Refinement / CAP-04 |
| RC-MET-09 | Iron Plate, Rod and Fasteners | Core Required | Industry / Civilisation |
| RC-MET-10 | Tool and Weapon Blank | Core Required | Craft / Equipment |
| RC-MET-11 | Structural Frame and Project Ironwork | Core Required | Automation / Settlement |
| RC-MET-12 | Mixed Scrap Recovery | Core Required | Salvage / Adventure |

## Automation, Power, Logistics and Maintenance Chains

| Chain Code | Name | Status | Primary Owner |
| --- | --- | --- | --- |
| RC-AUT-01 | Basic Mechanical Power Interface | Core Required | Automation / Power |
| RC-AUT-02 | Chute and Gravity Logistics | Core Required | Automation / Logistics |
| RC-AUT-03 | Cart, Wheel and Bounded Track | Core Required | Routes / Industry |
| RC-AUT-04 | Machine Frame and Processing Assembly | Core Required | Automation / Industry |
| RC-AUT-05 | Filter, Sorter and Routing Control | Core Required | Automation / Storage |
| RC-AUT-06 | Machine Maintenance and Wear Recovery | Core Required | Automation / Settlement |
| RC-AUT-07 | Portable Fuel and Mana Supply | Core Required | Power / Magic |
| RC-AUT-08 | Automation-to-Settlement Supply Contract | Core Required | Automation / Civilisation |

## Creature Resource and Ethical Harvest Chains

| Chain Code | Name | Status | Primary Owner |
| --- | --- | --- | --- |
| RC-CRE-01 | Meat, Fat and Food Recovery | Core Required | Creature / Food |
| RC-CRE-02 | Hide, Fur and Fibre Recovery | Core Required | Creature / Textile |
| RC-CRE-03 | Bone, Horn, Chitin and Shell Processing | Core Required | Creature / Craft |
| RC-CRE-04 | Venom, Toxin and Antidote Research | Core Conditional | Creature / Health / Magic |
| RC-CRE-05 | Silk and Web Fibre | Core Required | Cave Ecology / Automation |
| RC-CRE-06 | Essence and Magical Sample | Core Required | Magic Ecology |
| RC-CRE-07 | Construct Component Salvage | Core Required | Construct Ecology / Adventure |

## Mana, Rune, Ward and Realm-Access Chains

| Chain Code | Name | Status | Primary Owner |
| --- | --- | --- | --- |
| RC-MAG-01 | Mana Source Discovery and Harvest | Core Required | Magic / CAP-05 |
| RC-MAG-02 | Mana Crystal to Shard and Dust | Core Required | Magic / Processing |
| RC-MAG-03 | Rune Substrate Preparation | Core Required | Magic / Craft |
| RC-MAG-04 | Basic Rune Inscription | Core Required | Magic / Automation |
| RC-MAG-05 | Mana Charge and Storage | Core Required | Magic / Power |
| RC-MAG-06 | Ward Component and Maintenance | Core Required | Magic / Settlement |
| RC-MAG-07 | Cleansing Reagent and Restoration | Core Required | Magic / Aftermath |
| RC-MAG-08 | Mana-Mechanical Coupler | Core Required | Magic / Automation |
| RC-MAG-09 | Realm Route Stabilisation Supply | Core Conditional | Realm Access / 14 |

## Settlement, Culture, Trade and Public-Works Chains

| Chain Code | Name | Status | Primary Owner |
| --- | --- | --- | --- |
| RC-SET-01 | Construction Supply Bundle | Core Required | Settlement Projects |
| RC-SET-02 | Guard and Defence Supply | Core Required | Settlement / Defence |
| RC-SET-03 | Health and Infirmary Supply | Core Required | Settlement / Health |
| RC-SET-04 | Food Reserve and Granary Stock | Core Required | Settlement / Provisions |
| RC-SET-05 | Culture Signature Good Production | Core Required | Six Core Cultures |
| RC-SET-06 | Trade Cargo and Shipment Manifest | Core Required | Trade / Routes |
| RC-SET-07 | Tax, Tribute, Donation and Contract Transfer | Core Required | Economy / Factions |
| RC-SET-08 | Repair, Restoration and Public Works | Core Required | Structures / Events |

## Adventure, Loot, Relic and Aftermath Chains

| Chain Code | Name | Status | Primary Owner |
| --- | --- | --- | --- |
| RC-ADV-01 | Site Salvage and Evidence Recovery | Core Required | Adventure Sites |
| RC-ADV-02 | Contextual Container Resolution | Core Required | Loot / Structures |
| RC-ADV-03 | Boss Proof and Reward Package | Core Required | Bosses / Events |
| RC-ADV-04 | Relic Fragment Restoration | Core Conditional | Relics / Culture |
| RC-ADV-05 | Map, Key and Access Knowledge | Core Required | Knowledge / Exploration |
| RC-ADV-06 | Dungeon Maintenance and Consumables | Core Required | Adventure / Survival |
| RC-ADV-07 | Event Aftermath Recovery | Core Required | Events / Law |
| RC-ADV-08 | Unique Object Loss and Recovery | Core Required | Relics / Save Integrity |

## Verdant Covenant Complete Realm Chains

| Chain Code | Name | Status | Primary Owner |
| --- | --- | --- | --- |
| RC-VRD-01 | Living Heartwood Harvest and Consent | Core Conditional | Verdant Covenant |
| RC-VRD-02 | Season Sap Collection | Core Conditional | Verdant Covenant |
| RC-VRD-03 | Thornsilver Fibre Processing | Core Conditional | Verdant Covenant |
| RC-VRD-04 | Pollen Amber Stabilisation | Core Conditional | Verdant Covenant |
| RC-VRD-05 | Memory Seed Cultivation | Core Conditional | Verdant Covenant |
| RC-VRD-06 | Bloomstone Extraction and Cleansing | Core Conditional | Verdant Covenant |
| RC-VRD-07 | Living Construction Commission | Core Conditional | Verdant Covenant |
| RC-VRD-08 | Verdant Resolution Reward and Overworld Use | Core Conditional | Verdant Covenant / Bosses |

## Ancestral Veil Threshold Teaser Chains

| Chain Code | Name | Status | Primary Owner |
| --- | --- | --- | --- |
| RC-VEI-01 | Ancestral Threshold Stabilisation | Teaser Only | Ancestral Veil |
| RC-VEI-02 | Threshold Evidence and Memory Record | Teaser Only | Ancestral Veil |

# Appendix B. 15 Typed Substitution Groups

| Group | Eligible Providers | Compatibility Boundary |
| --- | --- | --- |
| SUB-01 Shelter Material | Timber, common stone, earth/brick, reed/cane or salvaged construction kit. | Must satisfy weather, support and placement capability; presentation may differ. |
| SUB-02 Cutting Edge | Sharp stone, copper/alloy, iron, chitin/bone specialist edge or salvage. | Target hardness and durability band must be valid. |
| SUB-03 Common Fuel | Firewood, charcoal, peat, coal, lamp oil or approved magical heat. | Recipe declares heat class, contamination and renewable/finite preference. |
| SUB-04 Cordage and Flexible Binding | Plant fibre, bast/reed, wool, leather thong, creature silk or culture good. | Tensile, wetness, heat and magic compatibility checked. |
| SUB-05 Structural Masonry | Common stone, cut stone, brick, deepstone or approved living construction. | Load, hazard and repair class required; no universal cosmetic substitution. |
| SUB-06 Staple Provision | Grain, root crop, mushroom, orchard/forage, animal product or imports. | Nutrition, renewability and settlement availability required. |
| SUB-07 Basic Medicine | Medicinal herb, fungus, creature reagent, culture medicine or healer service. | Condition tags and diagnosis coverage must match. |
| SUB-08 Preservation | Salt, drying, smoking, fermentation, cold/magic storage or frequent fresh supply. | Shelf-life and world-setting effects explicit. |
| SUB-09 Copper Mechanism Capability | Copper, approved copper alloy, restored mechanism, trade component or culture technology. | Conductive/mechanical capability and CAP-03 proof required. |
| SUB-10 Durable Structural Capability | Iron, approved equivalent material, restored frame, imported component or alternative structure design. | CAP-04 tool/load/repair capability required. |
| SUB-11 Conductive/Ward Material | Copper conductor, silver-like specialist metal, rune conductor, mana crystal pathway or recovered device. | Magic/power compatibility and risk declared. |
| SUB-12 Sealant and Weatherproofing | Resin/pitch, wax/oil-like culture compound, fitted ceramic/stone solution or Set 26 extension. | Environment and flammability constraints required. |
| SUB-13 Light and Visibility | Fire/torch, lamp oil, mana light, bioluminescent safe source or settlement service. | Duration, hazard, fuel and accessibility cue explicit. |
| SUB-14 Mana Provider | Mineral, leyline, creature essence, ruin/device, culture teacher/trade or realm material. | At least two valid discovery families per supported world profile. |
| SUB-15 Cleansing Provider | Herbal/fungal reagent, filter/charcoal, ward/ritual, specialist service or natural recovery. | Hazard class, waste and outcome limits declared. |

# Appendix C. Core Concrete Recipe Baseline

This table is the reconciled **foundation concrete-recipe baseline**, not the complete eventual shipped recipe database. It preserves useful old ratios where they remain generic, replaces duplicate Block-Item outputs with Block Inventory Projections, and adds representative production-safe recipes needed to instantiate the 25J architecture. Exact values not inherited from an approved earlier recipe remain balance-draft inputs in executable data.

| Recipe ID | Display Name | Class/Station | Inputs | Output/Result | Substitution | Capability | Reconciliation Note |
| --- | --- | --- | --- | --- | --- | --- | --- |
| leyforge.core.recipe.hand.binding.plant_cordage | Twisted Plant Cordage | Hand | 3 Plant Fibre | 1 Cordage Bundle | SUB-04 | CAP-01 | Preserves old 3:1 starter rope ratio as balance draft. |
| leyforge.core.recipe.hand.tool.primitive_cutting | Primitive Cutting Tool | Hand | 2 Stick + 1 compatible cutting edge + 1 Cordage | 1 Primitive Cutting Tool | SUB-02 | CAP-01 | Material variant resolves through tool family. |
| leyforge.core.recipe.hand.tool.primitive_mining | Primitive Mining Tool | Hand | 2 Stick + 2 compatible hard edge + 1 Cordage | 1 Primitive Mining Tool | SUB-02 | CAP-01 | Target hardness capability validated. |
| leyforge.core.recipe.hand.light.basic_torch | Basic Torch Bundle | Hand | 1 Stick + 1 Common Fuel + 1 Fibre | 4 Torch Blocks (projection) | SUB-03 | CAP-00 | Block output uses projection, not Item. |
| leyforge.core.recipe.station.wood.planks | Timber to Planks | Workbench/Saw | 1 Processable Log/Timber Stock | 4 Plank Blocks (projection) |  | CAP-01 | Preserves familiar 1:4 baseline; material family controls exact variant. |
| leyforge.core.recipe.station.wood.beams | Timber to Beams | Workbench/Saw | 2 Processable Logs/Timber Stock | 4 Beam Blocks (projection) |  | CAP-01 | Generated material-family variant. |
| leyforge.core.recipe.station.stone.cut_masonry | Rubble/Stone to Cut Masonry | Workbench/Masonry Station | 4 Stone Chunk equivalent | 4 Masonry Blocks (projection) | SUB-05 | CAP-01 | Exact stone family controls output. |
| leyforge.core.recipe.kiln.clay.brick | Fire Clay Brick | Kiln/Furnace | 1 Clay Lump + Heat | 1 Fired Brick Item/Block-family input |  | CAP-01 | Concrete brick placement resolves through construction recipe/projection. |
| leyforge.core.recipe.furnace.glass.basic | Basic Glass | Furnace | 1 Sand/Glass Feedstock + Heat | 1 Glass Block or Glass Stock per family |  | CAP-01 | Output domain depends on current glass family definition. |
| leyforge.core.recipe.processing.charcoal | Charcoal Production | Kiln | Wood Feedstock + controlled Heat | Charcoal + declared ash/by-product | SUB-03 | CAP-02 | Ratio balance-tuned in executable data. |
| leyforge.core.recipe.processing.lime | Limestone to Lime | Kiln | Limestone + Heat | Lime + CO2/emission record if enabled |  | CAP-02 | Feeds mortar, sanitation and industry. |
| leyforge.core.recipe.station.mortar.basic | Basic Mortar | Mixing/Workbench | Lime + Aggregate + Water | Mortar Batch |  | CAP-02 | Water/resource units explicit in data. |
| leyforge.core.recipe.processing.copper.smelting | Copper Smelting | Furnace/Smelter | Raw/Concentrated Copper + Heat/Fuel | Copper Ingot + Slag |  | CAP-03 | RC-MET-02 anchor. |
| leyforge.core.recipe.processing.copper.plate | Copper Plate | Forge | 1 Copper Ingot | Copper Plate |  | CAP-03 | Exact ratio may use batch conversion. |
| leyforge.core.recipe.processing.copper.wire | Copper Wire | Workbench/Forge | 1 Copper Ingot/Plate | Copper Wire Bundle |  | CAP-03 | RC-MET-04 anchor. |
| leyforge.core.recipe.processing.copper.gear | Copper Gear | Workbench/Forge | Copper Plate + Fastener/Hub | Copper Gear |  | CAP-03 | Mechanism family input. |
| leyforge.core.recipe.processing.iron.smelting | Iron Smelting | Furnace/Smelter | Raw/Concentrated Iron + Heat/Fuel | Iron Bloom/Ingot + Slag |  | CAP-04 | RC-MET-08 anchor. |
| leyforge.core.recipe.processing.iron.plate | Iron Plate | Forge | 1 Iron Ingot/Stock | Iron Plate |  | CAP-04 | Industrial stock. |
| leyforge.core.recipe.processing.iron.rod | Iron Rod | Forge | 1 Iron Ingot/Stock | Iron Rods |  | CAP-04 | Industrial stock. |
| leyforge.core.recipe.processing.iron.fasteners | Iron Fasteners | Forge | Iron Rod/Plate Stock | Fastener Batch |  | CAP-04 | Nails/rivets/bolts resolved by family. |
| leyforge.core.recipe.station.tool.iron_pickaxe | Iron Pickaxe | Forge | Iron Tool Blank + Handle + Binding | Iron Pickaxe Item |  | CAP-04 | Item output; no block projection. |
| leyforge.core.recipe.station.tool.iron_axe | Iron Axe | Forge | Iron Tool Blank + Handle + Binding | Iron Axe Item |  | CAP-04 | Item output. |
| leyforge.core.recipe.station.weapon.iron_blade | Iron Blade Weapon | Forge | Iron Weapon Blank + Handle/Grip | Configured Blade Weapon Item |  | CAP-04 | Combat stats owned by Document 16. |
| leyforge.core.recipe.station.storage.wooden_chest | Wooden Storage Chest | Workbench | Plank Blocks/Timber Components + Fasteners | Storage Chest Block (projection) |  | CAP-01 | No duplicate Chest Item. |
| leyforge.core.recipe.station.functional.workbench | Workbench | Hand/Workbench | Plank/Timber Components | Workbench Block (projection) | SUB-01 | CAP-01 | No duplicate Workbench Item. |
| leyforge.core.recipe.station.functional.furnace | Basic Furnace | Workbench/Masonry | Masonry + Furnace Core/Firebox Components | Furnace Block (projection) | SUB-05 | CAP-02 | No duplicate Furnace Item. |
| leyforge.core.recipe.automation.frame.basic | Machine Frame Assembly | Workbench/Assembler | Structural Timber/Metal + Fasteners | Machine Frame Component Item | SUB-10 | CAP-03 | Component Item is distinct from installed machine Block. |
| leyforge.core.recipe.automation.chute.basic | Basic Chute Segment | Workbench/Assembler | Timber/Metal Sheet + Fasteners | Chute Block (projection) |  | CAP-03 | Block output projection. |
| leyforge.core.recipe.automation.sorter.basic | Basic Sorter/Filter Module | Workbench/Assembler | Frame Component + Mechanism + Filter Component | Sorter Module Item or Block per current family |  | CAP-03 | Exact installed lifecycle resolved by 03/04 definitions. |
| leyforge.core.recipe.automation.maintenance.basic | Machine Maintenance | Repair/Maintenance | Compatible Maintenance Parts + Lubricant/Tool Service | Condition improvement on target machine |  | CAP-03 | Preserves target identity. |
| leyforge.core.recipe.food.basic_meal | Basic Cooked Meal | Cooking | Valid Staple Provision + optional flavour/protein + Heat | Cooked Meal Item | SUB-06 | CAP-02 | Set 29 owns nutrition outcome. |
| leyforge.core.recipe.food.preserved_ration | Preserved Ration | Preservation | Food + Preservation Provider | Preserved Ration Item | SUB-08 | CAP-02 | Freshness transform explicit. |
| leyforge.core.recipe.health.bandage | Basic Bandage | Hand/Medical | Clean Textile/Fibre + sanitation requirement | Bandage Item | SUB-07 | CAP-02 | Treatment outcome Set 29-owned. |
| leyforge.core.recipe.health.herbal_remedy | Herbal Remedy | Medical/Alchemy | Compatible Medicinal Provider + Clean Water/Carrier | Remedy Item | SUB-07 | CAP-02 | Condition coverage encoded as capability facet. |
| leyforge.core.recipe.magic.mana.shard | Mana Crystal to Shards | Magic Processing | Raw Mana Crystal | Mana Shard Item(s) |  | CAP-05 | Preserved generic POC capability. |
| leyforge.core.recipe.magic.mana.dust | Mana Shard to Dust | Magic Processing | Mana Shard | Mana Dust Item |  | CAP-05 | Preserved generic POC capability. |
| leyforge.core.recipe.magic.rune.substrate | Rune Substrate Preparation | Rune Table/Workbench | Compatible Substrate + Binder/Tool | Rune Substrate Item/Block as defined | SUB-11 | CAP-05 | Installed substrate may be Block; blank portable rune may be Item. |
| leyforge.core.recipe.magic.rune.basic_inscription | Basic Rune Inscription | Rune Table | Rune Substrate + Mana Provider + knowledge | Inscribed Rune Item/Block state | SUB-14 | CAP-05 | Document 09 owns rune effect. |
| leyforge.core.recipe.magic.ward.component | Ward Component Assembly | Rune Table/Assembler | Conductor + Rune + Mana Component | Ward Component Item | SUB-11 | CAP-05 | Installed ward is separate Block lifecycle if applicable. |
| leyforge.core.recipe.magic.coupler.basic | Mana-Mechanical Coupler | Rune Table/Assembler | Mechanical Component + Conductive/Ward Material + Mana Component | Mana-Mechanical Coupler Item | SUB-11 | CAP-05 | RC-MAG-08 anchor. |
| leyforge.core.recipe.settlement.supply.construction | Construction Supply Package | Packing/Project | Exact declared construction goods | Manifested Construction Supply Package | SUB-01 | CAP-06 | Package references real contents; not a crate substitute. |
| leyforge.core.recipe.settlement.supply.guard | Guard Supply Package | Packing/Project | Exact food/gear/ammunition/repair goods | Manifested Guard Supply Package |  | CAP-06 | Set 27 may attach contract/payment. |
| leyforge.core.recipe.settlement.supply.medical | Medical Supply Package | Packing/Project | Bandages + remedies + clean containers/tools | Medical Supply Package Item | SUB-07 | CAP-06 | Exact contents conserved. |
| leyforge.core.recipe.settlement.supply.food_reserve | Food Reserve Package | Packing/Granary | Staple/preserved provisions | Food Reserve Lot | SUB-06 | CAP-06 | Granary stock remains physical goods. |
| leyforge.core.recipe.trade.cargo.manifest | Cargo Manifest Assembly | Packing/Trade | Exact goods + record medium | Cargo Lot/Manifest Item |  | CAP-06 | No physical crate duplication. |
| leyforge.core.recipe.repair.structure.basic | Structure Repair Work Package | Project/Repair | Compatible material + tools + labour | Condition/state improvement on structure | SUB-01 | CAP-06 | Structure history retained. |
| leyforge.core.recipe.salvage.mixed_scrap | Mixed Scrap Recovery | Salvage | Eligible damaged components/object + claim permission | Bounded Scrap/Reusable Components |  | CAP-04 | No full-cost duplication. |
| leyforge.core.recipe.adventure.relic_restore | Relic Fragment Restoration | Restoration | Compatible fragments + specialist tools/knowledge | Restored Relic state/item |  | CAP-07 | Unique identity/provenance retained. |
| leyforge.core.recipe.realm.verdant.living_construction | Verdant Living Construction Commission | Realm Project | Consent-approved living material + realm service + support inputs | Living Construction project result |  | CAP-10 | Conditional Verdant package. |
| leyforge.core.recipe.realm.ancestral.threshold_stabilisation | Ancestral Threshold Stabilisation | Ritual/Route | Approved teaser inputs + knowledge/permission | Threshold stabilisation state/evidence |  | CAP-09 | Teaser Only; no farmable production loop. |
| leyforge.maritime.recipe.material.caulking | Marine Caulking/Sealant Preparation | Shipwright/Processing | Sealant Provider + fibre/binding as specified | Caulking/Sealant Item | SUB-12 | Maritime | Set 26H owns application/work validity. |
| leyforge.maritime.recipe.component.hull_fastening | Marine Hull Fastener Batch | Forge/Shipwright | Approved metal stock | Marine Fastener Batch |  | Maritime | Set 26 admits exact material roles. |
| leyforge.maritime.recipe.project.vessel_repair_supply | Vessel Repair Supply Package | Packing/Shipwright | Exact compatible hull/rigging/repair goods | Manifested Vessel Repair Supply |  | Maritime | Set 26H work package consumes it; not instant repair. |
| leyforge.maritime.recipe.food.voyage_ration | Voyage Ration | Preservation | Food + preservation provider + packing | Voyage Ration Item | SUB-08 | Maritime | Set 29 owns biological outcome; Set 26 owns voyage use. |
| leyforge.core.recipe.transport.cart_component | Cart/Wagon Component Assembly | Workbench/Forge | Timber/structural stock + fasteners + mechanism | Transport Component Item/Block per family |  | Transport | Set 30 owns movement/vehicle behaviour. |
| leyforge.core.recipe.transport.rail_segment | Guided Track Segment | Workbench/Forge | Structural support + rail material + fasteners | Track Block (projection) | SUB-10 | Transport | Block output projection; Set 30 owns guided movement. |

## C.1 Concrete baseline interpretation rules

- A Block named in the output column means the canonical Block through Block Inventory Projection unless the owning Block definition explicitly uses a direct placed-world installation transaction.
- An Item named in the output column must resolve to Document 04.
- “per family”, “as defined” and similar wording means the concrete executable recipe is generated or specialised from the canonical family definitions; these phrases are not valid runtime IDs.
- Maritime rows establish admission hooks only. Set 26 remains the specialist authority for whether a vessel/shipyard work package can execute them.
- Food/medicine rows never encode final biological effect values in Document 05.
- Market price/payment is never embedded in these recipes.

# Appendix D. Universal Recipe Record Template

```yaml
recipe_id: leyforge.core.recipe.<category>.<path>
version: 1
lifecycle: active
pack_owner: leyforge.core
recipe_family_ref: leyforge.core.recipe_family.<family>
chain_refs: []
capability_requires: []
capability_provides: []
category: station
station_requirements: []
tool_requirements: []
environment_requirements: []
permission_requirements: []
knowledge_requirements: []
inputs:
  - ref_type: item_ref
    ref: leyforge.core.item.<path>
    quantity: 1
    unit: count
    substitution_group_ref: null
    state_predicates: []
outputs:
  - ref_type: block_projection_ref
    ref: leyforge.core.block.<path>
    quantity: 1
    unit: count
by_products: []
process:
  time_units: 0
  batch_size: 1
  power_requirement: null
  interrupt_policy: safe_pause
state_transfer:
  provenance: aggregate_if_required
  ownership: transaction_destination
  quality: recipe_defined
failure:
  mode: deterministic
  rollback: full_before_commit
unlock:
  state: discoverable
  refs: []
presentation:
  localisation_key: recipe.<path>.name
  warning_keys: []
validation_tags:
  - conservation_required
  - block_item_duplicate_forbidden
```

The template is illustrative of the required field semantics; Document 18/Set 25 schema compilation owns the final serialisation syntax.

# Appendix E. Transaction and State-Transfer Matrix

| Operation | Input Handling | Identity Result | State Handling | Rollback Rule |
| --- | --- | --- | --- | --- |
| Ordinary craft | Reserve then consume exact stack quantities. | New Item/Block projection outputs. | Maker/provenance as configured. | Full before commit. |
| Smelt/refine | Reserve raw batch + fuel/energy. | New refined stock + by-products. | Grade/purity transformed. | Partial only if explicit batch commit occurred. |
| Repair Item | Reserve repair stock; target Item is not consumed. | Same Item instance. | Condition improves; history may append. | Target unchanged before commit. |
| Repair Block | Reserve material; target Block remains. | Same Block instance/state lineage. | Damage/condition changes. | World state unchanged before commit. |
| Project stage | Reserve exact goods/labour inputs. | Project/structure state advances. | Contributor/provenance evidence retained. | Stage cannot advance without commit. |
| Salvage | Reserve/lock source object and claim. | Source altered/destroyed; bounded outputs created. | Source provenance propagates as appropriate. | Source remains if commit fails. |
| Pack cargo | Reserve exact goods. | Cargo-lot/manifest object references transferred contents. | Custody/owner updated. | No duplicate contents. |
| Unpack cargo | Lock cargo lot/container relation. | Goods released; package state updated/destroyed as defined. | Custody preserved. | Atomic release. |
| Magic inscription | Reserve substrate/reagents/charge. | Same substrate state or new rune object. | Charge/purity/risk transformed. | No free copied charge. |
| Vessel work | Set 26 work package reserves exact goods. | Vessel/local-grid state changes. | Vessel history/provenance retained. | Set 26H recovery rules. |
| Distant NPC craft | Aggregate reservation and process. | Same net outputs as near execution. | Required provenance/owner summary retained. | Reconcile before promotion. |

# Appendix F. Validation Reason Codes

| Code | Blocking Condition |
| --- | --- |
| RECIPE-ID-001 | Duplicate qualified Recipe ID. |
| RECIPE-REF-001 | Missing Item/Block/station/capability reference. |
| RECIPE-BLOCK-001 | Recipe outputs duplicate Item for same canonical Block identity. |
| RECIPE-BLOCK-002 | Recipe outputs both Block projection and duplicate Item for same result. |
| RECIPE-CONS-001 | Unexplained material creation or destruction. |
| RECIPE-CONS-002 | Input can be spent twice because reservation is not exclusive. |
| RECIPE-CONS-003 | By-product/waste disappears without declared sink. |
| RECIPE-STATE-001 | Charge, provenance, contamination, quality or unique state is copied/lost illegally. |
| RECIPE-SUB-001 | Unbounded wildcard substitution bypasses required capability. |
| RECIPE-SUB-002 | Substitution group provider fails recipe compatibility predicate. |
| RECIPE-PROG-001 | Core capability chain has no valid recipe/provider path. |
| RECIPE-PROJ-001 | Project stage can advance without exact committed resources. |
| RECIPE-AUT-001 | Automated and manual execution produce different unexplained net results. |
| RECIPE-LOD-001 | Near/far execution changes conserved totals. |
| RECIPE-SAVE-001 | Save/load duplicates, loses or restarts committed work incorrectly. |
| RECIPE-PACK-001 | Optional-pack removal corrupts active job or reserved stock. |
| RECIPE-AUTH-001 | Client/UI can commit authoritative craft without server/world validation. |
| RECIPE-OWN-001 | Crafting silently erases ownership/claim/provenance that must survive. |
| RECIPE-UI-001 | Player cannot determine a critical blocker/risk/permission reason. |
| RECIPE-POC-001 | Active production recipe depends on fixed POC identity/location/scenario. |
| RECIPE-MAR-001 | Core recipe attempts to own a Set 26 vessel-work rule rather than consume its interface. |

# Appendix G. Legacy POC Recipe Migration Register

| Legacy Pattern | Production Action |
| --- | --- |
| `recipe.*.block_item.*` same-identity output | Rewrite output to canonical `block_projection_ref`; retain legacy recipe ID as alias if save/history requires it. |
| Forest Hamlet Watchtower Supply Crate | Archive fixed name/scenario; migrate generic supply contents to settlement project package where applicable. |
| Watchtower Foundation/Frame/Platform fixed recipes | Archive fixed POC blueprint-stage IDs; generic tower/project stage recipes owned through current building definitions. |
| Completed Watchtower recipe | Invalid as instant inventory craft; completion is project/structure state transition. |
| Village Supply Token Issue | Remove as physical substitute if it represented abstract goods; use contract/evidence record plus real stock. |
| Warehouse Manifest | Retain only as record/cargo/contract identity if it has genuine separate Item/knowledge lifecycle. |
| Basic Item Chute “Block Item” output | Migrate to canonical Chute Block projection. |
| Workbench/Furnace/Ward Lantern/Mana Furnace “Block Item” output | Migrate to canonical Block projection. |
| POC `scope` field | Remove from shipped recipe definition; archive in source history/testing metadata. |
| Fixed valley/mana pocket/goblin-camp unlock dependency | Replace with capability/knowledge/world-context provider; fixed references archived. |

# Appendix H. Cross-System Ownership Matrix

| Concern | Document 05 Owns | Consumed Owner |
| --- | --- | --- |
| Exact transformation | Yes | - |
| Block identity | No | 03 |
| Item identity/state schema | No | 04 |
| Resource origin/progression | No | 06 / Atlas / 25J |
| Recipe unlock relation | Yes, reference/condition | 02/09/13/15/etc. provide authority facts |
| Machine process definition | Yes | 08 executes network/process state |
| Project material stage | Yes | 19-20 own project/building semantics |
| Market price/payment | No | 27 |
| Social willingness | No | 28 |
| Biological result | No | 29 |
| Movement result | No | 30 / 26E aquatic |
| Vessel work validity | No | 26H/26F/etc. |
| World source distribution | No | 11 / Atlas |
| Presentation | No | Forge/Presentation |
| Runtime transaction implementation | No | 18 |

# Appendix I. Document 05 v1.0 Acceptance Checklist

- [x] Replace POC-first recipe framing with production authority.
- [x] Preserve valid hand/station/machine/cooking/repair/project/magic recipe classes.
- [x] Adopt all 105 Document 25J chain contracts.
- [x] Adopt all 15 typed substitution groups.
- [x] Replace fixed material ladder with CAP-00 to CAP-10 capability graph.
- [x] Consume canonical Document 03 Block identities directly.
- [x] Consume canonical Document 04 Item identities directly.
- [x] Ban duplicate Block-Item outputs.
- [x] Define Block Inventory Projection recipe outputs.
- [x] Define reservation, transaction and conservation semantics.
- [x] Define state transfer, provenance, quality, charge and contamination rules.
- [x] Define by-product/waste rules.
- [x] Define repair, maintenance, salvage and recycling identity rules.
- [x] Define generated shape/variant recipe architecture.
- [x] Preserve cooking/preservation while moving biological outcome to Set 29.
- [x] Preserve practical magic transformations while keeping magic consequence in Document 09.
- [x] Integrate settlement/project resource stages without taking Document 19-20 ownership.
- [x] Integrate Set 26 maritime recipe requirements without reducing vessels to inventory crafts.
- [x] Consume Set 27-30 interfaces without duplicating economy/social/biology/movement rules.
- [x] Remove fixed Forest Hamlet/watchtower/goblin-camp dependencies from production.
- [x] Preserve reusable POC capabilities unless explicitly superseded.
- [x] Define save/migration/optional-pack behaviour.
- [x] Define multiplayer/LOD conservation requirements.
- [x] Define release-blocking validation codes.
- [x] Provide a concrete production-safe recipe baseline.

---

# Closing Production Lock

Document 05 v1.0 establishes one transformation authority for Leyforge. Recipes are no longer lists of loosely related crafting formulas or POC milestones. They are stable, validated, conserved contracts connecting canonical Blocks, Items, resources, knowledge, tools, stations, projects and specialist systems.

The central rule is intentionally simple:

> **Reference the real thing. Reserve the real cost. Transform it once. Preserve the state that matters. Record the result.**

That rule applies equally to hand crafting a primitive tool, smelting iron, cooking a meal, inscribing a rune, repairing a machine, supplying a settlement project, processing salvage, commissioning realm infrastructure or contributing materials to a vessel work package.

No recipe may recreate the duplicate Block/Item identity problem. No automation or distant simulation may conjure stock. No project may advance from an abstract counter while its physical materials still exist elsewhere. No specialist-system integration may be reimplemented locally simply because the recipe touches it.

With Documents 03, 04 and 05 reconciled, the remaining material foundation can now move into Document 06 v1.0 with a clean separation: **Blocks own placeable identity, Items own distinct carried identity, Recipes own transformations, and Resources own origin/progression/provenance.**
