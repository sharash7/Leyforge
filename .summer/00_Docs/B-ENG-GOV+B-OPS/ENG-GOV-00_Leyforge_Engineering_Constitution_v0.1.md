# ENG-GOV-00 — Leyforge Engineering Constitution

**Document ID:** ENG-GOV-00  
**Title:** Leyforge Engineering Constitution  
**Version:** v0.1  
**Status:** THEORETICALLY LOCKED  
**Authority Domain:** Engineering Governance  
**Project:** Leyforge

---

## 00. Purpose

The Leyforge Engineering Constitution defines the highest-level engineering laws under which Leyforge software, tools, infrastructure, data structures, registries, automated systems, tests, build systems and engineering documentation are created, modified, verified and maintained.

Its purpose is to preserve long-term code health, architectural coherence, project knowledge, persistent-data integrity, reproducibility, maintainability and engineering traceability as Leyforge grows.

This Constitution deliberately contains only durable engineering principles.

Detailed coding conventions, repository procedures, testing requirements, CI configuration, persistence procedures, registry rules, performance standards, AI-agent procedures and other operational requirements belong to the subordinate ENG-GOV standards.

The Constitution does not define game lore, content, player-facing design, canonical world rules or specific implementation architecture.

---

## 01. Authority Model

Leyforge uses domain-based authority rather than one universal linear hierarchy.

Game and content canon define what Leyforge is intended to mean and how canonical systems are intended to behave.

ENG-GOV-00 and its subordinate ENG-GOV standards define the engineering laws under which those requirements may be implemented.

LFE and FORGE-ENG define the technical architecture used to realise those requirements.

Architecture Decision Records preserve consequential implementation and architecture decisions within those boundaries.

The Project Brain indexes, connects, tracks and explains these authorities but does not replace them.

A document is authoritative within its declared domain.

Where two authoritative sources appear to conflict, the conflict must be resolved explicitly. An implementation may not silently choose one interpretation and thereby redefine another authority.

---

## 02. Canon and Engineering Boundary

Engineering may determine implementation mechanisms, data structures, module boundaries, algorithms, performance strategies and technical architecture where those decisions remain consistent with authoritative requirements.

Engineering may not silently change canonical behaviour in order to simplify implementation.

Where an authoritative requirement is technically unsafe, contradictory, infeasible or disproportionately costly, the engineering process must surface the problem and provide evidence.

The resulting resolution may involve an architecture change, an approved exception, a requirement clarification or an authorised canon amendment.

Until that conflict is resolved, implementation must not quietly redefine the requirement.

---

## 03. Constitutional Engineering Laws

### C-01 — Canon Integrity

Implementation must not silently redefine authoritative canon.

### C-02 — Stable Persistent Identity

Authoritative persistent identity must use stable identifiers rather than display names, translated strings, presentation labels or other mutable presentation identity.

### C-03 — Authoritative State Independence

Authoritative simulation state must not depend upon visual actors, scenes, render objects or other presentation entities remaining loaded.

### C-04 — Conservation of Authoritative Transactions

Authoritative transactions must conserve state and resources except where an explicitly defined system creates, destroys, transforms, transfers or consumes them.

### C-05 — Declared Determinism

Systems that claim deterministic behaviour must reproduce their declared result when supplied with the same versioned inputs and configuration.

### C-06 — Persistence Compatibility

Changes to persisted structures must explicitly consider compatibility, migration and recovery consequences.

### C-07 — Architectural History

Consequential architectural decisions must remain historically explainable.

### C-08 — Automated Enforcement

Critical invariants that can reasonably be verified by machines should be machine-enforced.

### C-09 — Requirement-Protecting Tests

Tests must protect declared behaviour, requirements, regressions, contracts or invariants rather than exist primarily to increase coverage statistics.

### C-10 — Verification Reliability

A flaky, misleading or unreliable verification mechanism is itself an engineering defect.

### C-11 — Healthy Integration Branch

The primary integration branch is expected to remain buildable, bootable and regression-green.

### C-12 — Evidence-Based Complexity

Engineering complexity must be justified by current requirements, demonstrated evidence or known extension boundaries rather than hypothetical future possibilities alone.

### C-13 — Proportional Scrutiny

Engineering scrutiny and verification must increase with change risk and blast radius.

### C-14 — Equal Accountability for AI Work

AI-generated engineering work has the same correctness, provenance, security, documentation and verification obligations as human-written work.

### C-15 — No Blind Agent Acceptance

Consequential AI-generated implementation must not be accepted solely because the producing agent reports success.

### C-16 — Upstream Discipline

Third-party and upstream code must not accumulate unnecessary Leyforge-specific divergence.

### C-17 — Explicit Exceptions

Engineering exceptions must be explicit, justified, scoped and traceable.

### C-18 — Temporary Constraint Lifecycle

