# R7 Controlled Pre-Rebuild Technical Programme

**Last completed work:** `WORK-20260906-005`.

**State:** ACTIVE — PRD-07 intake, W0 harness bootstrap, W0 dependency/export readiness and all 13 W0 proof executions are complete and certified. Later R7 waves remain open.

**Branch:** `codex/chore/brain-governance-pilot`.

**Package starting commit:** `0c087f4ac692ce309c35fc65760be903cd3761b6`.

**ADR acceptance/opening commit:** `93d775f3f2ac1c062a8ef5c912c0aa22702e9ced`.

**W0 runtime implementation commit:** `7e28c92e2c656b1afcbf96c75c3b969edf74494e`.

**Certified evidence state:** `d57332db98c80051f3e15ce7b52fcaaf56eca391`.

**Gameplay permission:** CLOSED.

## W0 Dependency and Runtime State

[[ADR-0008]] is owner-accepted for the development-only proof-harness boundary. Exact proof-only identities are locked for the source-pinned Godot build driver, official 4.8-dev4 export runtime and Voxel Tools `v1.7x` at commit `75d3c6d996ed2331c80edcd8c3ebc947afc0f041`. All are clean upstream with no local patch. Production activation remains proposed/planned/uninstalled and ADR-0001 through ADR-0007 remain proposed.

The nested `proofs/r7/w0/runtime/project.godot` provides the W0 semantic identity, WorldSession, coordinate/frame, projection, read-model, provider, client/headless, diagnostics and deterministic proof fixtures. The repository root still has no `project.godot`; no R8 gameplay work began.

## Export and Execution State

Three clean client exports and three clean headless exports were produced from implementation commit `7e28c92`. Every artifact was hash verified, loaded the exact Voxel Tools runtime, self-reported its build identity and passed the real smoke contract.

All 13 W0 proofs moved individually from `HARNESS-BLOCKED` to READY and then executed. `docs/rebuild/r7/w0-execution-state.json` records 13 run IDs and 13 evidence IDs. The observed outcomes are:

- 12 `PASS-OBSERVED`;
- 0 `FAIL-OBSERVED`;
- 1 `INCONCLUSIVE` — PRD04-PROOF-73, because a no-local-patch baseline cannot prove future patch reproduction; and
- 0 `INVALIDATED`.

The append-only packs are under `docs/rebuild/r7/execution-evidence/`. No result has been submitted to PRD-08. The original `tools/proof_harness/w0-readiness.json` remains the immutable harness-bootstrap snapshot; it is superseded operationally by the execution state, not rewritten into fictional history.

## Certification

[[EVID-0006]] and [[AUDIT-0006]] certify evidence commit `d57332d`:

- 46/46 Brain/governance/R6 acceptance tests PASS;
- 35/35 W0 harness/runtime tests PASS;
- build, focused and full stable gates PASS;
- exact dependency preflight, harness self-check and runtime architecture lint PASS;
- Brain ingestion, indexes, links and both Doctors PASS;
- 4,151 clean-rebuild boundary checks PASS;
- 95 exact runtime/evidence paths admitted;
- zero active POC dependencies; and
- both GitHub Actions workflows PASS.

The machine-readable receipt is `docs/rebuild/r7/w0-dependency-export-completion-receipt.json`.

## Remaining R7 Work

W1 contains 17 unexecuted ownership/worldgen/derived-spatial/transaction proofs. W2, W3, W4, W5 and FINAL also remain open. PRD04-PROOF-73 remains inconclusive. [[CONFLICT-0002]], Branch C final certification and Branch D G5 readiness remain outstanding.

Continue through [[HANDOFF-20260906-005]]. The next bounded action is W1 prerequisite reconciliation and minimum proof-fixture readiness under the next valid Task and Work records. Do not begin PRD-08 evaluation or R8 gameplay.

**R7 remains ACTIVE. PRD-08 evaluation remains CLOSED.**
