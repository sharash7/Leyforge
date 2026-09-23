
# LEYFORGE PRODUCTION PROGRAMME

## PROD-06 — Production Governance, Task Contracts & Evidence Standard

**Document ID:** PROD-06  
**Title:** Leyforge Production Governance, Task Contracts & Evidence Standard  
**Version:** v0.1  
**Date:** 21 September 2026  
**Status:** **DRAFT FOR OWNER REVIEW — PRODUCTION EXECUTION GOVERNANCE CANDIDATE**  
**Project:** Leyforge  
**Product context:** Ley Realms / The Forge  
**Programme:** PROD — Detailed Production Plan & Implementation Handoff  
**Constitutional parent:** PROD-00 — Production Constitution, Authority & Scope  
**Source-routing parent:** PROD-01 — Legacy Canon & Source Crosswalk  
**Roadmap parent:** PROD-02 — Master Production Roadmap & Dependency Atlas  
**Runtime parent:** PROD-03 — Leyforge Runtime Engineering Architecture  
**Forge parent:** PROD-04 — The Forge Engineering & Creation Journey Architecture  
**Cross-system parent:** PROD-05 — Universal Simulation Primitives & Cross-System Contracts  
**Companion governance:** existing ENG-GOV, B-OPS and Project Brain authority remain in force where applicable  
**Primary evidence lineage:** PRD technical-risk/prototype programme, accepted ADR/proof records, ART-09/ART-10 production/certification workflow, current repository/CI evidence  
**Primary downstream consumers:** PROD-07 through PROD-17, ProductionRegistry, Project Brain, Codex/coding agents, CI, reviewers, production task authors and owner approval workflows

---

# 00. Executive Governance Statement

PROD-00 through PROD-05 define:

- what Leyforge is building;
- what authority means;
- the P01–P192 production order;
- the runtime architecture;
- The Forge architecture;
- the universal cross-system language.

PROD-06 defines:

> **How authorised production work is actually allowed to happen, how it is proved, and how it becomes trustworthy enough for later work to depend upon it.**

The central rule is:

> **No production capability becomes COMPLETE because somebody says “done,” because code exists, because a test once passed, or because an agent produced a confident summary.**

A production capability becomes COMPLETE only when:

1. its authority is resolved;
2. its prerequisites are satisfied;
3. an authorised task contract defines the work;
4. implementation stays inside that contract or records an approved change;
5. required evidence is generated against the correct candidate state;
6. failures are repaired or explicitly governed;
7. required automated and human reviews pass;
8. the exact final repository state is reconciled;
9. the ProductionRegistry/Brain state is updated;
10. downstream permission is explicitly opened.

This document preserves the useful governance already established through ENG-GOV, B-OPS and Project Brain.

It does **not** create a competing bureaucracy.

Where existing Branch B governance already defines a stricter or more specific rule, that rule remains authoritative unless formally superseded.

The production programme adds one missing layer:

> **P01–P192 capability governance.**

---

# 01. Scope

PROD-06 owns the production-level standard for:

- P-slice readiness;
- child-slice allocation;
- Task Contracts;
- Work Records;
- execution authority;
- repository-state verification;
- evidence planning;
- evidence capture;
- automated testing;
- manual/human review;
- performance evidence;
- negative testing;
- failure and repair;
- staging/commit/push authority;
- CI evidence;
- completion;
- handoff;
- ProductionRegistry status transitions;
- programme-gate certification.

PROD-06 does not replace:

- gameplay/content authority;
- ART authority;
- accepted ENG-GOV/B-OPS engineering rules;
- repository protection settings;
- Project Brain operational records;
- ADR ownership;
- specialist production requirements in PROD-07 through PROD-16;
- final programme certification in PROD-17.

---

# 02. Execution Hierarchy

Leyforge production uses the following hierarchy:

```text
PROD PROGRAMME
    ↓
ARC
    ↓
PARENT PRODUCTION SLICE — P###
    ↓
CHILD PRODUCTION SLICE — when required
    ↓
TASK CONTRACT
    ↓
WORK RECORD
    ↓
IMPLEMENTATION + EVIDENCE
    ↓
REVIEW / REPAIR
    ↓
HANDOFF
    ↓
PARENT RECONCILIATION
    ↓
PROGRAMME GATE
```

Each layer serves a different purpose.

---

# 03. Arc

An Arc groups related production capabilities and provides narrative/technical direction.

An Arc is not normally an execution unit.

Example:

> ARC XIII — CALL OF THE DEEP BLUE

contains multiple distinct parent production capabilities.

An Arc closes only when its final P-slice and programme gate pass.

---

# 04. Parent Production Slice

A P-slice is the smallest roadmap-level capability that later production may explicitly depend upon.

Examples:

- P05 — The World Remembers;
- P40 — Stone Dreams;
- P72 — The Impossible Instrument;
- P108 — Shipwright;
- P170 — Tempered Ley.

A P-slice is **not automatically one coding task**.

A P-slice may contain:

- engineering;
- Forge tooling;
- data/schema work;
- content;
- tests;
- art products;
- manual reviews;
- documentation;
- performance proof.

---

# 05. Child Production Slice

A child slice exists when a parent is too large or risky to execute/review safely as one unit.

Example:

```text
P108 — Shipwright

P108-A — Vessel source schema / journey
P108-B — Hull and compartment editor
P108-C — propulsion / steering / crew-station authoring
P108-D — damage / flooding authoring
P108-E — Vessel Forge validation
P108-F — Sea Trial authoring integration
```

These labels are illustrative until governed allocation occurs.

A child slice:

- inherits parent authority;
- narrows scope;
- owns its own evidence;
- may unlock sibling work if declared;
- cannot declare the parent COMPLETE by itself.

---

# 06. Task Contract

A Task Contract is the explicit execution authority for a bounded unit of work.

It answers:

> **What exactly is this worker/agent allowed and required to do now?**

A Task Contract is narrower than a P-slice.

One child slice may require several Task Contracts.

---

# 07. Work Record

A Work Record records what actually happened under a Task Contract.

It contains:

- actual repository state;
- actions taken;
- files changed;
- tests run;
- evidence produced;
- deviations;
- discoveries;
- failures;
- unresolved blockers;
- resulting SHA/state;
- handoff.

Task Contract = intended governed work.

Work Record = observed governed execution.

---

# 08. Handoff

A Handoff transfers current truth to the next authorised execution context.

A handoff must not merely say:

> “Continue where I left off.”

It identifies:

- exact parent/child/task;
- candidate repository state;
- status;
- evidence;
- open failures;
- next allowed action;
- explicitly prohibited actions;
- authority still required.

---

# 09. ProductionRegistry

The ProductionRegistry records programme state.

It is not gameplay canon.

It should point to:

- P-slice;
- children;
- Task Contracts;
- Work Records;
- evidence;
- current status;
- blockers;
- dependencies;
- final proof.

The registry exists so the project can answer:

> **What are we allowed to build next?**

without reconstructing status from chat history.

---

# 10. Project Brain Relationship

Project Brain remains the operational knowledge/navigation layer.

It may index:

- current task;
- current handoff;
- work records;
- production state;
- decisions;
- reusable discoveries.

Project Brain does not independently override:

- PROD;
- FCC;
- ART;
- ENG-GOV;
- accepted ADRs.

Brain status must agree with governed records.

If Brain says READY but the production gate is blocked, the gate is blocked.

---

# 11. Authority Resolution Before Work

Before a Task Contract is READY, the author must identify:

