# LEYFORGE PROJECT BRAIN
## Authority & Truth Resolution Model

**Document ID:** LF-BRAIN-02  
**Version:** v0.1  
**Status:** LOCKED — Branch A Design v0.1 — Ready for Pre-Production Implementation  
**Branch:** A — Leyforge Project Brain / Obsidian  
**Parent:** LF-BRAIN-01 — Project Brain Architecture & Governance Specification  
**Purpose:** Define how the Leyforge Project Brain identifies authority, resolves supersession, distinguishes normative truth from observed implementation state, handles contradictions, and prevents silent authority drift.

---

## 1. Purpose

Leyforge contains many classes of information:

- design canon;
- engineering governance;
- requirements;
- architecture;
- registries;
- implementation;
- tests;
- benchmarks;
- research;
- historical documents;
- decisions;
- work records;
- generated reports;
- provisional ideas.

These classes do not possess the same authority.

The Project Brain must therefore be capable of answering:

> **What kind of truth is this, who owns it, what outranks it, and what should happen if another source disagrees?**

This document defines that model.

The Brain SHALL use explicit authority relationships rather than assuming that:

- the newest file is automatically correct;
- the most recently edited file is authoritative;
- implementation behaviour defines intended design;
- test results define requirements;
- a Brain summary can overrule its source;
- an AI-generated note has authority merely because it exists;
- a document with a higher version number necessarily supersedes another document outside its own lineage.

---

## 2. Fundamental Principle: Authority Is Domain-Specific

Leyforge SHALL NOT use one universal linear hierarchy in which every document can be ranked from highest to lowest.

Authority is **domain-specific**.

A source may be authoritative for one question and irrelevant for another.

Example:

```text
Question:
"What behaviour should a material have?"

Relevant authority:
content/canon authority

Question:
"How should the implementation represent that material in code?"

Relevant authority:
engineering + implementation architecture authority

Question:
"What stable registry identity does that material use?"

Relevant authority:
certified registry authority

Question:
"Does the current build actually behave correctly?"

Relevant authority:
runtime observation + test evidence
```

Accordingly, the Brain SHALL resolve truth by:

1. identifying the question domain;
2. identifying the authority owner for that domain;
3. locating the current authoritative source;
4. applying supersession rules within that authority lineage;
5. comparing implementation and evidence separately;
6. recording unresolved conflicts instead of inventing authority.

---

## 3. Truth Classes

The Brain SHALL distinguish at least the following truth classes.

### 3.1 Normative Truth

Normative truth defines what Leyforge **is intended or required to be**.

Examples include:

- canon;
- requirements;
- engineering rules;
- architecture decisions;
- registry contracts;
- save/version rules;
- production gates.

Normative truth answers:

> "What should be true?"

---

### 3.2 Implemented Truth

Implemented truth describes what the current code, data or build **actually contains or does**.

Examples include:

- current source behaviour;
- current registry contents;
- current save format implementation;
- current build configuration;
- current tooling behaviour.

Implemented truth answers:

> "What is currently implemented?"

Implemented truth SHALL NOT automatically redefine normative truth.

If implementation disagrees with normative authority, the default assumption is:

```text
normative requirement
        ≠
current implementation
        ↓
implementation discrepancy / defect / migration need
```

unless an authorised decision explicitly changes the normative source.

---

### 3.3 Observed Truth

Observed truth records what was directly seen, measured or reproduced.

Examples include:

- manual testing;
- automated test output;
- benchmark result;
- crash reproduction;
- profiler capture;
- build output;
- generated diagnostic evidence.

Observed truth answers:

> "What happened under these stated conditions?"

Observed truth may prove that implementation differs from its requirements.

It does not independently redefine those requirements.

---

### 3.4 Historical Truth

Historical truth records what **was previously authoritative, implemented, believed or observed**.

Historical records remain useful for:

- migration;
- regression diagnosis;
- decision history;
- archaeology;
- failed-approach avoidance;
- understanding why current architecture exists.

Historical truth SHALL be retained where materially useful but clearly marked as non-current.

---

### 3.5 Interpretive / Derived Knowledge

Interpretive knowledge is produced by analysing other sources.

Examples include:

