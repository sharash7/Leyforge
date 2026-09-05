# ENG-GOV-14 — Leyforge Exceptions / Waivers / Deprecation Standard

**Document ID:** ENG-GOV-14  
**Title:** Leyforge Exceptions / Waivers / Deprecation Standard  
**Version:** v0.1  
**Status:** THEORETICALLY LOCKED  
**Authority Domain:** Engineering Governance — Exceptions / Waivers / Deprecation  
**Parent Authority:** ENG-GOV-00 — Leyforge Engineering Constitution  
**Related Standards:** ENG-GOV-04, ENG-GOV-05, ENG-GOV-06, ENG-GOV-08, ENG-GOV-09, ENG-GOV-11, ENG-GOV-12, ENG-GOV-13, ENG-GOV-15  
**Project:** Leyforge

---

## 00. Purpose and Scope

ENG-GOV-14 governs controlled deviation from normal engineering rules and the managed retirement of supported behaviour.

Leyforge may permit justified exceptions, but every consequential deviation must remain visible, bounded, attributable and temporary unless the underlying authority is explicitly changed.

Deprecation is a managed lifecycle rather than an informal promise to delete something later.

---

## 01. Exception Semantics

### EG14-001 — ENG-GOV-14 Governs Controlled Deviation and Retirement
It covers waivers, exceptions, temporary constraints, emergency bypasses, suppressions, quarantines, compatibility exceptions, deprecations, sunset/removal, reconsideration, expiry, revocation and cleanup.

### EG14-002 — An Exception Changes Applicability for a Bounded Case; It Does Not Rewrite the Rule
The governing rule remains authoritative outside the declared scope.

### EG14-003 — Permanent Normal Behaviour Requires Authority Change Rather Than Eternal Waiver
Repeated permanent exceptions signal that the standard or architecture should be amended.

### EG14-004 — A Waiver May Be Approved Only by Authority Capable of Permitting the Deviation
Local authority cannot waive higher non-delegated invariants.

### EG14-005 — Lower-Level Exceptions Cannot Contradict Higher Non-Waived Authority
Authority hierarchy remains intact.

### EG14-006 — Constitutional Invariant Conflicts Usually Require Authority Amendment Rather Than Routine Waiver
Stable identity, conservation and persistence safety are examples.

---

## 02. Deviation Classes and Identity

### EG14-007 — Leyforge Distinguishes WAIVER, EXCEPTION, TEMP CONSTRAINT, QUARANTINE, EMERGENCY BYPASS and DEPRECATION
These concepts have different semantics and lifecycle.

### EG14-008 — Consequential Exception/Deprecation Records Have Stable IDs
Suitable families may include WAIVER, TEMP, DEPR or a unified exception register.

### EG14-009 — Exception IDs Are Never Reused
Historical governance remains auditable.

---

## 03. Required Waiver Information

### EG14-010 — Every Consequential Waiver Records Why It Exists
The reason must be specific and evidence-oriented.

### EG14-011 — Waivers Identify the Exact Governing Rule Being Waived
Broad references to “testing rules” or similar are insufficient.

### EG14-012 — Waivers Identify Exact Scope
Scope may be one test, module, dependency version, file, platform, build configuration, release or known failure signature.

### EG14-013 — Waivers Do Not Apply Outside Recorded Scope
No accidental inheritance.

### EG14-014 — Consequential Exceptions Record Risk Class
Risk determines evidence and approval depth.

### EG14-015 — Higher-Risk Waivers Require Stronger Justification and Compensating Evidence
Class D/E deviations receive materially stronger scrutiny.

### EG14-016 — Waivers Define Compensating Controls Where Normal Protection Is Absent
Replacement evidence or safeguards should be explicit.

### EG14-017 — Removing Protection Without Replacement Evidence Requires Exceptional Justification
Especially for security, persistence, identity and conservation.

---

## 04. Duration, Review and Renewal

