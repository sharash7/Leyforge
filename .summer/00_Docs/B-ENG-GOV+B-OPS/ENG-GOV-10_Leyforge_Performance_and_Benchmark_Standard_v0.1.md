# ENG-GOV-10 — Leyforge Performance / Benchmark Standard

**Document ID:** ENG-GOV-10  
**Title:** Leyforge Performance / Benchmark Standard  
**Version:** v0.1  
**Status:** THEORETICALLY LOCKED  
**Authority Domain:** Engineering Governance — Performance / Benchmarking  
**Parent Authority:** ENG-GOV-00 — Leyforge Engineering Constitution  
**Related Standards:** ENG-GOV-01, ENG-GOV-05, ENG-GOV-06, ENG-GOV-07, ENG-GOV-11, ENG-GOV-12, ENG-GOV-15  
**Project:** Leyforge

---

## 00. Purpose and Scope

ENG-GOV-10 defines how Leyforge measures, reasons about and governs performance.

It covers performance budgets, benchmark methodology, hardware classes, workload scenarios, frame timing, latency, throughput, memory, startup, streaming, simulation scale, world generation, persistence performance, profiling, regression thresholds, benchmark history and certification evidence.

The governing principle is:

> Architect for known scale. Measure before optimising. Optimise evidence-backed bottlenecks. Verify that optimisation preserves authoritative behaviour.

---

## 01. Performance Evidence

### EG10-001 — ENG-GOV-10 Governs Performance Evidence
Performance claims must be backed by repeatable engineering evidence appropriate to the claim.

### EG10-002 — Performance Claims Require Measurable Evidence
“Feels fast” and isolated FPS screenshots are not sufficient evidence.

### EG10-003 — Important Systems Eventually Receive Explicit Performance Budgets
Relevant budgets may include frame time, simulation time, chunk generation, streaming latency, save/load duration, memory footprint, queue depth and server tick cost.

Exact values are established by PRD/LFE/prototype evidence rather than invented by governance.

---

## 02. Architecture and Optimisation

### EG10-004 — Known Scale Constraints Influence Architecture
Known Leyforge scale, including large worlds, persistent settlements, NPC populations, automation, voxel streaming, procedural generation and future multiplayer, is a legitimate architecture input.

### EG10-005 — Speculative Micro-Optimisation Is Discouraged
Complexity is not justified by hypothetical tiny gains without evidence.

### EG10-006 — Optimisation Targets Demonstrated or Strongly Evidenced Bottlenecks
Preferred loop:

```text
observe
→ measure
→ identify bottleneck
→ form hypothesis
→ optimise
→ re-measure
→ verify correctness
```

### EG10-007 — Performance Optimisation Must Not Silently Change Canonical Outcomes
Faster but incorrect is not successful optimisation.

### EG10-008 — Performance Profiles May Reduce Presentation Cost Without Redefining Authoritative Truth
Visual scalability may change rendering detail where design permits. Authoritative simulation changes require explicit architecture.

---

## 03. Frame Performance

### EG10-009 — Frame Performance Is Primarily Evaluated Using Frame Time
Milliseconds per frame are the principal engineering measure; FPS remains a presentation convenience.

### EG10-010 — Average FPS Alone Is Insufficient
Percentile and tail behaviour matter.

### EG10-011 — Hitching and Tail Latency Are First-Class Performance Defects
High average FPS does not excuse recurring stalls.

### EG10-012 — Performance Reports Use Percentiles Where Appropriate
Typical metrics may include p50, p95 and p99.

### EG10-013 — Maximum Values Are Interpreted Cautiously
Maximums are useful diagnostics but may be contaminated by unrelated system noise.

---

## 04. Benchmark Identity and Scenario

### EG10-014 — Consequential Benchmarks Have Stable IDs
Examples:

```text
BENCH-WORLDGEN-001
BENCH-STREAMING-004
BENCH-SETTLEMENT-012
BENCH-SAVE-003
```