- owning PROD P-slice;
- applicable gameplay/content canon;
- applicable FCC authority;
- applicable ART authority;
- runtime/Forge architecture;
- applicable registry;
- applicable ADR;
- existing implementation/evidence;
- known supersession.

If two current authorities disagree, execution is BLOCKED until resolved.

An agent may not decide which canon “feels newer.”

---

# 12. Source Freshness

Task execution should use the latest authorised versions relevant to the scope.

Freshness verification may include:

- current document version;
- repository branch;
- current HEAD;
- current registry revision;
- package manifest;
- active ADR.

Historical sources may still be used as evidence when PROD-01 allows it.

Historical evidence does not silently become current authority.

---

# 13. Readiness Pipeline

A production task becomes READY only after the following stages pass:

```text
AUTHORITY
    ↓
DEPENDENCIES
    ↓
REPOSITORY / BRAIN STATE
    ↓
TASK SCOPE
    ↓
EVIDENCE PLAN
    ↓
EXECUTION PERMISSION
    ↓
READY
```

A failure at any stage blocks readiness.

---

# 14. Readiness Is State-Specific

A readiness result applies to an exact candidate state.

At minimum record:

- repository;
- branch;
- HEAD;
- working-tree state;
- staged state if relevant;
- applicable content/schema version;
- task contract revision.

A readiness check run against SHA A does not automatically certify SHA B.

---

# 15. Working Tree Classes

Execution should explicitly classify the working tree:

- clean;
- pre-existing allowed modifications;
- task-created unstaged changes;
- staged candidate;
- mixed/unresolved.

Pre-existing unrelated changes must not be silently absorbed.

A Task Contract may permit work in a non-clean tree only when the boundaries are explicit and safe.

---

# 16. Repository Authority Check

Before consequential execution, verify at least where applicable:

- correct repository/workspace;
- intended branch;
- upstream;
- current HEAD;
- ahead/behind state;
- no unexpected history rewrite;
- active task/handoff;
- scope-specific cleanliness.

Exact commands/tools are implementation details.

Do not copy historical SHAs into new tasks.

Verify current truth.

---

# 17. Task Contract Required Fields

Every consequential implementation Task Contract should contain:

## Identity

- Task ID;
- parent P-slice;
- child slice if any;
- title;
- owner/worker role;
- date/revision.

## Authority

- governing PROD documents;
- specialist canon;
- ART;
- ADRs;
- registries.

## Starting state

- workspace/repository;
- branch;
- expected HEAD or acceptable state condition;
- allowed pre-existing modifications.

## Purpose

- one concise capability/result statement.

## In scope

- exact work permitted.

## Out of scope

- tempting adjacent work explicitly prohibited.

## Files/domains

- expected ownership boundaries;
- files/directories if known.

## Dependencies

- hard prerequisites;
- assumptions already proved.

## Acceptance

- automated tests;
- manual test;
- performance/benchmark;
- save/migration;
- accessibility/art review;
- negative tests;
- CI.

## Evidence products

- required artifact names/types.

## Repository actions

Explicitly permit/deny:

- edit;
- generate;
- delete;
- stage;
- commit;
- push;
- open PR;
- merge.

## Stop conditions

- authority conflict;
- unexpected failing test;
- scope expansion;
- data-loss risk;
- ambiguous migration;
- external blocker.

## Handoff

- expected final report;
- downstream unlock.

---

# 18. Explicit Repository Permissions

Repository permissions are fail-closed.

If a Task Contract authorises:

> edit only

the worker may not stage/commit/push merely because the change looks good.

If it authorises:

> edit + test + stage

the worker may not commit.

If it authorises:

> commit exact staged candidate

the worker may not add extra files before committing unless re-authorised.

If it authorises:

> push committed SHA

the worker pushes that governed commit, not a convenient later mutation.

This is deliberately strict.

---

# 19. No Hidden Scope Expansion

When implementation reveals adjacent necessary work, the worker must classify it.

Possible outcomes:

- within current scope;
- minor repair permitted by contract;
- prerequisite defect;
- new child slice required;
- new ADR required;
- later backlog;
- blocking authority question.

Do not solve unrelated architecture while “already in the file.”

---

# 20. Bounded Repair Authority

A Task Contract may grant bounded repair authority.

Example:

> Repair defects directly preventing the named acceptance tests, provided no public schema, save format or owning architecture changes.

This permits efficient work without granting:

> refactor anything you like.

---

# 21. Stop-and-Escalate Conditions

Execution stops when:

- source authority conflicts;
- required source unavailable;
- implementation contradicts PROD-03/04/05;
- save/network/schema compatibility would change unexpectedly;
- stable identity would change;
- test failure indicates out-of-scope defect;
- performance is grossly outside expected envelope;
- a human-only proof is missing;
- the candidate state cannot be identified;
- repository state diverges unexpectedly;
- destructive action exceeds permission.

Stopping is a successful governance outcome when continuing would create untrusted work.

---

# 22. Task Status Vocabulary

Use one production vocabulary across PROD/Brain/registry where practical.

Recommended statuses:

| Status | Meaning |
| --- | --- |
| `UNASSESSED` | No current production reconciliation. |
| `AUTHORITY_RESOLVED` | Current authority/source ownership identified. |
| `PLANNED` | Scope, decomposition and evidence shape exist. |
| `READY` | All current entry/admission gates pass and execution is authorised. |
| `ACTIVE` | Authorised work underway. |
| `BLOCKED` | Hard blocker prevents progress/claim. |
| `VALIDATION_PENDING` | Implementation candidate exists; required evidence incomplete. |
| `FAILED_REPAIR_REQUIRED` | Required gate failed; repair/retest required. |
| `IN_REVIEW` | Candidate and evidence are ready for required review. |
| `PASS` | Defined acceptance checks passed for this execution layer. |
| `COMPLETE` | Reconciled parent/child capability may be depended upon. |
| `DEFERRED` | Intentionally moved out of current scope. |
| `SUPERSEDED` | Formally replaced. |

`PASS` and `COMPLETE` are deliberately different.

---

# 23. READY Is Not Optimistic

A task is not READY because:

- it is next numerically;
- code probably exists;
- a previous chat said ready;
- one test suite passes;
- an admission generator printed READY.

READY means **all current required admission checks actually pass**.

The label must be derived from evidence, not used to override it.

---

# 24. BLOCKED Is Not Failure of the Project

BLOCKED means:

> current authorised work cannot safely proceed.

Typical reasons:

- prerequisite missing;
- review missing;
- environment defect;
- authority conflict;
- CI unavailable;
- acceptance failure.

A blocked task may later return to READY.

---

# 25. Evidence Philosophy

Evidence should answer:

> **What did we actually observe against the exact candidate state?**

Evidence should be:

- relevant;
- attributable;
- reproducible where appropriate;
- state-bound;
- reviewable;
- difficult to accidentally misinterpret.

A beautiful summary is not evidence unless the underlying result exists.

---

# 26. Historical PRD Proof Vocabulary

The PRD programme used a P0–P5 proof-depth vocabulary for technical uncertainty.

PROD preserves those historical proof labels **as evidence metadata where existing PRD records use them**.

PROD-06 does not silently redefine the exact P0–P5 meanings.

Production acceptance uses the evidence classes defined below.

If later work needs an explicit PRD-proof mapping, it must read the authoritative PRD-06/07 definition rather than infer it.

---

# 27. Production Evidence Classes

A P-slice may require several evidence classes.

## EV-A — Authority / Contract Evidence

Proves:

- correct source authority;
- schema;
- dependency;
- ADR;
- ownership.

