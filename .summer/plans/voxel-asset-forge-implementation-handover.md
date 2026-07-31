# Voxel Asset Forge MVP Handover

## Completed

- Documents 21A-21F MVP architecture and developer workflows.
- Main-menu development route and shared Godot EditorPlugin workspace.
- Canonical Forge resources, persistence, validation, override/variant,
  dependency, migration and performance services.
- Deterministic surface, mesh, icon, animation, voxel-frame, scene, package and
  manifest baking.
- Runtime registry, chunk, item, icon and one-way visual-state integration.
- Seven approved representative assets and a 312-entry migration register.
- Blueprint Designer handoff through the existing settlement registry.

## Non-negotiable constraints

- Keep gameplay definitions authoritative and presentation state one-way.
- Preserve stable `original_id` gameplay links; block and item namespaces stay
  separate. Never persist numeric runtime IDs in Forge sources.
- Do not create duplicate gameplay registry records for visual variants.
- Do not add the Stage B village lab to the main menu.
- Do not change `main.tscn` wiring without explicit Summer Engine ownership.
- Preserve legacy presentation fallback throughout 21G.
- Keep chute topology and rendering on the shared elevation-aware resolver,
  including automatic one-block slopes.

## Next safe stage

Stop here for owner review. When explicitly approved, begin Document 21G as
small migration batches using
`content/forge/migration/registry_migration_register.json`. Each batch should:

1. Preserve stable gameplay IDs and record base/override provenance.
2. Add canonical source, validation evidence and representative previews.
3. Pass the Forge probe and current full regression gate.
4. Receive human visual approval before changing the migration status.
5. Retain legacy fallback until save/blueprint/world compatibility is signed.

Do not start a broad automatic catalogue conversion.

## Verification at handover

- `FORGE_MVP_PROBE`: 868 checks, zero failures.
- `MAIN_MENU_PROBE`: 23 checks, zero failures.
- `CURRENT_REGRESSION_GATE`: 5,890 checks, zero failures, 256 worldgen seeds,
  zero recovered shutdown crashes.
- Requirement ledger freshness check: 36 documents and 6,442 rows.
- Hardware live-preview capture: all seven goldens plus the full workspace,
  8/8 images with zero failures.

Representative live-preview review is complete. The remaining golden workflows,
camera features outside orbit/zoom/reset, and packaged-development-build
workflow sign-off remain open and must not be inferred from the automated
result.
