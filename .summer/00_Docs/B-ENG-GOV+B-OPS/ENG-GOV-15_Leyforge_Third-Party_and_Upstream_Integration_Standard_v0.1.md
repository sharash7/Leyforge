# ENG-GOV-15 — Leyforge Third-Party / Upstream Integration Standard

**Document ID:** ENG-GOV-15  
**Title:** Leyforge Third-Party / Upstream Integration Standard  
**Version:** v0.1  
**Status:** THEORETICALLY LOCKED  
**Authority Domain:** Engineering Governance — Third-Party / Upstream Integration  
**Parent Authority:** ENG-GOV-00 — Leyforge Engineering Constitution  
**Related Standards:** ENG-GOV-01, ENG-GOV-02, ENG-GOV-04, ENG-GOV-05, ENG-GOV-06, ENG-GOV-08, ENG-GOV-10, ENG-GOV-11, ENG-GOV-12, ENG-GOV-13, ENG-GOV-14  
**Project:** Leyforge

---

## 00. Purpose and Scope

ENG-GOV-15 defines how Leyforge adopts, integrates, modifies, updates, forks, validates, documents and retires third-party engineering dependencies and upstream-owned code.

The governing principles are:

> Third-party technology may accelerate Leyforge, but it must never become an untracked black box, an accidental ownership boundary or an unmaintainable fork.

> Change upstream-owned code only when the value justifies the long-term divergence cost.

---

## 01. Scope and Ownership

### EG15-001 — ENG-GOV-15 Governs External Engineering Dependencies
It covers Godot, Zylann Voxel, addons, GDExtensions, libraries, vendored source, forks, patches, build tools, CI dependencies, generators, SDKs, external schemas and engineering-critical third-party assets.

### EG15-002 — Every Consequential Dependency Has Identifiable Ownership
Ownership modes include upstream-owned, Leyforge fork, Leyforge adapter, vendored unmodified, generated, system package and external tool.

### EG15-003 — External Origin Remains Visible After Integration
Importing source into the repository does not erase provenance.

---

## 02. Dependency Admission

### EG15-004 — New Dependencies Solve a Real Project Problem
Adoption begins from a requirement rather than novelty.

### EG15-005 — Existing Platform/Project Capability Is Considered First
Godot, existing Leyforge tooling, Zylann or a small local implementation are considered before adding another dependency.

### EG15-006 — Dependency Size Alone Does Not Determine Acceptability
Maintenance, quality, stability and risk matter more than file count.

### EG15-007 — Convenience Dependencies Face a Proportionality Test
Minor implementation savings do not justify disproportionate licensing, security, maintenance or platform cost.

---

## 03. Dependency Evaluation

### EG15-008 — Consequential Adoption Evaluates Technical Fit
Functionality, performance, API quality, Godot compatibility, platforms, threading, persistence, runtime cost and editor integration may matter.

### EG15-009 — Consequential Adoption Evaluates Maintenance Health
Release activity, maintainers, issues, documentation, tests and ecosystem evidence are considered as appropriate.

### EG15-010 — Scrutiny Scales With Maturity and Project Importance
Foundational dependencies receive much stronger evaluation than trivial dev-only tools.

---

## 04. Licensing and Provenance

### EG15-011 — Externally Sourced Code Has Known Licence and Provenance Before Adoption
Unknown origin blocks adoption.

### EG15-012 — Licence Compatibility Is Checked Against Intended Distribution
Local usability alone is insufficient.

### EG15-013 — Licence Obligations Remain Discoverable
Attribution, copyright, licence text, modified-source obligations and similar requirements remain tracked.

### EG15-014 — Required Licence Files/Notices Are Not Deleted as Clutter
Legal provenance is protected.

### EG15-015 — Unknown Licence Stops Adoption Until Clarified
Assumed licensing is not accepted.

---

## 05. Dependency Inventory and Version Control

### EG15-016 — Leyforge Maintains a Dependency Inventory
Purpose, version, source, licence, ownership mode, risk, update strategy, local modifications and ADRs should be recorded.

### EG15-017 — Dependency Inventory Is Machine-Readable Where Practical
CI, release, Brain and security tooling may consume it.

