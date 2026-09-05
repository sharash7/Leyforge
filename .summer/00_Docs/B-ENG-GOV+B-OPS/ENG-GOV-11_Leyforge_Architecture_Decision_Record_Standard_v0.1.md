# ENG-GOV-11 — Leyforge Architecture Decision Record Standard

**Document ID:** ENG-GOV-11  
**Title:** Leyforge Architecture Decision Record Standard  
**Version:** v0.1  
**Status:** THEORETICALLY LOCKED  
**Authority Domain:** Engineering Governance — Architecture Decision Records  
**Parent Authority:** ENG-GOV-00 — Leyforge Engineering Constitution  
**Related Standards:** ENG-GOV-01, ENG-GOV-02, ENG-GOV-04, ENG-GOV-08, ENG-GOV-09, ENG-GOV-10, ENG-GOV-12, ENG-GOV-14, ENG-GOV-15  
**Project:** Leyforge

---

## 00. Purpose and Scope

ENG-GOV-11 defines how Leyforge records consequential engineering architecture decisions so that future humans and coding agents can discover not only what the architecture is, but why it was chosen.

Architecture documents describe current architecture.

Architecture Decision Records preserve the consequential decisions, constraints, evidence, alternatives, trade-offs and reconsideration conditions that produced that architecture.

ADRs do not replace canon, engineering governance, PRD evidence or architecture documentation.

---

## 01. ADR Purpose

### EG11-001 — ADRs Preserve Consequential Architecture History
An ADR exists so future contributors can understand why important architecture was chosen.

### EG11-002 — ADRs Do Not Replace Architecture Documents
Current architecture documentation explains what exists now. ADRs explain why consequential choices were made.

### EG11-003 — ADRs Do Not Replace Canon or Engineering Governance
ADRs select implementation architecture within higher authoritative constraints.

---

## 02. When ADRs Are Required

### EG11-004 — Consequential Architecture Decisions Require ADR Coverage
Typical ADR subjects include module ownership, dependency direction, persistence architecture, network authority, worldgen architecture, registry architecture, concurrency models, major dependency selection, security boundaries, Forge/runtime interfaces and major data representation.

### EG11-005 — Routine Implementation Decisions Do Not Require ADRs
Local refactors, minor private naming, ordinary UI changes and similarly bounded implementation choices do not require ADRs unless they establish consequential architecture.

### EG11-006 — ADR Necessity Is Determined by Future Explanatory Value Rather Than Code Size
A small change may require an ADR if it establishes long-lived architecture. A large generated change may not.

### EG11-007 — ADRs Are Strongly Indicated When Future Contributors Are Likely to Ask “Why This Instead of the Obvious Alternative?”
The practical threshold is whether losing the rationale would create meaningful future risk or rediscovery.

---

## 03. ADR Identity and Status

### EG11-008 — Every ADR Has a Stable Identity
ADRs use stable chronological IDs such as `ADR-0001`.

### EG11-009 — ADR IDs Are Never Reused
Abandoned, rejected or superseded IDs remain historical.

### EG11-010 — ADR Identity Survives Filename or Title Changes
The stable ADR ID defines the record identity.

### EG11-011 — ADRs Use Explicit Lifecycle States
The baseline states are PROPOSED, ACCEPTED, REJECTED, SUPERSEDED and DEPRECATED. EXPERIMENTAL may be used for deliberately trialled architecture.

### EG11-012 — ACCEPTED Means Current Architecture Authority Within Scope
Accepted ADRs govern their architectural scope subject to higher canon and ENG-GOV authority.

### EG11-013 — REJECTED ADRs Remain Valuable History
Important rejected alternatives may prevent repeated rediscovery of already-evaluated designs.

---

## 04. Historical Integrity

### EG11-014 — Accepted ADRs Are Not Silently Rewritten When the Decision Changes
Changed decisions use supersession rather than retroactive historical replacement.

### EG11-015 — Minor Corrections May Amend an ADR Without Changing Historical Meaning
Typos, broken links and clarifying wording may be corrected if the underlying decision remains unchanged.

---

## 05. ADR Core Content

### EG11-016 — ADRs Record Context and Problem
The record identifies why the decision was necessary.

### EG11-017 — ADRs Record Authoritative Constraints
Relevant canon, governance, compatibility, performance, security, Godot, upstream or other constraints are identified.

