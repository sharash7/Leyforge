# LEYFORGE

## 04 - Canonical Items Registry, Inventory, Equipment and Production Families

### Carried Identity, Item Families, State, Equipment, Provenance, Block Deduplication and Cross-System Facets

**Version 1.0 - Reconciled Production Foundation Draft**
**Date:** 8 August 2026
**Supersedes:** `04_Fantasy_Voxel_Civilisation_Sandbox_Items_Registry_v0_1.md` for active production direction
**Project Lead and Final Authority:** Ash

A production-scale, data-driven item authority for Leyforge defining what counts as an Item, how carried and equipped identities are represented, how stacks and persistent instances conserve state and ownership, how Items interact with Blocks without duplicated canonical definitions, and how crafting, resources, combat, economy, social systems, biology, movement, maritime play, settlements, quests, Forge presentation and runtime persistence consume Item truth without owning it twice.

> **Canonical Item Identity Rule**
>
> **A canonical Item exists only when the carried, equipped, consumed, studied, installed, traded or otherwise inventory-managed object has identity or lifecycle meaning distinct from a canonical Block. Inventory presence alone never justifies a second Item definition.**

> **Single Block/Item Truth Rule**
>
> **If a placeable Block is recovered as that same Block, it remains one canonical Block definition. Inventory, hotbar, storage, trade and recipes use a Block Inventory Projection referencing the Block ID. A duplicate `item.block.*` or equivalent canonical Item is forbidden.**

> **Capability, Not Consequence Rule**
>
> An Item may expose a capability, payload, protection trait, movement facet, treatment function, weapon/equipment facet or economic identity. The specialist system that owns the outcome remains authoritative. An item saying “healing”, “grapple”, “insulated”, “valuable” or “diplomatic gift” does not independently calculate biology, movement, price or social consequence.

---

# Document Purpose

Document 04 is the production authority for Leyforge's canonical **Item domain**. It replaces the original POC-era item registry and consumes the post-Atlas family catalogue, registry governance and later specialist-system interfaces without turning this document into a duplicate of those systems.

Version 1.0 preserves the strongest original item-system intentions:

- separate immutable Item definitions from mutable Item stacks and persistent Item instances;
- support raw resources, refined materials, tools, weapons, armour, accessories, consumables, food, medicine, magical components, automation components, knowledge, trade goods, culture goods, loot, relics and quest-facing objects;
- support durability, charge, quality, condition, spoilage, contamination, provenance, ownership and unique state only where each family actually requires them;
- keep old materials and ordinary goods useful through recipes, settlement demand, repair, trade, culture and specialist functions rather than pure stat escalation;
- let NPCs, settlements, automation, quests, combat, trading and containers use the same authoritative inventory identities and transactions as the player;
- keep rarity/scarcity, progression capability, quality, condition, provenance, significance and value as separate dimensions;
- use stable qualified IDs, aliases, tombstones, pack ownership, migrations and recovery records;
- keep presentation assets replaceable and separate from gameplay identity.

It removes or supersedes:

- the rule that every placeable Block requires a separate Item definition;
- the ten generated `block_form.*` pseudo-item families in Document 25I as canonical Item families;
- POC-only item selection, fixed Forest Hamlet/watchtower supply chains and POC Required planning fields as production authority;
- short-ID assumptions and any Unreal-specific asset-path identity;
- fixed item prices or value-as-an-item-property;
- direct item-owned biological, social or movement outcomes when Sets 29, 28 or 30 own those results;
- duplicate physical crate/container identities where the placeable container is already a Block.

The most important reconciliation is the **Block/Item deduplication boundary** introduced by Foundation Decision FR-00-20-006 and implemented first in Document 03 v1.0. The old Document 25I catalogue counted ten generated Block-Item Form Profiles inside its 296 proposed item-family contracts. Those ten profiles are no longer Items. They are Block Inventory Projection profiles generated from Document 03. This produces a reconciled baseline of **286 canonical Item-family contracts: 253 Core Required, 30 Core Conditional and 3 Teaser Only**, before future approved family additions or explicit deprecations.

---

# Production Status and Authority

| Field | Reconciled Direction |
| --- | --- |
| Registry Model | Family-first canonical Item definitions plus typed stack/instance/runtime state profiles. |
| Identity | Stable qualified IDs; display name, icon, model, file path and market price are never identity. |
| Primary Namespace | `leyforge.core.item.*` for Core Items; approved extension/expansion namespaces for optional systems. |
| Canonical Family Baseline | 286 Item-family contracts after reclassifying the ten Block-Item Form families: 253 Core Required, 30 Core Conditional, 3 Teaser Only. |
| Block Boundary | Same recovered placeable identity = Block only + Block Inventory Projection. |
| Resource Boundary | Document 04 owns inventory identity/state; Document 06/25J own resource ecology, source/progression and provenance rules. |
| Recipe Boundary | Document 05 owns transformations, ingredients, quantities, stations, by-products and project recipes. |
| Combat Boundary | Document 16 owns damage/defence/action rules; Items expose equipment/weapon facets and persistent condition. |
| Economy Boundary | Set 27 owns contextual value, prices, currency economics, contracts and transactions; Items own physical currency/goods identity where applicable. |
| Social Boundary | Set 28 owns trust, relationships, social meaning, willingness and companion agreements; Items expose possession/gift/credential facts only. |
| Biology Boundary | Set 29 owns Health/Stamina/Fatigue, hunger/hydration, exposure, injury, disease and treatment outcomes; Items expose biological capability/mitigation traits. |
| Movement Boundary | Set 30 owns movement/traversal/transport execution; Items expose movement/traversal equipment facets. Aquatic specialist movement remains Set 26 through the final reconciled facade. |
| Maritime Boundary | Set 26 owns maritime item-use semantics, vessel components, diving/fishing/naval systems; Document 04 owns admitted Item identity/state and extension facets. |
| Forge Boundary | Forge/Presentation owns icons, models, animations, material appearance, audio/VFX and sockets; gameplay identity remains stable. |
| POC Status | Retired fixed POC items/links are archive, aliases or regression evidence only; generic reusable Items and capabilities survive. |
| Engine Direction | Canonical data compiles to validated Godot Resources/runtime registries. Runtime implementation is Document 18-owned. |

# Source and Supersession Hierarchy

For Item-domain interpretation, use this order:
1. explicit approved project direction and later approved reconciliation amendments;
2. Foundation Reconciliation Register v0.2, especially FR-00-20-006;
3. Documents 00-03 v1.0 for production vision, loop, progression and canonical Block boundary;
4. Document 25B v0.2 for qualified IDs, namespaces, one-owner source-of-truth rules, facets, aliases and migration;
5. Document 25I v0.1 for the approved item-family intake, after the explicit block-form reclassification in this document;
6. Document 25J for resource, provenance, capability, substitution, loot and transformation-chain requirements;
7. Documents 25C-25H and 25K-25L for schemas, packages, physical coverage, presentation manifests, validation and backlog gates;
8. Document Set 24 for Atlas ecology, cultures, sites, historical context, resources and contextual loot;
9. Document Sets 21-23 for Voxel/Entity/Blueprint/Presentation Forge outputs;
10. Document Set 26 for maritime item use, diving, fishing, cargo, vessel components, rescue and naval extensions;
11. Leyforge Document Sets 27-30 Cross-Set Interface Register v1.1 Final Reconciled plus the reconciled specialist sets for economy, social systems, biology and movement;
12. original Document 04 v0.1 as legacy intent/migration evidence;
13. Document 99 and fixed POC content as historical/regression evidence only.

> **Reconciliation Amendment to Document 25I**
>
> Every 25I reference to a generated “Block-Item Form” is interpreted in production as a **Block Inventory Projection** owned by the Block/inventory boundary, not as a canonical Item-family definition. Legacy `leyforge.core.item.family.block_form.*` identifiers become migration aliases/profile references only and may not be authored as ordinary Items.

# Static Table of Contents

- 1. Locked Item Registry Identity
- 2. Canonical Terminology
- 3. Source-of-Truth Architecture
- 4. Qualified IDs, Namespaces and Lifecycle
- 5. Item Family, Definition, Stack, Instance and Runtime Separation
- 6. Block/Item Identity Boundary
- 7. Block Inventory Projections Are Not Items
- 8. Item-Block Transformation and Installation Relationships
- 9. Portable Containers, Packed Blocks and Cargo Lots
- 10. Item Definition Schema
- 11. Stack and Instance State Profiles
- 12. Stacking Compatibility and State Preservation
- 13. Quantity, Conservation and Authoritative Transactions
- 14. Ownership, Custody, Claims and Permissions
- 15. Provenance, Maker, Source and Chain of Custody
- 16. Scarcity, Capability, Quality, Condition, Significance and Value
- 17. Acquisition, Use Actions and Capability Providers
- 18. Resource and Material Boundary
- 19. Crafting, Recipes, Repair and Recycling Boundary
- 20. Food, Water, Medicine and Consumables
- 21. Creature Products, Samples and Personhood Boundary
- 22. Tools, Instruments and Work Equipment
- 23. Weapons, Armour, Accessories and Equipment
- 24. Automation, Machine and Infrastructure Components
- 25. Mana, Runes, Magical Components and Knowledge
- 26. Settlement Supplies, Trade Goods, Cargo and Records
- 27. Culture Goods, Gifts and Credentials
- 28. Maps, Books, Blueprints, Contracts and Knowledge Objects
- 29. Adventure Loot, Relics, Boss Proofs and Unique Items
- 30. Realm and Conditional Item Packages
- 31. Set 26 Maritime Item Integration
- 32. Set 27 Economy, Currency and Price Integration
- 33. Set 28 Social, Companion and Gift Integration
- 34. Set 29 Biological Equipment and Consumable Integration
- 35. Set 30 Movement, Traversal and Transport Equipment Integration
- 36. Equipment Fit, Body Plans and Accessibility
- 37. Inventory Capacity, Containers and Carrying Boundary
- 38. UI, Search, Filters and Explainability
- 39. Forge, Presentation, Icons, Held Models, Audio and VFX
- 40. Packs, Optional Content and Missing-Definition Recovery
- 41. Save, Migration, Aliases and Legacy Block-Item Cleanup
- 42. Cross-Registry Duplicate Audit
- 43. POC Preservation and Retirement Rules
- 44. Validation, QA and Acceptance Gates
- 45. Handoff to Documents 05, 06, 16, 17 and 18
- 46. Production Decisions Locked by v1.0
- Appendix A. Reconciled Canonical Item-Family Register
- Appendix B. Block Inventory Projection Migration Register
- Appendix C. Stack and Instance-State Profiles
- Appendix D. Block/Item Collision Resolution Register
- Appendix E. Universal Item Definition Template
- Appendix F. Cross-System Facet Templates
- Appendix G. Legacy Migration and Tombstone Rules
- Appendix H. Document 04 v1.0 Replacement Checklist

# 1. Locked Item Registry Identity

The Item Registry is the authority for **inventory-facing object identity and persistent carried/equipped state**. It is not a catalogue of everything that can be held in a UI slot. A Block projection may occupy a slot without becoming an Item; an entity token may be represented in UI without becoming inventory; a contract may have a physical document Item while its legal truth remains elsewhere.

| Identity Layer | Meaning | Player-Facing Result |
| --- | --- | --- |
| Carried Identity | Defines real non-Block objects that can be gathered, carried, equipped, consumed, installed, traded, studied, displayed or recovered. | Inventories contain meaningful objects rather than duplicate mirrors. |
| State Conservation | Stack and instance state survives legitimate transfers, crafting, automation, trade, death, save/load and migration. | No silent duplication, deletion or state erasure. |
| Physical Chains | Items connect real sources to recipes, machines, settlement use, equipment, trade and rewards. | Civilisation and progression consume actual objects. |
| Context Without Duplication | World history, prices, biology, movement and social meaning remain with their owners. | One Item can matter to many systems without copying their truth. |
| Family Before Explosion | Shared roles/state profiles are defined before material/culture/quality variants multiply. | Catalogue stays searchable and maintainable. |
| Stable Identity | Definition IDs and persistent instance IDs survive presentation changes and migrations. | Player possessions remain trustworthy across updates. |

> **Locked Rule**
>
> If two records describe the same physical thing through the same lifecycle, they may not both remain canonical merely because different systems want convenient references. One record owns identity; other systems reference it through facets, projections or relationships.

# 2. Canonical Terminology

| Term | Definition |
| --- | --- |
| Item Family | Governed parent contract sharing role, state model, tags, relationships and package expectations. |
| Concrete Item Definition | Stable executable Item entry such as a specific tool, material unit, meal, rune, weapon, record or relic. |
| Item Stack | Quantity of stack-compatible Items represented together while preserving required batch state. |
| Item Instance | Persistent singular Item object with state such as durability, owner, charge, calibration, contents, provenance or uniqueness. |
| Batch State | Shared state for a stack such as freshness, purity, grade, source, contamination or production lot. |
| Block Inventory Projection | Inventory representation of a canonical Block. It references the Block ID and is explicitly not an Item definition. |
| Portable Component | Item whose lifecycle is carried/installed/consumed and which may become part of a Block, machine, structure or vessel through an owning transaction. |
| Cargo Lot | Authoritative grouping/manifest of exact goods under custody; not automatically a separate physical crate identity. |
| Knowledge Item | Physical or inventory-manageable record such as book, map, chart, scroll or blueprint medium. Knowledge truth/unlocks may be separate records. |
| Recovery Item | Visible quarantine or migration object used to preserve unknown/invalid Item payload safely. |
| Tombstone | Non-spawnable definition preserving an old ID, reason and replacement/alias path. |
| Facet | Typed data supplied to another system without transferring canonical identity or system ownership. |

# 3. Source-of-Truth Architecture

| Concern | Canonical Owner | Document 04 Role |
| --- | --- | --- |
| Placed voxel identity | 03 | Reference Block IDs; never mirror placed fields. |
| Carried/equipped non-Block identity | 04 | Own canonical Item definition and item-specific state. |
| Recipe/transformation | 05 | Reference recipe IDs and valid use capabilities. |
| Resource ecology/progression | 06 / 25J | Reference resource/material/provenance roles. |
| Inventory transaction runtime | 18 | Document required schemas and authority contracts; runtime implements them. |
| Combat actions/defence | 16 | Expose equipment facets; do not calculate damage here. |
| Price/value/markets/currency economics | 27 | Expose physical goods/currency identity; consume Set 27 quote/transaction outcomes. |
| Relationship/social meaning | 28 | Expose gift/credential/possession facts only. |
| Biological response | 29 | Expose food/treatment/protection/load facets only. |
| Movement/traversal | 30 | Expose movement/traversal equipment facets only. |
| Aquatic/maritime specialist use | 26 | Own admitted Item definition state; consume Set 26 specialist semantics. |
| Presentation | 21-23 / 25K | Reference icon/model/equipment/presentation manifests. |

The Item Registry is therefore intentionally narrow in ownership but broad in connectivity.

# 4. Qualified IDs, Namespaces and Lifecycle

Production Item IDs follow the qualified registry rules established by Set 25. A recommended Core grammar is:

```text
leyforge.core.item.family.<domain>.<identity>
leyforge.core.item.<domain>.<identity>
leyforge.expansion.<pack>.item.<domain>.<identity>
```

Rules:
- IDs describe canonical identity, not current display names, rarity colours or file paths.
- Core Items receiving maritime/social/biological/movement facets keep their Core IDs.
- Items that exist only because an optional expansion is installed use an approved expansion namespace.
- Prototype/test IDs use test/dev namespaces and never become production fallback IDs.
- retired POC IDs remain aliases/tombstones/archive metadata and never spawn through normal production.
- renaming a display label never changes identity; semantic lifecycle changes require explicit migration.

# 5. Item Family, Definition, Stack, Instance and Runtime Separation

| Layer | Owns | Must Not Be Used As |
| --- | --- | --- |
| Family | Shared role/state/validation contract. | A specific player-owned object. |
| Concrete Definition | Immutable executable content identity. | Mutable durability/owner/contents. |
| Stack | Quantity + compatible batch state. | Definition truth. |
| Instance | Persistent singular object state. | Family metadata. |
| Runtime Equipment Binding | Who has it equipped, socket/slot, temporary action state. | Permanent Item definition. |
| Inventory/Container Location | Current custody/location. | Ownership of identity or immutable definition. |

A definition may request instance state only when gameplay requires it. Ordinary nails, fibre or grain should not become thousands of heavyweight persistent instances merely because the engine supports instances.

# 6. Block/Item Identity Boundary

The decisive test is **lifecycle identity**, not inventory usability.

| Case | Canonical Treatment | Example |
| --- | --- | --- |
| Placed object recovers as itself | Block only + Block Inventory Projection | Planks, bricks, glass, ladder, door, rail, workstation or machine that packs as the same Block. |
| World Block transforms into different harvested material | Block + distinct Item | Ore deposit -> Raw Ore; herb plant -> Medicinal Herb; crystal node -> crystal/shards. |
| Portable component installs into different placed assembly | Item + Block | Mana Conduit Core -> Mana Conduit Block; Rune Blank -> installed Rune Substrate/Inscription. |
| Portable kit creates a structure/project | Item + structure/project transaction | Repair kit or construction package consumed by project rules. |
| Stateful Block is picked up with permitted state | Block only + packed projection payload | Chest/machine with explicit packing rule. |
| Same thing duplicated under two names | Forbidden | Project Supply Crate Item + identical Project Supply Crate Block. |

