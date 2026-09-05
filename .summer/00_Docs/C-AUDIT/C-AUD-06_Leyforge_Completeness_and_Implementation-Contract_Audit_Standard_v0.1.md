# C-AUD-06 — Leyforge Completeness & Implementation-Contract Audit Standard

**Document ID:** C-AUD-06  
**Title:** Leyforge Completeness & Implementation-Contract Audit Standard  
**Version:** v0.1  
**Status:** BRANCH C LOCK CANDIDATE — READY FOR REVIEW / ACCEPTANCE  
**Branch:** Branch C — V1 Documentation Audit & Finalisation  
**Project:** Leyforge  
**Date:** 30 August 2026  

**Parent Authority:** C-AUD-00 through C-AUD-05  
**Primary Interfaces:** Foundation Sets 00–30; FCC-01 through FCC-14; PRD; ENG-GOV/B-OPS; LF-BRAIN; D-ROAD; LFE; FRG-ENG/FORGE-ENG; registries; ADRs; verification; implementation planning  
**Owns:** Branch C methodology for determining whether authoritative requirements and implementation contracts are sufficiently complete to build without consequential invention  
**Does Not Own:** product canon, technical architecture, code design, engineering governance, production sequencing, or domain-specific owner decisions

---

# 00. Purpose

C-AUD-06 defines how Branch C audits specification completeness.

Earlier C-AUD documents answer what sources exist, who owns the truth, whether meanings agree, whether identities/migrations are coherent, and whether requirements and handoffs connect.

C-AUD-06 asks:

> **Is the specification actually complete enough that a competent implementer can build the required behaviour without having to invent consequential rules that should already have been decided?**

A document can be authoritative, semantically consistent and traceable while still being incomplete.

Examples include a machine with no fault/recovery behaviour, a portal with no recovery semantics, a settlement lifecycle with no contraction/displacement rules, a persistent state with no save/reload consequences, or a performance requirement that merely says “fast”.

C-AUD-06 exists to find those holes before implementation turns them into accidental canon.

---

# 01. Foundational Completeness Doctrine

### CA06-001 — Completeness Is Scope-Relative
A document is complete when it fully satisfies its legitimate claimed scope, not when it defines every possible downstream detail.

### CA06-002 — Completeness Is Not Length
A short precise contract may be more complete than a long descriptive document.

### CA06-003 — Completeness Is Not Consistency
Two incomplete documents may agree perfectly and still fail C-AUD-06.

### CA06-004 — Completeness Is Not Traceability
A requirement may trace cleanly into a technical owner while still omitting behaviour the owner needs.

### CA06-005 — Implementation Must Not Become the Default Decision Maker
Consequential product or architecture semantics must not be left for whichever developer happens to implement the feature first.

### CA06-006 — Delegation Is Valid Completeness
A document may intentionally leave detail downstream if the boundary, owner and required outcome are explicit.

### CA06-007 — Unbounded Ambiguity Is Incomplete
“Implementation-defined” is acceptable only where the delegated freedom is genuinely bounded.

### CA06-008 — Unknown Is Better Than Hidden Assumption
A named unknown routed to an owner is more complete than an unstated gap.

### CA06-009 — Failure Behaviour Is Part of Behaviour
Success-path specification alone is not sufficient for consequential systems.

### CA06-010 — Lifecycle Matters
Create/use/change/destroy/recover/migrate states are audited where the object/system can meaningfully experience them.

---

# 02. Completeness Audit Objects

### CA06-011 — Behaviour Contract
Defines required observable/system behaviour.

### CA06-012 — State Contract
Defines valid states and relevant state dimensions.

### CA06-013 — Transition Contract
Defines allowed transitions and transition conditions.

### CA06-014 — Failure Contract
Defines invalid/fault/error conditions and required response.

### CA06-015 — Recovery Contract
Defines how the system returns to a safe/valid state.

### CA06-016 — Persistence Contract
Defines what survives save/load/session/world lifecycle.

### CA06-017 — Migration Contract
Defines how older persistent meaning reaches current meaning.

### CA06-018 — Ownership Contract
Defines which system/entity/authority controls a state or action.

### CA06-019 — Concurrency Contract
Defines ordering/atomicity/authority requirements where simultaneous work matters.

### CA06-020 — Performance Contract
Defines bounded resource/time/scale expectations where performance affects architecture.

### CA06-021 — Security/Trust Contract
Defines what input/content/actor may be trusted and what must be validated.

### CA06-022 — Presentation Contract
Defines player-visible meaning that must remain readable even when exact art/UI execution is downstream.

### CA06-023 — Accessibility Contract
Defines required alternate/readable interaction or presentation where applicable.

### CA06-024 — Verification Contract
Defines what evidence can establish that the requirement is satisfied.

### CA06-025 — Deferred Contract
Defines intentionally unresolved work with owner, trigger and required outcome.

---

# 03. Completeness Dimensions

Every consequential requirement may be tested across applicable dimensions.

### CA06-026 — Identity
What thing/system/state is being discussed?

### CA06-027 — Scope
Where, when and to whom does the rule apply?

### CA06-028 — Inputs
What information/resources/actions enter the behaviour?

### CA06-029 — Preconditions
What must already be true before the behaviour is valid?

### CA06-030 — Trigger
What causes the behaviour or transition?

### CA06-031 — Processing / Rule
What required transformation or decision occurs?