### EG14-018 — Temporary Waivers Have Explicit Expiry Mechanisms
Expiry may be date, release, dependency version, milestone, condition or tracked fix.

### EG14-019 — Expiry Conditions Are Objective Where Practical
“Until later” is not sufficient.

### EG14-020 — Indefinite Waivers Are Strongly Discouraged
Permanent behaviour belongs in normal authority.

### EG14-021 — Long-Lived Temporary Exceptions Have Reconsideration Checkpoints
Conditional expiry does not eliminate periodic review.

### EG14-022 — Reconsideration Does Not Automatically Renew
Close, renew, narrow, replace or escalate deliberately.

### EG14-023 — Renewal Requires Fresh Justification
Risk, scope and unresolved cause are reconsidered.

### EG14-024 — Repeated Renewal Signals Deeper Governance or Architecture Debt
Repeated exceptions are diagnostic evidence.

### EG14-025 — Expired Waivers Stop Authorising New Deviations
Expiry has real effect.

### EG14-026 — Tooling Should Detect Expired Waivers Where Practical
CI/Brain may surface active, expiring and expired status.

### EG14-027 — Expiry Does Not Automatically Repair Existing Violations
Cleanup or integration blocking follows according to risk.

---

## 05. Exception Lifecycle

### EG14-028 — Exception Records Use Explicit Lifecycle State
Useful states include PROPOSED, APPROVED, ACTIVE, EXPIRING, EXPIRED, REVOKED, CLOSED and SUPERSEDED.

### EG14-029 — CLOSED Means the Deviation No Longer Exists or Authority Now Resolves It
Closure must reflect real state.

### EG14-030 — REVOKED Means Authority Cancelled the Exception Before Expiry
New evidence may invalidate an exception.

---

## 06. Emergency Bypass

### EG14-031 — Emergency Bypasses Exist Only to Restore or Protect Critical Project State
Broken main, security incident, CI recovery, save-data protection and release-pipeline restoration are examples.

### EG14-032 — Urgency Alone Does Not Constitute an Emergency
Deadlines do not repeal data safety.

### EG14-033 — Emergency Bypasses Use the Smallest Safe Scope
One broken gate does not justify disabling all gates.

### EG14-034 — Emergency Bypasses Receive Retrospective Documentation Immediately After Stabilisation
What happened, what was bypassed, why, replacement evidence and follow-up repair are recorded.

### EG14-035 — Emergency Bypass Does Not Automatically Become Precedent
Exceptional fire-fighting does not redefine normal workflow.

---

## 07. Temporary Constraints and Quarantine

### EG14-036 — Temporary Constraints Are Explicit Engineering State
Temporary limitations are recorded rather than inferred.

### EG14-037 — Temporary Constraints Record Why They Exist
Cause and context remain visible.

### EG14-038 — Temporary Constraints Record What They Prevent or Limit
Affected scale/capability must be clear.

### EG14-039 — Temporary Constraints Record Reconsideration/Removal Triggers
Exit is part of the temporary state.

### EG14-040 — Temporary Constraints Do Not Silently Become Architectural Invariants
Age does not convert temporary limitation into permanent law.

### EG14-041 — Quarantine Isolates a Known Defect; It Does Not Declare the Defect Solved
Applies to flaky tests, problematic content and unstable integration.

### EG14-042 — Quarantine Records Ownership, Reason and Exit Condition
Temporary isolation remains actionable.

### EG14-043 — Quarantined Systems Remain Visible in Project Health
No hidden graveyard.

### EG14-044 — Quarantine Scope Is Minimal
One defect does not justify quarantining a whole subsystem unnecessarily.

---

## 08. Suppressions

### EG14-045 — Warning/Lint/Security Suppressions Are Attributable Exceptions
Meaningful suppressions identify what, why and scope.

### EG14-046 — Broad Wildcard Suppressions Are Discouraged
Global ignore patterns require scrutiny.

### EG14-047 — Suppression Cannot Conceal ERROR/FATAL Conditions Merely to Clean Output
Signal integrity remains authoritative.

