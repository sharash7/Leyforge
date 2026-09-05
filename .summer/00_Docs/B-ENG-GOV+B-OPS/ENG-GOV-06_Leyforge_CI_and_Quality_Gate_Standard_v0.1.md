# ENG-GOV-06 — Leyforge CI / Quality Gate Standard

**Document ID:** ENG-GOV-06  
**Title:** Leyforge CI / Quality Gate Standard  
**Version:** v0.1  
**Status:** THEORETICALLY LOCKED  
**Authority Domain:** Engineering Governance — Continuous Integration & Quality Gates  
**Parent Authority:** ENG-GOV-00 — Leyforge Engineering Constitution  
**Related Standards:** ENG-GOV-04, ENG-GOV-05, ENG-GOV-08, ENG-GOV-09, ENG-GOV-10, ENG-GOV-12, ENG-GOV-13, ENG-GOV-14  
**Project:** Leyforge

---

## 00. Purpose and Scope

ENG-GOV-06 defines how Leyforge converts verification requirements into automated integration gates.

It governs CI horizons, blocking semantics, mainline protection, test selection, reproducibility, toolchain control, CI security, registry and persistence gates, build/package validation, performance signals, flaky-check handling, artifact retention, quality-gate exceptions and Project Brain integration.

CI enforces governance where practical. It does not replace engineering judgement, architecture review or manual acceptance.

---

## 01. CI as an Enforcement Boundary

### EG06-001 — CI Enforces Governance Without Replacing Engineering Judgement
Automated quality gates should enforce machine-verifiable requirements where practical. A green CI result provides bounded evidence, not universal correctness.

### EG06-002 — Local and CI Verification Use the Same Underlying Project Commands
Humans, agents and CI should invoke shared project-owned build, validation and test entry points where practical.

### EG06-003 — Leyforge Uses Four Principal Verification Horizons
Change/PR → FAST + affected integration. Mainline → broader integrated regression. Scheduled/deep → expensive seed, soak, stress and compatibility suites. Release candidate → full certification evidence.

### EG06-004 — Change/PR Gates Prioritise Fast Feedback
Normal change validation should quickly detect source, schema, registry, build, unit, subsystem and relevant integration failures.

### EG06-005 — Mainline Runs Broader Integrated Regression
Main receives broader verification so interactions missed by selective change-level testing can still be detected.

### EG06-006 — Expensive Deep Verification Runs Outside Ordinary Change Latency Unless Risk Requires It
Large worldgen corpora, long simulations, stress tests and broad migration corpora normally run scheduled/deep unless risk requires them earlier.

### EG06-007 — Release Candidates Use a Dedicated Certification Pipeline
Release certification combines applicable automated regression, compatibility, packaged-build, performance, security and manual acceptance evidence.

---

## 02. Gate Severity

### EG06-008 — CI Checks Have Explicit Blocking Semantics
**REQUIRED** blocks integration unless an authorised exception exists. **ADVISORY** remains visible but does not block. **INFORMATIONAL** is diagnostic/status evidence only.

### EG06-009 — Critical Correctness Gates Fail Closed
Duplicate stable IDs, invalid persistence schemas, failed required migrations, compilation failure, core regression failure and security-critical validation block normal integration.

### EG06-010 — New or Noisy Checks May Begin Advisory
New validators may start advisory while calibrated, then be promoted deliberately when reliable.

---

## 03. Mainline Protection

### EG06-011 — Required Gates Protect the Main Integration Boundary
Where repository hosting supports it, applicable REQUIRED checks gate normal merges into main.

### EG06-012 — Required Gates Cannot Be Casually Bypassed
A failed required gate requires correction or an authorised exception/emergency path.

### EG06-013 — Emergency Bypasses Are Exceptional and Traceable
Bypasses record what was bypassed, why, replacement evidence, risk, authority and follow-up repair.

---

## 04. Test Selection

### EG06-014 — CI May Select Tests by Affected Paths and Modules
Once a machine-readable module map exists, CI should use ownership and dependencies to select relevant verification.

### EG06-015 — Selective Testing Retains a Universal Safety Floor
Every ordinary change still receives a minimal universal safety set such as repository validation, critical schema checks, basic build/load and core FAST regressions.

### EG06-016 — High-Risk Changes Override Normal Selection Optimisation
Class D/E changes may force broader verification regardless of diff size or touched paths.