### EG11-018 — ADRs State the Decision Clearly
The chosen architecture must be explicit and unmistakable.

### EG11-019 — ADRs Record Important Alternatives Considered
Credible competing approaches should be included.

### EG11-020 — ADRs Explain Why Serious Alternatives Lost
Rejected alternatives record the reasons they were not selected.

---

## 06. Consequences and Risk

### EG11-021 — ADRs Record Positive Consequences
Benefits and enabled capabilities are documented.

### EG11-022 — ADRs Record Accepted Negative Consequences
Known complexity, limitations, maintenance burden or other costs are documented rather than hidden.

### EG11-023 — ADRs Distinguish Expected Consequences From Risks
Expected trade-offs and uncertain possible failures are separate concepts.

---

## 07. Evidence and Decision Criteria

### EG11-024 — Evidence-Backed Architecture References Its Evidence
PRD research, prototypes, benchmarks, tests, source audits, incidents and other evidence may support the decision.

### EG11-025 — ADRs Reference Evidence Rather Than Duplicate Entire Research Reports
Decision records remain readable and point to deeper evidence.

### EG11-026 — Architecture Based on Inference States Its Uncertainty
Confidence and unverified assumptions should be explicit where material.

### EG11-027 — Competing Architecture Uses Explicit Decision Criteria Where Practical
Relevant criteria may include correctness, performance, complexity, persistence compatibility, upstream divergence, testability, Forge integration, multiplayer suitability and maintenance cost.

### EG11-028 — Decision Criteria Match the Actual Problem
Leyforge does not require a generic weighted scorecard for every decision.

---

## 08. Rejected Alternatives and Reconsideration

### EG11-029 — Rejected Alternatives May Be Reconsidered When Underlying Conditions Change
A rejected design is not forbidden forever if the facts that caused rejection materially change.

### EG11-030 — Reconsideration Requires New Evidence or Changed Constraints
Contributor preference alone does not justify architecture oscillation.

### EG11-031 — ADRs May Define Explicit Reconsideration Triggers
Examples include scale thresholds, upstream capability changes, multiplayer activation, budget breaches or engine-version changes.

### EG11-032 — Reconsideration Triggers Cause Re-Evaluation, Not Automatic Reversal
A trigger opens the decision for review.

---

## 09. ADR Scope and Ownership

### EG11-033 — ADRs Have Explicit Scope
The decision must identify what it governs.

### EG11-034 — ADRs Do Not Claim Authority Outside Their Domain
A local worldgen decision does not silently govern Forge UI architecture.

### EG11-035 — Every ADR Identifies Its Owning Architecture or Domain
Examples include LFE, FORGE-ENG, ENG-GOV, networking or another declared architecture domain.

### EG11-036 — Cross-Domain ADRs Identify All Affected Authorities
Persistence↔Registry↔Forge and similar decisions must expose their cross-domain impact.

---

## 10. Relationship to PRD and Architecture Docs

### EG11-037 — PRD Evidence and Architecture Decision Authority Remain Distinct
PRD establishes technical evidence; ADRs record the architecture selected from that evidence.

### EG11-038 — Hostile Prototypes Do Not Automatically Become Architecture
Prototype success is evidence, not production authority.

### EG11-039 — Consequential LFE Architecture References Governing ADRs
Architecture docs should link to the decisions that explain consequential boundaries.

### EG11-040 — Current Architecture Docs Express Current Truth Even When ADR History Is Complex
Contributors should not need to replay every ADR merely to understand today's architecture.

---

## 11. Supersession

### EG11-041 — Superseding ADRs Identify What They Replace
Replacement relationships are explicit.

### EG11-042 — Superseded ADRs Point Forward to Their Replacement
Navigation works in both directions.

### EG11-043 — Partial Supersession Is Permitted When Explicit
A later ADR may replace only a defined part of an earlier decision.

### EG11-044 — Active ADRs May Not Silently Contradict Within the Same Scope
Conflicts are resolved through clarification or supersession.

---

## 12. Granularity and Template

### EG11-045 — Prefer One Consequential Decision Per ADR
Records should remain independently understandable and supersedable.

### EG11-046 — Closely Inseparable Decisions May Share an ADR
Do not fragment one coherent architectural choice artificially.

### EG11-047 — ADRs Are Concise Enough to Read and Complete Enough to Preserve Reasoning
No arbitrary length limit is imposed.

