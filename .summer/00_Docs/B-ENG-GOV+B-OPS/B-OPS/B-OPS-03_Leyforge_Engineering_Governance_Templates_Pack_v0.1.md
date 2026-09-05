# B-OPS-03 — Leyforge Engineering Governance Templates Pack

**Document ID:** B-OPS-03  
**Title:** Leyforge Engineering Governance Templates Pack  
**Version:** v0.1  
**Status:** OPERATIONALISATION BASELINE  
**Branch:** Branch B — Engineering Governance  
**Parent Authority:** ENG-GOV-10, ENG-GOV-11, ENG-GOV-12, ENG-GOV-14, ENG-GOV-15, B-OPS-02  
**Project:** Leyforge

---

## 00. Purpose

B-OPS-03 provides the standard reusable record templates used by Leyforge engineering governance and the Project Brain.

Templates define record structure. They do not grant authority.

The governing principle is:

> Common engineering records use common lightweight templates so information remains searchable, machine-indexable and understandable without turning every task into paperwork.

## 01. Format Rules

- Durable format: Markdown.
- Lightweight machine-readable metadata may use YAML frontmatter.
- Templates must remain usable without Obsidian.
- Stable record IDs are separate from titles and filenames.
- Dates use `YYYY-MM-DD` unless a timestamp is genuinely needed.
- Required unknown fields use unmistakable placeholders such as `<TODO: ...>`.
- `UNKNOWN` and `N/A` are distinct states.
- Record authority comes from the governing workflow, not from the presence of a template.
- Historical records remain valid against the template/schema version that created them unless explicit migration is required.
- Template use is proportional to actual governance need.

## 02. Common Record Rules

1. Each governed record family has a bounded status vocabulary.
2. Stable IDs survive title and filename changes.
3. Records should reference related artifacts primarily by stable ID.
4. File links may supplement stable IDs for Obsidian/Git navigation.
5. Machine-indexed metadata may be structurally validated.
6. Structural validation does not prove semantic quality.
7. Agents may populate known facts but must never fabricate approvals or evidence.
8. Templates may evolve without rewriting every historical record.
9. New records should originate from controlled templates where tooling exists.
10. Stable ID allocation must avoid collisions under parallel work.

---


# TEMPLATE-01 — Architecture Decision Record

```markdown
---
id: ADR-XXXX
title: "<TODO: decision title>"
record_type: architecture_decision
status: proposed
created: YYYY-MM-DD
accepted: null
domain: "<TODO>"
risk_class: "<A|B|C|D|E>"
template_version: 1
reconstructed: false
supersedes: []
superseded_by: []
related: []
---

# ADR-XXXX — <Title>

## Context / Problem
<TODO>

## Authoritative Constraints
- <TODO>

## Decision
<TODO>

## Alternatives Considered
### Alternative A — <Name>
**Why considered:** <TODO>
**Why not selected:** <TODO>

## Rationale / Evidence
- <TODO>

## Positive Consequences
- <TODO>

## Negative Consequences
- <TODO>

## Risks
- <TODO>

## Assumptions
- <TODO or N/A>

## Reconsideration Triggers
- <TODO or N/A>

## Affected Systems / Documents
- <TODO>

## Verification
- <TODO>

## Supersession
**Supersedes:** <IDs or N/A>
**Superseded By:** <IDs or N/A>
**Partial Supersession Notes:** <N/A or details>

## Project Brain Links
- <TODO>

## Reconstruction Basis
<N/A unless reconstructed historical ADR.>
```

---

# TEMPLATE-02 — Waiver / Exception

```markdown
---
id: WAIVER-XXXX
title: "<TODO>"
record_type: waiver
status: proposed
created: YYYY-MM-DD
domain: "<TODO>"
risk_class: "<A|B|C|D|E>"
template_version: 1
governing_rules: []
related: []
---

# WAIVER-XXXX — <Title>

## Governing Rule
- <TODO: exact rule ID>

## Scope
<TODO>

## Reason
<TODO>

## Evidence
- <TODO>

## Risk
<TODO>

## Compensating Controls
- <TODO>

## Expiry / Reconsideration
**Expiry Date / Milestone / Condition:** <TODO>
**Review Checkpoint:** <TODO or N/A>

## Exit Plan
<TODO>

## Related Debt / Issue / ADR
- <TODO or N/A>

## Approval
**Approved By:** <PENDING>
**Approval Date:** <PENDING>

## Renewal History
- <N/A or entries>

## Closure Evidence
<TODO when closing>
```

