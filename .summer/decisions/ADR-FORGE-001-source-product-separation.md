# ADR-FORGE-001: Separate Canonical Forge Sources From Runtime Products

**Status:** Accepted  
**Date:** 30 July 2026  
**Owner:** Leyforge project

## Context

The Voxel Asset Forge needs editable voxel, surface, compound, animation,
override and state data without making gameplay depend on editor-only APIs or
runtime microvoxel nodes. Generated meshes and scenes must be reproducible,
reviewable and safe to replace while stable gameplay IDs and saves remain
authoritative.

## Decision

- `content/forge/` contains canonical, editable source Resources, contracts,
  pack metadata and the migration register.
- `generated/forge/` contains immutable, content-addressed products and small
  active package/manifest pointers.
- Bake keys include the canonical source hash and baker version.
- Active packages are promoted only after product save/read-back succeeds.
- Runtime resolves packages by stable gameplay ID through a separate
  presentation ID. A missing or invalid package uses `legacy_runtime`.
- Source resources may be shared by the Godot EditorPlugin and the
  development-only in-menu host. Runtime consumers use baked packages.
- Ordinary production animation swaps pre-baked voxel-frame meshes; it never
  remeshes source volumes every animation tick.
- Numeric registry IDs remain runtime implementation details. Canonical links
  use `original_id`-derived block/item IDs and keep the namespaces separate.

## Alternatives Considered

- Hand-edit generated scenes and meshes: rejected because output would not be
  reproducible and source provenance would be lost.
- Load source voxels directly in gameplay: rejected because it couples runtime
  performance and compatibility to authoring formats.
- Replace gameplay registry records during visual migration: rejected because
  it risks saves, recipes, inventories and blueprints.

## Consequences

- Generated output consumes repository space and requires explicit bake
  versions, manifests and cleanup policy.
- Source schema changes require registered migration steps.
- Visual replacement is independently reversible and legacy fallback remains
  available during 21G migration.
- Editor code can be excluded from release exports while approved runtime
  packages remain usable.

## Validation

- `forge_mvp_probe.tscn` verifies source/product determinism, package lookup,
  stable IDs, fallback behavior, frame pre-baking and runtime consumption.
- `run_current_regression_gate.ps1` verifies existing save, registry, world,
  settlement and gameplay behavior after Forge integration.

## Rollback

Disable the Forge plugin/autoload and remove project package resolution from
the presentation consumers. Stable gameplay registries and legacy render paths
remain intact, so no save migration is required for that rollback.