### EG10-015 — Benchmark Identity Is Independent of Descriptive Name
Names may improve while historical benchmark identity remains stable.

### EG10-016 — Every Benchmark Defines Its Scenario
Relevant scenario metadata may include seed, world state, population, machines, loaded chunks, simulation tier, player state, graphics profile, resolution and content version.

### EG10-017 — Representative and Stress Workloads Are Distinguished
Useful categories include TYPICAL, HEAVY, STRESS and PATHOLOGICAL.

A pathological test must not be presented as ordinary gameplay.

---

## 05. Reproducibility and Warm-Up

### EG10-018 — Benchmark Inputs Are Reproducible Where Practical
Fixed seeds, fixtures, configurations and routes should be used when repeatability matters.

### EG10-019 — Procedural Benchmarks Preserve Generation Provenance
Worldgen benchmarks record seed, generation version and relevant content/configuration.

### EG10-020 — Benchmarks Define Warm-Up Behaviour
Shader compilation, resource loading, runtime initialisation and cache warm-up are explicitly handled where relevant.

### EG10-021 — Cold-Start and Warm-State Measurements Are Separate When Both Matter
They answer different questions and must not be conflated.

---

## 06. Sampling and Variance

### EG10-022 — Benchmarks Collect Enough Observations to Represent Behaviour
Single-frame or single-event measurements are normally insufficient.

### EG10-023 — Benchmark Duration Captures Relevant State Transitions
Streaming tests move through chunk boundaries; settlement tests span meaningful simulation cycles.

### EG10-024 — High-Value Benchmarks Use Repeated Runs When Variance Matters
Repeated runs distinguish signal from luck.

### EG10-025 — Outlier Runs Are Investigated Rather Than Discarded for Convenience
Outliers may reveal real defects or environmental contamination.

---

## 07. Hardware and Environment

### EG10-026 — Meaningful Results Identify Hardware
Relevant metadata may include CPU, GPU, RAM, storage, OS, driver and power state.

### EG10-027 — Leyforge Uses Representative Hardware Classes
Eventually these may include minimum target, baseline target, recommended, high-end and development reference systems.

### EG10-028 — Development Hardware Does Not Define Minimum Supported Performance
A fast development machine does not establish minimum-spec success.

### EG10-029 — Authoritative Benchmarks Control Avoidable Environmental Noise
Background load, power profile, thermal state, drivers, resolution and OS conditions are controlled where relevant.

### EG10-030 — Thermal Throttling Is Measurement Context
Thermally constrained results must not be compared as though conditions were identical.

---

## 08. Budgets and Regression Limits

### EG10-031 — Absolute Targets and Relative Regression Limits Are Separate
A benchmark may have both an absolute budget and a maximum tolerated regression from baseline.

### EG10-032 — Passing the Absolute Target Does Not Grant Unlimited Regression
Large degradation remains relevant even when a result is still technically under budget.

### EG10-033 — Tiny Changes Below Measurement Confidence Do Not Become Blocking Regressions
Noise must not masquerade as precision.

### EG10-034 — Hard Regression Thresholds Account for Measured Variance
Thresholds derive from real benchmark noise characteristics.

### EG10-035 — Different Benchmarks May Use Different Regression Boundaries
Frame time, memory and throughput need not share one universal percentage rule.

---

## 09. Baselines

### EG10-036 — Benchmarks Compare Against Identifiable Baselines
Examples include main, last certified release, pre-optimisation commit or a known reference build.

### EG10-037 — Baselines Cannot Silently Move to Hide Regressions
Cumulative slowdown must remain visible.

### EG10-038 — Baseline Updates Are Deliberate and Historical
Legitimate changes to expected performance are recorded.

### EG10-039 — Hardware Replacement Starts a New Calibrated Baseline Series
Raw numbers from unlike machines are not treated as directly comparable.

---

## 10. Benchmark Scales