A visual resemblance does not by itself prove duplication. A separate Item is valid only if its source, use, state or transformation lifecycle is materially different and the relationship is explicit.

# 7. Block Inventory Projections Are Not Items

Document 25I originally included ten generated Block-Item Form Profiles. They are now removed from the canonical Item-family total and transferred to Document 03/inventory-runtime projection policy.

| Legacy 25I ID | Production Treatment |
| --- | --- |
| leyforge.core.item.family.block_form.adventure | Migration alias to Block Inventory Projection profile; not spawnable/authored as an Item family. |
| leyforge.core.item.family.block_form.automation | Migration alias to Block Inventory Projection profile; not spawnable/authored as an Item family. |
| leyforge.core.item.family.block_form.construction | Migration alias to Block Inventory Projection profile; not spawnable/authored as an Item family. |
| leyforge.core.item.family.block_form.functional_station | Migration alias to Block Inventory Projection profile; not spawnable/authored as an Item family. |
| leyforge.core.item.family.block_form.infrastructure | Migration alias to Block Inventory Projection profile; not spawnable/authored as an Item family. |
| leyforge.core.item.family.block_form.magic | Migration alias to Block Inventory Projection profile; not spawnable/authored as an Item family. |
| leyforge.core.item.family.block_form.plantable | Migration alias to Block Inventory Projection profile; not spawnable/authored as an Item family. |
| leyforge.core.item.family.block_form.realm_living | Migration alias to Block Inventory Projection profile; not spawnable/authored as an Item family. |
| leyforge.core.item.family.block_form.storage | Migration alias to Block Inventory Projection profile; not spawnable/authored as an Item family. |
| leyforge.core.item.family.block_form.terrain_natural | Migration alias to Block Inventory Projection profile; not spawnable/authored as an Item family. |

A Block projection may still be:
- stored in an inventory or chest;
- selected in a hotbar;
- moved by automation;
- reserved for a project;
- bought, sold, taxed or contracted through Set 27;
- displayed in crafting inputs/outputs;
- dropped into the world as a placed/pickup representation;
- packed with approved state.
None of those behaviours require a second canonical Item definition.

# 8. Item-Block Transformation and Installation Relationships

All Item↔Block relationships declare a semantic relationship type rather than relying on matching names.

| Relationship | Meaning |
| --- | --- |
| `harvested_from` | Item is produced from a different world Block/plant/deposit. |
| `refined_from_block_output` | Item comes from material extracted from a Block chain. |
| `component_of_block` | Item is a portable component consumed/installed into a Block. |
| `installs_into` | Item remains distinct but is attached to a Block/entity through a specialist transaction. |
| `creates_block` | Item use/recipe creates a different Block definition. |
| `salvaged_from` | Item is a fragment/by-product recovered from a Block/structure. |
| `contained_by` | Item is inventory/cargo inside a container Block/Item; identity remains independent. |
| `block_projection_of` | Reserved relationship kind for inventory runtime; source is a Block, not a canonical Item. |

Any pair with the same semantic identity and only `block_projection_of` is Block-owned and must not appear in the Item registry.

# 9. Portable Containers, Packed Blocks and Cargo Lots

Leyforge distinguishes **container Items**, **container Blocks** and **cargo groupings**.

| Type | Example | Rule |
| --- | --- | --- |
| Container Item | Backpack, waterskin/flask, medicine satchel, mapmaking kit. | Primary lifecycle is portable/equipped; may contain typed contents. |
| Container Block | Chest, barrel, warehouse storage, placed crate. | Primary lifecycle is placed Block; inventory form is projection/packed Block. |
| Cargo Lot | Manifest grouping of goods under custody. | Runtime/Item-record grouping references exact goods; does not create another physical crate. |
| Supply Package | Bound bundle/record of exact items for project/relief use. | May be non-placeable. If physically packed into a crate, crate remains Block-owned. |

Packed-state transactions are atomic. Container contents cannot remain in the world while also appearing inside a carried payload.

# 10. Item Definition Schema

| Field Group | Required Data |
| --- | --- |
| Identity | `item_id`, family ID, schema version, namespace owner, localisation keys, lifecycle status, aliases/tombstones. |
| Classification | category, tags, package membership, production tier, capability roles. |
| Physical | material/resource refs, size/bulk class where needed, held/ground presentation class, container eligibility. |
| State | stack/instance profile, supported batch fields, durability/charge/freshness/contamination/quality where applicable. |
| Acquisition | valid source relationship classes, craft/trade/harvest/quest eligibility, exclusions and fallback providers. |
| Use | consume/equip/read/install/activate/place-other-definition/deliver/fuel/repair/trade actions as typed capability refs. |
| Equipment | slots, fit/body-plan tags, action/defence/movement/biology facets where applicable. |
| Ownership | pickup rights, owner/custodian, theft/claim hooks, permission class, unique-item recovery. |
| Relationships | resource, recipe, block, creature, culture, faction, site, boss, quest, contract, UI and presentation refs. |
| Provenance | maker/source/site/event/lot fields allowed by family profile; not duplicated world history. |
| Presentation | icon/held/ground/equipped model refs, state cues, sockets, audio/VFX event refs, accessibility text. |
| Migration | aliases, deprecated-by, removed-pack policy, quarantine/recovery descriptor. |
| Validation | schema, references, stacking, conservation, state, use, authority, save, package and performance tests. |


# 11. Stack and Instance State Profiles

| Profile | Purpose | Typical Families |
| --- | --- | --- |
| SIMPLE_STACK | Large quantities with no meaningful per-unit state. | aggregate, basic refined inputs |
| PROVENANCE_STACK | Stackable only while required source/provenance fields match. | ore lots, timber stock, culture goods |
| QUALITY_STACK | Stackable while quality/grade and other compatibility fields match. | ingots, crafted components |
| FRESHNESS_STACK | Batch freshness/spoilage state. | food, perishables |
| CONTAMINATION_STACK | Contamination/cleanliness must not be erased by merge. | samples, water, medicines |
| CHARGED_STACK | Shared compatible charge/purity/capacity state. | mana charges, magical reagents |
| HAZARD_STACK | Hazard class/containment/provenance preserved. | corrupted shards, toxins |
| BULK_STACK | Bulk goods with lot/packaging constraints. | bales, frame stock, industrial materials |
| DURABLE_INSTANCE | Persistent singular durability/condition/calibration. | tools, weapons, instruments |
| CHARGED_DURABLE | Persistent object with durability plus charge/capacity. | foci, magical equipment |
| CONTAINER_INSTANCE | Portable Item owns contained inventory/payload. | backpack, medical kit, flask |
| CONTAINER_EQUIPMENT | Container plus equipment slot/fit state. | backpack, tool belt |
| KNOWLEDGE_INSTANCE | Persistent authored/discovered record. | book, map, chart, blueprint medium |
| KNOWLEDGE_CONTAINER | Record containing multiple knowledge entries/progress. | spellbook, research folio |
| CONTRACT_INSTANCE | Persistent agreement/permit/credential document representation. | delivery contract, licence |
| UNIQUE_INSTANCE | World-significant singular object with recovery policy. | relic, boss proof, unique key |
| CURRENCY_STACK | Physical denominations/bullion where represented as Items. | coins, notes, bullion lots |
| LIVING_QUALITY_STACK | Living/realm material state that must remain bounded and save-safe. | Verdant materials |
| RECOVERY | Quarantine/tombstone payload preserving unknown/invalid state. | missing-definition recovery |

Exact stack limits are balance/runtime data. Profile compatibility is more important than one universal stack number.

# 12. Stacking Compatibility and State Preservation

Two quantities may merge only when every field marked **stack-significant** by the family profile is compatible. Required state may never disappear merely to make UI stacking convenient.

Typical split triggers include:
- different definition ID;
- different quality/grade when quality is meaningful;
- different freshness/spoilage band;
- different contamination or poison class;
- different ownership/claim restriction when custody cannot be safely aggregated;
- different charge/purity band when exact charge must be conserved;
- different provenance lot when provenance affects legality, story, trade or recipe use;
- different enchantment/inscription/calibration;
- unique significance or instance identity.

# 13. Quantity, Conservation and Authoritative Transactions

All Item mutations use authoritative transactions. Crafting, splitting, merging, container transfer, automation, settlement reservation, trade, theft, death drops, salvage, project contribution, migration and multiplayer actions must conserve the owned quantity and required state.

A valid transaction records at minimum:

```text
transaction_id
actor_or_system_authority
source_inventory_refs[]
destination_inventory_refs[]
input_item_or_block_refs[]
output_item_or_block_refs[]
quantity_deltas[]
state_transfers[]
ownership_or_custody_changes[]
reason_code
timestamp_or_world_tick
rollback_or_recovery_reference
```
Document 18 implements the transaction system; this document defines the Item-side invariants.

# 14. Ownership, Custody, Claims and Permissions

Possession, ownership, custody and legal claim are related but not interchangeable. A player may physically carry stolen property without becoming its lawful owner. A hauler may have custody of settlement stock without ownership. A contract may reserve goods without moving them yet.

| Field/Concept | Item Rule |
| --- | --- |
| Owner | Persistent owner/claim reference where needed; null/public possible. |
| Custodian | Current actor/container/organisation responsible for possession. |
| Reservation | Temporary claim for recipe, project, contract or service. |
| Pickup Permission | Authoritative query; presentation may show reason. |
| Stolen/Disputed Status | Derived from authoritative ownership/law events, not merely a cosmetic tag. |
| Unique Recovery | World-significant Items require recovery/substitution policy. |
| Theft Consequence | Legal/social consequence belongs to law/Set 28/quests, not the Item definition. |


# 15. Provenance, Maker, Source and Chain of Custody

Provenance is attached only where it matters. It can include source biome/site/creature, maker, culture, event, salvage claim, lot, owner, research chain or realm origin. The Item stores references and bounded metadata; it does not copy the Atlas or world-history record.

Provenance may affect:
- quest evidence and authentication;
- legal salvage/ownership claims;
- culture meaning;
- craft quality or specialist recipe eligibility;
- market valuation through Set 27;
- research/Codex evidence;
- unique-item recovery;
- contamination, disease or biological treatment decisions through Set 29.

# 16. Scarcity, Capability, Quality, Condition, Significance and Value

| Dimension | Owner/Meaning | Rule |
| --- | --- | --- |
| Scarcity/Availability | Definition/context + world/resource systems. | Does not automatically increase power. |
| Capability Band | Progression relationship. | What an Item enables/qualifies, not its rarity colour. |
| Craft Quality | Definition/instance by family. | Affects only declared fields. |
| Condition | Runtime state. | Wear, damage, spoilage, fracture, contamination, calibration. |
| Provenance | Runtime/definition relationship. | Source/maker/owner/history references. |
| Significance | Definition/context. | Ordinary, cultural, relic, authority proof, unique. |
| Reference Value Metadata | Economy-facing balancing input where approved. | Not a price and not spendable. |
| Price | Set 27 runtime quote/transaction result. | Never a fixed canonical Item truth. |


# 17. Acquisition, Use Actions and Capability Providers

An Item family declares valid acquisition classes and capabilities, not guaranteed universal placement in every seed. Capability/fallback planning from Set 25 ensures required gameplay can resolve through appropriate providers.

| Use Class | Examples | Owning Outcome |
| --- | --- | --- |
| Consume | food, potion, medicine, charge. | Biology/Magic/other specialist system. |
| Equip | weapon, armour, backpack, tool, glider. | Equipment state + Combat/Movement/Biology facets. |
| Use Tool | pickaxe, hammer, wrench, survey tool. | Target system validates work. |
| Install | machine component, rune blank, conduit core. | Block/Automation/Magic/Vessel owner. |
| Read/Learn | book, map, scroll, blueprint. | Knowledge/progression/quest owner. |
| Deliver | contract goods, supply package. | Settlement/Quest/Economy owner. |
| Trade | goods, currency, relics where legal. | Set 27. |
| Activate | key, seal, charm, device. | Owning site/magic/quest system. |


# 18. Resource and Material Boundary

Items may represent portable material units, but resource truth remains outside this registry. Document 06/25J owns where a resource comes from, how renewable/depletable it is, its capability role, scarcity ecology, substitutions and long-term use. Document 04 owns how the resulting carried unit stacks, stores state and participates in inventory transactions.

Examples of correct separation:
- Iron Ore Block (03) -> Raw Iron Ore Item (04); ore distribution/progression (06); smelting recipe (05).
- Medicinal Herb Block (03) -> harvested Medicinal Herb Item (04); ecology/world placement (10/11/24); treatment use resolved by 29/05/health systems.
- Mana Crystal Deposit Block (03) -> Raw Mana Crystal Item (04); mana resource/progression (06/09); device/recipe use (05/09).
- Tree Block (03) -> processed timber stock Item (04) when the harvest chain transforms it; a recover-as-self structural-log Block instead uses Block Inventory Projection.

# 19. Crafting, Recipes, Repair and Recycling Boundary

Document 04 supplies valid Item identities and capability tags. Document 05 owns all transformation truth, including quantities, substitutions, station requirements, time, fuel/power/mana, by-products, project stages, repair and recycling.
A recipe output may be:
- a canonical Item definition;
- a Block Inventory Projection referencing a Block ID;
- a distinct Block placed through a project/placement transaction;
- multiple Items/by-products;
- a state change to an existing Item instance.
Recipes must never output a fake duplicate Item solely because the output is a placeable Block.

# 20. Food, Water, Medicine and Consumables

Food, potable-water containers, medicines, antidotes, salves and similar objects remain Items because their primary lifecycle is carried/consumed rather than a placed voxel identity. Document 04 owns identity, batch/expiry/contamination state and use capability. Set 29 owns the biological result.

| Item Facet | Purpose | Owner of Outcome |
| --- | --- | --- |
| Nutrition payload | Nutrient/food-category capability reference. | 29C |
| Hydration payload | Drink/volume/cleanliness capability. | 29C |
| Treatment capability | Bandage/medicine/antidote/salve capability classes. | 29G plus injury/disease owners |
| Thermal consumable | Heat/cooling support capability. | 29D |
| Contamination state | Carries source/cleanliness state needed by biology. | 04 state; 29 interprets consequence |
| Spoilage/freshness | Persistent batch state and presentation. | 04/06/29 interaction |
| Dose/charge | Conserved use quantity. | 04; effect resolved externally |

No Item definition directly writes Health, Hunger, Hydration, Disease or Injury state.

# 21. Creature Products, Samples and Personhood Boundary

Creature-derived Items require explicit harvest eligibility, source and ethical/legal context from the creature/ecology systems. **Persons and awakened/self-aware constructs are never ordinary loot or inventory.** A token, record, prosthetic component or voluntarily transferred object may reference a person; the person does not become an Item.

Samples and trophies preserve enough provenance to support research, law, quests and ecology without duplicating the source creature definition.

# 22. Tools, Instruments and Work Equipment

Tools are canonical Items when their primary lifecycle is portable/equipped. Their definitions may expose work capability, eligible action profiles, durability, quality, sockets and specialist facets. The target system determines whether work succeeds.

Representative families include harvesting tools, hammers, saws, hoes, wrenches, repair kits, survey instruments, mapmaking equipment, medical kits, alchemy/rune tools, shipwright tools and traversal equipment. Exact numeric speed/yield bonuses remain balance data.

# 23. Weapons, Armour, Accessories and Equipment

Equipment keeps one Item identity while specialist systems own effects.

| Facet Family | Examples | Owner |
| --- | --- | --- |
| Combat | damage profile refs, block/parry class, defence/resistance contribution, action set refs. | 16 |
| Movement | movement restrictions/bonuses, traction, glider/traversal provider refs. | 30 |
| Biological Protection | thermal, waterproof, wind, contamination, coverage, treatment support. | 29 |
| Magic | focus, charge, school compatibility, enchantment sockets. | 09 |
| Inventory | container slots/capacity profile for backpacks/tool belts. | 04/18 |
| Social Presentation | uniform/credential/visible-status evidence. | 28 consumes; culture/law owns meaning |
| Maritime | diving, rescue, navigation, shipwright/naval use. | 26 |

Equipment slots remain semantic and body-plan-aware rather than assuming every actor is human-shaped.

# 24. Automation, Machine and Infrastructure Components

Portable gears, shafts, fasteners, motors/cores, filters, controllers, maintenance parts and machine-frame components may be Items. Once assembled into a placeable machine or infrastructure unit whose recovery is itself, the installed physical identity becomes Block-owned.
The rule is: **component Item -> assembly transaction -> canonical Block**, not Item and Block mirrors of the same assembled object.

# 25. Mana, Runes, Magical Components and Knowledge