---

## 09. Deprecation Semantics

### EG14-048 — Deprecation Means Supported/Understood but No Longer Preferred for New Use
Deprecated is not removed.

### EG14-049 — Deprecation Has an Explicit Reason
Replacement, security, performance, architecture or compatibility rationale is recorded.

### EG14-050 — Deprecation Identifies Preferred Replacement Where One Exists
Migration direction should be discoverable.

### EG14-051 — Deprecation Follows a Managed Lifecycle
Typical stages are ACTIVE → DEPRECATED → COMPATIBILITY-ONLY → REMOVAL ELIGIBLE → REMOVED.

### EG14-052 — Deprecation and Compatibility Support Are Separate Dimensions
A path may be deprecated for new use while required for old saves for years.

### EG14-053 — Deprecation Does Not Grant Immediate Removal Authority
Stable IDs, migrations, network contracts, package formats and public Forge APIs remain protected by support obligations.

---

## 10. New-Use Prevention and Removal

### EG14-054 — Deprecated Interfaces Should Discourage or Prevent New Use Where Practical
Warnings, lint, docs, annotations and validators may be used.

### EG14-055 — Existing Compatibility Paths May Avoid Unmanageable Warning Spam
Legacy support should not drown diagnostics.

### EG14-056 — Deprecation Records Explicit Removal Criteria
Examples include support-window advancement, migrated consumers, replacement proof or major-version boundary.

### EG14-057 — Removal Occurs Only After Support Obligations Are Satisfied
No premature cleanup.

### EG14-058 — Removal Criteria Should Be Testable Where Practical
Reference searches, fixtures and dependency checks may prove eligibility.

### EG14-059 — Persistence Compatibility Deprecation Follows ENG-GOV-08
Save support rules remain authoritative.

### EG14-060 — Retiring Save Support Is an Explicit Project/Release Decision
Not a local cleanup choice.

### EG14-061 — Deprecated Stable IDs Remain Historically Reserved
Identity is never recycled.

### EG14-062 — Deprecated IDs May Become Compatibility-Only While New References Are Prohibited
Legacy resolution and new authoring are distinct.

### EG14-063 — Public APIs Use Staged Deprecation Where Consumers Need Migration Time
Introduce replacement, migrate users, retain compatibility, then remove at a declared boundary.

### EG14-064 — Private Helpers Do Not Require Ceremonial Deprecation
Routine private refactors remain lightweight.

---

## 11. Upstream, Security and Performance Deprecation

### EG14-065 — Upstream Deprecation Is Evaluated Rather Than Copied Blindly
Leyforge determines impact, replacement, migration and support timeline.

### EG14-066 — Security-Motivated Deprecation May Require Accelerated Retirement
Compatibility is not absolute when safety is at stake.

### EG14-067 — Accelerated Security Retirement Records Risk Rationale
Breakage is deliberate and auditable.

### EG14-068 — Performance May Justify Deprecation When Evidence Shows a Path Cannot Meet Required Scale
Benchmark evidence should explain the decision.

---

## 12. Feature Flags, Compatibility Shims and Workarounds

### EG14-069 — Temporary Feature Flags Have Owners and Removal Conditions
Transitional flags do not linger indefinitely.

### EG14-070 — Feature Flags Do Not Become Substitute Architecture
Permanent duplicated systems require explicit design.

### EG14-071 — Dead Flags Are Removed After Transition Completes
Obsolete paths are cleaned deliberately.

### EG14-072 — Compatibility Shims Are Explicitly Identifiable
Relevant code should make compatibility purpose discoverable.

### EG14-073 — Compatibility Shims Have Support/Removal Conditions
The lifecycle is tied to real support obligations.

### EG14-074 — Compatibility Shim Complexity Is Not Treated as Ordinary Dead-Code Clutter
History and support must be checked before removal.

### EG14-075 — Workarounds Identify the Underlying Defect/Constraint
The original problem remains discoverable.

