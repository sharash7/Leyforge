# B-OPS-00 — Leyforge Engineering Governance Index & Authority Map

**Document ID:** B-OPS-00  
**Title:** Leyforge Engineering Governance Index & Authority Map  
**Version:** v0.1  
**Status:** OPERATIONALISATION BASELINE  
**Branch:** Branch B — Engineering Governance  
**Parent Corpus:** ENG-GOV-00 through ENG-GOV-15  
**Project:** Leyforge

---

## 00. Purpose

B-OPS-00 is the navigation and authority entry point for the Leyforge Engineering Governance system.

It does not replace or duplicate the governing standards.

It answers:

- What engineering authority applies?
- Which document owns a rule?
- Which standards interact?
- What is the current risk model?
- Where do ADRs, AGENTS files, the Project Brain, validators, tests and CI fit?
- What should a contributor or coding agent read before consequential work?

The governing principle is:

> ENG-GOV defines the laws. B-OPS operationalises them. The Brain navigates them. ADRs preserve architectural rationale. AGENTS files give operational instructions. Validators, tests and CI enforce what can be enforced.

---

# 01. Authority Hierarchy

```text
LEYFORGE CANON / PRODUCT AUTHORITY
        ↓
ENG-GOV-00 — Engineering Constitution
        ↓
ENG-GOV-01 through ENG-GOV-15
        ↓
CURRENT ARCHITECTURE / ADRS
        ↓
ROOT + LOCAL AGENTS.md
        ↓
IMPLEMENTATION / TESTS / TOOLS / CI
```

The Project Brain sits alongside this hierarchy as the navigation, status and reusable-knowledge layer.

It does not become a second authority corpus.

### Authority Rules

1. Canon/product authority defines what Leyforge is required to be.
2. ENG-GOV-00 defines the engineering constitution.
3. ENG-GOV-01–15 specialise engineering law by domain.
4. ADRs select architecture within canon and ENG-GOV constraints.
5. Architecture documents describe current implementation architecture.
6. AGENTS files operationalise applicable rules for coding agents.
7. Validators, tests and CI provide enforcement/evidence.
8. The Project Brain indexes, links and surfaces current state without rewriting source authority.

Document numbering does not imply precedence between ENG-GOV-01–15.

A more specific applicable standard may specialise a general standard but cannot contradict higher authority.

---

# 02. Core Governance Corpus

## ENG-GOV-00 — Engineering Constitution

**Status:** Theoretically Locked  
**Role:** Constitutional root for all engineering governance.

Primary themes:

- canon integrity
- stable identity
- authoritative state
- conservation
- determinism
- persistence compatibility
- architecture history
- testing
- integration health
- complexity discipline
- AI accountability
- upstream discipline
- explicit exceptions
- deprecation lifecycle
- traceability
- Project Brain integration
- trust boundaries
- operational enforcement

Key risk classes and enforcement tags originate here.

---

## ENG-GOV-01 — Codebase Engineering Standard

**Status:** Theoretically Locked  
**Primary Domain:** source architecture and code correctness.

Owns:

- authoritative state ownership
- dependency direction
- failure semantics
- explicit transitions
- determinism
- time/RNG ownership
- concurrency/resource pairing
- hidden-global restrictions
- configuration ownership
- complexity discipline
- code completion evidence

Interfaces strongly with:

- ENG-GOV-05 testing
- ENG-GOV-07 diagnostics
- ENG-GOV-11 ADRs
- ENG-GOV-12 agents

---

## ENG-GOV-02 — Repository & Module Structure Standard

**Status:** Theoretically Locked  
**Primary Domain:** repository layout and ownership boundaries.

Owns:

- monorepo structure
- module boundaries
- Brain/docs separation
- upstream/third-party boundaries
- generated/schema/tooling locations
- dependency direction at repository level

Interfaces strongly with:

- ENG-GOV-04 Git/change
- ENG-GOV-11 ADR
- ENG-GOV-12 agents
- ENG-GOV-15 upstream integration

---

## ENG-GOV-03 — Source Style & Naming Standard

**Status:** Theoretically Locked  
**Primary Domain:** source conventions and semantic naming.

Owns:

- formatting baseline
- GDScript naming
- stable-ID/display-name separation
- unit/time/space naming
- comment/TODO rules
- cross-language terminology
- generated-source style treatment

Interfaces strongly with:

- ENG-GOV-01 codebase engineering
- ENG-GOV-09 stable identity
- ENG-GOV-12 agent implementation behaviour

---

## ENG-GOV-04 — Git / Branch / Change Standard

**Status:** Theoretically Locked  
**Primary Domain:** version-control workflow and change archaeology.

Owns:

- protected healthy main
- task branches/worktrees
- commit coherence
- branch naming
- destructive Git restrictions
- permission separation
- review expectations
- conflict resolution
- hotfix/revert behaviour
- traceability

Interfaces strongly with:

- ENG-GOV-06 CI
- ENG-GOV-11 ADR
- ENG-GOV-12 agents
- ENG-GOV-14 exceptions

---

## ENG-GOV-05 — Testing & Verification Standard

**Status:** Theoretically Locked  
**Primary Domain:** evidence that requirements/invariants are protected.

Owns:

- unit/subsystem/integration/scenario/property testing
- determinism testing
- save/reload verification
- migration fixtures
- hostile testing
- concurrency testing
- near/far simulation verification
- manual/visual verification
- flaky-test handling
- verification traceability
- risk-based evidence strength

Interfaces strongly with:

- ENG-GOV-06 CI
- ENG-GOV-08 persistence
- ENG-GOV-09 registry
- ENG-GOV-10 performance
- ENG-GOV-13 security

---

## ENG-GOV-06 — CI / Quality Gate Standard

**Status:** Theoretically Locked  
**Primary Domain:** continuous integration and automated gate policy.

Owns:

- change/main/scheduled/release horizons
- REQUIRED/ADVISORY/INFORMATIONAL semantics
- local/CI command parity
- deterministic environments
- secrets/least privilege in CI
- registry/persistence/build gates
- flaky handling
- artifact retention
- gate weakening restrictions
- certification evidence

Interfaces strongly with:

- ENG-GOV-05 testing
- ENG-GOV-07 diagnostics
- ENG-GOV-10 performance
- ENG-GOV-12 agents
- ENG-GOV-14 waivers

---

## ENG-GOV-07 — Diagnostics / Logging / Observability Standard

**Status:** Theoretically Locked  
**Primary Domain:** structured observability and reproducibility.

Owns:

- structured diagnostic events
- severity semantics
- subsystem ownership
- stable diagnostic IDs
- seed/version/spatial context
- causal chains
- rate limiting
- metrics
- state inspection
- debug overlays
- snapshots
- crash context
- support bundles
- local telemetry boundary
- diagnostic-schema compatibility

Interfaces strongly with:

- ENG-GOV-05 tests
- ENG-GOV-06 CI
- ENG-GOV-08 persistence
- ENG-GOV-10 performance
- ENG-GOV-13 security

---

## ENG-GOV-08 — Save / Schema / Migration Standard

**Status:** Theoretically Locked  
**Primary Domain:** persistence safety and long-lived world compatibility.

Owns:

- save schema/version domains
- atomic/candidate commit behaviour
- recovery
- integrity
- migration chains
- historical fixtures
- active transaction persistence
- worldgen provenance
- content provenance
- unsupported-version handling
- save compatibility retirement
- persistence risk classification

Interfaces strongly with:

- ENG-GOV-05 testing
- ENG-GOV-06 CI
- ENG-GOV-07 diagnostics
- ENG-GOV-09 stable identity
- ENG-GOV-11 ADR
- ENG-GOV-14 deprecation
- ENG-GOV-15 third-party persistence

