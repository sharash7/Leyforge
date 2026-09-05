# ENG-GOV-01 — Leyforge Codebase Engineering Standard

**Document ID:** ENG-GOV-01  
**Title:** Leyforge Codebase Engineering Standard  
**Version:** v0.1  
**Status:** THEORETICALLY LOCKED  
**Authority Domain:** Engineering Governance — Codebase Engineering  
**Parent Authority:** ENG-GOV-00 — Leyforge Engineering Constitution  
**Project:** Leyforge

---

## 00. Purpose and Scope

ENG-GOV-01 defines the everyday engineering principles that govern how Leyforge source code and implementation logic are designed, changed, reviewed and completed.

It operationalises the constitutional laws established by ENG-GOV-00 without replacing the more specialised standards that govern repository structure, source style, Git workflow, testing, CI, diagnostics, persistence, registries, performance, ADRs, AI agents, security, exceptions and third-party integration.

This standard does not define exact file naming, exact directory layout, exact formatting rules, exact test commands, exact logging schemas, save formats, registry-ID syntax or branch naming. Those concerns are governed by their dedicated standards.

---

## 01. Code Health Principle

### EG01-001 — Code Health Is the Primary Implementation Standard

A change should not merely make the immediate feature work.

It should leave the affected codebase at least as understandable and maintainable as before.

This does not require each change to clean up the entire surrounding subsystem.

Small deliberate debt may be accepted when justified, but it must be explicit rather than becoming invisible structural decay.

---

## 02. Correctness Before Convenience

### EG01-002 — Authoritative Correctness Outranks Implementation Convenience

When implementation convenience conflicts with authoritative behaviour, correctness wins.

Implementation must not simplify a system by silently violating canonical, architectural, persistence, identity, conservation or other authoritative requirements.

Where the correct implementation appears technically infeasible, unsafe or disproportionately costly, the conflict must be escalated to the appropriate authority rather than being quietly reinterpreted.

---

## 03. Simplicity and Necessary Complexity

### EG01-003 — Implement the Simplest Architecture That Satisfies Known Requirements

Leyforge should implement the simplest architecture that satisfies current authoritative requirements and known extension boundaries.

Complexity must not be introduced solely because a hypothetical future requirement might eventually exist.

Abstraction is justified when it represents a real architectural boundary, removes meaningful duplication, isolates volatility, enables necessary substitution, materially improves testability or satisfies a known extension contract.

Speculative abstraction without a present or clearly established need should be avoided.

---

## 04. Cohesion and Responsibility

### EG01-004 — Code Units Must Have Coherent Responsibilities

Classes, scripts, services, modules and other engineering units should represent coherent responsibilities.

The standard is not literal one-function-per-class design.

The standard is that unrelated reasons for change should not routinely collide inside the same engineering unit.

Subsystem code must not accumulate unrelated responsibilities merely because those responsibilities happen to involve the same high-level feature.

---

## 05. Authoritative State Ownership

### EG01-005 — Every Authoritative State Domain Must Have an Identifiable Owner

For consequential state, the owning system must be identifiable.

Other systems may read, request, subscribe, project, cache or display that state, but they must not independently redefine the same authoritative truth.

Where multiple representations exist, the project must be able to distinguish the authoritative representation from projections, caches and presentation copies.

---

## 06. Single-Writer Preference

### EG01-006 — Authoritative Mutable State Should Normally Have One Logical Write Authority

Multiple systems may initiate requests that affect authoritative state.

Where practical, those changes should be committed through the owning authority rather than through unrestricted direct mutation from unrelated systems.

Distributed or shared-authority designs remain possible when explicitly required, but unrestricted multi-writer mutation is not the default.

---

## 07. Dependency Direction

### EG01-007 — Dependencies Must Follow Declared Architectural Direction

Implementation dependencies must respect the dependency direction defined by the relevant architecture.

Lower-level systems must not casually depend upon higher-level presentation or gameplay layers merely because doing so solves an immediate coding problem.

Where implementation pressure indicates that a dependency direction is wrong, the architecture must be reconsidered explicitly rather than being bypassed locally.

---

## 08. Circular Architecture

### EG01-008 — Circular Dependencies Are Presumed Architectural Defects

Architectural dependency cycles should trigger design review.

Runtime callbacks or two-way communication do not automatically constitute a module cycle, but systems should not become mutually dependent simply because each needs unrestricted internal access to the other.

Typical alternatives include owned interfaces, events, commands, shared lower-level contracts and explicit orchestration layers.

---

## 09. Interfaces and Encapsulation

### EG01-009 — Expose the Smallest Stable Interface Needed

Subsystem internals should not automatically become project-wide API.

Public interfaces should expose the behaviour required by collaborators while preserving freedom to change internal representation.

Callers should not reach through an owning system into its internal data structures where an owned interface can express the required operation.