- Brain entity summaries;
- generated dashboards;
- dependency maps;
- audit summaries;
- research syntheses;
- traceability reports.

Interpretive knowledge SHALL cite or link its supporting authorities.

It SHALL NOT outrank the sources from which it is derived.

---

### 3.6 Provisional Knowledge

Provisional knowledge includes:

- candidate design ideas;
- hypotheses;
- temporary notes;
- research possibilities;
- unvalidated Skills;
- Inbox material;
- unresolved proposals.

Provisional knowledge has no authority over locked project truth unless promoted through the relevant governance process.

---

## 4. Authority Domains

The Brain SHALL maintain explicit authority domains.

Initial domains are expected to include at least:

### 4.1 Project-Control Authority

Covers:

- project structure;
- branch responsibilities;
- authority ownership;
- pre-production gates;
- production sequencing where explicitly delegated.

Relevant sources may include Branch A–D governance documents and master coordination records.

---

### 4.2 Content / Canon Authority

Covers:

- realms;
- materials;
- species;
- cultures;
- structures;
- items;
- progression concepts;
- content identity;
- gameplay-world definitions assigned to canon document families.

FCC and other certified content authorities may own this domain depending on the subject.

The Brain SHALL not assume that every historic content document is currently authoritative.

---

### 4.3 Requirements Authority

Covers explicit implementation-facing requirements.

This may include:

- system requirements;
- acceptance requirements;
- platform requirements;
- player-facing behaviour requirements;
- production requirements.

The final source ownership shall be determined by the certified Leyforge documentation corpus.

---

### 4.4 Engineering Governance Authority

Covers:

- coding standards;
- repository conventions;
- testing policy;
- diagnostic requirements;
- Git practice;
- ADR procedure;
- AI coding behaviour;
- engineering change control.

Branch B engineering-governance documents own this domain once locked.

---

### 4.5 Architecture Authority

Covers:

- subsystem boundaries;
- runtime architecture;
- save architecture;
- networking architecture;
- worldgen architecture;
- Forge architecture;
- integration contracts;
- technical ownership boundaries.

Architecture authority may be expressed through engineering documents and approved ADRs.

---

### 4.6 Registry Authority

Covers:

- stable identities;
- registered entities;
- registry schemas;
- cross-registry relationships;
- canonical IDs;
- implementation mapping where formally certified.

A registry is authoritative only for the fields and domain it has been formally assigned.

Legacy or experimental registries SHALL NOT become authoritative merely because they are machine-readable.

---

### 4.7 Implementation State Authority

Source code, configuration and current runtime assets are authoritative for the narrow question:

> "What is currently implemented?"

They are not automatically authoritative for:

> "What should be implemented?"

This distinction SHALL be represented explicitly in the Brain.

---

### 4.8 Test & Evidence Authority

Tests and evidence are authoritative for their recorded result under their stated:

- version;
- build;
- commit;
- environment;
- fixture;
- test procedure;
- conditions.

They do not independently define canon or requirements.

---

### 4.9 Research Authority

Research records provide evidence, comparison or external knowledge.

Research may influence future project decisions.

Research SHALL NOT directly overwrite Leyforge authority.

An explicit decision or document amendment is required to promote research findings into project truth.

---

### 4.10 Brain-Operations Authority

Branch A Brain governance owns:

- Brain schema;
- Brain note classes;
- Brain IDs;
- Brain lifecycle rules;
- agent interaction with Brain records;
- Brain navigation;
- Brain validation;
- Brain Doctor;
- Brain-generated information.

This authority does not extend into unrelated project domains.

---

### 4.11 Audit Authority

Covers:

- audit methodology;
- reconciliation procedure;
- certification evidence;
- audit findings;
- audit gates;
- V1 documentation certification.

Branch C owns V1 audit methodology once established. Brain audit records represent and expose that process without replacing it.

---

### 4.12 Production / Roadmap Authority

Covers:

- production sequencing;
- stage progression;
- implementation gates;
- pre-production readiness;
- rebuild progression.

Branch D owns production/rebuild sequencing once established. Brain dashboards may derive and display production state but do not independently change it.

---

## 5. Authority Roles

