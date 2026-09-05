# R4 Project Brain v0.1

**Work:** `WORK-20260905-004`

**State:** R4 COMPLETE — implementation certified against commit `58c4cfc891e6cc658ed1b856be3486b9f6cac8cb`.

**Next gate:** R5 Branch B engineering-governance bootstrap.

**Gameplay permission:** CLOSED.

R4 replaced the placeholder vault with an operational repository-owned Project Brain. The implementation follows locked LF-BRAIN-01 through LF-BRAIN-13 and LF-BRAIN-SET-A while leaving every canonical source at its original path.

## Installed capability

- Schema 1 with 38 record types, controlled status vocabularies, authority fields, stable IDs, relationship fields, lineage and generated-file contracts.
- One Python standard-library CLI for Doctor, query, ID allocation, ingestion, index generation, links, traceability, migrations, changed-path impact and certification.
- 441 source artifacts registered by path and Git blob hash.
- 49 selective governance Document proxies; source prose is not copied into the Brain.
- 17 deterministic Markdown indexes, 15 templates, 10 Obsidian Bases and two Canvas maps.
- Obsidian 1.13.7 project configuration with no community-plugin dependency.
- A real authority → requirement → proposed decision → architecture → implementation → test → evidence → candidate-skill pilot.
- GitHub Actions validation for every Brain or governed-source change.

## Certification

- BRAIN-AT-001 through BRAIN-AT-020: 20/20 PASS.
- Brain Doctor full: PASS.
- Brain Doctor certification: PASS.
- Ingestion drift: PASS.
- Index drift: PASS.
- Relationship/link validation: PASS.
- R3/R4 rebuild boundary: PASS; zero active POC dependencies.

Machine evidence is at `brain/10_TESTING/Evidence/r4-certification.json`; its formal record is `EVID-0001`, and the audit is `AUDIT-0001`.

## Open governed items

- `CONFLICT-0001`: PRD-05 is referenced but absent from the retained corpus.
- `CONFLICT-0002`: broader cross-family authority, status and supersession require the later audit/reconciliation gate.
- `RISK-0001`: the rebuild and legacy archive need an independent remote or off-device recovery decision.
- `DEC-0001` remains proposed. R4 does not grant an agent authority to accept the long-term CLI implementation choice.

Read `brain/CURRENT_HANDOFF.md` before R5. R5 installs ENG-GOV/B-OPS controls; the broader Branch C audit follows later. Do not create a runtime or resume gameplay implementation.