---

# TEMPLATE-03 — Deprecation

```markdown
---
id: DEPR-XXXX
title: "<TODO>"
record_type: deprecation
status: proposed
created: YYYY-MM-DD
domain: "<TODO>"
template_version: 1
related: []
---

# DEPR-XXXX — <Title>

## Deprecated Thing
<TODO>

## Reason
<TODO>

## Replacement
<TODO or N/A>

## New-Use Policy
<TODO>

## Existing Compatibility Obligations
- <TODO>

## Migration Path
<TODO>

## Removal Criteria
- <TODO>

## Earliest Removal Boundary
<TODO>

## Verification Required Before Removal
- <TODO>

## Affected Saves / APIs / Packages / Systems
- <TODO>

## Related ADRs / Releases
- <TODO or N/A>

## Final Removal Evidence
<TODO when removed>
```

---

# TEMPLATE-04 — Temporary Constraint / Quarantine

```markdown
---
id: TEMP-XXXX
title: "<TODO>"
record_type: temporary_constraint
status: active
created: YYYY-MM-DD
domain: "<TODO>"
risk_class: "<A|B|C|D|E>"
template_version: 1
related: []
---

# TEMP-XXXX — <Title>

## Constraint / Quarantined Thing
<TODO>

## Type
<TEMP CONSTRAINT | QUARANTINE | EMERGENCY BYPASS>

## Reason
<TODO>

## Impact
<TODO>

## Current Protection
- <TODO>

## Owner / Domain
<TODO>

## Reconsideration Trigger
<TODO>

## Exit Condition
<TODO>

## Retrospective Notes
<N/A unless required>
```

---

# TEMPLATE-05 — Dependency Record

```markdown
---
id: DEP-XXXX
title: "<Dependency name>"
record_type: dependency
status: active
created: YYYY-MM-DD
category: "<FOUNDATIONAL|RUNTIME|BUILD-CRITICAL|DEVELOPMENT|OPTIONAL>"
template_version: 1
related_adrs: []
related_patches: []
---

# DEP-XXXX — <Dependency Name>

## Purpose
<TODO>

## Source / Provenance
**Upstream Project:** <TODO>
**Source Location:** <TODO>
**Version / Tag / Commit:** <TODO>

## Licence
**Licence:** <TODO>
**Required Notices / Obligations:** <TODO>

## Ownership Mode
<UNMODIFIED | VENDORED | FORKED | ADAPTER | EXTERNAL TOOL>

## Local Modifications
- <N/A or patch IDs>

## Relevant ADRs
- <TODO or N/A>

## Used By
- <TODO>

## Supported Platforms
- <TODO>

## Persistence Impact
<TODO or N/A>

## Security Impact
<TODO or N/A>

## Performance Impact
<TODO or N/A>

## Acquisition / Build Procedure
<TODO or linked Skill/Procedure>

## Verification
- <TODO>

## Update Strategy
<TODO>

## Upstream Sync Strategy
<TODO or N/A>

## Known Limitations
- <TODO or N/A>

## Reconsideration Triggers
- <TODO>

## Brain Skills / Failures
- <TODO or N/A>
```

---

# TEMPLATE-06 — Benchmark Record

```markdown
---
id: BENCH-XXXX
title: "<TODO>"
record_type: benchmark
status: active
created: YYYY-MM-DD
system: "<TODO>"
template_version: 1
related: []
---

# BENCH-XXXX — <Title>

## Requirement / Budget
<TODO>

## Build / Version Context
**Commit / Build:** <TODO>
**Game Version:** <TODO>
**Worldgen Version:** <TODO or N/A>
**Registry / Content Version:** <TODO or N/A>

## Hardware / Environment
**CPU:** <TODO>
**GPU:** <TODO or N/A>
**RAM:** <TODO>
**Storage:** <TODO>
**OS:** <TODO>
**Driver / Runtime:** <TODO or N/A>

## Scenario
<TODO>

## Workload Configuration
- Seed: <TODO or N/A>
- NPC Count: <TODO or N/A>
- Loaded Chunks: <TODO or N/A>
- View Distance: <TODO or N/A>
- Resolution / Graphics Profile: <TODO or N/A>
- Simulation Tier: <TODO or N/A>

## Method
**Warm-up:** <TODO>
**Sample Duration:** <TODO>
**Sample Count:** <TODO>
**Repeated Runs:** <TODO>

## Metrics
- p50: <TODO or N/A>
- p95: <TODO or N/A>
- p99: <TODO or N/A>
- max: <TODO or N/A>
- throughput: <TODO or N/A>
- memory: <TODO or N/A>

## Baseline
<TODO>

## Candidate
<TODO>

## Absolute Budget
<TODO or N/A>

## Regression Threshold
<TODO or N/A>

## Known Noise / Limitations
- <TODO>

## Result
<PASS | ADVISORY | FAIL | INCOMPLETE>

## Raw Evidence / Profile Captures
- <TODO or N/A>
```

