# C-AUD-07 — Leyforge Evidence, Verification & Acceptance Audit Standard

**Document ID:** C-AUD-07  
**Title:** Leyforge Evidence, Verification & Acceptance Audit Standard  
**Version:** v0.1  
**Status:** BRANCH C LOCK CANDIDATE — READY FOR REVIEW / ACCEPTANCE  
**Branch:** Branch C — V1 Documentation Audit & Finalisation  
**Project:** Leyforge  
**Date:** 30 August 2026  

**Parent Authority:** C-AUD-00 through C-AUD-06  
**Primary Interfaces:** PRD-00 through PRD-09; ENG-GOV-05 Testing & Verification; ENG-GOV-06 CI / Quality Gates; ENG-GOV-07 Diagnostics; ENG-GOV-10 Performance / Benchmark; B-OPS; D-ROAD gates; FCC certification; LFE; FRG-ENG/FORGE-ENG; Project Brain; automated tests; manual acceptance; historical POC evidence  
**Owns:** Branch C methodology for classifying, validating, tracing and accepting evidence used in V1 documentation certification  
**Does Not Own:** the P0–P5 proof ladder itself, test implementation, benchmark implementation, technical conclusions owned by PRD/LFE, product/canon meaning, engineering governance, or final rebuild scheduling

---

# 00. Purpose

C-AUD-07 defines what Leyforge is allowed to call evidence, what a piece of evidence actually proves, when evidence is too weak or stale for a certification claim, and how automated, manual, research, prototype and production evidence compose into a truthful V1 acceptance record.

The governing question is:

> **When Leyforge says a requirement, capability, architecture decision, migration path, performance target or player-facing behaviour is “proven”, can the project show evidence that actually supports that exact claim under relevant conditions?**

C-AUD-07 exists to prevent:

- historical success being mistaken for current qualification;
- a prototype being treated as production proof;
- a source citation being treated as runtime validation;
- a large automated test count being mistaken for coverage;
- editor-only results being treated as packaged-build proof;
- one hardware result being treated as universal scalability proof;
- headless checks replacing visual/manual acceptance;
- manual confidence replacing deterministic machine checks;
- stale evidence surviving major architecture changes without revalidation;
- failures being omitted from the certification record;
- “we tested it” becoming an unauditable statement.

---

# 01. Foundational Evidence Doctrine

### CA07-001 — Evidence Supports Claims; It Does Not Create Authority
Evidence can establish facts about implementation, technology or observed behaviour but does not independently define product canon.

### CA07-002 — Evidence Must Match the Claim
A result is valid only for claims its method, environment and scope can support.

### CA07-003 — Evidence Has Boundaries
Every material evidence artifact has conditions beyond which its conclusion may not safely be generalised.

### CA07-004 — More Evidence Is Not Automatically Better Evidence
Quantity cannot compensate for irrelevance, stale conditions or poor methodology.

### CA07-005 — Current Evidence and Historical Evidence Are Distinct
Historical evidence remains useful but must be labelled so it cannot masquerade as current qualification.

### CA07-006 — Absence of Evidence Is Not Automatic Failure
Where proof is not yet required, the state may be planned, blocked or not applicable rather than failed.

### CA07-007 — Required Evidence Cannot Be Replaced by Confidence
A mandatory proof gate remains open until the required acceptable evidence exists.

### CA07-008 — Negative Evidence Matters
Failures, regressions and rejected hypotheses are first-class evidence.

### CA07-009 — Evidence Must Be Reproducible Enough for Its Claim
High-consequence claims require enough method/context that another controlled attempt could meaningfully test the result.

### CA07-010 — Evidence Is Versioned by Context
A result is tied to the source, build, configuration, environment and requirement state under which it was produced.

---

# 02. P0–P5 Proof-Level Interface

Leyforge already uses the PRD proof ladder:

- **P0 — Idea**
- **P1 — Documentation Evidence**
- **P2 — Reference Implementation**
- **P3 — Leyforge Prototype**
- **P4 — Stress Tested**
- **P5 — Production Qualified**

### CA07-011 — C-AUD-07 Does Not Redefine P0–P5
The proof ladder remains PRD/process authority.

### CA07-012 — C-AUD-07 Audits Proof-Level Claims
If an artifact is labelled P3/P4/P5, Branch C may test whether the supporting evidence actually meets that meaning.

### CA07-013 — Proof Level Is Capability-Specific
One subsystem may reach P4 while another remains P1.

### CA07-014 — One Successful Demo Does Not Automatically Reach P3
A result must test the relevant Leyforge capability rather than merely resemble it.

### CA07-015 — P3 Requires Leyforge-Relevant Prototype Conditions
The tested scenario must represent the requirement sufficiently to justify a Leyforge prototype claim.

### CA07-016 — P4 Requires Adversarial / Scale Evidence
Stress qualification requires deliberate challenge beyond the normal happy path.

### CA07-017 — P5 Requires Production-Relevant Qualification
Production qualification requires the target implementation/environment or an explicitly accepted production-equivalent setup.

### CA07-018 — Proof Level Can Regress
Architecture change, upstream version change or discovered defect may reduce confidence until revalidated.

### CA07-019 — Proof Level Does Not Equal Requirement Priority
A low-priority feature may be P5; a critical future system may still be P1.

### CA07-020 — Proof-Level Unknown Is Preferable to Inflated Rating
Where evidence is insufficient, the project records the lower/unknown level honestly.

---

# 03. Evidence Classes

Evidence is classified by what it can demonstrate.

### CA07-021 — `AUTHORITY_SOURCE`
An authoritative design/governance/architecture source proving what is required or owned.

### CA07-022 — `DOCUMENTATION_EVIDENCE`
Official/manual/source documentation establishing technology behaviour or supported contracts.

### CA07-023 — `SOURCE_INSPECTION`
Direct inspection of implementation source, schemas, plugin code or configuration.

