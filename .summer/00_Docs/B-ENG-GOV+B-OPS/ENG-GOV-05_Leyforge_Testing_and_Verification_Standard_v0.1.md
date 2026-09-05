# ENG-GOV-05 — Leyforge Testing & Verification Standard

**Document ID:** ENG-GOV-05  
**Title:** Leyforge Testing & Verification Standard  
**Version:** v0.1  
**Status:** THEORETICALLY LOCKED  
**Authority Domain:** Engineering Governance — Testing & Verification  
**Parent Authority:** ENG-GOV-00 — Leyforge Engineering Constitution  
**Related Standards:** ENG-GOV-01, ENG-GOV-04, ENG-GOV-06, ENG-GOV-08, ENG-GOV-09, ENG-GOV-10, ENG-GOV-12  
**Project:** Leyforge

---

## 00. Purpose and Scope

ENG-GOV-05 defines how Leyforge produces verification evidence for code, data, simulation, persistence, procedural generation, integrations, performance-sensitive behaviour and player-facing functionality.

Testing exists to protect declared behaviour, requirements, invariants, regressions, architecture contracts and compatibility obligations.

Passing tests do not establish universal correctness. Each test provides bounded evidence about the behaviour it actually exercises.

---

## 01. Verification Layers

### EG05-001 — Testing Exists to Produce Evidence About Authoritative Behaviour

Tests should identify the requirement, invariant, regression, architecture contract, persistence rule, security expectation or performance obligation they protect.

### EG05-002 — Passing Tests Establish Bounded Evidence

A passing suite proves only what it actually exercises.

High test counts and coverage percentages do not replace meaningful requirement coverage.

### EG05-003 — Leyforge Uses Complementary Verification Layers

Leyforge may use:

```text
STATIC / SCHEMA VALIDATION
UNIT / PURE LOGIC
COMPONENT / SUBSYSTEM
INTEGRATION
SCENARIO / END-TO-END
MIGRATION / RECOVERY
SOAK / STRESS / HOSTILE
PERFORMANCE
MANUAL / VISUAL / FEEL / ACCESSIBILITY
```

Risk and semantics determine which layers apply.

### EG05-004 — Invalid Data Should Be Rejected Before Runtime Where Practical

Machine-detectable defects such as duplicate IDs, broken references, invalid schemas, impossible ranges, invalid recipes and forbidden dependencies should be detected before runtime when practical.

### EG05-005 — Pure Deterministic Logic Receives Focused Unit Verification

Algorithms such as ID parsing, transaction math, capability evaluation, migration helpers, state transitions and deterministic calculations should receive fast focused tests where practical.

### EG05-006 — Subsystems Are Tested Through Their Owned Public Behaviour

Component tests should exercise subsystem contracts rather than rely unnecessarily on private implementation detail.

### EG05-007 — Cross-System Contracts Require Integration Tests

Important boundaries such as registry↔runtime, save↔simulation, worldgen↔streaming, inventory↔automation, settlement↔construction and Forge↔runtime require explicit integration evidence.

### EG05-008 — Critical Flows Receive Scenario-Level Verification

Important end-to-end system journeys should be exercised as scenarios when full integration matters.

### EG05-009 — End-to-End Testing Is Selective

Full-game tests are reserved for behaviour that benefits from full integration. Most logic should be proven lower in the stack where failures are faster and easier to diagnose.

---

## 02. Invariants, Procedural Systems and Determinism

### EG05-010 — Important Invariants Are Tested Across Broad Input Ranges

Conservation, identity uniqueness, legal worldgen placement, migration integrity and similar invariants should use broad property-style verification where practical.

### EG05-011 — Procedural Systems Require Seed-Corpus Verification

World generation and other procedural systems must not be certified using a single showcase seed.

Leyforge should maintain fast, integration-scale and deeper statistical seed corpora appropriate to the system.

### EG05-012 — Important Seed Corpora Remain Stable Enough to Detect Regression

Known seeds representing edge cases, historical failures, rare interactions and stress conditions should remain reproducible.

### EG05-013 — Stable Corpora May Be Supplemented by Exploratory Seeds

Random or rotating seeds may discover new failures.

A seed that exposes a consequential defect should be promoted into a permanent regression fixture.

### EG05-014 — Deterministic Tests Control Nondeterministic Inputs

Tests should control seeds, clocks, ordering, configuration, content versions and generation versions where those values affect results.

### EG05-015 — Randomised Failures Must Be Exactly Reproducible

Randomised tests must report sufficient information to reproduce the failing case, including the seed and relevant configuration.

---

## 03. Persistence, Migration and Identity

### EG05-016 — Persistent Authoritative Systems Require Save/Reload Verification

Persistence tests compare authoritative state before save with authoritative state after destruction and reload of runtime state.

Checking only that a file exists is insufficient.

