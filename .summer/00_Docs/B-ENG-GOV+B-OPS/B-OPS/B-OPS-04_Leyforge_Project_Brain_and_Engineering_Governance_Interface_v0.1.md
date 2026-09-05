# B-OPS-04 — Leyforge Project Brain ↔ Engineering Governance Interface

**Document ID:** B-OPS-04  
**Title:** Leyforge Project Brain ↔ Engineering Governance Interface  
**Version:** v0.1  
**Status:** OPERATIONALISATION BASELINE  
**Branch:** Branch B — Engineering Governance  
**Parent Authority:** B-OPS-00 through B-OPS-03 + ENG-GOV-11 through ENG-GOV-15  
**Project:** Leyforge

---

## 00. Purpose

B-OPS-04 defines the formal interface between Branch A — Project Brain / Obsidian and Branch B — Engineering Governance.

The governing principle is:

> The Project Brain remembers, navigates, indexes and learns; ENG-GOV remains the engineering authority.

The relationship is:

```text
Brain = WHERE / WHAT / STATUS / LEARNINGS
ENG-GOV = RULES
ADR = WHY ARCHITECTURE
B-OPS = HOW GOVERNANCE OPERATES
Implementation = WHAT EXISTS IN CODE
```

---

## 01. Ownership Boundary

### BOP04-001
Branch B owns engineering governance semantics.

### BOP04-002
Branch A owns Project Brain structure, navigation and reusable project knowledge.

### BOP04-003
The Brain does not independently redefine ENG-GOV rules.

### BOP04-004
ENG-GOV does not dictate unrelated Brain knowledge architecture beyond its engineering interface requirements.

### BOP04-005
Where Branch A and B overlap, records link rather than duplicate authority.

---

## 02. Brain as Navigation Layer

### BOP04-006
The Brain should let contributors discover relevant engineering authority quickly.

### BOP04-007
Brain summaries remain concise enough to navigate.

### BOP04-008
Exact consequential semantics require the underlying authoritative source.

### BOP04-009
Brain summaries identify source authority.

### BOP04-010
A stale Brain summary cannot override newer authority.

---

## 03. No Duplicate-Law Corpus

### BOP04-011
The Brain does not contain rewritten copies of ENG-GOV-00 through ENG-GOV-15 as independent authority.

### BOP04-012
Indexes, abstracts and routing notes are permitted.

### BOP04-013
Abstracts point to stable document/rule IDs.

### BOP04-014
If an abstract materially disagrees with its source, the source wins.

### BOP04-015
Automation should eventually detect stale/broken authority links where practical.

---

## 04. Governance Hub

A conceptual Brain governance hub may expose:

```text
Engineering Governance
├── Governance Index
├── Active ADRs
├── Active Waivers
├── Active Deprecations
├── Governance Debt
├── Dependency Health
├── Benchmark / Performance Health
├── Validation / CI Health
├── Recent Engineering Work
├── Engineering Skills / Procedures
└── Failures / Antipatterns
```

### BOP04-016
B-OPS-00 is the primary governance-navigation artifact exposed through the Brain.

### BOP04-017
Governance views may be generated from machine-readable project state where practical.

### BOP04-018
Generated dashboards remain derived views, not authority.

---

## 05. Document Status

### BOP04-019
The Brain records document status rather than assuming every file is current.

### BOP04-020
Status vocabulary comes from the owning document family.

### BOP04-021
The Brain may aggregate status without inventing new semantics.

---

## 06. ADR Integration

### BOP04-022
The Brain maintains an index of current and historical ADRs.

### BOP04-023
Architecture-topic pages link to the current applicable ADR.

### BOP04-024
The Brain does not unnecessarily duplicate full ADR rationale.

### BOP04-025
Superseded ADRs remain discoverable.

### BOP04-026
Reconstructed historical ADRs are visibly marked.

### BOP04-027
ADR acceptance/supersession updates navigation automatically where practical.

---

## 07. Waiver Integration