### EG15-018 — Material Transitive Dependencies Are Considered
Direct imports do not define the full security/compatibility tree.

### EG15-019 — Consequential Dependencies Use Controlled Versions
Critical dependencies are pinned to identifiable versions/tags/commits.

### EG15-020 — Floating Versions Are Used Only Where Volatility Is Intentional
Critical runtime foundations do not track mutable heads by default.

### EG15-021 — Exact Commit Identity Is Recorded When Tags Are Insufficient
Historical reconstruction must remain possible.

---

## 06. Update Discipline

### EG15-022 — Dependency Updates Are Deliberate Engineering Changes
Automated availability is not automatic acceptance.

### EG15-023 — Update Review Scales With Dependency Risk
Major runtime foundations receive stronger review than trivial development tools.

### EG15-024 — Material Changelogs/Release Notes Are Reviewed
Breaking changes, security fixes, performance shifts, serialization changes and API removals matter.

### EG15-025 — “Newer Is Better” Is Not Sufficient Justification for Critical Updates
Stability may justify remaining on an older controlled version.

### EG15-026 — Dependency Updates Receive Focused Compatibility Verification
Build, runtime, persistence, worldgen, rendering, Forge, performance and packaging are tested as relevant.

### EG15-027 — Major Updates May Require Comparative Prototype Evidence
PRD/prototypes may establish migration safety.

### EG15-028 — Upstream Behaviour Changes Do Not Silently Redefine Leyforge
Changed upstream semantics are explicitly accepted, adapted or rejected.

---

## 07. Godot and Zylann

### EG15-029 — Godot Is a Consequential Foundational Platform Dependency
Engine upgrades receive compatibility, plugin, export, performance and deprecation review as appropriate.

### EG15-030 — Godot Upgrades Are Isolated From Unrelated Feature Work Where Practical
Upgrade risk should remain diagnosable.

### EG15-031 — Important Godot-Version-Dependent Workarounds Are Documented
Architecture created around engine limitations retains rationale.

### EG15-032 — Zylann Voxel Is a Critical Upstream Dependency
Terrain, storage, streaming, meshing, editing and worldgen integration make it foundational.

### EG15-033 — Supported Zylann Extension Mechanisms Are Preferred Where They Genuinely Fit
Lower divergence is preferred when ownership remains correct.

### EG15-034 — Correct Voxel-Layer Ownership May Justify Upstream Modification
Zero upstream changes is not a goal at the expense of bad architecture.

### EG15-035 — Formal Zylann Fork Strategy Requires ADR Coverage
Fork topology is a long-lived architecture decision.

### EG15-036 — Zylann Modifications Preserve Upstream Provenance
Base version/commit and Leyforge patch state must be reconstructable.

### EG15-037 — Upstream Style Is Preserved in Modified Upstream Areas
Unrelated reformatting is avoided.

---

## 08. Forking and Patch Management

### EG15-038 — Forking Creates an Explicit Maintenance Obligation
Upstream tracking, merge strategy, conflicts, patch provenance and testing become ongoing responsibilities.

### EG15-039 — Fork Divergence Is Intentionally Minimized
Unrelated upstream areas remain untouched.

### EG15-040 — Leyforge-Specific Behaviour Is Separated From Upstream Where Practical
Adapters/hooks/namespaces or isolated patch modules may reduce divergence.

### EG15-041 — Separation Does Not Justify Architectural Contortion
Correct ownership can outweigh a zero-patch objective.

### EG15-042 — Consequential Upstream Patches Have Stable Traceability
Patch IDs, commits and ADR links may provide this.

### EG15-043 — Upstream Patches Record Why They Exist
Rationale is more important than raw diff description.

### EG15-044 — Patches Track Equivalent Upstream Capability When It Appears
Local divergence may then be retired.

---

## 09. Upstream Contribution and Sync

### EG15-045 — Generally Useful Fixes May Be Contributed Upstream Where Appropriate
Reducing long-term fork burden is encouraged.

### EG15-046 — Upstream Contribution Is Not Mandatory for Proprietary Leyforge-Specific Features
Project-specific work may remain local.