### EG05-017 — Persistence Tests Cover Non-Idle States

Where applicable, save/reload verification includes active construction, in-flight automation, tasks, reservations, damaged structures, modified chunks and other meaningful transient states.

### EG05-018 — Save Systems Require Interruption and Recovery Tests

Critical persistence paths must be tested against interrupted writes, invalid candidates, failed replacement and migration failure where relevant.

Expected results are valid recovery or explicit safe failure, never silent corruption.

### EG05-019 — Supported Migration Paths Require Archived Fixtures

Supported old save versions require meaningful fixtures that can be migrated, validated and loaded.

### EG05-020 — Multi-Version Migration Chains Must Be Tested

If old saves may migrate through several schema versions, the real supported migration chain must be exercised.

### EG05-021 — Migration Must Not Reapply Destructive Transformation Accidentally

Where retry/reopen behaviour is possible, migrations should be tested for safe idempotent or appropriately guarded behaviour.

### EG05-022 — Persistence Verification Explicitly Checks Stable Identity

Tests should verify preservation of relevant NPC, settlement, world, structure, item, transaction and registry identities where applicable.

---

## 04. Conservation, Boundaries and Invalid Input

### EG05-023 — Resource-Moving Systems Require Conservation Verification

Systems handling items, energy, mana, currency, fluids, cargo and construction resources must verify conservation across success, failure, blockage, cancellation, concurrency and reload where applicable.

### EG05-024 — Important Limits Receive Boundary-Value Tests

Limits should be tested at, below and above their meaningful thresholds.

### EG05-025 — Public and Trust Boundaries Receive Invalid-Input Tests

Malformed fields, unknown IDs, oversized input, duplicates, bad packages and invalid requests should be tested deliberately.

### EG05-026 — High-Risk Boundaries Receive Hostile Verification

Class D/E work should actively test duplication, interruption, ordering, missing state, conflicting claims, unload/reload and process failure where relevant.

---

## 05. Concurrency and Streaming

### EG05-027 — Concurrent Authoritative Operations Require Race-Condition Testing

Concurrency tests should cover competing reservations, simultaneous mutation, save-vs-simulation, unload-vs-completion and equivalent race-prone interactions.

### EG05-028 — Concurrency Tests Vary Execution Ordering Where Practical

Repeated execution, forced yields, delay injection and alternate worker counts may be used to expose timing-dependent defects.

### EG05-029 — Simulation-Tier Transitions Require Reconciliation Tests

Near↔far simulation transitions must preserve authoritative state and declared conservation rules.

### EG05-030 — Streamed Systems Are Tested Across Load/Unload Boundaries

Voxel edits, NPCs, machines, construction, structures and persistent actors should be exercised across unload, simulation advance and reload where applicable.

---

## 06. Headless, Packaged and Smoke Verification

### EG05-031 — Suitable Logic Supports Headless Verification

Registry, migration, procedural generation, simulation and deterministic tests should support headless execution where practical.

### EG05-032 — Headless Success Does Not Replace Real-Renderer or Packaged Verification

Renderer, export, packaging, resource and input failures require real-window or packaged-build verification where applicable.

### EG05-033 — Meaningful Builds Have a Fast Smoke Path

A smoke path should quickly verify boot, basic movement/interaction, registry loading, critical UI and representative save/reload functionality where relevant.

### EG05-034 — Smoke Testing Must Remain Fast

Smoke suites must remain bounded enough that contributors actually run them.

---

## 07. Manual and Player-Facing Verification

### EG05-035 — Automated Tests Do Not Replace Manual Acceptance for Human-Perceived Qualities

Movement feel, UI clarity, visual communication, combat impact, animation quality, accessibility perception and similar qualities require manual review.

### EG05-036 — Manual Acceptance Uses Structured Scenarios

Manual testing should define setup, steps, expected observations, failure evidence and repeat/reload conditions rather than relying on vague exploratory instructions alone.

### EG05-037 — Player-Facing Features Maintain Their Manual Acceptance Paths

New systems such as boats, Forge editors, realm travel and multiplayer should add appropriate manual acceptance coverage.

### EG05-038 — Reusable Visual and System Laboratories Are Encouraged

Controlled environments such as visual test rooms, settlement labs, worldgen browsers, Forge preview labs, combat arenas and save recovery labs are encouraged.

### EG05-039 — Accessibility Requirements Receive Dedicated Verification

Keyboard-only, controller-only, focus navigation, text scaling, non-colour cues, captions, reduced motion, reduced flashing and related requirements should be verified where applicable.

### EG05-040 — Critical Player Flows Are Tested Across Supported Input Families

Supported input methods must be exercised for critical workflows.

### EG05-041 — UI Verification Compares Displayed State with Authoritative State

Important displayed values and blockers should be checked against the authoritative system truth they represent.

---

## 08. Performance, Soak and Fault Injection

