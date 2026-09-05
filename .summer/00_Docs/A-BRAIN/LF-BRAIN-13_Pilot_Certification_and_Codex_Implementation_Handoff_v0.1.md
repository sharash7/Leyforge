# LEYFORGE PROJECT BRAIN
## Pilot, Certification & Codex Implementation Handoff

**Document ID:** LF-BRAIN-13  
**Version:** v0.1  
**Status:** LOCKED — Branch A Design v0.1 — Ready for Pre-Production Implementation  
**Branch:** A — Leyforge Project Brain / Obsidian  
**Parent:** LF-BRAIN-01 — Project Brain Architecture & Governance Specification  
**Related:** LF-BRAIN-02 through LF-BRAIN-12  
**Purpose:** Define the final Branch A pilot, acceptance criteria, certification process and implementation handoff by which Codex converts the locked Leyforge Project Brain specification into working pre-production infrastructure.

---

## 1. Purpose

LF-BRAIN-01 through LF-BRAIN-12 define what the Leyforge Project Brain is, how it represents knowledge, how authority works, how agents operate, how work and learning are preserved, how validation works, and how the existing project corpus is ingested.

LF-BRAIN-13 defines how that design becomes real.

Its purpose is to establish:

- when Branch A is ready for implementation;
- what Codex receives;
- what Codex must physically construct;
- what Codex may decide autonomously;
- what Codex must escalate;
- how the Brain is piloted;
- how failures are handled;
- what evidence is required;
- what constitutes Brain v0.1 certification;
- what must pass before Leyforge production begins.

The final outcome is:

> **Leyforge Brain v0.1 — implemented, validated, piloted and certified for production use.**

---

## 2. Core Handoff Principle

Branch A SHALL finish by handing Codex a specification package, not a vague intention.

The implementation relationship is:

```text
LOCKED LF-BRAIN SPECIFICATION
        ↓
CODEX IMPLEMENTATION
        ↓
BRAIN PILOT
        ↓
BRAIN DOCTOR + ACCEPTANCE EVIDENCE
        ↓
PRODUCTION SETUP CERTIFICATION
        ↓
CLEAN LEYFORGE REBUILD
```

Codex is responsible for implementing the specification.

Codex is not responsible for inventing a replacement specification.

---

# PART I — BRANCH A DESIGN COMPLETION

## 3. Required Specification Set

Branch A design SHALL include:

```text
LF-BRAIN-01  Architecture & Governance Specification
LF-BRAIN-02  Authority & Truth Resolution Model
LF-BRAIN-03  Note-Type Taxonomy & Information Model
LF-BRAIN-04  Brain Schema & Metadata Standard
LF-BRAIN-05  Vault Architecture & Navigation Standard
LF-BRAIN-06  Work Records & Handoff System
LF-BRAIN-07  Skills, Procedures & Project Learning System
LF-BRAIN-08  ADR & Decision Management Standard
LF-BRAIN-09  Agent Operating Contract
LF-BRAIN-10  Brain Doctor & Validation Standard
LF-BRAIN-11  Automation, CLI & Git Integration Standard
LF-BRAIN-12  Initial Ingestion & Traceability Plan
LF-BRAIN-13  Pilot, Certification & Codex Implementation Handoff
```

---

## 4. Final Reconciliation Required

Before Branch A is locked, the full specification set SHALL be reconciled for:

- terminology;
- status vocabularies;
- stable ID rules;
- folder names;
- note types;
- authority concepts;
- ADR behaviour;
- Work/Handoff behaviour;
- learning maturity;
- automation boundaries;
- validation rules;
- Branch B compatibility;
- future Branch C/D integration.

Any contradiction found during final reconciliation SHALL be resolved before Branch A certification.

---

## 5. Branch A Design Certification

Once reconciled, the design package may be marked:

```text
LEYFORGE PROJECT BRAIN DESIGN v0.1
STATUS: LOCKED — READY FOR PRE-PRODUCTION IMPLEMENTATION
```

This certifies the design specification.

It does **not** certify that the physical Brain has yet been built.

---

# PART II — IMPLEMENTATION TIMING

## 6. Pre-Production Stage

The Brain SHALL be physically constructed during the dedicated:

> **Pre-Production Infrastructure & Project Initialisation**

stage.

This occurs after the required design/audit prerequisites defined by the wider project roadmap and before the clean production rebuild begins.