### EG15-047 — Verified Upstream Replacements Permit Local Patch Retirement
Redundant divergence is removed safely.

### EG15-048 — Forks Have a Declared Upstream Synchronisation Strategy
Release tracking, stable tags, periodic merge/rebase or security-only update windows may be used.

### EG15-049 — Sync Frequency Reflects Risk and Upstream Change Rate
Neither constant churn nor permanent neglect is mandated.

### EG15-050 — Large Upstream Syncs Are Isolated From Unrelated Feature Changes
Review and regression diagnosis remain manageable.

### EG15-051 — Merge Conflicts Are Resolved Semantically
Understand both upstream and Leyforge intent.

### EG15-052 — Agents Do Not Blindly Choose “Ours” or “Theirs”
Conflict resolution requires reasoning.

### EG15-053 — Critical Conflict Resolution Receives Appropriate Verification
Foundational voxel/persistence boundaries receive stronger checks.

---

## 10. Adapter and Boundary Design

### EG15-054 — Leyforge-Owned Adapters Define Intentional Project-Facing Dependency Boundaries Where Valuable
They can isolate real dependency semantics.

### EG15-055 — Adapter Layers Normalize Project Semantics Rather Than Mirror APIs Pointlessly
One-to-one wrappers without architectural value are discouraged.

### EG15-056 — Replaceability Exists Only Where Actual Semantics Are Encapsulated
Abstraction does not magically make every dependency swappable.

### EG15-057 — Dependency-Specific Types Should Not Leak Everywhere Unnecessarily
Persistence, voxel internals, networking and third-party APIs benefit from bounded surfaces where practical.

### EG15-058 — Leakage Is Acceptable Where the Dependency Genuinely Defines the Domain
Godot types throughout a Godot application are not automatically a defect.

---

## 11. Vendoring, Generated Bindings and Tools

### EG15-059 — Vendored Source Retains a Clear Upstream Boundary
Repository structure should expose ownership.

### EG15-060 — Vendored Unmodified Code Remains Unmodified Unless a Fork Is Intentionally Created
Mystery edits are prohibited.

### EG15-061 — Local Modification Changes Ownership Classification to Modified/Forked
The maintenance obligation becomes explicit.

### EG15-062 — Generated Third-Party Bindings/Schemas Record Generator and Source Version
Reproducibility is preserved.

### EG15-063 — Generated Dependency Artifacts Are Regenerated Rather Than Manually Patched Where Possible
Source-of-truth discipline applies.

### EG15-064 — Build-Time Tools Are Dependencies Even When Not Shipped
Generators, processors, packaging and documentation tools matter.

### EG15-065 — Build-Critical Tools Receive Version Control Appropriate to Reproducibility
Build behavior must be reconstructable.

### EG15-066 — Optional Developer Tools Need Not Be Classified as Production Dependencies
Scope remains accurate.

### EG15-067 — CI Actions/Workflow Dependencies Follow Provenance and Pinning Rules
CI supply chain is part of engineering supply chain.

### EG15-068 — Critical CI Does Not Execute Arbitrary Mutable Remote Scripts
Mutable remote execution is not a trusted foundation.

---

## 12. Supply Chain and Viability

### EG15-069 — Dependency Acquisition Uses Trusted/Reproducible Sources Where Practical
Random mirrors and unknown binaries are unsuitable for critical use.

### EG15-070 — Integrity/Signature Verification Is Used Where Ecosystem Support Makes It Meaningful
Mechanisms vary by ecosystem.

### EG15-071 — Security Advisories Affecting Critical Dependencies Receive Explicit Triage
Affectedness, reachability, severity, fixes and workarounds are considered.

### EG15-072 — Security Fixes May Justify Accelerated Updates
Stability freezes do not outweigh critical security automatically.

### EG15-073 — Critical Dependency Abandonment Is an Architecture Risk
Continue fork, replace, internalise subset or alternative strategies may be required.

### EG15-074 — Dependency Viability Has Reconsideration Triggers
Compatibility failure, security risk, abandonment, performance ceiling or licence change may reopen architecture.