### CA07-024 — `REFERENCE_IMPLEMENTATION`
A working upstream/demo/example proving a capability can exist under its own conditions.

### CA07-025 — `LEYFORGE_PROTOTYPE`
A focused implementation built to test a Leyforge-specific requirement or risk.

### CA07-026 — `AUTOMATED_FUNCTIONAL_TEST`
Machine-executed verification of deterministic behaviour or invariant.

### CA07-027 — `PROPERTY / FUZZ / GENERATIVE_TEST`
Automated exploration across broad input/state spaces.

### CA07-028 — `MIGRATION_FIXTURE`
Historical/current state used to prove compatibility and semantic migration.

### CA07-029 — `INTEGRATION_TEST`
Verification across subsystem boundaries.

### CA07-030 — `END_TO_END_TEST`
Verification of a complete player/system path across multiple components.

### CA07-031 — `STRESS / SOAK_TEST`
Long-duration, high-volume or adversarial runtime evidence.

### CA07-032 — `BENCHMARK`
Quantitative performance evidence under a declared workload.

### CA07-033 — `PROFILE / TRACE`
Diagnostic evidence locating runtime cost/behaviour.

### CA07-034 — `PACKAGED_BUILD_TEST`
Evidence produced from the distributable/runtime build rather than editor-only execution.

### CA07-035 — `MANUAL FUNCTIONAL ACCEPTANCE`
Human verification of behaviour not safely or fully represented by automation.

### CA07-036 — `VISUAL / PERCEPTUAL ACCEPTANCE`
Human judgement for clipping, readability, feel, animation, presentation and related properties.

### CA07-037 — `ACCESSIBILITY ACCEPTANCE`
Evidence that alternate input/presentation requirements work in realistic interaction.

### CA07-038 — `REPRESENTATIVE_PLAYER ACCEPTANCE`
Structured observation of a representative user completing/understanding intended gameplay without live developer correction.

### CA07-039 — `SECURITY / ADVERSARIAL TEST`
Evidence produced by malformed, hostile or untrusted inputs/actors.

### CA07-040 — `PRODUCTION QUALIFICATION`
Final evidence against production-relevant target conditions and release gates.

### CA07-041 — `HISTORICAL POC EVIDENCE`
Legacy implementation results retained for regression lessons, requirements and capability confidence without current-architecture authority.

### CA07-042 — Evidence Classes May Combine
One artifact may legitimately be both packaged-build and stress evidence, for example.

---

# 04. Evidence Status

Every material evidence artifact receives an explicit status.

### CA07-043 — `PLANNED`
Evidence requirement exists but has not been executed.

### CA07-044 — `IN PROGRESS`
Execution or analysis is incomplete.

### CA07-045 — `PASS`
Observed result satisfies the declared criterion under tested conditions.

### CA07-046 — `PASS WITH LIMITATION`
Criterion passes but bounded limitations reduce generalisation.

### CA07-047 — `FAIL`
Observed result violates the declared criterion.

### CA07-048 — `INCONCLUSIVE`
Method/result does not distinguish pass from fail reliably.

### CA07-049 — `INVALID`
Execution or measurement is unusable due to method/environment/data failure.

### CA07-050 — `STALE`
Evidence was valid for an older state but relevant changes require revalidation.

### CA07-051 — `SUPERSEDED`
A newer accepted evidence artifact replaces it for the same claim.

### CA07-052 — `HISTORICAL`
Retained as provenance/regression evidence but not current qualification.

### CA07-053 — `NOT APPLICABLE`
The evidence requirement genuinely does not apply.

### CA07-054 — `WAIVED / EXCEPTED`
A governed exception explicitly permits the gate to proceed without normal evidence, only where the owning rules allow it.

---

# 05. Evidence Validity Dimensions

An evidence artifact is evaluated against applicable dimensions.

### CA07-055 — Claim Match
Does the evidence test the exact requirement or only something adjacent?

### CA07-056 — Version Match
Does it apply to the relevant code/plugin/schema/document version?

### CA07-057 — Architecture Match
Does it exercise the current intended architecture rather than a retired one?

### CA07-058 — Environment Match
Editor, headless, packaged build, server, mobile, desktop and other environments are not automatically equivalent.

### CA07-059 — Hardware Match
Hardware class and driver/runtime conditions matter where performance or compatibility is claimed.

### CA07-060 — Configuration Match
Quality profile, renderer, world settings, mods/packages and feature flags may affect validity.

### CA07-061 — Workload Match
The test must represent the scale/type of work relevant to the claim.

### CA07-062 — Data Match
Seeds, fixtures, registry state, save versions and content sets must be appropriate.

### CA07-063 — Duration Match
Short runs may not prove soak, leak, drift or long-world claims.

### CA07-064 — Concurrency Match
Single-thread/single-player tests cannot prove concurrent/multiplayer behaviour unless the claim excludes it.

### CA07-065 — Failure-Mode Match
Happy-path tests cannot prove recovery, corruption or transactional-failure requirements.

### CA07-066 — Observation Match
The evidence must measure the property being claimed rather than an unreliable proxy.

### CA07-067 — Threshold Match
The pass criterion must exist before or be justified independently of the observed result.

### CA07-068 — Repeatability
Repeated tests should produce compatible outcomes where determinism/stability is claimed.

### CA07-069 — Provenance
Build/commit/source and evidence origin must be recoverable.

### CA07-070 — Integrity
Evidence must be sufficiently protected from accidental alteration or misassociation.

---

# 06. Evidence Scope & Generalisation

### CA07-071 — Evidence Proves Tested Conditions First
Generalisation beyond tested conditions requires explicit reasoning or additional evidence.

### CA07-072 — Narrow Evidence May Still Be Valuable
A highly controlled result can close a narrow claim without proving the whole subsystem.

### CA07-073 — One Hardware Result Does Not Prove All Hardware
Performance/scalability claims must identify target class and extrapolation limits.

### CA07-074 — One Seed Does Not Prove Worldgen Robustness
Procedural claims normally require appropriate seed/sample coverage.

