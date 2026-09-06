# R7 Controlled Pre-Rebuild Technical Programme

**Work:** `WORK-20260906-003`

**State:** ACTIVE — PRD-07 controlled-intake package passes working-tree certification; exact-commit evidence pending.

**Branch:** `codex/chore/brain-governance-pilot`.

**Gameplay permission:** CLOSED.

## Supplied intake

The project owner supplied two artifacts for the first R7 package:

- `PRD-07_Leyforge_Prototype_Benchmark_and_Proof_Execution_Programme_v1_0_CLOSURE_CANDIDATE_Round10.md`
- `PRD-07_to_PRD-08_Executable_Handoff_Manifest_v1_0.txt`

The actual PRD-07 SHA-256 is `c36296278d0c9f09c78931c0bfeaa7a2b2a5aa4b71c741c17fcd7b473259b88e`, exactly matching the supplied handoff. Both artifacts are retained byte-for-byte and admitted through `docs/rebuild/source-intake/r7-prd-07.json`.

## Governing state

PRD-07 declares a 28/28 closure-candidate planning result and simultaneously declares:

```text
SPECIFICATION STATE: CLOSED FOR BROAD DESIGN DISCOVERY
EXECUTION STATE:     NOT STARTED
```

The controlled intake preserves both statements. It does not promote PRD-07, execute proofs, create PRD-08 results, accept ADRs, reopen architecture, activate dependencies or authorize gameplay.

## Next executable package

The next eligible R7 package is the reusable W0 harness bootstrap from PRD-07 section 164:

- FIXTURE-09 build/artifact manifest and clean-export control;
- FIXTURE-01 semantic/world/session/frame identity core;
- architecture-lint bootstrap;
- runtime-ID randomization and projection controls;
- real exported headless/client smoke lanes.

That package requires its own Task contract, prerequisite review and implementation evidence before any `PRD07-RUN-*` ID is allocated.

## Verification

- Full repository verification: PASS, 45/45 acceptance tests.
- Brain Doctor: PASS over 130 records.
- Governance Doctor: PASS over 27 records and 23 authority sources.
- Ingestion, generated indexes and links: PASS with no drift.
- Clean-rebuild boundary: PASS, 2,663 checks, 446 controlled sources and zero active POC dependencies.
- `DOC-PRD-07`: draft/proposed proxy to the Markdown authority.
- PRD-07-to-PRD-08 handoff: registered supporting artifact, no proxy ID.

Exact-commit evidence and Git publication remain pending separate authorization. The two existing owner-controlled Obsidian edits remain outside this package.
