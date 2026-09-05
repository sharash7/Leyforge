# LEYFORGE PROJECT BRAIN
## Branch A Reconciliation & Lock Register

**Register:** LF-BRAIN-SET-A  
**Version:** v0.1  
**Status:** LOCKED — Ready for Pre-Production Implementation  
**Scope:** LF-BRAIN-01 through LF-BRAIN-13

---

## 1. Certification Statement

The complete Leyforge Branch A — Project Brain / Obsidian specification family has been cross-reconciled and promoted to:

> **LEYFORGE PROJECT BRAIN DESIGN v0.1 — LOCKED — READY FOR PRE-PRODUCTION IMPLEMENTATION**

This is a **design certification**.

The physical operational Brain is still to be constructed, piloted and certified during the Leyforge **Pre-Production Infrastructure & Project Initialisation** stage.

---

## 2. Locked Specification Set

1. LF-BRAIN-01 — Architecture & Governance Specification
2. LF-BRAIN-02 — Authority & Truth Resolution Model
3. LF-BRAIN-03 — Note-Type Taxonomy & Information Model
4. LF-BRAIN-04 — Brain Schema & Metadata Standard
5. LF-BRAIN-05 — Vault Architecture & Navigation Standard
6. LF-BRAIN-06 — Work Records & Handoff System
7. LF-BRAIN-07 — Skills, Procedures & Project Learning System
8. LF-BRAIN-08 — ADR & Decision Management Standard
9. LF-BRAIN-09 — Agent Operating Contract
10. LF-BRAIN-10 — Brain Doctor & Validation Standard
11. LF-BRAIN-11 — Automation, CLI & Git Integration Standard
12. LF-BRAIN-12 — Initial Ingestion & Traceability Plan
13. LF-BRAIN-13 — Pilot, Certification & Codex Implementation Handoff

---

## 3. Final Reconciliation Corrections

The final lock pass made the following substantive corrections and synchronisation changes:

### LF-BRAIN-01
- Aligned the automation hierarchy with LF-BRAIN-11.
- Made Leyforge-owned Brain tooling the headless validation/generation foundation.
- Retained the official Obsidian CLI as the local Obsidian-aware automation layer.
- Normalised the learning example from `maturity` to schema-authoritative `status`.

### LF-BRAIN-02
- Added explicit Audit and Production/Roadmap authority domains.
- Harmonised `authority_status` vocabulary with LF-BRAIN-04, including `unresolved` and `not_applicable`.

### LF-BRAIN-03
- Corrected the canonical note-type count from **34** to **38**.
- Confirmed the 38-type register exactly matches LF-BRAIN-04.

### LF-BRAIN-04
- Added lifecycle vocabularies for Navigation/Control, Source, Migration, Finding, Evidence/Benchmark and Handoff records so all formal v0.1 record types have usable status semantics.
- Added `experimental` to the ADR lifecycle to remain compatible with Branch B engineering ADR governance.
- Added optional Branch B-facing ADR metadata for `decision_class` and `reconsideration_triggers`.
- Added `authority_question` to Conflict metadata.
- Normalised the canonical machine-schema location to `brain/91_SCHEMA/`.

### LF-BRAIN-05 / LF-BRAIN-08
- Clarified that Branch B remains authoritative for the canonical storage location and engineering procedure of engineering ADRs.
- The Brain stores engineering ADRs canonically only if Branch B delegates that location to the Brain; otherwise it indexes/proxies them without creating a competing copy.

### LF-BRAIN-06
- Normalised `repository_paths` to the schema field `repository_path`.

### LF-BRAIN-08 / LF-BRAIN-10
- Added explicit support and validation for `experimental` engineering ADRs and their reconsideration conditions.

### LF-BRAIN-11
- Reverified the design-time official Obsidian CLI baseline during final lock.
- Preserved the rule that CI/Brain Doctor remain headless and do not depend on a running Obsidian application.
- Added the official design-time reference URLs.

### LF-BRAIN-01 through LF-BRAIN-13
- Removed all draft/pending-lock status markers.
- Promoted every document to the common locked Branch A v0.1 status.
- Rechecked cross-document LF-BRAIN references and numbered heading integrity.

---

## 4. Final Consistency Results

The final lock check confirmed:

```text
Specification documents                 13 / 13
Document IDs sequential                 PASS
All specification statuses locked       PASS
Remaining pending-lock markers           0
Canonical semantic note types            38
Schema semantic note types               38
Taxonomy ↔ schema type match             PASS
Authority-status vocabulary match        PASS
Experimental ADR schema support          PASS
Branch B ADR ownership deference         PASS
Stale brain/schema path references       0
Stale repository_paths field uses        0
Stale maturity field uses                0
LF-BRAIN cross-references valid          PASS
Numbered heading integrity               PASS
```

---

## 5. Branch Ownership Boundary

The locked Branch A set establishes:

- **Branch A:** Project Brain knowledge architecture, operational memory, navigation, indexing, validation representation and agent interaction.
- **Branch B:** Engineering governance, engineering ADR procedure, implementation discipline, repository/Git/CI quality.
- **Branch C:** V1 documentation audit and reconciliation methodology.
- **Branch D:** Production/rebuild sequencing, gates and pre-production progression.

No branch silently replaces another branch's authority.

---

## 6. Next Physical Milestone

During Pre-Production Infrastructure & Project Initialisation, Codex will receive the locked specification package and physically construct:

- `brain/` Obsidian vault;
- canonical folder architecture;
- `.obsidian/` baseline;
- schema implementation;
- templates;
- indexes;
- Bases;
- selected Canvas maps;
- Work/Handoff system;
- Skills/Knowhow system;
- ADR/DEC integration;
- Brain Doctor;
- automation/query/ingestion tooling;
- Git/CI integration;
- initial authoritative corpus seed;
- pilot traceability chain;
- certification evidence.

Codex then runs the LF-BRAIN-13 pilot and certification workflow before the Brain is accepted as production infrastructure.

---

## 7. Locked State

```text
BRANCH A — LEYFORGE PROJECT BRAIN / OBSIDIAN

DESIGN:
LOCKED v0.1

READY FOR:
PRE-PRODUCTION IMPLEMENTATION

OPERATIONAL BRAIN:
NOT YET BUILT / CERTIFIED

IMPLEMENTER:
Codex or another authorised implementation agent under Branch B governance
```