Each authoritative source or record should, where appropriate, identify one of the following roles.

### 5.1 Primary Authority

The controlling source for a defined domain or subject.

There should normally be one current primary authority for a given question at a given scope.

---

### 5.2 Delegated Authority

A source explicitly authorised by a primary authority to define a narrower subject.

Example:

```text
Engineering Constitution
        ↓ delegates
Codebase Engineering Standard
        ↓ defines
code conventions
```

Delegation SHALL be explicit or structurally defined.

---

### 5.3 Supporting Authority

A source that constrains or supplements the primary authority without replacing it.

---

### 5.4 Implementation Record

Describes current implementation state.

It does not become normative merely by being executable.

---

### 5.5 Evidence Record

Supports or challenges claims through measurement or testing.

---

### 5.6 Derived Record

Summarises, indexes or computes information from other records.

---

### 5.7 Historical Record

Formerly valid or useful information that is no longer current authority.

---

### 5.8 Provisional Record

Unapproved or unresolved information.

---

## 6. No "Newest File Wins" Rule

Creation and modification timestamps are useful metadata but SHALL NOT determine authority by themselves.

The following are explicitly prohibited as authority rules:

```text
newest ModifiedAt wins
highest filename version wins globally
most recently uploaded copy wins
most recently discussed source wins
longest document wins
machine-readable source wins
code wins because it runs
Brain summary wins because it is convenient
```

Authority must instead be established by:

- declared ownership;
- certified status;
- lineage;
- supersession;
- explicit governance;
- subject scope.

---

## 7. Source Lineage

The Brain SHALL track document and authority lineage.

Example:

```text
DOC-X v0.1
   ↓ revised by
DOC-X v0.2
   ↓ superseded by
DOC-X v1.0
```

Where the lineage is valid, the current certified descendant becomes the current authority.

However:

```text
DOC-X v1.0
```

does not automatically supersede:

```text
DOC-Y v0.4
```

unless the project authority model states that X owns Y's subject or explicitly supersedes it.

---

## 8. Supersession Types

The Brain SHALL distinguish supersession types.

### 8.1 Full Supersession

The successor replaces the predecessor for its complete authoritative scope.

```text
Old Source
   ↓ fully superseded by
New Source
```

The old source becomes historical.

---

### 8.2 Partial Supersession

Only specified sections, rules or subject areas are replaced.

The Brain must preserve what remains authoritative.

---

### 8.3 Amendment

An amendment modifies the parent authority without replacing it as an independent whole.

The Brain should represent:

```text
Base Authority
+
Active Amendments
=
Current Effective Authority
```

where that model is used by the document family.

---

### 8.4 Consolidation

Multiple previous authorities are reconciled into one successor.

The Brain should retain all predecessors and record their consolidation mapping.

---

### 8.5 Retirement

A source or concept is deliberately removed without a direct replacement.

Retirement SHALL be explicit.

---

### 8.6 Historical Preservation

Superseded or retired material may remain searchable but SHALL be excluded from default "current authority" queries.

---

## 9. Authority Status Vocabulary

The Brain Schema should support authority states such as:

```text
draft
proposed
theoretically_locked
authoritative
certified
superseded
retired
historical
rejected
unresolved
not_applicable
```

Exact valid combinations shall be finalised in LF-BRAIN-03 / the Brain Schema.

A record's lifecycle status and authority status SHOULD remain distinguishable where necessary.

Example:

```yaml
status: active
authority_status: certified
```

---

## 10. Current Authority Resolution Algorithm

When a human or agent needs to determine project truth, the Brain SHALL guide the following process.

```text
1. Identify the question.
        ↓
2. Identify the authority domain.
        ↓
3. Identify the subject scope.
        ↓
4. Find the declared primary/delegated authority.
        ↓
5. Check status and certification.
        ↓
6. Follow supersession/amendment lineage.
        ↓
7. Check relevant cross-domain constraints.
        ↓
8. Compare implementation state separately.
        ↓
9. Check evidence/tests separately.
        ↓
10. If authority remains ambiguous:
       create or surface a conflict.
```

An agent SHALL NOT skip directly from search result to assumed truth.

---

## 11. Cross-Domain Constraints