### CA06-032 — Outputs
What state/resource/event/result is produced?

### CA06-033 — Postconditions
What must be true after successful completion?

### CA06-034 — Invalid Inputs
How are invalid requests/data/resources treated?

### CA06-035 — Failure Modes
What credible ways can the behaviour fail?

### CA06-036 — Recovery
How does each relevant failure recover or remain safely blocked?

### CA06-037 — Cancellation / Interruption
What happens if work stops midway?

### CA06-038 — Idempotence / Repeat
What happens if the request/action is repeated?

### CA06-039 — Persistence
Which parts survive reload/unload/restart?

### CA06-040 — Authority
Who may cause, commit, reject or override the behaviour?

### CA06-041 — Concurrency
What happens when multiple actors/systems act simultaneously?

### CA06-042 — Resource Conservation
What resources may be consumed, produced, reserved, returned or lost?

### CA06-043 — Ordering / Determinism
What ordering or deterministic properties are required?

### CA06-044 — Bounds / Limits
What prevents unbounded work, recursion, propagation, memory or population?

### CA06-045 — Scaling
What changes at larger world/player/content/system scale?

### CA06-046 — Degraded / Far Simulation
What happens when full local simulation is not active?

### CA06-047 — Cross-Realm / Cross-World Behaviour
What carries across boundaries and what remains isolated?

### CA06-048 — Player-Facing Feedback
How can the player/operator understand relevant state/failure?

### CA06-049 — Verification
How can the required behaviour be proven?

### CA06-050 — Ownership of Remaining Detail
Who decides anything intentionally not specified here?

---

# 04. Requirement Quality Test

### CA06-051 — Requirement Must Be Interpretable
A competent consumer should be able to explain what is required without reconstructing hidden chat context.

### CA06-052 — Requirement Must Be Bounded
Words such as advanced, dynamic, realistic, scalable, secure, fast, seamless or robust require enough context to constrain implementation.

### CA06-053 — Requirement Must Separate Must / Should / May
Mandatory behaviour must not be written as optional suggestion.

### CA06-054 — Requirement Must Preserve Conditions
Conditional requirements need explicit trigger/scope.

### CA06-055 — Requirement Must Preserve Quantifiers
Exactly/at-least/up-to/per-family/per-instance distinctions must remain explicit.

### CA06-056 — Requirement Must Separate Outcome From Mechanism
Product authority may require the outcome while leaving implementation mechanism downstream.

### CA06-057 — Requirement Must Separate Current From Future
A future aspiration must not appear as a current V1 obligation unless activated.

### CA06-058 — Requirement Must Identify Legitimate Unknowns
A material unresolved choice is recorded rather than implied solved.

### CA06-059 — Requirement Must Identify Owner of Unknown
Unowned unknowns fail completeness.

### CA06-060 — Requirement Must Avoid Circular Definition
A system is not complete if its key rule is defined only by reference to another document that points back.

---

# 05. Lifecycle Completeness Audit

### CA06-061 — Creation
How is the entity/state/system created or entered?

### CA06-062 — Initial State
What must be true immediately after creation?

### CA06-063 — Activation
What makes an inactive/placed/configured thing operational?

### CA06-064 — Normal Operation
What behaviour occurs while valid and active?

### CA06-065 — Modification
What properties may change and who may change them?

### CA06-066 — Damage / Degradation
If applicable, how does degraded state differ from normal state?

### CA06-067 — Repair / Restoration
How does degraded state recover?

### CA06-068 — Deactivation
How can the thing safely stop operating without ceasing to exist?

### CA06-069 — Destruction / Removal
What happens when it ceases to exist?

### CA06-070 — Salvage / Drops / Refunds
What state/resources survive removal where relevant?

### CA06-071 — Ownership Transfer
How does control/responsibility change?

### CA06-072 — Save / Unload
What persists when runtime representation disappears?

### CA06-073 — Reload / Promotion
How is persistent state reconstructed?

### CA06-074 — Migration
How does older representation transition to current representation?

### CA06-075 — Archive / Retirement
How does obsolete content leave active use safely?

### CA06-076 — Lifecycle Stages Need Not All Apply
NOT APPLICABLE is valid where the concept cannot enter a particular state.

---

# 06. State-Machine Completeness Audit

### CA06-077 — Valid States Must Be Discoverable
Consequential states should be enumerated or derivable.

### CA06-078 — Invalid State Combinations Must Be Bounded
Mutually exclusive states must not silently coexist.

### CA06-079 — Transition Preconditions Must Be Known
A transition should not occur from arbitrary invalid states.

### CA06-080 — Transition Commit Point Must Be Known Where Consequential
For resource/persistence-sensitive actions, the point at which state becomes authoritative must be defined downstream.

### CA06-081 — Transition Failure Must Preserve Invariants
Partial failure cannot silently violate conservation, ownership or persistent identity.

### CA06-082 — Interrupted Transition Needs Treatment
Save/load, chunk unload, disconnect, crash or cancellation during a transition must have a valid outcome where applicable.

### CA06-083 — Terminal States Must Be Explicit
Completed/destroyed/retired/failed states should not accidentally re-enter active transitions.

### CA06-084 — State Reconstruction Must Be Deterministic Where Required
Persistent state should not reload into a different semantic lifecycle phase.

---

# 07. Failure & Recovery Completeness

### CA06-085 — Credible Failure Modes Must Be Considered
The audit looks for realistic faults, not every imaginable accident.

