# Leyforge AI Change Ledger

## FORGE-2026-07-30-001

- **requested_goal:** Implement the Documents 21A-21G Voxel Asset Forge plan,
  expose it from the main menu, and pause before the 21G bulk visual migration.
- **files_changed:** `scripts/forge/**`, `addons/leyforge_forge/**`,
  `content/forge/**`, `generated/forge/**`, Forge runtime consumer integrations,
  main-menu/project configuration, verification and traceability documents.
- **schemas_or_ids_touched:** Forge source schema v1; package/manifest schema v1;
  baker `forge-pipeline-v4`; existing 312 stable gameplay IDs linked without
  renaming or duplication; world save schema remains v17.
- **tests_run:** Editor parse/import; seven-golden seed/rebake; focused Forge
  probe; main-menu probe; current whole-project regression gate.
- **validation_result:** Seven golden assets rebaked with zero failures; Forge
  probe 839/839; main-menu probe 23/23; whole-project gate 5,861/5,861 across
  27 probes and 256 worldgen seeds. Human visual and packaged-development
  workflow sign-off remain open.
- **known_risks:** Generated cache growth; human UX/visual acceptance; large
  library performance; full multiplayer pack handshake; 305 deferred legacy
  presentations.
- **reviewer:** Project owner pending manual sign-off.
- **rollback_reference:** ADR-FORGE-001. Disable package resolution/plugin and
  retain `legacy_runtime`; no gameplay-ID or save rollback is required.

## FORGE-2026-07-30-002

- **requested_goal:** Review all new Forge features, identify missing work and
  correct live-preview texture, rotation/aspect and zoom behaviour.
- **files_changed:** Forge preview viewport/workspace, textured preview mesh
  baker, approval/atomic-save services, focused probe, capture and stale-rebake
  utilities, current regression gate and Forge traceability documents.
- **schemas_or_ids_touched:** No schema, gameplay ID or save change. Existing
  recovery backups moved from imported `.previous.tres` files to
  non-imported `.previous.bak` files.
- **tests_run:** Source/manifest/product SHA-256 audit; hardware preview capture;
  focused Forge probe; main-menu probe; whole-project current regression gate.
- **validation_result:** Seven approved sources and all manifest products are
  synchronized; hardware captures 8/8; Forge probe 868/868; main menu 23/23;
  whole-project gate 5,890/5,890 across 27 probes and 256 worldgen seeds, with
  zero recovered shutdown crashes.
- **known_risks:** Remaining golden/manual workflows; perspective/pan/fly,
  remapping, split and controller camera controls; packaged-development sign-
  off; final-system features and 305-asset 21G migration remain open.
- **reviewer:** Project owner has positively reviewed the initial Forge and
  should continue manual workflow checks before 21G begins.
- **rollback_reference:** Revert the preview/UI/service changes and retain the
  existing generated package pointers; no gameplay or save migration applies.