### CA07-075 — One Save Does Not Prove Migration Robustness
Migration requires representative historical fixtures and failure cases.

### CA07-076 — One Happy-Path Player Does Not Prove UX Robustness
Representative-user acceptance may require multiple paths/users depending on claim severity.

### CA07-077 — Headless Rendering Cannot Prove Visual Correctness
A headless pass cannot certify visual/perceptual requirements.

### CA07-078 — Editor Success Does Not Prove Packaged Runtime
Packaging, resource inclusion, permissions and release runtime may differ.

### CA07-079 — Reference Demo Success Does Not Prove Leyforge Integration
An upstream demo establishes capability evidence, not the correctness of Leyforge's architecture.

### CA07-080 — Historical POC Success Does Not Prove Rebuild Success
It may establish behavioural requirements, regression scenarios or feasibility lessons only.

---

# 07. Research / Documentation Evidence Audit

### CA07-081 — Official Primary Sources Are Preferred for Technology Facts
Engine/plugin/API behaviour should favour official/current upstream documentation/source where practical.

### CA07-082 — Secondary Sources May Support
Community reports, examples and discussions can identify risks and behaviours but require validation for critical claims.

### CA07-083 — Documentation Version Must Be Recorded
Current behaviour cannot safely rely on docs for an incompatible version.

### CA07-084 — Documentation Silence Is Not Proof of Absence
Missing documentation may create an unknown rather than a negative technology fact.

### CA07-085 — Source Inspection Can Resolve Documentation Ambiguity
Where necessary, PRD may inspect implementation source to establish actual capability/constraints.

### CA07-086 — Research Evidence Cannot Prove Leyforge Performance
External claims do not replace workload-specific measurement.

### CA07-087 — Research Findings Need Claim-Level Citation
Evidence should be attached to the technical claim it supports, not dumped into a generic bibliography.

---

# 08. Prototype Evidence Audit

### CA07-088 — Prototype Has a Named Question
Every consequential prototype should exist to resolve a specific unknown/risk.

### CA07-089 — Prototype Has Acceptance Criteria
“See if it works” is incomplete for rebuild-critical proof.

### CA07-090 — Prototype Is Minimal Enough to Diagnose
A prototype should isolate the risk sufficiently to attribute results.

### CA07-091 — Prototype Is Representative Enough to Matter
Over-simplification may invalidate the claimed Leyforge relevance.

### CA07-092 — Prototype Records Rejected Approaches
Failed approaches remain evidence and should prevent rediscovery where useful.

### CA07-093 — Prototype Success Does Not Automatically Become Production Architecture
PRD/ADR/LFE still decides the implementation architecture.

### CA07-094 — Prototype Result Must Update the Risk/Unknown
A completed experiment with no linked decision/evidence crosswalk is incomplete.

### CA07-095 — Hostile Prototype Conditions Are Required for High-Risk Claims
Streaming, worldgen, moving voxels, persistence, automation, simulation LOD and similar risks should be tested adversarially where appropriate.

---

# 09. Automated Verification Audit

### CA07-096 — Automated Tests Must Name Protected Requirements
Test suites should trace to requirements/invariants rather than become de facto hidden specifications.

### CA07-097 — Deterministic Invariants Prefer Automation
Conservation, alias cycles, reference closure, migration mapping, serialization and generated-form determinism are strong automation candidates.

### CA07-098 — Test Oracle Must Be Authoritative
Expected values must derive from accepted requirements, not from copying current implementation output blindly.

### CA07-099 — A Test Can Preserve a Bug
Passing regression tests are not proof if their expected behaviour is stale or unauthorised.

### CA07-100 — Test Count Is Not Coverage
Large counts may represent many trivial assertions against few meaningful requirements.

### CA07-101 — Tests Need Failure Visibility
A failed test must expose enough context to diagnose the violated contract.

### CA07-102 — Test Isolation Must Match Intent
Unit-like isolation cannot prove integration; integration tests should not be used where deterministic low-level invariants need precise diagnosis.

### CA07-103 — Flaky Tests Are Weak Evidence
Intermittent pass/fail behaviour must be resolved or bounded before high-confidence certification.

### CA07-104 — Skipped Tests Are Not Passes
Disabled, quarantined or environment-skipped tests must remain visible.

### CA07-105 — Expected Failures Remain Failures
A known defect can be tolerated only through an explicit governed exception/debt path.

### CA07-106 — CI Execution Strengthens Reproducibility
Required tests should eventually run through controlled gates where Branch B says they are active.

---

# 10. Property / Fuzz / Generative Evidence

### CA07-107 — Property Tests Protect Invariants
They are especially appropriate for conservation, migration, identity, generator determinism and bounded state transformations.

### CA07-108 — Input Generator Must Cover Relevant Domain
Random generation that avoids difficult cases produces false confidence.

### CA07-109 — Seeds Must Be Reproducible
Failed generated cases should retain seed/input for deterministic replay.

### CA07-110 — Large Sample Counts Need Diversity
10,000 near-identical cases do not equal broad coverage.

### CA07-111 — Exhaustive Testing Is Preferred When Feasible
Small finite identity/registry spaces may support complete enumeration.

### CA07-112 — Statistical Evidence Must Declare Confidence Limits
Where sampling is used for probabilistic claims, scope and uncertainty must be explicit.

---

# 11. Migration / Persistence Evidence

### CA07-113 — Historical Fixtures Need Known Origin
A migration fixture must identify the schema/version/registry assumptions it represents.

### CA07-114 — Fixture Integrity Matters
A fixture silently modified to fit current code invalidates historical proof.

### CA07-115 — Migration Must Verify Semantic Result
Successful parse/load is insufficient if identity/state meaning changes.

### CA07-116 — Round-Trip Evidence Is Required Where Applicable
Migrate → save current → reload should preserve the intended current state.