### CA06-086 — Invalid Input
Malformed/forbidden/ineligible input has a defined safe outcome.

### CA06-087 — Missing Dependency
Unavailable required content/system/resource produces a defined blocked/error state.

### CA06-088 — Partial Resource Availability
Systems must not invent behaviour when only some required resources exist.

### CA06-089 — Capacity / Full Destination
Blocked storage/output/queue capacity has explicit treatment.

### CA06-090 — Unloaded / Unavailable World State
Operations crossing unloaded/unknown terrain must have safe handling.

### CA06-091 — Actor/Owner Disappearance
NPC/player/service loss during work has defined ownership/recovery behaviour where relevant.

### CA06-092 — Permission Failure
Denied actions must not partially commit.

### CA06-093 — Validation Failure
Invalid content/project/recipe/build action must fail before irreversible commit where applicable.

### CA06-094 — Persistence Failure
Save/write/migration failure must preserve or recover valid prior state according to downstream persistence authority.

### CA06-095 — Network Failure
Where multiplayer is applicable, disconnect/replay/out-of-order actions require an authority strategy.

### CA06-096 — Recovery Must Not Duplicate Resources
Retry/rollback/recovery cannot duplicate committed value.

### CA06-097 — Recovery Must Not Delete Valid Prior State Without Authority
Failure handling must be conservative around persistent player/world state.

### CA06-098 — Recovery Path Must Terminate
A system cannot remain in an undefined retry loop.

### CA06-099 — Unrecoverable State Must Be Explicit
If manual intervention/quarantine/reset is required, the contract must say so.

---

# 08. Resource & Transaction Completeness

### CA06-100 — Inputs Are Counted
Resource-consuming behaviour must identify what is consumed/reserved.

### CA06-101 — Outputs Are Counted
Production/reward/drop behaviour must identify what may be created.

### CA06-102 — Reservation Is Distinct From Consumption
Resources reserved for future work remain owned and recoverable according to contract until commit.

### CA06-103 — Commit Is Distinct From Progress
Progress indicators must not imply irreversible consumption unless that is the accepted rule.

### CA06-104 — Cancellation Requires Disposition
Reserved/partially consumed resources need explicit cancellation behaviour.

### CA06-105 — Failure Requires Disposition
Resource state after fault must be defined.

### CA06-106 — Duplication / Loss Must Be Bounded
No accidental value creation/deletion occurs outside authorised gameplay rules.

### CA06-107 — Multi-Input Race Requires Contract
Competing deliveries/consumers need deterministic or authoritative arbitration where applicable.

### CA06-108 — Overflow Requires Contract
Excess output, full inventory/storage or capacity violation needs defined behaviour.

### CA06-109 — Cross-System Transfer Has One Commit Owner
Transfers between systems must not have two independent authoritative commit points.

---

# 09. Persistence Completeness

### CA06-110 — Persistent Fields Must Be Identifiable
A system that claims persistence must specify what semantic state survives.

### CA06-111 — Derived Runtime State Need Not Persist
Rebuildable caches/visual actors may be reconstructed.

### CA06-112 — Persistent Identity Must Survive Reconstruction
Reload cannot invent new identity for the same durable entity.

### CA06-113 — Save Boundary Must Preserve Invariants
Saving mid-operation cannot create impossible state.

### CA06-114 — Version Evolution Must Be Accounted For
Persistent contracts must acknowledge migration/version handling where required.

### CA06-115 — Global vs World State Must Be Separated
Settings/account/profile state and world-specific state must not drift across ownership boundaries.

### CA06-116 — Multi-World Isolation Must Be Explicit
Separate worlds/realms/saves must not share mutable state unintentionally.

### CA06-117 — Near/Far Simulation Must Converge
Where near/far simulation exists, both modes must preserve authoritative state even if presentation/detail differs.

---

# 10. Ownership & Authority Completeness

### CA06-118 — Every Consequential State Has an Authority Owner
The audit must be able to identify what system commits the state.

### CA06-119 — Multiple Writers Require Arbitration
Two systems must not both believe they own final truth without a conflict strategy.

### CA06-120 — Read Model Is Not Authority
UI/cache/presentation state may reflect authoritative state without owning it.

### CA06-121 — Player Intent Is Not Automatically Authoritative
Input requests may require validation before commit.

### CA06-122 — NPC/Automation Intent Is Not Automatically Authoritative
Task assignment and action execution may be separate ownership layers.

### CA06-123 — Multiplayer Authority Must Be Explicit Before Activation
When shared worlds become rebuild-relevant, ownership/trust/replication constraints must be technically resolved.

### CA06-124 — External Content Cannot Self-Authorise
Forge/mod packages require validation/permission boundaries.

---

# 11. Determinism & Ordering Completeness

### CA06-125 — Determinism Requirements Must State Scope
Worldgen, migration, far simulation, registry generation and other deterministic processes should identify what inputs define repeatability.

### CA06-126 — Randomness Must Have an Owner
Seeded/system randomness should not depend on accidental iteration order where determinism matters.

### CA06-127 — Order-Sensitive Operations Must Be Identified
If outcome changes by processing order, the ordering rule or delegated arbitration must be explicit.

### CA06-128 — Rebuildable Generation Must Be Versioned Where Needed
Procedural output whose algorithm changes can affect persistent worlds and therefore needs version/migration strategy.