### BOP04-028
Active consequential waivers appear in the Brain.

### BOP04-029
Expired/revoked waivers must not remain presented as active.

### BOP04-030
Waiver views expose ID, risk, scope, governing rule, expiry/reconsideration and status.

### BOP04-031
High-risk expiring waivers receive prominent visibility.

### BOP04-032
Closed waivers remain historically searchable.

---

## 08. Deprecation Integration

### BOP04-033
Active deprecations appear in a lifecycle view.

### BOP04-034
The Brain exposes replacement/migration direction where useful.

### BOP04-035
Compatibility obligations remain visible until satisfied.

### BOP04-036
Deprecated does not mean removed.

---

## 09. Governance Debt

### BOP04-037
GOV-DEBT is first-class Brain operational state.

### BOP04-038
Debt views prioritise risk and activation milestone.

### BOP04-039
Debt age may be visible but is not itself severity.

### BOP04-040
Closed debt remains historically discoverable without cluttering active dashboards.

---

## 10. Work Logs

### BOP04-041
Consequential engineering sessions create/update Work Logs.

### BOP04-042
Work Logs record outcomes rather than transcripts.

### BOP04-043
Work Logs may link task, commit, ADR, waiver, benchmark, failure, skill and debt records.

### BOP04-044
Work Logs record actual verification executed.

### BOP04-045
Work Logs record unresolved blockers.

### BOP04-046
Work Logs preserve the next durable project state.

### BOP04-047
Work Logs are append-oriented historical evidence.

### BOP04-048
Old Work Logs are not rewritten merely to make history cleaner.

### BOP04-049
Corrections may be appended or explicitly amended.

### BOP04-050
Indexes may hide old routine logs from default views without deleting them.

---

## 11. Skills / Procedures / Shortcuts

### BOP04-051
Reusable discoveries may be promoted into Skills, Procedures or Shortcuts.

### BOP04-052
Promotion requires future reuse value.

### BOP04-053
A Skill describes reusable capability.

### BOP04-054
A Procedure describes a repeatable governed workflow.

### BOP04-055
A Shortcut describes a faster method plus safe conditions.

### BOP04-056
Skills are knowledge, not authority.

### BOP04-057
Skills link to evidence where reliability depends on technical findings.

### BOP04-058
Environmental prerequisites are recorded.

### BOP04-059
Known failure conditions are recorded.

### BOP04-060
Obsolete Skills may be deprecated rather than silently overwritten where history matters.

### BOP04-061
Materially improved Skills may supersede older procedures.

---

## 12. Failures / Antipatterns / Limitations

### BOP04-062
Reusable engineering failures are first-class Brain knowledge.

### BOP04-063
Failures distinguish verified root cause from hypothesis.

### BOP04-064
Antipatterns explain tempting approaches that caused problems.

### BOP04-065
Failure records link regression protection where added.

### BOP04-066
Known failure knowledge should be consulted before similar high-risk work.

### BOP04-067
Fixed failures may remain because their lessons remain valuable.

### BOP04-068
Durable known limitations may exist separately from defects.

### BOP04-069
Limitations may link reconsideration triggers.

### BOP04-070
Workarounds may link limitations without rewriting the limitation.

---

## 13. Dependency Integration

### BOP04-071
Foundational dependency records appear in the Brain.

### BOP04-072
Dependency views show the selected version/base revision.

### BOP04-073
Fork state and local patches are visible.

### BOP04-074
Relevant Skills and Failures link to dependencies.

### BOP04-075
Update availability does not automatically create upgrade authority.

### BOP04-076
Security/advisory state may be surfaced without automatically changing authority.

---

## 14. Performance Integration

### BOP04-077
Important benchmark status may be surfaced through the Brain.

### BOP04-078
Benchmark views expose enough scenario/hardware context to avoid misleading comparisons.

### BOP04-079
Large raw benchmark data is linked rather than copied into summaries.

### BOP04-080
Performance trends link to governed BENCH records.

---