---

## ENG-GOV-09 — Registry / Stable Identity Standard

**Status:** Theoretically Locked  
**Primary Domain:** machine identity and authoritative registry definitions.

Owns:

- stable IDs
- namespaces
- single-definition rule
- Block/Object/Item projection model
- generated/derived forms
- aliases
- lifecycle/retirement
- package provenance
- reference integrity
- deterministic registry load
- capability/provider/recipe contracts
- Forge/runtime registry unification

Interfaces strongly with:

- ENG-GOV-03 naming
- ENG-GOV-06 CI
- ENG-GOV-08 persistence
- ENG-GOV-12 agents
- ENG-GOV-13 player content

---

## ENG-GOV-10 — Performance / Benchmark Standard

**Status:** Theoretically Locked  
**Primary Domain:** performance evidence, scale and regression control.

Owns:

- benchmark IDs/scenarios
- hardware/environment records
- frame-time percentiles
- hitch/tail latency
- absolute budgets
- relative regression thresholds
- profiling
- memory
- worldgen/streaming
- simulation scale
- persistence performance
- Forge responsiveness
- scaling curves
- benchmark debt/history
- performance certification

Interfaces strongly with:

- ENG-GOV-05 testing
- ENG-GOV-06 CI
- ENG-GOV-07 metrics
- ENG-GOV-11 performance ADRs
- ENG-GOV-15 dependency performance

---

## ENG-GOV-11 — Architecture Decision Record Standard

**Status:** Theoretically Locked  
**Primary Domain:** durable architecture rationale.

Owns:

- ADR identity
- lifecycle
- context/constraints
- alternatives
- rationale/evidence
- consequences/risks
- reconsideration triggers
- supersession
- reconstructed historical ADRs
- machine-readable indexing
- architecture certification

Interfaces strongly with:

- all consequential architecture standards
- Project Brain
- ENG-GOV-12 agents
- ENG-GOV-14 deprecation
- ENG-GOV-15 dependency adoption/forking

---

## ENG-GOV-12 — AI / Coding Agent Standard

**Status:** Theoretically Locked  
**Primary Domain:** Codex and coding-agent operational behaviour.

Owns:

- authority discovery
- agent autonomy
- planning
- scope discipline
- worktree safety
- multi-agent handoff
- architecture/ADR handling
- persistence/registry restrictions
- test/verification truthfulness
- Git permission model
- Brain work logs
- reusable discovery promotion
- instruction-injection protection
- stop conditions
- rebuild bootstrap behaviour

Interfaces with the entire ENG-GOV corpus.

---

## ENG-GOV-13 — Security / Player Content Boundary Standard

**Status:** Theoretically Locked  
**Primary Domain:** trust boundaries and untrusted input.

Owns:

- Forge/player-content trust model
- least privilege
- declarative vs executable extension tiers
- package activation
- path traversal/resource limits
- save/world import
- network authority
- server/client trust
- secrets
- filesystem/process/native-code boundaries
- hostile-input testing
- security debt

Interfaces strongly with:

- ENG-GOV-06 CI
- ENG-GOV-07 diagnostics
- ENG-GOV-08 persistence
- ENG-GOV-09 registry
- ENG-GOV-12 agents
- ENG-GOV-15 supply chain

---

## ENG-GOV-14 — Exceptions / Waivers / Deprecation Standard

**Status:** Theoretically Locked  
**Primary Domain:** controlled deviation and lifecycle retirement.

Owns:

- waiver/exception semantics
- temporary constraints
- quarantines
- emergency bypass
- expiry/renewal
- compensating controls
- deprecation lifecycle
- compatibility shims
- feature flags
- exception/debt linkage
- certification with exceptions
- agent exception restrictions

Interfaces with every standard that can be temporarily waived or deprecated.

---

