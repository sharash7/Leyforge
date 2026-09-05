# PRD-06 — Leyforge Technical Risk & Proof Register

**Version:** v1.0 — Round 10 Closure Candidate  
**Status:** CLOSURE CANDIDATE — ROUND 10 CLOSURE RECONCILIATION & PRD-07 HANDOFF COMPLETE  
**Date:** 5 September 2026  
**Primary upstream:** PRD-05 Research Evidence Crosswalk v1.0 Closure Candidate; PRD-04 Architecture Boundary Study v0.8 Closure Candidate; PRD-01 Requirements & Unknowns Inventory v0.15 Closure Candidate  
**Primary downstream:** PRD-07 Prototype & Benchmark Programme; PRD-08 Prototype Results & ADR Evidence; PRD-09 Pre-Rebuild Closure Audit  

---

# 01. Purpose

PRD-06 converts the evidence and architecture handoff from PRD-04/05 into a governed technical-risk system.

It exists to answer five questions for every consequential technical risk:

1. **What can fail or become unacceptably costly?**
2. **Why does the failure matter to Leyforge rather than only to a provider?**
3. **Which accepted architecture boundaries already reduce the risk?**
4. **Which proof obligation(s) must generate evidence before the risk can be retired, accepted, mitigated or converted into an ADR?**
5. **What exact downstream decision or gate depends on that evidence?**

PRD-06 is **not** a new architecture-design pass. It does not reopen PRD-04 merely because a risk exists.

---

# 02. Controlled Source Baseline

| Source | Controlled status for PRD-06 Round 1 | SHA-256 |
|---|---|---|
| PRD-05 Research Evidence Crosswalk v1.0 Closure Candidate | Immediate risk/proof handoff authority | `30af0861a801158459820d1756fb49cdf223015b682de8df5f7acbb89add766e` |
| PRD-04 Architecture Boundary Study v0.8 Closure Candidate | Architecture boundaries, 16 umbrella risks, 76 stable proofs | `747c6681d521dc0483e9b8c1c622bb705aa3fbaff7f2a9b494965835f191e2b4` |
| PRD-01 Requirements & Unknowns Inventory v0.15 Closure Candidate | 1,871 REQs + 478 UNKs; source obligation inventory | `51e671f38a50ad070cd60dbbc29273fac79b17ed37eae009b0cd25e20094c534` |

PRD-05 closure state consumed here:

- **580** continuous PRD05-XW records.
- **2,349 / 2,349** PRD-01 subjects explicitly dispositioned.
- **137** open-routed unknowns; none unowned.
- **76 / 76** stable PRD-04 proof obligations preserved.
- **10** shared hostile fixture families preserved.
- **16** PRD-04 umbrella risks preserved.
- **82** explicitly ID'd `PRD06-SEED-*` rows plus Round-2, Round-7 and Round-8 refinements.
- **0** PRD-04 reopen candidates.
- **0** current PRD-08 proof results and **0** new implementation ADRs.

No outside technology refresh is required for Round 1 because this pass is formalising the already-current PRD-05 handoff rather than re-auditing providers.

---

# 03. Authority and Non-Promotion Rules

The PRD-05 evidence constitution remains binding.

```text
CANON / GOVERNANCE / ACCEPTED ARCHITECTURE
                ↓
       TECHNICAL RISK REGISTER
                ↓
       PROOF / BENCHMARK DESIGN
                ↓
          OBSERVED RESULTS
                ↓
       ADR / ACCEPTED LIMITATION
```

Mandatory rules:

- A **risk** does not negate an accepted architecture boundary.
- A **mitigation candidate** is not an ADR.
- A **proof obligation** is not a proof result.
- Documentation support remains P1 evidence unless later execution raises maturity.
- Historical POC/reference success cannot close a clean-rebuild risk by itself.
- A risk may be reduced by architecture/governance before PRD-07, but it may be **closed by evidence** only when the required proof evidence exists.
- PRD-06 may split or combine PRD-05 seeds operationally, but reverse lineage to every consumed seed must remain recoverable.

---

# 04. Stable Risk Namespace

PRD-06 adopts these stable identifiers:

```text
PRD06-RISK-A ... PRD06-RISK-P    original PRD-04 umbrella families
PRD06-RISK-Q                     PRD-06 extension: cross-domain transaction atomicity
PRD06-RISK-R                     PRD-06 extension: historical/migration contamination

PRD06-RISK-A01 ...               detailed child risks created in later rounds
```

The original A–P labels are never renumbered or repurposed.

`Q` and `R` are explicitly **PRD-06-added extensions**, permitted by PRD-04's instruction that PRD-06 may split the programme-level risks further. They do not rewrite PRD-04.

---

# 05. Risk Record Schema

Every detailed risk record must eventually carry:

| Field | Rule |
|---|---|
| **Risk ID** | Stable PRD06-RISK-* identity. |
| **Parent family** | One or more A–R risk families. |
| **Failure statement** | A falsifiable description of the undesirable technical outcome. |
| **Consequence** | What breaks: semantic integrity, availability, security, performance, supportability, accessibility, production throughput, etc. |
| **Trigger / exposure** | Conditions that make the failure plausible. |
| **Upstream lineage** | REQ/UNK, PRD05-XW, PRD06-SEED and PRD04 boundary references. |
| **Existing controls** | Accepted architecture/governance rules already reducing exposure. |
| **Severity** | CRITICAL / HIGH / MEDIUM / LOW. |
| **Unmitigated plausibility** | LIKELY / POSSIBLE / UNLIKELY; provisional before PRD-07. |
| **Priority** | P0 proof-blocking / P1 major qualification / P2 bounded downstream. |
| **Risk state** | OPEN / PROOF-REQUIRED / DECISION-REQUIRED / MITIGATED / ACCEPTED-LIMITATION / DEFERRED / CLOSED-BY-EVIDENCE. |
| **Proof route** | Stable PRD04-PROOF IDs and PRD-07 fixture families. |
| **Success / exit evidence** | Evidence required to reduce or close the risk. |
| **Residual risk** | Unassessed until evidence exists; later retained if a limitation remains. |
| **ADR dependency** | Decision(s) that must wait for evidence. |
| **Owner / consumer** | PRD-07, LFE, FORGE-ENG, Branch B engineering, later implementation owner, etc. |

---

# 06. Initial Severity / Plausibility / Priority Model

### Severity

- **CRITICAL** — can corrupt canonical truth, destroy recoverability, compromise trust/security, duplicate/loss consequential state, or force a major architecture reversal.
- **HIGH** — can block production/release, create severe scalability/supportability/accessibility failures, or require major subsystem rework.
- **MEDIUM** — significant but bounded failure with viable containment and no expected canonical-data loss.
- **LOW** — localised operational/product impact with straightforward containment.

### Unmitigated plausibility

- **LIKELY** — the failure mode is a normal pressure of the intended scale/architecture unless explicit controls work.
- **POSSIBLE** — plausible under specific lanes, workloads or integration choices.
- **UNLIKELY** — requires unusual conditions but still merits explicit proof because consequence is high.

This field describes **unmitigated plausibility**, not measured production incidence. PRD-07/08 may materially change it.

### Priority

- **P0 — proof-blocking:** must be resolved sufficiently before implementation architecture can be safely locked.
- **P1 — major qualification:** may not block the earliest prototype but must be qualified before rebuild/release authority advances.
- **P2 — bounded downstream:** can be deferred to a named later owner without invalidating the current programme.

---

# 07. PRD-06 Round Sequence

| Round | Scope | Exit condition |
|---|---|---|
| **Round 1 — Constitution & Risk Intake** | Lock risk taxonomy/schema, ingest A–P + all PRD-05 seed refinements, create A–R family register, preserve 76 proofs and 10 fixture routes. | **COMPLETE in v0.1.** |
| **Round 2 — Identity / Coordinates / Provider Edition / Headless** | Formalise detailed risks under A/B/C/L; precision, frame/rebase, provider edition, semantic identity and runtime-mode parity. | **COMPLETE in v0.2 — 38 stable child risks.** |
| **Round 3 — Ownership / Concurrency / Transactions** | Formalise F/G/Q; owner transfer, stale work, fidelity, scheduling, conservation, idempotency, cross-domain commit and whole-stack transaction risk. | **Stable child-risk records + cross-risk dependency map.** |
| **Round 4 — Voxel / Navigation / Fluid / Vessel** | Formalise E/H/I/J; late generation, derived readiness, nav, ocean/local fluid, vessel collision/mass/flooding/frames. | **Proofable risk statements + acceptance thresholds for PRD-07 design.** |
| **Round 5 — Networking / Persistence / Recovery** | Formalise K/D; protocol, interest, reconnect, checkpoint, crash recovery, migrations and backpressure. | **Network/persistence failure matrices and risk dependencies.** |
| **Round 6 — Forge / Trust / Art / Presentation** | Formalise M/N/O; pack security, data-mod resource abuse, Art handoff execution, renderer/settings/accessibility certification. | **Production/content risk register complete.** |
| **Round 7 — Build / Dependency / Observability** | Formalise P; reproducible artifacts, upgrades, patches, diagnostics, symbols, support bundles and qualification overclaim. | **Build/support risk register complete.** |
| **Round 8 — Historical / Migration + Open-Unknown Promotion** | Formalise R and audit the 137 open-routed unknowns for technically consequential risk promotion without importing design-only unknowns. | **No technically consequential unknown is unrepresented.** |
| **Round 9 — Cross-Risk Prioritisation & Proof Sufficiency** | Audit cascades, common-cause risks, shared controls, severity/plausibility consistency, proof coverage and decision deadlines. | **Every risk has a proof/owner/accepted deferral route.** |
| **Round 10 — Closure & PRD-07 Handoff** | Final register reconciliation, residual unknowns, proof prioritisation, fixture sequencing requirements and no-premature-ADR gate. | **PRD-06 closure candidate ready for PRD-07.** |

---

# 08. Primary Risk Family Register — A to R

All families begin in `PROOF-REQUIRED` state. Severity/plausibility below are **initial Round-1 assessments**, not experimental results.

| ID | Risk family | Origin | Severity | Plausibility | Priority | Package | Seed inputs | Principal proofs |
|---|---|---|---|---|---|---|---:|---|
| **PRD06-RISK-A** | Large-coordinate / precision / origin-frame strategy | PRD-04 umbrella | **CRITICAL** | **POSSIBLE** | **P0** | PKG-B | **4** | 05, 06, 09, 10, 11 |
| **PRD06-RISK-B** | Zylann Module vs GDExtension parity | PRD-04 umbrella | **HIGH** | **POSSIBLE** | **P0** | PKG-A / PKG-L | **1** | 03, 11, 67, 70, 72, 73 |
| **PRD06-RISK-C** | Semantic runtime palette / migration | PRD-04 umbrella | **CRITICAL** | **LIKELY** | **P0** | PKG-A / PKG-I / PKG-J | **4** | 01, 02, 03, 12, 22, 49, 52, 57, 58, 74 |
| **PRD06-RISK-D** | Async voxel persistence + coherent checkpoint | PRD-04 umbrella | **CRITICAL** | **LIKELY** | **P0** | PKG-I | **10** | 07, 20, 39, 40, 41, 47, 48, 57, 58, 69 |
| **PRD06-RISK-E** | Deterministic worldgen / late-generation overwrite | PRD-04 umbrella | **CRITICAL** | **POSSIBLE** | **P0** | PKG-C / PKG-E | **3** | 21, 23, 24, 68 |
| **PRD06-RISK-F** | Simulation ownership / worker scaling | PRD-04 umbrella | **CRITICAL** | **LIKELY** | **P0** | PKG-C | **7** | 13, 14, 15, 16, 19, 21, 68 |
| **PRD06-RISK-G** | Cross-provider CPU saturation / backpressure | PRD-04 umbrella | **HIGH** | **LIKELY** | **P0** | PKG-C / PKG-H / PKG-I / PKG-L | **2** | 18, 37, 46, 47, 75, 76 |
| **PRD06-RISK-H** | Dynamic voxel navigation / derived readiness after edits | PRD-04 umbrella | **HIGH** | **LIKELY** | **P0** | PKG-E | **7** | 23, 25, 26, 34, 67 |
| **PRD06-RISK-I** | Local conserved fluid + ocean boundary | PRD-04 umbrella | **HIGH** | **LIKELY** | **P1** | PKG-F | **5** | 27, 28, 32 |
| **PRD06-RISK-J** | Moving editable vessel collision / mass / flooding | PRD-04 umbrella | **CRITICAL** | **LIKELY** | **P0** | PKG-G | **8** | 08, 29, 30, 31, 32 |
| **PRD06-RISK-K** | Authoritative voxel/entity networking and reconnect | PRD-04 umbrella | **CRITICAL** | **LIKELY** | **P0** | PKG-H | **10** | 35, 36, 37, 38, 42, 43, 44, 45, 46 |
| **PRD06-RISK-L** | Headless dedicated-server parity | PRD-04 umbrella | **HIGH** | **POSSIBLE** | **P0** | PKG-B / PKG-H / PKG-L | **2** | 10, 11, 54, 70 |
| **PRD06-RISK-M** | Content-pack / safe-mod sandbox boundary | PRD-04 umbrella | **CRITICAL** | **LIKELY** | **P0** | PKG-J | **4** | 54, 55, 56, 57, 58, 62 |
| **PRD06-RISK-N** | Art Production Handoff completeness | PRD-04 umbrella | **HIGH** | **POSSIBLE** | **P1** | PKG-J | **4** | 49, 50, 51, 52, 62 |
| **PRD06-RISK-O** | Renderer / accessibility / profile certification | PRD-04 umbrella | **HIGH** | **LIKELY** | **P1** | PKG-K | **10** | 53, 59, 60, 61, 71 |
| **PRD06-RISK-P** | Dependency/build reproducibility and observability | PRD-04 umbrella | **HIGH** | **LIKELY** | **P0** | PKG-L | **9** | 64, 65, 66, 70, 72, 73, 75 |
| **PRD06-RISK-Q** | Cross-domain transaction atomicity and conservation | PRD-06 extension from PKG-D / PRD-05 | **CRITICAL** | **LIKELY** | **P0** | PKG-D | **11** | 04, 17, 33, 63, 76 |
| **PRD06-RISK-R** | Historical / migration / compatibility contamination | PRD-06 extension from PRD-05 Round 8 | **HIGH** | **POSSIBLE** | **P1** | Cross-cutting migration/compatibility | **8** | 02, 49, 57, 58, 62, 72, 74 |

Initial family count: **18** = 16 original PRD-04 umbrellas + 2 explicit PRD-06 extensions.

---

# 09. Family Profiles

## PRD06-RISK-A — Large-coordinate / precision / origin-frame strategy

**Origin:** PRD-04 umbrella  
**Initial state:** PROOF-REQUIRED  
**Severity:** CRITICAL  
**Unmitigated plausibility:** POSSIBLE  
**Priority:** P0  
**Primary programme:** PKG-B  
**Shared fixtures:** FIXTURE-01, FIXTURE-05, FIXTURE-06, FIXTURE-09  
**Principal proof IDs:** 05, 06, 09, 10, 11  

**Failure statement.** The chosen canonical-coordinate, local-frame, precision and rebasing strategy may fail at Leyforge scale or diverge across rendering, physics, navigation, networking, vessels and realm travel.

**Why it matters.** Spatial corruption, divergent client/server positions, broken realm travel, unstable vessels, precision artefacts or a late engine-build strategy reversal.

**Existing accepted controls.** Provider-independent canonical coordinates; bounded engine-local projections; WorldDefinition/WorldSession separation; explicit frame conversions; precision remains candidate until proof.

**Evidence required to reduce/close.** PRD-07 proves extreme coordinates, rebasing/frame transitions and runtime-mode parity on the exact intended build/provider lanes; residual limitations are bounded and ADR-ready.

**Residual risk:** UNASSESSED — no current PRD-08 proof result.

## PRD06-RISK-B — Zylann Module vs GDExtension parity

**Origin:** PRD-04 umbrella  
**Initial state:** PROOF-REQUIRED  
**Severity:** HIGH  
**Unmitigated plausibility:** POSSIBLE  
**Priority:** P0  
**Primary programme:** PKG-A / PKG-L  
**Shared fixtures:** FIXTURE-01, FIXTURE-02, FIXTURE-09  
**Principal proof IDs:** 03, 11, 67, 70, 72, 73  

**Failure statement.** The selected Voxel Tools integration edition may differ materially in capability, stability, export/headless behaviour, maintenance burden or compatibility.

**Why it matters.** Provider-specific failures, unsupported exports, rebuild churn, hidden feature gaps or a late switch between Module and GDExtension.

**Existing accepted controls.** VoxelFacade/provider boundary; no edition selected by preference; exact dependency/build identity.

**Evidence required to reduce/close.** Exact Module/GDExtension comparison passes provider-conformance, export, headless, performance and upgrade lanes sufficiently to support an ADR.

**Residual risk:** UNASSESSED — no current PRD-08 proof result.

## PRD06-RISK-C — Semantic runtime palette / migration

**Origin:** PRD-04 umbrella  
**Initial state:** PROOF-REQUIRED  
**Severity:** CRITICAL  
**Unmitigated plausibility:** LIKELY  
**Priority:** P0  
**Primary programme:** PKG-A / PKG-I / PKG-J  
**Shared fixtures:** FIXTURE-01, FIXTURE-04, FIXTURE-07  
**Principal proof IDs:** 01, 02, 03, 12, 22, 49, 52, 57, 58, 74  

**Failure statement.** Runtime-local IDs, palettes, paths, ResourceUIDs, provider model IDs or legacy numeric handles may leak into durable semantic identity or be migrated incorrectly.

**Why it matters.** World corruption, content reinterpretation, broken saves/mods, duplicate or lost entities, impossible provider swaps and irreversible compatibility mistakes.

**Existing accepted controls.** Canonical semantic IDs outrank runtime handles; reversible mappings; FCC-13 migration authority; compatibility/quarantine namespaces; projection lifecycle non-authoritative.

**Evidence required to reduce/close.** Runtime-ID randomisation, provider swap, migration/conformance and pack upgrade fixtures prove semantic identity survives remapping and old-data handling.

**Residual risk:** UNASSESSED — no current PRD-08 proof result.

## PRD06-RISK-D — Async voxel persistence + coherent checkpoint

**Origin:** PRD-04 umbrella  
**Initial state:** PROOF-REQUIRED  
**Severity:** CRITICAL  
**Unmitigated plausibility:** LIKELY  
**Priority:** P0  
**Primary programme:** PKG-I  
**Shared fixtures:** FIXTURE-04, FIXTURE-10  
**Principal proof IDs:** 07, 20, 39, 40, 41, 47, 48, 57, 58, 69  

**Failure statement.** Independent DB, voxel, file, journal and provider persistence may be mistaken for one coherent world save or recover inconsistently after interruption.

**Why it matters.** Silent world corruption, duplicated/lost transactions, unrecoverable saves, invalid backups or migration destroying the last known-good state.

**Existing accepted controls.** SaveCoordinator checkpoint authority; explicit durability boundary; checkpoint lineage; preserve known-good source; world-session epochs; bounded persistence backpressure.

**Evidence required to reduce/close.** Cross-store crash, corruption, heavy-edit save, backup/copy, migration and real-process-kill fixtures recover one coherent lineage without data invention.

**Residual risk:** UNASSESSED — no current PRD-08 proof result.

## PRD06-RISK-E — Deterministic worldgen / late-generation overwrite

**Origin:** PRD-04 umbrella  
**Initial state:** PROOF-REQUIRED  
**Severity:** CRITICAL  
**Unmitigated plausibility:** POSSIBLE  
**Priority:** P0  
**Primary programme:** PKG-C / PKG-E  
**Shared fixtures:** FIXTURE-02, FIXTURE-03, FIXTURE-10  
**Principal proof IDs:** 21, 23, 24, 68  

**Failure statement.** Asynchronous generation or worker-order variation may overwrite committed edits or make canonical generation depend on execution order/core count.

**Why it matters.** Player construction disappears, seeds cease to reproduce, multiplayer/save divergence or hard-to-reproduce regional corruption.

**Existing accepted controls.** Canonical edit precedence; versioned snapshots/proposals; owner commit; deterministic seeded semantics; provider generation is not authority.

**Evidence required to reduce/close.** Late-generation-vs-edit and worker-order chaos fixtures prove deterministic canonical outcomes across order/core-count variation and edit races.

**Residual risk:** UNASSESSED — no current PRD-08 proof result.

## PRD06-RISK-F — Simulation ownership / worker scaling

**Origin:** PRD-04 umbrella  
**Initial state:** PROOF-REQUIRED  
**Severity:** CRITICAL  
**Unmitigated plausibility:** LIKELY  
**Priority:** P0  
**Primary programme:** PKG-C  
**Shared fixtures:** FIXTURE-03, FIXTURE-10  
**Principal proof IDs:** 13, 14, 15, 16, 19, 21, 68  

**Failure statement.** Mutable state may gain ambiguous writers, stale worker commits, SceneTree dependence or fidelity transitions that violate conservation and identity.

**Why it matters.** Canonical divergence, duplicated/disappearing entities/resources, nondeterminism, dead sessions touched by old work and scale collapse.

**Existing accepted controls.** One commit owner per mutable authority; workers compute/owners commit; revision/epoch validation; domain simulation outside SceneTree; explicit fidelity invariants.

**Evidence required to reduce/close.** Ownership transfer, stale-work, distant-simulation, fidelity and worker-order fixtures pass under hostile concurrency and world-session churn.

**Residual risk:** UNASSESSED — no current PRD-08 proof result.

## PRD06-RISK-G — Cross-provider CPU saturation / backpressure

**Origin:** PRD-04 umbrella  
**Initial state:** PROOF-REQUIRED  
**Severity:** HIGH  
**Unmitigated plausibility:** LIKELY  
**Priority:** P0  
**Primary programme:** PKG-C / PKG-H / PKG-I / PKG-L  
**Shared fixtures:** FIXTURE-03, FIXTURE-05, FIXTURE-09, FIXTURE-10  
**Principal proof IDs:** 18, 37, 46, 47, 75, 76  

**Failure statement.** Godot, Zylann, navigation, persistence, network, Forge and diagnostics workloads may individually behave correctly but collectively oversubscribe CPU, queues, memory or I/O.

**Why it matters.** Latency spirals, unbounded queues, frame stalls, delayed saves, network starvation, shutdown failure or observability becoming a load amplifier.

**Existing accepted controls.** Cross-provider budgets; bounded queues/backpressure; cancellation/supersession; workload classification; instrumentation overhead limits.

**Evidence required to reduce/close.** Saturation/backpressure/observability tests demonstrate bounded degradation and recoverability across combined workloads and exported builds.

**Residual risk:** UNASSESSED — no current PRD-08 proof result.

## PRD06-RISK-H — Dynamic voxel navigation / derived readiness after edits

**Origin:** PRD-04 umbrella  
**Initial state:** PROOF-REQUIRED  
**Severity:** HIGH  
**Unmitigated plausibility:** LIKELY  
**Priority:** P0  
**Primary programme:** PKG-E  
**Shared fixtures:** FIXTURE-02, FIXTURE-10  
**Principal proof IDs:** 23, 25, 26, 34, 67  

**Failure statement.** Voxel edits may leave collision, navigation, mesh or other derived providers stale, oversized or cyclically invalidated.

**Why it matters.** Actors traverse missing floors, collide with removed walls, path through hazards, main-thread stalls or providers silently revert/contradict canonical state.

**Existing accepted controls.** SpatialChangeSet; multidimensional readiness; revision quarantine; bounded invalidation; provider degradation; canonical edit remains authoritative.

**Evidence required to reduce/close.** One-block fan-out, collision quarantine, nav dirty bridge, provider degradation and conformance tests pass under edit bursts.

**Residual risk:** UNASSESSED — no current PRD-08 proof result.

## PRD06-RISK-I — Local conserved fluid + ocean boundary

**Origin:** PRD-04 umbrella  
**Initial state:** PROOF-REQUIRED  
**Severity:** HIGH  
**Unmitigated plausibility:** LIKELY  
**Priority:** P1  
**Primary programme:** PKG-F  
**Shared fixtures:** FIXTURE-02, FIXTURE-06, FIXTURE-10  
**Principal proof IDs:** 27, 28, 32  

**Failure statement.** A scalable ocean/local-fluid model may fail conservation, boundary transitions or activation/demotion semantics, or presentation may accidentally become fluid truth.

**Why it matters.** Water duplication/loss, impossible flooding, enormous active-cell cost, inconsistent saves or graphics settings changing gameplay water state.

**Existing accepted controls.** Leyforge-owned fluid semantics/conservation; ocean boundary distinct from local active volumes; rendering separate from simulation/materialisation.

**Evidence required to reduce/close.** Boundary-breach and ocean/local-fluid fixtures demonstrate conservation, scalable activation/demotion and correct vessel coupling.

**Residual risk:** UNASSESSED — no current PRD-08 proof result.

## PRD06-RISK-J — Moving editable vessel collision / mass / flooding

**Origin:** PRD-04 umbrella  
**Initial state:** PROOF-REQUIRED  
**Severity:** CRITICAL  
**Unmitigated plausibility:** LIKELY  
**Priority:** P0  
**Primary programme:** PKG-G  
**Shared fixtures:** FIXTURE-06, FIXTURE-10  
**Principal proof IDs:** 08, 29, 30, 31, 32  

**Failure statement.** Editable moving vessels may fail if treated as moving terrain, if collision rebuilds are unsuitable, or if mass/COM/flooding/occupant frames lag canonical hull state.

**Why it matters.** Physics instability, tunnelling, occupant launches/desync, incorrect buoyancy, severe performance cliffs or vessel identity corruption across regions.

**Existing accepted controls.** Vessel domain entity + vessel-local frame; finite/local content; semantic mass/topology; revisioned collision; Fluid↔Vessel contract; physics as execution provider.

**Evidence required to reduce/close.** Region crossing, hull edit, occupant motion, collision-strategy and flooding/buoyancy fixtures establish a viable bounded vessel architecture.

**Residual risk:** UNASSESSED — no current PRD-08 proof result.

## PRD06-RISK-K — Authoritative voxel/entity networking and reconnect

**Origin:** PRD-04 umbrella  
**Initial state:** PROOF-REQUIRED  
**Severity:** CRITICAL  
**Unmitigated plausibility:** LIKELY  
**Priority:** P0  
**Primary programme:** PKG-H  
**Shared fixtures:** FIXTURE-05, FIXTURE-10  
**Principal proof IDs:** 35, 36, 37, 38, 42, 43, 44, 45, 46  

**Failure statement.** Transport/runtime identities, retries, baseline mismatches, interest spikes or reconnect semantics may corrupt canonical multiplayer state or expose unbounded work.

**Why it matters.** Duplicate transactions/characters, wrong-world deltas, hidden-state leaks, denial-of-service paths, permanent protocol coupling or loss of authoritative control.

**Existing accepted controls.** Leyforge-owned durable protocol; stable IDs; semantic operation IDs/acks; bounded decode; interest policy above view distance; reconnect restores canonical identity.

**Evidence required to reduce/close.** Duplicate/lost-ack, baseline mismatch, interest, reconnect, cache-poison, restart and backpressure fixtures pass under impairment and abuse cases.

**Residual risk:** UNASSESSED — no current PRD-08 proof result.

## PRD06-RISK-L — Headless dedicated-server parity

**Origin:** PRD-04 umbrella  
**Initial state:** PROOF-REQUIRED  
**Severity:** HIGH  
**Unmitigated plausibility:** POSSIBLE  
**Priority:** P0  
**Primary programme:** PKG-B / PKG-H / PKG-L  
**Shared fixtures:** FIXTURE-01, FIXTURE-05, FIXTURE-09  
**Principal proof IDs:** 10, 11, 54, 70  

**Failure statement.** Headless/dedicated execution may accidentally require renderer/SceneTree projections or diverge semantically from single-player/listen-host/client builds.

**Why it matters.** Server-only crashes, divergent rules/saves/content packs, inability to host at scale or late architecture rework.

**Existing accepted controls.** WorldSession/domain state independent from presentation; one canonical semantic authority; explicit server/client pack split; exported artifact matrix.

**Evidence required to reduce/close.** Headless WorldSession, single→listen-host, server/client pack and exported-artifact lanes prove semantic parity without render dependencies.

**Residual risk:** UNASSESSED — no current PRD-08 proof result.

## PRD06-RISK-M — Content-pack / safe-mod sandbox boundary

**Origin:** PRD-04 umbrella  
**Initial state:** PROOF-REQUIRED  
**Severity:** CRITICAL  
**Unmitigated plausibility:** LIKELY  
**Priority:** P0  
**Primary programme:** PKG-J  
**Shared fixtures:** FIXTURE-07, FIXTURE-09  
**Principal proof IDs:** 54, 55, 56, 57, 58, 62  

**Failure statement.** Content packs or supposedly data-only mods may smuggle executable/unsafe content, exhaust resources, diverge client/server authority or mutate persistent semantics without migration.

**Why it matters.** Security compromise, denial of service, incompatible worlds, authoritative-data omission or unsafe external/import content in runtime packages.

**Existing accepted controls.** Stable pack identity/trust/dependencies; data-only default tier; schema validation; bounded resources; safe import/quarantine; world lockfile-equivalent.

**Evidence required to reduce/close.** Safe-mod smuggling, resource-bomb, pack split, missing-pack recovery, pack migration and Forge CI fixtures demonstrate enforceable trust boundaries.

**Residual risk:** UNASSESSED — no current PRD-08 proof result.

## PRD06-RISK-N — Art Production Handoff completeness

**Origin:** PRD-04 umbrella  
**Initial state:** PROOF-REQUIRED  
**Severity:** HIGH  
**Unmitigated plausibility:** POSSIBLE  
**Priority:** P1  
**Primary programme:** PKG-J  
**Shared fixtures:** FIXTURE-07, FIXTURE-08, FIXTURE-09  
**Principal proof IDs:** 49, 50, 51, 52, 62  

**Failure statement.** The theoretically locked ART corpus may still fail as a practical mass-production contract if source→bake reproducibility, AI/human parity, generated forms or CI validation are incomplete.

**Why it matters.** Inconsistent assets, non-reproducible builds, manual duplication, visual-semantic drift or inability for Codex/The Forge to produce production-grade content reliably.

**Existing accepted controls.** ART-00→10 authority; editable Forge source vs generated products; common validation pipeline; provenance; generated-form rules.

**Evidence required to reduce/close.** Art handoff, reproducible bake, AI/human parity, generated-form and Forge-CI fixtures pass on representative golden assets.

**Residual risk:** UNASSESSED — no current PRD-08 proof result.

## PRD06-RISK-O — Renderer / accessibility / profile certification

**Origin:** PRD-04 umbrella  
**Initial state:** PROOF-REQUIRED  
**Severity:** HIGH  
**Unmitigated plausibility:** LIKELY  
**Priority:** P1  
**Primary programme:** PKG-K  
**Shared fixtures:** FIXTURE-08, FIXTURE-09  
**Principal proof IDs:** 53, 59, 60, 61, 71  

**Failure statement.** Renderer/profile/settings differences may alter semantic readability, accessibility, safe startup or even gameplay truth despite the architecture boundary.

**Why it matters.** Players lose critical information, settings strand the application, unsupported renderer claims, UI/focus failures or graphics presets change simulation outcomes.

**Existing accepted controls.** Separated settings scopes; presentation downstream from truth; non-colour/motion/audio-only critical cues; safe graphics recovery; renderer support must be certified.

**Evidence required to reduce/close.** Renderer/profile, settings isolation, safe graphics recovery, accessibility torture and hardware lanes pass representative golden scenes and gameplay.

**Residual risk:** UNASSESSED — no current PRD-08 proof result.

## PRD06-RISK-P — Dependency/build reproducibility and observability

**Origin:** PRD-04 umbrella  
**Initial state:** PROOF-REQUIRED  
**Severity:** HIGH  
**Unmitigated plausibility:** LIKELY  
**Priority:** P0  
**Primary programme:** PKG-L  
**Shared fixtures:** FIXTURE-09, FIXTURE-10  
**Principal proof IDs:** 64, 65, 66, 70, 72, 73, 75  

**Failure statement.** Exact shipped artifacts may be unreproducible or unobservable due to dependency drift, invisible patches, lost symbols, unsafe support evidence, noisy diagnostics or false qualification.

**Why it matters.** Unfixable release crashes, invalid benchmark comparisons, security/privacy leakage, dependency regressions and inability to reproduce supported builds.

**Existing accepted controls.** Exact build/dependency manifest; controlled upgrades/patches; retained symbols; bounded allowlisted diagnostics; lane-specific evidence; observability budget.

**Evidence required to reduce/close.** Export, upgrade, patch, stale-work classification, support-bundle, symbolication and observability-overhead fixtures establish reproducible supportable artifacts.

**Residual risk:** UNASSESSED — no current PRD-08 proof result.

## PRD06-RISK-Q — Cross-domain transaction atomicity and conservation

**Origin:** PRD-06 extension from PKG-D / PRD-05  
**Initial state:** PROOF-REQUIRED  
**Severity:** CRITICAL  
**Unmitigated plausibility:** LIKELY  
**Priority:** P0  
**Primary programme:** PKG-D  
**Shared fixtures:** FIXTURE-02, FIXTURE-03, FIXTURE-04, FIXTURE-05, FIXTURE-06, FIXTURE-10  
**Principal proof IDs:** 04, 17, 33, 63, 76  

**Failure statement.** Consequential actions spanning inventory, voxels, structures, entities, network and persistence may partially commit, leak reservations, conflate cancellation/rollback or lose traceability.

**Why it matters.** Duplication/loss, impossible compensation, deadlocks, history disagreement, unrecoverable crash states or systems that are individually correct but jointly corrupt.

**Existing accepted controls.** Explicit consistency classes; commands as intent/events as committed facts; owner-coordinated transactions; idempotent operation IDs; reservations; trace/correlation; compensation where appropriate.

**Evidence required to reduce/close.** Cross-boundary, construction, collapse, end-to-end trace and final hostile soak prove coherent commit semantics under injected failures.

**Residual risk:** UNASSESSED — no current PRD-08 proof result.

## PRD06-RISK-R — Historical / migration / compatibility contamination

**Origin:** PRD-06 extension from PRD-05 Round 8  
**Initial state:** PROOF-REQUIRED  
**Severity:** HIGH  
**Unmitigated plausibility:** POSSIBLE  
**Priority:** P1  
**Primary programme:** Cross-cutting migration/compatibility  
**Shared fixtures:** FIXTURE-01, FIXTURE-04, FIXTURE-07, FIXTURE-09  
**Principal proof IDs:** 02, 49, 57, 58, 62, 72, 74  

**Failure statement.** Historical POC/Summer assumptions, legacy registry identities, obsolete test steps, reference-engine lessons or old benchmark numbers may leak into the clean rebuild as current authority.

**Why it matters.** Wrong semantic migrations, retired POC content in shipping pools, brittle Summer-specific tests, false provider assumptions or obsolete hardware targets.

**Existing accepted controls.** Historical evidence quarantine; FCC-13E 312/312 semantic dispositions; invariant-based test translation; evidence-class labels; compatibility namespaces; fresh qualification targets.

**Evidence required to reduce/close.** Migration conformance, compatibility isolation, translated regression fixtures and validation scans demonstrate historical value is retained without authority contamination.

**Residual risk:** UNASSESSED — no current PRD-08 proof result.

---

# 10. Detailed Seed Intake — 109 Source Risk Refinements

Round 1 ingests **109 detailed risk refinements** in addition to the 16 umbrella risks:

- **9** Round-2 identity/coordinate candidates.
- **82** explicitly ID'd `PRD06-SEED-*` rows from PRD-05 Rounds 3–6.
- **10** Round-7 build/observability risk families, assigned PRD-06-local aliases `R7-P01..P10` for traceability.
- **8** Round-8 historical/migration themes, retaining the upstream `R8-A..H` labels.

The `Primary family` column is a Round-1 routing decision only. Later detailed risks may legitimately cross-reference additional families.

| # | Source | Seed / upstream label | Risk theme | Primary family | Existing proof/evidence route |
|---:|---|---|---|---|---|
| 1 | PRD-05 Round 2 | `R-A1` | Semantic/runtime identity drift | **PRD06-RISK-C** | PROOF-02 + migration/save fixtures |
| 2 | PRD-05 Round 2 | `R-A2` | Projection lifecycle semantic duplication/loss | **PRD06-RISK-C** | PROOF-01/12/22 |
| 3 | PRD-05 Round 2 | `R-A3` | Provider/dependency inversion | **PRD06-RISK-B** | PROOF-03/74 |
| 4 | PRD-05 Round 2 | `R-B1` | Precision strategy mismatch | **PRD06-RISK-A** | PROOF-05 across hardware/provider/export lanes |
| 5 | PRD-05 Round 2 | `R-B2` | Rebase cross-provider incoherence | **PRD06-RISK-A** | PROOF-06 |
| 6 | PRD-05 Round 2 | `R-B3` | Realm-transition partial commit | **PRD06-RISK-Q** | PROOF-09 + PKG-H/I crash/reconnect variants |
| 7 | PRD-05 Round 2 | `R-B4` | Runtime-mode semantic divergence | **PRD06-RISK-L** | PROOF-10/11 |
| 8 | PRD-05 Round 2 | `R-B5` | Multi-frame scalability | **PRD06-RISK-A** | PROOF-05/06/10 plus PKG-C/E performance suites |
| 9 | PRD-05 Round 2 | `R-B6` | Custom double-build release burden | **PRD06-RISK-A** | PKG-L exported-artifact/build proof + PROOF-11 |
| 10 | PRD-05 explicit seed | `PRD06-SEED-R3-C01` | Multiple writers / ownership ambiguity | **PRD06-RISK-F** | PROOF-13/14/68 |
| 11 | PRD-05 explicit seed | `PRD06-SEED-R3-C02` | Stale worker/provider commit | **PRD06-RISK-F** | PROOF-13/68 |
| 12 | PRD-05 explicit seed | `PRD06-SEED-R3-C03` | Ownership-transfer race or crash ambiguity | **PRD06-RISK-F** | PROOF-14 + PKG-I crash proofs |
| 13 | PRD-05 explicit seed | `PRD06-SEED-R3-C04` | SceneTree-dependent distant simulation | **PRD06-RISK-F** | PROOF-15/19 |
| 14 | PRD-05 explicit seed | `PRD06-SEED-R3-C05` | Fidelity conservation drift | **PRD06-RISK-F** | PROOF-15/16/21 |
| 15 | PRD-05 explicit seed | `PRD06-SEED-R3-C06` | Cross-provider CPU oversubscription | **PRD06-RISK-G** | PROOF-18 |
| 16 | PRD-05 explicit seed | `PRD06-SEED-R3-C07` | Unbounded queues / tick storms | **PRD06-RISK-G** | PROOF-18/68/76 |
| 17 | PRD-05 explicit seed | `PRD06-SEED-R3-C08` | Task-lifetime/shutdown leakage | **PRD06-RISK-F** | PROOF-13/20/68 + PKG-I PROOF-07 |
| 18 | PRD-05 explicit seed | `PRD06-SEED-R3-C09` | Deterministic replay/order mismatch | **PRD06-RISK-E** | PROOF-21/68 |
| 19 | PRD-05 explicit seed | `PRD06-SEED-R3-C10` | Provider callback authority leakage | **PRD06-RISK-F** | PROOF-13/63/68 |
| 20 | PRD-05 explicit seed | `PRD06-SEED-R3-D01` | Partial multi-owner transaction | **PRD06-RISK-Q** | PROOF-04/17/63/76 |
| 21 | PRD-05 explicit seed | `PRD06-SEED-R3-D02` | Ambiguous canonical commit point | **PRD06-RISK-Q** | PROOF-63/76 |
| 22 | PRD-05 explicit seed | `PRD06-SEED-R3-D03` | Reservation leak/starvation | **PRD06-RISK-Q** | PROOF-17/76 |
| 23 | PRD-05 explicit seed | `PRD06-SEED-R3-D04` | Cancellation/rollback/compensation conflation | **PRD06-RISK-Q** | PROOF-04/17/63 |
| 24 | PRD-05 explicit seed | `PRD06-SEED-R3-D05` | Retry/reconnect duplicates | **PRD06-RISK-Q** | PROOF-63/76 + PKG-H reconnect proofs |
| 25 | PRD-05 explicit seed | `PRD06-SEED-R3-D06` | Provider failure after semantic commit | **PRD06-RISK-Q** | PROOF-33/63/76 + provider degradation proofs |
| 26 | PRD-05 explicit seed | `PRD06-SEED-R3-D07` | Persistence/network order divergence | **PRD06-RISK-Q** | PROOF-63/76 + PKG-H/I proofs |
| 27 | PRD-05 explicit seed | `PRD06-SEED-R3-D08` | Transaction trace gaps | **PRD06-RISK-Q** | PROOF-63/76 |
| 28 | PRD-05 explicit seed | `PRD06-SEED-R3-D09` | Universal coordinator bottleneck/deadlock | **PRD06-RISK-Q** | PROOF-17/18/76 |
| 29 | PRD-05 explicit seed | `PRD06-SEED-R3-D10` | Whole-stack hostile interaction failure | **PRD06-RISK-Q** | PROOF-76 final soak |
| 30 | PRD-05 explicit seed | `PRD06-SEED-R4-E01` | Direct provider voxel mutation bypass | **PRD06-RISK-E** | 23/24/67 |
| 31 | PRD-05 explicit seed | `PRD06-SEED-R4-E02` | Late generation overwrites committed edit | **PRD06-RISK-E** | 24 |
| 32 | PRD-05 explicit seed | `PRD06-SEED-R4-E03` | Readiness collapse into one loaded flag | **PRD06-RISK-H** | 25/26/34 |
| 33 | PRD-05 explicit seed | `PRD06-SEED-R4-E04` | Spatial invalidation explosion | **PRD06-RISK-H** | 23/26 |
| 34 | PRD-05 explicit seed | `PRD06-SEED-R4-E05` | Stale collision traversal | **PRD06-RISK-H** | 25 |
| 35 | PRD-05 explicit seed | `PRD06-SEED-R4-E06` | Stale navigation after destructive edit | **PRD06-RISK-H** | 26 |
| 36 | PRD-05 explicit seed | `PRD06-SEED-R4-E07` | SceneTree/render-mesh nav parsing stalls | **PRD06-RISK-H** | 26 |
| 37 | PRD-05 explicit seed | `PRD06-SEED-R4-E08` | Volumetric movement provider gap | **PRD06-RISK-H** | 26/67 |
| 38 | PRD-05 explicit seed | `PRD06-SEED-R4-F01` | Fluid conservation drift | **PRD06-RISK-I** | 27/28 |
| 39 | PRD-05 explicit seed | `PRD06-SEED-R4-F02` | Global-ocean active-cell explosion | **PRD06-RISK-I** | 28 |
| 40 | PRD-05 explicit seed | `PRD06-SEED-R4-F03` | Fluid/voxel boundary race | **PRD06-RISK-I** | 27/28/23 |
| 41 | PRD-05 explicit seed | `PRD06-SEED-R4-F04` | Fluid activation/demotion discontinuity | **PRD06-RISK-I** | 28 |
| 42 | PRD-05 explicit seed | `PRD06-SEED-R4-F05` | Renderer becomes fluid truth | **PRD06-RISK-I** | 27/28 |
| 43 | PRD-05 explicit seed | `PRD06-SEED-R4-G01` | Moving VoxelTerrain vessel shortcut | **PRD06-RISK-J** | 08/29/31 |
| 44 | PRD-05 explicit seed | `PRD06-SEED-R4-G02` | Hull collision rebuild cliff | **PRD06-RISK-J** | 29/31 |
| 45 | PRD-05 explicit seed | `PRD06-SEED-R4-G03` | Dynamic concave collider misuse | **PRD06-RISK-J** | 31 |
| 46 | PRD-05 explicit seed | `PRD06-SEED-R4-G04` | Mass/COM lag after cargo/damage/flood | **PRD06-RISK-J** | 29/32 |
| 47 | PRD-05 explicit seed | `PRD06-SEED-R4-G05` | Flooding/buoyancy decoupling | **PRD06-RISK-J** | 32 |
| 48 | PRD-05 explicit seed | `PRD06-SEED-R4-G06` | Occupant double-motion/frame error | **PRD06-RISK-J** | 30 |
| 49 | PRD-05 explicit seed | `PRD06-SEED-R4-G07` | Region crossing rewrites local hull identity | **PRD06-RISK-J** | 08 |
| 50 | PRD-05 explicit seed | `PRD06-SEED-R4-G08` | Boarding/local-nav discontinuity | **PRD06-RISK-J** | 30/26 |
| 51 | PRD-05 explicit seed | `PRD06-SEED-R4-X01` | Provider failure after semantic commit | **PRD06-RISK-H** | 34 |
| 52 | PRD-05 explicit seed | `PRD06-SEED-R5-H01` | SceneMultiplayer/RPC wire coupling becomes accidental permanent Leyforge protocol | **PRD06-RISK-K** | PROOF-36/45 |
| 53 | PRD-05 explicit seed | `PRD06-SEED-R5-H02` | Peer/NodePath/runtime identity leaks into persistent player/entity/world identity | **PRD06-RISK-K** | PROOF-42/45 |
| 54 | PRD-05 explicit seed | `PRD06-SEED-R5-H03` | Duplicate retry or lost acknowledgement duplicates a consequential operation | **PRD06-RISK-K** | PROOF-35/43 |
| 55 | PRD-05 explicit seed | `PRD06-SEED-R5-H04` | Delta applied to wrong world/content/region baseline | **PRD06-RISK-K** | PROOF-36/44 |
| 56 | PRD-05 explicit seed | `PRD06-SEED-R5-H05` | Bulk voxel transfer starves realtime authoritative control | **PRD06-RISK-K** | PROOF-37/46 |
| 57 | PRD-05 explicit seed | `PRD06-SEED-R5-H06` | Interest collapses into view distance and leaks hidden/remote state or overactivates simulation | **PRD06-RISK-K** | PROOF-37/38 |
| 58 | PRD-05 explicit seed | `PRD06-SEED-R5-H07` | Teleport/vessel/split-screen interest creates unbounded work | **PRD06-RISK-K** | PROOF-37/38 |
| 59 | PRD-05 explicit seed | `PRD06-SEED-R5-H08` | Reconnect creates duplicate character or repeats pending transaction | **PRD06-RISK-K** | PROOF-35/42/43/45 |
| 60 | PRD-05 explicit seed | `PRD06-SEED-R5-H09` | Packet ACK is mistaken for canonical/durable commit | **PRD06-RISK-K** | PROOF-35/43 + PKG-I crash proofs |
| 61 | PRD-05 explicit seed | `PRD06-SEED-R5-H10` | Unbounded decode/decompression or semantic request cost becomes server abuse vector | **PRD06-RISK-K** | PROOF-37/46 |
| 62 | PRD-05 explicit seed | `PRD06-SEED-R5-I01` | Async voxel/provider save is reported as whole-world save before durability boundary | **PRD06-RISK-D** | PROOF-39/41/47 |
| 63 | PRD-05 explicit seed | `PRD06-SEED-R5-I02` | Independently latest DB/voxel/file artifacts are mixed after crash | **PRD06-RISK-D** | PROOF-39/40/69 |
| 64 | PRD-05 explicit seed | `PRD06-SEED-R5-I03` | Old async work writes into reopened/replaced world session | **PRD06-RISK-D** | PROOF-07/20/69 |
| 65 | PRD-05 explicit seed | `PRD06-SEED-R5-I04` | Provider write order silently becomes canonical transaction history | **PRD06-RISK-D** | PROOF-39/69 |
| 66 | PRD-05 explicit seed | `PRD06-SEED-R5-I05` | Persistence queue/backpressure grows without bound under construction/fluid/vessel load | **PRD06-RISK-D** | PROOF-41/47 |
| 67 | PRD-05 explicit seed | `PRD06-SEED-R5-I06` | Migration destroys only known-good checkpoint or reinterprets missing semantic IDs | **PRD06-RISK-D** | PROOF-40/57/58 |
| 68 | PRD-05 explicit seed | `PRD06-SEED-R5-I07` | Generator/provider format upgrades invalidate old edited regions without governed migration | **PRD06-RISK-D** | PROOF-58/69 |
| 69 | PRD-05 explicit seed | `PRD06-SEED-R5-I08` | Live backup copies mutually inconsistent files | **PRD06-RISK-D** | PROOF-48/69 |
| 70 | PRD-05 explicit seed | `PRD06-SEED-R5-I09` | SQLite/voxel-store technology choice becomes semantic schema authority | **PRD06-RISK-D** | PROOF-39/58 |
| 71 | PRD-05 explicit seed | `PRD06-SEED-R5-I10` | Shutdown disconnect/provider close occurs before durable drain and leaks incomplete operations | **PRD06-RISK-D** | PROOF-20/69 |
| 72 | PRD-05 explicit seed | `PRD06-SEED-R6-J01` | Godot path/ResourceUID/provider model ID leaks into durable semantic identity | **PRD06-RISK-C** | PROOF-49/52/54 |
| 73 | PRD-05 explicit seed | `PRD06-SEED-R6-J02` | Forge source and generated runtime products become co-editable competing authorities | **PRD06-RISK-N** | PROOF-49/62 |
| 74 | PRD-05 explicit seed | `PRD06-SEED-R6-J03` | AI asset generation bypasses human source validation/provenance rules | **PRD06-RISK-N** | PROOF-51/62 |
| 75 | PRD-05 explicit seed | `PRD06-SEED-R6-J04` | Generated material×form families explode registry/material/shader/icon/runtime budgets | **PRD06-RISK-N** | PROOF-52/56 |
| 76 | PRD-05 explicit seed | `PRD06-SEED-R6-J05` | Player-safe data pack smuggles executable/native/editor content | **PRD06-RISK-M** | PROOF-55 |
| 77 | PRD-05 explicit seed | `PRD06-SEED-R6-J06` | Declarative mod is still able to exhaust memory/CPU/disk through pathological data | **PRD06-RISK-M** | PROOF-56 |
| 78 | PRD-05 explicit seed | `PRD06-SEED-R6-J07` | Client/server pack split accidentally removes authoritative data or changes manifest meaning | **PRD06-RISK-M** | PROOF-54/62 |
| 79 | PRD-05 explicit seed | `PRD06-SEED-R6-J08` | External import retains unsafe URI/path/licensing ambiguity into runtime package | **PRD06-RISK-M** | PROOF-55/62 |
| 80 | PRD-05 explicit seed | `PRD06-SEED-R6-J09` | Theoretical ART lock is mistaken for golden-bootstrap or mass-production qualification | **PRD06-RISK-N** | PROOF-50/62 |
| 81 | PRD-05 explicit seed | `PRD06-SEED-R6-J10` | Hot reload or pack update mutates persistent semantic identity without migration | **PRD06-RISK-C** | PROOF-49 + PROOF-58 |
| 82 | PRD-05 explicit seed | `PRD06-SEED-R6-K01` | Graphics preset changes simulation/world truth under a performance label | **PRD06-RISK-O** | PROOF-59 |
| 83 | PRD-05 explicit seed | `PRD06-SEED-R6-K02` | Critical state exists only in colour, VFX, motion or audio and disappears under accessibility/reduced-effects modes | **PRD06-RISK-O** | PROOF-53/61 |
| 84 | PRD-05 explicit seed | `PRD06-SEED-R6-K03` | Claimed renderer fallback technically launches but changes semantic readability | **PRD06-RISK-O** | PROOF-53/71 |
| 85 | PRD-05 explicit seed | `PRD06-SEED-R6-K04` | Invalid graphics configuration strands player before settings UI can load | **PRD06-RISK-O** | PROOF-60 |
| 86 | PRD-05 explicit seed | `PRD06-SEED-R6-K05` | Runtime input remap is lost/reinterpreted or collides with network command semantics | **PRD06-RISK-O** | PROOF-59/61 |
| 87 | PRD-05 explicit seed | `PRD06-SEED-R6-K06` | UI scale/resolution changes cause clipping/focus traps/localisation failure | **PRD06-RISK-O** | PROOF-61/71 |
| 88 | PRD-05 explicit seed | `PRD06-SEED-R6-K07` | Split-screen multiplies presentation cost or applies one player's settings to another viewer | **PRD06-RISK-O** | PROOF-59/71 |
| 89 | PRD-05 explicit seed | `PRD06-SEED-R6-K08` | 3D cartography leaks unknown engine terrain/objects or lacks accessible equivalent | **PRD06-RISK-O** | PROOF-53/61/71 |
| 90 | PRD-05 explicit seed | `PRD06-SEED-R6-K09` | Modded/third-party content bypasses accessibility/profile certification | **PRD06-RISK-O** | PROOF-53/56/61 |
| 91 | PRD-05 explicit seed | `PRD06-SEED-R6-K10` | Auto-detected hardware defaults become immutable policy or poor safe-mode fallback | **PRD06-RISK-O** | PROOF-60/71 |
| 92 | PRD-05 Round 7 | `R7-P01` | Build identity drift | **PRD06-RISK-P** | PROOF-70/73 |
| 93 | PRD-05 Round 7 | `R7-P02` | Dependency upgrade regression | **PRD06-RISK-P** | PROOF-72 |
| 94 | PRD-05 Round 7 | `R7-P03` | Local-patch orphaning | **PRD06-RISK-P** | PROOF-73 |
| 95 | PRD-05 Round 7 | `R7-P04` | Symbol loss | **PRD06-RISK-P** | PROOF-66 |
| 96 | PRD-05 Round 7 | `R7-P05` | Support-bundle leakage | **PRD06-RISK-P** | PROOF-65 |
| 97 | PRD-05 Round 7 | `R7-P06` | Diagnostic misclassification | **PRD06-RISK-P** | PROOF-64 |
| 98 | PRD-05 Round 7 | `R7-P07` | Observability self-load | **PRD06-RISK-P** | PROOF-75 |
| 99 | PRD-05 Round 7 | `R7-P08` | False qualification | **PRD06-RISK-P** | PROOF-70/71 |
| 100 | PRD-05 Round 7 | `R7-P09` | Artifact divergence | **PRD06-RISK-L** | PROOF-54/70 |
| 101 | PRD-05 Round 7 | `R7-P10` | Benchmark ambiguity | **PRD06-RISK-P** | PROOF-71/75 |
| 102 | PRD-05 Round 8 | `R8-A` | Historical POC dependence leaks into shipping worldgen/content | **PRD06-RISK-R** | validator scans + FIXTURE-07/09 |
| 103 | PRD-05 Round 8 | `R8-B` | Old tests copied literally | **PRD06-RISK-R** | POC-test translation register |
| 104 | PRD-05 Round 8 | `R8-C` | Reference lesson mistaken for built-in provider capability | **PRD06-RISK-R** | evidence-class enforcement |
| 105 | PRD-05 Round 8 | `R8-D` | FCC-13E migration semantics implemented incorrectly | **PRD06-RISK-R** | 312-row migration conformance fixture |
| 106 | PRD-05 Round 8 | `R8-E` | Compatibility namespace leaks into normal content | **PRD06-RISK-R** | compatibility-isolation tests |
| 107 | PRD-05 Round 8 | `R8-F` | Historical benchmark numbers become current budgets | **PRD06-RISK-R** | fresh PRD-07 benchmark specs |
| 108 | PRD-05 Round 8 | `R8-G` | Unsupported old-save rows guessed into new identities | **PRD06-RISK-R** | fail/quarantine + preserve source |
| 109 | PRD-05 Round 8 | `R8-H` | POC-only exact object confused with preserved capability | **PRD06-RISK-R** | capability-vs-content acceptance tests |

---

# 11. Seed Intake Accounting

| Primary family | Detailed seed inputs |
|---|---:|
| PRD06-RISK-A | 4 |
| PRD06-RISK-B | 1 |
| PRD06-RISK-C | 4 |
| PRD06-RISK-D | 10 |
| PRD06-RISK-E | 3 |
| PRD06-RISK-F | 7 |
| PRD06-RISK-G | 2 |
| PRD06-RISK-H | 7 |
| PRD06-RISK-I | 5 |
| PRD06-RISK-J | 8 |
| PRD06-RISK-K | 10 |
| PRD06-RISK-L | 2 |
| PRD06-RISK-M | 4 |
| PRD06-RISK-N | 4 |
| PRD06-RISK-O | 10 |
| PRD06-RISK-P | 9 |
| PRD06-RISK-Q | 11 |
| PRD06-RISK-R | 8 |
| **TOTAL** | **109** |

A seed count is **not** a severity score. Some families have fewer but more consequential risks; others have many variations of the same underlying failure class.

---

# 12. Stable 76-Proof Preservation Gate

PRD-06 does not renumber or replace the 76 PRD-04 proof obligations. It assigns risk reasons to them.

| Proof ID | Proof name | Primary risk family consumers | Result state |
|---|---|---|---|
| **PRD04-PROOF-01** | Projection destruction/rebuild | PRD06-RISK-C | **NO CURRENT RESULT — PRD-07/08 FUTURE** |
| **PRD04-PROOF-02** | Runtime-ID randomization | PRD06-RISK-C, PRD06-RISK-R | **NO CURRENT RESULT — PRD-07/08 FUTURE** |
| **PRD04-PROOF-03** | Provider swap | PRD06-RISK-B, PRD06-RISK-C | **NO CURRENT RESULT — PRD-07/08 FUTURE** |
| **PRD04-PROOF-12** | Projection Eviction | PRD06-RISK-C | **NO CURRENT RESULT — PRD-07/08 FUTURE** |
| **PRD04-PROOF-22** | Read-Model Rebuild | PRD06-RISK-C | **NO CURRENT RESULT — PRD-07/08 FUTURE** |
| **PRD04-PROOF-74** | Architecture Dependency Lint | PRD06-RISK-C, PRD06-RISK-R | **NO CURRENT RESULT — PRD-07/08 FUTURE** |
| **PRD04-PROOF-05** | Extreme Coordinate Walk | PRD06-RISK-A | **NO CURRENT RESULT — PRD-07/08 FUTURE** |
| **PRD04-PROOF-06** | Origin Rebase Torture | PRD06-RISK-A | **NO CURRENT RESULT — PRD-07/08 FUTURE** |
| **PRD04-PROOF-09** | Realm Transition Transaction | PRD06-RISK-A | **NO CURRENT RESULT — PRD-07/08 FUTURE** |
| **PRD04-PROOF-10** | Single Player → Listen Host | PRD06-RISK-A, PRD06-RISK-L | **NO CURRENT RESULT — PRD-07/08 FUTURE** |
| **PRD04-PROOF-11** | Headless WorldSession | PRD06-RISK-A, PRD06-RISK-B, PRD06-RISK-L | **NO CURRENT RESULT — PRD-07/08 FUTURE** |
| **PRD04-PROOF-13** | Stale Worker Commit | PRD06-RISK-F | **NO CURRENT RESULT — PRD-07/08 FUTURE** |
| **PRD04-PROOF-14** | Partition Ownership Transfer | PRD06-RISK-F | **NO CURRENT RESULT — PRD-07/08 FUTURE** |
| **PRD04-PROOF-15** | SceneTree-Free Distant Simulation | PRD06-RISK-F | **NO CURRENT RESULT — PRD-07/08 FUTURE** |
| **PRD04-PROOF-16** | Fidelity Promotion/Demotion | PRD06-RISK-F | **NO CURRENT RESULT — PRD-07/08 FUTURE** |
| **PRD04-PROOF-18** | Cross-Provider CPU Saturation | PRD06-RISK-G | **NO CURRENT RESULT — PRD-07/08 FUTURE** |
| **PRD04-PROOF-19** | Main-Thread Independence | PRD06-RISK-F | **NO CURRENT RESULT — PRD-07/08 FUTURE** |
| **PRD04-PROOF-21** | Deterministic Seeded Simulation | PRD06-RISK-E, PRD06-RISK-F | **NO CURRENT RESULT — PRD-07/08 FUTURE** |
| **PRD04-PROOF-68** | Worker-Order Chaos | PRD06-RISK-E, PRD06-RISK-F | **NO CURRENT RESULT — PRD-07/08 FUTURE** |
| **PRD04-PROOF-04** | Cross-boundary transaction | PRD06-RISK-Q | **NO CURRENT RESULT — PRD-07/08 FUTURE** |
| **PRD04-PROOF-17** | Cross-Domain Construction Transaction | PRD06-RISK-Q | **NO CURRENT RESULT — PRD-07/08 FUTURE** |
| **PRD04-PROOF-33** | Structure Collapse Transaction | PRD06-RISK-Q | **NO CURRENT RESULT — PRD-07/08 FUTURE** |
| **PRD04-PROOF-63** | End-to-End Transaction Trace | PRD06-RISK-Q | **NO CURRENT RESULT — PRD-07/08 FUTURE** |
| **PRD04-PROOF-76** | Whole-Stack Hostile Transaction Soak | PRD06-RISK-G, PRD06-RISK-Q | **NO CURRENT RESULT — PRD-07/08 FUTURE** |
| **PRD04-PROOF-23** | One-Block Spatial Fan-Out | PRD06-RISK-E, PRD06-RISK-H | **NO CURRENT RESULT — PRD-07/08 FUTURE** |
| **PRD04-PROOF-24** | Late Generation vs Edit | PRD06-RISK-E | **NO CURRENT RESULT — PRD-07/08 FUTURE** |
| **PRD04-PROOF-25** | Collision Revision Quarantine | PRD06-RISK-H | **NO CURRENT RESULT — PRD-07/08 FUTURE** |
| **PRD04-PROOF-26** | Nav Dirty Bridge | PRD06-RISK-H | **NO CURRENT RESULT — PRD-07/08 FUTURE** |
| **PRD04-PROOF-34** | Provider Failure Degradation | PRD06-RISK-H | **NO CURRENT RESULT — PRD-07/08 FUTURE** |
| **PRD04-PROOF-67** | Provider Conformance Matrix | PRD06-RISK-B, PRD06-RISK-H | **NO CURRENT RESULT — PRD-07/08 FUTURE** |
| **PRD04-PROOF-27** | Fluid Boundary Breach | PRD06-RISK-I | **NO CURRENT RESULT — PRD-07/08 FUTURE** |
| **PRD04-PROOF-28** | Ocean / Local Fluid Boundary | PRD06-RISK-I | **NO CURRENT RESULT — PRD-07/08 FUTURE** |
| **PRD04-PROOF-08** | Vessel Region Crossing | PRD06-RISK-J | **NO CURRENT RESULT — PRD-07/08 FUTURE** |
| **PRD04-PROOF-29** | Vessel Hull Edit Underway | PRD06-RISK-J | **NO CURRENT RESULT — PRD-07/08 FUTURE** |
| **PRD04-PROOF-30** | Moving Vessel Occupants | PRD06-RISK-J | **NO CURRENT RESULT — PRD-07/08 FUTURE** |
| **PRD04-PROOF-31** | Vessel Collision Strategy Matrix | PRD06-RISK-J | **NO CURRENT RESULT — PRD-07/08 FUTURE** |
| **PRD04-PROOF-32** | Vessel Flooding / Buoyancy | PRD06-RISK-I, PRD06-RISK-J | **NO CURRENT RESULT — PRD-07/08 FUTURE** |
| **PRD04-PROOF-35** | Duplicate Command / Lost Ack | PRD06-RISK-K | **NO CURRENT RESULT — PRD-07/08 FUTURE** |
| **PRD04-PROOF-36** | Protocol Baseline Mismatch | PRD06-RISK-K | **NO CURRENT RESULT — PRD-07/08 FUTURE** |
| **PRD04-PROOF-37** | Teleport Interest Spike | PRD06-RISK-G, PRD06-RISK-K | **NO CURRENT RESULT — PRD-07/08 FUTURE** |
| **PRD04-PROOF-38** | Cross-Domain Interest | PRD06-RISK-K | **NO CURRENT RESULT — PRD-07/08 FUTURE** |
| **PRD04-PROOF-42** | Reconnect During Realm Transition | PRD06-RISK-K | **NO CURRENT RESULT — PRD-07/08 FUTURE** |
| **PRD04-PROOF-43** | Reconnect During Inventory Transaction | PRD06-RISK-K | **NO CURRENT RESULT — PRD-07/08 FUTURE** |
| **PRD04-PROOF-44** | Client Cache Poison | PRD06-RISK-K | **NO CURRENT RESULT — PRD-07/08 FUTURE** |
| **PRD04-PROOF-45** | Server Restart Resume | PRD06-RISK-K | **NO CURRENT RESULT — PRD-07/08 FUTURE** |
| **PRD04-PROOF-46** | Network Backpressure | PRD06-RISK-G, PRD06-RISK-K | **NO CURRENT RESULT — PRD-07/08 FUTURE** |
| **PRD04-PROOF-07** | World Close/Reopen Stale Task | PRD06-RISK-D | **NO CURRENT RESULT — PRD-07/08 FUTURE** |
| **PRD04-PROOF-20** | Shutdown Drain Matrix | PRD06-RISK-D | **NO CURRENT RESULT — PRD-07/08 FUTURE** |
| **PRD04-PROOF-39** | Cross-Store Crash Matrix | PRD06-RISK-D | **NO CURRENT RESULT — PRD-07/08 FUTURE** |
| **PRD04-PROOF-40** | Corrupt Latest Checkpoint | PRD06-RISK-D | **NO CURRENT RESULT — PRD-07/08 FUTURE** |
| **PRD04-PROOF-41** | Save During Heavy Edits | PRD06-RISK-D | **NO CURRENT RESULT — PRD-07/08 FUTURE** |
| **PRD04-PROOF-47** | Persistence Backpressure | PRD06-RISK-D, PRD06-RISK-G | **NO CURRENT RESULT — PRD-07/08 FUTURE** |
| **PRD04-PROOF-48** | World Copy / Backup | PRD06-RISK-D | **NO CURRENT RESULT — PRD-07/08 FUTURE** |
| **PRD04-PROOF-57** | Missing Pack World Recovery | PRD06-RISK-C, PRD06-RISK-D, PRD06-RISK-M, PRD06-RISK-R | **NO CURRENT RESULT — PRD-07/08 FUTURE** |
| **PRD04-PROOF-58** | Pack Upgrade / World Migration | PRD06-RISK-C, PRD06-RISK-D, PRD06-RISK-M, PRD06-RISK-R | **NO CURRENT RESULT — PRD-07/08 FUTURE** |
| **PRD04-PROOF-69** | Real Process Crash Recovery | PRD06-RISK-D | **NO CURRENT RESULT — PRD-07/08 FUTURE** |
| **PRD04-PROOF-49** | Source → Bake Reproducibility | PRD06-RISK-C, PRD06-RISK-N, PRD06-RISK-R | **NO CURRENT RESULT — PRD-07/08 FUTURE** |
| **PRD04-PROOF-50** | Art Production Handoff Fixture | PRD06-RISK-N | **NO CURRENT RESULT — PRD-07/08 FUTURE** |
| **PRD04-PROOF-51** | AI vs Human Source Parity | PRD06-RISK-N | **NO CURRENT RESULT — PRD-07/08 FUTURE** |
| **PRD04-PROOF-52** | Generated Form Explosion | PRD06-RISK-C, PRD06-RISK-N | **NO CURRENT RESULT — PRD-07/08 FUTURE** |
| **PRD04-PROOF-54** | Server/Client Pack Split | PRD06-RISK-L, PRD06-RISK-M | **NO CURRENT RESULT — PRD-07/08 FUTURE** |
| **PRD04-PROOF-55** | Safe Mod Smuggling | PRD06-RISK-M | **NO CURRENT RESULT — PRD-07/08 FUTURE** |
| **PRD04-PROOF-56** | Data Mod Resource Bomb | PRD06-RISK-M | **NO CURRENT RESULT — PRD-07/08 FUTURE** |
| **PRD04-PROOF-62** | Forge CI Build | PRD06-RISK-M, PRD06-RISK-N, PRD06-RISK-R | **NO CURRENT RESULT — PRD-07/08 FUTURE** |
| **PRD04-PROOF-53** | Renderer/Profile Certification | PRD06-RISK-O | **NO CURRENT RESULT — PRD-07/08 FUTURE** |
| **PRD04-PROOF-59** | Settings Scope Isolation | PRD06-RISK-O | **NO CURRENT RESULT — PRD-07/08 FUTURE** |
| **PRD04-PROOF-60** | Safe Graphics Recovery | PRD06-RISK-O | **NO CURRENT RESULT — PRD-07/08 FUTURE** |
| **PRD04-PROOF-61** | Accessibility Semantic Torture | PRD06-RISK-O | **NO CURRENT RESULT — PRD-07/08 FUTURE** |
| **PRD04-PROOF-71** | Renderer / Hardware Lane | PRD06-RISK-O | **NO CURRENT RESULT — PRD-07/08 FUTURE** |
| **PRD04-PROOF-64** | Stale Work Diagnostic Classification | PRD06-RISK-P | **NO CURRENT RESULT — PRD-07/08 FUTURE** |
| **PRD04-PROOF-65** | Support Bundle Redaction | PRD06-RISK-P | **NO CURRENT RESULT — PRD-07/08 FUTURE** |
| **PRD04-PROOF-66** | Release Crash Symbolication | PRD06-RISK-P | **NO CURRENT RESULT — PRD-07/08 FUTURE** |
| **PRD04-PROOF-70** | Exported Artifact Matrix | PRD06-RISK-B, PRD06-RISK-L, PRD06-RISK-P | **NO CURRENT RESULT — PRD-07/08 FUTURE** |
| **PRD04-PROOF-72** | Dependency Upgrade Fixture | PRD06-RISK-B, PRD06-RISK-P, PRD06-RISK-R | **NO CURRENT RESULT — PRD-07/08 FUTURE** |
| **PRD04-PROOF-73** | Local Patch Reproducibility | PRD06-RISK-B, PRD06-RISK-P | **NO CURRENT RESULT — PRD-07/08 FUTURE** |
| **PRD04-PROOF-75** | Observability Overhead | PRD06-RISK-G, PRD06-RISK-P | **NO CURRENT RESULT — PRD-07/08 FUTURE** |

Proof coverage: **76 / 76** stable proof IDs have at least one Round-1 risk-family consumer.

---

# 13. Shared PRD-07 Fixture Routing

| Fixture | Purpose | Risk families consuming it |
|---|---|---|
| **FIXTURE-01** | Canonical WorldSession + registry + coordinate/frame harness | PRD06-RISK-A, PRD06-RISK-B, PRD06-RISK-C, PRD06-RISK-L, PRD06-RISK-R |
| **FIXTURE-02** | Voxel edit / SpatialChangeSet / collision / navigation harness | PRD06-RISK-E, PRD06-RISK-H, PRD06-RISK-I, PRD06-RISK-Q |
| **FIXTURE-03** | Partitioned simulation + worker/revision chaos harness | PRD06-RISK-E, PRD06-RISK-F, PRD06-RISK-G, PRD06-RISK-Q |
| **FIXTURE-04** | Checkpoint / DB / voxel-store crash harness | PRD06-RISK-C, PRD06-RISK-D, PRD06-RISK-Q, PRD06-RISK-R |
| **FIXTURE-05** | Authoritative server / reconnect / bulk-interest harness | PRD06-RISK-A, PRD06-RISK-G, PRD06-RISK-K, PRD06-RISK-L, PRD06-RISK-Q |
| **FIXTURE-06** | Editable vessel / local frame / collision / flooding harness | PRD06-RISK-A, PRD06-RISK-I, PRD06-RISK-J, PRD06-RISK-Q |
| **FIXTURE-07** | Forge pack / generated-form / safe-mod / Art-Handoff fixture | PRD06-RISK-C, PRD06-RISK-M, PRD06-RISK-N, PRD06-RISK-R |
| **FIXTURE-08** | Renderer / accessibility / settings-profile fixture | PRD06-RISK-N, PRD06-RISK-O |
| **FIXTURE-09** | Build / exported artifact / support / dependency fixture | PRD06-RISK-A, PRD06-RISK-B, PRD06-RISK-L, PRD06-RISK-M, PRD06-RISK-N, PRD06-RISK-O, PRD06-RISK-P, PRD06-RISK-R |
| **FIXTURE-10** | Combined hostile-world soak | PRD06-RISK-D, PRD06-RISK-E, PRD06-RISK-F, PRD06-RISK-G, PRD06-RISK-H, PRD06-RISK-I, PRD06-RISK-J, PRD06-RISK-K, PRD06-RISK-P, PRD06-RISK-Q |

This remains a topology only. PRD-07 owns the exact harness implementation, build matrix, load levels, failure injection, thresholds and execution sequence.

---

# 14. Risk-to-Proof Semantics

PRD-06 distinguishes four outcomes that are often confused:

```text
Architecture control exists
        ↓
Risk exposure may be reduced
        ↓
Proof still required
        ↓
Observed evidence arrives in PRD-08
        ↓
Risk is closed / mitigated / accepted / escalated
```

Therefore:

- A good boundary can **mitigate** a risk without proving the implementation.
- A passed prototype can reduce a risk without automatically granting P5 production qualification.
- A failed proof does not automatically invalidate canon; it may invalidate a candidate implementation or expose a genuine architecture delta.
- A risk can remain open even when a proof passes if residual scale/security/support limitations remain.

---

# 15. Open-Unknown Promotion Policy

PRD-05 closed with **137 open-routed unknowns**. PRD-06 does not blindly turn all 137 into technical risks.

An unknown is promoted into a PRD-06 detailed risk only when at least one condition holds:

1. an incorrect answer could corrupt canonical state or persistence;
2. the choice can materially alter performance/scalability or provider viability;
3. the choice changes security/trust boundaries;
4. the choice changes protocol/save/content compatibility;
5. the choice can make an intended platform/build/renderer/headless lane infeasible;
6. the choice requires empirical comparison before a consequential ADR;
7. failure would force major architecture rework after rebuild begins.

Design/balance/content unknowns remain with their owning specialist authority unless they meet one of those technical-risk conditions.

Round 8 will mechanically audit all 137 against this promotion rule.

---

# 16. Initial P0 Risk Set

Round 1 identifies the following **proof-blocking P0 families**. This is not an execution order yet; Round 9 will reconcile dependencies and sequencing.

- **PRD06-RISK-A — Large-coordinate / precision / origin-frame strategy**
- **PRD06-RISK-B — Zylann Module vs GDExtension parity**
- **PRD06-RISK-C — Semantic runtime palette / migration**
- **PRD06-RISK-D — Async voxel persistence + coherent checkpoint**
- **PRD06-RISK-E — Deterministic worldgen / late-generation overwrite**
- **PRD06-RISK-F — Simulation ownership / worker scaling**
- **PRD06-RISK-G — Cross-provider CPU saturation / backpressure**
- **PRD06-RISK-H — Dynamic voxel navigation / derived readiness after edits**
- **PRD06-RISK-J — Moving editable vessel collision / mass / flooding**
- **PRD06-RISK-K — Authoritative voxel/entity networking and reconnect**
- **PRD06-RISK-L — Headless dedicated-server parity**
- **PRD06-RISK-M — Content-pack / safe-mod sandbox boundary**
- **PRD06-RISK-P — Dependency/build reproducibility and observability**
- **PRD06-RISK-Q — Cross-domain transaction atomicity and conservation**

P1 families remain major qualification obligations and are not optional.

---

# 17. Cross-Risk Dependency Spine

The risk families are not independent. Round 1 preserves these important dependency chains:

```text
C semantic identity
 ├──► D persistence/migration
 ├──► K networking/reconnect
 ├──► M content packs
 └──► R legacy migration

A coordinates/frames
 ├──► H spatial derived providers
 ├──► J vessels
 ├──► K networking
 └──► L headless/runtime parity

F ownership/concurrency
 ├──► G saturation/backpressure
 └──► Q cross-domain transactions

E voxel edit/generation
 ├──► H collision/navigation readiness
 ├──► I fluid topology
 └──► J vessel hull edits

Q transaction integrity
 ├──► D crash durability
 └──► K retry/reconnect semantics

M/N/O/P production risks
 └──► exported-build and release qualification

ALL
 └──► PROOF-76 Whole-Stack Hostile Transaction Soak
```

This dependency spine will later prevent a low-level proof from being treated as sufficient when a higher-level common-cause risk remains.

---

# 18. Historical Evidence Boundary

Historical POC and reference evidence may:

- justify plausibility of a failure class;
- supply regression invariants;
- seed migration/compatibility cases;
- inform fixture design;
- demonstrate that a capability existed in the historical implementation.

It may not:

- reduce residual risk for the clean rebuild without current evidence;
- close a PRD06-RISK family by itself;
- populate PRD-08 current proof results;
- resurrect Summer/Unreal/provider-specific implementation authority.

`PRD06-RISK-R` exists specifically to keep this boundary operational rather than merely documentary.

---

# 19. Round-1 Integrity Checks

| Check | Result |
|---|---|
| PRD-05 source hash reverified | **PASS** |
| PRD-04 source hash reverified | **PASS** |
| PRD-01 source hash reverified | **PASS** |
| Original PRD-04 umbrella risks preserved | **PASS — 16/16** |
| PRD-06 extension families explicitly labelled | **PASS — Q/R only** |
| Detailed PRD-05 seed refinements ingested | **PASS — 109** |
| Explicit PRD06-SEED IDs preserved | **PASS — 82/82** |
| Round-2 candidate labels preserved | **PASS — 9/9** |
| Round-7 risk families preserved | **PASS — 10/10** |
| Round-8 historical themes preserved | **PASS — 8/8** |
| Stable PRD-04 proofs represented | **PASS — 76/76** |
| Shared PRD-07 fixtures represented | **PASS — 10/10** |
| Current proof results created | **PASS — 0** |
| Implementation ADRs created | **PASS — 0** |
| PRD-04 architecture reopen candidates | **PASS — 0** |

---

# 20. Round-1 Closure Verdict

> **ROUND 1 PASS — RISK CONSTITUTION AND SOURCE INTAKE COMPLETE.**

PRD-06 now has:

- a stable risk vocabulary and record schema;
- **18** primary risk families, preserving all original A–P umbrellas and adding only the explicitly justified Q/R extensions;
- **109** detailed source risk refinements routed without losing lineage;
- initial severity, unmitigated plausibility and priority classifications;
- **76 / 76** proof obligations attached to risk-family consumers;
- **10 / 10** shared fixture families retained;
- explicit risk/proof/ADR non-promotion rules;
- a controlled method for promoting technically consequential open unknowns.

There is **no Round-1 blocker requiring PRD-04 or PRD-05 reopening**.

The next work is **Round 2 — Identity / Coordinates / Provider Edition / Headless**, where families **A, B, C and L** will be decomposed into stable detailed risk records with explicit triggers, controls, proof exit criteria, ADR dependencies and residual-risk questions.

---

# 21. Machine-Readable Round-1 Summary

```yaml
document: PRD-06
version: v0.1
round: 1
status: WORKING
round_status: PASS
source:
  prd05_sha256: 30af0861a801158459820d1756fb49cdf223015b682de8df5f7acbb89add766e
  prd04_sha256: 747c6681d521dc0483e9b8c1c622bb705aa3fbaff7f2a9b494965835f191e2b4
  prd01_sha256: 51e671f38a50ad070cd60dbbc29273fac79b17ed37eae009b0cd25e20094c534
risk_families:
  original_prd04: 16
  prd06_extensions: 2
  total: 18
seed_intake:
  round2_candidates: 9
  explicit_prd06_seed_ids: 82
  round7_refinements: 10
  round8_refinements: 8
  total_detailed_refinements: 109
proofs:
  stable_total: 76
  represented: 76
  current_results: 0
fixtures:
  shared_total: 10
  represented: 10
open_unknowns_from_prd05: 137
architecture_reopen_candidates: 0
new_implementation_adrs: 0
next_round: Identity / Coordinates / Provider Edition / Headless
```

---

**End of PRD-06 v0.1 — Round 1 Working Baseline**

---

# 22. Round-2 Scope and Controlled Technology Refresh

Round 2 decomposes **PRD06-RISK-A, B, C and L** into stable child risks. It does not execute PRD-07 prototypes and does not accept implementation ADRs.

The provider facts that materially affect this risk pass were refreshed on **5 September 2026** against current official/upstream sources. The refresh is evidence only; it does not change canon or PRD-04 architecture authority.

| Current technology fact | Risk consequence |
|---|---|
| Godot **4.7.2-stable** remains the current stable line; the archive still lists 4.8 as **dev4**. | Keep 4.7.2 as the controlled discovery/proof baseline until a later stable release enters via dependency-delta procedure. |
| Godot large-world coordinates require rebuilding the editor/export templates with `precision=double`; they add memory/performance cost. Godot also warns multiplayer should use the same precision build type, and GDExtensions must be rebuilt for double precision. | Directly strengthens A02/A03/A09 and B08; precision is inseparable from build/export/native-extension qualification. |
| Godot documents origin shifting as a single-precision alternative with extra game-logic complexity, especially in multiplayer. | Strengthens A05/A06; rebase remains a comparative candidate, not a default. |
| Godot supports real dedicated-server/headless exports and can strip visual resources. | Strengthens L01/L02/L07: headless is viable, but semantic data must not be hidden in presentation resources and real exported artifacts must be tested. |
| Voxel Tools still documents Module and GDExtension as broadly similar but not identical; GDExtension is newer/less tested and currently omits `FastNoise2`. Current 1.7 releases pair a Module build with Godot 4.7.2 and publish a GDExtension package for Godot 4.5+. | Strengthens B01–B08; neither edition can be selected by convenience alone. |
| Voxel Tools 1.7 release notes still state double builds are available for the Module but double export templates are not supplied in that release package. | Strengthens A09/B08/L08 custom-build and exported-artifact risk. |

**Source register for this refresh:** Godot 4.7.2 archive/maintenance release; Godot large-world coordinates; Godot dedicated-server export documentation; Voxel Tools `getting_the_module.md`; Voxel Tools 1.7 release page.


# 23. Round-2 Child-Risk Register

Round 2 creates **38 stable child-risk IDs**. The parent A/B/C/L families remain unchanged and continue to aggregate their children. Child IDs are never renumbered or repurposed.

| Child range | Parent | Count | Primary focus |
|---|---|---:|---|
| `PRD06-RISK-A01..A09` | A | 9 | precision, canonical↔engine mapping, rebasing, frames, scale, double-build burden |
| `PRD06-RISK-B01..B09` | B | 9 | Module/GDExtension capability, stability, ABI, export, headless, performance and abstraction parity |
| `PRD06-RISK-C01..C12` | C | 12 | runtime handles/palettes, projection lifecycle, caches, provider swap, packs, generated forms and migration |
| `PRD06-RISK-L01..L08` | L | 8 | headless authority, stripping, provider viability, runtime-mode parity, lifecycle and exported build matrix |
| **TOTAL** |  | **38** |  |

## 23.1 Priority summary

| ID | Title | Severity | Plausibility | Priority | Primary proof route |
|---|---|---|---|---|---|
| **PRD06-RISK-A01** | Insufficient standard-precision active-frame envelope | **CRITICAL** | **POSSIBLE** | **P0** | PROOF-05; FIXTURE-01 + FIXTURE-09 |
| **PRD06-RISK-A02** | Double-precision performance / memory / platform penalty | **HIGH** | **POSSIBLE** | **P0** | PROOF-05/11/70/71; FIXTURE-01 + FIXTURE-09 |
| **PRD06-RISK-A03** | Precision-build incompatibility across multiplayer and native extensions | **CRITICAL** | **POSSIBLE** | **P0** | PROOF-10/11/70/72; FIXTURE-05 + FIXTURE-09 |
| **PRD06-RISK-A04** | Canonical-to-engine projection overflow / normalization error | **CRITICAL** | **POSSIBLE** | **P0** | PROOF-05; FIXTURE-01 |
| **PRD06-RISK-A05** | Cross-provider origin-rebase incoherence | **CRITICAL** | **POSSIBLE** | **P0** | PROOF-06; FIXTURE-01 + FIXTURE-02 + FIXTURE-05 + FIXTURE-06 |
| **PRD06-RISK-A06** | Rebase / frame change while asynchronous work is in flight | **CRITICAL** | **POSSIBLE** | **P0** | PROOF-06 + dependency PROOF-13/68; FIXTURE-01 + FIXTURE-03 |
| **PRD06-RISK-A07** | SpatialFrame hierarchy conversion / orientation drift | **CRITICAL** | **POSSIBLE** | **P0** | PROOF-05/06 + dependency PROOF-08/30; FIXTURE-01 + FIXTURE-06 |
| **PRD06-RISK-A08** | Multi-frame active-set scalability | **HIGH** | **LIKELY** | **P0** | PROOF-05/06/10 + dependency PROOF-18/37/71; FIXTURE-01 + FIXTURE-05 + FIXTURE-09 |
| **PRD06-RISK-A09** | Custom double-build release / maintenance burden | **HIGH** | **LIKELY** | **P0** | PROOF-11/70/72/73; FIXTURE-09 |
| **PRD06-RISK-B01** | Module / GDExtension gameplay-capability parity gap | **HIGH** | **POSSIBLE** | **P0** | PROOF-03/67; FIXTURE-01 + FIXTURE-02 |
| **PRD06-RISK-B02** | Edition-specific stability / defect divergence | **HIGH** | **POSSIBLE** | **P0** | PROOF-03/67/72; FIXTURE-02 + FIXTURE-09 |
| **PRD06-RISK-B03** | Known feature differential such as FastNoise2 omission | **HIGH** | **POSSIBLE** | **P0** | PROOF-03/67; FIXTURE-01 + FIXTURE-02 |
| **PRD06-RISK-B04** | GDExtension ABI / Godot-version compatibility failure | **HIGH** | **POSSIBLE** | **P0** | PROOF-70/72/73; FIXTURE-09 |
| **PRD06-RISK-B05** | Edition export / platform coverage gap | **HIGH** | **POSSIBLE** | **P0** | PROOF-70/72/73; FIXTURE-09 |
| **PRD06-RISK-B06** | Edition-specific headless / dedicated-server divergence | **HIGH** | **POSSIBLE** | **P0** | PROOF-03/11/70; FIXTURE-01 + FIXTURE-09 |
| **PRD06-RISK-B07** | Edition performance / memory divergence | **HIGH** | **POSSIBLE** | **P0** | PROOF-03/18/71/75; FIXTURE-02 + FIXTURE-09 |
| **PRD06-RISK-B08** | Double-precision edition/build composition gap | **HIGH** | **LIKELY** | **P0** | PROOF-05/11/70/72; FIXTURE-09 |
| **PRD06-RISK-B09** | Provider boundary leakage blocks edition swap / upgrade | **HIGH** | **LIKELY** | **P0** | PROOF-03/74; FIXTURE-01 |
| **PRD06-RISK-C01** | Runtime palette/model ID persisted as semantic identity | **CRITICAL** | **LIKELY** | **P0** | PROOF-02/57/58; FIXTURE-01 + FIXTURE-04 |
| **PRD06-RISK-C02** | Godot ResourceUID/RID/ObjectID/NodePath/peer ID leaks into canon | **CRITICAL** | **LIKELY** | **P0** | PROOF-01/02/12/74; FIXTURE-01 |
| **PRD06-RISK-C03** | DB row order, file path or provider resource path becomes identity | **CRITICAL** | **LIKELY** | **P0** | PROOF-02/49/58/74; FIXTURE-01 + FIXTURE-07 |
| **PRD06-RISK-C04** | Projection lifecycle creates or deletes canonical entities | **CRITICAL** | **LIKELY** | **P0** | PROOF-01/12; FIXTURE-01 |
| **PRD06-RISK-C05** | Derived read model / cache becomes competing editable truth | **HIGH** | **POSSIBLE** | **P0** | PROOF-22/74; FIXTURE-01 |
| **PRD06-RISK-C06** | Provider swap reinterprets semantic state | **CRITICAL** | **POSSIBLE** | **P0** | PROOF-03/67/74; FIXTURE-01 + FIXTURE-02 |
| **PRD06-RISK-C07** | Content-pack load order/remap changes runtime identity meaning | **CRITICAL** | **LIKELY** | **P0** | PROOF-02/36/54/57/58; FIXTURE-01 + FIXTURE-05 + FIXTURE-07 |
| **PRD06-RISK-C08** | Generated-form identity explosion / collision | **HIGH** | **LIKELY** | **P1** | PROOF-52/49; FIXTURE-07 |
| **PRD06-RISK-C09** | Legacy numeric-ID migration misbind | **CRITICAL** | **POSSIBLE** | **P0** | PROOF-02/57/58; FIXTURE-04 + FIXTURE-07 |
| **PRD06-RISK-C10** | Alias, deprecation or retired-ID meaning reuse | **CRITICAL** | **POSSIBLE** | **P0** | PROOF-58/74; FIXTURE-07 |
| **PRD06-RISK-C11** | Missing/changed pack leaves ambiguous canonical state | **HIGH** | **POSSIBLE** | **P1** | PROOF-57/58; FIXTURE-04 + FIXTURE-07 |
| **PRD06-RISK-C12** | Save/network/runtime dictionary negotiation mismatch | **CRITICAL** | **LIKELY** | **P0** | PROOF-02/35/36/44/45/58; FIXTURE-01 + FIXTURE-05 |
| **PRD06-RISK-L01** | Authoritative world path depends on renderer / client presentation | **CRITICAL** | **POSSIBLE** | **P0** | PROOF-11 + dependency PROOF-15/19; FIXTURE-01 + FIXTURE-09 |
| **PRD06-RISK-L02** | Dedicated export strips data that gameplay semantics still require | **HIGH** | **POSSIBLE** | **P0** | PROOF-11/54/70; FIXTURE-07 + FIXTURE-09 |
| **PRD06-RISK-L03** | Voxel/provider headless initialization or feature divergence | **HIGH** | **POSSIBLE** | **P0** | PROOF-03/11/67/70; FIXTURE-01 + FIXTURE-09 |
| **PRD06-RISK-L04** | Single-player / listen-host / dedicated semantic-rule divergence | **CRITICAL** | **POSSIBLE** | **P0** | PROOF-10/11; FIXTURE-01 + FIXTURE-05 |
| **PRD06-RISK-L05** | WorldDefinition / WorldSession lifecycle diverges in headless mode | **CRITICAL** | **POSSIBLE** | **P0** | PROOF-11 + dependency PROOF-07/20/45; FIXTURE-01 + FIXTURE-04 + FIXTURE-09 |
| **PRD06-RISK-L06** | Server/client pack split creates semantic mismatch | **CRITICAL** | **POSSIBLE** | **P0** | PROOF-36/54/57; FIXTURE-05 + FIXTURE-07 + FIXTURE-09 |
| **PRD06-RISK-L07** | Editor `--headless` success gives false confidence about release server | **HIGH** | **LIKELY** | **P0** | PROOF-11/70; FIXTURE-09 |
| **PRD06-RISK-L08** | Headless build matrix incomplete across precision/provider/platform roles | **HIGH** | **LIKELY** | **P0** | PROOF-11/70/72/73; FIXTURE-09 |

# 24. Detailed Child Risks — PRD06-RISK-A

Parent family: **PRD06-RISK-A — Large-coordinate / precision / origin-frame strategy**. All child records remain unproven until PRD-07/08 evidence exists.

### PRD06-RISK-A01 — Insufficient standard-precision active-frame envelope

- **Parent:** PRD06-RISK-A
- **Failure statement:** Canonical position remains exact, but the selected single-precision active frame becomes too large for stable first-person rendering, physics or movement at intended play distances.
- **Consequence:** Visible jitter, physics instability, movement error or forced late precision redesign.
- **Trigger / exposure:** Large active radius, fast travel, high-altitude/large-vessel scenarios, multiple simultaneous viewers or poorly bounded local frames.
- **Upstream lineage:** PRD05-XW-0056/0059/0062/0063/0064; R-B1; PRD04-BND-048–050/538
- **Existing controls:** Provider-independent canonical coordinates; bounded engine-local frames; precision deliberately unlocked.
- **Severity / plausibility / priority:** **CRITICAL / POSSIBLE / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-05; FIXTURE-01 + FIXTURE-09
- **Success / exit evidence:** A production precision ADR may proceed only after the exact standard-precision lane demonstrates stable movement/render/physics/save/network round-trips across the required coordinate envelope, or is explicitly rejected with evidence.
- **ADR dependency:** ADR — production Godot precision strategy; ADR — canonical spatial representation
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-A02 — Double-precision performance / memory / platform penalty

- **Parent:** PRD06-RISK-A
- **Failure statement:** A double-precision Godot lane may solve precision while imposing unacceptable CPU, memory, extension, platform or export-template costs.
- **Consequence:** Low-end scalability failure, platform exclusion, server density loss or a late reversal back to local-frame/rebase strategies.
- **Trigger / exposure:** Selecting `precision=double`, large actor/physics counts, 32-bit/low-end targets, broad extension use or server fleets.
- **Upstream lineage:** PRD05-XW-0056/0058/0063/0064; R-B1/R-B6
- **Existing controls:** Double precision remains a candidate only; exact hardware/build qualification is downstream.
- **Severity / plausibility / priority:** **HIGH / POSSIBLE / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-05/11/70/71; FIXTURE-01 + FIXTURE-09
- **Success / exit evidence:** Measure exact double-build overhead on representative client/server hardware and provider lanes. The ADR must record supported/unsupported hardware classes and why the measured cost is acceptable or reject the lane.
- **ADR dependency:** ADR — production Godot precision strategy; later hardware qualification ADRs
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-A03 — Precision-build incompatibility across multiplayer and native extensions

- **Parent:** PRD06-RISK-A
- **Failure statement:** Single/double clients, servers or native extensions may be binary/semantic incompatible or produce divergent spatial results.
- **Consequence:** Connection failures, spatial divergence, crashes, corrupt native calls or impossible mixed-build support.
- **Trigger / exposure:** Mixed client/server precision, GDExtension built for the wrong `real_t`, stale export templates or mismatched native dependencies.
- **Upstream lineage:** PRD05-XW-0058/0063/0070/0074/0077; current Godot large-world compatibility rules
- **Existing controls:** Exact build identity; one canonical coordinate layer; network messages are provider-independent; no mixed-build support promised.
- **Severity / plausibility / priority:** **CRITICAL / POSSIBLE / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-10/11/70/72; FIXTURE-05 + FIXTURE-09
- **Success / exit evidence:** The supported multiplayer/build matrix must use compatible precision/native artifacts and fail closed on mismatches. No silent mixed-precision session may pass qualification.
- **ADR dependency:** ADR — production precision; ADR — native extension/provider lane; build compatibility policy
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-A04 — Canonical-to-engine projection overflow / normalization error

- **Parent:** PRD06-RISK-A
- **Failure statement:** The concrete hierarchical coordinate representation or its conversion into bounded engine-local coordinates may overflow, truncate, wrap or normalize inconsistently.
- **Consequence:** Wrong-place entities, save/network disagreement, cross-region corruption or unrecoverable spatial state.
- **Trigger / exposure:** Extreme signed coordinates, negative-region boundaries, cell normalization, sub-voxel offsets, serialization width changes or platform conversions.
- **Upstream lineage:** PRD05-XW-0059/0060/0061/0062/0064; UNK-ARCH-002/017
- **Existing controls:** Canonical coordinates are Leyforge-owned and provider-independent; integer-first hierarchy is candidate, not locked.
- **Severity / plausibility / priority:** **CRITICAL / POSSIBLE / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-05; FIXTURE-01
- **Success / exit evidence:** Round-trip canonical addresses across extreme positive/negative values, cell boundaries, save/load and network serialization with exact semantic equality and explicit overflow rejection.
- **ADR dependency:** ADR — canonical coordinate concrete representation
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-A05 — Cross-provider origin-rebase incoherence

- **Parent:** PRD06-RISK-A
- **Failure statement:** If rebasing is used, rendering, physics, voxel streaming, navigation, audio, particles, cameras, interpolation or prediction may shift at different times or by different offsets.
- **Consequence:** Semantic teleport, collision/nav mismatch, visible discontinuity, stale handles or client/server disagreement.
- **Trigger / exposure:** Origin rebase during motion, contact, streaming, async provider work, network prediction or active effects.
- **Upstream lineage:** PRD05-XW-0057/0065/0066; R-B2; PRD04-BND-051
- **Existing controls:** Rebase is only a candidate; canonical positions do not change when active-frame origins move.
- **Severity / plausibility / priority:** **CRITICAL / POSSIBLE / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-06; FIXTURE-01 + FIXTURE-02 + FIXTURE-05 + FIXTURE-06
- **Success / exit evidence:** Origin Rebase Torture must show one coordinated frame revision across all enabled providers and projections, with no canonical movement, stale derived state or unbounded recovery work.
- **ADR dependency:** ADR — origin/frame movement policy if rebasing is retained
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-A06 — Rebase / frame change while asynchronous work is in flight

- **Parent:** PRD06-RISK-A
- **Failure statement:** Background generation, nav, collision, physics queries, networking or save work may complete against an obsolete frame and commit in the wrong local coordinates.
- **Consequence:** Misplaced edits/entities, stale collision/nav, corrupted packets or hard-to-reproduce race failures.
- **Trigger / exposure:** Frame epoch changes while workers/provider callbacks are queued or while a save/network snapshot is captured.
- **Upstream lineage:** PRD05-XW-0065/0066; dependency on PRD04-BND-073/095/096 and RISK-F
- **Existing controls:** WorldSession epochs and owner-commit rules already exist; workers must not own authoritative mutation.
- **Severity / plausibility / priority:** **CRITICAL / POSSIBLE / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-06 + dependency PROOF-13/68; FIXTURE-01 + FIXTURE-03
- **Success / exit evidence:** Every asynchronous result must carry enough frame/session revision context to be transformed safely or rejected. Chaos testing must show zero wrong-frame commits.
- **ADR dependency:** ADR — frame/rebase protocol; later worker proposal/commit implementation ADR
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-A07 — SpatialFrame hierarchy conversion / orientation drift

- **Parent:** PRD06-RISK-A
- **Failure statement:** Nested world/realm/vessel/structure/occupant frames may accumulate conversion, handedness, orientation or parent-lifetime errors.
- **Consequence:** Incorrect boarding, raycasts, interactions, vessel contents, portal arrivals or persistent transforms.
- **Trigger / exposure:** Deep/nested frames, moving parents, crossing region boundaries, parent unload/reload or mixed orientation encodings.
- **Upstream lineage:** PRD05-XW-0067/0068/0069; R-B5; PRD04-BND-052–060/083/085
- **Existing controls:** SpatialFrame has stable Leyforge identity; SceneTree parenting is not authority; vessel-local coordinates are first-class.
- **Severity / plausibility / priority:** **CRITICAL / POSSIBLE / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-05/06 + dependency PROOF-08/30; FIXTURE-01 + FIXTURE-06
- **Success / exit evidence:** Forward/inverse transforms must remain round-trip stable across nested/moving frames, unload/reload and region crossing; unsupported nesting limits must be explicit.
- **ADR dependency:** ADR — SpatialFrame concrete representation / nesting policy
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-A08 — Multi-frame active-set scalability

- **Parent:** PRD06-RISK-A
- **Failure statement:** Many simultaneous distant frames, split-screen unions, vessels, realms or server interests may multiply physics/streaming/nav/replication cost beyond sustainable budgets.
- **Consequence:** Server/client performance collapse, forced feature cuts or hidden coupling between players.
- **Trigger / exposure:** Split-screen, remote settlement management, multiple vessels, teleport interest spikes, many active realm frames.
- **Upstream lineage:** PRD05-XW-0069/0075; R-B5
- **Existing controls:** Interest and simulation fidelity are separate; frame count/region sizes are not locked.
- **Severity / plausibility / priority:** **HIGH / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-05/06/10 + dependency PROOF-18/37/71; FIXTURE-01 + FIXTURE-05 + FIXTURE-09
- **Success / exit evidence:** Stress evidence must establish bounded costs and explicit active-frame/fidelity policies across representative multi-view/server loads without changing canonical truth.
- **ADR dependency:** ADR — active-frame/interest budget strategy; later performance budgets
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-A09 — Custom double-build release / maintenance burden

- **Parent:** PRD06-RISK-A
- **Failure statement:** If double precision is selected, custom editors/templates and matching native/provider artifacts may become difficult to reproduce and support across platforms.
- **Consequence:** Build drift, missing server/client artifacts, upgrade paralysis, unsymbolicated crashes or accidental single/double mixing.
- **Trigger / exposure:** Custom Godot build, Module edition, GDExtensions, CI upgrades, release patching or unsupported platform targets.
- **Upstream lineage:** PRD05-XW-0058/0063/0077; R-B6; Round-7 build rules
- **Existing controls:** Exact dependency/build identity and exported-artifact qualification are mandatory.
- **Severity / plausibility / priority:** **HIGH / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-11/70/72/73; FIXTURE-09
- **Success / exit evidence:** The exact chosen precision/provider build must be reproducible in CI for every supported role/platform with matching templates/extensions/symbols before a production precision ADR closes this risk.
- **ADR dependency:** ADR — production precision; ADR — build/provider edition; dependency policy
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`


# 25. Detailed Child Risks — PRD06-RISK-B

Parent family: **PRD06-RISK-B — Zylann Module vs GDExtension parity**. All child records remain unproven until PRD-07/08 evidence exists.

### PRD06-RISK-B01 — Module / GDExtension gameplay-capability parity gap

- **Parent:** PRD06-RISK-B
- **Failure statement:** A gameplay-facing voxel capability used by Leyforge may exist, behave differently or be missing in one Voxel Tools edition.
- **Consequence:** Provider lock-in, late rewrite or a false assumption that the two editions are interchangeable.
- **Trigger / exposure:** Using APIs/features that are edition-specific or not covered by the Leyforge facade.
- **Upstream lineage:** PRD05-XW-0048/0049/0051/0077; R-A3
- **Existing controls:** VoxelFacade/provider boundary; no edition is production-selected.
- **Severity / plausibility / priority:** **HIGH / POSSIBLE / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-03/67; FIXTURE-01 + FIXTURE-02
- **Success / exit evidence:** A provider-conformance matrix must exercise every Leyforge-facing voxel contract in both viable editions and classify any differences before the edition ADR.
- **ADR dependency:** ADR — Voxel Tools Module vs GDExtension
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-B02 — Edition-specific stability / defect divergence

- **Parent:** PRD06-RISK-B
- **Failure statement:** GDExtension and Module may have different bugs or maturity even where nominal APIs match.
- **Consequence:** Hard-to-reproduce crashes, data corruption, performance regressions or forced edition switch.
- **Trigger / exposure:** Long streaming sessions, threaded generation, editor/runtime lifecycle, upgrades or stress beyond upstream routine testing.
- **Upstream lineage:** PRD05-XW-0051/0077; current upstream states GDExtension is newer/less tested
- **Existing controls:** Exact provider edition recorded in build identity; provider failure may not become semantic authority.
- **Severity / plausibility / priority:** **HIGH / POSSIBLE / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-03/67/72; FIXTURE-02 + FIXTURE-09
- **Success / exit evidence:** Representative stress/regression suites must run on both candidate editions; known edition-specific defects must be bounded or the affected edition rejected.
- **ADR dependency:** ADR — Voxel Tools edition; dependency upgrade policy
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-B03 — Known feature differential such as FastNoise2 omission

- **Parent:** PRD06-RISK-B
- **Failure statement:** Nominal edition parity may conceal explicitly documented feature omissions, including FastNoise2 in the current GDExtension edition.
- **Consequence:** Worldgen/provider assumptions fail or GDExtension selection silently changes capability.
- **Trigger / exposure:** Leyforge or a dependency relies directly/indirectly on an omitted module-only feature.
- **Upstream lineage:** PRD05-XW-0051; current Voxel Tools edition documentation
- **Existing controls:** Worldgen planning is Leyforge-owned; provider feature availability is not canon.
- **Severity / plausibility / priority:** **HIGH / POSSIBLE / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-03/67; FIXTURE-01 + FIXTURE-02
- **Success / exit evidence:** Inventory every Leyforge-used voxel/provider feature and demonstrate the candidate edition implements it or an accepted provider-neutral alternative.
- **ADR dependency:** ADR — Voxel Tools edition; possible provider capability waiver
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-B04 — GDExtension ABI / Godot-version compatibility failure

- **Parent:** PRD06-RISK-B
- **Failure statement:** A GDExtension package may not load or behave safely with the exact Godot/precision/platform build despite broad compatibility claims.
- **Consequence:** Startup/export failure, native crash or blocked upgrades.
- **Trigger / exposure:** Godot minor upgrade, double precision, platform architecture change, stale extension binary or custom engine patch.
- **Upstream lineage:** PRD05-XW-0051/0058/0077; Godot GDExtension precision compatibility facts
- **Existing controls:** Exact Godot/provider revision identity; dependency upgrades are controlled deltas.
- **Severity / plausibility / priority:** **HIGH / POSSIBLE / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-70/72/73; FIXTURE-09
- **Success / exit evidence:** Every supported exported artifact must load the exact extension/native set and pass a minimal conformance boot plus representative voxel workload after upgrades.
- **ADR dependency:** ADR — Voxel Tools edition; dependency compatibility policy
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-B05 — Edition export / platform coverage gap

- **Parent:** PRD06-RISK-B
- **Failure statement:** The preferred edition may not have reproducible client/server/export artifacts for all intended supported platforms or build modes.
- **Consequence:** Platform exclusion, manual release steps, late edition switch or inconsistent support.
- **Trigger / exposure:** New target platform, dedicated server, double precision, debug/release templates or native architecture.
- **Upstream lineage:** PRD05-XW-0058/0051; Round-7 exported-artifact requirements
- **Existing controls:** Supported platform matrix must be evidence-based; unsupported lanes may be rejected explicitly.
- **Severity / plausibility / priority:** **HIGH / POSSIBLE / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-70/72/73; FIXTURE-09
- **Success / exit evidence:** Produce and execute the real export matrix for both candidate editions where viable; record unsupported lanes before the edition ADR.
- **ADR dependency:** ADR — supported provider/platform matrix
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-B06 — Edition-specific headless / dedicated-server divergence

- **Parent:** PRD06-RISK-B
- **Failure statement:** Voxel Tools may initialize, stream, save or shut down differently in headless/dedicated execution between Module and GDExtension.
- **Consequence:** Server-only crashes, missing terrain data or inability to run authoritative worlds without visuals.
- **Trigger / exposure:** Dedicated export, stripped visual resources, no display/audio, server shutdown/restart.
- **Upstream lineage:** PRD05-XW-0051/0071/0073; R-B4
- **Existing controls:** Headless WorldSession is a mandatory real-export proof; presentation is not authority.
- **Severity / plausibility / priority:** **HIGH / POSSIBLE / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-03/11/70; FIXTURE-01 + FIXTURE-09
- **Success / exit evidence:** Both viable provider editions must run the required server-side voxel contracts in an exported dedicated artifact, or the unsupported edition is rejected.
- **ADR dependency:** ADR — Voxel Tools edition; ADR — dedicated server composition
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-B07 — Edition performance / memory divergence

- **Parent:** PRD06-RISK-B
- **Failure statement:** Equivalent functionality may have materially different CPU, memory, task or streaming behaviour between editions.
- **Consequence:** Choosing the easier integration path could compromise world scale or server density.
- **Trigger / exposure:** Large voxel workloads, many viewers, generation/edit bursts, native call overhead or worker contention.
- **Upstream lineage:** PRD05-XW-0049/0051; PKG-L qualification dependency
- **Existing controls:** No edition chosen by ergonomics alone; cross-provider budgets remain measurable.
- **Severity / plausibility / priority:** **HIGH / POSSIBLE / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-03/18/71/75; FIXTURE-02 + FIXTURE-09
- **Success / exit evidence:** Benchmark both editions on the same fixture/build/hardware with identical semantic workload; ADR records meaningful differences and margins.
- **ADR dependency:** ADR — Voxel Tools edition; performance budget ADRs
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-B08 — Double-precision edition/build composition gap

- **Parent:** PRD06-RISK-B
- **Failure statement:** Double precision may require a custom Module build or separately rebuilt GDExtension/native artifacts, and upstream packages may not provide the full production matrix.
- **Consequence:** Precision strategy becomes inseparable from provider edition or impossible on a target role/platform.
- **Trigger / exposure:** Selecting double precision, GDExtension, custom export templates or dedicated server.
- **Upstream lineage:** PRD05-XW-0058/0063/0077; current Godot/Voxel Tools build facts
- **Existing controls:** Precision and provider edition remain separate decisions until tested together.
- **Severity / plausibility / priority:** **HIGH / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-05/11/70/72; FIXTURE-09
- **Success / exit evidence:** Build and run the exact precision × provider-edition × role matrix required by candidate ADRs. Missing reproducible lanes must be treated as evidence against that combination.
- **ADR dependency:** ADR — precision strategy; ADR — Voxel Tools edition
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-B09 — Provider boundary leakage blocks edition swap / upgrade

- **Parent:** PRD06-RISK-B
- **Failure statement:** Leyforge gameplay/domain code may accidentally depend on edition-specific types, lifecycle or internals despite the facade policy.
- **Consequence:** Provider replacement becomes a rewrite, tests cannot isolate contracts and upgrades create architecture debt.
- **Trigger / exposure:** Convenience access to Zylann/Godot internals, editor-only helpers, direct resource types or provider callbacks in domain code.
- **Upstream lineage:** PRD05-XW-0048/0049/0050; R-A3
- **Existing controls:** Provider facades mandatory; Branch B dependency rules apply.
- **Severity / plausibility / priority:** **HIGH / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-03/74; FIXTURE-01
- **Success / exit evidence:** Dependency lint plus an actual provider-edition swap fixture must demonstrate gameplay-facing code does not require forbidden provider internals.
- **ADR dependency:** ADR — provider boundary exceptions only if formally justified
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`


# 26. Detailed Child Risks — PRD06-RISK-C

Parent family: **PRD06-RISK-C — Semantic runtime palette / migration**. All child records remain unproven until PRD-07/08 evidence exists.

### PRD06-RISK-C01 — Runtime palette/model ID persisted as semantic identity

- **Parent:** PRD06-RISK-C
- **Failure statement:** Compact Zylann/runtime IDs may be written into durable saves, network messages or content meaning without a reversible semantic mapping.
- **Consequence:** World reinterpretation after palette reorder, provider change or content-pack change.
- **Trigger / exposure:** Palette rebuild, content reload, save/load, world copy, provider upgrade or network reconnect.
- **Upstream lineage:** PRD05-XW-0038/0041/0042/0043; R-A1
- **Existing controls:** Stable semantic IDs outrank runtime handles; runtime dictionaries must be reversible.
- **Severity / plausibility / priority:** **CRITICAL / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-02/57/58; FIXTURE-01 + FIXTURE-04
- **Success / exit evidence:** Randomize/rebuild runtime palettes across save/load and pack/provider changes; canonical semantic identities and physical meaning must remain unchanged.
- **ADR dependency:** ADR — runtime dictionary/palette representation
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-C02 — Godot ResourceUID/RID/ObjectID/NodePath/peer ID leaks into canon

- **Parent:** PRD06-RISK-C
- **Failure statement:** Engine/session identifiers may be mistaken for durable Leyforge object/content/world identity.
- **Consequence:** Broken persistence, reconnect, provider swap or duplicate/lost entities after reload.
- **Trigger / exposure:** Serializing engine references, using NodePaths as protocol IDs, caching peer IDs as player identity or storing ResourceUID as semantic content ID.
- **Upstream lineage:** PRD05-XW-0039/0040/0041; R-A1
- **Existing controls:** A4 handles are explicitly non-canonical; stable-ID resolution exists above them.
- **Severity / plausibility / priority:** **CRITICAL / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-01/02/12/74; FIXTURE-01
- **Success / exit evidence:** Destroy/recreate sessions/projections and randomize runtime creation order; persisted/networked meaning must still resolve through Leyforge IDs only.
- **ADR dependency:** ADR — runtime handle mapping only; no ADR may promote engine handles to canon
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-C03 — DB row order, file path or provider resource path becomes identity

- **Parent:** PRD06-RISK-C
- **Failure statement:** Storage/layout details may accidentally become semantic keys or migration anchors.
- **Consequence:** Renames, compaction, database rebuilds or provider migration reinterpret the world.
- **Trigger / exposure:** DB VACUUM/reorder, asset relocation, pack rebake, old `/Game/Voxel/...` migration or repository reorganisation.
- **Upstream lineage:** PRD05-XW-0041/0043; REQ-ID-071–078; Round-8 historical disposition
- **Existing controls:** Canonical IDs are independent of path/order; legacy paths are migration evidence only.
- **Severity / plausibility / priority:** **CRITICAL / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-02/49/58/74; FIXTURE-01 + FIXTURE-07
- **Success / exit evidence:** Reorder rows and relocate/rebake resources while preserving semantic identity; legacy paths may resolve only through explicit migration maps.
- **ADR dependency:** ADR — persistence/index schema must preserve semantic keys
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-C04 — Projection lifecycle creates or deletes canonical entities

- **Parent:** PRD06-RISK-C
- **Failure statement:** Loading, unloading, LOD demotion or Node destruction may be treated as entity creation/destruction rather than projection lifecycle.
- **Consequence:** Duplicated villagers/items/machines, lost state, respawn exploits or distant-simulation corruption.
- **Trigger / exposure:** Chunk unload/reload, actor promotion/demotion, realm streaming, server interest changes or scene reload.
- **Upstream lineage:** PRD05-XW-0044/0045; R-A2
- **Existing controls:** Projection state is disposable; authoritative domain state is separate.
- **Severity / plausibility / priority:** **CRITICAL / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-01/12; FIXTURE-01
- **Success / exit evidence:** Thousands of projection destroy/recreate/evict cycles must preserve exactly one canonical instance and its state.
- **ADR dependency:** ADR — projection registry/lifecycle implementation
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-C05 — Derived read model / cache becomes competing editable truth

- **Parent:** PRD06-RISK-C
- **Failure statement:** Indexes, reverse maps, caches or provider-side mirrors may receive edits and drift from canonical authority.
- **Consequence:** Queries return contradictory state, migrations write back stale values or rebuilt caches change gameplay.
- **Trigger / exposure:** Performance optimization, editor tooling, network caches, persisted acceleration data or direct provider callbacks.
- **Upstream lineage:** PRD05-XW-0046/0047
- **Existing controls:** Derived state must be rebuildable and non-authoritative.
- **Severity / plausibility / priority:** **HIGH / POSSIBLE / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-22/74; FIXTURE-01
- **Success / exit evidence:** Delete all targeted derived structures and rebuild from canonical state; results must be semantically equivalent and tools must not require editing the cache as authority.
- **ADR dependency:** ADR — read-model/index implementation
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-C06 — Provider swap reinterprets semantic state

- **Parent:** PRD06-RISK-C
- **Failure statement:** Changing Module/GDExtension, voxel provider adapter or storage/provider internals may change the meaning of existing blocks/entities.
- **Consequence:** Existing worlds become provider-locked or corrupted and abstraction boundary is false.
- **Trigger / exposure:** Provider edition swap, version upgrade, test double, different model ordering or importer output.
- **Upstream lineage:** PRD05-XW-0048/0049/0050/0051; R-A3
- **Existing controls:** Provider facades plus semantic IDs; provider-local mapping is reversible.
- **Severity / plausibility / priority:** **CRITICAL / POSSIBLE / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-03/67/74; FIXTURE-01 + FIXTURE-02
- **Success / exit evidence:** Load the same canonical fixture through alternate compatible provider/edition mappings and obtain identical Leyforge-facing meaning; differences must be explicit provider limitations, not silent reinterpretation.
- **ADR dependency:** ADR — provider edition / adapter contract
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-C07 — Content-pack load order/remap changes runtime identity meaning

- **Parent:** PRD06-RISK-C
- **Failure statement:** Pack order, namespace resolution or runtime palette assignment may map the same compact handle to different semantic content across sessions/peers.
- **Consequence:** Wrong blocks/items, incompatible saves or client/server content disagreement.
- **Trigger / exposure:** Pack addition/removal, load-order change, server/client pack subset or dictionary negotiation.
- **Upstream lineage:** PRD05-XW-0042/0079 plus Round-5/6 pack identity crosswalk
- **Existing controls:** Packs have stable identity/namespace/version/dependencies; runtime dictionaries are session artifacts.
- **Severity / plausibility / priority:** **CRITICAL / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-02/36/54/57/58; FIXTURE-01 + FIXTURE-05 + FIXTURE-07
- **Success / exit evidence:** Vary pack order and runtime mapping while enforcing manifest compatibility; semantic state stays stable and incompatible clients/worlds fail or quarantine explicitly.
- **ADR dependency:** ADR — runtime dictionary negotiation; pack manifest/runtime mapping policy
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-C08 — Generated-form identity explosion / collision

- **Parent:** PRD06-RISK-C
- **Failure statement:** Deterministic generated forms may create excessive, unstable or colliding semantic/runtime identities when material × form combinations scale.
- **Consequence:** Save/network bloat, palette exhaustion, duplicate meanings or impossible content generation.
- **Trigger / exposure:** Large material/form libraries, mod packs, variant/state combinatorics or eager pre-generation.
- **Upstream lineage:** PRD05-XW-0007/0042; PROOF-52 lineage
- **Existing controls:** FCC-13 generated identity architecture; generated forms do not create ad-hoc unrelated item identities.
- **Severity / plausibility / priority:** **HIGH / LIKELY / P1**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-52/49; FIXTURE-07
- **Success / exit evidence:** Stress representative material/form spaces; identity generation must be deterministic, collision-free, bounded in runtime materialization and reproducible across bake/load.
- **ADR dependency:** ADR — eager/lazy generated-form materialization; runtime palette strategy
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-C09 — Legacy numeric-ID migration misbind

- **Parent:** PRD06-RISK-C
- **Failure statement:** Historical numeric IDs 1–312 or old POC identities may bind to the wrong current semantic target.
- **Consequence:** Irreversible save corruption, duplicate canon, resurrected retired meanings or silent player-data loss.
- **Trigger / exposure:** Legacy save import, compatibility loaders, migration tables, alias handling or old registry coexistence.
- **Upstream lineage:** Round-8 reconciliation; FCC-13E 312/312 dispositions; PRD05-XW-0031 and Round-8 rows
- **Existing controls:** FCC-13E is semantic migration authority; old IDs are version-scoped historical handles only.
- **Severity / plausibility / priority:** **CRITICAL / POSSIBLE / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-02/57/58; FIXTURE-04 + FIXTURE-07
- **Success / exit evidence:** Every retained legacy fixture must resolve to its FCC-13E disposition or explicit reject/quarantine result; no old numeric value may gain new meaning.
- **ADR dependency:** ADR — legacy migration loader / quarantine implementation
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-C10 — Alias, deprecation or retired-ID meaning reuse

- **Parent:** PRD06-RISK-C
- **Failure statement:** A retired semantic ID or alias may later be reused for different content, making old saves or mods ambiguous.
- **Consequence:** Permanent compatibility ambiguity and silent reinterpretation.
- **Trigger / exposure:** Content retirement, namespace cleanup, migration shortcuts or generated-form refactors.
- **Upstream lineage:** REQ-ID-074; PRD05 Round-8 historical/migration controls
- **Existing controls:** Migration graphs terminate at current target, compatibility object or reject/retire; old meanings are not reused.
- **Severity / plausibility / priority:** **CRITICAL / POSSIBLE / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-58/74; FIXTURE-07
- **Success / exit evidence:** Migration/validation fixtures must reject semantic ID reuse and prove aliases terminate without cycles or ambiguity.
- **ADR dependency:** ADR — migration graph implementation; deprecation policy already governed
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-C11 — Missing/changed pack leaves ambiguous canonical state

- **Parent:** PRD06-RISK-C
- **Failure statement:** A world may reference semantic IDs whose defining pack is absent, incompatible or upgraded without a valid migration.
- **Consequence:** World fails unsafely, substitutes wrong content or permanently mutates data before dependencies return.
- **Trigger / exposure:** Pack deletion, server/client mismatch, version downgrade/upgrade, mod removal or corrupt manifest.
- **Upstream lineage:** PRD05 Round-5/6 pack/persistence crosswalk; family C proof routes 57/58
- **Existing controls:** Pack identity/dependencies/trust are explicit; recovery may quarantine rather than guess.
- **Severity / plausibility / priority:** **HIGH / POSSIBLE / P1**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-57/58; FIXTURE-04 + FIXTURE-07
- **Success / exit evidence:** World recovery must preserve unresolved semantic IDs losslessly or reject/quarantine safely; no fallback may silently substitute another identity.
- **ADR dependency:** ADR — missing-pack recovery and migration policy
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-C12 — Save/network/runtime dictionary negotiation mismatch

- **Parent:** PRD06-RISK-C
- **Failure statement:** Two processes or a restored save may use different compact handle dictionaries while assuming the numeric values have shared meaning.
- **Consequence:** Client sees wrong voxels/items, replay mismatch or corrupted state after reconnect/restart.
- **Trigger / exposure:** Join/reconnect, server restart, pack negotiation, cache reuse, restored checkpoint or client prediction cache.
- **Upstream lineage:** PRD05-XW-0042/0043/0074/0079; Round-5 network identity rules
- **Existing controls:** Network/persistence carry semantic compatibility baselines; client caches are disposable.
- **Severity / plausibility / priority:** **CRITICAL / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-02/35/36/44/45/58; FIXTURE-01 + FIXTURE-05
- **Success / exit evidence:** Randomize server/client runtime dictionaries and caches across join/reconnect/restart; negotiated semantic baseline must preserve meaning or reject mismatch before state application.
- **ADR dependency:** ADR — runtime dictionary/network negotiation; protocol baseline ADR
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`


# 27. Detailed Child Risks — PRD06-RISK-L

Parent family: **PRD06-RISK-L — Headless dedicated-server parity**. All child records remain unproven until PRD-07/08 evidence exists.

### PRD06-RISK-L01 — Authoritative world path depends on renderer / client presentation

- **Parent:** PRD06-RISK-L
- **Failure statement:** Server/domain logic may accidentally require visible Nodes, rendering resources, camera-driven streaming or other client-only projections.
- **Consequence:** Dedicated server cannot run correctly or distant/unrendered simulation changes gameplay truth.
- **Trigger / exposure:** Headless display server, stripped visuals, no camera, no local player view or SceneTree-free distant simulation.
- **Upstream lineage:** PRD05-XW-0070/0071/0073; R-B4
- **Existing controls:** WorldSession/domain state is presentation-independent; SceneTree is not persistent authority.
- **Severity / plausibility / priority:** **CRITICAL / POSSIBLE / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-11 + dependency PROOF-15/19; FIXTURE-01 + FIXTURE-09
- **Success / exit evidence:** Real exported dedicated artifact must execute authoritative world/session operations without renderer/client-only resources and produce the same canonical outcomes as equivalent hosted lanes.
- **ADR dependency:** ADR — dedicated server service composition
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-L02 — Dedicated export strips data that gameplay semantics still require

- **Parent:** PRD06-RISK-L
- **Failure statement:** Godot dedicated-server export can strip visuals; Leyforge may accidentally place semantic data in stripped texture/material/presentation resources.
- **Consequence:** Server loads incomplete definitions or diverges from clients.
- **Trigger / exposure:** Using visual Resources as gameplay data, aggressive server pack split or export stripping.
- **Upstream lineage:** PRD05-XW-0071/0073; PROOF-54 lineage
- **Existing controls:** Semantic definitions are above presentation products; server/client pack split is explicit.
- **Severity / plausibility / priority:** **HIGH / POSSIBLE / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-11/54/70; FIXTURE-07 + FIXTURE-09
- **Success / exit evidence:** Dedicated export with intended stripping must retain all semantic/server-required data and fail validation if any canonical rule depends on a stripped presentation asset.
- **ADR dependency:** ADR — server/client pack split; dedicated export policy
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-L03 — Voxel/provider headless initialization or feature divergence

- **Parent:** PRD06-RISK-L
- **Failure statement:** The chosen Voxel Tools edition may rely on editor/render/runtime assumptions that do not hold in a real dedicated export.
- **Consequence:** No terrain streaming/collision/server queries, crashes or shutdown leaks on servers.
- **Trigger / exposure:** Module/GDExtension initialization, headless display/audio, server export templates, no rendered meshes or resource stripping.
- **Upstream lineage:** PRD05-XW-0051/0071/0073/0077; PRD06-RISK-B06
- **Existing controls:** Provider edition remains proof-gated; exact exported artifact required.
- **Severity / plausibility / priority:** **HIGH / POSSIBLE / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-03/11/67/70; FIXTURE-01 + FIXTURE-09
- **Success / exit evidence:** Run the full server-required voxel contract in exported headless builds for candidate editions; unsupported combinations are rejected before ADR.
- **ADR dependency:** ADR — Voxel Tools edition; dedicated server build
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-L04 — Single-player / listen-host / dedicated semantic-rule divergence

- **Parent:** PRD06-RISK-L
- **Failure statement:** Different runtime modes may execute different gameplay authority, ID allocation, time progression, save or validation rules.
- **Consequence:** World behaves differently when opened for multiplayer, causing exploits, corruption or incompatible saves.
- **Trigger / exposure:** Promotion from single-player to listen host, dedicated hosting, mode-specific code branches or local-client shortcuts.
- **Upstream lineage:** PRD05-XW-0070/0072/0073; R-B4
- **Existing controls:** One canonical semantic authority; listen host = server authority + local client projection.
- **Severity / plausibility / priority:** **CRITICAL / POSSIBLE / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-10/11; FIXTURE-01 + FIXTURE-05
- **Success / exit evidence:** Open the same world through SP → listen host → dedicated-compatible paths and compare canonical IDs, transactions, coordinates and save meaning; mode-only presentation differences are allowed, rule differences are not.
- **ADR dependency:** ADR — runtime/service composition only after parity proof
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-L05 — WorldDefinition / WorldSession lifecycle diverges in headless mode

- **Parent:** PRD06-RISK-L
- **Failure statement:** Server startup, close/reopen or session epochs may be implemented differently and allow stale tasks/handles to mutate a reopened world.
- **Consequence:** Cross-session corruption, duplicate simulation or shutdown/restart instability.
- **Trigger / exposure:** Dedicated restart, world switch, crash recovery, stale provider callbacks or persistent singleton state.
- **Upstream lineage:** PRD05-XW-0052/0073; dependency PROOF-07/20
- **Existing controls:** WorldDefinition and WorldSession are separate; WorldSession lifetime gates async work.
- **Severity / plausibility / priority:** **CRITICAL / POSSIBLE / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-11 + dependency PROOF-07/20/45; FIXTURE-01 + FIXTURE-04 + FIXTURE-09
- **Success / exit evidence:** Repeated dedicated world close/reopen/restart must create new session epochs and reject all old runtime handles/tasks while preserving persistent world identity.
- **ADR dependency:** ADR — server WorldSession lifecycle implementation
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-L06 — Server/client pack split creates semantic mismatch

- **Parent:** PRD06-RISK-L
- **Failure statement:** Server may omit content it actually needs or clients may load presentation/content incompatible with server canonical definitions.
- **Consequence:** Join failure, wrong assets/rules, missing collision/logic or exploitable content disagreement.
- **Trigger / exposure:** Dedicated pack stripping, mods, generated forms, version skew or client-only asset packs.
- **Upstream lineage:** PRD05-XW-0071/0074; PROOF-54/36 lineage
- **Existing controls:** Content packs have identity/version/dependencies/trust; server/client roles explicit.
- **Severity / plausibility / priority:** **CRITICAL / POSSIBLE / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-36/54/57; FIXTURE-05 + FIXTURE-07 + FIXTURE-09
- **Success / exit evidence:** Validate server/client manifests and join compatibility; server retains all authoritative definitions while client-only presentation can differ only where explicitly allowed.
- **ADR dependency:** ADR — server/client pack split and compatibility baseline
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-L07 — Editor `--headless` success gives false confidence about release server

- **Parent:** PRD06-RISK-L
- **Failure statement:** Running the editor or debug template headlessly may pass while the stripped release dedicated artifact fails.
- **Consequence:** Late deployment failure despite green development tests.
- **Trigger / exposure:** Editor-only classes/resources, debug-only instrumentation, export exclusions, native library packaging or release optimization.
- **Upstream lineage:** PRD05-XW-0071/0073; Round-7 law: exported artifact required
- **Existing controls:** Proof ladder distinguishes editor/headless from packaged qualification.
- **Severity / plausibility / priority:** **HIGH / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-11/70; FIXTURE-09
- **Success / exit evidence:** PRD-07/08 must record results from the actual exported release-like dedicated artifact. Editor-only success cannot close any L-family child risk.
- **ADR dependency:** No ADR; this is a qualification gate
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-L08 — Headless build matrix incomplete across precision/provider/platform roles

- **Parent:** PRD06-RISK-L
- **Failure statement:** A dedicated server may work in one combination but not the production combination of Godot version, precision, provider edition, native extensions and platform.
- **Consequence:** False parity claim, unsupported deployment target or forced last-minute build switch.
- **Trigger / exposure:** Changing precision, Module/GDExtension, OS/architecture, native dependency or engine patch.
- **Upstream lineage:** PRD05-XW-0058/0063/0073/0077; R-B6; Round-7 exact-build rules
- **Existing controls:** Exact build manifests; exported-artifact matrix; no provider/precision choice accepted before proof.
- **Severity / plausibility / priority:** **HIGH / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-11/70/72/73; FIXTURE-09
- **Success / exit evidence:** Execute the exact candidate production matrix, including server role, and record supported/unsupported combinations. A single convenient headless lane is insufficient.
- **ADR dependency:** ADR — precision strategy; ADR — provider edition; supported server matrix
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

# 28. Cross-Family Dependencies Exposed by Round 2

Round 2 intentionally does not pretend A/B/C/L are independent.

```text
C semantic identity
 ├──► B provider swap must not reinterpret meaning
 ├──► L runtime modes must preserve the same identities
 ├──► D/K/M/R later persistence/network/pack/migration risks
 └──► A spatial identities/addresses must not degrade into provider-local handles

A precision/frames
 ├──► B precision × provider-edition build composition
 ├──► L dedicated/client build compatibility
 ├──► J vessel-local frames later
 ├──► K network spatial messages later
 └──► P exported-artifact/dependency qualification

B provider edition
 ├──► L headless server viability
 ├──► P upgrades/patches/reproducibility
 └──► E/H later voxel/edit/nav provider behaviour

L runtime-mode parity
 ├──► K network/reconnect
 ├──► D persistence/recovery
 └──► P production export/support qualification
```

A child risk may therefore reach a successful **Round-2 definition** while remaining open until a later package supplies dependent proof. That is expected and is not a defect in PRD-06.

# 29. Round-2 Proof Exit Matrix

| Proof | Round-2 risk consumers | Minimum evidence role before the affected risk can materially reduce |
|---|---|---|
| **PROOF-01 — Projection destruction/rebuild** | C02, C04 | Destroy/recreate projections without semantic deletion/duplication. |
| **PROOF-02 — Runtime-ID randomization** | C01, C02, C03, C07, C09, C12 | Randomize all runtime/local identities while preserving canonical meaning through save/network/provider mappings. |
| **PROOF-03 — Provider swap** | B01, B02, B06, B07, B09, C06 | Same Leyforge-facing fixture through viable Module/GDExtension/provider paths. |
| **PROOF-05 — Extreme Coordinate Walk** | A01, A02, A04, A07, A08, B08 | Compare precision/frame candidates at very large canonical coordinates with real movement/physics/render/save/network observations. |
| **PROOF-06 — Origin Rebase Torture** | A05, A06, A07, A08 | Exercise coordinated frame/origin movement under motion, providers, async work and effects. |
| **PROOF-10 — Single Player → Listen Host** | A03, A08, L04 | Same world/identity/spatial/save semantics after changing runtime mode. |
| **PROOF-11 — Headless WorldSession** | A02, A03, A09, B06, B08, L01–L05, L07, L08 | Real exported authoritative WorldSession without client rendering dependencies. |
| **PROOF-12 — Projection Eviction** | C02, C04 | Repeated unload/evict/promote cycles without semantic drift. |
| **PROOF-22 — Read-Model Rebuild** | C05 | Derived state can be destroyed/rebuilt without becoming competing truth. |
| **PROOF-36 — Protocol Baseline Mismatch** | C07, C12, L06 | Incompatible semantic/pack/runtime baselines fail before state is applied. |
| **PROOF-54 — Server/Client Pack Split** | B05, L02, L06 | Dedicated/client resource separation preserves server-required semantics. |
| **PROOF-57/58 — Missing Pack / Pack Upgrade Migration** | C01, C07, C09–C12, L06 | Missing/upgraded content is migrated, quarantined or rejected without semantic substitution. |
| **PROOF-67 — Provider Conformance Matrix** | B01–B03, B06, C06, L03 | Every required provider contract is exercised across candidate provider editions. |
| **PROOF-70 — Exported Artifact Matrix** | A02/A03/A09, B04–B06/B08, L02/L03/L07/L08 | Real exported client/server artifacts for the exact candidate combinations. |
| **PROOF-72 — Dependency Upgrade Fixture** | A03/A09, B02/B04/B05/B08, L08 | Upgrade exact Godot/provider/native dependency and rerun conformance/export regression. |
| **PROOF-73 — Local Patch Reproducibility** | A09, B04/B05/B08, L08 | Any required custom engine/provider patch can be rebuilt/reproduced with exact identity. |
| **PROOF-74 — Architecture Dependency Lint** | B09, C02/C03/C05/C06/C10 | Forbidden provider/runtime-handle authority leaks are mechanically detectable. |

No row above is a proof result. PRD-08 remains empty by design.

# 30. ADR Reservation Gates

Round 2 reserves the following consequential decisions but accepts none:

| Future ADR | Must not be accepted before |
|---|---|
| **ADR — Production Godot precision strategy** | A01–A09 evidence, especially PROOF-05/06 plus real exported client/server build evidence. |
| **ADR — Canonical coordinate concrete representation** | A04/A07 round-trip and range evidence; save/network consumers must remain provider-independent. |
| **ADR — Origin/frame movement policy** | A05/A06 evidence if rebasing remains a candidate. |
| **ADR — Voxel Tools Module vs GDExtension** | B01–B09 plus L03/L08 and PROOF-03/67/70/72/73 evidence. |
| **ADR — Runtime semantic→compact dictionary/palette** | C01–C07/C12 and runtime-ID randomization/migration/network evidence. |
| **ADR — Legacy migration loader/quarantine mechanism** | C09–C11 plus FCC-13E-driven fixtures and PROOF-57/58. |
| **ADR — Dedicated-server service/build composition** | L01–L08, particularly real exported PROOF-11/54/70 evidence. |

A failed candidate lane may close a decision branch without closing the parent risk; PRD-08 must retain the failure evidence.

# 31. PRD-07 Fixture Requirements Added by Round 2

## FIXTURE-01 — Canonical WorldSession + Registry + Coordinate/Frame Harness

Must now support at least:

- deliberately randomized semantic→runtime palettes and runtime creation order;
- provider edition swap without changing fixture semantics;
- projection destroy/recreate/eviction cycles;
- derived read-model destruction/rebuild;
- WorldDefinition close/reopen with new WorldSession epoch;
- extreme positive and negative canonical spatial addresses;
- cell-boundary normalization and save/network round-trip;
- configurable standard/double/local-frame candidate lanes;
- optional coordinated origin/frame shift injection;
- nested Realm/SpatialFrame/vessel-like transforms sufficient to expose conversion errors;
- SP → listen-host execution of the same saved world.

## FIXTURE-05 — Authoritative Server / Reconnect / Bulk-Interest Harness

Round-2 dependencies require:

- canonical/frame-aware spatial messages rather than raw engine-local coordinates;
- runtime dictionary mismatch/randomization cases;
- SP/listen-host parity comparison;
- server/client pack-baseline checks;
- precision/build mismatch rejection cases;
- enough multi-view/multi-frame activity to expose A08 before later network stress rounds.

## FIXTURE-09 — Build / Exported Artifact / Dependency Harness

Must now model the Cartesian combinations actually under consideration rather than a single convenient build:

```text
Godot revision
× precision (candidate lanes)
× Voxel Tools edition
× client / listen host / dedicated server
× platform / architecture
× debug / release-like export as needed
× local patch/native-extension identity where applicable
```

PRD-07 may prune impossible combinations explicitly, but it may not silently substitute editor execution for a required exported lane.

# 32. Round-2 Integrity Checks

| Check | Result |
|---|---|
| Parent risk families A/B/C/L preserved unchanged | **PASS — 4/4** |
| Stable child-risk IDs created | **PASS — 38/38** |
| Child IDs unique | **PASS — 38/38** |
| Round-2 upstream risk candidates R-A1..A3 / R-B1..B6 consumed | **PASS — 9/9** |
| Precision remains unlocked | **PASS** |
| Module vs GDExtension remains unlocked | **PASS** |
| Canonical coordinate concrete widths/cell sizes remain unlocked | **PASS** |
| Rebase policy remains unlocked | **PASS** |
| Dedicated-server service composition remains unlocked | **PASS** |
| Runtime palette/dictionary implementation remains unlocked | **PASS** |
| Current technology refresh creates architecture authority | **PASS — NO** |
| Current PRD-08 proof results created | **PASS — 0** |
| Implementation ADRs accepted | **PASS — 0** |
| PRD-04 / PRD-05 reopen candidates | **PASS — 0** |

# 33. Round-2 Closure Verdict

> **ROUND 2 PASS — IDENTITY / COORDINATES / PROVIDER EDITION / HEADLESS RISK DECOMPOSITION COMPLETE.**

Round 2 has converted the four umbrella families into **38 stable, falsifiable child risks** with:

- explicit failure conditions;
- triggers/exposures;
- existing architecture controls;
- severity, plausibility and priority;
- proof and shared-fixture routes;
- success/exit evidence;
- reserved ADR dependencies;
- intentionally unassessed residual risk.

The most consequential findings are:

1. **Precision is a build-system and multiplayer compatibility risk, not merely a Vector precision setting.** Double precision affects custom editor/export templates and native-extension compatibility; origin shifting adds coordination complexity instead.
2. **Module vs GDExtension is a multidimensional risk.** Capability, maturity, feature differences, headless/export coverage, performance, precision composition and upgrade burden all need the same conformance matrix before selection.
3. **Semantic identity risk is broader than the old 312-row migration problem.** Runtime palettes, Godot handles, DB/path layout, projection lifecycle, generated forms, pack order and network dictionaries all need to remain reversible projections of canonical IDs.
4. **Headless parity must be proven in the real exported dedicated artifact.** Editor `--headless` success is useful development evidence but cannot qualify server architecture.

No Round-2 finding requires PRD-04 or PRD-05 reopening.

The next work is **Round 3 — Ownership / Concurrency / Transactions**, formalising families **F, G and Q**.

# 34. Machine-Readable Round-2 Summary

```yaml
document: PRD-06
version: v0.2
round: 2
status: WORKING
round_status: PASS
parent_families_decomposed: [A, B, C, L]
child_risks:
  A: 9
  B: 9
  C: 12
  L: 8
  total: 38
severity_counts:
  critical: 19
  high: 19
plausibility_counts:
  likely: 13
  possible: 25
priority_counts:
  p0: 36
  p1: 2
proof_results_created: 0
implementation_adrs_created: 0
architecture_reopen_candidates: 0
technology_refresh_date: 2026-09-05
next_round: Ownership / Concurrency / Transactions
```

---

**End of PRD-06 v0.2 — Round 2 Working Baseline**

---

# 35. Round-3 Scope and Controlled Technology Refresh

Round 3 decomposes **PRD06-RISK-F, PRD06-RISK-G and PRD06-RISK-Q** into stable child risks covering authoritative ownership, concurrency, scheduling/backpressure and cross-domain transaction integrity.

This round does **not** select a custom scheduler, thread count, lock strategy, transaction coordinator, operation-ID format, reservation representation, rollback model or journaling implementation. Those remain downstream evidence/ADR decisions.

Current provider facts were refreshed on **5 September 2026** only where they sharpen the risk model:

| Current technology fact | Risk consequence |
|---|---|
| Godot supports multithreading, but the active SceneTree is not thread-safe; server APIs have narrower thread-safe paths. | Reinforces F05/F07/F11/F13: pure domain work must not gain authority by mutating arbitrary Nodes from workers. |
| Godot `WorkerThreadPool` distributes normal/group tasks across startup worker threads, and its documentation requires submitted tasks to be waited for completion at some point so task resources are cleaned up. | Reinforces F10 and G05/G11: task lifecycle/wait policy is architectural, and blocking/wait cycles require proof. |
| Voxel Tools generators are invoked concurrently and must be thread-safe. Its generator documentation warns generation order can be unpredictable and can break determinism if neighboring results depend on completion order. | Reinforces F02/F08/F09 and the need for PROOF-68 worker-order chaos. |
| Voxel Tools maintains its own background task pool with priority handling and a serial class for some I/O; its tasks are not frame-bounded. | Reinforces G01/G04/G06/G07: Leyforge must budget across provider pools rather than assume one global Godot worker pool controls total concurrency. |

Technology evidence is **P1 documentation evidence only**. It creates no PRD-08 result and accepts no implementation ADR.

# 36. Round-3 Stable Child-Risk Register

Round 3 creates **44 stable child risks**:

- **F — Simulation ownership / worker scaling:** 14
- **G — Cross-provider CPU saturation / backpressure:** 11
- **Q — Cross-domain transaction atomicity and conservation:** 19

The IDs below are stable for later PRD-07/08 evidence. Future refinements should add evidence or subordinate detail rather than silently renumber them.

## 36.1 PRD06-RISK-F — Ownership, worker and simulation risks

### PRD06-RISK-F01 — Multiple-writer authoritative state ambiguity

- **Parent:** PRD06-RISK-F
- **Failure statement:** Two or more systems can mutate the same authoritative state without one defined commit authority.
- **Consequence:** Race-free code can still produce semantically contradictory world truth: duplicated entities, overwritten inventory, conflicting transforms or divergent ownership.
- **Trigger / exposure:** A domain object is simultaneously writable by SceneTree logic, simulation services, providers, network handlers, persistence callbacks or migration code.
- **Upstream lineage:** PRD06-SEED-R3-C01; PRD05-XW-0082–0090; PRD04-BND-094/100/102/540; REQ-ARCH-060
- **Existing controls:** One current owner/transaction authority per mutable partition; foreign systems issue commands/evidence instead of direct mutation.
- **Severity / plausibility / priority:** **CRITICAL / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-13/14/68; FIXTURE-03 + FIXTURE-10
- **Success / exit evidence:** Instrumentation and hostile tests must prove that every authoritative mutation resolves to exactly one current owner/commit authority, and forbidden secondary writers are rejected or mechanically detected.
- **ADR dependency:** ADR — concrete ownership/partition model; ADR — domain command/commit interfaces
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-F02 — Stale worker result commits over newer canonical revision

- **Parent:** PRD06-RISK-F
- **Failure statement:** A worker/provider result produced from an old snapshot is accepted after canonical state has advanced.
- **Consequence:** Newer player edits, AI decisions, ownership changes or simulation outcomes can be silently overwritten.
- **Trigger / exposure:** Long-running generation, pathing, simulation, provider or batch work completes after a newer revision, frame epoch or transaction.
- **Upstream lineage:** PRD06-SEED-R3-C02; PRD04-BND-095–099/148; REQ-ARCH-011; REQ-DEV-075
- **Existing controls:** Workers consume versioned snapshots; outputs remain proposals until current-owner revision validation.
- **Severity / plausibility / priority:** **CRITICAL / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-13/68; FIXTURE-03 + FIXTURE-02
- **Success / exit evidence:** Randomized completion order must produce zero stale authoritative commits; every rejected result must be classifiable as stale/superseded rather than silently applied.
- **ADR dependency:** ADR — revision token/proposal envelope implementation
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-F03 — Ownership-transfer race permits old and new owners to commit

- **Parent:** PRD06-RISK-F
- **Failure statement:** An entity/partition crosses ownership boundaries while both old and new owners retain mutation rights.
- **Consequence:** The entity can duplicate, disappear, accept conflicting commands or diverge across save/network views.
- **Trigger / exposure:** Partition crossing, settlement/vessel transfer, realm travel, repartitioning, handoff under load or command arrival during handoff.
- **Upstream lineage:** PRD06-SEED-R3-C03; PRD04-BND-100–103/132/133
- **Existing controls:** Explicit handoff; ownership epochs invalidate old mutation rights; cross-owner mutation uses commands/transactions.
- **Severity / plausibility / priority:** **CRITICAL / POSSIBLE / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-14; FIXTURE-03 + FIXTURE-05 + FIXTURE-06
- **Success / exit evidence:** Move large populations/entities across owners under concurrent commands and prove one identity, one current owner, no old-owner commits, no duplicate/loss.
- **ADR dependency:** ADR — ownership transfer protocol / lease or equivalent
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-F04 — Ownership transfer becomes crash-ambiguous

- **Parent:** PRD06-RISK-F
- **Failure statement:** A crash or restart during ownership migration leaves no unambiguous recoverable owner.
- **Consequence:** Recovery can resurrect two owners, lose an entity, drop reservations or route future commands to the wrong partition.
- **Trigger / exposure:** Process kill between prepare/handoff/finalization, checkpoint during transfer, server restart or world close/reopen.
- **Upstream lineage:** PRD06-SEED-R3-C03; PRD04-BND-132; dependency PKG-I; UNK-ARCH-016
- **Existing controls:** Transfer state must be revisioned and recoverable; checkpoints cannot freeze an entity halfway through an undefined handoff.
- **Severity / plausibility / priority:** **CRITICAL / POSSIBLE / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-14 + PROOF-39/45/69; FIXTURE-03 + FIXTURE-04 + FIXTURE-05
- **Success / exit evidence:** Crash injection at every transfer phase must recover to exactly one valid owner and preserve identity/history without heuristic newest-file selection.
- **ADR dependency:** ADR — recoverable ownership handoff representation
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-F05 — SceneTree-dependent distant simulation

- **Parent:** PRD06-RISK-F
- **Failure statement:** Persistent/far simulation requires live Nodes, physics bodies or rendered scene objects.
- **Consequence:** Large-world scale, headless parity and unloaded-region progression fail, or persistent truth is lost when projections unload.
- **Trigger / exposure:** NPCs, settlements, ecology, automation or economy use `_process`, Node lifetime or scene hierarchy as their durable simulation substrate.
- **Upstream lineage:** PRD06-SEED-R3-C04; PRD04-BND-109–115/143; REQ-SIM-002
- **Existing controls:** Domain simulation remains separate from projection; distant state can run as compact authoritative data without SceneTree.
- **Severity / plausibility / priority:** **CRITICAL / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-15/19; FIXTURE-03 + FIXTURE-09
- **Success / exit evidence:** A large fixture must progress with zero entity Nodes and later promote to active detail with identity, conserved resources, obligations and history intact.
- **ADR dependency:** ADR — simulation partition/data representation; no SceneTree-as-authority ADR permitted
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-F06 — Fidelity promotion/demotion violates conservation

- **Parent:** PRD06-RISK-F
- **Failure statement:** Near/far/aggregate/physical fidelity changes alter authoritative quantities, identity, ownership, commitments or history.
- **Consequence:** Resources or people appear/disappear, production differs by player proximity, or save/network outcomes depend on representation level.
- **Trigger / exposure:** Repeated promotion/demotion, chunk/interest changes, split-screen viewers, remote management or server load degradation.
- **Upstream lineage:** PRD06-SEED-R3-C05; PRD04-BND-109–112/149–151; REQ-SIM-002; REQ-PERF-050
- **Existing controls:** Simulation fidelity is Leyforge-owned; transitions explicitly preserve semantic invariants.
- **Severity / plausibility / priority:** **CRITICAL / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-15/16/21; FIXTURE-03 + FIXTURE-10
- **Success / exit evidence:** Repeated aggregate→regional→active→physical→aggregate cycles must preserve canonical state exactly where the domain requires determinism/conservation.
- **ADR dependency:** ADR — fidelity-state model and promotion/demotion contracts
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-F07 — Pure domain simulation accidentally depends on main-thread cadence

- **Parent:** PRD06-RISK-F
- **Failure statement:** Authoritative domain progression is coupled to render `_process`, main-thread availability or frame rate.
- **Consequence:** Headless/server scale collapses, simulation slows under rendering load, and identical world-time inputs yield different outcomes.
- **Trigger / exposure:** Using per-frame Node callbacks for persistent simulation, blocking domain commits behind presentation work or conflating render FPS with world time.
- **Upstream lineage:** PRD04-BND-113–115/122/123; PRD06-SEED-R3-C04; REQ-SIM-027/028
- **Existing controls:** Leyforge-owned clocks and schedulers; main thread used only where provider/projection APIs require it.
- **Severity / plausibility / priority:** **HIGH / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-19/21; FIXTURE-03 + FIXTURE-09
- **Success / exit evidence:** Run pure simulation off SceneTree under variable render/main-thread load and prove canonical progression follows governed time/cadence rather than frame count.
- **ADR dependency:** ADR — simulation scheduler/cadence architecture
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-F08 — Worker completion order changes authoritative result

- **Parent:** PRD06-RISK-F
- **Failure statement:** Canonical state depends on which worker/provider task happens to finish first.
- **Consequence:** Same seed/commands/core count variations produce divergent worlds, multiplayer state or recovery histories.
- **Trigger / exposure:** Parallel worldgen, AI, settlement jobs, automation, ecology, pathing or batched simulation with order-sensitive shared state.
- **Upstream lineage:** PRD06-SEED-R3-C09; PRD04-BND-116/117; REQ-DEV-075; Voxel Tools generator determinism evidence
- **Existing controls:** Determinism is domain-specific; authoritative randomness is explicit input; workers propose and owners resolve order/commit semantics.
- **Severity / plausibility / priority:** **CRITICAL / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-21/68; FIXTURE-03 + FIXTURE-10
- **Success / exit evidence:** Randomize worker completion order/thread count repeatedly and compare canonical outputs; domains not requiring bitwise replay must still preserve semantic invariants and conservation.
- **ADR dependency:** ADR — deterministic-domain policy / ordering contract
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-F09 — Authoritative randomness leaks from uncontrolled thread/global RNG

- **Parent:** PRD06-RISK-F
- **Failure statement:** Random outcomes consume thread-global or execution-order-dependent RNG rather than governed seeds/streams.
- **Consequence:** Replays, generation, simulations and server/client recovery diverge despite identical semantic inputs.
- **Trigger / exposure:** Parallel tasks call shared RNG, iteration order changes random consumption, or provider randomness becomes canonical.
- **Upstream lineage:** PRD04-BND-116/117; PRD05 Round-3 deterministic evidence; REQ-DEV-075
- **Existing controls:** Authoritative randomness is explicit input with domain/context identity; presentation randomness may remain disposable.
- **Severity / plausibility / priority:** **HIGH / POSSIBLE / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-21/68; FIXTURE-03
- **Success / exit evidence:** Deterministic domains must reproduce governed random outcomes under reordered worker execution; any intentionally nondeterministic domain must document the allowed semantic envelope.
- **ADR dependency:** ADR — authoritative RNG stream/context scheme
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-F10 — Task lifetime survives WorldSession/owner lifetime

- **Parent:** PRD06-RISK-F
- **Failure statement:** Background work retains references or mutation rights after its WorldSession, owner, frame or provider context has closed.
- **Consequence:** Closed/reopened worlds can be corrupted by old callbacks; resources leak; shutdown hangs; stale handles hit newly reused runtime objects.
- **Trigger / exposure:** World close/reopen, server restart, realm unload, owner repartition, cancelled tasks or provider callbacks after teardown.
- **Upstream lineage:** PRD06-SEED-R3-C08; PRD04-BND-073/076/128/129; dependency PROOF-07/20
- **Existing controls:** Session/owner epochs gate commits; every long task has an owner and drain/cancel/invalidate policy.
- **Severity / plausibility / priority:** **CRITICAL / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-13/20/68 + PROOF-07; FIXTURE-03 + FIXTURE-04 + FIXTURE-09
- **Success / exit evidence:** Close/reopen worlds while all task classes are active and prove old tasks can only drain where explicitly durable or else cancel/invalidate without touching the new epoch.
- **ADR dependency:** ADR — task ownership/lifecycle envelope
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-F11 — Provider callback bypasses Leyforge authority boundary

- **Parent:** PRD06-RISK-F
- **Failure statement:** A Godot/Zylann/navigation/physics/DB callback directly mutates foreign gameplay state.
- **Consequence:** Provider completion order becomes gameplay law; failure/retry semantics become opaque and authority inversion reappears.
- **Trigger / exposure:** Signals/callbacks invoke inventory, health, ownership, settlement or transaction mutation directly.
- **Upstream lineage:** PRD06-SEED-R3-C10; PRD04-BND-124/131/139/146/147
- **Existing controls:** Provider callbacks are translated into Leyforge evidence/commands/events; owning domain decides consequence.
- **Severity / plausibility / priority:** **CRITICAL / POSSIBLE / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-13/63/68/74; FIXTURE-03 + FIXTURE-02 + FIXTURE-09
- **Success / exit evidence:** Architecture lint plus hostile callbacks must prove provider completions cannot directly commit unrelated authoritative domains.
- **ADR dependency:** ADR — provider adapter/event envelope; architecture lint rules
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-F12 — Commands are misrouted during ownership transfer

- **Parent:** PRD06-RISK-F
- **Failure statement:** A command targets an old owner, disappears between owners, or executes twice while routing catches up to a handoff.
- **Consequence:** Player/NPC actions can be lost, duplicated or applied to stale state at region/vessel/realm boundaries.
- **Trigger / exposure:** Commands arrive concurrently with partition handoff, reconnect, teleport, vessel crossing or owner failover.
- **Upstream lineage:** PRD04 Round-3 unknown #6; BND-100–103/133; dependency PKG-H
- **Existing controls:** Owner lookup is explicit; commands carry stable IDs/revisions and are resolved against current ownership.
- **Severity / plausibility / priority:** **CRITICAL / POSSIBLE / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-14 + PROOF-35/42; FIXTURE-03 + FIXTURE-05
- **Success / exit evidence:** Inject commands before/during/after transfer and prove each operation is rejected, forwarded or committed exactly once against a valid owner/revision.
- **ADR dependency:** ADR — owner-directory and transfer-time command routing
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-F13 — Property-level authority conflicts inside one entity

- **Parent:** PRD06-RISK-F
- **Failure statement:** Different subsystems write the same property or conflate property-specific ownership within one semantic entity.
- **Consequence:** Locomotion, physics, inventory, animation, AI and UI can fight each other or overwrite persistent state.
- **Trigger / exposure:** Active actor has physics-driven transform, AI desired motion, network correction, animation root motion and domain position without an explicit write contract.
- **Upstream lineage:** PRD04-BND-144/145; PRD05 Round-3 boundary mapping
- **Existing controls:** Property-level authority may differ, but synchronization ownership is explicit and presentation properties remain projections.
- **Severity / plausibility / priority:** **HIGH / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-13/19/68; FIXTURE-03 + FIXTURE-05
- **Success / exit evidence:** Representative active entities must expose one writer/commit rule per consequential property, survive provider/prediction callbacks and reconcile without oscillating authority.
- **ADR dependency:** ADR — active projection synchronization ownership
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-F14 — Derived cache/read model acquires accidental authority

- **Parent:** PRD06-RISK-F
- **Failure statement:** Spatial indexes, summaries, nav occupancy, market/read models or interest caches become prerequisites for truth and cannot be rebuilt safely.
- **Consequence:** Cache corruption or lag changes gameplay facts, recovery becomes impossible or two copies of authority emerge.
- **Trigger / exposure:** Optimization introduces duplicated data without revision/invalidation lineage, or writes begin targeting the cache instead of the owning domain.
- **Upstream lineage:** PRD04-BND-135–137; dependency PROOF-22; PRD05-XW-0013/0030
- **Existing controls:** Derived state may duplicate data, never authority; invalidation is revision/event driven.
- **Severity / plausibility / priority:** **HIGH / POSSIBLE / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-22/68; FIXTURE-03 + FIXTURE-01
- **Success / exit evidence:** Destroy/rebuild representative caches under active simulation and prove canonical results do not change; stale cache reads must be bounded/rejected according to consistency class.
- **ADR dependency:** ADR — read-model/cache invalidation architecture
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

## 36.2 PRD06-RISK-G — Cross-provider saturation and backpressure risks

### PRD06-RISK-G01 — Independent worker pools oversubscribe CPU

- **Parent:** PRD06-RISK-G
- **Failure statement:** Godot, Voxel Tools, navigation, simulation, DB/network and other pools each consume available cores as if they were alone.
- **Consequence:** Frame latency, server tick latency and queue age spiral even though each subsystem is locally correct.
- **Trigger / exposure:** Concurrent worldgen, nav baking, distant simulation, save, networking, Forge/background work or multiple viewers.
- **Upstream lineage:** PRD06-SEED-R3-C06; PRD04-BND-120/121; Voxel Tools independent pool evidence; REQ-PERF-046
- **Existing controls:** Cross-provider CPU budget is a Leyforge concern; provider pools remain contract-isolated.
- **Severity / plausibility / priority:** **CRITICAL / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-18/75/76; FIXTURE-03 + FIXTURE-09 + FIXTURE-10
- **Success / exit evidence:** Combined-load tests must show bounded useful latency and measured per-provider CPU/queue behavior across candidate hardware; no subsystem may assume it owns all cores.
- **ADR dependency:** ADR — cross-provider concurrency budget/scheduler composition
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-G02 — Unbounded queue/backlog growth

- **Parent:** PRD06-RISK-G
- **Failure statement:** Work is admitted faster than providers/owners can consume it and queue depth/age grows without bound.
- **Consequence:** Memory exhaustion, seconds/minutes of stale latency, crash-on-catch-up or shutdown impossibility.
- **Trigger / exposure:** Edit bursts, teleport spikes, worldgen, mass AI, network burst, persistence lag or slow disks.
- **Upstream lineage:** PRD06-SEED-R3-C07; PRD04-BND-125/126; REQ-SIM-027/028; UNK-PERF-017
- **Existing controls:** Queues must be bounded, coalesced, cancelled or admission-controlled; consequential work cannot be silently dropped.
- **Severity / plausibility / priority:** **CRITICAL / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-18/37/46/47/76; FIXTURE-03 + FIXTURE-05 + FIXTURE-04 + FIXTURE-10
- **Success / exit evidence:** Stress every producer/consumer boundary until overload and prove bounded depth/age, explicit degradation/admission control and recovery after pressure subsides.
- **ADR dependency:** ADR — queue classes/backpressure thresholds
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-G03 — Synchronized tick/catch-up storm

- **Parent:** PRD06-RISK-G
- **Failure statement:** Large numbers of entities/systems wake or catch up on the same tick after delay, producing self-reinforcing spikes.
- **Consequence:** Simulation misses more deadlines while trying to catch up, causing oscillation or prolonged unresponsiveness.
- **Trigger / exposure:** World load, time skip, far-sim promotion, server hitch, mass scheduled jobs, settlement/ecology cadence alignment.
- **Upstream lineage:** PRD06-SEED-R3-C07; REQ-SIM-028; UNK-SIM-008
- **Existing controls:** Dephasing, event-driven sleep, bounded catch-up and degradation are required candidates.
- **Severity / plausibility / priority:** **HIGH / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-18/21/76; FIXTURE-03 + FIXTURE-10
- **Success / exit evidence:** Large scheduled populations must remain bounded under delayed execution; catch-up may degrade fidelity but cannot create unlimited same-frame work or semantic double-processing.
- **ADR dependency:** ADR — scheduler dephasing/catch-up policy
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-G04 — Priority inversion or starvation across workload classes

- **Parent:** PRD06-RISK-G
- **Failure statement:** Low-value or long-running background work blocks urgent authoritative commits, player-visible readiness, saves or network service.
- **Consequence:** High-priority actions become unresponsive while background work monopolizes workers, locks or I/O.
- **Trigger / exposure:** Voxel generation/meshing, nav baking, background simulation, saves and replication share resources with incompatible priorities.
- **Upstream lineage:** PRD04-BND-120/121/125; Voxel Tools priority/serial task evidence
- **Existing controls:** Work classes and priorities are explicit; durable/authoritative work differs from disposable derived work.
- **Severity / plausibility / priority:** **HIGH / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-18/46/47; FIXTURE-03 + FIXTURE-05 + FIXTURE-04
- **Success / exit evidence:** Under saturation, urgent bounded tasks must make measurable progress and starvation limits must be explicit; low-value work can be deferred/coalesced without losing canonical truth.
- **ADR dependency:** ADR — workload classes / fairness policy
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-G05 — Blocking wait on worker/main thread creates stall or deadlock

- **Parent:** PRD06-RISK-G
- **Failure statement:** Code waits synchronously for worker completion from a constrained thread/pool that is required to complete the awaited work.
- **Consequence:** Main-thread freezes, pool starvation or deadlock.
- **Trigger / exposure:** Calling `wait_for_*` in hot paths, nested tasks waiting on same pool, provider callback waits or cross-domain lock/wait chains.
- **Upstream lineage:** Godot WorkerThreadPool lifecycle/wait semantics; PRD04-BND-119/122/125
- **Existing controls:** Prefer asynchronous proposal/commit flow; waits must be bounded and architecturally classified.
- **Severity / plausibility / priority:** **CRITICAL / POSSIBLE / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-18/19/76; FIXTURE-03 + FIXTURE-09 + FIXTURE-10
- **Success / exit evidence:** Instrument all waits in hostile load; no wait cycle may deadlock and no main-thread wait may exceed accepted budget without an explicit proof-backed exception.
- **ADR dependency:** ADR — worker composition / blocking-wait policy
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-G06 — Hidden provider thread counts defeat global budgeting

- **Parent:** PRD06-RISK-G
- **Failure statement:** Provider-internal pools/serial groups or native extensions consume concurrency outside Leyforge's visible scheduler assumptions.
- **Consequence:** Tuning one pool does not prevent total oversubscription; exported builds behave differently from editor tests.
- **Trigger / exposure:** Voxel Tools pool settings, Godot WorkerThreadPool, navigation threads, DB libraries or native extensions run concurrently.
- **Upstream lineage:** PRD04-BND-120/121; Voxel Tools development/performance docs
- **Existing controls:** Providers remain contract-isolated; build diagnostics must expose enough queue/thread/load evidence to tune combined behavior.
- **Severity / plausibility / priority:** **HIGH / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-18/67/75; FIXTURE-03 + FIXTURE-09
- **Success / exit evidence:** For every supported provider lane, record effective worker configuration and measured interaction with other pools; unsupported opaque combinations must fail qualification.
- **ADR dependency:** ADR — provider concurrency configuration / supported matrix
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-G07 — I/O backpressure stalls unrelated simulation/network work

- **Parent:** PRD06-RISK-G
- **Failure statement:** Slow persistence/content/network I/O consumes locks, worker capacity or memory needed by active simulation.
- **Consequence:** World remains semantically correct but becomes unplayable, stops acknowledging commands or cannot save.
- **Trigger / exposure:** Large checkpoint, voxel stream write, DB compaction, pack load, slow disk, network congestion.
- **Upstream lineage:** PRD04-BND-120/125/130; PRD06-SEED-R3-C06/C07; dependency PKG-H/I
- **Existing controls:** Durable and disposable work classes are distinct; I/O uses bounded queues and provider-specific isolation where possible.
- **Severity / plausibility / priority:** **CRITICAL / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-18/46/47/76; FIXTURE-04 + FIXTURE-05 + FIXTURE-10
- **Success / exit evidence:** Throttle/impair I/O while simulation continues; command latency, durability lag and queue age must remain bounded or degrade explicitly without semantic loss.
- **ADR dependency:** ADR — I/O queue isolation/backpressure policy
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-G08 — Coalescing/cancellation discards consequential work

- **Parent:** PRD06-RISK-G
- **Failure statement:** A generic stale-work optimizer drops or merges operations that are actually authoritative/durable.
- **Consequence:** Items, payments, edits, health, ownership or checkpoint obligations vanish without a committed rejection/compensation record.
- **Trigger / exposure:** Queue pressure triggers coalescing/cancellation using the same policy for C0 transactions and C1/C2 derived work.
- **Upstream lineage:** PRD04-BND-126/127/130; consistency-class model
- **Existing controls:** Consequential C0 work is never silently discarded; only explicitly disposable/supersedable work may coalesce.
- **Severity / plausibility / priority:** **CRITICAL / POSSIBLE / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-18/63/76; FIXTURE-03 + FIXTURE-10
- **Success / exit evidence:** Overload tests must prove C0 operations receive commit/reject/explicit retry outcomes while selected derived work is safely dropped/coalesced by policy.
- **ADR dependency:** ADR — task/queue consistency classes
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-G09 — Observability becomes a load amplifier

- **Parent:** PRD06-RISK-G
- **Failure statement:** Logging, tracing, metrics or support diagnostics materially worsen the saturation they are supposed to diagnose.
- **Consequence:** Release performance changes when diagnostics are enabled; queues/I/O grow; failures become Heisenbugs.
- **Trigger / exposure:** High-cardinality transaction traces, per-task logs, synchronous sinks, support bundle generation under load.
- **Upstream lineage:** Round-7 PRD06 risk refinements; PRD04-PROOF-75; REQ-DEV-079
- **Existing controls:** Release instrumentation is bounded; sampling/aggregation and overhead limits are explicit.
- **Severity / plausibility / priority:** **HIGH / LIKELY / P1**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-75 + PROOF-18; FIXTURE-09 + FIXTURE-10
- **Success / exit evidence:** Measure CPU/allocation/I/O overhead of production diagnostics at representative load and prove required evidence remains available within an accepted budget.
- **ADR dependency:** ADR — release observability configuration after proof
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-G10 — Admission-control/degradation oscillation thrashes the world

- **Parent:** PRD06-RISK-G
- **Failure statement:** Thresholds repeatedly promote/demote fidelity or admit/reject work around a boundary, creating oscillation rather than recovery.
- **Consequence:** Performance remains unstable; players see repeated pop/state churn; queues never settle.
- **Trigger / exposure:** Backlog hovers near thresholds, many viewers enter/leave regions, server load varies rapidly.
- **Upstream lineage:** UNK-PERF-017; PRD04-BND-109/125; dependency F06
- **Existing controls:** Degradation is semantic-safe and should use bounded/hysteretic policy rather than instantaneous toggling.
- **Severity / plausibility / priority:** **HIGH / POSSIBLE / P1**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-16/18/37; FIXTURE-03 + FIXTURE-05
- **Success / exit evidence:** Load ramps around thresholds must converge to stable states with bounded transition rates and no conservation/identity drift.
- **ADR dependency:** ADR — admission/degradation thresholds and hysteresis
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-G11 — Shutdown drain/cancel policy deadlocks under pressure

- **Parent:** PRD06-RISK-G
- **Failure statement:** World/server shutdown waits on tasks that cannot complete because queues/providers have already stopped accepting dependencies.
- **Consequence:** Shutdown hangs, corrupts durable work or requires unsafe process termination.
- **Trigger / exposure:** Heavy save/network/voxel workload during quit, world close, restart or deployment stop.
- **Upstream lineage:** PRD04-BND-128–130; PRD06-SEED-R3-C08; dependency PROOF-20
- **Existing controls:** Every long task is classified drain/cancel/invalidate/provider-drain before teardown order is chosen.
- **Severity / plausibility / priority:** **CRITICAL / POSSIBLE / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-20/47/69; FIXTURE-03 + FIXTURE-04 + FIXTURE-09
- **Success / exit evidence:** Exercise shutdown under saturated queues and every task class; shutdown must finish within explicit bounds while durable work follows its defined recovery contract.
- **ADR dependency:** ADR — shutdown dependency/drain order
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

## 36.3 PRD06-RISK-Q — Cross-domain transaction risks

### PRD06-RISK-Q01 — Partial multi-owner authoritative transaction

- **Parent:** PRD06-RISK-Q
- **Failure statement:** A consequential operation commits some authoritative domains but not others without an explicit recoverable outcome.
- **Consequence:** Inventory, voxel state, structure identity, economy, health, realm/vessel state or ownership disagree about whether the action happened.
- **Trigger / exposure:** Construction, trade, packing containers, treatment, vessel edits, realm travel or other operations span multiple owners and fail mid-flow.
- **Upstream lineage:** PRD06-SEED-R3-D01; PRD04-BND-102–105/138/139; REQ-PST-003/006/007
- **Existing controls:** Cross-domain transaction authority is Leyforge-owned; use the minimum consistency protocol that satisfies semantics.
- **Severity / plausibility / priority:** **CRITICAL / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-04/17/33/63/76; FIXTURE-03 + FIXTURE-10
- **Success / exit evidence:** Failure injection at every phase must leave one explainable outcome: committed, rejected, recoverably pending, or explicitly compensated/quarantined—never silent partial truth.
- **ADR dependency:** ADR — cross-domain transaction orchestration pattern
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-Q02 — Canonical commit point is ambiguous

- **Parent:** PRD06-RISK-Q
- **Failure statement:** Subsystems disagree about the exact point at which a strong operation becomes canonical.
- **Consequence:** Providers, clients, persistence and gameplay can report incompatible results or repeat an already-effective operation.
- **Trigger / exposure:** Validation, reservation, provider preparation, persistence, event publication and replication are conflated.
- **Upstream lineage:** PRD06-SEED-R3-D02; PRD04-BND-104/106/138/139
- **Existing controls:** Commands are intent; committed events/revisions are facts; strong operations expose explicit commit points.
- **Severity / plausibility / priority:** **CRITICAL / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-04/63/76; FIXTURE-03 + FIXTURE-05 + FIXTURE-04
- **Success / exit evidence:** For every representative C0 operation, trace exactly one declared semantic commit point and prove all secondary side effects derive from that decision.
- **ADR dependency:** ADR — transaction phase/commit semantics
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-Q03 — Reservation leak or permanent starvation

- **Parent:** PRD06-RISK-Q
- **Failure statement:** Failed, cancelled or abandoned operations retain stock, capacity, occupancy or ownership reservations indefinitely.
- **Consequence:** Resources become unavailable, projects deadlock and users/NPCs cannot progress despite no committed consumer.
- **Trigger / exposure:** Timeout, disconnect, worker failure, owner transfer, crash, cancel or provider preparation failure.
- **Upstream lineage:** PRD06-SEED-R3-D03; REQ-MOV-037; UNK-ECON-011; UNK-BIO-006
- **Existing controls:** Reservations have explicit owner, scope, revision, lifecycle and terminal states.
- **Severity / plausibility / priority:** **CRITICAL / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-17/43/69/76; FIXTURE-03 + FIXTURE-04 + FIXTURE-05
- **Success / exit evidence:** Hostile cancellation/crash/reconnect tests must prove every reservation ends in commit, release, expiry or recoverable pending state and cannot permanently strand conserved capacity.
- **ADR dependency:** ADR — reservation representation/lifecycle
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-Q04 — Concurrent reservations overcommit the same scarce resource

- **Parent:** PRD06-RISK-Q
- **Failure statement:** Two operations both believe the same stock/capacity/space is reserved successfully.
- **Consequence:** Overselling, duplicate construction consumption, two occupants in one exclusive slot, negative inventory or impossible movement.
- **Trigger / exposure:** Simultaneous player/NPC/automation/contract/treatment/movement operations at the same revision.
- **Upstream lineage:** UNK-ECON-011; UNK-SOC-006; UNK-MOV-007; REQ-MOV-037
- **Existing controls:** Owner-mediated reservation validation; expected revisions/compatibility rules; deterministic conflict handling.
- **Severity / plausibility / priority:** **CRITICAL / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-17/35/76; FIXTURE-03 + FIXTURE-05
- **Success / exit evidence:** Concurrent attempts against one scarce resource must produce one valid allocation or an explicitly allowed shared-capacity result; total conserved capacity can never exceed authority.
- **ADR dependency:** ADR — locking/reservation conflict policy
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-Q05 — Cancellation, rollback and compensation are conflated

- **Parent:** PRD06-RISK-Q
- **Failure statement:** Stopping pending computation is treated as if committed effects never happened, or compensation rewrites history instead of producing a new governed outcome.
- **Consequence:** Duplicated refunds, ghost construction, erased audit history or impossible recovery after irreversible effects.
- **Trigger / exposure:** Cancel after partial preparation/commit, provider failure after semantic commit, user abort, timeout.
- **Upstream lineage:** PRD06-SEED-R3-D04; PRD04-BND-127/138/139
- **Existing controls:** Cancellation applies to work; rollback/compensation semantics are explicit per transaction class; committed history remains explainable.
- **Severity / plausibility / priority:** **CRITICAL / POSSIBLE / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-04/17/63/76; FIXTURE-03 + FIXTURE-10
- **Success / exit evidence:** Inject cancel at every transaction phase and prove the resulting state/history matches the declared semantics without duplicate undo or silent deletion of committed facts.
- **ADR dependency:** ADR — rollback/compensation policy by transaction class
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-Q06 — Retry/reconnect executes the same consequential operation twice

- **Parent:** PRD06-RISK-Q
- **Failure statement:** A repeated command with the same semantic intent is accepted as a new transaction after loss of acknowledgement or reconnect.
- **Consequence:** Double spending, duplicate items/blocks/payments/treatment, repeated travel or project progress.
- **Trigger / exposure:** Lost ack, retransmit, reconnect, server retry, client timeout or duplicate packet.
- **Upstream lineage:** PRD06-SEED-R3-D05; REQ-MP-030/041; biological/economy idempotency requirements
- **Existing controls:** Persistent operations carry operation/transaction identity; owner can return prior result for committed duplicate.
- **Severity / plausibility / priority:** **CRITICAL / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-35/43/63/76; FIXTURE-05 + FIXTURE-03
- **Success / exit evidence:** Repeated/lost-ack commands across reconnect must resolve to the original operation outcome exactly once; unsafe new IDs for retries must be detectable in fixtures.
- **ADR dependency:** ADR — durable operation-ID/idempotency scheme
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-Q07 — Provider failure occurs after semantic commit

- **Parent:** PRD06-RISK-Q
- **Failure statement:** The world commits a valid authoritative decision but a derived/provider side effect fails or remains stale.
- **Consequence:** Systems may wrongly undo the semantic commit, lie about readiness or block forever waiting for a disposable projection.
- **Trigger / exposure:** Nav bake, mesh/collision rebuild, fluid/vessel projection, animation, network send or non-authoritative provider update fails after commit.
- **Upstream lineage:** PRD06-SEED-R3-D06; PRD04-BND-131/139; consistency C0/C1/C2
- **Existing controls:** Provider failure returns to the owning domain; canonical commit survives unless semantics explicitly require compensation; derived readiness is revisioned.
- **Severity / plausibility / priority:** **CRITICAL / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-33/34/63/76; FIXTURE-02 + FIXTURE-03 + FIXTURE-10
- **Success / exit evidence:** Force each provider failure after C0 commit and prove truth remains coherent, unsafe derived interactions are quarantined, and recovery/retry policy is explicit.
- **ADR dependency:** ADR — provider-degradation/retry policy
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-Q08 — Persistence or packet order redefines canonical transaction order

- **Parent:** PRD06-RISK-Q
- **Failure statement:** The order in which DB writes, voxel writes, journal records, packets or callbacks complete is mistaken for authoritative gameplay order.
- **Consequence:** Clients/recovery disagree on transaction sequence; later operations appear before prerequisites or overwrite earlier truth.
- **Trigger / exposure:** Parallel persistence/replication, network reordering, async provider completion.
- **Upstream lineage:** PRD06-SEED-R3-D07; PRD04-BND-107/138; PKG-H/I
- **Existing controls:** Canonical revisions/events define order; persistence/networking project committed authority rather than inventing it.
- **Severity / plausibility / priority:** **CRITICAL / POSSIBLE / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-35/39/63/69/76; FIXTURE-04 + FIXTURE-05 + FIXTURE-10
- **Success / exit evidence:** Randomize write/send/completion order and prove recovery/client reconciliation reconstructs the same canonical commit sequence from governed identities/revisions.
- **ADR dependency:** ADR — revision/event ordering and projection sequencing
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-Q09 — Transaction correlation trail has gaps

- **Parent:** PRD06-RISK-Q
- **Failure statement:** A consequential action cannot be followed across command, owner, commit, provider work, journal/checkpoint, replication and acknowledgement.
- **Consequence:** Production failures become unexplainable, duplicate handling becomes unsafe and audit/recovery cannot distinguish expected stale work from corruption.
- **Trigger / exposure:** Different subsystems invent unrelated IDs, sampling drops mandatory records or async fan-out loses parent context.
- **Upstream lineage:** PRD06-SEED-R3-D08; PRD04-BND-108; PROOF-63 lineage; REQ-PST-046
- **Existing controls:** Stable correlation/operation identities and bounded structured evidence are production architecture requirements.
- **Severity / plausibility / priority:** **HIGH / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-63/64/65/75; FIXTURE-03 + FIXTURE-09 + FIXTURE-10
- **Success / exit evidence:** One hostile representative transaction must produce an end-to-end bounded trace sufficient to explain commit status, provider readiness, durability and replication without exposing secrets.
- **ADR dependency:** ADR — correlation/trace identity schema
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-Q10 — Universal transaction coordinator becomes bottleneck or new gameplay authority

- **Parent:** PRD06-RISK-Q
- **Failure statement:** A single global coordinator serializes unrelated world operations, owns domain semantics or becomes a deadlock hotspot.
- **Consequence:** World scale collapses and domain ownership is inverted into one central service.
- **Trigger / exposure:** Implementing every operation as a heavyweight global distributed transaction regardless of semantic consistency need.
- **Upstream lineage:** PRD06-SEED-R3-D09; PRD04-BND-103–105; UNK-ARCH-014
- **Existing controls:** Use the minimum consistency protocol per semantic class; coordinator orchestrates but does not redefine domain truth.
- **Severity / plausibility / priority:** **CRITICAL / POSSIBLE / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-17/18/76; FIXTURE-03 + FIXTURE-10
- **Success / exit evidence:** Concurrent independent transactions must scale without one global lock/serial bottleneck while cross-domain operations remain coherent and domain owners retain semantic authority.
- **ADR dependency:** ADR — transaction coordinator topology/pattern
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-Q11 — Cross-domain lock/wait ordering deadlocks

- **Parent:** PRD06-RISK-Q
- **Failure statement:** Two or more owners/providers wait on each other's locks/reservations/tasks in an unbreakable cycle.
- **Consequence:** Simulation stalls permanently, queues grow and shutdown/recovery cannot progress.
- **Trigger / exposure:** Nested synchronous calls, lock while awaiting provider work, reservation cycles, multi-owner movement/construction.
- **Upstream lineage:** UNK-ARCH-014; UNK-MOV-007; dependency G05/G11
- **Existing controls:** Prefer command/prepare/commit protocols over arbitrary nested mutation; bounded waits/timeouts and ownership order must be explicit where locks exist.
- **Severity / plausibility / priority:** **CRITICAL / POSSIBLE / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-17/18/76; FIXTURE-03 + FIXTURE-10
- **Success / exit evidence:** Deadlock-focused fault injection and lock/wait instrumentation must demonstrate no permanent cycles in representative multi-owner operations; timeouts cannot cause partial C0 commit.
- **ADR dependency:** ADR — lock/wait ordering or lock-free orchestration strategy
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-Q12 — Operation-ID scope/collision/reuse breaks idempotency

- **Parent:** PRD06-RISK-Q
- **Failure statement:** Transaction IDs collide, are reused across world/session/domain boundaries or cannot distinguish a retry from a new command.
- **Consequence:** Legitimate actions are suppressed as duplicates or duplicate consequences execute.
- **Trigger / exposure:** Client-generated IDs, truncated IDs, world copy, reconnect, migration, server restart or long-lived worlds.
- **Upstream lineage:** PRD04 Round-3 unknown #7; REQ-MP-030/041; biological transaction-ID requirements
- **Existing controls:** Operation identity is stable and scoped to enough world/domain/source context to be durable.
- **Severity / plausibility / priority:** **CRITICAL / POSSIBLE / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-35/45/48/63; FIXTURE-05 + FIXTURE-04
- **Success / exit evidence:** Generate/replay large operation populations across restart/world copy/reconnect and prove no collisions/reuse ambiguity; committed duplicates return prior results.
- **ADR dependency:** ADR — operation-ID format/scope
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-Q13 — Crash between transaction phases leaves ambiguous pending state

- **Parent:** PRD06-RISK-Q
- **Failure statement:** A process crash during validation/reservation/prepare/commit/event/durability leaves no deterministic recovery interpretation.
- **Consequence:** Resources remain reserved, providers differ from semantic state or recovery repeats an unsafe operation.
- **Trigger / exposure:** Real process kill at every phase of construction, trade, realm travel or other C0 transaction.
- **Upstream lineage:** PRD04-BND-104/132; REQ-PST-053; UNK-PST-016
- **Existing controls:** Transaction phases and durable evidence must be recoverable; persistence does not define gameplay order independently.
- **Severity / plausibility / priority:** **CRITICAL / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-39/43/63/69/76; FIXTURE-04 + FIXTURE-03 + FIXTURE-10
- **Success / exit evidence:** Real-process crash injection at each phase must recover deterministically to committed/rejected/pending/compensated states with no duplicated consumption.
- **ADR dependency:** ADR — transaction journaling/recovery representation
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-Q14 — Compensation fails after irreversible side effects

- **Parent:** PRD06-RISK-Q
- **Failure statement:** A transaction assumes it can roll back after an irreversible or externally visible effect has already occurred.
- **Consequence:** World history contradicts itself; items or damage reappear; external clients/providers observe impossible reversals.
- **Trigger / exposure:** Physical destruction, network-visible outcomes, generated irreversible IDs, external service side effects.
- **Upstream lineage:** PRD06-SEED-R3-D04/D06; PRD04-BND-127/139
- **Existing controls:** Irreversible semantic commit must be identified; later repair is a new explicit transaction where rollback is impossible.
- **Severity / plausibility / priority:** **CRITICAL / POSSIBLE / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-04/33/63/76; FIXTURE-03 + FIXTURE-10
- **Success / exit evidence:** Representative irreversible operations must demonstrate either precommit validation/reservation that prevents unsafe partial effects or explicit forward compensation as new history.
- **ADR dependency:** ADR — transaction reversibility/compensation taxonomy
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-Q15 — Derived C1/C2 readiness is incorrectly folded into C0 atomicity

- **Parent:** PRD06-RISK-Q
- **Failure statement:** A strong semantic transaction waits for every mesh/nav/UI/network projection as if they were all part of one atomic commit, or treats their completion as proof of C0 success.
- **Consequence:** Transactions become slow/deadlock-prone, or provider success falsely defines gameplay truth.
- **Trigger / exposure:** Construction/edit waits synchronously for nav/mesh/particles/replication before declaring semantic commit.
- **Upstream lineage:** PRD04 consistency classes C0/C1/C2; BND-139/171
- **Existing controls:** Semantic commit and derived readiness have different consistency classes; unsafe interactions can quarantine until C1 catches up.
- **Severity / plausibility / priority:** **HIGH / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-17/25/26/34/63; FIXTURE-02 + FIXTURE-03
- **Success / exit evidence:** Construction/edit fixtures must show C0 commit can complete independently of disposable/derived work while consumers expose revision/readiness and do not operate unsafely on stale C1 state.
- **ADR dependency:** ADR — consistency-class mapping per side effect
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-Q16 — Cross-domain construction transaction violates conservation or permissions

- **Parent:** PRD06-RISK-Q
- **Failure statement:** One build action fails to atomically reconcile inventory/reservations, permission, voxel edit, structure identity and authoritative history.
- **Consequence:** Free blocks, lost materials, illegal building, duplicate structures or unrecoverable project state.
- **Trigger / exposure:** Player/NPC/automation construction under stock contention, terrain change, permission change or failure injection.
- **Upstream lineage:** PRD04-PROOF-17; REQ-SET-006; construction/automation requirements
- **Existing controls:** Cross-domain construction is an explicit transaction; reservations and owner commits precede derived provider rebuilds.
- **Severity / plausibility / priority:** **CRITICAL / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-17/63/76; FIXTURE-02 + FIXTURE-03 + FIXTURE-10
- **Success / exit evidence:** Inject failure at each construction stage and prove exact resource conservation, permission enforcement, one structure/voxel outcome and coherent retry/recovery.
- **ADR dependency:** ADR — construction transaction orchestration after proof
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-Q17 — Structure collapse is treated as provider side effect instead of new authority transaction

- **Parent:** PRD06-RISK-Q
- **Failure statement:** Physics/mesh destruction after support loss mutates world blocks/entities directly without a governed collapse decision.
- **Consequence:** Voxel, drops, damage, navigation, persistence and network outcomes diverge.
- **Trigger / exposure:** Large structural edit causes integrity failure/collapse under active providers.
- **Upstream lineage:** PRD04-PROOF-33; BND-139/146; PRD06-SEED-R3-D06
- **Existing controls:** Collapse is a new authoritative transaction triggered by structural evidence; providers consume committed collapse results.
- **Severity / plausibility / priority:** **CRITICAL / POSSIBLE / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-33/63/76; FIXTURE-02 + FIXTURE-03 + FIXTURE-10
- **Success / exit evidence:** Remove supports and force collapse; prove one committed collapse transaction governs block/entity/resource consequences and provider outputs cannot invent extra destruction.
- **ADR dependency:** ADR — structure integrity/collapse transaction interface
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-Q18 — Realm-transition transaction partially commits

- **Parent:** PRD06-RISK-Q
- **Failure statement:** Realm travel changes some of character position/frame/session/portal cost/cooldown/save/network state but not all required authoritative components.
- **Consequence:** Character duplicates, disappears, pays twice, reconnects to wrong realm or loads at invalid arrival.
- **Trigger / exposure:** Portal use, crash/reconnect mid-transition, destination validation failure or server handoff.
- **Upstream lineage:** Round-2 R-B3; UNK-REALM-015; PKG-B/H/I dependencies
- **Existing controls:** Realm transition is a strong cross-domain transaction with explicit source/destination/arrival validation and stable identity.
- **Severity / plausibility / priority:** **CRITICAL / POSSIBLE / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-09/42/63/69/76; FIXTURE-01 + FIXTURE-04 + FIXTURE-05 + FIXTURE-10
- **Success / exit evidence:** Inject failure/reconnect/crash at every realm-transition phase; recover exactly one character in one valid realm/frame with one cost/cooldown outcome.
- **ADR dependency:** ADR — realm-transition transaction protocol
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-Q19 — Whole-stack hostile interaction reveals common-cause transaction failure

- **Parent:** PRD06-RISK-Q
- **Failure statement:** Subsystems that pass isolated proofs fail when generation, construction, vessels, fluids, NPCs, networking, saves, reconnects, content and frame changes overlap.
- **Consequence:** Late systemic corruption appears only at production-like scale and invalidates local proof confidence.
- **Trigger / exposure:** Long mixed workloads with intentional faults, restarts, overload and cross-domain activity.
- **Upstream lineage:** PRD06-SEED-R3-D10; PRD04-PROOF-76
- **Existing controls:** PROOF-76 is explicitly final integration/hostile soak after package-level proofs, not an early shortcut.
- **Severity / plausibility / priority:** **CRITICAL / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-76; FIXTURE-10
- **Success / exit evidence:** Run the final long hostile-world soak after prerequisite proofs and prove ownership, revisions, conservation, queue bounds, checkpoint lineage, reconnect repair and stale-task containment remain coherent together.
- **ADR dependency:** No single implementation ADR; this is a final integration qualification gate
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`


# 37. Cross-Risk Dependency Spine Exposed by Round 3

Round 3 makes several common-cause relationships explicit:

```text
F ownership / revision / lifetime
 ├──► Q transaction commit correctness
 ├──► D persistence recovery of ownership/transactions
 ├──► K reconnect and command idempotency
 ├──► H/I/J provider-derived spatial/vessel consequences
 └──► L headless runtime parity

G CPU / queues / backpressure
 ├──► F stale work and fidelity pressure
 ├──► Q coordinator/reservation latency and deadlock exposure
 ├──► D save durability lag
 ├──► K network/interest lag
 └──► P observability and exported-build qualification

Q transactions
 ├──► C stable semantic/operation identity
 ├──► D journal/checkpoint lineage
 ├──► K retry/reconnect/acknowledgement
 ├──► F owner transfer and stale-result rejection
 └──► every gameplay domain that consumes conserved resources or authority

F + G + Q
 └──► PROOF-76 Whole-Stack Hostile Transaction Soak
```

This prevents a local “thread-safe” or “transaction passed once” result from closing systemic risk while common-cause ownership, backpressure or recovery risk remains open.

# 38. Round-3 Proof Exit Matrix

| Proof | Round-3 risk consumers | Minimum evidence role |
|---|---|---|
| **PROOF-13 — Stale Worker Commit** | F01/F02/F10/F11/F13 | Randomized stale results cannot commit; ownership/revision/lifetime rejection is observable. |
| **PROOF-14 — Partition Ownership Transfer** | F01/F03/F04/F12 | Thousands of transfers under commands/work/crash pressure produce one owner and no duplicate/lost entities. |
| **PROOF-15 — SceneTree-Free Distant Simulation** | F05/F06 | Large persistent simulation runs with zero entity Nodes and promotes without semantic loss. |
| **PROOF-16 — Fidelity Promotion/Demotion** | F06, G10 | Repeated fidelity cycles preserve identity/conservation and do not oscillate uncontrollably under load. |
| **PROOF-17 — Cross-Domain Construction Transaction** | Q01–Q05/Q10/Q11/Q15/Q16 | Failure injection demonstrates explicit commit/reservation/derived-readiness semantics with exact conservation. |
| **PROOF-18 — Cross-Provider CPU Saturation** | G01–G08/G10, Q10/Q11 | Combined providers remain bounded, useful work progresses, and overload/recovery is explicit. |
| **PROOF-19 — Main-Thread Independence** | F05/F07/F13, G05 | Pure domain simulation is independent of SceneTree/render cadence; only required projection/provider commits marshal to main thread. |
| **PROOF-21 — Deterministic Seeded Simulation** | F06/F07/F08/F09, G03 | Selected deterministic domains reproduce governed outcomes with identical semantic inputs. |
| **PROOF-33 — Structure Collapse Transaction** | Q01/Q07/Q14/Q17 | Collapse is one new authoritative transaction, not provider-authored destruction. |
| **PROOF-35 — Duplicate Command / Lost Ack** | Q04/Q06/Q12 | Retry/lost acknowledgement cannot duplicate consequential effects. |
| **PROOF-39/69 — Crash matrices / real process recovery** | F04, Q08/Q13/Q18 | Real crashes leave recoverable ownership/transaction state and one canonical lineage. |
| **PROOF-43 — Reconnect During Inventory Transaction** | Q03/Q06/Q13 | Reconnect resolves original operation identity without double execution or leaked reservations. |
| **PROOF-46/47 — Network/Persistence Backpressure** | G02/G04/G07 | Slow consumers produce bounded degradation without silent loss of C0 work. |
| **PROOF-63 — End-to-End Transaction Trace** | F11, Q01/Q02/Q05–Q09/Q12–Q18 | One correlation trail explains command→owner→commit→providers→durability→replication→ack. |
| **PROOF-68 — Worker-Order Chaos** | F01/F02/F08/F09/F10/F11/F14 | Scheduler/provider completion order cannot change authoritative invariants. |
| **PROOF-75 — Observability Overhead** | G01/G09, Q09 | Required diagnostics remain useful without materially becoming the bottleneck. |
| **PROOF-76 — Whole-Stack Hostile Transaction Soak** | G01–G08/G11, Q01–Q19, dependent F risks | Final integration evidence only after prerequisite package proofs. |

No row above is a proof result. **PRD-08 remains empty by design.**

# 39. ADR Reservation Gates

Round 3 reserves but does not accept the following consequential decisions:

| Future ADR | Must not be accepted before |
|---|---|
| **ADR — Simulation partition / owner model** | F01/F03–F07/F12/F14 plus PROOF-14/15/16/19 evidence. |
| **ADR — Worker proposal/revision envelope** | F02/F08/F10/F11 plus PROOF-13/68 evidence. |
| **ADR — Authoritative RNG / deterministic-domain policy** | F08/F09 plus PROOF-21/68 evidence. |
| **ADR — Cross-provider concurrency budget / scheduler composition** | G01–G11 plus PROOF-18/75 and representative exported-build data. |
| **ADR — Queue/backpressure/degradation thresholds** | G02–G04/G07/G10/G11 plus saturation/backpressure recovery evidence. |
| **ADR — Cross-domain transaction orchestration pattern** | Q01/Q02/Q05/Q07/Q10/Q11/Q13–Q16 plus PROOF-17/63 and crash evidence. |
| **ADR — Reservation representation/conflict/lifecycle** | Q03/Q04 plus construction/economy/movement/treatment contention fixtures. |
| **ADR — Durable operation-ID / idempotency scheme** | Q06/Q12 plus reconnect/restart/world-copy duplicate-command evidence. |
| **ADR — Transaction journaling/recovery representation** | Q08/Q13/Q18 plus PKG-I crash/checkpoint proofs. |
| **ADR — Consistency-class mapping for provider side effects** | Q07/Q15/Q17 plus provider degradation/readiness evidence. |

A failed candidate may eliminate one branch; it does not automatically close the parent family.

# 40. PRD-07 Fixture Requirements Added by Round 3

## FIXTURE-03 — Partitioned Simulation + Worker/Revision Chaos Harness

Must now support at least:

- multiple explicit authoritative owners/partitions;
- owner lookup by stable semantic ID independent of SceneTree;
- ownership epochs and transfer under command load;
- versioned snapshots/proposals and deliberate stale-result completion;
- randomized worker completion order and thread-count variation;
- controlled authoritative RNG streams;
- zero-Node distant settlement/ecology/economy fixtures;
- repeated fidelity promotion/demotion with conserved-state comparison;
- property-level active-projection ownership checks;
- task lifetime tied to WorldSession/owner epochs;
- queue depth **and queue age** telemetry;
- dephased/catch-up simulation workloads;
- injected provider callbacks attempting forbidden foreign mutation;
- representative cache destruction/rebuild.

## FIXTURE-10 — Combined Hostile-World Soak

Round-3 adds the requirement that the final soak include concurrent:

- worldgen and player/NPC construction;
- owner transfer / realm or vessel frame changes;
- near/far simulation transitions;
- provider task supersession and failures;
- constrained CPU and intentionally slow I/O;
- duplicate/lost/retried network commands;
- reservation contention;
- save/checkpoint pressure;
- reconnect and process restart;
- structure-collapse or another irreversible consequential event;
- diagnostic tracing at release-like overhead.

`PROOF-76` remains a final integration soak; it cannot substitute for missing package-level proof results.

## FIXTURE-04 / FIXTURE-05 supporting additions

Crash/recovery and network fixtures must carry:

- transaction/operation ID;
- owning domain/partition and ownership epoch where relevant;
- expected/source revision;
- explicit transaction phase/commit state;
- reservation identity/lifecycle;
- canonical commit revision;
- correlation IDs linking persistence/replication/provider work.

# 41. Round-3 Open Implementation Questions Preserved

Round 3 deliberately leaves these choices open:

1. Exact first simulation partition types and sizes.
2. Spatial owner vs settlement/faction/service owner choices for distant entities.
3. Ownership-transfer lease/handoff representation.
4. Owner directory/routing implementation.
5. Concrete worker proposal/revision token representation.
6. Exact use of Godot WorkerThreadPool versus Leyforge-owned queues/threads.
7. Cross-provider CPU budget and thread-count policy.
8. Queue capacities, age thresholds, admission control and hysteresis.
9. Scheduler dephasing/catch-up algorithm.
10. Exact authoritative RNG stream/context representation.
11. Cross-domain transaction coordinator topology.
12. Lock-based, lock-free, saga-like or other transaction orchestration details.
13. Reservation storage/conflict/deadlock policy.
14. Operation-ID encoding/scope.
15. Cancellation/rollback/forward-compensation rules by transaction class.
16. Transaction journaling/checkpoint integration.
17. Consistency-class mapping for individual provider side effects.
18. Exact whole-stack soak duration/load/hardware acceptance thresholds.

These are not documentation gaps. They are intentionally routed implementation/proof questions.

# 42. Round-3 Integrity Checks

| Check | Result |
|---|---|
| Parent risk families F/G/Q preserved unchanged | **PASS — 3/3** |
| Stable child-risk IDs created | **PASS — 44/44** |
| Child IDs unique | **PASS — 44/44** |
| PRD-05 Round-3 seeds C01–C10 consumed | **PASS — 10/10** |
| PRD-05 Round-3 seeds D01–D10 consumed | **PASS — 10/10** |
| Earlier realm-transition risk R-B3 consumed into Q18 | **PASS** |
| One-writer/owner-commit law preserved | **PASS** |
| SceneTree remains projection, not persistent simulation authority | **PASS** |
| Scheduler/provider thread execution does not confer authority | **PASS** |
| C0/C1/C2 consistency distinction preserved | **PASS** |
| Cancellation remains distinct from rollback/compensation | **PASS** |
| PROOF-76 remains final integration soak | **PASS** |
| Exact scheduler/thread counts remain unlocked | **PASS** |
| Exact transaction coordinator/locking/journal remains unlocked | **PASS** |
| Current PRD-08 proof results created | **PASS — 0** |
| Implementation ADRs accepted | **PASS — 0** |
| PRD-04 / PRD-05 reopen candidates | **PASS — 0** |

# 43. Round-3 Closure Verdict

> **ROUND 3 PASS — OWNERSHIP / CONCURRENCY / TRANSACTION RISK DECOMPOSITION COMPLETE.**

Round 3 converts F/G/Q into **44 stable, falsifiable child risks** with explicit proof exits and downstream ADR reservations.

The most consequential conclusions are:

1. **Thread safety is not authority safety.** Even perfectly synchronized code is wrong if two systems are permitted to commit the same semantic state.
2. **Worker lifetime and ownership epoch are as important as thread safety.** Results must be invalidated by session/owner/revision changes.
3. **Cross-provider scheduling must be budgeted above individual pools.** Godot and Voxel Tools can each use workers correctly while jointly oversubscribing CPU or starving latency.
4. **Backpressure is semantic.** C0 consequential transactions cannot be silently coalesced like stale mesh/nav/UI work.
5. **A transaction needs one explicit semantic commit point.** Persistence completion, packet order, callback order and provider readiness are projections/evidence, not alternative commit definitions.
6. **Rollback is not the universal answer.** Some effects require reservation-before-commit or forward compensation as new authoritative history.
7. **PROOF-76 remains the final common-cause test.** It becomes meaningful only after the package-level ownership, concurrency, transaction, network and persistence proofs exist.

No Round-3 finding requires PRD-04 or PRD-05 reopening.

# 44. Machine-Readable Round-3 Summary

```yaml
document: PRD-06
version: v0.3
round: 3
status: WORKING
round_status: PASS
parent_families_decomposed: [F, G, Q]
child_risks:
  F: 14
  G: 11
  Q: 19
  total: 44
severity_counts:
  critical: 33
  high: 11
plausibility_counts:
  likely: 26
  possible: 18
priority_counts:
  p0: 42
  p1: 2
round3_seed_intake:
  c_seeds_consumed: 10
  d_seeds_consumed: 10
  earlier_r_b3_consumed: true
proof_results_created: 0
implementation_adrs_created: 0
architecture_reopen_candidates: 0
technology_refresh_date: 2026-09-05
next_round: Voxel / Collision / Navigation / Fluid / Vessel Risks
```

---

**End of PRD-06 v0.3 — Round 3 Working Baseline**

---

# 45. Round-4 Scope and Controlled Technology Refresh

Round 4 decomposes **PRD06-RISK-E, PRD06-RISK-H, PRD06-RISK-I and PRD06-RISK-J** into stable child risks covering deterministic world generation, authoritative voxel edits, derived collision/navigation readiness, scalable conserved fluids/oceans and moving editable vessel architecture.

This round does **not** select the exact navigation implementation, tile sizes, fluid solver/precision, ocean-local activation algorithm, vessel local-grid format, hull collision proxy, buoyancy approximation, docking model or vessel size limits. Those remain PRD-07/08 evidence and ADR questions.

Current provider documentation was refreshed on **5 September 2026** only where it changes risk confidence or proof design:

| Current technology fact | Risk consequence |
|---|---|
| Godot NavigationServer can bake from reusable/procedural source geometry asynchronously; parsing source geometry from SceneTree remains main-thread work, and visual-mesh extraction can stall rendering. | Strengthens H05/H10 and the candidate preference for simplified procedural source geometry rather than repeatedly parsing presentation meshes. |
| Godot `ConcavePolygonShape3D` is intended primarily for static collision and is documented as a poor fit for moving RigidBody/CharacterBody use; convex/compound alternatives are recommended for dynamic concave objects. | Strengthens J03/J12 and keeps PROOF-31 a mandatory strategy matrix. |
| Voxel Tools terrain collision is generated as static mesh-collider blocks; its performance documentation says moving terrain is possible but correct surface physics should not be expected while it moves. | Strengthens J01 and preserves the separate VesselDomain/VesselFrame architecture. |
| Voxel Tools `VoxelMesher` can manually build meshes from standalone padded `VoxelBuffer` volumes. | Supports J09 as a plausible finite-vessel adapter path, but does not qualify collision/edit performance. |
| Voxel Tools exposes blocky-fluid visual models but does not provide Leyforge's conserved ocean/local-fluid authority. | Leaves I01–I12 squarely Leyforge-owned and proof-gated. |

These are **P1 technology facts only**. They create no PRD-08 proof result and no implementation ADR.

# 46. Round-4 Stable Child-Risk Register

Round 4 creates **55 stable child risks**:

- **E — Deterministic worldgen / late generation / voxel authority:** 11
- **H — Collision / navigation / derived readiness:** 14
- **I — Conserved local fluid / ocean boundary:** 12
- **J — Moving editable vessels:** 18

The IDs below are stable for later PRD-07/08 evidence.

## 46.1 PRD06-RISK-E — Deterministic worldgen / voxel-authority risks

### PRD06-RISK-E01 — Direct provider voxel mutation bypasses canonical commit

- **Parent:** PRD06-RISK-E
- **Failure statement:** Gameplay or provider code edits Zylann terrain directly without a Leyforge-owned semantic transaction/revision.
- **Consequence:** Save, network, fluid, structure, collision and navigation state can disagree with visible terrain.
- **Trigger / exposure:** VoxelTool calls, generator/provider callbacks, debug tools, structure builders or migration code bypass VoxelFacade/owner commit.
- **Upstream lineage:** PRD06-SEED-R4-E01; PRD05-XW-0149–0151/0177/0208; PRD04-BND-161/169–171/532
- **Existing controls:** Canonical edit intent is committed by Leyforge first; providers receive revisioned materialisation work.
- **Severity / plausibility / priority:** **CRITICAL / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-23/24/67; FIXTURE-02 + FIXTURE-10
- **Success / exit evidence:** Architecture lint plus hostile edit fixtures prove all consequential voxel changes have one semantic operation/revision and provider-only edits cannot silently become world truth.
- **ADR dependency:** ADR — VoxelFacade edit/commit API and enforcement boundary
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-E02 — Late generation overwrites newer committed edit

- **Parent:** PRD06-RISK-E
- **Failure statement:** Delayed generator output is applied after a newer player/system edit to the same canonical volume.
- **Consequence:** Construction/destruction disappears, saves diverge and generation order becomes gameplay authority.
- **Trigger / exposure:** Slow generation, chunk reload, worker reordering, realm/worldgen catch-up or edits at generation boundaries.
- **Upstream lineage:** PRD06-SEED-R4-E02; PRD04-PROOF-24; PRD04-BND-168/170; PRD05-XW-0209
- **Existing controls:** Committed edits outrank generated baseline; generation results carry source revision/epoch and remain proposals.
- **Severity / plausibility / priority:** **CRITICAL / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-24/68; FIXTURE-02 + FIXTURE-03
- **Success / exit evidence:** Delay generation deliberately across edits and randomized worker order; the newest canonical edit must survive every run and reload.
- **ADR dependency:** ADR — generation-vs-edit merge/revision policy
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-E03 — Worldgen result depends on worker/core execution order

- **Parent:** PRD06-RISK-E
- **Failure statement:** Canonical generated terrain/sites differ when task ordering, thread count or chunk request order changes.
- **Consequence:** Same seed produces different worlds across machines, servers or reload histories.
- **Trigger / exposure:** Neighbor-dependent generation, shared mutable RNG/state, parallel structure placement or order-sensitive postprocessing.
- **Upstream lineage:** PRD06-SEED-R3-C09; PRD04-PROOF-21/68; REQ-DEV-075; Round-8 historical worldgen evidence
- **Existing controls:** Deterministic seeded semantics; authoritative randomness explicit; generator workers cannot read future completion order as input.
- **Severity / plausibility / priority:** **CRITICAL / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-21/68; FIXTURE-03 + FIXTURE-10
- **Success / exit evidence:** Same seed/config under varied core counts, request orders and worker completion orders yields identical canonical generated records where determinism is required.
- **ADR dependency:** ADR — deterministic worldgen seed/context and generation dependency model
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-E04 — Loaded-border edit limitation leaks into canonical edit law

- **Parent:** PRD06-RISK-E
- **Failure statement:** Provider inability to edit outside currently loaded/full-resolution terrain is mistaken for Leyforge inability to accept canonical remote edits.
- **Consequence:** Remote construction, automation, simulation or server operations fail based on presentation/streaming state.
- **Trigger / exposure:** Voxel Tools `is_area_editable()`/LOD limitations, distant settlement work, remote admin or server-side simulation.
- **Upstream lineage:** PRD05-XW-0151; Voxel Tools scripting boundary/LOD limitation; PRD04-BND-161/168
- **Existing controls:** Canonical edit authority is provider-independent; unavailable provider materialisation can queue/rebuild later.
- **Severity / plausibility / priority:** **HIGH / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-23/34/67; FIXTURE-02 + FIXTURE-03
- **Success / exit evidence:** Commit valid edits while provider cells are absent/unloaded, then stream/materialise them and prove exact canonical result without duplicate application.
- **ADR dependency:** ADR — unloaded canonical voxel edit staging/materialisation path
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-E05 — Provider chunk/block dimensions become universal world partition law

- **Parent:** PRD06-RISK-E
- **Failure statement:** Voxel Tools 16³ data chunks or 16/32 mesh blocks are copied into save, simulation, nav, fluid, network or worldgen authority boundaries.
- **Consequence:** Provider swaps/upgrades become breaking schema changes and small edits trigger inappropriate cross-domain work.
- **Trigger / exposure:** Convenience reuse of provider coordinates/blocks across systems.
- **Upstream lineage:** PRD05-XW-0150; PRD04-BND-061/161; REQ-ARCH-009
- **Existing controls:** Provider coordinates remain adapter-local; each Leyforge domain chooses its own governed partition semantics.
- **Severity / plausibility / priority:** **HIGH / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-03/23/67; FIXTURE-01 + FIXTURE-02
- **Success / exit evidence:** Provider swap/configuration changes must not alter canonical IDs/partitions; crosswalk/lint proves no persistent schema depends on provider block size.
- **ADR dependency:** ADR — voxel adapter partition mapping only after provider proof
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-E06 — Generated structures/sites race with committed occupancy or edits

- **Parent:** PRD06-RISK-E
- **Failure statement:** Late structure/site generation assumes pristine terrain and overlaps or erases committed player/civilisation state.
- **Consequence:** Buildings, roads, ruins or resources collide with player edits and may duplicate or overwrite authored state.
- **Trigger / exposure:** Distant generation materialises after settlement expansion, edits, claims or migration from older worldgen.
- **Upstream lineage:** REQ-WGEN-033; PRD04-PROOF-24; historical Stage-A/B compatibility evidence
- **Existing controls:** Higher-level generated records are canonical inputs; materialisation checks current revision/claims and never overwrites newer authority silently.
- **Severity / plausibility / priority:** **CRITICAL / POSSIBLE / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-24/17; FIXTURE-02 + FIXTURE-03
- **Success / exit evidence:** Generate/materialise structures after conflicting committed edits/claims and prove deterministic reject/adapt/quarantine behavior without data loss.
- **ADR dependency:** ADR — generated-record materialisation conflict policy
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-E07 — Worldgen version/migration silently regenerates old terrain

- **Parent:** PRD06-RISK-E
- **Failure statement:** Loading a world under a newer generator reinterprets already-established canonical regions without explicit migration.
- **Consequence:** Terrain/site identity changes underneath saves, settlements or player memory.
- **Trigger / exposure:** Generator upgrade, pack change, world copy, missing generated cache or historical save migration.
- **Upstream lineage:** REQ-PST/Worldgen compatibility lineage; PRD05 Round-8 historical evidence; dependency PKG-I
- **Existing controls:** World/checkpoint binds generator/version/config identity; old established state is not retroactively regenerated by convenience.
- **Severity / plausibility / priority:** **CRITICAL / POSSIBLE / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-48/58/69 + PROOF-24; FIXTURE-04 + FIXTURE-02
- **Success / exit evidence:** Open old-world fixtures under new generator versions and prove established regions retain their committed meaning or pass an explicit migration path.
- **ADR dependency:** ADR — generator-version compatibility/migration policy
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-E08 — Generator fallback invents unrecorded alternative canonical layout

- **Parent:** PRD06-RISK-E
- **Failure statement:** A failed seed/site plan silently substitutes a fallback layout not represented in canonical world identity.
- **Consequence:** Same seed/config can produce different worlds depending on transient validation/order conditions.
- **Trigger / exposure:** Worldgen validation failure, unavailable provider feature, placement conflict or historical fallback behavior.
- **Upstream lineage:** Historical Stage-A policy rejecting fallback; PRD-01 deterministic worldgen requirements
- **Existing controls:** Validation failure is explicit and identity-bearing; fallback cannot masquerade as the requested generated result.
- **Severity / plausibility / priority:** **HIGH / POSSIBLE / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-21/24; FIXTURE-03
- **Success / exit evidence:** Force deterministic planner/materialisation failures and prove the result is reproducible reject/quarantine or explicitly versioned alternative, never hidden substitution.
- **ADR dependency:** ADR — generation failure/fallback policy
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-E09 — Worldgen semantic record and voxel materialisation diverge

- **Parent:** PRD06-RISK-E
- **Failure statement:** Higher-level generated site/biome/resource records say one thing while materialised voxels show another.
- **Consequence:** Simulation, map knowledge, resources, structures and navigation reason about a world different from what players interact with.
- **Trigger / exposure:** Materialisation failure, provider bug, stale cache, partial generation, pack mismatch.
- **Upstream lineage:** REQ-WGEN-033; PRD04-BND-532/543; PRD05-XW-0183
- **Existing controls:** Generated records and voxel projection have explicit revision lineage and validation boundaries.
- **Severity / plausibility / priority:** **CRITICAL / POSSIBLE / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-23/24/34; FIXTURE-02 + FIXTURE-10
- **Success / exit evidence:** Corrupt/fail materialisation and prove canonical generated record remains intact, mismatch is observable, and rebuild restores the expected projection.
- **ADR dependency:** ADR — worldgen record↔voxel conformance validation
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-E10 — Large edit/generation fan-out overwhelms derived systems

- **Parent:** PRD06-RISK-E
- **Failure statement:** A valid large generated/edited region creates unbounded remesh/collision/nav/fluid/save/network invalidation.
- **Consequence:** Latency spikes, queue collapse and partial readiness despite semantically correct edits.
- **Trigger / exposure:** Megaproject excavation, cave collapse, worldgen materialisation, explosions or bulk Forge/admin operations.
- **Upstream lineage:** PRD06-SEED-R4-E04 dependency; PRD04-PROOF-23; RISK-G queue/backpressure
- **Existing controls:** SpatialChangeSet is bounded/coalescible and consumers own their invalidation budgets.
- **Severity / plausibility / priority:** **HIGH / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-23/18/76; FIXTURE-02 + FIXTURE-10
- **Success / exit evidence:** Apply representative bulk changes and prove bounded fan-out, coalescing and recovery with no lost C0 edit semantics.
- **ADR dependency:** ADR — SpatialChangeSet batching/coalescing granularity
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-E11 — Generation/projection recovery replays the same canonical edit twice

- **Parent:** PRD06-RISK-E
- **Failure statement:** Recovery or rematerialisation treats an already committed edit as new work rather than idempotent projection.
- **Consequence:** Duplicate drops/structure changes, repeated resource consumption or terrain drift after restart.
- **Trigger / exposure:** Crash between canonical commit and provider persistence/materialisation, checkpoint replay or cache rebuild.
- **Upstream lineage:** PRD04-PKG-D/I dependencies; operation-ID/idempotency law; PRD05-XW-0208/0209
- **Existing controls:** Canonical operation IDs/revisions separate semantic commit from repeatable projection work.
- **Severity / plausibility / priority:** **CRITICAL / POSSIBLE / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-24/39/69; FIXTURE-02 + FIXTURE-04
- **Success / exit evidence:** Crash/replay around voxel commits must reconstruct projection exactly once semantically even if provider work is retried multiple times.
- **ADR dependency:** ADR — voxel projection replay/idempotency contract
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

## 46.2 PRD06-RISK-H — Collision / navigation / readiness risks

### PRD06-RISK-H01 — Readiness collapsed into one loaded/ready flag

- **Parent:** PRD06-RISK-H
- **Failure statement:** Data, mesh, collision, navigation, fluid and other derived readiness are represented as one boolean.
- **Consequence:** Actors operate on missing collision/nav or systems deadlock waiting for unrelated presentation work.
- **Trigger / exposure:** Streaming/materialisation marks a region loaded before all required consumer revisions catch up.
- **Upstream lineage:** PRD06-SEED-R4-E03; PRD04-BND-171/172; PRD05-XW-0180/0181
- **Existing controls:** Readiness is multidimensional, revisioned and consumer-specific.
- **Severity / plausibility / priority:** **CRITICAL / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-25/26/34; FIXTURE-02
- **Success / exit evidence:** Fixtures independently delay/fail each derived product and prove consumers gate only on required dimensions/revisions.
- **ADR dependency:** ADR — readiness vector/state representation
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-H02 — One edit causes spatial invalidation explosion

- **Parent:** PRD06-RISK-H
- **Failure statement:** A small canonical edit dirties an excessive or recursively expanding mesh/collision/nav/fluid region.
- **Consequence:** Edit latency and queues explode; players can weaponize tiny edits into performance denial.
- **Trigger / exposure:** Boundary edits, nav tile overlap, fluid topology, structure support or conservative invalidation code.
- **Upstream lineage:** PRD06-SEED-R4-E04; PRD04-PROOF-23/26
- **Existing controls:** SpatialChangeSet carries bounded affected extents and consumers independently compute minimal dirty regions.
- **Severity / plausibility / priority:** **CRITICAL / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-23/26/18; FIXTURE-02 + FIXTURE-10
- **Success / exit evidence:** Measure fan-out from isolated and burst edits; dirty work remains bounded/predictable and coalesces without missing true dependencies.
- **ADR dependency:** ADR — invalidation index/tile dimensions after benchmark
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-H03 — Mover traverses stale collision after destructive/additive edit

- **Parent:** PRD06-RISK-H
- **Failure statement:** Physics collision revision lags canonical terrain while active movers continue as if it were current.
- **Consequence:** Players/NPCs fall through new holes, walk through new walls or get trapped inside rebuilt collision.
- **Trigger / exposure:** Rapid mining/building, async collider rebuild, provider failure or region promotion.
- **Upstream lineage:** PRD06-SEED-R4-E05; PRD04-PROOF-25; PRD05-XW-0210
- **Existing controls:** Collision readiness/revision quarantine; canonical edit remains committed while unsafe traversal is gated/reconciled.
- **Severity / plausibility / priority:** **CRITICAL / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-25/34; FIXTURE-02
- **Success / exit evidence:** Open/close floors and walls under movers while delaying/failing collider rebuild; no mover may cross a geometry state not valid under the declared safety policy.
- **ADR dependency:** ADR — collision quarantine/mover reconciliation policy
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-H04 — Navigation route remains valid across removed support/bridge

- **Parent:** PRD06-RISK-H
- **Failure statement:** Agents follow paths computed against an older traversability revision after destructive edits.
- **Consequence:** NPCs walk into voids/hazards or repeatedly fail/stall at destroyed geometry.
- **Trigger / exposure:** Bridge/floor removal, door topology change, construction or terrain collapse during route use.
- **Upstream lineage:** PRD06-SEED-R4-E06; PRD04-PROOF-26; PRD05-XW-0211
- **Existing controls:** Paths/routes are disposable proposals bound to nav/source revisions; physical safety is independently enforced.
- **Severity / plausibility / priority:** **CRITICAL / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-26/25; FIXTURE-02
- **Success / exit evidence:** Destroy/rebuild heavily used routes and prove stale route rejection/replan, immediate physical safety and newest-revision publication.
- **ADR dependency:** ADR — path revision/dirty bridge protocol
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-H05 — SceneTree/render-mesh navigation parsing stalls main thread/GPU

- **Parent:** PRD06-RISK-H
- **Failure statement:** Runtime nav rebuild repeatedly parses SceneTree or visual meshes for edited voxel regions.
- **Consequence:** Main-thread/render stalls appear during normal building/mining and scale poorly with multiple profiles.
- **Trigger / exposure:** Using Godot SceneTree parsing for every voxel edit or reading detailed render meshes back from GPU.
- **Upstream lineage:** PRD06-SEED-R4-E07; current Godot navigation docs; PRD05-XW-0156/0157
- **Existing controls:** Procedural/simplified source geometry derived from canonical occupancy/shape is the preferred candidate; bake can be asynchronous.
- **Severity / plausibility / priority:** **HIGH / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-26/18; FIXTURE-02 + FIXTURE-09
- **Success / exit evidence:** Compare source-generation paths under edit bursts and prove supported runtime lane avoids unacceptable main-thread/GPU stalls.
- **ADR dependency:** ADR — navigation source-geometry generation path
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-H06 — Surface navigation is forced onto volumetric movement domains

- **Parent:** PRD06-RISK-H
- **Failure statement:** Swimming, flying, climbing or other volumetric movement is represented by unsuitable surface-nav assumptions.
- **Consequence:** Agents cannot route correctly through water/air/caves/vessels or exploit invalid shortcuts.
- **Trigger / exposure:** Attempting to use one NavigationMesh provider for all locomotion classes.
- **Upstream lineage:** PRD06-SEED-R4-E08; PRD05-XW-0155/0160; UNK navigation implementation cluster
- **Existing controls:** Navigation is hybrid/provider-based; movement capability semantics are Leyforge-owned.
- **Severity / plausibility / priority:** **HIGH / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-26/67; FIXTURE-02 + FIXTURE-06
- **Success / exit evidence:** Representative ground/swim/fly/vessel movers obtain valid routes through the correct provider/graph while preserving common semantic constraints.
- **ADR dependency:** ADR — navigation provider matrix by movement capability
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-H07 — Provider failure after semantic edit silently rolls back or corrupts truth

- **Parent:** PRD06-RISK-H
- **Failure statement:** Nav/collision/mesh/fluid provider failure is treated as if the canonical edit never committed, or leaves an unreported incompatible projection.
- **Consequence:** World truth becomes provider-dependent or users interact with unsafe stale derived state.
- **Trigger / exposure:** Bake error, collider creation failure, provider task cancellation, resource exhaustion.
- **Upstream lineage:** PRD06-SEED-R4-X01; PRD04-PROOF-34; Q07
- **Existing controls:** Provider failure is evidence/degradation returned to the owner; canonical commit survives unless explicit compensation semantics apply.
- **Severity / plausibility / priority:** **CRITICAL / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-34/63; FIXTURE-02 + FIXTURE-10
- **Success / exit evidence:** Inject each provider failure after commit and prove coherent truth, observable degraded readiness and bounded retry/quarantine.
- **ADR dependency:** ADR — provider degradation/retry policy
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-H08 — Navigation avoidance is mistaken for collision or route validity

- **Parent:** PRD06-RISK-H
- **Failure statement:** Local avoidance output is treated as authoritative physical safety or topology proof.
- **Consequence:** Agents can steer through removed terrain, obstacles or forbidden regions because avoidance lacks physics/canonical topology knowledge.
- **Trigger / exposure:** Conflating Godot navigation pathfinding, avoidance and physics collision systems.
- **Upstream lineage:** PRD05-XW-0158; Godot navigation evidence; PRD04-BND-173/185
- **Existing controls:** Path topology, avoidance and physical collision remain separate evidence/providers under movement authority.
- **Severity / plausibility / priority:** **HIGH / POSSIBLE / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-25/26/67; FIXTURE-02
- **Success / exit evidence:** Disable/delay each subsystem independently and prove no subsystem claims safety guarantees it does not provide.
- **ADR dependency:** ADR — movement query/validation pipeline
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-H09 — Agent profile explosion multiplies nav rebuild cost

- **Parent:** PRD06-RISK-H
- **Failure statement:** Different radii/heights/abilities create too many independently rebuilt navigation products.
- **Consequence:** Memory, bake time and invalidation work grow combinatorially with creature/civilisation diversity.
- **Trigger / exposure:** Many humanoid sizes, mounts, vehicles, monsters and accessibility/path capability variants.
- **Upstream lineage:** REQ movement/creature diversity; Godot source geometry reuse capability; PRD05-XW-0156
- **Existing controls:** Profiles should share source geometry and use bounded capability classes where semantically valid.
- **Severity / plausibility / priority:** **HIGH / POSSIBLE / P1**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-26/18; FIXTURE-02 + FIXTURE-10
- **Success / exit evidence:** Benchmark representative profile counts and prove source reuse/tiling keeps bake latency/memory within later accepted budgets.
- **ADR dependency:** ADR — navigation profile taxonomy/tile cache strategy
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-H10 — Nav publication accepts an older bake after a newer one

- **Parent:** PRD06-RISK-H
- **Failure statement:** Asynchronous bakes complete out of order and an older result replaces newer traversability.
- **Consequence:** Destroyed obstacles reappear in pathing or new bridges disappear until another rebuild.
- **Trigger / exposure:** Rapid consecutive edits and multiple async nav jobs for the same tile/region.
- **Upstream lineage:** PRD04 worker/revision law; PRD05-XW-0192; dependency F02
- **Existing controls:** Nav products carry source/target revisions; only newest compatible result may publish.
- **Severity / plausibility / priority:** **CRITICAL / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-26/68; FIXTURE-02 + FIXTURE-03
- **Success / exit evidence:** Force out-of-order bake completion and prove stale products are rejected while newest compatible revision publishes once.
- **ADR dependency:** ADR — nav tile revision/publication contract
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-H11 — Collision shape semantics diverge from canonical block/model semantics

- **Parent:** PRD06-RISK-H
- **Failure statement:** Provider collision AABBs/meshes encode a shape different from the canonical gameplay shape/state.
- **Consequence:** Harvesting, occupancy, pathing, project surveys and physics disagree on what space a block occupies.
- **Trigger / exposure:** Complex voxel models, doors/stairs/slabs, stateful machines, provider import/bake mismatch.
- **Upstream lineage:** PRD05-XW-0149/0188; FCC-13 representation rules; ART/Forge downstream boundaries
- **Existing controls:** Semantic shape/state is Leyforge-owned; provider collision is a validated projection.
- **Severity / plausibility / priority:** **CRITICAL / POSSIBLE / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-23/67; FIXTURE-02 + FIXTURE-07
- **Success / exit evidence:** Representative shape/state matrix must show collision, canonical occupancy and path/source geometry agree within declared contract across provider lanes.
- **ADR dependency:** ADR — semantic shape/collision projection schema
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-H12 — Spatial invalidation cycles indefinitely between derived consumers

- **Parent:** PRD06-RISK-H
- **Failure statement:** Collision/nav/fluid/structure/presentation updates trigger each other as fresh canonical edits instead of derived consequences.
- **Consequence:** One edit creates infinite or repeated work and may mutate truth multiple times.
- **Trigger / exposure:** Provider callbacks emit edits, nav updates trigger structure recalculation, fluid materialisation emits semantic fluid changes recursively.
- **Upstream lineage:** PRD04-BND-139/171; Q07; PRD05 Round-4 architecture boundary
- **Existing controls:** Derived products cannot invent canonical edits; any consequential feedback is a new explicit domain transaction.
- **Severity / plausibility / priority:** **CRITICAL / POSSIBLE / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-23/34/63; FIXTURE-02 + FIXTURE-10
- **Success / exit evidence:** Instrument causal lineage from an edit and prove the derived graph terminates; any new C0 consequence has a distinct governed operation ID.
- **ADR dependency:** ADR — SpatialChangeSet/event causal-loop controls
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-H13 — Unloaded/partially ready terrain becomes traversable due to optimistic spawn/promotion

- **Parent:** PRD06-RISK-H
- **Failure statement:** Actors are promoted/spawned before required ground/collision/path readiness exists.
- **Consequence:** Actors fall through sky, snap onto late terrain or become stuck in invalid occupancy.
- **Trigger / exposure:** Fast travel, streaming spikes, raids/spawns, vessel boarding or reconnect near unloaded terrain.
- **Upstream lineage:** Historical POC chunk-ready spawn regression; PRD04 readiness law
- **Existing controls:** Promotion requires the domain-specific readiness dimensions needed for safe occupancy.
- **Severity / plausibility / priority:** **CRITICAL / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-25/37/34; FIXTURE-02 + FIXTURE-05
- **Success / exit evidence:** Teleport/spawn under delayed mesh/collision/nav and prove actors remain authoritative but unpromoted/quarantined until safe readiness.
- **ADR dependency:** ADR — actor promotion readiness policy
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-H14 — Navigation cache cannot be rebuilt from canonical state

- **Parent:** PRD06-RISK-H
- **Failure statement:** Nav tiles/graphs accumulate unique hidden state or hand edits not derivable from world semantics.
- **Consequence:** Cache corruption becomes world corruption; provider upgrades require save migration of disposable nav state.
- **Trigger / exposure:** Persisting nav products as authority, manual runtime modifications, missing source geometry lineage.
- **Upstream lineage:** PRD04-PROOF-22 dependency; BND-185/186; cache/read-model law
- **Existing controls:** Navigation products are rebuildable derived state with versioned source inputs.
- **Severity / plausibility / priority:** **HIGH / POSSIBLE / P1**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-22/26/67; FIXTURE-01 + FIXTURE-02
- **Success / exit evidence:** Delete nav cache and rebuild representative worlds with equivalent path semantics; provider upgrade cannot require semantic world rewrite solely for nav cache.
- **ADR dependency:** ADR — nav cache persistence/rebuild policy
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

## 46.3 PRD06-RISK-I — Conserved fluid / ocean-boundary risks

### PRD06-RISK-I01 — Fluid volume conservation drifts across simulation operations

- **Parent:** PRD06-RISK-I
- **Failure statement:** Breaches, pumps, transfers, settling or numerical updates create/delete authoritative liquid without declared sources/sinks.
- **Consequence:** Flooding, agriculture, machines, vessels and survival outcomes become exploitable or inconsistent.
- **Trigger / exposure:** Local solver updates, cross-cell transfer, pump cycles, save/load or repeated activation.
- **Upstream lineage:** PRD06-SEED-R4-F01; PRD04-BND-194–198; PRD05-XW-0214/0215
- **Existing controls:** Fluid semantic volume/type and explicit sources/sinks are Leyforge-owned conserved quantities.
- **Severity / plausibility / priority:** **CRITICAL / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-27/28/32; FIXTURE-02 + FIXTURE-06
- **Success / exit evidence:** Closed-volume fixtures across breaches/pumps/settling/save-load maintain mass balance within a proof-defined tolerance or exact discrete invariant.
- **ADR dependency:** ADR — fluid conserved representation/precision after prototype
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-I02 — Global ocean represented as unbounded active fluid cells

- **Parent:** PRD06-RISK-I
- **Failure statement:** Minecraft-scale oceans are simulated at local-fluid resolution everywhere.
- **Consequence:** CPU/memory cost becomes proportional to ocean volume and destroys scalability.
- **Trigger / exposure:** Naive one-water-voxel/one-simulation-cell architecture or always-active wave/current solver.
- **Upstream lineage:** PRD06-SEED-R4-F02; PRD04-BND-197; FCC-01 ocean scale semantics
- **Existing controls:** Large water bodies use stable/regional environment representation; local disturbances activate bounded conserved domains.
- **Severity / plausibility / priority:** **CRITICAL / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-28/18; FIXTURE-02 + FIXTURE-10
- **Success / exit evidence:** Connect local cavities to enormous ocean fixtures and prove work scales with active boundary/disturbance rather than total ocean volume.
- **ADR dependency:** ADR — ocean/environment vs local-fluid representation boundary
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-I03 — Fluid/voxel topology race at opened or sealed boundary

- **Parent:** PRD06-RISK-I
- **Failure statement:** Canonical wall edit and fluid connectivity update observe incompatible revisions.
- **Consequence:** Water crosses a sealed wall, fails to enter an opened chamber or duplicates during reseal.
- **Trigger / exposure:** Mining/building a boundary while fluid worker is active, collision lag or batched edits.
- **Upstream lineage:** PRD06-SEED-R4-F03; PRD04-PROOF-27/28/23
- **Existing controls:** Fluid topology consumes revisioned canonical occupancy/SpatialChangeSet and stale work is rejected.
- **Severity / plausibility / priority:** **CRITICAL / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-27/23/68; FIXTURE-02 + FIXTURE-03
- **Success / exit evidence:** Open/reseal chambers under delayed/reordered fluid work; resulting connected volume and mass must match newest canonical topology.
- **ADR dependency:** ADR — fluid topology revision/invalidation contract
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-I04 — Fluid activation/demotion duplicates or loses conserved state

- **Parent:** PRD06-RISK-I
- **Failure statement:** Promoting a summarized ocean/local region to active detail or collapsing it back changes semantic volume/momentum/composition improperly.
- **Consequence:** Player proximity changes flooding amount or repeated streaming pumps water into/out of existence.
- **Trigger / exposure:** Viewer movement, far/near simulation, vessel approach, server load degradation.
- **Upstream lineage:** PRD06-SEED-R4-F04; PRD05-XW-0204; simulation-fidelity law
- **Existing controls:** Activation/demotion must preserve explicit invariants and stable region/water-body identity.
- **Severity / plausibility / priority:** **CRITICAL / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-28/16/32; FIXTURE-02 + FIXTURE-06
- **Success / exit evidence:** Repeat activate→disturb→demote→reactivate cycles and compare conserved state and downstream vessel/structure consequences.
- **ADR dependency:** ADR — fluid activation/demotion summary schema
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-I05 — Rendered water surface becomes gameplay fluid truth

- **Parent:** PRD06-RISK-I
- **Failure statement:** Shader/mesh/wave height or graphics profile is queried as authoritative water presence/depth.
- **Consequence:** Graphics settings, renderer choice or LOD changes swimming, buoyancy, flooding or machine behavior.
- **Trigger / exposure:** Using visual water mesh for collision/buoyancy/depth queries or omitting semantic fluid where not rendered.
- **Upstream lineage:** PRD06-SEED-R4-F05; PRD04-BND-198; ART presentation boundary
- **Existing controls:** Rendering is a projection of semantic water/environment queries; gameplay never depends on visual fidelity.
- **Severity / plausibility / priority:** **CRITICAL / POSSIBLE / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-28/32/59; FIXTURE-06 + FIXTURE-08
- **Success / exit evidence:** Run identical fluid/vessel scenarios across graphics/render profiles and prove canonical water outcomes remain identical.
- **ADR dependency:** ADR — gameplay water query API independent of renderer
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-I06 — Fluid save/reload/checkpoint loses in-flight conserved state

- **Parent:** PRD06-RISK-I
- **Failure statement:** Checkpoint captures voxel/water-body summaries but omits active local fluid transfers or pending topology state.
- **Consequence:** Reload changes flood level, pump results or vessel mass.
- **Trigger / exposure:** Save during breach, pump, active transfer, activation/demotion or provider lag.
- **Upstream lineage:** PRD04-PKG-I dependency; REQ-PST fluid persistence; PROOF-41
- **Existing controls:** Checkpoint authority captures one coherent semantic fluid state/cutoff; provider work is repeatable derived work.
- **Severity / plausibility / priority:** **CRITICAL / POSSIBLE / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-41/39/69 + PROOF-27; FIXTURE-04 + FIXTURE-02
- **Success / exit evidence:** Save/crash at every active-fluid phase and recover identical conserved totals/topology under the declared checkpoint semantics.
- **ADR dependency:** ADR — fluid checkpoint/journal representation
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-I07 — Pumps/sources/sinks bypass transaction/conservation authority

- **Parent:** PRD06-RISK-I
- **Failure statement:** Machines, weather, portals or gameplay systems directly modify provider fluid cells without authoritative source/sink accounting.
- **Consequence:** Infinite resources, negative volumes or save/network disagreement.
- **Trigger / exposure:** Automation pumps, drains, rainfall, springs, spells, vessel pumps or scripted events.
- **Upstream lineage:** REQ-FLUID/MAR automation; Q transaction law; PRD04-BND-194/195
- **Existing controls:** Sources/sinks/transfers are semantic operations with explicit volume/type and transaction identity where consequential.
- **Severity / plausibility / priority:** **CRITICAL / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-27/63/76; FIXTURE-02 + FIXTURE-10
- **Success / exit evidence:** Concurrent pump/source/sink fixtures must conserve totals according to declared external inputs/outputs and survive retry/crash without duplication.
- **ADR dependency:** ADR — fluid transfer/source/sink transaction interface
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-I08 — Cross-partition fluid transfer double-counts or strands volume

- **Parent:** PRD06-RISK-I
- **Failure statement:** Fluid crossing simulation/region ownership boundaries is applied by both sides, neither side or in inconsistent order.
- **Consequence:** Boundary seams accumulate/lose water and behavior changes with partition size.
- **Trigger / exposure:** Large flood crosses region/chunk boundaries, owner transfer or distributed server partitioning.
- **Upstream lineage:** UNK-FLUID exact cross-boundary scheme; ownership/transaction dependencies F/Q
- **Existing controls:** One semantic transfer/ownership protocol governs cross-boundary volume; provider chunks do not define authority.
- **Severity / plausibility / priority:** **CRITICAL / POSSIBLE / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-27/28/14/63; FIXTURE-02 + FIXTURE-03
- **Success / exit evidence:** Drive sustained flows across many partition boundaries and randomized transfer order; global mass and topology remain invariant to partition layout.
- **ADR dependency:** ADR — fluid partition ownership/transfer protocol
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-I09 — Fluid numerical instability causes oscillation/explosion

- **Parent:** PRD06-RISK-I
- **Failure statement:** Approximate local simulation develops unbounded oscillation, pressure spikes or unstable mass distribution.
- **Consequence:** Vessels jitter, pumps oscillate, flooding never settles or CPU cost spikes.
- **Trigger / exposure:** Large timestep, steep gradients, rapid hull motion, repeated activate/demote or low precision.
- **Upstream lineage:** UNK-FLUID-001–005; PRD05-XW-0203; no solver selected
- **Existing controls:** Solver/representation remains proof-gated; semantic invariants and bounded update budgets are required.
- **Severity / plausibility / priority:** **HIGH / POSSIBLE / P1**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-27/28/32; FIXTURE-02 + FIXTURE-06
- **Success / exit evidence:** Candidate solvers survive hostile breach/pump/vessel motion cases without unbounded energy/volume error and with measurable convergence/bounds.
- **ADR dependency:** ADR — fluid solver/precision only after matrix evidence
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-I10 — Ocean environmental queries discontinuous across basins/regions

- **Parent:** PRD06-RISK-I
- **Failure statement:** WaterBody depth/current/tide/salinity/temperature queries jump or contradict local fluid state at region boundaries.
- **Consequence:** Vessels, ecology, swimming and weather respond to invisible seams.
- **Trigger / exposure:** Crossing marine regions, inland sea/ocean interfaces or local active-fluid island boundaries.
- **Upstream lineage:** FCC-01 marine identity chain; Set-26 lineage; PRD04-BND-197
- **Existing controls:** Ocean/environment identity and queries are semantic regional fields independent of render tiles/provider chunks.
- **Severity / plausibility / priority:** **HIGH / POSSIBLE / P1**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-28/32; FIXTURE-06 + FIXTURE-10
- **Success / exit evidence:** Traverse and couple local fluids/vessels across representative marine boundaries with bounded/intentional transitions and no partition artifacts.
- **ADR dependency:** ADR — WaterBody/environment field interpolation/query model
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-I11 — Fluid–navigation/collision coupling uses stale or wrong consistency class

- **Parent:** PRD06-RISK-I
- **Failure statement:** Swimming/wading/path/physics systems consume fluid state from incompatible revisions or require visual fluid readiness.
- **Consequence:** Agents route through unsafe flooded spaces or cannot traverse valid water because one derived representation lags.
- **Trigger / exposure:** Flooding after edits, tide/local-water changes, vessel compartments, provider delays.
- **Upstream lineage:** PKG-E/F boundary; H readiness; PRD04-BND-543
- **Existing controls:** Semantic fluid is authoritative; nav/collision consume revisioned queries according to their own consistency class.
- **Severity / plausibility / priority:** **HIGH / POSSIBLE / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-26/27/34; FIXTURE-02 + FIXTURE-06
- **Success / exit evidence:** Delay nav/collision against changing semantic water and prove movement safety/route invalidation follows governed revisions without making fluid rendering authoritative.
- **ADR dependency:** ADR — fluid movement-query/invalidation contract
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-I12 — Vessel flooding authority is merged into generic world fluid provider

- **Parent:** PRD06-RISK-I
- **Failure statement:** Compartment-local flooding, hull topology and vessel-local coordinates are lost by treating vessel water as ordinary static world-fluid cells.
- **Consequence:** Moving vessel floods incorrectly, water detaches from hull frame or mass/buoyancy updates use wrong coordinates.
- **Trigger / exposure:** Hull breach while moving/rotating, docking or region crossing.
- **Upstream lineage:** PRD04-BND-210; PRD06-SEED-R4-G05; PKG-F/G interface
- **Existing controls:** FluidFacade and VesselFacade collaborate through vessel-local topology; neither absorbs the other authority.
- **Severity / plausibility / priority:** **CRITICAL / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-32/29/30; FIXTURE-06
- **Success / exit evidence:** Breach moving vessels across rotations/regions and prove fluid remains attached to correct compartment/frame while conservation and mass updates remain coherent.
- **ADR dependency:** ADR — vessel-local fluid/compartment interface
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

## 46.4 PRD06-RISK-J — Moving editable vessel risks

### PRD06-RISK-J01 — Moving VoxelTerrain used as vessel physics foundation

- **Parent:** PRD06-RISK-J
- **Failure statement:** A vessel is implemented by translating/rotating a streaming terrain node and relying on terrain collision as a moving rigid surface.
- **Consequence:** Physics contacts are unreliable, coordinates/persistence become provider-coupled and large motion breaks streaming assumptions.
- **Trigger / exposure:** Prototype convenience reuses VoxelTerrain for ships/airships/mobile structures.
- **Upstream lineage:** PRD06-SEED-R4-G01; PRD05-XW-0152; Voxel Tools performance warning
- **Existing controls:** Vessel is a first-class Leyforge domain entity with finite local content and independent world pose/frame.
- **Severity / plausibility / priority:** **CRITICAL / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-08/29/31; FIXTURE-06
- **Success / exit evidence:** Candidate vessel prototype must operate without moving VoxelTerrain authority and retain stable local content while world pose changes.
- **ADR dependency:** ADR — vessel finite-content/provider adapter architecture
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-J02 — Hull collision rebuild cost creates edit/performance cliff

- **Parent:** PRD06-RISK-J
- **Failure statement:** Editing a large moving hull requires rebuilding collision at a cost incompatible with normal damage/construction.
- **Consequence:** Frame spikes, long stale-collision windows or forced vessel size/edit limitations.
- **Trigger / exposure:** Large hull edits, combat damage, construction, repeated repairs or many vessels.
- **Upstream lineage:** PRD06-SEED-R4-G02; PRD04-PROOF-29/31; PRD05-XW-0206
- **Existing controls:** Collision is revisioned derived state; multiple proxy strategies must be benchmarked rather than assumed.
- **Severity / plausibility / priority:** **CRITICAL / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-29/31/18; FIXTURE-06 + FIXTURE-10
- **Success / exit evidence:** Representative hull sizes/edit rates must show bounded rebuild cost/readiness lag for at least one viable strategy or expose explicit supported limits.
- **ADR dependency:** ADR — vessel collision proxy strategy/size limits after matrix
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-J03 — Dynamic concave collider misuse on moving hull

- **Parent:** PRD06-RISK-J
- **Failure statement:** A large concave trimesh collision shape is attached to a moving RigidBody as the default hull representation.
- **Consequence:** Tunnelling, hollow-shape behavior, unstable contacts and high collision cost.
- **Trigger / exposure:** Using generated render/hull mesh directly as ConcavePolygonShape3D for dynamic vessel.
- **Upstream lineage:** PRD06-SEED-R4-G03; current Godot ConcavePolygonShape3D/collision docs
- **Existing controls:** Collision strategy matrix must test primitive/compound/convex alternatives; no concave-dynamic default is accepted.
- **Severity / plausibility / priority:** **CRITICAL / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-31; FIXTURE-06
- **Success / exit evidence:** Contact/tunnelling/stability/performance tests eliminate unsafe strategies and qualify at least one bounded proxy approach for target vessel classes.
- **ADR dependency:** ADR — qualified dynamic hull collision representation
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-J04 — Vessel mass/centre-of-mass lags cargo, damage or flooding

- **Parent:** PRD06-RISK-J
- **Failure statement:** Physics executes with mass/inertia/COM derived from an older hull/cargo/fluid revision.
- **Consequence:** Ship motion visibly contradicts canonical load/damage state and can destabilize networking/occupants.
- **Trigger / exposure:** Cargo transfer, block destruction/building, flooding/pumping, detachable modules.
- **Upstream lineage:** PRD06-SEED-R4-G04; PRD04-BND-205–210; PRD05-XW-0207
- **Existing controls:** Semantic mass properties are Leyforge-owned, revisioned and projected to physics in a governed order.
- **Severity / plausibility / priority:** **CRITICAL / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-29/32; FIXTURE-06
- **Success / exit evidence:** Rapidly change cargo/hull/fluid and prove physics never applies a mass state incompatible with the declared vessel revision beyond bounded quarantine/reconciliation.
- **ADR dependency:** ADR — vessel mass/inertia aggregation/update cadence
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-J05 — Flooding and buoyancy are decoupled

- **Parent:** PRD06-RISK-J
- **Failure statement:** Compartment water changes but displaced/buoyant response or total mass does not follow, or vice versa.
- **Consequence:** Breached ships float as dry, sink without water ingress or oscillate nonsensically.
- **Trigger / exposure:** Hull breach, pumps, compartment connectivity, repair at sea.
- **Upstream lineage:** PRD06-SEED-R4-G05; PRD04-PROOF-32; I12
- **Existing controls:** Fluid and Vessel authorities exchange explicit compartment/mass/buoyancy evidence by revision.
- **Severity / plausibility / priority:** **CRITICAL / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-32; FIXTURE-06
- **Success / exit evidence:** Below-waterline breaches, pumps and repairs produce conserved ingress, coherent mass/COM change and stable buoyancy response across save/reload.
- **ADR dependency:** ADR — flooding↔mass↔buoyancy coupling model
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-J06 — Occupant receives vessel motion twice or loses frame motion

- **Parent:** PRD06-RISK-J
- **Failure statement:** Character motion is both parented and manually transformed, or neither correctly accounts for vessel translation/rotation.
- **Consequence:** Players/NPCs slide, launch, jitter or desync on moving decks.
- **Trigger / exposure:** Walking/jumping on translating/rotating vessel, physics correction, network interpolation.
- **Upstream lineage:** PRD06-SEED-R4-G06; PRD04-PROOF-30; frame law from Round 2
- **Existing controls:** VesselFrame/local pose and world pose are explicit; occupant transition/kinematics has one synchronization owner.
- **Severity / plausibility / priority:** **CRITICAL / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-30/08; FIXTURE-06 + FIXTURE-05
- **Success / exit evidence:** Multiple occupants walk/jump/stand through translation/rotation/region crossing with bounded contact error and no double motion across network modes.
- **ADR dependency:** ADR — occupant frame/kinematic synchronization policy
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-J07 — Region crossing rewrites vessel-local hull identity

- **Parent:** PRD06-RISK-J
- **Failure statement:** Crossing coarse world regions/chunks reindexes or rewrites internal hull coordinates/IDs.
- **Consequence:** Persistence/network diffs explode and one vessel fragments into location-dependent identities.
- **Trigger / exposure:** Long-distance sailing, origin rebase, teleport/realm transition or server partition crossing.
- **Upstream lineage:** PRD06-SEED-R4-G07; PRD04-PROOF-08; BND-054/055
- **Existing controls:** Stable vessel ID/local coordinate space persists independently of world pose/region.
- **Severity / plausibility / priority:** **CRITICAL / POSSIBLE / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-08/05/06; FIXTURE-06 + FIXTURE-01
- **Success / exit evidence:** Move vessel through many regions/rebases and prove unchanged internal semantic addresses, occupant references, persistence and replication identity.
- **ADR dependency:** ADR — vessel frame/world-pose serialization mapping
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-J08 — Boarding/disembarking and vessel-local navigation discontinuity

- **Parent:** PRD06-RISK-J
- **Failure statement:** Land/world navigation and vessel-local movement cannot hand agents across frames coherently.
- **Consequence:** NPCs cannot board ships, route ends at gangways, or frame switch teleports/duplicates actors.
- **Trigger / exposure:** Moving vessel docks/departs, gangway changes, local nav rebuild, multiple boarding points.
- **Upstream lineage:** PRD06-SEED-R4-G08; PRD04-PROOF-30/26; H06
- **Existing controls:** Boarding is an explicit movement/frame transition; local and world navigation remain separate providers under common semantic routing.
- **Severity / plausibility / priority:** **HIGH / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-30/26/08; FIXTURE-06 + FIXTURE-02
- **Success / exit evidence:** Agents route land→gangway→moving vessel and back while edits/motion occur, with one identity and valid frame/route transitions.
- **ADR dependency:** ADR — boarding portal/frame-transition navigation contract
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-J09 — Vessel-local voxel storage scales poorly or couples to terrain stream

- **Parent:** PRD06-RISK-J
- **Failure statement:** Finite hull content uses a storage/chunking scheme whose cost or API assumes static streamed terrain.
- **Consequence:** Large ships consume excessive memory, edits stall or provider changes require semantic vessel migrations.
- **Trigger / exposure:** Using VoxelTerrain stream/chunk format directly for vessel-local authoritative storage.
- **Upstream lineage:** PRD05-XW-0153/0205; PRD04-BND-203/204; VoxelMesher standalone support
- **Existing controls:** Vessel local storage schema is Leyforge-owned; meshing/provider adapters are downstream.
- **Severity / plausibility / priority:** **HIGH / POSSIBLE / P1**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-29/31/67; FIXTURE-06
- **Success / exit evidence:** Prototype representative vessel sizes/edit patterns across candidate local storage/chunking schemes and demonstrate provider-independent semantic serialization.
- **ADR dependency:** ADR — vessel-local storage/chunking format
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-J10 — Hull topology/breach detection is stale or semantically wrong

- **Parent:** PRD06-RISK-J
- **Failure statement:** A block edit changes watertight compartments/openings but flooding topology does not update correctly.
- **Consequence:** Water enters sealed compartments or ignores real breaches; damage consequences lag visible hull.
- **Trigger / exposure:** Combat damage, doors/hatches, repairs, structural collapse, partial collision rebuild.
- **Upstream lineage:** PRD04-BND-210; PRD06-SEED-R4-G05; I03/I12
- **Existing controls:** Semantic hull topology is vessel-owned and consumes committed edits independent of collider/mesh readiness.
- **Severity / plausibility / priority:** **CRITICAL / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-29/32/33; FIXTURE-06 + FIXTURE-02
- **Success / exit evidence:** Edit/reseal hull boundaries under motion and delayed providers; compartment connectivity/flooding follows newest canonical topology exactly.
- **ADR dependency:** ADR — compartment/hull-topology representation
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-J11 — Physics solver output becomes vessel gameplay authority

- **Parent:** PRD06-RISK-J
- **Failure statement:** RigidBody state directly determines semantic mass, flooding, structural integrity or ownership without Leyforge validation.
- **Consequence:** Solver quirks/timestep changes redefine gameplay laws and make persistence/networking unstable.
- **Trigger / exposure:** Treating Jolt transform/velocity/contact impulses as complete vessel truth.
- **Upstream lineage:** PRD04-BND-173/205–210; physics evidence law
- **Existing controls:** Physics executes forces/contact and returns evidence; Vessel authority commits governed pose/state/consequences.
- **Severity / plausibility / priority:** **CRITICAL / POSSIBLE / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-29/31/32/63; FIXTURE-06 + FIXTURE-10
- **Success / exit evidence:** Vary physics settings/timestep within supported lanes and prove semantic vessel rules/conservation are stable or explicitly qualified rather than inferred from raw solver state.
- **ADR dependency:** ADR — vessel physics evidence/commit integration
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-J12 — High-speed/large-vessel tunnelling invalidates collision safety

- **Parent:** PRD06-RISK-J
- **Failure statement:** Vessel/hull proxies or nearby dynamic bodies cross geometry between physics steps.
- **Consequence:** Ships pass through terrain/ships, occupants clip through hull or combat impacts are missed.
- **Trigger / exposure:** High speed, low frame rate, thin proxies, concave shapes, large coordinates.
- **Upstream lineage:** Current Godot concave/tunnelling warnings; PRD04-PROOF-31
- **Existing controls:** Collision strategy and supported speed/size ranges require empirical qualification; safety may need swept/auxiliary queries.
- **Severity / plausibility / priority:** **CRITICAL / POSSIBLE / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-31/05; FIXTURE-06
- **Success / exit evidence:** Stress speed/size/contact angles across candidate proxies and prove bounded collision failure rate consistent with accepted gameplay safety or reject the lane.
- **ADR dependency:** ADR — vessel collision continuous/swept strategy and operational limits
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-J13 — Cargo/item/entity mass is double-counted or omitted

- **Parent:** PRD06-RISK-J
- **Failure statement:** The same carried/stored/physical cargo contributes to vessel mass twice, or authoritative cargo contributes not at all.
- **Consequence:** Load balancing, buoyancy and acceleration become exploitable and inconsistent with inventory truth.
- **Trigger / exposure:** Items transition between physical deck entities, containers, inventories and attached machines.
- **Upstream lineage:** REQ-MAR cargo/mass semantics; Q transaction conservation; BND-205–210
- **Existing controls:** Every mass-bearing semantic entity has one mass contribution owner/projection state.
- **Severity / plausibility / priority:** **HIGH / POSSIBLE / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-29/32/63; FIXTURE-06 + FIXTURE-03
- **Success / exit evidence:** Move cargo through all representation states and prove total vessel mass changes exactly once according to semantic ownership.
- **ADR dependency:** ADR — mass contribution accounting schema
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-J14 — Docking/towing/constraints create authority loops or unstable frames

- **Parent:** PRD06-RISK-J
- **Failure statement:** Two moving vessels or vessel↔world constraints create circular frame ownership or uncontrolled physics constraints.
- **Consequence:** Docked ships jitter/explode, occupants get ambiguous frames, save/network cannot describe relationship.
- **Trigger / exposure:** Docking, towing, mooring, cranes/bridges or multi-vessel assemblies.
- **Upstream lineage:** UNK-MAR docking/towing architecture; frame hierarchy limits from Round 2
- **Existing controls:** Stable semantic relationship/parentage is separate from solver constraint; nested/coupled frame rules remain explicit.
- **Severity / plausibility / priority:** **CRITICAL / POSSIBLE / P1**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-30/31/08; FIXTURE-06
- **Success / exit evidence:** Prototype representative dock/tow arrangements and prove stable identity/frame assignment, bounded physics and unambiguous detach/recovery.
- **ADR dependency:** ADR — docking/towing frame and constraint architecture
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-J15 — Multiple editable vessels collide under simultaneous rebuild

- **Parent:** PRD06-RISK-J
- **Failure statement:** Two vessels update hull proxies while in contact and each observes incompatible collision revisions.
- **Consequence:** Interpenetration, explosive correction, missed damage or duplicated contact consequences.
- **Trigger / exposure:** Combat/harbor contact while both ships take/build damage.
- **Upstream lineage:** PROOF-29/31 interaction; G concurrency/backpressure; Q provider-after-commit
- **Existing controls:** Each vessel collision proxy is revisioned; contact consequences are evidence validated against current semantic hull states.
- **Severity / plausibility / priority:** **CRITICAL / POSSIBLE / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-29/31/63/76; FIXTURE-06 + FIXTURE-10
- **Success / exit evidence:** Damage/edit both contacting vessels with delayed/out-of-order proxy rebuild and prove bounded safe behavior and no provider-authored duplicate consequences.
- **ADR dependency:** ADR — contact reconciliation during hull-proxy revision change
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-J16 — Vessel save/network snapshot mixes frame, hull and physics revisions

- **Parent:** PRD06-RISK-J
- **Failure statement:** Persistence or replication captures world pose from one revision and hull/cargo/fluid state from another without a coherent cut.
- **Consequence:** Reload/reconnect moves occupants, changes mass/flooding or reconstructs impossible vessel geometry.
- **Trigger / exposure:** Save or interest/reconnect during hull edit, motion, flooding or region crossing.
- **Upstream lineage:** PKG-H/I dependencies; PRD04-BND-546; PROOF-42/41
- **Existing controls:** Networking and persistence project one committed vessel authority revision/checkpoint.
- **Severity / plausibility / priority:** **CRITICAL / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-29/30/32/41/42/69; FIXTURE-06 + FIXTURE-04 + FIXTURE-05
- **Success / exit evidence:** Save/reconnect/crash during hostile vessel activity and recover one coherent vessel/occupant/fluid state with no mixed revision snapshot.
- **ADR dependency:** ADR — vessel checkpoint/replication snapshot contract
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-J17 — Vessel structural damage/collapse bypasses governed transaction

- **Parent:** PRD06-RISK-J
- **Failure statement:** Hull integrity failure causes physics/mesh pieces to disappear or spawn without a Leyforge collapse/damage transaction.
- **Consequence:** Resources, injuries, flooding, nav and persistence disagree about destruction.
- **Trigger / exposure:** Collision impact, support removal, combat explosion or overloading.
- **Upstream lineage:** PRD04-PROOF-33 remains PKG-D; Q17; vessel/hull dependencies
- **Existing controls:** Structural evidence triggers a separate authoritative collapse/damage transaction; provider products consume it.
- **Severity / plausibility / priority:** **CRITICAL / POSSIBLE / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-33/29/32/63; FIXTURE-06 + FIXTURE-03
- **Success / exit evidence:** Force vessel structural failure and prove one governed transaction owns block/entity/resource/flooding consequences while physics only supplies evidence/execution.
- **ADR dependency:** ADR — vessel structural-integrity/collapse integration
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-J18 — Vessel architecture only works for toy hulls and fails at intended scale

- **Parent:** PRD06-RISK-J
- **Failure statement:** Prototype succeeds on small static/simple vessels but collision, meshing, mass, flooding, occupants or networking scale nonlinearly.
- **Consequence:** Late discovery forces hard vessel-size limits or architecture rewrite after content depends on large ships.
- **Trigger / exposure:** Testing only tiny hulls, low edit rates, one occupant or calm water.
- **Upstream lineage:** PRD04-PROOF-31/32; Set-26 civilisation/vessel scale requirements; qualification doctrine
- **Existing controls:** Proof matrix must span representative vessel classes/sizes/edit rates/occupant counts before architecture ADR.
- **Severity / plausibility / priority:** **CRITICAL / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-29/30/31/32/76; FIXTURE-06 + FIXTURE-10
- **Success / exit evidence:** At least one bounded architecture lane meets representative intended vessel envelopes; unsupported classes are explicitly identified before implementation lock.
- **ADR dependency:** ADR — supported vessel class/size envelope and implementation strategy
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

# 47. Round-4 Cross-Risk Dependency Spine

```text
E canonical generation / voxel commits
 ├──► H collision + navigation readiness
 ├──► I fluid topology and boundaries
 ├──► J hull edits / vessel local content
 ├──► D persistence + migration
 └──► K network projection

H derived readiness
 ├──► movement / NPC safety
 ├──► I flooded-space movement
 ├──► J boarding + vessel-local navigation
 └──► G queue/backpressure pressure

I semantic fluids / oceans
 ├──► J flooding + buoyancy + mass
 ├──► H swimming/nav invalidation
 └──► D persistence/checkpoint coherence

J moving vessels
 ├──► A/B coordinate/frame/provider choices
 ├──► H/I collision/nav/fluid providers
 ├──► Q construction/damage/collapse transactions
 ├──► D/K save/network coherence
 └──► PROOF-76 whole-stack soak
```

# 48. Round-4 Proof Exit Matrix

| Proof | Round-4 risk consumers | Minimum exit evidence |
|---|---|---|
| **PROOF-21 — Deterministic Seeded Simulation** | E03/E08 | Same seed/config and governed random inputs reproduce canonical generation semantics across runs. |
| **PROOF-68 — Worker-Order Chaos** | E02/E03; H10; I03 | Randomized provider/worker completion order cannot alter canonical generated/edit/nav/fluid outcomes. |
| **PROOF-23 — One-Block Spatial Fan-Out** | E01/E05/E09/E10; H02/H11/H12; I03 | One semantic edit produces only intended bounded derived consequences, with causal/revision lineage and no provider authority inversion. |
| **PROOF-24 — Late Generation vs Edit** | E01/E02/E06–E11 | Delayed generation/materialisation cannot overwrite newer canonical edits across order/core/restart variation. |
| **PROOF-25 — Collision Revision Quarantine** | H01/H03/H04/H08/H13 | Movers never traverse geometry unsafe under the declared canonical/collision revision policy. |
| **PROOF-26 — Nav Dirty Bridge** | H01/H02/H04–H10/H14; J08 | Destructive/reconstructive edits invalidate routes, coalesce rebakes and publish only the newest compatible nav result for multiple profiles. |
| **PROOF-27 — Fluid Boundary Breach** | I01/I03/I06–I09/I11 | Breach/reseal/pump operations conserve semantic fluid and track newest voxel topology under worker/restart chaos. |
| **PROOF-28 — Ocean / Local Fluid Boundary** | I01–I05/I08–I10 | Local flooding couples to enormous ocean/environment representation without active-cell explosion or activation/demotion conservation loss. |
| **PROOF-08 — Vessel Region Crossing** | J01/J06–J08/J14/J16 | Vessel ID/local coordinates/occupants/save/network state remain stable across regions/rebases. |
| **PROOF-29 — Vessel Hull Edit Underway** | J01/J02/J04/J10/J13/J15–J18 | Moving hull edits preserve semantic topology and safely update/reject stale mesh/collision/mass/flooding products. |
| **PROOF-30 — Moving Vessel Occupants** | J06/J08/J14/J16/J18 | Multiple occupants walk/jump/board/disembark on translating/rotating vessels without double motion or frame identity error. |
| **PROOF-31 — Vessel Collision Strategy Matrix** | J01–J03/J11/J12/J14/J15/J18 | Representative collision strategies are compared for contact quality, tunnelling, rebuild cost, stability, memory and size/edit envelope before selection. |
| **PROOF-32 — Vessel Flooding / Buoyancy** | I01/I04/I05/I09/I10/I12; J04/J05/J10–J13/J16–J18 | Breach/pump/repair produces conserved ingress, coherent mass/COM and stable buoyancy across motion/save/reload. |
| **PROOF-34 — Provider Failure Degradation** | E04/E09; H01/H03/H07/H12/H13; I11; J11/J15 | Failed derived providers cannot silently roll back committed semantic truth and expose bounded degraded readiness/retry. |
| **PROOF-67 — Provider Conformance Matrix** | E01/E04/E05; H06/H08/H11/H14; J09 | Supported provider editions/paths satisfy the same facade semantics or are explicitly rejected. |
| **PROOF-76 — Whole-Stack Hostile Soak** | E10; H02/H07/H12; I02/I07; J15/J18 | Final common-cause validation after package-level proofs; not a substitute for them. |

No row is a proof result. **PRD-08 remains empty by design.**

# 49. ADR Reservation Gates

| Future ADR | Evidence gate |
|---|---|
| **ADR — Canonical voxel edit/materialisation protocol** | E01/E02/E04/E09/E11 + PROOF-23/24/34. |
| **ADR — Worldgen deterministic dependency/version model** | E02/E03/E06–E08 + PROOF-21/24/68 and migration evidence. |
| **ADR — SpatialChangeSet invalidation granularity** | E10 + H02/H12 + PROOF-23/26/18. |
| **ADR — Navigation source/provider/profile architecture** | H01–H14 + PROOF-25/26/34/67 and edit-burst benchmarks. |
| **ADR — Fluid representation/precision/solver** | I01–I12 + PROOF-27/28/32 and scale/stability evidence. |
| **ADR — Ocean↔local-fluid activation boundary** | I02/I04/I08/I10 + PROOF-28. |
| **ADR — Vessel local-grid/storage architecture** | J01/J07/J09/J16/J18 + PROOF-08/29/67. |
| **ADR — Vessel collision strategy and supported size/speed envelope** | J02/J03/J11/J12/J15/J18 + PROOF-31/29. |
| **ADR — Vessel mass/buoyancy/flooding integration** | J04/J05/J10/J13/J16/J18 + PROOF-32. |
| **ADR — Occupant/boarding/docking frame integration** | J06/J08/J14 + PROOF-30/08/26. |

# 50. PRD-07 Fixture Requirements Added by Round 4

## FIXTURE-02 — Voxel Edit / SpatialChangeSet / Collision / Navigation / Fluid Harness

Must support at least:

- canonical edit operation/revision distinct from provider voxel mutation;
- delayed generation racing newer edits;
- unloaded/provider-absent canonical edits followed by later materialisation;
- one-block and bulk-edit fan-out measurement;
- separately delayed mesh/collision/nav/fluid readiness dimensions;
- stale collision and out-of-order nav publication;
- multiple mover/navigation profiles;
- procedural nav source generation versus SceneTree/render-mesh path comparison;
- fluid chamber breach/reseal, pumps, source/sink accounting and cross-boundary flow;
- ocean/local-fluid activation/demotion cycles;
- provider failure after semantic commit;
- causal lineage proving derived consumers cannot recursively invent canonical edits.

## FIXTURE-06 — Editable Vessel / Local Frame / Collision / Flooding Harness

Must support at least:

- stable vessel ID and vessel-local voxel/content coordinates;
- translation, rotation and coarse-region/origin-rebase crossing;
- multiple representative hull sizes and edit frequencies;
- runtime hull edit/damage/repair while physically moving;
- candidate collision proxy matrix including primitive/compound/convex-qualified paths;
- contact/tunnelling tests at speed/scale extremes;
- semantic hull topology and compartments independent of render/collider readiness;
- cargo/machine/occupant mass contributions;
- below-waterline breach, pumping, repair and activation/demotion;
- mass/COM/inertia and buoyancy update by revision;
- multiple occupants walking/jumping plus boarding/disembark;
- land↔vessel navigation handoff;
- save/reload/reconnect while vessel is moving/editing/flooding;
- two-vessel contact while both collision proxies rebuild;
- structural-collapse transaction integration;
- optional docking/towing candidate lanes without assuming final architecture.

# 51. Round-4 Open Implementation Questions Preserved

1. Exact canonical voxel-edit record and provider materialisation format.
2. Exact worldgen dependency graph, random-stream scheme and structure-conflict policy.
3. Voxel/provider block mapping and remote/unloaded edit staging.
4. Spatial invalidation index, tile dimensions and coalescing policy.
5. Navigation source-geometry representation and tile/profile cache.
6. Surface, volumetric, vessel-local and regional navigation provider mix.
7. Collision quarantine and mover reconciliation policy.
8. Fluid discrete/continuous representation and precision.
9. Fluid solver, timestep and numerical-stability limits.
10. Ocean/environment field representation and local-fluid activation thresholds.
11. Cross-partition fluid ownership/transfer mechanism.
12. Vessel-local storage/chunking format.
13. Hull topology/compartment representation.
14. Dynamic hull collision proxy strategy and rebuild granularity.
15. Vessel supported size, speed and edit-rate envelope.
16. Mass/COM/inertia aggregation and update cadence.
17. Buoyancy/hydrodynamic approximation and sample scheme.
18. Occupant synchronization/boarding frame transition.
19. Docking/towing constraint/frame model.
20. Exact vessel save/network snapshot encoding.

# 52. Round-4 Integrity Checks

| Check | Result |
|---|---|
| Parent risk families E/H/I/J preserved | **PASS — 4/4** |
| Stable child-risk IDs | **PASS — 55/55** |
| Round-4 E seeds E01–E08 consumed | **PASS — 8/8** |
| Round-4 F seeds F01–F05 consumed | **PASS — 5/5** |
| Round-4 G seeds G01–G08 consumed | **PASS — 8/8** |
| Round-4 X01 provider-failure seed consumed | **PASS — 1/1** |
| Earlier deterministic-order seed consumed in E03 | **PASS** |
| Moving VoxelTerrain rejected as accepted vessel architecture | **PASS** |
| Provider collision/nav/fluid remain projections/evidence, not semantic authority | **PASS** |
| Ocean and local active fluid remain distinct semantic scales | **PASS** |
| Vessel-local coordinates remain independent of world-region crossing | **PASS** |
| PROOF-33 remains PKG-D-owned despite vessel collapse integration | **PASS** |
| Exact nav/fluid/vessel implementations remain unlocked | **PASS** |
| Current PRD-08 proof results created | **PASS — 0** |
| Implementation ADRs accepted | **PASS — 0** |
| PRD-04 / PRD-05 reopen candidates | **PASS — 0** |

# 53. Round-4 Closure Verdict

> **ROUND 4 PASS — VOXEL / COLLISION / NAVIGATION / FLUID / VESSEL RISK DECOMPOSITION COMPLETE.**

The most consequential Round-4 conclusions are:

1. **A committed voxel edit is semantic truth before any mesh/collider/nav/fluid projection catches up.** Derived lag must be revisioned/quarantined, not used to roll back truth.
2. **World generation is a source of deterministic baseline records, not a privileged late writer.** Newer committed edits always outrank delayed generation.
3. **Readiness is multidimensional.** `loaded=true` cannot stand for data + mesh + collision + nav + fluid safety.
4. **Navigation is hybrid and disposable.** Surface nav can exploit Godot's runtime baking, but volumetric/vessel/regional movement remains provider-plural and proof-gated.
5. **Oceans cannot be billions of always-active fluid cells.** The scalable architecture requires large-water environmental authority plus bounded conserved local disturbance/flooding.
6. **Vessels remain finite domain entities with local frames.** Voxel Tools' own moving-terrain warning reinforces the rejection of moving `VoxelTerrain` as vessel physics authority.
7. **Dynamic hull collision is a matrix problem, not a mesh-generation afterthought.** Godot's concave collision limitations keep compound/convex/other qualified strategies open until PROOF-31.
8. **Flooding, mass and buoyancy must share revisions without merging authorities.** Fluid and Vessel domains collaborate through explicit topology/mass contracts.
9. **Provider failure after semantic commit is degradation, not hidden rollback.**
10. **Representative vessel scale must be tested before architecture lock.** Toy-boat success cannot qualify civilisation-scale vessels.

No Round-4 finding requires PRD-04 or PRD-05 reopening.

# 54. Machine-Readable Round-4 Summary

```yaml
document: PRD-06
version: v0.4
round: 4
status: WORKING
round_status: PASS
parent_families_decomposed: [E, H, I, J]
child_risks:
  E: 11
  H: 14
  I: 12
  J: 18
  total: 55
severity_counts:
  critical: 40
  high: 15
plausibility_counts:
  likely: 31
  possible: 24
priority_counts:
  p0: 49
  p1: 6
round4_seed_intake:
  e_seeds_consumed: 8
  f_seeds_consumed: 5
  g_seeds_consumed: 8
  x_seeds_consumed: 1
  earlier_deterministic_seed_consumed: true
proof_results_created: 0
implementation_adrs_created: 0
architecture_reopen_candidates: 0
technology_refresh_date: 2026-09-05
next_round: Network / Persistence / Recovery / Migration Risks
```

---

**End of PRD-06 v0.4 — Round 4 Working Baseline**

---

# 55. Round-5 Scope and Controlled Technology Refresh

Round 5 decomposes **PRD06-RISK-K — Authoritative voxel/entity networking and reconnect** and **PRD06-RISK-D — Async voxel persistence + coherent checkpoint**.

The architectural invariant remains:

> **Networking and persistence are two projections of the same committed Leyforge authority. Neither transport delivery nor provider storage completion creates canonical gameplay truth.**

This round does **not** select the final network codec, ENet channel map, compression, interest index, reconnect lease implementation, SQLite integration, journal format, checkpoint cadence, backup mechanism or migration engine.

Current technology evidence refreshed on **5 September 2026** sharpens the proof risks:

| Technology fact | Risk implication |
|---|---|
| Godot 4.7 `SceneMultiplayer` states that its high-level multiplayer protocol is an implementation detail that may change without notice. It exposes raw-byte sending and keeps object decoding disabled by default because decoding untrusted serialized objects can execute code. | Strongly supports K01/K11/K12: durable Leyforge protocol and bounded schemas remain above SceneMultiplayer. |
| Godot/ENet exposes channels, reliability modes and bandwidth controls; ENet uses UDP. Godot also notes that configured maximum clients are not evidence of achievable application scale. | Supports K05/K15/K16: transport lanes are optimisation/qualification questions, not semantic authority or player-count proof. |
| Voxel Tools terrain saving is asynchronous. Its documentation warns that pending saves can outlive terrain destruction and that reusing/retargeting a stream while previous tasks remain can write old-session data into the new save. | Direct evidence for D03/D11/D18 and WorldSession-scoped provider lifetimes. |
| `VoxelTerrain.save_modified_blocks()` returns a completion tracker, but later saves and unload-triggered saves can occur independently. `VoxelStream.flush()` also does not necessarily cover terrain save tasks still queued. | Supports D01/D18: provider completion cannot be treated as the whole-world checkpoint barrier. |
| `VoxelStreamSQLite` has provider-specific coordinate/schema formats and changing an existing database coordinate format may require conversion to a new database. | Supports D08/D10: provider format is migration input, never semantic schema authority. |

All of these remain **P1 documentation evidence**, not PRD-08 proof results.

# 56. Round-5 Stable Child-Risk Register

Round 5 creates **34 stable child risks**:

- **K — networking / interest / reconnect:** 16
- **D — persistence / recovery / migration:** 18

Classification:

- **CRITICAL:** 26
- **HIGH:** 8
- **LIKELY:** 27
- **POSSIBLE:** 7
- **P0:** 28
- **P1:** 6

## 56.1 PRD06-RISK-K — Networking / interest / reconnect risks

### PRD06-RISK-K01 — Godot high-level wire protocol becomes permanent Leyforge protocol

- **Parent:** PRD06-RISK-K
- **Failure statement:** SceneMultiplayer/RPC encoding, Node-oriented replication or transport-specific framing leaks into Leyforge's durable protocol contract.
- **Consequence:** Non-Godot servers, future transport swaps, protocol evolution and long-lived compatibility become coupled to an implementation detail Godot itself does not promise to keep stable.
- **Trigger / exposure:** RPC/SceneReplication messages are persisted, documented externally or treated as canonical network schema.
- **Upstream lineage:** PRD06-SEED-R5-H01; PRD04-BND-231–233/548
- **Existing controls:** Leyforge owns explicit versioned protocol schemas above bounded Godot/ENet adapters.
- **Severity / plausibility / priority:** **CRITICAL / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-36/45; FIXTURE-05 + FIXTURE-09
- **Success / exit evidence:** Two protocol baselines and at least one transport/runtime adapter must negotiate/reject/repair without requiring NodePath/RPC wire compatibility.
- **ADR dependency:** ADR — protocol schema/codec technology after proof
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-K02 — Runtime peer/NodePath identity leaks into persistent semantic identity

- **Parent:** PRD06-RISK-K
- **Failure statement:** Peer IDs, NodePaths, object handles or connection-local addresses are stored as player/entity/world identity.
- **Consequence:** Reconnect, restart, scene restructure or transport change duplicates or misbinds characters/entities.
- **Trigger / exposure:** Network handlers directly key durable state by peer ID or replicated scene path.
- **Upstream lineage:** PRD06-SEED-R5-H02; PRD04-BND-234/239/287/299; family C
- **Existing controls:** Stable account/player/character/entity IDs are canonical; peer/session identifiers are ephemeral bindings.
- **Severity / plausibility / priority:** **CRITICAL / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-42/45; FIXTURE-05 + FIXTURE-01
- **Success / exit evidence:** Reconnect with entirely new peer/runtime IDs must recover the same canonical character/entity set with no identity duplication.
- **ADR dependency:** ADR — session/character binding representation
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-K03 — Duplicate retry / lost acknowledgement duplicates consequential operation

- **Parent:** PRD06-RISK-K
- **Failure statement:** Reliable resend, application retry or reconnect re-executes a committed operation.
- **Consequence:** Double spend, duplicate inventory, repeated construction, travel or treatment.
- **Trigger / exposure:** ACK loss after canonical commit; client times out and retries.
- **Upstream lineage:** PRD06-SEED-R5-H03; PRD04-BND-239–241/268/291; Q06
- **Existing controls:** Explicit durable operation IDs and owner-side duplicate detection; packet ACK is not semantic commit.
- **Severity / plausibility / priority:** **CRITICAL / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-35/43; FIXTURE-05 + FIXTURE-03
- **Success / exit evidence:** Drop acknowledgements and replay identical commands across reconnect; exactly one semantic effect occurs and prior result can be returned.
- **ADR dependency:** ADR — operation-ID/idempotency scheme
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-K04 — Delta applied against wrong world/content/region baseline

- **Parent:** PRD06-RISK-K
- **Failure statement:** A delta is accepted without proving its world, content/schema, frame/region and revision baseline.
- **Consequence:** Client cache becomes poisoned, terrain/entities reinterpret incorrectly or hidden state appears.
- **Trigger / exposure:** World switch, pack change, reconnect, realm travel, stale cache or protocol mismatch.
- **Upstream lineage:** PRD06-SEED-R5-H04; PRD04-BND-235/236/247–250/288
- **Existing controls:** Snapshots/deltas are scoped and revisioned; compatibility identity is separate from transport success.
- **Severity / plausibility / priority:** **CRITICAL / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-36/44; FIXTURE-05
- **Success / exit evidence:** Attempt wrong-world, wrong-pack and stale-baseline deltas; all must be rejected or repaired by bounded snapshot+delta recovery.
- **ADR dependency:** ADR — baseline/snapshot identity schema
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-K05 — Bulk voxel transfer starves realtime authoritative control

- **Parent:** PRD06-RISK-K
- **Failure statement:** Large terrain/content payloads share queues/channels/budgets with commands, acknowledgements and critical state.
- **Consequence:** Control latency spirals, disconnects occur and server responsiveness collapses during travel/edit bursts.
- **Trigger / exposure:** Teleport, join, region streaming, large edits or reconnect cache repair.
- **Upstream lineage:** PRD06-SEED-R5-H05; PRD04-BND-251–253; G02/G04/G07
- **Existing controls:** Bulk and realtime traffic are semantically separate classes with bounded budgets/backpressure.
- **Severity / plausibility / priority:** **CRITICAL / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-37/46; FIXTURE-05 + FIXTURE-10
- **Success / exit evidence:** Under saturated bulk transfer, critical command/ack/control traffic remains within explicit latency/queue bounds or degrades explicitly.
- **ADR dependency:** ADR — channel/traffic-class mapping and budgets
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-K06 — Interest collapses into view distance

- **Parent:** PRD06-RISK-K
- **Failure statement:** Replication interest is treated as identical to renderer distance or voxel viewer range.
- **Consequence:** Remote management/quest/vessel relevance fails, hidden data may leak, or simulation is overactivated merely to replicate state.
- **Trigger / exposure:** Using Zylann viewer distance or camera visibility as the interest authority.
- **Upstream lineage:** PRD06-SEED-R5-H06; PRD04-BND-254–263/550
- **Existing controls:** Interest is Leyforge-owned, cross-domain, frame-aware and distinct from simulation fidelity.
- **Severity / plausibility / priority:** **CRITICAL / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-38; FIXTURE-05
- **Success / exit evidence:** Fixtures must prove spatial, vessel, ownership, quest and remote-UI interest can differ while non-entitled state remains excluded.
- **ADR dependency:** ADR — interest policy/index implementation
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-K07 — Teleport/vessel/split-screen interest spike is unbounded

- **Parent:** PRD06-RISK-K
- **Failure statement:** Large sudden changes to one or several viewer interest sets enqueue unlimited snapshots/voxel/entity data.
- **Consequence:** Memory/CPU/network spikes, timeouts and cascading simulation activation.
- **Trigger / exposure:** Teleport, realm transition, fast vessel travel, split-screen union or admin spectating.
- **Upstream lineage:** PRD06-SEED-R5-H07; PRD04-BND-258/259/263; G02/G10
- **Existing controls:** Interest transitions are bounded/prioritized and can repair progressively.
- **Severity / plausibility / priority:** **CRITICAL / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-37/38; FIXTURE-05 + FIXTURE-10
- **Success / exit evidence:** Hostile interest jumps must keep queues/memory bounded and restore useful state progressively without incorrect deletion or disclosure.
- **ADR dependency:** ADR — interest admission/prioritization policy
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-K08 — Reconnect creates duplicate character/session lease

- **Parent:** PRD06-RISK-K
- **Failure statement:** A new connection instantiates a second canonical character while the original session/entity remains valid.
- **Consequence:** Duplicate inventory/entities, split ownership and exploitable duplication.
- **Trigger / exposure:** Network drop, server restart, mobile sleep, client crash or reconnect race.
- **Upstream lineage:** PRD06-SEED-R5-H08; PRD04-BND-287–295
- **Existing controls:** Reconnect restores stable character identity and explicit lease/session binding rather than spawning from peer identity.
- **Severity / plausibility / priority:** **CRITICAL / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-42/43/45; FIXTURE-05 + FIXTURE-04
- **Success / exit evidence:** Repeated disconnect/reconnect/restart yields exactly one canonical character and one valid current lease/session binding.
- **ADR dependency:** ADR — reconnect lease/session model
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-K09 — Reconnect repeats unresolved pending transaction

- **Parent:** PRD06-RISK-K
- **Failure statement:** Reconnect cannot determine whether a pre-disconnect operation committed and blindly reissues or abandons it.
- **Consequence:** Double execution or lost intended action.
- **Trigger / exposure:** Disconnect between command receipt, semantic commit and acknowledgement.
- **Upstream lineage:** PRD06-SEED-R5-H08/H09; PRD04-BND-289–291; Q03/Q06/Q13
- **Existing controls:** Reconnect resumes from acknowledged revisions and durable operation IDs; pending operations are resolved, not reinvented.
- **Severity / plausibility / priority:** **CRITICAL / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-43/45; FIXTURE-05 + FIXTURE-04
- **Success / exit evidence:** Disconnect at each transaction phase and reconnect; final state must resolve original operation identity exactly once.
- **ADR dependency:** ADR — reconnect pending-operation reconciliation
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-K10 — Transport ACK is mistaken for canonical or durable commit

- **Parent:** PRD06-RISK-K
- **Failure statement:** Packet delivery/acknowledgement is exposed as proof that gameplay committed or save durability completed.
- **Consequence:** Clients believe actions succeeded that later disappear, or retries are suppressed incorrectly.
- **Trigger / exposure:** Networking layer reports success before owner commit/checkpoint publication.
- **Upstream lineage:** PRD06-SEED-R5-H09; PRD04-BND-240/241/270/299; Q08
- **Existing controls:** Semantic commit and durability classes are explicit above transport.
- **Severity / plausibility / priority:** **CRITICAL / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-35/43 + PROOF-39/69; FIXTURE-05 + FIXTURE-04
- **Success / exit evidence:** Packet ACK before/after injected commit/persistence failures must never change the authoritative interpretation of whether the operation happened.
- **ADR dependency:** ADR — acknowledgement/result protocol semantics
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-K11 — Unbounded decode/decompression cost becomes server abuse vector

- **Parent:** PRD06-RISK-K
- **Failure statement:** Small or malformed requests trigger unbounded allocation, decompression, parsing, semantic lookup or fan-out.
- **Consequence:** Remote denial of service or memory exhaustion.
- **Trigger / exposure:** Public server receives crafted packet/schema/content/voxel requests.
- **Upstream lineage:** PRD06-SEED-R5-H10; PRD04-BND-237/238; ENG-GOV security boundary
- **Existing controls:** Bounded explicit schemas; untrusted object decoding disabled; request cost/admission limits.
- **Severity / plausibility / priority:** **CRITICAL / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-46/55/56; FIXTURE-05 + FIXTURE-07
- **Success / exit evidence:** Malformed/oversized/high-cost inputs are rejected within explicit CPU/memory/allocation bounds without executing untrusted objects.
- **ADR dependency:** ADR — codec limits and abuse budgets
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-K12 — Protocol/content compatibility check occurs too late

- **Parent:** PRD06-RISK-K
- **Failure statement:** Peer is admitted to ordinary world traffic before protocol, content-pack, schema and world compatibility are resolved.
- **Consequence:** Invalid clients receive/submit state, causing disconnect loops or unsafe reinterpretation.
- **Trigger / exposure:** Connection success is treated as gameplay admission.
- **Upstream lineage:** PRD04-BND-235/236/288; current SceneMultiplayer authentication capability evidence
- **Existing controls:** Authentication/admission phase is distinct from world admission; compatibility gates precede normal replication.
- **Severity / plausibility / priority:** **HIGH / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-36/54; FIXTURE-05 + FIXTURE-07
- **Success / exit evidence:** Incompatible client baselines must fail before ordinary authoritative traffic and produce explicit reasons.
- **ADR dependency:** ADR — connection/auth/world-admission handshake
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-K13 — Client cache repair deletes or overwrites canonical server truth

- **Parent:** PRD06-RISK-K
- **Failure statement:** Server trusts client cached baseline/content as authoritative during repair.
- **Consequence:** Stale or malicious client state can erase/alter server entities or voxels.
- **Trigger / exposure:** Reconnect/cache reconciliation uses client as source rather than evidence.
- **Upstream lineage:** PRD04-BND-242/243/261/290; PROOF-44
- **Existing controls:** Server-authoritative revisions/snapshots repair clients; prediction/cache remains disposable.
- **Severity / plausibility / priority:** **CRITICAL / POSSIBLE / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-44; FIXTURE-05
- **Success / exit evidence:** Poisoned cache fixtures must always converge to server truth and never mutate canonical server state.
- **ADR dependency:** ADR — cache-repair strategy
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-K14 — Network history retention is unbounded or insufficient for repair

- **Parent:** PRD06-RISK-K
- **Failure statement:** Server retains unlimited deltas/operations, or discards history too aggressively to repair realistic reconnect gaps.
- **Consequence:** Memory grows without bound or clients require full snapshots constantly.
- **Trigger / exposure:** Long disconnects, high churn or many clients.
- **Upstream lineage:** PRD04-BND-297/298; UNK-MP reconnect/history questions
- **Existing controls:** Retention is bounded and scope-aware; snapshot + delta repair is allowed.
- **Severity / plausibility / priority:** **HIGH / LIKELY / P1**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-42/45/46; FIXTURE-05
- **Success / exit evidence:** Measure realistic gap distributions and prove bounded retention can repair accepted windows while older gaps fall back safely to scoped snapshots.
- **ADR dependency:** ADR — history retention windows/compaction
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-K15 — Channel/reliability choice accidentally becomes gameplay semantic contract

- **Parent:** PRD06-RISK-K
- **Failure statement:** Specific ENet channels or transfer modes are relied upon as the only source of operation ordering/meaning.
- **Consequence:** Transport reconfiguration or loss semantics changes gameplay correctness.
- **Trigger / exposure:** Reliable/unreliable channel ordering is confused with canonical revision/order.
- **Upstream lineage:** PRD04-BND-251; current Godot MultiplayerPeer/ENet evidence
- **Existing controls:** Higher-level operation/revision semantics define correctness; channels are transport optimization.
- **Severity / plausibility / priority:** **HIGH / POSSIBLE / P1**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-35/36/46; FIXTURE-05
- **Success / exit evidence:** Re-map candidate channel/reliability layouts and introduce loss/reordering; canonical results remain correct while performance differs.
- **ADR dependency:** ADR — ENet channel/reliability mapping
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-K16 — Achievable player scale is inferred from transport max-client setting

- **Parent:** PRD06-RISK-K
- **Failure statement:** Configured transport maximum is treated as evidence of supported simultaneous player count.
- **Consequence:** Server sizing and product promises exceed actual CPU/network/simulation limits.
- **Trigger / exposure:** Reading ENet max-client capability as application qualification.
- **Upstream lineage:** Current Godot ENet documentation; PRD06-RISK-G/P
- **Existing controls:** Player-count support requires representative exported-server benchmarks and interest/simulation workloads.
- **Severity / plausibility / priority:** **HIGH / POSSIBLE / P1**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-46/70/71/76; FIXTURE-05 + FIXTURE-09 + FIXTURE-10
- **Success / exit evidence:** Supported player counts must come from measured end-to-end server lanes, never configuration maxima.
- **ADR dependency:** ADR — supported server/player tiers after benchmark evidence
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

## 56.2 PRD06-RISK-D — Persistence / recovery / migration risks

### PRD06-RISK-D01 — Voxel/provider async save reported as whole-world save success

- **Parent:** PRD06-RISK-D
- **Failure statement:** A provider save request or completion is surfaced as coherent whole-world durability.
- **Consequence:** Other DB/journal/files may lag, so reported saves can recover to a state that never existed.
- **Trigger / exposure:** Calling voxel save/flush then displaying 'saved' without SaveCoordinator checkpoint publication.
- **Upstream lineage:** PRD06-SEED-R5-I01; PRD04-BND-264–280/547
- **Existing controls:** SaveCoordinator alone publishes coherent checkpoints and durability classes.
- **Severity / plausibility / priority:** **CRITICAL / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-39/41/47; FIXTURE-04
- **Success / exit evidence:** User-visible save success must correspond to one checkpoint identity whose required participants satisfy the declared durability class.
- **ADR dependency:** ADR — checkpoint publication/durability implementation
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-D02 — Newest independent artifacts are mixed after crash

- **Parent:** PRD06-RISK-D
- **Failure statement:** Recovery chooses independently newest DB, voxel, journal or file artifacts instead of one coherent lineage.
- **Consequence:** Recovery synthesizes a world state that never canonically existed.
- **Trigger / exposure:** Crash between asynchronous participant writes.
- **Upstream lineage:** PRD06-SEED-R5-I02; PRD04-BND-270/271/275/283
- **Existing controls:** Checkpoint manifest/lineage and explicit participant revisions determine recoverable set.
- **Severity / plausibility / priority:** **CRITICAL / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-39/40/69; FIXTURE-04
- **Success / exit evidence:** Crash at every participant write phase and prove recovery selects exactly one coherent checkpoint lineage, never timestamp mixing.
- **ADR dependency:** ADR — checkpoint lineage/manifest format
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-D03 — Old async voxel save writes into reopened/replaced world

- **Parent:** PRD06-RISK-D
- **Failure statement:** Pending tasks from a closed world continue using a stream/provider that has been retargeted or reused for a new session.
- **Consequence:** Edits from World A appear in World B or reopened epoch.
- **Trigger / exposure:** Switching save path/resource, reusing cached stream, closing/reopening before tasks drain.
- **Upstream lineage:** PRD06-SEED-R5-I03; PRD04-BND-073/076/264; current Voxel Tools async-save warnings
- **Existing controls:** WorldSession epochs and per-session provider/stream instances; close/drain barriers.
- **Severity / plausibility / priority:** **CRITICAL / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-07/20/69; FIXTURE-04 + FIXTURE-01
- **Success / exit evidence:** Rapid world switch/close/reopen with queued saves must show zero cross-world writes and explicit stale-task rejection/drain.
- **ADR dependency:** ADR — provider lifetime and world-close drain implementation
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-D04 — Provider write order becomes canonical transaction history

- **Parent:** PRD06-RISK-D
- **Failure statement:** The order DB/voxel/files physically finish is interpreted as gameplay transaction order.
- **Consequence:** Recovery/network replay can reorder consequences and violate dependencies.
- **Trigger / exposure:** Parallel async persistence completions.
- **Upstream lineage:** PRD06-SEED-R5-I04; PRD04-BND-266–270; Q08
- **Existing controls:** Canonical operation/revision order is established before persistence; journal records consequential authority.
- **Severity / plausibility / priority:** **CRITICAL / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-39/63/69; FIXTURE-04 + FIXTURE-03
- **Success / exit evidence:** Randomize participant completion order; recovered canonical transaction sequence remains identical.
- **ADR dependency:** ADR — journal/revision ordering representation
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-D05 — Persistence backlog grows without bound under heavy edits

- **Parent:** PRD06-RISK-D
- **Failure statement:** Voxel/DB/journal writes accumulate faster than durable storage can absorb.
- **Consequence:** Memory grows, saves lag minutes behind, shutdown cannot drain or data loss exposure expands.
- **Trigger / exposure:** Construction bursts, fluids, vessels, mass simulation, slow disks.
- **Upstream lineage:** PRD06-SEED-R5-I05; G02/G07; PRD04-BND-279/280
- **Existing controls:** Bounded queues, durability lag telemetry, backpressure/admission/degradation.
- **Severity / plausibility / priority:** **CRITICAL / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-41/47; FIXTURE-04 + FIXTURE-10
- **Success / exit evidence:** Heavy-edit stress on slow storage must reach bounded steady/degraded behavior and recover after pressure subsides.
- **ADR dependency:** ADR — persistence queue/backpressure thresholds
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-D06 — Migration destroys or overwrites only known-good checkpoint

- **Parent:** PRD06-RISK-D
- **Failure statement:** Migration mutates source in place without preserving a recoverable original.
- **Consequence:** Failed migration permanently destroys a world.
- **Trigger / exposure:** Schema/provider/pack upgrade begins on sole checkpoint.
- **Upstream lineage:** PRD06-SEED-R5-I06; PRD04-BND-277/285/286
- **Existing controls:** Known-good source recovery path is preserved; migration failure is explicit.
- **Severity / plausibility / priority:** **CRITICAL / POSSIBLE / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-40/57/58; FIXTURE-04 + FIXTURE-07
- **Success / exit evidence:** Force migration failure at each phase; original world remains recoverable and no partial migrated checkpoint becomes authoritative.
- **ADR dependency:** ADR — migration staging/rollback strategy
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-D07 — Missing/changed semantic IDs are silently reinterpreted during migration

- **Parent:** PRD06-RISK-D
- **Failure statement:** Absent pack/content IDs are rebound by load order, numeric slot or guessed substitute.
- **Consequence:** World meaning changes silently.
- **Trigger / exposure:** Content pack missing/renamed/retired; old runtime palette loaded.
- **Upstream lineage:** PRD06-SEED-R5-I06; family C/R; PRD04-BND-285/551
- **Existing controls:** Stable semantic IDs, explicit aliases/deprecations, quarantine/compatibility objects and FCC-13 migration authority.
- **Severity / plausibility / priority:** **CRITICAL / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-57/58/74; FIXTURE-04 + FIXTURE-07 + FIXTURE-01
- **Success / exit evidence:** Missing/retired ID fixtures must resolve only via explicit governed migration/compatibility rules or fail/quarantine without silent substitution.
- **ADR dependency:** ADR — migration resolver/quarantine implementation
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-D08 — Generator/provider format upgrade invalidates old edited regions

- **Parent:** PRD06-RISK-D
- **Failure statement:** New generator or voxel storage format changes the interpretation of unedited/edited regions without version binding.
- **Consequence:** Old worlds regenerate differently around edits or become partially unreadable.
- **Trigger / exposure:** Generator version, VoxelStream format/coordinate format or provider upgrade.
- **Upstream lineage:** PRD06-SEED-R5-I07; E07; current VoxelStreamSQLite format evidence
- **Existing controls:** World/checkpoint records generator/provider/schema versions; upgrades require governed migration/conversion.
- **Severity / plausibility / priority:** **CRITICAL / POSSIBLE / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-58/69/72; FIXTURE-04 + FIXTURE-09
- **Success / exit evidence:** Load old fixtures under upgraded provider/generator and prove unchanged regions retain intended semantics or migration explicitly rebuilds them.
- **ADR dependency:** ADR — generator/provider version migration policy
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-D09 — Live backup/copy captures mutually inconsistent files

- **Parent:** PRD06-RISK-D
- **Failure statement:** Filesystem copy runs while checkpoint participants are at different revisions.
- **Consequence:** Backup opens but represents no coherent world.
- **Trigger / exposure:** Manual copy/cloud backup/live export during active simulation/save.
- **Upstream lineage:** PRD06-SEED-R5-I08; PRD04-BND-275–283
- **Existing controls:** World copy/backup is checkpoint-aware and tied to published immutable/coherent lineage.
- **Severity / plausibility / priority:** **CRITICAL / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-48/69; FIXTURE-04
- **Success / exit evidence:** Create backups during continuous writes and prove every advertised backup restores one coherent checkpoint.
- **ADR dependency:** ADR — snapshot/copy mechanism
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-D10 — SQLite/voxel-store schema becomes semantic authority

- **Parent:** PRD06-RISK-D
- **Failure statement:** Database tables, provider coordinate encoding or provider file layout are treated as canonical world model.
- **Consequence:** Provider replacement/migration becomes impossible and storage constraints leak into gameplay identity/range.
- **Trigger / exposure:** Game code directly depends on provider row IDs/coordinate formats as semantic IDs.
- **Upstream lineage:** PRD06-SEED-R5-I09; PRD04-BND-269/272–274; family C
- **Existing controls:** Persistence providers store projections of Leyforge-owned schemas/IDs behind SaveCoordinator contracts.
- **Severity / plausibility / priority:** **CRITICAL / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-39/58/67; FIXTURE-04 + FIXTURE-01
- **Success / exit evidence:** At least one provider/schema migration fixture preserves semantic state without exposing provider row/coordinate identity externally.
- **ADR dependency:** ADR — structured storage provider after prototype
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-D11 — Shutdown closes network/providers before durable drain

- **Parent:** PRD06-RISK-D
- **Failure statement:** Disconnect, stream/database close or process exit occurs before required operations/checkpoint writes finish.
- **Consequence:** Last actions vanish, files corrupt, shutdown hangs or reconnect sees ambiguous operations.
- **Trigger / exposure:** Quit/restart/deployment stop during heavy activity.
- **Upstream lineage:** PRD06-SEED-R5-I10; G11; PRD04-BND-075/279/284
- **Existing controls:** Coordinated shutdown barrier with task classes: drain/cancel/invalidate/provider-drain.
- **Severity / plausibility / priority:** **CRITICAL / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-20/69; FIXTURE-04 + FIXTURE-09
- **Success / exit evidence:** Shutdown at peak load completes within bounded policy and restart resolves all operations/checkpoints coherently.
- **ADR dependency:** ADR — shutdown ordering/drain contract
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-D12 — Checkpoint manifest itself is torn/corrupt/unverifiable

- **Parent:** PRD06-RISK-D
- **Failure statement:** Coordination metadata is partially written or corrupted, leaving participant files without trustworthy lineage.
- **Consequence:** Recovery may select wrong participants or declare unrecoverable despite valid previous checkpoint.
- **Trigger / exposure:** Power/process loss during manifest publication; disk corruption.
- **Upstream lineage:** PRD04-BND-275–278/283
- **Existing controls:** Atomic publication strategy, integrity evidence and retained previous-known-good checkpoint.
- **Severity / plausibility / priority:** **CRITICAL / POSSIBLE / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-40/69; FIXTURE-04
- **Success / exit evidence:** Corrupt/torn newest manifest and prove deterministic fallback to previous verified lineage without guessing.
- **ADR dependency:** ADR — atomic checkpoint publication/integrity format
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-D13 — Autosave introduces global simulation freeze or inconsistent live snapshot

- **Parent:** PRD06-RISK-D
- **Failure statement:** Saving either stops the whole world for unacceptable periods or snapshots mutating domains without governed revision boundaries.
- **Consequence:** Latency spikes or internally inconsistent checkpoints.
- **Trigger / exposure:** Large world autosave under active settlements/edits/networking.
- **Upstream lineage:** PRD04-BND-279/282; REQ-PST scalability
- **Existing controls:** Checkpoint cutoff/revision semantics permit asynchronous participant work without redefining authority.
- **Severity / plausibility / priority:** **HIGH / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-41/47; FIXTURE-04 + FIXTURE-10
- **Success / exit evidence:** Autosave under representative load must stay within pause/latency budget and recover one coherent cutoff revision.
- **ADR dependency:** ADR — snapshot/cutoff strategy
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-D14 — Durability class is ambiguous to UI/network/gameplay

- **Parent:** PRD06-RISK-D
- **Failure statement:** Systems use 'saved' without distinguishing memory commit, journaled state, published checkpoint or external backup.
- **Consequence:** Players/admins receive false guarantees and shutdown/restart policies become inconsistent.
- **Trigger / exposure:** Mixed save APIs and status messages.
- **Upstream lineage:** PRD04-BND-279–281
- **Existing controls:** Explicit durability classes and user-visible success mapping.
- **Severity / plausibility / priority:** **HIGH / LIKELY / P1**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-41/45/69; FIXTURE-04 + FIXTURE-05
- **Success / exit evidence:** Every save/result acknowledgement in representative flows maps to one documented durability class and behaves accordingly under crash.
- **ADR dependency:** ADR — durability-class names/semantics
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-D15 — Journal grows without bound or compaction loses required recovery/idempotency history

- **Parent:** PRD06-RISK-D
- **Failure statement:** Consequential operation history either expands indefinitely or is truncated before checkpoints/reconnect/migration no longer need it.
- **Consequence:** Storage growth or inability to dedupe/recover transactions.
- **Trigger / exposure:** Long-lived servers/worlds with high transaction volume.
- **Upstream lineage:** PRD04-BND-266–268/297; Q06/Q09
- **Existing controls:** Journal records consequential authority with checkpoint-aligned bounded retention/compaction.
- **Severity / plausibility / priority:** **HIGH / LIKELY / P1**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-45/47/69; FIXTURE-04 + FIXTURE-05
- **Success / exit evidence:** Long-run fixture proves bounded growth while preserving required dedupe/recovery across supported windows.
- **ADR dependency:** ADR — journal retention/compaction
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-D16 — Real crash behavior differs from graceful-stop fixtures

- **Parent:** PRD06-RISK-D
- **Failure statement:** Tests rely on normal cleanup paths that real power/process kill bypasses.
- **Consequence:** Production corruption appears despite passing save tests.
- **Trigger / exposure:** OS kill, power loss, native crash, SIGKILL-like termination.
- **Upstream lineage:** PRD04-PROOF-69; historical POC distinction
- **Existing controls:** Real process termination is a mandatory proof lane separate from graceful shutdown.
- **Severity / plausibility / priority:** **CRITICAL / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-69; FIXTURE-04 + FIXTURE-09
- **Success / exit evidence:** Kill real exported process at randomized persistence/transaction phases and prove deterministic recovery repeatedly.
- **ADR dependency:** ADR — none; this is qualification evidence
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-D17 — World copy/restore duplicates globally unique external/session identity

- **Parent:** PRD06-RISK-D
- **Failure statement:** Copying a world duplicates IDs that should be copy-scoped or runtime/session-specific.
- **Consequence:** Two restored worlds collide in services, reconnect routing, backups or caches.
- **Trigger / exposure:** World duplication, template creation, server migration.
- **Upstream lineage:** PRD04-PROOF-48; BND-265/299; family C/K
- **Existing controls:** Distinguish canonical within-world IDs from world-instance/session/deployment identities.
- **Severity / plausibility / priority:** **HIGH / POSSIBLE / P1**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-48/45; FIXTURE-04 + FIXTURE-05
- **Success / exit evidence:** Copy/restore fixture runs source and copy concurrently without cross-routing or identity collision while preserving intended in-world semantic IDs.
- **ADR dependency:** ADR — world-copy identity rebinding rules
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-D18 — Provider flush/completion tracker is mistaken for complete checkpoint barrier

- **Parent:** PRD06-RISK-D
- **Failure statement:** A voxel stream flush or save completion tracker is assumed to cover saves queued later or unrelated checkpoint participants.
- **Consequence:** SaveCoordinator publishes too early.
- **Trigger / exposure:** Using provider-specific completion semantics as global barrier.
- **Upstream lineage:** Current VoxelStream/VoxelTerrain documentation; PRD04-BND-264/274/279
- **Existing controls:** Provider completion is participant evidence only; SaveCoordinator owns participant set/cutoff.
- **Severity / plausibility / priority:** **CRITICAL / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-39/41/47; FIXTURE-04
- **Success / exit evidence:** Generate edits before/after provider save request and concurrent DB/journal writes; checkpoint may publish only when its defined cutoff participant set is complete.
- **ADR dependency:** ADR — participant barrier/cutoff mechanism
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

# 57. Round-5 Cross-Risk Dependency Spine

```text
K networking / reconnect
 ├──► C semantic identity and runtime remapping
 ├──► F owner/session authority
 ├──► G network/CPU/backpressure
 ├──► Q idempotency / commit semantics
 ├──► L headless server parity
 └──► D durable recovery of the same committed authority

D persistence / recovery
 ├──► C semantic identity / migration
 ├──► E generator-version compatibility
 ├──► F task/session lifetime
 ├──► G persistence backpressure / shutdown
 ├──► K reconnect/restart baselines
 ├──► M content-pack recovery/migration
 ├──► Q transaction journal / crash semantics
 └──► R historical migration fixtures

K + D + Q
 └──► one operation identity, one canonical revision/order, two downstream projections
```

# 58. Round-5 Failure Matrices Required for PRD-07

## 58.1 Network impairment matrix

PRD-07 must vary at minimum:

- packet loss, duplication, reordering and delay;
- connection drop before command receipt, after receipt, after semantic commit, after persistence evidence and before/after acknowledgement;
- stale/wrong protocol baseline;
- stale/wrong content-pack baseline;
- poisoned client cache;
- teleport/realm/vessel interest spikes;
- split-screen interest union;
- bulk voxel transfer while critical commands continue;
- reconnect with new peer ID;
- server restart during unresolved operations;
- malformed/oversized/high-cost requests.

## 58.2 Persistence crash matrix

For representative C0 transactions and checkpoint creation, real-process kill points must include:

1. before canonical commit;
2. immediately after canonical commit;
3. during journal append;
4. before/after structured DB participant commit;
5. before/during/after voxel participant save;
6. during checkpoint manifest construction;
7. immediately before/after checkpoint publication;
8. during backup/copy;
9. during migration staging;
10. during shutdown drain.

Every cell must recover to an explainable state: **committed, rejected, recoverably pending, explicitly compensated/quarantined, or previous-known-good**.

# 59. Round-5 Proof Exit Matrix

| Proof | Principal Round-5 consumers | Minimum exit evidence |
|---|---|---|
| **PROOF-07 — World Close/Reopen Stale Task** | D03/D11, K08 | Old provider/network/session work cannot mutate a reopened world epoch. |
| **PROOF-20 — Shutdown Drain Matrix** | D03/D11, G11 | Every long task class follows explicit drain/cancel/invalidate/provider-drain semantics. |
| **PROOF-35 — Duplicate Command / Lost Ack** | K03/K09/K10/K15 | Consequential operation executes once despite lost/duplicate transport events. |
| **PROOF-36 — Protocol Baseline Mismatch** | K01/K04/K12/K15 | Incompatible protocol/content baselines fail or negotiate before ordinary play. |
| **PROOF-37 — Teleport Interest Spike** | K05/K07 | Large interest changes remain bounded and critical traffic keeps progressing. |
| **PROOF-38 — Cross-Domain Interest** | K06/K07 | Interest correctly combines spatial and non-spatial relevance without leaking hidden state. |
| **PROOF-39 — Cross-Store Crash Matrix** | D01/D02/D04/D10/D18 | Independently asynchronous participants recover one coherent checkpoint lineage. |
| **PROOF-40 — Corrupt Latest Checkpoint** | D02/D06/D12 | Corrupt newest checkpoint safely falls back to verified known-good lineage. |
| **PROOF-41 — Save During Heavy Edits** | D01/D05/D13/D18 | Active heavy mutation can checkpoint coherently without unbounded pause/backlog. |
| **PROOF-42 — Reconnect During Realm Transition** | K02/K08/K14 | Stable character/frame identity is restored exactly once across reconnect. |
| **PROOF-43 — Reconnect During Inventory Transaction** | K03/K09/K10 | Original operation identity resolves exactly once without resource duplication/loss. |
| **PROOF-44 — Client Cache Poison** | K04/K13 | Server truth repairs malicious/stale client cache; client cache never mutates authority. |
| **PROOF-45 — Server Restart Resume** | K01/K02/K08/K09/K14, D14/D15/D17 | Restart restores stable world/character/operation baselines within supported history. |
| **PROOF-46 — Network Backpressure** | K05/K07/K11/K14/K15/K16 | Overload is bounded; critical/control traffic continues or explicitly degrades. |
| **PROOF-47 — Persistence Backpressure** | D01/D05/D13/D15/D18 | Slow storage cannot create unbounded queues or false durability acknowledgement. |
| **PROOF-48 — World Copy / Backup** | D09/D17 | Copies/backups are coherent and identity-safe while source world remains active. |
| **PROOF-57 — Missing Pack World Recovery** | D06/D07 | Missing content produces governed compatibility/quarantine behavior, never silent reinterpretation. |
| **PROOF-58 — Pack Upgrade / World Migration** | D06–D10 | Migration preserves source recovery path and semantic meaning across supported upgrade. |
| **PROOF-69 — Real Process Crash Recovery** | D02–D04/D06/D08–D12/D14–D16 | Real process kills recover deterministic canonical lineage without relying on graceful cleanup. |

No row above is a proof result.

# 60. ADR Reservation Gates

| Future ADR | Required evidence before acceptance |
|---|---|
| **Durable protocol schema / codec** | K01/K04/K11/K12 + PROOF-36/46. |
| **ENet channel / reliability / bandwidth mapping** | K05/K15/K16 + impairment/backpressure benchmarks. |
| **Interest index / admission / history policy** | K06/K07/K14 + PROOF-37/38/46. |
| **Reconnect lease/session and pending-operation model** | K02/K08/K09 + PROOF-42/43/45. |
| **SaveCoordinator checkpoint manifest / publication format** | D01/D02/D12/D18 + PROOF-39/40/69. |
| **Structured DB / voxel persistence provider selection** | D08/D10 plus provider-conformance and migration evidence. |
| **Journal format / retention / compaction** | D04/D15 + Q06/Q09 + crash/restart evidence. |
| **Checkpoint cutoff/cadence/durability classes** | D05/D13/D14/D18 + PROOF-41/47/69. |
| **Backup/world-copy implementation** | D09/D17 + PROOF-48. |
| **Migration staging/resolver/quarantine implementation** | D06/D07/D08 + PROOF-57/58. |
| **Shutdown drain ordering** | D03/D11 + PROOF-07/20/69. |

# 61. PRD-07 Fixture Additions

## FIXTURE-05 — Authoritative Server / Reconnect / Bulk-Interest Harness

Must expose:

- stable world/account/player/character/entity IDs separately from peer IDs;
- explicit protocol/content/schema baseline identity;
- operation IDs and authoritative revisions;
- controllable packet loss/duplication/reordering/delay;
- bounded raw request decoding;
- configurable traffic classes/channels without semantic changes;
- snapshot + delta repair;
- poisoned client cache injection;
- teleport/vessel/remote-UI/split-screen interest scenarios;
- disconnect/reconnect at every transaction phase;
- server restart with unresolved operations;
- network queue depth, queue age, bandwidth and critical-message latency.

## FIXTURE-04 — Checkpoint / DB / Voxel-Store Crash Harness

Must expose:

- SaveCoordinator checkpoint ID/cutoff revision;
- journal boundary;
- structured DB participant revision;
- voxel-store participant revision and completion state;
- schema/generator/provider/content manifest;
- atomic checkpoint publication/integrity evidence;
- previous-known-good lineage;
- live backup/copy;
- migration staging;
- slow-I/O/backpressure controls;
- graceful shutdown **and real process kill**;
- corruption/torn-write injection;
- old-session async task injection.

# 62. Round-5 Open Implementation Questions Preserved

1. Exact durable network schema/codec.
2. Exact ENet channel count, modes and bandwidth configuration.
3. Compression/segmentation of voxel and bulk state.
4. Interest spatial/non-spatial index structure.
5. Interest update cadence, budgets and history retention.
6. Reconnect lease/token implementation.
7. Exact operation-ID encoding.
8. Prediction/reconciliation detail beyond canonical authority law.
9. Structured database technology/integration and configuration.
10. Journal physical format and granularity.
11. Checkpoint manifest storage/publication mechanism.
12. Checkpoint cadence and durability classes.
13. Voxel persistence backend/layout.
14. Backup/copy mechanism and cloud-save policy.
15. Migration execution engine and quarantine storage.
16. Generator/provider-version conversion strategy.
17. Shutdown task ordering and time bounds.
18. Supported reconnect/history window.
19. Supported player/server counts and network budgets.
20. Final network/persistence observability thresholds.

# 63. Round-5 Integrity Checks

| Check | Result |
|---|---|
| Parent risk families K/D preserved | **PASS — 2/2** |
| Stable Round-5 child-risk IDs | **PASS — 34/34** |
| K child risks | **PASS — 16** |
| D child risks | **PASS — 18** |
| PRD05 Round-5 H01–H10 seeds consumed | **PASS — 10/10** |
| PRD05 Round-5 I01–I10 seeds consumed | **PASS — 10/10** |
| Networking/persistence one-authority-two-projections law preserved | **PASS** |
| Packet ACK separated from semantic/durable commit | **PASS** |
| Peer/NodePath identity remains ephemeral | **PASS** |
| Interest remains Leyforge-owned and distinct from view distance/fidelity | **PASS** |
| Provider save completion remains participant evidence only | **PASS** |
| Recovery selects coherent lineage rather than newest-file mixture | **PASS** |
| Migration preserves known-good source path | **PASS** |
| Real process crash remains distinct from graceful shutdown | **PASS** |
| Exact codec/channel/DB/journal/checkpoint implementations remain unlocked | **PASS** |
| Current PRD-08 proof results created | **PASS — 0** |
| Implementation ADRs accepted | **PASS — 0** |
| PRD-04/05 reopen candidates | **PASS — 0** |

# 64. Round-5 Closure Verdict

> **ROUND 5 PASS — NETWORK / PERSISTENCE / RECOVERY / MIGRATION RISK DECOMPOSITION COMPLETE.**

The most consequential Round-5 conclusions are:

1. **Transport success is not semantic commit, and semantic commit is not automatically checkpoint durability.**
2. **Peer IDs, NodePaths, database row IDs and voxel-provider coordinates remain implementation identities, never durable Leyforge semantics.**
3. **Interest is a cross-domain Leyforge policy, not camera distance or voxel view distance.**
4. **Reconnect restores canonical identity/revision/operation context rather than spawning a new character or inventing a new transaction.**
5. **Provider save completion is only evidence from one checkpoint participant.**
6. **Recovery must choose one coherent checkpoint lineage; mixing independently newest files is explicitly invalid.**
7. **Migration must preserve the last known-good source and cannot silently reinterpret missing IDs.**
8. **Real process kills are mandatory recovery evidence because graceful cleanup can hide the exact failures this architecture is meant to survive.**

No Round-5 finding requires PRD-04 or PRD-05 reopening.

# 65. Machine-Readable Round-5 Summary

```yaml
document: PRD-06
version: v0.5
round: 5
status: WORKING
round_status: PASS
parent_families_decomposed: [K, D]
child_risks:
  K: 16
  D: 18
  total: 34
severity_counts:
  critical: 26
  high: 8
plausibility_counts:
  likely: 27
  possible: 7
priority_counts:
  p0: 28
  p1: 6
round5_seed_intake:
  network_h_seeds_consumed: 10
  persistence_i_seeds_consumed: 10
proof_results_created: 0
implementation_adrs_created: 0
architecture_reopen_candidates: 0
technology_refresh_date: 2026-09-05
next_round: Forge / Trust / Art / Presentation
```

---

**End of PRD-06 v0.5 — Round 5 Working Baseline**

---

# 66. Round-6 Scope and Controlled Authority / Technology Refresh

Round 6 decomposes **PRD06-RISK-M — Content-pack / safe-mod sandbox boundary**, **PRD06-RISK-N — Art Production Handoff completeness**, and **PRD06-RISK-O — Renderer / accessibility / profile certification**.

Two controlled source-status changes are explicitly consumed:

1. **ART-00 through ART-10 are now owner-accepted and locked as the theoretical art-production authority corpus.** This closes the former ART-10 owner-lock pending status. It does **not** create production qualification: golden bootstrap assets, Forge/CI validators, representative runtime evidence and mass-production proof remain future work.
2. **MAP-00 is locked and supersedes XAUTH-ART-0001 for gameplay design.** The ordinary → surveyed → magical relief/volumetric map progression, knowledge boundary, multiplayer object behavior and accessibility requirements are no longer a design unknown. ART-08 remains presentation authority and engineering implementation remains future work.

Current Godot renderer documentation continues to expose materially different renderer feature sets: Forward+ is the most feature-complete desktop renderer; Mobile targets newer mobile/desktop with reduced feature/cost; Compatibility targets widest/older hardware and lacks multiple advanced features. Godot can also automatically fall back to Compatibility when RenderingDevice support is unavailable. Therefore **renderer launch success cannot equal Leyforge renderer certification**.

No Round-6 fact creates a PRD-08 result or accepts an implementation ADR.

# 67. Round-6 Stable Child-Risk Register

Round 6 creates **46 stable child risks**:

- **M — content-pack / safe-mod / trust:** 15
- **N — Forge / Art Production Handoff execution:** 14
- **O — renderer / settings / accessibility / presentation:** 17

Classification:

- **CRITICAL:** 21
- **HIGH:** 25
- **LIKELY:** 35
- **POSSIBLE:** 11
- **P0:** 31
- **P1:** 15

Round-6 PRD-05 seed handling rule:

- `PRD06-SEED-R6-J02..J09` are decomposed principally under M/N.
- `PRD06-SEED-R6-K01..K10` are decomposed principally under O.
- `PRD06-SEED-R6-J01` and `J10` remain correctly owned by **RISK-C** (semantic identity/migration) and are consumed here as cross-family dependencies rather than being incorrectly reassigned.

## 67.1 PRD06-RISK-M — Content-pack / safe-mod / trust risks

### PRD06-RISK-M01 — Safe data pack smuggles executable/native/editor content

- **Parent:** PRD06-RISK-M
- **Failure statement:** A pack admitted to the default player-safe tier embeds scripts, native libraries, editor plugins, executable resources or equivalent code paths.
- **Consequence:** Remote-code execution, filesystem/process access, server compromise or silent escalation from data authority to executable authority.
- **Trigger / exposure:** Archive/import pipeline trusts file extension, Godot Resource type, URI or manifest declaration rather than enforcing a bounded allowlist.
- **Upstream lineage:** PRD06-SEED-R6-J05; PRD04-BND-354/355/551/552; REQ-MOD-004
- **Existing controls:** M0/default player content is data-only; executable modding is a separate future trust tier; schema/import quarantine is required.
- **Severity / plausibility / priority:** **CRITICAL / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-55; FIXTURE-07 + FIXTURE-09
- **Success / exit evidence:** Adversarial packs containing scripts/native/editor payloads, disguised resources and nested references are rejected before runtime load, with no executable side effect.
- **ADR dependency:** ADR — safe-pack container/import allowlist and quarantine implementation
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-M02 — Declarative data mod becomes a resource-exhaustion bomb

- **Parent:** PRD06-RISK-M
- **Failure statement:** A code-free pack drives pathological memory, CPU, disk, shader, registry, recipe, generated-form or graph expansion.
- **Consequence:** Server/client denial of service despite the pack technically containing only allowed data.
- **Trigger / exposure:** Extreme counts, recursion/dependency cycles, huge textures/models, combinatorial forms, giant graphs, malformed compression or deeply nested structures.
- **Upstream lineage:** PRD06-SEED-R6-J06; PRD04-BND-354/355; REQ-MOD security/performance boundaries
- **Existing controls:** Data-only does not mean unbounded; schema limits, budgets and preflight estimation are mandatory.
- **Severity / plausibility / priority:** **CRITICAL / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-56; FIXTURE-07 + FIXTURE-09
- **Success / exit evidence:** Pathological but schema-valid packs are rejected or bounded before exhausting representative client/server memory, CPU or disk budgets.
- **ADR dependency:** ADR — pack resource budgets and admission estimator
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-M03 — Client/server pack split removes authoritative data

- **Parent:** PRD06-RISK-M
- **Failure statement:** Server stripping removes data needed for simulation/validation, or client stripping removes data required to interpret authoritative protocol/state.
- **Consequence:** Headless and client builds disagree semantically despite sharing pack identity.
- **Trigger / exposure:** Presentation-heavy resources carry hidden gameplay fields; split rules are path-based instead of semantic-role based.
- **Upstream lineage:** PRD06-SEED-R6-J07; PRD04-BND-352/353; R7-P09; family L
- **Existing controls:** Canonical gameplay definitions remain presentation-independent; pack manifests declare role/authority; server/client split is certified.
- **Severity / plausibility / priority:** **CRITICAL / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-54/62/70; FIXTURE-07 + FIXTURE-09
- **Success / exit evidence:** Representative packs produce stripped client/server artifacts that retain identical authoritative semantics while excluding unnecessary presentation content on server.
- **ADR dependency:** ADR — pack role/split manifest and stripping rules
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-M04 — Client/server split changes pack identity or dependency meaning

- **Parent:** PRD06-RISK-M
- **Failure statement:** Two role-specific products derived from one logical pack appear as unrelated packs or resolve dependencies differently.
- **Consequence:** Join/admission, migration and world lockfiles become ambiguous.
- **Trigger / exposure:** Artifact hashing/manifesting is performed after stripping without retaining common semantic source identity.
- **Upstream lineage:** PRD06-SEED-R6-J07; PRD04-BND-346–353; PRD05 Round-6 pack authority
- **Existing controls:** Logical pack identity/version/dependencies are distinct from role-specific artifact hashes/products.
- **Severity / plausibility / priority:** **CRITICAL / POSSIBLE / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-54/58/62; FIXTURE-07 + FIXTURE-04
- **Success / exit evidence:** Server/client artifacts trace to one logical semantic pack revision while still exposing exact role-product hashes; dependency resolution is identical where semantics must match.
- **ADR dependency:** ADR — logical-pack vs artifact identity scheme
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-M05 — External import retains unsafe path/URI references

- **Parent:** PRD06-RISK-M
- **Failure statement:** Imported content preserves absolute paths, traversal references, remote URIs or implicit editor-local dependencies into governed sources/runtime products.
- **Consequence:** Builds become non-reproducible, private files leak, runtime performs unintended filesystem/network access, or content fails on another machine.
- **Trigger / exposure:** Import from arbitrary model/audio/image/pack formats without canonicalized resource copying and reference validation.
- **Upstream lineage:** PRD06-SEED-R6-J08; ART-09 import/provenance flow; ENG-GOV security boundary
- **Existing controls:** Imports enter quarantine; external references are normalized/copied or rejected; final governed sources use controlled project identities.
- **Severity / plausibility / priority:** **CRITICAL / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-55/62; FIXTURE-07 + FIXTURE-09
- **Success / exit evidence:** Fixtures containing traversal, absolute, remote and missing-reference inputs cannot escape the import sandbox and yield deterministic governed dependency manifests.
- **ADR dependency:** ADR — import sandbox/canonicalization pipeline
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-M06 — External asset provenance/licensing becomes untraceable

- **Parent:** PRD06-RISK-M
- **Failure statement:** Imported third-party assets lose source/license/provenance metadata before inclusion in Forge source or runtime products.
- **Consequence:** Project cannot prove permitted use, replace tainted assets or audit AI/human source lineage.
- **Trigger / exposure:** Manual copying, bulk import, generated derivative or asset-pack extraction without provenance capture.
- **Upstream lineage:** PRD06-SEED-R6-J08; ART-09 provenance requirements; ART-10 certification evidence
- **Existing controls:** Production records carry provenance and source/bake manifests; ambiguous imports remain quarantined.
- **Severity / plausibility / priority:** **HIGH / LIKELY / P1**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-50/51/62; FIXTURE-07
- **Success / exit evidence:** Representative third-party/imported assets remain traceable from runtime product back to governed source and provenance decision; unknown provenance blocks certification.
- **ADR dependency:** ADR — provenance metadata schema/tooling
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-M07 — Pack dependency cycle or ambiguous resolution changes world meaning

- **Parent:** PRD06-RISK-M
- **Failure statement:** Dependencies, overrides or namespace ownership form cycles/ambiguous precedence and different environments resolve different definitions.
- **Consequence:** World semantics vary by load order or machine.
- **Trigger / exposure:** Multiple packs claim same IDs, cyclic dependencies, optional dependency ambiguity or implicit filesystem ordering.
- **Upstream lineage:** PRD04-BND-346–353/551; REQ-ARCH-008
- **Existing controls:** Namespaces, dependency/version constraints and explicit resolution are governed; silent load-order semantics are forbidden.
- **Severity / plausibility / priority:** **CRITICAL / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-54/58/62; FIXTURE-07
- **Success / exit evidence:** Permutation testing of installation/order yields one deterministic resolution or explicit rejection; namespace conflicts cannot silently shadow canonical definitions.
- **ADR dependency:** ADR — dependency resolver/override policy
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-M08 — Pack hot reload mutates persistent semantics without migration

- **Parent:** PRD06-RISK-M
- **Failure statement:** A running or saved world changes meaning because a pack definition is replaced in place while stable IDs remain the same.
- **Consequence:** Existing entities/items/recipes/world state reinterpret silently.
- **Trigger / exposure:** Developer hot reload or player pack update alters consequential fields without world/session migration boundary.
- **Upstream lineage:** PRD06-SEED-R6-J10; family C/D; PRD04-BND-346/560
- **Existing controls:** WorldSession locks compatibility identity; semantic changes require explicit version/migration or new-session admission.
- **Severity / plausibility / priority:** **CRITICAL / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-49/58/62; FIXTURE-07 + FIXTURE-04
- **Success / exit evidence:** Attempt consequential hot reload/update and prove live world either rejects it, stages a governed migration, or applies only explicitly presentation-safe changes.
- **ADR dependency:** ADR — hot-reload capability classes and pack-update boundary
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-M09 — Godot resource/path/provider identity leaks into pack semantics

- **Parent:** PRD06-RISK-M
- **Failure statement:** Pack definitions use Godot paths, ResourceUIDs, Zylann model IDs or bake output paths as durable semantic identity.
- **Consequence:** Moving/rebaking/repacking content breaks saves/networking and provider swaps.
- **Trigger / exposure:** Authoring convenience identifiers are serialized into authoritative references.
- **Upstream lineage:** PRD06-SEED-R6-J01; parent family C; ART-00 source/product law
- **Existing controls:** Canonical Leyforge stable IDs remain above provider/resource identities; manifests bind them explicitly.
- **Severity / plausibility / priority:** **CRITICAL / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-49/52/54; FIXTURE-07 + FIXTURE-01
- **Success / exit evidence:** Move/reimport/rebake/reassign provider-local IDs while preserving semantic source; saves/protocol/content references remain stable.
- **ADR dependency:** ADR — pack registry binding representation
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-M10 — Pack validation differs between editor, Forge CI, client and server

- **Parent:** PRD06-RISK-M
- **Failure statement:** The same pack passes one environment and fails or behaves differently in another.
- **Consequence:** Unsafe/incompatible content reaches production or dedicated servers reject approved content.
- **Trigger / exposure:** Validation relies on editor-only APIs, local caches or role-specific code paths.
- **Upstream lineage:** PRD06-SEED-R6-J05/J07; ART-09/10 certification flow; family L/P
- **Existing controls:** One governed validation contract must run in automated/headless/exported lanes where applicable.
- **Severity / plausibility / priority:** **CRITICAL / POSSIBLE / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-54/55/56/62/70; FIXTURE-07 + FIXTURE-09
- **Success / exit evidence:** Identical malicious/valid fixture corpus receives semantically identical validation outcomes across supported Forge, client and server lanes.
- **ADR dependency:** ADR — validator packaging/execution architecture
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-M11 — Missing pack recovery silently invents substitutes

- **Parent:** PRD06-RISK-M
- **Failure statement:** World load maps missing definitions to superficially similar current content instead of governed compatibility/quarantine objects.
- **Consequence:** Persisted world meaning changes and corruption is hidden.
- **Trigger / exposure:** Removed pack, namespace rename, dependency loss or partial install.
- **Upstream lineage:** PRD04-PROOF-57; family C/D/R
- **Existing controls:** Stable IDs, explicit migration aliases and quarantine/compatibility handling; no load-order guessing.
- **Severity / plausibility / priority:** **CRITICAL / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-57/58; FIXTURE-04 + FIXTURE-07
- **Success / exit evidence:** Missing-pack fixtures preserve unknown identity/provenance and either load via explicit compatibility policy or block/quarantine without substitution.
- **ADR dependency:** ADR — missing-content compatibility object/quarantine UX
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-M12 — Trust tier escalation bypasses user/server policy

- **Parent:** PRD06-RISK-M
- **Failure statement:** A pack declared data-only obtains capabilities reserved for signed/trusted/admin/executable tiers through dependencies or indirect references.
- **Consequence:** Server policy and user consent are bypassed.
- **Trigger / exposure:** Trusted pack depends on unsafe child; data references resource that instantiates script/native class; signing scope unclear.
- **Upstream lineage:** PRD04-BND-354/355; ENG-GOV security law
- **Existing controls:** Capabilities are evaluated transitively; trust is not inherited merely from parent inclusion.
- **Severity / plausibility / priority:** **CRITICAL / POSSIBLE / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-55; FIXTURE-07
- **Success / exit evidence:** Construct transitive/nested privilege-escalation packs and prove effective capability is bounded by policy and explicit trust approval.
- **ADR dependency:** ADR — trust/capability graph
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-M13 — Pack signature/hash covers wrong layer

- **Parent:** PRD06-RISK-M
- **Failure statement:** Integrity identity hashes only archive bytes or only semantic source while executable/runtime products can diverge unnoticed.
- **Consequence:** Server/client may agree on 'same pack' while running different generated products, or harmless repackaging invalidates semantic compatibility unnecessarily.
- **Trigger / exposure:** Signing/versioning design conflates semantic identity, source revision and role-specific product hashes.
- **Upstream lineage:** PRD04-BND-346–353; Round-7 build-identity principles
- **Existing controls:** Logical semantic identity and exact artifact integrity are separate but linked manifest layers.
- **Severity / plausibility / priority:** **HIGH / POSSIBLE / P1**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-54/62/70; FIXTURE-07 + FIXTURE-09
- **Success / exit evidence:** Tamper tests distinguish semantic-compatible repackaging from changed generated/runtime bytes and detect unauthorized artifact divergence.
- **ADR dependency:** ADR — pack signing/hash layers
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-M14 — Forge/content pack permits unbounded shader/material complexity

- **Parent:** PRD06-RISK-M
- **Failure statement:** Allowed authored data generates pathological shader variants/material instances or GPU state churn even without code.
- **Consequence:** Client GPU/VRAM exhaustion, compilation stutter or renderer-specific failure.
- **Trigger / exposure:** Per-asset shaders/materials, excessive state permutations, imported shader graphs or generated-form combinations.
- **Upstream lineage:** PRD06-SEED-R6-J04/J06; ART-02 material governance; ART-09 generation contract
- **Existing controls:** Material families, reusable profiles and bounded generated variants are production controls.
- **Severity / plausibility / priority:** **HIGH / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-52/56/53; FIXTURE-07 + FIXTURE-08
- **Success / exit evidence:** Stress content at allowed maxima and prove bounded shader/material counts, compilation/loading cost and renderer fallback behavior.
- **ADR dependency:** ADR — shader/material budget and generation constraints
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-M15 — World lockfile/manifest cannot distinguish optional presentation pack from authoritative content

- **Parent:** PRD06-RISK-M
- **Failure statement:** Compatibility checks require unnecessary visual-only packs or omit semantically required packs because pack role is not explicit.
- **Consequence:** Players cannot join compatible servers, or worlds load without required authoritative definitions.
- **Trigger / exposure:** All packs treated as equivalent dependencies.
- **Upstream lineage:** PRD04-BND-346–353; PKG-H/I pack baseline rules
- **Existing controls:** Pack dependencies carry semantic role/trust/requiredness; world/session compatibility uses the authoritative subset plus declared presentation requirements.
- **Severity / plausibility / priority:** **HIGH / LIKELY / P1**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-36/54/57; FIXTURE-05 + FIXTURE-07
- **Success / exit evidence:** Compatibility fixtures correctly admit/reject combinations of authoritative, optional presentation and client-only packs without changing world truth.
- **ADR dependency:** ADR — pack role/requiredness taxonomy
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

## 67.2 PRD06-RISK-N — Forge / Art Production Handoff execution risks

### PRD06-RISK-N01 — Editable Forge source and baked outputs become competing authorities

- **Parent:** PRD06-RISK-N
- **Failure statement:** Runtime/baked products are manually edited or treated as equal production truth beside governed editable Forge source.
- **Consequence:** Rebuilds overwrite fixes, source cannot reproduce shipped assets, and visual/semantic drift becomes irreconcilable.
- **Trigger / exposure:** Artist/agent patches imported mesh/material/runtime scene directly after bake.
- **Upstream lineage:** PRD06-SEED-R6-J02; ART-00 ART-C15; ART-09 execution contract
- **Existing controls:** Editable Forge source + canonical bindings are production authority; baked products are replaceable generated outputs.
- **Severity / plausibility / priority:** **CRITICAL / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-49/62; FIXTURE-07
- **Success / exit evidence:** Delete all generated outputs and reproduce equivalent product manifests from approved source/config/tool versions; direct product edits are detected/rejected.
- **ADR dependency:** ADR — Forge source serialization and bake-manifest implementation
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-N02 — Source-to-bake result is non-reproducible

- **Parent:** PRD06-RISK-N
- **Failure statement:** Equivalent approved source/config/tool versions produce materially different product manifests or assets.
- **Consequence:** CI cannot verify content, cache invalidation is unreliable and shipped artifacts cannot be recreated.
- **Trigger / exposure:** Nondeterministic importer, unordered processing, hidden local settings, timestamps/randomness or editor cache influence.
- **Upstream lineage:** PRD06-SEED-R6-J02; ART-04/09 reproducibility laws
- **Existing controls:** Bake inputs and tool versions are explicit; deterministic cosmetic variation uses governed seeds where required.
- **Severity / plausibility / priority:** **CRITICAL / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-49/62; FIXTURE-07 + FIXTURE-09
- **Success / exit evidence:** Repeat clean bakes across machines/CI from identical source identity and compare governed manifests/products within defined deterministic equivalence.
- **ADR dependency:** ADR — bake determinism/caching contract
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-N03 — AI-produced source bypasses human validation/provenance requirements

- **Parent:** PRD06-RISK-N
- **Failure statement:** Codex/AI output is admitted through a privileged path with weaker schema, provenance, art or runtime-context checks.
- **Consequence:** Automated production scales defects/inconsistency faster than manual review can detect.
- **Trigger / exposure:** AI generator writes directly to runtime assets or skips Forge source/manifest/QA stages.
- **Upstream lineage:** PRD06-SEED-R6-J03; ART-09 common production flow
- **Existing controls:** AI and human sources converge on same governed source, validation and certification pipeline.
- **Severity / plausibility / priority:** **HIGH / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-51/62; FIXTURE-07
- **Success / exit evidence:** Equivalent AI/human tasks must produce sources evaluated by identical validators and certification gates; no AI-only bypass exists.
- **ADR dependency:** ADR — AI authoring integration surface
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-N04 — Human production relies on undocumented manual exceptions unavailable to Codex

- **Parent:** PRD06-RISK-N
- **Failure statement:** Human-created golden assets pass because of tacit editor fixes or knowledge not represented in Forge rules.
- **Consequence:** AI parity falsely appears impossible and mass production remains dependent on artisanal intervention.
- **Trigger / exposure:** Manual pivot/material/import/state tweaks after documented pipeline.
- **Upstream lineage:** ART-09 Codex/Forge execution contract; PROOF-51 lineage
- **Existing controls:** Reusable procedures/exceptions must be encoded in source/tooling/governance or explicitly waived.
- **Severity / plausibility / priority:** **HIGH / LIKELY / P1**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-50/51/62; FIXTURE-07
- **Success / exit evidence:** Representative human golden assets can be rebuilt from documented governed inputs without hidden manual steps; exceptions are explicit records.
- **ADR dependency:** ADR — Forge procedure/exception automation where necessary
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-N05 — Generated material×form families explode asset counts

- **Parent:** PRD06-RISK-N
- **Failure statement:** Canonical material/form combinatorics generate excessive registry entries, models, textures, icons, materials, scenes or bake time.
- **Consequence:** Forge/CI/runtime memory and authoring throughput become unscalable.
- **Trigger / exposure:** Eager generation of every theoretical material×form/state combination.
- **Upstream lineage:** PRD06-SEED-R6-J04; FCC-13 generated-form architecture; ART-02/04
- **Existing controls:** Generated forms derive from stable material/form identity; generation may be bounded/lazy/profiled rather than blindly exhaustive.
- **Severity / plausibility / priority:** **CRITICAL / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-52/56/62; FIXTURE-07
- **Success / exit evidence:** Representative high-cardinality families stay within explicit source/bake/runtime budgets while preserving canonical generated-form identity.
- **ADR dependency:** ADR — eager/lazy generation strategy and form-budget policy
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-N06 — Generated variants duplicate semantic identities

- **Parent:** PRD06-RISK-N
- **Failure statement:** Different bake/presentation variants are registered as new physical items/blocks rather than projections of the same canonical form.
- **Consequence:** Inventory/crafting/save/network identity explodes and violates FCC-13.
- **Trigger / exposure:** Each texture/style/LOD/state/culture visual variant gets its own semantic ID.
- **Upstream lineage:** FCC-13 projection/generated-form law; PRD06-SEED-R6-J04; family C
- **Existing controls:** Presentation variants remain projections unless canon defines a distinct semantic object/state.
- **Severity / plausibility / priority:** **CRITICAL / POSSIBLE / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-52/49; FIXTURE-07 + FIXTURE-01
- **Success / exit evidence:** Variant-generation fixtures prove multiple renderer/LOD/cosmetic products map reversibly to the correct canonical material/form identity without multiplying physical identity.
- **ADR dependency:** ADR — variant/product manifest schema
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-N07 — Theoretical ART-00→10 lock is mistaken for production qualification

- **Parent:** PRD06-RISK-N
- **Failure statement:** Owner-locked art standards are treated as evidence that Forge/Codex can already produce certified final assets at scale.
- **Consequence:** Rebuild starts with unproven asset tooling, golden references and validators.
- **Trigger / exposure:** Status reporting conflates document lock with implemented golden bootstrap/CI/runtime evidence.
- **Upstream lineage:** PRD06-SEED-R6-J09; ART-10 locked certification baseline
- **Existing controls:** ART lock is authority/P1 design evidence; PROOF-50/62 and later production evidence remain mandatory.
- **Severity / plausibility / priority:** **HIGH / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-50/62; FIXTURE-07 + FIXTURE-09
- **Success / exit evidence:** Status gates must distinguish theoretical corpus lock from implemented fixtures; representative golden assets/scenes must actually pass the production chain.
- **ADR dependency:** No implementation ADR; governance/status gate
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-N08 — Golden reference set is too narrow to represent production diversity

- **Parent:** PRD06-RISK-N
- **Failure statement:** A small polished sample passes while difficult materials, forms, rigs, VFX, audio, UI or realms fail later.
- **Consequence:** False confidence in handoff completeness and late rework.
- **Trigger / exposure:** Golden bootstrap selects only easy/common assets.
- **Upstream lineage:** ART-10 certification programme; PRD04-PROOF-50
- **Existing controls:** Reference families must be representative across production classes and known hard cases.
- **Severity / plausibility / priority:** **HIGH / LIKELY / P1**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-50/52/53; FIXTURE-07 + FIXTURE-08
- **Success / exit evidence:** Golden set covers representative blocks/items/machines/characters/creatures/VFX/audio/UI/cartography plus generated-form and accessibility/performance stress cases.
- **ADR dependency:** ADR — golden-reference sampling matrix only after coverage analysis
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-N09 — Registry binding drifts from approved visual/source asset

- **Parent:** PRD06-RISK-N
- **Failure statement:** Forge source or baked product is bound to the wrong canonical material/form/state/asset identity.
- **Consequence:** Correct-looking asset may represent wrong gameplay object; source rebuild can overwrite another asset.
- **Trigger / exposure:** Copy/paste, generated family expansion, namespace collision or stale manifest.
- **Upstream lineage:** ART-09 canonical registry binding; FCC-13 identity
- **Existing controls:** Every production source/product carries explicit canonical bindings validated against registries/manifests.
- **Severity / plausibility / priority:** **CRITICAL / POSSIBLE / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-49/50/52/62; FIXTURE-07
- **Success / exit evidence:** Bulk generated fixtures detect swapped/stale/missing bindings and demonstrate round-trip source→product→canonical identity traceability.
- **ADR dependency:** ADR — Forge registry-binding manifest
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-N10 — Runtime context exposes defects absent from isolated Forge preview

- **Parent:** PRD06-RISK-N
- **Failure statement:** Asset passes authoring preview but fails when streamed, lit, animated, held, placed, networked, LODed or used with actual gameplay states.
- **Consequence:** Certification approves unusable content.
- **Trigger / exposure:** QA relies on thumbnails/test room only.
- **Upstream lineage:** ART-10 in-context certification rules; historical POC visual-lab lesson
- **Existing controls:** Golden certification includes representative runtime contexts and states, not source preview alone.
- **Severity / plausibility / priority:** **HIGH / LIKELY / P1**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-50/53/71; FIXTURE-07 + FIXTURE-08 + FIXTURE-09
- **Success / exit evidence:** Representative assets pass isolated and real runtime scenarios across state changes, renderer/profile and projection forms.
- **ADR dependency:** ADR — automated runtime-context certification harness
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-N11 — Material/state layering invents gameplay state

- **Parent:** PRD06-RISK-N
- **Failure statement:** Art source or shader decides wet/damaged/corrupt/blessed/active state instead of consuming authoritative state.
- **Consequence:** Presentation can create false gameplay information or alter persistence semantics.
- **Trigger / exposure:** Shader parameter logic derives state from local visual heuristics and writes back to game.
- **Upstream lineage:** ART-02/06 read-only state binding; ART-00 authority law
- **Existing controls:** Presentation consumes canonical/state projection data; visual effects remain downstream.
- **Severity / plausibility / priority:** **CRITICAL / POSSIBLE / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-50/53/59; FIXTURE-07 + FIXTURE-08
- **Success / exit evidence:** Toggle authoritative states independently of presentation and prove visual products follow them without creating/altering canonical state.
- **ADR dependency:** ADR — runtime presentation-binding interface
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-N12 — Audio/VFX production carries irreplaceable semantic cue without fallback

- **Parent:** PRD06-RISK-N
- **Failure statement:** Production asset communicates critical state only through one sensory channel or high-end effect.
- **Consequence:** Accessibility/reduced-effects modes lose gameplay meaning.
- **Trigger / exposure:** Art approval optimizes aesthetics without semantic redundancy.
- **Upstream lineage:** ART-06/07/08 accessibility rules; family O
- **Existing controls:** Critical information has non-exclusive redundant presentation owned by gameplay/UI semantics.
- **Severity / plausibility / priority:** **HIGH / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-50/61; FIXTURE-07 + FIXTURE-08
- **Success / exit evidence:** Representative critical cues remain understandable with audio muted, reduced VFX/motion, high contrast and other supported accessibility profiles.
- **ADR dependency:** ADR — semantic cue/fallback binding conventions
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-N13 — Forge CI validates source syntax but not production budgets

- **Parent:** PRD06-RISK-N
- **Failure statement:** Assets are structurally valid yet exceed texture, material, draw, bone, animation, audio, icon or memory budgets.
- **Consequence:** Mass production passes CI then fails performance qualification.
- **Trigger / exposure:** Validator checks schema only.
- **Upstream lineage:** ART-10 scalability certification; PRD04-PROOF-62/71; family P
- **Existing controls:** Production validators include class-specific budget metadata and representative runtime checks.
- **Severity / plausibility / priority:** **HIGH / LIKELY / P1**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-52/62/71; FIXTURE-07 + FIXTURE-09
- **Success / exit evidence:** Oversized/pathological but otherwise valid assets fail CI with actionable budget diagnostics before package qualification.
- **ADR dependency:** ADR — asset-class production budgets after benchmark evidence
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-N14 — Bake/cache invalidation misses upstream art/canon/tool change

- **Parent:** PRD06-RISK-N
- **Failure statement:** Generated products are reused after a source, canonical binding, material family, tool or bake-rule change that should invalidate them.
- **Consequence:** Stale products ship despite apparently successful builds.
- **Trigger / exposure:** Cache key omits transitive authority/tool dependencies.
- **Upstream lineage:** ART-09 source/bake manifest; Round-7 build identity
- **Existing controls:** Bake identity includes governed source/config/tool/dependency inputs required to reproduce product.
- **Severity / plausibility / priority:** **CRITICAL / POSSIBLE / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-49/62/72; FIXTURE-07 + FIXTURE-09
- **Success / exit evidence:** Mutate each relevant upstream dependency and prove only affected products invalidate/rebuild; unchanged inputs remain reproducible.
- **ADR dependency:** ADR — bake cache key/dependency graph
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

## 67.3 PRD06-RISK-O — Renderer / settings / accessibility / presentation risks

### PRD06-RISK-O01 — Graphics preset changes canonical simulation/world truth

- **Parent:** PRD06-RISK-O
- **Failure statement:** Performance/quality settings alter spawn, resource, AI, collision, transaction or authoritative simulation results rather than presentation/fidelity policy explicitly owned elsewhere.
- **Consequence:** Players on different graphics settings inhabit semantically different worlds.
- **Trigger / exposure:** Optimization hides simulation changes under a graphics/profile label.
- **Upstream lineage:** PRD06-SEED-R6-K01; PRD04-BND-384–387; REQ settings separation
- **Existing controls:** Graphics, accessibility, input, simulation/world rules and server operations are separate scopes.
- **Severity / plausibility / priority:** **CRITICAL / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-59; FIXTURE-08 + FIXTURE-03
- **Success / exit evidence:** Run identical authoritative scenarios across graphics presets and compare canonical state; only permitted presentation metrics differ.
- **ADR dependency:** ADR — settings schema/scope implementation
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-O02 — Critical gameplay state depends on colour alone

- **Parent:** PRD06-RISK-O
- **Failure statement:** Hazard, permission, health, allegiance, map confidence, machine state or other critical information is encoded only by hue.
- **Consequence:** Colour-vision deficiency, monochrome modes or poor displays erase meaning.
- **Trigger / exposure:** UI/art implementation omits shape/text/pattern/redundancy.
- **Upstream lineage:** PRD06-SEED-R6-K02; ART-01/02/08 non-colour laws
- **Existing controls:** Critical meaning must have non-colour redundancy.
- **Severity / plausibility / priority:** **HIGH / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-53/61; FIXTURE-08
- **Success / exit evidence:** Accessibility torture removes/changes colour discrimination and representative tasks remain correctly understandable.
- **ADR dependency:** ADR — semantic icon/state-token conventions
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-O03 — Critical state depends on VFX/motion/flash only

- **Parent:** PRD06-RISK-O
- **Failure statement:** Gameplay meaning disappears when reduced-motion, reduced-flash or reduced-particle settings are enabled.
- **Consequence:** Accessibility settings become gameplay disadvantages.
- **Trigger / exposure:** Magic/hazard/machine/map state communicated only by animated particles or flashing.
- **Upstream lineage:** PRD06-SEED-R6-K02; ART-06/08; MAP-00 accessibility
- **Existing controls:** Critical cues require static/text/icon/shape alternatives.
- **Severity / plausibility / priority:** **HIGH / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-53/61; FIXTURE-08
- **Success / exit evidence:** Reduced-motion/flash/particle modes retain equivalent semantic information in representative gameplay and magical cartography.
- **ADR dependency:** ADR — reduced-effect fallback binding
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-O04 — Critical state depends on audio only

- **Parent:** PRD06-RISK-O
- **Failure statement:** Warning, direction, confirmation or status exists only sonically.
- **Consequence:** Deaf/hard-of-hearing players or muted devices lose required information.
- **Trigger / exposure:** Audio event is the sole state cue.
- **Upstream lineage:** PRD06-SEED-R6-K02; ART-07 accessibility baseline
- **Existing controls:** Captions/visual or haptic equivalents for information-bearing audio.
- **Severity / plausibility / priority:** **HIGH / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-61; FIXTURE-08
- **Success / exit evidence:** Mute audio and complete representative warning/navigation/interaction tasks with equivalent information available.
- **ADR dependency:** ADR — information-bearing audio fallback semantics
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-O05 — Renderer fallback launches but changes semantic readability

- **Parent:** PRD06-RISK-O
- **Failure statement:** Compatibility/Mobile/driver fallback technically runs while materials, transparency, effects, map relief or lighting no longer communicate approved meaning.
- **Consequence:** Unsupported renderer is accidentally marketed/supported; players misread state.
- **Trigger / exposure:** Automatic fallback from Forward+/Mobile to Compatibility or feature absence.
- **Upstream lineage:** PRD06-SEED-R6-K03; current Godot renderer feature differences; ART-10
- **Existing controls:** Renderer support is earned by certification, not launch success; presentation has scalable fallbacks.
- **Severity / plausibility / priority:** **HIGH / LIKELY / P1**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-53/71; FIXTURE-08 + FIXTURE-09
- **Success / exit evidence:** Each claimed renderer/profile passes representative golden gameplay/readability tests; unsupported lanes fail product support gating explicitly.
- **ADR dependency:** ADR — supported renderer matrix after evidence
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-O06 — Renderer-specific feature becomes mandatory semantic channel

- **Parent:** PRD06-RISK-O
- **Failure statement:** A gameplay cue requires Forward+-only features such as specific GI/decal/buffer/compute capability.
- **Consequence:** Mobile/Compatibility cannot represent the same meaning even with lower visual fidelity.
- **Trigger / exposure:** Art/VFX design assumes advanced feature without fallback.
- **Upstream lineage:** Current Godot renderer feature matrix; ART-06/10
- **Existing controls:** Semantic cue is renderer-independent; advanced effects are presentation enhancement.
- **Severity / plausibility / priority:** **HIGH / POSSIBLE / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-53/61/71; FIXTURE-08
- **Success / exit evidence:** Disable advanced renderer-only features and prove fallback profile still communicates all critical states.
- **ADR dependency:** ADR — renderer feature/fallback mapping
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-O07 — Invalid graphics configuration strands application before recovery UI

- **Parent:** PRD06-RISK-O
- **Failure statement:** Bad renderer/resolution/fullscreen/upscaling/display setting prevents usable startup and the player cannot reach settings.
- **Consequence:** User becomes locked out without deleting configuration manually.
- **Trigger / exposure:** Driver update, display removal, unsupported renderer, corrupt profile or aggressive saved setting.
- **Upstream lineage:** PRD06-SEED-R6-K04; PRD04-PROOF-60
- **Existing controls:** Safe graphics recovery/reset path is a first-class production requirement.
- **Severity / plausibility / priority:** **HIGH / LIKELY / P1**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-60; FIXTURE-08 + FIXTURE-09
- **Success / exit evidence:** Inject invalid graphics profiles on supported platforms; application recovers to a usable bounded fallback without altering gameplay/world settings.
- **ADR dependency:** ADR — safe-mode detection/recovery persistence
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-O08 — Automatic hardware detection becomes immutable or unsafe policy

- **Parent:** PRD06-RISK-O
- **Failure statement:** First-run auto-detected graphics profile is treated as permanent truth or chooses a configuration that cannot recover safely.
- **Consequence:** Poor user experience, unnecessary low quality or startup failure after hardware/driver change.
- **Trigger / exposure:** Heuristic hardware classification is written as authoritative setting.
- **Upstream lineage:** PRD06-SEED-R6-K10; PRD04-PROOF-60/71
- **Existing controls:** Autodetection is an initial candidate only; user can override and safe recovery remains available.
- **Severity / plausibility / priority:** **HIGH / LIKELY / P1**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-60/71; FIXTURE-08 + FIXTURE-09
- **Success / exit evidence:** Change hardware/driver/profile fixtures and prove redetection/recovery/user override behaves predictably without changing world truth.
- **ADR dependency:** ADR — hardware profile heuristic after benchmark data
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-O09 — Input remap is lost, reinterpreted or conflicts across device families

- **Parent:** PRD06-RISK-O
- **Failure statement:** Custom bindings fail persistence/migration, one device overwrites another, or ambiguous conflicts trap the UI/gameplay.
- **Consequence:** Accessibility/control preferences break on restart/update or users lose essential actions.
- **Trigger / exposure:** Binding schema changes, controller reconnect, duplicate mappings, keyboard/controller coexistence.
- **Upstream lineage:** PRD06-SEED-R6-K05; historical POC input tests
- **Existing controls:** Input profile is separate from network command semantics and supports device-family coexistence/conflict reporting.
- **Severity / plausibility / priority:** **HIGH / LIKELY / P1**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-59/61; FIXTURE-08
- **Success / exit evidence:** Rebind/migrate/restart across keyboard/controller profiles; all required actions remain reachable and conflicts are visible/recoverable.
- **ADR dependency:** ADR — input-profile serialization/migration
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-O10 — UI scale/resolution/localisation creates clipping or focus traps

- **Parent:** PRD06-RISK-O
- **Failure statement:** Large text/UI scale, long translations, aspect ratios or controller navigation make controls unreachable or unreadable.
- **Consequence:** Accessibility settings prevent completing core flows.
- **Trigger / exposure:** 150%+ scale, small viewport, long strings, split-screen or modal nesting.
- **Upstream lineage:** PRD06-SEED-R6-K06; ART-08 UI rules; historical POC accessibility tests
- **Existing controls:** Responsive layouts, predictable focus/back and non-mouse navigation are required.
- **Severity / plausibility / priority:** **HIGH / LIKELY / P1**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-61/71; FIXTURE-08
- **Success / exit evidence:** Stress supported scale/aspect/localisation/controller combinations and complete all critical menus without clipping/focus dead ends.
- **ADR dependency:** ADR — UI layout/focus framework details
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-O11 — Split-screen applies one viewer's presentation settings to another

- **Parent:** PRD06-RISK-O
- **Failure statement:** Per-view accessibility/camera/UI needs are collapsed into one global runtime presentation state.
- **Consequence:** One local player's preferences or limitations impair another player's view.
- **Trigger / exposure:** Shared viewport/profile architecture assumes one camera/user.
- **Upstream lineage:** PRD06-SEED-R6-K07; PRD04 settings scopes
- **Existing controls:** Separate global/device/session/per-view scopes where semantics require; canonical simulation remains shared.
- **Severity / plausibility / priority:** **HIGH / POSSIBLE / P1**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-59/71; FIXTURE-08 + FIXTURE-05
- **Success / exit evidence:** Two local viewers use different legitimate UI/accessibility/camera presentation settings simultaneously without changing shared authoritative state.
- **ADR dependency:** ADR — settings scope/per-view override hierarchy
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-O12 — Split-screen multiplies presentation cost beyond certified budget

- **Parent:** PRD06-RISK-O
- **Failure statement:** Additional cameras/UI/map views multiply culling, effects, voxel viewers or post-processing beyond hardware capacity.
- **Consequence:** Local multiplayer becomes unstable or forces hidden simulation changes.
- **Trigger / exposure:** 2–4 local viewports with independent interest/presentation.
- **Upstream lineage:** PRD06-SEED-R6-K07; family G/K/P
- **Existing controls:** Presentation may degrade per-view under explicit profiles; interest/simulation remain separately governed.
- **Severity / plausibility / priority:** **HIGH / LIKELY / P1**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-71/37/59; FIXTURE-08 + FIXTURE-05 + FIXTURE-09
- **Success / exit evidence:** Supported local-player counts meet frame/memory budgets with documented presentation degradation and unchanged canonical rules.
- **ADR dependency:** ADR — split-screen presentation budgets
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-O13 — Magical relief map renders omniscient world/provider truth

- **Parent:** PRD06-RISK-O
- **Failure statement:** 3D cartography queries live terrain/entities/resources directly rather than rendering the physical map's authorised knowledge.
- **Consequence:** Map becomes an x-ray/debug cheat and violates MAP-00 knowledge/provenance rules.
- **Trigger / exposure:** Relief renderer samples VoxelTerrain/world objects because they are technically available.
- **Upstream lineage:** PRD06-SEED-R6-K08; MAP-00 locked gameplay authority; ART-08 presentation authority
- **Existing controls:** MAP-00 owns legitimate map knowledge; ART-08 presents only authorised map data; live engine truth is not the source.
- **Severity / plausibility / priority:** **CRITICAL / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-53/61/71; FIXTURE-08 + FIXTURE-01
- **Success / exit evidence:** Unknown terrain/routes/resources/entities remain absent across 2D/3D map modes; stale/false maps may disagree with real world exactly as MAP-00 permits.
- **ADR dependency:** ADR — cartographic read-model/cache architecture
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-O14 — Magical relief map lacks accessible flat semantic equivalent

- **Parent:** PRD06-RISK-O
- **Failure statement:** Essential route/elevation/marker/layer information can only be understood by manipulating a 3D miniature.
- **Consequence:** Players unable to use volumetric interaction lose gameplay capability.
- **Trigger / exposure:** Relief map implements features not exposed to 2D/list/focus alternatives.
- **Upstream lineage:** PRD06-SEED-R6-K08; MAP-00 §§60–62; ART-08/10
- **Existing controls:** Every essential 3D cartography function has an accessible flat/non-drag equivalent.
- **Severity / plausibility / priority:** **HIGH / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-61/53; FIXTURE-08
- **Success / exit evidence:** Complete representative mapping/navigation tasks using only flat/focus/list alternatives with equivalent authorised information.
- **ADR dependency:** ADR — cartography accessibility interaction model
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-O15 — Magical relief map duplicates full-resolution live world data

- **Parent:** PRD06-RISK-O
- **Failure statement:** Cartography maintains a second high-detail world/terrain representation instead of bounded knowledge-derived caches.
- **Consequence:** Memory/GPU/CPU explode, especially with multiple maps/split-screen/servers.
- **Trigger / exposure:** Relief renderer reuses full world meshes or streams large unknown areas.
- **Upstream lineage:** MAP-00 §§58–59; PRD06-SEED-R6-K08
- **Existing controls:** Map representations are bounded/cached/LOD-derived from authorised knowledge.
- **Severity / plausibility / priority:** **HIGH / LIKELY / P1**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-53/71; FIXTURE-08 + FIXTURE-09
- **Success / exit evidence:** Large-map fixtures stay within explicit memory/update/render budgets across low-end profiles without increasing knowledge scope.
- **ADR dependency:** ADR — relief map cache/LOD representation
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-O16 — Modded/third-party presentation bypasses accessibility/profile certification

- **Parent:** PRD06-RISK-O
- **Failure statement:** Allowed custom content introduces unreadable colours, flashing effects, oversized UI, unbounded particles or renderer-incompatible assets.
- **Consequence:** Safe content becomes inaccessible/unsafe or destabilizes supported profiles.
- **Trigger / exposure:** Pack validation certifies schema/trust but ignores presentation requirements.
- **Upstream lineage:** PRD06-SEED-R6-K09; family M/N
- **Existing controls:** Player-safe content must satisfy bounded presentation/accessibility/resource contracts for applicable classes.
- **Severity / plausibility / priority:** **HIGH / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-53/56/61; FIXTURE-07 + FIXTURE-08
- **Success / exit evidence:** Adversarial presentation packs violating flash/motion/readability/budget rules are rejected or automatically constrained without changing semantics.
- **ADR dependency:** ADR — mod presentation validation/profile constraints
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-O17 — Settings migration mixes global profile with per-world authoritative rules

- **Parent:** PRD06-RISK-O
- **Failure statement:** Upgrade/migration moves accessibility/graphics/input values into world state or world/gameplay rules into global profile.
- **Consequence:** Different worlds unexpectedly change simulation, or player accessibility settings fail to follow the player.
- **Trigger / exposure:** Schema migration combines settings stores for convenience.
- **Upstream lineage:** PRD04-BND-384–387; historical POC global-profile/per-world separation
- **Existing controls:** Settings scopes are explicit and independently versioned/migrated.
- **Severity / plausibility / priority:** **CRITICAL / POSSIBLE / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-59/60; FIXTURE-08 + FIXTURE-04
- **Success / exit evidence:** Migrate profiles and multiple worlds across schema versions; global presentation/input preferences and per-world rules remain correctly separated.
- **ADR dependency:** ADR — settings schema/storage boundaries
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

# 68. Round-6 Cross-Risk Dependency Spine

```text
M pack / trust
 ├──► C semantic IDs + hot-update migration
 ├──► D missing-pack / migration / recovery
 ├──► K client-server compatibility admission
 ├──► L server/client stripped artifacts
 ├──► N Forge source / bake validation
 └──► O modded presentation safety

N Art / Forge execution
 ├──► C canonical registry bindings
 ├──► M pack identity / trust
 ├──► O renderer/accessibility certification
 ├──► P build/dependency/CI reproducibility
 └──► ART-00→10 authority + future FORGE-ENG/LFE implementation

O presentation / accessibility
 ├──► MAP-00 legitimate map knowledge + interaction
 ├──► N governed presentation products
 ├──► G presentation performance budgets
 ├──► K split-screen / interest boundaries
 ├──► P renderer/hardware qualification
 └──► canonical gameplay truth remains upstream
```

# 69. Round-6 Proof Exit Matrix

| Proof | Principal Round-6 consumers | Minimum exit evidence |
|---|---|---|
| **PROOF-49 — Source → Bake Reproducibility** | M08/M09, N01/N02/N06/N09/N14 | Clean reproducible source→product pipeline preserves semantic bindings and rejects product-as-authority drift. |
| **PROOF-50 — Art Production Handoff Fixture** | M06, N04/N07–N12 | Representative golden assets traverse the complete governed handoff and real runtime contexts. |
| **PROOF-51 — AI vs Human Source Parity** | M06, N03/N04 | AI/human sources use the same acceptance/provenance/validation gates. |
| **PROOF-52 — Generated Form Explosion** | M09/M14, N05/N06/N08/N09/N13 | High-cardinality material×form families remain within governed source/bake/runtime budgets. |
| **PROOF-53 — Renderer/Profile Certification** | M14, N08/N10–N12, O02/O03/O05/O06/O13/O15/O16 | Claimed renderer/profile lanes preserve semantic readability for representative production content. |
| **PROOF-54 — Server/Client Pack Split** | M03/M04/M07/M10/M13/M15 | Role-specific artifacts preserve one semantic pack identity and required authoritative data. |
| **PROOF-55 — Safe Mod Smuggling** | M01/M05/M10/M12 | Data-safe tier cannot execute native/script/editor/file/network capability outside policy. |
| **PROOF-56 — Data Mod Resource Bomb** | M02/M14, N05/N13, O16 | Pathological declarative content is rejected/bounded before resource exhaustion. |
| **PROOF-57 — Missing Pack World Recovery** | M11/M15 | Missing definitions remain explicit/quarantined; no silent semantic substitution. |
| **PROOF-58 — Pack Upgrade / World Migration** | M04/M07/M08/M11, C/D dependencies | Pack upgrades preserve stable meaning and known-good recovery path. |
| **PROOF-59 — Settings Scope Isolation** | N11, O01/O09/O11/O17 | Graphics/accessibility/input scope changes cannot silently alter canonical gameplay/world rules. |
| **PROOF-60 — Safe Graphics Recovery** | O07/O08/O17 | Invalid saved graphics state cannot strand the application and recovery does not mutate world truth. |
| **PROOF-61 — Accessibility Semantic Torture** | N12, O02–O04/O06/O09/O10/O13/O14/O16 | Critical meaning survives supported non-colour, reduced-effect, mute, scale and input alternatives. |
| **PROOF-62 — Forge CI Build** | M03/M05–M10/M13, N01–N05/N07/N09/N13/N14 | Forge/CI enforces source, provenance, trust, bake, binding and production validation consistently. |
| **PROOF-71 — Renderer / Hardware Lane** | N10/N13, O05–O12/O15 | Claimed hardware/renderer/local-player lanes meet real artifact performance/readability criteria. |

No proof above is currently passed.

# 70. ART-00→10 Production Qualification Boundary

The current locked ART corpus is consumed as **authority**, not empirical implementation evidence.

PRD-06 therefore preserves four distinct states:

```text
ART THEORETICAL AUTHORITY LOCK
        ↓
FORGE/LFE IMPLEMENTATION
        ↓
GOLDEN BOOTSTRAP / VALIDATOR EVIDENCE
        ↓
REPRESENTATIVE MASS-PRODUCTION QUALIFICATION
```

Round 6 forbids collapsing these into one status.

In particular:

- ART-10's locked certification rules define **what must be proven**;
- they do not prove that the present Forge implementation can already do it;
- a single hand-authored golden asset does not prove AI/human parity or mass production;
- editor preview does not prove runtime/exported renderer/profile behavior;
- source syntax validation does not prove performance/accessibility certification.

# 71. MAP-00 / ART-08 / Engineering Risk Boundary

MAP-00 is now the single player-facing gameplay authority for cartography.

Round 6 therefore records the implementation chain as:

```text
WORLD / KNOWLEDGE / ROUTE / MAGIC AUTHORITIES
                ↓
       MAP-00 GAMEPLAY CONTRACT
                ↓
       ART-08 PRESENTATION LAW
                ↓
ENGINEERING READ MODEL / CACHE / RENDERER
```

Engineering risks remain open around:

- bounded map knowledge storage/read models;
- map instance persistence and copied provenance;
- 2D/3D cache/LOD;
- multiplayer copy/share authority projection;
- renderer/profile performance;
- accessibility equivalents;
- no unknown-world leakage.

The design question itself is **not** reopened.

# 72. PRD-07 Fixture Requirements Added by Round 6

## FIXTURE-07 — Forge Pack / Generated-Form / Safe-Mod / Art-Handoff Fixture

Must now include:

- logical pack semantic identity separate from exact role artifact hashes;
- namespace/dependency/trust graph;
- client/server artifact split;
- safe data-only allowlist and nested/transitive capability checks;
- archive traversal/absolute-path/remote-URI hostile imports;
- malformed and high-cost declarative data;
- generated material×form cardinality stress;
- source→bake clean-room reproduction;
- canonical registry binding round trip;
- AI and human equivalent source tasks;
- third-party provenance fixtures;
- golden references across representative asset classes;
- editor/CI/headless validation parity;
- bake cache invalidation;
- missing-pack and upgrade/migration cases.

## FIXTURE-08 — Renderer / Accessibility / Settings Profile Fixture

Must now include:

- Forward+, Mobile and Compatibility candidate lanes where platform/hardware permits;
- feature-degraded fallback cases;
- high contrast / colour-vision stress;
- reduced motion / reduced flashes / reduced particles;
- audio-muted / caption alternatives;
- UI/text scale and long-localisation strings;
- keyboard/controller remapping/conflict/recovery;
- invalid graphics profile recovery;
- per-view/split-screen settings;
- representative ART golden scenes/assets;
- modded presentation rejection/bounding;
- MAP-00 ordinary, surveyed and magical-relief modes;
- unknown-map-data leakage assertions;
- flat/non-drag alternatives for every essential relief-map function;
- map LOD/memory/update-budget measurement.

# 73. Round-6 ADR Reservation Gates

| Future ADR | Must not be accepted before |
|---|---|
| **Pack container/import/quarantine implementation** | M01/M05/M10/M12 + PROOF-55/62. |
| **Pack resource budgets/admission estimator** | M02/M14 + PROOF-56/52. |
| **Pack logical/artifact identity + dependency resolver** | M03/M04/M07/M13/M15 + PROOF-54/58/62. |
| **Safe-mod trust/capability graph** | M01/M12 + adversarial smuggling evidence. |
| **Forge source serialization + bake manifest/cache** | N01/N02/N14 + PROOF-49/62. |
| **AI authoring integration** | N03/N04 + PROOF-51. |
| **Generated-form eager/lazy strategy** | N05/N06/N13 + PROOF-52/56. |
| **Golden-reference certification matrix** | N07/N08/N10/N13 + PROOF-50/53/71. |
| **Runtime presentation-state binding** | N11/N12 + PROOF-53/59/61. |
| **Supported renderer matrix** | O05/O06 + PROOF-53/71. |
| **Safe graphics recovery/autodetection** | O07/O08 + PROOF-60/71. |
| **Settings/input scope and persistence schema** | O01/O09/O11/O17 + PROOF-59/61. |
| **Cartographic read-model/cache/LOD implementation** | O13/O14/O15 + MAP-00 fixture evidence and PROOF-53/61/71. |
| **Split-screen presentation budget** | O11/O12 + hardware-lane evidence. |

# 74. Round-6 Open Implementation Questions Preserved

1. Exact content-pack archive/container format.
2. Pack signature technology and semantic-vs-artifact hash layers.
3. Import sandbox/quarantine implementation.
4. Declarative resource-budget formulas and hard limits.
5. Executable future mod tier and sandbox/permission model.
6. Logical pack dependency/override resolver.
7. Forge editable-source serialization.
8. Exact source/bake manifest and cache-key format.
9. AI authoring interface into Forge.
10. Eager versus lazy generated-form products.
11. Final generated-form production budgets.
12. Golden-reference sampling matrix and comparison tolerances.
13. Renderer support matrix.
14. Hardware/profile tiers and performance budgets.
15. Automatic graphics-detection algorithm.
16. Safe-mode trigger/recovery persistence.
17. Accessibility narration/screen-reader technology if adopted.
18. Localisation target set and layout budgets.
19. Input profile serialization/migration.
20. Split-screen per-view settings and presentation budgets.
21. Magical relief map cache/mesh/LOD implementation.
22. Map knowledge read-model representation and update cadence.
23. Modded presentation constraints and fallback enforcement.
24. Final Forge CI implementation details.

# 75. Round-6 Integrity Checks

| Check | Result |
|---|---|
| Parent risk families M/N/O preserved | **PASS — 3/3** |
| Stable Round-6 child-risk IDs | **PASS — 46/46** |
| M child risks | **PASS — 15** |
| N child risks | **PASS — 14** |
| O child risks | **PASS — 17** |
| PRD05 Round-6 J02–J09 principal seeds consumed | **PASS — 8/8** |
| PRD05 Round-6 K01–K10 principal seeds consumed | **PASS — 10/10** |
| J01/J10 retained under RISK-C and cross-consumed | **PASS — 2/2** |
| ART-00→10 current theoretical owner lock consumed | **PASS** |
| ART theoretical lock kept separate from production qualification | **PASS** |
| MAP-00 gameplay-design dependency consumed without reopening design | **PASS** |
| ART-08 remains presentation authority | **PASS** |
| Safe data-only mod tier remains non-executable | **PASS** |
| Renderer launch/fallback remains distinct from certification | **PASS** |
| Graphics/accessibility/input settings remain separate from simulation truth | **PASS** |
| 3D cartography cannot render unknown live world truth | **PASS** |
| 3D cartography has required flat/accessibility equivalence | **PASS** |
| Exact pack/Forge/renderer/accessibility implementation choices remain unlocked | **PASS** |
| Current PRD-08 proof results created | **PASS — 0** |
| Implementation ADRs accepted | **PASS — 0** |
| PRD-04/05 reopen candidates | **PASS — 0** |

# 76. Round-6 Closure Verdict

> **ROUND 6 PASS — FORGE / TRUST / ART / PRESENTATION RISK DECOMPOSITION COMPLETE.**

The most consequential conclusions are:

1. **Data-only is a capability boundary, not a safety guarantee by itself.** Declarative content still requires resource, dependency, path, provenance and presentation limits.
2. **A logical content pack and its client/server generated artifacts need linked but distinct identity.**
3. **Editable Forge source remains production authority; baked products are reproducible projections.**
4. **ART-00→10 being locked closes art-production law, not implementation qualification.**
5. **AI and human content must converge on the same source/provenance/validation/certification pipeline.**
6. **Generated-form architecture must be budgeted; canonical identity must not multiply with every visual variant.**
7. **A renderer is supported only after semantic readability and performance qualification, not because Godot can launch it.**
8. **Accessibility modes cannot remove critical meaning.**
9. **MAP-00 resolves magical-relief cartography gameplay design; implementation must render authorised map knowledge rather than live hidden world truth.**
10. **Low-end, split-screen and modded presentation may reduce fidelity but may not mutate canonical simulation/world truth.**

No Round-6 finding requires PRD-04 or PRD-05 reopening.

# 77. Machine-Readable Round-6 Summary

```yaml
document: PRD-06
version: v0.6
round: 6
status: WORKING
round_status: PASS
parent_families_decomposed: [M, N, O]
child_risks:
  M: 15
  N: 14
  O: 17
  total: 46
severity_counts:
  critical: 21
  high: 25
plausibility_counts:
  likely: 35
  possible: 11
priority_counts:
  p0: 31
  p1: 15
round6_seed_intake:
  j02_j09_consumed: 8
  k01_k10_consumed: 10
  j01_j10_cross_consumed_under_risk_c: 2
art_00_10_status: OWNER_LOCKED_THEORETICAL_AUTHORITY
map_00_status: LOCKED_GAMEPLAY_AUTHORITY
proof_results_created: 0
implementation_adrs_created: 0
architecture_reopen_candidates: 0
technology_refresh_date: 2026-09-05
next_round: Build / Dependency / Observability
```

---

**End of PRD-06 v0.6 — Round 6 Working Baseline**

---

# 78. Round-7 Scope and Controlled Build / Observability Reconciliation

Round 7 decomposes **PRD06-RISK-P — Dependency/build reproducibility and observability**.

Round-7 source handling preserves the PRD-05 ownership split:

- `R7-P01` Build identity drift → **RISK-P**
- `R7-P02` Dependency upgrade regression → **RISK-P**
- `R7-P03` Local-patch orphaning → **RISK-P**
- `R7-P04` Symbol loss → **RISK-P**
- `R7-P05` Support-bundle leakage → **RISK-P**
- `R7-P06` Diagnostic misclassification → **RISK-P**
- `R7-P07` Observability self-load → **RISK-P**
- `R7-P08` False qualification → **RISK-P**
- `R7-P09` Artifact divergence → **RISK-L**, cross-consumed here where build evidence depends on it
- `R7-P10` Benchmark ambiguity → **RISK-P**

Current technology facts are inherited from the controlled **PRD-05 Round-7** refresh on 5 September 2026. PRD-06 does not silently replace those findings with new implementation choices.

The key evidence boundaries remain:

> **Engine/provider version is not complete Leyforge build identity.**

> **Editor/headless/debug success is not exported-artifact or production qualification.**

> **Provider log text is evidence, not Leyforge's machine diagnostic schema.**

> **Observability that destabilizes the workload is itself a production risk.**

No CI provider, test framework, telemetry backend, crash service, symbol store, dependency manager, hardware target or performance threshold is selected here.

# 79. Round-7 Stable Child-Risk Register

Round 7 creates **24 stable child risks** beneath `PRD06-RISK-P`.

Classification:

- **CRITICAL:** 15
- **HIGH:** 9
- **LIKELY:** 20
- **POSSIBLE:** 4
- **P0:** 21
- **P1:** 3

### PRD06-RISK-P01 — Composite build identity is incomplete or drifts

- **Parent:** PRD06-RISK-P
- **Failure statement:** A shipped/tested artifact cannot be uniquely tied to Leyforge source, Godot revision, Voxel Tools edition/revision, local patches, build profile, target, precision/provider lane and content/schema identity.
- **Consequence:** Crashes cannot be reproduced or symbolicated; benchmark comparisons become invalid; migration/support decisions act on the wrong build.
- **Trigger / exposure:** Manifest records only a marketing version or engine version, or one build stage silently changes an input without changing build identity.
- **Upstream lineage:** R7-P01; PRD05-XW-0386/0399/0400/0424/0447; PRD04-BND-450/486/491
- **Existing controls:** Leyforge-owned composite build manifest; exact dependency/source/product identities are production architecture requirements.
- **Severity / plausibility / priority:** **CRITICAL / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-70/73; FIXTURE-09
- **Success / exit evidence:** Every supported client/server/Forge artifact exposes enough machine-readable identity to reproduce its dependency/profile/source composition and distinguish any material input change.
- **ADR dependency:** ADR — exact build-manifest serialization and embedding location
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-P02 — Release/debug/profile/custom builds are treated as equivalent evidence

- **Parent:** PRD06-RISK-P
- **Failure statement:** Results from debug, editor, Tracy/profiler, double-precision, custom-module or development builds are compared directly with release-like artifacts without recording the differing build profile.
- **Consequence:** Performance, crash and correctness conclusions are attributed to a product that was not actually tested.
- **Trigger / exposure:** Profiling or convenient custom build is reused as if it were the shipping lane, or benchmark reports omit build profile.
- **Upstream lineage:** R7-P01/R7-P08/R7-P10; PRD05-XW-0384/0409/0430/0444
- **Existing controls:** Build profile is part of exact artifact identity; each evidence claim names the tested product/configuration.
- **Severity / plausibility / priority:** **HIGH / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-70/71/75; FIXTURE-09
- **Success / exit evidence:** Same workload across deliberately different build profiles remains separately identifiable; reports cannot merge or silently promote results between lanes.
- **ADR dependency:** ADR — supported build-profile taxonomy after evidence
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-P03 — Exported role artifact differs from the intended source/dependency manifest

- **Parent:** PRD06-RISK-P
- **Failure statement:** Client, dedicated server or Forge output is built from a different dependency/source/content state than the manifest or sibling products claim.
- **Consequence:** Role parity and protocol/content compatibility fail despite apparently matching version labels.
- **Trigger / exposure:** Stale export cache, different local dependency checkout, stripped resource behavior or separate CI job uses inconsistent inputs.
- **Upstream lineage:** R7-P08/R7-P09 cross-consumed from RISK-L; PRD05-XW-0377/0378/0424/0428
- **Existing controls:** Exact manifests accompany each role artifact; role-specific products derive from governed common semantic inputs.
- **Severity / plausibility / priority:** **CRITICAL / POSSIBLE / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-70 + PROOF-54; FIXTURE-09 + FIXTURE-07
- **Success / exit evidence:** Build client/server/Forge from a clean controlled source and prove exact intended common inputs plus explicit role differences; any divergent input changes artifact identity.
- **ADR dependency:** ADR — artifact assembly/promotion pipeline
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-P04 — Build or support process leaks confidential export credentials

- **Parent:** PRD06-RISK-P
- **Failure statement:** Passwords, signing keys, encryption credentials or other confidential build secrets are copied into ordinary manifests, logs, support bundles or artifacts.
- **Consequence:** Credential compromise and supply-chain/security incident.
- **Trigger / exposure:** Automation serializes export credentials together with ordinary export configuration or indiscriminately archives build directories.
- **Upstream lineage:** R7-P05; PRD05-XW-0379/0395/0423; PRD04-BND-453–455
- **Existing controls:** Confidential build credentials are separate from ordinary export configuration; support evidence is allowlisted/redacted.
- **Severity / plausibility / priority:** **CRITICAL / POSSIBLE / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-65/70; FIXTURE-09
- **Success / exit evidence:** Seed fake credentials throughout build/export context and prove artifacts/manifests/support bundles contain no secret values while retaining required non-secret build identity.
- **ADR dependency:** ADR — secret store/credential injection mechanism remains deployment-specific
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-P05 — Critical dependency is identified only by mutable version label

- **Parent:** PRD06-RISK-P
- **Failure statement:** Godot, Voxel Tools, native libraries or tooling are recorded by a tag/name that can resolve to different source/binaries over time.
- **Consequence:** A historical build cannot be reconstructed exactly and upgrade diffs are ambiguous.
- **Trigger / exposure:** Dependency record omits immutable source revision/artifact hash/acquisition source.
- **Upstream lineage:** R7-P01/R7-P02; PRD05-XW-0382/0385/0411/0426
- **Existing controls:** Dependency inventory records exact version/source revision/acquisition identity and local patches.
- **Severity / plausibility / priority:** **CRITICAL / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-72/73/70; FIXTURE-09
- **Success / exit evidence:** Rebuild a fixture from a fresh environment using only the governed dependency record and obtain the intended exact dependency artifacts/source state.
- **ADR dependency:** ADR — dependency lock/inventory format
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-P06 — Dependency upgrade passes API compile but regresses Leyforge behavior

- **Parent:** PRD06-RISK-P
- **Failure statement:** A new Godot/Voxel Tools/native dependency compiles and appears source-compatible while changing provider behavior, export, persistence, threading, precision, renderer or performance characteristics.
- **Consequence:** Subtle world corruption, unsupported builds or performance regressions enter production under the assumption that compile success means compatibility.
- **Trigger / exposure:** Routine version bump or security/bugfix upgrade skips provider conformance and hostile fixtures.
- **Upstream lineage:** R7-P02; PRD05-XW-0383/0385/0412/0435; PRD04-BND-491–503
- **Existing controls:** Dependency presence grants no architecture authority; every consequential upgrade is a controlled delta with targeted regression/conformance/export tests.
- **Severity / plausibility / priority:** **CRITICAL / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-72 + PROOF-67/70; FIXTURE-09 + relevant provider fixtures
- **Success / exit evidence:** Upgrade one dependency in isolation and show the required compatibility, provider, export, persistence and gameplay fixture set passes before support claims move.
- **ADR dependency:** ADR — dependency-upgrade admission thresholds/cadence
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-P07 — Transitive native/tool dependency drifts outside the recorded baseline

- **Parent:** PRD06-RISK-P
- **Failure statement:** A direct dependency appears unchanged while compiler, SDK, native library, import tool, template or transitive package changes material output/ABI/behavior.
- **Consequence:** Two nominally identical builds differ or fail only on another machine/platform.
- **Trigger / exposure:** CI image/toolchain refresh or indirect package update is not represented in build/dependency identity.
- **Upstream lineage:** R7-P01/R7-P02; PRD04 dependency/build boundaries; ENG-GOV dependency authority
- **Existing controls:** Build identity includes material toolchain/transitive dependencies required for reproduction; upgrades are reviewed as controlled changes.
- **Severity / plausibility / priority:** **HIGH / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-70/72; FIXTURE-09
- **Success / exit evidence:** Rebuild across controlled environment refreshes and prove any material toolchain/transitive change is visible in identity and triggers the required regression lane.
- **ADR dependency:** ADR — toolchain lock depth / reproducible environment strategy
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-P08 — Local Godot/Zylann patch becomes orphaned or unreproducible

- **Parent:** PRD06-RISK-P
- **Failure statement:** Production depends on a local fix whose exact diff/base revision/rationale/build steps are not retained.
- **Consequence:** Future rebuilds cannot reproduce behavior; dependency upgrade may silently drop the fix.
- **Trigger / exposure:** Manual source edit, untracked binary, locally rebuilt module or abandoned fork commit.
- **Upstream lineage:** R7-P03; PRD05-XW-0413/0427/0436/0443
- **Existing controls:** Patch identity is explicit in dependency/build manifests and engineering change records; provider remains beneath same Leyforge contract.
- **Severity / plausibility / priority:** **CRITICAL / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-73; FIXTURE-09
- **Success / exit evidence:** From a clean upstream checkout, apply the recorded patch/fork revision, rebuild the candidate artifact and verify the patch identity is machine-visible and behavior covered by regression fixtures.
- **ADR dependency:** ADR — permanent fork vs patchset strategy only after maintenance evidence
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-P09 — Local patch masks upstream incompatibility or becomes accidental architecture

- **Parent:** PRD06-RISK-P
- **Failure statement:** A patch changes provider semantics to fit Leyforge without documenting the contract it is satisfying, causing future code to depend directly on patched internals.
- **Consequence:** Upgrade becomes prohibitively difficult and provider-specific behavior leaks into gameplay architecture.
- **Trigger / exposure:** Emergency patch is consumed directly by gameplay systems instead of behind existing facade/contracts.
- **Upstream lineage:** R7-P03; PRD05-XW-0442/0443; PRD04-BND-492/503
- **Existing controls:** Patch changes dependency identity/evidence burden only; Leyforge authority hierarchy and facade boundaries remain unchanged.
- **Severity / plausibility / priority:** **HIGH / POSSIBLE / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-73 + PROOF-74; FIXTURE-09
- **Success / exit evidence:** Remove/rebase the patch in a controlled fixture and prove all call sites remain behind governed provider contracts; architecture lint identifies any provider-internal dependency leak.
- **ADR dependency:** ADR — provider extension/fork boundary if patch becomes long-lived
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-P10 — GDExtension/native ABI mismatch escapes build-time detection

- **Parent:** PRD06-RISK-P
- **Failure statement:** Native extension loads or builds under one Godot/platform/toolchain combination but is ABI-incompatible or behaviorally incompatible in another exported artifact.
- **Consequence:** Startup crash, memory corruption or platform-specific failures.
- **Trigger / exposure:** Godot/provider/toolchain upgrade, double-precision build, different export template or platform architecture.
- **Upstream lineage:** R7-P02/R7-P08; PRD05-XW-0382–0384; existing RISK-B04/B05
- **Existing controls:** Native/provider edition and precision/profile are exact build dimensions; real exported artifacts are mandatory test lanes.
- **Severity / plausibility / priority:** **CRITICAL / POSSIBLE / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-70/72/73; FIXTURE-09
- **Success / exit evidence:** Supported native-extension/provider combinations load and smoke-test in real exported client/server products; unsupported combinations are rejected by the build/support matrix.
- **ADR dependency:** ADR — supported native/provider compatibility matrix after evidence
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-P11 — Exact crash symbols are missing or mismatched

- **Parent:** PRD06-RISK-P
- **Failure statement:** Release crash dumps cannot be mapped to useful native/source stacks because symbol files do not match the exact binary or are unavailable.
- **Consequence:** Production failures become effectively undebuggable.
- **Trigger / exposure:** Symbols discarded after build, regenerated from a different source/toolchain, or build manifest cannot locate them.
- **Upstream lineage:** R7-P04; PRD05-XW-0387/0403/0433/0449
- **Existing controls:** Exact binary↔symbol linkage is part of build/support identity; custom builds require matching custom symbols.
- **Severity / plausibility / priority:** **CRITICAL / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-66; FIXTURE-09
- **Success / exit evidence:** Crash each supported release-like native artifact and recover actionable stacks using only archived exact-build manifest/symbol evidence.
- **ADR dependency:** ADR — symbol archive/index implementation
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-P12 — Symbol/build evidence retention expires before supported world/client lifetime

- **Parent:** PRD06-RISK-P
- **Failure statement:** A still-supported version crashes but the matching binaries, symbols, manifests or dependency source have already been deleted.
- **Consequence:** Old but supported saves/servers cannot receive meaningful crash support or regression reproduction.
- **Trigger / exposure:** CI artifact retention is shorter than product/support/migration commitments.
- **Upstream lineage:** R7-P04; PRD05-XW-0449; PRD04-BND-451/452
- **Existing controls:** Retention duration is tied to supported versions/migration obligations, not arbitrary CI defaults.
- **Severity / plausibility / priority:** **HIGH / LIKELY / P1**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-66/70; FIXTURE-09
- **Success / exit evidence:** Select oldest supported build in retention fixture and prove exact artifact, manifest, dependency and symbols remain resolvable until support/migration policy retires it.
- **ADR dependency:** ADR — retention policy/storage backend
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-P13 — Support bundle leaks secrets or unrelated private player data

- **Parent:** PRD06-RISK-P
- **Failure statement:** Diagnostic package includes credentials, auth tokens, signing keys, private chat/user data, arbitrary world directories or unrelated personal files.
- **Consequence:** Privacy/security incident and loss of trust.
- **Trigger / exposure:** Support command recursively archives logs/save/config folders without field-level allowlist/redaction.
- **Upstream lineage:** R7-P05; PRD05-XW-0394/0395/0423/0432
- **Existing controls:** Support bundle is generated from an explicit bounded allowlist with deterministic redaction tests.
- **Severity / plausibility / priority:** **CRITICAL / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-65; FIXTURE-09
- **Success / exit evidence:** Seed every prohibited secret/private class and prove none appears in the bundle while required build/health/error evidence remains usable.
- **ADR dependency:** ADR — support-bundle schema/UI/optional upload path
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-P14 — Support bundle omits evidence needed to reproduce failure

- **Parent:** PRD06-RISK-P
- **Failure statement:** Privacy-minimized support evidence lacks build identity, pack/schema state, recent structured diagnostics or relevant health/queue/revision context.
- **Consequence:** Bundle is safe but operationally useless, forcing impossible reproduction.
- **Trigger / exposure:** Over-redaction or hand-curated logs without required machine-readable context.
- **Upstream lineage:** R7-P05; PRD05-XW-0394/0423; PRD04 support evidence boundaries
- **Existing controls:** Allowlist contains a minimum bounded evidence contract including build/dependency identity and relevant structured state.
- **Severity / plausibility / priority:** **HIGH / LIKELY / P1**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-65/66; FIXTURE-09
- **Success / exit evidence:** Representative crash/performance/provider failures can be triaged to the intended build/failure class using the generated bundle without exposing prohibited material.
- **ADR dependency:** ADR — minimum support evidence schema
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-P15 — Expected stale/superseded work is classified as failure noise

- **Parent:** PRD06-RISK-P
- **Failure statement:** Normal cancellation/revision rejection is logged at error/fatal severity or counted as provider failure.
- **Consequence:** Healthy large-world concurrency floods logs/alerts and hides real invariant violations.
- **Trigger / exposure:** Thousands of obsolete generation/nav/simulation/provider tasks finish after newer revisions.
- **Upstream lineage:** R7-P06; PRD05-XW-0388/0391/0431; Round-3 F02/G09
- **Existing controls:** Diagnostic taxonomy distinguishes expected supersession from validation rejection, retryable provider failure and invariant/fatal failure.
- **Severity / plausibility / priority:** **HIGH / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-64/75; FIXTURE-03 + FIXTURE-09
- **Success / exit evidence:** Generate thousands of stale/cancelled tasks mixed with injected real faults; diagnostics classify expected work separately and genuine faults remain visible/actionable.
- **ADR dependency:** ADR — diagnostic event taxonomy/severity schema
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-P16 — Real invariant/provider failure is drowned by unstructured provider logs

- **Parent:** PRD06-RISK-P
- **Failure statement:** Leyforge relies on human-readable Godot/Zylann/library log strings as the primary machine-diagnostic contract.
- **Consequence:** Log wording/version changes break automation and high-volume noise obscures ownership/revision failure context.
- **Trigger / exposure:** Health tooling parses provider text instead of receiving structured Leyforge events.
- **Upstream lineage:** R7-P06; PRD05-XW-0388–0393/0421; PRD04-BND-431–449
- **Existing controls:** Structured diagnostic schema is Leyforge-owned; provider messages are attached evidence, not stable machine contracts.
- **Severity / plausibility / priority:** **CRITICAL / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-64/72; FIXTURE-09 + provider fixtures
- **Success / exit evidence:** Change provider versions/log wording and demonstrate Leyforge failure categories/health automation remain stable and machine-readable.
- **ADR dependency:** ADR — structured event serialization
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-P17 — Correlation context breaks across async subsystem boundaries

- **Parent:** PRD06-RISK-P
- **Failure statement:** A command/transaction cannot be followed through owner revision, provider tasks, journal/checkpoint, replication and acknowledgement.
- **Consequence:** Stale work, duplicate execution and durability/replication problems cannot be distinguished after failure.
- **Trigger / exposure:** Different layers invent unrelated IDs or fail to propagate parent/child context.
- **Upstream lineage:** R7-P06; PRD05-XW-0389/0390/0422; Q09; PROOF-63 lineage
- **Existing controls:** Operation/correlation identity and WorldSession/owner/revision context cross subsystem boundaries.
- **Severity / plausibility / priority:** **CRITICAL / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-64 + PROOF-63; FIXTURE-03 + FIXTURE-09 + FIXTURE-10
- **Success / exit evidence:** One hostile transaction produces a bounded trace that links canonical command/commit to derived provider/persistence/network work and correctly classifies stale descendants.
- **ADR dependency:** ADR — correlation/span/parent-child identity model
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-P18 — Observability becomes its own performance failure

- **Parent:** PRD06-RISK-P
- **Failure statement:** Production-intended logs, metrics, traces and diagnostic counters create excessive CPU, allocation, lock contention, memory or I/O load.
- **Consequence:** Instrumentation changes performance characteristics, causes backpressure or creates the failure it is diagnosing.
- **Trigger / exposure:** Per-task/per-voxel events, synchronous sinks or full tracing under hostile workloads.
- **Upstream lineage:** R7-P07; PRD05-XW-0405/0429/0430/0437/0448; existing G09
- **Existing controls:** Observability is bounded and budgeted; release diagnostics prioritize high-value structured evidence.
- **Severity / plausibility / priority:** **CRITICAL / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-75; FIXTURE-09 + FIXTURE-10
- **Success / exit evidence:** Measure release-intended instrumentation under hostile load and show bounded overhead while retaining the minimum evidence needed for failures/queues/revisions.
- **ADR dependency:** ADR — release observability sampling/sink configuration
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-P19 — High-cardinality labels or trace fan-out cause unbounded telemetry state

- **Parent:** PRD06-RISK-P
- **Failure statement:** Entity IDs, voxel coordinates, task IDs, player IDs or arbitrary content names are emitted as unbounded metric dimensions or retained traces.
- **Consequence:** Memory/backend/storage explodes and diagnostics become unusable at real world scale.
- **Trigger / exposure:** Metrics/traces naïvely label every semantic/runtime object.
- **Upstream lineage:** R7-P07; PRD04 metric/diagnostic boundaries; PRD05-XW-0405/0429
- **Existing controls:** Metrics use bounded aggregation; high-cardinality identities remain in sampled/structured diagnostic events only where justified.
- **Severity / plausibility / priority:** **HIGH / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-75; FIXTURE-09 + FIXTURE-10
- **Success / exit evidence:** Large population/world fixture demonstrates bounded metric cardinality/storage while preserving drill-down evidence for selected incidents.
- **ADR dependency:** ADR — metrics dimensionality/retention policy
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-P20 — Diagnostics differ materially between editor/debug and release builds

- **Parent:** PRD06-RISK-P
- **Failure statement:** Required health/queue/revision evidence exists only in editor/debug because built-in monitors/hooks are unavailable or compiled differently in release.
- **Consequence:** Production incident lacks the very evidence used to qualify development builds.
- **Trigger / exposure:** Qualification relies on editor-only monitors or debug instrumentation.
- **Upstream lineage:** R7-P07/R7-P08; PRD05-XW-0380/0404/0430
- **Existing controls:** Leyforge-owned release diagnostics cover required production signals; debug/provider monitors are supplemental.
- **Severity / plausibility / priority:** **CRITICAL / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-64/70/75; FIXTURE-09
- **Success / exit evidence:** Real release-like artifacts expose the required bounded diagnostics and classify the same injected failures as development lanes.
- **ADR dependency:** ADR — production diagnostics build configuration
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-P21 — Editor/headless/debug success is promoted to production qualification

- **Parent:** PRD06-RISK-P
- **Failure statement:** P2/P3 or headless/editor results are labelled as P5 support evidence without real exported artifact, renderer/hardware and hostile-lane evidence.
- **Consequence:** Unsupported configurations are declared production-ready and failures appear only after release.
- **Trigger / exposure:** Green unit/headless CI is used as the final release gate.
- **Upstream lineage:** R7-P08; PRD05-XW-0406–0410/0425/0444/0450; PRD-04 proof ladder
- **Existing controls:** Evidence maturity P0–P5 is explicit; every support claim names artifact, hardware/profile and workload lane.
- **Severity / plausibility / priority:** **CRITICAL / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-70 + PROOF-71; FIXTURE-09 + FIXTURE-08
- **Success / exit evidence:** Qualification board cannot mark a support claim P5 unless required exported, renderer/hardware and hostile evidence IDs exist; lower-lane success remains lower maturity.
- **ADR dependency:** No implementation ADR; governance/qualification gate
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-P22 — Exported artifact matrix omits a materially supported role/profile combination

- **Parent:** PRD06-RISK-P
- **Failure statement:** A claimed client/server/Forge/platform/provider/precision/renderer lane is never built and smoke-tested as the product users will run.
- **Consequence:** Release breaks only in omitted packaging/stripping/native configuration.
- **Trigger / exposure:** Matrix is minimized without tracing support claims to required combinations.
- **Upstream lineage:** R7-P08/R7-P09 cross-consumed from RISK-L; PRD05-XW-0377/0378/0428/0434
- **Existing controls:** Build matrix is driven by support/proof claims, with exact role/profile identities.
- **Severity / plausibility / priority:** **CRITICAL / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-70; FIXTURE-09
- **Success / exit evidence:** Every supported material combination has an explicit exported-artifact lane or documented reason it is covered by an equivalent proven artifact; unsupported combinations are not advertised.
- **ADR dependency:** ADR — CI/build-matrix policy
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-P23 — Benchmark report lacks workload/environment identity

- **Parent:** PRD06-RISK-P
- **Failure statement:** Performance numbers omit hardware, OS/driver, build, renderer, precision/provider edition, world fixture, settings, player/server count or measurement method.
- **Consequence:** Numbers cannot be compared or used to set/reject production budgets.
- **Trigger / exposure:** Convenience FPS/tick report is copied into qualification without context.
- **Upstream lineage:** R7-P10; PRD05-XW-0407/0410/0439; REQ-DEV-085
- **Existing controls:** Qualification evidence is contextual and versioned; historical POC benchmark hygiene is regression inspiration only.
- **Severity / plausibility / priority:** **HIGH / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-71/75; FIXTURE-09 + FIXTURE-08
- **Success / exit evidence:** Every benchmark result is rejected by validation if required environment/workload/build fields are missing; repeated results are comparable only when context compatibility is explicit.
- **ADR dependency:** ADR — benchmark result schema/required metadata
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-P24 — One hardware/result sample is generalized into universal support target

- **Parent:** PRD06-RISK-P
- **Failure statement:** A successful benchmark on one machine/profile or historical POC hardware is promoted into minimum/recommended requirements or broad performance claims.
- **Consequence:** Product requirements become arbitrary and low/high-end behavior remains untested.
- **Trigger / exposure:** Single developer PC, cloud runner or POC benchmark becomes the support baseline.
- **Upstream lineage:** R7-P08/R7-P10; PRD05-XW-0439/0444; PRD04-PROOF-71
- **Existing controls:** Hardware/profile support is earned through representative lanes and workloads; historical numbers are not universal targets.
- **Severity / plausibility / priority:** **HIGH / LIKELY / P1**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-71/70; FIXTURE-08 + FIXTURE-09
- **Success / exit evidence:** Support tiers are derived from a multi-lane hardware/workload evidence set with explicit margins; no single historical or developer machine result can establish them.
- **ADR dependency:** ADR — hardware tiers/performance thresholds only after PRD-08 evidence
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

# 80. Round-7 Build Identity Contract

A production-supportable artifact must be traceable through a composite identity at least capable of distinguishing:

```text
LEYFORGE SOURCE REVISION
+ GODOT EXACT VERSION / SOURCE REVISION
+ VOXEL TOOLS EXACT REVISION + EDITION
+ LOCAL PATCH / FORK IDENTITY
+ MATERIAL NATIVE / TOOLCHAIN DEPENDENCIES
+ PRECISION / PROVIDER / BUILD PROFILE
+ CLIENT / SERVER / FORGE ROLE
+ PLATFORM / ARCHITECTURE
+ RENDERER / PRESENTATION PROFILE WHERE MATERIAL
+ CONTENT / SCHEMA COMPATIBILITY IDENTITY
+ EXACT SYMBOL PACKAGE IDENTITY
= REPRODUCIBLE SUPPORT EVIDENCE
```

The exact manifest syntax remains open.

A marketing version such as `0.7.0` can identify a release family but cannot substitute for the exact composite evidence required by P01/P05/P08/P10/P11.

# 81. Round-7 Diagnostic Contract

Round 7 preserves the PRD-04/05 diagnostic architecture:

```text
CANONICAL COMMAND / OPERATION / REVISION
              ↓
   WORLDSESSION + OWNER CONTEXT
              ↓
      CORRELATION IDENTITY
              ↓
 LEYFORGE STRUCTURED DIAGNOSTICS
     ├─ event/category/severity
     ├─ provider/task evidence
     ├─ queue depth + queue age
     ├─ revision/readiness lag
     ├─ durability/replication lag
     ├─ fidelity/degraded state
     ├─ build/content identity
     └─ bounded human-readable context
```

Required distinction classes include at least:

- expected stale/superseded work;
- validation rejection;
- retryable provider failure;
- degraded provider;
- content/dependency incompatibility;
- recovery required;
- security rejection;
- performance budget breach;
- architecture invariant violation;
- fatal process/native failure.

Exact field names and serialization remain unlocked.

# 82. Round-7 Support-Bundle Minimum / Maximum Boundary

A support bundle may contain bounded, relevant evidence such as:

- exact build/dependency manifest;
- renderer/provider/precision/profile identity;
- OS/hardware summary needed for reproduction;
- pack/content/schema compatibility identity;
- bounded recent structured diagnostic events;
- queue/revision/readiness/durability/replication health snapshots;
- crash/minidump references where applicable;
- last-known checkpoint/session identity where policy permits;
- explicit clean/unclean termination evidence.

It must **not** indiscriminately include:

- passwords;
- export credentials;
- authentication/reconnect secrets;
- private signing/encryption keys;
- arbitrary personal files;
- unrestricted chat/private player data;
- whole save/world directories merely because they are nearby;
- unrelated environment variables or home-directory content.

Exact collection UI, retention and upload policy remain future implementation decisions.

# 83. Round-7 Proof Exit Matrix

| Proof | Principal Round-7 consumers | Minimum exit evidence |
|---|---|---|
| **PROOF-64 — Stale Work Diagnostic Classification** | P15–P17/P20 | Thousands of expected stale tasks mixed with real faults are classified correctly and remain traceable to owner/revision/context. |
| **PROOF-65 — Support Bundle Redaction** | P04/P13/P14 | Seeded secrets/private classes are absent while required triage evidence remains present. |
| **PROOF-66 — Release Crash Symbolication** | P11/P12/P14 | Exact release-like crashes resolve to useful stacks using archived matching artifact/manifests/symbols. |
| **PROOF-70 — Exported Artifact Matrix** | P01–P03/P05/P07/P10/P20–P22/P24 | Real client/server/Forge products are built/smoked with exact role/profile/dependency identity. |
| **PROOF-72 — Dependency Upgrade Fixture** | P05–P07/P10/P16 | Controlled dependency upgrade reruns the required conformance/export/persistence/gameplay lanes. |
| **PROOF-73 — Local Patch Reproducibility** | P01/P05/P08/P09/P10 | Patch/fork can be rebuilt from clean upstream and its identity is visible in resulting artifacts. |
| **PROOF-75 — Observability Overhead** | P02/P15/P18–P20/P23 | Release-intended diagnostics remain bounded under hostile load without dropping critical evidence. |

Cross-programme evidence remains:

- **PROOF-71 — Renderer / Hardware Lane** is owned by PKG-K and is consumed by P02/P21/P23/P24 for support/benchmark qualification.
- **PROOF-74 — Architecture Dependency Lint** is owned by PKG-A and is consumed by P09 to detect provider/patch authority leakage.
- **PROOF-76 — Whole-Stack Hostile Transaction Soak** remains the final cross-programme soak and may consume production diagnostics from P18–P20.

No proof above is currently a `PROOF RESULT`.

# 84. PRD-07 FIXTURE-09 Requirements Added by Round 7

**FIXTURE-09 — Build / Exported Artifact / Support / Dependency Fixture** must now support:

1. clean-room rebuild from recorded exact dependency/build identity;
2. client, dedicated-server and Forge role artifacts;
3. release/debug/profile/custom-provider/precision identity variation where applicable;
4. local patch/fork application from clean upstream;
5. controlled dependency upgrade in isolation;
6. toolchain/transitive dependency identity mutation;
7. exact symbol archive/linkage and deliberate release/native crashes;
8. seeded export/build credentials for leak tests;
9. seeded private/support data for redaction tests;
10. provider log wording/version mutation;
11. structured diagnostic event capture;
12. expected-stale vs real-failure classification storm;
13. correlation propagation across async subsystem boundaries;
14. observability on/off/sampling overhead comparison;
15. high-cardinality telemetry stress;
16. benchmark schema validation with missing-context rejection;
17. CI-like headless lane and **real exported artifact** lane comparison;
18. explicit artifact/support evidence retention lookup for an older supported build.

# 85. Qualification Anti-Promotion Gates

PRD-06 preserves the PRD-04 maturity ladder:

```text
P0 IDEA
P1 DOCUMENTATION EVIDENCE
P2 REFERENCE IMPLEMENTATION
P3 LEYFORGE PROTOTYPE
P4 STRESS TESTED
P5 PRODUCTION QUALIFIED
```

Round 7 adds the operational rule:

> **Evidence can only support the exact claim, artifact, workload and environment it actually tested.**

Therefore:

- a documentation fact cannot close a prototype risk;
- an editor test cannot close exported-artifact risk;
- a headless server test cannot close renderer/hardware risk;
- a debug/profile benchmark cannot silently become shipping performance;
- one machine cannot establish universal hardware support;
- successful export cannot prove runtime semantics;
- successful runtime cannot prove recovery under real crash;
- P3 success cannot be promoted to P5 because the same code happens to compile for release.

# 86. Round-7 ADR Reservation Gates

| Future ADR / policy | Must not be accepted before |
|---|---|
| **Composite build-manifest format** | P01/P03/P05/P11 + PROOF-70/66. |
| **Dependency inventory/lock mechanism** | P05–P07 + PROOF-72 and clean-room rebuild. |
| **Permanent local fork/patch strategy** | P08/P09 + PROOF-73 and at least one upgrade/rebase exercise. |
| **Supported native/provider build matrix** | P10/P22 + PROOF-70/72/73. |
| **Symbol archive/index/retention policy** | P11/P12 + PROOF-66. |
| **Support-bundle schema/UI/upload workflow** | P04/P13/P14 + PROOF-65. |
| **Structured diagnostic serialization** | P15–P17/P20 + PROOF-64/75. |
| **Correlation/span model** | P17 + PROOF-63/64. |
| **Metrics/tracing backend and retention** | P18/P19 + PROOF-75. |
| **CI lane composition/cadence** | P20–P22 + exported-artifact evidence. |
| **Benchmark schema and performance threshold policy** | P23/P24 + PROOF-71/75 evidence. |
| **Minimum/recommended hardware tiers** | P24 + completed representative renderer/hardware lanes in PRD-08. |

# 87. Round-7 Open Implementation Questions Preserved

1. Exact build-manifest serialization and embedding.
2. Dependency lock/inventory format and tool.
3. Reproducible build environment/container strategy.
4. Toolchain/transitive dependency lock depth.
5. Permanent fork vs patchset policy for Godot/Zylann.
6. Symbol storage/index technology and retention duration.
7. Crash/minidump collection service, if any.
8. Support-bundle UI, retention and optional upload mechanism.
9. Structured event format (JSON/JSONL/binary/other).
10. Correlation/span representation.
11. Metrics backend, if any.
12. Trace backend, if any.
13. Production sampling/aggregation policy.
14. Logging sinks and rotation/retention.
15. Test framework.
16. CI provider and PR/nightly/release cadence.
17. Exact client/server/Forge build matrix.
18. Platform/architecture support matrix.
19. Benchmark result storage and comparison tooling.
20. Hardware tiers and performance thresholds.
21. Observability overhead budget.
22. Support lifetime for old symbols/artifacts.
23. Architecture dependency-lint implementation details.

# 88. Round-7 Integrity Checks

| Check | Result |
|---|---|
| Parent RISK-P preserved unchanged | **PASS** |
| Stable Round-7 P child risks | **PASS — 24/24** |
| `R7-P01..P08` consumed under RISK-P | **PASS — 8/8** |
| `R7-P09` artifact divergence kept under RISK-L and cross-consumed | **PASS** |
| `R7-P10` benchmark ambiguity consumed under RISK-P | **PASS** |
| Composite build identity remains Leyforge-owned | **PASS** |
| Dependency presence/patching does not grant architecture authority | **PASS** |
| Provider log strings remain non-stable evidence only | **PASS** |
| Support bundle remains allowlisted/redacted | **PASS** |
| Exact symbols tied to exact binary/build identity | **PASS** |
| Editor/headless/debug evidence remains below P5 unless appropriate lanes pass | **PASS** |
| `PROOF-71` remains owned by PKG-K | **PASS** |
| `PROOF-74` remains owned by PKG-A | **PASS** |
| `PROOF-76` remains final cross-programme soak | **PASS** |
| CI/telemetry/crash/dependency/hardware implementation choices remain unlocked | **PASS** |
| Current PRD-08 proof results created | **PASS — 0** |
| Implementation ADRs accepted | **PASS — 0** |
| PRD-04/05 reopen candidates | **PASS — 0** |

# 89. Round-7 Closure Verdict

> **ROUND 7 PASS — BUILD / DEPENDENCY / OBSERVABILITY / QUALIFICATION RISK DECOMPOSITION COMPLETE.**

The most consequential Round-7 conclusions are:

1. **A version number is not enough to reproduce Leyforge.** Exact source/dependency/provider/patch/profile/role/content identity is required.
2. **A local patch is a first-class dependency delta, not tribal knowledge and not new architecture authority.**
3. **Symbols are part of production supportability and must match the exact shipped binary.**
4. **Support evidence must be both useful and privacy-safe; neither “zip everything” nor “redact everything useful” is acceptable.**
5. **Expected stale work must be distinguishable from real failures at machine-readable level.**
6. **Provider log strings cannot be stable automation contracts.**
7. **Observability has a performance budget and must survive the same hostile workloads it diagnoses.**
8. **Qualification is claim-specific.** Editor, headless, debug, one-machine or historical POC success cannot be promoted beyond the lane actually tested.
9. **Build matrices are derived from supported claims, not from multiplying every theoretical dimension nor from omitting inconvenient real products.**
10. **Round 7 closes risk decomposition, not the risks themselves.** PRD-07 must execute the fixtures; PRD-08 must record results/ADRs.

No Round-7 finding requires PRD-04 or PRD-05 reopening.

# 90. Machine-Readable Round-7 Summary

```yaml
document: PRD-06
version: v0.7
round: 7
status: WORKING
round_status: PASS
parent_families_decomposed: [P]
child_risks:
  P: 24
  total: 24
severity_counts:
  critical: 15
  high: 9
plausibility_counts:
  likely: 20
  possible: 4
priority_counts:
  p0: 21
  p1: 3
round7_seed_intake:
  r7_p01_p08_consumed_under_p: 8
  r7_p09_cross_consumed_under_l: 1
  r7_p10_consumed_under_p: 1
direct_proof_ids_owned_by_pkg_l: [64, 65, 66, 70, 72, 73, 75]
cross_programme_proofs_consumed: [71, 74, 76]
proof_results_created: 0
implementation_adrs_created: 0
architecture_reopen_candidates: 0
next_round: Historical / Migration / Compatibility Risk Decomposition
```

---

**End of PRD-06 v0.7 — Round 7 Working Baseline**

---

# 91. Round-8 Scope and Historical / Migration Authority Reconciliation

Round 8 decomposes **PRD06-RISK-R — Historical / migration / compatibility contamination**.

Unlike the provider-focused rounds, this pass requires **no new web/current-technology discovery**. Its controlling inputs are the project's historical POC evidence, the raw 312-row `VoxelRegistry.json`, PRD-05 Round 8, and the locked FCC-13E migration authority.

The governing rule remains:

> **Retire obsolete implementation/scenario assumptions; preserve only the gameplay capability, invariant, migration meaning, failure class or historical evidence that current authorities still justify.**

The raw historical registry is confirmed as:

```text
rows:                       312
blocks:                     143
items:                      169
legacy numeric IDs:         1..312
rows with /Game/Voxel path: 312 / 312
```

FCC-13E closes the **semantic** disposition of every row:

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

That closure does **not** prove the future loader, palette remapping, compatibility objects, migration backup/reporting, old-save parser or namespace isolation.

# 92. Round-8 Stable Child-Risk Register

Round 8 creates **22 stable child risks** under `PRD06-RISK-R`.

Classification:

- **CRITICAL:** 16
- **HIGH:** 6
- **LIKELY:** 13
- **POSSIBLE:** 9
- **P0:** 19
- **P1:** 3

PRD-05 seed coverage:

- **R8-A** → R01/R02
- **R8-B** → R03
- **R8-C** → R05/R06/R21
- **R8-D** → R07/R08/R09/R14/R15/R17/R18/R22
- **R8-E** → R11/R12/R22
- **R8-F** → R19/R20
- **R8-G** → R09/R10/R18/R22
- **R8-H** → R02/R04

### PRD06-RISK-R01 — Historical POC content/layout assumptions leak into shipping worldgen

- **Parent:** PRD06-RISK-R
- **Failure statement:** Fixed POC-era content identities, layouts, placements, scenario gates or fallback pools are retained as ordinary production generation merely because they were proven in the prototype.
- **Consequence:** The clean rebuild silently canonises obsolete Hearthplain/POC assumptions, conflicts with FCC/system authorities and makes later content reconciliation expensive.
- **Trigger / exposure:** Reusing old worldgen tables, scene fixtures, registry pools or test defaults directly as production configuration.
- **Upstream lineage:** R8-A; PRD05-XW-0451/0454/0460/0486/0498/0520; REQ-GOV-071/072
- **Existing controls:** Historical evidence is quarantined; current FCC/system authorities own production content; POC scenario wrappers are ARCHIVE-SCENARIO rather than production defaults.
- **Severity / plausibility / priority:** **CRITICAL / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-62/74; FIXTURE-07 + FIXTURE-09
- **Success / exit evidence:** Production manifests/worldgen pools are mechanically scanned for retired POC-only IDs, fixed scenario dependencies and legacy fallback assumptions; detected references block qualification unless explicitly governed as test/compat content.
- **ADR dependency:** No implementation ADR; production-content admission validator
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-R02 — Fixed POC scenario identity is mistaken for preserved gameplay requirement

- **Parent:** PRD06-RISK-R
- **Failure statement:** Named prototype residents, settlement identities, coordinates, raid timing or scripted chronology are treated as requirements rather than the reusable capability/invariant they demonstrated.
- **Consequence:** Tests and implementation become brittle, overfit one scenario and accidentally preserve obsolete narrative/content canon.
- **Trigger / exposure:** Copying old acceptance criteria verbatim without extracting semantic cause/effect.
- **Upstream lineage:** R8-A/R8-H; PRD05 §94–95; historical POC manual
- **Existing controls:** Scenario → capability conversion rule: archive fixed identity/timing; generalise reusable cause/effect; rebuild observable invariant.
- **Severity / plausibility / priority:** **HIGH / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-62/74; FIXTURE-07 + current domain fixtures
- **Success / exit evidence:** Representative old scenario tests can be satisfied by different valid current content/coordinates while preserving the same governed invariant; no production fixture requires obsolete named POC actors/layouts unless explicitly testing migration.
- **ADR dependency:** No ADR; test-authoring governance
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-R03 — Summer-specific manual-test steps are copied literally into PRD-07

- **Parent:** PRD06-RISK-R
- **Failure statement:** Historical test instructions retain `.summer/...`, old scene/script names, F5/F6 runner behavior or obsolete engine/tool flows rather than current observable requirements.
- **Consequence:** Regression suite tests the retired harness instead of Leyforge behavior and breaks during the clean rebuild for irrelevant reasons.
- **Trigger / exposure:** Automated/manual migration of the Stage/POC guide by path or command rather than semantic translation.
- **Upstream lineage:** R8-B; UNK-DEV-022; PRD05-XW-0462/0475/0483/0519
- **Existing controls:** Old test → current requirement/invariant → new fixture translation register; historical steps retain provenance only.
- **Severity / plausibility / priority:** **HIGH / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-62/74; FIXTURE-09 + all translated domain fixtures
- **Success / exit evidence:** Every retained POC test has a translation entry naming the current requirement/invariant and new fixture; no production regression depends on a retired Summer path/runner unless the fixture intentionally verifies historical migration.
- **ADR dependency:** No ADR; PRD-07 translation-register format
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-R04 — Preserved capability is confused with promotion of an exact POC object

- **Parent:** PRD06-RISK-R
- **Failure statement:** Because crafting, smelting, automation, storage, wards or another capability survives, its exact historical Workbench/Stone Furnace/Basic Mana Miner-style object is automatically promoted into current canon.
- **Consequence:** POC-only objects bypass FCC/system ownership and duplicate or conflict with current canonical forms/archetypes.
- **Trigger / exposure:** Migration or rebuild maps capability requirement to the nearest old registry object instead of current authority.
- **Upstream lineage:** R8-H; PRD05-XW-0517; FCC-13E representative POC-only rows
- **Existing controls:** Capability preservation and content identity are separate decisions; FCC-13E final disposition controls legacy object status.
- **Severity / plausibility / priority:** **CRITICAL / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-49/57/58/62; FIXTURE-07 + FIXTURE-04
- **Success / exit evidence:** Acceptance tests demonstrate preserved system capability using current canonical objects/archetypes while exact POC-only objects remain absent from normal content; migration cases use compat/test handling only.
- **ADR dependency:** No ADR; canonical content binding remains source-authority decision
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-R05 — Reference-engine lesson is mistaken for built-in Godot/Zylann capability

- **Parent:** PRD06-RISK-R
- **Failure statement:** A feature observed in Vintage Story, Minecraft, Terasology, another engine/project or an old reference implementation is documented/implemented as if Godot/Zylann supplies it natively.
- **Consequence:** Architecture relies on nonexistent provider guarantees, creating late rewrites and false proof status.
- **Trigger / exposure:** Research note loses evidence class or a reference implementation is quoted without built-in/example/extension/lesson distinction.
- **Upstream lineage:** R8-C; PRD05-XW-0455/0456/0457/0458/0471/0472
- **Existing controls:** Evidence classification is mandatory: built-in capability / example code / extension point / architectural lesson.
- **Severity / plausibility / priority:** **CRITICAL / POSSIBLE / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-67/72/74; FIXTURE-09 + provider-conformance fixtures
- **Success / exit evidence:** Selected architecture assumptions trace either to verified current provider capability or explicitly Leyforge-owned implementation work; reference lessons cannot satisfy provider proof fields.
- **ADR dependency:** No ADR; evidence-class field is governance
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-R06 — Historical reference/POC maturity is promoted into current PRD-08 proof

- **Parent:** PRD06-RISK-R
- **Failure statement:** Old POC success, research pass synthesis or third-party reference behavior is entered as a current Leyforge proof result without matching current architecture/build/provider conditions.
- **Consequence:** Risks close on non-equivalent evidence and PRD-07 work is skipped.
- **Trigger / exposure:** Historical P3/P4-like result is copied into PRD-08 because the capability name appears similar.
- **Upstream lineage:** PRD05-XW-0451/0459/0473/0505/0520; PRD-04 proof ladder
- **Existing controls:** Evidence retains original maturity/context; historical results never auto-populate current proof-result fields.
- **Severity / plausibility / priority:** **CRITICAL / POSSIBLE / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-70/72/74; FIXTURE-09
- **Success / exit evidence:** Audit tooling rejects any PRD-08 result lacking current fixture/build/source evidence and preserves historical records only as supporting context/regression provenance.
- **ADR dependency:** No ADR; PRD-08 evidence-admission rule
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-R07 — FCC-13E 312-row migration disposition is implemented incorrectly

- **Parent:** PRD06-RISK-R
- **Failure statement:** One or more legacy rows are redirected, retired, contextualized, quarantined or promoted differently from FCC-13E's locked final matrix.
- **Consequence:** Old saves gain/lose semantic value, POC-only content enters canon or valid player-owned state is destroyed.
- **Trigger / exposure:** Hand-authored migration switch/table diverges from FCC-13E or partial importer ignores outcome class.
- **Upstream lineage:** R8-D; UNK-PST-013/018; PRD05-XW-0488/0490/0491/0506–0518; FCC-13E 312/312
- **Existing controls:** FCC-13E is semantic migration authority; machine-readable final 312-row matrix is the conformance source.
- **Severity / plausibility / priority:** **CRITICAL / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-57/58/62; FIXTURE-04 + FIXTURE-07
- **Success / exit evidence:** A generated 312-row conformance fixture exercises every legacy row and verifies expected direct rebind/contextual/compat/test/reject outcome plus retained original metadata where required.
- **ADR dependency:** ADR — migration-loader implementation only after 312-row conformance passes
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-R08 — Legacy numeric IDs are treated as globally stable current identity

- **Parent:** PRD06-RISK-R
- **Failure statement:** Historical numeric IDs 1..312 are rebound directly to current runtime/canonical entries without save-version/migration context.
- **Consequence:** A reused/reordered numeric slot silently changes object meaning.
- **Trigger / exposure:** Loader assumes numeric row number is universal identity or current palette index.
- **Upstream lineage:** UNK-PST-014; PRD05-XW-0492/0500/0518; FCC-13E numeric-only migration safety
- **Existing controls:** Numeric IDs are version-scoped historical handles only; stable semantic IDs own current identity.
- **Severity / plausibility / priority:** **CRITICAL / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-02/57/58; FIXTURE-01 + FIXTURE-04
- **Success / exit evidence:** Randomize current runtime/palette IDs and load versioned legacy fixtures; semantic migration outcome remains unchanged and no numeric-only row can bypass the FCC-13E resolver.
- **ADR dependency:** ADR — version-aware legacy palette/ID resolver
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-R09 — Legacy Unreal path/name/texture/color fields are used as semantic migration keys

- **Parent:** PRD06-RISK-R
- **Failure statement:** `/Game/Voxel/...` asset paths, display names, texture indices or placeholder RGB/hex values are treated as authoritative current identity/material evidence.
- **Consequence:** Ambiguous or cosmetic historical metadata drives incorrect semantic migration.
- **Trigger / exposure:** Importer uses path/name/color heuristics before FCC-13E mappings/current IDs.
- **Upstream lineage:** R8-D/R8-G; PRD05-XW-0489/0493/0494; VoxelRegistry 312/312 `/Game/Voxel` paths; FCC-13E §12
- **Existing controls:** Historical path/visual fields are migration/reference evidence only; FCC-13E disposition resolves semantic meaning first.
- **Severity / plausibility / priority:** **CRITICAL / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-02/57/58/74; FIXTURE-01 + FIXTURE-04
- **Success / exit evidence:** Mutate/erase historical display/path/color/texture metadata in fixtures while retaining locked mapping context and prove migration identity is unchanged; unsupported context quarantines rather than guesses.
- **ADR dependency:** ADR — migration source-field precedence
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-R10 — Unsupported or ambiguous old-save row is guessed into a new identity

- **Parent:** PRD06-RISK-R
- **Failure statement:** Loader substitutes a superficially similar modern object to avoid a migration error when context is insufficient.
- **Consequence:** Player-owned/world value changes silently and migration corruption becomes hard to detect.
- **Trigger / exposure:** No exact/current mapping exists, contextual evidence is missing or a removed pack/object appears.
- **Upstream lineage:** R8-G; FCC-13E unsupported legacy object policy; PRD05-XW-0495/0504/0518
- **Existing controls:** Resolution order ends in `leyforge_compat`/quarantine or explicit removal report; unrelated guessing is forbidden.
- **Severity / plausibility / priority:** **CRITICAL / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-57/58; FIXTURE-04 + FIXTURE-07
- **Success / exit evidence:** Ambiguous fixtures deterministically enter compatibility/quarantine or explicit governed removal with original ID/version metadata preserved; no nearest-name/material guess is possible.
- **ADR dependency:** ADR — compatibility object/quarantine representation
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-R11 — `leyforge_test` content leaks into ordinary production content pools

- **Parent:** PRD06-RISK-R
- **Failure statement:** POC-only fixtures retained for regression become craftable, spawnable, tradable or world-generated in normal play.
- **Consequence:** Test artifacts become accidental canon and may expose placeholder/unsafe behavior.
- **Trigger / exposure:** Namespace/filter is ignored by Forge build, content pack, registry or worldgen admission.
- **Upstream lineage:** R8-E; FCC-13E §7; PRD05-XW-0496/0497
- **Existing controls:** `leyforge_test` is test-only and canonical content may not depend on it.
- **Severity / plausibility / priority:** **CRITICAL / POSSIBLE / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-62/74; FIXTURE-07 + FIXTURE-09
- **Success / exit evidence:** Production pack/build/worldgen/crafting scans contain zero test-only entries or dependencies, while dedicated test builds can opt in explicitly.
- **ADR dependency:** ADR — namespace/capability admission filters
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-R12 — `leyforge_compat` object leaks into normal progression/trade/worldgen

- **Parent:** PRD06-RISK-R
- **Failure statement:** Compatibility objects intended solely to preserve old-save integrity become ordinary craftable/tradable/generated content.
- **Consequence:** Historical placeholders gain current gameplay authority and pollute economy/progression.
- **Trigger / exposure:** Compatibility objects share ordinary registries/tags without hard capability isolation.
- **Upstream lineage:** R8-E; FCC-13E §6; PRD05-XW-0495/0496
- **Existing controls:** Compatibility objects are noncraftable by default, absent from worldgen/progression/trade and retain original migration metadata.
- **Severity / plausibility / priority:** **CRITICAL / POSSIBLE / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-57/58/62/74; FIXTURE-04 + FIXTURE-07 + FIXTURE-09
- **Success / exit evidence:** Compatibility fixtures survive save/load/migration but cannot be discovered through ordinary crafting/worldgen/trade/progression queries unless an explicit migration-only operation handles them.
- **ADR dependency:** ADR — compatibility capability mask/registry projection
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-R13 — Retired legacy ID is reused for unrelated current content

- **Parent:** PRD06-RISK-R
- **Failure statement:** An old stable/migration identity is assigned to a new unrelated object after the original meaning is retired.
- **Consequence:** Old saves migrate into the new object, creating catastrophic silent reinterpretation.
- **Trigger / exposure:** ID allocator treats retired namespace entries as available.
- **Upstream lineage:** FCC-13E alias/redirect policy; PRD05-XW-0491/0501
- **Existing controls:** Removed IDs are never reused; aliases/redirects remain historical metadata.
- **Severity / plausibility / priority:** **CRITICAL / POSSIBLE / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-02/57/58/74; FIXTURE-01 + FIXTURE-04
- **Success / exit evidence:** Registry lint refuses allocation of any historical current/deprecated/migration/compat alias to unrelated content across versioned fixtures.
- **ADR dependency:** No ADR; stable-ID allocation law
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-R14 — Many-to-one legacy aliases recreate duplicate physical identities

- **Parent:** PRD06-RISK-R
- **Failure statement:** Several old Block/Item rows that should converge on one modern physical identity are imported as multiple active items/blocks.
- **Consequence:** Single-definition rule breaks, inventory/crafting duplicates return and saves/network semantics diverge.
- **Trigger / exposure:** Migration tool preserves one new entity per legacy row rather than aliasing duplicate historical projections.
- **Upstream lineage:** FCC-13E many-to-one redirects; FCC-13 single-definition law; PRD05-XW-0490/0502
- **Existing controls:** Canonical targets support zero-to-many migration aliases; duplicate old rows may converge on one semantic identity.
- **Severity / plausibility / priority:** **CRITICAL / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-02/52/58; FIXTURE-01 + FIXTURE-04 + FIXTURE-07
- **Success / exit evidence:** Known duplicate legacy rows migrate into one canonical physical identity with preserved provenance and no duplicate recipe/item/block registrations.
- **ADR dependency:** ADR — alias table/runtime migration binding
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-R15 — Migration executes without pre-migration backup or complete report

- **Parent:** PRD06-RISK-R
- **Failure statement:** Migration mutates a source world without retaining a known-good copy and machine/player-readable disposition log.
- **Consequence:** Failed/ambiguous migration becomes irreversible and individual row outcomes cannot be audited.
- **Trigger / exposure:** Loader performs in-place upgrade for convenience or suppresses compatibility/rejection counts.
- **Upstream lineage:** FCC-13E §§27–28; PRD05-XW-0503/0518; family D
- **Existing controls:** Pre-migration backup, machine-readable log, readable summary and outcome counts are mandatory migration evidence.
- **Severity / plausibility / priority:** **CRITICAL / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-48/58/69; FIXTURE-04
- **Success / exit evidence:** Force failure at multiple migration phases; original remains restorable and report identifies direct/contextual/compat/test/reject/unresolved outcomes exactly.
- **ADR dependency:** ADR — migration staging/backup/report format
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-R16 — Historical save fixture strategy is either insufficient or over-preserved

- **Parent:** PRD06-RISK-R
- **Failure statement:** PRD-07 either keeps too few real old saves to catch parser/version edge cases or preserves every obsolete byte/file/tool dependency without proving it adds compatibility value.
- **Consequence:** Migration bugs escape testing or the rebuild becomes permanently coupled to obsolete implementation artifacts.
- **Trigger / exposure:** Fixture selection is nostalgic/ad hoc rather than based on supported migration semantics and failure coverage.
- **Upstream lineage:** UNK-PST-017; PRD05-XW-0519; Round-8 treatment vocabulary
- **Existing controls:** Preserve byte-for-byte fixtures only where raw format/parser behavior matters; otherwise encode semantic expected outcomes with provenance.
- **Severity / plausibility / priority:** **HIGH / LIKELY / P1**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-57/58/69; FIXTURE-04
- **Success / exit evidence:** A fixture selection register justifies each verbatim legacy file versus semantic reconstruction and demonstrates coverage of all supported version/migration branches without carrying irrelevant obsolete assets.
- **ADR dependency:** No ADR; PRD-07 fixture-retention policy
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-R17 — Historical provider/storage format is elevated into Leyforge semantic schema

- **Parent:** PRD06-RISK-R
- **Failure statement:** Old Unreal asset layout, legacy VoxelRegistry structure or provider-specific save/palette format becomes the canonical model merely because migration tooling can read it.
- **Consequence:** Clean architecture is constrained by obsolete storage/provider shapes and future provider replacement becomes harder.
- **Trigger / exposure:** Migration parser structures are reused as current domain entities/registries.
- **Upstream lineage:** R8-A/R8-D; PRD05-XW-0487/0489/0518; parent C/D
- **Existing controls:** Historical schemas are inputs to adapters only; current canonical semantic authority remains provider-independent.
- **Severity / plausibility / priority:** **CRITICAL / POSSIBLE / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-02/58/67/74; FIXTURE-01 + FIXTURE-04
- **Success / exit evidence:** Legacy parser can be removed/replaced after migration while current saves/runtime/domain models remain unchanged; architecture lint blocks reverse dependencies from current domain into legacy schema.
- **ADR dependency:** ADR — migration adapter boundary
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-R18 — Provider/version migration drops legacy conversion path too early

- **Parent:** PRD06-RISK-R
- **Failure statement:** Godot/Zylann/storage/schema upgrade removes the ability to open or stage still-supported old worlds before a governed conversion has run.
- **Consequence:** Supported worlds become stranded or require unsupported manual archaeology.
- **Trigger / exposure:** Dependency upgrade retires parser/provider version without checking migration fixture matrix.
- **Upstream lineage:** R8-D/R8-G; family D/P; PROOF-72 lineage
- **Existing controls:** Dependency upgrades run migration/provider conformance; support lifetime and conversion route are explicit.
- **Severity / plausibility / priority:** **CRITICAL / POSSIBLE / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-58/72/73; FIXTURE-04 + FIXTURE-09
- **Success / exit evidence:** Upgrade fixture opens/stages all supported legacy baselines through the governed conversion route or explicitly blocks upgrade until an intermediate converter is preserved.
- **ADR dependency:** ADR — legacy converter/support-lifetime strategy
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-R19 — Historical benchmark hardware/numbers become current performance budgets

- **Parent:** PRD06-RISK-R
- **Failure statement:** Old POC benchmark FPS, timing, i5-9600K/RTX 2080 Ti hardware or seed/check counts are copied into current minimum/recommended targets.
- **Consequence:** PRD-07 benchmarks optimize toward arbitrary obsolete numbers and later qualification is falsely constrained.
- **Trigger / exposure:** Historical report is the only convenient numeric baseline when writing new benchmark specs.
- **Upstream lineage:** R8-F; UNK-PERF-021; PRD05-XW-0477/0478/0505; historical POC benchmark
- **Existing controls:** Historical numbers retain context only; current target hardware/build/profile/budget must be established by fresh PRD-07/08 evidence.
- **Severity / plausibility / priority:** **HIGH / LIKELY / P1**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-71/75; FIXTURE-08 + FIXTURE-09
- **Success / exit evidence:** Benchmark specifications fail validation if target/budget is sourced only from historical POC values; new hardware/profile lanes record independent rationale and evidence.
- **ADR dependency:** ADR — hardware/performance targets only after current PRD-08 evidence
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-R20 — Historical regression/check counts become arbitrary CI pass gates

- **Parent:** PRD06-RISK-R
- **Failure statement:** Old total check counts, seed-suite sizes or probe names are preserved as success criteria even when the new architecture/coverage model differs.
- **Consequence:** Team optimizes number of tests rather than risk/proof coverage, or discards better tests to match an obsolete count.
- **Trigger / exposure:** CI migration uses old 'N checks passed' as a contractual target.
- **Upstream lineage:** R8-F; PRD05 §98; historical POC probes
- **Existing controls:** Retain failure classes and benchmark/test shapes; derive current counts from risk/proof coverage.
- **Severity / plausibility / priority:** **HIGH / POSSIBLE / P1**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-62/70/74; FIXTURE-09
- **Success / exit evidence:** CI acceptance references current requirement/risk/proof coverage and permits check counts to change without reducing coverage; historical counts remain metadata only.
- **ADR dependency:** No ADR; CI evidence policy
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-R21 — Historical evidence loses provenance/maturity during archive or Brain ingestion

- **Parent:** PRD06-RISK-R
- **Failure statement:** When old docs/results are imported into the Project Brain/archive, labels distinguishing historical POC, research, reference implementation and current authority disappear.
- **Consequence:** Future agents/users may cite obsolete evidence as current canon/proof and reintroduce retired assumptions.
- **Trigger / exposure:** Bulk indexing/summary process strips source date/status/evidence class or merges duplicate concepts.
- **Upstream lineage:** R8-C; PRD05-XW-0451/0459/0505/0520; Branch A authority-map/metadata requirements
- **Existing controls:** Historical/reference materials retain source/status/maturity/provenance metadata and authority links.
- **Severity / plausibility / priority:** **HIGH / LIKELY / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-62/74; FIXTURE-09 + Brain bootstrap validation later
- **Success / exit evidence:** Search/index fixtures return historical material with explicit non-authority/evidence labels and cannot rank it above current controlled authority for the same subject.
- **ADR dependency:** No implementation ADR here; Branch-A Brain metadata/ingestion implementation
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

### PRD06-RISK-R22 — Migration tooling writes compatibility/test identities back into canonical source registries

- **Parent:** PRD06-RISK-R
- **Failure statement:** A migration run or compatibility importer mutates FCC/current source registries to make an old save load, rather than producing a scoped alias/compatibility result.
- **Consequence:** One player's legacy data changes global canon/content and contaminates future worlds.
- **Trigger / exposure:** Loader auto-creates canonical definitions for unknown legacy rows or writes aliases into source without governance.
- **Upstream lineage:** R8-D/R8-E/R8-G; FCC-13E compatibility policy; family C/M
- **Existing controls:** Migration consumes locked mappings; runtime compatibility state is scoped and cannot author canonical registry source.
- **Severity / plausibility / priority:** **CRITICAL / POSSIBLE / P0**
- **Risk state:** `PROOF-REQUIRED`
- **Proof route:** PROOF-57/58/62/74; FIXTURE-01 + FIXTURE-04 + FIXTURE-07
- **Success / exit evidence:** Load arbitrary unsupported old-save rows and prove no canonical registry/source files change; only governed compatibility/quarantine records are created.
- **ADR dependency:** ADR — runtime migration/compatibility store separated from canonical registry source
- **Residual risk:** `UNASSESSED — NO CURRENT PRD-08 RESULT`

# 93. FCC-13E Migration Resolution Contract

The future migration loader must preserve FCC-13E's resolution order:

```text
1. CURRENT CANONICAL ID
2. DEPRECATED CANONICAL REDIRECT
3. MIGRATION ALIAS
4. COMPATIBILITY MAPPING
5. AUTHORISED CONTEXTUAL MIGRATION
6. COMPATIBILITY / QUARANTINE IF UNRESOLVED
```

Additional laws:

- old IDs are never reused for unrelated content;
- many old IDs may converge onto one current canonical identity;
- unsupported objects are never guessed into unrelated replacements;
- `leyforge_compat` objects are noncraftable by default and excluded from normal worldgen/progression/trade;
- `leyforge_test` fixtures are excluded from canonical production dependencies;
- original legacy ID/version metadata is retained where compatibility handling requires it;
- migration has a pre-migration backup and machine-readable/readable outcome report;
- design-time unresolved legacy rows are **0**, but runtime insufficient-context rows may validly become compatibility/quarantine objects.

# 94. Historical Test Translation Contract

Historical tests are translated using:

```text
OLD STEP / PROBE / SCENE
        ↓
HISTORICAL OBSERVABLE BEHAVIOUR
        ↓
CURRENT REQUIREMENT / AUTHORITY
        ↓
CURRENT RISK / PROOF OBLIGATION
        ↓
PRD-07 FIXTURE + ASSERTION
```

The translation record must separately preserve:

- historical source/probe identity for archaeology;
- current requirement/authority;
- reusable invariant/failure class;
- retired Summer/Unreal/path/scenario detail;
- new fixture/assertion owner;
- whether any byte-for-byte historical input is actually necessary.

This operationalizes `UNK-DEV-022` without preserving the retired POC harness.

# 95. Migration Fixture Matrix Required by Round 8

PRD-07's migration fixture set must cover at least:

1. all **312 FCC-13E rows** as a generated semantic conformance matrix;
2. each final FCC-13E outcome class;
3. direct canonical redirects;
4. many-to-one aliases for legacy duplicate Block/Item identities;
5. contextual migrations with sufficient context;
6. the same contextual cases with insufficient context, producing compatibility/quarantine;
7. `POC-ONLY / NOT PROMOTED` isolation;
8. `leyforge_test` exclusion from production pools;
9. `leyforge_compat` exclusion from crafting/worldgen/trade/progression;
10. rejected/removed object reporting;
11. numeric-ID randomization/version scoping;
12. missing/changed display name, `/Game/Voxel` path, texture and colour metadata;
13. retired-ID reuse attempts;
14. pre-migration backup and forced failure;
15. migration report count reconciliation;
16. missing-pack/current-content dependencies;
17. provider/storage version upgrade;
18. real-process crash during migration;
19. canonical-registry immutability during compatibility loading;
20. representative byte-for-byte legacy saves selected under the Round-8 retention rule.

# 96. Historical Evidence Admission Matrix

| Historical material | May support | May not establish by itself |
|---|---|---|
| **POC manual/probe result** | regression shape, observable capability, failure class, migration provenance | current PRD-08 result, current architecture authority, current performance budget |
| **Raw `VoxelRegistry.json`** | old-save identity/provenance, migration input | current registry/canon/material identity |
| **FCC-13E** | locked semantic migration outcome | exact loader/database/palette implementation |
| **Research/reference project** | built-in capability evidence when directly verified, example/extension/lesson context | unverified Godot/Zylann capability or Leyforge ADR |
| **Historical benchmark** | old workload shape and historical context | current minimum/recommended hardware, P5 budget |
| **Old test scene/script/path** | archaeology and test intent | mandatory clean-rebuild harness structure |

# 97. Cross-Risk Dependencies Exposed by Round 8

```text
R historical/migration contamination
 ├──► C stable semantic identity / runtime palette separation
 ├──► D backup / migration / recovery / old-save parsing
 ├──► M pack / compatibility namespace admission
 ├──► N source-to-bake and POC-only asset exclusion
 ├──► P dependency upgrade / qualification / evidence provenance
 ├──► Branch A Brain metadata / authority ranking
 └──► PRD-07 fixture corpus

R07–R15 + R22
 └──► exact FCC-13E semantic conformance

R03/R05/R06/R19/R20/R21
 └──► prevent historical evidence from being promoted beyond its actual maturity
```

# 98. Round-8 Proof Exit Matrix

| Proof | Round-8 risk consumers | Minimum exit evidence |
|---|---|---|
| **PROOF-02 — Runtime-ID Randomization** | R08/R09/R13/R14/R17 | Current runtime/palette IDs can change without altering version-aware legacy semantic migration. |
| **PROOF-49 — Source → Bake Reproducibility** | R04/R22 | POC-only/test/compat sources cannot silently become ordinary canonical runtime products. |
| **PROOF-48 — World Copy / Backup** | R15 | Pre-migration source remains restorable and separate from staged migration output. |
| **PROOF-57 — Missing Pack World Recovery** | R04/R07/R10/R12/R13/R22 | Missing/unsupported identities preserve explicit compatibility/quarantine semantics rather than guessing. |
| **PROOF-58 — Pack Upgrade / World Migration** | R04/R07–R18/R22 | Migration implements FCC-13E and version/provider/content changes without semantic reinterpretation. |
| **PROOF-62 — Forge CI Build** | R01–R04/R06/R07/R11/R12/R20/R21/R22 | Production/test/compat source admission and historical-evidence rules are mechanically enforced in build/CI paths. |
| **PROOF-67 — Provider Conformance Matrix** | R05/R17 | Reference lessons/provider-specific historical schemas cannot masquerade as current provider contracts. |
| **PROOF-69 — Real Process Crash Recovery** | R15/R16 | Migration/recovery safety survives real process termination, not just graceful cleanup. |
| **PROOF-71 — Renderer / Hardware Lane** | R19 | Fresh current hardware/profile evidence, not historical POC numbers, establishes qualification. |
| **PROOF-72 — Dependency Upgrade Fixture** | R05/R06/R18 | Provider/dependency upgrades preserve supported migration/conversion paths and evidence classification. |
| **PROOF-73 — Local Patch Reproducibility** | R18 | Legacy conversion dependence on a local provider patch cannot be lost silently. |
| **PROOF-74 — Architecture Dependency Lint** | R01–R03/R05/R06/R09/R11–R13/R17/R20–R22 | Retired provider/path/test/compat dependencies cannot leak back into canonical architecture/content. |
| **PROOF-75 — Observability Overhead** | R19 | Historical benchmark values cannot substitute for current measured benchmark lanes. |

`PROOF-57/58` remain the principal migration behavior proofs; the others provide identity, build, provider, recovery and qualification controls around them.

# 99. PRD-07 Fixture Additions

## FIXTURE-01 — Registry / Identity Migration Additions

Add:

- current runtime-ID/palette randomization;
- legacy numeric ID + source-version binding;
- many-to-one migration alias convergence;
- retired-ID reuse rejection;
- historical path/name/color/texture mutation;
- canonical-registry immutability when loading unsupported legacy content.

## FIXTURE-04 — Migration / Recovery Additions

Add:

- representative verbatim legacy saves;
- generated 312-row FCC-13E semantic fixture;
- pre-migration backup;
- staged migration destination;
- machine-readable migration log and readable summary;
- forced failure/crash during migration;
- compatibility/quarantine persistence;
- missing pack/provider/schema transitions;
- report-count reconciliation to expected row outcomes.

## FIXTURE-07 — Test / Compatibility Content Isolation

Add:

- `leyforge_test` pack/source;
- `leyforge_compat` pack/runtime projection;
- production content/worldgen/crafting/trade scans;
- POC-only exact-object exclusion;
- canonical capability acceptance with different current content;
- no production dependency on test-only fixtures.

## FIXTURE-09 — Historical Evidence / Build Governance

Add:

- evidence-class metadata tests;
- old benchmark/check-count anti-promotion checks;
- provider-reference lesson classification;
- historical source-status retention through Brain/index ingestion;
- architecture lint for `.summer`, `/Game/Voxel`, test/compat namespace and other retired production dependencies.

# 100. Round-8 ADR Reservation Gates

| Future ADR / implementation | Must not be accepted before |
|---|---|
| **Version-aware legacy ID/palette resolver** | R07–R10/R13/R14 + 312-row conformance + PROOF-02/58. |
| **Compatibility/quarantine object representation** | R10/R12/R22 + missing/ambiguous-save fixtures. |
| **Migration staging/backup/reporting implementation** | R15 + forced failure/real-crash evidence. |
| **Historical legacy parser/adapter boundary** | R09/R17/R18 + architecture/provider conformance. |
| **Supported legacy-save fixture set** | R16 + explicit byte-for-byte vs semantic-retention register. |
| **Dependency/provider legacy conversion policy** | R18 + PROOF-72 and migration fixtures. |
| **`leyforge_test` / `leyforge_compat` admission mechanism** | R11/R12/R22 + build/worldgen/crafting isolation tests. |
| **Current hardware/performance targets** | R19 + fresh PRD-08 renderer/hardware evidence; historical numbers are ineligible. |

# 101. Round-8 Open Implementation Questions Preserved

1. Exact migration-loader code architecture.
2. Legacy save-version detection mechanism.
3. Legacy numeric palette/ID lookup representation.
4. Runtime compatibility-object storage schema.
5. Compatibility-object UX and player-visible remediation flow.
6. Whether `leyforge_compat` is one dedicated pack, generated migration layer or another scoped mechanism.
7. Whether `leyforge_test` is compiled into developer/test products only or loaded as a test pack.
8. Exact machine-readable migration log format.
9. Pre-migration backup/staging implementation.
10. Exact set of byte-for-byte historical save fixtures.
11. Which very old versions are officially supported directly versus by staged/intermediate conversion.
12. Legacy provider/schema converter retention period.
13. Canonical registry lint implementation.
14. Historical evidence metadata fields used by the Project Brain.
15. Automated old-test translation tooling, if any.
16. Fresh current benchmark hardware/budget targets.

# 102. Round-8 Unknown Resolution / Risk Routing

| PRD-01 unknown | PRD-06 Round-8 status |
|---|---|
| **UNK-DEV-022 — old POC manual-test mapping** | **POLICY RESOLVED / IMPLEMENTATION OPEN.** R03 + translation contract route the actual fixture conversion to PRD-07. |
| **UNK-PST-013 — 312-row legacy migration plan** | **SEMANTICALLY RESOLVED.** FCC-13E owns 312/312 dispositions; R07 protects implementation conformance. |
| **UNK-PST-014 — numeric legacy-ID migration semantics** | **NARROWED.** Numeric IDs are version-scoped historical handles; R08 covers implementation risk. |
| **UNK-PST-017 — verbatim vs semantic historical save fixtures** | **OPEN / ROUTED.** R16 + PRD-07 fixture-selection register. |
| **UNK-PST-018 — migration loader implementation** | **OPEN / ROUTED.** R07–R15/R17/R18/R22. |
| **UNK-PERF-021 — replacement hardware benchmark** | **OPEN / ROUTED.** R19 forbids historical-target reuse; current evidence belongs to PRD-07/08. |

# 103. Round-8 Integrity Checks

| Check | Result |
|---|---|
| Parent `PRD06-RISK-R` preserved | **PASS** |
| Stable Round-8 child risks | **PASS — 22/22** |
| R8-A through R8-H consumed | **PASS — 8/8** |
| FCC-13E semantic rows | **PASS — 312/312 closed** |
| FCC-13E outcome-count total | **PASS — 312** |
| Raw historical registry remains demoted to migration/test provenance | **PASS** |
| Raw registry block/item count retained | **PASS — 143 / 169** |
| Raw `/Game/Voxel` path count retained | **PASS — 312/312** |
| POC-only exact content remains non-promoted | **PASS — 168 rows** |
| `leyforge_test` isolated from production | **PASS — proof-required, law preserved** |
| `leyforge_compat` isolated from normal progression/worldgen/trade | **PASS — proof-required, law preserved** |
| Old IDs cannot be reused or guessed | **PASS — law preserved** |
| Pre-migration backup/reporting requirement preserved | **PASS** |
| Historical benchmark/check-count anti-promotion preserved | **PASS** |
| Historical evidence cannot create PRD-08 results | **PASS** |
| Exact migration/compat/fixture implementation remains unlocked | **PASS** |
| Current PRD-08 proof results created | **PASS — 0** |
| Implementation ADRs accepted | **PASS — 0** |
| PRD-04/05 reopen candidates | **PASS — 0** |

# 104. Round-8 Closure Verdict

> **ROUND 8 PASS — HISTORICAL / MIGRATION / COMPATIBILITY RISK DECOMPOSITION COMPLETE.**

The critical conclusions are:

1. **The 312-row semantic migration problem is closed; the migration implementation problem is not.**
2. **Prototype existence never grants current canon authority.** The 168 POC-only rows remain intentionally non-promoted.
3. **Migration identity is version-aware and semantic.** Numeric IDs, `/Game/Voxel` paths, display names, texture indices and colours cannot substitute for FCC-13E/current stable IDs.
4. **Unsupported legacy data must be quarantined or explicitly removed, never guessed.**
5. **Compatibility and test namespaces are preservation tools, not normal gameplay namespaces.**
6. **Many-to-one aliases must converge duplicate old rows onto one modern physical identity.**
7. **Migration is a recoverable transaction with backup/reporting, not an in-place best-effort rewrite.**
8. **Historical tests preserve invariants, not Summer implementation paths.**
9. **Reference projects preserve correctly classified lessons/evidence, not imaginary provider capabilities.**
10. **Historical benchmark numbers preserve context only; current hardware/performance qualification must be fresh.**
11. **Project Brain ingestion must retain historical evidence class/authority metadata or it can reintroduce contamination later.**

No Round-8 finding requires PRD-04 or PRD-05 reopening.

# 105. Machine-Readable Round-8 Summary

```yaml
document: PRD-06
version: v0.8
round: 8
status: WORKING
round_status: PASS
parent_families_decomposed: [R]
child_risks:
  R: 22
  total: 22
severity_counts:
  critical: 16
  high: 6
plausibility_counts:
  likely: 13
  possible: 9
priority_counts:
  p0: 19
  p1: 3
round8_seed_intake:
  r8_a_to_h_consumed: 8
legacy_registry:
  rows: 312
  blocks: 143
  items: 169
  game_voxel_paths: 312
fcc13e:
  semantically_disposed_rows: 312
  unresolved_design_rows: 0
  poc_only_not_promoted: 168
proof_results_created: 0
implementation_adrs_created: 0
architecture_reopen_candidates: 0
next_round: Cross-Register Risk Coverage / Priority Reconciliation
```

---

**End of PRD-06 v0.8 — Round 8 Working Baseline**


---

# 106. Round-9 Scope — Cross-Register Coverage & Priority Reconciliation

Round 9 is the mechanical whole-register audit before PRD-06 closure reconciliation.

It does **not** execute proofs, reduce residual risk, accept ADRs or invent additional requirements. It answers six control questions:

1. Are all 18 A–R family identifiers still present?
2. Are all stable child-risk sequences complete and unique?
3. Did all **109 PRD-05 detailed risk refinements** reach at least one stable child risk?
4. Does every **PRD04-PROOF-01→76** have at least one detailed child-risk consumer?
5. Does every **FIXTURE-01→10** have at least one detailed child-risk consumer?
6. Did the **137 open-routed PRD-01 unknowns** obey the Round-1 promotion rule without either disappearing or bloating PRD-06?

Round 9 also corrects the document's inherited top-level version/status metadata from the stale Round-2 header to the current **v0.9 / Round-9** state. This is a metadata correction only; no earlier risk semantics are rewritten.

# 107. Stable Child-Risk Inventory

```text
Primary risk families:                     18 / 18
Stable child risks:                      263 / 263 unique
CRITICAL child risks:                    170
HIGH child risks:                         93
LIKELY child risks:                       165
POSSIBLE child risks:                     98
P0 child risks:                           226
P1 child risks:                            37
Families with numbering gaps:                  0
Duplicate child IDs:                           0
Duplicate exact child titles:                  0
```

| Family | Children | CRITICAL / HIGH | LIKELY / POSSIBLE | P0 / P1 | Current aggregate roll-up |
|---|---:|---:|---:|---:|---|
| **A** | 9 | 6 / 3 | 2 / 7 | 9 / 0 | **CRITICAL / LIKELY / P0** |
| **B** | 9 | 0 / 9 | 2 / 7 | 9 / 0 | **HIGH / LIKELY / P0** |
| **C** | 12 | 9 / 3 | 7 / 5 | 10 / 2 | **CRITICAL / LIKELY / P0** |
| **D** | 18 | 14 / 4 | 14 / 4 | 15 / 3 | **CRITICAL / LIKELY / P0** |
| **E** | 11 | 7 / 4 | 6 / 5 | 11 / 0 | **CRITICAL / LIKELY / P0** |
| **F** | 14 | 10 / 4 | 8 / 6 | 14 / 0 | **CRITICAL / LIKELY / P0** |
| **G** | 11 | 6 / 5 | 7 / 4 | 9 / 2 | **CRITICAL / LIKELY / P0** |
| **H** | 14 | 9 / 5 | 9 / 5 | 12 / 2 | **CRITICAL / LIKELY / P0** |
| **I** | 12 | 9 / 3 | 6 / 6 | 10 / 2 | **CRITICAL / LIKELY / P0** |
| **J** | 18 | 15 / 3 | 10 / 8 | 16 / 2 | **CRITICAL / LIKELY / P0** |
| **K** | 16 | 12 / 4 | 13 / 3 | 13 / 3 | **CRITICAL / LIKELY / P0** |
| **L** | 8 | 4 / 4 | 2 / 6 | 8 / 0 | **CRITICAL / LIKELY / P0** |
| **M** | 15 | 11 / 4 | 11 / 4 | 12 / 3 | **CRITICAL / LIKELY / P0** |
| **N** | 14 | 7 / 7 | 10 / 4 | 10 / 4 | **CRITICAL / LIKELY / P0** |
| **O** | 17 | 3 / 14 | 14 / 3 | 9 / 8 | **CRITICAL / LIKELY / P0** |
| **P** | 24 | 15 / 9 | 20 / 4 | 21 / 3 | **CRITICAL / LIKELY / P0** |
| **Q** | 19 | 17 / 2 | 11 / 8 | 19 / 0 | **CRITICAL / LIKELY / P0** |
| **R** | 22 | 16 / 6 | 13 / 9 | 19 / 3 | **CRITICAL / LIKELY / P0** |

**Roll-up rule:** the final column is a scheduling/control roll-up from the most consequential child in that family; it does not rewrite the historical Round-1 initial family assessment.

A consequential Round-9 observation follows:

> **Every A–R family now contains at least one P0 child risk.**

Therefore the earlier Round-1 P1 family labels for I/N/O/R remain useful historical coarse assessments, but they must **not** be used to defer those families wholesale. Their P0 children have explicit prerequisite/qualification roles.

# 108. Detailed Seed Traceability — 109 / 109

The original PRD-06 intake consisted of:

- 9 Round-2 labels `R-A1..R-A3` / `R-B1..R-B6`;
- 82 explicit `PRD06-SEED-*` rows from Rounds 3–6;
- 10 Round-7 aliases `R7-P01..P10`;
- 8 Round-8 themes `R8-A..H`.

Mechanical lookup across the **263 stable child-risk records** finds:

```text
Detailed refinements in source intake:          109
With >=1 stable child-risk consumer:            109
With zero child-risk consumers:                   0
Consumed by exactly one child risk:              66
Cross-consumed by multiple child risks:           43
Maximum child-risk consumers for one seed:        7
```

No seed was deleted merely because a later round decomposed it differently. Cross-family consumption is permitted where one upstream failure class legitimately creates several concrete risks.

# 109. Proof-to-Risk Reverse Coverage — 76 / 76

Every stable PRD-04 proof obligation now has at least one **detailed child-risk** consumer, not merely a parent-family mention.

```text
PRD04 proof IDs:                                 76
Proof IDs with >=1 child-risk consumer:          76
Proof IDs with zero child-risk consumers:         0
Smallest child-risk consumer count:              1
Largest child-risk consumer count:               30
Current PRD-08 proof results:                     0
```

This means PRD-07 can plan from either direction:

```text
RISK → required proof(s)
PROOF → every detailed risk that depends on it
```

A passed proof will still **not** automatically close all consumers; each risk retains its own success criteria and residual-risk evaluation in PRD-08.

# 110. Fixture-to-Risk Reverse Coverage — 10 / 10

| Fixture | Detailed child-risk consumers |
|---|---:|
| **FIXTURE-01** | 41 |
| **FIXTURE-02** | 46 |
| **FIXTURE-03** | 54 |
| **FIXTURE-04** | 58 |
| **FIXTURE-05** | 47 |
| **FIXTURE-06** | 29 |
| **FIXTURE-07** | 53 |
| **FIXTURE-08** | 27 |
| **FIXTURE-09** | 84 |
| **FIXTURE-10** | 46 |

All ten fixture families therefore have concrete risk demand.

`FIXTURE-09` has the broadest direct consumption because exact artifact/build/support/dependency identity is a cross-cutting qualification prerequisite. `FIXTURE-10` remains the final combined hostile soak and cannot substitute for missing package-level evidence.

# 111. Open-Unknown Promotion Audit — 137 / 137

PRD-05 closed with **137 OPEN-ROUTED-UNKNOWN** subjects. Round 1 required PRD-06 to promote only technically consequential uncertainty.

Round 9 applies that rule to the actual PRD-01 unknown definitions:

```text
Open-routed unknowns audited:                    137
Technically consequential; subsumed by
  existing A–R child risks:                      107
Specialist/canon/design/calibration questions
  deliberately not promoted:                     21
Governance/conditional product questions
  deliberately not promoted:                     9
New general risk families required:                0
New stable child risks required:                   0
Unowned open unknowns:                             0
False-resolved unknowns:                           0
```

The **107 technically consequential unknowns do not require 107 new child IDs**. They become PRD-07 hypotheses, fixture parameters, acceptance criteria or ADR questions under already-existing risk families.

The other 30 remain open with their correct design/governance/product owners. This is deliberate scope discipline, not missing technical work.

## 111.1 Complete 137-Unknown Promotion Ledger

| Unknown | Family | PRD-01 question | Round-9 promotion result | Existing risk/owner route | Treatment |
|---|---|---|---|---|---|
| `UNK-AUT-001` | `AUT` | How will large automation/logistics networks conserve exact resources while avoiding unbounded graph recomputation? | **TECHNICAL — SUBSUMED** | Existing PRD06-RISK-F / PRD06-RISK-G / PRD06-RISK-Q | No new child risk; convert to PRD-07 hypothesis/acceptance criterion under existing family risks. |
| `UNK-ID-004` | `ID` | What exact state/payload limits determine compact Block cell state versus Block Entity versus packed portable payload? | **TECHNICAL — SUBSUMED** | Existing PRD06-RISK-C / PRD06-RISK-D / PRD06-RISK-M | No new child risk; convert to PRD-07 hypothesis/acceptance criterion under existing family risks. |
| `UNK-AUT-004` | `AUT` | What graph/network architecture lets power/logistics supply recipe requirements while preserving system ownership and bounded recomputation? | **TECHNICAL — SUBSUMED** | Existing PRD06-RISK-F / PRD06-RISK-G / PRD06-RISK-Q | No new child risk; convert to PRD-07 hypothesis/acceptance criterion under existing family risks. |
| `UNK-PROG-001` | `PROG` | What exact capability-provider graph representation supports hard/soft/discovery gates, alternate providers, explainable blockers and seed reachability validation? | **TECHNICAL — SUBSUMED** | Existing PRD06-RISK-C / PRD06-RISK-F / PRD06-RISK-G / PRD06-RISK-Q | No new child risk; convert to PRD-07 hypothesis/acceptance criterion under existing family risks. |
| `UNK-AUT-010` | `AUT` | What bounded control/sensor update model permits advanced factories while preventing combinatorial control-loop or event storms? | **TECHNICAL — SUBSUMED** | Existing PRD06-RISK-F / PRD06-RISK-G / PRD06-RISK-Q | No new child risk; convert to PRD-07 hypothesis/acceptance criterion under existing family risks. |
| `UNK-MAG-001` | `MAG` | What exact data model separates personal mana, external mana providers, mana topology, purity/stability and magical state while preserving transaction/migration safety? | **TECHNICAL — SUBSUMED** | Existing PRD06-RISK-A / PRD06-RISK-C / PRD06-RISK-F / PRD06-RISK-G / PRD06-RISK-H / PRD06-RISK-Q | No new child risk; convert to PRD-07 hypothesis/acceptance criterion under existing family risks. |
| `UNK-MAG-002` | `MAG` | What mana-network solver/allocation strategy can support settlement/regional infrastructure and wards without unbounded graph updates? | **TECHNICAL — SUBSUMED** | Existing PRD06-RISK-A / PRD06-RISK-C / PRD06-RISK-F / PRD06-RISK-G / PRD06-RISK-H / PRD06-RISK-Q | No new child risk; convert to PRD-07 hypothesis/acceptance criterion under existing family risks. |
| `UNK-MAG-005` | `MAG` | What spatial representation/solver should authoritative ward coverage use for voxel edits, moving/changed structures, multiple overlapping wards and LOD? | **TECHNICAL — SUBSUMED** | Existing PRD06-RISK-A / PRD06-RISK-C / PRD06-RISK-F / PRD06-RISK-G / PRD06-RISK-H / PRD06-RISK-Q | No new child risk; convert to PRD-07 hypothesis/acceptance criterion under existing family risks. |
| `UNK-MAG-006` | `MAG` | How are summoned/constructed entities routed among person, creature, automation and magic ownership without duplicate identity/state when their status changes? | **TECHNICAL — SUBSUMED** | Existing PRD06-RISK-A / PRD06-RISK-C / PRD06-RISK-F / PRD06-RISK-G / PRD06-RISK-H / PRD06-RISK-Q | No new child risk; convert to PRD-07 hypothesis/acceptance criterion under existing family risks. |
| `UNK-MAG-007` | `MAG` | What realm/portal transition transaction safely transfers actors/cargo and persistent authority between worlds/realms while preventing duplication or stranding? | **TECHNICAL — SUBSUMED** | Existing PRD06-RISK-A / PRD06-RISK-C / PRD06-RISK-F / PRD06-RISK-G / PRD06-RISK-H / PRD06-RISK-Q | No new child risk; convert to PRD-07 hypothesis/acceptance criterion under existing family risks. |
| `UNK-ECO-001` | `ECO` | What population representation (exact counts, cohorts, bands or hybrid) provides adequate causal ecology while remaining scalable and deterministic? | **TECHNICAL — SUBSUMED** | Existing PRD06-RISK-E / PRD06-RISK-F / PRD06-RISK-G / PRD06-RISK-H / PRD06-RISK-I / PRD06-RISK-Q | No new child risk; convert to PRD-07 hypothesis/acceptance criterion under existing family risks. |
| `UNK-ECO-004` | `ECO` | How are migration corridors and population movement represented across unloaded regions while consuming Set-30/26E route/access results? | **TECHNICAL — SUBSUMED** | Existing PRD06-RISK-E / PRD06-RISK-F / PRD06-RISK-G / PRD06-RISK-H / PRD06-RISK-I / PRD06-RISK-Q | No new child risk; convert to PRD-07 hypothesis/acceptance criterion under existing family risks. |
| `UNK-ECO-005` | `ECO` | What sensory/perception query budgets and caching model support many active creatures without O(N²) target scans? | **TECHNICAL — SUBSUMED** | Existing PRD06-RISK-E / PRD06-RISK-F / PRD06-RISK-G / PRD06-RISK-H / PRD06-RISK-I / PRD06-RISK-Q | No new child risk; convert to PRD-07 hypothesis/acceptance criterion under existing family risks. |
| `UNK-ECO-006` | `ECO` | How are ecology-site/nest destruction, vacancy, recolonisation and worldgen-derived habitat reconciled with persistent voxel edits? | **TECHNICAL — SUBSUMED** | Existing PRD06-RISK-E / PRD06-RISK-F / PRD06-RISK-G / PRD06-RISK-H / PRD06-RISK-I / PRD06-RISK-Q | No new child risk; convert to PRD-07 hypothesis/acceptance criterion under existing family risks. |
| `UNK-WGEN-007` | `WGEN` | When a seed/profile fails a required capability validator, what conditions justify deterministic repair versus choosing a different start versus rejecting world creation entirely? | **TECHNICAL — SUBSUMED** | Existing PRD06-RISK-E / PRD06-RISK-G / PRD06-RISK-P | No new child risk; convert to PRD-07 hypothesis/acceptance criterion under existing family risks. |
| `UNK-STR-003` | `STR` | How should Blueprint-source updates rebase/migrate against player-modified structure deltas without silently destroying edits or requiring full structure duplication in saves? | **TECHNICAL — SUBSUMED** | Existing PRD06-RISK-C / PRD06-RISK-D / PRD06-RISK-E / PRD06-RISK-F / PRD06-RISK-H / PRD06-RISK-Q | No new child risk; convert to PRD-07 hypothesis/acceptance criterion under existing family risks. |
| `UNK-STR-010` | `STR` | How are multiple Document-20 service/function records mapped to one changing physical Structure Instance without hidden duplicate capacity? | **TECHNICAL — SUBSUMED** | Existing PRD06-RISK-C / PRD06-RISK-D / PRD06-RISK-E / PRD06-RISK-F / PRD06-RISK-H / PRD06-RISK-Q | No new child risk; convert to PRD-07 hypothesis/acceptance criterion under existing family risks. |
| `UNK-POL-001` | `POL` | What political/civilisation graph data model scales territory, governments, factions, memberships, treaties, wars and claims across large worlds/realms? | **TECHNICAL — SUBSUMED** | Existing PRD06-RISK-C / PRD06-RISK-D / PRD06-RISK-F / PRD06-RISK-G / PRD06-RISK-Q | No new child risk; convert to PRD-07 hypothesis/acceptance criterion under existing family risks. |
| `UNK-POL-002` | `POL` | What spatial representation should jurisdictions, territorial claims, occupation and sovereignty use when borders can change independently of terrain chunks? | **TECHNICAL — SUBSUMED** | Existing PRD06-RISK-C / PRD06-RISK-D / PRD06-RISK-F / PRD06-RISK-G / PRD06-RISK-Q | No new child risk; convert to PRD-07 hypothesis/acceptance criterion under existing family risks. |
| `UNK-POL-003` | `POL` | What deterministic thresholds/history model governs cultural branching/hybridisation/assimilation without simulating every cultural interaction at maximum fidelity? | **SPECIALIST / DESIGN — NOT PROMOTED** | PRD-04/06/07; design calibration | Keep open with owning canon/design/UX/LFE authority; promote later only if a concrete technical failure condition emerges. |
| `UNK-POL-004` | `POL` | How are faction splits/merges/federations committed transactionally across memberships, assets, laws, treaties and historical IDs without duplication? | **TECHNICAL — SUBSUMED** | Existing PRD06-RISK-C / PRD06-RISK-D / PRD06-RISK-F / PRD06-RISK-G / PRD06-RISK-Q | No new child risk; convert to PRD-07 hypothesis/acceptance criterion under existing family risks. |
| `UNK-POL-005` | `POL` | What distant scheduling model handles succession, elections, councils and law/policy changes without simulating every meeting/conversation? | **TECHNICAL — SUBSUMED** | Existing PRD06-RISK-C / PRD06-RISK-D / PRD06-RISK-F / PRD06-RISK-G / PRD06-RISK-Q | No new child risk; convert to PRD-07 hypothesis/acceptance criterion under existing family risks. |
| `UNK-POL-006` | `POL` | How should contested/hidden political truth be stored separately from actor/player knowledge while supporting server-authoritative UI and history queries? | **TECHNICAL — SUBSUMED** | Existing PRD06-RISK-C / PRD06-RISK-D / PRD06-RISK-F / PRD06-RISK-G / PRD06-RISK-Q | No new child risk; convert to PRD-07 hypothesis/acceptance criterion under existing family risks. |
| `UNK-POL-008` | `POL` | How are migration, refugees and diaspora aggregated across distant simulation while retaining protected individual identities and cultural/political continuity? | **TECHNICAL — SUBSUMED** | Existing PRD06-RISK-C / PRD06-RISK-D / PRD06-RISK-F / PRD06-RISK-G / PRD06-RISK-Q | No new child risk; convert to PRD-07 hypothesis/acceptance criterion under existing family risks. |
| `UNK-REALM-006` | `REALM` | What schema resolves law-stack precedence/conflicts and which law fields are permitted to vary at cosmological/realm/region/biome/site/temporary scopes? | **SPECIALIST / DESIGN — NOT PROMOTED** | PRD-04/06; FCC delta | Keep open with owning canon/design/UX/LFE authority; promote later only if a concrete technical failure condition emerges. |
| `UNK-QST-002` | `QST` | How long must raw evidence be retained before compaction into Chronicle/history, and what evidence must never be pruned because active quests/contracts/migrations reference it? | **TECHNICAL — SUBSUMED** | Existing PRD06-RISK-C / PRD06-RISK-D / PRD06-RISK-F / PRD06-RISK-G / PRD06-RISK-Q | No new child risk; convert to PRD-07 hypothesis/acceptance criterion under existing family risks. |
| `UNK-QST-005` | `QST` | What quest/event LOD scheduler handles deadlines, phase windows and catch-up deterministically without scanning every quest/event each tick? | **TECHNICAL — SUBSUMED** | Existing PRD06-RISK-C / PRD06-RISK-D / PRD06-RISK-F / PRD06-RISK-G / PRD06-RISK-Q | No new child risk; convert to PRD-07 hypothesis/acceptance criterion under existing family risks. |
| `UNK-QST-006` | `QST` | What generation/ranking/cooldown model prevents simulation-driven quest spam while still surfacing genuinely meaningful changing world conditions? | **SPECIALIST / DESIGN — NOT PROMOTED** | PRD-04/06/07; design calibration | Keep open with owning canon/design/UX/LFE authority; promote later only if a concrete technical failure condition emerges. |
| `UNK-QST-007` | `QST` | How does Chronicle/history storage remain searchable and bounded over multi-year worlds with potentially enormous event histories? | **TECHNICAL — SUBSUMED** | Existing PRD06-RISK-C / PRD06-RISK-D / PRD06-RISK-F / PRD06-RISK-G / PRD06-RISK-Q | No new child risk; convert to PRD-07 hypothesis/acceptance criterion under existing family risks. |
| `UNK-QST-010` | `QST` | What world-setting thresholds define bounded off-screen consequence protection for critical NPCs/bases/unique items without creating hidden narrative invulnerability? | **SPECIALIST / DESIGN — NOT PROMOTED** | PRD-04/06/07; future Set35 | Keep open with owning canon/design/UX/LFE authority; promote later only if a concrete technical failure condition emerges. |
| `UNK-CMB-002` | `CMB` | What hit-volume/reach/animation-marker representation works reliably for first/third person, voxel terrain and variable actor body sizes? | **TECHNICAL — SUBSUMED** | Existing PRD06-RISK-E / PRD06-RISK-F / PRD06-RISK-G / PRD06-RISK-H / PRD06-RISK-I / PRD06-RISK-J / PRD06-RISK-K / PRD06-RISK-Q | No new child risk; convert to PRD-07 hypothesis/acceptance criterion under existing family risks. |
| `UNK-CMB-003` | `CMB` | How are projectiles simulated/persisted/networked across active-to-distant transitions without one Node/physics body per irrelevant projectile? | **TECHNICAL — SUBSUMED** | Existing PRD06-RISK-E / PRD06-RISK-F / PRD06-RISK-G / PRD06-RISK-H / PRD06-RISK-I / PRD06-RISK-J / PRD06-RISK-K / PRD06-RISK-Q | No new child risk; convert to PRD-07 hypothesis/acceptance criterion under existing family risks. |
| `UNK-CMB-006` | `CMB` | What structure-damage granularity/collapse rules provide meaningful siege without unbounded voxel physics/rebuild cost? | **TECHNICAL — SUBSUMED** | Existing PRD06-RISK-E / PRD06-RISK-F / PRD06-RISK-G / PRD06-RISK-H / PRD06-RISK-I / PRD06-RISK-J / PRD06-RISK-K / PRD06-RISK-Q | No new child risk; convert to PRD-07 hypothesis/acceptance criterion under existing family risks. |
| `UNK-CMB-007` | `CMB` | How should large formations/guards/raids schedule tactical AI and pathing without O(N²) awareness or command cost? | **TECHNICAL — SUBSUMED** | Existing PRD06-RISK-E / PRD06-RISK-F / PRD06-RISK-G / PRD06-RISK-H / PRD06-RISK-I / PRD06-RISK-J / PRD06-RISK-K / PRD06-RISK-Q | No new child risk; convert to PRD-07 hypothesis/acceptance criterion under existing family risks. |
| `UNK-UX-001` | `UX` | What view-model cache/revision architecture keeps many complex screens fresh without polling every domain or leaking hidden truth? | **TECHNICAL — SUBSUMED** | Existing PRD06-RISK-C / PRD06-RISK-D / PRD06-RISK-F / PRD06-RISK-G / PRD06-RISK-O / PRD06-RISK-P | No new child risk; convert to PRD-07 hypothesis/acceptance criterion under existing family risks. |
| `UNK-UX-002` | `UX` | What simulation-depth profile values and domain knobs are understandable to players while still mapping to measurable bounded workloads? | **TECHNICAL — SUBSUMED** | Existing PRD06-RISK-C / PRD06-RISK-D / PRD06-RISK-F / PRD06-RISK-G / PRD06-RISK-O / PRD06-RISK-P | No new child risk; convert to PRD-07 hypothesis/acceptance criterion under existing family risks. |
| `UNK-UX-003` | `UX` | How should existing worlds migrate when simulation depth is increased/decreased after years of history without fabricating missing historical detail? | **TECHNICAL — SUBSUMED** | Existing PRD06-RISK-C / PRD06-RISK-D / PRD06-RISK-F / PRD06-RISK-G / PRD06-RISK-O / PRD06-RISK-P | No new child risk; convert to PRD-07 hypothesis/acceptance criterion under existing family risks. |
| `UNK-UX-004` | `UX` | What hardware recommendation model can estimate CPU/GPU/RAM risk for a world profile without promising performance it cannot guarantee? | **TECHNICAL — SUBSUMED** | Existing PRD06-RISK-C / PRD06-RISK-D / PRD06-RISK-F / PRD06-RISK-G / PRD06-RISK-O / PRD06-RISK-P | No new child risk; convert to PRD-07 hypothesis/acceptance criterion under existing family risks. |
| `UNK-UX-005` | `UX` | What notification deduplication/priority/quiet-mode policy prevents large simulations from overwhelming the player while preserving critical alarms? | **SPECIALIST / DESIGN — NOT PROMOTED** | PRD-04/06/07; Set41 | Keep open with owning canon/design/UX/LFE authority; promote later only if a concrete technical failure condition emerges. |
| `UNK-PLAN-001` | `PLAN` | What compact editable Blueprint cell/shape representation scales from cottages to megaprojects while remaining diffable, migratable and Forge-friendly? | **TECHNICAL — SUBSUMED** | Existing PRD06-RISK-D / PRD06-RISK-E / PRD06-RISK-F / PRD06-RISK-G / PRD06-RISK-M / PRD06-RISK-N / PRD06-RISK-Q | No new child risk; convert to PRD-07 hypothesis/acceptance criterion under existing family risks. |
| `UNK-PLAN-002` | `PLAN` | What shared editor-core architecture can serve in-world and main-menu Blueprint creators without coupling editor UI to runtime scene state? | **TECHNICAL — SUBSUMED** | Existing PRD06-RISK-D / PRD06-RISK-E / PRD06-RISK-F / PRD06-RISK-G / PRD06-RISK-M / PRD06-RISK-N / PRD06-RISK-Q | No new child risk; convert to PRD-07 hypothesis/acceptance criterion under existing family risks. |
| `UNK-PLAN-003` | `PLAN` | What deterministic site-fit/foundation solver should estimate cut/fill/support/water/route impacts for large blueprints without blocking the frame? | **TECHNICAL — SUBSUMED** | Existing PRD06-RISK-D / PRD06-RISK-E / PRD06-RISK-F / PRD06-RISK-G / PRD06-RISK-M / PRD06-RISK-N / PRD06-RISK-Q | No new child risk; convert to PRD-07 hypothesis/acceptance criterion under existing family risks. |
| `UNK-PLAN-004` | `PLAN` | How should autonomous settlement planners rank projects/districts over long horizons without proposal spam, oscillation or expensive global rescoring? | **TECHNICAL — SUBSUMED** | Existing PRD06-RISK-D / PRD06-RISK-E / PRD06-RISK-F / PRD06-RISK-G / PRD06-RISK-M / PRD06-RISK-N / PRD06-RISK-Q | No new child risk; convert to PRD-07 hypothesis/acceptance criterion under existing family risks. |
| `UNK-PLAN-005` | `PLAN` | How are player-authored Blueprint versions upgraded when already-built structures contain edits/damage/renovations? | **TECHNICAL — SUBSUMED** | Existing PRD06-RISK-D / PRD06-RISK-E / PRD06-RISK-F / PRD06-RISK-G / PRD06-RISK-M / PRD06-RISK-N / PRD06-RISK-Q | No new child risk; convert to PRD-07 hypothesis/acceptance criterion under existing family risks. |
| `UNK-PLAN-007` | `PLAN` | What player-content validation/moderation/package limits are needed for sharing large Blueprints without denial-of-service or malicious dependencies? | **TECHNICAL — SUBSUMED** | Existing PRD06-RISK-D / PRD06-RISK-E / PRD06-RISK-F / PRD06-RISK-G / PRD06-RISK-M / PRD06-RISK-N / PRD06-RISK-Q | No new child risk; convert to PRD-07 hypothesis/acceptance criterion under existing family risks. |
| `UNK-PLAN-008` | `PLAN` | What distant construction abstraction produces equivalent material/labour/time outcomes without materialising every placed block until promotion? | **TECHNICAL — SUBSUMED** | Existing PRD06-RISK-D / PRD06-RISK-E / PRD06-RISK-F / PRD06-RISK-G / PRD06-RISK-M / PRD06-RISK-N / PRD06-RISK-Q | No new child risk; convert to PRD-07 hypothesis/acceptance criterion under existing family risks. |
| `UNK-BLD-001` | `BLD` | Should the universal functional catalogue remain at 120 definitions or expand after the companion/maritime functional-distinction audit? | **SPECIALIST / DESIGN — NOT PROMOTED** | Set20 companion/FCC integration; not an architecture guess | Keep open with owning canon/design/UX/LFE authority; promote later only if a concrete technical failure condition emerges. |
| `UNK-BLD-003` | `BLD` | How are mixed-use buildings allowed to share capacity/resources/staffing without double-counting service? | **TECHNICAL — SUBSUMED** | Existing PRD06-RISK-F / PRD06-RISK-G / PRD06-RISK-H / PRD06-RISK-Q | No new child risk; convert to PRD-07 hypothesis/acceptance criterion under existing family risks. |
| `UNK-BLD-004` | `BLD` | What service/maintenance capacity rates and failure curves are required once representative Blueprint sources and economy balance exist? | **SPECIALIST / DESIGN — NOT PROMOTED** | Set20 companion + PRD-06/07 | Keep open with owning canon/design/UX/LFE authority; promote later only if a concrete technical failure condition emerges. |
| `UNK-BLD-005` | `BLD` | What route-congestion/queue model should reduce effective service without requiring full agent simulation at city scale? | **TECHNICAL — SUBSUMED** | Existing PRD06-RISK-F / PRD06-RISK-G / PRD06-RISK-H / PRD06-RISK-Q | No new child risk; convert to PRD-07 hypothesis/acceptance criterion under existing family risks. |
| `UNK-BLD-006` | `BLD` | How much structural support/collapse simulation is required beyond explicit support/condition contracts? | **TECHNICAL — SUBSUMED** | Existing PRD06-RISK-F / PRD06-RISK-G / PRD06-RISK-H / PRD06-RISK-Q | No new child risk; convert to PRD-07 hypothesis/acceptance criterion under existing family risks. |
| `UNK-BLD-007` | `BLD` | How should high-density cities aggregate many buildings/services while retaining inspectable real physical capacity and blockers? | **TECHNICAL — SUBSUMED** | Existing PRD06-RISK-F / PRD06-RISK-G / PRD06-RISK-H / PRD06-RISK-Q | No new child risk; convert to PRD-07 hypothesis/acceptance criterion under existing family risks. |
| `UNK-BLD-008` | `BLD` | What construction-work-rate and material-cost balance remains stable across player/NPC/distant construction and different Simulation Depth profiles? | **SPECIALIST / DESIGN — NOT PROMOTED** | PRD-06/07; design calibration | Keep open with owning canon/design/UX/LFE authority; promote later only if a concrete technical failure condition emerges. |
| `UNK-BLD-010` | `BLD` | What semantic granularity is sufficient to keep only affected rooms/service regions active after damage or contamination without making every building prohibitively expensive to author/simulate? | **TECHNICAL — SUBSUMED** | Existing PRD06-RISK-F / PRD06-RISK-G / PRD06-RISK-H / PRD06-RISK-Q | No new child risk; convert to PRD-07 hypothesis/acceptance criterion under existing family risks. |
| `UNK-PROG-003` | `PROG` | How detailed should curricula/apprenticeship/skill succession be at different Simulation Depth levels while preserving named professional continuity? | **SPECIALIST / DESIGN — NOT PROMOTED** | PRD-04/06/07 | Keep open with owning canon/design/UX/LFE authority; promote later only if a concrete technical failure condition emerges. |
| `UNK-ECON-001` | `ECON` | What authoritative trade/manifests/contracts interface should Set 20B facilities expose to the later Set-27 economy owner without duplicating prices/markets/trade truth? | **TECHNICAL — SUBSUMED** | Existing PRD06-RISK-C / PRD06-RISK-D / PRD06-RISK-F / PRD06-RISK-G / PRD06-RISK-Q | No new child risk; convert to PRD-07 hypothesis/acceptance criterion under existing family risks. |
| `UNK-GOV-001` | `GOV` | What evidence/case representation is sufficient for fair justice and persistent history without retaining unbounded raw witness/event data forever? | **TECHNICAL — SUBSUMED** | Existing PRD06-RISK-D / PRD06-RISK-F / PRD06-RISK-P | No new child risk; convert to PRD-07 hypothesis/acceptance criterion under existing family risks. |
| `UNK-CMB-009` | `CMB` | What perimeter/sector graph representation supports damage, breaches, gates, patrol access and LOD without recalculating an entire fortified settlement after every block edit? | **TECHNICAL — SUBSUMED** | Existing PRD06-RISK-E / PRD06-RISK-F / PRD06-RISK-G / PRD06-RISK-H / PRD06-RISK-I / PRD06-RISK-J / PRD06-RISK-K / PRD06-RISK-Q | No new child risk; convert to PRD-07 hypothesis/acceptance criterion under existing family risks. |
| `UNK-MAG-008` | `MAG` | What portal-facility runtime contract cleanly separates structure/network readiness from the later FCC-13 exact portal recipes and realm-transition authority? | **TECHNICAL — SUBSUMED** | Existing PRD06-RISK-A / PRD06-RISK-C / PRD06-RISK-F / PRD06-RISK-G / PRD06-RISK-H / PRD06-RISK-Q | No new child risk; convert to PRD-07 hypothesis/acceptance criterion under existing family risks. |
| `UNK-MAG-009` | `MAG` | How are ward/containment coverage fields represented and invalidated efficiently when sources, networks, terrain or structures change? | **TECHNICAL — SUBSUMED** | Existing PRD06-RISK-A / PRD06-RISK-C / PRD06-RISK-F / PRD06-RISK-G / PRD06-RISK-H / PRD06-RISK-Q | No new child risk; convert to PRD-07 hypothesis/acceptance criterion under existing family risks. |
| `UNK-PLAN-009` | `PLAN` | What graph/partition model allows megaprojects with thousands of subcomponents to save, activate, damage and restore independently without one monolithic project record? | **TECHNICAL — SUBSUMED** | Existing PRD06-RISK-D / PRD06-RISK-E / PRD06-RISK-F / PRD06-RISK-G / PRD06-RISK-M / PRD06-RISK-N / PRD06-RISK-Q | No new child risk; convert to PRD-07 hypothesis/acceptance criterion under existing family risks. |
| `UNK-ID-006` | `ID` | Is the 120-definition universal catalogue cap still final after Set-26 maritime and later FCC-12/13 reconciliation, or will controlled function-distinction changes be required? | **SPECIALIST / DESIGN — NOT PROMOTED** | Set26/FCC-13 reconciliation; PRD-01 delta | Keep open with owning canon/design/UX/LFE authority; promote later only if a concrete technical failure condition emerges. |
| `UNK-ENT-001` | `ENT` | What runtime representation best maps semantic body-plan/rig source to Godot without locking content to fragile engine-specific node APIs? | **TECHNICAL — SUBSUMED** | Existing PRD06-RISK-C / PRD06-RISK-F / PRD06-RISK-H / PRD06-RISK-N / PRD06-RISK-O / PRD06-RISK-P | No new child risk; convert to PRD-07 hypothesis/acceptance criterion under existing family risks. |
| `UNK-ENT-002` | `ENT` | How many body/rig/animation LOD tiers are actually needed for dense settlements, herds and bosses on target hardware? | **TECHNICAL — SUBSUMED** | Existing PRD06-RISK-C / PRD06-RISK-F / PRD06-RISK-H / PRD06-RISK-N / PRD06-RISK-O / PRD06-RISK-P | No new child risk; convert to PRD-07 hypothesis/acceptance criterion under existing family risks. |
| `UNK-ENT-003` | `ENT` | Which procedural locomotion contacts are cosmetic versus authoritative movement inputs for each body family? | **TECHNICAL — SUBSUMED** | Existing PRD06-RISK-C / PRD06-RISK-F / PRD06-RISK-H / PRD06-RISK-N / PRD06-RISK-O / PRD06-RISK-P | No new child risk; convert to PRD-07 hypothesis/acceptance criterion under existing family risks. |
| `UNK-ENT-004` | `ENT` | How should equipment fitting and collision proxies scale across arbitrary body plans without an authoring explosion? | **TECHNICAL — SUBSUMED** | Existing PRD06-RISK-C / PRD06-RISK-F / PRD06-RISK-H / PRD06-RISK-N / PRD06-RISK-O / PRD06-RISK-P | No new child risk; convert to PRD-07 hypothesis/acceptance criterion under existing family risks. |
| `UNK-ENT-005` | `ENT` | What compact persistent appearance record survives future generator/profile revisions without changing old NPCs unexpectedly? | **TECHNICAL — SUBSUMED** | Existing PRD06-RISK-C / PRD06-RISK-F / PRD06-RISK-H / PRD06-RISK-N / PRD06-RISK-O / PRD06-RISK-P | No new child risk; convert to PRD-07 hypothesis/acceptance criterion under existing family risks. |
| `UNK-PLAN-011` | `PLAN` | What compact Blueprint source representation supports large 3D structures, nested modules and stable internal IDs while remaining pleasant to edit? | **TECHNICAL — SUBSUMED** | Existing PRD06-RISK-D / PRD06-RISK-E / PRD06-RISK-F / PRD06-RISK-G / PRD06-RISK-M / PRD06-RISK-N / PRD06-RISK-Q | No new child risk; convert to PRD-07 hypothesis/acceptance criterion under existing family risks. |
| `UNK-PLAN-012` | `PLAN` | How should Blueprint dependency locking/version ranges work for long-lived worlds and modded content? | **TECHNICAL — SUBSUMED** | Existing PRD06-RISK-D / PRD06-RISK-E / PRD06-RISK-F / PRD06-RISK-G / PRD06-RISK-M / PRD06-RISK-N / PRD06-RISK-Q | No new child risk; convert to PRD-07 hypothesis/acceptance criterion under existing family risks. |
| `UNK-PLAN-013` | `PLAN` | How are terrain-adaptation previews reconciled with authoritative Zylann/worldgen edits without duplicating terrain truth? | **TECHNICAL — SUBSUMED** | Existing PRD06-RISK-D / PRD06-RISK-E / PRD06-RISK-F / PRD06-RISK-G / PRD06-RISK-M / PRD06-RISK-N / PRD06-RISK-Q | No new child risk; convert to PRD-07 hypothesis/acceptance criterion under existing family risks. |
| `UNK-PLAN-014` | `PLAN` | What editing/streaming strategy keeps the Forge responsive for megastructures, dungeons, ships and environment-scale blueprints? | **TECHNICAL — SUBSUMED** | Existing PRD06-RISK-D / PRD06-RISK-E / PRD06-RISK-F / PRD06-RISK-G / PRD06-RISK-M / PRD06-RISK-N / PRD06-RISK-Q | No new child risk; convert to PRD-07 hypothesis/acceptance criterion under existing family risks. |
| `UNK-VFX-001` | `VFX` | Which Godot rendering path best supports large quantities of genuine 3D voxel particles: MultiMesh, RenderingServer, GPU simulation, custom GDExtension, or a hybrid? | **TECHNICAL — SUBSUMED** | Existing PRD06-RISK-N / PRD06-RISK-O / PRD06-RISK-P | No new child risk; convert to PRD-07 hypothesis/acceptance criterion under existing family risks. |
| `UNK-VFX-002` | `VFX` | What deterministic guarantees are required for VFX simulation versus only deterministic selection/replay intent? | **TECHNICAL — SUBSUMED** | Existing PRD06-RISK-N / PRD06-RISK-O / PRD06-RISK-P | No new child risk; convert to PRD-07 hypothesis/acceptance criterion under existing family risks. |
| `UNK-VFX-004` | `VFX` | What hard particle/light/volume budgets preserve the voxel style on low-end through high-end profiles? | **TECHNICAL — SUBSUMED** | Existing PRD06-RISK-N / PRD06-RISK-O / PRD06-RISK-P | No new child risk; convert to PRD-07 hypothesis/acceptance criterion under existing family risks. |
| `UNK-AUDIO-001` | `AUDIO` | What audio voice, cluster and virtualisation budgets are appropriate from hamlet to capital-city scenes? | **TECHNICAL — SUBSUMED** | Existing PRD06-RISK-M / PRD06-RISK-N / PRD06-RISK-O / PRD06-RISK-P | No new child risk; convert to PRD-07 hypothesis/acceptance criterion under existing family risks. |
| `UNK-AUDIO-002` | `AUDIO` | What bounded acoustic model gives convincing voxel-room/door/cave behaviour without expensive full physical acoustics? | **TECHNICAL — SUBSUMED** | Existing PRD06-RISK-M / PRD06-RISK-N / PRD06-RISK-O / PRD06-RISK-P | No new child risk; convert to PRD-07 hypothesis/acceptance criterion under existing family risks. |
| `UNK-AUDIO-004` | `AUDIO` | What source-rights/provenance metadata and tooling are required for shipped/community audio packages? | **TECHNICAL — SUBSUMED** | Existing PRD06-RISK-M / PRD06-RISK-N / PRD06-RISK-O / PRD06-RISK-P | No new child risk; convert to PRD-07 hypothesis/acceptance criterion under existing family risks. |
| `UNK-WGEN-016` | `WGEN` | What controlled repair operations are allowed after a generation validation failure without compromising determinism or creating obvious artefacts? | **TECHNICAL — SUBSUMED** | Existing PRD06-RISK-E / PRD06-RISK-G / PRD06-RISK-P | No new child risk; convert to PRD-07 hypothesis/acceptance criterion under existing family risks. |
| `UNK-ECO-009` | `ECO` | How are habitat/carrying-capacity changes recomputed after voxel-scale terrain edits without rescanning entire regions? | **TECHNICAL — SUBSUMED** | Existing PRD06-RISK-E / PRD06-RISK-F / PRD06-RISK-G / PRD06-RISK-H / PRD06-RISK-I / PRD06-RISK-Q | No new child risk; convert to PRD-07 hypothesis/acceptance criterion under existing family risks. |
| `UNK-ECO-010` | `ECO` | What aggregation model preserves notable individuals and causal population change while most wildlife remains regional summary state? | **TECHNICAL — SUBSUMED** | Existing PRD06-RISK-E / PRD06-RISK-F / PRD06-RISK-G / PRD06-RISK-H / PRD06-RISK-I / PRD06-RISK-Q | No new child risk; convert to PRD-07 hypothesis/acceptance criterion under existing family risks. |
| `UNK-CIV-008` | `CIV` | What spatial/political representation supports moving borders, overlapping claims, cultural regions and legal jurisdiction without expensive per-voxel ownership maps? | **TECHNICAL — SUBSUMED** | Existing PRD06-RISK-C / PRD06-RISK-D / PRD06-RISK-F / PRD06-RISK-G / PRD06-RISK-Q | No new child risk; convert to PRD-07 hypothesis/acceptance criterion under existing family risks. |
| `UNK-CIV-009` | `CIV` | How should procedural history generate populations/settlements/factions without creating implausibly dense entity histories or huge saves? | **TECHNICAL — SUBSUMED** | Existing PRD06-RISK-C / PRD06-RISK-D / PRD06-RISK-F / PRD06-RISK-G / PRD06-RISK-Q | No new child risk; convert to PRD-07 hypothesis/acceptance criterion under existing family risks. |
| `UNK-STR-011` | `STR` | What graph representation unifies roads, maritime routes, aerial routes, cave routes and realm routes while allowing domain-specific capacity/hazard rules? | **TECHNICAL — SUBSUMED** | Existing PRD06-RISK-C / PRD06-RISK-D / PRD06-RISK-E / PRD06-RISK-F / PRD06-RISK-H / PRD06-RISK-Q | No new child risk; convert to PRD-07 hypothesis/acceptance criterion under existing family risks. |
| `UNK-STR-012` | `STR` | How are persistent site/route identities reconciled when terrain destruction or construction physically moves/removes their geometry? | **TECHNICAL — SUBSUMED** | Existing PRD06-RISK-C / PRD06-RISK-D / PRD06-RISK-E / PRD06-RISK-F / PRD06-RISK-H / PRD06-RISK-Q | No new child risk; convert to PRD-07 hypothesis/acceptance criterion under existing family risks. |
| `UNK-STR-013` | `STR` | What compact state model supports multi-session megadungeons/large wonders without storing a full copy of every generated room/block? | **TECHNICAL — SUBSUMED** | Existing PRD06-RISK-C / PRD06-RISK-D / PRD06-RISK-E / PRD06-RISK-F / PRD06-RISK-H / PRD06-RISK-Q | No new child risk; convert to PRD-07 hypothesis/acceptance criterion under existing family risks. |
| `UNK-CMB-011` | `CMB` | How should regional boss/titan pressure be simulated distantly so ecology, trade and settlements react causally without full boss AI? | **TECHNICAL — SUBSUMED** | Existing PRD06-RISK-E / PRD06-RISK-F / PRD06-RISK-G / PRD06-RISK-H / PRD06-RISK-I / PRD06-RISK-J / PRD06-RISK-K / PRD06-RISK-Q | No new child risk; convert to PRD-07 hypothesis/acceptance criterion under existing family risks. |
| `UNK-REALM-012` | `REALM` | How does the Atlas realm-network representation reconcile with final FCC-12/13 portal/resource definitions and the eventual LFE realm-transition owner? | **TECHNICAL — SUBSUMED** | Existing PRD06-RISK-A / PRD06-RISK-C / PRD06-RISK-D / PRD06-RISK-Q | No new child risk; convert to PRD-07 hypothesis/acceptance criterion under existing family risks. |
| `UNK-PROD-005` | `PROD` | What material-ecology/depletion representation efficiently connects geological/ecological resource fields to actual voxel extraction and regeneration? | **TECHNICAL — SUBSUMED** | Existing PRD06-RISK-C / PRD06-RISK-E / PRD06-RISK-F / PRD06-RISK-G / PRD06-RISK-Q | No new child risk; convert to PRD-07 hypothesis/acceptance criterion under existing family risks. |
| `UNK-ECON-002` | `ECON` | What minimal Atlas trade relationship data belongs outside Set-27 economy authority so worldgen can place coherent routes/production without duplicating live market truth? | **TECHNICAL — SUBSUMED** | Existing PRD06-RISK-C / PRD06-RISK-D / PRD06-RISK-F / PRD06-RISK-G / PRD06-RISK-Q | No new child risk; convert to PRD-07 hypothesis/acceptance criterion under existing family risks. |
| `UNK-QST-011` | `QST` | What world-history event granularity should be permanently stored versus compacted into derived summaries/evidence? | **TECHNICAL — SUBSUMED** | Existing PRD06-RISK-C / PRD06-RISK-D / PRD06-RISK-F / PRD06-RISK-G / PRD06-RISK-Q | No new child risk; convert to PRD-07 hypothesis/acceptance criterion under existing family risks. |
| `UNK-QST-013` | `QST` | How should rumours, beliefs and propaganda reference facts that later become destroyed, migrated or reinterpreted? | **TECHNICAL — SUBSUMED** | Existing PRD06-RISK-C / PRD06-RISK-D / PRD06-RISK-F / PRD06-RISK-G / PRD06-RISK-Q | No new child risk; convert to PRD-07 hypothesis/acceptance criterion under existing family risks. |
| `UNK-QST-014` | `QST` | What bounded consequence-propagation model prevents a world event from triggering an uncontrolled cascade across every connected system? | **TECHNICAL — SUBSUMED** | Existing PRD06-RISK-C / PRD06-RISK-D / PRD06-RISK-F / PRD06-RISK-G / PRD06-RISK-Q | No new child risk; convert to PRD-07 hypothesis/acceptance criterion under existing family risks. |
| `UNK-ID-008` | `ID` | What storage/index design supports millions of generated instance bindings and historical tombstones with fast reverse-reference queries? | **TECHNICAL — SUBSUMED** | Existing PRD06-RISK-C / PRD06-RISK-D / PRD06-RISK-M | No new child risk; convert to PRD-07 hypothesis/acceptance criterion under existing family risks. |
| `UNK-GOV-003` | `GOV` | Which Atlas completeness checks are hard release blockers versus warnings requiring human justification? | **GOVERNANCE / PRODUCT — NOT PROMOTED** | PRD-06/07/09 | Keep outside the technical risk register unless the later product/governance decision creates a controlled technical delta. |
| `UNK-UX-011` | `UX` | How should map/codex knowledge display uncertain or conflicting cultural claims without overwhelming the player? | **SPECIALIST / DESIGN — NOT PROMOTED** | PRD-07; later UX design | Keep open with owning canon/design/UX/LFE authority; promote later only if a concrete technical failure condition emerges. |
| `UNK-GOV-004` | `GOV` | Which Set-25 Core/Early-Access/Full-Release classifications remain current after the later FCC programme and current rebuild roadmap? | **GOVERNANCE / PRODUCT — NOT PROMOTED** | PRD-01 reconciliation; PRD-09 | Keep outside the technical risk register unless the later product/governance decision creates a controlled technical delta. |
| `UNK-GOV-005` | `GOV` | What approval authority and workflow should govern new namespaces, schemas, capabilities and relationship types in day-to-day development? | **GOVERNANCE / PRODUCT — NOT PROMOTED** | LFE/FORGE-ENG governance; Branch A/B sync | Keep outside the technical risk register unless the later product/governance decision creates a controlled technical delta. |
| `UNK-GOV-006` | `GOV` | How should field-level ownership be represented so both humans and tools can detect conflicting edits before compile time? | **GOVERNANCE / PRODUCT — NOT PROMOTED** | PRD-03/04/07; FORGE-ENG | Keep outside the technical risk register unless the later product/governance decision creates a controlled technical delta. |
| `UNK-PROG-004` | `PROG` | What initial capability library and band semantics survive FCC-12/13 and later specialist reconciliation without over-fragmentation? | **SPECIALIST / DESIGN — NOT PROMOTED** | FCC-12/13; PRD-01 delta | Keep open with owning canon/design/UX/LFE authority; promote later only if a concrete technical failure condition emerges. |
| `UNK-PROG-005` | `PROG` | Which fallback groups are global interfaces versus domain-owned contracts? | **SPECIALIST / DESIGN — NOT PROMOTED** | PRD-04; LFE | Keep open with owning canon/design/UX/LFE authority; promote later only if a concrete technical failure condition emerges. |
| `UNK-PROG-006` | `PROG` | What reachability solver can prove capability paths through recipes, knowledge, structures, trade, realms and substitutions at production scale? | **TECHNICAL — SUBSUMED** | Existing PRD06-RISK-C / PRD06-RISK-F / PRD06-RISK-G / PRD06-RISK-Q | No new child risk; convert to PRD-07 hypothesis/acceptance criterion under existing family risks. |
| `UNK-BIO-002` | `BIO` | How should pressure/depth capability bands interact with biology, equipment, magic and vehicle interiors without duplicated hazard formulas? | **TECHNICAL — SUBSUMED** | Existing PRD06-RISK-C / PRD06-RISK-D / PRD06-RISK-F / PRD06-RISK-K / PRD06-RISK-Q | No new child risk; convert to PRD-07 hypothesis/acceptance criterion under existing family risks. |
| `UNK-CIV-011` | `CIV` | How are station leases/orders/handover represented so NPC autonomy and player command coexist without RTS micromanagement? | **TECHNICAL — SUBSUMED** | Existing PRD06-RISK-C / PRD06-RISK-D / PRD06-RISK-F / PRD06-RISK-G / PRD06-RISK-Q | No new child risk; convert to PRD-07 hypothesis/acceptance criterion under existing family risks. |
| `UNK-ECON-005` | `ECON` | How should blockade/interdiction coverage be calculated against route graphs and moving fleets without expensive continuous geometry checks? | **TECHNICAL — SUBSUMED** | Existing PRD06-RISK-C / PRD06-RISK-D / PRD06-RISK-F / PRD06-RISK-G / PRD06-RISK-Q | No new child risk; convert to PRD-07 hypothesis/acceptance criterion under existing family risks. |
| `UNK-CMB-013` | `CMB` | What bounded fire/smoke/heat model is convincing across compartments without per-voxel combustion/gas simulation? | **TECHNICAL — SUBSUMED** | Existing PRD06-RISK-E / PRD06-RISK-F / PRD06-RISK-G / PRD06-RISK-H / PRD06-RISK-I / PRD06-RISK-J / PRD06-RISK-K / PRD06-RISK-Q | No new child risk; convert to PRD-07 hypothesis/acceptance criterion under existing family risks. |
| `UNK-CMB-014` | `CMB` | How should deterministic abstract naval encounters resolve ammunition, damage, crew/cargo consequences and tactical objectives so promotion does not reroll history? | **TECHNICAL — SUBSUMED** | Existing PRD06-RISK-E / PRD06-RISK-F / PRD06-RISK-G / PRD06-RISK-H / PRD06-RISK-I / PRD06-RISK-J / PRD06-RISK-K / PRD06-RISK-Q | No new child risk; convert to PRD-07 hypothesis/acceptance criterion under existing family risks. |
| `UNK-ECO-011` | `ECO` | What marine cohort model supports schools/migration/predation/fisheries at ocean scale and promotes representative actors consistently? | **TECHNICAL — SUBSUMED** | Existing PRD06-RISK-E / PRD06-RISK-F / PRD06-RISK-G / PRD06-RISK-H / PRD06-RISK-I / PRD06-RISK-Q | No new child risk; convert to PRD-07 hypothesis/acceptance criterion under existing family risks. |
| `UNK-ECO-012` | `ECO` | How do moving vessels/fishing fleets query and reserve catch from ecology summaries without race conditions or duplication? | **TECHNICAL — SUBSUMED** | Existing PRD06-RISK-E / PRD06-RISK-F / PRD06-RISK-G / PRD06-RISK-H / PRD06-RISK-I / PRD06-RISK-Q | No new child risk; convert to PRD-07 hypothesis/acceptance criterion under existing family risks. |
| `UNK-PROG-007` | `PROG` | Which maritime capability bands/providers survive the later FCC/material/recipe reconciliation and should become universal capabilities versus Set-26-only extensions? | **SPECIALIST / DESIGN — NOT PROMOTED** | FCC-12/13 + PRD-04 | Keep open with owning canon/design/UX/LFE authority; promote later only if a concrete technical failure condition emerges. |
| `UNK-MAG-010` | `MAG` | How should weather-navigation magic expose bounded requests/forecasts without letting spells bypass environmental authority or make mundane navigation irrelevant? | **TECHNICAL — SUBSUMED** | Existing PRD06-RISK-A / PRD06-RISK-C / PRD06-RISK-F / PRD06-RISK-G / PRD06-RISK-H / PRD06-RISK-Q | No new child risk; convert to PRD-07 hypothesis/acceptance criterion under existing family risks. |
| `UNK-UX-013` | `UX` | How should vessel/port/environment information be prioritised so advanced systems remain understandable without permanent dashboard overload? | **SPECIALIST / DESIGN — NOT PROMOTED** | PRD-07 | Keep open with owning canon/design/UX/LFE authority; promote later only if a concrete technical failure condition emerges. |
| `UNK-GOV-007` | `GOV` | What exact Set-25 registry IDs/major-minor compatibility rules should be assigned to XSET-001 through XSET-011? | **GOVERNANCE / PRODUCT — NOT PROMOTED** | PRD-04; LFE registry governance | Keep outside the technical risk register unless the later product/governance decision creates a controlled technical delta. |
| `UNK-ECON-006` | `ECON` | What fixed-point scales/ranges are required for prices, currency, wages, accounts, taxes and large institutional balances without overflow or wasted precision? | **TECHNICAL — SUBSUMED** | Existing PRD06-RISK-C / PRD06-RISK-D / PRD06-RISK-F / PRD06-RISK-G / PRD06-RISK-Q | No new child risk; convert to PRD-07 hypothesis/acceptance criterion under existing family risks. |
| `UNK-ECON-010` | `ECON` | How should physical currency stacks, purse balances, accounts and bullion interoperate with the authoritative inventory/container system? | **TECHNICAL — SUBSUMED** | Existing PRD06-RISK-C / PRD06-RISK-D / PRD06-RISK-F / PRD06-RISK-G / PRD06-RISK-Q | No new child risk; convert to PRD-07 hypothesis/acceptance criterion under existing family risks. |
| `UNK-SOC-001` | `SOC` | What sparse relationship-graph storage/indexing model supports millions of potential person-to-person edges while keeping named relationships persistent/queryable? | **TECHNICAL — SUBSUMED** | Existing PRD06-RISK-C / PRD06-RISK-D / PRD06-RISK-F / PRD06-RISK-G / PRD06-RISK-K / PRD06-RISK-Q | No new child risk; convert to PRD-07 hypothesis/acceptance criterion under existing family risks. |
| `UNK-SOC-004` | `SOC` | What proposition/knowledge graph representation supports truth revisions, contradictory claims, rumours and provenance at civilisation scale? | **TECHNICAL — SUBSUMED** | Existing PRD06-RISK-C / PRD06-RISK-D / PRD06-RISK-F / PRD06-RISK-G / PRD06-RISK-K / PRD06-RISK-Q | No new child risk; convert to PRD-07 hypothesis/acceptance criterion under existing family risks. |
| `UNK-SOC-008` | `SOC` | If runtime AI dialogue is eventually enabled, what local/remote provider architecture, latency budget, safety gate and privacy boundary satisfy 28H without making gameplay depend on it? | **GOVERNANCE / PRODUCT — NOT PROMOTED** | PRD-03/04/06/07; future product decision | Keep outside the technical risk register unless the later product/governance decision creates a controlled technical delta. |
| `UNK-SOC-009` | `SOC` | What semantic-intent parser/fallback UX is needed if player free-text dialogue is enabled? | **GOVERNANCE / PRODUCT — NOT PROMOTED** | PRD-07 | Keep outside the technical risk register unless the later product/governance decision creates a controlled technical delta. |
| `UNK-BIO-007` | `BIO` | What compact representation stores injuries/disease/toxin/treatment history while retaining enough evidence for UI, quests and migration? | **TECHNICAL — SUBSUMED** | Existing PRD06-RISK-C / PRD06-RISK-D / PRD06-RISK-F / PRD06-RISK-K / PRD06-RISK-Q | No new child risk; convert to PRD-07 hypothesis/acceptance criterion under existing family risks. |
| `UNK-BIO-008` | `BIO` | How should Biological Profile overlays be ordered/composed when ancestry, equipment, magic, transformation and temporary states interact? | **SPECIALIST / DESIGN — NOT PROMOTED** | PRD-04/06/07 | Keep open with owning canon/design/UX/LFE authority; promote later only if a concrete technical failure condition emerges. |
| `UNK-BIO-010` | `BIO` | Which biological values may be client-predicted safely beyond Stamina/UI trend without increasing exploit/reconciliation complexity? | **TECHNICAL — SUBSUMED** | Existing PRD06-RISK-C / PRD06-RISK-D / PRD06-RISK-F / PRD06-RISK-K / PRD06-RISK-Q | No new child risk; convert to PRD-07 hypothesis/acceptance criterion under existing family risks. |
| `UNK-AUT-017` | `AUT` | What Automation/Magic readiness adapter satisfies XSI-30-009 for powered/guided transport without letting movement own power/control truth? | **TECHNICAL — SUBSUMED** | Existing PRD06-RISK-F / PRD06-RISK-G / PRD06-RISK-Q | No new child risk; convert to PRD-07 hypothesis/acceptance criterion under existing family risks. |
| `UNK-UX-014` | `UX` | How should UI explain cross-owner failures such as 'socially accepted but physically impossible' or 'economically valid but biologically unavailable' without exposing subsystem jargon? | **SPECIALIST / DESIGN — NOT PROMOTED** | PRD-07 | Keep open with owning canon/design/UX/LFE authority; promote later only if a concrete technical failure condition emerges. |
| `UNK-ECO-014` | `ECO` | What cross-realm organism suitability/naturalisation/invasive model is sufficient without simulating full ecosystems for every transported organism? | **TECHNICAL — SUBSUMED** | Existing PRD06-RISK-E / PRD06-RISK-F / PRD06-RISK-G / PRD06-RISK-H / PRD06-RISK-I / PRD06-RISK-Q | No new child risk; convert to PRD-07 hypothesis/acceptance criterion under existing family risks. |
| `UNK-ECO-015` | `ECO` | How are realm-specific ecology cohorts represented when migration crosses portal/realm boundaries? | **TECHNICAL — SUBSUMED** | Existing PRD06-RISK-E / PRD06-RISK-F / PRD06-RISK-G / PRD06-RISK-H / PRD06-RISK-I / PRD06-RISK-Q | No new child risk; convert to PRD-07 hypothesis/acceptance criterion under existing family risks. |
| `UNK-QST-015` | `QST` | What provenance/evidence representation distinguishes Ancestral reconstruction, Somnolent prophecy, rumours and objective history without duplicating the global knowledge/history systems? | **TECHNICAL — SUBSUMED** | Existing PRD06-RISK-C / PRD06-RISK-D / PRD06-RISK-F / PRD06-RISK-G / PRD06-RISK-Q | No new child risk; convert to PRD-07 hypothesis/acceptance criterion under existing family risks. |
| `UNK-MAG-011` | `MAG` | What universal corruption-state interface allows Verdant/Somnolent/Ascendant/etc. to consume genuine Void provenance while keeping natural blight/nightmare/divine hostility distinct? | **SPECIALIST / DESIGN — NOT PROMOTED** | PRD-04/06/07 | Keep open with owning canon/design/UX/LFE authority; promote later only if a concrete technical failure condition emerges. |
| `UNK-ID-015` | `ID` | What exact rule determines when small alloy/formulation differences remain grade/composition metadata versus distinct material identities in implementation? | **SPECIALIST / DESIGN — NOT PROMOTED** | FCC-13/content calibration + PRD-04 | Keep open with owning canon/design/UX/LFE authority; promote later only if a concrete technical failure condition emerges. |
| `UNK-PROD-010` | `PROD` | What provider-tag/capability schema and indexed query structure should implement FCC-12 exact-material vs capability substitution? | **TECHNICAL — SUBSUMED** | Existing PRD06-RISK-C / PRD06-RISK-E / PRD06-RISK-F / PRD06-RISK-G / PRD06-RISK-Q | No new child risk; convert to PRD-07 hypothesis/acceptance criterion under existing family risks. |
| `UNK-PROD-013` | `PROD` | How are hazardous storage/transport compatibility checks cached/incrementally invalidated across warehouses, vehicles and portals? | **TECHNICAL — SUBSUMED** | Existing PRD06-RISK-C / PRD06-RISK-E / PRD06-RISK-F / PRD06-RISK-G / PRD06-RISK-Q | No new child risk; convert to PRD-07 hypothesis/acceptance criterion under existing family risks. |
| `UNK-UX-015` | `UX` | How should material substitution/support/hazard UI explain why an apparently stronger material is invalid or legal/knowledge-restricted without exposing raw registry internals? | **SPECIALIST / DESIGN — NOT PROMOTED** | PRD-07 | Keep open with owning canon/design/UX/LFE authority; promote later only if a concrete technical failure condition emerges. |
| `UNK-UX-016` | `UX` | How should realm-discovery UI distinguish thematic resonance/clues from actual portal access and provenance with minimal spoiler leakage? | **SPECIALIST / DESIGN — NOT PROMOTED** | PRD-07 | Keep open with owning canon/design/UX/LFE authority; promote later only if a concrete technical failure condition emerges. |
| `UNK-UX-017` | `UX` | What compact world-summary metadata allows Main Menu/My Realms to show health, version, packs and simulation information without fully loading a save? | **TECHNICAL — SUBSUMED** | Existing PRD06-RISK-C / PRD06-RISK-D / PRD06-RISK-F / PRD06-RISK-G / PRD06-RISK-O / PRD06-RISK-P | No new child risk; convert to PRD-07 hypothesis/acceptance criterion under existing family risks. |
| `UNK-REL-003` | `REL` | How will patching avoid rewriting enormous unchanged world data or re-downloading/rebuilding unaffected content? | **TECHNICAL — SUBSUMED** | Existing PRD06-RISK-D / PRD06-RISK-M / PRD06-RISK-P | No new child risk; convert to PRD-07 hypothesis/acceptance criterion under existing family risks. |
| `UNK-REL-005` | `REL` | Which storefront/platform services are target requirements versus optional adapters, and do any impose architecture constraints before release? | **GOVERNANCE / PRODUCT — NOT PROMOTED** | PRD-03; future Set42 | Keep outside the technical risk register unless the later product/governance decision creates a controlled technical delta. |
| `UNK-GOV-008` | `GOV` | Which 43+ stress-horizon themes genuinely require base-architecture extension points versus being ordinary content built on existing systems? | **GOVERNANCE / PRODUCT — NOT PROMOTED** | PRD-04/09; future review | Keep outside the technical risk register unless the later product/governance decision creates a controlled technical delta. |
| `UNK-WGEN-023` | `WGEN` | How should worldgen determinism hashes distinguish intended generator-version changes from race/order nondeterminism? | **TECHNICAL — SUBSUMED** | Existing PRD06-RISK-E / PRD06-RISK-G / PRD06-RISK-P | No new child risk; convert to PRD-07 hypothesis/acceptance criterion under existing family risks. |

# 112. Risk Duplication and Cross-Family Overlap Reconciliation

Round 9 found **no exact duplicate child titles and no duplicate child IDs**.

Some apparent overlaps are intentional because the failure is observed at different authority surfaces. Examples include:

- provider failure after semantic commit: **Q** owns transaction consequence while **H/I/J/N/O** may own a specific provider/readiness manifestation;
- migration: **C** owns semantic identity, **D** owns durability/recovery, **M** owns pack compatibility and **R** owns historical-contamination controls;
- performance/backpressure: **G** owns shared resource saturation while domain families retain domain-specific unsafe degradation outcomes;
- build/artifact evidence: **L** owns headless semantic parity while **P** owns exact artifact/dependency/support evidence;
- accessibility/presentation: **O** owns semantic preservation across profiles while **N/M** own production/mod content that must satisfy the presentation contract.

The rule is:

> **Overlap is valid when the same event threatens different authoritative invariants; duplication is invalid when two child records assert the same owner, trigger, consequence and exit condition.**

No duplicate-risk merge is required before Round 10.

# 113. Current Risk-State Reconciliation

All 263 stable child risks remain:

```text
risk_state: PROOF-REQUIRED
residual_risk: UNASSESSED — NO CURRENT PRD-08 RESULT
```

Round 9 performs **no mitigation by documentation**.

Counts remain:

```text
PROOF-REQUIRED child risks:                      263
MITIGATED by current PRD-08 evidence:              0
CLOSED by current PRD-08 evidence:                 0
ACCEPTED residual risks:                            0
ESCALATED architecture reopen candidates:           0
Implementation ADRs accepted:                       0
```

Existing architecture controls can reduce exposure, but cannot promote a risk beyond its actual evidence maturity.

# 114. PRD-07 Risk-Driven Execution Waves

Round 9 converts P0/P1 labels plus dependency topology into **execution waves**, not a rigid implementation schedule.

## WAVE 0 — Harness / Artifact / Identity Bootstrap

Principal families: **P, C, B, L, A**

Goals:

- exact build/dependency/product identity exists before comparative evidence is trusted;
- provider edition/precision/headless lanes are buildable;
- stable semantic/runtime identity harness exists;
- canonical coordinate/frame harness exists;
- architecture lint and provider-conformance hooks exist early.

Representative proofs: `02, 03, 05, 06, 10, 11, 67, 70, 73, 74`.

## WAVE 1 — Ownership / Worldgen / Derived-Spatial Safety

Principal families: **F, G, E, H, Q**

Goals:

- owners/epochs/revisions reject stale work;
- deterministic generation cannot overwrite committed edits;
- queues/backpressure remain bounded;
- collision/nav/readiness cannot become alternative truth;
- transaction commit/reservation semantics exist sufficiently for later integrated tests.

Representative proofs: `13–26, 34, 63, 68`.

## WAVE 2 — Persistence / Network / Recovery

Principal families: **D, K, Q**, with C/F/G/P prerequisites

Goals:

- one coherent checkpoint lineage;
- retry/reconnect idempotency;
- interest/backpressure repair;
- packet ACK separated from commit/durability;
- real-process recovery and migration safety.

Representative proofs: `07, 20, 35–48, 57, 58, 69`.

## WAVE 3 — Fluids / Vessels / Complex Moving Frames

Principal families: **I, J**, with A/E/F/G/H/Q/D/K prerequisites

Goals:

- bounded conserved fluid/ocean boundary;
- editable vessel hull/mass/flooding/collision;
- moving-frame occupants/navigation;
- persistence/network recovery of vessel state.

Representative proofs: `08, 27–32`.

## WAVE 4 — Forge / Content / Trust / Presentation

Principal families: **M, N, O, R**, with C/D/P/L prerequisites

Goals:

- source→bake reproducibility;
- safe data-pack boundary;
- generated-form scalability;
- client/server pack split;
- ART golden/handoff execution;
- renderer/accessibility/settings/cartography qualification;
- 312-row historical migration conformance.

Representative proofs: `49–62, 71`.

## WAVE 5 — Production Qualification & Common-Cause Closure

Principal families: **P plus every still-open consumer**

Goals:

- dependency upgrade and local-patch reproducibility;
- release diagnostics/symbol/support evidence;
- real exported artifact matrix;
- observability overhead;
- representative hardware/profile qualification.

Representative proofs: `64–66, 70–75`.

Final gate:

> **PROOF-76 — Whole-Stack Hostile Transaction Soak** runs only after prerequisite programme evidence exists.

# 115. Priority Reconciliation Rules for PRD-07

1. **P0 means proof-blocking, not “implement first in isolation.”** Dependency waves decide executable order.
2. **P1 does not mean optional.** P1 risks can block a claimed renderer, platform, migration, art-production or product-support tier.
3. **A child risk outranks its parent's earlier coarse priority for scheduling.**
4. **No risk is reduced solely because another risk shares the same proof.**
5. **A failed proof may eliminate a candidate without reopening architecture.**
6. **Architecture reopening requires evidence that an accepted boundary itself is invalid, not merely that one implementation candidate failed.**
7. **PROOF-76 cannot compensate for missing prerequisite proofs.**
8. **Historical POC/reference evidence never changes these priorities without current controlled evidence.**

# 116. Round-9 Closure Gates

| Gate | Result |
|---|---|
| A–R primary families present | **PASS — 18/18** |
| Stable child risks unique | **PASS — 263/263** |
| Child numbering continuous inside every family | **PASS — 18/18 families** |
| Exact duplicate child titles | **PASS — 0** |
| PRD-05 detailed risk refinements consumed | **PASS — 109/109** |
| PRD04 proof IDs with child consumers | **PASS — 76/76** |
| Shared PRD-07 fixtures with child consumers | **PASS — 10/10** |
| Open-routed PRD-01 unknowns audited | **PASS — 137/137** |
| Technically consequential unknowns with existing risk route | **PASS — 107/107** |
| Specialist/design unknowns deliberately retained outside PRD-06 | **PASS — 21** |
| Governance/product unknowns deliberately retained outside PRD-06 | **PASS — 9** |
| New risk families required | **PASS — 0** |
| New child risks required by reverse audit | **PASS — 0** |
| Unowned unknowns | **PASS — 0** |
| Current proof results invented | **PASS — 0** |
| Implementation ADRs accepted | **PASS — 0** |
| PRD-04/05 reopen candidates | **PASS — 0** |

# 117. Round-9 Verdict

> **ROUND 9 PASS — CROSS-REGISTER RISK COVERAGE & PRIORITY RECONCILIATION COMPLETE.**

PRD-06 now has a mechanically reconciled risk universe:

```text
18 primary families
263 stable child risks
109 / 109 PRD-05 risk refinements consumed
76 / 76 proof obligations reverse-covered
10 / 10 hostile fixture families reverse-covered
137 / 137 open-routed unknowns promotion-audited
0 new risk families required
0 new child risks required
0 unowned unknowns
0 current proof results
0 implementation ADRs
0 architecture reopen candidates
```

The remaining work in PRD-06 is **closure reconciliation**, not additional risk discovery.

Round 10 must therefore verify final source/handoff integrity, preserve all risk/proof/fixture/ADR gates, establish the PRD-07 handoff manifest and produce the PRD-06 closure candidate.

# 118. Machine-Readable Round-9 Summary

```yaml
document: PRD-06
version: v0.9
round: 9
status: WORKING
round_status: PASS
primary_risk_families: 18
stable_child_risks: 263
child_risk_counts:
  critical: 170
  high: 93
  likely: 165
  possible: 98
  p0: 226
  p1: 37
risk_seed_coverage:
  source_refinements: 109
  consumed: 109
proof_coverage:
  stable_proof_ids: 76
  with_child_consumers: 76
fixture_coverage:
  shared_fixture_families: 10
  with_child_consumers: 10
open_unknown_promotion_audit:
  total: 137
  technical_subsumed_existing_risks: 107
  specialist_design_not_promoted: 21
  governance_product_not_promoted: 9
  new_child_risks_required: 0
proof_results_created: 0
implementation_adrs_created: 0
architecture_reopen_candidates: 0
next_round: Closure Reconciliation / PRD-07 Handoff
```

---

**End of PRD-06 v0.9 — Round 9 Working Baseline**


---

# 119. Round-10 Scope — Closure Reconciliation & PRD-07 Handoff

Round 10 is the final PRD-06 control pass.

It does **not** execute technical proofs, close implementation risks, accept residual risk or choose implementation ADRs. Its purpose is to verify that PRD-06 is complete as the controlled **Technical Risk & Proof Register** and can hand the project into PRD-07 without another broad risk-discovery cycle.

The closure question is:

> **Does every technically consequential risk discovered through PRD-04/05 now have a stable PRD-06 owner, proof route, fixture route, success/exit condition and downstream decision path?**

Round 10 answers **YES**.

# 120. Final Controlled Baseline

| Controlled input | Final PRD-06 closure state |
|---|---|
| **PRD-05 evidence crosswalk** | `v1.0 CLOSURE CANDIDATE`; 580 continuous XW records; 76/76 proofs preserved |
| **Primary PRD-06 risk families** | **18 / 18 — A through R** |
| **Stable PRD-06 child risks** | **263 / 263 unique** |
| **PRD-05 detailed risk refinements** | **109 / 109 consumed** |
| **PRD-04 proof obligations** | **76 / 76 have detailed child-risk consumers** |
| **Shared hostile fixture families** | **10 / 10 have detailed child-risk consumers** |
| **PRD-01 open-routed unknowns audited** | **137 / 137** |
| **New risk families required after reverse audit** | **0** |
| **New child risks required after reverse audit** | **0** |
| **Current PRD-08 proof results** | **0** |
| **Accepted implementation ADRs** | **0** |
| **Architecture reopen candidates** | **0** |

The source artifact entering Round 10 was:

- `PRD-06_Leyforge_Technical_Risk_and_Proof_Register_WORKING_v0_9_Round9.md`
- SHA-256: `ff05547fda657e35fbe89dc234d7cbf892a8dbfade1b1e9a5a02ce1c1e0365bf`

PRD-05 paired handoff source:

- `PRD-05_Leyforge_Research_Evidence_Crosswalk_v1_0_CLOSURE_CANDIDATE_Round10.md`
- SHA-256: `30af0861a801158459820d1756fb49cdf223015b682de8df5f7acbb89add766e`

# 121. Final Risk Inventory

```text
Stable child risks: 263
CRITICAL:           170
HIGH:                93
LIKELY:              165
POSSIBLE:             98
P0:                  226
P1:                   37
```

| Family | Stable child risks |
|---|---:|
| **A** | 9 |
| **B** | 9 |
| **C** | 12 |
| **D** | 18 |
| **E** | 11 |
| **F** | 14 |
| **G** | 11 |
| **H** | 14 |
| **I** | 12 |
| **J** | 18 |
| **K** | 16 |
| **L** | 8 |
| **M** | 15 |
| **N** | 14 |
| **O** | 17 |
| **P** | 24 |
| **Q** | 19 |
| **R** | 22 |

All family sequences are continuous from `01` to their final child number.

No child-risk ID is duplicated.

No exact child-risk title is duplicated.

All 263 remain `PROOF-REQUIRED`.

# 122. Closure Meaning

`PRD-06 CLOSED FOR DISCOVERY` does **not** mean the 263 risks are resolved.

It means:

1. risk discovery has reached controlled completeness for the current architecture/source baseline;
2. every stable risk has enough structure to be tested;
3. no open technical uncertainty is ownerless;
4. further broad risk brainstorming is not required before prototype execution;
5. new risks may still be added later only through controlled evidence from PRD-07/08, implementation discoveries, dependency changes or new authoritative source deltas.

The risk-state ladder remains:

```text
PROOF-REQUIRED
      ↓
PRD-07 TESTED
      ↓
PRD-08 EVALUATED
      ↓
MITIGATED / ACCEPTED / CLOSED / REOPEN-CANDIDATE
```

Documentation alone cannot advance a risk down that ladder.

# 123. Proof Programme Handoff — 76 / 76

Every `PRD04-PROOF-01` through `PRD04-PROOF-76` has at least one detailed PRD-06 child-risk consumer.

PRD-07 therefore receives stable proof identities rather than creating new proof names casually.

The proof programme retains the established twelve macro-programmes:

- **PKG-A** — Identity / Projection / Provider Independence
- **PKG-B** — Large Coordinates / Frames / Realm Travel
- **PKG-C** — Ownership / Concurrency / Simulation Scale
- **PKG-D** — Cross-Domain Transactions
- **PKG-E** — Voxel / Collision / Navigation
- **PKG-F** — Fluid / Ocean
- **PKG-G** — Vessels
- **PKG-H** — Network / Interest / Reconnect
- **PKG-I** — Persistence / Recovery / Migration
- **PKG-J** — Forge / Content / Trust / Art
- **PKG-K** — Presentation / Settings / Accessibility
- **PKG-L** — Build / Dependency / Observability / Qualification

`PROOF-76 — Whole-Stack Hostile Transaction Soak` remains the final common-cause integration proof.

It cannot be scheduled as a substitute for missing lower-level proof results.

# 124. PRD-07 Shared Fixture Handoff — 10 / 10

PRD-07 receives the ten shared fixture families intact:

1. **FIXTURE-01** — Canonical WorldSession + Registry + Coordinate/Frame Harness
2. **FIXTURE-02** — Voxel Edit / SpatialChangeSet / Collision / Nav Harness
3. **FIXTURE-03** — Partitioned Simulation + Worker/Revision Chaos Harness
4. **FIXTURE-04** — Checkpoint / DB / Voxel-Store Crash Harness
5. **FIXTURE-05** — Authoritative Server / Reconnect / Bulk-Interest Harness
6. **FIXTURE-06** — Editable Vessel / Local Frame / Collision / Flooding Harness
7. **FIXTURE-07** — Forge Pack / Generated-Form / Safe-Mod / Art-Handoff Fixture
8. **FIXTURE-08** — Renderer / Accessibility / Settings Profile Fixture
9. **FIXTURE-09** — Build / Exported Artifact / Support / Dependency Fixture
10. **FIXTURE-10** — Combined Hostile-World Soak

Round 9 confirmed every fixture has detailed risk consumers.

PRD-07 may refine fixture implementation, but must not silently merge away the distinct failure classes they protect.

# 125. PRD-07 Execution Waves — Final Handoff

The Round-9 waves become the official initial PRD-07 planning spine.

## WAVE 0 — Harness / Artifact / Identity Bootstrap

**Principal families:** P, C, B, L, A

Purpose:

- exact artifact/dependency identity;
- semantic/runtime identity separation;
- coordinate/frame harness;
- provider-edition/precision/headless build lanes;
- architecture/provider conformance instrumentation.

Representative proof focus:

`02, 03, 05, 06, 10, 11, 67, 70, 73, 74`

## WAVE 1 — Ownership / Worldgen / Derived-Spatial Safety

**Principal families:** F, G, E, H, Q

Purpose:

- owner/revision/stale-work protection;
- deterministic generation;
- bounded concurrency/backpressure;
- collision/nav readiness;
- transaction commit/reservation foundations.

Representative proof focus:

`13–26, 34, 63, 68`

## WAVE 2 — Persistence / Network / Recovery

**Principal families:** D, K, Q

Purpose:

- coherent checkpoint lineage;
- reconnect/idempotency;
- interest/bulk transfer;
- persistence/network backpressure;
- real process recovery;
- migration safety.

Representative proof focus:

`07, 20, 35–48, 57, 58, 69`

## WAVE 3 — Fluids / Vessels / Complex Moving Frames

**Principal families:** I, J

Purpose:

- conserved bounded fluids/ocean;
- editable vessel hull/mass/flooding/collision;
- moving-frame occupants/navigation;
- vessel persistence/network recovery.

Representative proof focus:

`08, 27–32`

## WAVE 4 — Forge / Content / Trust / Presentation / Historical Migration

**Principal families:** M, N, O, R

Purpose:

- source→bake reproducibility;
- safe data-pack boundary;
- generated-form scalability;
- ART production handoff execution;
- renderer/accessibility/settings/cartography;
- FCC-13E 312-row migration conformance.

Representative proof focus:

`49–62, 71`

## WAVE 5 — Production Qualification

**Principal families:** P plus every remaining qualification consumer

Purpose:

- dependency-upgrade and local-patch reproducibility;
- symbol/support/diagnostic evidence;
- exported-artifact matrix;
- observability overhead;
- hardware/profile qualification.

Representative proof focus:

`64–66, 70–75`

## FINAL COMMON-CAUSE GATE

`PROOF-76 — Whole-Stack Hostile Transaction Soak`

Only after prerequisite evidence exists.

# 126. PRD-07 Prototype Record Contract

Every PRD-07 proof/prototype execution must produce a result record sufficient for PRD-08.

At minimum:

```yaml
proof_id:
risk_ids:
fixture_ids:
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
pass_fail_inconclusive:
unexpected_findings:
new_risk_candidates:
adr_candidates:
reopen_candidates:
```

Fields may be extended, but PRD-07 must not reduce them below what is required to determine evidence maturity and reproduce the test.

A result does **not** become a PRD-08 conclusion merely because PRD-07 labels it pass/fail.

# 127. ADR Reservation Handoff

PRD-06 reserves consequential decisions but accepts none.

The highest-impact ADR families include:

- precision / origin / coordinate representation;
- Voxel Tools Module vs GDExtension;
- partition/ownership/simulation model;
- worker proposal/revision and task lifecycle;
- cross-provider scheduler/backpressure policy;
- cross-domain transaction/reservation/idempotency architecture;
- collision/nav/fluid/vessel implementations;
- durable network protocol / interest / reconnect;
- SaveCoordinator checkpoint/journal/migration architecture;
- pack/trust/Forge/generated-form implementation;
- renderer/settings/accessibility/cartography implementation;
- build/dependency/patch/diagnostic/CI/qualification implementation.

PRD-07 may test multiple candidates.

PRD-08 may recommend/accept an ADR only when the evidence package is sufficient for the specific decision.

# 128. Architecture Reopen Gate

A failed prototype does **not** automatically reopen PRD-04 or PRD-05.

A reopen candidate requires evidence that:

1. the accepted boundary itself is infeasible or internally contradictory;
2. reasonable candidate implementations fail for the same boundary-level reason;
3. changing only the candidate implementation cannot satisfy the governing requirement;
4. the conflict is documented against exact upstream authority;
5. Branch C / engineering governance procedures for controlled reopening are followed.

Current reopen candidates remain:

```text
PRD-04: 0
PRD-05: 0
```

# 129. New-Risk Intake After PRD-06 Closure

After this closure candidate, a new risk may be added only when supported by a controlled trigger such as:

- PRD-07 empirical failure reveals a materially new failure class;
- dependency/provider upgrade introduces a new technical exposure;
- a new locked canon/system/document creates a controlled technical delta;
- implementation discovers a previously impossible interaction not subsumed by an existing risk;
- security/performance/recovery evidence shows the current decomposition is insufficient.

A new child risk must include:

- stable next ID in its existing A–R family where possible;
- failure statement;
- consequence;
- trigger;
- source/evidence lineage;
- controls;
- severity/plausibility/priority;
- proof/fixture route;
- success/exit evidence;
- ADR/residual-risk handling.

Creating a new A–R family requires stronger justification than adding a child.

# 130. Final Closure Gate Matrix

| Closure criterion | Result |
|---|---|
| PRD-05 paired evidence baseline present | **PASS** |
| A–R primary families present | **PASS — 18/18** |
| Stable child risks unique | **PASS — 263/263** |
| Child numbering continuous | **PASS — 18/18 families** |
| Detailed PRD-05 risk refinements consumed | **PASS — 109/109** |
| PRD04 proofs reverse-covered by detailed risks | **PASS — 76/76** |
| Shared PRD-07 fixtures reverse-covered | **PASS — 10/10** |
| PRD-01 open-routed unknowns promotion-audited | **PASS — 137/137** |
| Unowned technical unknowns | **PASS — 0** |
| New risk family required after Round 9 | **PASS — 0** |
| New child risk required after Round 9 | **PASS — 0** |
| PRD-07 execution-wave spine defined | **PASS** |
| PRD-07 result-record contract defined | **PASS** |
| ADR acceptance prevented before evidence | **PASS** |
| Architecture reopen gate defined | **PASS** |
| New-risk intake after closure controlled | **PASS** |
| Current PRD-08 proof results invented | **PASS — 0** |
| Implementation ADRs accepted | **PASS — 0** |
| PRD-04/05 reopen candidates | **PASS — 0** |

**Final closure score: 19 / 19 PASS.**

# 131. PRD-06 Final Verdict

> **PRD-06 v1.0 — PASS — CLOSURE CANDIDATE**

PRD-06 is complete for the current discovery/risk-definition stage.

It is fit to serve as the controlled technical-risk input to PRD-07 because:

- the risk universe is stable and mechanically reconciled;
- all detailed PRD-05 risk seeds are consumed;
- every proof and fixture has detailed risk demand;
- open unknowns are either technically subsumed or deliberately retained with specialist/governance owners;
- no documentation-only proof inflation has occurred;
- no implementation ADR has been accepted prematurely;
- no architecture reopening is currently required.

The project may now move from:

```text
WHAT CAN FAIL?
```

to:

```text
WHAT DO WE BUILD / BREAK / MEASURE TO FIND OUT?
```

That transition is the purpose of PRD-07.

# 132. Machine-Readable Round-10 Closure Summary

```yaml
document: PRD-06
version: v1.0
round: 10
status: CLOSURE_CANDIDATE
closure_status: PASS
primary_risk_families: 18
stable_child_risks: 263
risk_counts:
  critical: 170
  high: 93
  likely: 165
  possible: 98
  p0: 226
  p1: 37
prd05_risk_refinements:
  total: 109
  consumed: 109
proof_programme:
  stable_proof_ids: 76
  reverse_covered: 76
fixtures:
  shared_families: 10
  reverse_covered: 10
open_unknown_promotion_audit:
  total: 137
  unowned: 0
new_general_risk_families_required: 0
new_child_risks_required: 0
proof_results_created: 0
implementation_adrs_created: 0
architecture_reopen_candidates: 0
prd07_execution_waves: 6
final_common_cause_gate: PROOF-76
closure_criteria:
  passed: 19
  failed: 0
next_document: PRD-07
```

---

**End of PRD-06 v1.0 — Round 10 Closure Candidate**