Magic Items may store charge, purity, affinity, inscription, binding, target references or corruption risk. Document 09 owns spell/magic execution and mana-network rules. Document 04 owns the physical object and persistent Item state.
Rune blanks, conduit cores and similar entries are explicitly portable components; installed rune/conduit Blocks remain Document 03-owned.

# 26. Settlement Supplies, Trade Goods, Cargo and Records

Settlement supply families are **conserved groupings of real goods**, never abstract resource coupons. A supply bundle or package references exact contained/material quantities. Where goods are physically placed inside a crate, barrel, warehouse or other placeable container, that container remains a Block projection; the Item registry does not create a duplicate “crate Item”.

The former `settlement.supply.project_crate` family is replaced by `settlement.supply.project_package`. The former `trade.goods.crate` family is replaced by `trade.goods.cargo_lot`. Their old IDs remain migration aliases only.

# 27. Culture Goods, Gifts and Credentials

Culture-specific goods may carry maker/culture provenance and support settlement identity, trade, ritual, hospitality or diplomacy. Culture does not imply ancestry and an Item never hard-codes a person's beliefs or morality.
A gift Item exposes what was given, by whom and under what provenance. Set 28 determines whether the recipient appreciates, refuses, mistrusts or attaches social meaning to it.

# 28. Maps, Books, Blueprints, Contracts and Knowledge Objects

Physical records are Items when players can carry, trade, steal, copy, damage or display them. The **knowledge truth itself** may live in Codex, discovery, quest, blueprint or contract systems.

| Physical Item | External Authoritative Truth |
| --- | --- |
| Map/Chart | Discovered geographic/route knowledge and uncertainty. |
| Blueprint medium | Blueprint definition/library/permissions. |
| Contract document | Set 27/quest/legal contract record. |
| Permit/Credential | Authority/jurisdiction/holder status. |
| Spellbook/Scroll | Magic knowledge/unlock and spell definitions. |
| Research Folio | Research state/evidence. |
| Faction Seal | Faction authority and social/legal recognition. |

Destroying a paper representation does not automatically erase an authoritative contract or already-learned knowledge unless its owning system explicitly defines that consequence.

# 29. Adventure Loot, Relics, Boss Proofs and Unique Items

Loot selection belongs to sites, quests, events, creatures and contextual loot grammars. Document 04 owns the resulting Item identity/state. Unique or progression-significant Items require recovery or alternate progression paths so loss, pack removal or migration cannot silently brick a world.
Boss proof/reward families must support non-combat or alternate resolution where their owning boss/quest systems permit it; Document 04 does not assume “boss died -> generic chest item”.

# 30. Realm and Conditional Item Packages

Verdant Covenant families remain Core Conditional and Ancestral Veil entries remain Teaser Only according to Set 25. Realm Items must have Overworld utility, safe migration and clear pack ownership; removing an optional pack quarantines unsupported state rather than deleting possessions silently.
Living materials require bounded state profiles and may not use “living” as justification for arbitrary per-tick simulation.

# 31. Set 26 Maritime Item Integration

Set 26 requires Document 04 to admit maritime Items and facets without creating “maritime duplicates” of existing Core goods. A Core rope, timber stock, fastener or tool remains Core if maritime use merely adds capability. A capstan component, specialist diving device or other concept unique to the maritime expansion may use the approved expansion namespace.

| Maritime Family/Facet | Document 04 Owns | Set 26 Owns |
| --- | --- | --- |
| Shipwright Tools | Item identity, durability/quality, inventory state. | Shipwright use, vessel scan/commission interaction. |
| Rigging/Sail Components | Portable component identity/state. | Vessel structural/propulsion role. |
| Navigation Instruments/Charts | Item/knowledge-object identity, condition, calibration. | Maritime navigation semantics and route use. |
| Diving Gear | Equipment identity/state and biological/movement facets. | Aquatic use, depth/pressure/breath interfaces with 29/30 facade. |
| Fishing Gear | Tool identity/state. | Fishing method, source abundance/catch transaction/ecology. |
| Cargo/Catch/Salvage | Item/lot identity, provenance/custody. | Maritime source/use/claim workflows. |
| Pumps/Repair/Naval Components | Portable component identity. | Vessel system role, damage control/naval execution. |
| Rescue Equipment | Item/equipment capability. | Rescue/aquatic/vessel use. |

Hull-capable ordinary materials and placed vessel Blocks retain their Block identities; no “ship oak plank Item” is created.

# 32. Set 27 Economy, Currency and Price Integration

Set 27 is the final authority for prices, value formation, currencies, markets, wages, contracts, taxes, tariffs and trade-route economics. Document 04 therefore removes dynamic price from canonical Item truth.

An Item may expose:
- physical denomination/issuer/authenticity for physical currency;
- reference-value authoring metadata where Set 27 permits it;
- quantity/unit class;
- quality/condition/provenance/legality facts used by valuation;
- ownership/custody and tradeability flags.
Set 27 computes actual contextual quotes and transaction prices. Multiple currencies and barter may coexist. Small recognised denominations may be shown through a purse/wallet view while remaining conserved; bullion and special monetary objects remain physical Items/cargo where defined.

# 33. Set 28 Social, Companion and Gift Integration

Set 28 owns social memory, trust, loyalty, willingness, dialogue, negotiation and companion social agreements. Items provide factual inputs such as possession, transfer, visible equipment, credential presentation and gift provenance.
A valuable gift does not guarantee friendship. A faction seal does not force obedience. A companion carrying the player's sword does not become its owner unless an authoritative transfer occurs.
Companion inventories use the same Item/Block projection conservation rules as player/NPC inventories; social delegation cannot teleport or invent goods.

# 34. Set 29 Biological Equipment and Consumable Integration

Set 29 owns biological state and response. Document 04 supplies stable traits/capabilities such as:
- cold protection;
- heat protection;
- waterproofing;
- wind protection;
- moisture retention and drying support;
- body-region coverage;
- contamination barrier;
- respiratory/environmental support where Set 26/29 permit;
- treatment capability classes;
- food/nutrition/hydration payload references;
- equipment load/fit facts relevant to biology.
Items never directly mutate Health, Stamina, Fatigue, Hunger, Hydration, Injury, Disease or Poison state simply because an effect string says they do.

# 35. Set 30 Movement, Traversal and Transport Equipment Integration

Set 30 owns terrestrial movement, traversal, gliding, mounts, land vehicles, guided transport, route accessibility and movement execution. Items expose movement-facing facets only.

A reconciled `TraversalEquipmentFacet` may include:

```text
equipment_definition_id
traversal_capability_ids[]
grapple_profile_id?
rope_deploy_profile_id?
allowed_anchor_categories[]
max_range_or_range_class?
line_length_class?
reel_capability?
swing_capability?
dynamic_anchor_capability?
movement_restriction_while_equipped?
item_state_binding?
presentation_socket_role?
```
Concrete rope/grapple/glider equipment belongs in Document 04 when admitted; Set 30 owns what movement it enables and how that movement executes. Set 29 owns Stamina/Fatigue/biological restrictions. Aquatic movement uses the final Set 26 provider through the Set 30 universal movement facade.

# 36. Equipment Fit, Body Plans and Accessibility

Equipment definitions use semantic fit/body-plan/coverage tags rather than assuming a single humanoid skeleton. Ancestry/culture never hard-code profession or morality. Playable biological differences may require alternate fits, adapters, gear or magic but should not create one universally best people/body type.
Critical equipment states must remain readable without colour alone; controls and UI provide accessible alternatives.

# 37. Inventory Capacity, Containers and Carrying Boundary

Document 04 defines Item-side bulk/container/capacity descriptors where required but does not silently create a universal physics-weight simulation. Inventory presentation/capacity rules are coordinated with Documents 17/18; Set 29 may produce biological carrying restrictions and Set 30 applies movement consequences through the reconciled interface.
Large cargo may use freight/container/vehicle/vessel systems rather than pretending every object fits a personal backpack.

# 38. UI, Search, Filters and Explainability

The registry must expose enough metadata for consistent inventory, crafting, trade, equipment, Codex and developer filters without exposing internal planning noise to players.

Recommended player-facing filter facets include:
- material/resource class;
- tool/work role;
- weapon/armour/equipment slot;
- food/medicine/consumable;
- magic;
- automation/component;
- knowledge/map/record;
- trade/currency/cargo;
- quest/relic/significant;
- culture/realm provenance where known;
- condition/quality;
- legal/ownership state when the player can know it.
Failure messages should state why an Item cannot stack, equip, use, trade, install or transfer when that information is legitimately known.

# 39. Forge, Presentation, Icons, Held Models, Audio and VFX

Item identity is independent from appearance. Forge/25K/Presentation systems provide icon, held/ground model, equipment attachment, material treatment, animation events, sound and VFX. A new skin or cultural visual variant does not require a new Item definition unless behaviour/state/provenance identity actually differs.
The production asset budget may bind many Item families to shared icon/model masters; family count is not an asset quota.

# 40. Packs, Optional Content and Missing-Definition Recovery

Items carry source-pack ownership and dependency metadata. Optional packs may add Items or facets without making base saves depend on them irreversibly.
If a definition becomes unavailable:
- preserve original qualified ID and payload;
- quarantine as a visible recovery object if safe substitution is unavailable;
- retain quantity, ownership, provenance and unique-state evidence;
- offer migration/substitution only through approved rules;
- restore the original definition cleanly if the pack returns;
- never silently delete or convert valuable player possessions.

# 41. Save, Migration, Aliases and Legacy Block-Item Cleanup

Legacy saves may contain old Item IDs representing what is now a canonical Block. Migration must convert those records into Block Inventory Projections atomically.

Migration categories:
- `LEGACY_BLOCK_ITEM_TO_PROJECTION` - old Item ID -> canonical Block ID + projection state;
- `ITEM_ID_ALIAS` - old Item ID -> renamed Item ID with state-preserving mapping;
- `ITEM_TO_COMPONENT_SPLIT` - old ambiguous Item becomes a distinct component Item while placed form stays Block-owned;
- `ITEM_TOMBSTONE` - retired Item retained only for archive/recovery;
- `PACKAGE_QUARANTINE` - optional Item unavailable but payload preserved;
- `STATE_SCHEMA_MIGRATION` - same Item identity, updated state layout.
Legacy Unreal paths, short IDs and POC planning labels never become production identity.

# 42. Cross-Registry Duplicate Audit

Document 04 v1.0 introduces a release-blocking semantic duplicate audit across Block and Item registries. Name similarity is a warning signal; canonical lifecycle determines the result.

| Candidate Pair | Resolution in v1.0 | Relationship / Guardrail |
| --- | --- | --- |
| All ten 25I `block_form.*` Item families vs placeable Blocks | Removed from Item-family catalogue. | Block Inventory Projection only. |
| Project Supply Crate Item vs Project Supply Crate Block | Item family renamed/reclassified to Project Supply Package/Manifest. | Physical crate remains Block-owned. |
| General Cargo Crate Item vs placeable crate/container Blocks | Item family renamed/reclassified to Packaged Cargo Lot. | Cargo lot references real goods/container; no second crate identity. |
| Pollen-Amber Lens Item vs installed Pollen-Amber Lens Block | Item explicitly portable calibrated component; Block is installed assembly. | `component_of_block` / `installs_into`. |
| Bloomstone Stabiliser Core Item vs Bloomstone Stabiliser Block | Retain both as component vs installed infrastructure. | `component_of_block`. |
| Medicinal Herb Item vs Medicinal Herb vegetation Block | Retain both as harvested material vs living placed plant. | `harvested_from`. |
| Raw Iron/Copper Ore Items vs ore Blocks | Retain both as extracted resource vs geological source. | `harvested_from`. |
| Mana Conduit Core Item vs Mana Conduit Block | Retain both as portable component vs installed conduit. | `component_of_block`. |
| Rune Blank Item vs Rune Substrate Block | Retain both only as portable blank vs installed substrate. | `installs_into`; same-as-self variants forbidden. |
| Iron Structural Frame Stock Item vs placed machine-frame Blocks | Retain as fabricated stock/component, not placeable frame. | Machine assembly consumes stock; Block owns placed identity. |
| Machine Frame Component Item vs machine-frame Blocks | Retain as assembled portable chassis/component only. | Install/assembly relationship must be explicit. |
| Mistwood Timber Item vs Mistwood tree Block | Retain as processed timber stock harvested from living tree. | `harvested_from` / processing chain. |
| Thornsilver Cord Item vs Thornsilver Lattice Block | Item narrowed to flexible cord/binding; lattice remains Block. | `component_of_block`. |
| Crystal/stone chunks vs terrain stone Blocks | Retain only where breaking transforms terrain into chunks. | If recovery should return same stone Block, chunk output is not used for that action. |
| Missing-definition recovery Item vs recovery Block | Retain both as domain-specific recovery representations. | They preserve different unavailable definition kinds; cannot substitute for each other. |

## 42.1 Duplicate validation rules

- **ITEM-BLOCK-001:** Same canonical physical identity exists as both Item and Block.
- **ITEM-BLOCK-002:** Block uses SELF_BLOCK recovery but also outputs a same-identity Item.
- **ITEM-BLOCK-003:** Item uses place action whose only effect is to recreate itself as an equivalent Block without an approved projection exemption.
- **ITEM-BLOCK-004:** Block and Item copy mutable/immutable fields with no declared owner.
- **ITEM-BLOCK-005:** Container Item duplicates an already canonical placeable container Block instead of using projection/packing.
- **ITEM-BLOCK-006:** Component vs installed-assembly distinction is asserted but no transformation/install relationship exists.
- **ITEM-BLOCK-007:** Legacy block-item alias remains spawnable in production.
- **ITEM-BLOCK-008:** Recipe outputs both a Block projection and duplicate Item for the same result.
Any blocking defect prevents Document 04/05 registry integration until resolved or explicitly approved as a genuinely distinct lifecycle.

# 43. POC Preservation and Retirement Rules

The fixed Forest Hamlet, fixed watchtower-delivery chain, named POC villagers and scripted raid item selections are retired as production generation rules. Their reusable mechanics remain: project reservations, construction supplies, tools, weapons, food, medicine, automation parts, magic components, defence supplies, ownership, trade, loot, equipment and persistent transactions.
An Item is not removed merely because it was once tagged POC Required. It is removed only when its **underlying gameplay identity** is superseded, redundant or explicitly deprecated.

# 44. Validation, QA and Acceptance Gates

| Suite | Required Evidence | Blocking Failure |
| --- | --- | --- |
| Schema/Identity | All Item IDs, families, parents, facets and aliases resolve uniquely. | Broken/ambiguous reference or duplicate owner. |
| Block/Item Deduplication | No same-lifecycle Block/Item canonical duplicates; block-form aliases non-spawnable. | ITEM-BLOCK-* blocking error. |
| Stack/State | Split/merge preserves required state and quantity. | State loss, illicit merge or duplication. |
| Transactions | Craft/transfer/automation/trade/death/project/migration are conserved and journalled. | Created/deleted stock or ownership loss. |
| Equipment | Equip/unequip preserves Item instance state and external facet ownership. | Duplicated gear or external-system bypass. |
| Economy | Set 27 quote/transaction consumes Item facts; no fixed runtime price field controls trade. | Item-owned price bypass. |
| Biology | Consumables/equipment route through Set 29 capability interfaces. | Direct health/survival mutation from Item logic. |
| Movement | Traversal/equipment facets route through Set 30/Set 26 aquatic facade. | Item-owned locomotion execution. |
| Personhood | No person/awakened construct is treated as ordinary inventory/loot. | Personhood boundary violation. |
| Loot/Provenance | Unique/contextual rewards preserve source/claim/alternatives. | Generic duplicated unique reward or lost provenance. |
| Optional Packs | Install/remove/reinstall preserves unknown Item state and base saves. | Save corruption or silent loss. |
| POC Leakage | No fixed POC item identity/chain required by production generation. | Retired demonstration item selected as mandatory production content. |

## 44.1 Document 04 replacement gate

Document 04 v1.0 may replace the legacy Item Registry when:
- all 286 reconciled family contracts have an owner/status and valid cross-registry boundary;
- the ten former block-form Item families are non-spawnable projection aliases only;
- all known Block/Item collision candidates have an explicit lifecycle relationship or are removed;
- Core package Item inputs/outputs remain covered and CAP-00 to CAP-10 reachability is not broken;
- state, stacking, ownership and conservation contracts are save-safe;
- Set 26 extension points and Sets 27-30 interfaces compile without ownership conflict;
- POC-only item identities/chains are absent from normal production;
- migration fixtures exist for legacy block-items and renamed Items.

# 45. Handoff to Documents 05, 06, 16, 17 and 18

