# ENG-GOV-07 — Leyforge Diagnostics / Logging / Observability Standard

**Document ID:** ENG-GOV-07  
**Title:** Leyforge Diagnostics / Logging / Observability Standard  
**Version:** v0.1  
**Status:** THEORETICALLY LOCKED  
**Authority Domain:** Engineering Governance — Diagnostics / Logging / Observability  
**Parent Authority:** ENG-GOV-00 — Leyforge Engineering Constitution  
**Related Standards:** ENG-GOV-01, ENG-GOV-05, ENG-GOV-06, ENG-GOV-10, ENG-GOV-12, ENG-GOV-13  
**Project:** Leyforge

---

## 00. Purpose and Scope

ENG-GOV-07 defines how Leyforge exposes meaningful runtime and engineering truth for diagnosis, support, testing, performance investigation and project health.

It governs structured logs, diagnostic events, metrics, state inspection, debug overlays, support bundles, crash context, reproduction context, profiling hooks, correlation identity, health indicators and diagnostic commands.

Diagnostics exist to explain authoritative behaviour. They do not become an alternate owner of simulation truth.

---

## 01. Diagnostic Purpose

### EG07-001 — Diagnostics Is Broader Than Logging
Leyforge diagnostics includes structured logs, events, metrics, inspection, overlays, support bundles, crash context, reproduction context, health indicators, diagnostic commands, profiling hooks and trace/correlation identity.

### EG07-002 — Every Diagnostic Mechanism Has an Identifiable Purpose
Diagnostics should help answer what happened, where, when, to which system/entity, why a decision was made, what authoritative state changed, what failed and whether the failure can be reproduced.

---

## 02. Structured Diagnostic Events

### EG07-003 — Consequential Runtime Logs Should Be Structured Where Practical
Important runtime diagnostics should prefer structured events over free-form strings.

### EG07-004 — Important Diagnostic Event Families Have Stable Machine-Readable Identities
Operational events such as `save.write.failed`, `settlement.project.blocked` or `inventory.transaction.rolled_back` should use stable diagnostic identity where machine consumption or long-term filtering benefits from it.

### EG07-005 — Machine Classification Must Not Depend Solely on Rendered Log Text
Tooling should classify events through structured fields such as event identity and severity rather than scraping prose.

---

## 03. Severity and Ownership

### EG07-006 — Leyforge Uses a Small Consistent Severity Vocabulary
The baseline is TRACE, DEBUG, INFO, WARN, ERROR and FATAL.

### EG07-007 — Severity Reflects Consequence
Severity is based on engineering consequence rather than emphasis.

### EG07-008 — Diagnostic Events Identify Their Owning Subsystem
Events should expose the subsystem or module that owns the behaviour.

---

## 04. Identity, Spatial Context and Versions

### EG07-009 — Consequential Diagnostics Use Stable Entity Identity
Where authoritative entities are involved, diagnostics should include stable IDs.

### EG07-010 — Spatial Diagnostics Identify Their Coordinate Domain
World, region, chunk, voxel, local and screen coordinates must be distinguishable where relevant.

### EG07-011 — Persistence and Worldgen Diagnostics Expose Relevant Version Domains
Relevant game, save-schema, worldgen, registry-schema, content, migration or plugin/API versions are included when needed.

### EG07-012 — Procedural Failures Record Reproducible Seed Context
Worldgen and procedural failures record relevant seed, derived seed, generation version, generator identity, location and configuration.

---

## 05. Correlation and Causality

### EG07-013 — Multi-Stage Operations Use Correlation Identity Where Valuable
Transactions, migrations, generation jobs and network requests may use correlation IDs.

### EG07-014 — Diagnostics Preserve Causal Relationships Where Practical
Failure chains should remain discoverable.

### EG07-015 — Complex Authoritative Systems Expose Why Consequential Decisions Were Made
Simulation and automation systems should expose meaningful decision reasons where that improves diagnosis.

---

## 06. High-Frequency Diagnostics

### EG07-016 — High-Frequency Systems Must Not Emit Unrestricted Per-Frame Logs
Use sampling, aggregation, rate limiting, TRACE-only detail or targeted inspection.

### EG07-017 — Repeating Failures Are Aggregated Without Hiding Persistence
Preserve first occurrence, representative context, repeat count, duration and recovery/last occurrence where useful.

### EG07-018 — Throttling Must Not Erase Significant State Transitions
Rate limiting preserves meaningful transitions.

### EG07-019 — INFO Is Reserved for Meaningful Lifecycle Events
INFO is not routine function-entry spam.