### EG11-048 — Leyforge Uses One Standard ADR Template
The standard template includes identity, title, status, date, domain/owner, risk, context, authoritative constraints, decision, alternatives, rationale/evidence, consequences, risks, reconsideration triggers, affected systems, verification, supersession and Brain links.

### EG11-049 — ADR Creation and Acceptance Dates Are Recorded
Explicit dates improve navigation and historical understanding.

### EG11-050 — Git History Does Not Replace ADR Metadata
Decision metadata remains useful when files move or are imported.

---

## 13. Risk and Temporary Architecture

### EG11-051 — ADRs Record Relevant Change-Risk Class
Class C, D and E decisions should identify their risk.

### EG11-052 — Class D/E ADRs Require Stronger Evidence and Verification References
Persistence and foundational decisions require proportionate confidence.

### EG11-053 — Temporary Architectural Constraints Are Explicitly Labelled
Temporary decisions include their reason and reconsideration condition.

### EG11-054 — Temporary Architecture Does Not Become Permanent Merely Through Age
When reconsideration conditions arrive, the decision is evaluated.

### EG11-055 — EXPERIMENTAL ADRs May Govern Trial Architecture
Experimental records define the question, success criteria and rollback/reconsideration conditions.

### EG11-056 — Experimental Acceptance Does Not Equal Production Certification
Trial success becomes evidence for a later production decision.

---

## 14. Failed Architecture and Upstream Decisions

### EG11-057 — Architecture Failures Are Preserved Rather Than Erased
A failed accepted architecture remains valuable history.

### EG11-058 — Significant Failed Decisions Link to Brain Failure or Antipattern Records
Reusable lessons should prevent recurrence.

### EG11-059 — Major Upstream Technology Adoption or Forking Decisions Require ADRs
Engine/plugin adoption, fork strategy, native extension technology, storage engines and network stacks are long-lived decisions.

### EG11-060 — Upstream-Divergence ADRs Record Upgrade and Merge Consequences
Forking decisions must preserve the future maintenance cost.

---

## 15. Special High-Risk Domains

### EG11-061 — Major Trust-Boundary Decisions Require ADR Coverage
Security/sandbox/server-authority decisions require durable rationale.

### EG11-062 — Consequential Persistence Architecture Requires ADR Coverage
Storage, snapshot, journaling, sharding and migration-graph architecture require ADRs.

### EG11-063 — Consequential Registry Architecture Requires ADR Coverage
Namespace, override, generation and hot-loading architecture require ADRs.

### EG11-064 — Performance-Driven Architecture References Benchmark Evidence
Complexity justified by performance must preserve the evidence that earned it.

---

## 16. Validation and Indexing

### EG11-065 — ADR Files Should Be Mechanically Validated Where Practical
Unique ID, valid status, title, domain and supersession metadata are candidates for automated checks.

### EG11-066 — Broken ADR References Should Become CI-Detectable Where Practical
Document moves must not silently break decision navigation.

### EG11-067 — ADR Metadata Feeds a Machine-Readable Decision Registry
Active, superseded, domain, risk and status views may be generated.

### EG11-068 — Project Brain Indexes ADRs Rather Than Duplicates Them
The Brain connects current architecture to decision history without becoming a shadow ADR corpus.

---

## 17. Coding-Agent Workflow

### EG11-069 — Coding Agents Check Applicable ADRs Before Consequential Architecture Work
Authority and current architecture are consulted before implementation.

### EG11-070 — Agents May Not Silently Violate an Accepted ADR
Conflict triggers evidence gathering and proposed supersession/amendment rather than quiet circumvention.

### EG11-071 — Agents May Propose ADRs but May Not Invent Acceptance Authority
AI can draft a PROPOSED record; acceptance depends on actual workflow authority.

### EG11-072 — Agents Must Not Clean Up Architecture Whose Rationale They Have Not Checked
Adapters, queues, version layers, compatibility abstractions and other apparently redundant structures require historical review before removal.

---

## 18. Review, Acceptance and Assumptions

### EG11-073 — Higher-Risk ADRs Receive Independent Review
Class C–E architecture receives review appropriate to risk.

### EG11-074 — An ADR Is Accepted Only When Decision and Evidence Are Sufficient for Its Risk
Perfect certainty is not required, but responsible evidence is.

### EG11-075 — Unresolved Critical Uncertainty Prevents Premature Acceptance
Architecture hinging on a decisive untested assumption returns to research/prototyping first.

