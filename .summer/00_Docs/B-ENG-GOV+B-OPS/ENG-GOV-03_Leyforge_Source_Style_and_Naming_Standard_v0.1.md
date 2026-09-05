# ENG-GOV-03 — Leyforge Source Style & Naming Standard

**Document ID:** ENG-GOV-03  
**Title:** Leyforge Source Style & Naming Standard  
**Version:** v0.1  
**Status:** THEORETICALLY LOCKED  
**Authority Domain:** Engineering Governance — Source Style & Naming  
**Parent Authority:** ENG-GOV-00 — Leyforge Engineering Constitution  
**Related Standards:** ENG-GOV-01, ENG-GOV-02  
**Project:** Leyforge

---

## 00. Purpose and Scope

ENG-GOV-03 defines source-level style and naming conventions for Leyforge-owned code and tooling.

It governs file names, type names, functions, variables, constants, signals/events, parameters, comments, formatting, units, coordinate-space terminology, time-domain terminology and source-level vocabulary.

It does not define canonical registry-ID syntax or persistent content identity. Those belong to ENG-GOV-09.

The governing principle is that source style exists to improve readability, semantic precision, reviewability and consistency rather than to encode personal preference.

---

## 01. Style Authority

### EG03-001 — Source Style Is Distinct from Persistent Identity

Source symbols may be renamed through ordinary refactoring when appropriate.

Persistent registry identities, save identities and other long-lived identifiers may require compatibility or migration work and are governed separately.

### EG03-002 — Official Language and Engine Style Is the Baseline

Leyforge follows the normal conventions of each language and ecosystem unless a documented project-specific engineering reason requires otherwise.

GDScript follows Godot conventions. Python follows normal Python conventions. PowerShell follows normal PowerShell conventions. C++/GDExtension follows the relevant Godot/upstream conventions where applicable.

### EG03-003 — Preserve Coherent Local Convention When Modifying Existing Code

Existing coherent code, especially upstream, third-party, forked and compatibility code, should retain its local convention unless a deliberate migration is underway.

Unrelated reformatting must not be introduced merely because a file was touched.

### EG03-004 — Mechanical Formatting Should Be Automated

Formatting and linting that can be safely automated should migrate toward tooling and CI rather than remaining a recurring human or AI review debate.

---

## 02. GDScript Baseline

### EG03-005 — Leyforge-Owned GDScript Uses Godot-Compatible Indentation

Leyforge-owned GDScript uses the indentation convention expected by the Godot ecosystem.

Arbitrary mixed indentation styles are prohibited.

Third-party code retains upstream style.

### EG03-006 — GDScript Identifier Families Follow Godot Conventions

Leyforge-owned GDScript uses the following baseline:

- classes/types: `PascalCase`
- functions: `snake_case`
- variables: `snake_case`
- parameters: `snake_case`
- constants: `CONSTANT_CASE`
- signals: `snake_case`

### EG03-007 — Source Files Use Lowercase Snake Case by Default

Examples:

```text
settlement_simulation.gd
inventory_transaction.gd
worldgen_region.gd
save_migration_v17.gd
```

Names such as `WorldGenThingFinal2.gd` or `inventoryTransactionNEW.gd` are not acceptable production naming.

### EG03-008 — Scene and Resource Files Use Predictable Lowercase Snake Case

Godot scenes and resources use lowercase snake_case unless another authoritative asset pipeline defines a stronger convention for that domain.

Examples:

```text
settlement_actor.tscn
stone_furnace.tscn
worldgen_profile.tres
```

### EG03-009 — Scene-Tree Node Names Describe Semantic Role

Node names should communicate stable role rather than editor-generated or temporary identity.

Prefer names such as `PlayerCamera`, `InventoryPanel`, `InteractionRay` and `CharacterBody` over `Node3D2`, `Thing`, `Temp` or `Control7`.

Node names referenced by code are treated as local interfaces and should not churn casually.

---

## 03. Semantic Naming

### EG03-010 — Class Names Describe Responsibility

Class names should communicate durable responsibility.

Avoid status or enthusiasm words such as `New`, `Ultimate`, `Better`, `Advanced` or `Final` when they do not represent real domain semantics.

Prefer names such as:

```text
SettlementSimulation
InventoryAuthority
RegionGenerator
RoutePlanner
```

