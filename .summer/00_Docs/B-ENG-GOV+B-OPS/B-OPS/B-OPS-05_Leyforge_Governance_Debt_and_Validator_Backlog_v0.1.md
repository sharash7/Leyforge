# B-OPS-05 — Leyforge Governance Debt & Validator Backlog

**Document ID:** B-OPS-05  
**Title:** Leyforge Governance Debt & Validator Backlog  
**Version:** v0.1  
**Status:** OPERATIONALISATION BASELINE  
**Branch:** Branch B — Engineering Governance  
**Parent Authority:** B-OPS-00 through B-OPS-04 + ENG-GOV-00 through ENG-GOV-15  
**Project:** Leyforge

---

## 00. Purpose

B-OPS-05 converts incomplete governance enforcement into explicit, risk-aware engineering work.

It answers:

> Which protections already exist, which are still manual or planned, what must be built, and when does each missing protection become blocking?

The governing principle is:

> Missing automation is acceptable before its risk boundary becomes real, but never invisible and never allowed to remain missing past the milestone where the protected invariant becomes consequential.

---

# 01. Governance Debt Semantics

### BOP05-001
Governance debt means an accepted rule lacks some intended operational enforcement.

### BOP05-002
Governance debt does not make the rule inactive.

### BOP05-003
Governance debt is distinct from ordinary technical debt.

### BOP05-004
Governance debt is distinct from known noncompliance.

### BOP05-005
Missing automated enforcement may temporarily be covered by REVIEW, TEST, MANUAL or PROCESS controls where risk permits.

### BOP05-006
Temporary compensating protection is recorded explicitly.

### BOP05-007
A missing validator cannot be represented as an active validator.

---

# 02. Governance Debt Records

### BOP05-008
Every consequential governance debt item has a stable ID, normally `GOV-DEBT-XXXX`.

### BOP05-009
Debt IDs are never reused.

### BOP05-010
Debt records use the B-OPS-03 Governance Debt template.

### BOP05-011
Every debt item identifies the rule(s) it protects.

### BOP05-012
Every debt item identifies its risk class.

### BOP05-013
Every debt item identifies current compensating protection.

### BOP05-014
Every debt item identifies the desired mechanism.

### BOP05-015
Every debt item identifies an activation milestone.

### BOP05-016
Every debt item identifies an owning engineering domain.

---

# 03. Debt Lifecycle

### BOP05-017
Governance debt uses bounded lifecycle states:

```text
PLANNED
READY
IN PROGRESS
ACTIVE / VERIFYING
BLOCKING
CLOSED
SUPERSEDED
```

### BOP05-018
PLANNED means the required enforcement is known but not yet needed operationally.

### BOP05-019
READY means prerequisites exist and implementation can begin.

### BOP05-020
BLOCKING means the activation milestone arrived without sufficient protection.

### BOP05-021
CLOSED requires operational evidence.

---

# 04. Priority Model

### BOP05-022
Backlog priority is based on:

```text
consequence
× likelihood
× proximity of activation
× absence of compensating protection
× implementation leverage
```

### BOP05-023
Raw age does not determine priority.

### BOP05-024
Near-term Class D/E debt may outrank older lower-risk debt.

### BOP05-025
Mechanisms protecting multiple high-value rules receive leverage priority.

### BOP05-026
Easy low-risk automation must not displace foundational protection.

---

# 05. Activation Milestones

```text
G0 — REPOSITORY / GOVERNANCE BOOTSTRAP
G1 — REGISTRY / CORE IDENTITY BOOTSTRAP
G2 — FIRST PERSISTENT V1 WORLD STATE
G3 — EXTERNAL FORGE / MOD CONTENT
G4 — MULTIPLAYER / DEDICATED SERVER EXPOSURE
G5 — RELEASE / DISTRIBUTION CERTIFICATION
```

### BOP05-027
Every debt item receives one earliest blocking milestone.

### BOP05-028
Debt may be resolved earlier.

### BOP05-029
Debt may not remain unresolved after its blocking milestone unless a valid ENG-GOV-14 exception permits it.

---

# 06. G0 — Repository / Governance Bootstrap