---

## 7. No Premature Partial Production Brain

Branch A design work SHALL not be mistaken for the final operational Brain.

Local Markdown specification files may exist before implementation.

The operational vault, automation, indexes, schemas, CI and seeded knowledge graph are built during pre-production.

---

# PART III — CODEX INPUT PACKAGE

## 8. Mandatory Codex Inputs

Codex SHALL receive the current locked versions of:

- LF-BRAIN-01 through LF-BRAIN-13;
- applicable Branch B engineering governance;
- Branch C audit governance once available;
- Branch D production roadmap/gates once available;
- current repository layout;
- current authoritative document register;
- current V1-certified or otherwise approved corpus required by the production stage.

---

## 9. Supporting Inputs

Codex MAY also receive:

- representative registries;
- current testing guides;
- current ADRs;
- current implementation map;
- pilot source corpus;
- known historical evidence selected for ingestion.

---

## 10. Handoff Manifest

The final pre-production handoff SHOULD contain a machine-readable and human-readable manifest listing:

```text
document
version
status
canonical path
hash where useful
implementation dependency
```

This prevents accidental use of stale specification copies.

---

# PART IV — CODEX IMPLEMENTATION RESPONSIBILITIES

## 11. Vault Construction

Codex SHALL create:

```text
Leyforge/brain/
```

and the locked top-level architecture from LF-BRAIN-05.

Only `brain/` shall be configured as the Obsidian Vault.

---

## 12. Root Entry Files

Codex SHALL create:

```text
HOME.md
AGENTS.md
CURRENT_HANDOFF.md
```

with content conforming to the relevant Branch A standards.

---

## 13. Obsidian Configuration

Codex SHALL configure the project-relevant `.obsidian/` baseline.

It SHALL:

- enable/configure required core features;
- configure Templates;
- configure attachment location;
- configure Bases where appropriate;
- preserve project portability;
- exclude volatile workspace/device state from version control;
- begin without unapproved community plugin dependencies.

---

## 14. Schema Infrastructure

Codex SHALL create the machine-readable Brain Schema implementation corresponding to LF-BRAIN-03 and LF-BRAIN-04.

It SHALL include:

- common fields;
- record-type validation;
- controlled vocabularies;
- stable ID formats;
- relationship validation;
- schema versioning;
- migration support.

---

## 15. Templates

Codex SHALL create canonical templates for the formal record types that benefit from templated creation.

Templates SHALL match the locked schema.

---

## 16. Navigation Infrastructure

Codex SHALL create:

- core Indexes;
- relevant Bases;
- initial dashboards;
- selected Canvas maps where useful;
- search/navigation entry points.

These SHALL not duplicate authority.

---

## 17. Brain Tooling

Codex SHALL implement the required Brain-owned tooling.

At minimum:

```text
Brain Doctor
query capability
ID validation/generation
index generation
link/reference checking
schema migration framework
ingestion framework
traceability queries
```

Exact implementation mechanics remain governed by Branch B.

---

## 18. Git Integration

Codex SHALL configure:

- Brain repository tracking;
- `.gitignore` rules;
- generated-output policy;
- validation hooks where approved;
- CI integration;
- safe migration/review workflow.

No nested Git repository is permitted.

---

## 19. Agent Contract

Codex SHALL implement a concise runtime:

```text
brain/AGENTS.md
```

derived from LF-BRAIN-09.

It SHALL link back to full governance rather than duplicating every specification.

---

## 20. Operational Memory

Codex SHALL implement:

- Work Record creation;
- Work indexing;
- Current Handoff;
- stale Work detection;
- Work-to-decision/evidence links;
- closeout workflow.

---

## 21. Project Learning

Codex SHALL implement:

- Skills/Knowhow storage;
- maturity validation;
- provenance;
- evidence links;
- active Workaround views;
- stale-candidate detection;
- safe reuse lookup.

---

## 22. Decision Memory

Codex SHALL implement:

- ADR templates;
- DEC templates;
- ID generation;
- Decision Index;
- status filtering;
- supersession checks;
- Branch B-compatible ADR representation.

---

## 23. Initial Ingestion

Codex SHALL perform only the approved initial ingestion scope.

It SHALL prioritise current authority and control information before broad historical ingestion.

---

# PART V — CODEX AUTONOMY

## 24. Routine Implementation Authority