Examples:

- authority crosswalk;
- accepted ADR;
- validator schema output.

## EV-B — Automated Functional Evidence

Proves deterministic machine-checkable behaviour.

Examples:

- unit tests;
- integration tests;
- contract tests;
- regression tests.

## EV-C — Scenario / Observed Runtime Evidence

Proves a real runtime flow.

Examples:

- manual test;
- controlled Test Lab run;
- multiplayer session;
- Sea Trial;
- tutorial scenario.

## EV-D — Persistence / Migration Evidence

Proves continuity.

Examples:

- save/load;
- unload/reload;
- backup/recovery;
- migration fixture;
- reconnect;
- realm transfer persistence.

## EV-E — Measurement / Performance Evidence

Proves bounded cost/behaviour.

Examples:

- frame time;
- memory;
- generation time;
- queue depth;
- throughput;
- network bandwidth;
- stress/soak.

## EV-F — Presentation / Accessibility Evidence

Proves required player-facing communication.

Examples:

- ART-10 review;
- golden reference;
- reduced effects;
- captions;
- non-colour state;
- icon readability.

## EV-G — Human Review Evidence

Proves judgement that cannot be responsibly automated.

Examples:

- owner acceptance;
- art review;
- UX comprehension;
- visual inspection;
- design intent review.

## EV-H — Repository / CI Evidence

Proves exact integrated candidate state.

Examples:

- final SHA;
- required workflow success;
- branch sync;
- clean/known working tree;
- artifact attached to correct commit.

---

# 28. Evidence Is Typed, Not Ranked

EV-A through EV-H are **classes**, not a ladder.

A performance benchmark is not “better” evidence than a save test.

It proves a different thing.

A production gate specifies which classes are required.

---

# 29. Evidence Record Minimum Fields

A consequential evidence artifact should identify:

- Evidence ID;
- subject P/child/task;
- evidence class;
- candidate SHA/state;
- environment;
- command/scenario;
- inputs;
- expected result;
- observed result;
- pass/fail/blocked;
- timestamp;
- producer;
- reviewer if applicable;
- raw artifact reference;
- limitations.

---

# 30. Observed vs Derived Evidence

Evidence should distinguish:

## Observed

Direct result:

- command exited 0;
- screenshot shows expected state;
- 105/105 cases passed;
- frame time measured X.

## Derived

Interpretation based on observed results:

- therefore acceptance criterion AC-04 passes;
- therefore gate may advance.

Derived conclusions must point to observations.

---

# 31. Synthetic/Fabricated Evidence Prohibited

Do not:

- invent screenshots;
- invent test counts;
- invent CI status;
- invent user review;
- invent performance values;
- infer a human approval from silence.

If required evidence cannot be produced, record it as missing/blocked.

---

# 32. Human Review Cannot Be Automated Away

Where a contract requires human/owner review:

- automated tests may prepare the candidate;
- automated tools may generate review material;
- an agent may summarise findings;

but the required human decision remains outstanding until actually performed.

A placeholder such as:

> `PASS-HUMAN`

without an actual reviewer is invalid.

---

# 33. Human Review Record

Human review should record:

- reviewer;
- subject;
- candidate state;
- materials reviewed;
- decision;
- findings;
- required changes;
- date.

For lightweight visual checks, the record may be concise.

For release gates, it may be extensive.

---

# 34. Automated Test Evidence

Automated test evidence should record:

- command;
- environment;
- test selection;
- candidate SHA;
- pass/fail counts;
- exit code;
- raw output/artifact;
- duration where useful.

A summary that omits failing tests is invalid.

---

# 35. Negative Testing

Important fail-closed systems require negative tests.

Examples:

- invalid stable ID rejected;
- permission denied;
- duplicate transaction retry does not duplicate items;
- stale revision rejected;
- missing mod detected;
- invalid package blocked;
- unsafe Forge operation denied;
- portal transfer failure recovers safely.

Only testing the happy path is insufficient for critical contracts.

---

# 36. Determinism Evidence

Where determinism is required, test:

- repeated runs;
- changed worker ordering;
- changed generation order;
- reload;
- relevant platform/build variation where required.

Compare semantic outputs, not incidental log ordering.

---

# 37. Persistence Evidence

Persistence tests should include relevant transitions:

```text
create/change
→ save/checkpoint
→ unload/close
→ reload/open
→ verify identity/state
```

For migration:

```text
old fixture
→ migrate
→ validate
→ save new version
→ reload new version
```

---

# 38. Performance Evidence

Performance evidence requires:

- defined workload;
- defined build/profile;
- reference hardware/environment;
- measurement window;
- metrics;
- budget;
- result.

“Feels smooth” is not sufficient.

---

# 39. Performance Regression

When modifying an already-measured subsystem, capture regression evidence if the change plausibly affects:

- CPU;
- GPU;
- memory;
- generation;
- streaming;
- navigation;
- automation;
- networking;
- save time.

Not every UI text fix requires a benchmark.

---

# 40. Scenario Evidence

Scenario evidence should define:

- initial state;
- actions;
- expected observable results;
- expected authoritative results;
- recovery/cleanup;
- evidence capture.

Example:

> P109 Launch Day: construct vessel → launch → board → steer → dock → save → reload → vessel/occupants/cargo unchanged.

---

# 41. Visual Evidence

Screenshots/video are supporting evidence, not automatically authoritative evidence.

They are valuable for:

- layout;
- state readability;
- visual defects;
- Forge workflow;
- art certification.

They do not prove:

- inventory conservation;
- save correctness;
- permission correctness;
- hidden state.

---

# 42. Logs

Logs support diagnosis.

A log line saying:

> SAVE SUCCESS

does not itself prove the save reloaded correctly.

Use logs alongside the actual acceptance test.

---

# 43. Evidence Naming

Recommended evidence identity:

```text
EVID-P###-NNNN
```

or equivalent governed stable scheme.

Child/task qualifiers may be included.

Exact numbering mechanism should be machine-managed to avoid collisions.

Do not recycle evidence IDs.

---

# 44. Test Fixture Identity

Persistent fixtures should have stable identity/version.

Examples:

```text
FIXTURE-P005-SAVE-001
FIXTURE-P072-PIPE-ORGAN-001
FIXTURE-P108-VESSEL-SEA-001
```

A changed fixture should declare a new revision/version when its meaning changes.

---

# 45. Evidence Candidate Binding

Every evidence record must bind to the candidate state it proves.

For Git-backed implementation this normally includes:

- commit SHA; or
- explicit staged-tree identity for pre-commit review.

Do not attach evidence from old SHA A to final SHA B unless the change from A→B is proven irrelevant or evidence is rerun.

---

# 46. Working Tree Evidence

When testing before commit, record whether tests apply to:

- working tree;
- index/staged tree;
- HEAD;
- generated package.

This distinction matters.

A staged audit passing does not prove unstaged modifications are safe.

---

# 47. Staging Discipline

If governance requires staging-only review:

- stage only authorised paths;
- record cached diff;
- run staged-state checks where available;
- do not silently include unrelated modifications;
- do not commit until authorised.

---

# 48. Commit Discipline

A commit intended as evidence should be:

- scoped;
- attributable;
- reproducible;
- no unrelated files;
- no hidden generated junk unless required;
- accompanied by passing required local checks or explicitly known failures.

Commit message conventions remain governed by repository policy.

---

# 49. Push Discipline

Push only when authorised.

After push, verify:

- remote contains intended SHA;
- upstream relationship is correct;
- required CI runs started;
- no unexpected branch rewrite occurred.