---

# TEMPLATE-07 — Engineering Work Log

```markdown
---
id: WORK-XXXX
title: "<TODO>"
record_type: engineering_work_log
date: YYYY-MM-DD
status: complete
domain: "<TODO>"
risk_class: "<A|B|C|D|E>"
template_version: 1
related: []
---

# WORK-XXXX — <Title>

## Objective
<TODO>

## Systems / Files Touched
- <TODO>

## Authority Consulted
- <TODO>

## Result
<TODO>

## Verification Executed
- <TODO>

## Verification Not Executed
- <TODO or N/A>

## Failures / Blockers
- <TODO or N/A>

## Commits / PRs
- <TODO or N/A>

## ADR / Waiver / Dependency / Debt Changes
- <TODO or N/A>

## Reusable Discoveries
- Promoted: <IDs or N/A>
- Candidate for promotion: <TODO or N/A>

## Next Durable State
<TODO>
```

---

# TEMPLATE-08 — Skill / Procedure / Shortcut

```markdown
---
id: SKILL-XXXX
title: "<TODO>"
record_type: skill
status: active
created: YYYY-MM-DD
updated: YYYY-MM-DD
domain: "<TODO>"
template_version: 1
related: []
---

# SKILL-XXXX — <Title>

## Purpose
<TODO>

## Type
<SKILL | PROCEDURE | SHORTCUT | WORKAROUND>

## Prerequisites / Environment
- <TODO>

## Steps
1. <TODO>
2. <TODO>

## Verification of Success
- <TODO>

## Known Failure Modes
- <TODO>

## Limitations / When Not to Use
- <TODO>

## Safety / Governance Constraints
- <TODO or N/A>

## Evidence / Discovery Source
- <TODO or N/A>

## Related Dependencies / ADRs / Failures
- <TODO or N/A>

## Revision Notes
- <TODO when meaningfully updated>
```

---

# TEMPLATE-09 — Failure / Antipattern

```markdown
---
id: FAILURE-XXXX
title: "<TODO>"
record_type: failure
status: active
created: YYYY-MM-DD
domain: "<TODO>"
template_version: 1
related: []
---

# FAILURE-XXXX — <Title>

## Type
<FAILURE | ANTIPATTERN | LIMITATION>

## Symptom
<TODO>

## Detection / Reproduction
<TODO>

## Root Cause
<VERIFIED: ... | HYPOTHESIS: ... | UNKNOWN>

## Why the Approach Fails / Is Dangerous
<TODO>

## Fix
<TODO or UNKNOWN>

## Workaround
<TODO or N/A>

## Regression Protection Added
- <TODO or N/A>

## Prevention Lesson
<TODO>

## Conditions Where This Approach May Be Valid
<TODO or N/A>

## Related ADRs / Tests / Benchmarks / Skills
- <TODO or N/A>
```

---

# TEMPLATE-10 — Governance Debt Record

```markdown
---
id: GOV-DEBT-XXXX
title: "<TODO>"
record_type: governance_debt
status: open
created: YYYY-MM-DD
domain: "<TODO>"
risk_class: "<A|B|C|D|E>"
template_version: 1
rules: []
related: []
---

# GOV-DEBT-XXXX — <Title>

## Governed Rule(s)
- <TODO>

## Gap
<TODO>

## Current Protection
- <TODO>

## Compliance Context
<MISSING ENFORCEMENT | PARTIAL ENFORCEMENT | OTHER>

## Required Mechanism
<TODO>

## Risk
<TODO>

## Activation Milestone
<TODO>

## Owner / Domain
<TODO>

## Status
<OPEN | IN PROGRESS | BLOCKING | CLOSED>

## Closure Evidence
<TODO when closed>
```

---

# TEMPLATE-11 — Engineering Change / Completion Report