Codex MAY autonomously decide routine implementation details where:

- Branch A does not prescribe exact mechanics;
- Branch B permits autonomy;
- no stable external contract changes;
- no protected authority is altered;
- no major architecture decision is introduced.

---

## 25. Consequential Implementation Choice

If implementation reveals a consequential unresolved decision:

```text
Work Record
    ↓
proposed ADR / DEC
    ↓
governed resolution
    ↓
implementation continues
```

Codex SHALL not hide the choice inside code.

---

## 26. Implementation Discovery

If Codex discovers a better technique or shortcut during setup:

```text
Work
 ↓
Lesson / candidate Skill / Shortcut
 ↓
evidence
 ↓
validation
```

The discovery SHALL be preserved for future reuse.

---

## 27. Specification Defect

If Codex discovers a genuine flaw or contradiction in the locked Branch A design:

```text
CONFLICT / proposed Decision
        ↓
Branch A governance amendment
        ↓
implementation resumes
```

Codex SHALL not silently diverge.

---

# PART VI — PILOT PRINCIPLE

## 28. Pilot Before Mass Ingestion

The complete operational workflow SHALL be proven using a bounded pilot before large-scale ingestion or reliance.

The pilot exists to prove:

- schema;
- navigation;
- agent behaviour;
- authority resolution;
- Work/Handoff;
- decisions;
- learning;
- testing;
- traceability;
- validation;
- Git integration.

---

## 29. Representative Pilot

The pilot SHOULD include at least:

```text
1 current authoritative project document
1 System
1 Entity or Entity group
1 Requirement
1 ADR or DEC
1 Architecture record
1 Implementation Module
1 Test
1 Evidence record
1 Work Record
1 Handoff update
1 learned-knowledge record
1 generated or derived view
```

---

## 30. Real Project Data

The pilot SHOULD use representative real Leyforge information rather than only synthetic examples.

Synthetic fixtures remain appropriate for validator regression testing.

---

# PART VII — PILOT SCENARIO

## 31. Pilot Workflow

A representative pilot SHALL demonstrate:

```text
Authoritative source registered
        ↓
Document proxy created
        ↓
System / Entity linked
        ↓
Requirement extracted
        ↓
Decision linked
        ↓
Architecture linked
        ↓
Implementation Module linked
        ↓
Test defined
        ↓
Evidence recorded
        ↓
Work Record closed
        ↓
Lesson / Skill captured
        ↓
Handoff updated
        ↓
Brain Doctor passes
```

---

## 32. Reverse Retrieval Test

An agent SHALL be able to start from implementation and trace backward to:

- Architecture;
- Decision;
- Requirement;
- controlling authority.

---

## 33. Forward Retrieval Test

An agent SHALL be able to start from a Requirement and trace forward to:

- Implementation;
- Test;
- Evidence.

---

## 34. Continuation Test

A fresh authorised agent SHOULD be able to:

1. read AGENTS;
2. read CURRENT_HANDOFF;
3. follow Indexes;
4. locate governing authority;
5. understand active Work;
6. continue without the previous conversation transcript.

---

# PART VIII — PILOT ACCEPTANCE CRITERIA

## 35. Structural Acceptance

Pilot SHALL confirm:

```text
[ ] Canonical folders exist
[ ] Root entry files exist
[ ] Schema validates
[ ] Stable IDs are unique
[ ] Templates produce valid records
[ ] Indexes route correctly
[ ] Bases do not own unique truth
[ ] Generated boundaries are enforced
```

---

## 36. Authority Acceptance

Pilot SHALL confirm:

```text
[ ] Current authority is identifiable
[ ] Historical material remains distinguishable
[ ] Implementation does not override normative authority
[ ] Conflicts can be represented
[ ] Supersession can be followed
```

---

## 37. Operational Acceptance

Pilot SHALL confirm:

```text
[ ] Work Record can be created and closed
[ ] CURRENT_HANDOFF can be updated
[ ] New agent can resume from Handoff
[ ] Consequential decisions can be promoted
[ ] Learned knowledge can be captured
```

---

## 38. Automation Acceptance

Pilot SHALL confirm:

```text
[ ] Brain Doctor runs locally
[ ] Brain Doctor runs headlessly
[ ] Query tooling works
[ ] Index generation is deterministic
[ ] Generated outputs are reproducible
[ ] Git diffs remain reviewable
```

---