If final CI must certify the commit, do not mutate the commit while reusing old CI evidence.

---

# 50. Final-SHA CI Rule

Where a gate requires CI:

> **The required workflows must pass for the exact final SHA that will be depended upon.**

A workflow pass on an ancestor is useful history.

It is not final-SHA certification.

---

# 51. CI Failure

A CI failure produces:

- BLOCKED or FAILED_REPAIR_REQUIRED depending stage;
- captured workflow/job/log evidence;
- diagnosis;
- repair task if required.

Do not relabel a red workflow as acceptable because local tests were green unless the Task Contract explicitly classifies that workflow as non-gating.

---

# 52. Readiness Generator Rule

Automated readiness/admission tools are helpers.

Their output must be internally truthful.

If underlying required checks fail, the tool must not emit a misleading state such as:

> READY

because some separate summary field was not updated.

Readiness tools themselves require negative tests.

---

# 53. Generated Evidence Validation

Generated evidence should be validated for:

- candidate binding;
- schema;
- required fields;
- consistency;
- duplicate IDs;
- impossible status combinations.

Examples of invalid combinations:

```text
status = COMPLETE
required_human_review = MISSING
```

```text
status = READY
hard_dependency = FAILED
```

---

# 54. Admission Boundary

Before implementation begins, a Task Contract may require an admission boundary artifact.

It should state:

- task;
- candidate starting state;
- authority;
- prerequisites;
- checks;
- outcome.

Admission is not the implementation result.

It proves permission to begin.

---

# 55. Completion Boundary

Before a child/P-slice becomes COMPLETE, its completion boundary states:

- final candidate;
- required evidence set;
- pass/fail;
- unresolved issues;
- downstream unlock;
- registry update.

---

# 56. Parent Reconciliation

When all required child slices pass, the parent P-slice is reconciled.

Parent reconciliation checks:

1. required child set complete;
2. cross-child integration passes;
3. parent-level acceptance passes;
4. no blocker hidden in child notes;
5. architecture/doc changes reconciled;
6. evidence attached;
7. final SHA/build known;
8. ProductionRegistry updated;
9. next P dependencies evaluated.

---

# 57. Parent Completion Is Explicit

Completion must be recorded.

Do not infer:

> all children looked green, so parent is probably complete.

The reconciliation record is the authoritative promotion.

---

# 58. Programme Gate Reconciliation

At Arc/programme gates such as PG-01, PG-08 or PG-18:

- verify all required P-slices;
- run gate-level integration evidence;
- run cross-system regressions;
- inspect unresolved risks;
- record gate result.

Later Arcs may depend on the programme gate, not only the last code commit.

---

# 59. Regression Responsibility

A task that changes a shared contract owns reasonable regression proof for affected downstream systems.

Example:

Changing universal port compatibility may require tests for:

- machines;
- Flux;
- signals;
- vessels.

Dependency graph/impact analysis should inform the regression scope.

---

# 60. No “Fix Test by Weakening Requirement”

When a test fails because implementation violates canon/architecture:

- repair implementation; or
- formally amend the requirement through governance.

Do not silently weaken the test to green.

---

# 61. Test Change Review

A change to acceptance tests requires extra scrutiny when it:

- reduces coverage;
- changes expected semantics;
- deletes negative cases;
- changes performance budget;
- changes migration expectation.

Test code is part of the production contract.

---

# 62. Flaky Test Policy

A flaky required test is a defect.

Options:

- fix;
- replace with a more reliable proof;
- temporarily quarantine through explicit governance with reason/owner/expiry.

Do not repeatedly rerun until green and call that evidence.

---

# 63. Environment Failures

Distinguish:

- product failure;
- test-harness failure;
- environment failure;
- external-service failure.

A failed harness may block acceptance even if product code is likely correct.

Classification must be evidence-based.

---

# 64. Toolchain Version Evidence

Critical proofs should record relevant versions such as:

- Godot;
- Zylann;
- build configuration;
- package/schema;
- OS/toolchain where material.

This matters when reproducing benchmarks or engine defects.

---

# 65. Manual Acceptance Script

Each detailed P-slice in PROD-07 through PROD-16 should define a concise manual acceptance scenario when player/creator behaviour matters.

It should be executable by a human without reading implementation code.

---

# 66. Rule-of-Cool Acceptance

COOL-PULL and major INTEGRATION slices should include the intended experiential proof.

This is not a substitute for technical evidence.

It is an additional acceptance dimension.

Example P72:

> A player/creator can actually operate the Flux-powered voxel pipe organ and observe key→signal→mechanism→Flux→sound/light response.

If technically correct but joylessly fake, the integration slice has missed part of its purpose.

---

# 67. Owner Review

Owner review is required only where the Task Contract/P-slice says it is.

Do not create owner bottlenecks for every trivial refactor.

Appropriate owner-review targets include:

- constitutional/product change;
- major visual identity;
- major player-facing experience;
- high-risk architecture;
- final gate;
- intentionally subjective Rule-of-Cool milestone.

---

# 68. Approval Scope

An approval applies to:

- identified candidate;
- identified scope;
- identified evidence.

It is not blanket permission to continue changing the same area indefinitely.

---

# 69. Rework After Approval

If material changes occur after approval:

- determine which evidence/review is invalidated;
- rerun/re-review as required.

Minor unrelated documentation typo fixes may not require full recertification.

Use impact analysis.

---

# 70. Evidence Retention

Keep evidence sufficient to:

- audit completion;
- reproduce critical decisions;
- diagnose regression;
- migrate later.

Do not retain every transient log forever.

Retention class may be:

- ephemeral;
- task;
- release-line;
- permanent/project-history.

---

# 71. Evidence Artifact Storage

Evidence may live in:

- repository;
- CI;
- Project Brain;
- Forge records;
- generated reports;
- external approved artifact store.

The Work Record must point to the authoritative location.

Do not duplicate huge binary evidence into Git without reason.

---

# 72. Production Discoveries

Implementation often reveals useful new truths.

Classify discoveries:

- implementation detail;
- reusable engineering pattern;
- content/canon conflict;
- performance result;
- tool defect;
- future improvement;
- governance issue.

Important reusable discoveries should be promoted into Project Brain/ADR/PROD amendments rather than remaining buried in chat.

---

# 73. Architecture Change During Production

If a task proves a PROD-03/04/05 architecture assumption wrong:

1. stop affected work;
2. capture evidence;
3. propose ADR/amendment;
4. identify impacted P-slices;
5. approve change;
6. migrate/retest;
7. resume.

Architecture is authoritative but not sacred when evidence disproves it.

---

# 74. Canon Change During Production

If gameplay/content canon changes:

- owning canon changes first;
- PROD crosswalk/affected contracts update;
- Forge/runtime migration assessed;
- dependent sources invalidated;
- tests updated with approval.

Implementation does not silently redefine canon.

---

# 75. Security-Sensitive Work

Tasks involving:

- multiplayer authority;
- untrusted packages;
- file access;
- executable content;
- credentials;
- server administration;

require explicit threat/negative-test evidence.

Player/community data should be treated as untrusted.

---

# 76. Data-Loss-Sensitive Work

Tasks involving:

- save format;
- migration;
- registry IDs;
- inventory transactions;
- world edits;
- package removal;

require conservative evidence.

Silent loss/corruption is a release-blocking class of defect unless explicitly bounded in a non-production prototype.

---

# 77. Stable-ID-Sensitive Work

Do not rename/reassign canonical IDs casually.

Tasks changing stable identity require:

- migration plan;
- dependency impact;
- save compatibility;
- package impact;
- explicit authority.

Display names can change without changing ID.

---

# 78. Performance-Sensitive Work

High-risk performance tasks should define failure thresholds before measurement.

Do not move the budget after seeing a bad result unless the budget itself is formally reconsidered.

---

# 79. Accessibility-Sensitive Work

Where a feature communicates critical state:

- automated checks where possible;
- manual accessibility review where required;
- reduced-motion/effects;
- non-colour cues;
- input accessibility.

Accessibility is not a separate “later QA” exemption.

---

# 80. Forge Production Evidence

Forge tasks may require:

- source validation;
- deterministic bake;
- dependency graph;
- runtime preview;
- Test Lab;
- golden reference;
- capture;
- package validation;
- provenance.

ART-09/10 remain authoritative for presentation certification.

---

# 81. Content Batch Governance

After a Forge pipeline is proven, content may be produced in batches.

A content batch contract should define:

- family;
- identity list;
- source authority;
- template/inheritance;
- validators;
- representative manual review sample;
- outlier/escalation rule.

Do not write one Task Contract per decorative rock unless risk/ownership requires it.

---

# 82. Family Certification

Where a content family shares one production grammar, certify:

- family rules;
- representative goldens;
- edge cases;
- automated validation.

Then individual family members can use lighter review where safe.

---

# 83. Generated Content Batch Evidence

Generated family output must preserve:

- deterministic settings/seed where required;
- source revision;
- tool version;
- validation;
- outlier list.

Mass generation does not waive review.

---

# 84. Child-Slice Allocation

Child IDs are allocated through the ProductionRegistry/governance process.

Rules:

- stable once published;
- never reused for unrelated work;
- parent prefix retained;
- superseded child remains historical.

Avoid provisional IDs leaking into permanent references unless governed.

---

# 85. Task IDs

Task Contracts use their existing Project Brain/task naming convention where available.

PROD-06 does not create a competing global task-ID scheme if Branch A/B already owns it.

The task record should point back to P/child ID.

---

# 86. Work Record IDs

Likewise, retain the existing Work Record system.

The minimum requirement is traceable mapping:

```text
P-slice
↔ child
↔ Task Contract
↔ Work Record
↔ evidence
↔ final SHA
```

---

# 87. Handoff IDs

Existing handoff conventions remain authoritative.

The handoff should include the PROD/child context.

---

# 88. Evidence IDs Do Not Replace Work IDs

Evidence identifies proof artifacts.

Work Record identifies execution.

One Work Record may produce many evidence artifacts.

---

# 89. Execution Report Template

At task completion, report:

## Authority

- workspace;
- branch;
- starting SHA;
- parent/child/task.

## Work performed

- concise changes;
- files/domains.

## Evidence

- tests;
- scenarios;
- measurements;
- review.

## Result

- PASS / BLOCKED / FAILED_REPAIR_REQUIRED.

## Repository

- ending SHA;
- staged/committed/pushed state;
- ahead/behind where relevant;
- CI state.

## Remaining

- blockers;
- deferred work;
- next authorised action.

---

# 90. Concise vs Full Reports

Routine passing tasks may use concise reports.

High-risk/gate tasks require detailed reports.

Do not bury critical failures in a 5,000-line agent narrative.

The summary should surface:

- status;
- blockers;
- exact candidate;
- evidence.

Raw detail remains linked.

---

# 91. Evidence Matrix

Each P-slice should include an acceptance matrix:

| Acceptance ID | Requirement | Evidence class | Required? | Result | Evidence ref |
| --- | --- | --- | --- | --- | --- |
| AC-01 | ... | EV-B | Yes | ... | ... |

This becomes the parent reconciliation basis.

---

# 92. Non-Goals Matrix

Detailed P-slices should declare non-goals.

Example P02 may explicitly defer:

- final oceans;
- final multiplayer;
- complete worldgen;
- far-distance LOD.

This prevents acceptance from ballooning.

---

# 93. Entry Gate Matrix

Each P-slice should declare:

| Entry requirement | Source | Required status |
| --- | --- | --- |
| P01 complete | ProductionRegistry | COMPLETE |
| Zylann build pinned | ADR/task evidence | PASS |
| ... | ... | ... |

The P-slice cannot self-declare READY while an entry requirement is red.

---

# 94. Exit Gate Matrix

Each P-slice should declare:

- capability delivered;
- tests;
- performance where relevant;
- manual scenario;
- regressions;
- docs/registry;
- final SHA.

---

# 95. Handoff Condition

A P-slice handoff should specify exactly what it unlocks.

Example:

> P05 COMPLETE unlocks P06 Forge persistence assumptions and P12 persistent world-item work.

Downstream work may begin only if its own gate also passes.

---

# 96. Parallel Work

Parallel work is permitted when:

- dependencies stable;
- ownership separate;
- no conflicting schema;
- integration plan exists;
- governance allows multiple active tasks.

Parallelism should reduce elapsed time, not increase ambiguity.

---

# 97. Shared-File Coordination

If two tasks need the same core file/schema:

- sequence them; or
- define explicit ownership/merge strategy.

Do not let two agents independently redesign the same contract.

---

# 98. Integration Branches

Long-lived integration branches are used only where existing governance permits and the work genuinely requires them.

Do not create branch forests merely to represent every P-slice.

Branch strategy remains repository/ENG-GOV owned.

---

# 99. Rebase / History Rewrite

History rewriting on governed shared branches requires explicit policy/permission.

A task may not casually force-push to “clean up” evidence history.

---

# 100. Repository Integrity

High-risk/gate tasks may require integrity checks appropriate to Git/repository state.

Exact command remains ENG-GOV/tooling owned.

Evidence should distinguish harmless dangling/unreachable objects from actual integrity failures.

---

# 101. Generated Files

Generated files should be classified:

- authoritative source;
- required generated product;
- cache;
- evidence;
- temporary.

Caches/temporary files should not enter commits unless intentionally required.

---

# 102. Schema / Generator Tests

Any generator that creates:

- registry;
- evidence;
- readiness;
- migrations;
- Forge products;

needs tests for:

- correct output;
- invalid input;
- stale input;
- deterministic result where required;
- partial failure.

Generated paperwork can be wrong too.

---

# 103. Fail-Closed Default

When required proof is unavailable:

> **BLOCK.**

Do not substitute:

- old proof;
- similar proof;
- inferred proof;
- “probably okay.”

Exceptions require explicit governed acceptance.

---

# 104. Accepted Risk

A known defect/risk may be accepted only through an explicit record stating:

- risk;
- consequence;
- reason;
- owner;
- scope;
- expiry/reconsideration trigger;
- downstream restrictions.

Accepted risk is not the same as PASS.

---

# 105. Deferred Work

Deferred work must specify:

- what is deferred;
- why;
- destination milestone;
- whether current capability is safe without it.

Do not use “later” as a status.

---

# 106. Technical Debt

Technical debt record should include:

- debt;
- consequence;
- owner;
- trigger;
- planned repayment P-slice.

Debt affecting:

- stable IDs;
- save integrity;
- authority;
- resource conservation;
- security;

requires special scrutiny and should not be treated as casual cleanup.

---

# 107. Placeholder Debt

Placeholders are allowed when:

- explicitly labelled;
- final identity known where required;
- replacement milestone identified;
- no false Production Ready claim.

A temporary grey cube may be fine.

A temporary save format with no migration plan may not be.

---

# 108. Evidence Repair

If evidence is found incorrect after PASS:

- invalidate affected PASS;
- mark task/parent appropriately;
- repair/rerun;
- update Work Record;
- assess downstream reliance.

Do not preserve green status for appearances.

---

# 109. Downstream Contamination

If later work depended on an invalidated upstream result:

1. identify affected dependants;
2. stop unsafe further reliance;
3. repair upstream;
4. rerun impacted regressions;
5. restore gates.

Dependency graph/ProductionRegistry should assist.

---

# 110. Reopening COMPLETE

A COMPLETE P-slice may be reopened if:

- critical defect;
- incorrect evidence;
- architecture change;
- migration;
- upstream canon change.

Reopening does not erase historical completion.

It creates a new governed repair/reconciliation record.

---

# 111. Production Gate Severity

Defects can be classified by gate impact.

Recommended classes:

- informational;
- local non-gating;
- child blocker;
- parent blocker;
- Arc/programme blocker;
- release blocker.

Severity is based on consequence, not how annoying the bug feels.

---

# 112. Bug vs Scope

A bug is behaviour that violates an accepted requirement.

A missing feature may simply be out of scope for the current P-slice.

Correct classification prevents infinite scope expansion.

---

# 113. Requirement Change

If desired behaviour changes during implementation:

- change authority/specification first;
- update acceptance;
- update tests;
- record migration/impact.

Do not quietly redefine success after implementation.

---

# 114. Review Independence

Critical gate review should include some independence where practical.

Examples:

- separate human review;
- CI independently reruns tests;
- negative test written separately;
- second agent inspects diff.

The exact level depends on risk.

---

# 115. Self-Certification Limits

An agent can:

- implement;
- test;
- summarise.

It should not fabricate independence by labelling its own result “independent review.”

If independence is required, another review context must perform it.

---

# 116. Test Oracle

A test is only useful if expected behaviour is grounded.

Expected result comes from:

- canon;
- PROD contract;
- ADR;
- accepted reference.

Do not derive the oracle from the current implementation.

---

# 117. Golden References

Where ART requires golden-reference review:

- identify exact reference;
- compare required dimensions;
- capture differences;
- record human/automated review.

Golden reference is evidence, not new gameplay authority.

---

# 118. Player Comprehension Evidence

Some integration milestones require comprehension.

Possible evidence:

- first-time-player session;
- creator workflow session;
- user can explain why something happened;
- usability observation.

This is particularly useful for:

- Forge guided creation;
- automation diagnostics;
- settlement causes;
- Tutorial World.

---

# 119. Rule-of-Cool Evidence

Major spectacle/integration slices can include a simple question:

> **Does the intended fantasy actually land?**

This may require owner/playtest review.

It should not override technical failures.

A broken system is not accepted because it looks awesome.

---

# 120. ProductionRegistry Status Transition Rules

Recommended transitions:

```text
UNASSESSED
  ↓
AUTHORITY_RESOLVED
  ↓
PLANNED
  ↓
READY
  ↓
ACTIVE
  ↓
VALIDATION_PENDING
  ↓
IN_REVIEW
  ↓
PASS
  ↓
COMPLETE
```

Alternative branches:

```text
READY/ACTIVE/VALIDATION_PENDING
  → BLOCKED
  → READY or ACTIVE after resolution
```

```text
VALIDATION_PENDING/IN_REVIEW
  → FAILED_REPAIR_REQUIRED
  → ACTIVE
```

```text
any governed state
  → DEFERRED
  → later re-admission
```

```text
PLANNED/COMPLETE
  → SUPERSEDED
```

---

# 121. Status Transition Authority

Not every worker may transition every state.

Example policy shape:

- worker may report ACTIVE/BLOCKED;
- automated evidence may support PASS;
- reconciliation process promotes COMPLETE;
- owner/governance handles DEFERRED/SUPERSEDED where material.

Exact permissions may inherit ENG-GOV.

---

# 122. Registry Cannot Override Evidence

If registry says COMPLETE but evidence shows a required gate failed:

- registry is wrong;
- fix registry.

Do not treat status as magic authority over reality.

---

# 123. ProductionRegistry Minimum Evidence Fields

Per P-slice:

```yaml
status:
authority:
dependencies:
children:
active_tasks:
acceptance_matrix:
evidence_refs:
final_candidate:
known_risks:
blockers:
handoff_unlocks:
history:
```

---

# 124. Machine-Readable Gate Checks

Where practical, readiness/completion checks should be machine-readable.

Examples:

- prerequisite statuses;
- required evidence IDs;
- final SHA;
- required workflow names;
- review fields.

Human judgement remains separate where needed.

---

# 125. No Hidden Chat Authority

A chat message is useful context.

It is not sufficient long-term production authority if the decision matters to implementation.

Material decisions should be promoted into:

- PROD;
- canon;
- ADR;
- Task Contract;
- Work Record;
- ProductionRegistry.

---

# 126. Production Prompt Standard

A Codex/agent execution prompt should include or link:

- task identity;
- parent/child;
- authority;
- workspace/repository;
- exact permissions;
- scope/non-scope;
- tests/evidence;
- stop conditions;
- reporting format.

Avoid prompts like:

> “Continue Leyforge.”

for consequential production work.

---

# 127. Agent Interpretation Rule

Agent may choose ordinary implementation detail inside the accepted architecture.

Agent must escalate when choice affects:

- gameplay meaning;
- stable identity;
- save/network contract;
- architecture boundary;
- art canon;
- security;
- major UX;
- evidence requirement.

---

# 128. Agent No-Guess Rule

If required data is unavailable:

- search governed sources;
- inspect repository;
- inspect Project Brain;
- report unresolved.

Do not invent:

- file path;
- current SHA;
- current branch;
- current task;
- current test count;
- current registry state.

---

# 129. Exact-State Reporting

Final execution report should explicitly distinguish:

- starting HEAD;
- ending local HEAD;
- ending upstream HEAD;
- working tree;
- staged state;
- CI state.

This was a recurring source of ambiguity historically and should remain explicit.

---

# 130. Handoff Safety

A new worker should be able to begin from the handoff without relying on private chain-of-thought or missing chat context.

Handoff should contain operational facts.

It should not require:

> “the previous agent remembers what it meant.”

---

# 131. Production Start Gate — PG-00

Before P01 implementation begins, PG-00 requires at minimum:

1. PROD-00 through PROD-06 accepted enough to govern work;
2. ProductionRegistry created/bootstrapped;
3. current production repository verified;
4. current branch strategy/governance verified;
5. Project Brain current task/handoff state reconciled;
6. P01 detailed contract available from PROD-07;
7. P01 child decomposition determined if required;
8. first Task Contract admitted;
9. evidence storage/ID convention operational;
10. no unresolved blocker that makes P01 unsafe.

This is a one-time production restart gate.

It must not become an excuse to invent PRD-10 through PRD-97.

---

# 132. P01 First Task Principle

The first production task should be deliberately narrow.

It should prove the governance itself:

- correct authority;
- correct repository;
- bounded code change;
- tests;
- Work Record;
- evidence;
- final SHA;
- handoff.

Do not begin production with a giant “bootstrap entire engine” mega-task.

---

# 133. Detailed P-Slice Contract Template

PROD-07 through PROD-16 should use the following template for every P-slice.