---

## 10. Understandable Abstraction

### EG01-010 — Encapsulation Must Not Hide Architectural Truth

Useful abstraction hides irrelevant implementation detail.

Bad abstraction hides system meaning, state ownership, consequences or failure behaviour.

Interfaces must remain understandable enough that a competent contributor can determine what authority is being affected and what meaningful state transition occurs.

---

## 11. Explicit Data Flow

### EG01-011 — Consequential State Transitions Should Be Explicit

Important state transitions should be traceable through explicit stages such as request, validation, reservation, commit and result where appropriate.

Hidden mutable globals, uncontrolled callbacks and distant side effects should not be used where they make authoritative data movement difficult to reason about.

This principle applies especially strongly to inventory, construction, automation, economy, settlement simulation, networking and persistence.

---

## 12. Side Effects

### EG01-012 — Pure Calculation and State Mutation Should Be Separated Where Practical

Calculations should be separable from externally visible side effects where practical.

A calculation that determines an outcome should not unnecessarily also mutate inventory, save the world, spawn presentation objects, play audio and modify UI state.

Controlled separation improves determinism, testability, replayability, debugging, migration and multiplayer reasoning.

---

## 13. Preconditions and Invalid Input

### EG01-013 — Preconditions Must Be Validated at Meaningful Boundaries

Validation should occur where data enters or changes authority.

Typical boundaries include registry loading, save loading, network input, transaction requests, Forge import, world-generation configuration and public subsystem interfaces.

Internal functions may rely on previously established invariants once appropriate boundaries have validated them.

Validation should not devolve into redundant defensive checks on every line.

---

## 14. Invalid State Representation

### EG01-014 — Important Invalid States Should Be Difficult to Represent

Data models and APIs should encode important invariants where practical.

Systems should not rely solely on comments or caller discipline to prevent impossible quantities, invalid ownership relationships or other critical state violations.

Where an invalid state can be prevented structurally, structural prevention is preferred over repeated ad hoc checks.

---

## 15. Assertions and Runtime Validation

### EG01-015 — Developer Assertions and Runtime Validation Serve Different Purposes

Assertions are used to detect broken internal assumptions.

Runtime validation is used to handle data or requests that may legitimately be invalid.

Critical player data safety, compatibility and trust-boundary handling must not depend solely on assertions that may be disabled or absent outside development builds.

---

## 16. Error Handling

### EG01-016 — Errors Must Not Be Silently Swallowed

Unexpected failures must not disappear without meaningful handling.

Depending on the layer, a failure should return an actionable result, preserve safe state, emit useful diagnostics, deliberately escalate or combine these behaviours.

Ignoring an error is acceptable only where ignoring it is explicitly correct and understandable from the local implementation.

---

## 17. Safe Failure and Transactions

### EG01-017 — Partial Failure Must Not Silently Produce Partial Authoritative Corruption

Where an operation represents one logical authoritative transaction, failure must obey its declared transaction semantics.

An operation must not accidentally consume part of a resource set, advance state, leave reservations behind or otherwise corrupt authoritative truth unless partial completion is an explicitly designed outcome.

Transactional behaviour should preserve state and resource conservation across failure, interruption and reload where relevant.

---

## 18. Determinism

### EG01-018 — Deterministic Systems Must Not Depend on Undeclared Nondeterministic Inputs

Systems that promise deterministic results must control or declare any inputs that can affect those results.

Potential nondeterministic influences include unordered iteration, wall-clock time, thread scheduling, uncontrolled global randomness, unstable object identity, filesystem enumeration order, platform-dependent behaviour and unexamined floating-point assumptions.

If such an influence legitimately affects the result, it must become part of the declared deterministic contract or the system must stop claiming determinism.

---

## 19. Time

### EG01-019 — Simulation Time Must Be Distinguishable from Wall-Clock Time

Authoritative simulation must not casually depend on operating-system time, render frame rate or presentation delta where it actually requires simulation time.

Relevant concepts such as simulation time, real elapsed time, presentation animation time, network time and benchmark time should remain distinguishable where their semantics differ.

This distinction supports pausing, far simulation, servers, replays, deterministic tests and debugging.

---

## 20. Randomness

### EG01-020 — Consequential Randomness Must Have Identifiable Ownership and Seed Provenance

Random outcomes that affect authoritative deterministic state should be attributable to controlled random streams and known seed provenance.

Relevant provenance may include world seed, system stream, event or entity seed and generation version.

Presentation-only randomness may use looser guarantees where its results do not affect authoritative state.

---

## 21. Concurrency

### EG01-021 — Concurrency Requires Explicit Ownership and Synchronization

Concurrent engineering must define what data may be read, what data may be written, which authority owns mutation, how completion becomes visible, what cancellation means and what happens during shutdown.

Cross-thread mutation of authoritative state must be tightly controlled.