### EG10-040 — Leyforge Uses Multiple Benchmark Scales
Useful classes include MICRO, COMPONENT, INTEGRATED, WORLD/SCENARIO, SOAK and RELEASE.

### EG10-041 — Microbenchmarks Do Not Prove Whole-System Improvement
A faster helper may produce no meaningful game-level gain.

### EG10-042 — Whole-Game Benchmarks Do Not Replace Targeted Profiling
Integrated slowdown still requires diagnosis.

---

## 11. Profiling and Bottleneck Evidence

### EG10-043 — Meaningful Optimisation Begins with Profiling or Equivalent Evidence
Appropriate profilers, traces and scoped metrics should identify the bottleneck.

### EG10-044 — Consequential Optimisation Records the Bottleneck and Intervention
The project should be able to explain what was slow, why, what changed and what improved.

---

## 12. CPU, GPU and Rendering

### EG10-045 — Rendering Performance Distinguishes CPU and GPU Bottlenecks
Low FPS is not automatically a GPU problem.

### EG10-046 — GPU Benchmarks Define Rendering Configuration
Resolution, backend, profile, upscaling and VSync/caps are recorded where relevant.

### EG10-047 — Frame Limiting Is Disabled or Accounted for Where Required
A capped FPS value cannot expose faster frame times.

---

## 13. World Generation and Streaming

### EG10-048 — Worldgen Performance Uses Representative Procedural Workloads
Terrain, planning, biome evaluation, preparation, allocation, throughput and tail latency may be measured separately.

### EG10-049 — Worldgen Corpora Include Difficult and Historical Seeds
Pathological seeds become regression scenarios.

### EG10-050 — Streaming Benchmarks Include Motion Through the World
Stationary rendering does not validate streaming.

### EG10-051 — Streaming Includes Worst Supported Traversal Patterns
Fast travel, boats, flight, teleports and realm entry are included where supported.

---

## 14. Simulation Scale and Combined Load

### EG10-052 — Simulation Benchmarks State Entity/System Scale
Results must identify the populations and workloads being simulated.

### EG10-053 — Near and Far Simulation Are Benchmarked Separately Where Implementations Differ
Their performance characteristics are measured independently.

### EG10-054 — Integrated Benchmarks Include Realistic Simultaneous Workload
Streaming, simulation, automation, weather, combat, UI and persistence may compete for total budget.

### EG10-055 — Major Subsystems Eventually Own Shares of Relevant Budgets
Budget ownership supports architecture planning.

### EG10-056 — Budget Borrowing Is Permitted When Deliberate and Whole-System Requirements Still Pass
Local budgets are tools rather than immutable laws.

---

## 15. Memory and Allocation

### EG10-057 — Memory Is a First-Class Performance Dimension
Resident memory, peak usage, allocation rate, cache size and GPU memory are measured where relevant.

### EG10-058 — Long-Term Memory Growth Receives Soak Verification
Leaks, retained chunks, queues and unbounded caches must be detectable.

### EG10-059 — Peak Memory Matters
Transient peaks can still crash supported machines.

### EG10-060 — High-Frequency Allocation Behaviour Is Observable Where It Causes Hitching
Allocation/collection effects should be measured in hot paths.

---

## 16. Persistence and Startup Performance

### EG10-061 — Persistence Has Dedicated Performance Benchmarks
Snapshot, serialization, write, migration, validation, load and recovery can be measured independently.

### EG10-062 — Save Optimisation Never Weakens Persistence Integrity
ENG-GOV-08 safety remains authoritative.

### EG10-063 — Startup and World Entry Are Measurable User-Facing Performance
Process start, registry load, menu-ready, world load and first interactive frame may be separate metrics.

---

## 17. Forge and Tool Responsiveness

### EG10-064 — Forge Tools Receive Interactive Performance Budgets
3D editing, model manipulation, previews, validation, icon generation and package loading are performance-sensitive.

### EG10-065 — Interactive Tools Distinguish Throughput From Responsiveness
Long background work may be acceptable while UI freezes are not.