### CA06-129 — Equivalent Inputs Should Produce Equivalent Semantic Result Where Required
Optimisation/parallelisation may not alter authoritative outcome.

---

# 12. Scale & Performance Completeness

### CA06-130 — Performance Claims Need Scenario
“Fast” is incomplete without workload/context.

### CA06-131 — Performance Contracts Need Metric
Frame time, memory, throughput, latency, simulation budget or equivalent measurable dimension must be chosen downstream.

### CA06-132 — Performance Contracts Need Threshold or Decision Rule
A benchmark without a pass/decision criterion is evidence but not a complete gate.

### CA06-133 — Scale Dimensions Must Be Named
World distance, loaded chunks, NPC count, settlement count, machines, structures, packages, players or registry size may stress different architecture.

### CA06-134 — Low-End Scalability Requirements Need Degradation Semantics
Reducing visual/simulation detail must not silently change authoritative game truth unless explicitly allowed.

### CA06-135 — Bounded Work Is Required
Potentially unbounded propagation, pathfinding, search, graph traversal, simulation or generation requires limits/partitioning strategies downstream.

### CA06-136 — Performance Failure Must Not Corrupt State
Dropping visuals/LOD/work rate is preferable to losing authoritative resources unless gameplay intentionally defines loss.

---

# 13. Security / Trust Completeness

### CA06-137 — Trust Boundaries Must Be Named
Local authored content, downloaded packages, network clients, scripts/data and external dependencies must be classified.

### CA06-138 — Validation Responsibility Must Be Known
A format is incomplete if nobody owns validation.

### CA06-139 — Invalid External Content Must Fail Transactionally
Partially activated untrusted content is not an acceptable undefined state.

### CA06-140 — Permissions Must Be Explicit
Capabilities granted to content/agents/admins must be bounded.

### CA06-141 — Resource Limits Must Exist Where External Input Can Expand Work
Archive size, decompression, graph complexity, content count, network rate or similar risks require bounds downstream.

### CA06-142 — Security Error Must Preserve Existing Valid State
Rejected external content should not corrupt active world/registry state.

---

# 14. Player-Facing & UX Completeness

### CA06-143 — Consequential State Must Be Understandable
Players/operators need enough feedback to distinguish actionable states where gameplay depends on them.

### CA06-144 — Failure Reason Must Be Actionable Where Appropriate
A generic rejection may be incomplete if the player needs to know whether the blocker is resources, permissions, route, tool, capacity or another condition.

### CA06-145 — Hidden Complexity May Remain Hidden
The player need not see internal architecture/state IDs unless gameplay requires it.

### CA06-146 — Accessibility Requirements Must Survive Implementation Handoff
Important cues cannot depend only on colour, motion, audio or another single channel when applicable authority requires alternatives.

### CA06-147 — Debug Information Is Not Player UX
Development diagnostics cannot substitute for intended player-facing explanation.

### CA06-148 — First-Time Learning Requirements Need Completion Criteria Where Applicable
Tutorial/guide systems should know what authoritative state demonstrates learning/progression rather than relying on isolated checklists.

---

# 15. World / Realm / Generation Completeness

### CA06-149 — World Identity Must Be Defined
Seed, generation/version/config identity and persistent world identity must remain separable.

### CA06-150 — Generation Preconditions Must Be Known
Required inputs/config/realm rules must be discoverable.

### CA06-151 — Invalid Generation Must Have Outcome
Blocked seed/config/site placement must not silently fall back to unrelated world meaning unless explicitly allowed.

### CA06-152 — Cross-Chunk/Region Determinism Must Be Accounted For
Generation order must not create contradictory persistent structures where determinism is required.

### CA06-153 — Realm Entry Must Define Arrival Safety
Portal/access design must include first-arrival/recovery/failure contracts downstream.

### CA06-154 — Realm Exit/Recovery Must Be Defined
A player cannot become permanently trapped by an undefined access failure unless the game intentionally allows it.

### CA06-155 — Cross-Realm Provenance Must Survive Transfer
Matter/content moved between realms must retain required identity/provenance semantics.

### CA06-156 — Native vs Void/Systemic Hazard Must Remain Distinguishable
Where canon treats them differently, implementation contracts must preserve that distinction.

---

# 16. Settlement / NPC / Civilisation Completeness

### CA06-157 — Resident Identity Lifecycle Must Be Defined
Creation/migration/household/role/removal/persistence semantics need owners where applicable.

### CA06-158 — Job Assignment Requires Preconditions
Capability, age/personhood, tools, route/access, worksite or other relevant constraints cannot be silently invented.

### CA06-159 — Housing / Bed / Residence Consistency Must Be Preserved
Growth/displacement/damage/re-housing requires lifecycle treatment.

### CA06-160 — Construction Must Separate Survey / Reservation / Work / Commit
Implementation should not collapse planning and resource-consuming work into ambiguous progress.

### CA06-161 — Blocked Worker Behaviour Needs Safe Outcome
Route/tool/material/chunk/permission failures should not consume progress/resources improperly.

### CA06-162 — Near/Far Civilisation Simulation Must Preserve Transactions
Abstract simulation may differ in representation but not silently violate inventories/identity.

### CA06-163 — Settlement Isolation Must Be Explicit
Multiple settlements need stable namespaces/state ownership to prevent cross-contamination.

---

# 17. Crafting / Processing / Automation Completeness