## ENG-GOV-15 — Third-Party / Upstream Integration Standard

**Status:** Theoretically Locked  
**Primary Domain:** external engineering dependencies.

Owns:

- dependency admission
- provenance/licensing
- inventory
- version pinning
- update discipline
- Godot/Zylann treatment
- fork/patch management
- upstream sync
- adapter boundaries
- supply chain
- abandonment/replacement
- dependency persistence/API/performance risk
- upstream workarounds
- dependency Brain knowledge

Interfaces strongly with:

- ENG-GOV-02 repository boundaries
- ENG-GOV-04 Git
- ENG-GOV-05 testing
- ENG-GOV-10 performance
- ENG-GOV-11 ADR
- ENG-GOV-12 agents
- ENG-GOV-13 security
- ENG-GOV-14 deprecation

---

# 03. Operational Artifact Family

ENG-GOV is the law corpus.

The B-OPS family turns that corpus into an operational system.

```text
B-OPS-00 — Governance Index & Authority Map
B-OPS-01 — Governance Rule Enforcement Matrix
B-OPS-02 — Coding-Agent Bootstrap Contract
B-OPS-03 — Engineering Governance Templates Pack
B-OPS-04 — Project Brain ↔ Engineering Governance Interface
B-OPS-05 — Governance Debt & Validator Backlog
B-OPS-06 — Reconciliation & Certification Report
```

B-OPS does not create a new higher authority.

---

# 04. Risk Model

Risk classes are globally consistent across Branch B.

```text
A — Local
Bounded implementation change with low blast radius.

B — System
Meaningful subsystem behaviour change.

C — Architectural
Architecture/interface/ownership change with broad consequences.

D — Persistence / Identity
Save schema, stable identity, migration, persistent interpretation or equivalent long-lived compatibility risk.

E — Critical Foundation
Foundational engine/platform/security/world integrity or other change capable of systemic failure.
```

When multiple classes apply, the highest-consequence class normally governs.

Uncertainty may escalate risk.

Uncertainty never silently downgrades risk.

---

# 05. Enforcement Classes

Operational enforcement uses these classifications:

```text
AUTO
A deterministic validator can directly establish compliance.

TEST
Executed behaviour verification is required.

REVIEW
Semantic review is required.

MANUAL
Real-world/manual verification is required.

TRACE
Traceability/evidence must exist.

PROCESS
Workflow/process enforcement is required.

ADVISORY
Engineering guidance is non-blocking unless promoted.
```

A rule may use multiple enforcement classes.

A rule that cannot currently be automated is not therefore optional.

---

# 06. Enforcement Maturity

Machine enforcement maturity is:

```text
PLANNED
The rule is active, but automation does not yet exist.

PARTIAL
Some automated protection exists.

ACTIVE
Operational automation protects the relevant rule.

CERTIFIED
The enforcement mechanism has itself been verified and accepted for certification use.
```

Missing automation is represented honestly through governance debt.

---

# 07. Compliance States

Governance compliance should distinguish:

```text
COMPLIANT

COMPLIANT WITH APPROVED EXCEPTION

PARTIAL / ENFORCEMENT DEBT

NONCOMPLIANT

NOT YET APPLICABLE
```

`NOT YET APPLICABLE` is reserved for capabilities/boundaries that genuinely do not exist yet.

It is not a synonym for unfinished work.

---

# 08. Rule Ownership

Repetition across standards may reinforce the same invariant.

Where that occurs, one conceptual rule owner should remain discoverable.

Examples:

```text
Stable-ID authority
Primary owner: ENG-GOV-09
Agent operational reinforcement: ENG-GOV-12
Persistence impact: ENG-GOV-08

Migration fixture protection
Primary owner: ENG-GOV-08
Test enforcement: ENG-GOV-05
CI enforcement: ENG-GOV-06
Agent restriction: ENG-GOV-12

Security-path containment
Primary owner: ENG-GOV-13
CI enforcement: ENG-GOV-06
Agent restriction: ENG-GOV-12
```

