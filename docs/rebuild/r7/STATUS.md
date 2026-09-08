# R7 Controlled Pre-Rebuild Technical Programme

**Active handoff:** `HANDOFF-20260908-003`. `WORK-20260908-002` and `TASK-20260908-002` completed the bounded W3 repair/re-certification; the prior execution records remain cancelled after their controlled abort.

**State:** ACTIVE — PRD-07 intake and W0-W2 execution are complete and certified. The first authorized W3 executor failed before any proof ran; the resulting source/control-plane repair and repaired readiness/admission are now complete and certified. A fresh owner-authorized W3 execution rerun is the next bounded action. W4, W5 and FINAL remain open.

**Branch:** `codex/chore/brain-governance-pilot`.

**W3 pre-abort repaired source commit:** `67cbda5c4a9dd6cc73f89640fdc21c5cd79b5026`.

**W3 repair/re-certification implementation commit:** `45b0300caa0ebd66d4c740a71db983a7a9827f3b`.

**W1 package starting commit:** `b531168b7c3b18a8d2126d8ac064260ecd6ff425`.

**W1 opening commit:** `128d18da4dd9cb9152e88f9c8bc3c92d055fbca3`.

**W1 runtime implementation commit:** `4b5affc1d51802199422c4f94bdf6d49f453d9ea`.

**W1 admitted source revision:** `9424d4df9e4fb78884a94db3a2f65f468fb5f27c`.

**Certified W1 evidence state:** `d7e672d3a04760e102966158898932f1093bbbd3`.

**Gameplay permission:** CLOSED.

## W1 Runtime and Export State

The separate `proofs/r7/w1` boundary implements only the W1 owner/revision, deterministic worker, distant simulation/fidelity, canonical edit/readiness, derived-provider, transaction/trace and bounded-pressure fixtures. It reuses exact W0 dependency identities and has no active POC dependency or production activation.

Fresh real client and headless exports were produced from admitted source revision `9424d4d`. Both loaded Voxel Tools, matched exact build/artifact identity, reported zero presentation-authority dependencies and passed the smoke contract.

## W1 Execution State

All 17 W1 proofs moved individually from `HARNESS-BLOCKED` to READY and then executed. `docs/rebuild/r7/w1-execution-state.json` retains `PRD07-RUN/EVID-0014` through `0030`. All 17 results are `PASS-OBSERVED`; none failed, was inconclusive or was invalidated.

Cumulative W0/W1 state is 30 retained run/evidence pairs: 29 PASS and one INCONCLUSIVE. W0 PRD04-PROOF-73 remains inconclusive. No result has been submitted to PRD-08. PRD04-PROOF-18 metrics remain experimental and establish no final production budget.

## Certification

[[EVID-0007]] and [[AUDIT-0007]] certify evidence commit `d7e672d`:

- 46/46 Brain/governance tests PASS;
- 42/42 tool/harness/runtime tests PASS, including 7/7 W1-specific tests;
- build, focused and full gates PASS;
- W1 preflight, admission, real exports/provider probes and evidence retention PASS;
- Brain ingestion, indexes, links and both Doctors PASS;
- 5917 clean-rebuild boundary checks PASS;
- zero active POC dependencies; and
- both GitHub Actions workflows PASS.

The machine-readable receipt is `docs/rebuild/r7/w1-execution-completion-receipt.json`.

## W2 Execution State

All 20 W2 proofs moved individually from `HARNESS-BLOCKED` to READY and then executed. `docs/rebuild/r7/w2-execution-state.json` retains `PRD07-RUN/EVID-0031` through `0050`. All 20 results are `PASS-OBSERVED`; none failed, was inconclusive or was invalidated.

Cumulative W0, W1 and W2 state is 50 retained run/evidence pairs: 49 PASS and one INCONCLUSIVE. W0 PRD04-PROOF-73 remains inconclusive. No result has been submitted to PRD-08. PRD04-PROOF-18 and W2 metrics remain experimental and establish no final production budget. W4 FCC-13E revalidation remains REQUIRED.

## Certification

[[EVID-0008]] and [[AUDIT-0008]] certify W2 evidence commit `7fa9858a682c1f32f2e70381f78c4a891e492693`.

## W3 Readiness State

The corrected W3 package exposes exactly PRD04-PROOF-08, 27, 28, 29, 30, 31 and 32. All seven are READY against source commit 67cbda5c4a9dd6cc73f89640fdc21c5cd79b5026. Corrected readiness is docs/rebuild/r7/w3-readiness-corrected.json and exact admission is docs/rebuild/r7/w3-execution-boundary-corrected.json.