### CA06-164 — Recipe Eligibility Must Be Defined
Inputs/provider/capability/tool/station conditions must be resolvable.

### CA06-165 — Quantity Semantics Must Be Defined
Input/output quantities, partial batches and conservation cannot be inferred from UI alone.

### CA06-166 — Blocked Output Requires Behaviour
Processing cannot silently delete output when destination is full.

### CA06-167 — Concurrent Inputs Require Arbitration
Multiple compatible/incompatible inputs need deterministic or authoritative routing.

### CA06-168 — Machine Faults Need State + Recovery
“Faulted” must have cause, effect and valid recovery action.

### CA06-169 — Far Simulation Must Preserve Transaction Truth
Batch abstraction may change timing/detail but not create/delete matter unless authorised.

### CA06-170 — Manual and Automated Processing Must Share Canonical Results Where Required
Different execution paths cannot silently produce different identity/quantity semantics.

---

# 18. Magic / Network / Ward Completeness

### CA06-171 — Resource Network Ownership Must Be Explicit
Generation/storage/transfer/consumption commit points need owners.

### CA06-172 — Network Faults Must Be Interpretable
Disconnected, overloaded, incompatible or invalid networks require bounded outcomes.

### CA06-173 — Coverage Systems Need Geometry/Rule Contract
Ward/area effects must define how membership/coverage is determined downstream.

### CA06-174 — Partial Network Availability Needs Behaviour
Loss of one component cannot result in undefined half-authority.

### CA06-175 — Saved Network State Must Reconstruct Safely
Persistent components and derived topology need clear ownership.

---

# 19. Combat / Event / Raid Completeness

### CA06-176 — Event Lifecycle Must Be Defined
Warning/start/active/resolution/aftermath/cleanup states need transitions.

### CA06-177 — Participation Ownership Must Be Defined
Which actors belong to the event and how they enter/leave must be clear.

### CA06-178 — Outcome Inputs Must Be Defined
Preparation/pressure/state used for deterministic outcomes cannot be hidden implementation assumptions where game design depends on them.

### CA06-179 — Interrupted Event Persistence Must Be Defined
Save/reload/unload during an event requires a valid state.

### CA06-180 — Aftermath Must Preserve Consequences
Injuries, theft, damage, reputation, repairs or equivalent outcomes require persistence/ownership treatment.

---

# 20. Forge / Authoring Completeness

### CA06-181 — Editable Source vs Generated Runtime Product Must Be Clear
Generated artifacts must be rebuildable or deliberately versioned.

### CA06-182 — Authoring Validity Rules Need Ownership
Forge tools need to know what can be rejected before bake/publish.

### CA06-183 — Preview/Runtime Fidelity Requirement Must Be Bounded
Preview need not be pixel-identical but cannot misrepresent semantic functionality.

### CA06-184 — Dependency Handling Must Be Defined
Referenced materials/entities/modules/packages need missing/cycle/version behaviour.

### CA06-185 — Bake Failure Must Be Transactional
Failed bake must not destroy valid editable source or partially publish invalid runtime content.

### CA06-186 — Copy/Fork/Override Lifecycles Need Identity Rules
Authoring operations that create new durable definitions must be traceable to FCC-13/FORGE-ENG.

### CA06-187 — Package Activation Needs Rollback
Downloaded/imported content must not leave inconsistent registry state after validation failure.

---

# 21. Multiplayer-Readiness Completeness

### CA06-188 — Multiplayer Architecture May Be Deferred Until Activated
Full networking implementation is not required solely because future multiplayer exists.

### CA06-189 — Rebuild-Critical Multiplayer Constraints Must Still Be Captured
Stable identity, deterministic simulation boundaries, authority separation, save compatibility and content trust may constrain architecture now.

### CA06-190 — Client Prediction Is Not Product Canon
Exact prediction/replication mechanisms remain technical unless gameplay semantics require them.

### CA06-191 — Authoritative State Classes Must Be Identified Before Real Multiplayer
Once multiplayer becomes active scope, each consequential mutable state needs a server/host/ownership model.

### CA06-192 — Abuse/Rate-Limit/Admin Controls Activate With the Risk Boundary
They should not be falsely certified before multiplayer/admin capability exists.

---

# 22. Deferment Completeness

### CA06-193 — Deferred Detail Requires Owner
Every material deferral identifies the family/work package that will resolve it.

### CA06-194 — Deferred Detail Requires Trigger
The project should know when the deferral becomes blocking/applicable.

### CA06-195 — Deferred Detail Requires Boundary
What is already decided must be separated from what remains free.

### CA06-196 — Deferred Detail Must Not Leak as Assumption
Consumers cannot silently choose one option before the owner decides.

### CA06-197 — Deferred Detail May Still Constrain Architecture
Future multiplayer/modding/scalability can impose current structural constraints without requiring full feature completion.

### CA06-198 — TBD Without Owner/Trigger Is Incomplete
A naked TBD is a finding, not a valid contract.

---

# 23. Implementation-Freedom Audit

### CA06-199 — Freedom Must Be Intentional
A requirement can leave multiple implementation choices when all choices preserve required observable semantics.

### CA06-200 — Freedom Must Have Boundaries
Security, persistence, conservation, determinism, identity and performance constraints may limit otherwise free design.

### CA06-201 — Algorithm Choice Can Remain Free
If upstream authority only cares about output/invariants, exact algorithm may belong to PRD/LFE.