---

# 09. Conflict Resolution

When two active rules appear to conflict:

1. Determine whether their scopes actually overlap.
2. Identify the conceptual owner.
3. Determine whether one is a more-specific specialisation.
4. Check ADR/exception/deprecation state.
5. Reconcile true contradictions explicitly.
6. Do not resolve conflict by document number.
7. True unresolved contradictions block Branch B certification.

---

# 10. Coding-Agent Authority Navigation

For consequential work, an agent should resolve context in approximately this order:

```text
TASK
 ↓
PROJECT BRAIN ENTRY / AUTHORITY MAP
 ↓
RELEVANT CANON / PRODUCT REQUIREMENT
 ↓
APPLICABLE ENG-GOV
 ↓
CURRENT LFE / FORGE-ENG ARCHITECTURE
 ↓
APPLICABLE ADRS
 ↓
PATH-LOCAL AGENTS.md
 ↓
RELEVANT SKILLS / FAILURES / PROCEDURES
 ↓
IMPLEMENTATION
```

Not every task requires reading every document.

High-risk authorities may not be omitted for convenience.

---

# 11. Root and Local AGENTS Model

The future repository should have a concise root:

```text
/AGENTS.md
```

containing universal operational rules and authority navigation.

Local files should exist only where risk warrants them.

Likely initial candidates:

```text
game/persistence/AGENTS.md
game/worldgen/AGENTS.md
registries/AGENTS.md
forge/AGENTS.md
addons/voxel/AGENTS.md
```

These files operationalise governance.

They do not redefine it.

---

# 12. Initial Operational Priorities

Before mass V1 implementation, Branch B expects at least:

```text
governance index
authority navigation
root AGENTS.md
risk model
repository-layout baseline
build entry point
test entry point
Git/worktree rules
ADR workflow
work-log workflow
initial stable-ID protection
```

Additional enforcement becomes mandatory when its affected boundary becomes real.

Examples:

```text
Persistence migration enforcement
→ before persistent V1 formats become depended upon.

Forge/package security enforcement
→ before external packages are exposed.

Network trust/abuse enforcement
→ before real multiplayer exposure.
```

---

# 13. POC Relationship

The Summer POC and other superseded implementation structures remain:

```text
evidence
behavioural reference
test inspiration
historical context
```

They are not V1 architecture authority.

POC tests may be promoted when the invariant they protect still applies.

POC implementation structure is not copied merely because old tests refer to it.

---

# 14. Foundational ADR Bootstrap

The rebuild bootstrap should reconstruct durable ADRs for already accepted major decisions.

Likely initial ADR subjects include:

```text
Godot as the V1 engine/platform
Zylann Voxel as the voxel foundation
Leyforge ↔ Zylann ownership/fork boundary
Project Brain inside the repository
Monorepo modular architecture
Registry/stable-ID architecture
Authoritative persistent-state separation
```

Reconstructed ADRs should state that they were created after the original decision from existing accepted evidence/history.

---

# 15. Foundational Dependency Records

At minimum, bootstrap dependency records should exist for:

```text
Godot
Zylann Godot Voxel
```

Additional build/runtime dependencies receive records when actually selected.

---

# 16. Project Brain Interface

Branch A owns:

```text
navigation
status
work logs
skills
patterns
failures
procedures
indexes
dashboards
```

Branch B owns:

```text
engineering rules
enforcement expectations
risk
waivers/deprecation
architecture decision protocol
agent engineering requirements
```

The Brain links to ENG-GOV/ADRs/waivers rather than rewriting them.

---

# 17. Governance Manifest Direction

The project should eventually maintain machine-readable governance state such as:

```yaml
governance_bundle: leyforge-engineering-governance
bundle_version: 0.1
standards:
  - id: ENG-GOV-00
    status: theoretically_locked
  - id: ENG-GOV-01
    status: theoretically_locked
  # ...
  - id: ENG-GOV-15
    status: theoretically_locked
```

This manifest indexes status.

It does not duplicate rule text.

---

# 18. Governance Versioning

The current corpus represents the locked theoretical baseline.

Recommended evolution:

```text
ENG-GOV v0.1
Theoretically locked

        ↓ operational reconciliation

Reconciled candidate revisions
where wording/cross-reference fixes are needed

        ↓ certification

Leyforge Engineering Governance Baseline v1.0
Certified operational corpus
```

Clarifying edits may preserve accepted semantics.

Semantic changes require explicit amendment authority.

---

# 19. Engineering Governance Glossary

## Authority
A source empowered to define requirements or engineering rules within a declared scope.

## Canon
Authoritative Leyforge product/world/game design truth.

## Stable ID
A durable machine-readable semantic identity independent of presentation naming.

## Definition
The authoritative reusable machine-readable description of a concept.

## Projection
A representation of one definition in a specific domain such as Block, Object, Item, Forge or UI.

## Instance
A specific persistent/runtime occurrence referencing a definition plus per-instance state.

## Risk Class
The consequence classification A–E used to scale scrutiny and evidence.

## Verification
Evidence that implementation satisfies a requirement or invariant.

## Certification
A formal project boundary where required evidence, rules and exceptions have been reconciled.

## Waiver
Bounded temporary permission to violate an otherwise applicable rule.

## Exception
An explicitly recognised case where a general rule does not apply.

## Deprecation
A managed state in which something remains understood/supported but is no longer preferred for new use.

## Quarantine
Temporary isolation of a known defect without declaring it solved.

## Upstream
The external project/source from which a dependency originates.

## Fork
A locally modified dependency with an explicit maintenance relationship to upstream.

## Generated
Produced from another source-of-truth and therefore not normally edited directly.

## Manual Verification
Evidence requiring real human/perceptual/environmental interaction rather than purely automated checks.

## Project Brain
The repository-resident navigation, knowledge, state and reusable-learning system for Leyforge.

---

# 20. Branch Interfaces

## Branch C — V1 Documentation Audit

Branch C may reveal missing/conflicting product authority.

It may propose explicit Branch B amendments.

It does not silently rewrite ENG-GOV.

## Branch D — Production / Rebuild Roadmap

Branch D consumes governance requirements when sequencing work.

Example:

```text
persistent worlds begin
→ persistence enforcement must activate

external packages begin
→ package security enforcement must activate

multiplayer begins
→ network trust enforcement must activate
```

---

# 21. Branch B Closure Path

```text
ENG-GOV-00 → ENG-GOV-15
        ✅ theoretically complete

B-OPS-00
Governance Index & Authority Map

B-OPS-01
Rule Enforcement Matrix

B-OPS-02
Coding-Agent Bootstrap Contract

B-OPS-03
Governance Templates Pack

B-OPS-04
Brain ↔ Governance Interface

B-OPS-05
Governance Debt & Validator Backlog

B-OPS-06
Reconciliation & Certification Report
        ↓
BRANCH B CERTIFIED
        ↓
REBUILD BOOTSTRAP
```

---

# 22. Final Operational Principle

Leyforge governance succeeds only when a contributor or coding agent can determine:

```text
WHAT RULE APPLIES?
        ↓
WHERE IS ITS AUTHORITY?
        ↓
WHAT RISK CLASS IS THIS CHANGE?
        ↓
WHAT MUST I DO?
        ↓
WHAT AUTOMATION HELPS?
        ↓
WHAT TEST / REVIEW IS REQUIRED?
        ↓
DOES AN EXCEPTION EXIST?
        ↓
WHAT MUST BE RECORDED?
        ↓
WHEN AM I ACTUALLY DONE?
```

B-OPS-00 is the entry point into that system.