```markdown
---
id: CHANGE-XXXX
title: "<TODO>"
record_type: engineering_completion
date: YYYY-MM-DD
status: complete
risk_class: "<A|B|C|D|E>"
template_version: 1
related: []
---

# CHANGE-XXXX — <Title>

## Result
<TODO>

## Changes Made
- <TODO>

## Authority Consulted
- <TODO>

## Risk Classification
<TODO>

## Verification Executed
- <TODO>

## Verification Not Executed
- <TODO or N/A>

## Manual Verification Required
- <TODO or N/A>

## Diagnostics / Performance Evidence
- <TODO or N/A>

## ADR / Documentation / Waiver Changes
- <TODO or N/A>

## Project Brain Updates
- <TODO or N/A>

## Known Limitations / Follow-Up
- <TODO or N/A>

## Git State
**Branch:** <TODO>
**Commit(s):** <TODO or N/A>
**Push / PR / Merge State:** <TODO>
```

---

# TEMPLATE-12 — Agent Task Contract

```markdown
---
id: TASK-XXXX
title: "<TODO>"
record_type: agent_task_contract
status: active
created: YYYY-MM-DD
risk_class: "<A|B|C|D|E>"
template_version: 1
related: []
---

# TASK-XXXX — <Title>

## Objective
<TODO>

## Scope
### In Scope
- <TODO>

### Out of Scope
- <TODO>

## Authority
**Relevant Canon:** <TODO or N/A>
**Relevant ENG-GOV:** <TODO>
**Relevant Architecture:** <TODO or N/A>
**Relevant ADRs:** <TODO or N/A>
**Relevant Brain Skills / Failures:** <TODO or N/A>

## Risk Class
<TODO>

## Permissions
- Edit: <YES/NO>
- Commit: <YES/NO>
- Push: <YES/NO>
- PR: <YES/NO>
- Merge: <YES/NO>
- Tag / Release: <YES/NO>

## Acceptance Criteria
- <TODO>

## Required Verification
- <TODO>

## Manual Verification Required
- <TODO or N/A>

## Expected Brain Updates
- <TODO or N/A>

## Known Constraints / Blockers
- <TODO or N/A>
```

---


---

## 03. Record Linking

Records should primarily reference one another by stable ID.

Example:

```text
ADR-0012
↔ DEP-ZYLANN
↔ BENCH-VOXEL-004
↔ FAILURE-VOXEL-002
↔ SKILL-ZYLANN-BUILD
```

Broken references should become machine-detectable where practical.

## 04. Storage and Generation

Template files should live inside the repository/Project Brain structure chosen by Branch A.

B-OPS-03 does not invent a competing vault layout.

Future tooling may provide record generators such as `new-adr`, `new-waiver`, `new-benchmark`, `new-skill` or equivalent. Generators should allocate IDs safely and avoid collisions under parallel work.

## 05. Metadata Validation

Machine-indexed records may receive structural validation. Examples:

- ADR must have a valid status.
- Accepted ADR cannot retain unresolved required placeholders.
- Waiver must have expiry/reconsideration and an exit plan.
- Dependency must have known licence/provenance.
- Benchmark must identify scenario/method.
- Governance debt must identify affected rules.
- Closed records must contain closure evidence where required.

A structurally valid record can still be semantically wrong; review remains required where governance says so.

## 06. Template Evolution

Templates may evolve without rewriting every historical record.

Historical records remain associated with their `template_version`. Semantic template changes are versioned and documented. Machine tooling should support historical template versions still relevant to the project.

## 07. Agent Use

Coding agents may instantiate governed templates and populate facts established by project state.

They may not fabricate:
- approval;
- verification;
- authority;
- stable IDs already allocated to another record;
- unknown factual fields.

PROPOSED records may retain explicit unresolved placeholders where allowed. Accepted/certified records may not retain unresolved required fields.

## 08. Final Template Law

```text
GOVERNANCE SAYS A RECORD IS REQUIRED
          ↓
SELECT GOVERNED TEMPLATE
          ↓
ALLOCATE STABLE RECORD ID
          ↓
POPULATE KNOWN FACTS
          ↓
MARK UNKNOWN / PROPOSED STATE HONESTLY
          ↓
VALIDATE METADATA
          ↓
REVIEW / ACCEPT / EXECUTE
          ↓
LINK INTO BRAIN / GIT
```

A template exists to reduce ambiguity and clerical cost, never to create bureaucracy for its own sake.