### BOP05-030
Create a basic governance-record validator for duplicate IDs, invalid statuses, missing mandatory metadata, malformed risk classes and unsupported template versions.

### BOP05-031
Create stable record-ID collision detection across ADRs, waivers, deprecations, dependencies, governance debt and Brain knowledge.

### BOP05-032
Create core reference validation for ADR supersession, waiver-rule links, debt-rule links and dependency-ADR links.

### BOP05-033
Expired active waivers become machine-visible.

### BOP05-034
CI eventually rejects expired waivers being used as active suppression.

### BOP05-035
Root `AGENTS.md` exists before mass agent implementation begins.

### BOP05-036
Critical root AGENTS pointers may receive mechanical validation.

### BOP05-037
Stable build, focused-test and full-validation entrypoints exist before agents are expected to self-verify reliably.

### BOP05-038
Parallel-agent workflow has a documented branch/worktree procedure.

### BOP05-039
The Git/worktree procedure also becomes reusable Brain knowledge.

---

# 07. G1 — Registry / Core Identity

## VAL-REGISTRY-ID
### BOP05-040
Detect duplicate stable IDs.

### BOP05-041
Detect illegal namespace ownership.

### BOP05-042
Detect malformed IDs according to authoritative FCC-13 grammar once implemented.

## VAL-REGISTRY-REFERENCE
### BOP05-043
Detect unresolved authoritative references.

### BOP05-044
Detect new references to retired IDs where prohibited.

## VAL-REGISTRY-PROJECTION
### BOP05-045
Detect mechanically identifiable duplicate canonical definitions created incorrectly for Block/Object/Item projections.

## VAL-REGISTRY-GENERATED
### BOP05-046
Detect generated-output drift from source/generator truth.

### BOP05-047
Detect generated-form collisions.

### BOP05-048
Verify deterministic generated identity.

## VAL-REGISTRY-ALIAS
### BOP05-049
Detect alias cycles.

### BOP05-050
Detect ambiguous alias resolution.

## Whole-Registry Gate
### BOP05-051
A single whole-registry validation entrypoint combines required registry checks.

### BOP05-052
Agents should not need to remember many separate validator commands.

---

# 08. G2 — Persistent V1 World State

### BOP05-053
Validate required save manifest/schema/version domains.

### BOP05-054
Reject unsupported newer schemas safely.

### BOP05-055
Create preserved historical save fixtures when persistent schema evolution begins.

### BOP05-056
Historical fixtures are protected test evidence.

### BOP05-057
Supported historical versions migrate through declared paths.

### BOP05-058
Migration remains deterministic where required.

### BOP05-059
Current supported state receives save → reload equivalence testing.

### BOP05-060
Candidate/atomic save behaviour receives interruption testing.

### BOP05-061
Recovery order receives retained scenarios.

### BOP05-062
Corrupt/invalid save rejection protects valid prior data.

### BOP05-063
Persistence fixtures and registry validation combine to protect stable identity over time.

---

# 09. G3 — Forge / External Content

### BOP05-064
Validate package identity/version/schema/dependency manifest fields.

### BOP05-065
Reject archive path traversal.

### BOP05-066
Reject absolute-path and root escape.

### BOP05-067
Protect extraction from symlink/reparse-style escape.

### BOP05-068
Enforce package/decompression resource limits.

### BOP05-069
Validate declared package capability/permission class.

### BOP05-070
Detect undeclared privileged capability.

### BOP05-071
External package definitions pass the same stable-ID/reference rules as other runtime content.

### BOP05-072
Invalid packages must not partially activate.

### BOP05-073
Transactional package activation receives failure scenarios.

---

# 10. G4 — Multiplayer / Dedicated Server Exposure

### BOP05-074
Reject malformed/unknown network requests before authoritative processing.

### BOP05-075
Test that clients cannot directly assert authoritative inventory/resource state.

### BOP05-076
Test server-side ownership and permission boundaries.

### BOP05-077
Test oversized-message and request-flood scenarios.

### BOP05-078
Security logging remains bounded under invalid-request floods.

### BOP05-079
Administrative/operator actions receive explicit authorization tests.

---

# 11. G5 — Release / Distribution Certification

