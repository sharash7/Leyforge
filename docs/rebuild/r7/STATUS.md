# R7 Controlled Pre-Rebuild Technical Programme

**Active handoff:** `HANDOFF-20260911-001`. `WORK-20260910-002` and `TASK-20260910-002` are cancelled after the governed stop; `EVID-0015` / `AUDIT-0015` certify stopped-package integrity and W4 programme-level FAIL.

**State:** ACTIVE — PRD-07 intake and W0-W3 execution are complete and certified. W4 execution is incomplete after a governed fail-closed stop: pairs 0066–0072 are retained as three PASS, three INCONCLUSIVE and one raw FAIL; eight proofs are NOT-RUN. Issued high-water is 0072 and 0073 is not allocated. W5 and FINAL are not ready.

**Branch:** `codex/chore/brain-governance-pilot`.

**W3 pre-abort repaired source commit:** `67cbda5c4a9dd6cc73f89640fdc21c5cd79b5026`.

**W3 fixture-launch repair/re-certification implementation commit:** `05f5e8934cc0e99044117e1af4166bb424272e2f`.

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

## W3 Execution Rerun

Fresh owner authorization opened `TASK-20260909-001` / `WORK-20260909-001`. The lifecycle opening is published at `d3ff9930757e3fbe91498444fe97de1649811545`. Repaired readiness and admission independently regenerate exactly; all 23 admitted artifacts and source-tree identity `e2216c2d6ee85671025214600bfe8cb3d21981db6ce974f47ae5772d72d9d73b` remain exact.

The exact fixed Godot driver again parsed/loaded the repaired source, clean-exported it and ran the exported runtime. Six collision cases, frame conversion and provider checks pass with zero errors. Dependency identity remains exact with `NO-LOCAL-PATCH`. The live registry contains 50 retained pairs/packs through 0050 plus quarantined 0051-0057, no W3 state and no 0058+ allocation. W3 tests pass 35/35; build/focused/full, both Doctors, indexes, links, governance controls, immutable-path comparison and 8,464 clean-rebuild checks pass.

The complete pre-execution gate was published at `f92445e2b432b568327cd16685b6c6fceaf355b4`. The single repository-governed executor then allocated only `PRD07-RUN-0058` / `PRD07-EVID-0058` for PRD04-PROOF-27 and durably entered execution. Client and headless exports and build self-reports passed with exact pinned Godot/Voxel identities and no production runtime.

The first fixture did not launch. `tools/r7_w3_runtime/builds.py:548` dereferenced nonexistent `ArtifactManifest.path` instead of the declared `artifact_path`, producing `AttributeError` during `fixture-runtime-self-report`. The journal durably marks 0058 `INVALIDATED` and `ABORTED-BEFORE-PROOF-OBSERVATION`; no standard evidence pack exists. The other six objectives were not entered and no 0059+ identity was allocated.

State commit `21cdbbc9d3c5552ed7018536f0c36159b66a61ee` and evidence commit `7e6ddbf75bada68855a3390f2d9810cd13975fad` preserve the exact failure. [[EVID-0011]] / [[AUDIT-0011]] certify it. The registry validates through issued high-water 0058, with retained 0001-0050, quarantined 0051-0057 and invalidated 0058.

The unchanged repaired admission was the exact pre-execution boundary and does not certify the new failed-state journal. Final post-stop clean-boundary validation therefore reports five W3 admission/state mismatches across 8,482 checks. The immutable machine abort record preserves the earlier 8,467-check observation made before the lifecycle records were added. The post-stop W3 suite completes 35 cases with 34 passing; its sole failure is the stale assertion expecting registry high-water 0057 instead of the durable invalidated 0058. Both conditions must be repaired and re-certified; neither was silently changed under the failed execution contract.

Post-stop compilation, governance 18/18, R6 7/7, 87 unaffected tool/runtime tests, proof-harness/static W0-W3 preflights, Brain ingest/index/links, both certification Doctors and registry validation pass. The official focused wrapper fails on the one stale W3 assertion; the official full wrapper reaches 45/46 Brain/governance/R6 tests and fails only the test that requires the red clean-boundary validator. These controlled failures are retained, not waived.

## W3 Technical Environment Execution Rerun — Complete

Fresh owner authorization opened `TASK-20260909-003` / `WORK-20260909-003` from exact starting HEAD `7fe5881374d9704ff23f1a4408cb4c0afbc48f9c`. The final published pre-execution source was `cc61b5d7b4ee8f58c8c6bb885a2c6bcfd7026489`; its exact Brain integrity #37 and Engineering governance integrity #36 workflows passed before execution.