### EG03-011 — Vague Suffixes Require Genuine Meaning

Terms such as `Manager`, `Helper`, `Util`, `Processor`, `Controller` and similar suffixes are not prohibited, but should only be used when they genuinely describe the role.

More precise domain names are preferred where available.

### EG03-012 — Function Names Communicate Action and Result

Prefer:

```text
reserve_items()
validate_blueprint()
calculate_population()
load_world_metadata()
commit_transaction()
```

Generic verbs such as `handle()`, `process()`, `run()` or `update_data()` are acceptable only when surrounding context makes the operation unambiguous.

### EG03-013 — Query and Mutation Names Must Not Be Ambiguous

Function names should reveal whether important state is merely queried or actually mutated.

For example:

```text
get_available_stock()
calculate_required_stock()
reserve_stock()
commit_stock_transfer()
```

A function named as a query must not unexpectedly perform consequential mutation.

### EG03-014 — Boolean Names Read as Truth Statements

Boolean variables and queries should normally use forms such as:

```text
is_loaded
has_permission
can_build
should_retry
was_migrated
```

Ambiguous flag names and unnecessary double negatives should be avoided.

### EG03-015 — Collections Are Normally Plural

Collections use plural names such as:

```text
residents
transactions
active_jobs
loaded_chunks
```

Single-object values normally use singular names.

### EG03-016 — Stable-Reference Variables Expose Identity Semantics

Values representing persistent or stable references should use explicit naming such as:

```text
settlement_id
resident_id
world_id
registry_id
transaction_id
```

### EG03-017 — Display Identity and Persistent Identity Must Be Distinguishable

Source must not conflate presentation names with stable identity.

Example:

```gdscript
var item_id: StringName
var display_name: String
```

A generic `name` field should not be used interchangeably for both roles.

---

## 04. Units, Spaces and Time Domains

### EG03-018 — Ambiguous Numeric Quantities Include Units Where Practical

Where unit confusion is possible, names or types should communicate units.

Examples:

```text
distance_m
timeout_seconds
duration_ms
speed_mps
temperature_c
memory_bytes
```

### EG03-019 — Coordinate-Space Semantics Must Be Explicit

Where multiple coordinate spaces coexist, names should distinguish them.

Examples:

```text
world_position
local_position
chunk_position
voxel_position
region_coordinate
screen_position
```

### EG03-020 — Time Variables Identify Their Time Domain

Names should distinguish relevant time semantics, including:

```text
simulation_time
elapsed_real_seconds
animation_time
network_tick
world_day
```

### EG03-021 — Authoritative Random Sources Are Named by Purpose

Where multiple random streams exist, consequential RNG sources should be named by purpose.

Examples:

```text
worldgen_rng
loot_rng
settlement_event_rng
```

---

## 05. Terminology

### EG03-022 — Abbreviations Are Limited to Established Terms

Established terms such as `id`, `ui`, `npc`, `api`, `cpu`, `gpu`, `lod` and `rng` are acceptable.

Dense project-specific abbreviations that reduce comprehension should be avoided.

### EG03-023 — Acronyms Follow the Identifier Convention

Acronyms should normally participate in the surrounding case convention rather than creating unpredictable all-cap segments.

Examples:

```text
NpcSpawner
ApiClient
UiController
```

External APIs or official engine conventions may require exceptions.

### EG03-024 — Source Uses Canonical Leyforge Terminology Where Canon Defines the Concept

Where canon defines a stable term such as `Settlement`, `Realm`, `Ward` or `Capability`, engineering source should not independently invent a conflicting synonym for the same concept.

### EG03-025 — Engineering Terms May Differ Where They Represent Different Technical Concepts

Technical concepts may use more precise internal terminology where they are genuinely distinct from player-facing concepts.

Examples may include:

```text
ActorProjection
PersistentResidentRecord
SimulationTier
```

### EG03-026 — Durable Interfaces Avoid Unnecessary Implementation-Specific Names

Public interfaces should not expose implementation detail that callers do not need to know.

For example, `SettlementStore` is preferable to `JsonSettlementStore` when consumers should remain independent of the storage representation.

Implementation-specific types may still name the representation when that representation is their actual purpose.

---

## 06. Visibility, Size and Flow