Different authority domains may legitimately constrain one another.

Example:

```text
Canon:
A portal exists.

Architecture:
Portal transport uses system X.

Engineering Governance:
System X must follow save/version rule Y.

Registry:
Portal has stable ID Z.

Tests:
Verify X + Y + Z behave as required.
```

None of these authorities replaces the others.

The Brain SHALL represent these as relationships rather than flattening them into one document hierarchy.

---

## 12. Normative vs Implementation Conflict

If normative authority and implementation disagree:

```text
NORMATIVE
"System must do A"

IMPLEMENTATION
"Current build does B"
```

the Brain SHALL treat this as an implementation discrepancy unless an authorised change has altered the normative requirement.

Possible records may include:

- bug;
- migration task;
- technical debt;
- implementation gap;
- intentional temporary deviation;
- unresolved conflict.

The implementation SHALL NOT silently become canon.

---

## 13. Test Failure Behaviour

A failing test may indicate:

- implementation defect;
- incorrect test;
- stale test;
- stale requirement mapping;
- environment issue;
- nondeterministic behaviour;
- incomplete migration.

A failing test does not, by itself, prove which of these is responsible.

The Brain should connect:

```text
Requirement
↕
Implementation
↕
Test
↕
Evidence
```

so the cause can be resolved explicitly.

---

## 14. Registry Conflict Behaviour

If a registry disagrees with certified canon or another controlling authority, the Brain SHALL determine whether the registry is:

- stale;
- legacy;
- generated from an obsolete source;
- incorrectly mapped;
- itself the delegated authority for the disputed field.

A machine-readable registry SHALL NOT automatically outrank certified canon.

Likewise, canon SHALL NOT be allowed to silently invalidate a formally delegated registry contract without the required amendment/migration process.

---

## 15. Research Promotion Rule

External research or experimentation follows this path:

```text
RESEARCH
   ↓
finding
   ↓
evaluation
   ↓
decision / amendment
   ↓
authoritative project update
```

Research alone remains evidentiary.

The Brain may record:

```text
research suggests X
```

but may not transform that into:

```text
Leyforge requires X
```

without an authorised project decision.

---

## 16. AI-Generated Content Rule

AI-generated text has no special authority merely because it was produced by an authorised development agent.

Its authority depends on:

- the record type;
- the agent's delegated permissions;
- required review/validation;
- source authority;
- lifecycle status.

AI may autonomously maintain certain operational Brain records where explicitly permitted.

AI SHALL NOT silently elevate provisional content into locked canon or governance.

---

## 17. Brain Summary Fidelity Rule

Brain summaries, entity nodes and indexes SHALL remain faithful to their cited authority.

They may simplify navigation but SHALL NOT:

- add unsupported requirements;
- remove material constraints;
- resolve ambiguity without authority;
- merge distinct concepts because they appear similar;
- modernise historic language in a way that changes meaning;
- silently reconcile conflicting sources.

Where a concise summary cannot safely preserve meaning, the Brain should link directly to the authoritative source instead.

---

## 18. Conflict Records

Unresolved authority conflicts SHALL use explicit conflict records.

A conflict record should contain, at minimum:

```yaml
id: CONFLICT-0001
type: conflict
brain_schema: 1
status: detected

domain:
subject:

sources:
  - ...
  - ...

authority_question:
impact:
resolution_owner:
```

The body should capture:

- Source A claim;
- Source B claim;
- relevant authority roles;
- scope;
- known dependencies;
- implementation impact;
- audit impact;
- proposed resolution route;
- final decision when resolved.

---

## 19. Conflict Severity

Conflict severity should distinguish at least:

```text
informational
minor
significant
blocking
constitutional
```

Examples:

### Informational
Two historical notes use different wording but no current system is affected.

### Minor
A summary label differs from the current canonical title.

### Significant
Two current authorities disagree about system behaviour.

### Blocking
Implementation cannot safely continue until authority is resolved.

### Constitutional
The conflict concerns authority ownership or governance itself.

Constitutional conflicts SHALL be escalated to the appropriate project-control authority.

---

## 20. Conflict Resolution Ownership

The Brain may identify and route conflicts.

It SHALL NOT automatically assume ownership of their resolution.