### CA06-202 — Data Structure Choice Can Remain Free
Canonical identity does not prescribe map/vector/database layout unless technically required.

### CA06-203 — UI Layout Can Remain Free
Semantic presentation requirements need not dictate exact pixels.

### CA06-204 — Freedom Ends Where Player Meaning Changes
If two implementation choices produce materially different gameplay/canon behaviour, owner resolution is required.

---

# 24. Completeness Finding Taxonomy

- **CMP-01 — Missing Precondition**
- **CMP-02 — Missing Trigger**
- **CMP-03 — Missing Output/Postcondition**
- **CMP-04 — Missing Invalid-Input Behaviour**
- **CMP-05 — Missing Failure Mode**
- **CMP-06 — Missing Recovery**
- **CMP-07 — Missing Cancellation / Rollback**
- **CMP-08 — Missing Persistence Contract**
- **CMP-09 — Missing Migration Contract**
- **CMP-10 — Missing Authority Owner**
- **CMP-11 — Multi-Writer Ambiguity**
- **CMP-12 — Missing Concurrency Contract**
- **CMP-13 — Missing Conservation Contract**
- **CMP-14 — Missing Determinism / Ordering Contract**
- **CMP-15 — Missing Bounds**
- **CMP-16 — Missing Scale Contract**
- **CMP-17 — Missing Performance Decision Rule**
- **CMP-18 — Missing Security / Trust Boundary**
- **CMP-19 — Missing Player Feedback**
- **CMP-20 — Missing Lifecycle State**
- **CMP-21 — Missing Cross-Boundary Rule**
- **CMP-22 — Unbounded Implementation Freedom**
- **CMP-23 — Naked TBD**
- **CMP-24 — False Completeness Claim**
- **CMP-25 — Systemic Specification Gap**

---

# 25. Severity Guidance

### CA06-205 — Local Detail Gaps May Be AUD-1/AUD-2
Minor presentation or non-consequential omissions may be low severity.

### CA06-206 — Missing Behaviour/Interface Contracts Are Usually AUD-3+
If multiple systems/consumers depend on the missing rule, impact escalates.

### CA06-207 — Persistence/Identity/Security/Authority Gaps Are AUD-4+
Any gap capable of corrupting long-lived state or trust boundaries is high risk.

### CA06-208 — Foundational Specification Holes May Be AUD-5
If a rebuild-critical subsystem cannot be built without inventing core semantics, global V1 lock is blocked.

---

# 26. Completeness Audit Record

```text
Audit Row ID:
Requirement / System:
Owning Source:
Scope:
Lifecycle Stage:
Inputs:
Preconditions:
Trigger:
Required Behaviour:
Outputs:
Postconditions:
Failure Modes:
Recovery:
Cancellation / Interruption:
Persistence:
Authority Owner:
Concurrency:
Conservation:
Determinism:
Bounds:
Scale / Performance:
Security / Trust:
Player Feedback:
Verification:
Deferred Detail:
Deferred Owner:
Coverage State:
Finding Type:
Severity:
Resolution Owner:
Re-Audit Result:
```

### CA06-209 — Not Every Field Applies
Explicit N/A is valid where a dimension has no meaningful role.

### CA06-210 — High-Risk Requirements Need More Complete Rows
Persistence, registry, worldgen, external content, multiplayer and transaction systems receive deeper completeness checks.

### CA06-211 — Repeated Patterns May Use Templates
Common machine/transaction/lifecycle contracts may use reusable audit templates without losing source-specific meaning.

---

# 27. Completeness Coverage States

### CA06-212 — COMPLETE
No material missing contract within declared scope.

### CA06-213 — COMPLETE — ROUTED
Current scope complete; downstream detail explicitly owned.

### CA06-214 — PARTIAL
Some required dimensions are absent.

### CA06-215 — AMBIGUOUS
Multiple materially different implementations remain possible without owner guidance.

### CA06-216 — BLOCKED
Cannot complete because required authority/evidence/decision is unavailable.

### CA06-217 — DEFERRED
Explicitly out of current scope with owner/trigger.

### CA06-218 — NOT APPLICABLE
The completeness dimension genuinely does not apply.

### CA06-219 — SUPERSEDED
The requirement belongs to replaced/historical authority.

---

# 28. Audit Execution Procedure

1. Select scope.
2. Resolve authority with C-AUD-02.
3. Verify meaning with C-AUD-03.
4. Verify identity/data concerns with C-AUD-04 where applicable.
5. Verify trace chain with C-AUD-05.
6. Build behaviour/lifecycle model.
7. Run adversarial invalid/failure/interruption/reload/concurrency/exhaustion pass.
8. Run scale/risk pass.
9. Audit implementation freedom.
10. Classify findings using CMP-01 through CMP-25.
11. Route owner decisions.
12. Re-audit after resolution.

---

# 29. Adversarial Question Set

### CA06-220
What happens if the input is invalid?

### CA06-221
What happens if required resources run out midway?

### CA06-222
What happens if the destination is full?

### CA06-223
What happens if the world/chunk/entity unloads midway?

### CA06-224
What happens if the process is saved and reloaded midway?

### CA06-225
What happens if two actors do it at once?

### CA06-226
What happens if the same request is repeated?

### CA06-227
What happens if permission changes midway?

### CA06-228
What happens if the referenced definition disappears or migrates?

### CA06-229
What happens on old save data?

### CA06-230
What happens at far simulation / lower performance profile?