The governed executor durably allocated and retained pairs 0059-0065 in exact order for proofs `27, 28, 08, 30, 29, 31, 32`. All seven are `PASS-OBSERVED`; no result failed, was inconclusive, blocked, aborted or newly invalidated. Raw state/packs are immutable at `5605ea1157ff8129a8cdef555c81f1a14a27e021`.

Terminal reconciliation reports W3 COMPLETE, RUN/EVID high-water 0065, 57 retained packs, quarantined 0051-0057, invalidated 0058 and next future sequence 0066. The 82-artifact terminal boundary, exact Godot/template/Voxel identities and production boundary pass. Clean build/focused/full, W3 46/46, tool/runtime 99/99, Brain/governance/R6 46/46 and rebuild boundary 9,013/9,013 pass at published terminal checkpoint `325fe1fe3bcbf9faa17684143421eef0fb1f8deb`; Brain integrity #38 and Engineering governance integrity #37 both pass on that exact SHA.

`EVID-0013` / `AUDIT-0013` certify completion. W4, PRD-08/09, R8, gameplay and production remain closed.

## W4 Readiness and Admission — Certified

The owner-authorized `R7-W4-FORGE-TRUST-PRESENTATION-MIGRATION-READINESS-AND-ADMISSION` package is complete under `TASK-20260910-001` / `WORK-20260910-001` and certified by `EVID-0014` / `AUDIT-0014`. Canonical W4 proofs 49-62 and 71 are all READY; every proof observation remains `NOT-EXECUTED`.

FIXTURE-07 and FIXTURE-08 revision `W4-R1` are deterministic, reproducible, non-production proof/readiness fixtures. The FCC-13E ledger covers exactly all 312 rows without sampling or waiver and remains unobserved. Readiness/admission pins 30 exact artifacts at source-tree identity `a8c44988293279ded102b6cc4f6a4a62fdff461e5fefbf351a58306b2a86beb5`.

At readiness certification the durable identity high-water was 0065 and proposed pairs 0066-0080 were `PREVIEW-NOT-ALLOCATED`. That historical readiness state is preserved; later owner-authorized execution is recorded separately below.

## W4 Governed Execution — Controlled Stop

The admitted source was `b5a52ca8411aa4712e1c2bad5917455867f61b70`. Exact starting-SHA workflows, source/readiness equality, dependencies, fixtures, registry, W3 history, protected fingerprints and the production boundary passed before allocation. The proof-only artifact used the fixed Godot driver, official `4.8.dev4.official.b56a91878` template and certified Voxel Tools revision with `NO-LOCAL-PATCH`.

Actual pairs 0066–0072 map to proofs 49, 50, 51, 52, 53, 54 and 55. Results are PASS, INCONCLUSIVE, INCONCLUSIVE, PASS, INCONCLUSIVE, PASS and raw FAIL. The three inconclusive results preserve absent required human judgement. The proof-55 pack remains immutable, while stopped reconciliation records `W4-MEASUREMENT-DEFECT-001` and admission `RETAINED-NOT-ADMISSIBLE-AS-CANDIDATE-FAILURE`; the oracle lowercased case-sensitive base64 and did not exercise actual engine capability resolution. No proof was rerun.

Proofs 56, 57, 58, 59, 60, 61, 62 and 71 were not entered. PROOF-57 and PROOF-58 each observed 0/312 FCC-13E rows, so no migration-coverage result exists. The issued high-water is 0072; 0073 and later remain unallocated. [[EVID-0015]] / [[AUDIT-0015]] certify the controlled stop and W4 programme-level FAIL.

## Remaining R7 Work

W4 repair, recertification and a later separately authorized rerun remain open programme work. The next optional package is `R7-W4-MEASUREMENT-HARNESS-REPAIR-RECERTIFICATION-AND-RERUN-READINESS`; it must preserve 0066–0072, validate a capable proof-55 observation route, establish the lawful future order/identity preview and stop without proof execution or 0073 allocation. PRD04-PROOF-73 remains inconclusive. [[CONFLICT-0002]], Branch C final certification and Branch D G5 readiness remain outstanding.

Continue only through [[HANDOFF-20260911-001]]. W3 is COMPLETE and W4 is INCOMPLETE. Do not reuse 0051-0058, alter 0066–0072, allocate 0073, rerun W4, open W5, evaluate/open PRD-08/09 or open R8 without the applicable fresh authority.

**R7 remains ACTIVE. PRD-08 evaluation remains CLOSED.**