Temporary engineering constraints must state why they exist and what condition requires their reconsideration.

### C-19 — Safe Deprecation

Deprecated persistent interfaces, identities and schemas must not disappear until their compatibility consequences have been resolved.

### C-20 — Engineering Traceability

Consequential engineering behaviour must be traceable from relevant authority through architecture and verification to implementation where practical.

### C-21 — Project Knowledge Propagation

Engineering knowledge that materially affects future work must be propagated into the Project Brain.

### C-22 — Brain Non-Duplication

The Project Brain may index, connect and explain authoritative engineering information but must not become a competing copy of engineering or content authority.

### C-23 — Explicit Trust Boundaries

Security and trust boundaries must be explicit. Externally supplied content, data and requests are not implicitly trusted.

### C-24 — Governance Must Become Operational

Critical governance rules should terminate in enforceable mechanisms such as validation, testing, review, tooling or manual acceptance wherever practical rather than existing only as prose.

---

## 04. Normative Rule Language

Subordinate engineering standards use four normative strengths.

**MUST** identifies a mandatory requirement unless an authorised exception exists.

**SHOULD** identifies the expected default. Departure requires a defensible reason.

**MAY** identifies an explicitly permitted option.

**PROHIBITED** identifies a practice that may not be used without an authorised exception.

Normative requirements may additionally identify their principal enforcement mechanism through tags such as `[AUTO]`, `[TEST]`, `[REVIEW]`, `[MANUAL]` and `[TRACE]`.

Rule strength and enforcement mechanism are separate concepts.

A requirement may be mandatory even where complete automated enforcement is not practical.

---

## 05. Change-Risk Classification

Engineering changes are classified according to their highest meaningful risk rather than patch size.

**Class A — Local:** low-blast-radius changes such as isolated presentation, documentation corrections and other non-authoritative local modifications.

**Class B — System:** behavioural changes within a subsystem that require relevant regression evidence.

**Class C — Architectural:** changes to module ownership, interfaces, authority boundaries or technical architecture.

**Class D — Persistence / Identity:** changes affecting saves, stable identifiers, registry schemas, world-generation identity, migrations or other long-lived compatibility boundaries.

**Class E — Critical Foundation:** changes involving high-systemic-risk areas such as concurrency, authoritative networking, security boundaries, core data integrity, foundational voxel persistence or similarly critical infrastructure.

Where classification is genuinely uncertain, the change should be treated as the higher-risk class.

Subordinate standards define the verification and approval requirements associated with each class.

---

## 06. Architecture Decisions

Consequential architectural decisions must be preserved through Architecture Decision Records when they establish or materially change architecture that future engineers or agents will need to understand.

Typical ADR subjects include system ownership, module boundaries, persistent representation, cross-system interfaces, concurrency strategies, major technology dependencies, network authority, security boundaries, world-generation architecture and persistence architecture.

Routine implementation decisions do not require ADRs.

An accepted ADR is historical evidence.

When a decision changes, the original ADR remains part of the record and is superseded rather than rewritten to conceal the previous decision.

---

## 07. Verification and Evidence

Leyforge uses layered verification.

Fast, deterministic and focused verification should be preferred where it can adequately prove behaviour.

Broader integration, scenario, end-to-end, soak, benchmark and manual acceptance testing are added where the nature and risk of the system require them.

Not every change requires every verification layer.

Verification depth is proportional to risk.

Consequential regression tests should identify the requirement, invariant, incident, architecture contract or other behaviour they protect.

Manual testing remains necessary for behaviour that cannot be adequately proven through automation, including visual correctness, usability, feel, emergent interactions and other human-facing qualities.

Automated testing and manual acceptance complement rather than replace one another.

A flaky test must be investigated as an engineering defect. Temporary quarantine is permitted only when its reason, scope and remediation or reconsideration condition are recorded.

---

## 08. Persistence and Identity

Persistent data is treated as a long-lived engineering interface.

Changes affecting persistence must consider schema versioning, migration, compatibility, rejection behaviour, stable identity, content compatibility, world-generation identity, recovery behaviour and appropriate regression fixtures.

Persistent references must not depend solely on mutable presentation properties such as display names, translated strings, interface labels, file ordering, array position or temporary scene structure.

Incompatible persistent data should fail safely and diagnostically rather than being silently reinterpreted.

Where reasonably practical, persistence mechanisms should protect the previous known-good state against interrupted or failed writes.

Detailed save, schema and migration requirements are defined by ENG-GOV-08.

---

## 09. Simulation Authority and Determinism

Leyforge distinguishes authoritative state from presentation state.

Authoritative state defines what actually exists and what has actually occurred within the simulation.

Presentation state represents the currently visualised, instantiated or locally detailed projection of that authoritative state.

Chunk streaming, actor loading, LOD, visual simplification and presentation budgets may alter presentation cost.

