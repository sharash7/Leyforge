# Voxel Asset Forge Implementation Coverage

**Implementation date:** 30 July 2026  
**Last reverified:** 13 August 2026
**Document boundary:** 21A-21G v0.1  
**Implemented boundary:** 21A-21F MVP and 21G readiness only

## Outcome

The developer Voxel Asset Forge MVP is implemented in both supported hosts:
the Godot main-screen EditorPlugin and the development-only in-menu workspace.
It is reachable from `Developer Tools -> Voxel Asset Forge`; the main menu is
the default startup scene. Production feature configurations hide the route.

This is not a claim that the complete final-system breadth of Documents
21A-21F is finished. The verified boundary is their stated MVP/POC slice.
Document 21G bulk asset migration has not started.

## Verified MVP capabilities

| Area | Implemented evidence |
|---|---|
| Identity and index | 312 canonical registry presentations, 143 block and 169 item namespaces, unique stable IDs, approved/legacy status and duplicate diagnostics |
| Shared hosts | One `ForgeWorkspace` used by the EditorPlugin and restricted runtime host |
| Surface authoring | Six independent 32 x 32 faces, palette-index painting, tile preview, six baked PNG products and a live nearest-neighbour per-face textured cube |
| Voxel authoring | Add/remove/paint, X/Y/Z slices, X symmetry, metre density, hidden-face meshing and custom chunk geometry |
| Compound authoring | Named parts, hierarchy records, editable pivots/sockets, state markers and separate animated geometry |
| Material authoring | Palette roles, shared Material DNA resources, vertex-colour material bake and material-state parameters |
| Placement | Simple collision boxes, footprint cells, rotations/support metadata and contract-sensitive validation |
| Animation and state | Transform/material/visibility tracks, sockets, one-way state adapter, layer priority, state simulator, critical visual/audio redundancy |
| Voxel-frame animation | Bounded frame sources, onion-skin metadata, per-frame duration, three pre-baked meshes, nearest mesh track and reduced-motion fallback |
| Overrides and variants | Field inherit/replace/clear/merge, deterministic precedence and variation, conflicts, provenance, compare and selected-field revert |
| Bake and recovery | Atomic draft saves, non-imported recovery backups, autosave/recovery, deterministic content keys, source/product hash verification, manifests, last-valid package pointers and undo/redo |
| Runtime consumers | Block colour/shape, chunk faces/custom geometry, item held/drop model, inventory icon, package scenes, state refresh and hot reload |
| Blueprint handoff | Existing settlement blueprint registry is read directly; approval refreshes presentation by stable block ID without rewriting blueprints |
| 21G readiness | All 312 presentations inventoried; seven representative goldens approved; 305 retain legacy fallback; `bulk_migration_started=false` |

## Golden asset set

1. Grass block: six-face 32 x 32 surface flow.
2. Stone construction brick: shared material/family flow.
3. Wooden chute: unique open geometry, rotations, sockets, material variants
   and automatic one-step slopes.
4. Stone furnace: compound parts, pivots, sockets, transforms, material heat,
   effect/audio cues, layered states and voxel-frame magical flame.
5. Crude pickaxe: world/held/drop/icon representation.
6. Mana conduit: custom chunk geometry and powered-flow presentation.
7. Crusher: named multi-part reciprocating animation.

## Acceptance review fixes

The 30 July acceptance review corrected four issues before 21G:

1. The live block preview now uses all six authored face textures with nearest
   filtering instead of average face colours.
2. The inspection camera is orthographic, centres and frames each asset, keeps
   orbit as bounded yaw/pitch without roll, and resizes its render target to
   the visible panel without aspect stretching.
3. Mouse wheel, touchpad gesture, plus/minus/zero shortcuts and visible
   keyboard-focusable zoom/reset buttons provide 25-800 percent inspection.
4. Approval hashes now describe the saved approved source. Atomic rotation
   backups use `.previous.bak`, so Godot does not import them as duplicate-UID
   resources. All seven source manifests and listed product hashes are checked.

Hardware-rendered captures confirmed all seven approved goldens: both textured
surface cubes, the wooden chute, the current crude-pickaxe silhouette, the
compound furnace, the mana conduit and the crusher. The capture utility and
images are under
`.summer/verification/artifacts/forge_preview/`.

## Explicit open acceptance

- Representative live previews were visually reviewed, but the remaining
  golden workflows and all later migration assets still require owner testing
  for silhouettes, tiling, icon composition, readability and creator
  ergonomics.
- Camera navigation is partial: orbit, pan, zoom and reset are implemented;
  perspective/fly presets, remapping, split views and controller preview
  rotation remain beyond this MVP.
- A packaged development build still needs owner/manual Forge workflow sign-off.
- The release export filter is configured, but a production export is not being
  treated as the project priority or as completed approval.
- Full multiplayer content-pack handshake, large-library profiling, advanced
  effect pooling, final controller UX and final LOD tuning remain beyond this
  MVP proof.
- The 305 non-golden presentations have not been visually migrated. No legacy
  presentation may be retired until its 21G acceptance record is approved.

## Verification commands

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File `
  .summer/verification/run_current_regression_gate.ps1

.\.local\Godot_v4.8-dev-a9c94-shutdown-fixed\godot.windows.editor.x86_64.console.exe `
  --headless --rendering-method gl_compatibility --path . --scene `
  res://.summer/verification/forge_mvp_probe.tscn
```

The requirement ledger records exact POC/MVP evidence; rows outside this
verified boundary remain unverified, partial or explicitly deferred.

## Confirmed automated result

- Approved source/product integrity: 7 assets, zero failures; six stale
  first-approval manifests refreshed and the current pickaxe remained current.
- Focused Forge foundation probe: **958/958** checks.
- Forge creator UI probe: **96/96** checks, including routed orbit, pan and
  wheel zoom in the assembled compact-host UI, stationary right-click erase,
  responsive structure-tool tabs and camera-preserving edit gestures.
- Hardware preview capture: **8/8** images, zero failures (seven goldens plus
  the full workspace).
- Main-menu route and production hiding probe: **23/23** checks.
- Whole-project current regression gate: **19,817/19,817** checks across 55
  probes and 256 world-generation seeds.
- Requirement ledger: 36 documents, 6,442 candidate rows; Forge work updated
  129 exact rows (94 verified, 9 implemented, 16 partial, 10 deferred).

Godot reported the known local certificate-store warning and headless
renderer/resource teardown diagnostics after clean machine-readable results.
No script/parse error, probe failure or recovered shutdown crash occurred in
the successful full gate.