### EG03-027 — Internal Intent Should Be Visible Where the Language Permits

Internal implementation should be distinguishable from public surface where practical.

GDScript conventions for internal/private intent may be used, but pseudo-private naming should not become an unnecessarily elaborate access-control simulation.

### EG03-028 — No Arbitrary Function-Length Limit Exists

Leyforge does not impose a fixed maximum number of lines per function.

A function should represent one understandable operation at an appropriate abstraction level.

Readability and cohesion determine whether a function should be split.

### EG03-029 — No Arbitrary Source-File Line Limit Exists

Large files are a signal to inspect cohesion, not an automatic violation.

A file becomes problematic when unrelated responsibilities make it difficult to understand or safely change.

### EG03-030 — Guard Clauses Are Preferred When They Reduce Nesting

Early exits are encouraged when they make preconditions and failure paths easier to read.

Readability remains the deciding factor.

### EG03-031 — Readable Control Flow Outranks Compressed Cleverness

Simple, explicit control flow is preferred over dense expressions that obscure validation, state changes or failure behaviour.

---

## 07. Typing and Data Shape

### EG03-032 — Leyforge-Owned GDScript Uses Strong Static Typing Where It Materially Helps

Static typing is the default for meaningful APIs and state, including:

- public interfaces;
- authoritative state;
- persistent models;
- important data structures;
- function parameters;
- function returns;
- significant collections.

Type inference remains acceptable for obvious local expressions where explicit annotation would add little value.

### EG03-033 — Dynamic Values Require a Reason in Authoritative Logic

`Variant`, untyped dictionaries and similar dynamic structures are permitted where appropriate.

Authoritative systems should not use unbounded dynamic structures merely for convenience when meaningful schema or typing would improve safety.

### EG03-034 — Null or Optional State Must Have Clear Meaning

Where `null` or an optional value is used, its meaning should be unambiguous.

One ambiguous null state should not silently represent multiple unrelated conditions such as not loaded, unassigned, missing, invalid and not yet generated.

### EG03-035 — Consequential Repeated String Literals Must Not Become Informal IDs

Repeated string literals that represent authoritative state or identity should be replaced by the appropriate enum, constant, typed state or registry identity.

### EG03-036 — Finite Engineering State Sets Use Explicit Typed Representations Where Appropriate

Source-level states such as `LoadState`, `TransactionResult` or `SimulationTier` may use enums or other typed representations.

Data-driven registry/content identity should not automatically become source enums where extensibility requires runtime data.

---

## 08. Comments and Source Annotations

### EG03-037 — Comments Explain Intent, Constraints and Non-Obvious Reasoning

Comments should primarily explain why a behaviour or constraint exists.

They should not narrate obvious code.

Incorrect or stale comments are defects and should be corrected or removed.

### EG03-038 — Consequential Constraints May Reference Governing Authority

Where useful, comments may point to governance, architecture, migration or compatibility authority.

Authority references should be used where they prevent future accidental violation, not mechanically attached to every helper.

### EG03-039 — Source Annotations Use a Controlled Vocabulary

Recommended source annotations include:

```text
TODO
FIXME
COMPAT
SECURITY
PERF
```

Consequential annotations should link to tracked work where appropriate.

### EG03-040 — Compatibility Code States Why It Remains

Compatibility paths should contain enough local context to prevent accidental deletion.

Example:

```text
COMPAT(SAVE-v13)
```

with the relevant support/removal condition.

---

## 09. Errors, Localization and Language Boundaries

### EG03-041 — Error Text Communicates Meaningful Context

Errors and diagnostics should identify relevant subsystem and failure meaning rather than exposing only opaque numeric codes.

Detailed structured logging is governed by ENG-GOV-07.

### EG03-042 — Player-Facing Text Uses the Appropriate Localization or Content System

Normal runtime implementation should not accumulate hardcoded player-facing English strings where localization applies.

Development-only diagnostic text is a separate concern.

### EG03-043 — Cross-Language APIs Preserve Semantic Terminology

Where GDScript, C++, Python or other languages interact, public API names should preserve shared domain terminology.

Language boundaries must not introduce needless synonyms for the same architectural concept.

---

## 10. C++ and Tooling Languages

### EG03-044 — C++/GDExtension Follows the Owning Ecosystem