They must not silently alter authoritative truth.

Near and far simulation may use different implementations where required, but transitions between them must preserve declared authoritative state and conservation rules.

Systems claiming deterministic behaviour must identify the versioned inputs, algorithms and configuration that define their deterministic boundary.

Changes that break that deterministic contract require explicit version consideration.

---

## 10. Performance and Scalability

Leyforge must account for known scale constraints during architecture while avoiding speculative optimisation without evidence.

Performance-sensitive systems should eventually have measurable budgets, repeatable benchmarks or equivalent evidence appropriate to their risk.

Performance evidence should identify enough context to make results meaningful, including scenario, relevant configuration, measurement method and regression boundary.

Performance profiles and scalability settings may alter presentation cost and explicitly permitted simulation detail.

They must not secretly change authoritative outcomes unless the game design explicitly defines such behavioural variation.

---

## 11. Security and Trust

Engineering systems must define their trust boundaries.

Data originating outside an authoritative trusted boundary must be validated appropriately before affecting authoritative state.

This principle applies to systems including mods, Forge-created content, downloaded content packs, multiplayer input, network messages, imported saves, external configuration and user-provided assets.

Security-sensitive failure should prefer safe rejection over permissive guessing.

Credentials, secrets and other sensitive authentication material must not be committed to ordinary project source or unnecessarily exposed through logs.

Detailed security and player-content boundary requirements are defined by ENG-GOV-13.

---

## 12. Third-Party and Upstream Engineering

Leyforge distinguishes upstream-owned, vendored, forked and Leyforge-owned code.

Upstream code should retain upstream conventions and structure where practical so that Leyforge does not create unnecessary maintenance divergence.

Formatting or structural rewrites must not be performed merely to make third-party code resemble Leyforge-owned code.

Meaningful Leyforge-specific changes to important upstream components must remain identifiable and explainable.

For significant dependencies, the project should be able to determine their origin, version or commit, Leyforge-specific modifications, licensing obligations and expected upgrade implications.

Detailed requirements are defined by ENG-GOV-15.

---

## 13. AI and Coding Agents

AI coding agents operate under the same engineering authority as any other contributor.

Before consequential work, an agent must obtain sufficient project context to identify relevant authority, architecture, engineering standards, known decisions and applicable project knowledge.

An agent must not invent canonical requirements merely to unblock implementation.

It must not silently alter persistent identities, dismiss failed verification without evidence, casually remove compatibility behaviour, rewrite architectural history or assume generated implementation is correct because it compiles.

After consequential work, the change must receive the verification appropriate to its risk class.

Higher-risk work must not rely exclusively on the producing agent's own self-assessment.

Agent instruction files are operational interfaces to authoritative project rules.

They do not replace those rules.

Detailed AI and coding-agent requirements are defined by ENG-GOV-12.

---

## 14. Exceptions, Waivers and Temporary Constraints

Engineering rules may require exceptions.

Exceptions must be explicit rather than becoming invisible local convention.

An approved exception records the affected rule, reason, scope, risk, mitigation, responsible authority, duration where relevant and its reconsideration or expiry condition.

Approval of one exception does not automatically establish a general precedent.

Temporary constraints must additionally record why the constraint currently exists and the event or evidence that should cause it to be reconsidered.

Emergency deviations required to restore a broken build, protect data integrity or recover from another critical failure may occur where necessary, but they must be documented before normal development proceeds.

Detailed procedures are defined by ENG-GOV-14.

---

## 15. Deprecation and Supersession

Engineering systems distinguish active, deprecated, compatibility-only, superseded and removed states where such distinctions are relevant.

Deprecated behaviour must remain identifiable while it is still required.

Before a persistent interface, identifier, schema or compatibility path is removed, its known runtime, saved-data, registry, tool, Forge, networking, test, documentation and migration consequences must be considered.

Absence of an obvious current source-code reference is not by itself sufficient proof that a persistent interface is safe to delete.

---

## 16. Documentation and Traceability

Consequential implementation should remain traceable to its governing authority where practical.

A complete traceability chain may connect canonical requirements, engineering standards, architecture documents, ADRs, schemas or registries, implementation and verification evidence.

This requirement applies to consequential systems and behaviours rather than every individual line of source code.

Comments should primarily preserve reasoning, constraints and context that cannot be communicated clearly by the code itself.

Comments must not become an unmanaged second copy of canonical game design.

When architecture or semantic behaviour materially changes, the authoritative documentation representing that behaviour must be updated.

---

## 17. Branch A ↔ Branch B Synchronization

Branch A — the Leyforge Project Brain — and Branch B — Leyforge Engineering Governance — operate as separate but synchronized authority domains.

Branch A owns project knowledge organisation, navigation, indexes, work logs, reusable Skills and Patterns, recorded Failures and Antipatterns, status information, document relationships and authority maps.