Where practical, worker jobs should calculate results while the authoritative owner validates and commits those results.

---

## 22. Asynchronous Lifecycle

### EG01-022 — Asynchronous Work Must Not Outlive the Authority It Assumes Exists

Asynchronous tasks must account for the possibility that their target entity, chunk, scene, world, request or generation may no longer be current by the time the work completes.

Relevant async systems should use ownership, cancellation, request or generation identity, and completion validation where needed.

Stale work must not commit into replaced or destroyed authoritative state.

---

## 23. Lifecycle and Cleanup

### EG01-023 — Acquisition and Release Responsibilities Must Be Paired

Systems that acquire subscriptions, reservations, locks, temporary files, worker jobs, handles, network resources, callbacks or similar resources must define their release and cancellation behaviour.

Cleanup must not rely solely on the assumption that the engine will eventually destroy everything safely.

---

## 24. Global and Shared State

### EG01-024 — Hidden Global Mutable State Is Prohibited by Default

Global access is not inherently prohibited.

Shared services, including appropriate engine-level singleton mechanisms, may be used where architecturally justified.

The prohibited pattern is unrestricted global mutable state that allows unrelated systems to modify one another's authority without controlled interfaces.

Global services should expose owned behaviour rather than becoming public bags of mutable data.

---

## 25. Configuration and Constants

### EG01-025 — Behavioural Configuration Must Be Explicit and Owned

Important behavioural values should have an identifiable source and authority.

Unexplained magic values should not be scattered throughout implementation when a named constant, configuration asset, registry entry, canonical data definition or owned configuration layer better communicates their meaning.

The appropriate storage mechanism depends on what the value represents.

---

## 26. Configuration and Authority

### EG01-026 — Moving a Value into Configuration Does Not Change Its Authority

Configuration storage does not determine who is authorised to change a value.

A canonical value remains canonical when represented in JSON, a resource or another data file.

An engineering performance parameter remains an engineering parameter when represented through the same mechanisms.

Meaning determines authority.

---

## 27. Testability

### EG01-027 — Important Logic Should Be Verifiable Without Running the Entire Game

Important algorithms, transactions, registries, migrations, simulation logic and world-generation functions should expose focused verification boundaries where practical.

A contributor should not need to execute a large unrelated gameplay journey merely to verify a small arithmetic or state invariant when a focused test can prove the same behaviour.

---

## 28. Refactoring

### EG01-028 — Refactoring and Behavioural Change Should Normally Be Separable

Where practical, establish regression evidence, perform structural refactoring, and then introduce behavioural change as distinguishable steps.

A change described as a behaviour-preserving refactor must not quietly alter behaviour.

If behavioural change is unavoidable, the change should be classified and reviewed honestly as behavioural work.

---

## 29. Local Improvement

### EG01-029 — Improve Nearby Code Only When the Improvement Remains Coherent with the Change

Reasonable nearby cleanup is encouraged where it materially improves clarity and remains conceptually reviewable with the current task.

Unrelated large-scale cleanup should become separate work.

A small fix must not expand into uncontrolled repository-wide redesign merely because additional improvement opportunities were discovered.

---

## 30. Experimental Code

### EG01-030 — Experimental Implementations Must Be Identifiable as Experimental

Prototypes and experiments may temporarily accept constraints that production architecture would not.

Their purpose, status, scope and exit criteria must remain identifiable.

Experimental implementation must not silently become permanent production infrastructure without appropriate review and hardening.

---

## 31. Development-Only Behaviour

### EG01-031 — Development Functionality Must Not Silently Alter Release Authority

Creative grants, teleports, test presets, forced progression, diagnostics and similar development shortcuts are permitted when intentionally isolated.

Production behaviour must not depend upon development-only authority or accidentally expose development controls as normal authoritative pathways.

---

## 32. Dead Code

### EG01-032 — Dead Code Should Normally Be Removed Rather Than Preserved as Commented Archaeology

Version control preserves historical implementation.

Obsolete code should normally be deleted rather than retained in large commented blocks for hypothetical future reuse.

Compatibility code is not dead code while existing persistent data, integrations or supported behaviour still require it.

---

## 33. TODOs and Actionable Debt

### EG01-033 — TODOs Must Communicate Actionable Debt

TODO comments should identify meaningful unresolved work rather than vague intentions.

Significant debt should reference an appropriate tracked project record instead of existing only as an isolated source comment.

TODOs must not become a shadow issue tracker.

---

## 34. Comments

### EG01-034 — Comments Primarily Explain Why

Comments should preserve reasoning, constraints and non-obvious context rather than narrating obvious code behaviour.

Where a comment reflects authoritative design, it should reference the relevant authority rather than becoming an independent copy of canonical design.

Comments are not a substitute for architecture, governance or canonical documentation.

---

## 35. Generated Code