### EG07-020 — DEBUG and TRACE Serve Different Detail Levels
DEBUG supports routine investigation; TRACE is intentionally more verbose.

---

## 07. Context and Deterministic Safety

### EG07-021 — Diagnostic Context Scopes May Enrich Nested Events Automatically
Context scopes may carry world, entity and transaction identifiers.

### EG07-022 — Enabling Diagnostics Must Not Alter Authoritative Outcomes
Diagnostics must not change deterministic random streams, ordering, resource results or worldgen outcomes.

### EG07-023 — Timing-Sensitive Diagnostics Account for Observer Effects
Deep tracing overhead must be distinguished from normal execution.

---

## 08. Assertions and Error Translation

### EG07-024 — Failed Assertions Produce Useful Diagnostic Context
Internal invariant failures should include relevant system, state, identity, version and location context.

### EG07-025 — Major Boundaries Translate Low-Level Errors into Meaningful System Diagnostics
Higher-level meaning is added without losing the underlying technical cause.

### EG07-026 — Error Translation Must Preserve Original Failure Information
Wrapping must not destroy root-cause detail.

---

## 09. State Inspection and Development Mutation

### EG07-027 — Authoritative Systems Should Expose Read-Only Diagnostic Inspection Where Useful
Important systems may support structured inspection.

### EG07-028 — Diagnostic Inspection Is Read-Only by Default
Inspection must not bypass ownership.

### EG07-029 — Diagnostic Mutation Is Explicit and Development-Only Unless Otherwise Designed
Teleports, grants and forced states remain explicit development capabilities.

### EG07-030 — Diagnostic Commands Are Discoverable and Documented
Useful commands should identify name, purpose, arguments, availability and risk.

---

## 10. Debug Overlays and Metrics

### EG07-031 — Complex Spatial and Simulation Systems May Expose Dedicated Overlays
Examples include chunk boundaries, simulation tiers, routes, ownership, reservations, worldgen regions and LOD state.

### EG07-032 — Diagnostic Overlays Derive from Real Authoritative or Diagnostic State
Overlays must not maintain shadow truth.

### EG07-033 — Repeated System Health Is Often Better Represented as Metrics Than Logs
Counters, gauges and distributions should be used where appropriate.

### EG07-034 — Metrics Have Defined Semantics
Each important metric defines what it measures.

### EG07-035 — Metrics Do Not Become Alternate State Owners
Metrics observe rather than own truth.

---

## 11. Profiling, Snapshots and Recent History

### EG07-036 — Performance-Critical Systems May Expose Scoped Profiling Points
Profiling hooks may instrument worldgen, meshing, simulation, routing and persistence.

### EG07-037 — Difficult Failures May Produce Structured Diagnostic Snapshots
Snapshots capture relevant state, versions, seed, queues and recent events.

### EG07-038 — Diagnostic Snapshots Are Scoped
Capture enough to diagnose without dumping the entire world.

### EG07-039 — Critical Systems May Retain Bounded Recent Diagnostic History
Bounded ring buffers may retain recent transactions, chunk events or migration stages.

---

## 12. Crash Context and Support Bundles

### EG07-040 — Crashes Preserve the Best Available Diagnostic Context
Where feasible include build/commit, platform, versions, world/realm identity, seed, stack and recent subsystem context.

### EG07-041 — Leyforge Should Eventually Produce Bounded Support Bundles
Bundles may include logs, metadata, configuration, crash reports, snapshots and safe world metadata.

### EG07-042 — Support Bundles Minimise Private and Sensitive Data
Collect only what diagnosis requires.

### EG07-043 — Credentials and Secrets Are Prohibited from Normal Diagnostics
Secrets must never appear in normal logs or bundles.

### EG07-044 — User-Generated Content Is Logged Conservatively
Prefer stable IDs and limited metadata over indiscriminate user text.

---

## 13. Remote Telemetry Boundary

### EG07-045 — Local Observability Does Not Authorise Remote Telemetry
Generating local diagnostics is separate from transmitting data externally.

### EG07-046 — Diagnostic Systems Must Not Silently Transmit Data Externally
Remote crash upload, analytics or telemetry requires separately governed mechanisms.

---

## 14. Log Storage and Verbosity

### EG07-047 — Persistent Logs Use Bounded Retention
Use rotation, size/file-count limits or retention windows.

### EG07-048 — Rotation Preserves Recent Failure Context
Recent pre-crash and recovery history should remain available.

### EG07-049 — Diagnostic Outputs Use Predictable Locations
Logs, crash data, bundles and benchmarks should be easy to locate.