At readiness certification, no W3 proof had executed, no W3 execution-state file existed and no W3 RUN/EVID identity had been allocated. The earlier W3 readiness and boundary artifacts remain preserved as SUPERSEDED-INVALID.

## W3 Readiness Certification

Build, focused, full, W3 regression, readiness/preflight, admission, dependency identity, registry, immutable evidence, Brain, Governance Doctor, clean-rebuild boundary, Git integrity and diff checks pass. Root project.godot and production runtime remain absent. Gameplay permission and PRD-08 evaluation remain closed.

## W3 Execution Package

The owner authorized bounded governed W3 execution on 2026-09-08. `TASK-20260908-001` and `WORK-20260908-001` were opened for that action and are now cancelled after the controlled abort. Commits `67cbda5c4a9dd6cc73f89640fdc21c5cd79b5026` and `de4b1a2e42e28f9bd5511fa5bb641c8992e3eb1e` were published unchanged, followed by lifecycle-opening commit `5f03ae2f598059495a8c7fb21d4386a4b047e2bf`.

Fresh revalidation proved exact source-tree identity, readiness/admission equality, all 19 artifact identities, `NO-LOCAL-PATCH` dependency identity, a unique contiguous 50-pair registry, all 50 retained historical packs, prior-evidence immutability and a clean production boundary. W3 regression passed 23/23; the full stable tier passed 46 Brain/governance/R6 and 76 tool/runtime tests; the boundary validator passed 8,253 checks with zero active POC dependencies. The result was published at checkpoint `da19ec5f05af19a29a473a6489b7da717f76b2c4`.

The guarded executor then created a fresh exact client export but the exported runtime could not parse admitted `proofs/r7/w3/server_probe/src/main.gd`: line 118 calls unavailable static method `PhysicsServer3D.shape_collide`. The required self-report count was zero and the process exited before headless export or proof execution. No proof received a canonical PASS, FAIL or INCONCLUSIVE result, no standard PRD-07 evidence pack was created, and no W3 state file exists.

Abort evidence is immutable at commit `e1458eb3589ca2ee844e9b5848e0226f6cdc56b5` and certified by `EVID-0009` / `AUDIT-0009`. The executor had materialized all seven 0051-0057 rows with immediate-allocation status and advanced RUN-0051 into execution in memory before failure. Although the automated persisted registry still ends at 0050, all 0051-0057 RUN/EVID pairs are quarantined and must not be reused until governed repair reconciles the transaction.

## W3 Repair and Re-certification

The owner-authorized `R7-W3-TECHNICAL-ENVIRONMENT-REPAIR-AND-RECERTIFICATION` package is complete under `TASK-20260908-002` / `WORK-20260908-002` and certified by `EVID-0010` / `AUDIT-0010`. Implementation commit `45b0300caa0ebd66d4c740a71db983a7a9827f3b` replaces the unavailable collision call with an actual-world `PhysicsDirectSpaceState3D.collide_shape` query, adds a proof-inert validation mode, makes future allocation/failure transitions durable and covers failure/recovery behavior with 35 focused W3 tests.

The exact pinned Godot driver parsed and loaded the repaired source, produced a clean release export and ran its validation self-report. Six collision cases, frame round trips and the pinned Voxel Tools provider checks reported zero errors; proof execution remained false and no identity was allocated. Repaired readiness reports 7 READY / 0 BLOCKED / 0 NOT APPLICABLE. Repaired admission pins 23 exact source, tooling, certification and quarantine artifacts.

`docs/rebuild/r7/w3-allocation-reconciliation.json` now governs 0051-0057 as issued, evidence-ineligible and permanently non-reusable without fabricating proof outcomes or packs. The retained registry remains 50 W0-W2 pairs/packs through 0050; issued high-water is 0057; 0058 is only the first future preview and is not allocated.

## Remaining R7 Work

W3 repair/re-certification is complete. A fresh governed execution-rerun package under `HANDOFF-20260908-003` is required before executing any W3 proof or allocating 0058. W4, W5 and FINAL remain open, but W4 is not the present next action. PRD04-PROOF-57 and 58 require eventual W4 corpus revalidation. PRD04-PROOF-73 remains inconclusive. [[CONFLICT-0002]], Branch C final certification and Branch D G5 readiness remain outstanding.

Continue only through [[HANDOFF-20260908-003]]. Do not execute/rerun W3, allocate 0058, reuse 0051-0057, begin W4, evaluate PRD-08 or open R8 without the fresh authority required by that handoff.

**R7 remains ACTIVE. PRD-08 evaluation remains CLOSED.**