### CA07-117 — Failure Fixtures Matter
Corrupt, partial and unsupported-newer inputs should test safe failure behaviour.

### CA07-118 — Backup / Recovery Evidence Is Distinct
Recovery from corruption/interruption is not proven by ordinary successful saves.

### CA07-119 — Long-Lived World Evidence May Need Soak
State drift, bloat, orphan references and degradation may only appear over repeated cycles.

---

# 12. Performance / Benchmark Evidence

### CA07-120 — Benchmark Has a Defined Question
Every benchmark must answer a technical decision or acceptance criterion.

### CA07-121 — Benchmark Has Controlled Scenario
World seed, camera path, entity count, settings and workload should be reproducible where practical.

### CA07-122 — Benchmark Records Hardware / Runtime
CPU, GPU, memory, OS, renderer, engine/plugin version and relevant drivers/config must be recoverable where material.

### CA07-123 — Benchmark Records Metrics
Average alone is often insufficient; percentile/max/stutter/memory/throughput may be required.

### CA07-124 — Warmup / Measurement Window Must Be Appropriate
Startup compilation/loading should not contaminate or be hidden from the wrong claim.

### CA07-125 — Threshold Is Requirement-Driven
Targets should come from design/performance requirements or accepted technical decisions rather than post-hoc choosing a value the result happens to pass.

### CA07-126 — Performance Profiles Need Comparative Evidence
Quality tiers must show which budgets change and which authoritative outcomes remain invariant.

### CA07-127 — Regression Baseline Must Identify Baseline Build
A performance comparison without known baseline state is weak evidence.

### CA07-128 — Optimization Must Preserve Semantics
Faster results cannot pass if they violate conservation, identity or required behaviour.

### CA07-129 — One Fast Demo Is Not P5
Production qualification requires representative architecture and target conditions.

---

# 13. Stress / Soak Evidence

### CA07-130 — Stress Scenario Targets Known Limits
The test should intentionally pressure streaming, registry size, NPC count, automation graph, save size, content packages or other risk dimensions.

### CA07-131 — Soak Duration Must Match Failure Hypothesis
Leaks/drift may require long enough execution to become observable.

### CA07-132 — Failure Thresholds Are Recorded
Crash, frame-time degradation, queue growth, memory growth, incorrect state or recovery failure should have explicit interpretation.

### CA07-133 — Recovery After Stress Is Part of Evidence
A system that survives pressure but cannot return to normal state may still fail.

### CA07-134 — Stress Must Not Hide Data Corruption
Performance-only monitoring is insufficient for transaction/persistence systems.

---

# 14. Manual Functional Acceptance

### CA07-135 — Manual Testing Is Legitimate Evidence
Human testing is required where automation cannot fully evaluate the property.

### CA07-136 — Manual Acceptance Has a Script or Criterion
Unstructured “looks fine” is not strong certification evidence for consequential requirements.

### CA07-137 — Tester Observes Real Behaviour
Manual acceptance must exercise the actual system/environment appropriate to the claim.

### CA07-138 — Manual Test Records Build / Scenario
The evidence must be attributable.

### CA07-139 — Manual Failures Are Recorded
A failed visual/usability check cannot disappear because automated tests pass.

### CA07-140 — Manual Acceptance Is Not Replaced by Screenshots Alone
Screenshots may support evidence but often cannot prove interaction, timing, focus, control or lifecycle behaviour.

### CA07-141 — Manual Sign-Off Must Be Explicit
Where owner acceptance is required, the project records whether sign-off actually occurred.

---

# 15. Visual / Perceptual Acceptance

### CA07-142 — Real Renderer Is Required for Render Claims
Visual clipping, transparency, animation and readability need real rendering evidence.

### CA07-143 — Multiple Viewpoints May Be Required
Geometry, held items, structures and third-person rigs may need inspection from more than one angle.

### CA07-144 — Motion Requires Motion Evidence
A still image cannot prove animation stability, motion comfort or transitions.

### CA07-145 — Colour Alone Cannot Prove Accessibility
Non-colour differentiation requirements need explicit inspection.

### CA07-146 — Final Art Is Distinct From Semantic Readability
A prototype model may pass identity/readability requirements without being final art.

---

# 16. Accessibility Acceptance

### CA07-147 — Accessibility Evidence Tests Actual Alternative Path
A setting existing in UI does not prove it works throughout interaction.

### CA07-148 — Input Independence Requires Device Testing
Keyboard/controller/touch paths must be tested where required rather than inferred.

### CA07-149 — Focus / Navigation Requires Interaction Evidence
Static UI inspection cannot prove controller/keyboard focus flow.

### CA07-150 — Reduced Motion / Flash Requires Runtime Evidence
The setting must materially affect applicable effects.

### CA07-151 — Scale / Reflow Requires Representative Screens
Text/UI scaling must be tested on content-rich views.

---

# 17. Representative-Player Acceptance

### CA07-152 — Representative Acceptance Tests Understanding
This evidence is useful when the requirement is that a player can discover, interpret or use the system without developer coaching.

### CA07-153 — Developer Coaching Invalidates Certain Claims
If success depends on live explanation, the test cannot prove self-explanatory UX.

### CA07-154 — Observer Notes Matter
Where appropriate, record confusion, recovery path and misconceptions rather than only completion.

### CA07-155 — One Person Has Limited Generality
Claims about broad usability may require wider sampling than a single representative player.

### CA07-156 — Representative Acceptance Does Not Replace Functional Tests
A player completing the loop does not prove hidden conservation/migration invariants.

---

# 18. Security / Adversarial Evidence

### CA07-157 — Security Claims Need Hostile Inputs
Normal valid content cannot prove rejection/isolation guarantees.

### CA07-158 — Transactional Failure Must Be Observed
Malformed/oversized/untrusted content should leave prior valid state intact.

### CA07-159 — Boundary Tests Must Match Activated Risk
Player packages, network clients, scripts or external dependencies are tested when those trust boundaries exist.