### EG10-066 — Offloading Work Is Not an Optimisation If It Merely Moves the Stall
Backlog and latency still matter.

### EG10-067 — Async Systems Measure Queue Depth and Completion Latency
Chunk generation, meshing, pathfinding, saving and content processing should expose queue health where relevant.

---

## 18. Concurrency and Scaling Curves

### EG10-068 — Concurrency Improvements Measure Throughput, Latency and Contention
More threads do not automatically equal faster performance.

### EG10-069 — Scalable Systems Are Measured Across Increasing Workload
Scaling curves reveal linear, quadratic or worse cost growth.

### EG10-070 — Poor Scaling Matters Even When Current Small Workloads Pass
Prototype-scale success does not excuse an obviously dangerous curve.

### EG10-071 — Long-Running State Accumulation Receives Performance Verification
Large histories, explored worlds, destroyed structures and long server uptime may alter cost.

### EG10-072 — Persistent Storage Growth Is Measured Where Unbounded Expansion Is Possible
Save, cache and log growth should remain understandable.

---

## 19. Player-Facing and Multiplayer Latency

### EG10-073 — Latency-Sensitive Actions Receive Interaction-Oriented Measurements
Block edits, inventory actions, Forge manipulation, UI opening and realm transition may require response-latency evidence.

### EG10-074 — Future Multiplayer Performance Separates Simulation, Network and Presentation Latency
Server tick, RTT, serialization, replication and client rendering are distinct concerns.

---

## 20. Scalability Settings

### EG10-075 — Performance Settings Have Declared Purpose
Each setting should identify what cost it reduces and whether it affects presentation or authoritative behaviour.

### EG10-076 — Hardware Profiles Tune Related Settings Coherently
Players should not need to understand dozens of obscure options merely to obtain reasonable performance.

---

## 21. Benchmark Configuration Integrity

### EG10-077 — Benchmark Configuration Is Recorded or Versioned
Changed view distance, quality, simulation scale or other workload configuration creates materially different evidence.

### EG10-078 — Performance Improvements Must Not Secretly Weaken the Workload
Reducing NPCs, view distance, caves, simulation or other work must be disclosed.

### EG10-079 — Rendering-Quality Changes Are Disclosed
Lower quality may be a useful scalability result but is not equivalent-rendering optimisation.

### EG10-080 — Controlled Benchmarks Avoid Uncontrolled Scenario Nondeterminism
Random exploration and reproducible benchmarks are separate modes.

---

## 22. Metrics and Instrumentation

### EG10-081 — Machine-Consumed Performance Metrics Have Stable Identities
Examples may include `perf.frame.cpu_ms`, `perf.worldgen.chunk_ms` or `perf.save.snapshot_ms`.

### EG10-082 — Metric Names and Meanings Are Unambiguous
Each metric describes what stage and domain it measures.

### EG10-083 — Instrumentation Overhead Is Accounted For
Deep profiling can perturb the system under measurement.

### EG10-084 — Important Benchmark Runs Preserve Inspectable Evidence
Relevant results may include summaries, raw samples, hardware, scenario, versions, configuration and profile captures.

### EG10-085 — Reports Compare Candidate, Baseline and Budget
A result should expose what changed and whether it remains inside required limits.

---

## 23. Regression Disposition and Performance Debt

### EG10-086 — Confirmed Meaningful Regressions Require Disposition
They are fixed, accepted with rationale, deferred with tracked debt or resolved by an evidence-backed budget revision.

### EG10-087 — Budgets Are Not Silently Widened Because Code Became Slower
Budget changes require explicit justification.

### EG10-088 — Known Performance Risk May Be Tracked as PERF-DEBT
Debt records should identify system, evidence, risk and trigger for reconsideration.

### EG10-089 — Performance Debt Becomes Blocking When Required Scale Cannot Meet Its Budget
At that point it is a production requirement failure.

---

## 24. Optimisation Complexity