### BOP05-080
Automated secret detection exists in repository/release workflow no later than release certification.

### BOP05-081
Critical dependencies have source, version, licence and ownership mode before release.

### BOP05-082
Required third-party notices are release-verifiable.

### BOP05-083
Critical dependency resolution cannot silently float at release.

### BOP05-084
Release evidence records consequential dependency/fork state.

### BOP05-085
Release certification checks that unintended development security bypasses are disabled.

---

# 12. CI Bootstrap

### BOP05-086
CI is introduced incrementally.

Initial CI should establish:

```text
repository health
basic build
fast tests
governance metadata
```

### BOP05-087
Registry validation becomes required CI once registry architecture is active.

### BOP05-088
Persistence gates become required once persistent V1 formats activate.

### BOP05-089
Package-security gates become required once external packages activate.

### BOP05-090
Network gates activate when multiplayer becomes real.

---

# 13. CI Execution Tiers

```text
FAST
INTEGRATION
DEEP
RELEASE
```

### BOP05-091
Not every test runs on every commit.

### BOP05-092
Risk determines required tier.

### BOP05-093
Class D/E changes may trigger deeper verification.

---

# 14. Performance Backlog

### BOP05-094
Create benchmark infrastructure before performance claims become architecture justification.

### BOP05-095
Benchmark tooling records environment/configuration reproducibly.

### BOP05-096
Voxel/worldgen benchmarks are early foundational performance evidence.

### BOP05-097
Simulation-scale benchmarks activate as civilisation/simulation systems become real.

### BOP05-098
Forge responsiveness benchmarks activate as Forge production capability emerges.

### BOP05-099
Persistence performance benchmarks activate when save architecture stabilises.

---

# 15. Brain Automation Backlog

### BOP05-100
Governance indexes should eventually generate from metadata.

### BOP05-101
ADR status/supersession indexes should be derivable.

### BOP05-102
Waiver expiry/status should be derivable.

### BOP05-103
Governance debt dashboards should be derivable.

### BOP05-104
Dependency state should be derivable where version metadata is machine-known.

### BOP05-105
Validator/CI health should feed the Brain.

### BOP05-106
Generated status automation must avoid noisy Git churn.

---

# 16. Foundational ADR Backlog

Initial reconstructed ADR candidates:

```text
Godot as the V1 platform
Zylann Voxel as the voxel foundation
Leyforge ↔ Zylann ownership / fork boundary
Repository-resident Project Brain
Monorepo modular architecture
Registry / stable-ID architecture
Authoritative persistent-state architecture
```

### BOP05-107
These are backlog records for already accepted decisions, not new architecture decisions.

### BOP05-108
They are reconstructed from accepted project history.

### BOP05-109
Exact content is reconciled with PRD/LFE evidence before acceptance where architecture remains unresolved.

---

# 17. Dependency Bootstrap Backlog

### BOP05-110
Create foundational dependency records for Godot and Zylann during bootstrap.

### BOP05-111
Exact pinned versions come from the real rebuild environment rather than guesses.

### BOP05-112
Fork/patch fields remain N/A or proposed until an actual fork strategy exists.

---

# 18. AGENTS Backlog

### BOP05-113
Root `AGENTS.md` is a G0 deliverable.

### BOP05-114
Path-local AGENTS files are created when real module boundaries exist.

Likely candidates:

```text
persistence
worldgen
registries
Forge
voxel/upstream
```

### BOP05-115
Empty speculative local AGENTS files are not created merely to satisfy a checklist.

---

# 19. Enforcement Mechanism Lifecycle

```text
PLANNED
DESIGNED
IMPLEMENTED
ACTIVE
CERTIFIED
DEPRECATED
```

### BOP05-116
Each validator/test/gate progresses independently through the lifecycle.

### BOP05-117
IMPLEMENTED means code exists.

### BOP05-118
ACTIVE means normal workflow actually runs it.

### BOP05-119
CERTIFIED means the mechanism is trusted enough to support formal certification.

---

# 20. Validator Quality

### BOP05-120
Frequent validator false positives are engineering defects.

### BOP05-121
Validators themselves require tests.

### BOP05-122
Validator failures provide actionable diagnostics.