If Leyforge introduces C++ or GDExtension code, Leyforge-owned code follows appropriate Godot/GDExtension conventions.

Modified upstream code retains upstream conventions.

A large custom C++ style manual is not created before actual need exists.

### EG03-045 — Repository Tooling Follows Its Own Language Conventions

Python tooling should look like good Python.

PowerShell should follow normal PowerShell style.

GDScript rules are not imposed on unrelated languages.

Shared Leyforge domain terminology remains consistent across languages.

### EG03-046 — Generated Source Should Remain Readable Where Practical

Generated code should conform to the target language's normal style where external format constraints do not prevent it.

Generated source may still need to be read by contributors, agents, debuggers and reviewers.

---

## 11. Declaration Ordering and API Stability

### EG03-047 — GDScript Declaration Ordering Follows the Official Godot Baseline

Leyforge-owned GDScript uses the official Godot style ordering as the baseline for annotations, `class_name`, `extends`, signals, enums, constants, exported variables, other state, lifecycle methods, public methods and internal helpers.

The exact mechanical order should track the Godot version adopted by the project.

### EG03-048 — Public API Names Must Not Churn Casually

Cross-module APIs, serialized properties, Forge-visible APIs, plugin contracts and future network contracts have higher naming-change consequences than private implementation.

Renames must be classified according to actual blast radius.

### EG03-049 — Source Refactoring Must Not Accidentally Rename Persistent Identity

Renaming a class, source file or implementation symbol must not automatically rename a registry ID, saved identity or other persistent identifier.

Source identity and persistent identity are separate layers.

### EG03-050 — Names Must Be Sufficiently Precise for Correct Use

Important naming should communicate enough semantic information that another contributor can determine what a symbol represents and how it should be used.

Where relevant, a name should make clear ownership, mutation/query behaviour, units, coordinate/time domain and identity-vs-presentation meaning.

---

## 12. Review and Enforcement

### EG03-051 — Style Changes Must Not Obscure Functional Changes

Large formatting changes should be separated from consequential behavioural changes where practical.

Reviewers must be able to see the actual semantic modification.

### EG03-052 — Documented Style Authority Resolves Preference Disputes

Where style preferences differ, authority resolves the issue in this order:

1. official language or engine convention;
2. documented Leyforge override;
3. existing coherent local convention.

Personal preference is not sufficient reason to churn code.

### EG03-053 — Mechanical Style Rules Should Move from Prose to Tooling

Formatters, linters and safe static checks should eventually enforce mechanical rules where practical.

ENG-GOV-03 should increasingly focus on semantic conventions that automated tools cannot reliably determine.

---

## GDScript Reference Example

```gdscript
class_name InventoryTransaction
extends RefCounted

signal transaction_committed(transaction_id: StringName)
signal transaction_failed(transaction_id: StringName, reason: String)

const MAX_RETRY_COUNT := 3

var transaction_id: StringName
var source_inventory_id: StringName
var destination_inventory_id: StringName

var _is_committed := false


func can_commit() -> bool:
    return not _is_committed


func commit() -> bool:
    if not can_commit():
        return false

    _is_committed = true
    transaction_committed.emit(transaction_id)
    return true
```

This example is illustrative rather than a template that every class must imitate exactly.

Its purpose is to demonstrate predictable naming, typing, identity semantics and readable state mutation.

---

## Authority Boundaries

ENG-GOV-03 deliberately does not govern:

- registry-ID syntax — ENG-GOV-09;
- repository layout — ENG-GOV-02;
- Git branch/commit naming — ENG-GOV-04;
- test naming and test-suite structure — ENG-GOV-05;
- structured log-event schema — ENG-GOV-07;
- save-schema naming/versioning — ENG-GOV-08;
- ADR naming — ENG-GOV-11;
- agent instruction format — ENG-GOV-12.

---

## Closing Principle

Leyforge source style exists to make intent obvious.

Official ecosystem conventions are preferred over invented project fashion.

Names should communicate semantics rather than merely satisfy syntax.

Persistent identity must remain distinct from display and source identity.

Units, coordinate spaces, time domains and ownership should become explicit when ambiguity is dangerous.

Mechanical formatting belongs increasingly to tooling.

Readability, correctness and maintainability always outrank aesthetic preference.