## 39. Traceability Acceptance

Pilot SHALL demonstrate at least one complete meaningful chain:

```text
AUTHORITY
→ REQUIREMENT
→ DECISION
→ ARCHITECTURE
→ IMPLEMENTATION
→ TEST
→ EVIDENCE
→ LESSON / SKILL
```

A chain may omit a stage only if that stage is genuinely not applicable; the pilot SHOULD choose a case where the full chain is meaningful.

---

# PART IX — BRAIN DOCTOR CERTIFICATION PROFILE

## 40. Certification Run

After pilot completion:

```text
brain doctor certification
```

or the final equivalent command SHALL be run.

---

## 41. Blocking Conditions

Certification SHALL fail for unresolved blocking conditions including:

- duplicate stable IDs;
- unsupported schema;
- malformed formal records;
- broken mandatory authority relationships;
- invalid supersession;
- missing required root files;
- broken Agent/Handoff workflow;
- unapproved essential plugin dependency;
- unresolved generated-file integrity errors;
- missing required pilot evidence.

---

## 42. Warnings

Warnings MAY remain only if:

- explicitly reviewed;
- non-blocking under the certification profile;
- documented where material.

---

## 43. Waivers

Any certification waiver SHALL follow LF-BRAIN-10.

Blanket waivers are prohibited.

---

# PART X — EVIDENCE PACKAGE

## 44. Implementation Evidence

Codex SHALL leave evidence of:

- created structure;
- schema validation;
- Brain Doctor output;
- pilot records;
- traceability result;
- Git integration;
- CI result;
- agent continuation test;
- any waivers.

---

## 45. Certification Record

Successful implementation SHALL produce an Audit/Certification record equivalent to:

```text
AUDIT-BRAIN-V0.1-CERTIFICATION
```

The exact stable ID shall follow final schema/ID policy.

---

## 46. Certification Status

The successful record SHALL indicate:

```text
Leyforge Brain v0.1
IMPLEMENTED — PILOT PASSED — CERTIFIED FOR PRODUCTION USE
```

---

# PART XI — FAILURE & REWORK

## 47. Pilot Failure

If a pilot test fails:

```text
failure
 ↓
Work / Bug / Conflict / Decision
 ↓
fix
 ↓
retest
```

The project SHALL not simply waive unexpected failures for convenience.

---

## 48. Design Failure vs Implementation Failure

Failures SHALL be classified.

### Implementation failure
The code/tooling does not conform to the specification.

### Specification failure
The specification itself is incomplete, contradictory or impractical.

### Environment failure
The implementation is blocked by external version/platform/tool behaviour.

Different failure classes require different resolution routes.

---

## 49. Specification Rework

If the specification must change:

- update the relevant LF-BRAIN document;
- create decision/amendment record where required;
- rerun affected validation;
- update implementation;
- rerun pilot criteria.

---

# PART XII — PRODUCTION GATE

## 50. Brain Certification Is a Production Dependency

The clean Leyforge rebuild SHALL NOT rely on the Project Brain as operational infrastructure until Brain v0.1 certification passes.

---

## 51. Wider Production Certification

Brain certification is one part of the wider Pre-Production Infrastructure & Project Initialisation gate.

Other Branch B/C/D gates may also need to pass.

---

## 52. Production Start Condition

Conceptually:

```text
V1 authoritative corpus ready
        +
Engineering governance ready
        +
Production roadmap/gates ready
        +
Brain implemented and certified
        +
Repository/tooling setup ready
        ↓
PRE-PRODUCTION SETUP CERTIFIED
        ↓
CLEAN LEYFORGE REBUILD MAY BEGIN
```

---

# PART XIII — POST-CERTIFICATION OPERATION

## 53. Brain Becomes Live Infrastructure

After certification, the Brain SHALL become part of normal Leyforge production workflow.

Significant work should then use:

- Work Records;
- Handoff;
- authority resolution;
- ADR/DEC;
- Skills;
- Brain Doctor;
- traceability.

---

## 54. No Immediate Mass Historical Ingestion Requirement

Certification does not require every historical Leyforge source to be ingested.

Current production-critical knowledge takes priority.

---

## 55. Gradual Expansion

Historical, research and secondary knowledge may be expanded incrementally as useful.

---

# PART XIV — MAINTENANCE AFTER CERTIFICATION

## 56. Schema Changes