### BOP05-123
Validators should fail deterministically where feasible.

### BOP05-124
Validators do not mutate authoritative data merely by checking it.

---

# 21. False-Confidence Protection

### BOP05-125
Many validators do not prove Leyforge is correct.

### BOP05-126
Machine enforcement covers only what it actually checks.

### BOP05-127
Semantic architecture/canon decisions remain REVIEW/ADR territory where appropriate.

### BOP05-128
Manual requirements remain manual where genuine human perception is required.

---

# 22. Debt Escalation and Closure

### BOP05-129
Debt gains visibility as activation milestones approach.

### BOP05-130
Class D/E debt nearing activation becomes planning-critical.

### BOP05-131
At the blocking milestone unresolved debt must be implemented, validly waived, or block the capability.

### BOP05-132
Debt closes only when intended protection is operational or the governing requirement legitimately changes.

### BOP05-133
Writing a validator without running it does not close debt.

### BOP05-134
Closure evidence identifies the mechanism and its verification.

### BOP05-135
Closed debt remains historically searchable.

---

# 23. Initial Backlog Order

```text
G0 — BOOTSTRAP
1. Governance metadata / stable-record validation
2. Core link/reference validation
3. Waiver-expiry validation
4. Root AGENTS.md
5. Stable build/test entrypoints
6. Git/worktree operating procedure
7. Initial CI skeleton
8. Brain governance indexes

G1 — REGISTRY FOUNDATION
9. Stable-ID validator
10. Namespace validator
11. Reference-closure validator
12. Alias validator
13. Generated-source drift/collision validator
14. Whole-registry gate

G2 — PERSISTENCE
15. Save-schema validator
16. Save round-trip
17. Migration fixture corpus
18. Migration chain
19. Corruption/recovery/interruption tests

G3 — FORGE / EXTERNAL CONTENT
20. Manifest validator
21. Package-path containment
22. Resource/decompression limits
23. Permission validator
24. Transactional activation tests

G4 — MULTIPLAYER
25. Network schema validation
26. Authority/conservation tests
27. Abuse/rate-limit tests
28. Admin authorization tests

G5 — RELEASE
29. Release dependency/provenance validation
30. Licence/notice checks
31. Development-bypass checks
32. Release certification gate
```

This order does not require all 32 mechanisms before production begins.

Each becomes mandatory before its governed risk boundary becomes real.

---

# 24. Minimum Before Real V1 Implementation

```text
Governance files installed
Brain navigation installed
B-OPS installed
root AGENTS.md
stable task/build/test entrypoints
basic governance metadata checks
basic CI
Work Log workflow
ADR workflow
GOV-DEBT register
foundational dependency records
initial registry validator skeleton if registry work begins immediately
```

---

# 25. Brain Health View Direction

The Brain should expose risk-aware state such as:

```text
ENGINEERING GOVERNANCE HEALTH

G0 Bootstrap
✅ Authority navigation
✅ Agent bootstrap
🟡 Governance validator — PARTIAL
🟡 CI bootstrap — PARTIAL

G1 Registry
🔵 Stable-ID validator — PLANNED
🔵 Reference validator — PLANNED

G2 Persistence
⚪ NOT YET APPLICABLE

G3 External Content
⚪ NOT YET APPLICABLE

G4 Multiplayer
⚪ NOT YET APPLICABLE
```

It should not reduce governance to a vanity percentage.

---

# 26. Final Backlog Laws

### BOP05-136
Every missing protection must answer:

```text
WHAT RULE DOES THIS PROTECT?
WHAT RISK EXISTS WITHOUT IT?
WHAT CURRENTLY PROTECTS US?
WHAT MUST BE BUILT?
WHEN DOES IT BECOME BLOCKING?
HOW DO WE PROVE IT WORKS?
```

### BOP05-137
Governance debt succeeds when missing protection becomes visible, scheduled and risk-aware engineering work.

### BOP05-138
The backlog must let Leyforge begin development safely without pretending unfinished future enforcement already exists.

---

## Closing Principle

Build the governance bootstrap, begin V1 implementation, and activate protection before each risk boundary becomes real.

Governance should enable production safely rather than delay production indefinitely.