### CA07-160 — Security Evidence May Require Specialist Review
Automated validation does not prove absence of all vulnerabilities.

### CA07-161 — Security Exceptions Are High Consequence
Known bypasses cannot be hidden under ordinary non-blocking test debt.

---

# 19. Packaged / Production-Environment Evidence

### CA07-162 — Packaged Build Is a Distinct Environment
Resource inclusion, permissions, paths, startup and runtime conditions may differ from editor execution.

### CA07-163 — Release Gate Evidence Uses Intended Distribution Form Where Required
A packaged/runtime acceptance criterion cannot be satisfied solely by editor tests.

### CA07-164 — Production Qualification Needs Target Configuration
Renderer, architecture, build mode and target platform must match or have an explicit equivalence rationale.

### CA07-165 — Debug Instrumentation May Affect Performance
Benchmark evidence should account for material instrumentation overhead.

### CA07-166 — Production Evidence Still Needs Diagnostics
Qualification should retain enough structured evidence to identify failures without relying on debug-only behaviour.

---

# 20. Historical POC Evidence Treatment

The historical POC manual records extensive old Summer/Godot implementation evidence, including automated test counts, seed suites, packaged benchmark results and manual acceptance procedures.

### CA07-167 — POC Evidence Is Preserved
The project should retain it because it demonstrates previously achieved behaviours and useful regression scenarios.

### CA07-168 — POC Evidence Is Not Current Architecture Qualification
Summer-era implementation cannot certify the Godot + Zylann rebuild architecture.

### CA07-169 — Behavioural Requirements May Be Extracted
Conservation, migration safety, controller navigation, settlement isolation and similar proven behaviours may remain valuable requirements.

### CA07-170 — Historical Performance Numbers Stay Historical
Old hardware/frame-time results are not current production benchmarks unless reproduced under the new architecture.

### CA07-171 — Historical Failure Lessons Remain Valuable
Known warnings, failure modes and test scripts may inform new hostile prototypes and acceptance suites.

### CA07-172 — Old Manual Sign-Off Does Not Certify New Build
Owner acceptance must be repeated where the implementation/environment materially changes.

---

# 21. Evidence Provenance Record

A material evidence artifact should be able to record:

```text
Evidence ID:
Title:
Evidence Class:
Claim / Requirement:
Source Authority:
Proof-Level Relevance:
Status:
Date:
Build / Commit:
Document / Schema Version:
Engine / Plugin Version:
Environment:
Hardware:
Configuration:
Seed / Fixture / Dataset:
Scenario:
Method:
Duration / Sample Size:
Metrics:
Threshold / Acceptance Criterion:
Observed Result:
Limitations:
Failure Details:
Artifacts / Logs / Captures:
Tester / Executor:
Owner Acceptance:
Supersedes:
Revalidate Trigger:
```

### CA07-173 — Not Every Field Applies
Only material dimensions need values.

### CA07-174 — High-Risk Evidence Requires Richer Provenance
P4/P5, persistence, identity, security and benchmark evidence need stronger context than low-risk documentation evidence.

### CA07-175 — Free-Form Notes Do Not Replace Structured Core Fields
Narrative explanation may supplement the record.

---

# 22. Evidence-to-Claim Matrix

### CA07-176 — One Claim May Need Multiple Evidence Classes
Example: persistence may require automated fixture tests, crash recovery tests and manual packaged verification.

### CA07-177 — One Artifact May Support Multiple Claims
Only where each claim is actually exercised/observed.

### CA07-178 — Evidence Coverage Is Claim-Level
A suite passing does not prove every requirement in the subsystem unless mapping exists.

### CA07-179 — Partial Evidence Must Stay Partial
A result supporting only one part of a compound requirement cannot mark the whole requirement passed.

### CA07-180 — Conflicting Evidence Is Escalated
Two credible current results that disagree require investigation rather than majority voting.

---

# 23. Evidence Freshness & Revalidation

### CA07-181 — Revalidation Trigger Is More Important Than Age Alone
Evidence is not stale merely because time passed; it becomes stale when material assumptions change.

### CA07-182 — Code/Architecture Change May Revalidate
Changes to the tested implementation can invalidate functional/performance evidence.

### CA07-183 — Requirement Change May Revalidate
A stricter or different requirement changes what must be proven.

### CA07-184 — Engine/Plugin Update May Revalidate
Upstream behaviour/performance changes may invalidate technology conclusions.

### CA07-185 — Hardware/Platform Target Change May Revalidate
Performance/compatibility evidence may need new target coverage.

### CA07-186 — Schema/Registry Change May Revalidate Migration
Old fixtures remain but current migration outcome must be retested.

### CA07-187 — Validator/Test Changes May Revalidate
A corrected test oracle can invalidate earlier pass records.

### CA07-188 — Revalidation Can Be Scoped
Only evidence materially affected by the delta must be repeated.

---

# 24. Failure Evidence & Defect Integration

### CA07-189 — Failure Is Recorded Against the Claim
A failed artifact links to the requirement/risk it invalidates.

### CA07-190 — Failure Can Lower Proof Level
A P4 claim may regress when stress exposes a correctness defect.

### CA07-191 — Reproduction Improves Diagnostic Confidence
A reproducible failure is stronger technical evidence than an unexplained anecdote.

### CA07-192 — Non-Reproducible Failure Is Not Ignored
It remains an observation/unknown until reasonably resolved.

### CA07-193 — Fix Requires Re-Test
Closing the defect record alone does not restore evidence status.

### CA07-194 — Regression Test Should Preserve Consequential Failure
Once understood, important failures should become reusable verification where practical.

---

# 25. Acceptance Authority

### CA07-195 — Evidence Executor and Acceptance Authority May Differ
The person/tool running a test need not own the decision that the evidence is sufficient.

### CA07-196 — Canon Owner Accepts Canon Meaning
Technical evidence cannot override product meaning.

### CA07-197 — PRD / Technical Authority Accepts Technical Proof
Technology/architecture evidence belongs to the technical decision process.