---

## 05. Clean Environment and Reproducibility

### EG06-017 — CI Runs in Controlled Clean Environments
CI proves the project does not depend on forgotten workstation state, undeclared plugins, stale generated files or local-only configuration.

### EG06-018 — Important Toolchain Versions Are Declared
Relevant versions of Godot, test frameworks, Python/tooling, native toolchains, formatters, schema tools and CI dependencies are controlled where variation matters.

### EG06-019 — CI Dependencies Are Reproducible
Mutable `latest` dependencies are avoided for critical pipeline behaviour.

### EG06-020 — Caches May Improve Speed but Must Not Become Correctness Dependencies
A clean-cache run must remain capable of producing a correct build.

---

## 06. CI Security

### EG06-021 — CI Uses Least Privilege
Jobs receive only the permissions and secrets required for their purpose.

### EG06-022 — Untrusted Contributions Do Not Automatically Receive Sensitive Credentials
Untrusted code paths must not have implicit access to repository or release secrets.

### EG06-023 — Third-Party CI Actions and Scripts Are Dependencies
Important workflow actions and remote scripts should be known, reviewed, pinned and updated deliberately.

### EG06-024 — Secret Scanning Should Become an Automated Gate Where Practical
Reliable secret-scanning should detect accidental credentials where practical.

---

## 07. Source Quality Gates

### EG06-025 — Mechanical Source Rules Become Automated Gates
Stable formatters, linters and static checks should enforce mechanical source rules.

### EG06-026 — Syntax, Parse and Applicable Type Failures Block Integration
Leyforge-owned source must pass applicable language and engine validation.

### EG06-027 — New Warnings Are Actionable by Default
Warnings are fixed or explicitly classified rather than silently accepted.

### EG06-028 — Approved Unavoidable Warnings Are Centrally Identifiable
Known unavoidable warnings use a controlled allowlist or equivalent mechanism where practical.

---

## 08. Repository and Architecture Gates

### EG06-029 — Repository Structure Receives Automated Validation Where Practical
Future validators may detect forbidden root clutter, duplicate module IDs, invalid generated files, missing metadata and broken authority references.

### EG06-030 — Dependency-Direction Violations Become Blocking Once Validation Is Trusted
Reliable architecture dependency violations should fail CI.

### EG06-031 — Third-Party Modification Boundaries Should Be Detectable Where Feasible
CI should help identify unexpected modifications to upstream/vendor-owned areas.

---

## 09. Registry and Identity Gates

### EG06-032 — Registry Integrity Validation Is Mandatory Once Registries Exist
Applicable validators detect duplicate stable IDs, malformed IDs, unresolved references, invalid aliases, incompatible schema and other ENG-GOV-09 violations.

### EG06-033 — Generated Registry Output Must Match Its Authoritative Source
Committed generated registry artifacts must not drift from their generator/source.

---

## 10. Persistence Gates

### EG06-034 — Save/Schema Changes Automatically Trigger Persistence Verification
Relevant changes require applicable schema validation, migration fixtures, save/reload and recovery verification.

### EG06-035 — Fresh Worlds Alone Cannot Certify Persistence Changes
Class D persistence work requires compatibility evidence with supported historical data.

### EG06-036 — Supported Migration Fixtures Are Protected Regression Inputs
Old-save fixtures must not be silently rewritten to make migration tests pass.

---

## 11. Determinism and World Generation

### EG06-037 — Determinism-Critical Changes Trigger Reproducibility Checks
Declared deterministic systems verify the same declared inputs and versions reproduce the same results.

### EG06-038 — World-Generation Changes Trigger the Appropriate Seed Tier
Normal changes run fast corpora; main, scheduled and release pipelines run broader corpora according to risk.

---

## 12. Build and Packaging

### EG06-039 — CI Proves the Project Can Build Outside the Editor
Suitable horizons must load/parse, execute headless checks and build required native components without manual editor interaction.

### EG06-040 — Packaged-Build Validation Is Required at Appropriate Milestones
Packaged testing verifies relevant resource inclusion, startup, critical runtime paths, configuration, input and save behaviour.

---

## 13. Performance Gates

### EG06-041 — CI Provides Lightweight Performance-Regression Signals Where Practical
Gross regressions in critical systems should be detectable through stable lightweight checks.