### EG07-050 — Verbosity May Differ by Build Profile Without Changing Behaviour
Development, release and support profiles may expose different detail levels.

### EG07-051 — Diagnostic Categories Should Be Selectively Enableable
Filtering by severity, subsystem, world, entity or correlation identity is supported where practical.

### EG07-052 — Expensive Diagnostic Modes Are Opt-In and Clearly Identified
High-cost tracing must be explicit.

---

## 15. Diagnostics and Testing

### EG07-053 — Automated Tests Use Structured Diagnostics to Improve Failure Reports
Capture relevant event history, IDs, seeds, versions and state where useful.

### EG07-054 — Stable Diagnostic Events May Be Tested as Operational Contracts
Test structured semantics rather than brittle prose.

### EG07-055 — Logging an Error Does Not Count as Handling the Error
The owning system must still return, rollback, recover, stop or otherwise handle failure.

---

## 16. Warnings and Certification

### EG07-056 — Recurring Warning Families Have Identifiable Ownership
Persistent warnings must not become anonymous noise.

### EG07-057 — Normal Supported Execution Has a Clean Diagnostic Baseline
Healthy execution should not emit large volumes of expected warnings.

### EG07-058 — Unexplained ERROR and FATAL Events Block Relevant Certification
They require disposition at sign-off boundaries.

---

## 17. Project Brain Integration

### EG07-059 — Repeated Meaningful Failure Signatures May Become Brain Knowledge
Important recurring failures may be promoted into Failure or Antipattern records.

### EG07-060 — Useful Diagnostic Procedures May Become Reusable Skills or Procedures
Repeatable debugging workflows should be captured where valuable.

### EG07-061 — Machine-Generated Health May Feed Brain Dashboards
Build, migration, diagnostic-error, quarantine and benchmark health may be surfaced from automation.

---

## 18. Diagnostic Schema Compatibility

### EG07-062 — Machine-Consumed Diagnostic Schemas Require Version Consideration
Event fields, IDs, bundle schemas and metric schemas become governed interfaces where tooling depends on them.

### EG07-063 — Compatibility Guarantees Are Proportional
Informal developer messages are not forever APIs; stable operational contracts receive stronger guarantees.

### EG07-064 — Logs Do Not Become an Authoritative State Database
Current truth comes from owning systems.

### EG07-065 — Important Diagnostic Identities Should Cross-Reference Tests, Incidents and Documentation
Operational events should link naturally into the governance/Brain network.

---

## 19. Reproduction and Recovery

### EG07-066 — Reproduction Metadata Is Auto-Filled Where Practical
Bug/support tooling should populate known build, commit, version, world, seed and platform context.

### EG07-067 — Graceful Degradation Is Observable
Fallback behaviour should be visible where important.

### EG07-068 — Recovery Events Are Explicitly Diagnostic
Successful recovery remains observable.

### EG07-069 — Error Reporting Preserves Root-Cause Chains
Diagnostics help distinguish symptom from cause.

### EG07-070 — Player-Facing and Engineering Error Layers Are Distinct
Player messages remain clear while engineering diagnostics preserve technical detail.

---

## 20. Diagnostic Infrastructure Safety

### EG07-071 — Diagnostics Fail Safely
Failure to emit noncritical diagnostics should not normally crash authoritative simulation.

### EG07-072 — Diagnostic Failure Cannot Recurse Without Bound
Logging failures require bounded fallback behaviour.

### EG07-073 — Observability Overhead Is Measurable
Logging, tracing, metrics and snapshots are subject to performance verification where relevant.

### EG07-074 — Critical Diagnostic Infrastructure Is Tested
Rotation, redaction, serialization, crash context, bundles, filtering and rate limiting receive verification.

### EG07-075 — Inadequate Visibility May Be Tracked as Observability Debt
Important systems with insufficient diagnosis capability may record explicit observability debt.

---

## Closing Principle

Leyforge observability exists to expose meaningful system truth.

Diagnostics are structured, attributable and reproducible. High-frequency noise is controlled. Identity, coordinates, seed and version context are explicit where needed. Complex simulation decisions are explainable. Inspection is read-only by default. Recovery and degradation are visible. Logs are bounded and privacy-aware. Local diagnostics never silently become telemetry. Machine-consumed schemas are governed. Diagnostic infrastructure does not alter authoritative outcomes and never replaces authoritative state ownership.

Useful failures and debugging procedures should become reusable project knowledge so the project gets easier to diagnose over time rather than repeatedly rediscovering the same lessons.