| Receiving Document/System | Required Handoff |
| --- | --- |
| 05 - Crafting/Recipe Registry | Use canonical Item IDs and Block projections directly; never create fake block-item outputs. Instantiate 25J chains, substitutions, repair, recycling and project transactions. |
| 06 - Resource Progression | Own resource ecology/provenance/progression; map sources/uses to canonical Item/Block identities. |
| 16 - Combat/Gear | Own action, damage, defence and equipment combat facets; preserve Item identity/condition. |
| 17 - UI/UX | Render Item/Block projection distinctions invisibly to ordinary players while showing truthful state/ownership/filter information. |
| 18 - Technical Plan | Implement union inventory references, stack/instance schemas, authority, persistence, transactions, migration, optional-pack quarantine and performance. |
| 27 - Economy | Consume Item/Block facts for valuation/transactions; own dynamic price and currency economics. |
| 28 - Social | Consume gift/credential/possession facts; own social response. |
| 29 - Biology | Consume food/treatment/protection facets; own biological outcomes. |
| 30 - Movement | Consume movement/traversal equipment facets; own movement execution. |
| 26 - Maritime | Supply specialist maritime use/facet definitions and expansion-only Item families through approved namespaces. |


# 46. Production Decisions Locked by v1.0

| Decision | Result |
| --- | --- |
| Single canonical Block/Item identity | Locked. Same-as-self placeables are Block-only with inventory projection. |
| 25I block-form families | Removed from canonical Item-family count; migration/profile aliases only. |
| Reconciled family baseline | 286 families: 253 Required, 30 Conditional, 3 Teaser. |
| Family-first planning | Retained. Concrete variant multiplication requires gameplay/presentation/migration justification. |
| Qualified IDs | Locked under Set 25 governance. |
| State conservation | Locked. Stacks/transactions cannot erase required state, quantity, provenance or ownership. |
| Price separation | Locked. Set 27 owns price; Item owns physical identity/state. |
| Biology separation | Locked. Set 29 owns biological outcomes. |
| Movement separation | Locked. Set 30 owns movement; Set 26 owns aquatic specialist provider. |
| Social separation | Locked. Set 28 owns social meaning and relationship outcomes. |
| Personhood | Locked. Persons/awakened constructs are never ordinary inventory. |
| Maritime extension | Locked. Core Items gain facets; Set26-only identities use admitted expansion namespace. |
| POC treatment | Locked. Scenario wrappers archived; reusable Items/capabilities preserved/generalised. |

# Appendix A. Reconciled Canonical Item-Family Register

This register contains **286 canonical Item-family contracts** after removing the ten legacy Block-Item Form pseudo-families. It preserves Document 25I's approved family intake except for explicit v1.0 identity/deduplication amendments recorded in Appendices B-D.

## Technical and Recovery

| Family ID | Family Name | World / Player Role | State Profile | Status / Owner |
| --- | --- | --- | --- | --- |
| leyforge.core.item.family.technical.missing_definition | Missing-Definition Recovery Item | Visible quarantine representation when a removed or unavailable item definition must retain quantity, state and provenance safely. | RECOVERY / non-craftable / preserves original qualified ID and payload | Core Required / 25D-25E / Runtime |
| leyforge.core.item.family.technical.invalid_stack_quarantine | Invalid-Stack Quarantine Package | Separates incompatible or corrupted stack state rather than deleting or merging it. | RECOVERY / sealed payload / admin-inspectable | Core Required / Registry / Save Recovery |
| leyforge.core.item.family.technical.migration_receipt | Migration Receipt | Records a player-visible summary when an item, quantity, ownership record or container was migrated or substituted. | KNOWLEDGE / non-trade / save-version linked | Core Required / Migration / Player Trust |
| leyforge.core.item.family.technical.deprecated_tombstone | Deprecated Item Tombstone | Retains an archived identity and replacement link without admitting the old item into normal production. | RECOVERY / non-spawnable / alias and supersession only | Core Required / Registry / Archive |

## Natural, Botanical and Organic Inputs

| Family ID | Family Name | World / Player Role | State Profile | Status / Owner |
| --- | --- | --- | --- | --- |
| leyforge.core.item.family.natural.wood.hardwood_log | Hardwood Log and Branch Family | Primary temperate timber input for shelter, tools, fuel, beams and settlement construction. | PROVENANCE_STACK / species or biome provenance may affect presentation and recipes | Core Required / Temperate Heartland / Forestry |
| leyforge.core.item.family.natural.wood.softwood_log | Softwood Log and Branch Family | Resinous boreal and upland timber for framing, fuel, poles, route works and pitch. | PROVENANCE_STACK / moisture and species facets | Core Required / Moorland/Boreal Frontier |
| leyforge.core.item.family.natural.wood.ancient_heartwood | Ancient Heartwood Family | Limited old-growth material used by restoration, specialist construction, magic and lore-linked projects. | PROVENANCE_STACK / protected-source and legality facets | Core Conditional / Ancient Oakwood / Spirit States |
| leyforge.core.item.family.natural.wood.mistwood_timber | Processed Mistwood Timber Stock Family | Processed portable timber stock derived from Mistwood vegetation and used by craft, wards and cultural applications; the living/tree Block is not carried as this Item. | PROVENANCE_STACK / treatment, moisture, source and quality | Core Required / Mistwood / Mirelight |
| leyforge.core.item.family.natural.wood.worldroot_fragment | Worldroot Fragment Family | Recovered root material connecting root caves, colossal roots, restoration and realm foreshadowing. | PROVENANCE_STACK / living, dormant, blighted and cleansed facets | Core Required / Root Caves / Adventure |
| leyforge.core.item.family.natural.fibre.plant_fibre | Common Plant Fibre Family | Early cordage, wrapping, filters, baskets, paper and simple textiles. | SIMPLE_STACK / dryness and treatment variants by concrete entry | Core Required / All Overworld Packages |
| leyforge.core.item.family.natural.fibre.bast_fibre | Bast and Bark Fibre Family | Durable tree-derived fibre for rope, sacks, reinforcement and culture goods. | PROVENANCE_STACK / processed grade | Core Required / Forestry / Trade |
| leyforge.core.item.family.natural.fibre.reed_cane | Reed and Cane Family | Wetland building, matting, baskets, filters, paper, medicine and stilt-settlement supply. | PROVENANCE_STACK / wet, dried and treated concrete entries | Core Required / Wetland/Flood Basin |
| leyforge.core.item.family.natural.fibre.textile_crop | Textile Crop Fibre Family | Cultivated fibre input for cloth, bandages, sails only through Set 26 extensions, and settlement goods. | PROVENANCE_STACK / crop quality and retting state | Core Required / Agriculture / Textile |
| leyforge.core.item.family.natural.fibre.wool | Raw Wool and Fleece Family | Renewable animal fibre for clothing, bedding, insulation, trade and morale goods. | QUALITY_STACK / cleanliness and grade | Core Required / Herd/Domestic Ecology |
| leyforge.core.item.family.natural.hide.raw | Raw Hide Family | Perishable animal skin used for leather, parchment, containers and equipment. | SPOILAGE_STACK / species, condition and lawful-source provenance | Core Required / Creature Resources |
| leyforge.core.item.family.natural.resin.tree_resin | Tree Resin Family | Adhesive, sealant, incense, medicine, fuel additive and alchemical input. | PROVENANCE_STACK / purity and contamination | Core Required / Forestry / Magic |
| leyforge.core.item.family.natural.resin.pitch_tar | Pitch and Tar Family | Weatherproofing, road, repair, fire and machine-maintenance input. | CONTAINER_STACK / flammable hazard and treatment state | Core Required / Industry / Routes |
| leyforge.core.item.family.natural.seed.staple_grain | Staple Grain Seed Family | Renewable agriculture seed for food, feed, trade and settlement provisions. | BIOLOGICAL_STACK / variety, season and disease facets | Core Required / Agriculture / Provisions |
| leyforge.core.item.family.natural.seed.root_crop | Root-Crop Seed and Tuber Family | Cold- and poor-soil compatible staple propagation and emergency food source. | BIOLOGICAL_STACK / variety and viability | Core Required / Agriculture / Frontier |
| leyforge.core.item.family.natural.seed.orchard | Orchard Seed and Graft Family | Longer-term fruit production and settlement orchard projects. | BIOLOGICAL_STACK / graft quality and dormancy | Core Required / Temperate Agriculture |
| leyforge.core.item.family.natural.seed.herb | Medicinal and Culinary Herb Seed Family | Propagates approved medicine, cooking and ward-support herbs. | BIOLOGICAL_STACK / known-use and culture facets | Core Required / Health / Agriculture |
| leyforge.core.item.family.natural.forage.wild_berry | Wild Berry and Small-Fruit Family | Immediate forage, preserves, dyes, wildlife food and settlement fallback provisions. | SPOILAGE_STACK / freshness and contamination | Core Required / Surface Biomes |
| leyforge.core.item.family.natural.forage.edible_mushroom | Edible Mushroom Family | Cave and forest food supporting underground survival and trade. | SPOILAGE_STACK / toxicity identification and freshness | Core Required / Forest / Fungal Cavern |
| leyforge.core.item.family.natural.forage.medicinal_fungus | Medicinal Fungus Family | Health, antidote, cleansing and alchemical input sourced from damp or underground environments. | PROVENANCE_STACK / potency and contamination | Core Required / Health / Underground |
| leyforge.core.item.family.natural.forage.medicinal_herb | Medicinal Herb Family | Common healing, fever, wound and settlement infirmary supply. | PROVENANCE_STACK / potency and freshness | Core Required / Health / Surface Biomes |
| leyforge.core.item.family.natural.forage.cleansing_herb | Cleansing Herb Family | Counter-corruption, ward maintenance and environmental restoration input. | PROVENANCE_STACK / purity and blight exposure | Core Required / Magic / Health |
| leyforge.core.item.family.natural.forage.dye_pigment | Natural Dye and Pigment Family | Culture presentation, banners, textiles, mapmaking and decorative crafting. | SIMPLE_STACK / colour family as concrete definition | Core Required / Culture / Craft |
| leyforge.core.item.family.natural.soil.compost | Compost and Soil Amendment Family | Recycles organic by-products into crop fertility, settlement sanitation and land restoration. | BULK_STACK / maturity and contamination state | Core Required / Agriculture / Settlement |

## Stone, Aggregate, Ceramic and Glass Inputs

| Family ID | Family Name | World / Player Role | State Profile | Status / Owner |
| --- | --- | --- | --- | --- |
| leyforge.core.item.family.mineral.stone.common_fragment | Common Stone Fragment Family | Hand-gathered and mined stone input for primitive tools, rubble, masonry and repair. | SIMPLE_STACK / source family and grade facets | Core Required / All Overworld Packages |
| leyforge.core.item.family.mineral.stone.limestone_chunk | Limestone Chunk Family | Lime, mortar, masonry, filtration and karst-specific trade input. | PROVENANCE_STACK / fossil and purity facets | Core Required / Karst / Industry |
| leyforge.core.item.family.mineral.stone.deepstone_chunk | Deepstone Chunk Family | Dense underground material for reinforced construction and specialist tools. | PROVENANCE_STACK / pressure and hazard facets | Core Required / Underground/Deepstone |
| leyforge.core.item.family.mineral.stone.riftstone_chunk | Riftstone Chunk Family | Geothermal stone input for heat-resistant construction, alchemy and site restoration. | PROVENANCE_STACK / heat and instability state | Core Required / Geothermal Riftlands |
| leyforge.core.item.family.mineral.stone.travertine_chunk | Travertine Chunk Family | Decorative and practical mineral stone used by baths, shrines, civic works and trade. | PROVENANCE_STACK / wet, raw and polished concrete entries | Core Required / Geothermal / Culture |
| leyforge.core.item.family.mineral.crystal.matrix_shard | Crystal-Matrix Shard Family | Resonant cavern material for research, instruments, mana interfaces and risky refinement. | PROVENANCE_STACK / resonance, purity and instability | Core Required / Crystal Cavern / Magic |
| leyforge.core.item.family.mineral.salvage.machine_strata | Machine-Strata Salvage Family | Ancient engineered stone-metal salvage for research, repair and restored industry. | PROVENANCE_STACK / identified, sealed and unstable facets | Core Required / Machine Strata / Adventure |
| leyforge.core.item.family.mineral.aggregate.sand | Sand and Fine Aggregate Family | Glass, mortar, ceramics, filtration and construction input. | BULK_STACK / source and contamination facets | Core Required / River/Coast/Wetland |
| leyforge.core.item.family.mineral.aggregate.gravel | Gravel and Coarse Aggregate Family | Road fill, drainage, concrete-like mixes, filtration and prospecting by-product. | BULK_STACK / grade and mineral clue facets | Core Required / Routes / Industry |
| leyforge.core.item.family.mineral.earth.clay | Raw Clay Family | Brick, ceramic, tile, vessel and seal material. | BULK_STACK / moisture and purity state | Core Required / Wetland / Clayworks |
| leyforge.core.item.family.mineral.ceramic.fired_brick | Fired Brick and Tile Unit Family | Construction, kiln, roof, drain and heat-resistant component. | SIMPLE_STACK / material and shape concrete entries | Core Required / Clayworks / Building |
| leyforge.core.item.family.mineral.ceramic.vessel | Ceramic Vessel Family | Food, medicine, water, dye, alchemy and trade container. | CONTAINER_INSTANCE / sealed contents and breakage state | Core Required / Craft / Settlement |
| leyforge.core.item.family.mineral.binder.mortar | Mortar, Lime and Binder Family | Masonry, repair, plaster, road and structure-restoration input. | BULK_STACK / setting and quality grade | Core Required / Construction / Restoration |
| leyforge.core.item.family.mineral.glass.glasswork | Glasswork Material Family | Windows, lenses, bottles, instruments, mana devices and display cases. | SIMPLE_STACK / clear, coloured, reinforced concrete entries | Core Required / Glass / Magic / UI |

## Metals, Salvage and Industrial Materials

| Family ID | Family Name | World / Player Role | State Profile | Status / Owner |
| --- | --- | --- | --- | --- |
| leyforge.core.item.family.metal.copper.raw_ore | Raw Copper Ore Family | Primary early mechanical ore input from mining, salvage or trade. | PROVENANCE_STACK / grade and source | Core Required / CAP-03 / Extraction |
| leyforge.core.item.family.metal.copper.ingot | Copper Ingot Family | Refined copper base for tools, plates, wire, gears, vessels and trade. | QUALITY_STACK / purity and maker provenance | Core Required / CAP-03 / Refinement |
| leyforge.core.item.family.metal.copper.plate | Copper Plate Family | Machine casing, conduit, roof, repair and craft component. | QUALITY_STACK / thickness and quality | Core Required / Automation / Building |
| leyforge.core.item.family.metal.copper.wire | Copper Wire and Connector Family | Control, signal, basic power and mana-interface component. | SIMPLE_STACK / gauge as concrete definition | Core Required / Automation / Magic |
| leyforge.core.item.family.metal.copper.gear | Copper Gear and Mechanism Family | Early automation, clocks, sorters, mills and repair component. | QUALITY_STACK / wear and precision | Core Required / CAP-03 / Automation |
| leyforge.core.item.family.metal.copper.fastener | Copper Fastener Family | Nails, rivets, straps and repair hardware for early structures and machines. | BULK_STACK / form as concrete definition | Core Required / Construction / Automation |
| leyforge.core.item.family.metal.copper.alloy_branch | Copper-Alloy Branch Family | Optional capability-equivalent alloy path, including any later approved bronze-like entries, without making one named alloy universal. | QUALITY_STACK / recipe- and culture-owned concrete entries | Core Conditional / Capability Alternatives / 25J |
| leyforge.core.item.family.metal.iron.raw_ore | Raw Iron Ore Family | Structural and tool-capability ore from mines, salvage, trade or restored industry. | PROVENANCE_STACK / grade and source | Core Required / CAP-04 / Extraction |
| leyforge.core.item.family.metal.iron.ingot | Iron Ingot Family | Refined structural metal for tools, defence, machines, construction and settlement supply. | QUALITY_STACK / purity and maker provenance | Core Required / CAP-04 / Refinement |
| leyforge.core.item.family.metal.iron.plate | Iron Plate Family | Frames, armour, gates, machine casings and major repair component. | QUALITY_STACK / thickness and quality | Core Required / Industry / Defence |
| leyforge.core.item.family.metal.iron.rod | Iron Rod and Bar Family | Shafts, reinforcement, tools, fasteners and structural components. | QUALITY_STACK / shape and grade | Core Required / Industry / Construction |
| leyforge.core.item.family.metal.iron.fastener | Iron Fastener Family | Nails, bolts, rivets, chains and settlement repair stock. | BULK_STACK / form as concrete definition | Core Required / Settlement / Industry |
| leyforge.core.item.family.metal.iron.tool_blank | Iron Tool and Weapon Blank Family | Forged head, blade or body awaiting finishing and assembly. | QUALITY_STACK / intended role and maker provenance | Core Required / Craft / Equipment |
| leyforge.core.item.family.metal.iron.frame | Iron Structural Frame Stock Family | Non-placeable iron frame stock, members and fabricated components used by machines, gates, bridges, warehouses and projects; placed machine-frame Blocks remain Block-owned. | BULK_STACK / grade, dimensions and fabrication state | Core Required / Automation / Civilisation |
| leyforge.core.item.family.metal.precious.silver_family | Silver and Conductive Precious-Metal Family | Specialist trade, ward, creature counter and magical component without universal power scaling. | PROVENANCE_STACK / purity, legality and cultural value | Core Conditional / Magic / Trade |
| leyforge.core.item.family.metal.precious.gold_family | Gold and Ceremonial Precious-Metal Family | Currency reserve, ritual, ornament, relic restoration and high-value trade input. | PROVENANCE_STACK / purity and claim state | Core Conditional / Trade / Culture / Relics |
| leyforge.core.item.family.metal.salvage.mixed_scrap | Mixed Metal Scrap Family | Recoverable copper, iron and machine material from ruins, constructs, damaged equipment and events. | PROVENANCE_STACK / contamination and recoverable fractions | Core Required / Salvage / Repair |