Future material schema changes require governed migration.

---

## 57. Vault Architecture Changes

Major top-level vault changes require Branch A architectural amendment.

---

## 58. New Automation

New automation SHALL obey LF-BRAIN-11 and Branch B.

---

## 59. Plugin Adoption

Future community plugin adoption requires the approved evaluation path.

---

## 60. Brain Health

Brain Doctor SHALL remain part of ongoing project health checks and major production gates.

---

# PART XV — ACCEPTANCE TEST MATRIX

## 61. Mandatory Acceptance Tests

The final implementation SHOULD provide explicit acceptance tests equivalent to:

```text
BRAIN-AT-001  Vault bootstrap
BRAIN-AT-002  Schema-valid record creation
BRAIN-AT-003  Duplicate ID rejection
BRAIN-AT-004  Authority resolution
BRAIN-AT-005  Supersession traversal
BRAIN-AT-006  Generated-file protection
BRAIN-AT-007  Work Record lifecycle
BRAIN-AT-008  Handoff continuation
BRAIN-AT-009  ADR/DEC lifecycle
BRAIN-AT-010  Skill validation/provenance
BRAIN-AT-011  Requirement traceability
BRAIN-AT-012  Forward traceability
BRAIN-AT-013  Reverse traceability
BRAIN-AT-014  Legacy source classification
BRAIN-AT-015  Conflict surfacing
BRAIN-AT-016  Headless Brain Doctor
BRAIN-AT-017  Deterministic index generation
BRAIN-AT-018  Git/CI validation
BRAIN-AT-019  No-plugin core operation
BRAIN-AT-020  Fresh-agent continuation
```

The final test implementation may rename IDs under the testing standard while preserving coverage.

---

# PART XVI — FRESH-AGENT CERTIFICATION TEST

## 62. Fresh-Agent Test

A fresh authorised agent, given only the repository and normal task instruction, SHALL be able to:

```text
discover AGENTS.md
        ↓
load CURRENT_HANDOFF
        ↓
find relevant Index
        ↓
resolve authority
        ↓
find active Work
        ↓
reuse relevant Knowhow
        ↓
perform bounded work
        ↓
verify
        ↓
update Work/Handoff
```

without requiring hidden chat context.

---

## 63. Success Threshold

The agent must not need:

- the original Branch A conversation;
- undocumented user memory;
- private scratch notes;
- manual explanation of folder conventions.

If it does, the Brain implementation is incomplete.

---

# PART XVII — HUMAN CERTIFICATION TEST

## 64. Human Navigation Test

A human opening `brain/` in Obsidian SHOULD be able to identify:

- where to start;
- current project state;
- current Work;
- current authority;
- major Systems;
- Decisions;
- Skills;
- Risks/Conflicts;
- Brain health.

without knowing the physical location of every record.

---

# PART XVIII — PORTABILITY TEST

## 65. Without Obsidian

The Brain SHALL remain usable enough to:

- read Markdown;
- query metadata through project tooling;
- run Brain Doctor;
- run CI;
- inspect Git history;
- follow stable IDs.

Obsidian-specific visual conveniences may be absent.

---

# PART XIX — NO-COMMUNITY-PLUGIN BASELINE TEST

## 66. Plugin-Free Core

Brain v0.1 certification SHOULD be demonstrated with no required community plugin dependency.

If a community plugin becomes approved before certification, the exception requires explicit decision and fallback analysis.

---

# PART XX — HANDOFF TO BRANCH D

## 67. Production Roadmap Signal

When Brain design is locked, Branch D SHOULD record:

```text
Branch A Design:
COMPLETE — READY FOR PRE-PRODUCTION IMPLEMENTATION
```

When operational Brain certification passes:

```text
Brain Infrastructure:
CERTIFIED
```

These are distinct milestones.

---

# PART XXI — HANDOFF TO BRANCH C

## 68. Audit Integration

Branch C SHOULD be able to use the Brain during/after implementation for:

- document register;
- authority state;
- conflicts;
- audit records;
- certification evidence;
- traceability.

Branch C remains owner of V1 audit methodology.

---

# PART XXII — HANDOFF TO BRANCH B

## 69. Engineering Integration

Branch B SHALL govern the implementation quality of:

- Brain tooling;
- scripts;
- CI;
- Git workflow;
- tests;
- repository changes;
- ADR engineering procedure.