```text
P### — NAME

Classification
Arc
Player/Creator payoff

Purpose

Authoritative source packet

Entry gate

Dependencies
- hard
- Forge
- runtime
- content
- evidence

Universal primitives used

In scope

Explicit non-scope

Implementation capability requirements

Forge requirements

Runtime requirements

Canonical content subset

Persistence / save implications

Multiplayer / authority implications

Simulation-LOD implications

Accessibility / localisation implications

Performance implications

Security / trust implications

Child-slice recommendation

Acceptance matrix
- automated
- negative
- scenario
- persistence
- performance
- ART/accessibility
- human review
- CI

Rule-of-cool target

Exit gate

Downstream unlock

Known risks / ADR triggers
```

---

# 134. Child Task Contract Template

```text
TASK ID
Parent P
Child slice
Title

Authority packet

Starting repository state

Purpose

In scope

Out of scope

Allowed files/domains

Allowed repository actions

Dependencies

Implementation notes / constraints

Acceptance criteria

Evidence artifacts

Stop conditions

Final report requirements

Handoff target
```

---

# 135. Work Record Template

```text
WORK RECORD ID
Task ID
Parent/Child

Start
- repository
- branch
- HEAD
- tree state

Actions performed

Files changed

Tests/evidence

Deviations/discoveries

Failures/repair

End
- HEAD
- staged/committed/pushed
- upstream
- CI

Result

Open blockers

Next allowed action
```

---

# 136. Evidence Manifest Template

```yaml
evidence_id:
subject:
class:
candidate:
environment:
procedure:
expected:
observed:
result:
artifact:
reviewer:
limitations:
created_at:
```

---

# 137. Completion Record Template

```text
P### COMPLETION RECONCILIATION

Required children:
Result per child:

Parent acceptance matrix:
Integration result:
Regression result:
Final candidate:
CI:
Human review:
Known accepted risks:
Deferred work:
Registry update:
Downstream unlock:
Final status:
```

---

# 138. Failure Report Template

A failed task should report clearly:

```text
STATUS: FAILED_REPAIR_REQUIRED

Failed acceptance:
Observed:
Expected:
Candidate:
Likely cause:
Scope:
Evidence:
Safe next action:
Forbidden next action:
```

Do not bury failure under success wording.

---

# 139. Blocked Report Template

```text
STATUS: BLOCKED

Blocker:
Authority/source:
Why work cannot safely continue:
What has already passed:
What remains:
Required resolution:
```

---

# 140. Repair Cycle

Repair follows:

```text
failure evidence
→ diagnosis
→ bounded repair Task Contract
→ implementation
→ rerun failed evidence
→ rerun impacted regression
→ review
→ return to PASS
```

Do not skip regression merely because the original failing test now passes.

---

# 141. Rerun Identity

A rerun should retain relation to original evidence.

Example:

```text
EVID-P057-0042
superseded by
EVID-P057-0047
reason: repair commit ABC...
```

Historical failure remains useful.

---

# 142. Attempt Limits

PROD-06 does not impose arbitrary attempt counts.

Repeated failure should trigger:

- broader diagnosis;
- architecture reassessment;
- proof prototype;
- ADR.

Do not brute-force reruns indefinitely.

---

# 143. Prototype Inside Production

A production task may need a bounded prototype.

Prototype must be labelled:

- disposable;
- evidence-only;
- candidate implementation.

Prototype success does not automatically make the prototype code production architecture.

---

# 144. Benchmark Decision

When a parameter is explicitly evidence-driven:

1. define candidates;
2. define workload;
3. define metrics;
4. run;
5. compare;
6. select;
7. record ADR/decision;
8. implement.

Example:

- partition size;
- view distance;
- worker count.

Do not choose first then benchmark to justify it.

---

# 145. Experimental Work

Experimental P-slices/tasks cannot become hidden dependencies of core production.

If experiment becomes required:

- formally promote;
- define acceptance;
- update dependency graph.

---

# 146. External Dependency Changes

When Godot/Zylann/third-party behavior changes:

- classify technology fact;
- reproduce;
- assess contract impact;
- update ADR/provider adapter;
- rerun impacted proofs.

Do not rewrite gameplay canon because provider API changed.

---

# 147. Evidence Minimum by Classification

Suggested baseline:

## FOUNDATION

Usually requires:

- EV-A;
- EV-B;
- negative tests;
- EV-D if persistent;
- EV-E if performance-sensitive;
- EV-H.

## FORGE-FIRST

Usually requires:

- EV-A;
- EV-B;
- Forge validation;
- Test Lab scenario;
- source→bake→runtime proof;
- EV-F where presentation;
- EV-H.

## COOL-PULL

Usually requires:

- technical acceptance;
- EV-C observed scenario;
- human/owner review when experience is central.

## INTEGRATION

Usually requires:

- cross-system regression;
- EV-C end-to-end;
- persistence where applicable;
- performance under combined load where relevant;
- EV-H.

## EXPANSION

Usually requires:

- family/batch validation;
- representative edge cases;
- regression;
- no architectural drift.

Exact requirements are P-specific.

---

# 148. Evidence Minimum Is Not Maximum

A high-risk FOUNDATION may require far more evidence.

A tiny low-risk content expansion may require less.

The detailed P-slice owns the actual matrix.

---

# 149. Risk-Driven Evidence

Evidence effort should scale with:

- irreversibility;
- save impact;
- authority/security;
- fan-out;
- performance risk;
- content volume;
- player consequence.

Do not spend release-gate effort proving a typo fix.

Do not use typo-fix effort proving save migration.

---

# 150. Completion Language

Allowed:

> “Implementation complete; validation pending.”

Allowed:

> “Automated acceptance passed; human visual review outstanding.”

Allowed:

> “Child P108-C COMPLETE; P108 parent remains ACTIVE.”

Not allowed:

> “Done.”

when important gates remain.

---

# 151. Production Dashboard Truth

Any dashboard/status generator must derive from:

- registry;
- evidence;
- task/work records.

Manual summary fields should not silently override objective blockers.

---

# 152. Stale Status

Status becomes stale when:

- final candidate changes;
- dependency invalidated;
- authority changed;
- required CI expired/invalidated by new commit;
- source changed.

The registry should be able to mark review required.

---

# 153. Dependency Invalidation

When upstream P changes materially:

- identify downstream dependants;
- classify impact;
- invalidate only affected evidence;
- rerun required regressions.

Do not automatically reopen all 192 P-slices.

---

# 154. Production Gate Reports

Each PG gate in PROD-02 receives a short gate report containing:

- required P-slices;
- final statuses;
- integration evidence;
- unresolved accepted risks;
- final candidate;
- pass/fail;
- next Arc admission.

---

# 155. PG-18 Special Rule

P170 / PG-18 is especially strict.

It proves:

> **Leyforge and The Forge work as a release-hardened product without AI.**

No AI result may be used as mandatory evidence to close PG-18.

Optional development assistants may help produce code/assets, but the shipped non-AI capability cannot depend on runtime AI.

---

# 156. PG-20 Special Rule

P192 / PG-20 uses the Tutorial World as final whole-product integration.

Passing individual systems is insufficient if the final real adventure reveals broken composition.

PG-20 includes:

- runtime;
- Forge;
- saves;
- multiplayer;
- accessibility;
- localisation;
- scalability;
- packaging;
- optional AI-off;
- real Tutorial World play.

---

# 157. PROD-17 Interface

PROD-17 will become the final master verification/certification register.

PROD-06 defines the evidence grammar that PROD-17 consumes.

By then, every P-slice should have:

- completion record;
- evidence matrix;
- final state;
- unresolved accepted risks;
- supersession history.

---

# 158. Governance Anti-Bloat Rule

Governance exists to make production safer and faster.

Do not create a new form when an existing governed record can carry the required information.

Examples:

- use existing Task Contract instead of `PROD_TASK_FORM_2`;
- use existing Work Record instead of a parallel execution diary;
- use ADR for architecture decisions instead of a new PROD waiver format;
- use Project Brain for operational navigation rather than duplicating it.

The goal is **traceability without paperwork theatre**.

---

# 159. Governance Automation Rule

Automate repetitive checks where:

- rule is objective;
- state is machine-readable;
- false confidence risk is controlled.

Keep human review where:

- judgement is genuinely subjective;
- product intent matters;
- art/UX experience matters;
- risk acceptance is required.

---

# 160. Governance Usability Rule

A worker should be able to answer quickly:

- What am I doing?
- What can I touch?
- What must I not touch?
- What proves success?
- What stops me?
- Can I commit?
- Can I push?
- What happens next?

If the governance system cannot answer those, it is too vague.

---

# 161. Production Handoff Prompt Shape

When handing a P/child to Codex, prefer:

```text
You are executing TASK-...

Parent: P...
Child: ...

Authority:
...

Repository:
verify current governed state before editing.

Allowed:
...

Forbidden:
...

Acceptance:
...

Evidence:
...

Stop if:
...

Repository authority:
edit/stage/commit/push permissions explicitly listed.

Return:
structured execution report.
```

---

# 162. Production Start Procedure After PROD-16/17

Before first code production:

1. owner accepts/reconciles PROD corpus;
2. create ProductionRegistry;
3. put PROD docs into repository/Project Brain;
4. verify active production branch/governance;
5. verify current repo clean/known;
6. open P01;
7. allocate child slices if needed;
8. create first Task Contract;
9. execute;
10. capture evidence;
11. reconcile;
12. move to next allowed task.

No additional general pre-production programme is required unless a real blocker appears.

---

# 163. Relationship to Historical R7-Style Execution

The project learned valuable lessons from intensive gated execution before PROD.

PROD retains the principles:

- fail closed;
- exact candidate identity;
- evidence IDs;
- staged-state awareness;
- negative tests;
- human-proof integrity;
- final-SHA CI;
- explicit allocation and handoff.

PROD does **not** require every future ordinary task to reproduce every temporary R7 audit artifact or identifier family.

The production system should keep the principles and simplify the machinery.

---

# 164. Relationship to PRD

PRD evidence remains valuable for:

- technology facts;
- risk history;
- proof results;
- rejected options;
- benchmark methods.

Production does not rerun PRD blindly.

It reruns/revalidates when:

- production context differs;
- dependency version changed;
- proof did not meet production gate;
- risk remained open;
- later architecture changed the question.

---

# 165. Relationship to ART-09 / ART-10

ART-09 defines asset-production execution.

ART-10 defines visual/audio certification.

PROD-06 wraps those into broader production governance without weakening them.

A P-slice that ships final art content must satisfy both:

- PROD technical evidence;
- ART production/certification evidence.

---

# 166. Relationship to Forge Test Laboratory

Forge Test Lab outputs may serve as EV-C/EV-F/EV-E evidence where the scenario is versioned and candidate-bound.

A casual editor preview does not automatically become certification.

---

# 167. Relationship to Automated AI Production

Optional production-time agents/Codex may execute governed tasks.

They remain subject to:

- authority;
- Task Contract;
- evidence;
- repository permissions;
- human review where required.

Agent confidence is not evidence.

---

# 168. Privacy and Support Evidence

Release diagnostics/evidence should avoid unnecessary private user data.

Performance/support bundles should collect only what is needed to diagnose the product according to later release/privacy policy.

---

# 169. PROD-06 Acceptance Gate

PROD-06 is ready for owner lock when the owner agrees that:

- [ ] Arc/P/child/task/work/evidence/handoff hierarchy is correct;
- [ ] existing ENG-GOV/B-OPS/Project Brain remains authoritative rather than duplicated;
- [ ] readiness is exact-state and fail-closed;
- [ ] Task Contracts define explicit repository action permission;
- [ ] scope expansion requires classification/re-authorisation;
- [ ] PASS differs from COMPLETE;
- [ ] required evidence is typed and candidate-bound;
- [ ] human review cannot be manufactured by automation;
- [ ] historical PRD P0–P5 labels are retained without silently redefining them;
- [ ] production evidence uses EV-A through EV-H classes;
- [ ] negative testing is required where fail-closed behaviour matters;
- [ ] final-SHA CI is required where CI is a gate;
- [ ] staged/working/HEAD states are distinguished;
- [ ] readiness generators cannot override failing underlying checks;
- [ ] parent completion requires explicit reconciliation;
- [ ] downstream unlock is explicit;
- [ ] shared-contract changes own regression impact;
- [ ] flaky required tests are defects, not rerun lotteries;
- [ ] accepted risk and deferred work require explicit records;
- [ ] ProductionRegistry is a state index, not authority over evidence;
- [ ] detailed Arc docs use the standard P-slice template;
- [ ] ordinary production governance should be lighter than exceptional R7-style certification while retaining its principles;
- [ ] PG-00 is the final gate before P01 code execution;
- [ ] no optional AI is required to close PG-18;
- [ ] P192/PG-20 remains final whole-product certification;
- [ ] after the PROD handoff is complete, the project proceeds to production rather than inventing another generic planning programme.

---

# 170. Proposed Lock Statement

If owner-approved, lock the following:

> **PROD-06 — LEYFORGE PRODUCTION GOVERNANCE, TASK CONTRACTS & EVIDENCE STANDARD — v0.1**
>
> Leyforge production executes through governed parent P-slices, optional child slices, explicit Task Contracts, Work Records, typed evidence and formal handoffs. Existing ENG-GOV/B-OPS and Project Brain governance remains authoritative and is reused rather than duplicated. Every consequential task resolves current authority, dependencies, repository state, scope, evidence requirements and repository permissions before becoming READY. Work is fail-closed: missing authority, failed prerequisites, missing human review, misleading generated readiness, stale candidate evidence or red gating CI prevents completion. PASS indicates required checks for an execution layer have succeeded; COMPLETE requires explicit parent reconciliation, evidence binding, registry update and downstream handoff. Automated, scenario, persistence, measurement, presentation, human-review and repository evidence remain distinct and candidate-bound. The exact final SHA must be certified where CI is required. Production governance preserves the rigorous principles learned during pre-production proof/execution work while avoiding unnecessary duplication of temporary audit machinery. After PROD-00 through PROD-17 are accepted and PG-00 passes, Leyforge proceeds directly into P01 production.

---

# 171. Next Document

After PROD-06 acceptance/reconciliation, continue to:

> **PROD-07 — Arcs I–II Production Contracts: P01–P11**

PROD-07 is the first detailed executable production volume.

It will define:

- P01 — The Empty Canvas;
- P02 — Stone Beneath Our Feet;
- P03 — First Footfall;
- P04 — The First Scar;
- P05 — The World Remembers;
- P06 — The Forge Ignites;
- P07 — Names of Power;
- P08 — Voxelwright;
- P09 — The Alchemist's Palette;
- P10 — The Testing Crucible;
- P11 — A Glimmer in the Stone.

Each receives:

- exact entry gate;
- authority packet;
- dependencies;
- child-slice recommendation;
- implementation scope;
- explicit non-scope;
- runtime/Forge requirements;
- acceptance matrix;
- test/evidence targets;
- Rule-of-Cool payoff;
- exit gate;
- downstream unlock.

---

**End of PROD-06 v0.1 — Production Governance, Task Contracts & Evidence Standard Candidate**