## Fuel, Power and Portable Energy

| Family ID | Family Name | World / Player Role | State Profile | Status / Owner |
| --- | --- | --- | --- | --- |
| leyforge.core.item.family.fuel.firewood_bundle | Firewood Bundle Family | Accessible fuel, settlement heating and emergency supply produced from timber. | BULK_STACK / moisture and species facets | Core Required / Survival / Settlement |
| leyforge.core.item.family.fuel.charcoal | Charcoal Family | Renewable higher-efficiency fuel and metalworking input. | SIMPLE_STACK / quality and ash yield | Core Required / Industry / Forestry |
| leyforge.core.item.family.fuel.coal | Coal and Carbon Fuel Family | Mining-derived fuel, metalworking, filters and industrial trade input. | PROVENANCE_STACK / grade and impurity | Core Required / Underground / Industry |
| leyforge.core.item.family.fuel.peat | Cut Peat Fuel Family | Wetland and moor fuel supporting regional alternatives and trade. | BULK_STACK / wet and dried states | Core Required / Wetland / Moorland |
| leyforge.core.item.family.fuel.lamp_oil | Lamp Oil Family | Lighting, field use and selected crafting input. | CONTAINER_STACK / flammable contents and purity | Core Required / Settlement / Exploration |
| leyforge.core.item.family.fuel.resin_pitch | Resin-Pitch Fuel and Sealant Family | Dual-use fire, repair, waterproofing and machine-maintenance material. | CONTAINER_STACK / flammability and treatment | Core Required / Forestry / Routes |
| leyforge.core.item.family.fuel.mana_charge | Portable Mana Charge Family | Standardised charge-bearing item for approved mana infrastructure and devices. | CHARGED_STACK / capacity, purity and owner facets | Core Required / Magic / Automation |
| leyforge.core.item.family.fuel.emergency_heat_pack | Emergency Heat and Survival Fuel Pack | Prepared frontier supply for cold, disaster, rescue and caravan use. | SIMPLE_STACK / expiry only when contents require it | Core Required / Frontier / Trade |

## Food, Water, Medicine and Settlement Health

| Family ID | Family Name | World / Player Role | State Profile | Status / Owner |
| --- | --- | --- | --- | --- |
| leyforge.core.item.family.food.raw.grain | Harvested Grain Family | Staple food, flour, brewing/fermentation where later approved, seed reserve and animal feed. | SPOILAGE_STACK / dryness and contamination | Core Required / Agriculture / Provisions |
| leyforge.core.item.family.food.processed.flour | Flour and Meal Family | Bread, porridge, thickening and settlement food-production input. | SPOILAGE_STACK / grade and pest exposure | Core Required / Cooking / Settlement |
| leyforge.core.item.family.food.cooked.bread | Bread and Baked Staple Family | Portable everyday food and settlement provision with culture variants. | SPOILAGE_STACK / freshness and quality | Core Required / Cooking / Culture |
| leyforge.core.item.family.food.cooked.porridge | Porridge and Grain-Pot Family | Low-complexity cooked staple for survival and communal kitchens. | SPOILAGE_STACK / recipe and quality | Core Required / Cooking / Settlement |
| leyforge.core.item.family.food.raw.root_vegetable | Root Vegetable Family | Reliable crop and forage food with long storage and regional variants. | SPOILAGE_STACK / freshness and disease | Core Required / Agriculture / Frontier |
| leyforge.core.item.family.food.raw.orchard_fruit | Orchard Fruit Family | Fresh food, preserves, trade and morale input. | SPOILAGE_STACK / ripeness and bruising | Core Required / Temperate Agriculture |
| leyforge.core.item.family.food.raw.berry | Berry and Small-Fruit Food Family | Immediate forage, preserves, cooking and medicine ingredient. | SPOILAGE_STACK / freshness and toxicity knowledge | Core Required / Surface Biomes |
| leyforge.core.item.family.food.raw.mushroom | Edible Mushroom Food Family | Forest and cave food with identification and preparation requirements. | SPOILAGE_STACK / identified, fresh and contaminated states | Core Required / Forest / Underground |
| leyforge.core.item.family.food.raw.meat | Raw Meat Family | Hunting, livestock and creature-derived food input with source provenance. | SPOILAGE_STACK / species, freshness and lawful source | Core Required / Ecology / Cooking |
| leyforge.core.item.family.food.raw.egg | Egg Family | Domestic food, baking and breeding-related settlement good. | SPOILAGE_STACK / freshness and fertilised flag where relevant | Core Required / Domestic Ecology |
| leyforge.core.item.family.food.raw.milk | Milk and Fresh Dairy Input Family | Renewable nutrition, cooking and culture-good input. | CONTAINER_STACK / spoilage, source and cleanliness | Core Required / Domestic Ecology |
| leyforge.core.item.family.food.processed.fat | Rendered Fat and Tallow Family | Cooking, preservation, candles, medicine and craft input. | CONTAINER_STACK / food-grade and industrial-grade concrete entries | Core Required / Cooking / Craft |
| leyforge.core.item.family.food.cooked.stew | Stew and Communal Meal Family | Flexible meal that accepts capability-approved ingredients and supports communal kitchens. | SPOILAGE_STACK / recipe provenance and serving count | Core Required / Settlement / Cooking |
| leyforge.core.item.family.food.preserved.dried | Dried Food Family | Travel, caravan, dungeon and emergency supply. | SPOILAGE_STACK / long-life and packaging state | Core Required / Trade / Exploration |
| leyforge.core.item.family.food.preserved.pickled | Pickled and Brined Food Family | Long-term vegetable, fungus and selected protein preservation. | CONTAINER_STACK / sealed and contamination state | Core Required / Settlement / Trade |
| leyforge.core.item.family.food.preserved.smoked | Smoked and Cured Food Family | Long-life protein and cultural trade good. | SPOILAGE_STACK / cure quality and source | Core Required / Settlement / Frontier |
| leyforge.core.item.family.food.ration.travel | Travel Ration Family | Standardised route, guard, rescue and adventure provision. | SIMPLE_STACK / packaged serving and provenance | Core Required / Routes / Defence |
| leyforge.core.item.family.food.feed.animal | Animal Feed Family | Livestock, work-beast and emergency wildlife-care input. | BULK_STACK / nutrition class and contamination | Core Required / Agriculture / Ecology |
| leyforge.core.item.family.water.container.clean | Clean Water Container Family | Player, caravan, medicine and emergency water supply without making the item the canonical water-source definition. | CONTAINER_INSTANCE / volume, cleanliness and owner | Core Required / Survival / Health |
| leyforge.core.item.family.health.bandage | Bandage and Dressing Family | Basic wound treatment and settlement infirmary supply. | SIMPLE_STACK / cleanliness and quality | Core Required / Health / Textile |
| leyforge.core.item.family.health.poultice | Medicinal Poultice Family | Herbal wound, swelling and minor-status treatment. | SPOILAGE_STACK / potency and contamination | Core Required / Health / Herbs |
| leyforge.core.item.family.health.tonic | Medicinal Tonic Family | Prepared treatment for approved illnesses, fatigue or environmental effects. | CONTAINER_STACK / dose, potency and expiry | Core Required / Health / Alchemy |
| leyforge.core.item.family.health.antidote | Antidote and Antivenom Family | Counters defined toxin/venom classes using source-supported ingredients. | CONTAINER_STACK / target class and potency | Core Required / Health / Creature Resources |
| leyforge.core.item.family.health.cleansing_salve | Cleansing Salve Family | Treats bounded corruption/blight exposure and supports restoration. | CONTAINER_STACK / purity, target and expiry | Core Required / Health / Magic |

## Creature Products, Samples and Trophies

| Family ID | Family Name | World / Player Role | State Profile | Status / Owner |
| --- | --- | --- | --- | --- |
| leyforge.core.item.family.creature.food.game_meat | Game Meat Resource Family | Lawful hunting output supporting food, trade and ecology feedback. | SPOILAGE_STACK / species and harvest provenance | Core Required / Wildlife / Provisions |
| leyforge.core.item.family.creature.material.hide | Creature Hide Family | Skin material for leather, tents, packs, armour and trade. | SPOILAGE_STACK / species, condition and legality | Core Required / Wildlife / Equipment |
| leyforge.core.item.family.creature.material.leather | Processed Leather Family | Durable equipment, containers, belts, books and machine part. | QUALITY_STACK / tanning method and maker | Core Required / Craft / Equipment |
| leyforge.core.item.family.creature.material.bone | Bone and Dense Skeletal Material Family | Tools, glue, carvings, fertiliser, wards and research. | PROVENANCE_STACK / species and condition | Core Required / Creature Resources |
| leyforge.core.item.family.creature.material.horn_antler | Horn and Antler Family | Handles, instruments, trophies, medicine and magical components. | PROVENANCE_STACK / species and lawful source | Core Required / Wildlife / Culture |
| leyforge.core.item.family.creature.material.feather | Feather and Quill Family | Arrows, writing, insulation, ornament and ecology clues. | SIMPLE_STACK / species and quality facets | Core Required / Wildlife / Knowledge |
| leyforge.core.item.family.creature.material.chitin | Chitin and Carapace Family | Armour, tools, filters, alchemy and construct-like components. | PROVENANCE_STACK / species and damage | Core Required / Hostile/Underground Ecology |
| leyforge.core.item.family.creature.material.silk | Natural Silk and Web Fibre Family | Textiles, traps, filters, medicine and automation belts. | QUALITY_STACK / tensile grade and contamination | Core Required / Cavern Weaver / Craft |
| leyforge.core.item.family.creature.reagent.venom | Venom and Toxin Family | Antidote, alchemy, traps and combat consumable input with strict target classes. | CONTAINER_STACK / potency, source and legality | Core Required / Hostile Ecology / Health |
| leyforge.core.item.family.creature.reagent.gland | Creature Gland and Secretion Family | Medicine, scent, alchemy, bait and ecology-research input. | SPOILAGE_STACK / source and potency | Core Required / Creature Resources |
| leyforge.core.item.family.creature.material.tallow | Creature Fat and Tallow Family | Food, candles, waterproofing, medicine and craft input. | CONTAINER_STACK / food-grade and industrial-grade entries | Core Required / Creature Resources |
| leyforge.core.item.family.creature.material.shell_scale | Shell, Scale and Plate Family | Armour, shields, tools, ornament and specialist construction. | PROVENANCE_STACK / species and integrity | Core Required / Creature Resources |
| leyforge.core.item.family.creature.magic.essence | Magical Creature Essence Family | Bounded magic, research, rune and ritual input from approved magical creatures. | CHARGED_STACK / affinity, purity and source | Core Required / Magical Ecology / Magic |
| leyforge.core.item.family.creature.magic.spirit_mote | Spirit Mote and Memory Trace Family | Non-material spirit evidence for dialogue, remembrance, cleansing and history. | PROVENANCE_STACK / consent, source and stability | Core Required / Spirit Ecology / Narrative |
| leyforge.core.item.family.creature.magic.rune_antler_fragment | Runic Antler and Inscribed Growth Family | Readable magical-creature material for study, focus construction and lawful trophies. | PROVENANCE_STACK / pattern and source | Core Required / Rune-Antler Ecology |
| leyforge.core.item.family.creature.crystal.carapace | Crystal Carapace and Burrower Shard Family | Resonant armour, lens, tool and mana-interface material. | PROVENANCE_STACK / resonance and fracture | Core Required / Crystal Burrower / Underground |
| leyforge.core.item.family.creature.undead.residue | Undead Residue Family | Research, cleansing, ward maintenance and forbidden-use risk record. | HAZARD_STACK / contamination, legality and containment | Core Required / Undead Ecology / Magic |
| leyforge.core.item.family.creature.corruption.sample | Corruption Sample Family | Sealed research and cleansing input that carries spread and legal risks. | HAZARD_CONTAINER / strain, stability and custody | Core Required / Corruption Ecology / Health |
| leyforge.core.item.family.creature.construct.scrap | Construct Scrap Family | Metal, stone, rune and component salvage from damaged constructs. | PROVENANCE_STACK / owner, claim and recoverable parts | Core Required / Construct Ecology / Automation |
| leyforge.core.item.family.creature.construct.core | Construct Core and Control Fragment Family | Repair, research, personhood evidence and advanced automation input. | UNIQUE_OR_STACK / identity, memory and ownership safeguards | Core Conditional / Construct Ecology / Personhood |
| leyforge.core.item.family.creature.nest.material | Nest and Habitat Material Family | Ecology clue, bait, farming, research and restoration input collected without erasing habitat state. | PROVENANCE_STACK / nest, species and legality | Core Required / Ecology / World State |
| leyforge.core.item.family.creature.research.specimen | Creature Research Specimen Family | Tagged sample supporting Codex, medicine, ecology and quest progress. | PROVENANCE_CONTAINER / source, method and chain of custody | Core Required / Research / Knowledge |
| leyforge.core.item.family.creature.trophy.common | Common Creature Trophy Family | Display, reputation, hunting record and culture use without implying every kill yields a trophy. | PROVENANCE_INSTANCE / lawful source and display state | Core Required / Culture / Hunting |
| leyforge.core.item.family.creature.capture.nonperson | Non-Person Creature Handling Token Family | Represents approved tame, transport or husbandry permissions without converting persons into inventory. | CONTRACT_INSTANCE / target entity reference and welfare state | Core Conditional / Taming / Personhood Boundary |

## Tools, Instruments and Work Equipment

| Family ID | Family Name | World / Player Role | State Profile | Status / Owner |
| --- | --- | --- | --- | --- |
| leyforge.core.item.family.tool.harvest.axe | Axe Tool Family | Tree felling, branch harvesting, carpentry and selected combat use. | DURABLE_INSTANCE / material, quality, condition and enchantment facets | Core Required / Forestry / Survival |
| leyforge.core.item.family.tool.harvest.pickaxe | Pickaxe Tool Family | Stone, ore and hard-block mining with capability-based tool requirements. | DURABLE_INSTANCE / material and tool-capability band | Core Required / Mining / Survival |
| leyforge.core.item.family.tool.harvest.shovel | Shovel Tool Family | Soil, clay, sand, snow and aggregate gathering and terrain work. | DURABLE_INSTANCE / material and efficiency | Core Required / Terrain / Agriculture |
| leyforge.core.item.family.tool.harvest.hoe | Hoe and Cultivator Tool Family | Field preparation, crop care, soil improvement and irrigation work. | DURABLE_INSTANCE / material and agriculture capability | Core Required / Agriculture |
| leyforge.core.item.family.tool.harvest.sickle | Sickle and Reaping Tool Family | Crop, reed, herb and fibre harvesting with reduced damage. | DURABLE_INSTANCE / material and harvest profile | Core Required / Agriculture / Wetland |
| leyforge.core.item.family.tool.harvest.knife | Utility Knife Family | Harvesting, food preparation, carving, hide processing and field utility. | DURABLE_INSTANCE / material and sanitation state | Core Required / Survival / Craft |
| leyforge.core.item.family.tool.build.hammer | Builder Hammer Family | Construction, repair, project contribution and component assembly. | DURABLE_INSTANCE / material, quality and project permissions | Core Required / Building / Settlement |
| leyforge.core.item.family.tool.build.saw | Saw Tool Family | Timber conversion, construction, furniture and machine-component production. | DURABLE_INSTANCE / blade material and condition | Core Required / Forestry / Industry |
| leyforge.core.item.family.tool.build.chisel | Masonry and Carving Chisel Family | Stone shaping, inscription, restoration and archaeology interaction. | DURABLE_INSTANCE / tip material and role | Core Required / Construction / Adventure |
| leyforge.core.item.family.tool.build.trowel | Trowel and Masonry Tool Family | Mortar, brick, plaster, repair and detailed construction. | DURABLE_INSTANCE / material and cleanliness | Core Required / Construction |
| leyforge.core.item.family.tool.engineering.wrench | Wrench and Configuration Tool Family | Machine rotation, port configuration, repair, ownership-safe dismantling and diagnostics. | DURABLE_INSTANCE / permission and tool-capability band | Core Required / Automation |
| leyforge.core.item.family.tool.engineering.prospecting | Prospecting Hammer and Sample Kit Family | Reads surface clues, grades and deposit context without revealing hidden guarantees. | DURABLE_INSTANCE / knowledge and calibration | Core Required / Mining / Exploration |
| leyforge.core.item.family.tool.engineering.survey_lens | Survey Lens and Measurement Tool Family | Terrain, route, structure, leyline and machine inspection. | DURABLE_OR_CHARGED / calibration and knowledge state | Core Required / Worldgen / Engineering |
| leyforge.core.item.family.tool.engineering.salvage | Salvage and Dismantling Tool Family | Recovers components from ruins, machines and structures according to ownership and damage rules. | DURABLE_INSTANCE / claim, skill and target profile | Core Required / Adventure / Automation |
| leyforge.core.item.family.tool.engineering.repair_kit | Field Repair Kit Family | Portable bounded repair for tools, machines, blocks and route infrastructure. | CONSUMABLE_OR_DURABLE / charge count and compatibility | Core Required / Repair / Settlement |
| leyforge.core.item.family.tool.agriculture.pruning | Pruning and Grafting Tool Family | Orchard, living structure and plant-health interaction. | DURABLE_INSTANCE / cleanliness and plant compatibility | Core Required / Agriculture / Verdant |
| leyforge.core.item.family.tool.animal.handling | Animal Handling Tool Family | Feeding, leading, grooming, veterinary and husbandry interactions. | DURABLE_INSTANCE / welfare and species compatibility | Core Required / Domestic Ecology |
| leyforge.core.item.family.tool.health.medical_kit | Medical Kit Family | Treatment, diagnosis and settlement-health work using valid supplies. | CONTAINER_INSTANCE / contents, cleanliness and owner | Core Required / Health / NPC Jobs |
| leyforge.core.item.family.tool.magic.rune_chisel | Rune Chisel Family | Creates or repairs approved rune inscriptions on supported substrates. | DURABLE_INSTANCE / rune knowledge and material compatibility | Core Required / Magic / Craft |
| leyforge.core.item.family.tool.magic.rune_tuner | Rune Tuner Family | Configures mana, ward and control networks without owning the network state. | CHARGED_DURABLE / calibration and access permissions | Core Required / Magic / Automation |
| leyforge.core.item.family.tool.magic.ward_key | Ward Key and Access Focus Family | Authorised inspection, bypass, repair or rekeying of warded infrastructure. | UNIQUE_OR_DURABLE / owner, faction and permission state | Core Required / Magic / Ownership |
| leyforge.core.item.family.tool.navigation.mapmaking_kit | Mapmaking and Survey Kit Family | Creates maps, route notes, markers and expedition records from discovered information. | CONTAINER_INSTANCE / tools, media and knowledge state | Core Required / Routes / UI |
| leyforge.core.item.family.tool.build.blueprint_tool | Blueprint Planning Tool Family | Captures, previews, validates and commissions approved structure blueprints. | DURABLE_OR_KNOWLEDGE / blueprint references and permissions | Core Required / Blueprint / Forge |
| leyforge.core.item.family.tool.utility.container | Bucket, Flask and General Container Tool Family | Carries approved fluids, powders, samples and supplies with volume and contamination rules. | CONTAINER_INSTANCE / contents, seal, cleanliness and material | Core Required / Survival / Craft |