### EG15-075 — Replacing a Critical Dependency Is ADR-Level
Foundational replacement is architecture, not routine maintenance.

### EG15-076 — Replacement Evaluation Compares Behavioural Compatibility
Feature lists alone are insufficient.

### EG15-077 — Dependency Replacement Protects Persisted Player Data
ENG-GOV-08 applies where representations touch saves/worlds.

---

## 13. Persistence, API and Performance Boundaries

### EG15-078 — Third-Party-Owned Persistent Formats Require Explicit Compatibility Strategy
Version ownership and migration ability must be known.

### EG15-079 — Critical Persistence Does Not Depend on Undocumented Upstream Internals Without Explicit Risk
Opaque format dependence is high risk.

### EG15-080 — Consequential Upstream APIs Are Treated as Compatibility Surfaces
API churn can create Leyforge migration work.

### EG15-081 — Undocumented/Internal Upstream APIs Carry Higher Maintenance Risk
Necessary use remains explicit.

### EG15-082 — Internal API Reliance Is Recorded When Unavoidable
Why supported APIs were insufficient must be known.

### EG15-083 — Performance-Sensitive Dependency Choices Require Representative Benchmark Evidence
Foundational choices must scale for Leyforge workloads.

### EG15-084 — Performance-Driven Local Patches Require Before/After Evidence
Complexity earns its place through measurement.

### EG15-085 — Performance Gain Is Weighed Against Divergence Cost
Small gains may not justify permanent maintenance burden.

---

## 14. Testing and Workarounds

### EG15-086 — Critical Dependencies Receive Leyforge Integration Tests
Project assumptions about edits, loading, streaming, persistence and threading are protected.

### EG15-087 — Upstream Tests Do Not Replace Leyforge Integration Tests
Each suite protects different requirements.

### EG15-088 — Upstream Upgrade Verification Re-Runs Relevant Leyforge Assumption Tests
Upgrade confidence must be project-specific.

### EG15-089 — Upstream Bug Workarounds Have Provenance and Lifecycle
Issue/version/workaround/removal conditions are tracked.

### EG15-090 — Workarounds Remain Until Upstream Fixes Are Verified in Leyforge
Changelog claims alone do not prove integration safety.

### EG15-091 — Local Patches Are Narrow
Patch scope should be as small as practical.

### EG15-092 — Local Patches Avoid Unrelated Refactoring
Upstream sync cost remains low.

### EG15-093 — Patch Comments Explain Leyforge-Specific Rationale Where Needed
ADR/patch references may be used.

---

## 15. Documentation and Agent Behaviour

### EG15-094 — Critical Dependencies Have Concise Leyforge Integration Notes
Purpose, location, version/source, ownership mode, patches, build/update process, tests and ADRs should be easy to find.

### EG15-095 — Integration Notes Do Not Duplicate Upstream Documentation
They describe the Leyforge relationship.

### EG15-096 — Coding Agents Identify Dependency Ownership Before Editing
Ownership determines allowed behavior.

### EG15-097 — Agents Do Not Reformat Third-Party Code Into Leyforge Style
Upstream style is preserved.

### EG15-098 — Agents Do Not Opportunistically Upgrade Dependencies During Unrelated Work
Upgrade scope remains explicit.

### EG15-099 — Agents Do Not Upgrade Dependencies to Fix Unexplained Behaviour Without Establishing Causality
“Upgrade everything” is not diagnosis.

### EG15-100 — Agents Check Upstream Docs/Source/Issues Before Patching Apparent Dependency Bugs Where Practical
Behavior may be intended, configurable, already fixed or known.

### EG15-101 — Agents May Propose Upstream Patches but Do Not Publish Externally Without Authority
Local coding permission and external contribution permission are separate.

### EG15-102 — External Snippets Retain Applicable Provenance/Licence Obligations
Small snippets are not exempt.

### EG15-103 — Original Local Implementation Is Preferred Over Copying Uncertain-Provenance Snippets
Provenance risk is avoided.

---

## 16. Binary and Platform-Specific Dependencies

### EG15-104 — Prebuilt Binaries Have Identifiable Source, Version and Provenance
Unknown binaries are not acceptable foundations.