### EG05-042 — ENG-GOV-05 Defines Performance-Test Obligation; ENG-GOV-10 Defines Benchmark Methodology

ENG-GOV-05 determines when performance evidence is required.

ENG-GOV-10 defines benchmark construction, calibration and interpretation.

### EG05-043 — Long-Lived Simulations Require Soak Testing

Large settlements, factories, repeated saves, long sessions, streaming cycles and equivalent systems should be tested for memory growth, state drift, resource leakage, queue accumulation and degradation.

### EG05-044 — Long-Term Behaviour May Use Accelerated Simulation

Accelerated testing is permitted when it preserves the authoritative simulation semantics under examination.

### EG05-045 — Critical Systems Should Support Deliberate Fault Injection Where Useful

Persistence, async, network and other recovery-sensitive systems may inject controlled failures to prove rarely exercised recovery paths.

---

## 09. Regression, Flakiness and Test Integrity

### EG05-046 — Consequential Fixed Defects Receive Regression Tests Where Practical

Preferred defect flow:

```text
reproduce
→ failing verification
→ fix
→ passing verification
→ retained regression test
```

### EG05-047 — Regression Tests Reproduce the Actual Failure Mechanism

A regression should exercise the scenario that failed, not merely an unrelated low-level approximation.

### EG05-048 — Flaky Tests Are Defects

Intermittent failure must be investigated as a test, environment, timing or production nondeterminism defect.

### EG05-049 — Flaky-Test Quarantine Is Temporary and Controlled

Quarantine requires the affected test, reason, evidence, risk, tracking record and reconsideration/expiry condition.

### EG05-050 — Quarantined Tests Remain Visible

Health reporting should distinguish passing, failing, quarantined and explicitly disabled tests.

### EG05-051 — Tests Must Not Be Silently Disabled to Make a Change Pass

A broken valid test requires a code fix or an explicit authority-backed requirement change.

### EG05-052 — Test Changes Alongside Behaviour Require Semantic Review

Expected results must not be changed merely to match whatever the new implementation happens to return.

### EG05-053 — Test Code Is Production Engineering Infrastructure

Tests must be readable, maintainable, diagnostic and appropriately deterministic.

### EG05-054 — Tests Should Not Depend on Execution Order Unless Ordering Is the Subject Under Test

Each test should establish controlled preconditions.

### EG05-055 — Verification Must Not Contaminate Normal Player or Developer State

Tests should use isolated worlds, profiles, fixtures, sandboxes and temporary directories where appropriate.

---

## 10. Fixtures, Golden Data and Coverage

### EG05-056 — Fixtures Are Versioned Test Assets with Explicit Purpose

Fixtures should identify what they represent, which version they target, who owns them and whether they may be regenerated.

### EG05-057 — Golden Outputs Are Permitted When Semantic Stability Justifies Them

Golden data may verify deterministic manifests, serialization, worldgen metadata and similar outputs where diffs remain understandable.

### EG05-058 — Screenshot Testing Supplements Rather Than Replaces Visual Review

Screenshot comparison may detect large regressions but must account for platform, font and renderer variability.

### EG05-059 — Coverage Is Diagnostic Evidence, Not a Quality Target

Coverage may reveal suspicious untested areas but does not by itself establish test quality.

### EG05-060 — Stronger Test-Quality Techniques May Be Used Where Justified

Property testing, fuzzing, mutation testing and differential testing are permitted for systems where their value justifies the cost.

---

## 11. Test Cost and CI Allocation

### EG05-061 — Verification Is Classified by Execution Cost

Conceptual classes include:

```text
FAST
INTEGRATION
DEEP
MANUAL
```

### EG05-062 — Contributors Run Focused Verification Before Integration

Changed-module tests, affected integration tests and relevant validators should be run before requesting integration.

### EG05-063 — CI Allocates Test Depth by Event and Risk

Fast/relevant checks run frequently; broader checks run on mainline, scheduled or release events as defined by ENG-GOV-06.

---

## 12. Change-Risk Verification

### EG05-064 — Class A Changes Receive Proportionate Lightweight Verification

Low-risk changes may require only relevant static, formatting or focused checks.

### EG05-065 — Class B Changes Require Behavioural Regression Evidence

System-level work typically requires focused, subsystem and affected integration verification.

### EG05-066 — Class C Changes Require Contract and Integration Verification

Architectural work must examine public interfaces, dependency boundaries and ADR acceptance criteria.

### EG05-067 — Class D Changes Require Compatibility Evidence

Persistence/identity work requires applicable old fixtures, migration, save/reload, identity and recovery verification.

### EG05-068 — Class E Changes Require Hostile and Independent Verification

Critical foundation work adds hostile, stress, soak, race and independent verification as applicable.

---

## 13. Evidence and Failure Reporting