### EG14-076 — Workarounds Identify Removal/Reconsideration Conditions
They do not become permanent through neglect.

### EG14-077 — Reusable Workaround Knowledge May Be Stored in the Brain Without Becoming Authority
Knowledge and permission remain separate.

---

## 13. Git, Brain and CI Integration

### EG14-078 — Consequential Exceptions Live in Git
They travel with the project.

### EG14-079 — Code/Configuration Exercising an Exception May Reference Its Record
Local traceability is encouraged where useful.

### EG14-080 — Exception Record Changes Normally Accompany Opening, Renewal or Closure
History remains coherent.

### EG14-081 — Active Consequential Exceptions Appear in the Project Brain Governance Interface
Waivers, temporary constraints, quarantines and pending deprecations should be visible.

### EG14-082 — Closed Exceptions Remain Searchable Without Cluttering Active Views
Historical value is preserved.

### EG14-083 — Repeated Exception Patterns May Become Failure/Antipattern Knowledge
Recurring waivers may reveal deeper defects.

### EG14-084 — Active Machine-Enforceable Waivers Are Visible to CI
CI should know which failure is intentionally waived and under what record.

### EG14-085 — CI Validates Waiver Identity, Scope and Expiry Where Practical
Suppression becomes governable data.

### EG14-086 — CI Does Not Accept Expired Waivers as Valid Suppression
Expiry has operational consequence.

### EG14-087 — Expiring High-Risk Waivers Gain Advance Visibility
Release surprises are avoided.

### EG14-088 — Machine-Enforced Exceptions Are Encoded Narrowly
Suppress the smallest possible thing.

### EG14-089 — Suppression Mechanisms Retain Why-Metadata
Anonymous ignores are prohibited.

### EG14-090 — Manual-Only Consequential Exceptions Still Receive Durable Records
Machine unenforceability does not justify tribal knowledge.

---

## 14. Approval and Agent Rules

### EG14-091 — Exception Approval Depth Scales With Risk
Higher-risk deviations require higher authority and stronger evidence.

### EG14-092 — Coding Agents Cannot Approve Their Own Consequential Exceptions Without Delegated Authority
Agents may draft/propose.

### EG14-093 — Granting an Exception Does Not Make the Underlying Failure “Pass”
Risk acceptance and requirement satisfaction remain distinct.

### EG14-094 — Agents Check Governing Waivers Before Removing Intentional Exceptions
Existing suppressions/workarounds may have valid history.

### EG14-095 — Agents May Not Create Waivers Merely to Make Their Task Pass
A waiver is not a green-CI shortcut.

### EG14-096 — Agent-Drafted Exceptions Identify Rule, Scope, Risk and Justification
Proposals must be meaningful.

### EG14-097 — Agents May Not Extend Expiry Dates as Routine Maintenance
Renewal requires real reconsideration.

### EG14-098 — Agents Prefer Removing the Need for a Waiver When Safely Possible
Closing debt is the desired outcome.

---

## 15. Closure and Documentation

### EG14-099 — Closing an Exception Removes Obsolete Suppressions/Workarounds
Closure reflects actual project state.

### EG14-100 — Exception Cleanup Is Verified
Normal rule enforcement and relevant tests are restored.

### EG14-101 — Deprecated Use May Emit Structured Diagnostics Where Valuable
Developer-facing migration can be observable.

### EG14-102 — Deprecation Diagnostics Distinguish New Prohibited Use From Legacy Compatibility
Old saves need not generate useless noise.

### EG14-103 — Publicly Relevant Deprecations Are Documented With Migration Guidance
Affected users/developers need clear paths.

### EG14-104 — Internal Deprecations Remain Discoverable to Agents and Maintainers
Internal lifecycle remains visible.

### EG14-105 — Required Paths Are Not Deprecated Without Understanding Replacement Readiness
Security may force faster action, but the gap remains explicit.

### EG14-106 — Replacement Functionality Is Verified Before Broad Migration Where Practical
Migration follows evidence.

