# B-OPS-01 — Leyforge Governance Rule Enforcement Matrix

**Document ID:** B-OPS-01  
**Title:** Leyforge Governance Rule Enforcement Matrix  
**Version:** v0.1  
**Status:** OPERATIONALISATION BASELINE  
**Branch:** Branch B — Engineering Governance  
**Parent Authority:** B-OPS-00 + ENG-GOV-00 through ENG-GOV-15  
**Project:** Leyforge

---

## 00. Purpose

B-OPS-01 defines how Leyforge maps engineering governance rules to actual enforcement mechanisms, evidence, applicability triggers, exceptions, debt and compliance state.

The source ENG-GOV standards remain authoritative for rule text.

B-OPS-01 answers:

> What protects this rule, when does that protection become mandatory, and what evidence proves current compliance?

---

# 01. Matrix Authority and Ownership

### BOP01-001 — Every Normative ENG-GOV Rule Is Indexable
All EG00–EG15 normative rules must be addressable by stable rule ID.

### BOP01-002 — Source Standards Retain Rule-Text Authority
The matrix references rules; it does not become a duplicate rule corpus.

### BOP01-003 — Matrix Records the Owning Standard
Every rule entry identifies the ENG-GOV document that owns it.

### BOP01-004 — Matrix May Record a Conceptual Owner
Cross-standard reinforcement should still identify the principal conceptual authority.

### BOP01-005 — Reinforcing Rules May Point to One Conceptual Owner
Agent, CI or persistence-specific restatements do not create competing rule definitions.

### BOP01-006 — Matrix Changes Cannot Redefine ENG-GOV Semantics
Operational mapping is subordinate to the governance corpus.

---

# 02. Rule Strength

### BOP01-007 — Rule Strength Is Recorded Separately From Enforcement Mechanism
MUST/SHOULD/MAY/PROHIBITED are normative strength, not enforcement type.

### BOP01-008 — MUST Does Not Mean AUTO
A mandatory semantic rule may require review or testing rather than deterministic validation.

### BOP01-009 — PROHIBITED Rules Receive Explicit Negative Enforcement Where Practical
Machine checks should detect forbidden states when reliable.

### BOP01-010 — SHOULD Rules May Become Blocking in Specific Certified Contexts
The matrix may record context-specific gate treatment without rewriting the source rule.

### BOP01-011 — Advisory Guidance Is Not Reported as Mandatory Compliance
Guidance and requirements remain distinguishable.

---

# 03. Enforcement Classes

### BOP01-012 — AUTO Means Deterministic Machine Validation
A validator can directly determine compliance for the encoded condition.

### BOP01-013 — TEST Means Executed Behaviour Verification
Compliance depends on running a test/suite/scenario.

### BOP01-014 — REVIEW Means Semantic Inspection
Architecture, code, data or evidence requires human/agent reasoning.

### BOP01-015 — MANUAL Means Real Manual/Perceptual/Environmental Verification
Automation cannot truthfully claim the result.

### BOP01-016 — TRACE Means Durable Evidence/Linkage Must Exist
IDs, ADRs, work records, migration provenance or equivalent traceability are required.

### BOP01-017 — PROCESS Means Workflow Compliance
Branching, approval, review or permission procedure is the control.

### BOP01-018 — ADVISORY Means Non-Blocking Engineering Guidance
Advisory evidence may still influence review.

### BOP01-019 — One Rule May Use Multiple Enforcement Classes
Complex invariants can require validator + tests + review + traceability.

### BOP01-020 — One Mechanism May Protect Multiple Rules
The system avoids artificial one-rule-one-script design.

---

# 04. Enforcement Mechanism Identity

### BOP01-021 — Consequential Enforcement Mechanisms May Have Stable Engineering IDs
Stable IDs support CI, Brain, diagnostics and auditability.

### BOP01-022 — Validator Identities May Use a VAL Family
Examples: `VAL-REGISTRY-ID`, `VAL-SAVE-SCHEMA`.

### BOP01-023 — Governed Test Suites May Use a TEST Family
Stable test identities are useful when referenced by governance.

### BOP01-024 — CI/Release Gates May Use a GATE Family
Gate identities remain distinct from individual tests.

### BOP01-025 — Review/Process Checks May Use a CHECK Family
Semantic checks can still have durable identities.

### BOP01-026 — Manual Verification Contracts May Use a MAN Family
Manual requirements can be referenced without pretending they are automated.

