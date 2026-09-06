# R6 Brain-to-Governance Operating Pilot

**Work:** `WORK-20260906-002`

**State:** COMPLETE — certified against implementation commit `dd17cd6c5a24ab71aafd5ebf0c252461aa09aef4`.

**Branch:** `codex/chore/brain-governance-pilot`.

**Next gate:** R7 controlled pre-rebuild technical and audit programme.

**Gameplay permission:** CLOSED.

R6 exercises REBUILD-00 Pilot Tasks A through G using a bounded repair to the headless query and stable-ID operator contract. The pilot did not begin Branch C, activate dependencies, accept ADRs or waivers, import legacy implementation, create a Godot project, or start gameplay.

## Repaired baseline defects

- `governance.py query --text pilot` and `brain.py query --text pilot` were rejected even though the certified R5 handoff advertised that form.
- Brain next-ID allocation emitted invalid `TASK-20260906-0002`.
- Governance next-ID allocation emitted invalid `WORK-0001` and `TASK-0001`.

The repaired behavior is certified by `EVID-0003`, and `GOV-DEBT-0007` is closed.

## Pilot result

| Task | Result | Evidence |
|---|---|---|
| A — Authority lookup | PASS | Primary `ENG-GOV-11` ownership/status and historical `SRC-LEGACY-POC-ARCHIVE` classification returned |
| B — Work logging | PASS | Linked Task, Work, Test, Evidence and Audit records; schema-valid dated IDs |
| C — ADR trigger | PASS | Synthetic Class C change blocked pending proposed ADR; bounded Class B fix does not require one |
| D — Governance violation | PASS | `GOV-E024` and `GOV-E033` detected; bounded waiver fixture passes |
| E — Procedure promotion | PASS | `PROC-BRAIN-GOVERNANCE-PILOT` validated as implementation knowledge rather than source authority |
| F — Stale summary | PASS | Disposable drift detected and regenerated from owning records |
| G — Legacy boundary | PASS | POC remains historical evidence; REBUILD-00 resolved as current transition authority; automatic copy-forward rejected |

## Certification

- Implementation commit: `dd17cd6c5a24ab71aafd5ebf0c252461aa09aef4`.
- Exact implementation receipt: `brain/10_TESTING/Evidence/r6-brain-governance-pilot.json`, commit match true.
- R6 pilot acceptance: 7/7 PASS.
- Full acceptance discovery: 45/45 PASS.
- Brain Doctor certification: PASS over 124 implementation records.
- Governance Doctor certification: PASS over 24 governance records, 23 authority sources and 12 templates.
- Controlled ingestion, generated indexes and links: PASS with no drift.
- Clean-rebuild boundary: PASS, 2,617 implementation checks, zero active POC dependencies.

## Continuation

`HANDOFF-20260906-002` establishes the R7 programme. The closeout summary is `docs/rebuild/r6/completion-receipt.json`. The two user-owned Obsidian files remain outside both R6 commits. Push, PR and merge remain separate permissions.