### EG15-105 — Critical Binary-Only Dependencies Receive Stronger Maintenance/Replacement Scrutiny
Limited inspectability increases risk.

### EG15-106 — Binary-Only Updates Are Verified on Supported Platforms
Platform compatibility is explicit.

### EG15-107 — Platform-Specific Dependencies Declare Platform Scope
Availability limits are visible.

### EG15-108 — Missing Platform Support Cannot Silently Disable Required Gameplay
Alternatives, unsupported status or graceful feature boundaries must be explicit.

### EG15-109 — Temporary Dependency Compatibility Flags Follow ENG-GOV-14
Flags have owners and removal conditions.

### EG15-110 — Dependency Compatibility Shims Are Distinct From Permanent Architecture
Temporary glue remains identifiable.

### EG15-111 — Shims Record Supported Versions/Conditions
Their scope is bounded.

---

## 17. Update Automation, Lock State and Build Reproducibility

### EG15-112 — Update Automation May Discover but Not Self-Approve Consequential Upgrades
Bots propose; authority decides.

### EG15-113 — Update Proposals Preserve Material Changelog/Security/Version Context
Reviewers need evidence.

### EG15-114 — Reproducible Resolution Uses Ecosystem Lock/Pin Mechanisms Where Appropriate
Dependency state should be reconstructable.

### EG15-115 — Lock Files Are Engineering Artifacts When They Define Reproducibility
They are not disposable clutter.

### EG15-116 — Critical Dependencies Have Documented Acquisition/Build Paths Where Practical
Forks especially require reproducible setup.

### EG15-117 — “Works on One Developer Machine” Is Not an Acceptable Build Strategy
Reconstruction must be possible.

### EG15-118 — Build/Release Workflows Avoid Unnecessary Dependence on Ephemeral External Availability
Critical state should remain recoverable.

### EG15-119 — Critical Dependency Source/Revision Information Is Preserved for Historical Releases
Debugging, security and provenance depend on it.

---

## 18. Removal, Criticality and Project Brain

### EG15-120 — Dependency Removal Verifies That No Supported Path Still Requires It
Runtime, build and tooling users are checked.

### EG15-121 — Removal Cleans Obsolete Adapters, Licences and Config Only When No Longer Required
Legal/technical obligations remain respected.

### EG15-122 — Nontrivial Dependency Retirement Follows ENG-GOV-14
Deprecation discipline applies.

### EG15-123 — Dependencies May Be Classified by Operational Criticality
FOUNDATIONAL, RUNTIME, BUILD-CRITICAL, DEVELOPMENT and OPTIONAL are useful conceptual classes.

### EG15-124 — Criticality Is Separate From Trust and Licence
These are independent dimensions.

### EG15-125 — Critical Dependency Health May Feed Project Brain Dashboards
Version, support state, local fork status, advisories and pending upgrades may be surfaced.

### EG15-126 — Machine-Generated Dependency Status Is Evidence, Not Authority
“Update available” does not create an upgrade requirement.

### EG15-127 — Important Dependency Procedures Become Brain Skills/Procedures
Build, sync, merge and validation knowledge should be reusable.

### EG15-128 — Known Dependency Failure Modes Become Brain Failures/Antipatterns
Recurring integration traps should not be rediscovered repeatedly.

---

## 19. ADRs, Releases and Incidents

### EG15-129 — Foundational Dependency Adoption Requires ADR Coverage
Engine and voxel-core decisions are durable architecture.

### EG15-130 — Serious Rejected/Replacement Alternatives May Also Be Preserved
Future agents should not restart old debates without changed evidence.

### EG15-131 — Releases Identify Consequential Dependency Versions
Support/debugging need runtime provenance.

### EG15-132 — Release Provenance Includes Local Fork/Patch State Where Relevant
Upstream + Leyforge delta must be reconstructable.

### EG15-133 — Critical Upstream Regression Is Treated as a Bounded Engineering Incident
Affected versions, exposure, workaround, rollback/patch/update and regression tests are determined.

### EG15-134 — Dependency Regressions Are Not Blamed on Upstream Without Evidence
Leyforge integration may be at fault.