Resolution ownership depends on domain.

Examples:

```text
Content/canon conflict
→ content/canon authority or V1 audit process

Engineering governance conflict
→ Branch B governance authority

Brain schema conflict
→ Branch A authority

Audit-method conflict
→ Branch C authority

Production sequencing conflict
→ Branch D authority
```

Cross-branch conflicts may require master coordination.

---

## 21. Interaction with Branch C — V1 Documentation Audit

Branch C will eventually provide the formal audit and reconciliation machinery for the Leyforge V1 corpus.

LF-BRAIN-02 therefore defines the **Brain representation and truth-resolution behaviour**, while Branch C will define the **project process used to reconcile and certify the documentation corpus**.

The relationship is:

```text
Branch C
resolves / certifies
        ↓
Branch A
records / indexes / exposes
```

The Brain SHALL be capable of representing unresolved pre-audit authority without pretending that certification has already occurred.

---

## 22. Interaction with Branch B — Engineering Governance

Branch B governs engineering practice.

The Brain SHALL:

- index Branch B governance;
- surface relevant rules to agents;
- connect ADRs to engineering governance;
- connect implementation to applicable standards;
- record violations or unresolved governance questions where appropriate.

Branch A SHALL NOT rewrite Branch B engineering laws.

Branch B SHALL likewise avoid redefining Brain-specific data architecture unless coordinated through the established cross-branch contract.

---

## 23. Interaction with Branch D — Production Roadmap

Branch D owns production and rebuild sequencing once defined.

The Brain may display:

- current stage;
- gate status;
- blockers;
- completed milestones;
- next work.

However, dashboards are derived views.

They do not independently alter the Branch D production roadmap.

---

## 24. Authority Metadata

Formal Brain records that reference authority should support fields conceptually similar to:

```yaml
authority_domain:
authority_role:
authority_status:
authority_scope:

source_of_truth:
supersedes:
superseded_by:
amends:
amended_by:

effective_from:
effective_until:
```

Not every field is required for every note type.

The exact schema shall be defined later.

---

## 25. Canonical Source Pointer

Where a Brain entity represents project-domain knowledge, it should maintain a pointer to its controlling authority.

Example:

```yaml
id: SYS-SETTLEMENT
type: system

authority_domain:
  - content
  - requirements

source_of_truth:
  - DOC-24
  - FCC-01-S24
```

The Brain entity may provide navigation and relationships but must not silently become an alternative source.

---

## 26. Multi-Source Authority

Some subjects legitimately require multiple authorities.

The Brain SHALL support this.

Example:

```text
Settlement System
│
├── Canon identity
├── Gameplay requirements
├── Architecture contract
├── Registry IDs
├── Save contract
├── Engineering standards
└── Test evidence
```

The Brain should expose **which source controls which dimension**.

It should not pretend there is one magical document containing every kind of truth.

---

## 27. Unknown Authority

If the Brain cannot determine authority, it SHALL say so.

Allowed state:

```text
authority_status: unresolved
```

or equivalent.

Disallowed behaviour:

```text
"I found this first, therefore it is authoritative."
```

Unknown authority should become:

- an audit item;
- a conflict;
- an open question;
- a source-classification task.

---

## 28. Source Freshness

Freshness is relevant but subordinate to authority.

The Brain may consider:

- document version;
- certification date;
- modification date;
- project phase;
- supersession chain;
- content references.

However, a newer copy of old information is still old information.

A recently edited historical document SHALL NOT automatically re-enter current authority.

---

## 29. Copies and Mirrors

Leyforge may contain:

- local backup copies;
- exported bundles;
- mirrored documents;
- archived packages.

Copies SHALL NOT create multiple independent authorities.

The Brain should, where possible, identify:

```text
logical_document_id
canonical_location
mirror_location
content_hash
```

or equivalent mechanisms.

A mirror inherits authority from the logical source only while it faithfully matches the authorised version.

---

## 30. Generated Authority Maps

The Brain may generate authority maps and coverage reports.

Example:

```text
SYSTEM: Settlement
Canon authority           ✓
Requirements authority    ✓
Architecture authority    ✓
Registry mapping          ✓
Implementation mapping    ✓
Test coverage              !
Evidence                   !
```