### EG05-069 — High-Value Tests Produce Reproducible Evidence

Where relevant, evidence includes build/commit, version domains, scenario/test ID, seed, configuration, hardware class, commands, result, logs and known deviations.

### EG05-070 — Failures Capture Reproduction Context Automatically Where Practical

Failure output should preserve enough context to reproduce the defect.

### EG05-071 — Suites Should Report Root Failures Clearly

Primary failures should not be buried beneath cascades of meaningless derivative errors.

### EG05-072 — Known Test Limitations Must Be Explicit

A test must not be presented as proof of behaviour it cannot assess.

### EG05-073 — Every Sign-Off Failure Requires a Disposition

At sign-off boundaries, each failure is fixed, approved for deferral with reason/risk, or documented as a known limitation.

### EG05-074 — Manual Acceptance Requires Actual Manual Completion

Manual verification cannot be inferred from automated success.

### EG05-075 — AI Agents Distinguish Executed, Unexecuted and Manual Verification

Agent reports must state what was run, what was not run and what still requires manual review.

### EG05-076 — AI-Authored Tests Do Not Independently Validate AI-Authored High-Risk Implementation

Higher-risk work requires independent evidence beyond the producing agent's self-authored tests.

### EG05-077 — Generated Test Cases Preserve Failure Diagnosis

Generated cases must identify the specific case, seed/input, expected invariant and actual result when failing.

---

## 14. Test Ownership and Lifecycle

### EG05-078 — Consequential Test Suites Have an Identifiable Owning System

Test ownership should mirror architectural ownership.

### EG05-079 — Removing Tests Requires Understanding Why They Existed

Tests should be removed only when their requirement, architecture, compatibility obligation or replacement status is understood.

### EG05-080 — Superseded Verification Is Removed or Archived Deliberately

Historical tests should be classified as migrated regression evidence, historical reference or obsolete due to superseded architecture.

### EG05-081 — POC Verification Patterns Are Reused Selectively

Useful proven patterns such as conservation checks, save/reload checkpoints, seed sweeps, visual labs, packaged benchmarks and structured manual smoke tests should be carried into V1 where still relevant.

Superseded Summer-engine assumptions are not imported automatically.

### EG05-082 — Critical Requirements Should Be Able to Identify Their Verification Evidence

Long-term traceability should connect requirements and invariants to test IDs and current evidence.

### EG05-083 — Verification Dashboards Derive from Evidence

Status indicators should be backed by real results rather than manual confidence labels.

### EG05-084 — Missing Verification May Be Tracked as TEST-DEBT

Known missing verification can be tracked explicitly with affected invariant, current evidence and required future coverage.

### EG05-085 — Test Debt Becomes Blocking Where Manual Evidence Cannot Safely Protect the Invariant

High-risk areas such as migration, duplication, stable identity, network authority and security cannot rely indefinitely on informal confidence.

### EG05-086 — Feature Work Maintains Its Verification Ecosystem

Intentional behaviour changes should update relevant code, tests, fixtures and manual guides together.

### EG05-087 — Verification Stops When Risk-Appropriate Confidence Is Achieved

Testing is not infinite.

Sufficiency is determined by risk, requirements, known failure modes and available evidence.

---

## Leyforge Verification Model

```text
                    MANUAL / VISUAL / FEEL
                           ▲
                    CRITICAL SCENARIOS
                           ▲
                      INTEGRATION
                           ▲
                 COMPONENT / SUBSYSTEM
                           ▲
           UNIT / PROPERTY / STATIC / SCHEMA
```

Specialised verification runs alongside the hierarchy:

```text
MIGRATION
SAVE / RECOVERY
SEED CORPUS
CONCURRENCY
SOAK / STRESS
SECURITY / HOSTILE
PERFORMANCE
ACCESSIBILITY
PACKAGED BUILD
```

---

## Risk-Class Direction

| Risk Class | Verification Direction |
|---|---|
| A — Local | focused/static validation |
| B — System | focused + subsystem + affected integration |
| C — Architectural | B + contract/integration + ADR evidence |
| D — Persistence / Identity | C + migration + old fixtures + save/reload + recovery |
| E — Critical Foundation | D as applicable + hostile/stress/soak/concurrency + independent verification |

The matrix defines a minimum direction rather than a mechanical checklist.

Semantics determine applicable tests.

---

## Closing Principle

Leyforge verification exists to create trustworthy evidence.

Tests protect requirements and invariants, not vanity metrics.

Fast deterministic tests carry most routine volume.

Integration and scenario testing protect boundaries.

Persistence testing proves recovery and compatibility, not merely file creation.

Procedural systems use reproducible seed evidence.

Flaky tests remain defects.

Manual acceptance remains essential for human-perceived quality.

High-risk changes receive materially stronger verification.

And testing stops when risk-appropriate confidence is achieved rather than expanding without end.