### CA06-231
What happens at the largest expected scale?

### CA06-232
What happens when external/untrusted content supplies the input?

### CA06-233
How does the player/operator know why it stopped?

### CA06-234
How do we prove no resources/identity/state were lost or duplicated?

### CA06-235
Which answers are product decisions, engineering decisions or technology facts?

---

# 30. Automation / Tooling Handoff

### CA06-236 — Schema Completeness Can Be Partially Automated
Required fields/status/owner/trace references may be mechanically checked.

### CA06-237 — Lifecycle Templates Can Detect Empty Sections
Tools may flag missing failure/recovery/persistence fields in high-risk contracts.

### CA06-238 — TBD Detection Is Automatable
Unowned TODO/TBD/placeholder terms may be surfaced for review.

### CA06-239 — N/A Abuse Requires Review
Automation can report excessive N/A usage but semantic appropriateness needs review.

### CA06-240 — Implementation Ambiguity Is Mostly Semantic
Tools cannot reliably decide whether two implementation choices change product meaning.

### CA06-241 — Completeness Reports Are Derived
Dashboards help locate gaps but never become the specification.

---

# 31. PRD Interface

### CA06-242 — PRD-01 Is a Major Completeness Input
Its requirement/unknown inventory should expose many technical holes before final V1 audit.

### CA06-243 — PRD Unknown Classes Help Route Gaps
Design decision, engineering decision and technology fact should remain separate.

### CA06-244 — PRD Closure Does Not Eliminate C-AUD-06
PRD proves technical discovery maturity; Branch C still audits the final corpus for missing contracts across all families.

### CA06-245 — C-AUD-06 Findings May Reopen PRD
If final audit finds a rebuild-critical technical unknown that PRD missed, the applicable discovery gate must reopen.

---

# 32. Branch B Interface

### CA06-246 — ENG-GOV Defines Engineering Completeness Requirements
Testing, persistence, security, performance and architecture rules remain Branch B authority.

### CA06-247 — Branch B Certification Is Consumed
C-AUD-06 treats the certified governance baseline as current engineering law rather than rewriting it.

### CA06-248 — Governance Debt May Be Valid Completeness
A missing validator can be complete as governance if rule, risk, interim protection, activation trigger and proof plan are explicit.

### CA06-249 — Missing Enforcement Is Not Missing Rule
Completeness distinguishes “we know what must be true but automation is planned” from “we do not know what must be true”.

---

# 33. Branch D Interface

### CA06-250 — D-ROAD Gates Consume Completeness Results
A mandatory gate cannot pass if required implementation contracts remain materially incomplete.

### CA06-251 — C-AUD-06 Does Not Set Production Timing
Branch D decides when a complete contract becomes a rebuild gate.

### CA06-252 — D-ROAD-05 Binary Rebuild Verdict Depends on Real Completeness
The project must not authorise rebuild while foundational assumptions remain hidden.

### CA06-253 — D-ROAD-06 Must Be Derived From Complete Enough Architecture
Implementation sequence should not compensate for missing architecture by inventing it.

---

# 34. Project Brain Interface

### CA06-254 — Brain Exposes Open Completeness Findings
Auditors/agents should be able to discover missing contracts and their owners.

### CA06-255 — Brain May Provide Lifecycle Check Templates
Reusable checklists reduce rediscovery.

### CA06-256 — Brain Stores Lessons, Not Duplicate Contract Meaning
A lesson may explain a common failure pattern while linking to owning sources.

### CA06-257 — Completeness Findings Should Link to Trace Graph
A gap should show which downstream consumers are blocked or at risk.

---

# 35. Delta Reconciliation

### CA06-258 — New Semantics Reopen Completeness
A changed requirement may introduce new states/failures/boundaries.

### CA06-259 — New Consumer Can Reveal Missing Contract
Multiplayer, Forge, persistence or post-30 activation may expose a previously irrelevant dimension.

### CA06-260 — New Evidence Can Close Engineering Ambiguity
A PRD prototype may convert an engineering unknown into an accepted implementation contract.

### CA06-261 — New Failure Evidence Can Reopen a Complete Contract
Observed failure is valid evidence that an assumed completeness state was false.

### CA06-262 — Final Freeze Requires No Unprocessed Completeness Delta
Known rebuild-critical gaps must be incorporated or explicitly deferred outside V1 scope.

---

# 36. Individual Document Completeness Gate

A V1 document may certify within its claimed scope only when applicable conditions are satisfied:

```text
[ ] scope is explicit
[ ] required inputs/preconditions are known
[ ] success behaviour/result is known
[ ] lifecycle states are sufficiently defined
[ ] transitions are sufficiently defined
[ ] credible failure modes are addressed
[ ] recovery/terminal behaviour is addressed
[ ] cancellation/interruption is addressed where relevant
[ ] resource conservation is addressed where relevant
[ ] persistence/migration is addressed or routed where relevant
[ ] authority/writer ownership is clear
[ ] concurrency/order is addressed where relevant
[ ] deterministic requirements are explicit where relevant
[ ] bounds/scale are addressed where architecture-relevant
[ ] performance claims are measurable or routed
[ ] security/trust boundaries are addressed where relevant
[ ] player-facing feedback is addressed where gameplay-relevant
[ ] verification path exists where required
[ ] implementation freedom is deliberately bounded
[ ] deferred details have owner + trigger + boundary
[ ] no naked consequential TBD remains
[ ] no blocking CMP finding remains
```