### BOP01-027 — Exact Mechanism ID Grammar Is Implementation Detail Until Tooling Freezes It
The identity concept is locked; final syntax may be refined before first operational use.

---

# 05. Applicability

### BOP01-028 — Every Rule Entry Can Record Applicability
Rules may be universal, capability-triggered, release-triggered or environment-specific.

### BOP01-029 — Applicability Triggers Are Explicit
A rule becomes operationally required when its governed boundary becomes real.

### BOP01-030 — NOT YET APPLICABLE Requires a Genuine Missing Capability
It is not a synonym for unfinished implementation.

### BOP01-031 — Stable-Identity Protection Activates When Durable IDs Exist
Registry identity cannot wait until late production.

### BOP01-032 — Persistence Migration Protection Activates Before V1 Persistent Formats Become Depended Upon
Migration enforcement precedes long-lived save dependency.

### BOP01-033 — External-Package Security Protection Activates Before Real Untrusted Package Exposure
Security gates arrive before public/mod/Forge package exposure.

### BOP01-034 — Network Security/Authority Protection Activates Before Real Multiplayer Exposure
Networking controls scale with actual capability introduction.

### BOP01-035 — Applicability Changes Are Historical Operational Changes
Activation is recorded rather than silently assumed.

---

# 06. Enforcement Maturity

### BOP01-036 — Enforcement Maturity Is Separate From Rule Authority
A rule can be authoritative while automation is still missing.

### BOP01-037 — PLANNED Means Required Enforcement Is Identified but Not Operational
The rule remains active.

### BOP01-038 — PARTIAL Means Some Protection Exists
Remaining gaps are explicit.

### BOP01-039 — ACTIVE Means the Intended Mechanism Is Operational
Evidence can be generated in normal workflow.

### BOP01-040 — CERTIFIED Means the Mechanism Itself Has Been Verified for Certification Use
Certification strength exceeds simple implementation.

### BOP01-041 — Maturity Changes Require Evidence
An agent cannot mark a validator ACTIVE simply because code exists.

---

# 07. Compliance State

### BOP01-042 — COMPLIANT Means Current Evidence Satisfies the Applicable Rule
Evidence is current enough for the decision boundary.

### BOP01-043 — COMPLIANT WITH APPROVED EXCEPTION Means a Valid Waiver Governs the Known Deviation
The underlying rule is not rewritten as inherently satisfied.

### BOP01-044 — PARTIAL / ENFORCEMENT DEBT Means Protection Is Incomplete
The rule may be active while automation/evidence remains unfinished.

### BOP01-045 — NONCOMPLIANT Means Current Evidence Shows the Rule Is Violated
This is distinct from missing evidence.

### BOP01-046 — NOT YET APPLICABLE Means the Governed Capability/Boundary Does Not Yet Exist
Applicability is truthful and scope-specific.

### BOP01-047 — Unknown Evidence Does Not Default to COMPLIANT
Lack of proof is represented honestly.

---

# 08. Coverage vs Satisfaction

### BOP01-048 — Enforcement Coverage and Current Compliance Are Separate
Having a validator does not prove the repository currently passes it.

### BOP01-049 — Coverage Reports Which Mechanisms Exist
Coverage is an engineering capability measure.

### BOP01-050 — Satisfaction Reports Current Evidence Outcome
Pass/fail/exception/debt reflects repository state.

### BOP01-051 — Brain Dashboards Should Expose Both Where Useful
This prevents misleading green status.

---

# 09. Governance Debt

### BOP01-052 — Missing Required Enforcement Creates GOV-DEBT
Known missing automation becomes tracked state.

### BOP01-053 — GOV-DEBT Records the Rule and Current Protection
Manual/review fallback must remain visible.

### BOP01-054 — GOV-DEBT Records Desired Enforcement
The missing validator/test/gate is explicit.

### BOP01-055 — GOV-DEBT Records Risk and Activation Milestone
Priority follows when the boundary becomes relevant.

### BOP01-056 — Deferred Enforcement Is Legitimate Before Applicability When Risk Permits
The project does not front-load every future validator.

### BOP01-057 — Deferred Enforcement Is Not Permission to Expose the Boundary Unsafely
Debt becomes blocking at its activation milestone.

---

# 10. Priority Model

### BOP01-058 — Enforcement Priority Is Based on Consequence × Likelihood × Automability
Ease alone does not define implementation order.

### BOP01-059 — Foundational Identity and Persistence Protections Receive Early Priority
Stable IDs, reference integrity and save safety are high-value controls.