## Weapons, Armour and Personal Equipment

| Family ID | Family Name | World / Player Role | State Profile | Status / Owner |
| --- | --- | --- | --- | --- |
| leyforge.core.item.family.equipment.weapon.sword | Sword and Long-Blade Family | Dedicated close-combat weapon with material and culture variants. | DURABLE_INSTANCE / quality, condition, provenance and enchantment | Core Required / Combat / Craft |
| leyforge.core.item.family.equipment.weapon.axe | Combat Axe Family | Weapon-focused axe variants distinct from ordinary harvesting tools where behaviour differs. | DURABLE_INSTANCE / quality and combat profile | Core Required / Combat / Craft |
| leyforge.core.item.family.equipment.weapon.hammer_mace | Hammer and Mace Weapon Family | Impact weapon for armoured, construct and structure interactions. | DURABLE_INSTANCE / quality and damage profile | Core Required / Combat / Defence |
| leyforge.core.item.family.equipment.weapon.spear | Spear and Polearm Family | Reach weapon, hunting tool and guard equipment with culture variants. | DURABLE_INSTANCE / shaft/head quality | Core Required / Combat / Hunting |
| leyforge.core.item.family.equipment.weapon.bow | Bow Family | Ranged hunting and combat weapon using physical ammunition. | DURABLE_INSTANCE / draw class and condition | Core Required / Combat / Hunting |
| leyforge.core.item.family.equipment.weapon.crossbow | Crossbow Family | Heavier ranged weapon and settlement-defence option. | DURABLE_INSTANCE / mechanism quality and reload profile | Core Conditional / Combat / Defence |
| leyforge.core.item.family.equipment.weapon.thrown | Thrown Weapon Family | Knives, darts or approved thrown tools with recoverability rules. | DURABLE_STACK_OR_INSTANCE / recovery and ownership | Core Required / Combat / Hunting |
| leyforge.core.item.family.equipment.defence.shield | Shield Family | Active defence, guard supply and culture presentation. | DURABLE_INSTANCE / material, integrity and coverage | Core Required / Combat / Defence |
| leyforge.core.item.family.equipment.magic.focus | Spell Focus Family | Wand, staff, rod or focus variants that support but do not replace spell knowledge. | CHARGED_DURABLE / affinity, capacity and quality | Core Required / Magic / Combat |
| leyforge.core.item.family.equipment.armour.light | Light Armour Family | Mobility-focused hide, textile, chitin or mixed armour. | DURABLE_INSTANCE / body slot, quality and condition | Core Required / Combat / Craft |
| leyforge.core.item.family.equipment.armour.medium | Medium Armour Family | Balanced layered armour for exploration, guards and specialists. | DURABLE_INSTANCE / body slot, quality and condition | Core Required / Combat / Defence |
| leyforge.core.item.family.equipment.armour.heavy | Heavy Armour Family | High-protection iron or approved specialist armour with movement and maintenance costs. | DURABLE_INSTANCE / body slot, quality and condition | Core Required / Combat / Industry |
| leyforge.core.item.family.equipment.armour.robe | Robe and Ritual Garment Family | Magic, culture, medicine and ceremony clothing with low physical protection. | DURABLE_INSTANCE / body slot, culture and enchantment | Core Required / Magic / Culture |
| leyforge.core.item.family.equipment.clothing.environmental | Environmental Clothing Family | Cold, wetland, heat, cave and contamination protection. | DURABLE_INSTANCE / environment tags and condition | Core Required / Survival / Exploration |
| leyforge.core.item.family.equipment.accessory.backpack | Backpack and Carry Container Family | Inventory expansion with physical capacity, ownership and upgrade rules. | CONTAINER_EQUIPMENT / slots, condition and owner | Core Required / Inventory / Exploration |
| leyforge.core.item.family.equipment.accessory.tool_belt | Tool Belt and Work Rig Family | Quick-access work equipment and profession identity. | CONTAINER_EQUIPMENT / allowed-item rules | Core Required / Craft / NPC Jobs |
| leyforge.core.item.family.equipment.accessory.cloak | Cloak and Mantle Family | Weather protection, culture presentation and selected magic effects. | DURABLE_INSTANCE / condition and culture variant | Core Required / Survival / Culture |
| leyforge.core.item.family.equipment.accessory.charm | Charm, Ring and Amulet Family | Small persistent modifiers, reputation symbols, keys or magical support without universal rarity scaling. | UNIQUE_OR_DURABLE / slot, provenance and charge | Core Required / Progression / Magic |

## Automation and Machine Components

| Family ID | Family Name | World / Player Role | State Profile | Status / Owner |
| --- | --- | --- | --- | --- |
| leyforge.core.item.family.automation.component.frame | Assembled Machine Frame Component Family | Portable assembled machine chassis/component prepared for machine recipes and projects; a commissioned or placed machine-frame Block is a different lifecycle state owned by Document 03. | QUALITY_INSTANCE_OR_STACK / material, load class, interfaces and assembly state | Core Required / Automation / Industry |
| leyforge.core.item.family.automation.component.gear | Gear and Cog Family | Mechanical motion transfer and machine assembly. | QUALITY_STACK / material, size and precision | Core Required / Automation |
| leyforge.core.item.family.automation.component.shaft | Shaft and Axle Family | Rotational transmission and cart/machine assembly. | QUALITY_STACK / material and load class | Core Required / Automation / Routes |
| leyforge.core.item.family.automation.component.bearing | Bearing and Bushing Family | Reduces wear and enables higher-speed machinery. | QUALITY_STACK / material, precision and lubrication | Core Required / Automation |
| leyforge.core.item.family.automation.component.belt | Belt and Flexible Drive Family | Mechanical drive, conveyor and selected processing applications. | QUALITY_STACK / material and tensile rating | Core Required / Automation / Creature Silk |
| leyforge.core.item.family.automation.component.chute | Chute and Gravity-Feed Component Family | Simple bulk-item movement and machine input. | SIMPLE_STACK / material and connection profile | Core Required / Early Automation |
| leyforge.core.item.family.automation.component.pipe | Pipe and Sealed Conduit Component Family | Compact routing for approved fluids, gases or items under system-specific rules. | SIMPLE_STACK / material, diameter and content compatibility | Core Required / Automation / Fluids |
| leyforge.core.item.family.automation.component.filter | Filter and Screen Family | Sorting, purification, ventilation and processing component. | QUALITY_STACK / target tags and wear | Core Required / Automation / Health |
| leyforge.core.item.family.automation.component.sorter | Sorter and Routing Mechanism Family | Priority and filter-based item routing. | DURABLE_INSTANCE / configuration stored in placed block, not loose item | Core Required / Automation |
| leyforge.core.item.family.automation.component.hopper | Hopper and Transfer Interface Family | Inventory-to-machine and machine-to-container transfer component. | QUALITY_STACK / throughput class | Core Required / Automation / Storage |
| leyforge.core.item.family.automation.component.cart_wheel | Cart Wheel and Running Gear Family | Handcart, minecart and route-transport assembly. | QUALITY_STACK / load and terrain class | Core Required / Routes / Automation |
| leyforge.core.item.family.automation.component.rail | Rail and Track Component Family | Minecart and bounded industrial route infrastructure. | BULK_STACK / material and gauge concrete entries | Core Required / Underground / Industry |
| leyforge.core.item.family.automation.component.power_interface | Mechanical Power Interface Family | Crank, wheel, shaft coupling and approved early-power components. | QUALITY_STACK / power class and compatibility | Core Required / Automation / Power |
| leyforge.core.item.family.automation.component.furnace_lining | Furnace and Kiln Lining Family | Heat-resistant maintenance and upgrade component. | BULK_STACK / temperature class and condition | Core Required / Industry / Clayworks |
| leyforge.core.item.family.automation.component.crusher_head | Crusher Head Family | Ore, stone and material-processing component. | DURABLE_INSTANCE / material, wear and target class | Core Required / Industry |
| leyforge.core.item.family.automation.component.saw_blade | Machine Saw Blade Family | Sawmill, workshop and automated timber-processing component. | DURABLE_INSTANCE / material and wear | Core Required / Forestry / Automation |
| leyforge.core.item.family.automation.component.miner_head | Extraction Head Family | Bounded automated-mining component linked to deposit and permission rules. | DURABLE_INSTANCE / material, target class and wear | Core Required / Mining / Automation |
| leyforge.core.item.family.automation.component.maintenance_pack | Machine Maintenance Pack Family | Lubrication, seals, fasteners and repair consumables for machines. | CONSUMABLE_STACK / compatibility and quality | Core Required / Automation / Settlement |
| leyforge.core.item.family.automation.component.logic_switch | Mechanical and Rune Logic Switch Family | Control input for approved machines and networks. | DURABLE_INSTANCE / configuration applied after placement | Core Required / Automation / Magic |
| leyforge.core.item.family.automation.component.sensor | Sensor and Detector Family | Reads inventory, pressure, environment, mana or route conditions through approved interfaces. | DURABLE_INSTANCE / sensor type and calibration | Core Conditional / Automation / Runtime |
| leyforge.core.item.family.automation.component.storage_upgrade | Storage Upgrade Module Family | Capacity, filtering, preservation or security upgrade for compatible storage. | DURABLE_INSTANCE / target class and owner | Core Required / Storage / Automation |
| leyforge.core.item.family.automation.component.mana_coil | Mana Coil and Coupler Family | Connects mechanical machines to approved mana power/control systems. | CHARGED_DURABLE / purity, capacity and insulation | Core Required / Magic / Automation |

## Mana, Runes and Magical Components

| Family ID | Family Name | World / Player Role | State Profile | Status / Owner |
| --- | --- | --- | --- | --- |
| leyforge.core.item.family.magic.mana.raw_crystal | Raw Mana Crystal Family | Natural magical resource item retaining source, grade and purity. | PROVENANCE_STACK / purity, resonance and contamination | Core Required / Practical Magic / Worldgen |
| leyforge.core.item.family.magic.mana.shard | Mana Shard Family | Processed or fractured mana unit for devices, crafting and trade. | CHARGED_STACK / capacity and purity | Core Required / Practical Magic |
| leyforge.core.item.family.magic.mana.dust | Mana Dust Family | Fine magical material for runes, inks, alchemy and precision components. | CHARGED_STACK / affinity and contamination | Core Required / Practical Magic |
| leyforge.core.item.family.magic.mana.core | Refined Mana Core Family | Stable charge and machine/ward component requiring approved refinement. | CHARGED_DURABLE / capacity, stability and maker | Core Required / Magic / Automation |
| leyforge.core.item.family.magic.rune.blank | Portable Rune Blank and Inscription Substrate Family | Portable prepared substrate awaiting inscription or installation; placed rune-substrate Blocks are separately Block-owned after placement/assembly. | QUALITY_STACK / substrate compatibility, maker and preparation state | Core Required / Rune Craft |
| leyforge.core.item.family.magic.rune.ink | Rune Ink and Inscription Medium Family | Physical medium for writing, engraving and stabilising approved runes. | CONTAINER_STACK / affinity, purity and expiry | Core Required / Rune Craft / Knowledge |
| leyforge.core.item.family.magic.rune.control | Control Rune Family | Approved machine, routing, lock or signal function definition represented as an item before installation. | CHARGED_OR_SIMPLE / exact rune definition and quality | Core Required / Magic / Automation |
| leyforge.core.item.family.magic.rune.ward | Ward Rune Family | Protection, warning and boundary function for supported infrastructure. | CHARGED_OR_SIMPLE / exact rune definition and quality | Core Required / Magic / Settlement |
| leyforge.core.item.family.magic.rune.transformation | Transformation Rune Family | Processing, refinement or state-change support under recipe and risk rules. | CHARGED_OR_SIMPLE / exact rune definition and quality | Core Conditional / Magic / Recipes |
| leyforge.core.item.family.magic.glyph.plate | Glyph Plate and Rune Circuit Family | Reusable or installed logical/magical component for machines and structures. | DURABLE_CHARGED / circuit identity and compatibility | Core Required / Magic / Automation |
| leyforge.core.item.family.magic.ward.focus | Ward Focus Family | Core component for wardstones, ward lanterns and protected routes. | CHARGED_DURABLE / coverage class and owner | Core Required / Magic / Safety |
| leyforge.core.item.family.magic.conduit.core | Portable Mana Conduit Core Component Family | Portable transmission component consumed or installed into conduit infrastructure; the placed Mana Conduit Block is not this Item. | CHARGED_STACK / capacity, insulation, condition and installation compatibility | Core Required / Magic / Automation |
| leyforge.core.item.family.magic.storage.battery | Mana Battery Family | Portable or installable charge storage with explicit safe-failure behaviour. | CHARGED_INSTANCE / capacity, purity, owner and condition | Core Required / Magic / Automation |
| leyforge.core.item.family.magic.cleansing.reagent | Cleansing Reagent Family | Purifies bounded corruption, blight, residue or contaminated equipment. | CONTAINER_STACK / target class and potency | Core Required / Magic / Health |
| leyforge.core.item.family.magic.ritual.catalyst | Ritual Catalyst Family | Physical catalyst for approved rituals, route stabilisation and world-state actions. | PROVENANCE_STACK / ritual tags, consent and legality | Core Required / Magic / Events |
| leyforge.core.item.family.magic.knowledge.scroll | Spell and Ritual Scroll Family | Teaches, records or temporarily authorises defined magical knowledge. | KNOWLEDGE_INSTANCE / author, language, use and ownership | Core Required / Magic / Knowledge |
| leyforge.core.item.family.magic.knowledge.spellbook | Spellbook and Grimoire Family | Persistent collection of learned or researchable magic records. | CONTAINER_KNOWLEDGE / entries, owner and condition | Core Required / Magic / Progression |
| leyforge.core.item.family.magic.focus.crystal | Focus Crystal Family | Lens or resonator for personal magic, instruments and devices. | CHARGED_DURABLE / affinity, quality and fracture | Core Required / Magic / Equipment |
| leyforge.core.item.family.magic.seal.key | Magical Seal and Key Family | Access, route, ward or site-state token tied to authoritative records. | UNIQUE_INSTANCE / target reference, owner and expiry | Core Required / Magic / Adventure |
| leyforge.core.item.family.magic.ley.prism | Leyline Tuning Prism Family | Survey, align and stabilise leyline-linked infrastructure. | CHARGED_DURABLE / calibration and site compatibility | Core Required / Leyline / Magic |
| leyforge.core.item.family.magic.route.charge | Realm Route Stabiliser Charge Family | Consumable or rechargeable input for safe route operation and return guarantees. | CHARGED_STACK / route compatibility and stability | Core Required / Realm Access |
| leyforge.core.item.family.magic.hazard.corrupted_shard | Corrupted Magical Shard Family | Contained high-risk resource for research, cleansing or forbidden paths. | HAZARD_STACK / strain, legality and containment | Core Conditional / Corruption / Morality |