Branch A governs what the Brain must accomplish.

---

# PART XXIII — IMPLEMENTATION HANDOFF CHECKLIST

## 70. Codex Start Checklist

Before implementation begins:

```text
[ ] LF-BRAIN-01 through LF-BRAIN-13 locked
[ ] Branch B applicable governance available
[ ] Branch C/D prerequisites available as required by roadmap
[ ] Repository state known
[ ] Authoritative input corpus identified
[ ] Pilot corpus selected
[ ] Pre-production Work Record opened
```

---

## 71. Codex Completion Checklist

Before requesting certification:

```text
[ ] Canonical vault built
[ ] Root files built
[ ] Obsidian baseline configured
[ ] Schemas implemented
[ ] Templates implemented
[ ] Indexes/Bases implemented
[ ] Brain tooling implemented
[ ] Brain Doctor implemented
[ ] AGENTS.md implemented
[ ] Work/Handoff system implemented
[ ] Knowhow system implemented
[ ] ADR/DEC system implemented
[ ] Git/CI integrated
[ ] Initial ingestion completed
[ ] Pilot completed
[ ] Acceptance tests pass
[ ] Certification profile passes
[ ] Evidence package complete
```

---

# PART XXIV — BRANCH A CLOSEOUT

## 72. Branch A Completion State

After final specification reconciliation, Branch A may close its current design phase with:

```text
BRANCH A — LEYFORGE PROJECT BRAIN / OBSIDIAN
DESIGN STATUS:
LOCKED v0.1

IMPLEMENTATION STATUS:
PENDING PRE-PRODUCTION INFRASTRUCTURE STAGE
```

---

## 73. Future Amendments

Branch A remains the governance owner of Brain architecture after v0.1.

Future changes occur through:

- amendment;
- ADR/DEC where appropriate;
- schema migration;
- versioned specification update.

---

# PART XXV — CERTIFICATION LAWS

## 74. Pilot & Certification Laws

1. Branch A completes with a specification package, not a partially improvised production vault.
2. The full LF-BRAIN set must be reconciled before design lock.
3. Design certification and implementation certification are distinct.
4. Codex physically builds the Brain during pre-production.
5. Codex receives locked Branch A documents as implementation authority.
6. Codex may choose routine implementation mechanics within Branch B rules.
7. Consequential unresolved implementation choices require ADR/DEC.
8. Codex may not silently redesign the Brain.
9. Implementation discoveries are captured as project learning.
10. A bounded pilot precedes mass ingestion and production reliance.
11. The pilot uses representative real Leyforge information.
12. The pilot tests authority, schema, navigation, Work, Handoff, Decisions, learning, automation and traceability.
13. Forward and reverse traceability are both tested.
14. A fresh agent must be able to continue without hidden chat context.
15. Brain Doctor certification is mandatory before operational certification.
16. Certification failures are fixed or explicitly governed, not hidden.
17. Certification waivers are scoped and reviewable.
18. The Brain must remain usable without Obsidian.
19. Brain v0.1 should demonstrate plugin-free core operation.
20. Initial historical ingestion need not be exhaustive.
21. Current production-critical authority has priority over archival completeness.
22. Branch B governs implementation quality.
23. Branch C governs V1 audit methodology.
24. Branch D governs production sequencing and gates.
25. Brain certification is one component of the wider pre-production gate.
26. The clean Leyforge rebuild begins only after required pre-production certifications pass.
27. Operational Brain use begins after certification and becomes part of normal production workflow.
28. Future Brain changes remain governed and versioned.
29. Acceptance evidence is retained.
30. The final test of the Brain is whether Leyforge can continue coherently without rediscovering its own history.

---

## 75. Status

This document completes the Branch A Project Brain specification family at the design level.

LF-BRAIN-01 through LF-BRAIN-13 have now been cross-checked and reconciled for taxonomy, schema, authority, vault layout, operational memory, project learning, ADR/decision behaviour, agent rules, validation, automation, ingestion and implementation certification.

The complete Branch A specification set is therefore:

> **LEYFORGE PROJECT BRAIN DESIGN v0.1 — LOCKED — READY FOR PRE-PRODUCTION IMPLEMENTATION**

The next physical Brain milestone occurs during the Leyforge Pre-Production Infrastructure & Project Initialisation stage, where Codex will construct, pilot and certify the operational Brain from this locked specification package.
