# PRD-07 — Leyforge Prototype, Benchmark & Proof Execution Programme

**Version:** v1.0 — Round 10 Closure Candidate  
**Status:** CLOSURE CANDIDATE — ROUND 10 CLOSURE & EXECUTABLE PRD-08 HANDOFF COMPLETE  
**Programme phase:** Pre-rebuild technical proof planning and execution governance  
**Date:** 2026-09-05  
**Upstream evidence authority:** PRD-05 v1.0 Closure Candidate  
**Upstream risk authority:** PRD-06 v1.0 Closure Candidate  
**Current proof execution count:** 0  
**Current PRD-08 proof-result count:** 0  
**Implementation ADRs accepted by PRD-07:** 0  
**Architecture reopen candidates created by PRD-07:** 0

---

# 1. Purpose

PRD-07 is the controlled execution programme that turns Leyforge's documented technical risks into **buildable, breakable, measurable proof work**.

PRD-05 answered:

> **What do the sources and evidence support?**

PRD-06 answered:

> **What can fail, and what evidence would reduce or close the risk?**

PRD-07 answers:

> **What exactly must be built, stressed, broken, measured and recorded so PRD-08 can evaluate the evidence?**

PRD-07 therefore owns:

- proof execution planning;
- prototype/harness implementation requirements;
- benchmark workload specification;
- fault-injection requirements;
- execution-run identity;
- raw observation capture;
- reproducibility metadata;
- fixture evolution;
- candidate-comparison matrices;
- evidence packaging for PRD-08.

PRD-07 does **not** own:

- canon or gameplay redesign;
- replacement of PRD-04 architecture authority;
- risk closure or residual-risk acceptance;
- final evidence interpretation;
- implementation ADR acceptance;
- arbitrary production support claims.

Those remain with their established authorities, especially PRD-08 for proof interpretation/ADR evidence.

---

# 2. Controlled Baselines

PRD-07 Round 1 begins from the paired closure candidates:

| Input | SHA-256 | Controlled use |
|---|---|---|
| `PRD-05_Leyforge_Research_Evidence_Crosswalk_v1_0_CLOSURE_CANDIDATE_Round10.md` | `30af0861a801158459820d1756fb49cdf223015b682de8df5f7acbb89add766e` | Evidence/source lineage, proof architecture, unknown routing |
| `PRD-06_Leyforge_Technical_Risk_and_Proof_Register_v1_0_CLOSURE_CANDIDATE_Round10.md` | `001f748875e63760d22fda5e4fa8fb71f9a7f9cf465f285f019a3ba5a8ba3fba` | Risk owners, success/exit criteria, proof consumers, fixture and execution-wave handoff |

Inherited closure facts:

```text
PRD-05 XW records:                   580
PRD-06 primary risk families:         18
PRD-06 stable child risks:           263
PRD-05 detailed risk refinements:    109 / 109 consumed
Stable proof obligations:             76 / 76
Shared fixture families:              10 / 10
Open-routed unknowns audited:        137 / 137
Current proof results:                 0
Current implementation ADRs:           0
Current architecture reopen cases:     0
```

Any later source delta must be recorded before it is allowed to change a proof specification.

---

# 3. Authority and Evidence Laws

PRD-07 inherits the following non-negotiable laws.

## 3.1 Evidence does not create canon

A successful prototype may show that a candidate works.

It does not gain authority to redefine FCC, MAP, ART, gameplay/system or architecture law merely because it is convenient.

## 3.2 A failed candidate is not automatically a failed architecture boundary

Candidate failure first eliminates or weakens the candidate.

Architecture reopening requires the stricter PRD-06 §128 gate.

## 3.3 A reference implementation is not a Leyforge proof

Third-party examples can inform the prototype.

The proof must exercise the relevant Leyforge contracts, risks and fixture conditions.

## 3.4 Headless success is not renderer qualification

Headless/server evidence can prove simulation/server questions.

It cannot prove client rendering, UI, accessibility, hardware or art-production support.

## 3.5 Editor success is not exported-artifact qualification

Where the risk concerns release composition, ABI, stripped resources, crash support, renderer or deployment behavior, the real exported artifact must be executed.

## 3.6 One run is not universal proof

A proof ID may require multiple PRD-07 execution runs across:

- candidates;
- configurations;
- platforms;
- hardware;
- provider editions;
- precision modes;
- workloads;
- fault matrices;
- release/debug/profile lanes.

The stable proof ID remains unchanged.

---

# 4. Evidence Maturity Ladder

PRD-07 retains the PRD-04 ladder:

| Level | Meaning |
|---|---|
| **P0 — Idea** | Hypothesis/candidate exists only as a concept. |
| **P1 — Documentation Evidence** | Current authoritative/source documentation supports a claim. |
| **P2 — Reference Implementation** | External/example implementation demonstrates a related mechanism. |
| **P3 — Leyforge Prototype** | A Leyforge-specific prototype demonstrates the candidate under defined conditions. |
| **P4 — Stress Tested** | Hostile/load/failure/repetition evidence exists for the defined claim. |
| **P5 — Production Qualified** | Required real artifacts, hardware/profile lanes, recovery/supportability and applicable hostile evidence satisfy the production claim. |

PRD-07 can **generate evidence toward** P3–P5.

Only PRD-08 may evaluate whether the accumulated evidence actually earns those maturity claims for the relevant decision/risk.

---

# 5. Identity Model — Proof vs Run vs Evidence

The programme uses three distinct identities.

## 5.1 Stable proof identity

Existing authority:

`PRD04-PROOF-01` → `PRD04-PROOF-76`

These IDs are never renumbered by PRD-07.

## 5.2 Execution-run identity

Every actual execution receives a monotonic ID:

`PRD07-RUN-0001`, `PRD07-RUN-0002`, ...

A proof can have many runs.

A run ID is never reused, even if the run is invalidated.

## 5.3 Evidence-artifact identity

Raw outputs that need independent retention may receive:

`PRD07-EVID-0001`, `PRD07-EVID-0002`, ...

Examples:

- logs/traces;
- benchmark CSV/JSON;
- screenshots/video where presentation is being tested;
- crash dumps;
- symbolication reports;
- save/checkpoint files;
- packet captures where permitted;
- generated manifests;
- migration reports;
- deterministic-state hashes;
- profiler captures.

**No `PRD07-RUN-*` or `PRD07-EVID-*` IDs are allocated in Round 1 because no proof has been executed yet.**

---

# 6. Raw PRD-07 Observation States

PRD-07 records what happened without converting it into the final PRD-08 risk decision.

Allowed per-run observation states:

| State | Meaning |
|---|---|
| `NOT-STARTED` | No execution exists yet. |
| `HARNESS-BLOCKED` | Required fixture/build capability does not yet exist. |
| `READY` | Preconditions are satisfied and an execution specification is complete. |
| `PASS-OBSERVED` | This run met its explicit expected outcome. |
| `FAIL-OBSERVED` | This run violated at least one explicit expected outcome. |
| `INCONCLUSIVE` | The run executed but cannot support the intended conclusion. |
| `INVALIDATED` | Evidence is unusable due to wrong build/configuration, measurement defect or contamination. |
| `RERUN-REQUIRED` | Evidence is useful but the defined matrix is incomplete or a controlled change requires repetition. |

Forbidden PRD-07 states:

- `RISK-CLOSED`
- `ADR-ACCEPTED`
- `PRODUCTION-SUPPORTED`
- `ARCHITECTURE-REOPENED`

Those require downstream authority.

---

# 7. Candidate Discipline

A proof may test one or several candidate implementations.

Candidate labels are local to the proof specification and must not be presented as accepted architecture.

Examples:

```text
PROOF-05:
  CANDIDATE-A = standard precision + active-frame rebasing
  CANDIDATE-B = double precision
  CANDIDATE-C = hybrid frame strategy

PROOF-31:
  CANDIDATE-A = compound convex hull
  CANDIDATE-B = segmented hull collider
  CANDIDATE-C = custom/provider-assisted strategy
```

A candidate can be:

- retained for further testing;
- eliminated;
- narrowed;
- split into variants;
- replaced by a new candidate after a failure.

Candidate elimination is useful evidence and is not itself an architecture failure.

---

# 8. Shared Fixture Constitution — 10 Stable Families

PRD-07 receives and preserves the ten fixture families.

| Fixture | Stable purpose | Round-1 execution state |
|---|---|---|
| **FIXTURE-01** | Canonical WorldSession + registry + coordinate/frame harness | `SPECIFICATION-REQUIRED` |
| **FIXTURE-02** | Voxel edit / SpatialChangeSet / collision / navigation harness | `SPECIFICATION-REQUIRED` |
| **FIXTURE-03** | Partitioned simulation + worker/revision chaos harness | `SPECIFICATION-REQUIRED` |
| **FIXTURE-04** | Checkpoint / DB / voxel-store crash harness | `SPECIFICATION-REQUIRED` |
| **FIXTURE-05** | Authoritative server / reconnect / bulk-interest harness | `SPECIFICATION-REQUIRED` |
| **FIXTURE-06** | Editable vessel / local frame / collision / flooding harness | `SPECIFICATION-REQUIRED` |
| **FIXTURE-07** | Forge pack / generated-form / safe-mod / Art-Handoff fixture | `SPECIFICATION-REQUIRED` |
| **FIXTURE-08** | Renderer / accessibility / settings-profile fixture | `SPECIFICATION-REQUIRED` |
| **FIXTURE-09** | Build / exported artifact / support / dependency fixture | `SPECIFICATION-REQUIRED` |
| **FIXTURE-10** | Combined hostile-world soak | `FINAL-INTEGRATION-FIXTURE — NOT EARLY` |

The fixture ID identifies a reusable harness family, not one immutable scene or source file.

Its implementation may evolve while retaining the failure-class contract.

---

# 9. Fixture Reuse Rules

A shared fixture is successful only if it reduces duplication **without hiding distinct failure classes**.

Rules:

1. A proof may consume multiple fixture families.
2. A fixture may have multiple build/profile configurations.
3. A fixture may host multiple proof-specific scenarios.
4. Fixture code must expose canonical IDs/revisions/owners required by diagnostics rather than relying on visual inspection only.
5. Hostile/fault controls must be deterministic or at least seed-recorded where reproducibility requires it.
6. Fixtures may contain synthetic content specifically designed to expose failures.
7. Test content must remain isolated from canonical production content.
8. `FIXTURE-10` composes earlier fixtures; it does not replace them.

---

# 10. Build Identity Is Mandatory Evidence

Every executable PRD-07 run must record a composite build identity sufficient to distinguish:

- Leyforge source revision;
- Godot exact version/revision;
- Voxel Tools exact revision + edition;
- local patch/fork identity;
- relevant native/toolchain dependencies;
- precision/provider/build profile;
- role: client/server/Forge/tool;
- platform/architecture;
- renderer/profile where material;
- content/schema/pack identity;
- matching symbol identity for release/native crash work.

A proof run without adequate build identity may be `INVALIDATED`.

---

# 11. Measurement Contract

Every measurable proof specification must define before execution:

- **metric** — what is measured;
- **unit** — seconds, ms, bytes, count, revision lag, hash, etc.;
- **sampling/collection method**;
- **warm-up** where required;
- **run duration / iteration count**;
- **load/workload definition**;
- **fault injection**;
- **expected outcome**;
- **hard failure condition**;
- **comparison method** where multiple candidates exist;
- **measurement overhead caveat**;
- **raw evidence location/identity**.

No final numeric production budget may be retroactively invented from whichever number the prototype happens to produce.

---

# 12. Determinism / Repetition Contract

Tests that claim deterministic or statistically meaningful behavior must record:

- seed;
- iteration count;
- worker/thread configuration where material;
- execution-order randomization controls;
- canonical-state comparison method;
- tolerance/equivalence rule;
- failure reproduction seed where possible.

For nondeterministic systems, PRD-07 must define the permitted semantic envelope instead of pretending bitwise identity is required.

---

# 13. Failure Injection Contract

Where a risk is about failure/recovery, PRD-07 must inject the failure rather than infer resilience from ordinary success.

Examples include:

- stale task completion;
- provider failure;
- packet loss/duplication/reordering;
- acknowledgement loss;
- corrupt checkpoint;
- slow disk/I/O;
- task queue saturation;
- real process termination;
- missing pack;
- migration interruption;
- invalid graphics settings;
- hostile mod/content input;
- renderer fallback;
- dependency upgrade;
- local-patch removal/rebase.

Graceful cleanup cannot substitute for a real-crash proof when the proof explicitly requires real crash behavior.

---

# 14. Evidence Preservation Contract

A proof package handed to PRD-08 must be independently inspectable.

Minimum retention depends on proof type but can include:

```text
execution specification
candidate definition
source/build/dependency manifests
fixture/configuration
raw logs/events
raw benchmark data
state hashes/snapshots
crash dump + symbols
migration/checkpoint artifacts
screenshots/video for visual/accessibility claims
summary of unexpected observations
run-level PASS/FAIL/INCONCLUSIVE status
```

Manual artistic/accessibility observations are valid evidence when the proof requires human judgement, but the reviewer, build, content and evaluation criteria must still be recorded.

---

# 15. PRD-07 Execution Waves

The PRD-06 handoff defines six execution waves.

| Wave | Primary scope | Purpose |
|---|---|---|
| **W0** | P, C, B, L, A | Harness / artifact / identity bootstrap |
| **W1** | F, G, E, H, Q | Ownership / worldgen / derived-spatial safety |
| **W2** | D, K, Q | Persistence / network / recovery |
| **W3** | I, J | Fluids / vessels / complex moving frames |
| **W4** | M, N, O, R | Forge / content / trust / presentation / migration |
| **W5** | P + qualification consumers | Production qualification / supportability |
| **FINAL** | whole stack | PROOF-76 common-cause hostile soak |

A later wave may depend on evidence from an earlier one.

Some cross-programme proofs are intentionally run or re-run in more than one wave.

---

# 16. Multi-Wave Proof Rule

A single stable proof ID may have several execution stages.

Examples:

- `PROOF-67` provider conformance may begin in W0 and be rerun after provider-dependent features exist.
- `PROOF-70` exported-artifact matrix begins in W0 because real artifacts are prerequisite evidence, then expands/requalifies in W5.
- `PROOF-71` can begin with representative renderer/profile content in W4 and mature into hardware support evidence in W5.
- `PROOF-73` can prove a local patch is reproducible early, then repeat after dependency upgrade/rebase.
- `PROOF-74` is a continuous architecture-lint gate.
- `PROOF-57/58` require persistence/migration mechanics in W2 and content-pack/historical migration coverage in W4.

A proof is not considered “done forever” merely because one execution passed.

---

# 17. Master 76-Proof Execution Ledger

All proof IDs begin at `NOT-STARTED`.

| Proof | Name | Package | Earliest wave | Principal fixture(s) | PRD-06 family consumers | Round-1 state | Planned revalidation |
|---|---|---|---|---|---|---|---|
| **PRD04-PROOF-01** | Projection destruction/rebuild | **PKG-A** | **W0** | FIXTURE-01 | PRD06-RISK-C | `NOT-STARTED` | — |
| **PRD04-PROOF-02** | Runtime-ID randomization | **PKG-A** | **W0** | FIXTURE-01 + FIXTURE-04 | PRD06-RISK-C, PRD06-RISK-R | `NOT-STARTED` | — |
| **PRD04-PROOF-03** | Provider swap | **PKG-A** | **W0** | FIXTURE-01 + FIXTURE-02 + FIXTURE-09 | PRD06-RISK-B, PRD06-RISK-C | `NOT-STARTED` | — |
| **PRD04-PROOF-04** | Cross-boundary transaction | **PKG-D** | **W1** | FIXTURE-03 + FIXTURE-10 | PRD06-RISK-Q | `NOT-STARTED` | — |
| **PRD04-PROOF-05** | Extreme Coordinate Walk | **PKG-B** | **W0** | FIXTURE-01 + FIXTURE-09 | PRD06-RISK-A | `NOT-STARTED` | — |
| **PRD04-PROOF-06** | Origin Rebase Torture | **PKG-B** | **W0** | FIXTURE-01 + FIXTURE-03 | PRD06-RISK-A | `NOT-STARTED` | — |
| **PRD04-PROOF-07** | World Close/Reopen Stale Task | **PKG-I** | **W2** | FIXTURE-04 | PRD06-RISK-D | `NOT-STARTED` | — |
| **PRD04-PROOF-08** | Vessel Region Crossing | **PKG-G** | **W3** | FIXTURE-06 | PRD06-RISK-J | `NOT-STARTED` | — |
| **PRD04-PROOF-09** | Realm Transition Transaction | **PKG-B** | **W2** | FIXTURE-01 + FIXTURE-04 + FIXTURE-05 | PRD06-RISK-A | `NOT-STARTED` | — |
| **PRD04-PROOF-10** | Single Player → Listen Host | **PKG-B** | **W0** | FIXTURE-01 + FIXTURE-05 | PRD06-RISK-A, PRD06-RISK-L | `NOT-STARTED` | — |
| **PRD04-PROOF-11** | Headless WorldSession | **PKG-B** | **W0** | FIXTURE-01 + FIXTURE-09 | PRD06-RISK-A, PRD06-RISK-B, PRD06-RISK-L | `NOT-STARTED` | — |
| **PRD04-PROOF-12** | Projection Eviction | **PKG-A** | **W0** | FIXTURE-01 | PRD06-RISK-C | `NOT-STARTED` | — |
| **PRD04-PROOF-13** | Stale Worker Commit | **PKG-C** | **W1** | FIXTURE-03 | PRD06-RISK-F | `NOT-STARTED` | — |
| **PRD04-PROOF-14** | Partition Ownership Transfer | **PKG-C** | **W1** | FIXTURE-03 + FIXTURE-05 | PRD06-RISK-F | `NOT-STARTED` | — |
| **PRD04-PROOF-15** | SceneTree-Free Distant Simulation | **PKG-C** | **W1** | FIXTURE-03 | PRD06-RISK-F | `NOT-STARTED` | — |
| **PRD04-PROOF-16** | Fidelity Promotion/Demotion | **PKG-C** | **W1** | FIXTURE-03 | PRD06-RISK-F | `NOT-STARTED` | — |
| **PRD04-PROOF-17** | Cross-Domain Construction Transaction | **PKG-D** | **W1** | FIXTURE-02 + FIXTURE-03 | PRD06-RISK-Q | `NOT-STARTED` | — |
| **PRD04-PROOF-18** | Cross-Provider CPU Saturation | **PKG-C** | **W1** | FIXTURE-03 + FIXTURE-09 + FIXTURE-10 | PRD06-RISK-G | `NOT-STARTED` | — |
| **PRD04-PROOF-19** | Main-Thread Independence | **PKG-C** | **W1** | FIXTURE-03 + FIXTURE-09 | PRD06-RISK-F | `NOT-STARTED` | — |
| **PRD04-PROOF-20** | Shutdown Drain Matrix | **PKG-I** | **W2** | FIXTURE-04 + FIXTURE-09 | PRD06-RISK-D | `NOT-STARTED` | — |
| **PRD04-PROOF-21** | Deterministic Seeded Simulation | **PKG-C** | **W1** | FIXTURE-03 | PRD06-RISK-E, PRD06-RISK-F | `NOT-STARTED` | — |
| **PRD04-PROOF-22** | Read-Model Rebuild | **PKG-A** | **W0** | FIXTURE-01 + FIXTURE-03 | PRD06-RISK-C | `NOT-STARTED` | — |
| **PRD04-PROOF-23** | One-Block Spatial Fan-Out | **PKG-E** | **W1** | FIXTURE-02 | PRD06-RISK-E, PRD06-RISK-H | `NOT-STARTED` | — |
| **PRD04-PROOF-24** | Late Generation vs Edit | **PKG-E** | **W1** | FIXTURE-02 + FIXTURE-03 | PRD06-RISK-E | `NOT-STARTED` | — |
| **PRD04-PROOF-25** | Collision Revision Quarantine | **PKG-E** | **W1** | FIXTURE-02 | PRD06-RISK-H | `NOT-STARTED` | — |
| **PRD04-PROOF-26** | Nav Dirty Bridge | **PKG-E** | **W1** | FIXTURE-02 | PRD06-RISK-H | `NOT-STARTED` | — |
| **PRD04-PROOF-27** | Fluid Boundary Breach | **PKG-F** | **W3** | FIXTURE-02 + FIXTURE-06 | PRD06-RISK-I | `NOT-STARTED` | — |
| **PRD04-PROOF-28** | Ocean / Local Fluid Boundary | **PKG-F** | **W3** | FIXTURE-02 + FIXTURE-06 | PRD06-RISK-I | `NOT-STARTED` | — |
| **PRD04-PROOF-29** | Vessel Hull Edit Underway | **PKG-G** | **W3** | FIXTURE-06 | PRD06-RISK-J | `NOT-STARTED` | — |
| **PRD04-PROOF-30** | Moving Vessel Occupants | **PKG-G** | **W3** | FIXTURE-06 + FIXTURE-05 | PRD06-RISK-J | `NOT-STARTED` | — |
| **PRD04-PROOF-31** | Vessel Collision Strategy Matrix | **PKG-G** | **W3** | FIXTURE-06 + FIXTURE-09 | PRD06-RISK-J | `NOT-STARTED` | — |
| **PRD04-PROOF-32** | Vessel Flooding / Buoyancy | **PKG-G** | **W3** | FIXTURE-06 | PRD06-RISK-I, PRD06-RISK-J | `NOT-STARTED` | — |
| **PRD04-PROOF-33** | Structure Collapse Transaction | **PKG-D** | **W1** | FIXTURE-02 + FIXTURE-03 + FIXTURE-10 | PRD06-RISK-Q | `NOT-STARTED` | — |
| **PRD04-PROOF-34** | Provider Failure Degradation | **PKG-E** | **W1** | FIXTURE-02 + FIXTURE-10 | PRD06-RISK-H | `NOT-STARTED` | — |
| **PRD04-PROOF-35** | Duplicate Command / Lost Ack | **PKG-H** | **W2** | FIXTURE-05 | PRD06-RISK-K | `NOT-STARTED` | — |
| **PRD04-PROOF-36** | Protocol Baseline Mismatch | **PKG-H** | **W2** | FIXTURE-05 + FIXTURE-07 | PRD06-RISK-K | `NOT-STARTED` | — |
| **PRD04-PROOF-37** | Teleport Interest Spike | **PKG-H** | **W2** | FIXTURE-05 | PRD06-RISK-G, PRD06-RISK-K | `NOT-STARTED` | — |
| **PRD04-PROOF-38** | Cross-Domain Interest | **PKG-H** | **W2** | FIXTURE-05 | PRD06-RISK-K | `NOT-STARTED` | — |
| **PRD04-PROOF-39** | Cross-Store Crash Matrix | **PKG-I** | **W2** | FIXTURE-04 | PRD06-RISK-D | `NOT-STARTED` | — |
| **PRD04-PROOF-40** | Corrupt Latest Checkpoint | **PKG-I** | **W2** | FIXTURE-04 | PRD06-RISK-D | `NOT-STARTED` | — |
| **PRD04-PROOF-41** | Save During Heavy Edits | **PKG-I** | **W2** | FIXTURE-04 + FIXTURE-10 | PRD06-RISK-D | `NOT-STARTED` | — |
| **PRD04-PROOF-42** | Reconnect During Realm Transition | **PKG-H** | **W2** | FIXTURE-05 + FIXTURE-01 | PRD06-RISK-K | `NOT-STARTED` | — |
| **PRD04-PROOF-43** | Reconnect During Inventory Transaction | **PKG-H** | **W2** | FIXTURE-05 + FIXTURE-04 | PRD06-RISK-K | `NOT-STARTED` | — |
| **PRD04-PROOF-44** | Client Cache Poison | **PKG-H** | **W2** | FIXTURE-05 | PRD06-RISK-K | `NOT-STARTED` | — |
| **PRD04-PROOF-45** | Server Restart Resume | **PKG-H** | **W2** | FIXTURE-05 + FIXTURE-04 | PRD06-RISK-K | `NOT-STARTED` | — |
| **PRD04-PROOF-46** | Network Backpressure | **PKG-H** | **W2** | FIXTURE-05 + FIXTURE-10 | PRD06-RISK-G, PRD06-RISK-K | `NOT-STARTED` | — |
| **PRD04-PROOF-47** | Persistence Backpressure | **PKG-I** | **W2** | FIXTURE-04 + FIXTURE-10 | PRD06-RISK-D, PRD06-RISK-G | `NOT-STARTED` | — |
| **PRD04-PROOF-48** | World Copy / Backup | **PKG-I** | **W2** | FIXTURE-04 | PRD06-RISK-D | `NOT-STARTED` | — |
| **PRD04-PROOF-49** | Source → Bake Reproducibility | **PKG-J** | **W4** | FIXTURE-07 + FIXTURE-09 | PRD06-RISK-C, PRD06-RISK-N, PRD06-RISK-R | `NOT-STARTED` | — |
| **PRD04-PROOF-50** | Art Production Handoff Fixture | **PKG-J** | **W4** | FIXTURE-07 + FIXTURE-08 | PRD06-RISK-N | `NOT-STARTED` | — |
| **PRD04-PROOF-51** | AI vs Human Source Parity | **PKG-J** | **W4** | FIXTURE-07 | PRD06-RISK-N | `NOT-STARTED` | — |
| **PRD04-PROOF-52** | Generated Form Explosion | **PKG-J** | **W4** | FIXTURE-07 + FIXTURE-09 | PRD06-RISK-C, PRD06-RISK-N | `NOT-STARTED` | — |
| **PRD04-PROOF-53** | Renderer/Profile Certification | **PKG-K** | **W4** | FIXTURE-08 + FIXTURE-09 | PRD06-RISK-O | `NOT-STARTED` | — |
| **PRD04-PROOF-54** | Server/Client Pack Split | **PKG-J** | **W4** | FIXTURE-07 + FIXTURE-05 + FIXTURE-09 | PRD06-RISK-L, PRD06-RISK-M | `NOT-STARTED` | — |
| **PRD04-PROOF-55** | Safe Mod Smuggling | **PKG-J** | **W4** | FIXTURE-07 | PRD06-RISK-M | `NOT-STARTED` | — |
| **PRD04-PROOF-56** | Data Mod Resource Bomb | **PKG-J** | **W4** | FIXTURE-07 + FIXTURE-09 | PRD06-RISK-M | `NOT-STARTED` | — |
| **PRD04-PROOF-57** | Missing Pack World Recovery | **PKG-I** | **W2** | FIXTURE-04 + FIXTURE-07 | PRD06-RISK-C, PRD06-RISK-D, PRD06-RISK-M, PRD06-RISK-R | `NOT-STARTED` | Revalidate during W4 pack/migration corpus. |
| **PRD04-PROOF-58** | Pack Upgrade / World Migration | **PKG-I** | **W2** | FIXTURE-04 + FIXTURE-07 | PRD06-RISK-C, PRD06-RISK-D, PRD06-RISK-M, PRD06-RISK-R | `NOT-STARTED` | Revalidate during W4 pack/migration corpus. |
| **PRD04-PROOF-59** | Settings Scope Isolation | **PKG-K** | **W4** | FIXTURE-08 | PRD06-RISK-O | `NOT-STARTED` | — |
| **PRD04-PROOF-60** | Safe Graphics Recovery | **PKG-K** | **W4** | FIXTURE-08 + FIXTURE-09 | PRD06-RISK-O | `NOT-STARTED` | — |
| **PRD04-PROOF-61** | Accessibility Semantic Torture | **PKG-K** | **W4** | FIXTURE-08 | PRD06-RISK-O | `NOT-STARTED` | — |
| **PRD04-PROOF-62** | Forge CI Build | **PKG-J** | **W4** | FIXTURE-07 + FIXTURE-09 | PRD06-RISK-M, PRD06-RISK-N, PRD06-RISK-R | `NOT-STARTED` | — |
| **PRD04-PROOF-63** | End-to-End Transaction Trace | **PKG-D** | **W1** | FIXTURE-03 + FIXTURE-09 + FIXTURE-10 | PRD06-RISK-Q | `NOT-STARTED` | — |
| **PRD04-PROOF-64** | Stale Work Diagnostic Classification | **PKG-L** | **W5** | FIXTURE-03 + FIXTURE-09 | PRD06-RISK-P | `NOT-STARTED` | — |
| **PRD04-PROOF-65** | Support Bundle Redaction | **PKG-L** | **W5** | FIXTURE-09 | PRD06-RISK-P | `NOT-STARTED` | — |
| **PRD04-PROOF-66** | Release Crash Symbolication | **PKG-L** | **W5** | FIXTURE-09 | PRD06-RISK-P | `NOT-STARTED` | — |
| **PRD04-PROOF-67** | Provider Conformance Matrix | **PKG-E** | **W0** | FIXTURE-01 + FIXTURE-02 + FIXTURE-09 | PRD06-RISK-B, PRD06-RISK-H | `NOT-STARTED` | Bootstrap in W0; rerun for provider-dependent W1/W3/W4 changes. |
| **PRD04-PROOF-68** | Worker-Order Chaos | **PKG-C** | **W1** | FIXTURE-03 + FIXTURE-10 | PRD06-RISK-E, PRD06-RISK-F | `NOT-STARTED` | — |
| **PRD04-PROOF-69** | Real Process Crash Recovery | **PKG-I** | **W2** | FIXTURE-04 + FIXTURE-09 | PRD06-RISK-D | `NOT-STARTED` | — |
| **PRD04-PROOF-70** | Exported Artifact Matrix | **PKG-L** | **W0** | FIXTURE-09 | PRD06-RISK-B, PRD06-RISK-L, PRD06-RISK-P | `NOT-STARTED` | Bootstrap real artifact lane in W0; full qualification rerun in W5. |
| **PRD04-PROOF-71** | Renderer / Hardware Lane | **PKG-K** | **W4** | FIXTURE-08 + FIXTURE-09 | PRD06-RISK-O | `NOT-STARTED` | First representative renderer/profile lane in W4; final support-tier evidence in W5. |
| **PRD04-PROOF-72** | Dependency Upgrade Fixture | **PKG-L** | **W5** | FIXTURE-09 | PRD06-RISK-B, PRD06-RISK-P, PRD06-RISK-R | `NOT-STARTED` | Execute upgrade fixture in W5 after the baseline lanes exist. |
| **PRD04-PROOF-73** | Local Patch Reproducibility | **PKG-L** | **W0** | FIXTURE-09 | PRD06-RISK-B, PRD06-RISK-P | `NOT-STARTED` | Bootstrap patch reproducibility in W0 if patches exist; qualification rerun in W5. |
| **PRD04-PROOF-74** | Architecture Dependency Lint | **PKG-A** | **W0** | FIXTURE-01 + FIXTURE-07 + FIXTURE-09 | PRD06-RISK-C, PRD06-RISK-R | `NOT-STARTED` | Bootstrap lint in W0; keep as continuous gate through every wave. |
| **PRD04-PROOF-75** | Observability Overhead | **PKG-L** | **W5** | FIXTURE-09 + FIXTURE-10 | PRD06-RISK-G, PRD06-RISK-P | `NOT-STARTED` | — |
| **PRD04-PROOF-76** | Whole-Stack Hostile Transaction Soak | **PKG-D** | **FINAL** | FIXTURE-10 | PRD06-RISK-G, PRD06-RISK-Q | `NOT-STARTED` | Never run as substitute for prerequisite proofs; final common-cause soak only. |

---

# 18. Proof Prerequisite Rule

Every proof specification must declare prerequisites.

Representative prerequisite classes include:

- build/export lane available;
- exact provider/dependency identity available;
- fixture can observe canonical state without relying on renderer;
- required fault injector implemented;
- required process-control mechanism available;
- baseline fixture is deterministic/reproducible enough;
- required content/pack/art golden fixture exists;
- required renderer/hardware lane exists;
- required lower-level proof evidence exists.

A blocked prerequisite sets the run/planned work to `HARNESS-BLOCKED`; it does not count as a failed technical proof.

---

# 19. PRD-08 Handoff Record Contract

Every actual PRD-07 execution must produce a record sufficient for PRD-08:

```yaml
run_id:
proof_id:
risk_ids:
fixture_ids:
candidate_id:
hypothesis:
candidate_implementation:
source_revision:
build_identity:
dependency_identity:
content_schema_identity:
platform:
hardware:
renderer_profile:
workload:
fault_injection:
measurement_method:
expected_outcome:
observed_outcome:
raw_evidence_refs:
observation_state:
unexpected_findings:
new_risk_candidates:
adr_candidates:
reopen_candidates:
notes:
```

Round 1 extends the PRD-06 handoff by adding:

- `run_id`
- `candidate_id`
- explicit `observation_state`

to ensure multiple runs/candidates cannot overwrite one another.

---

# 20. Proof Specification Template

Before a proof is marked `READY`, it requires a specification of the form:

```yaml
proof_id:
proof_name:
package:
wave:
risk_ids:
fixture_ids:
authority_refs:
question:
hypotheses:
candidates:
prerequisites:
build_matrix:
workload:
fault_matrix:
measurement:
success_criteria:
failure_criteria:
inconclusive_conditions:
required_iterations:
required_artifacts:
security_privacy_constraints:
expected_PRD08_decisions:
```

A proof may split into multiple named scenarios, but the stable `proof_id` remains unchanged.

---

# 21. Benchmark Specification Template

Performance/scalability proofs additionally require:

```yaml
benchmark_id:
proof_id:
workload_identity:
world_fixture:
build_identity:
hardware_identity:
os_driver:
renderer:
provider_edition:
precision:
player_client_count:
settings_profile:
warmup:
duration:
iterations:
metrics:
aggregation:
outlier_policy:
telemetry_overhead_configuration:
comparison_baseline:
```

A benchmark with missing material context is not reusable qualification evidence.

---

# 22. Fault-Matrix Template

Failure/recovery proofs additionally require:

```yaml
fault_matrix:
  - fault_id:
    injection_point:
    precondition:
    injected_failure:
    expected_canonical_state:
    expected_recovery_state:
    forbidden_outcomes:
    evidence_required:
```

For real crash proofs, an actual external process termination mechanism must be used rather than an in-process graceful exception path.

---

# 23. Security / Privacy Constraints

Hostile testing must not create avoidable exposure.

Requirements include:

- use synthetic credentials/secrets for redaction tests;
- never include real private keys/tokens in fixtures;
- safe-mod tests execute in controlled test products/environments;
- resource-bomb fixtures have outer process/memory/time limits;
- support-bundle fixtures use synthetic private data;
- crash/packet artifacts follow repository/privacy governance;
- untrusted object/script/native loading remains blocked unless a specific future trusted-code experiment has explicit authority.

---

# 24. New-Risk Intake During Execution

PRD-07 is allowed to discover new risk candidates.

It is not allowed to silently mutate PRD-06.

When a materially new failure class appears:

1. assign it a temporary `NEW-RISK-CANDIDATE` reference in the run record;
2. show why existing PRD-06 child risks do not subsume it;
3. preserve the failing evidence;
4. propose the appropriate A–R family and next child ID;
5. route the controlled change back through PRD-06 governance;
6. continue the current proof only if doing so will not destroy/contaminate evidence.

---

# 25. Architecture Reopen Candidate During Execution

A failed candidate becomes `ARCHITECTURE-REOPEN-CANDIDATE` only if the PRD-06 reopen test is met.

The run record must include:

- exact accepted boundary challenged;
- candidate implementations attempted;
- common boundary-level failure;
- requirements/authority made infeasible;
- evidence IDs;
- reason another candidate is unlikely to resolve the conflict.

PRD-07 itself cannot approve the reopen.

---

# 26. ADR Candidate During Execution

PRD-07 may emit an ADR candidate when evidence meaningfully distinguishes implementation choices.

It must record:

- decision question;
- candidates tested;
- risk IDs;
- proof/run IDs;
- trade-offs;
- observed failures;
- remaining evidence gaps.

It must not label the ADR accepted.

PRD-08 / ENG-GOV own the evidence-backed decision process.

---

# 27. Historical POC / Reference Evidence During PRD-07

Historical materials are allowed only in their Round-8 PRD-05/06 roles:

- regression-shape inspiration;
- migration fixture input;
- failure-class archaeology;
- reference implementation;
- historical benchmark context.

They cannot substitute for current PRD-07 execution.

In particular:

- old Summer paths/runners are not required fixture architecture;
- old numeric IDs are migration inputs only;
- old POC hardware numbers are not current budgets;
- reference-engine behavior does not prove Godot/Zylann capability.

---

# 28. Round-1 Programme Sequence

The proposed PRD-07 documentation/execution-planning rounds are:

1. **Round 1 — Execution Constitution, Proof Spine & Fixture Contract** — **COMPLETE**
2. **Round 2 — W0 Identity / Artifact / Coordinate / Provider / Headless Proof Specifications**
3. **Round 3 — W1 Ownership / Worldgen / Collision / Navigation / Transaction Proof Specifications**
4. **Round 4 — W2 Network / Persistence / Recovery / Migration Proof Specifications**
5. **Round 5 — W3 Fluid / Vessel / Moving-Frame Proof Specifications**
6. **Round 6 — W4 Forge / Trust / Art / Presentation / Historical-Migration Proof Specifications**
7. **Round 7 — W5 Build / Dependency / Observability / Qualification Proof Specifications**
8. **Round 8 — Cross-Wave Harness / Matrix / Automation / Evidence-Pack Reconciliation**
9. **Round 9 — Reverse Audit of all 76 Proof Specifications + 263 Risk Consumers**
10. **Round 10 — Closure Candidate & Executable PRD-08 Handoff**

Actual engine prototype execution can occur once the required harness implementation exists. The documentation rounds define exactly what those executions must do and what evidence they must retain.

---

# 29. Round-1 Closure Gates

| Gate | Result |
|---|---|
| PRD-05 v1.0 paired evidence baseline consumed | **PASS** |
| PRD-06 v1.0 paired risk baseline consumed | **PASS** |
| Stable proof IDs preserved | **PASS — 76/76** |
| Proof IDs renumbered | **PASS — 0** |
| Stable fixture families preserved | **PASS — 10/10** |
| Execution waves preserved | **PASS — W0–W5 + FINAL** |
| Multiple runs per proof explicitly supported | **PASS** |
| Run identity separated from proof identity | **PASS** |
| Raw PRD-07 observation separated from PRD-08 conclusion | **PASS** |
| Evidence maturity ladder preserved | **PASS** |
| Build identity mandatory | **PASS** |
| Benchmark/fault templates defined | **PASS** |
| Candidate elimination separated from architecture failure | **PASS** |
| New-risk intake controlled | **PASS** |
| Architecture reopen candidate controlled | **PASS** |
| ADR acceptance prevented in PRD-07 | **PASS** |
| Historical evidence anti-promotion preserved | **PASS** |
| PROOF-76 remains final common-cause soak | **PASS** |
| Proof executions performed in Round 1 | **PASS — 0** |
| PRD-08 proof results created | **PASS — 0** |
| Implementation ADRs accepted | **PASS — 0** |
| Architecture reopen candidates created | **PASS — 0** |

**Round-1 closure score: 22 / 22 PASS.**

---

# 30. Round-1 Verdict

> **ROUND 1 PASS — PRD-07 EXECUTION CONSTITUTION / PROGRAMME SPINE / FIXTURE CONTRACT COMPLETE.**

PRD-07 now has a controlled language for moving from documented risk to executable evidence without contaminating proof maturity or architecture authority.

The most important operational conclusions are:

1. **The 76 proof IDs remain permanent authorities; execution runs are separate records.**
2. **One proof can and often must have multiple runs/configurations.**
3. **PRD-07 records raw observations; PRD-08 interprets them.**
4. **No run is valid without enough source/build/dependency/workload identity to reproduce its claim.**
5. **Fault/recovery claims require injected failures.**
6. **Benchmarks require predeclared workload/measurement context.**
7. **Real exported artifacts are mandatory where packaging/runtime composition is part of the risk.**
8. **Fixtures are reusable failure-class harnesses, not one-off scenes.**
9. **Candidate failure is normal evidence and does not automatically reopen architecture.**
10. **PROOF-76 remains the final common-cause gate.**

No Round-1 finding requires PRD-04, PRD-05 or PRD-06 reopening.

---

# 31. Machine-Readable Round-1 Summary

```yaml
document: PRD-07
version: v0.1
round: 1
status: WORKING
round_status: PASS
upstream:
  prd05_sha256: 30af0861a801158459820d1756fb49cdf223015b682de8df5f7acbb89add766e
  prd06_sha256: 001f748875e63760d22fda5e4fa8fb71f9a7f9cf465f285f019a3ba5a8ba3fba
stable_proof_ids: 76
shared_fixture_families: 10
execution_waves: 6
final_common_cause_gate: PRD04-PROOF-76
proof_identity_scheme: PRD04-PROOF-XX
execution_run_scheme: PRD07-RUN-XXXX
evidence_artifact_scheme: PRD07-EVID-XXXX
current_execution_runs: 0
current_evidence_artifacts: 0
current_prd08_results: 0
implementation_adrs_accepted: 0
architecture_reopen_candidates: 0
round1_closure:
  passed: 22
  failed: 0
next_round: W0 Identity / Artifact / Coordinate / Provider / Headless Proof Specifications
```

---

**End of PRD-07 v0.1 — Round 1 Working Baseline**


---

# 32. Round-2 Scope — W0 Identity / Artifact / Coordinate / Provider / Headless Specifications

Round 2 specifies the **Wave-0 bootstrap proof cluster**. It performs **no engine execution**.

The W0 objective is to make later evidence trustworthy by proving/specifying the foundations that every later prototype depends on:

```text
EXACT BUILD / DEPENDENCY IDENTITY
          +
STABLE SEMANTIC IDENTITY
          +
CANONICAL COORDINATES / FRAMES
          +
PROJECTION / READ-MODEL DISPOSABILITY
          +
PROVIDER CONTRACT BOUNDARIES
          +
REAL ROLE ARTIFACTS / HEADLESS WORLDSESSION
          +
AUTOMATED ARCHITECTURE LINT
          ↓
TRUSTWORTHY W1–W5 EXECUTION EVIDENCE
```

Round 2 specifies these 13 stable proofs:

`01, 02, 03, 05, 06, 10, 11, 12, 22, 67, 70, 73, 74`

All retain their existing PRD-04 IDs.

# 33. Wave-0 Ordering and Gate Graph

The recommended execution order is **dependency-oriented**, not numeric:

```text
W0-A — BUILD IDENTITY BOOTSTRAP
  PROOF-70  Exported Artifact Matrix (initial lane)
  PROOF-73  Local Patch Reproducibility (or explicit no-patch baseline)
  PROOF-74  Architecture Dependency Lint (initial rules)

W0-B — SEMANTIC / PROJECTION IDENTITY
  PROOF-02  Runtime-ID Randomization
  PROOF-01  Projection Destruction/Rebuild
  PROOF-12  Projection Eviction
  PROOF-22  Read-Model Rebuild

W0-C — PROVIDER CONTRACT
  PROOF-03  Provider Swap
  PROOF-67  Provider Conformance Matrix

W0-D — COORDINATES / FRAMES
  PROOF-05  Extreme Coordinate Walk
  PROOF-06  Origin Rebase Torture

W0-E — RUNTIME ROLE COMPOSITION
  PROOF-11  Headless WorldSession
  PROOF-10  Single Player → Listen Host
```

This ordering is not a claim that every proof must fully close before the next one begins. It defines the minimum dependency direction for meaningful evidence.

`PROOF-70`, `67`, `73` and `74` are **continuing gates** and must be rerun when later waves materially expand the artifact/provider/dependency surface.

# 34. Wave-0 Fixture Bootstrap Requirements

## 34.1 FIXTURE-01 minimum W0 contract

Before the relevant proofs become `READY`, FIXTURE-01 must expose:

- stable `world_id`, `world_session_id`, semantic entity/content IDs;
- runtime/provider ID binding tables that can be regenerated;
- provider-independent canonical coordinate values;
- one or more active SpatialFrames and frame epochs;
- WorldDefinition separate from WorldSession;
- representative canonical entities/blocks/items with persistent state;
- projection creation/destruction/eviction controls;
- canonical-state snapshot/hash/export;
- read-model/cache destruction/rebuild controls;
- deterministic seed/config manifest;
- explicit owner/revision fields where asynchronous work is used;
- save/reload hook sufficient for identity/coordinate smoke cases.

## 34.2 FIXTURE-09 minimum W0 contract

Must expose:

- exact source revision;
- exact Godot and Voxel Tools identities;
- provider edition;
- local patch/fork identity or `NO-LOCAL-PATCH`;
- build role/profile/precision/platform identity;
- content/schema identity;
- exported artifact hash/path;
- automated clean-build/export invocation;
- runtime manifest self-report;
- architecture-lint invocation;
- symbol identity placeholder for later W5 expansion.

## 34.3 FIXTURE-05 minimum W0 role-transition subset

Only the subset needed by `PROOF-10` is required in Round 2:

- authoritative server/listen role;
- stable player/character identity distinct from peer ID;
- minimal second client connection;
- baseline/world identity reporting;
- deterministic join/leave/reconnect control.

This is **not** the complete W2 network fixture yet.

# 35. Detailed W0 Proof Specifications

## 35.1 PRD04-PROOF-01 — Projection destruction/rebuild

**Round-2 planning state:** `SPECIFIED — NOT EXECUTED`  
**Earliest wave:** `W0`  
**Principal fixture(s):** FIXTURE-01  
**Detailed PRD-06 consumers (2):** `PRD06-RISK-C02`, `PRD06-RISK-C04`

### Question

Can every disposable runtime projection be destroyed and recreated from authoritative Leyforge state without losing identity, state, ownership, bindings or current revision?

### Hypotheses

  - H1: Canonical semantic/domain state is sufficient to recreate runtime projections after arbitrary destruction.
  - H0: At least one projection contains irreplaceable authoritative state or identity not recoverable from the owner/domain state.

### Candidate implementations under test

  - CANDIDATE-A: current provider/projected scene representation behind the PRD-04 projection boundary.

### Prerequisites

  - Stable canonical IDs and WorldSession identity in FIXTURE-01.
  - Ability to create/destroy representative block/entity/item/machine/actor projections on command.
  - Canonical-state snapshot/hash before and after projection recreation.

### Build/configuration matrix

  - normal active projection
  - projection destroyed while idle
  - projection destroyed while derived provider work is pending
  - rebuild after runtime/provider-local ID randomization

### Workload / state

Representative entities/blocks with persistent state, inventory/reference bindings and at least one derived provider/view object.

### Fault / hostility matrix

  - Destroy projection tree/runtime objects without deleting canonical domain state.
  - Randomize fresh runtime handles on recreation.

### Measurement

  - canonical-state equality
  - semantic-ID equality
  - revision continuity
  - duplicate/lost projection count
  - forbidden authority fields found only in projection

### Success criterion

All canonical identity/state remains unchanged; recreated projections bind to the same semantic objects and current revisions; no projection-only authoritative field is required.

### Failure criterion

Any semantic state is lost/changed, duplicate canonical identity is created, or recreation requires restoring a provider/runtime handle as authority.

### Inconclusive conditions

Fixture fails to distinguish canonical state from projection state or lacks enough representative projection classes.

### Required repetition

At least 100 destroy/rebuild cycles per representative projection class; include randomized destruction timing.

### Required evidence artifacts

  - before/after canonical snapshots
  - projection binding table
  - structured diagnostics
  - architecture-state diff

### PRD-08 decision relevance

May support closure/reduction of C projection-authority risks and candidate facade design; cannot select provider architecture alone.


## 35.2 PRD04-PROOF-02 — Runtime-ID randomization

**Round-2 planning state:** `SPECIFIED — NOT EXECUTED`  
**Earliest wave:** `W0`  
**Principal fixture(s):** FIXTURE-01 + FIXTURE-04  
**Detailed PRD-06 consumers (11):** `PRD06-RISK-C01`, `PRD06-RISK-C02`, `PRD06-RISK-C03`, `PRD06-RISK-C07`, `PRD06-RISK-C09`, `PRD06-RISK-C12`, `PRD06-RISK-R08`, `PRD06-RISK-R09`, `PRD06-RISK-R13`, `PRD06-RISK-R14`, `PRD06-RISK-R17`

### Question

Can runtime/provider-local IDs be arbitrarily remapped without changing semantic identity, save/migration meaning or authoritative references?

### Hypotheses

  - H1: Stable Leyforge IDs fully insulate canonical state from runtime palette/model/object IDs.
  - H0: At least one authoritative or migration path relies on provider/runtime numeric identity.

### Candidate implementations under test

  - CANDIDATE-A: provider-neutral stable semantic IDs with runtime palette/binding maps rebuilt per session/load.

### Prerequisites

  - FIXTURE-01 registry harness with deterministic semantic objects.
  - Ability to regenerate/randomize runtime palette/model IDs.
  - Version-aware legacy migration cases from FCC-13E subset for early smoke coverage.

### Build/configuration matrix

  - fresh runtime mapping
  - reversed mapping
  - random permutation
  - sparse/high numeric runtime values
  - legacy numeric-ID migration under changed current runtime mapping

### Workload / state

Representative blocks/items/generated forms/entities plus legacy migration aliases.

### Fault / hostility matrix

  - Regenerate runtime mapping between save/load.
  - Corrupt/remove cached runtime mapping and force rebuild.
  - Change provider-local IDs while canonical source IDs remain fixed.

### Measurement

  - canonical ID equality
  - reference-resolution success
  - migration-result equality
  - save/load equality
  - number of semantic errors tied to runtime ID

### Success criterion

All canonical and migration outcomes are unchanged across runtime-ID permutations; provider/runtime IDs never appear as required durable identity.

### Failure criterion

Save, network, migration, read model or gameplay reference changes meaning when runtime IDs are permuted.

### Inconclusive conditions

Test only exercises one object class or does not persist/reload/migrate references.

### Required repetition

Minimum 50 independent random mappings; deterministic seed recorded for every failing permutation.

### Required evidence artifacts

  - mapping manifests
  - canonical state hashes
  - migration output comparison
  - save/reload evidence

### PRD-08 decision relevance

May support C/R semantic-ID risk reduction and future palette/registry ADR evidence.


## 35.3 PRD04-PROOF-03 — Provider swap

**Round-2 planning state:** `SPECIFIED — NOT EXECUTED`  
**Earliest wave:** `W0`  
**Principal fixture(s):** FIXTURE-01 + FIXTURE-02 + FIXTURE-09  
**Detailed PRD-06 consumers (9):** `PRD06-RISK-B01`, `PRD06-RISK-B02`, `PRD06-RISK-B03`, `PRD06-RISK-B06`, `PRD06-RISK-B07`, `PRD06-RISK-B09`, `PRD06-RISK-C06`, `PRD06-RISK-E05`, `PRD06-RISK-L03`

### Question

Can Leyforge replace or vary a bounded provider implementation without changing canonical semantics or leaking provider authority above the facade?

### Hypotheses

  - H1: Provider contracts are narrow enough that a second/fake/provider-variant implementation can satisfy the same Leyforge semantic behavior.
  - H0: Gameplay/domain code depends on provider-specific types, IDs, lifecycle or hidden semantics.

### Candidate implementations under test

  - CANDIDATE-A: current Zylann/Godot-backed provider adapter.
  - CANDIDATE-B: deterministic fake/minimal conformance provider implementing only the Leyforge contract.
  - CANDIDATE-C: alternate edition/configuration of the same provider where feasible (e.g. Module/GDExtension lane), without treating edition choice as already decided.

### Prerequisites

  - Provider facade/interface boundaries exist for the selected slice.
  - Exact build/provider edition identity from FIXTURE-09.
  - A small canonical fixture that can run with both provider implementations.

### Build/configuration matrix

  - real provider
  - fake/minimal provider
  - alternate provider edition/configuration where buildable

### Workload / state

Voxel/state/projection/provider operations sufficient to test identity, requested work, readiness/result publication and failure behavior.

### Fault / hostility matrix

  - Provider unavailable/not-ready.
  - Provider returns delayed result.
  - Provider-local IDs deliberately differ.

### Measurement

  - canonical outcome equivalence
  - provider-specific type leakage count
  - build/runtime errors
  - contract coverage
  - readiness/failure classification

### Success criterion

Canonical behavior remains equivalent within the declared provider contract; domain code compiles/runs without reaching provider internals; provider failure is surfaced as evidence/degradation, not semantic rewrite.

### Failure criterion

Gameplay/domain semantics differ solely because provider implementation changes, or domain code requires provider-internal objects/IDs.

### Inconclusive conditions

Second provider is merely a wrapper around the same internal state and does not meaningfully test the contract boundary.

### Required repetition

Run the same scenario corpus under every candidate provider lane with at least 20 repeated seeded cycles.

### Required evidence artifacts

  - provider contract manifest
  - canonical-state comparisons
  - dependency/lint reports
  - build manifests
  - failure traces

### PRD-08 decision relevance

May inform Module-vs-GDExtension/provider ADRs only when paired with later capability/performance/export evidence.


## 35.4 PRD04-PROOF-05 — Extreme Coordinate Walk

**Round-2 planning state:** `SPECIFIED — NOT EXECUTED`  
**Earliest wave:** `W0`  
**Principal fixture(s):** FIXTURE-01 + FIXTURE-09  
**Detailed PRD-06 consumers (8):** `PRD06-RISK-A01`, `PRD06-RISK-A02`, `PRD06-RISK-A04`, `PRD06-RISK-A07`, `PRD06-RISK-A08`, `PRD06-RISK-B08`, `PRD06-RISK-J07`, `PRD06-RISK-J12`

### Question

Does the canonical-coordinate/active-frame strategy preserve placement, identity and local numerical usefulness across extreme world positions?

### Hypotheses

  - H1: Provider-independent canonical coordinates can represent target world extents while active-frame mapping keeps engine-local operations valid.
  - H0: Coordinate range/precision/frame conversion causes drift, aliasing, invalid provider coordinates or inconsistent semantic position.

### Candidate implementations under test

  - CANDIDATE-A: standard precision with bounded active frames/origin management.
  - CANDIDATE-B: double-precision build lane.
  - CANDIDATE-C: hybrid strategy combining provider-neutral canonical coordinates with explicit bounded local frames.

### Prerequisites

  - FIXTURE-01 canonical coordinate/frame representation instrumented.
  - Exact precision/build lane identity from FIXTURE-09.
  - Round-trip canonical↔active-frame conversion functions accessible for measurement.

### Build/configuration matrix

  - origin/near
  - moderate distance
  - extreme positive/negative axes
  - cross-axis extremes
  - realm/frame transitions
  - candidate precision/build lanes

### Workload / state

Walk/place/edit/teleport representative entities and voxel edits across the intended extreme test envelope.

### Fault / hostility matrix

  - Repeated canonical↔active conversion.
  - Long travel with many frame changes.
  - Save/reload at extreme coordinates.

### Measurement

  - round-trip coordinate error
  - voxel/cell identity equality
  - entity relative-position error
  - provider validity/error count
  - save/reload coordinate equality

### Success criterion

Canonical identity/placement remains exact where defined; engine-local error remains inside a predeclared candidate tolerance; no aliasing, overflow or provider-internal coordinate assumption changes world meaning.

### Failure criterion

Wrong voxel/entity is addressed, canonical coordinate changes after round-trip/save, provider range is exceeded without governed fallback, or local error breaks gameplay-relevant relation.

### Inconclusive conditions

Target world-envelope/tolerance has not been declared for the run or build identity does not distinguish precision mode.

### Required repetition

Traverse every declared extreme point plus repeated 10,000+ frame/local conversions in a synthetic stress loop.

### Required evidence artifacts

  - coordinate error CSV
  - canonical/active frame traces
  - build precision manifest
  - save/reload snapshots

### PRD-08 decision relevance

May eliminate precision/frame candidates; cannot establish final world-size budget without later performance/provider evidence.


## 35.5 PRD04-PROOF-06 — Origin Rebase Torture

**Round-2 planning state:** `SPECIFIED — NOT EXECUTED`  
**Earliest wave:** `W0`  
**Principal fixture(s):** FIXTURE-01 + FIXTURE-03  
**Detailed PRD-06 consumers (5):** `PRD06-RISK-A05`, `PRD06-RISK-A06`, `PRD06-RISK-A07`, `PRD06-RISK-A08`, `PRD06-RISK-J07`

### Question

Can origin/active-frame rebasing occur repeatedly under load without changing canonical state, relative relationships or pending-work correctness?

### Hypotheses

  - H1: Rebase changes only projection/frame mapping; canonical state and owner revisions remain invariant.
  - H0: Rebase leaks into authority, duplicates movement, invalidates references or lets stale pre-rebase work commit.

### Candidate implementations under test

  - CANDIDATE-A: threshold-based origin/active-frame rebase.
  - CANDIDATE-B: hierarchical/multi-frame rebase where the architecture permits.

### Prerequisites

  - PROOF-05 candidate lane buildable enough to expose canonical↔active mapping.
  - FIXTURE-03 can queue delayed worker/provider work tagged with frame/revision context.
  - Rebase event is explicitly observable.

### Build/configuration matrix

  - idle rebase
  - rebase during movement
  - rebase with pending worker task
  - rebase during voxel/provider work
  - multiple entities/frames
  - rapid back-and-forth threshold crossing

### Workload / state

Player/entity movement plus delayed simulation/provider proposals across repeated rebases.

### Fault / hostility matrix

  - Force rebase immediately before stale worker completion.
  - Rapidly trigger successive rebases.
  - Save/load immediately before/after rebase.

### Measurement

  - canonical coordinate delta (must be zero unless actual movement)
  - relative transform error
  - stale-commit count
  - duplicate movement count
  - rebase duration/latency

### Success criterion

Rebase never changes canonical truth, relative relations remain within declared projection tolerance, and old-frame work is rejected/remapped according to the owner/revision contract.

### Failure criterion

Canonical coordinates move because of rebase, pending work commits using wrong frame, or entities/voxels visibly/semantically jump beyond accepted projection tolerance.

### Inconclusive conditions

Fixture cannot distinguish player movement from rebase movement or does not tag pending work with frame epoch.

### Required repetition

At least 10,000 synthetic rebases plus representative interactive/load scenarios.

### Required evidence artifacts

  - frame-epoch traces
  - canonical snapshots
  - relative-error data
  - stale-work diagnostics

### PRD-08 decision relevance

May inform rebase/hybrid coordinate ADR after interaction with networking/physics/provider evidence.


## 35.6 PRD04-PROOF-10 — Single Player → Listen Host

**Round-2 planning state:** `SPECIFIED — NOT EXECUTED`  
**Earliest wave:** `W0`  
**Principal fixture(s):** FIXTURE-01 + FIXTURE-05  
**Detailed PRD-06 consumers (3):** `PRD06-RISK-A03`, `PRD06-RISK-A08`, `PRD06-RISK-L04`

### Question

Can an existing single-player WorldSession transition into listen-host authority without changing the world's canonical identity or duplicating authoritative state?

### Hypotheses

  - H1: Single-player and listen-host are two runtime/authority compositions over the same WorldSession/domain semantics.
  - H0: Hosting requires recreating world/player state or introduces a second authority model.

### Candidate implementations under test

  - CANDIDATE-A: promote/open existing WorldSession into authoritative server/listen composition while preserving stable world/player/entity IDs.

### Prerequisites

  - FIXTURE-01 WorldDefinition/WorldSession split operational.
  - FIXTURE-05 minimal authoritative server/connection harness.
  - Stable player/character/entity IDs distinct from peer IDs.

### Build/configuration matrix

  - SP start→host
  - SP save→reload→host
  - host with second client joining
  - host stop→continue local if supported by candidate
  - extreme/frame-local state present during promotion

### Workload / state

World with edited voxels, inventory, entities and at least one ongoing domain state before hosting.

### Fault / hostility matrix

  - New peer IDs on host transition/client join.
  - Disconnect/reconnect second client after promotion.

### Measurement

  - world ID equality
  - player/character ID equality
  - duplicate authoritative entity count
  - canonical state hash before/after role transition
  - baseline/admission errors

### Success criterion

Hosting preserves one canonical world and existing local character; new network peers bind to stable identities without reconstructing or duplicating authoritative state.

### Failure criterion

World/player is cloned/recreated with changed semantics, host/client authorities disagree, or runtime peer identity becomes durable identity.

### Inconclusive conditions

Fixture starts a fresh hosted world rather than promoting the same controlled WorldSession.

### Required repetition

At least 50 promote/join/leave cycles across multiple saved world states.

### Required evidence artifacts

  - world/session identity traces
  - state hashes
  - network admission logs
  - build role manifest

### PRD-08 decision relevance

May support L/A role-composition risks; not sufficient alone for dedicated-server parity or reconnect qualification.


## 35.7 PRD04-PROOF-11 — Headless WorldSession

**Round-2 planning state:** `SPECIFIED — NOT EXECUTED`  
**Earliest wave:** `W0`  
**Principal fixture(s):** FIXTURE-01 + FIXTURE-09  
**Detailed PRD-06 consumers (12):** `PRD06-RISK-A02`, `PRD06-RISK-A03`, `PRD06-RISK-A09`, `PRD06-RISK-B06`, `PRD06-RISK-B08`, `PRD06-RISK-L01`, `PRD06-RISK-L02`, `PRD06-RISK-L03`, `PRD06-RISK-L04`, `PRD06-RISK-L05`, `PRD06-RISK-L07`, `PRD06-RISK-L08`

### Question

Can the authoritative WorldSession run in a real headless/dedicated artifact without presentation/SceneTree resources becoming prerequisites for canonical simulation?

### Hypotheses

  - H1: Canonical simulation/session authority is presentation-independent and survives a stripped/headless runtime product.
  - H0: A required gameplay/state path depends on renderer/UI/scene/presentation resources or editor-only composition.

### Candidate implementations under test

  - CANDIDATE-A: dedicated/headless exported artifact using the same Leyforge domain contracts with presentation omitted.

### Prerequisites

  - FIXTURE-09 can produce/run a real dedicated/headless exported artifact.
  - FIXTURE-01 can seed and inspect a WorldSession without client presentation.
  - Exact server content/build manifest recorded.

### Build/configuration matrix

  - editor/headless smoke (diagnostic only)
  - real exported dedicated artifact
  - client artifact running same seeded domain scenario for semantic comparison

### Workload / state

Seeded domain simulation with world edits/entities/inventory/settlement-like state that does not require presentation.

### Fault / hostility matrix

  - Strip/omit declared presentation assets.
  - Run without display/audio.
  - Restart exported server artifact.

### Measurement

  - canonical-state equivalence
  - missing-resource/provider errors
  - SceneTree/presentation authority dependency count
  - server startup/shutdown correctness

### Success criterion

Real headless/dedicated artifact advances the intended canonical domain state and matches semantic expectations without loading presentation-only authority.

### Failure criterion

Canonical simulation requires renderer/UI/client scene resources, or headless/client domain outcomes differ for the same governed semantic inputs without an allowed reason.

### Inconclusive conditions

Only editor `--headless` is tested or client/server content manifests are not comparable.

### Required repetition

Minimum 20 clean exported-server runs plus deterministic seeded comparison cycles.

### Required evidence artifacts

  - server artifact manifest
  - content manifest
  - state hashes
  - logs/diagnostics
  - resource-load report

### PRD-08 decision relevance

May support headless/server composition ADRs and L/B/A risk reduction; not renderer or player-count qualification.


## 35.8 PRD04-PROOF-12 — Projection Eviction

**Round-2 planning state:** `SPECIFIED — NOT EXECUTED`  
**Earliest wave:** `W0`  
**Principal fixture(s):** FIXTURE-01  
**Detailed PRD-06 consumers (2):** `PRD06-RISK-C02`, `PRD06-RISK-C04`

### Question

Can runtime projections be evicted/unloaded by distance/interest/resource pressure and later recreated without changing canonical world truth?

### Hypotheses

  - H1: Projection lifetime is disposable and independent from persistent domain lifetime.
  - H0: Eviction destroys authoritative state or changes simulation because the projection was acting as owner.

### Candidate implementations under test

  - CANDIDATE-A: governed projection eviction/recreation driven by local relevance while authoritative domain state persists.

### Prerequisites

  - PROOF-01 fixture path available.
  - Ability to force projection eviction independently of canonical entity lifetime.
  - Distant domain state inspectable without projection.

### Build/configuration matrix

  - distance eviction
  - memory-pressure synthetic eviction
  - interest/view change
  - eviction while domain state changes offscreen
  - re-entry/recreation

### Workload / state

Persistent entities/objects with identity, state, timers/jobs and references that continue or remain valid while projection is absent.

### Fault / hostility matrix

  - Evict immediately after a state change.
  - Evict while derived provider work is pending.

### Measurement

  - canonical state continuity
  - offscreen progression correctness where required
  - recreation correctness
  - duplicate/lost entity count

### Success criterion

Eviction does not delete/stop/alter authoritative state except where the domain's explicit fidelity policy permits; recreation binds current state exactly once.

### Failure criterion

Entity/domain state disappears, resets or changes because projection unloaded, or a second canonical entity is spawned on return.

### Inconclusive conditions

Test object has no state/lifetime beyond its projection and therefore cannot expose authority leakage.

### Required repetition

At least 1,000 eviction/recreation cycles over multiple object classes.

### Required evidence artifacts

  - eviction event traces
  - canonical snapshots
  - recreation binding logs

### PRD-08 decision relevance

Supports C projection-lifetime risk reduction and later simulation-fidelity evidence.


## 35.9 PRD04-PROOF-22 — Read-Model Rebuild

**Round-2 planning state:** `SPECIFIED — NOT EXECUTED`  
**Earliest wave:** `W0`  
**Principal fixture(s):** FIXTURE-01 + FIXTURE-03  
**Detailed PRD-06 consumers (3):** `PRD06-RISK-C05`, `PRD06-RISK-F14`, `PRD06-RISK-H14`

### Question

Can derived read models/caches/indexes be destroyed and deterministically rebuilt from authoritative domain state without changing gameplay truth?

### Hypotheses

  - H1: Read models are replaceable projections with explicit revision/invalidation lineage.
  - H0: At least one cache/index contains authority or cannot be rebuilt to equivalent semantic results.

### Candidate implementations under test

  - CANDIDATE-A: event/revision-driven rebuildable read models for representative spatial/summary/query data.

### Prerequisites

  - Representative read model exists in FIXTURE-01/03.
  - Authoritative source query and read-model query can be compared.
  - Revision/invalidation context instrumented.

### Build/configuration matrix

  - clean rebuild
  - rebuild after many domain changes
  - destroy while stale
  - rebuild under worker-order randomization
  - rebuild after reload

### Workload / state

Representative spatial/entity/settlement summary or lookup data with additions/removals/changes.

### Fault / hostility matrix

  - Delete cache/read-model storage.
  - Delay/reorder update events and then force full rebuild.

### Measurement

  - query-result equivalence
  - revision convergence
  - missing/extra entry count
  - rebuild time/memory (diagnostic, not final budget)

### Success criterion

Rebuilt model converges to the authoritative expected query results and changing/deleting the cache cannot change canonical state.

### Failure criterion

Cache loss changes truth, rebuild cannot recover required entries, or writes to the cache are required to mutate canonical domain state.

### Inconclusive conditions

Chosen cache merely mirrors trivial data and does not exercise revision/invalidation behavior.

### Required repetition

At least 100 rebuilds across randomized mutation sequences.

### Required evidence artifacts

  - authoritative vs read-model result sets
  - revision traces
  - rebuild metrics
  - worker-order seeds

### PRD-08 decision relevance

Supports C/F/H cache/read-model risks and future index/cache implementation choices.


## 35.10 PRD04-PROOF-67 — Provider Conformance Matrix

**Round-2 planning state:** `SPECIFIED — NOT EXECUTED`  
**Earliest wave:** `W0`  
**Principal fixture(s):** FIXTURE-01 + FIXTURE-02 + FIXTURE-09  
**Detailed PRD-06 consumers (18):** `PRD06-RISK-B01`, `PRD06-RISK-B02`, `PRD06-RISK-B03`, `PRD06-RISK-C06`, `PRD06-RISK-D10`, `PRD06-RISK-E01`, `PRD06-RISK-E04`, `PRD06-RISK-E05`, `PRD06-RISK-G06`, `PRD06-RISK-H06`, `PRD06-RISK-H08`, `PRD06-RISK-H11`, `PRD06-RISK-H14`, `PRD06-RISK-J09`, `PRD06-RISK-L03`, `PRD06-RISK-P06`, `PRD06-RISK-R05`, `PRD06-RISK-R17`

### Question

Do supported provider lanes satisfy the explicit Leyforge contracts they are allowed to serve, including failure/readiness/export behavior?

### Hypotheses

  - H1: Each claimed provider lane has a measurable conformance surface independent of provider internals.
  - H0: Provider support is assumed from compilation/examples rather than contract behavior.

### Candidate implementations under test

  - CANDIDATE-A: current Voxel Tools edition/build lane.
  - CANDIDATE-B: alternate edition/configuration where materially under consideration.
  - CANDIDATE-C: deterministic fake provider for contract-negative/failure tests.

### Prerequisites

  - Provider contracts enumerated for the W0 subset.
  - FIXTURE-09 exact provider/build identity.
  - FIXTURE-01/02 minimal representative operations.
  - Failure/readiness injection or simulation available.

### Build/configuration matrix

  - edition/build combinations actually under consideration
  - client/headless/export availability
  - normal/delayed/failing provider responses

### Workload / state

Minimal canonical requests exercising identity mapping, data access/generation/edit/readiness/lifecycle paths relevant to early architecture.

### Fault / hostility matrix

  - provider not ready
  - delayed completion
  - explicit error/degradation
  - runtime/local ID remap

### Measurement

  - contract case pass count
  - semantic outcome
  - readiness/failure classification
  - unsupported feature matrix
  - export/load success

### Success criterion

Every claimed lane has explicit pass/fail/unsupported results per contract; unsupported capability is visible and never silently emulated as canonical truth.

### Failure criterion

Provider-specific undocumented behavior is required for correctness or support is claimed without executable conformance evidence.

### Inconclusive conditions

Matrix lacks an intended supported lane or contract cases are too provider-specific to test the facade.

### Required repetition

Each contract case repeated across every claimed lane; failing case must be reproducible.

### Required evidence artifacts

  - provider conformance matrix
  - build manifests
  - structured failure traces
  - unsupported-feature register

### PRD-08 decision relevance

Feeds provider-edition/support ADRs and later dependency-upgrade revalidation; this W0 run is an initial baseline, not final conformance forever.


## 35.11 PRD04-PROOF-70 — Exported Artifact Matrix

**Round-2 planning state:** `SPECIFIED — NOT EXECUTED`  
**Earliest wave:** `W0`  
**Principal fixture(s):** FIXTURE-09  
**Detailed PRD-06 consumers (30):** `PRD06-RISK-A02`, `PRD06-RISK-A03`, `PRD06-RISK-A09`, `PRD06-RISK-B04`, `PRD06-RISK-B05`, `PRD06-RISK-B06`, `PRD06-RISK-B08`, `PRD06-RISK-K16`, `PRD06-RISK-L02`, `PRD06-RISK-L03`, `PRD06-RISK-L07`, `PRD06-RISK-L08`, `PRD06-RISK-M03`, `PRD06-RISK-M10`, `PRD06-RISK-M13`, `PRD06-RISK-P01`, `PRD06-RISK-P02`, `PRD06-RISK-P03`, `PRD06-RISK-P04`, `PRD06-RISK-P05`, `PRD06-RISK-P06`, `PRD06-RISK-P07`, `PRD06-RISK-P10`, `PRD06-RISK-P12`, `PRD06-RISK-P20`, `PRD06-RISK-P21`, `PRD06-RISK-P22`, `PRD06-RISK-P24`, `PRD06-RISK-R06`, `PRD06-RISK-R20`

### Question

Can every materially supported client/server/Forge role/profile combination be produced and executed as the real artifact users/CI will consume, with exact reproducible identity?

### Hypotheses

  - H1: Claimed support lanes correspond to real exported products derived from controlled inputs.
  - H0: Editor/dev success hides export, stripping, ABI, dependency or role-composition failures.

### Candidate implementations under test

  - CANDIDATE-A: initial minimal W0 artifact matrix; expand in later waves as renderer/Forge/support claims become concrete.

### Prerequisites

  - FIXTURE-09 build manifest/bootstrap script exists.
  - Exact Godot/Voxel Tools/source/profile identity recordable.
  - At least one client and one dedicated/headless role artifact target.

### Build/configuration matrix

  - client release-like smoke
  - dedicated/headless server smoke
  - debug/profile comparison only as distinct artifacts
  - Forge/tool artifact when implementation exists; otherwise explicitly `NOT-YET-APPLICABLE`

### Workload / state

Startup, manifest self-report, minimal WorldSession smoke, clean shutdown; role-specific content/resource inspection.

### Fault / hostility matrix

  - clean build environment/cache removal
  - missing/stale dependency detection
  - presentation-resource stripping validation for server

### Measurement

  - build/export success
  - startup success
  - manifest equality/difference as expected
  - missing-resource errors
  - artifact hash/size identity

### Success criterion

Every currently claimed W0 lane produces and runs a real artifact with exact manifest; role differences are explicit and semantic common inputs match where required.

### Failure criterion

Support is claimed for a lane that cannot be exported/run or actual artifact inputs diverge silently from the recorded/common manifest.

### Inconclusive conditions

Only editor execution is used or build identity is insufficient to determine what was tested.

### Required repetition

At least 3 clean builds per W0 artifact lane to expose cache/environment drift; later waves must expand/re-run.

### Required evidence artifacts

  - exact build manifests
  - artifact hashes
  - export logs
  - runtime smoke logs
  - role content manifests

### PRD-08 decision relevance

Establishes artifact-evidence foundation; final P5/support claims require later W5 expansion and hardware/profile evidence.


## 35.12 PRD04-PROOF-73 — Local Patch Reproducibility

**Round-2 planning state:** `SPECIFIED — NOT EXECUTED`  
**Earliest wave:** `W0`  
**Principal fixture(s):** FIXTURE-09  
**Detailed PRD-06 consumers (10):** `PRD06-RISK-A09`, `PRD06-RISK-B04`, `PRD06-RISK-B05`, `PRD06-RISK-L08`, `PRD06-RISK-P01`, `PRD06-RISK-P05`, `PRD06-RISK-P08`, `PRD06-RISK-P09`, `PRD06-RISK-P10`, `PRD06-RISK-R18`

### Question

If Leyforge uses any local Godot/Zylann/native patch, can it be reproduced from a clean upstream baseline and carried through build/export with explicit identity?

### Hypotheses

  - H1: Every local patch is a governed dependency delta with reproducible source/build evidence.
  - H0: At least one required local modification exists only as a workstation state/binary or cannot be re-applied/rebuilt.

### Candidate implementations under test

  - CANDIDATE-A: no local patch — run records explicit `NO-LOCAL-PATCH` baseline.
  - CANDIDATE-B: patchset against immutable upstream revision.
  - CANDIDATE-C: governed fork revision.

### Prerequisites

  - Current dependency inventory from FIXTURE-09.
  - Clean acquisition of upstream provider source where patch exists.
  - Build procedure for patched dependency/artifact.

### Build/configuration matrix

  - baseline upstream
  - patched/fork state if present
  - clean second environment/rebuild

### Workload / state

Apply/build/export/smoke the patched component and run the smallest regression case proving why the patch exists.

### Fault / hostility matrix

  - remove patch
  - apply against wrong upstream base
  - rebase/upgrade dry-run where meaningful

### Measurement

  - patch application success
  - artifact manifest patch identity
  - build/export success
  - behavioral regression case result

### Success criterion

Patch/fork can be recreated from documented immutable inputs, appears in composite build identity, and its relevant regression case is reproducible.

### Failure criterion

Required patch cannot be reconstructed, is absent from artifact identity, or gameplay reaches patched internals outside governed provider contracts.

### Inconclusive conditions

No patch currently exists: this is a valid `NO-LOCAL-PATCH` baseline but does not prove future patch reproducibility.

### Required repetition

One clean independent rebuild minimum per existing patchset, with re-run after material dependency upgrades.

### Required evidence artifacts

  - patch/fork reference
  - base revision
  - diff/hash
  - build manifest
  - regression proof output

### PRD-08 decision relevance

Supports patch/fork maintenance ADRs only if a patch actually exists and later upgrade evidence is available.


## 35.13 PRD04-PROOF-74 — Architecture Dependency Lint

**Round-2 planning state:** `SPECIFIED — NOT EXECUTED`  
**Earliest wave:** `W0`  
**Principal fixture(s):** FIXTURE-01 + FIXTURE-07 + FIXTURE-09  
**Detailed PRD-06 consumers (22):** `PRD06-RISK-B09`, `PRD06-RISK-C02`, `PRD06-RISK-C03`, `PRD06-RISK-C05`, `PRD06-RISK-C06`, `PRD06-RISK-C10`, `PRD06-RISK-D07`, `PRD06-RISK-F11`, `PRD06-RISK-P09`, `PRD06-RISK-R01`, `PRD06-RISK-R02`, `PRD06-RISK-R03`, `PRD06-RISK-R05`, `PRD06-RISK-R06`, `PRD06-RISK-R09`, `PRD06-RISK-R11`, `PRD06-RISK-R12`, `PRD06-RISK-R13`, `PRD06-RISK-R17`, `PRD06-RISK-R20`, `PRD06-RISK-R21`, `PRD06-RISK-R22`

### Question

Can automated/static architecture checks detect forbidden dependency inversions and historical/test/provider leakage before they become runtime failures?

### Hypotheses

  - H1: A useful subset of PRD-04/06 authority boundaries can be enforced mechanically.
  - H0: Critical inversions remain dependent solely on human review and repeatedly leak into the code/content graph.

### Candidate implementations under test

  - CANDIDATE-A: layered import/dependency lint.
  - CANDIDATE-B: source-pattern/manifest/schema rules for provider IDs, historical paths/namespaces and authority ownership.
  - CANDIDATE-C: combined CI validator suite.

### Prerequisites

  - Repository/module/source layout sufficiently concrete for rule targets.
  - Known forbidden examples synthesized from PRD-06 C/B/R/P risks.
  - FIXTURE-09 CI-style execution path; FIXTURE-07 content manifest where needed.

### Build/configuration matrix

  - known-good synthetic examples
  - one intentional violation per lint rule
  - historical `.summer`/`/Game/Voxel`/test/compat leakage examples
  - provider-internal dependency examples

### Workload / state

Static/module/content dependency graph plus synthetic bad fixtures.

### Fault / hostility matrix

  - Inject forbidden domain→provider-internal import/reference.
  - Inject runtime/provider ID as durable field.
  - Inject production dependency on `leyforge_test`/legacy path.

### Measurement

  - true-positive count
  - false-negative count on seeded violations
  - false-positive count on known-good fixture
  - execution time (diagnostic)

### Success criterion

Seeded violations are detected with actionable source/rule context and known-good architecture passes; rules can run automatically before later-wave evidence is accepted.

### Failure criterion

A targeted authority inversion/leakage class passes undetected or rule design requires encoding a contradictory architecture assumption.

### Inconclusive conditions

Repository implementation does not yet contain enough structure to apply a rule; mark that rule `HARNESS-BLOCKED`, not passed.

### Required repetition

Every rule has at least one positive and negative fixture; rerun continuously as architecture/code grows.

### Required evidence artifacts

  - lint rule manifest
  - seeded violation fixtures
  - machine-readable report
  - false-positive/negative log

### PRD-08 decision relevance

Continuous governance evidence; failure of one lint implementation does not itself prove the architecture boundary infeasible.



# 36. Wave-0 Shared Measurement Conventions

Round 2 standardizes several measurements used across multiple W0 proofs.

## 36.1 Canonical-state equality

Where exact equality is required, compare a normalized canonical snapshot that excludes:

- runtime object handles;
- provider-local IDs;
- ephemeral cache IDs;
- wall-clock timestamps that do not affect semantics;
- presentation-only state.

The normalization rules must be versioned and stored with the run.

## 36.2 Projection/frame numeric tolerance

A numeric tolerance may be used only for **active/presentation/provider-space** values where the architecture permits approximation.

Canonical cell/identity/address selection cannot be declared correct merely because the numeric value is “close”.

Each candidate run declares its tolerance before execution.

## 36.3 Build comparison

Two runs are comparable only when material build-manifest differences are explicit.

A provider/precision/toolchain change is never silently treated as “the same build”.

## 36.4 Performance data in W0

Timing/memory/size measurements may be collected because they are useful.

They are **diagnostic only** unless the proof explicitly defines a W0 hard bound.

W0 must not invent final hardware/performance budgets from bootstrap results.

# 37. Wave-0 Evidence Package Layout

Recommended evidence directory for each future run:

```text
PRD07-RUN-XXXX/
├── run.yaml
├── build_manifest.*
├── dependency_manifest.*
├── fixture_config.*
├── expected_outcome.*
├── observed_outcome.*
├── diagnostics/
├── raw/
├── snapshots/
├── metrics/
└── summary.md
```

For comparison proofs, sibling runs should share a comparison group identifier in their run metadata.

No directory is created by this document because there are still **zero executed runs**.

# 38. Round-2 Planned Run-ID Policy

Round 2 deliberately allocates **no** `PRD07-RUN-*` IDs.

Run IDs are allocated only when:

1. the proof specification is `READY`;
2. the required fixture/build exists;
3. the candidate/build matrix row is fixed;
4. actual execution is about to begin.

This prevents speculative planning rows from looking like executed evidence.

# 39. Wave-0 Security / Safety Controls

W0 proof work must:

- use synthetic content/identities where practical;
- use no real credentials in build/support fixtures;
- keep fake/test providers and historical compatibility inputs out of production content;
- constrain any custom/native provider build to the controlled development environment;
- treat architecture lint as read-only analysis;
- preserve repository/source state so destructive cache/projection tests cannot delete canonical source assets.

# 40. Round-2 Reverse-Coverage Check

The 13 W0 proof specifications collectively consume **all detailed PRD-06 child risks currently attached to those proof IDs**.

Counts at specification time:

| Proof | Detailed PRD-06 consumers |
|---|---:|
| `PRD04-PROOF-01` | 2 |
| `PRD04-PROOF-02` | 11 |
| `PRD04-PROOF-03` | 9 |
| `PRD04-PROOF-05` | 8 |
| `PRD04-PROOF-06` | 5 |
| `PRD04-PROOF-10` | 3 |
| `PRD04-PROOF-11` | 12 |
| `PRD04-PROOF-12` | 2 |
| `PRD04-PROOF-22` | 3 |
| `PRD04-PROOF-67` | 18 |
| `PRD04-PROOF-70` | 30 |
| `PRD04-PROOF-73` | 10 |
| `PRD04-PROOF-74` | 22 |

A child risk may appear under several proofs. That is intentional.

Round 2 does not require every one of the 263 PRD-06 risks to appear because this pass covers W0 only.

# 41. Round-2 Closure Gates

| Gate | Result |
|---|---|
| W0 stable proof IDs identified | **PASS — 13/13** |
| Proof IDs preserved without renumbering | **PASS** |
| Every W0 proof has explicit question/hypothesis | **PASS — 13/13** |
| Every W0 proof has candidate/build scope | **PASS — 13/13** |
| Every W0 proof has prerequisites | **PASS — 13/13** |
| Every W0 proof has fault/hostility definition | **PASS — 13/13** |
| Every W0 proof has measurements | **PASS — 13/13** |
| Every W0 proof has success criterion | **PASS — 13/13** |
| Every W0 proof has failure criterion | **PASS — 13/13** |
| Every W0 proof has inconclusive conditions | **PASS — 13/13** |
| Every W0 proof has repetition requirement | **PASS — 13/13** |
| Every W0 proof has evidence-artifact requirements | **PASS — 13/13** |
| FIXTURE-01 W0 contract defined | **PASS** |
| FIXTURE-09 W0 contract defined | **PASS** |
| FIXTURE-05 W0 subset defined | **PASS** |
| Runtime-ID and semantic-ID authority remain separated | **PASS** |
| Projection/read-model state remains disposable | **PASS** |
| Provider swap/conformance do not select provider edition | **PASS** |
| Precision/rebase candidates remain unlocked | **PASS** |
| Editor/headless remains distinct from exported artifact | **PASS** |
| W0 performance numbers prevented from becoming final budgets | **PASS** |
| Actual proof runs executed | **PASS — 0** |
| PRD-08 conclusions created | **PASS — 0** |
| Implementation ADRs accepted | **PASS — 0** |
| Architecture reopen candidates created | **PASS — 0** |

**Round-2 closure score: 25 / 25 PASS.**

# 42. Round-2 Verdict

> **ROUND 2 PASS — W0 IDENTITY / ARTIFACT / COORDINATE / PROVIDER / HEADLESS PROOF SPECIFICATIONS COMPLETE.**

PRD-07 now contains executable planning detail for all 13 W0 proofs without pretending that any of them have run.

Most importantly:

1. `PROOF-70` establishes the real-artifact evidence foundation before later proofs depend on export assumptions.
2. `PROOF-02/01/12/22` attack four different ways disposable runtime state can accidentally become authority.
3. `PROOF-03` and `PROOF-67` test provider boundaries without preselecting Module/GDExtension or another implementation.
4. `PROOF-05/06` compare spatial candidates without turning a bootstrap walk/rebase test into a final world-size/performance decision.
5. `PROOF-11` requires the **real headless/dedicated artifact**, not editor headless mode alone.
6. `PROOF-10` tests runtime-role promotion without letting peer/session identity replace stable world/character identity.
7. `PROOF-73` treats a local patch as a reproducible dependency delta—or records an explicit no-patch baseline.
8. `PROOF-74` begins as an early continuous lint gate and expands with the code/content surface.

No Round-2 finding requires PRD-04/05/06 reopening.

# 43. Machine-Readable Round-2 Summary

```yaml
document: PRD-07
version: v0.2
round: 2
status: WORKING
round_status: PASS
wave: W0
proofs_specified:
  - 01
  - 02
  - 03
  - 05
  - 06
  - 10
  - 11
  - 12
  - 22
  - 67
  - 70
  - 73
  - 74
proof_count: 13
fixture_contracts_defined:
  full_w0: [FIXTURE-01, FIXTURE-09]
  subset_w0: [FIXTURE-05]
actual_execution_runs: 0
evidence_artifacts_allocated: 0
prd08_results_created: 0
implementation_adrs_accepted: 0
architecture_reopen_candidates: 0
round2_closure:
  passed: 25
  failed: 0
next_round: W1 Ownership / Worldgen / Collision / Navigation / Transaction Proof Specifications
```

---

**End of PRD-07 v0.2 — Round 2 Working Baseline**


---

# 44. Round-3 Scope — W1 Ownership / Worldgen / Collision / Navigation / Transaction Specifications

Round 3 specifies the **Wave-1 semantic-safety proof cluster**. No proof is executed in this document.

The 17 W1 proofs are:

`04, 13, 14, 15, 16, 17, 18, 19, 21, 23, 24, 25, 26, 33, 34, 63, 68`

# 45. Wave-1 Dependency Spine

```text
W1-A — OWNER / REVISION FOUNDATION
  PROOF-13  Stale Worker Commit
  PROOF-14  Partition Ownership Transfer
  PROOF-19  Main-Thread Independence

W1-B — SIMULATION / DETERMINISM
  PROOF-15  SceneTree-Free Distant Simulation
  PROOF-16  Fidelity Promotion/Demotion
  PROOF-21  Deterministic Seeded Simulation
  PROOF-68  Worker-Order Chaos

W1-C — CANONICAL VOXEL EDIT / DERIVED READINESS
  PROOF-23  One-Block Spatial Fan-Out
  PROOF-24  Late Generation vs Edit
  PROOF-25  Collision Revision Quarantine
  PROOF-26  Nav Dirty Bridge
  PROOF-34  Provider Failure Degradation

W1-D — TRANSACTION SAFETY
  PROOF-04  Cross-Boundary Transaction
  PROOF-17  Cross-Domain Construction Transaction
  PROOF-33  Structure Collapse Transaction
  PROOF-63  End-to-End Transaction Trace

W1-E — COMMON RESOURCE PRESSURE
  PROOF-18  Cross-Provider CPU Saturation
```

`PROOF-18` may begin with synthetic isolated loads, but its strongest W1 execution should occur after the other W1 fixtures can produce realistic competing work.

# 46. Wave-1 Fixture Contract Expansion

## 46.1 FIXTURE-03

Must support:

- explicit authoritative owners/partitions;
- stable semantic IDs;
- ownership epochs and transfer;
- canonical owner/revision snapshots;
- versioned worker proposals;
- delayed/reordered/stale completion;
- deterministic seed/RNG contexts;
- variable worker/thread counts;
- randomized completion scheduling;
- queue depth and **queue age**;
- zero-Node distant populations;
- fidelity promotion/demotion;
- main-thread/render load controls;
- operation/reservation identities;
- canonical state hashing;
- invariant/conservation assertions.

## 46.2 FIXTURE-02

Must support:

- canonical voxel edits and edit revision;
- normalized SpatialChangeSet/invalidation;
- delayed generation;
- collision dirty/build/publish revision;
- navigation dirty/build/publish revision;
- provider delay/failure/stale injection;
- expected dirty-region calculation;
- actor/path consumers;
- structure/integrity trigger;
- derived-readiness observation.

## 46.3 FIXTURE-09 additions

Must record:

- exact worker/provider configuration;
- structured diagnostic capture;
- CPU/time-series metrics for `PROOF-18`;
- correlation context for `PROOF-63`;
- profiler capture where useful, while keeping profiler-on results distinct from release qualification.

# 47. Detailed W1 Proof Specifications

## 47.1 PRD04-PROOF-04 — Cross-boundary transaction

**Round-3 planning state:** `SPECIFIED — NOT EXECUTED`  
**Wave:** `W1`  
**Principal fixture(s):** FIXTURE-03 + FIXTURE-10  
**Detailed PRD-06 consumers (4):** `PRD06-RISK-Q01`, `PRD06-RISK-Q02`, `PRD06-RISK-Q05`, `PRD06-RISK-Q14`

### Question
Can one consequential operation spanning multiple authoritative owners/domains reach exactly one explainable canonical outcome under failure, cancellation and concurrency?

### Hypotheses
  - H1: Leyforge can coordinate a cross-boundary operation with one explicit semantic commit while domain owners retain authority.
  - H0: At least one participant can partially commit, duplicate, lose or reinterpret the operation independently.

### Candidate implementations under test
  - CANDIDATE-A: command→validate/reserve→prepare→commit orchestration with explicit owner responses.
  - CANDIDATE-B: another minimum-consistency orchestration that preserves the same explicit semantic commit.

### Prerequisites
  - W0 identity/build baselines available.
  - FIXTURE-03 exposes at least two authoritative owners/domains and stable operation IDs.
  - Canonical pre/post snapshots and fault injection exist.

### Build/configuration matrix
  - success
  - validation rejection
  - failure before commit
  - failure immediately after semantic commit
  - cancellation before/after prepare
  - concurrent competing operation

### Workload / state
Representative operation transferring/conserving state across two or more owners, such as inventory↔world placement.

### Fault / hostility matrix
  - Drop/timeout one participant.
  - Cancel at each phase.
  - Retry same operation ID.
  - Delay one participant while another progresses.

### Measurement
  - canonical conservation delta
  - semantic commit count
  - partial-state count
  - reservation leak count
  - duplicate operation count

### Success criterion
Every run ends in exactly one governed state—committed, rejected, recoverably pending or explicitly compensated—with no silent partial authority.

### Failure criterion
Any domain commits a consequence incompatible with the final operation state, or the same operation produces more than one semantic effect.

### Inconclusive conditions
The chosen case does not genuinely span multiple authoritative owners or lacks an observable commit boundary.

### Required repetition
At least 500 seeded operations across all fault points and contention cases.

### Required evidence artifacts
  - transaction phase trace
  - owner/revision snapshots
  - conservation report
  - operation-ID ledger
  - fault-matrix result

### PRD-08 decision relevance
Supports Q/F transaction risk evaluation; does not by itself select a universal transaction architecture.

## 47.2 PRD04-PROOF-13 — Stale Worker Commit

**Round-3 planning state:** `SPECIFIED — NOT EXECUTED`  
**Wave:** `W1`  
**Principal fixture(s):** FIXTURE-03  
**Detailed PRD-06 consumers (6):** `PRD06-RISK-A06`, `PRD06-RISK-F01`, `PRD06-RISK-F02`, `PRD06-RISK-F10`, `PRD06-RISK-F11`, `PRD06-RISK-F13`

### Question
Can stale asynchronous worker/provider results be prevented from mutating newer authoritative state?

### Hypotheses
  - H1: Every authoritative commit validates current owner/session/revision context and rejects stale proposals.
  - H0: Completion order can overwrite newer canonical state.

### Candidate implementations under test
  - CANDIDATE-A: versioned snapshot/proposal with owner-side revision validation.
  - CANDIDATE-B: equivalent epoch/token scheme with explicit stale rejection.

### Prerequisites
  - FIXTURE-03 owner/revision instrumentation.
  - Controllable worker completion order.
  - A mutation source that advances revision while old work remains in flight.

### Build/configuration matrix
  - single stale task
  - many stale tasks
  - owner transfer while pending
  - WorldSession epoch change
  - provider callback after supersession

### Workload / state
Simulation/generation/pathing/provider proposals computed from old snapshots while authoritative state advances.

### Fault / hostility matrix
  - Hold completion, mutate owner state, release result.
  - Randomize thousands of completion orders.

### Measurement
  - stale commit count
  - correct rejection count
  - false rejection count
  - revision before/after
  - diagnostic classification

### Success criterion
Zero stale results commit; valid current-revision work still progresses; stale rejection is correctly classified.

### Failure criterion
Any stale proposal changes authoritative state or the stale policy blocks all useful progress.

### Inconclusive conditions
Worker output has no consequential mutation path or revisions are not observable.

### Required repetition
Minimum 10,000 stale/current task completions with recorded seeds.

### Required evidence artifacts
  - revision traces
  - proposal accept/reject log
  - canonical snapshots
  - classification report

### PRD-08 decision relevance
Direct evidence for F02/F10/F11 and owner/revision proposal decisions.

## 47.3 PRD04-PROOF-14 — Partition Ownership Transfer

**Round-3 planning state:** `SPECIFIED — NOT EXECUTED`  
**Wave:** `W1`  
**Principal fixture(s):** FIXTURE-03 + FIXTURE-05  
**Detailed PRD-06 consumers (5):** `PRD06-RISK-F01`, `PRD06-RISK-F03`, `PRD06-RISK-F04`, `PRD06-RISK-F12`, `PRD06-RISK-I08`

### Question
Can ownership of a partition/entity transfer exactly once while commands and work remain in flight?

### Hypotheses
  - H1: Ownership epochs/handoff semantics ensure exactly one current owner and invalidate old mutation rights.
  - H0: Handoff creates overlapping/no-owner periods, duplicate entities or lost/duplicate commands.

### Candidate implementations under test
  - CANDIDATE-A: prepare/handoff/finalize with ownership epoch.
  - CANDIDATE-B: lease-style ownership transfer with equivalent one-owner invariant.

### Prerequisites
  - FIXTURE-03 ownership directory.
  - Stable entity IDs and owner epochs.
  - FIXTURE-05 minimal command-routing injection.

### Build/configuration matrix
  - idle transfer
  - transfer under command load
  - transfer with stale worker
  - rapid crossings
  - transfer plus disconnect
  - bulk transfer

### Workload / state
Thousands of entities or one highly active entity crossing authority boundaries.

### Fault / hostility matrix
  - Delay owner-directory update.
  - Send command to old owner during handoff.
  - Release old worker after new owner commits.
  - Duplicate transfer request.

### Measurement
  - current-owner count
  - duplicate/lost entity count
  - old-owner commit count
  - command outcomes
  - handoff latency

### Success criterion
Every entity resolves to exactly one valid current owner; old owner cannot commit after epoch change; commands terminate exactly once.

### Failure criterion
Two owners commit, no recoverable owner exists, entity duplicates/disappears or command outcome becomes ambiguous.

### Inconclusive conditions
Fixture changes only a label rather than actual mutation authority.

### Required repetition
At least 10,000 transfers including bulk and hostile-command cases.

### Required evidence artifacts
  - ownership epoch trace
  - identity audit
  - command routing ledger
  - state hashes

### PRD-08 decision relevance
Supports F03/F12 and later recovery/network handoff decisions.

## 47.4 PRD04-PROOF-15 — SceneTree-Free Distant Simulation

**Round-3 planning state:** `SPECIFIED — NOT EXECUTED`  
**Wave:** `W1`  
**Principal fixture(s):** FIXTURE-03  
**Detailed PRD-06 consumers (3):** `PRD06-RISK-F05`, `PRD06-RISK-F06`, `PRD06-RISK-L01`

### Question
Can persistent distant simulation progress correctly with zero live entity Nodes/projections?

### Hypotheses
  - H1: Domain simulation is data/owner driven and can run without SceneTree entities.
  - H0: Persistent simulation requires Node/process/physics/render lifetime.

### Candidate implementations under test
  - CANDIDATE-A: compact partition-owned domain records + explicit scheduler.
  - CANDIDATE-B: governed aggregate/far-state representation.

### Prerequisites
  - FIXTURE-03 can instantiate authoritative populations without entity Nodes.
  - Deterministic/inspectable world-time advancement.
  - Promotion path to active projection exists.

### Build/configuration matrix
  - zero-Node idle progression
  - production/consumption
  - timers/status
  - large distant population
  - save/reload before promotion

### Workload / state
Representative settlement/ecology/automation-like state progressing for long simulated periods offscreen.

### Fault / hostility matrix
  - Destroy all projections.
  - Vary render/main-thread cadence.
  - Promote after extended distant simulation.

### Measurement
  - canonical progression
  - Node count
  - conservation
  - promotion equivalence
  - throughput diagnostic

### Success criterion
Required distant semantics progress with zero entity Nodes and later promotion exposes the same stable identities/state.

### Failure criterion
Progress stops/changes because projections are absent, or promotion reconstructs different semantic state.

### Inconclusive conditions
Scenario has no meaningful persistent progression.

### Required repetition
Multiple simulated-day/week spans over large synthetic populations; at least 100 promotion checks.

### Required evidence artifacts
  - Node-count proof
  - canonical progression snapshots
  - promotion diffs
  - scheduler traces

### PRD-08 decision relevance
Supports F05 and later simulation partition/fidelity ADR evidence.

## 47.5 PRD04-PROOF-16 — Fidelity Promotion/Demotion

**Round-3 planning state:** `SPECIFIED — NOT EXECUTED`  
**Wave:** `W1`  
**Principal fixture(s):** FIXTURE-03  
**Detailed PRD-06 consumers (3):** `PRD06-RISK-F06`, `PRD06-RISK-G10`, `PRD06-RISK-I04`

### Question
Do fidelity promotion/demotion cycles preserve all semantics the domain requires to conserve?

### Hypotheses
  - H1: Fidelity changes representation/detail, not identity, ownership, conserved quantities or commitments.
  - H0: Near/far transitions create/delete resources, identities, timers or obligations.

### Candidate implementations under test
  - CANDIDATE-A: aggregate/regional/active/physical states with versioned conversion.
  - CANDIDATE-B: fewer tiers if sufficient.

### Prerequisites
  - FIXTURE-03 distant/active representations.
  - Declared conservation invariants.
  - Repeatable transition controls.

### Build/configuration matrix
  - aggregate→active
  - active→aggregate
  - rapid oscillation
  - transition during mutation
  - pending work
  - multiple viewers

### Workload / state
Entities/settlements/resources with inventories, timers, production and stable identity.

### Fault / hostility matrix
  - Rapid threshold crossing.
  - Delay worker across transition.
  - Force load-pressure degradation.

### Measurement
  - identity equality
  - resource conservation delta
  - timer/obligation continuity
  - transition count
  - oscillation rate

### Success criterion
All declared invariants survive repeated transitions; representation differences remain within predeclared semantics.

### Failure criterion
Identity/resources/obligations drift or player proximity changes authoritative outcome beyond allowed policy.

### Inconclusive conditions
Conservation/invariant set is unspecified.

### Required repetition
At least 10,000 transitions across representative state classes.

### Required evidence artifacts
  - transition ledger
  - canonical snapshots
  - conservation report
  - oscillation metrics

### PRD-08 decision relevance
Supports F06/G10 and fidelity-state decisions.

## 47.6 PRD04-PROOF-17 — Cross-Domain Construction Transaction

**Round-3 planning state:** `SPECIFIED — NOT EXECUTED`  
**Wave:** `W1`  
**Principal fixture(s):** FIXTURE-02 + FIXTURE-03  
**Detailed PRD-06 consumers (9):** `PRD06-RISK-E06`, `PRD06-RISK-Q01`, `PRD06-RISK-Q03`, `PRD06-RISK-Q04`, `PRD06-RISK-Q05`, `PRD06-RISK-Q10`, `PRD06-RISK-Q11`, `PRD06-RISK-Q15`, `PRD06-RISK-Q16`

### Question
Can construction conserve materials, permissions, voxel state and structure identity across every failure point?

### Hypotheses
  - H1: Construction is one cross-domain transaction whose semantic commit precedes derived collision/nav/visual readiness.
  - H0: Materials/voxels/structure identity can partially commit or duplicate.

### Candidate implementations under test
  - CANDIDATE-A: reservation + validation + canonical construction commit + derived fan-out.
  - CANDIDATE-B: equivalent minimum-consistency protocol.

### Prerequisites
  - PROOF-04 transaction harness available.
  - FIXTURE-02 canonical voxel edit path.
  - Inventory/resource owner and permission source available.

### Build/configuration matrix
  - successful build
  - insufficient stock
  - permission revoked
  - target changes
  - duplicate/retry
  - provider failure after commit

### Workload / state
Place/remove a representative structure consuming multiple materials and creating voxel + structure state.

### Fault / hostility matrix
  - Fail after reservation.
  - Fail before/after semantic commit.
  - Delay collision/nav.
  - Retry same operation ID.

### Measurement
  - material conservation
  - voxel/structure identity count
  - reservation leaks
  - duplicate effects
  - derived readiness revision

### Success criterion
Exactly one semantic construction outcome occurs; resources are conserved; permission is enforced; stale derived providers cannot undo the edit.

### Failure criterion
Free/lost materials, ghost/double structures, illegal build, rollback of committed truth or leaked reservation.

### Inconclusive conditions
Test bypasses normal inventory/permission/structure authority.

### Required repetition
At least 1,000 operations over all fault/contended phases.

### Required evidence artifacts
  - construction trace
  - resource ledger
  - voxel/structure snapshots
  - readiness timeline

### PRD-08 decision relevance
Supports Q16 and construction transaction ADR evidence.

## 47.7 PRD04-PROOF-18 — Cross-Provider CPU Saturation

**Round-3 planning state:** `SPECIFIED — NOT EXECUTED`  
**Wave:** `W1`  
**Principal fixture(s):** FIXTURE-03 + FIXTURE-09 + FIXTURE-10  
**Detailed PRD-06 consumers (20):** `PRD06-RISK-A08`, `PRD06-RISK-B07`, `PRD06-RISK-E10`, `PRD06-RISK-G01`, `PRD06-RISK-G02`, `PRD06-RISK-G03`, `PRD06-RISK-G04`, `PRD06-RISK-G05`, `PRD06-RISK-G06`, `PRD06-RISK-G07`, `PRD06-RISK-G08`, `PRD06-RISK-G09`, `PRD06-RISK-G10`, `PRD06-RISK-H02`, `PRD06-RISK-H05`, `PRD06-RISK-H09`, `PRD06-RISK-I02`, `PRD06-RISK-J02`, `PRD06-RISK-Q10`, `PRD06-RISK-Q11`

### Question
Can Godot/provider/domain/persistence/network worker activity coexist under load without unbounded queue growth, starvation or systemic CPU oversubscription?

### Hypotheses
  - H1: Cross-provider budgeting/backpressure can keep useful latency and queue age bounded under representative overload.
  - H0: Independent pools/queues oversubscribe cores or starve critical work despite local correctness.

### Candidate implementations under test
  - CANDIDATE-A: explicit workload classes + bounded queues/admission.
  - CANDIDATE-B: coordinated provider-specific budgets.
  - CANDIDATE-C: alternative scheduler/pool composition.

### Prerequisites
  - FIXTURE-03 synthetic simulation/work queues.
  - FIXTURE-09 exact build/profile identity and CPU metrics.
  - Competing provider/simulation/I/O-like loads.

### Build/configuration matrix
  - idle baseline
  - single subsystem saturation
  - two-pool contention
  - all-provider contention
  - slow I/O
  - priority contention
  - low/high core lanes

### Workload / state
Configurable producers for generation/simulation/nav/persistence/network-like tasks plus latency-sensitive canonical commits.

### Fault / hostility matrix
  - Overproduce beyond capacity.
  - Throttle one consumer.
  - Burst queues.
  - Enable release diagnostics.

### Measurement
  - CPU utilization
  - queue depth
  - queue age
  - critical latency
  - throughput
  - starvation duration
  - memory growth
  - recovery time

### Success criterion
System reaches bounded degraded behavior, critical work progresses within declared experimental limits, and queues recover after pressure falls.

### Failure criterion
Unbounded queue/memory growth, deadlock, indefinite starvation or inability to recover.

### Inconclusive conditions
Workloads do not exercise independent provider pools or exact worker/build configuration is missing.

### Required repetition
Repeated sustained-load windows long enough to reach steady/degraded state across core-count/configuration lanes.

### Required evidence artifacts
  - time-series metrics
  - queue-age histograms
  - CPU/profile capture
  - worker config
  - diagnostic config

### PRD-08 decision relevance
Supports G01–G11; final production budgets remain W5/PRD-08 work.

## 47.8 PRD04-PROOF-19 — Main-Thread Independence

**Round-3 planning state:** `SPECIFIED — NOT EXECUTED`  
**Wave:** `W1`  
**Principal fixture(s):** FIXTURE-03 + FIXTURE-09  
**Detailed PRD-06 consumers (5):** `PRD06-RISK-F05`, `PRD06-RISK-F07`, `PRD06-RISK-F13`, `PRD06-RISK-G05`, `PRD06-RISK-L01`

### Question
Can authoritative domain simulation progress independently of render/main-thread cadence except where explicit provider/projection commits require main-thread access?

### Hypotheses
  - H1: Domain simulation uses governed clocks/schedulers and does not depend on render FPS.
  - H0: Main-thread/render availability changes canonical progression.

### Candidate implementations under test
  - CANDIDATE-A: explicit simulation scheduler/clock outside presentation callbacks.

### Prerequisites
  - FIXTURE-03 pure-domain scenario.
  - Variable render/main-thread load.
  - W0 headless/release-like comparison lane.

### Build/configuration matrix
  - headless/server
  - high-FPS client
  - low-FPS client
  - main-thread presentation stall
  - provider commit needing main thread

### Workload / state
Seeded persistent simulation with timers/production/AI-like state over identical world-time input.

### Fault / hostility matrix
  - Stall render/main thread.
  - Vary frame rate widely.
  - Delay presentation/provider callbacks.

### Measurement
  - canonical state vs world-time
  - simulation steps
  - main-thread wait
  - FPS correlation
  - headless/client equivalence

### Success criterion
Canonical progression follows governed simulation time and remains equivalent across presentation cadence except bounded provider-ready delay.

### Failure criterion
Same semantic time/input yields different authoritative state because of render FPS/main-thread presentation load.

### Inconclusive conditions
Scenario uses physics/presentation as canonical input without a declared contract.

### Required repetition
At least 100 repeated seeded comparisons across cadence/load profiles.

### Required evidence artifacts
  - world-time/state traces
  - frame metrics
  - headless/client state hashes

### PRD-08 decision relevance
Supports F07/F05/F13 and scheduler architecture.

## 47.9 PRD04-PROOF-21 — Deterministic Seeded Simulation

**Round-3 planning state:** `SPECIFIED — NOT EXECUTED`  
**Wave:** `W1`  
**Principal fixture(s):** FIXTURE-03  
**Detailed PRD-06 consumers (7):** `PRD06-RISK-E03`, `PRD06-RISK-E08`, `PRD06-RISK-F06`, `PRD06-RISK-F07`, `PRD06-RISK-F08`, `PRD06-RISK-F09`, `PRD06-RISK-G03`

### Question
Can selected deterministic domains reproduce governed outcomes across repeated runs, worker counts and execution orders?

### Hypotheses
  - H1: Authoritative randomness/ordering is explicit enough to reproduce required semantics.
  - H0: Shared/global RNG, iteration order or completion order changes canonical outcome.

### Candidate implementations under test
  - CANDIDATE-A: explicit seeded RNG streams/context + owner-controlled commit ordering.
  - CANDIDATE-B: deterministic semantic envelope where bitwise identity is unnecessary.

### Prerequisites
  - FIXTURE-03 deterministic seed injection.
  - Normalized canonical-state comparison.
  - Worker-order/thread-count controls.

### Build/configuration matrix
  - same seed/same workers
  - same seed/different workers
  - random completion order
  - different-seed negative control

### Workload / state
Representative worldgen/simulation/AI/production subset declared deterministic.

### Fault / hostility matrix
  - Shuffle iteration order.
  - Randomize worker completion.
  - Change thread count.

### Measurement
  - canonical hash/equivalence
  - random stream audit
  - divergent object/resource count
  - first divergence revision

### Success criterion
Same governed inputs produce declared deterministic/equivalent outcome across allowed scheduling variation; different seeds change only intended randomness.

### Failure criterion
Uncontrolled scheduling/order changes canonical outcome outside the declared envelope.

### Inconclusive conditions
Domain has not declared which outputs require determinism.

### Required repetition
At least 1,000 repeated seeded runs across scheduler/thread variants.

### Required evidence artifacts
  - seed manifests
  - canonical hashes
  - first-divergence traces
  - RNG-context log

### PRD-08 decision relevance
Supports F08/F09 and E determinism risks.

## 47.10 PRD04-PROOF-23 — One-Block Spatial Fan-Out

**Round-3 planning state:** `SPECIFIED — NOT EXECUTED`  
**Wave:** `W1`  
**Principal fixture(s):** FIXTURE-02  
**Detailed PRD-06 consumers (9):** `PRD06-RISK-E01`, `PRD06-RISK-E04`, `PRD06-RISK-E05`, `PRD06-RISK-E09`, `PRD06-RISK-E10`, `PRD06-RISK-H02`, `PRD06-RISK-H11`, `PRD06-RISK-H12`, `PRD06-RISK-I03`

### Question
Does one canonical voxel edit emit the complete and bounded spatial invalidation/fan-out needed by downstream consumers?

### Hypotheses
  - H1: A committed edit produces one revisioned spatial change sufficient for mesh/collision/nav/fluid/structure/read-model consumers.
  - H0: Consumers miss invalidation or independently rediscover/over-expand the region.

### Candidate implementations under test
  - CANDIDATE-A: canonical SpatialChangeSet with consumer-specific expansion.
  - CANDIDATE-B: equivalent normalized edit event + derived invalidation policy.

### Prerequisites
  - FIXTURE-02 canonical edit API.
  - Observable dirty scopes.
  - Revision IDs attached to edit and derived work.

### Build/configuration matrix
  - interior edit
  - chunk/partition boundary
  - support-sensitive edit
  - fluid-adjacent edit
  - rapid repeated edits

### Workload / state
Single/small-burst edits designed to touch multiple downstream consumers.

### Fault / hostility matrix
  - Edit exact boundaries.
  - Queue another edit before derived work completes.

### Measurement
  - expected vs actual dirty regions
  - fan-out count
  - duplicate work
  - missed invalidation
  - revision linkage

### Success criterion
Every necessary consumer receives the correct revisioned dirty scope and fan-out remains bounded by declared expansion rules.

### Failure criterion
A required consumer remains stale/unsafe or a local edit produces unbounded invalidation.

### Inconclusive conditions
Fixture cannot calculate an independent expected dirty region for multiple consumers.

### Required repetition
Thousands of edits across boundary/topology classes.

### Required evidence artifacts
  - SpatialChangeSet log
  - dirty-region maps
  - consumer revision traces
  - fan-out metrics

### PRD-08 decision relevance
Supports E/H/I/Q spatial-change architecture.

## 47.11 PRD04-PROOF-24 — Late Generation vs Edit

**Round-3 planning state:** `SPECIFIED — NOT EXECUTED`  
**Wave:** `W1`  
**Principal fixture(s):** FIXTURE-02 + FIXTURE-03  
**Detailed PRD-06 consumers (7):** `PRD06-RISK-E01`, `PRD06-RISK-E02`, `PRD06-RISK-E06`, `PRD06-RISK-E07`, `PRD06-RISK-E08`, `PRD06-RISK-E09`, `PRD06-RISK-E11`

### Question
Can late generation/provider completion ever overwrite or reinterpret a newer committed player/world edit?

### Hypotheses
  - H1: Generation output is revision/occupancy aware and cannot supersede committed semantic edits.
  - H0: Delayed generation writes baseline terrain over newer edits.

### Candidate implementations under test
  - CANDIDATE-A: generation proposal merged only against expected revision.
  - CANDIDATE-B: generated-base + authoritative edit overlay/materialization.

### Prerequisites
  - FIXTURE-02 delayed generation control.
  - Canonical edit revisions.
  - Ability to hold generation while applying edit.

### Build/configuration matrix
  - generation before edit
  - edit before delayed generation
  - multiple edits while pending
  - boundary generation
  - reload/regeneration

### Workload / state
Terrain cells where generation and player/system edit race for the same location.

### Fault / hostility matrix
  - Hold generator completion, commit edit, release generation.
  - Regenerate region after edit/reload.

### Measurement
  - final canonical voxel
  - edit revision
  - generation rejection/merge result
  - overwritten edit count

### Success criterion
Committed edit remains authoritative regardless of generation completion order; reload/regeneration preserves intended edit.

### Failure criterion
Late generation restores baseline or changes committed edit semantics.

### Inconclusive conditions
Test uses only a synchronous generator path incapable of representing the risk.

### Required repetition
At least 10,000 raced cells across seeds/boundaries.

### Required evidence artifacts
  - generation/edit timeline
  - voxel snapshots
  - revision/merge logs

### PRD-08 decision relevance
Direct evidence for E worldgen/edit ownership risks.

## 47.12 PRD04-PROOF-25 — Collision Revision Quarantine

**Round-3 planning state:** `SPECIFIED — NOT EXECUTED`  
**Wave:** `W1`  
**Principal fixture(s):** FIXTURE-02  
**Detailed PRD-06 consumers (6):** `PRD06-RISK-H01`, `PRD06-RISK-H03`, `PRD06-RISK-H04`, `PRD06-RISK-H08`, `PRD06-RISK-H13`, `PRD06-RISK-Q15`

### Question
When canonical voxels change, can stale collision remain temporarily present without allowing unsafe authoritative interaction?

### Hypotheses
  - H1: Collision readiness/revision is explicit and stale collision is quarantined until current.
  - H0: Physics acts on obsolete collision as if it were current truth.

### Candidate implementations under test
  - CANDIDATE-A: collision revision tags + unsafe-interaction quarantine.
  - CANDIDATE-B: localized blocking/rebuild policy for critical edits.

### Prerequisites
  - FIXTURE-02 edit/collision revision instrumentation.
  - Controllable collision delay.
  - Representative actor/projectile/contact query.

### Build/configuration matrix
  - remove blocker/support
  - add solid
  - rapid burst
  - boundary edit
  - collision failure/delay

### Workload / state
Actor/projectile interacts immediately after canonical geometry changes but before collision catches up.

### Fault / hostility matrix
  - Delay collision publication.
  - Publish stale collision after newer edit.

### Measurement
  - edit revision
  - collision revision
  - unsafe interaction count
  - quarantine duration
  - stale rejection count

### Success criterion
No gameplay consequence is accepted as if stale collision were current; readiness catches up or degrades explicitly.

### Failure criterion
Entity interaction is governed by stale geometry without reconciliation, or stale collision replaces newer state.

### Inconclusive conditions
No authoritative gameplay consequence is connected to the tested collision.

### Required repetition
Thousands of edits/interactions with randomized rebuild delay.

### Required evidence artifacts
  - collision/readiness timeline
  - interaction outcomes
  - revision logs
  - stale diagnostics

### PRD-08 decision relevance
Supports H/E collision readiness and degradation policy.

## 47.13 PRD04-PROOF-26 — Nav Dirty Bridge

**Round-3 planning state:** `SPECIFIED — NOT EXECUTED`  
**Wave:** `W1`  
**Principal fixture(s):** FIXTURE-02  
**Detailed PRD-06 consumers (12):** `PRD06-RISK-H01`, `PRD06-RISK-H02`, `PRD06-RISK-H04`, `PRD06-RISK-H05`, `PRD06-RISK-H06`, `PRD06-RISK-H08`, `PRD06-RISK-H09`, `PRD06-RISK-H10`, `PRD06-RISK-H14`, `PRD06-RISK-I11`, `PRD06-RISK-J08`, `PRD06-RISK-Q15`

### Question
Can canonical voxel edits dirty and rebuild navigation without stale nav becoming alternative world truth?

### Hypotheses
  - H1: Nav invalidation is revisioned/bounded and path use verifies current readiness.
  - H0: Agents trust paths through destroyed topology or stale async bakes overwrite newer nav.

### Candidate implementations under test
  - CANDIDATE-A: dirty-region bridge + revisioned async nav publication.
  - CANDIDATE-B: local graph/voxel navigation with equivalent readiness contract.

### Prerequisites
  - FIXTURE-02 edit→nav dirty instrumentation.
  - Path consumer validates nav revision.
  - Controllable async nav order.

### Build/configuration matrix
  - destroy bridge
  - create barrier
  - open passage
  - rapid edits
  - out-of-order bake
  - boundary edit

### Workload / state
Agents request/use paths through topology changed after request/bake begins.

### Fault / hostility matrix
  - Delay old bake, apply newer edit, release old result.
  - Force path use while nav is stale.

### Measurement
  - dirty-region accuracy
  - nav revision lag
  - stale path accepted count
  - unsafe traversal count
  - rebuild latency diagnostic

### Success criterion
Stale nav/path results are rejected/quarantined; current nav eventually reflects canonical topology.

### Failure criterion
Agent is authorized to traverse impossible topology due solely to stale nav or old bake replaces newer state.

### Inconclusive conditions
Path consumer ignores nav output or topology change does not affect route validity.

### Required repetition
At least 5,000 edit/path/bake-order cases.

### Required evidence artifacts
  - nav revision log
  - path history
  - traversal outcomes
  - async-order seeds

### PRD-08 decision relevance
Supports H02/H03/H08 and dynamic navigation decisions.

## 47.14 PRD04-PROOF-33 — Structure Collapse Transaction

**Round-3 planning state:** `SPECIFIED — NOT EXECUTED`  
**Wave:** `W1`  
**Principal fixture(s):** FIXTURE-02 + FIXTURE-03 + FIXTURE-10  
**Detailed PRD-06 consumers (6):** `PRD06-RISK-J10`, `PRD06-RISK-J17`, `PRD06-RISK-Q01`, `PRD06-RISK-Q07`, `PRD06-RISK-Q14`, `PRD06-RISK-Q17`

### Question
Can support/integrity failure produce exactly one governed structure-collapse transaction with coherent world, drops, damage and derived consequences?

### Hypotheses
  - H1: Structural evidence triggers a new authoritative transaction; provider/physics output does not directly author destruction.
  - H0: Collapse effects emerge independently from providers and diverge.

### Candidate implementations under test
  - CANDIDATE-A: integrity evaluator emits collapse transaction.
  - CANDIDATE-B: equivalent owner-mediated orchestration.

### Prerequisites
  - FIXTURE-02 structure/integrity representation.
  - PROOF-04/17 trace available.
  - Derived outputs observable.

### Build/configuration matrix
  - single support removal
  - progressive damage
  - large collapse
  - provider failure after collapse commit
  - concurrent damage/inventory effects

### Workload / state
Representative built structure with support dependencies and entity/resource consequences.

### Fault / hostility matrix
  - Remove support during provider lag.
  - Fail mesh/collision after semantic collapse.
  - Retry collapse trigger.

### Measurement
  - collapse transaction count
  - affected state equality
  - drop conservation
  - duplicate damage/drop count
  - readiness

### Success criterion
Exactly one canonical collapse transaction determines authoritative destruction/consequences; providers cannot invent extra semantic damage.

### Failure criterion
Provider/physics creates divergent block/drop/damage state or repeated trigger duplicates effects.

### Inconclusive conditions
Collapse is purely visual and has no consequential domain state.

### Required repetition
Hundreds of small/large collapse cases with fault injection.

### Required evidence artifacts
  - collapse trace
  - before/after state
  - drop/damage ledger
  - readiness timeline

### PRD-08 decision relevance
Supports Q17/E/H and collapse/integrity decisions.

## 47.15 PRD04-PROOF-34 — Provider Failure Degradation

**Round-3 planning state:** `SPECIFIED — NOT EXECUTED`  
**Wave:** `W1`  
**Principal fixture(s):** FIXTURE-02 + FIXTURE-10  
**Detailed PRD-06 consumers (10):** `PRD06-RISK-E04`, `PRD06-RISK-E09`, `PRD06-RISK-H01`, `PRD06-RISK-H03`, `PRD06-RISK-H07`, `PRD06-RISK-H12`, `PRD06-RISK-H13`, `PRD06-RISK-I11`, `PRD06-RISK-Q07`, `PRD06-RISK-Q15`

### Question
When a derived/provider subsystem fails, does Leyforge preserve canonical truth and enter an explicit safe degraded state?

### Hypotheses
  - H1: Provider failures are readiness/evidence failures; canonical state survives and unsafe derived interactions are quarantined.
  - H0: Provider failure rolls back/redefines canonical truth or leaves silent unsafe state.

### Candidate implementations under test
  - CANDIDATE-A: provider health/readiness + retry/quarantine.
  - CANDIDATE-B: selected fallback provider/path if later evidence justifies.

### Prerequisites
  - FIXTURE-02 injectable provider failures.
  - Canonical state independent from provider completion.
  - Structured degraded/readiness diagnostics.

### Build/configuration matrix
  - mesh fail
  - collision fail
  - nav fail
  - timeout
  - transient recovery
  - persistent degradation

### Workload / state
Committed voxel/structure changes followed by forced downstream provider failure.

### Fault / hostility matrix
  - Return error.
  - Never complete.
  - Return stale result.
  - Recover after delay.

### Measurement
  - canonical stability
  - unsafe interactions
  - degraded-state publication
  - retry count
  - recovery correctness

### Success criterion
Canonical state remains coherent; consumers degrade/quarantine explicitly; recovery publishes only current revisions.

### Failure criterion
Canonical change is silently undone, stale derived state is treated as current or failure is invisible.

### Inconclusive conditions
Injected failure occurs outside the provider boundary or no readiness consumer exists.

### Required repetition
Repeated transient/persistent failures across multiple derived providers.

### Required evidence artifacts
  - provider health events
  - canonical snapshots
  - readiness state
  - recovery traces

### PRD-08 decision relevance
Supports Q07/H/E and provider-degradation decisions.

## 47.16 PRD04-PROOF-63 — End-to-End Transaction Trace

**Round-3 planning state:** `SPECIFIED — NOT EXECUTED`  
**Wave:** `W1`  
**Principal fixture(s):** FIXTURE-03 + FIXTURE-09 + FIXTURE-10  
**Detailed PRD-06 consumers (26):** `PRD06-RISK-D04`, `PRD06-RISK-F11`, `PRD06-RISK-G08`, `PRD06-RISK-H07`, `PRD06-RISK-H12`, `PRD06-RISK-I07`, `PRD06-RISK-I08`, `PRD06-RISK-J11`, `PRD06-RISK-J13`, `PRD06-RISK-J15`, `PRD06-RISK-J17`, `PRD06-RISK-P17`, `PRD06-RISK-Q01`, `PRD06-RISK-Q02`, `PRD06-RISK-Q05`, `PRD06-RISK-Q06`, `PRD06-RISK-Q07`, `PRD06-RISK-Q08`, `PRD06-RISK-Q09`, `PRD06-RISK-Q12`, `PRD06-RISK-Q13`, `PRD06-RISK-Q14`, `PRD06-RISK-Q15`, `PRD06-RISK-Q16`, `PRD06-RISK-Q17`, `PRD06-RISK-Q18`

### Question
Can one consequential operation be traced end-to-end from command through owner/commit to provider work, persistence/network projections and acknowledgement?

### Hypotheses
  - H1: Stable operation/correlation/revision identities propagate across async boundaries sufficiently to explain the outcome.
  - H0: Context is lost, making duplicates/stale work/durability impossible to diagnose.

### Candidate implementations under test
  - CANDIDATE-A: operation ID + correlation/span hierarchy + owner/session/revision context.
  - CANDIDATE-B: equivalent bounded structured event graph.

### Prerequisites
  - PROOF-04/17 operation IDs.
  - FIXTURE-09 structured diagnostics.
  - Minimal persistence/network/provider projection hooks.

### Build/configuration matrix
  - success
  - validation reject
  - stale provider result
  - retry duplicate
  - delayed persistence/network projection
  - cancellation

### Workload / state
A representative construction-like transaction producing multiple async descendants.

### Fault / hostility matrix
  - Reorder descendants.
  - Drop ack.
  - Force provider retry/failure.
  - Create stale worker descendant.

### Measurement
  - trace completeness
  - orphan event count
  - incorrect context count
  - ability to determine commit status
  - event volume

### Success criterion
A reviewer can determine the one semantic outcome and classify every descendant as current/stale/retry/degraded.

### Failure criterion
A critical step has no correlation to the operation/commit or trace suggests contradictory canonical outcomes.

### Inconclusive conditions
Trace covers only synchronous calls and not real async/provider boundaries.

### Required repetition
At least 1,000 transactions including hostile descendant order.

### Required evidence artifacts
  - structured trace graph
  - operation ledger
  - orphan-context report
  - event-volume metrics

### PRD-08 decision relevance
Supports Q09/P17; W5 later proves production observability overhead.

## 47.17 PRD04-PROOF-68 — Worker-Order Chaos

**Round-3 planning state:** `SPECIFIED — NOT EXECUTED`  
**Wave:** `W1`  
**Principal fixture(s):** FIXTURE-03 + FIXTURE-10  
**Detailed PRD-06 consumers (13):** `PRD06-RISK-A06`, `PRD06-RISK-E02`, `PRD06-RISK-E03`, `PRD06-RISK-F01`, `PRD06-RISK-F02`, `PRD06-RISK-F08`, `PRD06-RISK-F09`, `PRD06-RISK-F10`, `PRD06-RISK-F11`, `PRD06-RISK-F13`, `PRD06-RISK-F14`, `PRD06-RISK-H10`, `PRD06-RISK-I03`

### Question
Does randomized worker/provider completion order preserve all declared authoritative invariants under combined W1 workloads?

### Hypotheses
  - H1: Owner/revision/transaction rules make completion order non-authoritative.
  - H0: Canonical outcome depends on asynchronous completion timing/order.

### Candidate implementations under test
  - CANDIDATE-A: current owner/revision proposal model under randomized completion.
  - CANDIDATE-B: stricter ordering for specific domains if evidence requires it.

### Prerequisites
  - FIXTURE-03 chaos completion control.
  - PROOF-13 stale rejection.
  - Selected deterministic/conservation invariants from 21/16/17.

### Build/configuration matrix
  - random seeds
  - single worker
  - many workers
  - priority-inverted order
  - burst queues
  - owner transfer during chaos

### Workload / state
Combined simulation/generation/transaction/read-model tasks sharing owners and revisions.

### Fault / hostility matrix
  - Shuffle every completion.
  - Delay oldest/newest.
  - Release stale tasks adversarially.

### Measurement
  - invariant violations
  - state divergence
  - stale commit count
  - conservation errors
  - first divergence seed

### Success criterion
All declared semantic invariants hold across randomized schedules; deterministic domains remain equivalent where required; stale work never commits.

### Failure criterion
Any completion-order seed changes canonical outcome outside declared semantics or violates conservation/ownership.

### Inconclusive conditions
Chaos control does not affect real async ordering or invariant set is underspecified.

### Required repetition
Minimum 10,000 randomized schedules, retaining every failing seed.

### Required evidence artifacts
  - chaos seed ledger
  - canonical hashes
  - invariant report
  - first-divergence trace
  - worker config

### PRD-08 decision relevance
Key common evidence for F/G/Q before later network/persistence concurrency work.



# 48. W1 Canonical Invariant Vocabulary

- **IDENTITY** — the stable semantic object remains the same object.
- **ONE-OWNER** — exactly one current mutation authority exists.
- **REVISION** — stale work cannot supersede newer committed state.
- **CONSERVATION** — governed quantities do not appear/disappear.
- **ONE-COMMIT** — consequential operation has one semantic commit outcome.
- **PROJECTION-DERIVED** — collision/nav/mesh/read models do not author truth.
- **SESSION-EPOCH** — old-session work cannot affect a new session.
- **FRAME-INVARIANT** — frame/projection changes do not alter canonical identity/position.
- **DETERMINISM** — declared deterministic semantics are repeatable.
- **BOUNDED-WORK** — overload becomes bounded degradation, not unbounded growth.
- **TRACEABILITY** — consequential outcomes can be explained from structured evidence.

# 49. W1 Stale-Work Classification Vocabulary

```text
CURRENT-ACCEPTED
STALE-REJECTED
SUPERSEDED-REJECTED
OWNER-EPOCH-REJECTED
SESSION-EPOCH-REJECTED
VALIDATION-REJECTED
PROVIDER-FAILED
INVARIANT-VIOLATION
```

This is an evidence vocabulary, not a mandated runtime enum.

# 50. W1 Transaction Evidence Vocabulary

```text
COMMAND
VALIDATE
RESERVE
PREPARE
SEMANTIC-COMMIT
DERIVED-FANOUT
DURABILITY/REPLICATION-PROJECTION
ACKNOWLEDGE
COMPENSATE / RELEASE / QUARANTINE
```

Candidate implementations may combine/omit phases if one unambiguous semantic commit remains observable.

# 51. W1 Performance Evidence Boundary

`PROOF-18` may measure CPU, queue depth/age, latency, throughput, memory and recovery time.

Round 3 forbids promoting those measurements directly into:

- minimum hardware requirements;
- final worker/thread counts;
- final queue capacities;
- final tick budgets;
- final server-player limits.

# 52. W1 Proof Interaction Matrix

| Interaction | Required relationship |
|---|---|
| `13 → 14` | Ownership transfer invalidates old pending work. |
| `13 + 21 → 68` | Chaos combines stale rejection with deterministic-domain checks. |
| `15 ↔ 16` | Distant state survives fidelity transitions. |
| `23 → 25/26/34` | Canonical edit fan-out drives readiness/failure tests. |
| `24 ↔ 13` | Late generation is a stale-proposal problem over voxel authority. |
| `04 → 17/33` | Generic transaction semantics are exercised by construction/collapse. |
| `17 → 23` | Construction commit emits canonical spatial change. |
| `33 → 34` | Collapse remains canonical after derived-provider failure. |
| `04/17/33 → 63` | Traceability explains real consequential transactions. |
| `18 ↔ all W1` | Saturation consumes realistic work from the other W1 fixtures. |

# 53. Round-3 Reverse-Coverage Check

| Proof | Detailed PRD-06 consumers |
|---|---:|
| `PRD04-PROOF-04` | 4 |
| `PRD04-PROOF-13` | 6 |
| `PRD04-PROOF-14` | 5 |
| `PRD04-PROOF-15` | 3 |
| `PRD04-PROOF-16` | 3 |
| `PRD04-PROOF-17` | 9 |
| `PRD04-PROOF-18` | 20 |
| `PRD04-PROOF-19` | 5 |
| `PRD04-PROOF-21` | 7 |
| `PRD04-PROOF-23` | 9 |
| `PRD04-PROOF-24` | 7 |
| `PRD04-PROOF-25` | 6 |
| `PRD04-PROOF-26` | 12 |
| `PRD04-PROOF-33` | 6 |
| `PRD04-PROOF-34` | 10 |
| `PRD04-PROOF-63` | 26 |
| `PRD04-PROOF-68` | 13 |

# 54. Round-3 Closure Gates

| Gate | Result |
|---|---|
| W1 stable proof IDs identified | **PASS — 17/17** |
| Every W1 proof explicitly specified | **PASS — 17/17** |
| Every W1 proof has hypothesis/candidates | **PASS — 17/17** |
| Every W1 proof has prerequisites | **PASS — 17/17** |
| Every W1 proof has workload/fault matrix | **PASS — 17/17** |
| Every W1 proof has measurements | **PASS — 17/17** |
| Every W1 proof has success/failure/inconclusive criteria | **PASS — 17/17** |
| Every W1 proof has repetition/evidence requirements | **PASS — 17/17** |
| FIXTURE-03 W1 expansion defined | **PASS** |
| FIXTURE-02 W1 expansion defined | **PASS** |
| FIXTURE-09 W1 expansion defined | **PASS** |
| One-owner/revision/stale-work law preserved | **PASS** |
| SceneTree remains non-authoritative for distant simulation | **PASS** |
| Fidelity changes preserve governed semantics | **PASS** |
| Generation cannot overwrite committed edits | **PASS** |
| Collision/nav remain revisioned derived state | **PASS** |
| Provider failure cannot redefine canonical truth | **PASS** |
| Cross-domain transaction retains one semantic commit | **PASS** |
| Construction/collapse remain authoritative transactions | **PASS** |
| W1 performance numbers blocked from becoming final budgets | **PASS** |
| Actual proof runs executed | **PASS — 0** |
| PRD-08 conclusions created | **PASS — 0** |
| Implementation ADRs accepted | **PASS — 0** |
| Architecture reopen candidates created | **PASS — 0** |

**Round-3 closure score: 24 / 24 PASS.**

# 55. Round-3 Verdict

> **ROUND 3 PASS — W1 OWNERSHIP / WORLDGEN / COLLISION / NAVIGATION / TRANSACTION PROOF SPECIFICATIONS COMPLETE.**

Key consequences:

1. Stale work is treated as intentional hostile input, not an incidental threading bug.
2. Ownership transfer proves both one current owner and old-work invalidation.
3. Distant simulation/fidelity transitions are tested against identity and conservation.
4. Determinism is scoped explicitly; worker completion order cannot become authority.
5. Canonical voxel edits are the source of bounded derived invalidation.
6. Late generation is tested directly against committed edit authority.
7. Collision/navigation may lag, but stale revisions cannot silently authorize unsafe interaction.
8. Provider failure may degrade service but cannot rewrite canonical truth.
9. Construction and collapse are transaction proofs, not provider side effects.
10. Saturation uses queue age, latency and recovery—not CPU percentage alone.
11. End-to-end traceability is part of correctness for consequential async operations.

No Round-3 finding requires PRD-04/05/06 reopening.

# 56. Machine-Readable Round-3 Summary

```yaml
document: PRD-07
version: v0.3
round: 3
status: WORKING
round_status: PASS
wave: W1
proofs_specified: [04, 13, 14, 15, 16, 17, 18, 19, 21, 23, 24, 25, 26, 33, 34, 63, 68]
proof_count: 17
fixture_contracts_expanded: [FIXTURE-02, FIXTURE-03, FIXTURE-09]
actual_execution_runs: 0
evidence_artifacts_allocated: 0
prd08_results_created: 0
implementation_adrs_accepted: 0
architecture_reopen_candidates: 0
round3_closure:
  passed: 24
  failed: 0
next_round: W2 Network / Persistence / Recovery / Migration Proof Specifications
```

---

**End of PRD-07 v0.3 — Round 3 Working Baseline**


---

# 57. Round-4 Scope — W2 Network / Persistence / Recovery / Migration Specifications

Round 4 specifies the **Wave-2 durability, reconnect and recovery proof cluster**. No proof is executed in this document.

The 20 W2 proofs are:

`07, 09, 20, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 57, 58, 69`

Wave 2 attacks the failure surface where the same committed Leyforge authority is projected into **networking and persistence**.

The governing law is:

> **Transport delivery, semantic commit and durability are different events and must remain distinguishable under failure.**

# 58. Wave-2 Dependency Spine

```text
W2-A — SESSION / SHUTDOWN LIFETIME
  PROOF-07  World Close/Reopen Stale Task
  PROOF-20  Shutdown Drain Matrix

W2-B — COMMAND / ADMISSION / INTEREST
  PROOF-35  Duplicate Command / Lost Ack
  PROOF-36  Protocol Baseline Mismatch
  PROOF-37  Teleport Interest Spike
  PROOF-38  Cross-Domain Interest
  PROOF-44  Client Cache Poison
  PROOF-46  Network Backpressure

W2-C — CHECKPOINT / PERSISTENCE
  PROOF-39  Cross-Store Crash Matrix
  PROOF-40  Corrupt Latest Checkpoint
  PROOF-41  Save During Heavy Edits
  PROOF-47  Persistence Backpressure
  PROOF-48  World Copy / Backup

W2-D — RECONNECT / RESTART / TRAVEL
  PROOF-09  Realm Transition Transaction
  PROOF-42  Reconnect During Realm Transition
  PROOF-43  Reconnect During Inventory Transaction
  PROOF-45  Server Restart Resume

W2-E — MIGRATION
  PROOF-57  Missing Pack World Recovery
  PROOF-58  Pack Upgrade / World Migration

W2-F — REAL CRASH
  PROOF-69  Real Process Crash Recovery
```

`PROOF-69` must use a real exported process and external termination. It cannot be satisfied by a graceful quit, in-process exception or editor stop button.

# 59. Wave-2 Fixture Contract Expansion

## 59.1 FIXTURE-04

Must support:

- SaveCoordinator checkpoint identity and cutoff revision;
- structured DB participant revision;
- voxel-store participant revision;
- journal/operation state;
- checkpoint manifest publication state;
- previous-known-good lineage;
- corruption/torn-write injection;
- slow/paused storage;
- queue depth and queue age;
- pre-migration backup/staging;
- migration outcome log;
- live backup/copy;
- real restart verifier;
- task/session/owner epoch on writes;
- durability class visible to test code.

## 59.2 FIXTURE-05

Must support:

- authoritative server;
- stable world/player/character/entity IDs;
- peer/session IDs separately;
- operation IDs;
- protocol/content/schema baseline handshake;
- controllable packet loss, duplication, reordering and delay;
- disconnect/reconnect at exact phases;
- poisoned client cache;
- bulk vs critical traffic;
- configurable interest rules;
- teleport/realm/vessel interest changes;
- queue depth/age and critical-message latency.

## 59.3 FIXTURE-09 additions

Must support:

- real exported server process launch;
- external forced termination;
- process exit/kill timestamp;
- restart automation;
- exact build/dependency/content manifest per process;
- preservation of crash/recovery artifacts.

# 60. W2 Durability / Network State Vocabulary

For evidence, W2 distinguishes:

```text
RECEIVED
VALIDATED
RESERVED
SEMANTIC-COMMITTED
JOURNALED / DURABILITY-IN-PROGRESS
CHECKPOINT-PUBLISHED
REPLICATED
ACKNOWLEDGED
RECONNECT-RESOLVED
RECOVERED
QUARANTINED
```

These are evidence states, not a mandated implementation enum.

A packet ACK may occur before or after some of these in a candidate implementation, but it must never redefine which semantic/durability state actually occurred.

# 61. Detailed W2 Proof Specifications

## 61.1 PRD04-PROOF-07 — World Close/Reopen Stale Task

**Round-4 planning state:** `SPECIFIED — NOT EXECUTED`  
**Wave:** `W2`  
**Principal fixture(s):** FIXTURE-04 + FIXTURE-01  
**Detailed PRD-06 consumers (3):** `PRD06-RISK-D03`, `PRD06-RISK-F10`, `PRD06-RISK-L05`

### Question
Can a WorldSession close/reopen while asynchronous persistence/provider work is still pending without any old-session task mutating the new session?

### Hypotheses
  - H1: Session/owner epochs and drain/invalidation barriers prevent stale tasks from writing after close/reopen.
  - H0: Pending work can outlive its session and write into the reopened/replaced world.

### Candidate implementations under test
  - CANDIDATE-A: explicit WorldSession close barrier + epoch invalidation + provider drain.
  - CANDIDATE-B: session-scoped provider instances with hard lifetime isolation plus bounded drain.

### Prerequisites
  - FIXTURE-04 pending save/provider tasks controllable.
  - WorldSession epoch visible in every consequential task.
  - Ability to close/reopen same world and open a different world immediately.

### Build/configuration matrix
  - close/reopen same world
  - close A/open B
  - close during save
  - close during provider I/O
  - rapid repeated reopen
  - crash-restart variant later under PROOF-69

### Workload / state
Edited world with queued voxel/DB/journal/provider work at multiple revisions.

### Fault / hostility matrix
  - Hold old task until after reopen.
  - Retarget/recreate provider instance.
  - Queue additional new-session work before old task completes.

### Measurement
  - cross-session write count
  - stale-task reject count
  - final checkpoint lineage
  - world/session ID mismatch count
  - drain duration

### Success criterion
Zero old-session writes reach the reopened/new world; pending work is drained, cancelled or rejected deterministically; current-session writes remain valid.

### Failure criterion
Any stale task mutates the reopened/replaced world or old/new checkpoint lineages become mixed.

### Inconclusive conditions
Fixture cannot prove which session produced a write or all work is synchronous.

### Required repetition
At least 1,000 close/reopen cycles with randomized pending-task timing.

### Required evidence artifacts
  - session/task epoch trace
  - checkpoint/write ledger
  - provider lifetime log
  - before/after world snapshots

### PRD-08 decision relevance
Supports D03/D11 and session-lifetime implementation decisions.

## 61.2 PRD04-PROOF-09 — Realm Transition Transaction

**Round-4 planning state:** `SPECIFIED — NOT EXECUTED`  
**Wave:** `W2`  
**Principal fixture(s):** FIXTURE-01 + FIXTURE-04 + FIXTURE-05  
**Detailed PRD-06 consumers (1):** `PRD06-RISK-Q18`

### Question
Can realm transition commit exactly once across world/frame identity, persistence, networking and player state without partial relocation?

### Hypotheses
  - H1: Realm travel is one authoritative transaction with explicit source/destination/frame/session state.
  - H0: Player/world/frame/network state can partially transition or duplicate.

### Candidate implementations under test
  - CANDIDATE-A: prepare destination + validate/reserve + semantic transition commit + post-commit projections.
  - CANDIDATE-B: equivalent transaction preserving one canonical transition decision.

### Prerequisites
  - W1 transaction/owner IDs available.
  - FIXTURE-01 realm/frame identity.
  - FIXTURE-04 checkpoint hooks.
  - FIXTURE-05 minimal authoritative network session.

### Build/configuration matrix
  - successful travel
  - destination unavailable
  - disconnect mid-transition
  - save/checkpoint during transition
  - retry duplicate travel
  - server restart at transition boundary

### Workload / state
Character with inventory/status and nearby authoritative state moving between two realm/frame contexts.

### Fault / hostility matrix
  - Fail before/after semantic commit.
  - Lose ACK.
  - Disconnect/reconnect.
  - Delay destination readiness.

### Measurement
  - player identity count
  - source/destination presence count
  - inventory conservation
  - transition operation count
  - frame/session revision continuity

### Success criterion
Exactly one canonical realm location exists for the character; inventory/state is conserved; retries/reconnect resolve the original operation rather than create another.

### Failure criterion
Character exists in both/neither realm without recoverable pending state, inventory duplicates/loss occurs, or frame identity is ambiguous.

### Inconclusive conditions
Transition is simulated as simple teleport without realm/session/persistence consequences.

### Required repetition
At least 500 transitions across each failure point.

### Required evidence artifacts
  - transition transaction trace
  - realm/frame snapshots
  - checkpoint/network event log
  - operation-ID ledger

### PRD-08 decision relevance
Supports Q18 and later reconnect/recovery evidence.

## 61.3 PRD04-PROOF-20 — Shutdown Drain Matrix

**Round-4 planning state:** `SPECIFIED — NOT EXECUTED`  
**Wave:** `W2`  
**Principal fixture(s):** FIXTURE-04 + FIXTURE-09  
**Detailed PRD-06 consumers (5):** `PRD06-RISK-D03`, `PRD06-RISK-D11`, `PRD06-RISK-F10`, `PRD06-RISK-G11`, `PRD06-RISK-L05`

### Question
Can shutdown classify every long-running task as drain, cancel, invalidate or provider-drain and terminate without deadlock or silent data loss?

### Hypotheses
  - H1: Shutdown has an explicit task-class policy and bounded ordering.
  - H0: Shutdown closes dependencies in the wrong order, deadlocks, or drops consequential work ambiguously.

### Candidate implementations under test
  - CANDIDATE-A: staged shutdown barrier ordered by authority/dependency.
  - CANDIDATE-B: bounded deadline + explicit forced-cancel policy for non-consequential tasks.

### Prerequisites
  - FIXTURE-04/09 can enumerate active task classes.
  - Clean shutdown command path.
  - Queue/load instrumentation and exact build identity.

### Build/configuration matrix
  - idle shutdown
  - heavy persistence
  - network connections active
  - provider work active
  - stale tasks present
  - deadline exceeded

### Workload / state
Representative queues from persistence, provider, simulation, diagnostics and networking.

### Fault / hostility matrix
  - Block one provider.
  - Slow storage.
  - Create large pending queue.
  - Request shutdown during transaction.

### Measurement
  - shutdown duration
  - unfinished consequential tasks
  - deadlock count
  - cancelled task classes
  - final checkpoint state
  - restart correctness

### Success criterion
Shutdown reaches a bounded terminal state according to declared policy, with consequential state either durably resolved or explicitly marked unrecoverable/pending by policy.

### Failure criterion
Deadlock/hang, ambiguous partial transaction, silent dropped committed state or cross-session work on restart.

### Inconclusive conditions
Only trivial idle shutdown is exercised.

### Required repetition
Hundreds of shutdowns across task/load classes and deadlines.

### Required evidence artifacts
  - shutdown phase trace
  - task-class disposition report
  - final checkpoint manifest
  - restart verification

### PRD-08 decision relevance
Supports D11/G11 and operational shutdown ADRs; does not substitute for real-crash PROOF-69.

## 61.4 PRD04-PROOF-35 — Duplicate Command / Lost Ack

**Round-4 planning state:** `SPECIFIED — NOT EXECUTED`  
**Wave:** `W2`  
**Principal fixture(s):** FIXTURE-05  
**Detailed PRD-06 consumers (9):** `PRD06-RISK-C12`, `PRD06-RISK-F12`, `PRD06-RISK-K03`, `PRD06-RISK-K10`, `PRD06-RISK-K15`, `PRD06-RISK-Q04`, `PRD06-RISK-Q06`, `PRD06-RISK-Q08`, `PRD06-RISK-Q12`

### Question
Can duplicate commands and lost acknowledgements execute a consequential operation exactly once?

### Hypotheses
  - H1: Durable/scoped operation IDs and owner-side deduplication separate semantic commit from packet ACK.
  - H0: Lost ACK or resend can double-execute or lose the operation.

### Candidate implementations under test
  - CANDIDATE-A: operation-ID idempotency table/history.
  - CANDIDATE-B: command/result ledger tied to canonical revision.

### Prerequisites
  - FIXTURE-05 authoritative command path.
  - Stable operation ID.
  - One consequential operation with observable resource/state effect.

### Build/configuration matrix
  - normal ACK
  - drop ACK
  - duplicate command
  - reorder duplicate
  - reconnect resend
  - history-window edge

### Workload / state
Inventory transfer/build/action with exactly measurable consequence.

### Fault / hostility matrix
  - Drop every ACK at selected phase.
  - Duplicate packets/commands.
  - Retry after timeout/reconnect.

### Measurement
  - semantic effect count
  - duplicate rejection count
  - result replay count
  - resource conservation
  - latency/retention diagnostic

### Success criterion
Exactly one semantic effect occurs for one operation ID; duplicate/retry returns or reconstructs the original outcome.

### Failure criterion
Duplicate execution, lost committed operation, or transport ACK determines semantic truth.

### Inconclusive conditions
Operation is naturally idempotent and cannot expose duplication.

### Required repetition
At least 10,000 operations with randomized ACK loss/duplication.

### Required evidence artifacts
  - operation ledger
  - network event trace
  - resource/state snapshots
  - duplicate-result report

### PRD-08 decision relevance
Supports K03/K10/Q06/Q12.

## 61.5 PRD04-PROOF-36 — Protocol Baseline Mismatch

**Round-4 planning state:** `SPECIFIED — NOT EXECUTED`  
**Wave:** `W2`  
**Principal fixture(s):** FIXTURE-05 + FIXTURE-07  
**Detailed PRD-06 consumers (8):** `PRD06-RISK-C07`, `PRD06-RISK-C12`, `PRD06-RISK-K01`, `PRD06-RISK-K04`, `PRD06-RISK-K12`, `PRD06-RISK-K15`, `PRD06-RISK-L06`, `PRD06-RISK-M15`

### Question
Can protocol/content/schema baseline mismatch be detected before ordinary authoritative play and handled without semantic reinterpretation?

### Hypotheses
  - H1: Admission explicitly validates protocol + content/schema/world compatibility.
  - H0: Transport connection success allows incompatible peers to exchange authoritative state.

### Candidate implementations under test
  - CANDIDATE-A: explicit pre-play handshake/admission baseline manifest.
  - CANDIDATE-B: versioned negotiation with bounded compatibility paths.

### Prerequisites
  - FIXTURE-05 handshake/admission control.
  - FIXTURE-07 representative content-pack identities.
  - At least two deliberately incompatible baselines.

### Build/configuration matrix
  - matching baseline
  - protocol mismatch
  - content-pack mismatch
  - schema mismatch
  - world mismatch
  - compatible minor/declared migration path

### Workload / state
Client attempts to join authoritative server under controlled baseline combinations.

### Fault / hostility matrix
  - Tamper one baseline field.
  - Send stale cached baseline.
  - Omit required pack.

### Measurement
  - admission decision
  - time to reject
  - ordinary traffic before rejection count
  - reason-code correctness
  - wrong-baseline delta acceptance count

### Success criterion
Incompatible clients are rejected or explicitly negotiated before ordinary authoritative traffic; reasons are observable and no state is reinterpreted.

### Failure criterion
Peer enters play with incompatible semantics or mismatch is discovered only after state corruption.

### Inconclusive conditions
Handshake only checks transport version and not semantic/content identity.

### Required repetition
Every supported/mismatched matrix cell repeated across clean/reconnect joins.

### Required evidence artifacts
  - handshake manifests
  - admission logs
  - traffic capture summary
  - compatibility decision matrix

### PRD-08 decision relevance
Supports K01/K04/K12 and pack/network compatibility ADRs.

## 61.6 PRD04-PROOF-37 — Teleport Interest Spike

**Round-4 planning state:** `SPECIFIED — NOT EXECUTED`  
**Wave:** `W2`  
**Principal fixture(s):** FIXTURE-05  
**Detailed PRD-06 consumers (7):** `PRD06-RISK-A08`, `PRD06-RISK-G02`, `PRD06-RISK-G10`, `PRD06-RISK-H13`, `PRD06-RISK-K05`, `PRD06-RISK-K07`, `PRD06-RISK-O12`

### Question
Can teleport/realm/vessel movement cause a large interest-set change without unbounded network/CPU/memory spikes or starving control traffic?

### Hypotheses
  - H1: Interest admission/prioritization bounds bulk catch-up while critical state continues.
  - H0: Sudden interest expansion enqueues unlimited snapshots/voxel/entity state.

### Candidate implementations under test
  - CANDIDATE-A: prioritized progressive interest activation with bounded bulk queues.
  - CANDIDATE-B: staged region/snapshot admission with explicit budgets.

### Prerequisites
  - FIXTURE-05 interest engine and bulk data generator.
  - Critical/control traffic lane.
  - Queue depth/age/bandwidth metrics.

### Build/configuration matrix
  - small teleport
  - large teleport
  - realm jump
  - fast vessel movement
  - split-screen union
  - repeated ping-pong teleport

### Workload / state
Large target region containing terrain + entities + cross-domain relevant state.

### Fault / hostility matrix
  - Constrain bandwidth/CPU.
  - Repeat teleport before prior catch-up finishes.

### Measurement
  - queue depth/age
  - memory
  - critical message latency
  - time to useful state
  - dropped/replaced bulk work
  - recovery time

### Success criterion
Queues/memory remain bounded, critical traffic progresses, and target interest converges progressively without semantic deletion/leakage.

### Failure criterion
Unbounded growth, control starvation, disconnect spiral or incorrect state due to aggressive dropping.

### Inconclusive conditions
Fixture interest set is too small to create representative bulk pressure.

### Required repetition
Hundreds of spikes across bandwidth/CPU limits and region sizes.

### Required evidence artifacts
  - interest-set traces
  - network queue metrics
  - latency histograms
  - state convergence snapshots

### PRD-08 decision relevance
Supports K05/K07/G network backpressure risks.

## 61.7 PRD04-PROOF-38 — Cross-Domain Interest

**Round-4 planning state:** `SPECIFIED — NOT EXECUTED`  
**Wave:** `W2`  
**Principal fixture(s):** FIXTURE-05  
**Detailed PRD-06 consumers (2):** `PRD06-RISK-K06`, `PRD06-RISK-K07`

### Question
Can Leyforge compute interest from spatial and non-spatial gameplay relevance without collapsing it into view distance or simulation fidelity?

### Hypotheses
  - H1: Interest is a Leyforge-owned cross-domain policy distinct from rendering and simulation activation.
  - H0: Camera/voxel viewer distance accidentally defines all replicated relevance.

### Candidate implementations under test
  - CANDIDATE-A: composable interest rules/indexes by relation/domain.
  - CANDIDATE-B: spatial core plus explicit remote/ownership/quest/vessel overlays.

### Prerequisites
  - FIXTURE-05 can express spatial, ownership, remote-UI, quest and vessel relevance.
  - Hidden/non-entitled state fixture.
  - Independent simulation-fidelity controls.

### Build/configuration matrix
  - near-visible
  - far-owned
  - remote settlement UI
  - quest target
  - same-vessel
  - hidden/non-entitled
  - split-screen viewers

### Workload / state
Entities/state whose replication relevance differs intentionally from camera distance.

### Fault / hostility matrix
  - Change camera distance without changing gameplay relevance.
  - Change ownership/quest relation without movement.

### Measurement
  - included/excluded entity sets
  - hidden-state leak count
  - missing relevant state count
  - simulation activation changes

### Success criterion
Replication matches declared gameplay relevance while hidden/non-entitled data remains excluded and simulation fidelity remains independently controlled.

### Failure criterion
Relevant remote state is missing, hidden state leaks, or view distance silently changes canonical simulation because of replication.

### Inconclusive conditions
Fixture contains only spatially visible entities.

### Required repetition
Thousands of interest evaluations across combinations/viewers.

### Required evidence artifacts
  - interest decision ledger
  - entitlement set
  - replication snapshots
  - simulation-fidelity comparison

### PRD-08 decision relevance
Supports K06/K07 and interest-policy ADRs.

## 61.8 PRD04-PROOF-39 — Cross-Store Crash Matrix

**Round-4 planning state:** `SPECIFIED — NOT EXECUTED`  
**Wave:** `W2`  
**Principal fixture(s):** FIXTURE-04  
**Detailed PRD-06 consumers (11):** `PRD06-RISK-D01`, `PRD06-RISK-D02`, `PRD06-RISK-D04`, `PRD06-RISK-D10`, `PRD06-RISK-D18`, `PRD06-RISK-E11`, `PRD06-RISK-F04`, `PRD06-RISK-I06`, `PRD06-RISK-K10`, `PRD06-RISK-Q08`, `PRD06-RISK-Q13`

### Question
Can independently asynchronous persistence participants recover one coherent checkpoint lineage across crashes at every cross-store phase?

### Hypotheses
  - H1: SaveCoordinator checkpoint identity/cutoff controls recovery across DB, voxel store, journal and files.
  - H0: Recovery mixes independently newest artifacts and creates a world state that never existed.

### Candidate implementations under test
  - CANDIDATE-A: manifest-published coherent checkpoint with participant revisions.
  - CANDIDATE-B: equivalent lineage protocol with explicit cutoff/commit marker.

### Prerequisites
  - FIXTURE-04 multiple persistence participants.
  - External crash/kill control for later real-process variants.
  - Checkpoint manifest/participant revision observability.

### Build/configuration matrix
  - DB first
  - voxel first
  - journal first
  - manifest before/after each participant
  - concurrent save
  - rollback to previous checkpoint

### Workload / state
World mutation spanning structured state + voxel edit + consequential journal entry.

### Fault / hostility matrix
  - Crash/abort between every participant write/publication boundary.
  - Delay one participant heavily.

### Measurement
  - recovered checkpoint ID
  - participant revision equality to manifest
  - mixed-lineage count
  - lost/double semantic effect
  - fallback count

### Success criterion
Recovery selects exactly one coherent published/known-good lineage and never mixes independent newest files.

### Failure criterion
Recovered state contains participant revisions that never belonged to one checkpoint or committed semantics duplicate/disappear.

### Inconclusive conditions
All data is stored in one atomic store and does not exercise cross-store coherence.

### Required repetition
Every fault phase repeated across multiple checkpoint generations and load orders.

### Required evidence artifacts
  - checkpoint manifests
  - participant revision logs
  - recovered state hashes
  - crash-point matrix

### PRD-08 decision relevance
Core D01/D02/D04/D18 evidence.

## 61.9 PRD04-PROOF-40 — Corrupt Latest Checkpoint

**Round-4 planning state:** `SPECIFIED — NOT EXECUTED`  
**Wave:** `W2`  
**Principal fixture(s):** FIXTURE-04  
**Detailed PRD-06 consumers (3):** `PRD06-RISK-D02`, `PRD06-RISK-D06`, `PRD06-RISK-D12`

### Question
Can corruption/torn write of the newest checkpoint/manifest deterministically fall back to a verified previous-known-good lineage?

### Hypotheses
  - H1: Integrity/publication strategy prevents a corrupt latest checkpoint from being guessed as valid.
  - H0: Corruption produces ambiguous partial recovery or destroys access to prior good state.

### Candidate implementations under test
  - CANDIDATE-A: atomic manifest publication + integrity checksum + retained previous checkpoint.
  - CANDIDATE-B: generation/sequence marker with equivalent verified fallback.

### Prerequisites
  - FIXTURE-04 at least two published checkpoints.
  - Corruption/torn-write injector.
  - Integrity validation before recovery use.

### Build/configuration matrix
  - corrupt manifest
  - truncate manifest
  - corrupt one participant
  - missing newest participant
  - corrupt previous as negative control

### Workload / state
Multiple checkpoint generations with distinct identifiable semantic states.

### Fault / hostility matrix
  - Bit-flip/truncate/remove latest coordination data or participant.

### Measurement
  - selected recovery generation
  - integrity failure classification
  - guessing count
  - data loss relative to last verified checkpoint

### Success criterion
Newest invalid generation is rejected and recovery selects the latest verified coherent predecessor without guessing.

### Failure criterion
Corrupt generation is loaded as valid or valid predecessor becomes inaccessible without justified reason.

### Inconclusive conditions
Fixture validates only file presence, not integrity/lineage.

### Required repetition
Hundreds of corruption patterns across checkpoint generations.

### Required evidence artifacts
  - corruption manifest
  - integrity reports
  - recovery selection trace
  - state hashes

### PRD-08 decision relevance
Supports D02/D12 and checkpoint publication/integrity ADRs.

## 61.10 PRD04-PROOF-41 — Save During Heavy Edits

**Round-4 planning state:** `SPECIFIED — NOT EXECUTED`  
**Wave:** `W2`  
**Principal fixture(s):** FIXTURE-04 + FIXTURE-10  
**Detailed PRD-06 consumers (7):** `PRD06-RISK-D01`, `PRD06-RISK-D05`, `PRD06-RISK-D13`, `PRD06-RISK-D14`, `PRD06-RISK-D18`, `PRD06-RISK-I06`, `PRD06-RISK-J16`

### Question
Can coherent checkpoints be created during heavy active edits without unbounded pause, backlog or false save-success acknowledgement?

### Hypotheses
  - H1: Checkpoint cutoff/revision semantics allow asynchronous saving under mutation while bounding pause and backlog.
  - H0: Save either freezes the world excessively or snapshots mutually inconsistent revisions.

### Candidate implementations under test
  - CANDIDATE-A: cutoff revision + asynchronous participant flush/publication.
  - CANDIDATE-B: staged copy/snapshot strategy if needed.

### Prerequisites
  - FIXTURE-04 continuous heavy-edit generator.
  - Queue depth/age and checkpoint cutoff visibility.
  - Save-success/durability state observable.

### Build/configuration matrix
  - moderate edits
  - heavy voxel edits
  - transaction bursts
  - slow disk
  - repeated autosave
  - save while provider backlog exists

### Workload / state
Continuous world edits at configurable rates while periodic checkpoints execute.

### Fault / hostility matrix
  - Throttle storage.
  - Burst edits across checkpoint cutoff.
  - Delay one participant.

### Measurement
  - pause time
  - checkpoint duration
  - persistence queue depth/age
  - durability lag
  - recovered state coherence
  - false success count

### Success criterion
Checkpoint publishes one coherent cutoff, queues remain bounded or degrade explicitly, and any reported save-success matches the declared durability class.

### Failure criterion
Unbounded backlog, long uncontrolled global freeze, incoherent checkpoint, or save-success reported before required durability.

### Inconclusive conditions
Mutation load is too small or save is synchronous single-store only.

### Required repetition
Long-running sustained-load windows across storage speeds and edit rates.

### Required evidence artifacts
  - cutoff/participant timeline
  - queue metrics
  - recovery verification
  - save-status trace

### PRD-08 decision relevance
Supports D01/D05/D13/D18.

## 61.11 PRD04-PROOF-42 — Reconnect During Realm Transition

**Round-4 planning state:** `SPECIFIED — NOT EXECUTED`  
**Wave:** `W2`  
**Principal fixture(s):** FIXTURE-05 + FIXTURE-01  
**Detailed PRD-06 consumers (6):** `PRD06-RISK-F12`, `PRD06-RISK-J16`, `PRD06-RISK-K02`, `PRD06-RISK-K08`, `PRD06-RISK-K14`, `PRD06-RISK-Q18`

### Question
Can reconnect during an unresolved realm transition restore the same character and transition state exactly once?

### Hypotheses
  - H1: Stable character/operation/frame identity survives disconnect; reconnect resolves the original transition.
  - H0: Reconnect spawns a duplicate character or invents/loses the transition.

### Candidate implementations under test
  - CANDIDATE-A: reconnect lease/session binding + durable transition operation state.
  - CANDIDATE-B: equivalent resume-from-authoritative-revision model.

### Prerequisites
  - PROOF-09 transition harness.
  - FIXTURE-05 reconnect control.
  - Stable character identity distinct from peer ID.

### Build/configuration matrix
  - disconnect before commit
  - after commit before ACK
  - during destination readiness
  - new peer ID
  - server-side timeout edge

### Workload / state
Character mid-transition with inventory and realm/frame state.

### Fault / hostility matrix
  - Drop connection at each transition phase.
  - Reconnect repeatedly.

### Measurement
  - character count
  - transition operation count
  - realm presence count
  - inventory conservation
  - lease/session binding correctness

### Success criterion
Reconnect binds to the same canonical character and resolves the original transition exactly once.

### Failure criterion
Duplicate character, double transition, rollback of committed transition or ambiguous source/destination state.

### Inconclusive conditions
Reconnect restarts from a fresh character/world snapshot without operation history.

### Required repetition
Hundreds of disconnect points with new peer IDs.

### Required evidence artifacts
  - lease/session trace
  - transition ledger
  - character identity snapshots
  - network logs

### PRD-08 decision relevance
Supports K02/K08/Q18.

## 61.12 PRD04-PROOF-43 — Reconnect During Inventory Transaction

**Round-4 planning state:** `SPECIFIED — NOT EXECUTED`  
**Wave:** `W2`  
**Principal fixture(s):** FIXTURE-05 + FIXTURE-04  
**Detailed PRD-06 consumers (7):** `PRD06-RISK-K03`, `PRD06-RISK-K08`, `PRD06-RISK-K09`, `PRD06-RISK-K10`, `PRD06-RISK-Q03`, `PRD06-RISK-Q06`, `PRD06-RISK-Q13`

### Question
Can reconnect during a consequential inventory transaction resolve whether the original operation committed without duplication or loss?

### Hypotheses
  - H1: Durable/scoped operation identity allows exact resume/result recovery after disconnect.
  - H0: Client must guess whether to retry, causing duplicate/lost resources.

### Candidate implementations under test
  - CANDIDATE-A: operation-result history keyed by stable operation ID.
  - CANDIDATE-B: journal-backed pending/committed operation resolution.

### Prerequisites
  - PROOF-35 idempotent command path.
  - FIXTURE-04 transaction persistence hook.
  - FIXTURE-05 reconnect control.

### Build/configuration matrix
  - disconnect before receipt
  - after receipt
  - after reserve
  - after commit
  - after persistence before ACK
  - after ACK not received

### Workload / state
Inventory/resource transfer with clear conservation invariant.

### Fault / hostility matrix
  - Disconnect at every phase.
  - Retry same operation after reconnect.

### Measurement
  - resource conservation
  - operation effect count
  - pending duration
  - result reconstruction success
  - duplicate retry count

### Success criterion
Reconnect can determine and return the original terminal/pending outcome; no resource duplicates/disappears.

### Failure criterion
Client retry changes semantic outcome or transaction state becomes unknowable.

### Inconclusive conditions
Operation is non-consequential or not persisted enough to survive reconnect.

### Required repetition
At least 5,000 phase-randomized transaction/reconnect cycles.

### Required evidence artifacts
  - operation journal
  - resource snapshots
  - reconnect/result trace
  - phase matrix

### PRD-08 decision relevance
Supports K03/K09/Q03/Q06/Q13.

## 61.13 PRD04-PROOF-44 — Client Cache Poison

**Round-4 planning state:** `SPECIFIED — NOT EXECUTED`  
**Wave:** `W2`  
**Principal fixture(s):** FIXTURE-05  
**Detailed PRD-06 consumers (3):** `PRD06-RISK-C12`, `PRD06-RISK-K04`, `PRD06-RISK-K13`

### Question
Can a stale/malicious client cache be repaired to authoritative server truth without mutating the server?

### Hypotheses
  - H1: Client cache/prediction is disposable and baseline/revision validated.
  - H0: Server trusts client cached state or stale baseline enough to corrupt authority.

### Candidate implementations under test
  - CANDIDATE-A: server snapshot+delta repair with baseline identity.
  - CANDIDATE-B: scoped cache invalidation/full snapshot fallback.

### Prerequisites
  - FIXTURE-05 client cache injection.
  - Authoritative server snapshot/revision.
  - Ability to poison voxel/entity/inventory cache.

### Build/configuration matrix
  - stale revision
  - wrong world
  - wrong pack baseline
  - tampered entity
  - tampered voxel
  - partial cache loss

### Workload / state
Reconnect/join using deliberately poisoned local cached state.

### Fault / hostility matrix
  - Modify cache before reconnect.
  - Claim incorrect baseline.

### Measurement
  - server-state mutation count caused by cache
  - time to convergence
  - repair bytes/work diagnostic
  - wrong-cache acceptance count

### Success criterion
Client converges to server truth; poisoned cache never mutates canonical server state; incompatible baseline is rejected/repaired.

### Failure criterion
Server changes to match client cache or corrupted client state persists as accepted truth.

### Inconclusive conditions
Client discards all cache unconditionally and never exercises baseline repair path intended by the candidate.

### Required repetition
Thousands of poisoned baseline/cache cases.

### Required evidence artifacts
  - server/client state hashes
  - repair trace
  - baseline manifest
  - mutation audit

### PRD-08 decision relevance
Supports K04/K13.

## 61.14 PRD04-PROOF-45 — Server Restart Resume

**Round-4 planning state:** `SPECIFIED — NOT EXECUTED`  
**Wave:** `W2`  
**Principal fixture(s):** FIXTURE-05 + FIXTURE-04  
**Detailed PRD-06 consumers (12):** `PRD06-RISK-C12`, `PRD06-RISK-D14`, `PRD06-RISK-D15`, `PRD06-RISK-D17`, `PRD06-RISK-F04`, `PRD06-RISK-K01`, `PRD06-RISK-K02`, `PRD06-RISK-K08`, `PRD06-RISK-K09`, `PRD06-RISK-K14`, `PRD06-RISK-L05`, `PRD06-RISK-Q12`

### Question
Can server restart resume supported worlds/clients from coherent durable state and reconnect history without duplicating characters/operations?

### Hypotheses
  - H1: Restart restores one world/checkpoint/operation baseline and reconnect binds stable identities.
  - H0: Restart loses semantic history, duplicates sessions or mixes incompatible state.

### Candidate implementations under test
  - CANDIDATE-A: checkpoint+journal/history restore with new runtime peer/session IDs.
  - CANDIDATE-B: snapshot + bounded operation-result history.

### Prerequisites
  - PROOF-39 coherent checkpoint baseline.
  - FIXTURE-05 reconnect client.
  - Stable world/character/operation IDs.

### Build/configuration matrix
  - clean restart
  - restart after recent checkpoint
  - restart with unresolved operation
  - restart with disconnected client
  - old history-window edge

### Workload / state
Active world with multiple characters, recent edits and at least one pending/recent consequential operation.

### Fault / hostility matrix
  - Restart immediately after commit but before ACK.
  - Restart after client disconnect.

### Measurement
  - world/checkpoint ID
  - character count
  - operation duplication/loss
  - reconnect convergence
  - history fallback behavior

### Success criterion
Restart loads one coherent world lineage; reconnect restores stable characters and supported operation results without duplication.

### Failure criterion
Runtime identity becomes durable identity, committed operations disappear/repeat, or incompatible state is mixed.

### Inconclusive conditions
Server starts a fresh world or clients are not reconnected against preserved identities.

### Required repetition
Hundreds of restart/reconnect cycles across transaction phases.

### Required evidence artifacts
  - restart manifest
  - checkpoint/journal refs
  - reconnect traces
  - identity/conservation audit

### PRD-08 decision relevance
Supports K01/K02/K08/K09/D14/D15.

## 61.15 PRD04-PROOF-46 — Network Backpressure

**Round-4 planning state:** `SPECIFIED — NOT EXECUTED`  
**Wave:** `W2`  
**Principal fixture(s):** FIXTURE-05 + FIXTURE-10  
**Detailed PRD-06 consumers (8):** `PRD06-RISK-G02`, `PRD06-RISK-G04`, `PRD06-RISK-G07`, `PRD06-RISK-K05`, `PRD06-RISK-K11`, `PRD06-RISK-K14`, `PRD06-RISK-K15`, `PRD06-RISK-K16`

### Question
Can network overload/backpressure remain bounded while critical/control traffic continues or degrades explicitly?

### Hypotheses
  - H1: Traffic classes/admission/backpressure prevent bulk work from causing unbounded queues or semantic timeout cascades.
  - H0: Network queues grow without bound or critical traffic starves.

### Candidate implementations under test
  - CANDIDATE-A: bounded per-class queues + priority/admission.
  - CANDIDATE-B: alternative channel/budget mapping.

### Prerequisites
  - FIXTURE-05 configurable bandwidth/loss/latency.
  - Bulk + critical traffic generators.
  - Queue age/depth and application latency metrics.

### Build/configuration matrix
  - bulk voxel saturation
  - entity burst
  - teleport spike
  - slow client
  - packet loss
  - multiple clients
  - critical command under bulk load

### Workload / state
Sustained bulk snapshots/deltas plus latency-sensitive commands/ACK/control.

### Fault / hostility matrix
  - Throttle bandwidth.
  - Drop packets.
  - Pause one client receive path.
  - Burst interest changes.

### Measurement
  - queue depth/age
  - critical latency
  - memory
  - disconnects
  - throughput
  - recovery time
  - semantic retry count

### Success criterion
Queues/memory remain bounded; critical traffic continues within experimental limits or explicit degradation policy activates without semantic corruption.

### Failure criterion
Unbounded growth, control starvation, cascading duplicate/retry semantics or whole-server collapse from one slow path.

### Inconclusive conditions
Only transport-level throughput is measured without application queues/semantic outcomes.

### Required repetition
Long sustained overload windows across multiple clients and bandwidth profiles.

### Required evidence artifacts
  - network queue metrics
  - latency distributions
  - traffic-class config
  - semantic outcome logs

### PRD-08 decision relevance
Supports K05/K07/K11/K14/K15/K16.

## 61.16 PRD04-PROOF-47 — Persistence Backpressure

**Round-4 planning state:** `SPECIFIED — NOT EXECUTED`  
**Wave:** `W2`  
**Principal fixture(s):** FIXTURE-04 + FIXTURE-10  
**Detailed PRD-06 consumers (9):** `PRD06-RISK-D01`, `PRD06-RISK-D05`, `PRD06-RISK-D13`, `PRD06-RISK-D15`, `PRD06-RISK-D18`, `PRD06-RISK-G02`, `PRD06-RISK-G04`, `PRD06-RISK-G07`, `PRD06-RISK-G11`

### Question
Can persistence overload/backpressure remain bounded without false durability or unrelated simulation/network stalls?

### Hypotheses
  - H1: Persistence queues/admission/durability lag are explicit and bounded under slow storage.
  - H0: Backlog grows unbounded or blocks unrelated authoritative work.

### Candidate implementations under test
  - CANDIDATE-A: bounded persistence queues + durability-lag telemetry + admission/degradation.
  - CANDIDATE-B: staged batching/coalescing limited to semantically safe classes.

### Prerequisites
  - FIXTURE-04 slow-storage control.
  - Heavy-edit generator.
  - Durability/checkpoint state and queue metrics.

### Build/configuration matrix
  - steady moderate writes
  - burst writes
  - slow disk
  - temporary stall
  - autosave overlap
  - shutdown under backlog

### Workload / state
Continuous voxel/DB/journal writes exceeding storage capacity for controlled periods.

### Fault / hostility matrix
  - Throttle I/O drastically.
  - Pause one participant.
  - Resume after backlog.

### Measurement
  - queue depth/age
  - memory growth
  - durability lag
  - canonical commit latency
  - unrelated task latency
  - recovery time

### Success criterion
Backlog remains bounded or explicit admission/degradation occurs; canonical commit/durability semantics remain honest; system recovers after storage resumes.

### Failure criterion
Unbounded memory/queue growth, false save-success, deadlock or unrelated system starvation caused by persistence pressure.

### Inconclusive conditions
Write rate never exceeds storage capacity.

### Required repetition
Sustained overload windows long enough to reach steady degraded state.

### Required evidence artifacts
  - persistence queue series
  - durability lag trace
  - checkpoint outcomes
  - system latency metrics

### PRD-08 decision relevance
Supports D05/D13/D15/D18/G07.

## 61.17 PRD04-PROOF-48 — World Copy / Backup

**Round-4 planning state:** `SPECIFIED — NOT EXECUTED`  
**Wave:** `W2`  
**Principal fixture(s):** FIXTURE-04  
**Detailed PRD-06 consumers (5):** `PRD06-RISK-D09`, `PRD06-RISK-D17`, `PRD06-RISK-E07`, `PRD06-RISK-Q12`, `PRD06-RISK-R15`

### Question
Can a live world backup/copy restore one coherent checkpoint while preserving intended semantic IDs and rebinding copy/deployment identities safely?

### Hypotheses
  - H1: Backup/copy is checkpoint-aware and identity-safe.
  - H0: Live filesystem copy mixes revisions or duplicates deployment/session identities incorrectly.

### Candidate implementations under test
  - CANDIDATE-A: copy from published immutable/coherent checkpoint lineage.
  - CANDIDATE-B: snapshot/export mechanism with explicit world-copy rebinding.

### Prerequisites
  - FIXTURE-04 active saves/checkpoints.
  - Source world remains running.
  - Restore target can run concurrently with source.

### Build/configuration matrix
  - idle copy
  - copy during heavy writes
  - copy newest checkpoint
  - copy previous checkpoint
  - run source+copy concurrently

### Workload / state
World with distinct world-semantic IDs plus deployment/session/runtime identities.

### Fault / hostility matrix
  - Start copy mid-save.
  - Interrupt copy.
  - Restore on second server/process.

### Measurement
  - restored checkpoint coherence
  - semantic-ID preservation
  - deployment/session collision count
  - copy duration/size diagnostic

### Success criterion
Every advertised backup restores one coherent checkpoint; intended in-world semantic IDs remain stable while copy-scoped/deployment identities are safely distinct.

### Failure criterion
Backup mixes revisions, restore corrupts, or source/copy cross-route because duplicated runtime/deployment identity.

### Inconclusive conditions
Copy is taken only while fully offline and cannot address live-backup claim.

### Required repetition
Hundreds of live copies across save phases; concurrent source/copy smoke runs.

### Required evidence artifacts
  - backup manifest
  - restore state hash
  - identity rebinding report
  - source/copy runtime logs

### PRD-08 decision relevance
Supports D09/D17.

## 61.18 PRD04-PROOF-57 — Missing Pack World Recovery

**Round-4 planning state:** `SPECIFIED — NOT EXECUTED`  
**Wave:** `W2`  
**Principal fixture(s):** FIXTURE-04 + FIXTURE-07  
**Detailed PRD-06 consumers (18):** `PRD06-RISK-C01`, `PRD06-RISK-C07`, `PRD06-RISK-C09`, `PRD06-RISK-C11`, `PRD06-RISK-D06`, `PRD06-RISK-D07`, `PRD06-RISK-L06`, `PRD06-RISK-M11`, `PRD06-RISK-M15`, `PRD06-RISK-R04`, `PRD06-RISK-R07`, `PRD06-RISK-R08`, `PRD06-RISK-R09`, `PRD06-RISK-R10`, `PRD06-RISK-R12`, `PRD06-RISK-R13`, `PRD06-RISK-R16`, `PRD06-RISK-R22`

### Question
Can a world with missing required content packs preserve semantic identity and recover through explicit compatibility/quarantine behavior instead of silent substitution?

### Hypotheses
  - H1: Missing IDs remain explicit and governed; world meaning is not guessed.
  - H0: Loader substitutes similar/current content or drops state silently.

### Candidate implementations under test
  - CANDIDATE-A: compatibility/quarantine objects preserving original ID/version/provenance.
  - CANDIDATE-B: hard block for classes where safe compatibility is impossible.

### Prerequisites
  - FIXTURE-07 pack identities.
  - FIXTURE-04 saved world referencing removable pack content.
  - FCC-13E/current stable-ID mappings for representative legacy cases.

### Build/configuration matrix
  - missing optional presentation pack
  - missing authoritative pack
  - one missing item
  - many missing world objects
  - compat mapping available
  - no mapping available

### Workload / state
Saved world containing pack-defined blocks/items/entities and references.

### Fault / hostility matrix
  - Remove/rename pack.
  - Remove dependency.
  - Change namespace/version.

### Measurement
  - silent substitution count
  - preserved unknown-ID count
  - world load outcome
  - data loss count
  - compat/quarantine object count

### Success criterion
Missing content is explicit: governed compatibility/quarantine or deliberate load block occurs; no unrelated replacement is guessed.

### Failure criterion
World silently reinterprets missing IDs, loses player-owned state without report, or load-order remaps identity.

### Inconclusive conditions
Fixture contains no durable references to missing content.

### Required repetition
All supported missing-content classes plus representative FCC-13E migration cases.

### Required evidence artifacts
  - pack manifest
  - world load report
  - compat/quarantine records
  - before/after semantic ID ledger

### PRD-08 decision relevance
Supports D06/D07/M11/R migration safety.

## 61.19 PRD04-PROOF-58 — Pack Upgrade / World Migration

**Round-4 planning state:** `SPECIFIED — NOT EXECUTED`  
**Wave:** `W2`  
**Principal fixture(s):** FIXTURE-04 + FIXTURE-07  
**Detailed PRD-06 consumers (29):** `PRD06-RISK-C01`, `PRD06-RISK-C03`, `PRD06-RISK-C07`, `PRD06-RISK-C09`, `PRD06-RISK-C10`, `PRD06-RISK-C11`, `PRD06-RISK-C12`, `PRD06-RISK-D06`, `PRD06-RISK-D07`, `PRD06-RISK-D08`, `PRD06-RISK-D10`, `PRD06-RISK-E07`, `PRD06-RISK-M04`, `PRD06-RISK-M07`, `PRD06-RISK-M08`, `PRD06-RISK-M11`, `PRD06-RISK-R04`, `PRD06-RISK-R07`, `PRD06-RISK-R08`, `PRD06-RISK-R09`, `PRD06-RISK-R10`, `PRD06-RISK-R12`, `PRD06-RISK-R13`, `PRD06-RISK-R14`, `PRD06-RISK-R15`, `PRD06-RISK-R16`, `PRD06-RISK-R17`, `PRD06-RISK-R18`, `PRD06-RISK-R22`

### Question
Can pack/provider/schema/world upgrades migrate supported worlds while preserving semantic meaning and a known-good source recovery path?

### Hypotheses
  - H1: Migration is staged, version-aware, auditable and preserves source recovery.
  - H0: Upgrade mutates in place, silently reinterprets IDs or strands old data.

### Candidate implementations under test
  - CANDIDATE-A: staged migration copy + explicit resolver + report.
  - CANDIDATE-B: chained/intermediate converter where direct conversion is unsupported.

### Prerequisites
  - FIXTURE-04 migration staging/backup.
  - FIXTURE-07 old/new pack manifests.
  - Representative FCC-13E 312-row generated conformance fixture available by W4 revalidation.

### Build/configuration matrix
  - schema upgrade
  - pack upgrade
  - provider format upgrade
  - generator version change
  - alias redirect
  - contextual migration
  - forced failure

### Workload / state
Versioned worlds containing stable IDs, legacy aliases, pack-defined content and edited regions.

### Fault / hostility matrix
  - Fail at each migration phase.
  - Remove mapping context.
  - Crash during migration (paired with PROOF-69).

### Measurement
  - semantic-ID equivalence
  - migration outcome counts
  - source backup integrity
  - unresolved/quarantine count
  - data loss/duplication
  - report completeness

### Success criterion
Migration preserves governed meaning, keeps source recoverable, logs every disposition and never guesses ambiguous content.

### Failure criterion
Only known-good source is destroyed, IDs silently change meaning, unsupported rows disappear, or partial migrated world becomes authoritative.

### Inconclusive conditions
Migration only changes metadata with no meaningful schema/content/provider difference.

### Required repetition
Representative supported version chain; full FCC-13E 312-row semantic conformance rerun in W4.

### Required evidence artifacts
  - pre/post manifests
  - migration report
  - backup hash
  - semantic ID comparison
  - failure-phase results

### PRD-08 decision relevance
Supports D06–D10/M/R; W4 expands historical/content coverage.

## 61.20 PRD04-PROOF-69 — Real Process Crash Recovery

**Round-4 planning state:** `SPECIFIED — NOT EXECUTED`  
**Wave:** `W2`  
**Principal fixture(s):** FIXTURE-04 + FIXTURE-09  
**Detailed PRD-06 consumers (23):** `PRD06-RISK-D02`, `PRD06-RISK-D03`, `PRD06-RISK-D04`, `PRD06-RISK-D08`, `PRD06-RISK-D09`, `PRD06-RISK-D11`, `PRD06-RISK-D12`, `PRD06-RISK-D14`, `PRD06-RISK-D15`, `PRD06-RISK-D16`, `PRD06-RISK-E07`, `PRD06-RISK-E11`, `PRD06-RISK-F04`, `PRD06-RISK-G11`, `PRD06-RISK-I06`, `PRD06-RISK-J16`, `PRD06-RISK-K10`, `PRD06-RISK-Q03`, `PRD06-RISK-Q08`, `PRD06-RISK-Q13`, `PRD06-RISK-Q18`, `PRD06-RISK-R15`, `PRD06-RISK-R16`

### Question
Does recovery remain correct under real external process termination at randomized persistence/transaction phases?

### Hypotheses
  - H1: Recovery correctness does not depend on graceful cleanup/destructors/in-process exception handling.
  - H0: Save/checkpoint tests pass only because normal shutdown completes pending work.

### Candidate implementations under test
  - CANDIDATE-A: current checkpoint/journal publication strategy under external kill.
  - CANDIDATE-B: revised atomic/durability strategy if real-kill evidence exposes gaps.

### Prerequisites
  - FIXTURE-09 external process controller.
  - Real exported server/world artifact.
  - FIXTURE-04 deterministic phase markers and restart verifier.

### Build/configuration matrix
  - kill before commit
  - after semantic commit
  - during journal write
  - during DB write
  - during voxel write
  - during manifest publication
  - during migration
  - during shutdown

### Workload / state
Real process performing consequential transactions/checkpoints with identifiable phase markers.

### Fault / hostility matrix
  - External forced process termination; no graceful cleanup path.

### Measurement
  - recovered checkpoint lineage
  - semantic effect count
  - corruption count
  - recovery classification
  - restart success
  - lost committed work relative to declared durability

### Success criterion
Every kill point recovers to an explainable allowed state using published durability semantics, never mixed/guessed state.

### Failure criterion
Recovery depends on graceful cleanup, yields mixed lineage, duplicates/loss beyond declared durability, or cannot determine authoritative state.

### Inconclusive conditions
Termination is simulated in-process or OS/runtime still executes normal shutdown handlers.

### Required repetition
Hundreds/thousands of randomized real kills across all phase classes and repeated checkpoint generations.

### Required evidence artifacts
  - external kill schedule
  - process exit evidence
  - checkpoint/journal artifacts
  - restart recovery logs
  - state hashes

### PRD-08 decision relevance
Principal D16 production-recovery evidence; still not full P5 without later artifact/support qualification.



# 62. W2 Crash-Point Matrix

Persistence/recovery proofs must collectively cover at least:

1. before semantic commit;
2. immediately after semantic commit;
3. during/after journal append;
4. before/after DB participant write;
5. before/during/after voxel participant write;
6. during checkpoint manifest construction;
7. immediately before/after manifest publication;
8. during backup/copy;
9. during migration staging;
10. during shutdown drain;
11. after network delivery but before semantic commit;
12. after semantic commit but before ACK;
13. after durability progress but before ACK;
14. during server restart/reconnect.

Every cell must resolve to an explainable state rather than “whatever files happened to be newest”.

# 63. W2 Network Impairment Matrix

Network-facing proofs must vary:

- loss;
- duplication;
- reordering;
- delay/jitter;
- bandwidth throttling;
- slow receiver;
- disconnect/reconnect;
- peer-ID change;
- stale/wrong baseline;
- poisoned cache;
- teleport/realm/vessel interest spikes;
- multiple viewers/clients;
- duplicate consequential commands;
- critical traffic under bulk saturation.

# 64. Durability-Class Evidence Rule

A run may use candidate durability classes such as:

- memory committed;
- journaled;
- checkpoint published;
- backup/export complete.

The exact names remain an ADR question.

However, every user/server-facing “saved” or successful-operation claim in a proof must map to the candidate durability class being asserted.

A run is invalid if it uses “saved” ambiguously.

# 65. Migration Evidence Boundary

W2 tests the **technical migration mechanism**.

W4 will revalidate `PROOF-57/58` against the full content/trust/historical corpus, including the generated FCC-13E **312-row** migration matrix.

Therefore:

- W2 can validate staging, backup, alias resolution, failure handling and provider/schema transitions;
- W4 provides full historical/content semantic coverage;
- neither wave alone is allowed to silently rewrite FCC-13E migration authority.

# 66. W2 Performance Evidence Boundary

`PROOF-37`, `41`, `46`, and `47` may collect load and backpressure measurements.

Round 4 does **not** turn those numbers directly into:

- supported player counts;
- final bandwidth limits;
- final checkpoint cadence;
- final disk requirements;
- final queue capacities;
- final reconnect-history windows.

Those decisions require PRD-08 interpretation and, where product-support claims are involved, W5 qualification evidence.

# 67. Round-4 Reverse-Coverage Check

| Proof | Detailed PRD-06 consumers |
|---|---:|
| `PRD04-PROOF-07` | 3 |
| `PRD04-PROOF-09` | 1 |
| `PRD04-PROOF-20` | 5 |
| `PRD04-PROOF-35` | 9 |
| `PRD04-PROOF-36` | 8 |
| `PRD04-PROOF-37` | 7 |
| `PRD04-PROOF-38` | 2 |
| `PRD04-PROOF-39` | 11 |
| `PRD04-PROOF-40` | 3 |
| `PRD04-PROOF-41` | 7 |
| `PRD04-PROOF-42` | 6 |
| `PRD04-PROOF-43` | 7 |
| `PRD04-PROOF-44` | 3 |
| `PRD04-PROOF-45` | 12 |
| `PRD04-PROOF-46` | 8 |
| `PRD04-PROOF-47` | 9 |
| `PRD04-PROOF-48` | 5 |
| `PRD04-PROOF-57` | 18 |
| `PRD04-PROOF-58` | 29 |
| `PRD04-PROOF-69` | 23 |

# 68. Round-4 Closure Gates

| Gate | Result |
|---|---|
| W2 stable proof IDs identified | **PASS — 20/20** |
| Every W2 proof explicitly specified | **PASS — 20/20** |
| Every W2 proof has hypothesis/candidates | **PASS — 20/20** |
| Every W2 proof has prerequisites | **PASS — 20/20** |
| Every W2 proof has workload/fault matrix | **PASS — 20/20** |
| Every W2 proof has measurements | **PASS — 20/20** |
| Every W2 proof has success/failure/inconclusive criteria | **PASS — 20/20** |
| Every W2 proof has repetition/evidence requirements | **PASS — 20/20** |
| FIXTURE-04 W2 expansion defined | **PASS** |
| FIXTURE-05 W2 expansion defined | **PASS** |
| FIXTURE-09 real-process additions defined | **PASS** |
| Packet ACK remains separate from semantic commit | **PASS** |
| Semantic commit remains separate from durability | **PASS** |
| Interest remains separate from view distance/fidelity | **PASS** |
| Client cache remains non-authoritative | **PASS** |
| Recovery uses coherent checkpoint lineage | **PASS** |
| Save success must map to a declared durability class | **PASS** |
| Missing content cannot be silently substituted | **PASS** |
| Migration preserves known-good source recovery | **PASS** |
| Real crash remains distinct from graceful shutdown | **PASS** |
| W2 load measurements blocked from becoming final product limits | **PASS** |
| Actual proof runs executed | **PASS — 0** |
| PRD-08 conclusions created | **PASS — 0** |
| Implementation ADRs accepted | **PASS — 0** |
| Architecture reopen candidates created | **PASS — 0** |

**Round-4 closure score: 25 / 25 PASS.**

# 69. Round-4 Verdict

> **ROUND 4 PASS — W2 NETWORK / PERSISTENCE / RECOVERY / MIGRATION PROOF SPECIFICATIONS COMPLETE.**

The key consequences are:

1. Network delivery, semantic commit and durability are independently observable.
2. Lost ACK/duplicate command behavior is tested as an exact-once semantic problem.
3. Admission checks protocol/content/schema compatibility before ordinary authoritative play.
4. Interest spikes and bulk transfer are tested for bounded queue/latency behavior.
5. Client cache is explicitly disposable and cannot mutate server truth.
6. Checkpoint recovery is lineage-based rather than “newest file wins”.
7. Corrupt latest checkpoints must fall back to verified known-good state.
8. Heavy-save/persistence overload tests queue age, durability lag and recovery.
9. Reconnect resolves stable character/operation identity instead of inventing new state.
10. Backups/copies must be coherent and identity-safe.
11. Missing packs preserve explicit compatibility/quarantine semantics.
12. Migration is staged, backed up and auditable.
13. `PROOF-69` requires real external process termination.

No Round-4 finding requires PRD-04/05/06 reopening.

# 70. Machine-Readable Round-4 Summary

```yaml
document: PRD-07
version: v0.4
round: 4
status: WORKING
round_status: PASS
wave: W2
proofs_specified: [07, 09, 20, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 57, 58, 69]
proof_count: 20
fixture_contracts_expanded: [FIXTURE-04, FIXTURE-05, FIXTURE-09]
actual_execution_runs: 0
evidence_artifacts_allocated: 0
prd08_results_created: 0
implementation_adrs_accepted: 0
architecture_reopen_candidates: 0
round4_closure:
  passed: 25
  failed: 0
next_round: W3 Fluid / Vessel / Moving-Frame Proof Specifications
```

---

**End of PRD-07 v0.4 — Round 4 Working Baseline**


---

# 71. Round-5 Scope — W3 Fluid / Vessel / Moving-Frame Specifications

Round 5 specifies the **Wave-3 fluid and vessel proof cluster**. No proof is executed in this document.

The seven W3 proofs are:

`08, 27, 28, 29, 30, 31, 32`

The governing separation is:

```text
CANONICAL VESSEL / HULL / FLUID STATE
             ↓
     DERIVED MASS / COM / BUOYANCY
             ↓
   PHYSICS / COLLISION EXECUTION EVIDENCE
             ↓
      PRESENTATION / EFFECTS
```

Physics may provide forces, contacts and motion evidence. It does not own vessel identity, hull state, flooding state or semantic damage.

Likewise, local fluid simulation is a bounded Leyforge-owned semantic system. An ocean is not permission to simulate unbounded infinite-spread water.

# 72. Wave-3 Dependency Spine

```text
W3-A — LOCAL FLUID CONSERVATION
  PROOF-27  Fluid Boundary Breach
  PROOF-28  Ocean / Local Fluid Boundary

W3-B — VESSEL FRAME / OWNERSHIP
  PROOF-08  Vessel Region Crossing
  PROOF-30  Moving Vessel Occupants

W3-C — EDITABLE HULL / COLLISION
  PROOF-29  Vessel Hull Edit Underway
  PROOF-31  Vessel Collision Strategy Matrix

W3-D — FLOODING / BUOYANCY INTEGRATION
  PROOF-32  Vessel Flooding / Buoyancy
```

`PROOF-32` is meaningful only after the local-fluid and editable-hull fixtures are functional enough to expose real conservation/revision failures.

# 73. Wave-3 FIXTURE-06 Expansion

Before W3 proofs become `READY`, FIXTURE-06 must support:

- stable vessel semantic ID;
- vessel-local coordinate/frame system;
- world↔vessel frame conversion;
- vessel owner/region identity and epochs;
- editable vessel-local hull;
- hull revision;
- cargo and occupant stable IDs;
- mass and center-of-mass derived revision;
- candidate collision representation + collision revision;
- bounded internal fluid volume;
- breach/opening definitions;
- external water/ocean boundary;
- contained-water mass;
- flooding revision;
- buoyancy/displaced-volume diagnostic;
- controlled translation/rotation/acceleration;
- board/disembark controls;
- region crossing;
- delayed/stale derived-result injection;
- canonical vessel snapshot/hash;
- revision compatibility assertions across hull/fluid/mass/collision/buoyancy.

# 74. W3 Conservation / Revision Laws

Round 5 defines the following test laws:

1. **Hull identity is vessel-local and stable.**
2. **World-region crossing changes placement/ownership bindings, not hull identity.**
3. **Fluid volume may change only through an accounted source/sink/flux rule.**
4. **The ocean may behave as an explicit reservoir, but must not activate unbounded simulation.**
5. **Hull edits commit canonically before collision/mass/buoyancy/flooding projections catch up.**
6. **Derived vessel properties must name the hull/fluid revision they represent.**
7. **Stale derived properties may exist temporarily but cannot silently become current authority.**
8. **Occupant motion must be applied exactly once across vessel/world frames.**
9. **Flood water contributes to vessel mass until explicitly removed by an authorised drain/pump/outflow rule.**
10. **Repairing a breach stops future ingress; it does not magically delete already-contained water.**
11. **Physics forces/contacts are execution evidence, not canonical semantic truth.**

# 75. Detailed W3 Proof Specifications

## 75.1 PRD04-PROOF-08 — Vessel Region Crossing

**Round-5 planning state:** `SPECIFIED — NOT EXECUTED`  
**Wave:** `W3`  
**Principal fixture(s):** FIXTURE-06  
**Detailed PRD-06 consumers (6):** `PRD06-RISK-A07`, `PRD06-RISK-J01`, `PRD06-RISK-J06`, `PRD06-RISK-J07`, `PRD06-RISK-J08`, `PRD06-RISK-J14`

### Question
Can an editable vessel cross world/region/partition boundaries without rewriting vessel-local identity, duplicating hull state or losing authoritative ownership?

### Hypotheses
  - H1: Vessel identity and vessel-local coordinates remain stable while world-region ownership/frame bindings change.
  - H0: Crossing a region boundary causes hull remap, duplicate/missing voxels, ownership ambiguity or world-space drift.

### Candidate implementations under test
  - CANDIDATE-A: stable vessel domain entity with vessel-local frame and explicit region/owner transfer.
  - CANDIDATE-B: equivalent movable-region representation provided local semantic identity remains independent of world partition IDs.

### Prerequisites
  - FIXTURE-06 stable vessel ID and vessel-local coordinate frame.
  - W1 ownership-transfer/epoch model available.
  - World/region boundary crossing controllable and observable.
  - Canonical hull snapshot/hash independent of world placement.

### Build/configuration matrix
  - slow crossing
  - high-speed crossing
  - large vessel spanning boundary
  - crossing while hull edits pending
  - crossing while occupants aboard
  - repeated back-and-forth crossing

### Workload / state
Editable vessel containing hull voxels/blocks, cargo/state and at least one moving occupant crosses explicit region/partition boundaries.

### Fault / hostility matrix
  - Delay region-owner transfer.
  - Release old-region worker/provider result after crossing.
  - Cross while a hull edit/collision rebuild is pending.
  - Reverse direction before previous handoff fully settles.

### Measurement
  - vessel semantic ID equality
  - vessel-local hull hash
  - current owner count
  - duplicate/missing hull element count
  - world transform continuity
  - stale old-region commit count

### Success criterion
Vessel keeps one semantic identity and unchanged local hull state; exactly one current owner exists; world placement changes coherently; old-region work cannot mutate the post-crossing vessel.

### Failure criterion
Crossing rewrites local hull identity, duplicates/removes hull state, creates overlapping/no ownership, or allows stale old-region commits.

### Inconclusive conditions
Fixture teleports a static mesh/object without exercising editable vessel-local state or ownership transfer.

### Required repetition
At least 5,000 crossings across direction, speed, size and pending-work cases.

### Required evidence artifacts
  - vessel-local state snapshots
  - region/owner epoch trace
  - world↔vessel frame trace
  - stale-result diagnostics
  - occupant/cargo identity audit

### PRD-08 decision relevance
Supports A/J/F moving-frame and ownership risks; does not select the final vessel movement/physics implementation.

## 75.2 PRD04-PROOF-27 — Fluid Boundary Breach

**Round-5 planning state:** `SPECIFIED — NOT EXECUTED`  
**Wave:** `W3`  
**Principal fixture(s):** FIXTURE-02 + FIXTURE-06  
**Detailed PRD-06 consumers (7):** `PRD06-RISK-I01`, `PRD06-RISK-I03`, `PRD06-RISK-I06`, `PRD06-RISK-I07`, `PRD06-RISK-I08`, `PRD06-RISK-I09`, `PRD06-RISK-I11`

### Question
Can bounded local fluid cross simulation-cell/partition boundaries without creating or deleting conserved volume or allowing stale boundary work to overwrite newer fluid state?

### Hypotheses
  - H1: Local fluid transfer uses explicit conserved state and revisioned cross-boundary exchange.
  - H0: Partition boundaries leak/duplicate fluid or update-order differences change conserved outcome.

### Candidate implementations under test
  - CANDIDATE-A: cell/volume conservation with explicit cross-boundary flux exchange.
  - CANDIDATE-B: another bounded local-fluid representation with equivalent mass/volume conservation.

### Prerequisites
  - FIXTURE-02 canonical voxel/fluid boundary cells.
  - FIXTURE-06 bounded tank/hull volumes where needed.
  - Fluid amount/volume conservation metric.
  - Controllable boundary update order and delayed worker completion.

### Build/configuration matrix
  - single partition boundary
  - corner touching multiple partitions
  - steady transfer
  - burst breach
  - load/unload boundary
  - randomized update order

### Workload / state
Finite fluid volumes move through openings that straddle simulation partitions and active/unloaded boundaries.

### Fault / hostility matrix
  - Delay one side of boundary exchange.
  - Randomize worker/update order.
  - Unload/reload one side mid-transfer.
  - Inject stale pre-breach result after newer state.

### Measurement
  - total conserved fluid amount
  - boundary flux mismatch
  - created/destroyed volume
  - first divergence revision
  - stale commit count
  - settling/convergence diagnostic

### Success criterion
Total governed fluid amount remains conserved within the declared numeric representation tolerance; cross-boundary exchange is symmetric/explainable and stale work cannot replace newer state.

### Failure criterion
Fluid appears/disappears beyond tolerance, boundary order changes semantic outcome outside declared envelope, or stale state commits.

### Inconclusive conditions
Fluid is represented only visually or the fixture has no measurable conserved quantity.

### Required repetition
At least 10,000 boundary exchanges across seeds/update orders plus long-duration conservation runs.

### Required evidence artifacts
  - fluid conservation ledger
  - boundary flux trace
  - revision/order seeds
  - before/after volume maps
  - load/unload transition logs

### PRD-08 decision relevance
Supports I01/I04/I06 and later fluid representation/solver ADR evidence.

## 75.3 PRD04-PROOF-28 — Ocean / Local Fluid Boundary

**Round-5 planning state:** `SPECIFIED — NOT EXECUTED`  
**Wave:** `W3`  
**Principal fixture(s):** FIXTURE-02 + FIXTURE-06  
**Detailed PRD-06 consumers (8):** `PRD06-RISK-I01`, `PRD06-RISK-I02`, `PRD06-RISK-I03`, `PRD06-RISK-I04`, `PRD06-RISK-I05`, `PRD06-RISK-I08`, `PRD06-RISK-I09`, `PRD06-RISK-I10`

### Question
Can the global/static ocean concept interact with bounded local simulated fluid without activating an unbounded world-sized fluid simulation or creating/removing water at the interface?

### Hypotheses
  - H1: Ocean-scale water and local dynamic fluid use an explicit semantic boundary that preserves level/pressure/source rules without simulating the whole ocean.
  - H0: Contact with ocean either causes infinite active propagation, volume creation/loss, or contradictory local behavior.

### Candidate implementations under test
  - CANDIDATE-A: analytic/static ocean reservoir boundary feeding bounded local fluid under explicit rules.
  - CANDIDATE-B: tiled/coastal reservoir representation with bounded active interface.
  - CANDIDATE-C: another finite active-domain strategy that preserves the no-infinite-spread design requirement.

### Prerequisites
  - FIXTURE-02 ocean boundary representation.
  - Bounded local fluid simulation volume.
  - Ability to measure active-cell count and local conserved volume.
  - Declared ocean level/source semantics for the test.

### Build/configuration matrix
  - sealed shore
  - small breach to ocean
  - large opening
  - cave below ocean
  - close breach again
  - move active window along coast

### Workload / state
Finite local chambers/channels interact with an effectively unbounded ocean surface/reservoir.

### Fault / hostility matrix
  - Open/close breach repeatedly.
  - Unload/reload local region.
  - Move active simulation window.
  - Apply backpressure/slow processing.

### Measurement
  - active fluid cell count
  - local volume change explained by reservoir flux
  - unbounded propagation count
  - ocean level consistency
  - CPU/queue diagnostic
  - interface revision correctness

### Success criterion
Only bounded local regions simulate dynamically; ocean interaction follows explicit reservoir/level rules; all local volume change is attributable to measured reservoir exchange; no infinite-spread activation occurs.

### Failure criterion
Ocean contact activates unbounded propagation, water appears/disappears without accounted reservoir exchange, or unloaded interfaces corrupt local state.

### Inconclusive conditions
Ocean is merely a rendered plane with no gameplay interaction or local-fluid semantics.

### Required repetition
Hundreds of breach/reseal cycles and long coastal traversal/load-unload runs.

### Required evidence artifacts
  - active-cell time series
  - reservoir flux ledger
  - local volume snapshots
  - boundary readiness/revision trace
  - performance diagnostics

### PRD-08 decision relevance
Supports I02/I03/I06/I08 and preserves the design direction that infinite-spread water is undesirable.

## 75.4 PRD04-PROOF-29 — Vessel Hull Edit Underway

**Round-5 planning state:** `SPECIFIED — NOT EXECUTED`  
**Wave:** `W3`  
**Principal fixture(s):** FIXTURE-06  
**Detailed PRD-06 consumers (12):** `PRD06-RISK-I12`, `PRD06-RISK-J01`, `PRD06-RISK-J02`, `PRD06-RISK-J04`, `PRD06-RISK-J09`, `PRD06-RISK-J10`, `PRD06-RISK-J11`, `PRD06-RISK-J13`, `PRD06-RISK-J15`, `PRD06-RISK-J16`, `PRD06-RISK-J17`, `PRD06-RISK-J18`

### Question
Can a vessel hull be edited while underway without producing stale mass, collision, buoyancy, flooding or structural state that becomes authoritative?

### Hypotheses
  - H1: Hull edits commit canonically first, then mass/collision/buoyancy/flooding/structure projections rebuild against the new hull revision.
  - H0: Editing under motion causes mixed-revision vessel state or provider/physics state to overwrite the canonical hull.

### Candidate implementations under test
  - CANDIDATE-A: canonical vessel-local hull edit + revisioned derived-property rebuild.
  - CANDIDATE-B: grouped/transactional hull edit for changes that must publish together.

### Prerequisites
  - FIXTURE-06 editable hull in vessel-local coordinates.
  - Observable hull revision, mass properties, collision revision, buoyancy/flooding state.
  - Moving vessel state independent from provider handles.

### Build/configuration matrix
  - add hull block
  - remove hull block
  - open below waterline
  - repair breach
  - cargo-bearing structural edit
  - rapid edit burst while accelerating/turning

### Workload / state
Moving vessel receives canonical hull edits while physics/collision/buoyancy/flooding calculations lag by controlled amounts.

### Fault / hostility matrix
  - Delay collision rebuild.
  - Delay mass-property recomputation.
  - Return stale pre-edit provider result.
  - Apply second hull edit before first derived rebuild finishes.

### Measurement
  - hull revision
  - mass/COM revision
  - collision revision
  - buoyancy/flooding revision
  - stale publication count
  - duplicate/lost hull element count
  - motion discontinuity diagnostic

### Success criterion
Hull edit commits exactly once; every derived property either matches the current hull revision or is explicitly stale/quarantined; old results cannot replace current vessel state.

### Failure criterion
Provider/physics result rewrites hull truth, mixed revisions are treated as current, or hull elements duplicate/disappear.

### Inconclusive conditions
Vessel is stationary or hull is not genuinely editable during the tested run.

### Required repetition
Thousands of edits under varied speed/rotation/water exposure with randomized derived delays.

### Required evidence artifacts
  - hull/derived revision timeline
  - mass/COM snapshots
  - collision/buoyancy publication log
  - motion trace
  - stale-result diagnostics

### PRD-08 decision relevance
Supports J01/J02/J03/J06/J11 and editable-hull architecture decisions.

## 75.5 PRD04-PROOF-30 — Moving Vessel Occupants

**Round-5 planning state:** `SPECIFIED — NOT EXECUTED`  
**Wave:** `W3`  
**Principal fixture(s):** FIXTURE-06 + FIXTURE-05  
**Detailed PRD-06 consumers (7):** `PRD06-RISK-A07`, `PRD06-RISK-I12`, `PRD06-RISK-J06`, `PRD06-RISK-J08`, `PRD06-RISK-J14`, `PRD06-RISK-J16`, `PRD06-RISK-J18`

### Question
Can occupants, cargo and transient objects remain semantically and spatially coherent on a translating/rotating vessel without double-applying motion or losing world/vessel frame identity?

### Hypotheses
  - H1: Occupants use explicit vessel-local/world frame relationships while canonical entity identity remains independent of parent transform tricks.
  - H0: Parent/physics/world transforms double-apply movement, drift occupants, or change authoritative position inconsistently.

### Candidate implementations under test
  - CANDIDATE-A: explicit vessel-local attachment/frame state projected into world-space physics/presentation.
  - CANDIDATE-B: physics-relative motion strategy with canonical local-frame ownership retained.

### Prerequisites
  - FIXTURE-06 moving/rotating vessel.
  - Stable occupant/entity IDs.
  - Vessel↔world frame conversion instrumentation.
  - Ability to board/disembark/jump/projectile-test while vessel moves.

### Build/configuration matrix
  - stationary vessel
  - constant translation
  - acceleration/deceleration
  - rotation
  - combined translation+rotation
  - boarding/disembarking
  - jump/projectile while moving
  - networked observer/authority variant

### Workload / state
Multiple occupants/cargo/transient objects move relative to a vessel while the vessel itself moves through world space.

### Fault / hostility matrix
  - Rapid angular velocity change.
  - Cross region boundary while occupied.
  - Temporarily delay vessel transform update to one projection.
  - Disconnect/reconnect an occupant observer where FIXTURE-05 subset permits.

### Measurement
  - vessel-local position error
  - world-space continuity
  - double-motion count
  - occupant identity/owner changes
  - boarding/disembark conservation
  - projectile/interaction frame correctness

### Success criterion
Occupants retain stable identity and coherent vessel-local/world positions; vessel motion is applied exactly once; transitions on/off vessel are explicit and reversible.

### Failure criterion
Occupants drift/teleport/double-move, authoritative location becomes ambiguous, or boarding changes semantic identity.

### Inconclusive conditions
Test uses only visual parenting with no authoritative interaction/physics consequence.

### Required repetition
At least 10,000 movement steps across motion profiles and hundreds of board/disembark transitions.

### Required evidence artifacts
  - vessel/world/occupant transform traces
  - local-position error data
  - boarding state ledger
  - network observer logs where applicable
  - interaction/projectile results

### PRD-08 decision relevance
Supports J04/J07/J12 and A/F/K moving-frame implications.

## 75.6 PRD04-PROOF-31 — Vessel Collision Strategy Matrix

**Round-5 planning state:** `SPECIFIED — NOT EXECUTED`  
**Wave:** `W3`  
**Principal fixture(s):** FIXTURE-06 + FIXTURE-09  
**Detailed PRD-06 consumers (9):** `PRD06-RISK-J01`, `PRD06-RISK-J02`, `PRD06-RISK-J03`, `PRD06-RISK-J09`, `PRD06-RISK-J11`, `PRD06-RISK-J12`, `PRD06-RISK-J14`, `PRD06-RISK-J15`, `PRD06-RISK-J18`

### Question
Which candidate collision strategies for large editable moving vessels remain correct, rebuildable and performant enough to continue into deeper testing?

### Hypotheses
  - H1: At least one bounded collision representation can satisfy required contact correctness while supporting hull edits and motion.
  - H0: Candidate strategies are either semantically unsafe, too stale under edits, unsupported for moving bodies or unacceptably expensive.

### Candidate implementations under test
  - CANDIDATE-A: compound convex decomposition / clustered convex hulls.
  - CANDIDATE-B: segmented/block-cluster collision representation.
  - CANDIDATE-C: simplified coarse dynamic hull plus more detailed query/interaction layers.
  - CANDIDATE-D: another provider/custom strategy allowed by architecture after benchmark evidence.

### Prerequisites
  - FIXTURE-06 representative small/medium/large editable hulls.
  - FIXTURE-09 exact build/provider/physics profile identity.
  - Collision correctness test geometry and controlled hull-edit sequence.
  - Revision/readiness quarantine from W1 collision proof.

### Build/configuration matrix
  - small vessel
  - medium vessel
  - large civilisation-scale vessel
  - simple convex-ish hull
  - highly concave hull
  - damaged/edited hull
  - multiple vessels near/colliding
  - different provider/build lanes where material

### Workload / state
Moving editable vessels collide with world/static structures, other vessels and representative actors while hull edits trigger rebuilds.

### Fault / hostility matrix
  - Edit hull during contact.
  - Force delayed collision rebuild.
  - Rapid repeated damage edits.
  - Two vessels collide while both collision representations are rebuilding.

### Measurement
  - contact false-positive/negative count
  - penetration/tunneling incidents
  - collision rebuild time
  - main-thread stall
  - memory
  - shape/body count
  - CPU cost
  - readiness lag
  - scaling with hull size

### Success criterion
At least one candidate preserves the required contact semantics, respects stale-revision quarantine and demonstrates a plausible scaling path for larger editable vessels without hidden authority inversion.

### Failure criterion
Candidate fundamentally cannot represent moving editable hulls safely, produces unacceptable correctness failures, or cost growth makes the intended scale implausible.

### Inconclusive conditions
Fixture only tests a toy hull or lacks enough geometry/edit diversity to compare scaling.

### Required repetition
Repeated collision/edit suites for each candidate and hull scale; benchmark durations sufficient to compare steady-state and rebuild cost.

### Required evidence artifacts
  - candidate comparison table
  - collision correctness corpus
  - rebuild timing data
  - CPU/memory/profile captures
  - shape-count metrics
  - revision/readiness logs

### PRD-08 decision relevance
Primary evidence for J05/J09/J10 and the future vessel collision ADR; Round 5 must not choose the winner.

## 75.7 PRD04-PROOF-32 — Vessel Flooding / Buoyancy

**Round-5 planning state:** `SPECIFIED — NOT EXECUTED`  
**Wave:** `W3`  
**Principal fixture(s):** FIXTURE-06  
**Detailed PRD-06 consumers (14):** `PRD06-RISK-I01`, `PRD06-RISK-I04`, `PRD06-RISK-I05`, `PRD06-RISK-I09`, `PRD06-RISK-I10`, `PRD06-RISK-I12`, `PRD06-RISK-J04`, `PRD06-RISK-J05`, `PRD06-RISK-J10`, `PRD06-RISK-J11`, `PRD06-RISK-J13`, `PRD06-RISK-J16`, `PRD06-RISK-J17`, `PRD06-RISK-J18`

### Question
Can vessel flooding, displaced volume, mass and buoyancy remain mutually coherent as hull breaches, repairs, cargo and internal water change over time?

### Hypotheses
  - H1: Flooding and buoyancy consume the same current vessel/hull/fluid authority and preserve conservation across changes.
  - H0: Independent systems use stale/mismatched hull or water state, creating impossible buoyancy/mass behavior.

### Candidate implementations under test
  - CANDIDATE-A: compartment/volume-based flooding with derived buoyancy/mass from authoritative hull + contained fluid.
  - CANDIDATE-B: sampled/displaced-volume buoyancy with explicit internal-fluid mass and breach flow.
  - CANDIDATE-C: another finite vessel-local model satisfying the same conservation/readiness contracts.

### Prerequisites
  - FIXTURE-06 watertight and compartmentalized hull variants.
  - PROOF-27/28 local-fluid boundary mechanism available enough for vessel exchange.
  - Observable hull, contained-fluid, mass/COM and buoyancy revisions.
  - Controlled external water level.

### Build/configuration matrix
  - intact floating hull
  - small breach
  - large breach
  - multiple compartments
  - repair while flooding
  - cargo load/unload
  - asymmetric flooding
  - partial sinking/capsize candidate behavior

### Workload / state
Vessel exchanges water with the environment through breaches while mass distribution and buoyant response update.

### Fault / hostility matrix
  - Delay flooding update.
  - Delay mass/COM update.
  - Delay buoyancy calculation.
  - Repair breach while stale water/mass work remains pending.
  - Edit hull under active flooding.

### Measurement
  - water-volume conservation
  - vessel total mass
  - center-of-mass movement
  - displaced-volume/buoyant-force diagnostic
  - hull/fluid/mass/buoyancy revision agreement
  - stale publication count
  - sink/float qualitative outcome

### Success criterion
Water exchange is conserved/accounted; total mass and COM reflect current contained water/cargo/hull state; buoyancy consumes compatible current revisions or explicitly degrades; repairs stop future ingress without deleting existing water.

### Failure criterion
Water/mass appears or disappears, buoyancy uses incompatible stale state as current, repair magically removes contained water, or physics evidence becomes canonical vessel truth.

### Inconclusive conditions
Candidate uses scripted float/sink behavior with no conserved water/mass relationship.

### Required repetition
Hundreds of breach/repair/cargo scenarios plus long-duration flooding runs across vessel sizes.

### Required evidence artifacts
  - fluid exchange ledger
  - mass/COM timeline
  - hull/fluid/buoyancy revision trace
  - motion/sink outcome data
  - candidate comparison notes

### PRD-08 decision relevance
Supports I/J flooding/buoyancy risks and future vessel-fluid ADRs without selecting the solver.



# 76. Vessel Candidate Comparison Discipline

`PROOF-31` and `PROOF-32` are comparison proofs.

Round 5 explicitly forbids declaring a winner from:

- one small boat;
- one frame-rate sample;
- one collision scene;
- one static hull;
- one calm-water case;
- one renderer/editor configuration.

A candidate should advance only if it survives the relevant correctness gates **and** has a plausible scaling path.

A candidate may be eliminated even if it looks visually convincing.

# 77. Fluid Numeric-Tolerance Rule

If the chosen candidate uses floating-point fluid quantities, every run must predeclare:

- amount/volume unit;
- accumulation precision;
- conservation tolerance;
- timestep/substep policy;
- boundary flux accounting;
- rounding/clamping rules.

Tolerance applies to numeric representation.

It does not permit unexplained fluid creation/deletion as gameplay behavior.

# 78. Vessel Physics Evidence Boundary

Round 5 may measure:

- contact behavior;
- penetration/tunneling;
- mass/COM;
- forces;
- acceleration;
- angular response;
- collision rebuild time;
- buoyancy response;
- flooding/sinking outcomes.

These do **not** by themselves define final vessel handling feel.

Gameplay tuning, final ship-control feel and balance remain later design/implementation work once the technical architecture is proven viable.

# 79. W3 Performance Evidence Boundary

Wave 3 may collect CPU/memory/rebuild cost and active-fluid-cell counts.

These numbers are **candidate-comparison evidence**, not final hardware/support budgets.

Particularly:

- `PROOF-28` must prove bounded ocean/local-fluid work;
- `PROOF-31` must expose collision scaling;
- `PROOF-32` must expose flooding/buoyancy update cost.

Final budgets remain W5/PRD-08 qualification matters.

# 80. W3 Cross-Proof Interaction Matrix

| Interaction | Required relationship |
|---|---|
| `27 → 28` | Local cross-boundary conservation underpins ocean/reservoir interface testing. |
| `08 ↔ 30` | Vessel region crossing must preserve occupant/frame semantics. |
| `29 → 31` | Collision candidates must rebuild against current editable hull revision. |
| `29 → 32` | Flooding/mass/buoyancy must consume current hull/breach state. |
| `27/28 → 32` | Flooding exchange must use the same accounted fluid-boundary law. |
| `31 ↔ 30` | Occupant/contact behavior must remain valid on the chosen candidate collision representation. |
| `08/29/30/31/32` | All vessel proofs share one stable vessel semantic identity and local frame. |

# 81. Round-5 Reverse-Coverage Check

| Proof | Detailed PRD-06 consumers |
|---|---:|
| `PRD04-PROOF-08` | 6 |
| `PRD04-PROOF-27` | 7 |
| `PRD04-PROOF-28` | 8 |
| `PRD04-PROOF-29` | 12 |
| `PRD04-PROOF-30` | 7 |
| `PRD04-PROOF-31` | 9 |
| `PRD04-PROOF-32` | 14 |

# 82. Round-5 Closure Gates

| Gate | Result |
|---|---|
| W3 stable proof IDs identified | **PASS — 7/7** |
| Every W3 proof explicitly specified | **PASS — 7/7** |
| Every W3 proof has hypothesis/candidates | **PASS — 7/7** |
| Every W3 proof has prerequisites | **PASS — 7/7** |
| Every W3 proof has workload/fault matrix | **PASS — 7/7** |
| Every W3 proof has measurements | **PASS — 7/7** |
| Every W3 proof has success/failure/inconclusive criteria | **PASS — 7/7** |
| Every W3 proof has repetition/evidence requirements | **PASS — 7/7** |
| FIXTURE-06 W3 expansion defined | **PASS** |
| Local fluid remains conserved and bounded | **PASS — law preserved** |
| Ocean does not imply infinite active simulation | **PASS — law preserved** |
| Vessel-local hull identity remains stable | **PASS** |
| Region crossing cannot rewrite hull identity | **PASS** |
| Hull edits commit before derived vessel state | **PASS** |
| Occupant motion is frame-explicit and applied once | **PASS** |
| Collision strategy remains candidate-based | **PASS** |
| Flooding/buoyancy share current hull/fluid authority | **PASS** |
| Physics remains evidence/execution, not semantic authority | **PASS** |
| W3 measurements blocked from becoming final hardware budgets | **PASS** |
| Actual proof runs executed | **PASS — 0** |
| PRD-08 conclusions created | **PASS — 0** |
| Implementation ADRs accepted | **PASS — 0** |
| Architecture reopen candidates created | **PASS — 0** |

**Round-5 closure score: 23 / 23 PASS.**

# 83. Round-5 Verdict

> **ROUND 5 PASS — W3 FLUID / VESSEL / MOVING-FRAME PROOF SPECIFICATIONS COMPLETE.**

The key consequences are:

1. Local-fluid conservation is proved independently from ocean presentation.
2. Ocean interaction uses a bounded reservoir/interface model candidate rather than infinite active spread.
3. Vessel identity and hull coordinates remain vessel-local across world-region movement.
4. Hull edits are canonical and every mass/collision/buoyancy/flooding projection must identify the hull/fluid revision it represents.
5. Occupants use explicit vessel/world frame relationships; transform parenting alone is not proof.
6. Vessel collision is a measured candidate matrix, not a predetermined implementation.
7. Flood water contributes real conserved mass and cannot disappear merely because the breach is repaired.
8. Physics contacts/forces remain execution evidence below Leyforge semantic vessel authority.
9. Performance measurements are candidate-comparison evidence only until later qualification.

No Round-5 finding requires PRD-04/05/06 reopening.

# 84. Machine-Readable Round-5 Summary

```yaml
document: PRD-07
version: v0.5
round: 5
status: WORKING
round_status: PASS
wave: W3
proofs_specified: [08, 27, 28, 29, 30, 31, 32]
proof_count: 7
fixture_contracts_expanded: [FIXTURE-06]
actual_execution_runs: 0
evidence_artifacts_allocated: 0
prd08_results_created: 0
implementation_adrs_accepted: 0
architecture_reopen_candidates: 0
round5_closure:
  passed: 23
  failed: 0
next_round: W4 Forge / Trust / Art / Presentation / Historical Migration Proof Specifications
```

---

**End of PRD-07 v0.5 — Round 5 Working Baseline**


---

# 85. Round-6 Scope — W4 Forge / Trust / Art / Presentation / Historical-Migration Specifications

Round 6 specifies the **Wave-4 production-content and presentation proof cluster**. No proof is executed in this document.

The 15 W4 proof specifications are:

`49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 71`

`PROOF-57` and `PROOF-58` are **planned W4 revalidations** of the W2 migration mechanisms against the full content/trust/historical corpus.

Controlled source anchors used by this wave include:

- **ART-09** — Forge/Codex asset-production execution contract  
  SHA-256 `6a229ff749bc0013911471df34f5352d63928224ac81f16f15c7d4a11b3fed8d`
- **ART-10** — golden references / QA / production certification authority  
  SHA-256 `06f39cab47a7ced4bb3b32bc8d6671ad37f9104e53a2413fe493b1fcf1f39854`
- **FCC-13E** — 312-row locked legacy semantic migration authority  
  SHA-256 `aa334414ab509e3e7674336f3d62767d3064f29ea1292ccea2ab9a452c6a5610`
- **MAP-00** — locked gameplay authority for ordinary/surveyed/magical-relief cartography, consumed through the existing PRD-06 risk/proof boundary.

The governing Wave-4 separation is:

```text
CANON / GAMEPLAY / MAP / ART AUTHORITY
              ↓
      GOVERNED EDITABLE SOURCE
              ↓
       VALIDATE / BAKE / PACKAGE
              ↓
ROLE-SPECIFIC RUNTIME PRESENTATION PRODUCTS
              ↓
  REAL RUNTIME / ACCESSIBILITY / HARDWARE EVIDENCE
```

A successful bake is not production qualification.

A successful renderer launch is not support certification.

A safe data-only pack is not automatically cheap.

A 3D magical map is not permission to reveal unknown live world truth.

# 86. Wave-4 Dependency Spine

```text
W4-A — FORGE SOURCE / HANDOFF
  PROOF-49  Source → Bake Reproducibility
  PROOF-50  Art Production Handoff Fixture
  PROOF-51  AI vs Human Source Parity
  PROOF-52  Generated Form Explosion

W4-B — CONTENT PACK / TRUST
  PROOF-54  Server/Client Pack Split
  PROOF-55  Safe Mod Smuggling
  PROOF-56  Data Mod Resource Bomb

W4-C — MIGRATION REVALIDATION
  PROOF-57  Missing Pack World Recovery
  PROOF-58  Pack Upgrade / World Migration — full 312-row FCC-13E conformance

W4-D — PRESENTATION / ACCESSIBILITY
  PROOF-53  Renderer/Profile Certification
  PROOF-59  Settings Scope Isolation
  PROOF-60  Safe Graphics Recovery
  PROOF-61  Accessibility Semantic Torture

W4-E — AUTOMATION / REAL-LANE QUALIFICATION
  PROOF-62  Forge CI Build
  PROOF-71  Renderer / Hardware Lane
```

`PROOF-71` may generate strong W4 evidence, but final support-tier interpretation remains PRD-08/W5 qualification work.

# 87. Wave-4 FIXTURE-07 Expansion

Before W4 proof executions are `READY`, FIXTURE-07 must support:

- governed editable source packages;
- canonical registry/source bindings;
- source provenance metadata;
- deterministic/reproducible bake manifest;
- client/server logical pack + role artifact identity;
- dependency/trust graph;
- `leyforge_test` and `leyforge_compat` isolation;
- hostile script/native/editor/path/URI smuggling fixtures;
- declarative resource-bomb fixtures;
- generated material×form/state families;
- AI and human matched authoring tasks;
- ART golden-reference source packages;
- clean-cache/clean-environment bake;
- missing-pack world fixtures;
- full FCC-13E generated 312-row migration corpus;
- machine-readable validator results.

# 88. Wave-4 FIXTURE-08 Expansion

FIXTURE-08 must support:

- representative ART golden runtime scenes;
- multiple candidate renderer/profile lanes;
- reduced quality/effects;
- colour-accessibility cases;
- reduced motion/flash/particle cases;
- muted audio/caption alternatives;
- large UI/text scale;
- controller/keyboard input remap;
- long localization-layout stress;
- split-screen/per-view variants where claimed;
- invalid saved graphics configurations;
- MAP-00 field/surveyed/magical-relief modes;
- authorised map-knowledge fixture separate from live world truth;
- flat/non-drag/list alternatives for essential 3D map tasks;
- task-based semantic readability scoring.

# 89. Detailed W4 Proof Specifications

## 89.1 PRD04-PROOF-49 — Source → Bake Reproducibility

**Round-6 planning state:** `SPECIFIED — NOT EXECUTED`  
**Wave:** `W4`  
**Principal fixture(s):** FIXTURE-07 + FIXTURE-09  
**Detailed PRD-06 consumers (10):** `PRD06-RISK-C03`, `PRD06-RISK-C08`, `PRD06-RISK-M08`, `PRD06-RISK-M09`, `PRD06-RISK-N01`, `PRD06-RISK-N02`, `PRD06-RISK-N06`, `PRD06-RISK-N09`, `PRD06-RISK-N14`, `PRD06-RISK-R04`

### Question
Can approved editable Forge source be cleanly rebuilt into equivalent governed runtime products without manual edits to baked outputs?

### Hypotheses
  - H1: Editable Forge source + canonical bindings + tool/config identity are sufficient to reproduce governed baked products.
  - H0: Runtime products contain hidden/manual authority or bake results depend on undocumented local state.

### Candidate implementations under test
  - CANDIDATE-A: deterministic source→validate→bake→manifest pipeline.
  - CANDIDATE-B: content-addressed/incremental bake cache, provided a clean no-cache rebuild remains equivalent.

### Prerequisites
  - FIXTURE-07 representative governed source assets.
  - Exact tool/build/content identity from FIXTURE-09.
  - Canonical registry bindings available.
  - Ability to delete all generated outputs/cache and rebuild.

### Build/configuration matrix
  - clean rebuild same machine
  - clean rebuild second environment/CI
  - cache warm vs cold
  - source move/path change
  - provider-local ID regeneration

### Workload / state
Representative blocks/items/machines/vessel part/character or creature/UI asset sufficient to exercise multiple production classes.

### Fault / hostility matrix
  - Delete generated output.
  - Clear importer/bake caches.
  - Change irrelevant filesystem path.
  - Tamper one baked product without source change.

### Measurement
  - product manifest equality/equivalence
  - semantic binding equality
  - untracked manual product mutation count
  - rebuild success
  - cache hit/miss diagnostic

### Success criterion
Approved source recreates equivalent governed products and semantic bindings; tampered/manual product changes are overwritten/detected rather than becoming authority.

### Failure criterion
Clean rebuild cannot reproduce approved product meaning, product edits must be preserved manually, or runtime identity changes due to path/provider-local IDs.

### Inconclusive conditions
Fixture uses only trivial pass-through files with no actual Forge validation/bake transformation.

### Required repetition
At least 20 clean rebuilds per representative asset class across two controlled environments.

### Required evidence artifacts
  - source manifest
  - bake manifest
  - artifact hashes/equivalence report
  - binding table
  - clean-build logs

### PRD-08 decision relevance
Supports N01/N02/N09/N14 and future Forge serialization/cache ADRs.

## 89.2 PRD04-PROOF-50 — Art Production Handoff Fixture

**Round-6 planning state:** `SPECIFIED — NOT EXECUTED`  
**Wave:** `W4`  
**Principal fixture(s):** FIXTURE-07 + FIXTURE-08  
**Detailed PRD-06 consumers (8):** `PRD06-RISK-M06`, `PRD06-RISK-N04`, `PRD06-RISK-N07`, `PRD06-RISK-N08`, `PRD06-RISK-N09`, `PRD06-RISK-N10`, `PRD06-RISK-N11`, `PRD06-RISK-N12`

### Question
Can the locked ART-00→10 production handoff be executed end-to-end on representative golden assets in real runtime contexts?

### Hypotheses
  - H1: ART authority can be translated into concrete source, validation, bake, runtime and certification evidence.
  - H0: The theoretical handoff contains gaps that prevent representative assets from reaching approved runtime use.

### Candidate implementations under test
  - CANDIDATE-A: ART-09 common execution path + ART-10 golden-reference certification matrix.
  - CANDIDATE-B: refined per-asset-class execution templates if one common path needs controlled specialization.

### Prerequisites
  - Locked ART-00→10 corpus available.
  - Representative golden source candidates across multiple asset classes.
  - FIXTURE-07 source/bake harness and FIXTURE-08 runtime/presentation scenes.

### Build/configuration matrix
  - block/material
  - item/machine/structure
  - character/creature/animation
  - VFX/magic/weather
  - audio cue
  - UI/icon/cartography

### Workload / state
Golden-reference bootstrap set deliberately including easy and difficult/high-risk production examples.

### Fault / hostility matrix
  - Remove required source metadata.
  - Break canonical binding.
  - Use wrong material/profile.
  - Test isolated preview versus real runtime context.

### Measurement
  - handoff stage pass/fail
  - validator coverage
  - runtime-context defect count
  - manual exception count
  - provenance/binding completeness

### Success criterion
Representative assets traverse the complete governed chain with traceable source/provenance/bindings and pass declared ART-10 runtime-context checks.

### Failure criterion
Required production meaning depends on undocumented manual fixes, missing validation authority, or preview-only approval that fails in context.

### Inconclusive conditions
Only one narrow/easy asset class is tested.

### Required repetition
Golden set covers each major ART production class and at least one known hard case per applicable class.

### Required evidence artifacts
  - golden source packages
  - validation reports
  - runtime captures
  - ART rule traceability matrix
  - certification observations

### PRD-08 decision relevance
Tests implementation completeness of the locked art handoff; does not itself certify mass production.

## 89.3 PRD04-PROOF-51 — AI vs Human Source Parity

**Round-6 planning state:** `SPECIFIED — NOT EXECUTED`  
**Wave:** `W4`  
**Principal fixture(s):** FIXTURE-07  
**Detailed PRD-06 consumers (3):** `PRD06-RISK-M06`, `PRD06-RISK-N03`, `PRD06-RISK-N04`

### Question
Do AI/Codex-authored and human-authored source assets pass through the same governed source, provenance, validation and certification rules?

### Hypotheses
  - H1: Source origin does not change the acceptance contract.
  - H0: AI or human workflows rely on privileged bypasses or undocumented manual knowledge.

### Candidate implementations under test
  - CANDIDATE-A: common Forge source schema/validation path for AI and human authoring.
  - CANDIDATE-B: source-specific authoring UX adapters feeding one identical governed validation/bake contract.

### Prerequisites
  - Two matched production tasks with the same ART/canonical target.
  - Human and AI/Codex source creation paths.
  - FIXTURE-07 common validator/bake pipeline.

### Build/configuration matrix
  - AI-created source
  - human-created source
  - AI source manually corrected
  - human source with intentional invalid case

### Workload / state
Matched assets of comparable complexity, including canonical bindings, material/profile requirements and provenance metadata.

### Fault / hostility matrix
  - Attempt AI-only direct runtime output.
  - Attempt human-only manual post-bake fix.
  - Remove provenance or required metadata.

### Measurement
  - validator rule set equality
  - bypass count
  - manual exception count
  - source-to-product traceability
  - runtime certification outcome

### Success criterion
Both origins are evaluated by the same acceptance gates; any source-specific helper affects authoring ergonomics only, not authority or validation strength.

### Failure criterion
One origin can bypass source/provenance/validation rules or successful human output depends on tacit steps unavailable to the governed pipeline.

### Inconclusive conditions
Tasks are not comparable in scope/complexity.

### Required repetition
Multiple matched tasks across at least three materially different asset classes.

### Required evidence artifacts
  - paired source packages
  - validator reports
  - provenance records
  - bake outputs
  - exception log

### PRD-08 decision relevance
Supports N03/N04 and AI authoring integration decisions.

## 89.4 PRD04-PROOF-52 — Generated Form Explosion

**Round-6 planning state:** `SPECIFIED — NOT EXECUTED`  
**Wave:** `W4`  
**Principal fixture(s):** FIXTURE-07 + FIXTURE-09  
**Detailed PRD-06 consumers (9):** `PRD06-RISK-C08`, `PRD06-RISK-M09`, `PRD06-RISK-M14`, `PRD06-RISK-N05`, `PRD06-RISK-N06`, `PRD06-RISK-N08`, `PRD06-RISK-N09`, `PRD06-RISK-N13`, `PRD06-RISK-R14`

### Question
Can generated material×form/state families scale without exploding semantic IDs, source assets, baked products, registry entries or runtime resources?

### Hypotheses
  - H1: Generated forms preserve stable semantic derivation and bound product generation/storage/runtime cost.
  - H0: Eager combinatorics or variant identity multiplication makes Forge/runtime scale infeasible.

### Candidate implementations under test
  - CANDIDATE-A: generated semantic form + shared/profiled products with lazy/on-demand bake where useful.
  - CANDIDATE-B: bounded eager generation for certified common combinations plus lazy long tail.

### Prerequisites
  - FIXTURE-07 generated material/form family generator.
  - Representative material and form cardinalities.
  - Canonical single-definition/generated-form rules.
  - FIXTURE-09 bake/runtime count and resource metrics.

### Build/configuration matrix
  - small family
  - medium family
  - large stress family
  - many cosmetic/LOD variants
  - sparse valid-combination matrix
  - invalid combination rejection

### Workload / state
Generate representative blocks/items/forms from material×form×state rules, including derived presentation variants.

### Fault / hostility matrix
  - Maximize valid combination count.
  - Inject duplicate semantic binding.
  - Force rebuild from cold cache.

### Measurement
  - semantic ID count
  - source record count
  - baked product count
  - shader/material/icon/model counts
  - bake time
  - disk/memory
  - duplicate identity count

### Success criterion
Semantic identity remains canonical/derived rather than multiplying per visual variant; product/resource counts remain within explicit experiment bounds and demonstrate a plausible scaling path.

### Failure criterion
Combinatorics create duplicate physical identities, unbounded generated products, or implausible bake/runtime growth.

### Inconclusive conditions
Stress family is too small to expose combinatorial behavior.

### Required repetition
Several cardinality scales sufficient to determine growth curve, with cold/warm bake comparison.

### Required evidence artifacts
  - generation manifest
  - count curves
  - binding audit
  - bake/runtime metrics
  - duplicate-ID report

### PRD-08 decision relevance
Supports M14/N05/N06/N13 and generated-form strategy ADRs.

## 89.5 PRD04-PROOF-53 — Renderer/Profile Certification

**Round-6 planning state:** `SPECIFIED — NOT EXECUTED`  
**Wave:** `W4`  
**Principal fixture(s):** FIXTURE-08 + FIXTURE-09  
**Detailed PRD-06 consumers (12):** `PRD06-RISK-M14`, `PRD06-RISK-N08`, `PRD06-RISK-N10`, `PRD06-RISK-N11`, `PRD06-RISK-O02`, `PRD06-RISK-O03`, `PRD06-RISK-O05`, `PRD06-RISK-O06`, `PRD06-RISK-O13`, `PRD06-RISK-O14`, `PRD06-RISK-O15`, `PRD06-RISK-O16`

### Question
Do candidate renderer/profile lanes preserve required Leyforge semantic readability for representative ART/MAP content?

### Hypotheses
  - H1: Supported renderer/profile candidates can present all critical semantics with bounded visual degradation/fallback.
  - H0: A lane launches but loses required material, VFX, UI, cartography or state readability.

### Candidate implementations under test
  - CANDIDATE-A/B/C: each renderer/profile lane actually under support consideration; no lane is pre-certified by this document.

### Prerequisites
  - FIXTURE-08 representative golden scenes/assets.
  - ART-10 certification criteria.
  - MAP-00 ordinary/surveyed/magical relief samples.
  - Exact renderer/build/profile identity.

### Build/configuration matrix
  - high-quality lane
  - lower-cost/mobile-like lane
  - compatibility/fallback lane where under consideration
  - reduced effects
  - multiple quality presets

### Workload / state
Golden scenes covering materials, transparency, lighting/VFX, UI/icons, cartography and state cues.

### Fault / hostility matrix
  - Disable advanced feature.
  - Force fallback profile.
  - Lower effects/quality aggressively.

### Measurement
  - critical cue pass/fail
  - visual fallback defect count
  - unreadable state count
  - artifact/runtime errors
  - performance diagnostic

### Success criterion
Every lane claimed for continued support preserves all required semantic cues using approved fallbacks; unsupported lanes are explicitly rejected rather than silently certified.

### Failure criterion
Critical meaning disappears/misleads or lane relies on an unavailable feature with no valid fallback.

### Inconclusive conditions
Only launch/screenshot similarity is checked without semantic tasks.

### Required repetition
Each candidate lane across representative golden scenes and relevant reduced-profile combinations.

### Required evidence artifacts
  - renderer/profile manifest
  - task-based readability results
  - captures/video
  - fallback matrix
  - runtime diagnostics

### PRD-08 decision relevance
Supports O05/O06/N10/N12; final support qualification also requires PROOF-71.

## 89.6 PRD04-PROOF-54 — Server/Client Pack Split

**Round-6 planning state:** `SPECIFIED — NOT EXECUTED`  
**Wave:** `W4`  
**Principal fixture(s):** FIXTURE-07 + FIXTURE-05 + FIXTURE-09  
**Detailed PRD-06 consumers (12):** `PRD06-RISK-C07`, `PRD06-RISK-K12`, `PRD06-RISK-L02`, `PRD06-RISK-L06`, `PRD06-RISK-M03`, `PRD06-RISK-M04`, `PRD06-RISK-M07`, `PRD06-RISK-M09`, `PRD06-RISK-M10`, `PRD06-RISK-M13`, `PRD06-RISK-M15`, `PRD06-RISK-P03`

### Question
Can one logical content pack produce role-specific client/server artifacts that preserve authoritative semantics while stripping unnecessary presentation content?

### Hypotheses
  - H1: Logical semantic pack identity is separable from role-product hashes and stripping rules preserve required gameplay data.
  - H0: Role stripping removes authority or changes compatibility/dependency meaning.

### Candidate implementations under test
  - CANDIDATE-A: logical semantic manifest + client/server role manifests/artifact hashes.
  - CANDIDATE-B: shared core pack + role-specific product layers.

### Prerequisites
  - FIXTURE-07 representative mixed gameplay/presentation pack.
  - FIXTURE-05 compatibility admission baseline.
  - FIXTURE-09 client/server exported artifact build.

### Build/configuration matrix
  - full dev pack
  - server-stripped artifact
  - client artifact
  - presentation-only optional pack
  - authoritative required pack

### Workload / state
Pack containing gameplay definitions, models/textures/audio/UI and dependencies.

### Fault / hostility matrix
  - Move gameplay field into presentation resource.
  - Remove required dependency from server artifact.
  - Change role-specific artifact hash without semantic change.

### Measurement
  - authoritative semantic equivalence
  - role artifact size/count
  - missing gameplay field count
  - join/admission decision
  - logical vs artifact identity trace

### Success criterion
Client/server products retain one linked logical semantic identity; server has all required authority data; clients have required interpretation data; stripping does not alter dependency semantics.

### Failure criterion
Server/client disagree on authoritative definitions, join baseline becomes ambiguous, or stripping silently removes required gameplay state.

### Inconclusive conditions
Pack contains only gameplay or only presentation and cannot exercise role split.

### Required repetition
Representative packs across several content classes and dependency combinations.

### Required evidence artifacts
  - logical/role manifests
  - semantic comparison
  - artifact hashes
  - admission logs
  - stripping report

### PRD-08 decision relevance
Supports M03/M04/M15 and L06.

## 89.7 PRD04-PROOF-55 — Safe Mod Smuggling

**Round-6 planning state:** `SPECIFIED — NOT EXECUTED`  
**Wave:** `W4`  
**Principal fixture(s):** FIXTURE-07  
**Detailed PRD-06 consumers (5):** `PRD06-RISK-K11`, `PRD06-RISK-M01`, `PRD06-RISK-M05`, `PRD06-RISK-M10`, `PRD06-RISK-M12`

### Question
Can the default player-safe data-only mod tier reject script/native/editor/file/network capability smuggling, including transitive/nested forms?

### Hypotheses
  - H1: Safe-pack admission is allowlist/capability based and evaluates nested/transitive references.
  - H0: Disguised resources or dependencies can gain executable/unsafe capabilities.

### Candidate implementations under test
  - CANDIDATE-A: strict schema/resource-type allowlist + quarantine.
  - CANDIDATE-B: declarative intermediate representation preventing unsafe engine-resource instantiation.

### Prerequisites
  - FIXTURE-07 hostile pack corpus.
  - Controlled isolated test product.
  - Explicit allowed/forbidden resource/capability taxonomy.

### Build/configuration matrix
  - script file
  - native library
  - editor plugin
  - resource referencing script
  - nested dependency escalation
  - path traversal/remote URI
  - benign valid data pack

### Workload / state
Adversarial packs designed to reach executable or external-resource capabilities while claiming safe-data status.

### Fault / hostility matrix
  - Rename extensions.
  - Nest unsafe resource inside allowed container.
  - Use transitive trusted dependency.
  - Use absolute/traversal/remote references.

### Measurement
  - unsafe pack accepted count
  - code/external side-effect count
  - false reject count on benign fixtures
  - diagnostic reason coverage

### Success criterion
All forbidden capability attempts are rejected/quarantined before unsafe execution/access; valid bounded data packs remain usable.

### Failure criterion
Any safe-tier fixture executes script/native/editor capability or escapes allowed filesystem/resource boundary.

### Inconclusive conditions
Test only checks file extensions and not actual resource/capability resolution.

### Required repetition
One or more hostile fixture per smuggling class plus mutation/fuzz variants.

### Required evidence artifacts
  - hostile pack corpus
  - validator results
  - side-effect monitor
  - quarantine reports
  - false-positive log

### PRD-08 decision relevance
Supports M01/M05/M10/M12 and trust/capability ADRs.

## 89.8 PRD04-PROOF-56 — Data Mod Resource Bomb

**Round-6 planning state:** `SPECIFIED — NOT EXECUTED`  
**Wave:** `W4`  
**Principal fixture(s):** FIXTURE-07 + FIXTURE-09  
**Detailed PRD-06 consumers (6):** `PRD06-RISK-K11`, `PRD06-RISK-M02`, `PRD06-RISK-M10`, `PRD06-RISK-M14`, `PRD06-RISK-N05`, `PRD06-RISK-O16`

### Question
Can declarative player-safe content be bounded against CPU, memory, disk, shader/material, registry and generated-form resource exhaustion?

### Hypotheses
  - H1: Data-safe admission includes quantitative budgets/preflight checks.
  - H0: Code-free content can still exhaust resources through valid declarative structure.

### Candidate implementations under test
  - CANDIDATE-A: schema hard limits + preflight cost estimator.
  - CANDIDATE-B: staged import/build sandbox with enforced process/resource quotas.

### Prerequisites
  - FIXTURE-07 resource-bomb corpus.
  - Outer process memory/time limits.
  - FIXTURE-09 resource/build metrics.

### Build/configuration matrix
  - huge entry count
  - deep nesting
  - dependency cycle
  - large texture/model/audio
  - generated-form explosion
  - shader/material permutations
  - compression bomb-like input

### Workload / state
Pathological but syntactically valid content approaching/exceeding declared experimental limits.

### Fault / hostility matrix
  - Maximize one dimension at a time.
  - Combine several near-limit dimensions.

### Measurement
  - peak memory
  - CPU time
  - disk output
  - generated entry count
  - shader/material count
  - validator rejection point
  - host process stability

### Success criterion
Over-budget content is rejected/bounded before uncontrolled resource exhaustion and limits produce actionable diagnostics.

### Failure criterion
Validator/build/runtime exhausts resources, crashes host, or accepts content that predictably exceeds safe declared bounds.

### Inconclusive conditions
Outer OS limit kills process before the Leyforge admission mechanism can be evaluated and no internal result is captured.

### Required repetition
Boundary sweeps around each candidate limit plus combined stress cases.

### Required evidence artifacts
  - resource-bomb corpus
  - preflight estimates
  - actual resource metrics
  - rejection reports
  - host stability logs

### PRD-08 decision relevance
Supports M02/M14/N05/N13/O16.

## 89.9 PRD04-PROOF-57 — Missing Pack World Recovery

**Round-6 planning state:** `SPECIFIED — NOT EXECUTED`  
**Wave:** `W4`  
**Principal fixture(s):** FIXTURE-04 + FIXTURE-07  
**Detailed PRD-06 consumers (18):** `PRD06-RISK-C01`, `PRD06-RISK-C07`, `PRD06-RISK-C09`, `PRD06-RISK-C11`, `PRD06-RISK-D06`, `PRD06-RISK-D07`, `PRD06-RISK-L06`, `PRD06-RISK-M11`, `PRD06-RISK-M15`, `PRD06-RISK-R04`, `PRD06-RISK-R07`, `PRD06-RISK-R08`, `PRD06-RISK-R09`, `PRD06-RISK-R10`, `PRD06-RISK-R12`, `PRD06-RISK-R13`, `PRD06-RISK-R16`, `PRD06-RISK-R22`

### Question
When revalidated against the full W4 content corpus, does missing-pack recovery preserve semantic identity and test/compat isolation exactly as the locked content/migration authorities require?

### Hypotheses
  - H1: W2 compatibility mechanics scale to full pack/test/compat/art content without silent substitution.
  - H0: Content-scale or historical cases reveal missing mappings, namespace leakage or destructive fallback.

### Candidate implementations under test
  - CANDIDATE-A: W2 compatibility/quarantine mechanism with full W4 content resolver.
  - CANDIDATE-B: hard-load block for content classes unsafe to represent compatibly.

### Prerequisites
  - W2 PROOF-57 mechanism implementation available.
  - FIXTURE-07 authoritative/presentation/test/compat packs.
  - FCC-13E generated migration cases.
  - Production scans for `leyforge_test`/`leyforge_compat` leakage.

### Build/configuration matrix
  - missing authoritative pack
  - missing presentation-only pack
  - POC-only row
  - compat row
  - contextual row lacking context
  - many missing objects

### Workload / state
Saved worlds and pack graphs covering current and historical content classes.

### Fault / hostility matrix
  - Remove pack/dependency.
  - Remove mapping context.
  - Attempt production query/crafting/worldgen of compat/test content.

### Measurement
  - silent substitution count
  - quarantine count
  - test/compat leakage count
  - data-loss count
  - world-load classification
  - report completeness

### Success criterion
Every missing/legacy case follows explicit current/FCC-13E policy; test/compat content remains isolated from normal production systems.

### Failure criterion
Any old/missing object is guessed, test/compat content enters progression/worldgen/trade, or player-owned meaning is silently lost.

### Inconclusive conditions
Only a small W2 technical fixture is repeated without full content/historical coverage.

### Required repetition
All FCC-13E outcome classes plus representative current pack classes; generated 312-row coverage shared with PROOF-58.

### Required evidence artifacts
  - missing-pack corpus
  - compat/quarantine ledger
  - production leakage scan
  - load reports
  - semantic ID comparison

### PRD-08 decision relevance
W4 revalidation of D/M/R missing-content risks.

## 89.10 PRD04-PROOF-58 — Pack Upgrade / World Migration

**Round-6 planning state:** `SPECIFIED — NOT EXECUTED`  
**Wave:** `W4`  
**Principal fixture(s):** FIXTURE-04 + FIXTURE-07  
**Detailed PRD-06 consumers (29):** `PRD06-RISK-C01`, `PRD06-RISK-C03`, `PRD06-RISK-C07`, `PRD06-RISK-C09`, `PRD06-RISK-C10`, `PRD06-RISK-C11`, `PRD06-RISK-C12`, `PRD06-RISK-D06`, `PRD06-RISK-D07`, `PRD06-RISK-D08`, `PRD06-RISK-D10`, `PRD06-RISK-E07`, `PRD06-RISK-M04`, `PRD06-RISK-M07`, `PRD06-RISK-M08`, `PRD06-RISK-M11`, `PRD06-RISK-R04`, `PRD06-RISK-R07`, `PRD06-RISK-R08`, `PRD06-RISK-R09`, `PRD06-RISK-R10`, `PRD06-RISK-R12`, `PRD06-RISK-R13`, `PRD06-RISK-R14`, `PRD06-RISK-R15`, `PRD06-RISK-R16`, `PRD06-RISK-R17`, `PRD06-RISK-R18`, `PRD06-RISK-R22`

### Question
Does the W2 migration mechanism correctly implement the full FCC-13E 312-row semantic matrix plus current pack/provider/schema upgrade cases?

### Hypotheses
  - H1: Every legacy row resolves to its locked semantic disposition without guessing, duplicate identity or loss of recoverability.
  - H0: Full corpus reveals incorrect row mapping, many-to-one duplication, namespace leakage or migration/reporting gaps.

### Candidate implementations under test
  - CANDIDATE-A: generated machine-readable 312-row conformance test over the W2 staged migration resolver.
  - CANDIDATE-B: same resolver plus contextual fixture variants where FCC-13E requires context.

### Prerequisites
  - W2 PROOF-58 migration mechanism available.
  - Machine-readable FCC-13E 312-row source.
  - Pre-migration backup/staging and report generation.
  - `leyforge_test` and `leyforge_compat` isolation.

### Build/configuration matrix
  - all 312 rows
  - many-to-one aliases
  - contextual with context
  - contextual without context
  - POC-only
  - rejected/removed
  - provider/schema upgrade combined

### Workload / state
Generated legacy world/inventory/reference fixtures covering every FCC-13E row and outcome class.

### Fault / hostility matrix
  - Randomize current runtime IDs.
  - Remove old display/path/color metadata.
  - Interrupt migration.
  - Remove required pack/context.

### Measurement
  - 312 expected-vs-observed row outcomes
  - duplicate physical identity count
  - unresolved/quarantine count
  - report count reconciliation
  - backup integrity
  - semantic ID correctness

### Success criterion
312/312 rows match locked expected disposition or explicitly expected context-dependent quarantine behavior; no old numeric/path/visual field becomes semantic authority.

### Failure criterion
Any row silently maps to a different semantic identity, duplicates canonical physical identity, leaks POC-only content or destroys the source without recoverability.

### Inconclusive conditions
Generated fixture does not actually exercise persistence/reference migration semantics for the row.

### Required repetition
All 312 rows every full conformance run; contextual/failure cases repeated under randomized runtime mappings and interruption.

### Required evidence artifacts
  - 312-row expected/actual CSV
  - migration report
  - backup hashes
  - alias convergence audit
  - test/compat leakage scan

### PRD-08 decision relevance
Principal R07–R18 migration conformance evidence and W4 revalidation of PROOF-58.

## 89.11 PRD04-PROOF-59 — Settings Scope Isolation

**Round-6 planning state:** `SPECIFIED — NOT EXECUTED`  
**Wave:** `W4`  
**Principal fixture(s):** FIXTURE-08  
**Detailed PRD-06 consumers (7):** `PRD06-RISK-I05`, `PRD06-RISK-N11`, `PRD06-RISK-O01`, `PRD06-RISK-O09`, `PRD06-RISK-O11`, `PRD06-RISK-O12`, `PRD06-RISK-O17`

### Question
Can graphics, accessibility, input and presentation settings change independently without mutating canonical simulation/world rules?

### Hypotheses
  - H1: Settings stores/scopes are explicit and downstream of authoritative gameplay.
  - H0: Presentation/profile changes silently alter simulation, content or world authority.

### Candidate implementations under test
  - CANDIDATE-A: separately versioned global/profile/input/accessibility stores plus explicit per-world gameplay settings.
  - CANDIDATE-B: unified schema with hard scope metadata and enforcement.

### Prerequisites
  - FIXTURE-08 representative canonical scenario.
  - Multiple graphics/accessibility/input profiles.
  - Canonical state hash independent from presentation.

### Build/configuration matrix
  - graphics preset
  - reduced effects
  - UI scale
  - input remap
  - audio/accessibility changes
  - per-world gameplay rule negative control

### Workload / state
Run identical authoritative scenario while changing one non-gameplay setting scope at a time.

### Fault / hostility matrix
  - Migrate settings schema.
  - Load another world/profile.
  - Split-screen/per-view override where supported by fixture.

### Measurement
  - canonical state equality
  - scope leakage count
  - settings persistence correctness
  - unexpected world-setting mutation

### Success criterion
Non-gameplay settings alter only permitted presentation/input/accessibility behavior; canonical scenario state remains equivalent.

### Failure criterion
A graphics/accessibility/input change mutates authoritative world/simulation rules or migrations mix scopes.

### Inconclusive conditions
Scenario has no authoritative behavior sensitive enough to detect leakage.

### Required repetition
Each setting scope across restart/world switch/migration combinations.

### Required evidence artifacts
  - settings manifests
  - canonical hashes
  - scope-diff reports
  - migration results

### PRD-08 decision relevance
Supports O01/O09/O11/O17.

## 89.12 PRD04-PROOF-60 — Safe Graphics Recovery

**Round-6 planning state:** `SPECIFIED — NOT EXECUTED`  
**Wave:** `W4`  
**Principal fixture(s):** FIXTURE-08 + FIXTURE-09  
**Detailed PRD-06 consumers (3):** `PRD06-RISK-O07`, `PRD06-RISK-O08`, `PRD06-RISK-O17`

### Question
Can invalid/unsupported saved graphics configuration recover to a usable safe mode without requiring manual file deletion or altering world/gameplay settings?

### Hypotheses
  - H1: Startup/recovery can detect unusable graphics state and choose a bounded safe presentation fallback.
  - H0: A bad saved setting strands the application before recovery UI is reachable.

### Candidate implementations under test
  - CANDIDATE-A: startup watchdog/last-known-good graphics profile.
  - CANDIDATE-B: explicit safe-mode launch/reset path.
  - CANDIDATE-C: auto-detect candidate profile with reversible user override.

### Prerequisites
  - FIXTURE-08 saved graphics profiles.
  - FIXTURE-09 real exported client artifact.
  - Ability to inject invalid renderer/display/profile values.

### Build/configuration matrix
  - unsupported renderer
  - invalid resolution/display
  - removed monitor
  - corrupt profile
  - aggressive quality setting
  - driver/hardware profile change simulation

### Workload / state
Real client startup with deliberately broken presentation configuration and existing saved worlds/profiles.

### Fault / hostility matrix
  - Write invalid settings.
  - Simulate prior startup failure marker.
  - Change display/profile identity between runs.

### Measurement
  - usable UI reached
  - recovery attempts
  - world/gameplay settings changed count
  - last-known-good restoration
  - user override persistence

### Success criterion
Application reaches a usable recovery state/fallback and preserves non-graphics settings/world truth; user can intentionally reconfigure afterward.

### Failure criterion
Application remains stranded/crash-looped or recovery resets unrelated gameplay/accessibility data.

### Inconclusive conditions
Only editor project settings are tested, not persisted runtime configuration in exported artifact.

### Required repetition
All invalid-profile classes across repeated restart cycles.

### Required evidence artifacts
  - startup/recovery logs
  - settings before/after
  - exported artifact manifest
  - screen captures

### PRD-08 decision relevance
Supports O07/O08/O17 and graphics recovery ADR.

## 89.13 PRD04-PROOF-61 — Accessibility Semantic Torture

**Round-6 planning state:** `SPECIFIED — NOT EXECUTED`  
**Wave:** `W4`  
**Principal fixture(s):** FIXTURE-08  
**Detailed PRD-06 consumers (10):** `PRD06-RISK-N12`, `PRD06-RISK-O02`, `PRD06-RISK-O03`, `PRD06-RISK-O04`, `PRD06-RISK-O06`, `PRD06-RISK-O09`, `PRD06-RISK-O10`, `PRD06-RISK-O13`, `PRD06-RISK-O14`, `PRD06-RISK-O16`

### Question
Do critical gameplay semantics remain available under supported colour, motion/flash, audio, scale, input and cartography accessibility constraints?

### Hypotheses
  - H1: Critical meaning is redundantly encoded and essential interactions have accessible alternatives.
  - H0: One supported accessibility mode removes required gameplay information or capability.

### Candidate implementations under test
  - CANDIDATE-A: semantic cue tokens rendered through multiple channels/fallbacks.
  - CANDIDATE-B: profile-specific fallback components governed by the same semantic state.

### Prerequisites
  - FIXTURE-08 representative critical tasks.
  - ART-08/ART-10 accessibility rules.
  - MAP-00 ordinary/surveyed/magical relief scenarios.

### Build/configuration matrix
  - colour-reduced/high-contrast
  - reduced motion/flash/particles
  - audio muted/captioned
  - large text/UI scale
  - keyboard/controller remap
  - flat/non-drag map mode

### Workload / state
Tasks requiring hazard/status identification, interaction confirmation, navigation/map use and critical warnings.

### Fault / hostility matrix
  - Remove each sensory channel in turn.
  - Use long localization strings/large scale.
  - Disable 3D relief manipulation and use flat alternative.

### Measurement
  - task success
  - critical cue missed count
  - focus/clipping failure count
  - map information equivalence
  - input reachability
  - human reviewer notes

### Success criterion
Every critical task remains understandable/actionable using supported alternatives; magical relief exposes no essential information unavailable through an accessible alternative.

### Failure criterion
Required meaning depends exclusively on colour/audio/motion/3D manipulation or UI/input settings make a critical action unreachable.

### Inconclusive conditions
Only screenshots are compared without task-based semantic evaluation.

### Required repetition
Representative tasks across all supported accessibility profiles and input modes; human review where semantic perception is required.

### Required evidence artifacts
  - task scripts
  - review records
  - captures/video
  - UI focus/layout logs
  - map equivalence checklist

### PRD-08 decision relevance
Supports O02–O04/O09/O10/O13/O14/O16/N12.

## 89.14 PRD04-PROOF-62 — Forge CI Build

**Round-6 planning state:** `SPECIFIED — NOT EXECUTED`  
**Wave:** `W4`  
**Principal fixture(s):** FIXTURE-07 + FIXTURE-09  
**Detailed PRD-06 consumers (27):** `PRD06-RISK-M03`, `PRD06-RISK-M04`, `PRD06-RISK-M05`, `PRD06-RISK-M06`, `PRD06-RISK-M07`, `PRD06-RISK-M08`, `PRD06-RISK-M10`, `PRD06-RISK-M13`, `PRD06-RISK-N01`, `PRD06-RISK-N02`, `PRD06-RISK-N03`, `PRD06-RISK-N04`, `PRD06-RISK-N05`, `PRD06-RISK-N07`, `PRD06-RISK-N09`, `PRD06-RISK-N13`, `PRD06-RISK-N14`, `PRD06-RISK-R01`, `PRD06-RISK-R02`, `PRD06-RISK-R03`, `PRD06-RISK-R04`, `PRD06-RISK-R07`, `PRD06-RISK-R11`, `PRD06-RISK-R12`, `PRD06-RISK-R20`, `PRD06-RISK-R21`, `PRD06-RISK-R22`

### Question
Can Forge CI/headless automation enforce the same source, provenance, binding, trust, bake and production-validation contract used by interactive authoring?

### Hypotheses
  - H1: Production acceptance can run deterministically/automatically without relying on editor-only local state.
  - H0: Packs/assets pass only in interactive editor or CI misses critical production rules.

### Candidate implementations under test
  - CANDIDATE-A: headless/CLI Forge validation+bake+test pipeline.
  - CANDIDATE-B: CI orchestration invoking the same core validation libraries as interactive Forge.

### Prerequisites
  - FIXTURE-07 valid/invalid production corpus.
  - FIXTURE-09 clean automated build lane.
  - ART/FCC registry/source authority available.

### Build/configuration matrix
  - valid golden content
  - invalid source metadata
  - wrong binding
  - unsafe pack
  - resource bomb
  - test/compat leakage
  - clean source→bake rebuild

### Workload / state
Representative source/pack corpus covering all major validators from proofs 49–56 and migration isolation checks.

### Fault / hostility matrix
  - Run with empty caches.
  - Run on clean machine/CI environment.
  - Inject each known invalid fixture.

### Measurement
  - validator outcome parity
  - false negative/positive count
  - build reproducibility
  - editor-only dependency count
  - CI duration diagnostic

### Success criterion
CI/headless path produces the same semantic accept/reject outcomes as governed interactive path and creates reproducible artifacts/evidence.

### Failure criterion
Interactive-only state is required, unsafe/invalid content passes CI, or valid source cannot build cleanly outside the editor workstation.

### Inconclusive conditions
Automation merely launches the editor manually or omits major validation classes.

### Required repetition
Clean CI runs across the full fixture corpus and at least two controlled environments where feasible.

### Required evidence artifacts
  - CI logs
  - machine-readable validation report
  - artifact manifests
  - editor-vs-CI outcome diff
  - invalid-fixture coverage

### PRD-08 decision relevance
Supports M/N/R/P production automation risks; exact CI provider remains unlocked.

## 89.15 PRD04-PROOF-71 — Renderer / Hardware Lane

**Round-6 planning state:** `SPECIFIED — NOT EXECUTED`  
**Wave:** `W4`  
**Principal fixture(s):** FIXTURE-08 + FIXTURE-09  
**Detailed PRD-06 consumers (19):** `PRD06-RISK-A02`, `PRD06-RISK-A08`, `PRD06-RISK-B07`, `PRD06-RISK-K16`, `PRD06-RISK-N10`, `PRD06-RISK-N13`, `PRD06-RISK-O05`, `PRD06-RISK-O06`, `PRD06-RISK-O08`, `PRD06-RISK-O10`, `PRD06-RISK-O11`, `PRD06-RISK-O12`, `PRD06-RISK-O13`, `PRD06-RISK-O15`, `PRD06-RISK-P02`, `PRD06-RISK-P21`, `PRD06-RISK-P23`, `PRD06-RISK-P24`, `PRD06-RISK-R19`

### Question
Which renderer/hardware/profile lanes actually meet the declared Leyforge presentation/readability/performance claims using real exported artifacts and representative content?

### Hypotheses
  - H1: A measurable subset of candidate lanes can be qualified with explicit limits and fallbacks.
  - H0: Support claims based on launch/editor success collapse under representative content, hardware or split-screen load.

### Candidate implementations under test
  - CANDIDATE-A/B/...: each real renderer + hardware/profile tier under product consideration; no tier is assumed supported beforehand.

### Prerequisites
  - PROOF-53 semantic renderer/profile results.
  - FIXTURE-08 representative golden scenes and split-screen/map cases.
  - FIXTURE-09 real exported client artifacts and benchmark identity.

### Build/configuration matrix
  - low candidate tier
  - mid candidate tier
  - high candidate tier
  - renderer lanes under consideration
  - 1-player
  - supported local split-screen counts
  - magical map active
  - heavy VFX/weather scene

### Workload / state
Representative gameplay/presentation workloads derived from ART golden scenes, MAP-00 relief mapping and normal world rendering.

### Fault / hostility matrix
  - Stress scene complexity.
  - Increase local view count.
  - Use lower quality/fallback profile.
  - Hardware/driver lane variation.

### Measurement
  - frame time distribution
  - memory/VRAM where observable
  - loading/stutter diagnostic
  - critical semantic task pass
  - thermal/stability notes where applicable
  - artifact/runtime errors

### Success criterion
Each claimed lane meets predeclared test acceptance criteria and preserves semantic readability; unsupported lanes are explicitly excluded or given a narrower profile.

### Failure criterion
Lane misses declared stability/readability/performance criteria yet remains claimed supported, or settings compensate by changing canonical simulation/world truth.

### Inconclusive conditions
Run lacks representative content, exact hardware/build identity or predeclared acceptance criteria.

### Required repetition
Repeated benchmark/task runs per hardware/profile lane with warm-up and comparable workloads; final thresholds evaluated in PRD-08.

### Required evidence artifacts
  - benchmark dataset
  - hardware/build manifest
  - frame-time traces
  - memory metrics
  - semantic task results
  - captures

### PRD-08 decision relevance
Feeds final renderer/hardware support tiers; Round 6 specifies evidence only and does not set product requirements.



# 90. ART Authority / Qualification Boundary

Wave 4 preserves four distinct stages:

```text
LOCKED ART AUTHORITY
        ↓
IMPLEMENTED FORGE / SOURCE PIPELINE
        ↓
GOLDEN BOOTSTRAP + VALIDATORS
        ↓
REPRESENTATIVE MASS-PRODUCTION / RUNTIME QUALIFICATION
```

`PROOF-50` primarily attacks the second and third transitions.

`PROOF-62` attacks automation/enforcement.

`PROOF-71` contributes real runtime/hardware evidence.

No one proof collapses all four stages.

# 91. MAP-00 Evidence Boundary

For cartography-related portions of `PROOF-53/61/71`:

- the renderer reads **authorised map knowledge**, not live hidden world truth;
- unknown remains unknown;
- stale/incorrect maps may intentionally differ from the real world if MAP-00 permits;
- magical-relief rendering cannot expand knowledge merely because terrain data exists in memory;
- essential 3D functions require accessible flat/non-drag/list equivalents;
- lower hardware profiles may reduce geometry/LOD/effects but cannot increase or remove authorised semantic information.

# 92. FCC-13E 312-Row W4 Revalidation Contract

`PROOF-58` must produce a generated expected-vs-observed ledger for **all 312 rows**.

The test must preserve these locked outcome counts:

| FCC-13E final outcome | Rows |
|---|---:|
| POC-ONLY / NOT PROMOTED | 168 |
| CANONICAL REBIND / GENERATED FORM / STATE | 107 |
| CANONICAL SYSTEM ARCHETYPE REBIND | 13 |
| CANONICAL CONTEXTUAL MIGRATION | 7 |
| CANONICAL TOOL ARCHETYPE REBIND | 4 |
| CANONICAL NON-MATERIAL REBIND | 3 |
| LEGACY ECONOMY OBJECT — NOT UNIVERSAL CURRENCY | 3 |
| CATEGORY MIGRATION + OWNER REVIEW | 2 |
| MIGRATION-ONLY / FUTURE-DEFERRED | 2 |
| RETIRED / ALIAS OR CONTEXTUAL MIGRATION | 2 |
| REJECT / REMOVE FROM NORMAL CANON | 1 |
| **TOTAL** | **312** |

The execution mechanism may add runtime statuses such as compatibility/quarantine where context is insufficient, but it may not silently change the locked design-time semantic disposition.

# 93. Pack Trust Capability Rule

Wave 4 distinguishes:

```text
CONTENT IDENTITY
CONTENT DEPENDENCY
TRUST LEVEL
CAPABILITY
RESOURCE COST
PRESENTATION REQUIREMENTS
```

These are not interchangeable.

For example:

- a signed pack can still be too expensive;
- a data-only pack can still be a resource bomb;
- a presentation-only pack can still violate accessibility/profile constraints;
- a dependency can escalate effective capability;
- exact artifact hash and logical semantic pack identity serve different purposes.

# 94. W4 Human-Judgement Evidence Rule

Some ART/accessibility/readability evidence necessarily includes human review.

Where human judgement is used, the run must record:

- reviewer/tester identity or stable anonymized reviewer ID;
- exact build/content/profile;
- task;
- evaluation rubric;
- result;
- uncertainty/disagreement;
- capture/evidence reference.

Human judgement is valid evidence when the claim is perceptual/semantic.

Unstructured “looks good to me” is not.

# 95. W4 Performance Evidence Boundary

Wave 4 may collect:

- bake times;
- generated product counts;
- memory/disk output;
- shader/material counts;
- validator CPU/memory;
- renderer frame times;
- split-screen cost;
- cartography LOD/cache cost;
- resource-bomb rejection cost.

These are candidate and qualification inputs.

Round 6 does **not** independently set final:

- minimum/recommended hardware;
- texture/model/shader budgets;
- pack-size limits;
- split-screen player count;
- final renderer-support matrix.

Those require PRD-08/W5 interpretation from the measured evidence.

# 96. W4 Cross-Proof Interaction Matrix

| Interaction | Required relationship |
|---|---|
| `49 → 50/51/52` | Handoff, parity and generated forms depend on reproducible source→bake identity. |
| `50 → 53/61/71` | Golden assets/scenes become representative presentation/qualification fixtures. |
| `51 → 62` | AI/human parity must be enforced in the same CI acceptance path. |
| `52 ↔ 56` | Generated-form scale is both production throughput and data-resource risk. |
| `54 ↔ 36` | Role-specific pack products must preserve protocol/content compatibility identity. |
| `55/56 → 62` | Unsafe/resource-bomb fixtures must fail automatically in Forge CI. |
| `57/58 ↔ W2` | W4 revalidates W2 migration mechanisms against full semantic content corpus. |
| `53 → 71` | Semantic renderer/profile certification precedes product-support hardware claims. |
| `59/60/61 ↔ 53` | Presentation support requires settings isolation, safe recovery and accessible semantics. |
| `61 ↔ MAP-00` | Accessible map alternatives must preserve authorised knowledge, not reveal live truth. |
| `62 ↔ 49–58` | Forge CI is the automated enforcement surface for source/content/trust/migration production rules. |

# 97. Round-6 Reverse-Coverage Check

| Proof | Detailed PRD-06 consumers |
|---|---:|
| `PRD04-PROOF-49` | 10 |
| `PRD04-PROOF-50` | 8 |
| `PRD04-PROOF-51` | 3 |
| `PRD04-PROOF-52` | 9 |
| `PRD04-PROOF-53` | 12 |
| `PRD04-PROOF-54` | 12 |
| `PRD04-PROOF-55` | 5 |
| `PRD04-PROOF-56` | 6 |
| `PRD04-PROOF-57` | 18 |
| `PRD04-PROOF-58` | 29 |
| `PRD04-PROOF-59` | 7 |
| `PRD04-PROOF-60` | 3 |
| `PRD04-PROOF-61` | 10 |
| `PRD04-PROOF-62` | 27 |
| `PRD04-PROOF-71` | 19 |

# 98. Round-6 Closure Gates

| Gate | Result |
|---|---|
| W4 stable proof IDs identified | **PASS — 15/15** |
| Every W4 proof explicitly specified | **PASS — 15/15** |
| Every W4 proof has hypothesis/candidates | **PASS — 15/15** |
| Every W4 proof has prerequisites | **PASS — 15/15** |
| Every W4 proof has workload/fault matrix | **PASS — 15/15** |
| Every W4 proof has measurements | **PASS — 15/15** |
| Every W4 proof has success/failure/inconclusive criteria | **PASS — 15/15** |
| Every W4 proof has repetition/evidence requirements | **PASS — 15/15** |
| FIXTURE-07 W4 expansion defined | **PASS** |
| FIXTURE-08 W4 expansion defined | **PASS** |
| ART authority remains separate from qualification | **PASS** |
| Editable Forge source remains production authority | **PASS** |
| AI/human source paths share acceptance law | **PASS** |
| Generated-form identity kept separate from presentation variants | **PASS** |
| Safe data-only mods remain non-executable | **PASS** |
| Data-only content still receives resource-budget testing | **PASS** |
| Client/server role stripping preserves logical pack semantics | **PASS** |
| W4 revalidation of PROOF-57/58 defined | **PASS** |
| FCC-13E 312-row conformance defined | **PASS — 312/312 required** |
| MAP-00 hidden-knowledge boundary preserved | **PASS** |
| Accessibility semantic equivalence required | **PASS** |
| Renderer launch kept distinct from support certification | **PASS** |
| W4 metrics blocked from becoming arbitrary final budgets | **PASS** |
| Actual proof runs executed | **PASS — 0** |
| PRD-08 conclusions created | **PASS — 0** |
| Implementation ADRs accepted | **PASS — 0** |
| Architecture reopen candidates created | **PASS — 0** |

**Round-6 closure score: 27 / 27 PASS.**

# 99. Round-6 Verdict

> **ROUND 6 PASS — W4 FORGE / TRUST / ART / PRESENTATION / HISTORICAL-MIGRATION PROOF SPECIFICATIONS COMPLETE.**

The key consequences are:

1. Forge source reproducibility is separated from baked-product authority.
2. ART-00→10 is tested as an executable production contract without pretending theoretical lock equals qualification.
3. AI and human production paths are held to the same acceptance/provenance law.
4. Generated forms are tested for semantic identity integrity and scaling together.
5. Safe-mod testing covers both capability smuggling and declarative resource exhaustion.
6. Logical content-pack identity remains distinct from client/server artifact identity.
7. Missing-pack and migration proofs are explicitly revalidated against full content/historical semantics.
8. FCC-13E requires generated **312/312** row conformance evidence.
9. Renderer/profile support is task/semantic based, not “it launched”.
10. Accessibility testing is task-based and includes magical cartography equivalents.
11. MAP-00 authorised knowledge remains upstream of every 2D/3D renderer.
12. Forge CI is expected to enforce the same contract as interactive authoring.
13. Hardware/profile evidence can be gathered in W4 but final product-support interpretation remains downstream.

No Round-6 finding requires PRD-04/05/06 reopening.

# 100. Machine-Readable Round-6 Summary

```yaml
document: PRD-07
version: v0.6
round: 6
status: WORKING
round_status: PASS
wave: W4
proofs_specified: [49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 71]
proof_count: 15
revalidated_from_w2: [57, 58]
fixture_contracts_expanded: [FIXTURE-07, FIXTURE-08]
fcc13e_conformance_rows_required: 312
actual_execution_runs: 0
evidence_artifacts_allocated: 0
prd08_results_created: 0
implementation_adrs_accepted: 0
architecture_reopen_candidates: 0
round6_closure:
  passed: 27
  failed: 0
next_round: W5 Build / Dependency / Observability / Qualification Proof Specifications
```

---

**End of PRD-07 v0.6 — Round 6 Working Baseline**


---

# 101. Round-7 Scope — W5 Build / Dependency / Observability / Qualification Specifications

Round 7 specifies the **final normal execution wave before whole-programme reconciliation**.

It introduces five previously unspecific W5 proofs:

`64, 65, 66, 72, 75`

and formally expands four continuing gates first introduced in earlier waves:

`70, 71, 73, 74`

No proof is executed in this document.

The governing W5 law is:

> **A support or qualification claim is valid only for the exact artifact, dependency state, workload, hardware/profile and evidence maturity actually tested.**

Therefore:

```text
EDITOR SUCCESS
    ≠
EXPORTED ARTIFACT SUCCESS
    ≠
RELEASE-LIKE SUPPORTABILITY
    ≠
HARDWARE / PROFILE QUALIFICATION
    ≠
P5 PRODUCTION QUALIFICATION
```

# 102. Wave-5 Dependency Spine

```text
W5-A — DIAGNOSTIC / SUPPORT EVIDENCE
  PROOF-64  Stale Work Diagnostic Classification
  PROOF-65  Support Bundle Redaction
  PROOF-66  Release Crash Symbolication

W5-B — DEPENDENCY / PATCH CHANGE CONTROL
  PROOF-72  Dependency Upgrade Fixture
  PROOF-73  Local Patch Reproducibility — qualification rerun

W5-C — REAL ARTIFACT / SUPPORT MATRIX
  PROOF-70  Exported Artifact Matrix — full qualification expansion
  PROOF-71  Renderer / Hardware Lane — support-lane expansion

W5-D — CONTINUOUS ARCHITECTURE ENFORCEMENT
  PROOF-74  Architecture Dependency Lint — completed graph rerun

W5-E — OBSERVABILITY COST
  PROOF-75  Observability Overhead
```

`PROOF-75` should run after the production-minimum diagnostic/event surfaces are realistic enough to measure.

# 103. Wave-5 FIXTURE-09 Final Expansion

Before W5 proofs become `READY`, FIXTURE-09 must support:

- exact Leyforge source revision;
- exact Godot revision/version;
- exact Voxel Tools revision + edition;
- local patch/fork identity or `NO-LOCAL-PATCH`;
- material toolchain/native dependency identity;
- client/server/Forge role;
- platform/architecture;
- precision/provider/build profile;
- renderer/profile where material;
- content/schema/pack identity;
- exact exported artifact hash;
- exact matching symbol-package identity;
- clean-room/clean-cache rebuild;
- dependency upgrade/rollback;
- local patch apply/rebase exercise;
- deliberate crash/minidump capture;
- support-bundle generation;
- seeded secrets/private data;
- structured event capture;
- logs/metrics/traces OFF/minimum/expanded profiles;
- high-cardinality/event-storm generation;
- benchmark context schema;
- support/retention lookup for older supported artifact.

# 104. W5 Qualification Record Contract

Any run contributing to a production-support claim must add:

```yaml
qualification_claim:
artifact_hash:
build_manifest_hash:
dependency_manifest_hash:
content_manifest_hash:
symbol_package_id:
platform:
hardware:
renderer_profile:
precision_provider_lane:
workload_id:
acceptance_criteria_id:
observability_profile:
proof_run_ids:
known_exclusions:
```

PRD-07 may generate the evidence package.

Only PRD-08 may conclude that the package earns the requested qualification.

# 105. Detailed New W5 Proof Specifications

## 105.1 PRD04-PROOF-64 — Stale Work Diagnostic Classification

**Round-7 planning state:** `SPECIFIED — NOT EXECUTED`  
**Wave:** `W5`  
**Principal fixture(s):** FIXTURE-03 + FIXTURE-09  
**Detailed PRD-06 consumers (5):** `PRD06-RISK-P15`, `PRD06-RISK-P16`, `PRD06-RISK-P17`, `PRD06-RISK-P20`, `PRD06-RISK-Q09`

### Question
Can Leyforge distinguish expected stale/superseded work from validation failures, provider failures and true invariant violations at machine-readable level under hostile async load?

### Hypotheses
  - H1: Structured diagnostic categories remain stable while provider log wording/version changes.
  - H0: Healthy stale work floods error paths or genuine failures become indistinguishable from expected supersession.

### Candidate implementations under test
  - CANDIDATE-A: Leyforge-owned structured diagnostic event taxonomy with severity/category/context.
  - CANDIDATE-B: equivalent typed diagnostic schema layered over provider/native logs.

### Prerequisites
  - W1 stale-worker/owner-revision fixtures operational.
  - FIXTURE-09 structured event capture.
  - Ability to inject true provider/invariant failures mixed with stale-task storms.

### Build/configuration matrix
  - expected stale completion
  - superseded result
  - owner/session epoch rejection
  - validation reject
  - retryable provider failure
  - degraded provider
  - invariant violation
  - fatal/native failure

### Workload / state
Thousands of async tasks with controlled mixtures of expected stale results and real injected faults.

### Fault / hostility matrix
  - Randomize completion order.
  - Change provider log text/version.
  - Inject provider error and invariant failure among stale events.
  - Create high event volume.

### Measurement
  - classification accuracy
  - false-positive error count
  - false-negative fault count
  - orphan-context count
  - event volume
  - diagnostic processing latency

### Success criterion
Expected stale/superseded work is classified separately from actionable faults; genuine faults remain visible with owner/session/revision context regardless of provider text changes.

### Failure criterion
Healthy stale work is indistinguishable from failure, real faults are swallowed by noise, or automation depends on provider-specific strings.

### Inconclusive conditions
Fixture produces only stale work or only real faults, preventing classification comparison.

### Required repetition
At least 100,000 mixed events across multiple provider/build variants.

### Required evidence artifacts
  - machine-readable event stream
  - expected-vs-observed classification table
  - provider-log mutation fixture
  - false-positive/negative report
  - context propagation sample

### PRD-08 decision relevance
Primary evidence for P15–P17/P20 and production diagnostic taxonomy decisions.

## 105.2 PRD04-PROOF-65 — Support Bundle Redaction

**Round-7 planning state:** `SPECIFIED — NOT EXECUTED`  
**Wave:** `W5`  
**Principal fixture(s):** FIXTURE-09  
**Detailed PRD-06 consumers (4):** `PRD06-RISK-P04`, `PRD06-RISK-P13`, `PRD06-RISK-P14`, `PRD06-RISK-Q09`

### Question
Can a support bundle retain the minimum evidence needed for triage while reliably excluding secrets and unrelated private data?

### Hypotheses
  - H1: Explicit allowlist/redaction rules can produce useful and privacy-safe support evidence.
  - H0: Either sensitive data leaks or over-redaction makes the bundle diagnostically useless.

### Candidate implementations under test
  - CANDIDATE-A: explicit bounded support-bundle schema + field-level redaction.
  - CANDIDATE-B: generated evidence manifest with opt-in sensitive classes disabled by default.

### Prerequisites
  - FIXTURE-09 support bundle generator.
  - Synthetic credentials/tokens/private paths/chat/player data.
  - Representative crash/provider/performance incidents.
  - Exact build/content/dependency identity available.

### Build/configuration matrix
  - normal bundle
  - seeded credentials
  - seeded auth/reconnect tokens
  - private file paths
  - private player/chat data
  - over-redaction negative case
  - crash/performance/provider incident bundles

### Workload / state
Generate support bundles from known incidents while synthetic prohibited data exists throughout logs/config/build context.

### Fault / hostility matrix
  - Place secrets in environment/config/log text.
  - Use misleading field names/paths.
  - Force large diagnostic volume.
  - Remove one required triage field to verify usefulness checks.

### Measurement
  - secret/private leak count
  - required evidence present count
  - bundle size
  - triage success
  - redaction false-positive/negative count

### Success criterion
Zero prohibited secret/private classes appear; required build/content/health/error evidence remains sufficient to classify representative incidents.

### Failure criterion
Any prohibited value leaks, or the bundle cannot support the declared representative triage tasks because essential evidence was stripped.

### Inconclusive conditions
Bundle contains only synthetic trivial logs and no realistic diagnostic incident.

### Required repetition
All prohibited-data classes plus representative incident classes, repeated under varied build/profile states.

### Required evidence artifacts
  - bundle contents manifest
  - seeded-secret oracle
  - redaction report
  - triage task results
  - bundle hashes

### PRD-08 decision relevance
Supports P04/P13/P14 and future support-bundle schema/UI decisions.

## 105.3 PRD04-PROOF-66 — Release Crash Symbolication

**Round-7 planning state:** `SPECIFIED — NOT EXECUTED`  
**Wave:** `W5`  
**Principal fixture(s):** FIXTURE-09  
**Detailed PRD-06 consumers (3):** `PRD06-RISK-P11`, `PRD06-RISK-P12`, `PRD06-RISK-P14`

### Question
Can crashes from exact release-like native artifacts be symbolicated later using archived matching binaries/manifests/symbols?

### Hypotheses
  - H1: Exact build identity deterministically resolves the matching symbol package and yields actionable stacks.
  - H0: Symbols are missing, mismatched or impossible to resolve for supported builds.

### Candidate implementations under test
  - CANDIDATE-A: exact build-ID→symbol archive/index.
  - CANDIDATE-B: artifact-manifest embedded symbol reference + external retention store.

### Prerequisites
  - FIXTURE-09 real release-like native artifacts.
  - Deliberate controlled crash sites in Leyforge/native/provider code.
  - Exact build manifest and matching symbol output retained.

### Build/configuration matrix
  - current release-like build
  - older still-supported build
  - wrong-symbol negative control
  - stripped client
  - dedicated/headless native artifact
  - custom/provider-patched artifact where applicable

### Workload / state
Crash exact exported artifacts at known native/source locations and recover stacks after build environment is gone.

### Fault / hostility matrix
  - Use wrong symbols deliberately.
  - Delete local build tree before symbolication.
  - Resolve older supported artifact from archive.

### Measurement
  - symbol resolution success
  - correct source/function/frame rate
  - wrong-symbol rejection
  - build-ID lookup success
  - archive retention availability

### Success criterion
Every supported release-like crash resolves with the exact matching symbol package to an actionable stack; mismatched symbols are rejected rather than silently used.

### Failure criterion
Exact supported artifact cannot be symbolicated, wrong symbols are accepted, or source/build identity is insufficient to locate the right package.

### Inconclusive conditions
Only interpreted/script stack traces are tested with no native symbol requirement.

### Required repetition
Multiple deliberate crash sites per artifact lane plus at least one retained older-build lookup.

### Required evidence artifacts
  - crash dumps
  - symbol packages
  - symbolication reports
  - build/symbol manifests
  - archive lookup evidence

### PRD-08 decision relevance
Supports P11/P12/P14 and symbol-retention/support ADRs.

## 105.4 PRD04-PROOF-72 — Dependency Upgrade Fixture

**Round-7 planning state:** `SPECIFIED — NOT EXECUTED`  
**Wave:** `W5`  
**Principal fixture(s):** FIXTURE-09  
**Detailed PRD-06 consumers (17):** `PRD06-RISK-A03`, `PRD06-RISK-A09`, `PRD06-RISK-B02`, `PRD06-RISK-B04`, `PRD06-RISK-B05`, `PRD06-RISK-B08`, `PRD06-RISK-D08`, `PRD06-RISK-L08`, `PRD06-RISK-N14`, `PRD06-RISK-P05`, `PRD06-RISK-P06`, `PRD06-RISK-P07`, `PRD06-RISK-P10`, `PRD06-RISK-P16`, `PRD06-RISK-R05`, `PRD06-RISK-R06`, `PRD06-RISK-R18`

### Question
Can a controlled dependency upgrade detect behavioral, ABI, export, persistence, provider and performance regressions beyond simple compilation success?

### Hypotheses
  - H1: Dependency upgrade admission reruns targeted conformance/export/recovery fixtures against an exact baseline.
  - H0: A dependency can compile successfully while materially changing Leyforge behavior unnoticed.

### Candidate implementations under test
  - CANDIDATE-A: one-dependency-at-a-time upgrade fixture with baseline diff.
  - CANDIDATE-B: controlled grouped upgrade only where dependencies cannot be meaningfully separated.

### Prerequisites
  - Exact dependency lock/inventory baseline.
  - At least one safe candidate upgrade/downgrade or synthetic revision delta.
  - Reusable provider/export/persistence/renderer fixtures from earlier waves.
  - Rollback path to known-good baseline.

### Build/configuration matrix
  - Godot version/revision change
  - Voxel Tools revision/edition change
  - native/toolchain dependency change
  - export template/toolchain change
  - no-op rebuild baseline

### Workload / state
Run selected high-value proof subset before and after the dependency change using identical semantic fixtures and declared build deltas.

### Fault / hostility matrix
  - Introduce known regression fixture or synthetic provider behavior change.
  - Change provider log wording.
  - Change ABI/export composition.
  - Exercise old-save/provider migration path.

### Measurement
  - build/export success
  - provider conformance diff
  - semantic state diff
  - migration/recovery diff
  - performance delta diagnostic
  - new warning/failure count

### Success criterion
Material regressions are detected before support admission; exact changed dependency is traceable; rollback restores baseline behavior.

### Failure criterion
Upgrade is accepted because it compiles despite a covered semantic/export/recovery regression, or build identity cannot prove what changed.

### Inconclusive conditions
Candidate delta is too trivial and no meaningful relevant subsystem is rerun.

### Required repetition
At least one full controlled upgrade exercise for each material dependency class before final support qualification.

### Required evidence artifacts
  - before/after dependency manifests
  - proof subset results
  - semantic/export diff
  - rollback evidence
  - upgrade decision package

### PRD-08 decision relevance
Supports P05–P07/P10/P16/R18 and future dependency-update policy.

## 105.5 PRD04-PROOF-75 — Observability Overhead

**Round-7 planning state:** `SPECIFIED — NOT EXECUTED`  
**Wave:** `W5`  
**Principal fixture(s):** FIXTURE-09 + FIXTURE-10  
**Detailed PRD-06 consumers (12):** `PRD06-RISK-B07`, `PRD06-RISK-G01`, `PRD06-RISK-G06`, `PRD06-RISK-G09`, `PRD06-RISK-P02`, `PRD06-RISK-P15`, `PRD06-RISK-P18`, `PRD06-RISK-P19`, `PRD06-RISK-P20`, `PRD06-RISK-P23`, `PRD06-RISK-Q09`, `PRD06-RISK-R19`

### Question
Does production-intended observability remain bounded enough that instrumentation does not materially create or hide the failures it is meant to diagnose?

### Hypotheses
  - H1: Structured logs/metrics/traces can preserve critical evidence with bounded CPU, memory, lock, I/O and cardinality overhead.
  - H0: Observability changes scheduling/load enough to invalidate benchmarks or destabilize the system.

### Candidate implementations under test
  - CANDIDATE-A: bounded structured events + low-cardinality metrics + sampled traces.
  - CANDIDATE-B: tiered observability profiles with a production-minimum baseline.

### Prerequisites
  - FIXTURE-09 production-like diagnostics stack.
  - FIXTURE-10 hostile workload or representative W1/W2/W4 stress composition.
  - Ability to run observability OFF/minimum/expanded profiles.
  - Exact build and sampling configuration.

### Build/configuration matrix
  - observability off baseline
  - production-minimum
  - expanded diagnostics
  - high-cardinality hostile labels
  - log sink slowdown
  - trace burst
  - failure storm

### Workload / state
Sustained hostile workloads stressing async tasks, queues, network/persistence and diagnostics.

### Fault / hostility matrix
  - Slow/block one diagnostic sink.
  - Generate extreme event volume.
  - Inject high-cardinality IDs.
  - Trigger real faults mixed with expected stale events.

### Measurement
  - CPU overhead
  - memory overhead
  - allocation rate
  - lock/wait time
  - I/O volume
  - metric cardinality
  - event loss
  - critical evidence retention
  - benchmark result shift

### Success criterion
Production-minimum observability overhead stays within predeclared experimental bounds, queues/cardinality remain bounded and critical evidence survives; measurement perturbation is explicitly quantified.

### Failure criterion
Instrumentation causes instability/unbounded growth, hides critical faults, or shifts measured behavior enough that the benchmark claim becomes invalid without disclosure.

### Inconclusive conditions
Workload is too light to expose observability cost or OFF/ON builds are not otherwise comparable.

### Required repetition
Long sustained hostile runs across OFF/minimum/expanded profiles and multiple event-volume levels.

### Required evidence artifacts
  - overhead comparison dataset
  - CPU/memory/I-O traces
  - cardinality report
  - event-loss audit
  - sampling configuration
  - benchmark perturbation analysis

### PRD-08 decision relevance
Supports P18–P20/P23 and final production-observability decisions.



# 106. Continuing-Gate W5 Revalidation Requirements

| Proof | Continuing gate | Fixture(s) | Detailed PRD-06 consumers | W5 expansion |
|---|---|---|---:|---|
| `PRD04-PROOF-70` | Exported Artifact Matrix | FIXTURE-09 | 30 | Expand the W0 bootstrap matrix into every materially claimed client/server/Forge/profile/platform artifact; require clean rebuilds, artifact hashes, exact manifests, role-content checks and real startup/smoke execution. Final W5 run is the artifact qualification evidence surface. |
| `PRD04-PROOF-71` | Renderer / Hardware Lane | FIXTURE-08 + FIXTURE-09 | 19 | Re-run W4 representative renderer/profile evidence across the actual hardware/support lanes under final benchmark identity; bind any support claim to exact artifact, hardware, renderer/profile and acceptance criteria. |
| `PRD04-PROOF-73` | Local Patch Reproducibility | FIXTURE-09 | 10 | If local patches/forks exist, repeat reproducibility after the dependency-upgrade exercise and verify the patch can be applied/rebased from clean upstream without provider-internal authority leakage. If none exist, preserve explicit NO-LOCAL-PATCH baseline. |
| `PRD04-PROOF-74` | Architecture Dependency Lint | FIXTURE-01 + FIXTURE-07 + FIXTURE-09 | 22 | Run continuously across the completed code/content/build graph. Expand lint rules to cover provider-internal imports/IDs, forbidden historical paths, `leyforge_test`/`leyforge_compat` production leakage, current-domain→legacy-schema dependencies and build/dependency boundary violations. |

These proofs retain their original detailed specifications from Rounds 2/6.

W5 adds **qualification depth**, not new proof identity.

# 107. Composite Build Identity — Final W5 Minimum

For W5, the minimum comparable artifact identity is:

```text
LEYFORGE SOURCE REVISION
+ GODOT EXACT VERSION / REVISION
+ VOXEL TOOLS EXACT REVISION + EDITION
+ LOCAL PATCH / FORK IDENTITY
+ MATERIAL NATIVE / TOOLCHAIN DEPENDENCIES
+ PRECISION / PROVIDER / BUILD PROFILE
+ CLIENT / SERVER / FORGE ROLE
+ PLATFORM / ARCHITECTURE
+ RENDERER / PRESENTATION PROFILE WHERE MATERIAL
+ CONTENT / SCHEMA / PACK IDENTITY
+ EXACT SYMBOL PACKAGE IDENTITY
= REPRODUCIBLE QUALIFICATION SUBJECT
```

A release name/version is useful metadata but cannot replace this composite identity.

# 108. W5 Supportability Evidence Classes

PRD-07 distinguishes:

- **BUILD EVIDENCE** — what exact product was produced;
- **CRASH EVIDENCE** — whether exact native failures can be diagnosed later;
- **SUPPORT EVIDENCE** — whether bounded safe diagnostic material can be gathered;
- **DEPENDENCY EVIDENCE** — whether upgrades/patches are reproducible and regression-tested;
- **OBSERVABILITY EVIDENCE** — whether production diagnostics remain bounded/useful;
- **HARDWARE/PROFILE EVIDENCE** — whether exact product lanes satisfy declared support claims.

None of these alone proves every other class.

# 109. Qualification Anti-Promotion Tests

The W5 harness must contain negative-control cases that attempt to promote:

1. editor-only success to exported-artifact support;
2. headless success to renderer support;
3. debug/profile benchmark to release performance;
4. one hardware machine to universal support;
5. one renderer lane to all renderer lanes;
6. compile success to dependency compatibility;
7. current-build symbolication to old-build retention;
8. a safe support bundle with no useful evidence to “supportability”;
9. observability-OFF benchmark to production-minimum performance without overhead disclosure;
10. historical POC benchmark numbers to current budgets.

The qualification validator must reject those promotions.

# 110. W5 Benchmark Context Minimum

Every benchmark/qualification dataset must record:

- exact build/artifact;
- exact dependency state;
- exact content/world fixture;
- hardware;
- OS/driver where material;
- renderer/profile;
- provider edition;
- precision mode;
- settings profile;
- player/client/view count where material;
- warm-up;
- duration/iteration count;
- metric collection configuration;
- observability configuration;
- workload/fault identity.

Missing material fields make the result non-comparable or `INVALIDATED`.

# 111. Dependency Upgrade Admission Rule

`PROOF-72` does not require every dependency change to rerun all 76 proofs.

Instead, a controlled upgrade plan must identify:

```text
CHANGED DEPENDENCY
        ↓
MATERIAL CONTRACT / ABI / EXPORT / PROVIDER SURFACES
        ↓
AFFECTED PRD-06 RISK FAMILIES
        ↓
REQUIRED PRD-07 PROOF / FIXTURE SUBSET
        ↓
BASELINE COMPARISON
        ↓
ADMIT / REJECT / INVESTIGATE
```

A high-impact engine/provider change may legitimately require a broad subset.

A narrow tooling change may require much less.

The mapping must be explicit and evidence-based.

# 112. Symbol / Artifact Retention Rule

If a product version remains supported, the evidence needed to diagnose its native crashes must remain available for at least the same support/migration window.

That can include:

- artifact manifest;
- exact binary hash;
- matching symbols;
- dependency/source identity;
- content/schema identity;
- crash decoding instructions/tool version if required.

W5 does not select the storage backend or retention duration numerically.

# 113. Support Bundle Privacy Rule

The support bundle is **allowlist-first**.

It may include only bounded evidence required by the declared support schema.

It must never recursively archive arbitrary project/user/home/save/config directories merely because they are convenient.

Synthetic secret fixtures are mandatory before qualification.

# 114. Observability Heisenbug Rule

When observability changes timing enough to alter a concurrency result, PRD-07 must preserve both:

- the changed behavior as evidence;
- the observability profile causing it.

The run must not hide the perturbation.

A diagnostic configuration that prevents reproduction of the underlying bug may still be useful operationally, but it cannot be treated as neutral measurement evidence.

# 115. W5 Cross-Proof Interaction Matrix

| Interaction | Required relationship |
|---|---|
| `64 → 65` | Support bundle must preserve useful structured classification evidence. |
| `64 ↔ 75` | Diagnostic classification must survive the production-minimum observability profile. |
| `66 ↔ 70` | Symbolication binds to exact exported artifact identity. |
| `70 ↔ 71` | Hardware/profile support claims refer to exact exported products. |
| `72 → 70/71` | Dependency upgrade invalidates/requires rerun of materially affected artifact/hardware lanes. |
| `72 ↔ 73` | Local patches must be re-applied/rebased across relevant dependency upgrades. |
| `73 ↔ 74` | Patch/fork use cannot introduce provider-internal architecture leakage. |
| `74 ↔ all waves` | Architecture lint remains a continuous gate over the final code/content graph. |
| `75 ↔ 18/46/47/71` | Observability overhead must be considered when interpreting saturation/network/persistence/hardware benchmarks. |

# 116. Round-7 Reverse-Coverage Check

| Proof | Detailed PRD-06 consumers |
|---|---:|
| `PRD04-PROOF-64` | 5 |
| `PRD04-PROOF-65` | 4 |
| `PRD04-PROOF-66` | 3 |
| `PRD04-PROOF-72` | 17 |
| `PRD04-PROOF-75` | 12 |
| `PRD04-PROOF-70` | 30 |
| `PRD04-PROOF-71` | 19 |
| `PRD04-PROOF-73` | 10 |
| `PRD04-PROOF-74` | 22 |

# 117. Round-7 Closure Gates

| Gate | Result |
|---|---|
| New W5 stable proof IDs identified | **PASS — 5/5** |
| Continuing W5 qualification gates identified | **PASS — 4/4** |
| Every new W5 proof explicitly specified | **PASS — 5/5** |
| Every new W5 proof has hypothesis/candidates | **PASS — 5/5** |
| Every new W5 proof has prerequisites | **PASS — 5/5** |
| Every new W5 proof has workload/fault matrix | **PASS — 5/5** |
| Every new W5 proof has measurements | **PASS — 5/5** |
| Every new W5 proof has success/failure/inconclusive criteria | **PASS — 5/5** |
| Every new W5 proof has repetition/evidence requirements | **PASS — 5/5** |
| PROOF-70 full artifact qualification expansion defined | **PASS** |
| PROOF-71 hardware/profile expansion defined | **PASS** |
| PROOF-73 patch qualification rerun defined | **PASS** |
| PROOF-74 continuous final-graph lint rerun defined | **PASS** |
| FIXTURE-09 final W5 expansion defined | **PASS** |
| Exact symbols tied to exact artifact identity | **PASS** |
| Support bundle privacy/usefulness dual gate defined | **PASS** |
| Dependency compile success blocked from implying compatibility | **PASS** |
| Observability overhead explicitly measured | **PASS** |
| Qualification anti-promotion controls defined | **PASS** |
| Historical/one-machine/debug evidence blocked from P5 promotion | **PASS** |
| Actual proof runs executed | **PASS — 0** |
| PRD-08 conclusions created | **PASS — 0** |
| Implementation ADRs accepted | **PASS — 0** |
| Architecture reopen candidates created | **PASS — 0** |

**Round-7 closure score: 24 / 24 PASS.**

# 118. Round-7 Verdict

> **ROUND 7 PASS — W5 BUILD / DEPENDENCY / OBSERVABILITY / QUALIFICATION PROOF SPECIFICATIONS COMPLETE.**

The key consequences are:

1. Expected stale work and real failures must be distinguishable by Leyforge-owned structured diagnostics.
2. Support evidence must be simultaneously useful and privacy-safe.
3. Exact shipped binaries require exact retained symbol packages.
4. Dependency upgrades are admitted by affected proof evidence, not compile success.
5. Local patches/forks are explicit dependency deltas and must survive clean rebuild/rebase exercises.
6. Exported artifact identity is the subject of qualification—not editor/project state.
7. Renderer/hardware support binds to exact artifacts and declared workloads.
8. Architecture lint remains continuous across the final graph.
9. Observability is part of the production load and must be benchmarked as such.
10. Qualification claims that exceed the lane actually tested must be mechanically rejected.

No Round-7 finding requires PRD-04/05/06 reopening.

# 119. Machine-Readable Round-7 Summary

```yaml
document: PRD-07
version: v0.7
round: 7
status: WORKING
round_status: PASS
wave: W5
new_proofs_specified: [64, 65, 66, 72, 75]
new_proof_count: 5
continuing_gates_revalidated: [70, 71, 73, 74]
continuing_gate_count: 4
fixture_contracts_expanded: [FIXTURE-09]
actual_execution_runs: 0
evidence_artifacts_allocated: 0
prd08_results_created: 0
implementation_adrs_accepted: 0
architecture_reopen_candidates: 0
round7_closure:
  passed: 24
  failed: 0
next_round: Cross-Wave Harness / Matrix / Automation / Evidence-Pack Reconciliation
```

---

**End of PRD-07 v0.7 — Round 7 Working Baseline**


---

# 120. Round-8 Scope — Cross-Wave Harness / Matrix / Automation / Evidence-Pack Reconciliation

Rounds 2–7 specified every normal W0–W5 proof.

Mechanical verification entering Round 8:

```text
Stable proof IDs:                         76
Detailed normal proof specs already:      75
Only proof not yet detailed:              76
Shared fixture families:                  10
Primary execution waves:                   6
Final common-cause wave:                   1
Actual PRD-07 runs:                        0
PRD-08 results:                            0
Accepted implementation ADRs:              0
```

Round 8 has five responsibilities:

1. define the **one shared execution harness architecture** used across W0–W5;
2. reconcile the ten fixture families into reusable components rather than isolated test worlds;
3. define automated run/evidence manifests and cross-wave invalidation/re-run rules;
4. define evidence-pack completeness gates for PRD-08;
5. specify the final remaining stable proof: **PRD04-PROOF-76**.

After this round, all **76 / 76** proofs have detailed execution specifications.

# 121. Cross-Wave Harness Architecture

The recommended logical harness is:

```text
PRD-07 ORCHESTRATOR
│
├── BUILD / ARTIFACT CONTROLLER
│   ├── clean build/export
│   ├── dependency/profile selection
│   ├── build manifest
│   └── symbol/artifact capture
│
├── PROCESS CONTROLLER
│   ├── client/server/Forge launch
│   ├── external kill/restart
│   └── stdout/stderr/native crash capture
│
├── SCENARIO / FIXTURE CONTROLLER
│   ├── seed/config
│   ├── world/content setup
│   ├── player/entity commands
│   └── phase barriers
│
├── FAULT INJECTOR
│   ├── async delay/reorder/stale completion
│   ├── network impairment
│   ├── storage slowdown/corruption
│   ├── provider failure
│   └── process termination
│
├── INVARIANT / ORACLE LAYER
│   ├── canonical snapshots/hashes
│   ├── identity/owner/revision checks
│   ├── conservation
│   ├── semantic commit ledger
│   └── expected-vs-observed migration/content matrices
│
├── METRICS / DIAGNOSTICS COLLECTOR
│   ├── structured events
│   ├── queues/latency/resource metrics
│   ├── logs/traces/profiles
│   └── presentation/human-review evidence
│
└── EVIDENCE PACKAGER
    ├── run.yaml
    ├── manifests
    ├── raw evidence
    ├── observations
    └── PRD-08 handoff summary
```

This is a **logical contract**, not a mandatory single executable/tool.

Different implementations may satisfy it as scripts, test projects, CI jobs, GDScript/GDExtension tooling or external process controllers.

# 122. Fixture Composition Map

The ten fixture families compose into four reusable layers.

## 122.1 Semantic Core

- **FIXTURE-01** — world/session/registry/coordinate/frame identity
- **FIXTURE-03** — ownership/simulation/worker/revision/transaction

## 122.2 World / Provider / Complex-Domain Layer

- **FIXTURE-02** — voxel/spatial/collision/navigation
- **FIXTURE-06** — vessel/fluid/moving frame

## 122.3 Durability / Distribution Layer

- **FIXTURE-04** — checkpoint/persistence/migration/recovery
- **FIXTURE-05** — server/network/interest/reconnect

## 122.4 Production / Presentation / Qualification Layer

- **FIXTURE-07** — Forge/content/trust/art/migration corpus
- **FIXTURE-08** — renderer/accessibility/settings/cartography
- **FIXTURE-09** — build/artifact/dependency/support/observability
- **FIXTURE-10** — integrated hostile composition

Direct PRD-06 detailed-risk consumers:

| Fixture | Detailed risk consumers |
|---|---:|
| `FIXTURE-01` | 41 |
| `FIXTURE-02` | 46 |
| `FIXTURE-03` | 54 |
| `FIXTURE-04` | 58 |
| `FIXTURE-05` | 47 |
| `FIXTURE-06` | 29 |
| `FIXTURE-07` | 53 |
| `FIXTURE-08` | 27 |
| `FIXTURE-09` | 84 |
| `FIXTURE-10` | 46 |

A shared harness component should be implemented once where its semantics are truly shared.

A proof-specific scenario may still wrap/extend the fixture without changing the stable fixture identity.

# 123. Required Harness Services

Across the programme, the execution system must eventually provide these reusable services:

1. **stable test-run identity**;
2. **seed management**;
3. **canonical-state snapshot/normalization**;
4. **owner/revision/session/frame introspection**;
5. **semantic operation/commit ledger**;
6. **controlled async delay/reorder/release**;
7. **network impairment**;
8. **storage impairment/corruption**;
9. **provider failure/readiness injection**;
10. **real external process control**;
11. **build/export/dependency manifest capture**;
12. **artifact/symbol hashing**;
13. **resource/queue/latency metrics**;
14. **structured diagnostics/tracing**;
15. **presentation capture/human-review attachment**;
16. **content/pack/migration expected-result matrices**;
17. **automatic evidence-pack validation**.

A service may be absent until the first proof requiring it is implemented.

# 124. Proof / Run / Scenario / Matrix Identity

Round 8 adds two optional planning identities beneath `PRD07-RUN-*`:

```text
PRD07-SCENARIO-XXXX
PRD07-MATRIX-XXXX
```

Their purpose is organizational:

- a **scenario** is a reusable semantic setup/fault script;
- a **matrix** groups comparable build/hardware/candidate/scenario rows;
- a **run** is one actual execution;
- an **evidence artifact** is one retained output.

They do not replace the stable proof identity.

No IDs are allocated yet because there are still zero actual executions.

# 125. Final Common-Cause Proof Specification

## 125.1 PRD04-PROOF-76 — Whole-Stack Hostile Transaction Soak

**Round-8 planning state:** `SPECIFIED — NOT EXECUTED`  
**Wave:** `FINAL`  
**Principal fixture:** `FIXTURE-10`  
**Detailed PRD-06 consumers (27):** `PRD06-RISK-E10`, `PRD06-RISK-G01`, `PRD06-RISK-G02`, `PRD06-RISK-G03`, `PRD06-RISK-G05`, `PRD06-RISK-G07`, `PRD06-RISK-G08`, `PRD06-RISK-I07`, `PRD06-RISK-J15`, `PRD06-RISK-J18`, `PRD06-RISK-K16`, `PRD06-RISK-Q01`, `PRD06-RISK-Q02`, `PRD06-RISK-Q03`, `PRD06-RISK-Q04`, `PRD06-RISK-Q05`, `PRD06-RISK-Q06`, `PRD06-RISK-Q07`, `PRD06-RISK-Q08`, `PRD06-RISK-Q10`, `PRD06-RISK-Q11`, `PRD06-RISK-Q13`, `PRD06-RISK-Q14`, `PRD06-RISK-Q16`, `PRD06-RISK-Q17`, `PRD06-RISK-Q18`, `PRD06-RISK-Q19`

### Question

When the previously proven Leyforge subsystems are combined under sustained hostile load, do their individually safe behaviors compose without creating a new common-cause failure across authority, transactions, networking, persistence, providers, content, presentation or diagnostics?

### Hypotheses

- **H1:** The accepted architecture plus proven candidate implementations preserve the declared cross-system invariants when multiple stressors/failures overlap.
- **H0:** Individually acceptable components interact to produce a new common-cause failure, hidden circular dependency, unbounded queue, mixed authority, recovery ambiguity or observability-induced instability.

### Candidate implementation under test

`PROOF-76` does not compare isolated architecture candidates.

It tests the **current integrated candidate stack** selected for the soak, with exact ADR/candidate states recorded but not implicitly accepted by PRD-07.

If more than one integrated stack remains viable, each receives a separate comparison group and run set.

### Entry prerequisites

`PROOF-76` is `HARNESS-BLOCKED` until:

1. every prerequisite proof needed by the integrated stack has at least usable PRD-07 execution evidence;
2. PRD-08 has evaluated enough of that evidence to define which candidates are allowed into the integrated soak;
3. the real exported client/server/Forge products needed by the soak exist;
4. exact build/dependency/content/symbol identity is recordable;
5. the persistence/network recovery harnesses can survive injected process/network/storage failures;
6. the production-minimum observability profile exists;
7. any known architecture-reopen candidate that invalidates the integrated stack is resolved or explicitly excludes the run.

A single `PASS-OBSERVED` result from every lower proof is not mechanically required if PRD-08 determines some proofs are irrelevant to the exact integrated configuration, but every omitted prerequisite must be justified.

### Integrated workload

The hostile-world fixture should combine, as applicable to the current candidate stack:

- active player/client commands;
- cross-domain construction/inventory transactions;
- voxel edits and late generation;
- collision/nav derived rebuilds;
- distant simulation;
- ownership transfer and stale workers;
- fluid updates;
- moving editable vessels;
- interest changes / teleport-like spikes;
- network loss/duplication/backpressure;
- persistence writes/checkpoints;
- periodic save/backup/migration-like work where safe for the soak;
- Forge/content pack validation/load paths relevant to runtime;
- renderer/accessibility/profile activity on client lanes;
- structured diagnostics/metrics/traces at production-minimum settings.

### Hostile fault schedule

The soak must inject overlapping, seeded faults rather than only one fault at a time.

At minimum the final programme should include combinations such as:

- stale worker completion during partition transfer;
- canonical voxel edit while generation/collision/nav work is delayed;
- construction or inventory transaction during packet loss/ACK loss;
- teleport/interest spike during bulk voxel transfer;
- persistence slowdown during heavy edits;
- reconnect during an unresolved transaction;
- vessel region crossing while hull/collision/flooding state is updating;
- provider degradation while unrelated queues are saturated;
- support/diagnostic event storm during a real subsystem failure;
- real process termination at selected persistence/transaction phases, followed by recovery and continued soak;
- dependency/provider/build lane variant only where it is itself a qualified supported lane.

### Primary invariants

The final soak must continuously assert at least:

- `IDENTITY`
- `ONE-OWNER`
- `REVISION`
- `CONSERVATION`
- `ONE-COMMIT`
- `PROJECTION-DERIVED`
- `SESSION-EPOCH`
- `FRAME-INVARIANT`
- `DETERMINISM` for domains that claim it
- `BOUNDED-WORK`
- `TRACEABILITY`
- coherent checkpoint lineage
- client cache non-authority
- network/persistence projection consistency
- current provider/read-model revision compatibility
- no test/compat content leakage
- no hidden map-knowledge leakage
- no critical accessibility semantic loss in the tested presentation lane.

### Measurement

Collect at minimum:

- invariant violation count;
- duplicate/lost semantic operation count;
- stale commit count;
- owner ambiguity count;
- checkpoint/recovery mismatch count;
- network/persistence convergence status;
- queue depth and queue age by workload class;
- critical operation latency;
- memory growth;
- CPU/thread saturation;
- persistence durability lag;
- provider/readiness lag;
- diagnostic event volume/cardinality;
- observability overhead;
- process crash/restart recovery results;
- first-divergence seed/revision/operation ID for every failure.

### Success criterion

The selected integrated stack completes the predeclared soak duration/iteration/fault matrix with **zero unclassified authoritative invariant violations**, bounded/recoverable work queues, coherent recovery after injected real failures, and evidence sufficient to explain every consequential operation/failure.

Allowed degraded behavior must be predeclared and must preserve the governed semantic invariants.

### Failure criterion

Any of the following is a failure:

- mixed or duplicate canonical authority;
- unrecoverable or unexplained conservation loss;
- stale result accepted as current;
- one operation producing incompatible semantic outcomes;
- mixed checkpoint lineage;
- client/provider/presentation state redefining server/domain truth;
- unbounded resource growth;
- deadlock/livelock without bounded recovery;
- failure that cannot be reconstructed from retained evidence;
- test/compat/hidden-map/accessibility authority leakage;
- a real crash/restart yielding a state outside declared durability semantics.

### Inconclusive conditions

The soak is `INCONCLUSIVE` if:

- prerequisite candidates/ADRs are still materially changing during the run;
- the fixture disables enough subsystems that the common-cause interaction claim is not representative;
- build/workload identity is incomplete;
- observability loss prevents classification of failures;
- the run ends before queue/memory/recovery behavior reaches meaningful steady/hostile conditions.

### Required repetition

PRD-08 will determine final required duration/coverage from preceding evidence.

PRD-07 requires:

- multiple independent seeded soak runs;
- multiple real-process restart/recovery cycles;
- at least one clean baseline run without injected faults;
- at least one maximal supported integrated lane;
- at least one lower-resource/degraded supported lane where such a support claim exists;
- retention of every failing seed and first-divergence evidence.

### Required evidence artifacts

- exact integrated build/dependency/content manifests;
- proof/ADR/candidate prerequisite manifest;
- hostile fault schedule + seeds;
- canonical invariant event stream;
- transaction/operation ledger;
- network/interest metrics;
- persistence/checkpoint/recovery artifacts;
- vessel/fluid/provider readiness metrics where active;
- renderer/profile/hardware identity where client presentation participates;
- observability configuration and overhead data;
- real crash/kill evidence;
- restart/recovery verification;
- machine-readable final soak summary;
- every unexpected new-risk candidate.

### PRD-08 decision relevance

`PROOF-76` is the final common-cause integration evidence surface.

A successful soak can support confidence that the selected candidate stack composes coherently.

It does **not** erase failures found in lower-level proofs, substitute for omitted qualification lanes, or by itself certify every platform/hardware/profile not present in the soak.


# 126. Cross-Wave Revalidation / Invalidation Rules

Evidence is not timeless.

A prior run becomes `RERUN-REQUIRED` or loses applicability when a material input changes.

At minimum, PRD-07 must evaluate revalidation when any of these change:

- canonical architecture boundary;
- implementation ADR/candidate used by the proof;
- Godot/Voxel Tools/native dependency materially affecting the proof;
- precision/provider/build profile;
- persistence/network protocol/schema;
- content-pack semantic schema;
- Forge source/bake format;
- renderer/profile behavior;
- fixture oracle/invariant definition;
- observability configuration when timing/performance is material;
- hardware/support lane for qualification claims.

Examples:

- changing the provider edition can invalidate `03/67/70/72/73` and any provider-dependent downstream evidence;
- changing checkpoint publication can invalidate `39/40/41/45/47/48/58/69`;
- changing content identity/migration resolver can invalidate `36/54/57/58/62`;
- changing vessel collision strategy can invalidate `29/30/31/32/76`;
- changing the production observability stack can invalidate the performance interpretation of `18/46/47/71/75/76`.

A re-run is scoped to materially affected proofs, not automatically all 76.

# 127. Continuing Proof Register

| Proof | Primary execution | Expected continuing use |
|---|---|---|
| `PRD04-PROOF-57` | W2 | W2 → W4 |
| `PRD04-PROOF-58` | W2 | W2 → W4 |
| `PRD04-PROOF-67` | W0 | W0 → later provider-dependent waves |
| `PRD04-PROOF-70` | W0 | W0 → W5 |
| `PRD04-PROOF-71` | W4 | W4 → W5 |
| `PRD04-PROOF-72` | W5 | W5 → future dependency changes |
| `PRD04-PROOF-73` | W0 | W0 → W5 → future dependency changes |
| `PRD04-PROOF-74` | W0 | W0 → continuous through W5 and final graph |
| `PRD04-PROOF-75` | W5 | W5 → re-run when observability materially changes |

This register prevents a successful early bootstrap result from being mistaken for perpetual qualification.

# 128. Automation Tiers

The execution programme distinguishes four automation tiers.

## TIER A — Fully deterministic automated

Examples:

- ID randomization;
- stale worker injection;
- checkpoint corruption;
- migration matrix;
- pack validator;
- architecture lint.

Expected outcome: fully machine-evaluable pass/fail/inconclusive.

## TIER B — Automated execution + quantitative review

Examples:

- CPU saturation;
- network/persistence backpressure;
- vessel collision scaling;
- observability overhead;
- renderer/hardware benchmarks.

Expected outcome: machine-collected measurements plus PRD-08 threshold/decision interpretation.

## TIER C — Automated setup + human semantic review

Examples:

- ART golden runtime evaluation;
- accessibility semantic tasks;
- renderer/profile readability;
- cartography usability/readability.

Expected outcome: exact build/task/capture + structured reviewer record.

## TIER D — Controlled destructive / external process

Examples:

- real crash recovery;
- corrupt/torn persistence;
- process kill;
- migration interruption;
- hostile content/resource tests.

Expected outcome: isolated environment, external controller, retained recovery evidence.

Automation tier is evidence metadata, not proof maturity.

# 129. Standard Run Manifest v0.1

Every future `PRD07-RUN-*` must contain:

```yaml
run_id:
proof_id:
scenario_id:
matrix_id:
candidate_id:
execution_wave:
automation_tier:
risk_ids:
fixture_ids:
authority_refs:
source_revision:
build:
  leyforge_revision:
  godot_revision:
  voxel_tools_revision:
  voxel_tools_edition:
  patch_fork_identity:
  build_profile:
  role:
  platform_architecture:
  precision:
  renderer_profile:
artifact:
  hash:
  symbol_package_id:
dependency_manifest_ref:
content_schema_manifest_ref:
hardware_ref:
seed:
workload_ref:
fault_schedule_ref:
observability_profile:
expected_outcome_ref:
start_time:
end_time:
observation_state:
raw_evidence_refs:
unexpected_findings:
new_risk_candidates:
adr_candidates:
reopen_candidates:
```

Fields irrelevant to a proof may be explicitly `N/A`, but must not be silently omitted when their relevance is ambiguous.

# 130. Standard Evidence Pack Layout v0.1

Recommended portable evidence package:

```text
PRD07-RUN-XXXX/
├── run.yaml
├── authority/
│   └── refs.yaml
├── manifests/
│   ├── build.*
│   ├── dependencies.*
│   ├── content.*
│   └── hardware.*
├── scenario/
│   ├── config.*
│   ├── seed.*
│   └── fault_schedule.*
├── expected/
├── observed/
├── raw/
│   ├── logs/
│   ├── traces/
│   ├── metrics/
│   ├── snapshots/
│   ├── crashes/
│   └── captures/
├── analysis/
│   └── machine_summary.*
└── handoff/
    └── prd08_summary.yaml
```

The exact filesystem/DB/object-store implementation remains open.

The semantic contents are the contract.

# 131. Evidence-Pack Completeness Validator

Before PRD-08 may treat a run as usable evidence, the pack validator checks:

- valid run/proof ID;
- exact source/build identity where required;
- dependency/content identity;
- fixture/scenario/fault identity;
- expected outcome defined before observation;
- observation state allowed by PRD-07;
- required raw artifacts present;
- no unresolved hash/reference mismatch;
- no hidden use of a different candidate/build row;
- privacy/security constraints satisfied;
- failed/inconclusive runs preserved rather than overwritten;
- every comparison matrix row distinguishable.

A pack can be marked:

```text
COMPLETE
COMPLETE-WITH-NONBLOCKING-WARNINGS
INCOMPLETE
INVALIDATED
```

This is evidence-package quality, not technical proof success.

# 132. Matrix Comparison Contract

Candidate/build/hardware comparisons must not compare mismatched workloads accidentally.

A matrix declares:

```yaml
matrix_id:
proof_id:
comparison_question:
fixed_dimensions:
varying_dimensions:
required_rows:
workload_ref:
fault_ref:
measurement_ref:
missing_row_policy:
```

If a material dimension differs outside `varying_dimensions`, the result is not automatically comparable.

# 133. Reproducibility Levels

PRD-07 records execution reproducibility separately from proof maturity:

- **R0** — cannot reproduce reliably;
- **R1** — same machine/environment reproducible;
- **R2** — clean local rebuild/environment reproducible;
- **R3** — second controlled environment/CI reproducible;
- **R4** — retained historical artifact can be reproduced/diagnosed later where applicable.

These levels describe the evidence package/process only.

They do not replace P0–P5 proof maturity.

# 134. Unexpected-Finding Escalation

Unexpected observations are first-class outputs.

Every run may emit:

- `NEW-RISK-CANDIDATE`;
- `ADR-CANDIDATE`;
- `ARCHITECTURE-REOPEN-CANDIDATE`;
- `FIXTURE-DEFECT`;
- `MEASUREMENT-DEFECT`;
- `DEPENDENCY-REGRESSION`;
- `CONTENT-AUTHORITY-CONFLICT`;
- `SECURITY-BOUNDARY-FAILURE`.

The observation remains attached to its original run even after downstream governance resolves it.

# 135. Cross-Wave Common Invariant Registry

The complete shared invariant registry now includes:

1. `IDENTITY`
2. `ONE-OWNER`
3. `REVISION`
4. `CONSERVATION`
5. `ONE-COMMIT`
6. `PROJECTION-DERIVED`
7. `SESSION-EPOCH`
8. `FRAME-INVARIANT`
9. `DETERMINISM`
10. `BOUNDED-WORK`
11. `TRACEABILITY`
12. `COHERENT-DURABILITY`
13. `SERVER-AUTHORITY`
14. `CONTENT-IDENTITY`
15. `TRUST-BOUNDARY`
16. `ACCESSIBLE-SEMANTICS`
17. `KNOWLEDGE-BOUNDARY`
18. `EXACT-ARTIFACT-EVIDENCE`

A proof declares only the invariants relevant to it.

`PROOF-76` consumes the integrated subset required by its selected stack.

# 136. PRD-08 Handoff Minimum

For each proof, PRD-08 should receive:

```text
PROOF SPECIFICATION
+ ALL RELEVANT RUNS
+ FAILED / INCONCLUSIVE RUNS
+ COMPARISON MATRICES
+ EVIDENCE-PACK COMPLETENESS
+ UNEXPECTED FINDINGS
+ CURRENT CANDIDATE STATUS
+ REMAINING COVERAGE GAPS
```

PRD-08 must not receive only the “best” passing run.

Negative evidence is part of the decision record.

# 137. Round-8 Mechanical Programme Coverage

After adding `PROOF-76`:

```text
Stable proof IDs:                          76
Proofs with detailed execution specs:      76
Proofs without detailed execution specs:    0
Shared fixture families:                   10
Fixture families with PRD-06 consumers:    10
Primary execution waves:                    6
Final common-cause wave:                    1
Current executed runs:                      0
Current PRD-08 results:                     0
```

Primary proof ownership by wave:

| Wave | Primary proof count |
|---|---:|
| **W0** | 13 |
| **W1** | 17 |
| **W2** | 20 |
| **W3** | 7 |
| **W4** | 13 |
| **W5** | 5 |
| **FINAL** | 1 |
| **TOTAL** | **76** |

Multi-wave revalidation does not create new proof IDs.

# 138. Round-8 Closure Gates

| Gate | Result |
|---|---|
| Existing detailed normal proof specs verified | **PASS — 75/75** |
| PROOF-76 detailed specification added | **PASS — 1/1** |
| Total detailed proof specifications | **PASS — 76/76** |
| Shared fixture families reconciled | **PASS — 10/10** |
| Cross-wave logical harness defined | **PASS** |
| Reusable harness services defined | **PASS** |
| Scenario/matrix identity model defined | **PASS** |
| Cross-wave revalidation/invalidation rules defined | **PASS** |
| Continuing proof register defined | **PASS** |
| Automation tiers defined | **PASS** |
| Standard run manifest defined | **PASS** |
| Standard evidence-pack layout defined | **PASS** |
| Evidence-pack completeness validator defined | **PASS** |
| Matrix comparison contract defined | **PASS** |
| Reproducibility levels defined | **PASS** |
| Unexpected-finding escalation defined | **PASS** |
| Integrated invariant registry defined | **PASS** |
| PRD-08 complete-evidence handoff defined | **PASS** |
| PROOF-76 blocked from substituting for prerequisite evidence | **PASS** |
| Actual proof runs executed | **PASS — 0** |
| PRD-08 conclusions created | **PASS — 0** |
| Implementation ADRs accepted | **PASS — 0** |
| Architecture reopen candidates created | **PASS — 0** |

**Round-8 closure score: 23 / 23 PASS.**

# 139. Round-8 Verdict

> **ROUND 8 PASS — CROSS-WAVE HARNESS / MATRIX / AUTOMATION / EVIDENCE-PACK RECONCILIATION COMPLETE.**

The execution programme is now structurally complete:

1. all **76 / 76** proofs have detailed specifications;
2. the ten fixtures compose into one logical harness architecture;
3. candidate/build/hardware comparisons have a governed matrix model;
4. runs and raw evidence have stable identities and portable manifests;
5. revalidation follows material changes rather than arbitrary full-suite repetition;
6. failed and inconclusive evidence is retained;
7. automation strength is separated from proof maturity;
8. `PROOF-76` is formally defined as a final common-cause integration soak and cannot bypass prerequisite evidence.

Round 9 is now a **reverse audit**, not further proof design.

# 140. Machine-Readable Round-8 Summary

```yaml
document: PRD-07
version: v0.8
round: 8
status: WORKING
round_status: PASS
stable_proof_ids: 76
detailed_proof_specs:
  before_round8: 75
  added_round8: [76]
  final: 76
shared_fixture_families: 10
primary_execution_waves: 6
final_wave: FINAL
run_manifest_version: v0.1
evidence_pack_layout_version: v0.1
current_execution_runs: 0
prd08_results_created: 0
implementation_adrs_accepted: 0
architecture_reopen_candidates: 0
round8_closure:
  passed: 23
  failed: 0
next_round: Reverse Audit of 76 Proof Specifications + 263 Risk Consumers
```

---

**End of PRD-07 v0.8 — Round 8 Working Baseline**


---

# 141. Round-9 Scope — Reverse Audit of 76 Proof Specifications Against 263 PRD-06 Child Risks

Round 9 performs the final mechanical and semantic-structure completeness audit before PRD-07 closure.

The direction is reversed:

```text
PRD-06 CHILD RISK
        ↓
DECLARED PROOF ROUTE(S)
        ↓
PRD-07 DETAILED EXECUTION SPECIFICATION(S)
        ↓
COMPATIBLE FIXTURE ROUTE
        ↓
MEASUREMENT / SUCCESS / FAILURE / INCONCLUSIVE CRITERIA
        ↓
REQUIRED EVIDENCE ARTIFACTS
        ↓
PRD-08 DECISION HANDOFF
```

A failure at any layer would mean PRD-07 is not yet executable as a controlled programme.

Round 9 adds **no new risk, proof, fixture, candidate or ADR** unless the reverse audit discovers a real gap.

It discovered **no such gap**.

# 142. Reverse-Audit Method

For all **263 PRD-06 child risks**, Round 9 verifies:

1. the child risk has at least one stable proof route;
2. every referenced proof ID is one of `PRD04-PROOF-01..76`;
3. every referenced proof has a detailed PRD-07 specification;
4. the proof specification includes:
   - question;
   - hypotheses;
   - candidate implementation(s);
   - prerequisites;
   - workload;
   - hostile/fault conditions;
   - measurement;
   - success criterion;
   - failure criterion;
   - inconclusive criterion;
   - repetition;
   - required evidence;
   - PRD-08 relevance;
5. the PRD-06 child risk has explicit success/exit evidence;
6. the risk's fixture route intersects the fixtures used by at least one of its proof specifications;
7. the risk appears in the exact embedded consumer list of every proof to which PRD-06 routes it;
8. no proof's embedded consumer list invents or omits a PRD-06 child risk.

This verifies **traceability and specification completeness**, not future proof success.

# 143. Top-Level Reverse-Audit Result

```text
PRD-06 child risks:                         263
Unique child-risk IDs:                     263
CRITICAL / HIGH:                           170 / 93
P0 / P1:                                   226 / 37

Child risks with >=1 proof route:           263 / 263
Child risks with >=1 fixture route:         263 / 263
Child risks with explicit exit evidence:    263 / 263

Risk → proof edges audited:                 724
Risk → fixture edges audited:               485

Stable proof IDs:                            76
Proofs with detailed PRD-07 specs:            76 / 76
Proof specs with all required fields:         76 / 76
Proofs with exact PRD-06 consumer parity:     76 / 76

Risk fixture→proof-spec compatibility:       263 / 263
Unmapped child risks:                          0
Orphan detailed proof specs:                   0
Consumer-list mismatches:                      0
New proof IDs required:                        0
New risk IDs required:                         0
```

# 144. Risk Route Multiplicity

Multiple proof routes are expected when one risk needs isolated plus integrated evidence.

| Proof routes per child risk | Child risks |
|---:|---:|
| 1 | 22 |
| 2 | 86 |
| 3 | 105 |
| 4 | 38 |
| 5 | 9 |
| 6 | 3 |

Therefore:

```text
Single-proof-route risks:  22
Multi-proof-route risks:   241
Maximum proof routes/risk: 6
```

A single proof route is not automatically weak if that proof directly targets the exact failure class.

Round 9 audits all **22 single-route risks** separately in §149.

# 145. Fixture Route Multiplicity

| Fixture routes per child risk | Child risks |
|---:|---:|
| 1 | 77 |
| 2 | 153 |
| 3 | 30 |
| 4 | 3 |

Every child risk has at least one stable fixture family.

Every child risk has at least one proof whose detailed specification uses a fixture compatible with the PRD-06 route.

No child risk is left with a proof that cannot be connected to a runnable harness family.

# 146. Risk-Family Reverse Coverage

| Family | Risks | CRITICAL / HIGH | P0 / P1 | Unique proof IDs | Proof IDs | Fixture IDs |
|---|---:|---:|---:|---:|---|---|
| **A** | 9 | 6 / 3 | 9 / 0 | 14 | 05, 06, 08, 10, 11, 13, 18, 30, 37, 68, 70, 71, 72, 73 | 01, 02, 03, 05, 06, 09 |
| **B** | 9 | 0 / 9 | 9 / 0 | 11 | 03, 05, 11, 18, 67, 70, 71, 72, 73, 74, 75 | 01, 02, 09 |
| **C** | 12 | 9 / 3 | 10 / 2 | 16 | 01, 02, 03, 12, 22, 35, 36, 44, 45, 49, 52, 54, 57, 58, 67, 74 | 01, 02, 04, 05, 07 |
| **D** | 18 | 14 / 4 | 15 / 3 | 15 | 07, 20, 39, 40, 41, 45, 47, 48, 57, 58, 63, 67, 69, 72, 74 | 01, 03, 04, 05, 07, 09, 10 |
| **E** | 11 | 7 / 4 | 11 / 0 | 14 | 03, 17, 18, 21, 23, 24, 34, 39, 48, 58, 67, 68, 69, 76 | 01, 02, 03, 04, 10 |
| **F** | 14 | 10 / 4 | 14 / 0 | 17 | 07, 13, 14, 15, 16, 19, 20, 21, 22, 35, 39, 42, 45, 63, 68, 69, 74 | 01, 02, 03, 04, 05, 06, 09, 10 |
| **G** | 11 | 6 / 5 | 9 / 2 | 13 | 16, 18, 19, 20, 21, 37, 46, 47, 63, 67, 69, 75, 76 | 03, 04, 05, 09, 10 |
| **H** | 14 | 9 / 5 | 12 / 2 | 10 | 18, 22, 23, 25, 26, 34, 37, 63, 67, 68 | 01, 02, 03, 05, 06, 07, 09, 10 |
| **I** | 12 | 9 / 3 | 10 / 2 | 18 | 14, 16, 18, 23, 26, 27, 28, 29, 30, 32, 34, 39, 41, 59, 63, 68, 69, 76 | 02, 03, 04, 06, 08, 10 |
| **J** | 18 | 15 / 3 | 16 / 2 | 16 | 05, 06, 08, 18, 26, 29, 30, 31, 32, 33, 41, 42, 63, 67, 69, 76 | 01, 02, 03, 04, 05, 06, 10 |
| **K** | 16 | 12 / 4 | 13 / 3 | 17 | 35, 36, 37, 38, 39, 42, 43, 44, 45, 46, 54, 55, 56, 69, 70, 71, 76 | 01, 03, 04, 05, 07, 09, 10 |
| **L** | 8 | 4 / 4 | 8 / 0 | 15 | 03, 07, 10, 11, 15, 19, 20, 36, 45, 54, 57, 67, 70, 72, 73 | 01, 04, 05, 07, 09 |
| **M** | 15 | 11 / 4 | 12 / 3 | 13 | 36, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 62, 70 | 01, 04, 05, 07, 08, 09 |
| **N** | 14 | 7 / 7 | 10 / 4 | 11 | 49, 50, 51, 52, 53, 56, 59, 61, 62, 71, 72 | 01, 07, 08, 09 |
| **O** | 17 | 3 / 14 | 9 / 8 | 7 | 37, 53, 56, 59, 60, 61, 71 | 01, 03, 04, 05, 07, 08, 09 |
| **P** | 24 | 15 / 9 | 21 / 3 | 12 | 54, 63, 64, 65, 66, 67, 70, 71, 72, 73, 74, 75 | 03, 07, 08, 09, 10 |
| **Q** | 19 | 17 / 2 | 19 / 0 | 20 | 04, 09, 17, 18, 25, 26, 33, 34, 35, 39, 42, 43, 45, 48, 63, 64, 65, 69, 75, 76 | 01, 02, 03, 04, 05, 09, 10 |
| **R** | 22 | 16 / 6 | 19 / 3 | 15 | 02, 48, 49, 52, 57, 58, 62, 67, 69, 70, 71, 72, 73, 74, 75 | 01, 04, 07, 08, 09 |

Every A–R family reaches one or more detailed PRD-07 execution specifications.

No family depends only on `PROOF-76`.

# 147. 76-Proof Specification Completeness Ledger

| Proof | Primary wave | PRD-06 child consumers | Detailed spec fixture refs | Spec audit |
|---|---|---:|---|---|
| `PRD04-PROOF-01` | **W0** | 2 | FIXTURE-01 | **PASS — FULL SPEC** |
| `PRD04-PROOF-02` | **W0** | 11 | FIXTURE-01, FIXTURE-04 | **PASS — FULL SPEC** |
| `PRD04-PROOF-03` | **W0** | 9 | FIXTURE-01, FIXTURE-02, FIXTURE-09 | **PASS — FULL SPEC** |
| `PRD04-PROOF-04` | **W1** | 4 | FIXTURE-03, FIXTURE-10 | **PASS — FULL SPEC** |
| `PRD04-PROOF-05` | **W0** | 8 | FIXTURE-01, FIXTURE-09 | **PASS — FULL SPEC** |
| `PRD04-PROOF-06` | **W0** | 5 | FIXTURE-01, FIXTURE-03 | **PASS — FULL SPEC** |
| `PRD04-PROOF-07` | **W2** | 3 | FIXTURE-01, FIXTURE-04 | **PASS — FULL SPEC** |
| `PRD04-PROOF-08` | **W3** | 6 | FIXTURE-06 | **PASS — FULL SPEC** |
| `PRD04-PROOF-09` | **W2** | 1 | FIXTURE-01, FIXTURE-04, FIXTURE-05 | **PASS — FULL SPEC** |
| `PRD04-PROOF-10` | **W0** | 3 | FIXTURE-01, FIXTURE-05 | **PASS — FULL SPEC** |
| `PRD04-PROOF-11` | **W0** | 12 | FIXTURE-01, FIXTURE-09 | **PASS — FULL SPEC** |
| `PRD04-PROOF-12` | **W0** | 2 | FIXTURE-01 | **PASS — FULL SPEC** |
| `PRD04-PROOF-13` | **W1** | 6 | FIXTURE-03 | **PASS — FULL SPEC** |
| `PRD04-PROOF-14` | **W1** | 5 | FIXTURE-03, FIXTURE-05 | **PASS — FULL SPEC** |
| `PRD04-PROOF-15` | **W1** | 3 | FIXTURE-03 | **PASS — FULL SPEC** |
| `PRD04-PROOF-16` | **W1** | 3 | FIXTURE-03 | **PASS — FULL SPEC** |
| `PRD04-PROOF-17` | **W1** | 9 | FIXTURE-02, FIXTURE-03 | **PASS — FULL SPEC** |
| `PRD04-PROOF-18` | **W1** | 20 | FIXTURE-03, FIXTURE-09, FIXTURE-10 | **PASS — FULL SPEC** |
| `PRD04-PROOF-19` | **W1** | 5 | FIXTURE-03, FIXTURE-09 | **PASS — FULL SPEC** |
| `PRD04-PROOF-20` | **W2** | 5 | FIXTURE-04, FIXTURE-09 | **PASS — FULL SPEC** |
| `PRD04-PROOF-21` | **W1** | 7 | FIXTURE-03 | **PASS — FULL SPEC** |
| `PRD04-PROOF-22` | **W0** | 3 | FIXTURE-01, FIXTURE-03 | **PASS — FULL SPEC** |
| `PRD04-PROOF-23` | **W1** | 9 | FIXTURE-02 | **PASS — FULL SPEC** |
| `PRD04-PROOF-24` | **W1** | 7 | FIXTURE-02, FIXTURE-03 | **PASS — FULL SPEC** |
| `PRD04-PROOF-25` | **W1** | 6 | FIXTURE-02 | **PASS — FULL SPEC** |
| `PRD04-PROOF-26` | **W1** | 12 | FIXTURE-02 | **PASS — FULL SPEC** |
| `PRD04-PROOF-27` | **W3** | 7 | FIXTURE-02, FIXTURE-06 | **PASS — FULL SPEC** |
| `PRD04-PROOF-28` | **W3** | 8 | FIXTURE-02, FIXTURE-06 | **PASS — FULL SPEC** |
| `PRD04-PROOF-29` | **W3** | 12 | FIXTURE-06 | **PASS — FULL SPEC** |
| `PRD04-PROOF-30` | **W3** | 7 | FIXTURE-05, FIXTURE-06 | **PASS — FULL SPEC** |
| `PRD04-PROOF-31` | **W3** | 9 | FIXTURE-06, FIXTURE-09 | **PASS — FULL SPEC** |
| `PRD04-PROOF-32` | **W3** | 14 | FIXTURE-06, FIXTURE-07, FIXTURE-08 | **PASS — FULL SPEC** |
| `PRD04-PROOF-33` | **W1** | 6 | FIXTURE-02, FIXTURE-03, FIXTURE-10 | **PASS — FULL SPEC** |
| `PRD04-PROOF-34` | **W1** | 10 | FIXTURE-02, FIXTURE-10 | **PASS — FULL SPEC** |
| `PRD04-PROOF-35` | **W2** | 9 | FIXTURE-05 | **PASS — FULL SPEC** |
| `PRD04-PROOF-36` | **W2** | 8 | FIXTURE-05, FIXTURE-07 | **PASS — FULL SPEC** |
| `PRD04-PROOF-37` | **W2** | 7 | FIXTURE-05 | **PASS — FULL SPEC** |
| `PRD04-PROOF-38` | **W2** | 2 | FIXTURE-05 | **PASS — FULL SPEC** |
| `PRD04-PROOF-39` | **W2** | 11 | FIXTURE-04 | **PASS — FULL SPEC** |
| `PRD04-PROOF-40` | **W2** | 3 | FIXTURE-04 | **PASS — FULL SPEC** |
| `PRD04-PROOF-41` | **W2** | 7 | FIXTURE-04, FIXTURE-10 | **PASS — FULL SPEC** |
| `PRD04-PROOF-42` | **W2** | 6 | FIXTURE-01, FIXTURE-05 | **PASS — FULL SPEC** |
| `PRD04-PROOF-43` | **W2** | 7 | FIXTURE-04, FIXTURE-05 | **PASS — FULL SPEC** |
| `PRD04-PROOF-44` | **W2** | 3 | FIXTURE-05 | **PASS — FULL SPEC** |
| `PRD04-PROOF-45` | **W2** | 12 | FIXTURE-04, FIXTURE-05 | **PASS — FULL SPEC** |
| `PRD04-PROOF-46` | **W2** | 8 | FIXTURE-05, FIXTURE-10 | **PASS — FULL SPEC** |
| `PRD04-PROOF-47` | **W2** | 9 | FIXTURE-04, FIXTURE-10 | **PASS — FULL SPEC** |
| `PRD04-PROOF-48` | **W2** | 5 | FIXTURE-04 | **PASS — FULL SPEC** |
| `PRD04-PROOF-49` | **W4** | 10 | FIXTURE-07, FIXTURE-09 | **PASS — FULL SPEC** |
| `PRD04-PROOF-50` | **W4** | 8 | FIXTURE-07, FIXTURE-08 | **PASS — FULL SPEC** |
| `PRD04-PROOF-51` | **W4** | 3 | FIXTURE-07 | **PASS — FULL SPEC** |
| `PRD04-PROOF-52` | **W4** | 9 | FIXTURE-07, FIXTURE-09 | **PASS — FULL SPEC** |
| `PRD04-PROOF-53` | **W4** | 12 | FIXTURE-08, FIXTURE-09 | **PASS — FULL SPEC** |
| `PRD04-PROOF-54` | **W4** | 12 | FIXTURE-05, FIXTURE-07, FIXTURE-09 | **PASS — FULL SPEC** |
| `PRD04-PROOF-55` | **W4** | 5 | FIXTURE-07 | **PASS — FULL SPEC** |
| `PRD04-PROOF-56` | **W4** | 6 | FIXTURE-07, FIXTURE-09 | **PASS — FULL SPEC** |
| `PRD04-PROOF-57` | **W2** | 18 | FIXTURE-04, FIXTURE-07 | **PASS — FULL SPEC** |
| `PRD04-PROOF-58` | **W2** | 29 | FIXTURE-04, FIXTURE-07 | **PASS — FULL SPEC** |
| `PRD04-PROOF-59` | **W4** | 7 | FIXTURE-08 | **PASS — FULL SPEC** |
| `PRD04-PROOF-60` | **W4** | 3 | FIXTURE-08, FIXTURE-09 | **PASS — FULL SPEC** |
| `PRD04-PROOF-61` | **W4** | 10 | FIXTURE-08 | **PASS — FULL SPEC** |
| `PRD04-PROOF-62` | **W4** | 27 | FIXTURE-07, FIXTURE-09 | **PASS — FULL SPEC** |
| `PRD04-PROOF-63` | **W1** | 26 | FIXTURE-03, FIXTURE-09, FIXTURE-10 | **PASS — FULL SPEC** |
| `PRD04-PROOF-64` | **W5** | 5 | FIXTURE-03, FIXTURE-09 | **PASS — FULL SPEC** |
| `PRD04-PROOF-65` | **W5** | 4 | FIXTURE-09 | **PASS — FULL SPEC** |
| `PRD04-PROOF-66` | **W5** | 3 | FIXTURE-09 | **PASS — FULL SPEC** |
| `PRD04-PROOF-67` | **W0** | 18 | FIXTURE-01, FIXTURE-02, FIXTURE-09 | **PASS — FULL SPEC** |
| `PRD04-PROOF-68` | **W1** | 13 | FIXTURE-02, FIXTURE-03, FIXTURE-09, FIXTURE-10 | **PASS — FULL SPEC** |
| `PRD04-PROOF-69` | **W2** | 23 | FIXTURE-04, FIXTURE-05, FIXTURE-06, FIXTURE-09 | **PASS — FULL SPEC** |
| `PRD04-PROOF-70` | **W0** | 30 | FIXTURE-09 | **PASS — FULL SPEC** |
| `PRD04-PROOF-71` | **W4** | 19 | FIXTURE-07, FIXTURE-08, FIXTURE-09 | **PASS — FULL SPEC** |
| `PRD04-PROOF-72` | **W5** | 17 | FIXTURE-09 | **PASS — FULL SPEC** |
| `PRD04-PROOF-73` | **W0** | 10 | FIXTURE-09 | **PASS — FULL SPEC** |
| `PRD04-PROOF-74` | **W0** | 22 | FIXTURE-01, FIXTURE-07, FIXTURE-09 | **PASS — FULL SPEC** |
| `PRD04-PROOF-75` | **W5** | 12 | FIXTURE-01, FIXTURE-07, FIXTURE-08, FIXTURE-09, FIXTURE-10 | **PASS — FULL SPEC** |
| `PRD04-PROOF-76` | **FINAL** | 27 | FIXTURE-10 | **PASS — FULL SPEC** |

Important:

- `PROOF-57/58` have both W2 mechanism specifications and W4 full-content/historical revalidation specifications.
- `PROOF-70/71/73/74` have explicit later qualification/revalidation expansions in addition to their primary specifications.
- `PROOF-76` has a final integrated specification with prerequisites that prohibit using it as a substitute for missing lower-level evidence.

# 148. Consumer-List Parity Audit

Every detailed proof specification embeds the PRD-06 child risks that consume that proof.

Round 9 compares those embedded lists to the PRD-06 source register.

Result:

```text
Proof consumer lists checked:               76
Exact matches:                              76
Lists missing a PRD-06 consumer:             0
Lists containing invented consumers:         0
Declared consumer-count mismatches:          0
```

This is stronger than merely proving that every proof ID appears somewhere.

It proves the **risk↔proof graph is identical in both directions**.

# 149. Single-Proof-Route Concentration Audit

The following 22 risks depend on exactly one proof ID.

They were checked to ensure the proof question/success criterion directly targets the failure rather than merely touching the same subsystem.

| Risk | Failure class | Sole proof | Audit | Why the concentration is acceptable |
|---|---|---|---|---|
| `PRD06-RISK-A01` | Insufficient standard-precision active-frame envelope | `PROOF-05` | **PASS — DIRECT** | Proof directly exercises extreme canonical↔active coordinate range/overflow. |
| `PRD06-RISK-A04` | Canonical-to-engine projection overflow / normalization error | `PROOF-05` | **PASS — DIRECT** | Proof directly exercises extreme canonical↔active coordinate range/overflow. |
| `PRD06-RISK-A05` | Cross-provider origin-rebase incoherence | `PROOF-06` | **PASS — DIRECT** | Proof directly tortures repeated origin/frame rebasing and stale-frame work. |
| `PRD06-RISK-F03` | Ownership-transfer race permits old and new owners to commit | `PROOF-14` | **PASS — DIRECT** | Proof directly asserts one-owner transfer and old-owner invalidation. |
| `PRD06-RISK-Q19` | Whole-stack hostile interaction reveals common-cause transaction failure | `PROOF-76` | **PASS — DIRECT** | Final proof exists specifically for common-cause integrated failure. |
| `PRD06-RISK-J03` | Dynamic concave collider misuse on moving hull | `PROOF-31` | **PASS — DIRECT** | Collision candidate matrix directly attacks moving editable hull correctness/scaling. |
| `PRD06-RISK-J05` | Flooding and buoyancy are decoupled | `PROOF-32` | **PASS — DIRECT** | Flooding/buoyancy proof directly couples current hull/fluid/mass state. |
| `PRD06-RISK-K06` | Interest collapses into view distance | `PROOF-38` | **PASS — DIRECT** | Interest proof explicitly separates gameplay relevance from view distance. |
| `PRD06-RISK-K13` | Client cache repair deletes or overwrites canonical server truth | `PROOF-44` | **PASS — DIRECT** | Cache-poison proof directly asserts client cache cannot mutate server truth. |
| `PRD06-RISK-D16` | Real crash behavior differs from graceful-stop fixtures | `PROOF-69` | **PASS — DIRECT** | External real-kill proof directly distinguishes crash from graceful shutdown. |
| `PRD06-RISK-M01` | Safe data pack smuggles executable/native/editor content | `PROOF-55` | **PASS — DIRECT** | Hostile safe-mod corpus directly tests executable/capability smuggling and escalation. |
| `PRD06-RISK-M02` | Declarative data mod becomes a resource-exhaustion bomb | `PROOF-56` | **PASS — DIRECT** | Resource-bomb proof directly tests declarative resource exhaustion. |
| `PRD06-RISK-M12` | Trust tier escalation bypasses user/server policy | `PROOF-55` | **PASS — DIRECT** | Hostile safe-mod corpus directly tests executable/capability smuggling and escalation. |
| `PRD06-RISK-O01` | Graphics preset changes canonical simulation/world truth | `PROOF-59` | **PASS — DIRECT** | Settings-isolation proof directly asserts presentation settings cannot mutate canonical simulation. |
| `PRD06-RISK-O04` | Critical state depends on audio only | `PROOF-61` | **PASS — DIRECT** | Accessibility semantic tasks directly test non-audio alternatives for critical meaning. |
| `PRD06-RISK-O07` | Invalid graphics configuration strands application before recovery UI | `PROOF-60` | **PASS — DIRECT** | Real startup recovery proof directly attacks stranded invalid graphics configuration. |
| `PRD06-RISK-P08` | Local Godot/Zylann patch becomes orphaned or unreproducible | `PROOF-73` | **PASS — DIRECT** | Clean upstream patch/fork reconstruction directly tests orphaning/reproducibility. |
| `PRD06-RISK-P11` | Exact crash symbols are missing or mismatched | `PROOF-66` | **PASS — DIRECT** | Exact artifact→symbol resolution directly tests missing/mismatched symbols. |
| `PRD06-RISK-P13` | Support bundle leaks secrets or unrelated private player data | `PROOF-65` | **PASS — DIRECT** | Seeded-secret support bundle directly tests privacy leakage while retaining usefulness. |
| `PRD06-RISK-P18` | Observability becomes its own performance failure | `PROOF-75` | **PASS — DIRECT** | Observability overhead/cardinality stress directly tests instrumentation self-failure. |
| `PRD06-RISK-P19` | High-cardinality labels or trace fan-out cause unbounded telemetry state | `PROOF-75` | **PASS — DIRECT** | Observability overhead/cardinality stress directly tests instrumentation self-failure. |
| `PRD06-RISK-P22` | Exported artifact matrix omits a materially supported role/profile combination | `PROOF-70` | **PASS — DIRECT** | W5 expansion requires every materially claimed artifact/profile lane; W0 bootstrap result alone is not treated as final qualification. |

**Result: 22 / 22 PASS.**

No additional backup proof is required merely to increase route count.

If future execution shows the sole proof is too broad or insensitive, that becomes a controlled proof-spec amendment/new-risk finding rather than a speculative duplicate today.

# 150. Continuing-Gate Reverse Audit

| Proof | Revalidation role | Audit |
|---|---|---|
| `PROOF-57` | W2 mechanism → W4 full content/FCC-13E revalidation | **PASS — revalidation semantics retained** |
| `PROOF-58` | W2 mechanism → W4 full 312-row migration revalidation | **PASS — revalidation semantics retained** |
| `PROOF-67` | W0 baseline → rerun for material provider changes | **PASS — revalidation semantics retained** |
| `PROOF-70` | W0 bootstrap artifacts → W5 full claimed artifact matrix | **PASS — revalidation semantics retained** |
| `PROOF-71` | W4 semantic renderer lanes → W5 hardware/support qualification | **PASS — revalidation semantics retained** |
| `PROOF-72` | W5 baseline → future material dependency changes | **PASS — revalidation semantics retained** |
| `PROOF-73` | W0 baseline → W5/upgrade patch reproducibility | **PASS — revalidation semantics retained** |
| `PROOF-74` | W0 bootstrap → continuous through final graph | **PASS — revalidation semantics retained** |
| `PROOF-75` | W5 baseline → rerun after material observability changes | **PASS — revalidation semantics retained** |

This closes the main subtle gap that could otherwise occur in PRD-07:

> **an early successful proof run does not remain valid after a material change to the thing it actually tested.**

# 151. Evidence-Exit Compatibility Audit

PRD-06 owns each risk's **success / exit evidence**.

PRD-07 owns the **execution measurement and evidence package**.

Round 9 verifies that every risk's proof route lands on specifications containing:

- explicit measurement;
- success criterion;
- failure criterion;
- inconclusive conditions;
- repetition requirement;
- raw evidence requirements;
- PRD-08 decision relevance.

Result:

```text
Risks with measurable/evaluable proof route: 263 / 263
Risks lacking a PRD-08 handoff route:           0
Risks whose only route lacks failure criteria:  0
Risks whose only route lacks raw evidence:      0
```

This does **not** assert that the future observed evidence will satisfy the PRD-06 exit condition.

It asserts that PRD-07 is capable of collecting the evidence needed to find out.

# 152. Proof-76 Concentration Check

`PROOF-76 — Whole-Stack Hostile Transaction Soak` has **27** detailed PRD-06 child-risk consumers.

Only one child risk—`PRD06-RISK-Q19`—uses `PROOF-76` as its **sole** proof route.

That is correct because Q19 is itself the explicit common-cause whole-stack risk.

All other PROOF-76 consumers also possess lower-level proof routes.

Therefore:

> **PROOF-76 supplements lower-level evidence; it does not become a universal garbage-bin proof.**

# 153. No-Execution / No-Inflation Audit

Round 9 still preserves the pre-execution state:

```text
Actual PRD07-RUN IDs allocated:              0
Actual PRD07-EVID IDs allocated:             0
PASS-OBSERVED results:                       0
FAIL-OBSERVED results:                       0
INCONCLUSIVE results:                        0
PRD-08 evaluated proof results:              0
Implementation ADRs accepted:                0
Architecture reopen candidates created:      0
```

The entire document remains an **executable plan**, not fictional evidence.

# 154. Round-9 Full 263-Risk Traceability Ledger

Legend:

- **Proofs** are stable `PRD04-PROOF-XX` IDs.
- **Fixtures** are the PRD-06 fixture routes.
- **Spec** means all referenced proof IDs have detailed PRD-07 specifications.
- **Fixture compatible** means at least one routed proof specification consumes a fixture from the risk's declared fixture route.

| Risk | Family | Severity / Priority | Proofs | Fixtures | Proof-route count | Spec | Fixture compatible |
|---|---|---|---|---|---:|---|---|
| `PRD06-RISK-A01` | `A` | CRITICAL / P0 | 05 | 01, 09 | 1 | **PASS** | **PASS** |
| `PRD06-RISK-A02` | `A` | HIGH / P0 | 05, 11, 70, 71 | 01, 09 | 4 | **PASS** | **PASS** |
| `PRD06-RISK-A03` | `A` | CRITICAL / P0 | 10, 11, 70, 72 | 05, 09 | 4 | **PASS** | **PASS** |
| `PRD06-RISK-A04` | `A` | CRITICAL / P0 | 05 | 01 | 1 | **PASS** | **PASS** |
| `PRD06-RISK-A05` | `A` | CRITICAL / P0 | 06 | 01, 02, 05, 06 | 1 | **PASS** | **PASS** |
| `PRD06-RISK-A06` | `A` | CRITICAL / P0 | 06, 13, 68 | 01, 03 | 3 | **PASS** | **PASS** |
| `PRD06-RISK-A07` | `A` | CRITICAL / P0 | 05, 06, 08, 30 | 01, 06 | 4 | **PASS** | **PASS** |
| `PRD06-RISK-A08` | `A` | HIGH / P0 | 05, 06, 10, 18, 37, 71 | 01, 05, 09 | 6 | **PASS** | **PASS** |
| `PRD06-RISK-A09` | `A` | HIGH / P0 | 11, 70, 72, 73 | 09 | 4 | **PASS** | **PASS** |
| `PRD06-RISK-B01` | `B` | HIGH / P0 | 03, 67 | 01, 02 | 2 | **PASS** | **PASS** |
| `PRD06-RISK-B02` | `B` | HIGH / P0 | 03, 67, 72 | 02, 09 | 3 | **PASS** | **PASS** |
| `PRD06-RISK-B03` | `B` | HIGH / P0 | 03, 67 | 01, 02 | 2 | **PASS** | **PASS** |
| `PRD06-RISK-B04` | `B` | HIGH / P0 | 70, 72, 73 | 09 | 3 | **PASS** | **PASS** |
| `PRD06-RISK-B05` | `B` | HIGH / P0 | 70, 72, 73 | 09 | 3 | **PASS** | **PASS** |
| `PRD06-RISK-B06` | `B` | HIGH / P0 | 03, 11, 70 | 01, 09 | 3 | **PASS** | **PASS** |
| `PRD06-RISK-B07` | `B` | HIGH / P0 | 03, 18, 71, 75 | 02, 09 | 4 | **PASS** | **PASS** |
| `PRD06-RISK-B08` | `B` | HIGH / P0 | 05, 11, 70, 72 | 09 | 4 | **PASS** | **PASS** |
| `PRD06-RISK-B09` | `B` | HIGH / P0 | 03, 74 | 01 | 2 | **PASS** | **PASS** |
| `PRD06-RISK-C01` | `C` | CRITICAL / P0 | 02, 57, 58 | 01, 04 | 3 | **PASS** | **PASS** |
| `PRD06-RISK-C02` | `C` | CRITICAL / P0 | 01, 02, 12, 74 | 01 | 4 | **PASS** | **PASS** |
| `PRD06-RISK-C03` | `C` | CRITICAL / P0 | 02, 49, 58, 74 | 01, 07 | 4 | **PASS** | **PASS** |
| `PRD06-RISK-C04` | `C` | CRITICAL / P0 | 01, 12 | 01 | 2 | **PASS** | **PASS** |
| `PRD06-RISK-C05` | `C` | HIGH / P0 | 22, 74 | 01 | 2 | **PASS** | **PASS** |
| `PRD06-RISK-C06` | `C` | CRITICAL / P0 | 03, 67, 74 | 01, 02 | 3 | **PASS** | **PASS** |
| `PRD06-RISK-C07` | `C` | CRITICAL / P0 | 02, 36, 54, 57, 58 | 01, 05, 07 | 5 | **PASS** | **PASS** |
| `PRD06-RISK-C08` | `C` | HIGH / P1 | 49, 52 | 07 | 2 | **PASS** | **PASS** |
| `PRD06-RISK-C09` | `C` | CRITICAL / P0 | 02, 57, 58 | 04, 07 | 3 | **PASS** | **PASS** |
| `PRD06-RISK-C10` | `C` | CRITICAL / P0 | 58, 74 | 07 | 2 | **PASS** | **PASS** |
| `PRD06-RISK-C11` | `C` | HIGH / P1 | 57, 58 | 04, 07 | 2 | **PASS** | **PASS** |
| `PRD06-RISK-C12` | `C` | CRITICAL / P0 | 02, 35, 36, 44, 45, 58 | 01, 05 | 6 | **PASS** | **PASS** |
| `PRD06-RISK-L01` | `L` | CRITICAL / P0 | 11, 15, 19 | 01, 09 | 3 | **PASS** | **PASS** |
| `PRD06-RISK-L02` | `L` | HIGH / P0 | 11, 54, 70 | 07, 09 | 3 | **PASS** | **PASS** |
| `PRD06-RISK-L03` | `L` | HIGH / P0 | 03, 11, 67, 70 | 01, 09 | 4 | **PASS** | **PASS** |
| `PRD06-RISK-L04` | `L` | CRITICAL / P0 | 10, 11 | 01, 05 | 2 | **PASS** | **PASS** |
| `PRD06-RISK-L05` | `L` | CRITICAL / P0 | 07, 11, 20, 45 | 01, 04, 09 | 4 | **PASS** | **PASS** |
| `PRD06-RISK-L06` | `L` | CRITICAL / P0 | 36, 54, 57 | 05, 07, 09 | 3 | **PASS** | **PASS** |
| `PRD06-RISK-L07` | `L` | HIGH / P0 | 11, 70 | 09 | 2 | **PASS** | **PASS** |
| `PRD06-RISK-L08` | `L` | HIGH / P0 | 11, 70, 72, 73 | 09 | 4 | **PASS** | **PASS** |
| `PRD06-RISK-F01` | `F` | CRITICAL / P0 | 13, 14, 68 | 03, 10 | 3 | **PASS** | **PASS** |
| `PRD06-RISK-F02` | `F` | CRITICAL / P0 | 13, 68 | 02, 03 | 2 | **PASS** | **PASS** |
| `PRD06-RISK-F03` | `F` | CRITICAL / P0 | 14 | 03, 05, 06 | 1 | **PASS** | **PASS** |
| `PRD06-RISK-F04` | `F` | CRITICAL / P0 | 14, 39, 45, 69 | 03, 04, 05 | 4 | **PASS** | **PASS** |
| `PRD06-RISK-F05` | `F` | CRITICAL / P0 | 15, 19 | 03, 09 | 2 | **PASS** | **PASS** |
| `PRD06-RISK-F06` | `F` | CRITICAL / P0 | 15, 16, 21 | 03, 10 | 3 | **PASS** | **PASS** |
| `PRD06-RISK-F07` | `F` | HIGH / P0 | 19, 21 | 03, 09 | 2 | **PASS** | **PASS** |
| `PRD06-RISK-F08` | `F` | CRITICAL / P0 | 21, 68 | 03, 10 | 2 | **PASS** | **PASS** |
| `PRD06-RISK-F09` | `F` | HIGH / P0 | 21, 68 | 03 | 2 | **PASS** | **PASS** |
| `PRD06-RISK-F10` | `F` | CRITICAL / P0 | 07, 13, 20, 68 | 03, 04, 09 | 4 | **PASS** | **PASS** |
| `PRD06-RISK-F11` | `F` | CRITICAL / P0 | 13, 63, 68, 74 | 02, 03, 09 | 4 | **PASS** | **PASS** |
| `PRD06-RISK-F12` | `F` | CRITICAL / P0 | 14, 35, 42 | 03, 05 | 3 | **PASS** | **PASS** |
| `PRD06-RISK-F13` | `F` | HIGH / P0 | 13, 19, 68 | 03, 05 | 3 | **PASS** | **PASS** |
| `PRD06-RISK-F14` | `F` | HIGH / P0 | 22, 68 | 01, 03 | 2 | **PASS** | **PASS** |
| `PRD06-RISK-G01` | `G` | CRITICAL / P0 | 18, 75, 76 | 03, 09, 10 | 3 | **PASS** | **PASS** |
| `PRD06-RISK-G02` | `G` | CRITICAL / P0 | 18, 37, 46, 47, 76 | 03, 04, 05, 10 | 5 | **PASS** | **PASS** |
| `PRD06-RISK-G03` | `G` | HIGH / P0 | 18, 21, 76 | 03, 10 | 3 | **PASS** | **PASS** |
| `PRD06-RISK-G04` | `G` | HIGH / P0 | 18, 46, 47 | 03, 04, 05 | 3 | **PASS** | **PASS** |
| `PRD06-RISK-G05` | `G` | CRITICAL / P0 | 18, 19, 76 | 03, 09, 10 | 3 | **PASS** | **PASS** |
| `PRD06-RISK-G06` | `G` | HIGH / P0 | 18, 67, 75 | 03, 09 | 3 | **PASS** | **PASS** |
| `PRD06-RISK-G07` | `G` | CRITICAL / P0 | 18, 46, 47, 76 | 04, 05, 10 | 4 | **PASS** | **PASS** |
| `PRD06-RISK-G08` | `G` | CRITICAL / P0 | 18, 63, 76 | 03, 10 | 3 | **PASS** | **PASS** |
| `PRD06-RISK-G09` | `G` | HIGH / P1 | 18, 75 | 09, 10 | 2 | **PASS** | **PASS** |
| `PRD06-RISK-G10` | `G` | HIGH / P1 | 16, 18, 37 | 03, 05 | 3 | **PASS** | **PASS** |
| `PRD06-RISK-G11` | `G` | CRITICAL / P0 | 20, 47, 69 | 03, 04, 09 | 3 | **PASS** | **PASS** |
| `PRD06-RISK-Q01` | `Q` | CRITICAL / P0 | 04, 17, 33, 63, 76 | 03, 10 | 5 | **PASS** | **PASS** |
| `PRD06-RISK-Q02` | `Q` | CRITICAL / P0 | 04, 63, 76 | 03, 04, 05 | 3 | **PASS** | **PASS** |
| `PRD06-RISK-Q03` | `Q` | CRITICAL / P0 | 17, 43, 69, 76 | 03, 04, 05 | 4 | **PASS** | **PASS** |
| `PRD06-RISK-Q04` | `Q` | CRITICAL / P0 | 17, 35, 76 | 03, 05 | 3 | **PASS** | **PASS** |
| `PRD06-RISK-Q05` | `Q` | CRITICAL / P0 | 04, 17, 63, 76 | 03, 10 | 4 | **PASS** | **PASS** |
| `PRD06-RISK-Q06` | `Q` | CRITICAL / P0 | 35, 43, 63, 76 | 03, 05 | 4 | **PASS** | **PASS** |
| `PRD06-RISK-Q07` | `Q` | CRITICAL / P0 | 33, 34, 63, 76 | 02, 03, 10 | 4 | **PASS** | **PASS** |
| `PRD06-RISK-Q08` | `Q` | CRITICAL / P0 | 35, 39, 63, 69, 76 | 04, 05, 10 | 5 | **PASS** | **PASS** |
| `PRD06-RISK-Q09` | `Q` | HIGH / P0 | 63, 64, 65, 75 | 03, 09, 10 | 4 | **PASS** | **PASS** |
| `PRD06-RISK-Q10` | `Q` | CRITICAL / P0 | 17, 18, 76 | 03, 10 | 3 | **PASS** | **PASS** |
| `PRD06-RISK-Q11` | `Q` | CRITICAL / P0 | 17, 18, 76 | 03, 10 | 3 | **PASS** | **PASS** |
| `PRD06-RISK-Q12` | `Q` | CRITICAL / P0 | 35, 45, 48, 63 | 04, 05 | 4 | **PASS** | **PASS** |
| `PRD06-RISK-Q13` | `Q` | CRITICAL / P0 | 39, 43, 63, 69, 76 | 03, 04, 10 | 5 | **PASS** | **PASS** |
| `PRD06-RISK-Q14` | `Q` | CRITICAL / P0 | 04, 33, 63, 76 | 03, 10 | 4 | **PASS** | **PASS** |
| `PRD06-RISK-Q15` | `Q` | HIGH / P0 | 17, 25, 26, 34, 63 | 02, 03 | 5 | **PASS** | **PASS** |
| `PRD06-RISK-Q16` | `Q` | CRITICAL / P0 | 17, 63, 76 | 02, 03, 10 | 3 | **PASS** | **PASS** |
| `PRD06-RISK-Q17` | `Q` | CRITICAL / P0 | 33, 63, 76 | 02, 03, 10 | 3 | **PASS** | **PASS** |
| `PRD06-RISK-Q18` | `Q` | CRITICAL / P0 | 09, 42, 63, 69, 76 | 01, 04, 05, 10 | 5 | **PASS** | **PASS** |
| `PRD06-RISK-Q19` | `Q` | CRITICAL / P0 | 76 | 10 | 1 | **PASS** | **PASS** |
| `PRD06-RISK-E01` | `E` | CRITICAL / P0 | 23, 24, 67 | 02, 10 | 3 | **PASS** | **PASS** |
| `PRD06-RISK-E02` | `E` | CRITICAL / P0 | 24, 68 | 02, 03 | 2 | **PASS** | **PASS** |
| `PRD06-RISK-E03` | `E` | CRITICAL / P0 | 21, 68 | 03, 10 | 2 | **PASS** | **PASS** |
| `PRD06-RISK-E04` | `E` | HIGH / P0 | 23, 34, 67 | 02, 03 | 3 | **PASS** | **PASS** |
| `PRD06-RISK-E05` | `E` | HIGH / P0 | 03, 23, 67 | 01, 02 | 3 | **PASS** | **PASS** |
| `PRD06-RISK-E06` | `E` | CRITICAL / P0 | 17, 24 | 02, 03 | 2 | **PASS** | **PASS** |
| `PRD06-RISK-E07` | `E` | CRITICAL / P0 | 24, 48, 58, 69 | 02, 04 | 4 | **PASS** | **PASS** |
| `PRD06-RISK-E08` | `E` | HIGH / P0 | 21, 24 | 03 | 2 | **PASS** | **PASS** |
| `PRD06-RISK-E09` | `E` | CRITICAL / P0 | 23, 24, 34 | 02, 10 | 3 | **PASS** | **PASS** |
| `PRD06-RISK-E10` | `E` | HIGH / P0 | 18, 23, 76 | 02, 10 | 3 | **PASS** | **PASS** |
| `PRD06-RISK-E11` | `E` | CRITICAL / P0 | 24, 39, 69 | 02, 04 | 3 | **PASS** | **PASS** |
| `PRD06-RISK-H01` | `H` | CRITICAL / P0 | 25, 26, 34 | 02 | 3 | **PASS** | **PASS** |
| `PRD06-RISK-H02` | `H` | CRITICAL / P0 | 18, 23, 26 | 02, 10 | 3 | **PASS** | **PASS** |
| `PRD06-RISK-H03` | `H` | CRITICAL / P0 | 25, 34 | 02 | 2 | **PASS** | **PASS** |
| `PRD06-RISK-H04` | `H` | CRITICAL / P0 | 25, 26 | 02 | 2 | **PASS** | **PASS** |
| `PRD06-RISK-H05` | `H` | HIGH / P0 | 18, 26 | 02, 09 | 2 | **PASS** | **PASS** |
| `PRD06-RISK-H06` | `H` | HIGH / P0 | 26, 67 | 02, 06 | 2 | **PASS** | **PASS** |
| `PRD06-RISK-H07` | `H` | CRITICAL / P0 | 34, 63 | 02, 10 | 2 | **PASS** | **PASS** |
| `PRD06-RISK-H08` | `H` | HIGH / P0 | 25, 26, 67 | 02 | 3 | **PASS** | **PASS** |
| `PRD06-RISK-H09` | `H` | HIGH / P1 | 18, 26 | 02, 10 | 2 | **PASS** | **PASS** |
| `PRD06-RISK-H10` | `H` | CRITICAL / P0 | 26, 68 | 02, 03 | 2 | **PASS** | **PASS** |
| `PRD06-RISK-H11` | `H` | CRITICAL / P0 | 23, 67 | 02, 07 | 2 | **PASS** | **PASS** |
| `PRD06-RISK-H12` | `H` | CRITICAL / P0 | 23, 34, 63 | 02, 10 | 3 | **PASS** | **PASS** |
| `PRD06-RISK-H13` | `H` | CRITICAL / P0 | 25, 34, 37 | 02, 05 | 3 | **PASS** | **PASS** |
| `PRD06-RISK-H14` | `H` | HIGH / P1 | 22, 26, 67 | 01, 02 | 3 | **PASS** | **PASS** |
| `PRD06-RISK-I01` | `I` | CRITICAL / P0 | 27, 28, 32 | 02, 06 | 3 | **PASS** | **PASS** |
| `PRD06-RISK-I02` | `I` | CRITICAL / P0 | 18, 28 | 02, 10 | 2 | **PASS** | **PASS** |
| `PRD06-RISK-I03` | `I` | CRITICAL / P0 | 23, 27, 28, 68 | 02, 03 | 4 | **PASS** | **PASS** |
| `PRD06-RISK-I04` | `I` | CRITICAL / P0 | 16, 28, 32 | 02, 06 | 3 | **PASS** | **PASS** |
| `PRD06-RISK-I05` | `I` | CRITICAL / P0 | 28, 32, 59 | 06, 08 | 3 | **PASS** | **PASS** |
| `PRD06-RISK-I06` | `I` | CRITICAL / P0 | 27, 39, 41, 69 | 02, 04 | 4 | **PASS** | **PASS** |
| `PRD06-RISK-I07` | `I` | CRITICAL / P0 | 27, 63, 76 | 02, 10 | 3 | **PASS** | **PASS** |
| `PRD06-RISK-I08` | `I` | CRITICAL / P0 | 14, 27, 28, 63 | 02, 03 | 4 | **PASS** | **PASS** |
| `PRD06-RISK-I09` | `I` | HIGH / P1 | 27, 28, 32 | 02, 06 | 3 | **PASS** | **PASS** |
| `PRD06-RISK-I10` | `I` | HIGH / P1 | 28, 32 | 06, 10 | 2 | **PASS** | **PASS** |
| `PRD06-RISK-I11` | `I` | HIGH / P0 | 26, 27, 34 | 02, 06 | 3 | **PASS** | **PASS** |
| `PRD06-RISK-I12` | `I` | CRITICAL / P0 | 29, 30, 32 | 06 | 3 | **PASS** | **PASS** |
| `PRD06-RISK-J01` | `J` | CRITICAL / P0 | 08, 29, 31 | 06 | 3 | **PASS** | **PASS** |
| `PRD06-RISK-J02` | `J` | CRITICAL / P0 | 18, 29, 31 | 06, 10 | 3 | **PASS** | **PASS** |
| `PRD06-RISK-J03` | `J` | CRITICAL / P0 | 31 | 06 | 1 | **PASS** | **PASS** |
| `PRD06-RISK-J04` | `J` | CRITICAL / P0 | 29, 32 | 06 | 2 | **PASS** | **PASS** |
| `PRD06-RISK-J05` | `J` | CRITICAL / P0 | 32 | 06 | 1 | **PASS** | **PASS** |
| `PRD06-RISK-J06` | `J` | CRITICAL / P0 | 08, 30 | 05, 06 | 2 | **PASS** | **PASS** |
| `PRD06-RISK-J07` | `J` | CRITICAL / P0 | 05, 06, 08 | 01, 06 | 3 | **PASS** | **PASS** |
| `PRD06-RISK-J08` | `J` | HIGH / P0 | 08, 26, 30 | 02, 06 | 3 | **PASS** | **PASS** |
| `PRD06-RISK-J09` | `J` | HIGH / P1 | 29, 31, 67 | 06 | 3 | **PASS** | **PASS** |
| `PRD06-RISK-J10` | `J` | CRITICAL / P0 | 29, 32, 33 | 02, 06 | 3 | **PASS** | **PASS** |
| `PRD06-RISK-J11` | `J` | CRITICAL / P0 | 29, 31, 32, 63 | 06, 10 | 4 | **PASS** | **PASS** |
| `PRD06-RISK-J12` | `J` | CRITICAL / P0 | 05, 31 | 06 | 2 | **PASS** | **PASS** |
| `PRD06-RISK-J13` | `J` | HIGH / P0 | 29, 32, 63 | 03, 06 | 3 | **PASS** | **PASS** |
| `PRD06-RISK-J14` | `J` | CRITICAL / P1 | 08, 30, 31 | 06 | 3 | **PASS** | **PASS** |
| `PRD06-RISK-J15` | `J` | CRITICAL / P0 | 29, 31, 63, 76 | 06, 10 | 4 | **PASS** | **PASS** |
| `PRD06-RISK-J16` | `J` | CRITICAL / P0 | 29, 30, 32, 41, 42, 69 | 04, 05, 06 | 6 | **PASS** | **PASS** |
| `PRD06-RISK-J17` | `J` | CRITICAL / P0 | 29, 32, 33, 63 | 03, 06 | 4 | **PASS** | **PASS** |
| `PRD06-RISK-J18` | `J` | CRITICAL / P0 | 29, 30, 31, 32, 76 | 06, 10 | 5 | **PASS** | **PASS** |
| `PRD06-RISK-K01` | `K` | CRITICAL / P0 | 36, 45 | 05, 09 | 2 | **PASS** | **PASS** |
| `PRD06-RISK-K02` | `K` | CRITICAL / P0 | 42, 45 | 01, 05 | 2 | **PASS** | **PASS** |
| `PRD06-RISK-K03` | `K` | CRITICAL / P0 | 35, 43 | 03, 05 | 2 | **PASS** | **PASS** |
| `PRD06-RISK-K04` | `K` | CRITICAL / P0 | 36, 44 | 05 | 2 | **PASS** | **PASS** |
| `PRD06-RISK-K05` | `K` | CRITICAL / P0 | 37, 46 | 05, 10 | 2 | **PASS** | **PASS** |
| `PRD06-RISK-K06` | `K` | CRITICAL / P0 | 38 | 05 | 1 | **PASS** | **PASS** |
| `PRD06-RISK-K07` | `K` | CRITICAL / P0 | 37, 38 | 05, 10 | 2 | **PASS** | **PASS** |
| `PRD06-RISK-K08` | `K` | CRITICAL / P0 | 42, 43, 45 | 04, 05 | 3 | **PASS** | **PASS** |
| `PRD06-RISK-K09` | `K` | CRITICAL / P0 | 43, 45 | 04, 05 | 2 | **PASS** | **PASS** |
| `PRD06-RISK-K10` | `K` | CRITICAL / P0 | 35, 39, 43, 69 | 04, 05 | 4 | **PASS** | **PASS** |
| `PRD06-RISK-K11` | `K` | CRITICAL / P0 | 46, 55, 56 | 05, 07 | 3 | **PASS** | **PASS** |
| `PRD06-RISK-K12` | `K` | HIGH / P0 | 36, 54 | 05, 07 | 2 | **PASS** | **PASS** |
| `PRD06-RISK-K13` | `K` | CRITICAL / P0 | 44 | 05 | 1 | **PASS** | **PASS** |
| `PRD06-RISK-K14` | `K` | HIGH / P1 | 42, 45, 46 | 05 | 3 | **PASS** | **PASS** |
| `PRD06-RISK-K15` | `K` | HIGH / P1 | 35, 36, 46 | 05 | 3 | **PASS** | **PASS** |
| `PRD06-RISK-K16` | `K` | HIGH / P1 | 46, 70, 71, 76 | 05, 09, 10 | 4 | **PASS** | **PASS** |
| `PRD06-RISK-D01` | `D` | CRITICAL / P0 | 39, 41, 47 | 04 | 3 | **PASS** | **PASS** |
| `PRD06-RISK-D02` | `D` | CRITICAL / P0 | 39, 40, 69 | 04 | 3 | **PASS** | **PASS** |
| `PRD06-RISK-D03` | `D` | CRITICAL / P0 | 07, 20, 69 | 01, 04 | 3 | **PASS** | **PASS** |
| `PRD06-RISK-D04` | `D` | CRITICAL / P0 | 39, 63, 69 | 03, 04 | 3 | **PASS** | **PASS** |
| `PRD06-RISK-D05` | `D` | CRITICAL / P0 | 41, 47 | 04, 10 | 2 | **PASS** | **PASS** |
| `PRD06-RISK-D06` | `D` | CRITICAL / P0 | 40, 57, 58 | 04, 07 | 3 | **PASS** | **PASS** |
| `PRD06-RISK-D07` | `D` | CRITICAL / P0 | 57, 58, 74 | 01, 04, 07 | 3 | **PASS** | **PASS** |
| `PRD06-RISK-D08` | `D` | CRITICAL / P0 | 58, 69, 72 | 04, 09 | 3 | **PASS** | **PASS** |
| `PRD06-RISK-D09` | `D` | CRITICAL / P0 | 48, 69 | 04 | 2 | **PASS** | **PASS** |
| `PRD06-RISK-D10` | `D` | CRITICAL / P0 | 39, 58, 67 | 01, 04 | 3 | **PASS** | **PASS** |
| `PRD06-RISK-D11` | `D` | CRITICAL / P0 | 20, 69 | 04, 09 | 2 | **PASS** | **PASS** |
| `PRD06-RISK-D12` | `D` | CRITICAL / P0 | 40, 69 | 04 | 2 | **PASS** | **PASS** |
| `PRD06-RISK-D13` | `D` | HIGH / P0 | 41, 47 | 04, 10 | 2 | **PASS** | **PASS** |
| `PRD06-RISK-D14` | `D` | HIGH / P1 | 41, 45, 69 | 04, 05 | 3 | **PASS** | **PASS** |
| `PRD06-RISK-D15` | `D` | HIGH / P1 | 45, 47, 69 | 04, 05 | 3 | **PASS** | **PASS** |
| `PRD06-RISK-D16` | `D` | CRITICAL / P0 | 69 | 04, 09 | 1 | **PASS** | **PASS** |
| `PRD06-RISK-D17` | `D` | HIGH / P1 | 45, 48 | 04, 05 | 2 | **PASS** | **PASS** |
| `PRD06-RISK-D18` | `D` | CRITICAL / P0 | 39, 41, 47 | 04 | 3 | **PASS** | **PASS** |
| `PRD06-RISK-M01` | `M` | CRITICAL / P0 | 55 | 07, 09 | 1 | **PASS** | **PASS** |
| `PRD06-RISK-M02` | `M` | CRITICAL / P0 | 56 | 07, 09 | 1 | **PASS** | **PASS** |
| `PRD06-RISK-M03` | `M` | CRITICAL / P0 | 54, 62, 70 | 07, 09 | 3 | **PASS** | **PASS** |
| `PRD06-RISK-M04` | `M` | CRITICAL / P0 | 54, 58, 62 | 04, 07 | 3 | **PASS** | **PASS** |
| `PRD06-RISK-M05` | `M` | CRITICAL / P0 | 55, 62 | 07, 09 | 2 | **PASS** | **PASS** |
| `PRD06-RISK-M06` | `M` | HIGH / P1 | 50, 51, 62 | 07 | 3 | **PASS** | **PASS** |
| `PRD06-RISK-M07` | `M` | CRITICAL / P0 | 54, 58, 62 | 07 | 3 | **PASS** | **PASS** |
| `PRD06-RISK-M08` | `M` | CRITICAL / P0 | 49, 58, 62 | 04, 07 | 3 | **PASS** | **PASS** |
| `PRD06-RISK-M09` | `M` | CRITICAL / P0 | 49, 52, 54 | 01, 07 | 3 | **PASS** | **PASS** |
| `PRD06-RISK-M10` | `M` | CRITICAL / P0 | 54, 55, 56, 62, 70 | 07, 09 | 5 | **PASS** | **PASS** |
| `PRD06-RISK-M11` | `M` | CRITICAL / P0 | 57, 58 | 04, 07 | 2 | **PASS** | **PASS** |
| `PRD06-RISK-M12` | `M` | CRITICAL / P0 | 55 | 07 | 1 | **PASS** | **PASS** |
| `PRD06-RISK-M13` | `M` | HIGH / P1 | 54, 62, 70 | 07, 09 | 3 | **PASS** | **PASS** |
| `PRD06-RISK-M14` | `M` | HIGH / P0 | 52, 53, 56 | 07, 08 | 3 | **PASS** | **PASS** |
| `PRD06-RISK-M15` | `M` | HIGH / P1 | 36, 54, 57 | 05, 07 | 3 | **PASS** | **PASS** |
| `PRD06-RISK-N01` | `N` | CRITICAL / P0 | 49, 62 | 07 | 2 | **PASS** | **PASS** |
| `PRD06-RISK-N02` | `N` | CRITICAL / P0 | 49, 62 | 07, 09 | 2 | **PASS** | **PASS** |
| `PRD06-RISK-N03` | `N` | HIGH / P0 | 51, 62 | 07 | 2 | **PASS** | **PASS** |
| `PRD06-RISK-N04` | `N` | HIGH / P1 | 50, 51, 62 | 07 | 3 | **PASS** | **PASS** |
| `PRD06-RISK-N05` | `N` | CRITICAL / P0 | 52, 56, 62 | 07 | 3 | **PASS** | **PASS** |
| `PRD06-RISK-N06` | `N` | CRITICAL / P0 | 49, 52 | 01, 07 | 2 | **PASS** | **PASS** |
| `PRD06-RISK-N07` | `N` | HIGH / P0 | 50, 62 | 07, 09 | 2 | **PASS** | **PASS** |
| `PRD06-RISK-N08` | `N` | HIGH / P1 | 50, 52, 53 | 07, 08 | 3 | **PASS** | **PASS** |
| `PRD06-RISK-N09` | `N` | CRITICAL / P0 | 49, 50, 52, 62 | 07 | 4 | **PASS** | **PASS** |
| `PRD06-RISK-N10` | `N` | HIGH / P1 | 50, 53, 71 | 07, 08, 09 | 3 | **PASS** | **PASS** |
| `PRD06-RISK-N11` | `N` | CRITICAL / P0 | 50, 53, 59 | 07, 08 | 3 | **PASS** | **PASS** |
| `PRD06-RISK-N12` | `N` | HIGH / P0 | 50, 61 | 07, 08 | 2 | **PASS** | **PASS** |
| `PRD06-RISK-N13` | `N` | HIGH / P1 | 52, 62, 71 | 07, 09 | 3 | **PASS** | **PASS** |
| `PRD06-RISK-N14` | `N` | CRITICAL / P0 | 49, 62, 72 | 07, 09 | 3 | **PASS** | **PASS** |
| `PRD06-RISK-O01` | `O` | CRITICAL / P0 | 59 | 03, 08 | 1 | **PASS** | **PASS** |
| `PRD06-RISK-O02` | `O` | HIGH / P0 | 53, 61 | 08 | 2 | **PASS** | **PASS** |
| `PRD06-RISK-O03` | `O` | HIGH / P0 | 53, 61 | 08 | 2 | **PASS** | **PASS** |
| `PRD06-RISK-O04` | `O` | HIGH / P0 | 61 | 08 | 1 | **PASS** | **PASS** |
| `PRD06-RISK-O05` | `O` | HIGH / P1 | 53, 71 | 08, 09 | 2 | **PASS** | **PASS** |
| `PRD06-RISK-O06` | `O` | HIGH / P0 | 53, 61, 71 | 08 | 3 | **PASS** | **PASS** |
| `PRD06-RISK-O07` | `O` | HIGH / P1 | 60 | 08, 09 | 1 | **PASS** | **PASS** |
| `PRD06-RISK-O08` | `O` | HIGH / P1 | 60, 71 | 08, 09 | 2 | **PASS** | **PASS** |
| `PRD06-RISK-O09` | `O` | HIGH / P1 | 59, 61 | 08 | 2 | **PASS** | **PASS** |
| `PRD06-RISK-O10` | `O` | HIGH / P1 | 61, 71 | 08 | 2 | **PASS** | **PASS** |
| `PRD06-RISK-O11` | `O` | HIGH / P1 | 59, 71 | 05, 08 | 2 | **PASS** | **PASS** |
| `PRD06-RISK-O12` | `O` | HIGH / P1 | 37, 59, 71 | 05, 08, 09 | 3 | **PASS** | **PASS** |
| `PRD06-RISK-O13` | `O` | CRITICAL / P0 | 53, 61, 71 | 01, 08 | 3 | **PASS** | **PASS** |
| `PRD06-RISK-O14` | `O` | HIGH / P0 | 53, 61 | 08 | 2 | **PASS** | **PASS** |
| `PRD06-RISK-O15` | `O` | HIGH / P1 | 53, 71 | 08, 09 | 2 | **PASS** | **PASS** |
| `PRD06-RISK-O16` | `O` | HIGH / P0 | 53, 56, 61 | 07, 08 | 3 | **PASS** | **PASS** |
| `PRD06-RISK-O17` | `O` | CRITICAL / P0 | 59, 60 | 04, 08 | 2 | **PASS** | **PASS** |
| `PRD06-RISK-P01` | `P` | CRITICAL / P0 | 70, 73 | 09 | 2 | **PASS** | **PASS** |
| `PRD06-RISK-P02` | `P` | HIGH / P0 | 70, 71, 75 | 09 | 3 | **PASS** | **PASS** |
| `PRD06-RISK-P03` | `P` | CRITICAL / P0 | 54, 70 | 07, 09 | 2 | **PASS** | **PASS** |
| `PRD06-RISK-P04` | `P` | CRITICAL / P0 | 65, 70 | 09 | 2 | **PASS** | **PASS** |
| `PRD06-RISK-P05` | `P` | CRITICAL / P0 | 70, 72, 73 | 09 | 3 | **PASS** | **PASS** |
| `PRD06-RISK-P06` | `P` | CRITICAL / P0 | 67, 70, 72 | 09 | 3 | **PASS** | **PASS** |
| `PRD06-RISK-P07` | `P` | HIGH / P0 | 70, 72 | 09 | 2 | **PASS** | **PASS** |
| `PRD06-RISK-P08` | `P` | CRITICAL / P0 | 73 | 09 | 1 | **PASS** | **PASS** |
| `PRD06-RISK-P09` | `P` | HIGH / P0 | 73, 74 | 09 | 2 | **PASS** | **PASS** |
| `PRD06-RISK-P10` | `P` | CRITICAL / P0 | 70, 72, 73 | 09 | 3 | **PASS** | **PASS** |
| `PRD06-RISK-P11` | `P` | CRITICAL / P0 | 66 | 09 | 1 | **PASS** | **PASS** |
| `PRD06-RISK-P12` | `P` | HIGH / P1 | 66, 70 | 09 | 2 | **PASS** | **PASS** |
| `PRD06-RISK-P13` | `P` | CRITICAL / P0 | 65 | 09 | 1 | **PASS** | **PASS** |
| `PRD06-RISK-P14` | `P` | HIGH / P1 | 65, 66 | 09 | 2 | **PASS** | **PASS** |
| `PRD06-RISK-P15` | `P` | HIGH / P0 | 64, 75 | 03, 09 | 2 | **PASS** | **PASS** |
| `PRD06-RISK-P16` | `P` | CRITICAL / P0 | 64, 72 | 09 | 2 | **PASS** | **PASS** |
| `PRD06-RISK-P17` | `P` | CRITICAL / P0 | 63, 64 | 03, 09, 10 | 2 | **PASS** | **PASS** |
| `PRD06-RISK-P18` | `P` | CRITICAL / P0 | 75 | 09, 10 | 1 | **PASS** | **PASS** |
| `PRD06-RISK-P19` | `P` | HIGH / P0 | 75 | 09, 10 | 1 | **PASS** | **PASS** |
| `PRD06-RISK-P20` | `P` | CRITICAL / P0 | 64, 70, 75 | 09 | 3 | **PASS** | **PASS** |
| `PRD06-RISK-P21` | `P` | CRITICAL / P0 | 70, 71 | 08, 09 | 2 | **PASS** | **PASS** |
| `PRD06-RISK-P22` | `P` | CRITICAL / P0 | 70 | 09 | 1 | **PASS** | **PASS** |
| `PRD06-RISK-P23` | `P` | HIGH / P0 | 71, 75 | 08, 09 | 2 | **PASS** | **PASS** |
| `PRD06-RISK-P24` | `P` | HIGH / P1 | 70, 71 | 08, 09 | 2 | **PASS** | **PASS** |
| `PRD06-RISK-R01` | `R` | CRITICAL / P0 | 62, 74 | 07, 09 | 2 | **PASS** | **PASS** |
| `PRD06-RISK-R02` | `R` | HIGH / P0 | 62, 74 | 07 | 2 | **PASS** | **PASS** |
| `PRD06-RISK-R03` | `R` | HIGH / P0 | 62, 74 | 09 | 2 | **PASS** | **PASS** |
| `PRD06-RISK-R04` | `R` | CRITICAL / P0 | 49, 57, 58, 62 | 04, 07 | 4 | **PASS** | **PASS** |
| `PRD06-RISK-R05` | `R` | CRITICAL / P0 | 67, 72, 74 | 09 | 3 | **PASS** | **PASS** |
| `PRD06-RISK-R06` | `R` | CRITICAL / P0 | 70, 72, 74 | 09 | 3 | **PASS** | **PASS** |
| `PRD06-RISK-R07` | `R` | CRITICAL / P0 | 57, 58, 62 | 04, 07 | 3 | **PASS** | **PASS** |
| `PRD06-RISK-R08` | `R` | CRITICAL / P0 | 02, 57, 58 | 01, 04 | 3 | **PASS** | **PASS** |
| `PRD06-RISK-R09` | `R` | CRITICAL / P0 | 02, 57, 58, 74 | 01, 04 | 4 | **PASS** | **PASS** |
| `PRD06-RISK-R10` | `R` | CRITICAL / P0 | 57, 58 | 04, 07 | 2 | **PASS** | **PASS** |
| `PRD06-RISK-R11` | `R` | CRITICAL / P0 | 62, 74 | 07, 09 | 2 | **PASS** | **PASS** |
| `PRD06-RISK-R12` | `R` | CRITICAL / P0 | 57, 58, 62, 74 | 04, 07, 09 | 4 | **PASS** | **PASS** |
| `PRD06-RISK-R13` | `R` | CRITICAL / P0 | 02, 57, 58, 74 | 01, 04 | 4 | **PASS** | **PASS** |
| `PRD06-RISK-R14` | `R` | CRITICAL / P0 | 02, 52, 58 | 01, 04, 07 | 3 | **PASS** | **PASS** |
| `PRD06-RISK-R15` | `R` | CRITICAL / P0 | 48, 58, 69 | 04 | 3 | **PASS** | **PASS** |
| `PRD06-RISK-R16` | `R` | HIGH / P1 | 57, 58, 69 | 04 | 3 | **PASS** | **PASS** |
| `PRD06-RISK-R17` | `R` | CRITICAL / P0 | 02, 58, 67, 74 | 01, 04 | 4 | **PASS** | **PASS** |
| `PRD06-RISK-R18` | `R` | CRITICAL / P0 | 58, 72, 73 | 04, 09 | 3 | **PASS** | **PASS** |
| `PRD06-RISK-R19` | `R` | HIGH / P1 | 71, 75 | 08, 09 | 2 | **PASS** | **PASS** |
| `PRD06-RISK-R20` | `R` | HIGH / P1 | 62, 70, 74 | 09 | 3 | **PASS** | **PASS** |
| `PRD06-RISK-R21` | `R` | HIGH / P0 | 62, 74 | 09 | 2 | **PASS** | **PASS** |
| `PRD06-RISK-R22` | `R` | CRITICAL / P0 | 57, 58, 62, 74 | 01, 04, 07 | 4 | **PASS** | **PASS** |

# 155. Round-9 Closure Gates

| Gate | Result |
|---|---|
| PRD-06 child risks audited | **PASS — 263/263** |
| Unique PRD-06 child-risk IDs | **PASS — 263/263** |
| Child risks with proof routes | **PASS — 263/263** |
| Child risks with fixture routes | **PASS — 263/263** |
| Child risks with explicit exit evidence | **PASS — 263/263** |
| Risk→proof edges checked | **PASS — 724/724** |
| Risk→fixture edges checked | **PASS — 485/485** |
| Stable proof IDs present | **PASS — 76/76** |
| Detailed proof specifications present | **PASS — 76/76** |
| Proof specs with complete required sections | **PASS — 76/76** |
| Proof embedded consumer lists equal PRD-06 | **PASS — 76/76** |
| Risk fixture→proof-spec compatibility | **PASS — 263/263** |
| Single-proof-route risks directly covered | **PASS — 22/22** |
| PROOF-76 sole-route usage limited to common-cause risk | **PASS — Q19 only** |
| Continuing/revalidation proof semantics retained | **PASS — 9/9** |
| Unmapped risks | **PASS — 0** |
| Orphan proof specs | **PASS — 0** |
| New proof IDs required | **PASS — 0** |
| New child risks required | **PASS — 0** |
| Actual proof executions invented | **PASS — 0** |
| PRD-08 conclusions invented | **PASS — 0** |
| Implementation ADRs accepted | **PASS — 0** |
| Architecture reopen candidates created | **PASS — 0** |

**Round-9 closure score: 23 / 23 PASS.**

# 156. Round-9 Verdict

> **ROUND 9 PASS — 76-PROOF / 263-RISK REVERSE AUDIT COMPLETE.**

The reverse audit establishes that PRD-07 is complete at the proof-specification level:

1. every PRD-06 child risk has a runnable proof route;
2. every proof route resolves to a detailed execution specification;
3. every risk reaches a compatible fixture family;
4. every detailed proof spec contains the measurement/evaluation/evidence structure needed by PRD-08;
5. the embedded risk↔proof graph exactly matches PRD-06 in both directions;
6. the 22 single-route risks have direct targeted proof coverage;
7. `PROOF-76` remains correctly limited as an integration/common-cause proof;
8. no additional risk/proof discovery is required before closure reconciliation.

The remaining PRD-07 work is now **Round 10 closure and executable PRD-08 handoff**, not further proof design.

# 157. Machine-Readable Round-9 Summary

```yaml
document: PRD-07
version: v0.9
round: 9
status: WORKING
round_status: PASS
risk_reverse_audit:
  prd06_child_risks: 263
  unique_risk_ids: 263
  with_proof_route: 263
  with_fixture_route: 263
  with_exit_evidence: 263
  risk_to_proof_edges: 724
  risk_to_fixture_edges: 485
proof_spec_audit:
  stable_proofs: 76
  detailed_specs: 76
  complete_required_fields: 76
  exact_consumer_list_parity: 76
fixture_compatibility:
  compatible_risks: 263
  gaps: 0
single_route_risks:
  total: 22
  directly_covered: 22
proof76:
  detailed_consumers: 27
  sole_route_risks: [PRD06-RISK-Q19]
continuing_revalidation_proofs: 9
unmapped_risks: 0
orphan_proof_specs: 0
new_proofs_required: 0
new_risks_required: 0
actual_execution_runs: 0
prd08_results_created: 0
implementation_adrs_accepted: 0
architecture_reopen_candidates: 0
round9_closure:
  passed: 23
  failed: 0
next_round: Closure Candidate / Executable PRD-08 Handoff
```

---

**End of PRD-07 v0.9 — Round 9 Working Baseline**


---

# 158. Round-10 Scope — Closure Candidate & Executable PRD-08 Handoff

Round 10 closes the **PRD-07 specification programme**.

This is a documentation/control closure, not a claim that any prototype, benchmark or proof has executed.

The closure question is:

> **Is the Leyforge proof programme specified completely enough that implementation can now execute controlled PRD-07 runs and PRD-08 can evaluate their evidence without further broad proof-design work?**

Round 10 answers:

> **YES — CLOSURE CANDIDATE.**

# 159. Controlled Baseline Integrity

PRD-07 closes against these paired upstream authorities:

| Controlled source | SHA-256 | Final role |
|---|---|---|
| `PRD-05_Leyforge_Research_Evidence_Crosswalk_v1_0_CLOSURE_CANDIDATE_Round10.md` | `30af0861a801158459820d1756fb49cdf223015b682de8df5f7acbb89add766e` | evidence/source crosswalk and proof lineage |
| `PRD-06_Leyforge_Technical_Risk_and_Proof_Register_v1_0_CLOSURE_CANDIDATE_Round10.md` | `001f748875e63760d22fda5e4fa8fb71f9a7f9cf465f285f019a3ba5a8ba3fba` | stable technical-risk universe and exit-evidence authority |
| `PRD-07_Leyforge_Prototype_Benchmark_and_Proof_Execution_Programme_WORKING_v0_9_Round9.md` | `fe281003a2e7aaf1e5b8a5c85e3c2a25a218c23f261a5573def426bdab86aaf8` | immediate pre-closure execution-programme baseline |

Round 10 does not rewrite those authorities.

# 160. Final PRD-07 Programme Inventory

```text
PRD-05 crosswalk records:                  580
PRD-06 parent risk families:                18
PRD-06 stable child risks:                 263
  CRITICAL / HIGH:                         170 / 93
  LIKELY / POSSIBLE:                       165 / 98
  P0 / P1:                                 226 / 37

Stable PRD-04 proof IDs:                    76
Detailed PRD-07 proof specifications:       76
Shared fixture families:                    10
Primary execution waves:                     6
Final common-cause wave:                     1

Risk → proof edges audited:                724
Risk → fixture edges audited:              485
Single-proof-route risks audited:           22 / 22

Actual PRD07-RUN IDs allocated:              0
Actual PRD07-EVID IDs allocated:             0
PRD-08 evaluated results:                    0
Accepted implementation ADRs:                0
Architecture reopen candidates:              0
```

# 161. Final Execution-Wave Authority

PRD-07 freezes the initial execution spine as:

## W0 — Harness / Artifact / Identity Bootstrap

Primary proofs:

`01, 02, 03, 05, 06, 10, 11, 12, 22, 67, 70, 73, 74`

Purpose:

- exact artifact/dependency identity;
- stable semantic/runtime identity separation;
- provider conformance/swap;
- large coordinates/frames;
- headless/listen-host composition;
- architecture lint.

## W1 — Ownership / Worldgen / Derived-Spatial / Transactions

Primary proofs:

`04, 13, 14, 15, 16, 17, 18, 19, 21, 23, 24, 25, 26, 33, 34, 63, 68`

Purpose:

- owner/revision correctness;
- stale-work rejection;
- distant simulation/fidelity;
- generation/edit precedence;
- collision/nav readiness;
- cross-domain atomicity;
- saturation and traceability.

## W2 — Network / Persistence / Recovery / Migration Mechanics

Primary proofs:

`07, 09, 20, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 57, 58, 69`

Purpose:

- exact-once semantic command handling;
- reconnect/admission/interest;
- coherent checkpoints;
- corruption/recovery;
- backup/migration staging;
- real external process crash recovery.

## W3 — Fluid / Vessel / Moving Frames

Primary proofs:

`08, 27, 28, 29, 30, 31, 32`

Purpose:

- bounded fluid conservation;
- ocean/local-fluid interface;
- editable moving vessels;
- occupants;
- collision candidates;
- flooding/buoyancy.

## W4 — Forge / Trust / Art / Presentation / Historical Migration

Primary proofs:

`49, 50, 51, 52, 53, 54, 55, 56, 59, 60, 61, 62, 71`

Required revalidation:

`57, 58`

Purpose:

- source→bake;
- ART production handoff;
- AI/human parity;
- generated forms;
- pack trust/resource safety;
- full FCC-13E 312-row migration conformance;
- renderer/accessibility/settings/cartography;
- Forge CI.

## W5 — Build / Dependency / Observability / Qualification

Primary new proofs:

`64, 65, 66, 72, 75`

Continuing qualification gates:

`70, 71, 73, 74`

Purpose:

- structured diagnostics;
- support privacy;
- release symbolication;
- dependency upgrades;
- exact-artifact support;
- hardware/profile evidence;
- observability overhead.

## FINAL

`PRD04-PROOF-76 — Whole-Stack Hostile Transaction Soak`

Only after its prerequisite evidence gate is satisfied.

# 162. Final Shared Fixture Register

The ten fixture families remain stable:

1. `FIXTURE-01` — WorldSession / registry / coordinate / frame
2. `FIXTURE-02` — voxel edit / SpatialChangeSet / collision / navigation
3. `FIXTURE-03` — partition / simulation / worker / revision / transaction
4. `FIXTURE-04` — checkpoint / DB / voxel-store / crash / migration
5. `FIXTURE-05` — authoritative server / reconnect / interest
6. `FIXTURE-06` — editable vessel / local frame / collision / flooding
7. `FIXTURE-07` — Forge / pack / generated-form / safe-mod / ART / migration
8. `FIXTURE-08` — renderer / accessibility / settings / cartography
9. `FIXTURE-09` — build / artifact / dependency / support / observability
10. `FIXTURE-10` — combined hostile-world soak

Fixture implementation may evolve.

Fixture **failure-class authority** may not be silently removed.

# 163. PRD-07 Operational State After Closure

After this closure candidate, PRD-07 has two simultaneous states:

```text
SPECIFICATION STATE: CLOSED FOR BROAD DESIGN DISCOVERY
EXECUTION STATE:     NOT STARTED
```

Therefore:

- the document may remain the stable operational authority while proofs execute;
- individual proof specs may receive controlled amendments when real execution finds a defect;
- new broad proof families are not added casually;
- run/evidence records are created separately and do not rewrite historical observations;
- failed/inconclusive runs remain retained evidence.

# 164. First Executable Bootstrap Gate

No `PRD07-RUN-*` ID should be allocated until the relevant proof is `READY`.

The first implementation bootstrap should prioritize reusable W0 harness capability:

```text
FIXTURE-09 build/artifact manifest + clean export control
FIXTURE-01 semantic/world/session/frame identity core
architecture lint bootstrap
runtime-ID randomization/projection controls
real exported headless/client smoke lanes
```

The exact coding order remains implementation work.

PRD-07 specifies the evidence gates, not source-file names or framework selection.

# 165. Final Run-State Machine

A planned proof/scenario progresses through:

```text
SPECIFIED
   ↓
HARNESS-BLOCKED / READY
   ↓
PRD07-RUN ALLOCATED
   ↓
EXECUTING
   ↓
PASS-OBSERVED
FAIL-OBSERVED
INCONCLUSIVE
INVALIDATED
RERUN-REQUIRED
   ↓
PRD-08 EVALUATION
```

PRD-07 never changes a run directly into:

- `RISK-CLOSED`;
- `ADR-ACCEPTED`;
- `PRODUCTION-SUPPORTED`;
- `ARCHITECTURE-REOPENED`.

# 166. Executable PRD-08 Handoff Manifest

PRD-08 receives a **result corpus**, not just this specification document.

For every stable proof ID, the handoff must eventually provide:

```yaml
proof_id:
proof_spec_revision:
risk_consumers:
fixture_routes:
candidate_matrix:
prerequisite_status:
runs:
  - run_id:
    observation_state:
    evidence_pack_status:
    build_identity:
    workload_identity:
    fault_identity:
    raw_evidence_refs:
comparison_matrices:
unexpected_findings:
remaining_coverage_gaps:
candidate_status:
requested_prd08_decisions:
```

PRD-08 may receive a proof with:

- no runs yet;
- only failures;
- mixed candidate results;
- incomplete hardware lanes;
- an invalidated run;
- a new-risk candidate.

The handoff must represent that state honestly.

# 167. PRD-08 Evaluation Contract

PRD-08 is expected to evaluate:

1. whether evidence is admissible;
2. what evidence maturity the exact claim has earned;
3. whether each PRD-06 risk is:
   - still proof-required;
   - mitigated;
   - accepted residual;
   - closed;
   - escalated;
4. whether candidate implementations should:
   - continue;
   - be narrowed;
   - be rejected;
   - require more evidence;
5. whether an implementation ADR now has sufficient evidence;
6. whether a new risk must be added;
7. whether PRD-04 architecture reopening is genuinely warranted;
8. what support/qualification scope is actually justified.

PRD-08 may not retroactively improve a weak run by changing its workload/acceptance criteria after the fact.

# 168. Evidence Admission Rules — Final

A PRD-07 run is not admissible merely because it exists.

At minimum PRD-08 must be able to verify:

- stable run/proof identity;
- exact material build/dependency/content context;
- predeclared expected outcome;
- actual workload and fault conditions;
- measurement method;
- raw evidence references;
- observation state;
- evidence-pack completeness;
- comparison-row compatibility where used;
- limitations;
- reproduction state;
- privacy/security compliance where relevant.

Historical POC/reference material remains supporting context only.

It cannot masquerade as a PRD-07 run.

# 169. Final Reserved ADR Questions

PRD-07 closes without accepting the major implementation choices intentionally reserved by PRD-06.

They include:

- precision / active-frame / rebase strategy;
- Voxel Tools Module vs GDExtension/provider lane;
- partition topology/sizing;
- worker/task ownership model;
- scheduler/backpressure policy;
- database / journal / checkpoint publication strategy;
- network codec/channels/compression;
- reconnect/history windows;
- navigation provider/strategy;
- fluid representation/solver;
- vessel collision representation;
- vessel flooding/buoyancy model;
- Forge source serialization/cache/bake implementation;
- pack archive/signing/trust mechanism;
- test/CI framework;
- observability/log/trace stack;
- hardware/support tiers;
- executable-mod boundary/sandbox if ever introduced;
- renderer/profile support matrix;
- safe graphics recovery mechanism;
- magical-relief map cache/render/LOD strategy;
- legacy migration resolver/quarantine/report/support-window implementation.

PRD-07 evidence exists to make these choices evidence-backed later.

# 170. Architecture-Reopen Final Gate

The architecture reopen rule remains:

A failed run first challenges the **candidate implementation**.

A PRD-04 reopen candidate is valid only when evidence shows the accepted architectural boundary itself is infeasible or contradictory after reasonable candidate alternatives are considered.

Current state:

```text
PRD-04 reopen candidates: 0
PRD-05 reopen candidates: 0
PRD-06 reopen candidates: 0
PRD-07-created reopen candidates: 0
```

# 171. Change Control After PRD-07 Closure

After closure candidate status:

## Allowed without reopening broad PRD-07 discovery

- clarify an ambiguous proof instruction;
- fix a fixture defect;
- add a measurement needed to evaluate an existing risk;
- add a matrix row for a materially different candidate/hardware/build lane;
- rerun after a material dependency/candidate change;
- correct a documentation defect without changing proof meaning.

## Requires controlled PRD-07 amendment

- materially changing a proof's success/failure meaning;
- changing fixture failure-class authority;
- splitting one stable proof because execution proves it cannot be evaluated coherently;
- adding a new proof demanded by a newly discovered failure class.

## Requires upstream risk/governance route

- new child risk;
- new A–R family;
- architecture-boundary conflict;
- canon/gameplay authority conflict.

# 172. Final Closure Matrix

| Closure criterion | Result |
|---|---|
| PRD-05 controlled baseline verified | **PASS** |
| PRD-06 controlled baseline verified | **PASS** |
| Round-9 source integrity verified | **PASS** |
| PRD-06 parent families | **PASS — 18/18** |
| PRD-06 child risks | **PASS — 263/263** |
| Stable proof IDs | **PASS — 76/76** |
| Detailed proof specifications | **PASS — 76/76** |
| Shared fixture families | **PASS — 10/10** |
| Risk→proof edges reverse-audited | **PASS — 724/724** |
| Risk→fixture edges reverse-audited | **PASS — 485/485** |
| Single-route risks directly covered | **PASS — 22/22** |
| Six execution waves defined | **PASS — 6/6** |
| Final common-cause proof defined | **PASS — PROOF-76** |
| Cross-wave harness architecture defined | **PASS** |
| Run identity/state machine defined | **PASS** |
| Scenario/matrix/evidence identity defined | **PASS** |
| Evidence-pack completeness gate defined | **PASS** |
| Cross-wave revalidation rules defined | **PASS** |
| PRD-08 result handoff schema defined | **PASS** |
| PRD-08 evaluation boundary defined | **PASS** |
| ADR reservation boundary preserved | **PASS** |
| Architecture-reopen gate preserved | **PASS** |
| Historical evidence anti-promotion preserved | **PASS** |
| Actual executions invented | **PASS — 0** |
| Evidence artifacts invented | **PASS — 0** |
| PRD-08 conclusions invented | **PASS — 0** |
| Implementation ADRs accepted | **PASS — 0** |
| Architecture reopen candidates invented | **PASS — 0** |

**Round-10 closure score: 28 / 28 PASS.**

# 173. PRD-07 Final Verdict

> **PRD-07 v1.0 — PASS — CLOSURE CANDIDATE**

PRD-07 is now complete as the controlled **Prototype / Benchmark / Proof Execution Programme**.

It is ready to govern real implementation/prototype execution because:

- all 263 PRD-06 risks reach runnable proof specifications;
- all 76 proof IDs have explicit execution contracts;
- all ten fixture families have stable failure-class roles;
- all six execution waves are dependency-ordered;
- final common-cause integration is separately gated;
- raw observation is separated from downstream interpretation;
- candidate failure is separated from architecture failure;
- build/dependency/workload identity is mandatory;
- real crashes, hostile network/storage faults and presentation/hardware evidence are explicitly required where relevant;
- no fictional proof maturity has been created.

The programme now moves from:

```text
WHAT EXACTLY MUST WE TEST?
```

to:

```text
BUILD THE HARNESS.
RUN THE PROOFS.
RETAIN THE EVIDENCE.
LET PRD-08 DECIDE WHAT THE EVIDENCE EARNS.
```

This closure candidate does **not** grant Leyforge rebuild authority.

That remains controlled by the broader Branch A/B/C/D/FCC/PRD gates.

# 174. Machine-Readable Round-10 Closure Summary

```yaml
document: PRD-07
version: v1.0
round: 10
status: CLOSURE_CANDIDATE
closure_status: PASS
upstream:
  prd05_sha256: 30af0861a801158459820d1756fb49cdf223015b682de8df5f7acbb89add766e
  prd06_sha256: 001f748875e63760d22fda5e4fa8fb71f9a7f9cf465f285f019a3ba5a8ba3fba
  prd07_round9_sha256: fe281003a2e7aaf1e5b8a5c85e3c2a25a218c23f261a5573def426bdab86aaf8
programme:
  risk_families: 18
  child_risks: 263
  stable_proofs: 76
  detailed_proof_specs: 76
  fixtures: 10
  execution_waves: 6
  final_common_cause_proof: PRD04-PROOF-76
traceability:
  risk_to_proof_edges: 724
  risk_to_fixture_edges: 485
  single_route_risks: 22
  unmapped_risks: 0
  orphan_proof_specs: 0
execution_state:
  run_ids_allocated: 0
  evidence_ids_allocated: 0
  pass_observed: 0
  fail_observed: 0
  inconclusive: 0
downstream:
  prd08_results: 0
  implementation_adrs_accepted: 0
  architecture_reopen_candidates: 0
closure:
  passed: 28
  failed: 0
next_controlled_activity:
  - implement reusable W0 harness services
  - execute PRD-07 proof runs
  - create PRD-08 result/evaluation records from real evidence
```

---

**End of PRD-07 v1.0 — Round 10 Closure Candidate**
