# R7 Controlled Pre-Rebuild Technical Programme

**Work:** `WORK-20260906-003`

**State:** ACTIVE — PRD-07 controlled intake COMPLETE AND CERTIFIED; W0 harness bootstrap NOT STARTED.

**Branch:** `codex/chore/brain-governance-pilot`.

**Certified implementation commit:** `e1ab8d28984ac022f49133d21059ed1502c8b081`.

**Gameplay permission:** CLOSED.

## Supplied Intake

The project owner supplied two artifacts for the first R7 package:

- `PRD-07_Leyforge_Prototype_Benchmark_and_Proof_Execution_Programme_v1_0_CLOSURE_CANDIDATE_Round10.md`
- `PRD-07_to_PRD-08_Executable_Handoff_Manifest_v1_0.txt`

The actual PRD-07 SHA-256 is `c36296278d0c9f09c78931c0bfeaa7a2b2a5aa4b71c741c17fcd7b473259b88e`, exactly matching the supplied handoff. Both artifacts are retained byte-for-byte and admitted through `docs/rebuild/source-intake/r7-prd-07.json`.

## Governing State

PRD-07 declares a 28/28 closure-candidate planning result while separately declaring `SPECIFICATION STATE: CLOSED FOR BROAD DESIGN DISCOVERY` and `EXECUTION STATE: NOT STARTED`.

The controlled intake preserves both statements. It does not promote PRD-07, execute proofs, create PRD-08 results, accept ADRs, reopen architecture, activate dependencies or authorize gameplay.

## Intake Certification

[[EVID-0004]] and [[AUDIT-0004]] certify the bounded intake at exact implementation commit `e1ab8d28984ac022f49133d21059ed1502c8b081`. The machine-readable receipt is `docs/rebuild/r7/intake-completion-receipt.json`.

The full certification passed:

- 45/45 acceptance tests;
- Brain Doctor over 130 implementation records;
- Governance Doctor over 27 implementation records, 23 authority sources and 12 templates;
- ingestion, generated-index and relationship-link checks;
- 2,663 clean-rebuild boundary checks;
- 446 controlled sources, five post-R3 intake artifacts and zero active POC dependencies; and
- the PRD-07 proxy-collision regression assertion.

## Next Executable Package

The next eligible R7 package is `R7-W0-HARNESS`, the reusable W0 harness bootstrap from PRD-07 sections 121 through 124, 164 and 165:

- FIXTURE-09 build/artifact manifest and clean-export control;
- FIXTURE-01 semantic/world/session/frame identity core;
- architecture-lint bootstrap;
- runtime-ID randomization and projection controls; and
- real exported headless/client smoke lanes.

That package requires `TASK-20260906-004`, `WORK-20260906-004` and an entry-prerequisite review before implementation. No `PRD07-RUN-*` or `PRD07-EVID-*` identifier has been allocated.

## Boundary

R7 remains active. All 13 W0 proofs and PRD-08 evaluation remain not started. ADR-0001 through ADR-0007 remain proposed, DEP-GODOT and DEP-ZYLANN remain planned and uninstalled, and [[CONFLICT-0002]] remains open. R8 gameplay permission remains closed.

Git publication remains pending exact authorization. The two owner-controlled Obsidian edits remain outside this package.