### EG01-035 — Generated Output Must Identify Its Generator and Ownership

Generated code and data should identify the generator, source of truth, regeneration procedure and whether manual editing is permitted.

Where manual editing is not permitted, generated output should state that clearly.

Contributors and agents must modify the authoritative generator or source rather than patching generated output that will be overwritten.

---

## 36. Technical Debt

### EG01-036 — Significant Technical Debt Must Be Explicit

Significant debt must be visible rather than becoming invisible normal behaviour.

Useful debt classifications may include implementation or architecture debt, governance-enforcement debt, testing debt and migration or compatibility debt.

The project may track those classes in one system; the important requirement is that their different meanings remain distinguishable.

Debt must not be used as a euphemism for indefinitely accepted broken behaviour.

---

## 37. Debt Rationale and Reconsideration

### EG01-037 — Intentional Debt Requires a Reason and Reconsideration Trigger

When the project deliberately accepts a compromise, it should be possible to determine why the compromise exists, what risk it carries, what would justify revisiting it and when it matters.

This requirement applies especially strongly to performance shortcuts, compatibility burdens and temporary architecture compromises.

---

## 38. Reviewability

### EG01-038 — Implementation Must Be Understandable by Another Competent Contributor

A competent contributor with appropriate project context should be able to determine what code owns, what it changes, why it exists, how it fails and how it is verified.

Unnecessarily clever implementation that depends on continual explanation from its original author is a maintainability defect.

---

## 39. Authoritative Definition Duplication

### EG01-039 — Authoritative Facts Should Have One Canonical Machine-Readable Source Where Practical

Authoritative values and definitions should not be independently hardcoded in multiple places without a deliberate reason and validation strategy.

Systems should consume the owning registry, schema, configuration or other authoritative source rather than maintaining unrelated copies of the same fact.

Detailed stable-identity and registry requirements are defined by ENG-GOV-09.

---

## 40. Compatibility Code

### EG01-040 — Compatibility Behaviour Is First-Class Engineering

Migration adapters, legacy readers and other compatibility paths may remain necessary even when they appear structurally inelegant.

While supported, compatibility behaviour should identify its reason, supported range, verification and removal criteria.

Compatibility code must not be casually removed merely because it resembles old implementation.

---

## 41. Change Completion Contract

### EG01-041 — Code Is Not Complete Merely Because the Implementation Has Been Written

A consequential code change is complete only when the applicable implementation, verification, diagnostics, documentation, architecture decision, compatibility and Project Brain obligations have been satisfied.

Not every change requires every form of evidence.

Applicability is determined by the nature and risk of the change.

No consequential change is complete while unexplained blocking failures remain.

---

## 42. Scope Stop Condition

### EG01-042 — Engineers and Agents Must Not Broaden Scope Indefinitely

Once the requested change satisfies its authority, required verification, applicable records and completion criteria, the current work should stop.

Additional worthwhile improvements discovered during the task should be recorded as separate debt, ideas or work items unless they are necessary for correctness or safe completion of the current change.

This prevents bounded engineering work from becoming uncontrolled subsystem redesign.

---

## Relationship to Other ENG-GOV Standards

ENG-GOV-01 defines general codebase engineering behaviour.

Detailed concerns are delegated as follows:

- **ENG-GOV-02** — Repository & Module Structure Standard
- **ENG-GOV-03** — Source Style & Naming Standard
- **ENG-GOV-04** — Git / Branch / Change Standard
- **ENG-GOV-05** — Testing & Verification Standard
- **ENG-GOV-06** — CI / Quality Gate Standard
- **ENG-GOV-07** — Diagnostics / Logging / Observability Standard
- **ENG-GOV-08** — Save / Schema / Migration Standard
- **ENG-GOV-09** — Registry / Stable Identity Standard
- **ENG-GOV-10** — Performance / Benchmark Standard
- **ENG-GOV-11** — Architecture Decision Record Standard
- **ENG-GOV-12** — AI / Coding Agent Standard
- **ENG-GOV-13** — Security / Player Content Boundary Standard
- **ENG-GOV-14** — Engineering Exception / Waiver / Deprecation Standard
- **ENG-GOV-15** — Third-Party / Upstream Integration Standard

Where another ENG-GOV document defines a more specific rule within its domain, that rule operationalises ENG-GOV-01 provided it remains consistent with ENG-GOV-00.

---

## Closing Principle

Leyforge code should make authoritative behaviour easier to reason about rather than harder.

Correctness comes before convenience.

State has owners.

Data flow is explicit.

Side effects are controlled.

Determinism has declared inputs.

Concurrency has defined ownership.

Failures preserve safety.

Compatibility remains visible.

Complexity earns its place.

Debt is acknowledged.

Implementation remains understandable.

And a change is considered complete only when the code, evidence and relevant project knowledge agree about what was changed and why.