### EG11-076 — Accepted ADRs May Contain Explicit Assumptions
Material assumptions remain visible.

### EG11-077 — Unverified Assumptions Receive Tracked Follow-Up
Acceptance does not erase evidence gaps.

### EG11-078 — ADRs Do Not Expire Merely Because They Are Old
Changed facts and constraints, not age, drive reconsideration.

---

## 19. Historical Reconstruction and Numbering

### EG11-079 — The ADR Corpus Should Permit Reconstruction of Major Architectural Evolution
Major engine, persistence, registry and subsystem evolution should be understandable without relying on chat history.

### EG11-080 — ADR Numbering Is Chronological Rather Than Hierarchical
Simple `ADR-0001` style numbering is preferred.

### EG11-081 — The Project Maintains a Current Active-Decision Index
Current architecture should be navigable without manually scanning the entire ADR corpus.

### EG11-082 — ADRs Reference Affected Engineering Standards Where Relevant
Decision records connect into ENG-GOV, LFE, FORGE-ENG and other authorities.

### EG11-083 — Engineering Standards May Reference ADRs Without Becoming Unnecessarily Implementation-Specific
Governance remains durable while architecture evolves.

---

## 20. Rejected Records, Debt and Tooling

### EG11-084 — Important Rejected Alternatives May Receive REJECTED ADR Records
Likely-to-recur rejected designs are worth preserving.

### EG11-085 — Missing Decision Documentation May Be Tracked as ADR-DEBT
Existing consequential architecture without a proper record can be scheduled for rationale reconstruction.

### EG11-086 — Missing ADR Documentation Does Not Automatically Invalidate Working Architecture
Risk determines priority for reconstruction.

### EG11-087 — Creating a New ADR Should Be Low Friction
Project tooling may generate IDs, templates, index entries and Brain-link stubs.

### EG11-088 — Superseding an ADR Should Update Derived Indexes Automatically Where Practical
Automation reduces clerical drift.

---

## 21. Git, Chat and Work Logs

### EG11-089 — ADRs Live in Git With the Architecture They Govern
Decision history travels with repository history.

### EG11-090 — Architecture-Changing Code Should Include or Reference the Relevant ADR Change
Decision and implementation should not drift months apart where avoidable.

### EG11-091 — Chat Discussion Is Not the Durable ADR
Accepted decisions are committed into the repository.

### EG11-092 — Work Logs Record Decision Activity but Do Not Replace the ADR
Work logs may record when and why an ADR changed status.

---

## 22. Certification

### EG11-093 — Architecture Certification Requires ADR Coverage for Consequential Current Decisions
Major V1 architecture cannot remain undocumented implementation.

### EG11-094 — Active ADRs Reconcile With Current Architecture Documents
Conflicts must be resolved before certification.

### EG11-095 — Active ADRs Reconcile With ENG-GOV Authority
Architecture may not remain certified while contradicting engineering governance.

### EG11-096 — A Consequential Architecture Choice Is Not Complete Until Its Rationale Is Durable

```text
PROBLEM
   ↓
EVIDENCE / CONSTRAINTS
   ↓
OPTIONS
   ↓
DECISION
   ↓
ADR
   ↓
IMPLEMENTATION
   ↓
VERIFICATION
   ↓
PROJECT BRAIN INDEX
```

---

## Standard ADR Template

```text
ADR-XXXX — Title

Status:
Date:
Domain / Owner:
Risk Class:

## Context
What problem are we solving?

## Authoritative Constraints
What canon, governance, technical or compatibility constraints apply?

## Decision
What are we choosing?

## Alternatives Considered
What serious alternatives were considered?

## Rationale and Evidence
Why did this option win?
What research, tests, prototypes or benchmarks support it?

## Positive Consequences

## Negative Consequences

## Risks / Assumptions

## Reconsideration Triggers

## Affected Systems / Documents

## Verification

## Supersedes

## Superseded By

## Project Brain Links
```

---

## Closing Principle

Leyforge architecture must remain understandable after the original conversations and contributors are gone.

Architecture documents describe current truth. ADRs preserve why that truth was chosen. Accepted decisions are not rewritten away. Alternatives and negative consequences remain visible. Evidence supports consequential complexity. Reconsideration follows changed facts rather than preference. AI agents consult decision history before changing architecture.

A consequential architecture choice is complete only when its rationale is durable.