Branch B owns engineering law, engineering standards, engineering procedures, ADR governance, engineering exceptions and engineering validation requirements.

Branch A does not replace Branch B's engineering authority.

Branch B does not replace Branch A's knowledge infrastructure.

Consequential changes to engineering standards, ADRs, exceptions, temporary constraints, deprecated practices, build or test procedures, major architecture relationships, engineering failures and reusable engineering discoveries must propagate into the Project Brain.

Changes to the Brain's authority mapping, engineering workflow, Skills Registry structure, work-log requirements, document lifecycle or engineering traceability model must trigger consideration of whether Branch B governance also requires amendment.

A consequential engineering decision must not exist only in chat.

Once the repository Project Brain is operational, it becomes the durable synchronization medium between these branches.

---

## 18. Enforcement and Quality Gates

Engineering governance should use layered enforcement appropriate to the nature of each rule.

Possible enforcement mechanisms include author guidance, agent instructions, editor checks, static validation, local preflight tools, automated tests, CI gates, architectural review and manual acceptance.

Machine-checkable critical invariants should migrate toward automated enforcement where reasonably practical.

New warnings are presumed actionable unless deliberately classified otherwise.

Known unavoidable warnings must be explicitly identified so that genuine failures are not normalised as harmless noise.

Higher-risk changes require proportionally stronger evidence.

Detailed quality-gate requirements are defined by subordinate standards.

---

## 19. Governance Debt

Leyforge recognises governance debt.

A rule may be known to require stronger automated enforcement before the automation exists.

Such gaps may be recorded as governance debt rather than forcing development to halt solely because every desired governance mechanism has not yet been implemented.

Governance debt must remain visible and should be prioritised according to the risk of the invariant it leaves weakly enforced.

Governance debt does not permit violation of the underlying rule.

Where manual enforcement is insufficient to protect a critical invariant, the missing enforcement mechanism becomes blocking work.

---

## 20. Amendment, Lifecycle and Certification

ENG-GOV-00 may evolve when evidence shows that its constitutional principles require amendment.

A constitutional amendment must identify the problem, proposed change, affected subordinate standards, relevant architecture or canon implications and required Project Brain updates.

Routine procedural changes belonging to ENG-GOV-01 through ENG-GOV-15 do not require constitutional amendment unless they alter a constitutional principle.

Historical versions remain recoverable through version control.

ENG-GOV-00 uses the following lifecycle states:

**DRAFT** — constitutional design remains unresolved.

**THEORETICALLY LOCKED** — all constitutional decisions have been resolved and accepted.

**IMPLEMENTATION-READY** — subordinate engineering standards exist sufficiently to operationalise the Constitution.

**V1 CERTIFIED** — the complete engineering-governance family has been reconciled against authoritative canon, architecture, discovery work, Project Brain structure, registries, repository organisation and implemented engineering gates.

Version v0.1 is **THEORETICALLY LOCKED**.

Its transition to IMPLEMENTATION-READY depends upon completion and reconciliation of the subordinate ENG-GOV standard family.

---

# Subordinate Governance Family

ENG-GOV-00 governs the following document family:

**ENG-GOV-01** — Codebase Engineering Standard  
**ENG-GOV-02** — Repository & Module Structure Standard  
**ENG-GOV-03** — Source Style & Naming Standard  
**ENG-GOV-04** — Git / Branch / Change Standard  
**ENG-GOV-05** — Testing & Verification Standard  
**ENG-GOV-06** — CI / Quality Gate Standard  
**ENG-GOV-07** — Diagnostics / Logging / Observability Standard  
**ENG-GOV-08** — Save / Schema / Migration Standard  
**ENG-GOV-09** — Registry / Stable Identity Standard  
**ENG-GOV-10** — Performance / Benchmark Standard  
**ENG-GOV-11** — Architecture Decision Record Standard  
**ENG-GOV-12** — AI / Coding Agent Standard  
**ENG-GOV-13** — Security / Player Content Boundary Standard  
**ENG-GOV-14** — Engineering Exception / Waiver / Deprecation Standard  
**ENG-GOV-15** — Third-Party / Upstream Integration Standard

No subordinate standard may silently contradict ENG-GOV-00.

Where such a contradiction is discovered, the contradiction must be reconciled explicitly through amendment, correction or an appropriately governed exception.

---

## Constitutional Closing Principle

Leyforge engineering governance exists to make the project easier to understand, safer to change and harder to accidentally corrupt.

Governance must therefore protect engineering quality without becoming an obstacle whose administrative cost exceeds the risks it exists to control.

The preferred Leyforge engineering system is one in which authority is discoverable, decisions are explainable, important invariants are enforceable, failures become reusable knowledge, complexity is justified by evidence and every contributor — human or artificial — can determine not only what the project currently does, but why it is allowed to do it that way.