## Settlement Supply, Trade and Ownership Records

| Family ID | Family Name | World / Player Role | State Profile | Status / Owner |
| --- | --- | --- | --- | --- |
| leyforge.core.item.family.settlement.supply.construction | Construction Supply Bundle Family | Standardised project contribution made from exact underlying materials, never an abstract free resource. | BUNDLE_STACK / manifest of conserved inputs | Core Required / Settlement Projects |
| leyforge.core.item.family.settlement.supply.project_package | Project Supply Package and Manifest Family | Non-placeable staged-project package/manifest that reserves and groups exact underlying materials without creating a second physical crate identity. | BUNDLE_OR_RECORD / manifest, owner, destination, contribution and reservation references | Core Required / Settlement Projects |
| leyforge.core.item.family.settlement.supply.repair | Settlement Repair Supply Family | Emergency and routine repair package for structures, routes and services. | BUNDLE_STACK / material-class manifest | Core Required / Settlement / Aftermath |
| leyforge.core.item.family.settlement.supply.guard | Guard and Defence Supply Family | Weapons, ammunition, armour, food and maintenance goods reserved for defence. | CONTAINER_INSTANCE / exact contents and permission | Core Required / Defence / Settlement |
| leyforge.core.item.family.settlement.supply.medical | Medical Supply Package Family | Bandages, medicines, clean containers and health tools grouped as an exact-content relief/infirmary package; the package is not a duplicate placeable crate Block. | PACKAGE_INSTANCE / exact contents, expiry, custody and destination | Core Required / Health / Settlement |
| leyforge.core.item.family.settlement.supply.relief_food | Relief and Emergency Food Package Family | Preserved food and water for disaster, shortage, migration and rescue. | CONTAINER_INSTANCE / servings, expiry and destination | Core Required / Events / Settlement |
| leyforge.core.item.family.settlement.supply.seed_stock | Seed Stock and Agricultural Reserve Family | Protected crop, herb and orchard propagation reserve. | CONTAINER_INSTANCE / varieties, viability and ownership | Core Required / Agriculture / Settlement |
| leyforge.core.item.family.settlement.supply.tool_allotment | Profession Tool Allotment Family | Exact tool and repair-stock package for NPC jobs and visiting specialists. | CONTAINER_INSTANCE / job profile and contents | Core Required / NPC Jobs / Economy |
| leyforge.core.item.family.trade.goods.bale | Trade Bale and Bulk-Goods Family | Standardised textiles, fibre, hide, food or craft goods for caravans and warehouses. | BULK_CONTAINER / manifest, provenance and owner | Core Required / Trade / Warehouses |
| leyforge.core.item.family.trade.goods.cargo_lot | Packaged Cargo Lot Family | Authoritative cargo-lot grouping for exact underlying goods and custody; any physical crate, barrel or container remains a Block projection or separate container Item as appropriate. | CARGO_LOT / manifest, contents refs, mass-volume class, custody and owner | Core Required / Trade / Set 26 Compatibility |
| leyforge.core.item.family.trade.record.warehouse_manifest | Warehouse Manifest Family | Authoritative record of deliveries, reservations, ownership and shortages. | CONTRACT_KNOWLEDGE / linked transaction records | Core Required / Storage / UI |
| leyforge.core.item.family.trade.record.delivery_contract | Delivery Contract Family | Defines requested goods, destination, ownership transfer, payment and failure rules. | CONTRACT_INSTANCE / parties, conditions and expiry | Core Required / Trade / Quests |
| leyforge.core.item.family.trade.record.tax_tribute | Tax, Tariff and Tribute Record Family | Physical or digital-facing evidence for lawful or coercive transfers. | CONTRACT_INSTANCE / jurisdiction and transaction link | Core Required / Factions / Economy |
| leyforge.core.item.family.trade.record.permit | Permit and Licence Family | Authorises restricted gathering, trade, salvage, access or profession actions. | UNIQUE_CONTRACT / jurisdiction, holder and expiry | Core Required / Law / Factions |
| leyforge.core.item.family.trade.record.ownership_token | Ownership and Claim Token Family | Portable representation of a persistent claim without making possession alone authoritative. | UNIQUE_CONTRACT / target entity and registry owner | Core Required / Ownership / Multiplayer |
| leyforge.core.item.family.trade.record.faction_seal | Faction Seal and Credential Family | Identity, reputation, diplomatic and access evidence. | UNIQUE_INSTANCE / faction, holder and status | Core Required / Factions / Narrative |
| leyforge.core.item.family.trade.currency.physical | Physical Currency Family | Coins, notes or bars where a world profile uses physical money, separate from abstract reputation. | PROVENANCE_STACK / issuer, denomination and authenticity | Core Required / Economy / Culture |
| leyforge.core.item.family.trade.pack.caravan | Caravan and Expedition Pack Family | Prepared route supplies, replacement parts and trade documents for regional travel. | CONTAINER_INSTANCE / contents, owner and route plan | Core Required / Routes / Trade |

## Culture Signature Goods

| Family ID | Family Name | World / Player Role | State Profile | Status / Owner |
| --- | --- | --- | --- | --- |
| leyforge.core.item.family.culture.hearthland.communal_pantry | Hearthland Communal Pantry Goods Family | Preserved staples, shared-kitchen supplies and mutual-aid provisions reflecting Hearthland civic identity. | BUNDLE_OR_CONTAINER / provenance and settlement use | Core Required / Hearthland Commons |
| leyforge.core.item.family.culture.hearthland.hearthward_charm | Hearthland Hearthward Charm Family | Practical household and community protection object linked to approved ward knowledge. | DURABLE_OR_CHARGED / maker and household provenance | Core Required / Hearthland Commons / Magic |
| leyforge.core.item.family.culture.marchroad.route_ledger | Marchroad Route Ledger Family | Survey, toll, road-law and passage record used by route services. | KNOWLEDGE_CONTRACT / edition, jurisdiction and discovered routes | Core Required / Marchroad Leagues |
| leyforge.core.item.family.culture.marchroad.traveller_kit | Marchroad Traveller and Repair Kit Family | Road food, signs, cordage, repair and navigation supplies. | CONTAINER_INSTANCE / exact contents and owner | Core Required / Marchroad Leagues |
| leyforge.core.item.family.culture.brassroot.calibration_set | Brassroot Calibration Set Family | Precision gauges, templates and repair components supporting craft and automation expertise. | CONTAINER_DURABLE / calibration and maker mark | Core Required / Brassroot Communes |
| leyforge.core.item.family.culture.brassroot.craft_mark | Brassroot Craft-Mark Component Family | Certified maker, repair, personhood or provenance token attached to approved creations. | UNIQUE_OR_STACK / issuer and target definition | Core Required / Brassroot Communes |
| leyforge.core.item.family.culture.deepstone.hall_ration | Deepstone Hall-Ration Family | Dense preserved provision for underground work, travel and settlement resilience. | SPOILAGE_STACK / recipe and hall provenance | Core Required / Deepstone Compacts |
| leyforge.core.item.family.culture.deepstone.survey_token | Deepstone Survey and Claim Token Family | Mine, water, heat and tunnel survey evidence used by compacts and trade partners. | KNOWLEDGE_CONTRACT / site and jurisdiction | Core Required / Deepstone Compacts |
| leyforge.core.item.family.culture.mirelight.medicine_satchel | Mirelight Medicine Satchel Family | Wetland medicine, antidote and cleansing supplies reflecting local expertise. | CONTAINER_INSTANCE / contents, expiry and healer mark | Core Required / Mirelight Covenants |
| leyforge.core.item.family.culture.mirelight.reedwork_bundle | Mirelight Reedwork Goods Family | Mats, baskets, filters, light structures and trade craft. | BULK_STACK / treatment and maker provenance | Core Required / Mirelight Covenants |
| leyforge.core.item.family.culture.verdant.pact_gift | Verdant Pact Gift and Oath Offering Family | Negotiated gift, access and diplomacy item using approved realm materials and meanings. | PROVENANCE_INSTANCE / giver, recipient and oath context | Core Conditional / Verdant Pact Enclaves |
| leyforge.core.item.family.culture.verdant.living_weave | Verdant Living-Weave Goods Family | Thornsilver and living-fibre craft used in clothing, bindings and realm-compatible construction. | QUALITY_STACK / living state, maker and realm provenance | Core Conditional / Verdant Pact Enclaves |

## Knowledge, Maps, Blueprints and Records

| Family ID | Family Name | World / Player Role | State Profile | Status / Owner |
| --- | --- | --- | --- | --- |
| leyforge.core.item.family.knowledge.field_journal | Field Journal Family | Player or NPC observations, ecology notes, discoveries and event records. | KNOWLEDGE_INSTANCE / author, language and pages | Core Required / Codex / Narrative |
| leyforge.core.item.family.knowledge.codex_page | Codex Page and Record Fragment Family | Physical discovery that unlocks or supplements authoritative Codex knowledge. | KNOWLEDGE_STACK_OR_INSTANCE / topic and provenance | Core Required / UI / Exploration |
| leyforge.core.item.family.knowledge.recipe_note | Recipe Note and Technique Sheet Family | Unlocks or hints at a specific recipe, substitution or process. | KNOWLEDGE_INSTANCE / recipe reference, author and use state | Core Required / Craft / Progression |
| leyforge.core.item.family.knowledge.research_folio | Research Folio Family | Multi-step technical, magical, ecological or historical research record. | KNOWLEDGE_CONTAINER / topics, progress and owner | Core Required / Research / Progression |
| leyforge.core.item.family.knowledge.map.local | Local Map Family | Records discovered terrain, sites, routes and warnings without revealing undiscovered content. | MAP_INSTANCE / region, revision and annotations | Core Required / Map / Routes |
| leyforge.core.item.family.knowledge.map.survey | Survey Map and Technical Plan Family | Resource, structure, route, leyline or engineering survey. | MAP_INSTANCE / source quality and permissions | Core Required / Engineering / Worldgen |
| leyforge.core.item.family.knowledge.ruin_rubbing | Rubbing, Inscription Copy and Site Sketch Family | Preserves inscriptions, mechanisms and historical clues from sites. | KNOWLEDGE_INSTANCE / site reference and translation state | Core Required / Adventure / History |
| leyforge.core.item.family.knowledge.language_primer | Language Primer and Translation Aid Family | Supports culture, law, diplomacy and discovery without collapsing language into ancestry. | KNOWLEDGE_INSTANCE / language and proficiency support | Core Required / Cultures / UI |
| leyforge.core.item.family.knowledge.faction_charter | Faction Charter and Membership Record Family | Defines stated rules, services, obligations and credentials. | CONTRACT_KNOWLEDGE / faction and revision | Core Required / Factions / Law |
| leyforge.core.item.family.knowledge.law_code | Law Code and Custom Record Family | Explains jurisdictional rules, penalties, personhood and trade restrictions. | KNOWLEDGE_INSTANCE / jurisdiction and validity | Core Required / Factions / Player Trust |
| leyforge.core.item.family.knowledge.history_record | Historical Record and Chronicle Family | Links ruins, settlements, events and persistent world history. | KNOWLEDGE_INSTANCE / historical IDs and reliability | Core Required / History / Narrative |
| leyforge.core.item.family.knowledge.threat_clue | Threat and Boss Clue Family | Tracks territory, behaviour, counters and alternative-resolution information. | KNOWLEDGE_INSTANCE / threat reference and confidence | Core Required / Bosses / Adventure |
| leyforge.core.item.family.knowledge.realm_route | Realm Route Record Family | Documents route requirements, arrival, return and rescue knowledge. | KNOWLEDGE_INSTANCE / route reference and discovery state | Core Required / Realm Access |
| leyforge.core.item.family.knowledge.blueprint | Structure Blueprint Family | Authoritative build plan reference for player, NPC and Forge-compatible construction. | BLUEPRINT_INSTANCE / version, owner, dependencies and signature | Core Required / Building / Forge |
| leyforge.core.item.family.knowledge.event_notice | Event Notice, Warning and Public Record Family | Physical board, letter or carried notice for simulation-driven events and aftermath. | KNOWLEDGE_CONTRACT / event reference and expiry | Core Required / Events / Settlements |

## Adventure Loot, Relics and Boss Proofs

| Family ID | Family Name | World / Player Role | State Profile | Status / Owner |
| --- | --- | --- | --- | --- |
| leyforge.core.item.family.loot.cache.salvage | Salvage Cache Family | Contextual bundle of recoverable materials from ruins, disasters or abandoned industry. | CONTAINER_INSTANCE / source, claim and contents | Core Required / Adventure / Salvage |
| leyforge.core.item.family.loot.cache.currency | Currency and Trade Reserve Cache Family | Contextual monetary or trade-value cache with owner and legal-status rules. | CONTAINER_INSTANCE / issuer, claim and contents | Core Required / Adventure / Economy |
| leyforge.core.item.family.loot.cache.supplies | Lost and Abandoned Supply Cache Family | Food, tools, medicine or route supplies generated from believable history. | CONTAINER_INSTANCE / source event and contents | Core Required / Adventure / Survival |
| leyforge.core.item.family.loot.ancient.mechanism_fragment | Ancient Mechanism Fragment Family | Research, restoration and automation salvage from old sites. | PROVENANCE_STACK / site and mechanism class | Core Required / Ruins / Automation |
| leyforge.core.item.family.loot.relic.weapon | Relic Weapon Family | Persistent authored or generated weapon with provenance and restoration requirements. | UNIQUE_DURABLE / identity, history and condition | Core Required / Dungeons / Combat |
| leyforge.core.item.family.loot.relic.armour | Relic Armour Family | Persistent authored or generated armour with provenance and restoration requirements. | UNIQUE_DURABLE / identity, history and condition | Core Required / Dungeons / Defence |
| leyforge.core.item.family.loot.relic.ceremonial | Ceremonial and Civic Relic Family | Culture, faction, settlement, law or museum object with claims and story value. | UNIQUE_INSTANCE / provenance and ownership | Core Required / Culture / History |
| leyforge.core.item.family.loot.shrine.offering | Shrine Offering and Sacred Goods Family | Contextual sacred goods whose removal, donation or restoration has social consequences. | PROVENANCE_INSTANCE / site, owner and permission | Core Required / Sacred Sites / Morality |
| leyforge.core.item.family.loot.tomb.grave_goods | Grave Goods Family | Burial-associated items with legal, cultural, spiritual and quest consequences. | PROVENANCE_INSTANCE / tomb and claim state | Core Required / Tombs / Culture |
| leyforge.core.item.family.loot.key.site | Site Key, Seal and Mechanism Part Family | Opens, repairs or changes a specific site path without becoming a universal key. | UNIQUE_INSTANCE / target reference and state | Core Required / Adventure / Progression |
| leyforge.core.item.family.loot.restoration.component | Restoration Component Family | Recovered component used to repair structures, routes, machines or realm infrastructure. | PROVENANCE_STACK / target compatibility and condition | Core Required / Restoration / Projects |
| leyforge.core.item.family.loot.display.museum_trophy | Museum and Memorial Display Family | Preserves discovery, creature, boss or historical evidence for settlements and player bases. | UNIQUE_OR_PROVENANCE / display and donation state | Core Required / Culture / Morale |
| leyforge.core.item.family.boss.root_crowned_behemoth.trophy | Root-Crowned Behemoth Trophy Family | Boss-linked reward/proof family supporting research, restoration, equipment or alternate outcomes. | UNIQUE_PROVENANCE / boss instance and outcome | Core Required / Root-Crowned Behemoth |
| leyforge.core.item.family.boss.mire_sovereign.trophy | Mire Sovereign Trophy Family | Boss-linked wetland reward/proof family with ecology, medicine, law or restoration uses. | UNIQUE_PROVENANCE / boss instance and outcome | Core Required / Mire Sovereign |
| leyforge.core.item.family.boss.stormglass_wyvern.trophy | Stormglass Wyvern Trophy Family | Boss-linked highland reward/proof family for equipment, research or route safety. | UNIQUE_PROVENANCE / boss instance and outcome | Core Required / Stormglass Wyvern |
| leyforge.core.item.family.boss.worldburrower.trophy | Worldburrower Trophy Family | Boss-linked deepstone reward/proof family for tunnelling, defence, research or restoration. | UNIQUE_PROVENANCE / boss instance and outcome | Core Required / Worldburrower |
| leyforge.core.item.family.boss.bannerless_host.trophy | Bannerless Host Trophy Family | Boss-linked historical and faction evidence whose resolution may involve restoration rather than simple loot. | UNIQUE_PROVENANCE / host instance and outcome | Core Required / Bannerless Host |
| leyforge.core.item.family.boss.leyline_weaver.trophy | Leyline Weaver Trophy Family | Boss-linked magical network reward/proof family for study, repair and realm access. | UNIQUE_PROVENANCE / boss instance and outcome | Core Required / Leyline Weaver |
| leyforge.core.item.family.boss.ironwood_titan.trophy | Ironwood Titan Trophy Family | Boss-linked construct/living-machine reward/proof family with personhood, salvage and repair considerations. | UNIQUE_PROVENANCE / boss instance and outcome | Core Required / Ironwood Titan |
| leyforge.core.item.family.boss.pale_glacier_worm.trophy | Pale Glacier Worm Trophy Family | Boss-linked cold-region reward/proof family; active admission remains tied to selected world coverage. | UNIQUE_PROVENANCE / boss instance and outcome | Core Conditional / Pale Glacier Worm |
| leyforge.core.item.family.boss.verdant.seasonal_regent_token | Seasonal Regent Resolution Token Family | Realm-authority outcome record and reward interface for diplomacy, succession or confrontation. | UNIQUE_PROVENANCE / authority and season outcome | Core Conditional / Verdant Covenant |
| leyforge.core.item.family.boss.verdant.rot_crowned_hart_token | Rot-Crowned Hart Resolution Token Family | Realm-authority outcome record and reward interface for blight, cleansing or confrontation. | UNIQUE_PROVENANCE / authority and outcome | Core Conditional / Verdant Covenant |
| leyforge.core.item.family.boss.verdant.oathbreaker_thorn_token | Oathbreaker Thorn Resolution Token Family | Realm-authority outcome record and reward interface for oath, law and alternative resolution. | UNIQUE_PROVENANCE / authority and outcome | Core Conditional / Verdant Covenant |