### EG15-135 — Consequential Upgrades Have Rollback Strategy Where Risk Justifies It
Engine/plugin migrations need recovery planning.

### EG15-136 — Rollback Accounts for Data/Schema Changes Caused by Upgrades
Code rollback alone may not restore compatibility.

### EG15-137 — Major Dependency Upgrades Are Staged Where Practical
Update, restore build, restore compatibility, verify, benchmark and remove shims in comprehensible phases.

### EG15-138 — Upstream Test Suites May Be Run When Modifying Upstream Code
They supplement Leyforge testing.

### EG15-139 — Leyforge-Specific Patches Add Tests at the Lowest Appropriate Layer
Upstream-style and Leyforge integration tests may both be needed.

---

## 20. Fork Cleanliness and Final Laws

### EG15-140 — Leyforge Forks Remain Understandable as Upstream Plus a Bounded Local Delta
Ownership should not dissolve into ambiguity.

### EG15-141 — Foundational Forks Receive Periodic Delta Review
Each local patch should still have a reason to exist.

### EG15-142 — Internalising Third-Party Functionality Is an Architecture Decision
Transition to Leyforge ownership is explicit.

### EG15-143 — Internalisation Does Not Erase Original Licence/Provenance Obligations
History remains legally and technically meaningful.

### EG15-144 — Leyforge-Owned Changes Remain Separable From Upstream History Where Practical
This supports review, syncing, licensing, debugging and patch retirement.

### EG15-145 — Upstream Divergence Always Has a Discoverable Reason
Unexplained divergence is a governance defect.

### EG15-146 — Dependency Convenience Never Outranks Persistence, Security or Canonical Correctness
External technology remains subordinate to project authority.

### EG15-147 — A Dependency Is Accepted Only When Benefit Exceeds Total Ownership Cost
Ownership cost includes integration, maintenance, updates, security, licensing, platform risk, divergence, debugging and replacement difficulty.

### EG15-148 — Foundational Dependency Relationships Remain Revisitable When Evidence Changes
Locked decisions are not dogma.

### EG15-149 — Upstream Code Is Neither Sacred Nor Disposable
Correct ownership and maintainability must both be respected.

### EG15-150 — Consequential Dependency Governance Requires Known Ownership, Provenance, Compatibility, Evidence and Maintenance Responsibility
For each critical dependency Leyforge should be able to answer what it is, why it exists, who owns it, which version/licence applies, what was modified, how it is updated/tested, what happens if it disappears and where that knowledge lives.

---

## Recommended Dependency Inventory Record

```text
Dependency ID / Name:

Category:
FOUNDATIONAL / RUNTIME / BUILD-CRITICAL / DEVELOPMENT / OPTIONAL

Purpose:

Source:
Version / commit:

Licence:
Required notices:

Ownership Mode:
UNMODIFIED / VENDORED / FORKED / ADAPTER / EXTERNAL TOOL

Local Modifications:
Patch IDs:
Relevant ADRs:

Used By:
Affected Platforms:

Persistence Impact:
Security Impact:
Performance Impact:

Build / Acquisition Procedure:

Verification:

Update Strategy:
Upstream Sync Strategy:

Known Limitations:

Reconsideration Triggers:

Brain Skills / Failures:
```

## Upstream Patch Lifecycle

```text
UPSTREAM RELEASE
      ↓
LEYFORGE BASE REVISION
      ↓
LOCAL PATCHSET
      ↓
LEYFORGE INTEGRATION TESTS
      ↓
NEW UPSTREAM RELEASE
      ↓
COMPARE / SYNC
      ↓
PATCH STILL NEEDED?
   ┌────┴────┐
  YES       NO
   │         │
retain     retire
```

---

## Closing Principle

Leyforge uses third-party technology deliberately.

Every consequential dependency has known ownership, provenance, licence, controlled version, compatibility expectations, tests and maintenance responsibility. Forks remain bounded. Local patches remain explainable. Upstream updates are evaluated rather than blindly consumed. Critical dependency failure and abandonment are treated as architecture risks.

Upstream code is neither sacred nor disposable; it is integrated according to evidence, correct ownership and total long-term cost.