### EG10-090 — Performance Gains Are Weighed Against Engineering Complexity
Small gains do not justify extreme maintenance cost without compelling evidence.

### EG10-091 — Complexity-Heavy Optimisation Requires Stronger Evidence
Greater long-term cost demands greater demonstrated benefit.

### EG10-092 — Obsolete Optimisation Complexity May Be Removed
Old hacks are not sacred when evidence no longer supports them.

### EG10-093 — Upstream Performance Patches Require Evidence Before Increasing Fork Divergence
Profile first, compare extension-layer options and weigh benefit against future merge cost.

---

## 25. Comparative Prototypes and Ownership

### EG10-094 — Architecture-Critical Performance Questions May Use Comparative Prototypes
Competing strategies should be tested under equivalent workload and environment.

### EG10-095 — Consequential Benchmarks Have Identifiable Ownership
Their system, requirement and update criteria must be discoverable.

### EG10-096 — Benchmarks Have Lifecycle State
Useful states include ACTIVE, ADVISORY, CERTIFICATION, SUPERSEDED and HISTORICAL.

### EG10-097 — Material Benchmark-Definition Changes Are Reviewed Separately From Results
A benchmark may not be made easier merely to recover a passing result.

---

## 26. Coding-Agent Rules

### EG10-098 — AI Agents Do Not Claim Optimisation Without Before/After Evidence
Measured performance work requires measured comparison.

### EG10-099 — AI Agents Distinguish Expected From Measured Improvement
Prediction and execution evidence must not be conflated.

### EG10-100 — AI Agents May Not Change Workload, Budget or Methodology Merely to Pass
Any benchmark-definition change must be explicit.

---

## 27. CI and Historical Trend

### EG10-101 — Fast CI Performance Checks Detect Gross Regressions
Shared runners should not block on tiny differences below environmental confidence.

### EG10-102 — Hard Release Gates Use Controlled Calibrated Environments
Strong thresholds require known measurement variance.

### EG10-103 — Benchmark History Reveals Long-Term Trends
Creep, regressions, optimisations and hardware transitions remain visible.

### EG10-104 — Methodology Discontinuities Are Marked
Changed scenarios or measurement methods break historical comparability and must be identified.

---

## 28. Project Brain Integration

### EG10-105 — Performance Health May Feed the Project Brain From Benchmark Evidence
Status should be machine-derived where practical.

### EG10-106 — Successful Optimisation Discoveries Become Reusable Knowledge
Patterns, procedures and useful shortcuts should preserve their benchmark evidence.

### EG10-107 — Failed Optimisation Attempts May Be Preserved When Their Lesson Is Reusable
Antipatterns should prevent future rediscovery of known bad approaches.

---

## 29. Certification

### EG10-108 — Performance Certification Uses Representative Supported-Scale Evidence
Empty-world success is not representative certification.

### EG10-109 — Certification Records Demonstrated Hardware and Configuration
Future comparisons require known context.

### EG10-110 — Unexplained Blocking Regressions Prevent Performance Certification
A materially red critical benchmark must be fixed or explicitly resolved.

### EG10-111 — Performance Is Accepted Only When Speed, Required Scale, Correctness and Maintainability Coexist

```text
CORRECT
+
FAST ENOUGH
+
SCALABLE ENOUGH
+
MEASURED REPRODUCIBLY
+
MAINTAINABLE ENOUGH
=
SUCCESSFUL PERFORMANCE ENGINEERING
```

---

## Closing Principle

Leyforge performance engineering is evidence-driven.

Known scale shapes architecture. Profiling identifies bottlenecks. Benchmarks use stable identities and reproducible workloads. Tail latency and hitching matter. Hardware and configuration are recorded. Baselines and budgets remain historically honest. Performance settings do not silently alter authoritative truth. Complexity must earn its place. Upstream divergence requires demonstrated value.

Successful and failed optimisation lessons become reusable project knowledge so Leyforge does not repeatedly pay to rediscover the same performance truths.