---

## 16. Staged Migration and Sunset

### EG14-107 — Large Deprecations May Migrate Consumers Incrementally
Staging can reduce risk.

### EG14-108 — Temporary Dual Systems Require Explicit Reconciliation Semantics
Authority, reads/writes, comparison and exit must be defined.

### EG14-109 — Dual-Write Migration Is High Risk
Competing writers to one conceptual state are Class D/E territory.

### EG14-110 — Removal/Sunset Is Consequential When Compatibility or Public API Is Affected
Deleting code may be riskier than adding it.

### EG14-111 — Sunset Verifies No Supported Dependency Remains
References, fixtures, package consumers and support windows are checked.

### EG14-112 — Interfaces Never Intended for Removal Should Not Remain Permanently Deprecated Merely to Express Dislike
Deprecation must retain real lifecycle meaning.

---

## 17. Exceptions, Debt and Certification

### EG14-113 — Exceptions and Technical Debt Are Distinct
An exception grants bounded permission; debt records unresolved cost/risk.

### EG14-114 — Exception Records May Link to Other Debt Classes
TECH-DEBT, TEST-DEBT, PERF-DEBT, SECURITY-DEBT and OBSERVABILITY-DEBT may be related.

### EG14-115 — Waivers Do Not Manufacture Satisfaction of the Underlying Requirement
Temporary permission is not a passing result.

### EG14-116 — Certification Reports Active Relevant Exceptions
Release status must remain honest.

### EG14-117 — Certain Active Exceptions Block Certification According to Risk
Critical save/security/identity failures may be non-waivable for certification.

### EG14-118 — Certification Never Hides Exceptions Behind an Overall Green Status
“Certified with approved exceptions” may be a distinct truthful state where permitted.

### EG14-119 — Project Health May Track Exception Volume and Age
Metrics are diagnostic indicators, not vanity scores.

### EG14-120 — Exception Count Is Not Itself a Quality Score
One high-risk waiver may matter more than many low-risk deviations.

### EG14-121 — Historical Exceptions Help Explain Unusual Code
Exception archaeology contributes to long-term maintainability.

---

## 18. Final Laws

### EG14-122 — No Consequential Deviation Exists Only in Someone’s Memory
Intentional deviation is recorded.

### EG14-123 — No Temporary Deviation Is Complete Until Its Exit Path Is Known
Why, scope, risk, protection, expiry and exit are part of the record.

### EG14-124 — Deprecation Is Complete Only When Replacement, Support and Removal Obligations Agree
Lifecycle state must match reality.

### EG14-125 — A Successful Exception Enables Necessary Progress Without Hiding Risk or Becoming Permanent by Accident
Pragmatism remains governable.

---

## Recommended Waiver Record

```text
WAIVER-XXXX — Title

Status:
Date Opened:
Owning Domain:
Risk Class:

## Governing Rule
## Scope
## Reason
## Evidence
## Risk
## Compensating Controls
## Expiry / Reconsideration
## Exit Plan
## Related Debt / Issue / ADR
## Approved By
## Renewal History
## Closure Evidence
```

## Recommended Deprecation Record

```text
DEPR-XXXX — Title

Status:
Date:
Owning Domain:

## Deprecated Thing
## Reason
## Replacement
## New-Use Policy
## Existing Compatibility Obligations
## Migration Path
## Removal Criteria
## Earliest Removal Boundary
## Verification Required
## Affected Saves / APIs / Packages / Systems
## Related ADRs / Releases
## Final Removal Evidence
```

---

## Closing Principle

Leyforge may bend a rule when reality requires it, but never invisibly.

Every consequential deviation has scope, authority, risk, protection, expiry and an exit path. Deprecation preserves compatibility obligations until they are actually satisfied. Security can accelerate retirement. Agents cannot self-authorise shortcuts. CI and the Project Brain keep active exceptions visible.

Temporary must mean temporary in engineering reality, not merely in the comment that introduced it.