## 15. CI / Validation Health

### BOP04-081
Governance enforcement health may feed Brain dashboards.

### BOP04-082
Enforcement maturity and current pass/fail remain separate.

### BOP04-083
Missing enforcement is represented as debt rather than false green.

---

## 16. Machine-Derived State and Freshness

### BOP04-084
Machine-known facts should replace manually duplicated status where practical.

### BOP04-085
Machine-derived state is evidence, not semantic authority.

### BOP04-086
Manual overrides of machine-derived facts should be exceptional and visible.

### BOP04-087
Operational views expose freshness where stale state could mislead.

### BOP04-088
A stale green result is not current certification.

### BOP04-089
Freshness windows are defined by the owning verification process.

---

## 17. Knowledge Promotion Pipeline

```text
WORK
 ↓
WORK LOG
 ↓
IS IT REUSABLE?
 ├── NO → historical context
 └── YES
      ↓
 classify
      ↓
 SKILL / PROCEDURE / SHORTCUT
 FAILURE / ANTIPATTERN / LIMITATION
      ↓
 REVIEW IF NEEDED
      ↓
 BRAIN INDEX
```

### BOP04-090
Promotion is deliberate.

### BOP04-091
Agents may propose promotion automatically.

### BOP04-092
Consequential/uncertain discoveries retain evidence/confidence.

### BOP04-093
Unverified hypotheses are not promoted as settled fact.

---

## 18. Knowledge Deduplication and Lifecycle

### BOP04-094
Agents search for equivalent existing records before creating new reusable knowledge.

### BOP04-095
Equivalent records are normally updated/superseded rather than duplicated.

### BOP04-096
Different records may coexist when scope/conditions genuinely differ.

### BOP04-097
Duplicate cleanup preserves useful history.

### BOP04-098
Brain knowledge has lifecycle state such as ACTIVE, EXPERIMENTAL, DEPRECATED, SUPERSEDED and ARCHIVED.

### BOP04-099
Historical knowledge is not automatically deleted.

### BOP04-100
Current navigation defaults toward active/current records.

---

## 19. Agent Navigation and Authority Conflict

### BOP04-101
Coding agents use the Brain to reduce context-search cost.

### BOP04-102
Agents retrieve relevant authority/knowledge rather than loading the entire vault.

### BOP04-103
High-risk tasks search for applicable Failures/Antipatterns and ADRs.

### BOP04-104
A missing Brain entry never grants permission to ignore known authority.

### BOP04-105
If Brain state contradicts source authority, source authority wins.

### BOP04-106
The conflict becomes a Brain-maintenance defect.

### BOP04-107
True authoritative conflicts use the Branch B reconciliation/escalation process.

---

## 20. Cross-Branch Coordination

### BOP04-108
Branch A may change Brain navigation/structure without altering Branch B engineering law.

### BOP04-109
Branch B may add engineering records/interfaces without silently restructuring Branch A's vault.

### BOP04-110
Changes affecting the A↔B interface require synchronized updates.

### BOP04-111
Branch C findings may create reconciliation/issues visible through the Brain.

### BOP04-112
Branch D may consume Brain governance status for production readiness.

---

## 21. Traceability

### BOP04-113
Engineering records may link to canon/FCC/PRD requirements.

### BOP04-114
The Brain should support valuable traces such as:

```text
FCC / Canon Requirement
        ↓
LFE Architecture
        ↓
ADR
        ↓
Implementation
        ↓
Test / Benchmark
        ↓
Work Log
```

### BOP04-115
Traceability is prioritised for consequential systems rather than every trivial line.

---

## 22. Repository Location and Generated Indexes

### BOP04-116
The Project Brain remains repository-resident.

### BOP04-117
Exact directories/templates follow Branch A's final vault architecture.

### BOP04-118
Branch B must not create a competing Brain/vault.

### BOP04-119
Indexes and dashboards should increasingly be generated from metadata.

### BOP04-120
Generated indexes are reproducible derived state.