### CA07-198 — Branch B Governs Test / CI Compliance
Testing process and enforcement rules remain ENG-GOV authority.

### CA07-199 — Branch C Accepts V1 Evidence Sufficiency
Branch C determines whether required evidence obligations for documentation certification are truthfully satisfied.

### CA07-200 — Branch D Consumes Component Acceptances
Roadmap gates record the accepted result rather than independently judging all underlying evidence.

---

# 26. Evidence Finding Taxonomy

### EVD-01 — Claim/Evidence Mismatch
Evidence does not test the claim it is attached to.

### EVD-02 — Stale Evidence
Relevant assumptions changed.

### EVD-03 — Wrong Environment
Evidence comes from an environment that cannot prove the target claim.

### EVD-04 — Wrong Version
Build/plugin/schema version mismatch invalidates relevance.

### EVD-05 — Insufficient Workload
Scale or scenario is too weak.

### EVD-06 — Insufficient Duration
Test cannot support soak/long-state claim.

### EVD-07 — Insufficient Sample Diversity
Sampling is too narrow for claimed breadth.

### EVD-08 — Missing Acceptance Criterion
No defensible pass/fail rule exists.

### EVD-09 — Post-Hoc Threshold
Criterion appears chosen to fit the observed result.

### EVD-10 — Missing Provenance
Build/config/method cannot be reconstructed sufficiently.

### EVD-11 — Historical-as-Current
Legacy evidence is presented as current qualification.

### EVD-12 — Prototype-as-Production
P2/P3 evidence is presented as P5.

### EVD-13 — Reference-Demo-as-Leyforge
Upstream demo is presented as integration proof.

### EVD-14 — Test-Count-as-Coverage
Numerical assertion count substitutes for requirement mapping.

### EVD-15 — Automated-as-Manual
Machine checks substitute for required perceptual/human acceptance.

### EVD-16 — Manual-as-Automated
Human observation substitutes for deterministic invariants better proven mechanically.

### EVD-17 — Editor-as-Package
Editor success is presented as packaged/runtime proof.

### EVD-18 — Flaky / Non-Deterministic Evidence
Result cannot be relied upon under claimed repeatability.

### EVD-19 — Invalid Test Oracle
Expected behaviour is stale/unauthorised.

### EVD-20 — Missing Negative Evidence
Known failures are excluded from qualification.

### EVD-21 — Unclosed Failed Evidence
A failure exists but gate/document is still marked passed without governed resolution.

### EVD-22 — Evidence Scope Overreach
Claim generalises beyond tested conditions.

### EVD-23 — Missing Manual Sign-Off
Owner acceptance is required but absent.

### EVD-24 — Missing Revalidation
Known material delta occurred after evidence.

### EVD-25 — Systemic Evidence Integrity Failure
Evidence records are too incomplete/unreliable to support V1 certification.

---

# 27. Severity Guidance

### CA07-201 — Low-Risk Provenance Defects May Be AUD-1/AUD-2
Minor metadata omissions may be corrected without changing conclusion.

### CA07-202 — Invalid Proof of a Real Requirement Is AUD-3+
If evidence sufficiency changes certification status, severity rises.

### CA07-203 — False Persistence/Security/Identity Proof Is AUD-4+
High-consequence correctness claims require strong evidence integrity.

### CA07-204 — Systemic False-Pass Culture Is AUD-5
If the corpus cannot distinguish planned, historical and actually passing evidence, V1 certification is not trustworthy.

---

# 28. Evidence Coverage States

### CA07-205 — `PROVEN`
Required evidence exists and validly satisfies the current criterion.

### CA07-206 — `PROVEN WITH LIMITATION`
Claim is supported within an explicit narrower boundary.

### CA07-207 — `SUPPORTED`
Evidence increases confidence but does not satisfy final proof requirement.

### CA07-208 — `PLANNED`
Evidence strategy exists but execution is future work.

### CA07-209 — `GAP`
Required proof is absent.

### CA07-210 — `FAILED`
Available evidence contradicts the requirement/criterion.

### CA07-211 — `INCONCLUSIVE`
Evidence cannot settle the claim.

### CA07-212 — `STALE`
Prior proof needs revalidation.

### CA07-213 — `DEFERRED`
Evidence becomes required only at an explicitly future activation milestone.

### CA07-214 — `NOT APPLICABLE`
No evidence requirement applies.

### CA07-215 — `HISTORICAL ONLY`
Evidence is preserved but cannot satisfy current qualification.

---

# 29. Evidence Audit Procedure

### Phase 1 — Select Claim / Gate
Identify the exact requirement, technical claim or certification criterion.

### Phase 2 — Resolve Authority
Confirm who owns the meaning and who owns evidence acceptance.

### Phase 3 — Determine Required Proof Level
Consume PRD/D-ROAD/ENG-GOV requirements; do not invent a new P-rating.

### Phase 4 — Determine Acceptable Evidence Classes
Choose documentation, prototype, automated, benchmark, manual, packaged or mixed proof appropriate to the claim.

### Phase 5 — Gather Evidence
Collect current and historical artifacts separately.

### Phase 6 — Validate Provenance
Build/version/environment/configuration/method.

### Phase 7 — Validate Claim Match
Check that observed property matches the requirement.

### Phase 8 — Validate Scope
Check workload, scale, duration, sample and boundaries.

### Phase 9 — Check Conflicting / Negative Evidence
Include known failures and rejected approaches.

### Phase 10 — Classify Coverage
PROVEN / SUPPORTED / GAP / FAILED / etc.

### Phase 11 — Create EVD Finding If Needed
Route to appropriate owner.

### Phase 12 — Re-Test / Revalidate
Close only when evidence is valid for the current claim.

---

# 30. Verification Strategy Completeness

### CA07-216 — High-Risk Requirement Has a Proof Strategy
Before implementation freeze, the project should know how critical behaviour will eventually be verified.