These are derived diagnostics.

The map does not itself become the authority.

---

## 31. Implementation Deviations

Intentional temporary deviations from normative authority SHALL be explicit.

A deviation record should identify:

- governing requirement;
- current deviation;
- justification;
- owner;
- risk;
- expiry or removal condition;
- affected tests;
- migration/remediation plan.

Temporary implementation convenience SHALL NOT silently become permanent architecture.

---

## 32. Locked Decisions

A theoretically locked or accepted project decision remains authoritative according to its declared scope until:

- formally amended;
- superseded;
- retired;
- invalidated through the appropriate project-governance process.

Discussion occurring after a lock does not automatically unlock the decision.

The Brain SHALL preserve both:

- current lock status;
- supersession/amendment lineage.

---

## 33. Brain Read Behaviour for Agents

Before significant work, an agent should resolve authority through the Brain in approximately this order:

```text
AGENTS.md
    ↓
Current Handoff
    ↓
Relevant System / Entity Node
    ↓
Authority pointers
    ↓
Current controlling documents
    ↓
Applicable ADRs / governance
    ↓
Implementation state
    ↓
Tests / evidence
    ↓
Skills / antipatterns
```

This ordering is designed to reduce:

- stale-context errors;
- duplicate work;
- accidental canon drift;
- implementation-first reasoning.

---

## 34. Brain Write Behaviour for Agents

After significant work, an agent may update the Brain according to its delegated write permissions.

It SHALL NOT alter authority merely because implementation changed.

Example:

```text
Code changed
   ↓
Implementation node updated
   ↓
Test evidence updated
```

If the code change also requires normative change:

```text
Code change suggests requirement change
   ↓
authorised decision / amendment process
   ↓
normative authority updated
   ↓
Brain authority map updated
```

---

## 35. Authority Health Checks

Brain Doctor should eventually verify:

- every significant current entity has an authority pointer or explicit unresolved state;
- superseded sources are not marked current;
- two primary authorities do not claim identical scope without explicit reconciliation;
- generated summaries do not claim primary authority;
- implementation nodes do not masquerade as canon;
- evidence records identify build/context;
- amendments point to valid parents;
- supersession relationships are reciprocal where required;
- current authority resolves to a valid active source;
- historical sources remain excluded from default current views.

---

## 36. Required Default Behaviour

When uncertain, the Brain SHALL prefer:

```text
FLAG
LINK
ESCALATE
```

over:

```text
GUESS
MERGE
OVERWRITE
```

This is a core anti-drift rule.

---

## 37. Initial Authority Laws

The following laws are provisionally established:

1. Authority is domain-specific.
2. Normative truth and implemented truth are distinct.
3. Observed behaviour does not automatically redefine intended behaviour.
4. The newest file does not automatically win.
5. File modification timestamps do not establish authority.
6. Version numbers only establish precedence inside a valid lineage.
7. Brain summaries do not outrank their sources.
8. Research requires explicit promotion before becoming project authority.
9. AI-generated content has only the authority explicitly delegated to its record type.
10. Legacy registries do not become authoritative merely because they are machine-readable.
11. Current code is authoritative for current implementation state, not intended design.
12. Tests are authoritative for recorded observations under stated conditions, not for canon.
13. Significant unresolved contradictions become Conflict records.
14. Conflicts are resolved by the authority owner for the affected domain.
15. Superseded authority is preserved historically.
16. Multi-source authority is valid where different sources control different dimensions.
17. Unknown authority must remain explicitly unknown until resolved.
18. Mirrors and backups do not create duplicate authority.
19. Intentional deviations from authority must be explicit and traceable.
20. Significant authority changes require an authorised decision, amendment, supersession or certification action.

---

## 38. Status

This document establishes the Authority & Truth Resolution Model for Leyforge Brain v0.1.

It has been reconciled with LF-BRAIN-01 through LF-BRAIN-13, the locked Branch B engineering-governance direction, and the defined Branch C/D ownership boundaries.

It is **LOCKED as the controlling Brain-domain authority for how Leyforge knowledge is classified, resolved, linked and surfaced without silent authority drift**.
