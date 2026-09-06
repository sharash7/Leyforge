# R7 Controlled Pre-Rebuild Technical Programme

**Last completed work:** `WORK-20260906-004`.

**State:** ACTIVE — PRD-07 intake and the reusable W0 harness bootstrap are complete and certified; PRD-07 proof execution is not started.

**Branch:** `codex/chore/brain-governance-pilot`.

**Package starting commit:** `263e3f1810c08c1cd0197cc140fed5d6f45fbb16`.

**Base W0 implementation commit:** `502604abfe36bf7cd654c688fba4a03ac649baf4`.

**Certified W0 state commit:** `c25daedd33dc33ece3f70ab6867f6477a40c4ea1`.

**Gameplay permission:** CLOSED.

## PRD-07 Authority

PRD-07 is complete as a theoretical/executable programme and its controlled intake is certified. Its 28/28 closure checks, 76 specified proofs and supporting risk/fixture edges do not constitute run evidence or PRD-08 evaluation.

The governing sources are:

- `.summer/00_Docs/PRD/PRD-07_Leyforge_Prototype_Benchmark_and_Proof_Execution_Programme_v1_0_CLOSURE_CANDIDATE_Round10.md`;
- `.summer/00_Docs/PRD/PRD-07_to_PRD-08_Executable_Handoff_Manifest_v1_0.txt`;
- `docs/rebuild/source-intake/r7-prd-07.json`; and
- `docs/rebuild/r7/intake-completion-receipt.json`.

## CI Drift Repair

Commit `263e3f1810c08c1cd0197cc140fed5d6f45fbb16` fixed the generated-proxy hash drift. The Brain had hashed raw Windows CRLF working-tree bytes while Git committed LF-cleaned source bytes. `brain.py` now derives working-tree blob identities through `git hash-object --stdin-paths`, respecting Git clean filters. The D-ROAD-02 proxy and document registry were regenerated through approved tooling. Both GitHub Actions workflows pass at that commit.

The initial W0 closeout commit `349f0e16f1aab9448ffd4e5c5509a6c3a80981ed` exposed the same portability class in the W0 admission manifest: one JSON artifact was pinned from raw CRLF worktree bytes. Certified state commit `c25daedd33dc33ece3f70ab6867f6477a40c4ea1` pins all 24 W0 artifacts by Git-clean blob ID and canonical LF size/SHA-256. The full gate passes in a fresh LF-only 446-source checkout.

## W0 Harness Bootstrap

[[TASK-20260906-004]] and [[WORK-20260906-004]] governed a Class C, development-only package. [[ADR-0008]] records the external standard-library harness boundary as **PROPOSED**; certification does not accept it as production architecture.

The certified package implements:

- FIXTURE-01 semantic, world, session, canonical-coordinate and frame-epoch identity;
- deterministic runtime-ID randomisation and reversible semantic projection;
- projection destruction/eviction and read-model rebuild controls;
- canonical snapshots/hashes plus isolated fixture save/reload;
- FIXTURE-09 source, dependency, role, profile, precision, content/schema and clean-export manifests;
- artifact and optional symbol hashing, runtime self-report matching and tamper detection;
- non-destructive clean-export orchestration and shell-free external process terminate/restart/timeout capture;
- guarded client and dedicated/headless smoke-lane contracts;
- deterministic scenario/fault plans, structured diagnostics, metrics and canonical oracles;
- append-only evidence-pack validation that retains PASS, FAIL, INCONCLUSIVE and INVALIDATED outcomes while preventing invalidated/synthetic results from entering PRD-08;
- the PRD-07 state machine with guarded run/evidence identity transitions; and
- read-only architecture dependency lint with known-good and seeded-violation fixtures.

The exact admitted tool/test set is SHA-256 pinned by `docs/rebuild/r7/w0-harness-boundary.json`. `tools/verify_rebuild_boundary.py` admits only those listed development-tool paths and continues to reject unlisted executable/runtime content.

## Readiness Result

`tools/proof_harness/w0-readiness.json` records:

- 13 W0 proofs: `HARNESS-BLOCKED`;
- 0 W0 proofs: `READY`;
- client export smoke lane: `HARNESS-BLOCKED`;
- dedicated/headless export smoke lane: `HARNESS-BLOCKED`;
- allocated `PRD07-RUN-*` IDs: 0; and
- allocated `PRD07-EVID-*` IDs: 0.

Real proof execution remains blocked because the clean rebuild has no V1 runtime adapters, exact installed Godot/Zylann identities, provider candidates, client export or dedicated/headless export. Synthetic controller tests remain explicitly ineligible for PRD-07 evidence.

## Certification

[[EVID-0005]] and [[AUDIT-0005]] certify state commit `c25daedd33dc33ece3f70ab6867f6477a40c4ea1`:

- 46/46 Brain/governance/R6 tests PASS;
- 28/28 W0 contract/integration tests PASS;
- W0 self-check and architecture lint PASS;
- Brain ingestion, generated indexes and links PASS;
- Brain and Governance certification Doctors PASS;
- 2,993 clean-rebuild boundary checks PASS;
- fresh LF-only clean-checkout verification PASS;
- 24 exact W0 paths admitted; and
- zero active POC dependencies.

The machine-readable receipt is `docs/rebuild/r7/w0-bootstrap-completion-receipt.json`.

## Boundary and Next Dependency

R7 remains active. PRD-08 has no result. ADR-0001 through ADR-0008 remain proposed. DEP-GODOT and DEP-ZYLANN remain planned/uninstalled with unresolved provenance/licence state. [[CONFLICT-0002]] remains open. Branch D G5, later R7 waves and Branch C certification remain downstream.

Continue through [[HANDOFF-20260906-004]]. The next bounded action is dependency/export readiness for W0 Group A: govern exact Godot and Voxel Tools identities and establish real R7 proof-only client/headless export targets before any proof row can become READY. Begin that package under the next available `TASK-20260906-005` and `WORK-20260906-005` records. It must not open R8 gameplay.