---

# 37. Whole-Corpus Completeness Gate

Before `LEYFORGE DOCUMENTATION V1.0 — GLOBAL CORPUS LOCKED`, Branch C must be able to certify:

```text
[ ] rebuild-critical systems have complete-enough behavioural contracts
[ ] no foundational subsystem requires broad undocumented invention
[ ] lifecycle boundaries are covered for persistent/high-risk systems
[ ] success/failure/recovery contracts exist where consequential
[ ] resource/transaction conservation is specified where applicable
[ ] save/reload/migration requirements are complete enough for technical canon
[ ] authority/multi-writer ownership is resolved
[ ] determinism/ordering requirements are explicit where required
[ ] scale/performance contracts are measurable or deliberately routed
[ ] security/external-content trust boundaries are complete enough
[ ] cross-world/realm/settlement boundaries are specified where required
[ ] low-end/scalability degradation cannot silently alter authoritative truth
[ ] multiplayer architecture constraints required before rebuild are captured
[ ] Forge authoring/bake/package failure semantics are captured
[ ] PRD technical unknowns are closed, bounded or routed
[ ] LFE/FORGE-ENG are not forced to invent product canon
[ ] D-ROAD-06 can be derived without filling foundational specification holes
[ ] no unresolved CMP-25 systemic gap remains
[ ] no unresolved in-scope AUD-4/AUD-5 completeness finding remains
```

---

# 38. Representative Leyforge Completeness Cases

## 38.1 Automation Transfer
A chute/furnace contract is incomplete if it states only that items move. It must eventually cover compatible/incompatible input, capacity reservation, full destination, simultaneous arrivals, save/reload mid-transfer, conservation and fault/diagnostic state.

## 38.2 Settlement Construction
A project catalogue is incomplete if it only lists buildings. Implementation requires enough contract for survey, route/access, protected edits, materials/tools, reservation, worker task ownership, excavation/fill, cancellation, damage/repair, persistence and activation.

## 38.3 Portal Access
A portal recipe is incomplete if entry can succeed but recovery/failsafe semantics are absent. Current FCC-14 explicitly includes arrival safety, repair/recovery and portal migration in certification/technical handoff.

## 38.4 Stable Identity
An ID list is incomplete if it does not define projection, alias, migration and persistence semantics. C-AUD-04/FCC-13 own identity meaning; C-AUD-06 asks whether consuming contracts contain enough lifecycle/failure detail.

## 38.5 Low-End Scalability
A performance mode is incomplete if lowering the profile can silently change resource conservation, NPC identity or authoritative simulation. Presentation/simulation-detail degradation must be separated from truth-changing gameplay.

## 38.6 Forge Bake
A creator tool is incomplete if successful bake is defined but failure leaves partial registry/package state. Transactional failure/rollback is part of the implementation contract.

---

# 39. C-AUD-06 Acceptance Gate

C-AUD-06 may be theoretically locked when the project accepts that it has defined:

```text
[ ] completeness doctrine
[ ] audit object model
[ ] completeness dimensions
[ ] requirement quality test
[ ] lifecycle completeness audit
[ ] state-machine completeness audit
[ ] failure/recovery audit
[ ] transaction/resource audit
[ ] persistence audit
[ ] authority/writer audit
[ ] determinism/ordering audit
[ ] scale/performance audit
[ ] security/trust audit
[ ] player-facing completeness audit
[ ] world/realm audit
[ ] settlement/NPC audit
[ ] crafting/automation audit
[ ] magic/network audit
[ ] combat/event audit
[ ] Forge/authoring audit
[ ] multiplayer-readiness audit
[ ] deferment rules
[ ] implementation-freedom rules
[ ] CMP-01 through CMP-25 taxonomy
[ ] severity guidance
[ ] audit row structure
[ ] coverage states
[ ] execution procedure
[ ] adversarial question set
[ ] automation handoff
[ ] PRD interface
[ ] Branch B interface
[ ] Branch D interface
[ ] Brain interface
[ ] delta reconciliation
[ ] individual-document gate
[ ] whole-corpus completeness gate
[ ] representative Leyforge cases
```

---

# 40. Immediate Handoff

After C-AUD-06 is accepted, proceed to:

> **C-AUD-07 — Leyforge Evidence, Verification & Acceptance Audit Standard v0.1**

```text
C-AUD-01 — What sources exist?
        ↓
C-AUD-02 — Who owns each truth?
        ↓
C-AUD-03 — Do those truths agree?
        ↓
C-AUD-04 — Are identities / registries / migrations coherent?
        ↓
C-AUD-05 — Do requirements and handoffs connect?
        ↓
C-AUD-06 — Are the contracts complete enough to build?
        ↓
C-AUD-07 — What evidence proves any of this is actually true?
```

C-AUD-07 will define evidence classes, proof strength, historical versus current evidence, automated versus manual verification, benchmark validity, prototype evidence, representative-player acceptance, environment fidelity, stale evidence, evidence gaps, false-pass prevention and final acceptance-evidence requirements.

---

# 41. Foundational Statement

> **A specification is implementation-ready only when it tells a competent builder what must remain true, what may vary, what happens when things go wrong, and who owns every consequential decision still left open.**

Leyforge V1 should not force implementation to rediscover design.

It should force implementation to prove the design.

---

**End of C-AUD-06 v0.1**