### BOP04-121
Generated indexes are not manually edited authorities.

---

## 23. Search, Scale and Automation

### BOP04-122
Stable IDs remain searchable across repository, Brain and Git.

### BOP04-123
Metadata supports domain/type/status/risk filtering.

### BOP04-124
Search favours current active records without erasing history.

### BOP04-125
The Brain stores durable useful knowledge, not every transient observation.

### BOP04-126
Large raw artifacts are linked rather than copied unless there is clear value.

### BOP04-127
Routine CI runs do not each require a permanent handwritten Brain page.

### BOP04-128
Significant incidents, decisions, discoveries and milestones do.

### BOP04-129
Automation records meaningful actions without flooding the Brain.

### BOP04-130
Repeated routine runs may update machine state rather than append endless Work Logs.

### BOP04-131
Material failures/changes still produce durable records.

---

## 24. Privacy, Git and Brain Health

### BOP04-132
The Brain does not store secrets merely because it is repository-resident.

### BOP04-133
Work Logs avoid credentials and unnecessary sensitive machine-local information.

### BOP04-134
Security incident records follow ENG-GOV-13 retention/redaction rules.

### BOP04-135
Brain engineering records live in Git.

### BOP04-136
Consequential knowledge changes remain reviewable diffs.

### BOP04-137
Git history helps reconstruct record evolution.

### BOP04-138
Generated status noise should not overwhelm meaningful Git history.

### BOP04-139
The Brain should eventually have health checks.

### BOP04-140
Brain health validation is governance tooling, not new canon.

---

## 25. Bootstrap Sync

### BOP04-141
ENG-GOV is installed/referenced in the repository before mass rebuild implementation.

### BOP04-142
B-OPS governance indexes are installed.

### BOP04-143
Brain authority navigation points to the actual files.

### BOP04-144
Initial foundational ADR backlog is visible.

### BOP04-145
Initial foundational dependency records are visible.

### BOP04-146
Initial governance debt is visible.

### BOP04-147
Root `AGENTS.md` points into this navigation structure.

---

## 26. Status Propagation

A consequential engineering change should ideally flow:

```text
CODE / CONFIG CHANGE
      ↓
VERIFICATION
      ↓
WORK LOG
      ↓
ADR / WAIVER / DEP / BENCH UPDATE IF NEEDED
      ↓
REUSABLE DISCOVERY PROMOTION IF NEEDED
      ↓
MACHINE STATUS RECOMPUTED
      ↓
BRAIN INDEX / DASHBOARD
```

### BOP04-148
Status propagation is automated where the source fact is machine-known.

### BOP04-149
Semantic promotion remains deliberate.

---

## 27. Final Brain Interface Laws

### BOP04-150
The Brain makes Leyforge easier to understand without creating a competing source of truth.

### BOP04-151
The Brain should tell an agent where to look next before trying to tell it every detail itself.

### BOP04-152
Reusable learning survives the session that discovered it.

### BOP04-153
Historical reasoning remains reconstructable.

### BOP04-154
Current operational health increasingly comes from real project evidence.

### BOP04-155
A project record is valuable when it improves future decisions, execution, verification or recovery.

---

## Branch A ↔ B Interface Model

```text
                 PROJECT BRAIN
                      │
        ┌─────────────┼─────────────┐
        │             │             │
    NAVIGATION     KNOWLEDGE      STATUS
        │             │             │
        ↓             ↓             ↓
     ENG-GOV       SKILLS        CI / VAL
     B-OPS         FAILURES      BENCH
     ADRs          PROCEDURES    DEBT
     LFE           WORK LOGS     WAIVERS
        │
        ↓
   AUTHORITY SOURCES
        │
        ↓
 IMPLEMENTATION / TESTS
```

---

## Closing Principle

Branch B defines engineering law.

Branch A makes that law, its current application, its history and the project's learned engineering knowledge discoverable.

The Project Brain becomes progressively more useful as Leyforge learns, while authority remains explicit and non-duplicated.
