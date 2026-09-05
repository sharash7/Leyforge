# Retained source locations

All 441 supplied documents remain under `.summer/00_Docs/`, preserving their source paths and declared authority/status. Retention is not promotion to current authority. The only R3 editorial changes are REBUILD-00 execution fields and the explicit dated update in D-ROAD-02.

| Location | Treatment |
|---|---|
| A-BRAIN | Locked Branch A specifications; physical implementation deferred to R4 |
| B-ENG-GOV+B-OPS | Engineering governance and certified operating corpus; enforcement deferred to R5 |
| PRD | Owning PRD statuses retained; PRD-05 location unresolved |
| C-AUDIT, D-ROAD | Programme authority; older live-state claims require owning-evidence refresh |
| 00-20 through 27-30, ART, FCC-01-14, LFE, FORGE-ENG | Supplied source/architecture material; statuses remain as declared, no new admission |
| ARCHIVED, POC manual guide, VoxelRegistry.json | Historical documentation/snapshots only; never runtime data providers |
| Additional | Controlled transition/handoff material, including REBUILD-00 |
| docs/rebuild/archive-evidence | Dated R2 evidence; no runtime fixtures or current gameplay claims |

The old root SHA256SUMS is a known-stale historical source manifest. R3 does not rewrite owning manifests or silently certify that baseline. The R3 validator compares retained sources against exact Git blobs and verifies the complete source path set. Source hashes exempt only the two explicitly declared execution updates.
