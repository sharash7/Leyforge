# R6 Brain-to-Governance Operating Pilot

**Work:** `WORK-20260906-002`

**State:** IMPLEMENTATION COMPLETE — prepublication certification PASS; exact-commit certification pending.

**Starting commit:** `b7caa254fd14534d1d33ab11a1f0e7d978d4dc38`.

**Branch:** `codex/chore/brain-governance-pilot`.

**Gameplay permission:** CLOSED.

R6 exercises REBUILD-00 Pilot Tasks A through G using a bounded repair to the headless query and stable-ID operator contract. The pilot does not begin Branch C, activate dependencies, accept ADRs or waivers, import legacy implementation, create a Godot project, or start gameplay.

## Reproduced baseline defects

- `governance.py query --text pilot` and `brain.py query --text pilot` were rejected even though the certified R5 handoff advertised that form.
- Brain next-ID allocation emitted invalid `TASK-20260906-0002`.
- Governance next-ID allocation emitted invalid `WORK-0001` and `TASK-0001`.

The defects are recorded in `GOV-DEBT-0007` and repaired in the prepared worktree.

## Pilot result

| Task | Result | Evidence |
|---|---|---|
| A — Authority lookup | PASS | Primary `ENG-GOV-11` ownership/status and historical `SRC-LEGACY-POC-ARCHIVE` classification returned |
| B — Work logging | PASS | Linked Task, Work, Test, Evidence and Audit records |
| C — ADR trigger | PASS | Synthetic Class C change blocked pending proposed ADR; bounded Class B fix does not require one |
| D — Governance violation | PASS | `GOV-E024` and `GOV-E033` detected; bounded waiver fixture passes |
| E — Procedure promotion | PASS | `PROC-BRAIN-GOVERNANCE-PILOT` remains implementation knowledge rather than source authority |
| F — Stale summary | PASS | Disposable drift detected and regenerated from owning records |
| G — Legacy boundary | PASS | POC remains historical evidence; automatic copy-forward rejected; gameplay closed |

## Verification

- R6 pilot acceptance: 7/7 PASS.
- Full acceptance discovery: 45/45 PASS.
- Brain Doctor certification: PASS.
- Governance Doctor certification: PASS.
- Controlled ingestion, generated indexes and links: PASS with no drift.
- Clean-rebuild boundary: PASS, 2,617 checks, zero active POC dependencies.
- Machine receipt: `brain/10_TESTING/Evidence/r6-brain-governance-pilot.json`.

## Publication boundary

No R6 files are staged or committed. The two pre-existing user-owned Obsidian files remain outside R6. Exact-commit evidence, certified closeout, the post-pilot handoff and any push require their applicable explicit authorization.