## Verdant Covenant Complete Item Package

| Family ID | Family Name | World / Player Role | State Profile | Status / Owner |
| --- | --- | --- | --- | --- |
| leyforge.core.item.family.realm.verdant.living_heartwood | Living Heartwood Family | Primary Verdant structural and living-craft material retaining growth and realm provenance. | LIVING_PROVENANCE_STACK / health, consent and treatment | Core Conditional / Verdant Covenant |
| leyforge.core.item.family.realm.verdant.season_sap | Season Sap Family | Season-dependent catalyst, fuel, medicine and realm-infrastructure input. | CHARGED_CONTAINER / season, purity and stability | Core Conditional / Verdant Covenant |
| leyforge.core.item.family.realm.verdant.thornsilver_fibre | Thornsilver Fibre Family | Flexible strong realm fibre for bindings, textiles, conduits and equipment. | LIVING_QUALITY_STACK / tensile grade and growth state | Core Conditional / Verdant Covenant |
| leyforge.core.item.family.realm.verdant.pollen_amber | Pollen Amber Family | Optical, inscription, preservation and perception material. | PROVENANCE_STACK / clarity, season and charge | Core Conditional / Verdant Covenant |
| leyforge.core.item.family.realm.verdant.memory_seed | Memory Seed Family | Growth, remembrance, living blueprint and negotiated world-state material. | UNIQUE_OR_BIOLOGICAL / memory record and viability | Core Conditional / Verdant Covenant |
| leyforge.core.item.family.realm.verdant.bloomstone | Bloomstone Family | Realm stabilisation, route, ward and living-machine mineral. | CHARGED_STACK / purity, resonance and stability | Core Conditional / Verdant Covenant |
| leyforge.core.item.family.realm.verdant.heartwood_billet | Living Heartwood Billet and Joinery Family | Processed structural component for approved living construction and tools. | LIVING_QUALITY_STACK / maker and growth state | Core Conditional / Verdant Covenant / Building |
| leyforge.core.item.family.realm.verdant.season_sap_vial | Refined Season-Sap Vial Family | Measured catalyst and charge item for recipes, medicine and machines. | CHARGED_CONTAINER / dose and season | Core Conditional / Verdant Covenant / Magic |
| leyforge.core.item.family.realm.verdant.thornsilver_cord | Thornsilver Cord and Flexible Binding Family | Processed flexible cord/binding component for equipment, routes and living construction; installed Thornsilver Lattice remains Block-owned. | LIVING_QUALITY_STACK / tension, growth state and provenance | Core Conditional / Verdant Covenant / Craft |
| leyforge.core.item.family.realm.verdant.pollen_amber_lens | Portable Pollen-Amber Lens Component Family | Portable calibrated lens component used by maps, runes, perception tools and realm-compatible devices; installed lens assemblies remain Block-owned. | DURABLE_CHARGED / clarity, calibration, provenance and installation compatibility | Core Conditional / Verdant Covenant / Magic |
| leyforge.core.item.family.realm.verdant.memory_seed_capsule | Memory-Seed Capsule Family | Protected transport and planting form for authorised memory growth. | UNIQUE_CONTAINER / memory, owner and consent | Core Conditional / Verdant Covenant / Narrative |
| leyforge.core.item.family.realm.verdant.bloomstone_core | Bloomstone Stabiliser Core Family | Processed stabilisation component for routes, wards and imported infrastructure. | CHARGED_DURABLE / capacity and realm compatibility | Core Conditional / Verdant Covenant / Realm Access |
| leyforge.core.item.family.realm.verdant.anti_blight_salve | Verdant Anti-Blight Treatment Family | Realm-specific healing and restoration input for living systems. | CONTAINER_STACK / strain target and potency | Core Conditional / Verdant Covenant / Health |
| leyforge.core.item.family.realm.verdant.oath_offering | Verdant Oath and Diplomacy Offering Family | Contextual gift, promise or access object whose meaning depends on valid participants and law. | UNIQUE_PROVENANCE / parties and oath context | Core Conditional / Verdant Covenant / Culture |

## Ancestral Veil Threshold Teaser

| Family ID | Family Name | World / Player Role | State Profile | Status / Owner |
| --- | --- | --- | --- | --- |
| leyforge.core.item.family.realm.ancestral.threshold_token | Ancestral Veil Threshold Token Family | Teaser-only route, permission or narrative token that cannot imply a complete playable realm. | UNIQUE_INSTANCE / threshold route and owner | Teaser Only / Ancestral Veil Threshold |
| leyforge.core.item.family.realm.ancestral.memory_echo | Ancestral Memory Echo Record Family | Teaser-only recoverable knowledge or history trace with no full realm economy. | KNOWLEDGE_PROVENANCE / echo source and stability | Teaser Only / Ancestral Veil Threshold |
| leyforge.core.item.family.realm.ancestral.return_charm | Emergency Veil Return Charm Family | Protected teaser-route rescue item tied to authoritative return anchors. | CHARGED_UNIQUE / route, owner and spent state | Teaser Only / Ancestral Veil Threshold |

# Appendix B. Block Inventory Projection Migration Register

| Legacy 25I Family ID | Production Projection Profile | Lifecycle | Migration Rule |
| --- | --- | --- | --- |
| leyforge.core.item.family.block_form.adventure | block_projection.profile.adventure | Legacy alias only | Non-spawnable; generated from canonical Block definitions. |
| leyforge.core.item.family.block_form.automation | block_projection.profile.automation | Legacy alias only | Non-spawnable; generated from canonical Block definitions. |
| leyforge.core.item.family.block_form.construction | block_projection.profile.construction | Legacy alias only | Non-spawnable; generated from canonical Block definitions. |
| leyforge.core.item.family.block_form.functional_station | block_projection.profile.functional_station | Legacy alias only | Non-spawnable; generated from canonical Block definitions. |
| leyforge.core.item.family.block_form.infrastructure | block_projection.profile.infrastructure | Legacy alias only | Non-spawnable; generated from canonical Block definitions. |
| leyforge.core.item.family.block_form.magic | block_projection.profile.magic | Legacy alias only | Non-spawnable; generated from canonical Block definitions. |
| leyforge.core.item.family.block_form.plantable | block_projection.profile.plantable | Legacy alias only | Non-spawnable; generated from canonical Block definitions. |
| leyforge.core.item.family.block_form.realm_living | block_projection.profile.realm_living | Legacy alias only | Non-spawnable; generated from canonical Block definitions. |
| leyforge.core.item.family.block_form.storage | block_projection.profile.storage | Legacy alias only | Non-spawnable; generated from canonical Block definitions. |
| leyforge.core.item.family.block_form.terrain_natural | block_projection.profile.terrain_natural | Legacy alias only | Non-spawnable; generated from canonical Block definitions. |

Projection profile IDs above are descriptive registry-profile names; exact executable profile namespace is finalised with Document 18/Set 25 schema compilation. They do not become content Items.

# Appendix C. Stack and Instance-State Profiles

| Profile | Required State Principle | Merge Rule |
| --- | --- | --- |
| SIMPLE_STACK | Quantity only plus definition identity. | Same definition and no conflicting state. |
| PROVENANCE_STACK | Source/maker/lot fields as declared. | Required provenance fields compatible. |
| QUALITY_STACK | Quality/grade fields. | Declared quality fields compatible. |
| FRESHNESS_STACK | Freshness/spoilage/production time band. | No freshness erasure. |
| CONTAMINATION_STACK | Contamination/cleanliness state. | Only compatible contamination state. |
| CHARGED_STACK | Charge/capacity/purity state. | Conserve charge; no free recharge by merge. |
| HAZARD_STACK | Hazard/containment/legal state. | Only safely compatible hazard state. |
| BULK_STACK | Lot/bulk packaging/provenance. | Preserve lot and quantity. |
| DURABLE_INSTANCE | Singular condition/durability/calibration. | Never stack unless family explicitly supports identical-instance batching. |
| CHARGED_DURABLE | Singular durability + charge. | Instance identity retained. |
| CONTAINER_INSTANCE | Contents + seal/cleanliness/ownership. | Normally non-stackable while contents/state exist. |
| KNOWLEDGE_INSTANCE | Authorship/discovery/content refs. | Copying is an explicit transaction, not stack merge. |
| CONTRACT_INSTANCE | Parties/terms/status/authority refs. | Never merge unrelated contracts. |
| UNIQUE_INSTANCE | Unique world identity/provenance/recovery. | Never ordinary stack. |
| RECOVERY | Original ID/payload/error provenance. | Quarantined; no normal merge/use. |

# Appendix D. Block/Item Collision Resolution Register

| Audit ID | Legacy / Candidate Item | Block or Other Counterpart | Decision | Migration / Relationship |
| --- | --- | --- | --- | --- |
| BI-001 | 25I `block_form.*` ten profiles | All canonical placeable Blocks | REMOVE AS ITEM | Convert legacy records to Block Inventory Projection. |
| BI-002 | `settlement.supply.project_crate` | `leyforge.core.block.family.functional.project.supply_crate` | RECLASSIFY | Alias to `settlement.supply.project_package`; physical crate Block-owned. |
| BI-003 | `trade.goods.crate` | Placeable cargo/crate storage Blocks | RECLASSIFY | Alias to `trade.goods.cargo_lot`; cargo lot references goods/container. |
| BI-004 | Pollen-Amber Lens Item | Pollen-Amber Lens Block | KEEP DISTINCT | Portable component -> installed assembly. |
| BI-005 | Bloomstone Stabiliser Core Item | Bloomstone Stabiliser Block | KEEP DISTINCT | Portable core -> installed stabiliser. |
| BI-006 | Medicinal Herb Item | Medicinal Herb Block | KEEP DISTINCT | Harvested herb -> living plant source. |
| BI-007 | Raw Copper/Iron Ore Items | Ore Blocks | KEEP DISTINCT | Extracted resource -> geological source. |
| BI-008 | Mana Conduit Core Item | Mana Conduit Block | KEEP DISTINCT | Portable core -> installed conduit. |
| BI-009 | Rune Blank Item | Rune Substrate Block | KEEP DISTINCT WITH GUARD | Portable blank only; same-as-self placed form forbidden. |
| BI-010 | Iron Structural Frame Stock | Machine-frame Blocks | KEEP DISTINCT WITH GUARD | Fabricated stock/components -> placed assembly. |
| BI-011 | Machine Frame Component | Machine-frame Blocks | KEEP DISTINCT WITH GUARD | Portable chassis/component -> placed/commissioned frame. |
| BI-012 | Mistwood Timber Stock | Mistwood Tree Block | KEEP DISTINCT | Processed timber -> living source. |
| BI-013 | Thornsilver Cord/Binding | Thornsilver Lattice Block | KEEP DISTINCT | Flexible component -> lattice assembly. |
| BI-014 | Stone/mineral chunks | Terrain stone Blocks | CONDITIONAL | Only when mining transforms Block into chunks; SELF_BLOCK recovery must not also emit chunks as same identity. |
| BI-015 | Missing-Definition Recovery Item | Missing-Definition Recovery Block | KEEP DOMAIN-SEPARATE | Recovery type matches missing source domain; not same physical content. |

# Appendix E. Universal Item Definition Template

```yaml
item_id: leyforge.core.item.<domain>.<identity>
family_id: leyforge.core.item.family.<domain>.<identity>
schema_version: 1
source_pack: leyforge.core.<pack>
lifecycle_status: active
display_key: loc.item.<...>.name
description_key: loc.item.<...>.description
tags: []
capability_ids: []
resource_family_ref: null
material_profile_ref: null
stack_profile_id: SIMPLE_STACK
stack_significant_fields: []
instance_schema_id: null
acquisition_relationships: []
use_action_profiles: []
equipment_facets: []
biological_facets: []
movement_facets: []
maritime_facets: []
block_relationships: []
recipe_refs: []
ownership_profile_id: null
provenance_profile_id: null
presentation_manifest_ref: null
aliases: []
deprecated_by: null
missing_pack_policy: quarantine
validation_profile_ids: []
```

# Appendix F. Cross-System Facet Templates

## F.1 Biological Equipment Trait Bundle
```text
cold_protection_band?
heat_protection_band?
waterproofing_band?
wind_protection_band?
moisture_retention_band?
drying_support_band?
coverage_regions[]
contamination_barrier_tags[]
treatment_support_capabilities[]
respiratory_environment_support[]?
```
Set 29 interprets these traits.

## F.2 Movement Equipment Facet
```text
movement_capability_ids[]
movement_restriction_tags[]
traction_or_surface_assist?
glide_profile_ref?
traversal_equipment_facet_ref?
mount_or_vehicle_control_facet_ref?
```
Set 30 interprets these traits; Set 26 supplies aquatic specialist behaviour where applicable.

## F.3 Economy-Facing Item Facts
```text
tradeability_class
unit_or_quantity_class
reference_value_metadata?
quality_state_ref?
condition_state_ref?
provenance_ref?
legality_or_restriction_refs[]
currency_issuer?
denomination?
authenticity_state?
```
Set 27 calculates contextual value, quotes and prices.

# Appendix G. Legacy Migration and Tombstone Rules

- Every legacy `item.block.*` or equivalent record must map to a canonical Block ID or an explicitly distinct Item before migration ships.
- When an old Block Item has mutable portable state, migration writes that state into the approved Block projection payload schema.
- If no safe target exists, preserve the old record through Missing-Definition Recovery rather than deleting it.
- Renamed Item IDs preserve aliases indefinitely once referenced by released saves/content, unless a later migration compacts them under approved policy.
- Tombstones are non-spawnable and carry `deprecated_by`, reason, version and recovery guidance.
- POC-only IDs remain archive/migration inputs and never become normal production fallbacks.
- Optional-pack Item state must survive pack absence through quarantine/opaque payload preservation when safe.

# Appendix H. Document 04 v1.0 Replacement Checklist

- [x] Replace POC-era scope with production Item authority.
- [x] Adopt Set 25 family-first Item planning.
- [x] Remove ten Block-Item Form families from canonical Item count.
- [x] Lock same-Block recovery to Block Inventory Projection.
- [x] Add explicit component/harvest/install relationship types.
- [x] Reclassify Project Supply Crate collision.
- [x] Reclassify General Cargo Crate collision.
- [x] Clarify high-risk semantic Block/Item overlaps.
- [x] Preserve 286 reconciled Item-family contracts and status envelope.
- [x] Separate scarcity, capability, quality, condition, provenance, significance and value.
- [x] Remove runtime price ownership from Items; consume Set 27.
- [x] Integrate Set 28 gift/credential/companion boundaries.
- [x] Integrate Set 29 biological equipment/consumable facets.
- [x] Integrate Set 30 traversal/movement equipment facets.
- [x] Integrate Set 26 maritime Item/component requirements.
- [x] Preserve personhood boundary.
- [x] Add save/migration/optional-pack recovery rules.
- [x] Add release-blocking duplicate audit and validation codes.
- [x] Archive fixed POC item chains without deleting reusable mechanics.
- [ ] Instantiate final concrete Item definitions in machine-readable registry data during implementation.
- [ ] Validate representative Godot Resource import/runtime transaction tests under Document 18 implementation.

---

# Closing Production Rule

Document 04 v1.0 establishes one simple trust promise: **if the player owns one physical thing, Leyforge should have one authoritative identity for that thing.** Whether it is carried, equipped, traded, packed, installed, consumed or projected from a Block must never create a second editable truth. The registry may be deep; the identity model must remain boringly reliable.