### CA07-217 — Proof Strategy Identifies Environment
Editor/headless/package/server/device requirements are explicit.

### CA07-218 — Proof Strategy Identifies Evidence Mix
Automation/manual/benchmark/prototype responsibilities are separated.

### CA07-219 — Proof Strategy Identifies Activation Milestone
Deferred tests say when they become mandatory.

### CA07-220 — Proof Strategy Identifies Failure Interpretation
The project knows what result reopens which authority/gate.

### CA07-221 — Proof Strategy Avoids Impossible Tests
Requirements should be reformulated/routed if they cannot be verified meaningfully.

---

# 31. ENG-GOV / B-OPS Interface

### CA07-222 — ENG-GOV-05 Governs Testing Practice
C-AUD-07 audits V1 evidence sufficiency but does not replace the engineering testing standard.

### CA07-223 — ENG-GOV-06 Governs CI / Quality Gates
Required automated evidence should enter CI when the applicable activation milestone says so.

### CA07-224 — ENG-GOV-07 Governs Diagnostics
Evidence/logging must respect structured diagnostic rules.

### CA07-225 — ENG-GOV-10 Governs Benchmark Engineering
C-AUD-07 checks whether benchmark evidence is sufficient for the V1 claim.

### CA07-226 — B-OPS Debt Remains Truthful
A planned validator is not represented as current evidence.

### CA07-227 — Certified Branch B Baseline Is Evidence of Governance Coherence
It does not prove every future implementation complies until implementation evidence exists.

---

# 32. PRD Interface

### CA07-228 — PRD-05 Is the Evidence Crosswalk Owner
Technical claims should ultimately map to supporting/refuting evidence.

### CA07-229 — PRD-06 Converts Evidence Gaps Into Risk
Missing proof for architecture-critical claims should become explicit risk/proof work.

### CA07-230 — PRD-07 Executes Hostile Prototypes
Required prototypes should be designed from the risk register.

### CA07-231 — PRD-08 Records Results / ADR Evidence
Conclusions must feed actual technical decisions.

### CA07-232 — PRD-09 Certifies Discovery Closure
C-AUD-07 later audits that technical-canon evidence claims are consistent with the closed discovery record.

### CA07-233 — Working PRD Evidence Is Provisional
Current PRD-01 extraction may inform the framework but does not become final evidence closure.

---

# 33. FCC / Content-Certification Interface

### CA07-234 — Canon Certification Uses Source Reconciliation Evidence
FCC matrices, authority maps and fidelity audits are evidence for content coherence.

### CA07-235 — Content Certification Does Not Require Runtime Proof for Purely Semantic Claims
A realm name/ownership decision may be certified from authoritative sources.

### CA07-236 — Runtime Handoffs Require Later Technical Evidence
Portal recovery, save migration, suitability evaluation and related implementation claims need PRD/LFE/testing evidence.

### CA07-237 — Source Gap Is Not a Failed Runtime Test
Missing semantic authority is routed through C-AUD-02/03 rather than “tested” into existence.

---

# 34. Branch D Interface

### CA07-238 — Gates Require Named Evidence
D-ROAD pass criteria should point to the evidence/certification that supports them.

### CA07-239 — Gate Cannot Pass on Planned Evidence
A mandatory predecessor marked planned does not satisfy a required completed proof.

### CA07-240 — Gate Reopens on Material Invalidating Evidence
New failures or stale proof can reopen a previously passed gate under D-ROAD rules.

### CA07-241 — D-ROAD-05 Consumes Evidence Health
Final readiness must distinguish proven, deferred and missing evidence honestly.

### CA07-242 — Branch D Does Not Reinterpret Technical Results
It records accepted evidence status from the owning authority.

---

# 35. Project Brain Interface

### CA07-243 — Brain Indexes Evidence
The Brain may expose evidence class, claim, status, proof level, build, limitation and revalidation trigger.

### CA07-244 — Evidence Is Searchable From Requirement
A contributor should be able to navigate requirement → proof.

### CA07-245 — Reverse Evidence Query Is Supported
A test/benchmark should reveal what claim it exists to support.

### CA07-246 — Historical Evidence Is Visibly Historical
Old POC results must not appear in the same current-pass view without status distinction.

### CA07-247 — Stale Evidence Becomes Health Debt
Brain/validators may flag changed sources/builds that invalidate evidence links where mechanically possible.

### CA07-248 — Brain Does Not Upgrade Proof Level
Dashboards report owner-approved evidence state.

---

# 36. Delta Reconciliation

### CA07-249 — Requirement Delta Reopens Evidence
A changed claim may require new acceptance criteria or tests.

### CA07-250 — Implementation Delta Reopens Functional Evidence
Material code/architecture changes invalidate affected current proofs.

### CA07-251 — Upstream Technology Delta Reopens Technology Evidence
Engine/plugin changes may require documentation/source/prototype refresh.

### CA07-252 — Performance Delta Reopens Benchmarks
Meaningful hardware/config/renderer/workload changes require scoped remeasurement.

### CA07-253 — Migration Delta Reopens Fixtures
Changed identity/schema/migration rules require affected fixture reruns.

### CA07-254 — Evidence Delta May Reopen Architecture
A failed high-risk prototype can invalidate PRD/LFE assumptions.

### CA07-255 — Final Freeze Requires No Known Unprocessed Evidence Delta
All V1-relevant evidence changes must be incorporated or explicitly excluded/deferred.

---

# 37. Individual Document Evidence Gate

A V1 document that makes consequential proof/qualification claims may certify only when applicable conditions are satisfied:

```text
[ ] each material proof claim has identifiable evidence
[ ] evidence class is appropriate
[ ] evidence status is explicit
[ ] proof-level claims match PRD P0–P5 meaning
[ ] build/version provenance is sufficient
[ ] architecture/environment match is valid
[ ] workload/scale/duration match is valid
[ ] acceptance threshold is explicit where required
[ ] known failures/limitations are represented
[ ] historical evidence is clearly separated
[ ] automated tests trace to requirements
[ ] manual acceptance is retained where required
[ ] packaged/runtime evidence exists where required
[ ] performance evidence records relevant hardware/config
[ ] migration fixtures preserve historical origin
[ ] stale evidence is not presented as current
[ ] required owner sign-off exists
[ ] revalidation triggers are recorded where material
[ ] no blocking EVD finding remains
```

---

# 38. Whole-Corpus Evidence Gate

Before `LEYFORGE DOCUMENTATION V1.0 — GLOBAL CORPUS LOCKED`, Branch C must be able to certify:

```text
[ ] semantic/canon certification claims have source evidence
[ ] rebuild-critical technical claims have PRD evidence state
[ ] P0–P5 ratings are not inflated
[ ] high-risk P3/P4/P5 claims have appropriate artifacts
[ ] LFE/FORGE-ENG architecture claims trace to accepted PRD evidence
[ ] registry/persistence/migration claims have planned/current verification
[ ] high-risk deterministic invariants have automation paths
[ ] player-facing visual/usability requirements retain manual acceptance paths
[ ] performance/scalability claims have benchmark strategy/evidence
[ ] security/external-content boundaries have adversarial evidence strategy
[ ] packaged/runtime criteria are not satisfied solely by editor evidence
[ ] historical Summer/POC evidence is preserved but clearly historical
[ ] known failed evidence is represented
[ ] stale evidence is either revalidated or downgraded
[ ] required acceptance authorities are known
[ ] no unresolved EVD-25 systemic evidence-integrity failure remains
[ ] no unresolved in-scope AUD-4/AUD-5 evidence defect remains
[ ] D-ROAD can consume the evidence/certification state without reconstructing it
```

---

# 39. Representative Leyforge Evidence Cases

## 39.1 Zylann / Voxel Tools Demo Testing

A smooth upstream/demo experience can provide useful reference or early Leyforge-relevant capability evidence.

It does **not** by itself prove:

- final Leyforge worldgen;
- long-world persistence;
- moving voxel vessels;
- full simulation LOD;
- multiplayer authority;
- final water architecture;
- production performance across target hardware.

The exact proof level is determined by how representative the test actually was.

## 39.2 Historical Summer POC Regression Suite

The POC manual records thousands of automated checks, extended seed suites, save tests, accessibility/controller checks and packaged performance results.

These are strong **historical POC evidence** for:

- previously achieved behaviour;
- valuable regression scenarios;
- performance-test methodology;
- manual acceptance scripts;
- risk discovery.

They are not current P5 proof for the clean rebuild.

## 39.3 Registry Determinism

A generated-form identity contract should eventually combine:

- semantic authority from FCC-13;
- automated collision/determinism validation;
- reference-closure validation;
- migration fixtures;
- save/reload tests.

One class of evidence alone is insufficient for the whole claim.

## 39.4 Visual First-Person Body

Headless checks can prove scene/script/resource structure.

They cannot alone prove:

- camera clipping;
- body composition;
- held-item readability;
- motion feel.

Real-renderer manual/perceptual acceptance remains required.

## 39.5 Performance Profile

A performance profile passes only if:

- its target workload is benchmarked;
- degradation occurs within allowed visual/simulation-detail bounds;
- authoritative resource/NPC/persistence behaviour remains invariant.

A faster profile that changes game truth is not successful performance evidence.

## 39.6 Save Recovery

Ordinary save/load does not prove recovery.

Evidence should separately exercise:

- interrupted write;
- corrupt current save;
- backup selection;
- migration;
- re-save/reload;
- unsupported-newer handling;
- semantic identity preservation.

---

# 40. C-AUD-07 Acceptance Gate

C-AUD-07 may be theoretically locked when the project accepts that it has defined:

```text
[ ] evidence doctrine
[ ] P0–P5 interface
[ ] evidence classes
[ ] evidence statuses
[ ] evidence validity dimensions
[ ] evidence scope/generalisation rules
[ ] research/documentation evidence rules
[ ] prototype evidence rules
[ ] automated verification rules
[ ] property/fuzz/generative rules
[ ] migration/persistence evidence rules
[ ] benchmark rules
[ ] stress/soak rules
[ ] manual functional acceptance
[ ] visual/perceptual acceptance
[ ] accessibility acceptance
[ ] representative-player acceptance
[ ] security/adversarial evidence
[ ] packaged/production evidence
[ ] historical POC treatment
[ ] evidence provenance record
[ ] evidence-to-claim matrix
[ ] freshness/revalidation rules
[ ] failure/defect integration
[ ] acceptance authority
[ ] EVD-01 through EVD-25 taxonomy
[ ] severity guidance
[ ] evidence coverage states
[ ] audit procedure
[ ] verification-strategy completeness
[ ] ENG-GOV/B-OPS interface
[ ] PRD interface
[ ] FCC interface
[ ] Branch D interface
[ ] Brain interface
[ ] delta reconciliation
[ ] individual-document evidence gate
[ ] whole-corpus evidence gate
[ ] representative Leyforge cases
```

---

# 41. Immediate Handoff

After C-AUD-07 is accepted, proceed to:

> **C-AUD-08 — Leyforge Legacy, Supersession & Archive Disposition Audit Standard v0.1**

The Branch C chain becomes:

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
C-AUD-06 — Are contracts complete enough to build?
        ↓
C-AUD-07 — Is the claimed proof actually valid?
        ↓
C-AUD-08 — What old material must be retired, preserved, migrated or archived?
```

---

# 42. Foundational Statement

> **Leyforge does not earn confidence by collecting the largest possible pile of tests, prototypes and reports. It earns confidence by knowing exactly what each piece of evidence proves, what it does not prove, and when that proof must be repeated.**

A passing result without scope is trivia.

A passing result tied to authority, requirement, build, environment, criterion and limitations is evidence.

---

**End of C-AUD-07 v0.1**