### EG06-042 — Authoritative Benchmark Gates Follow ENG-GOV-10 Methodology
Hard benchmark claims require calibrated methodology.

### EG06-043 — Performance Noise Must Not Become a Flaky Blocking Gate
Noisy environments use informational/advisory results or controlled hardware.

---

## 14. Flakiness, Retries and Failure Classification

### EG06-044 — Automatic Reruns Must Not Hide Flaky Tests
Original failures remain visible even when infrastructure retries are used.

### EG06-045 — Infrastructure and Product Failures Are Distinguished
CI should distinguish test, build, validation, runner, timeout and cancellation failures.

### EG06-046 — Flaky Checks Follow ENG-GOV-05 Quarantine Rules
Quarantine remains visible, temporary and tracked.

### EG06-047 — Automated Jobs Have Bounded Execution Expectations
Each job has an appropriate timeout or bounded expected duration.

### EG06-048 — Timeout Regressions Are Investigated
Repeatedly increasing timeouts without understanding slowdown is prohibited as a normal response.

---

## 15. Parallelism and Cancellation

### EG06-049 — Independent CI Work Runs in Parallel Where Safe
Static checks, tests, validation and builds may run concurrently when isolated.

### EG06-050 — Parallel Jobs Do Not Depend on Undeclared Shared Mutable State
Jobs exchange explicit artifacts and inputs rather than relying on accidental filesystem persistence.

### EG06-051 — Superseded CI Runs May Be Cancelled Safely
Stale pipelines for older branch revisions may be cancelled where appropriate.

---

## 16. Artifacts and Evidence

### EG06-052 — Failed High-Value Jobs Preserve Diagnostic Artifacts
Useful logs, reports, seeds/configuration, crash dumps, migration output, screenshots, manifests and benchmark data should be retained where relevant.

### EG06-053 — Successful Certification Jobs Preserve Reproducible Evidence
Formal milestones retain enough version/configuration evidence to establish what was certified.

### EG06-054 — Artifact Retention Is Intentional
Retention reflects forensic value and storage cost.

---

## 17. CI Configuration Governance

### EG06-055 — CI Configuration Is Production Engineering Code
Workflow definitions, build scripts and validators receive review, ownership, testing and version control.

### EG06-056 — Changes That Weaken Critical Gates Receive Elevated Scrutiny
Removing tests, weakening required checks, reducing migration coverage, broadening allowlists or disabling security validation is reviewed according to the protection removed.

### EG06-057 — CI Must Not Depend Silently on Mutable External Scripts
Critical pipeline logic lives in the repository or known pinned dependencies.

---

## 18. Manual Quality Gates

### EG06-058 — CI Never Fabricates Manual Acceptance
Automation may track manual sign-off status but cannot claim human testing occurred when it did not.

### EG06-059 — Manual Gates Reference Their Evidence
Required manual acceptance records structured completion evidence.

---

## 19. Governance Debt and Enforcement Maturity

### EG06-060 — Missing Automation Is Recorded
Rules currently enforced through review/manual procedure may be recorded as governance debt until automation exists.

### EG06-061 — Missing Automation Becomes Blocking Where Manual Enforcement Is Unsafe
High-consequence invariants require stronger automation when manual protection is insufficient.

---

## 20. Project Brain Integration

### EG06-062 — Project Health Dashboards Should Derive from CI Evidence Where Practical
The Project Brain should eventually surface build, migration, deep-worldgen, quarantine and certification health from real pipeline evidence.

### EG06-063 — Consequential CI Failures May Become Reusable Project Knowledge
Systemic failures worth remembering should be promoted into Brain Failure, Antipattern, Skill or Procedure records.

---

## CI Horizon Model

```text
LOCAL DEVELOPMENT
      ↓
CHANGE / PR GATE
      ↓
MAINLINE GATE
      ↓
SCHEDULED / DEEP GATE
      ↓
RELEASE CERTIFICATION
```

---

## Closing Principle

Leyforge CI exists to protect trusted project state.

Fast gates encourage frequent integration. Deep gates provide wider confidence without slowing every trivial change. Critical correctness failures block. Noisy checks mature before becoming mandatory. Clean environments expose hidden dependencies. Retries never conceal flakiness. Security follows least privilege. CI configuration is itself critical infrastructure. Manual acceptance is tracked but never fabricated. Project Brain health should increasingly reflect machine-produced evidence rather than manually maintained optimism.