### BOP01-060 — Generated-Source Consistency Receives Early Protection
Derived outputs should not silently drift from their sources.

### BOP01-061 — Basic Build/Test Health Receives Early Protection
A working feedback loop is foundational infrastructure.

### BOP01-062 — Secret/Path/Ownership Boundaries Receive Early Protection When Relevant
Security and upstream provenance are not delayed past exposure.

### BOP01-063 — Low-Risk Style Automation Does Not Displace Higher-Risk Enforcement Work
Formatting is useful but not more important than data safety.

---

# 11. Domain Enforcement Mapping

### BOP01-064 — Persistence Rules Map to Persistence-Specific Evidence
Migration fixtures, round-trip, interruption, recovery, schema rejection and generation consistency are examples.

### BOP01-065 — Registry Rules Map to Whole-Registry Validation
Duplicate IDs, namespaces, aliases, reference closure, generated collisions and deterministic resolution are examples.

### BOP01-066 — Security Rules Map to Hostile-Input and Boundary Validators
Path containment, archive/resource limits, permission manifests and malformed-input suites are examples.

### BOP01-067 — Dependency Rules Map to Inventory/Pin/Provenance/Integration Evidence
Not every dependency judgement is machine-decidable.

### BOP01-068 — Performance Rules Distinguish Noisy CI Signals From Controlled Certification
Shared CI catches gross regressions; calibrated environments establish strong performance gates.

### BOP01-069 — Manual Visual/Usability Rules Remain Manual Where Required
Automation never fabricates perceptual evidence.

---

# 12. Exceptions

### BOP01-070 — Waivers Are Linked to the Exact Rule/Mechanism They Affect
Anonymous suppressions are prohibited.

### BOP01-071 — Approved Waivers May Alter Compliance Reporting Without Rewriting the Rule
Exception state is explicit.

### BOP01-072 — Expired Waivers Stop Authorising Suppression
CI/process must not continue honoring them.

### BOP01-073 — Exception Records Remain Governed by ENG-GOV-14
B-OPS-01 only maps their operational effect.

---

# 13. Machine-Readable Matrix

### BOP01-074 — The Operational Matrix Should Eventually Have Structured Machine-Readable Source
YAML or equivalent is preferred if it serves tooling well.

### BOP01-075 — Human-Readable Markdown Remains Available
Machine state does not replace human inspection.

### BOP01-076 — Reverse Queries Are a Design Requirement
The system should answer rule→mechanism and mechanism→rule queries plus risk/debt/waiver queries.

### BOP01-077 — Governance Health Must Prioritise Critical Gaps Rather Than Vanity Percentages
A single Class E gap may outweigh many low-risk automated rules.

### BOP01-078 — Agents May Update Evidence/Maturity but May Not Weaken Rules or Enforcement Mappings to Obtain Green Status
Operationalisation cannot become a bypass around governance.

---

# 14. Conceptual Matrix Record

```yaml
rule_id: EG09-011
owner: ENG-GOV-09
concept: registry_identity_uniqueness
strength: MUST
risk_floor: D

applicability:
  state: active
  trigger: durable_registry_ids_exist

enforcement:
  - id: VAL-REGISTRY-ID
    class: AUTO
    maturity: planned

  - id: TEST-REGISTRY-COLLISION
    class: TEST
    maturity: planned

review:
  class: REVIEW
  required_for:
    - stable_id_change

exceptions:
  governed_by: ENG-GOV-14

evidence:
  current_state: partial_enforcement_debt

debt:
  - GOV-DEBT-REGISTRY-ID-VALIDATOR
```

---

# 15. Operational Flow

```text
ENG-GOV RULE
      ↓
APPLICABILITY
      ↓
RISK
      ↓
ENFORCEMENT MECHANISM(S)
      ↓
EVIDENCE
      ↓
CI / REVIEW / MANUAL GATE
      ↓
EXCEPTION OR DEBT IF INCOMPLETE
      ↓
COMPLIANCE STATE
```

---

## Closing Principle

B-OPS-01 converts engineering governance from prose into an enforceable operating model without stealing authority from the standards themselves.

Every rule can be located, classified, activated at the right time, mapped to evidence, protected by the right enforcement mechanism and represented honestly when automation is incomplete.

The matrix must always tell the truth about three separate things:

1. what the rule requires;
2. what currently protects it; and
3. whether current evidence actually satisfies it.
