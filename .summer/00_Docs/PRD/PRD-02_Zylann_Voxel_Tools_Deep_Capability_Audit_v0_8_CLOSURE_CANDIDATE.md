# PRD-02 — Zylann Voxel Tools Deep Capability Audit

**Project:** Leyforge / Ley Realms / The Forge  
**Document:** PRD-02  
**Version:** 0.8 WORKING — CLOSURE CANDIDATE  
**Date:** 4 September 2026  
**Status:** ACTIVE — Rounds 1–8 complete; master capability/source/prototype reconciliation complete; PRD-02 closure candidate issued; downstream PRD-03/04/06/07 evidence and exact integration-edition selection remain open  
**Upstream:** PRD-00 v1.0 + controlled source deltas; PRD-01 v0.15 Closure Candidate  
**Downstream:** PRD-03, PRD-04, PRD-05, PRD-06, PRD-07, PRD-08, PRD-09, LFE, FORGE-ENG

---

# 1. Purpose

PRD-02 determines what the **current Zylann Voxel Tools / `godot_voxel` stack actually provides**, what it only partially provides, what can be extended cleanly, and what Leyforge must own itself.

This document does **not** ask:

> “Is Zylann good?”

It asks:

> “For each Leyforge voxel/world requirement, what capability exists, what evidence proves it, what limits apply, and what still requires architecture/prototype work?”

PRD-02 is a **technology-fact and evidence document**. It does not create final LFE/FORGE-ENG architecture by convenience.

---

# 2. Authority and Evidence Rules

## 2.1 Technology facts

A claim may be treated as a technology fact when supported by current official repository documentation, generated API documentation, current release notes/changelog, or directly inspected current source.

## 2.2 Demonstrated/reference capability

An official demo, example or documented workflow may prove that a feature can be used in at least one supported configuration. It does **not** automatically prove Leyforge-scale suitability.

## 2.3 Prototype required

If the official material exposes an API or plausible extension path but does not prove Leyforge's required scale, determinism, persistence, multiplayer, moving-frame, low-end or authoring constraints, the result is `PROTOTYPE-REQUIRED`.

## 2.4 Not provided

`NOT-PROVIDED` means PRD-02 found no current Zylann subsystem owning the Leyforge requirement. It does not mean the requirement is impossible in Godot; it means Leyforge or another technology must own it.

## 2.5 No silent promotion

An experimental API, roadmap item, demo-only path, current-master feature, or partially documented hook cannot be treated as production architecture merely because it appears convenient.

---

# 3. Classification Vocabulary

| Classification | Meaning |
|---|---|
| `DIRECT` | Current Zylann feature substantially provides the capability in its intended scope. |
| `PARTIAL` | Capability exists but with material limits relative to Leyforge requirements. |
| `EXTENSION` | Zylann supplies a useful low-level hook/data primitive; Leyforge must own the higher-level system. |
| `PROTOTYPE-REQUIRED` | Plausible path exists but scale/correctness/compatibility is unproven for Leyforge. |
| `NOT-PROVIDED` | No current Zylann-owned system was found for the requirement. |
| `UNSUITABLE-AS-IS` | Documented behaviour conflicts with a Leyforge requirement if used directly as the authoritative implementation. |
| `EXPERIMENTAL` | Upstream explicitly marks the feature experimental or likely to change. |

Evidence shorthand:

- `TF-DOC` — official documentation fact;
- `TF-API` — generated/current API fact;
- `TF-REL` — current release/changelog fact;
- `TF-SRC` — current repository/source/build evidence;
- `REF` — official example/reference workflow;
- `P3-NEEDED` — Leyforge prototype required;
- `P4-NEEDED` — Leyforge stress test required.

---

# 4. Current Upstream Baseline

## 4.1 Current release line

At the Round-1 audit date, the official GitHub release index reports:

- **Voxel Tools 1.7** custom module build paired with **Godot 4.7.2**;
- **Voxel Tools 1.7 GDExtension** for **Godot 4.5+**;
- release date reported as **20 August 2026**.

The official installation documentation distinguishes two editions:

1. **Godot module / custom engine build** — historically the primary and more mature path;
2. **GDExtension** — plugin-style use with official Godot builds, newer and explicitly described as less tested.

The GDExtension configuration currently declares a minimum Godot compatibility line of **4.4.1**, while current packaged extension releases are advertised for newer supported Godot lines.

## 4.2 Preliminary edition decision

PRD-02 does **not** yet choose Module vs GDExtension.

Current evidence suggests:

- Module has the longest upstream testing history.
- GDExtension is operational and strategically attractive because it avoids permanently owning a custom Godot build merely to use Voxel Tools.
- The extension release still carries an upstream warning that it may contain bugs not present in module builds.
- Some current headless/threaded-rendering behaviour is still moving upstream.

Therefore:

> **Module vs GDExtension remains an explicit PRD-03/04/06/07 decision, not a convenience choice.**

## 4.3 Licence / forkability

`godot_voxel` is MIT-licensed and primarily C++, making a maintained Leyforge fork technically possible if PRD-04 concludes that world-generation or voxel-core changes belong upstream of the Leyforge gameplay layer.

Forkability does not remove maintenance cost. Any fork must retain a defined upstream-sync strategy, patch ledger, compatibility test suite and exit path.

---

# 5. Official Source Register — Round 1

| Ref | Official source | Principal use |
|---|---|---|
| `ZYL-S01` | `github.com/Zylann/godot_voxel` README | Core feature statement, roadmap, licence, project scope |
| `ZYL-S02` | GitHub Releases | Current release/build lines |
| `ZYL-S03` | `getting_the_module` documentation | Module vs GDExtension |
| `ZYL-S04` | Overview / terrain types | `VoxelTerrain` vs `VoxelLodTerrain` |
| `ZYL-S05` | Blocky terrain docs | Block models, type libraries, state attributes, fast collisions |
| `ZYL-S06` | `VoxelTerrain` API | Chunks, mesh block size, loading, stats, networking hooks |
| `ZYL-S07` | `VoxelLodTerrain` + smooth-terrain docs | LOD, full-load mode, edit restrictions |
| `ZYL-S08` | Scripting + Performance docs | Runtime editing, locking, bulk access, generator thread safety |
| `ZYL-S09` | Generators docs | CPU generators, graph generators, generator contracts |
| `ZYL-S10` | `VoxelGeneratorMultipassCB` docs | Cross-chunk structures, multipass limits |
| `ZYL-S11` | Streams docs | SQLite/region/custom streams and async terrain I/O |
| `ZYL-S12` | `VoxelTool`, `VoxelBuffer`, `VoxelFormat` | Edits, metadata, channels/bit depth |
| `ZYL-S13` | Instancing docs / APIs | Foliage/rocks, persistence, scene instances |
| `ZYL-S14` | Multiplayer docs | Experimental authoritative `VoxelTerrain` synchronization |
| `ZYL-S15` | Physics/block collision docs | Mesh colliders, `VoxelBoxMover`, moving terrain warning |
| `ZYL-S16` | Changelog | Current fixes/API evolution |
| `ZYL-S17` | Development docs | Compile flags and build feature boundaries |
| `ZYL-S18` | Current GitHub CI/build evidence | Headless/threaded rendering work and current upstream movement |

---

# 6. Capability Matrix — Core Voxel Storage / Representation

| ID | Capability | Evidence | Result | Leyforge implication |
|---|---|---|---|---|
| `ZYL-CAP-001` | Editable volumetric terrain with tunnels/overhangs/destruction | `ZYL-S01`, `ZYL-S04` | `DIRECT / TF-DOC` | Strong match for Leyforge's editable voxel foundation. |
| `ZYL-CAP-002` | Minecraft-style blocky meshing | `ZYL-S01`, `ZYL-S05` | `DIRECT / TF-DOC` | `VoxelMesherBlocky` is a viable near-field blocky renderer candidate. |
| `ZYL-CAP-003` | Chunked polygon rendering from voxel data | `ZYL-S01`, `ZYL-S06` | `DIRECT` | Terrain is not one Node per voxel; aligns with Leyforge anti-node-per-block requirements. |
| `ZYL-CAP-004` | Voxel type channel using compact integer values | `ZYL-S05`, `ZYL-S12` | `DIRECT` | Suitable as runtime palette/handle storage, not canonical FCC-13 identity. |
| `ZYL-CAP-005` | Up to 65,536 blocky model IDs in 16-bit type data | `ZYL-S05` | `DIRECT` | Likely sufficient as a local compiled palette, but PRD-07 must stress generated-form counts. |
| `ZYL-CAP-006` | Configurable voxel channel depth | `ZYL-S12` | `DIRECT` | 8/16-bit type/index channels support compact runtime data. Format choice must be frozen early or migrated deliberately. |
| `ZYL-CAP-007` | General-purpose voxel channels | `ZYL-S01`, `ZYL-S12` | `PARTIAL / EXTENSION` | Useful for compact voxel-local flags/data; cannot replace Leyforge's typed gameplay records by itself. |
| `ZYL-CAP-008` | Per-voxel serializable metadata | `ZYL-S12` | `DIRECT primitive / EXTENSION` | Valuable for sparse exceptional data. Must not become universal Block Entity storage without memory/save proof. |
| `ZYL-CAP-009` | Data chunks stored as 16×16×16 voxel blocks in `VoxelTerrain` | `ZYL-S06` | `TF-API` | Current storage granularity is a technology fact. Leyforge must not assume simulation/persistence/mesh regions must match it. |
| `ZYL-CAP-010` | Mesh block size 16 or 32 | `ZYL-S06` | `DIRECT with fixed choices` | Explicit render/edit trade-off. Requires PRD-07 benchmark at both sizes. |
| `ZYL-CAP-011` | Arbitrary independent block model meshes/shapes | `ZYL-S05` | `DIRECT` | Supports stairs, doors/parts, shrubs, specialist shapes and Forge-generated models. |
| `ZYL-CAP-012` | Block model collision AABBs and masks | `ZYL-S05`, `ZYL-S15` | `DIRECT` | Useful for fast blocky movement/collision and semantic collision profiles. |
| `ZYL-CAP-013` | Multiple materials / model surfaces | `ZYL-S05`, `ZYL-S16` | `DIRECT` | Presentation flexibility exists; draw-call/budget governance remains Leyforge-owned. |
| `ZYL-CAP-014` | High-level block types with state attributes | `ZYL-S05` | `EXPERIMENTAL / PARTIAL` | Attractive conceptually, but cannot be the canonical FCC-13 registry until stability is proven. |
| `ZYL-CAP-015` | Automatic block-state→numeric model-ID mapping | `ZYL-S05` | `EXPERIMENTAL / PARTIAL` | Semantically similar to Leyforge's stable-ID→runtime-handle projection, but upstream naming/state rules must not own Leyforge identity. |
| `ZYL-CAP-016` | Serializable type ID map | `ZYL-S05` | `EXPERIMENTAL` | Potential reference mechanism only; Leyforge needs its own registry/manifest authority. |
| `ZYL-CAP-017` | Large-coordinate terrain bounds | `ZYL-S06` | `PARTIAL` | Integer voxel addressing is broad, but player/world transform precision still depends on Godot build/coordinate strategy. |
| `ZYL-CAP-018` | Double-precision custom builds | `ZYL-S02` | `DIRECT build option / P3-NEEDED` | Helpful for Minecraft-scale worlds, but release notes do not certify Leyforge movement/physics/network/Forge behaviour under doubles. |

---

# 7. Runtime Editing / Bulk Mutation

| ID | Capability | Evidence | Result | Leyforge implication |
|---|---|---|---|---|
| `ZYL-CAP-019` | Single-voxel runtime read/write | `ZYL-S12` | `DIRECT` | Basic placement/mining supported. |
| `ZYL-CAP-020` | Box/sphere/copy/paste-style bulk operations | `ZYL-S08`, `ZYL-S12` | `DIRECT` | Strong primitive for large edits, construction, destruction and repair. |
| `ZYL-CAP-021` | Automatic remeshing of edited regions | `ZYL-S04` | `DIRECT` | Supports local dynamic terrain edits. |
| `ZYL-CAP-022` | Thread-safe voxel access through engine locking | `ZYL-S08` | `DIRECT primitive` | Locking exists, but Leyforge must still avoid pathological random write patterns. |
| `ZYL-CAP-023` | Efficient random edits at arbitrary scale | `ZYL-S08` | `PARTIAL / P4-NEEDED` | Upstream explicitly warns random access can incur worst locking overhead. |
| `ZYL-CAP-024` | Edit area notifications/hooks | `ZYL-S06` | `EXTENSION` | Useful trigger for navigation, structure, ecology, route and network invalidation. Exact contracts need prototype/source verification. |
| `ZYL-CAP-025` | Editing beyond loaded terrain boundary | `ZYL-S08` | `UNSUITABLE-AS-IS` | `VoxelTool` cannot edit past currently loaded borders. Large remote/worldgen/project edits need an owned data/stream/generation path. |
| `ZYL-CAP-026` | Full-resolution edit at distant LOD | `ZYL-S07`, `ZYL-S08` | `PARTIAL` | `VoxelLodTerrain` only exposes full-resolution edit data around LOD0. |
| `ZYL-CAP-027` | Full-load edited-chunk workaround | `ZYL-S07` | `PARTIAL / memory trade-off` | Can keep edited data accessible globally but memory grows with edited chunks; not yet a Leyforge world-scale solution. |

---

# 8. World Generation / Threading / Cross-Chunk Structures

| ID | Capability | Evidence | Result | Leyforge implication |
|---|---|---|---|---|
| `ZYL-CAP-028` | Custom procedural generator API | `ZYL-S09` | `DIRECT` | Leyforge can own deterministic worldgen logic while using Zylann for block requests/publication. |
| `ZYL-CAP-029` | Generator implementations in GDScript/C#/C++ | `ZYL-S08` | `DIRECT` | C++/low-level paths are available where GDScript is too slow. |
| `ZYL-CAP-030` | Generator calls run on multiple threads | `ZYL-S08`, `ZYL-S09` | `DIRECT fact / RISK` | Generator code must be thread-safe; PRD-01's deterministic ownership concerns remain real. |
| `ZYL-CAP-031` | Graph-based generator | `ZYL-S09` | `DIRECT` | Good for base terrain/biome fields; docs say it is not practical by itself for structures such as villages. |
| `ZYL-CAP-032` | GPU generation path | `ZYL-S06`, `ZYL-S16` | `PARTIAL / P3-NEEDED` | Requires supported generators and Vulkan; not universal worldgen acceleration. |
| `ZYL-CAP-033` | Multipass cross-chunk structure generation | `ZYL-S09`, `ZYL-S10` | `EXPERIMENTAL / DIRECT in bounded scope` | Trees/small structures crossing chunk borders are supported in a column-based model. |
| `ZYL-CAP-034` | Multipass neighbor access | `ZYL-S10` | `DIRECT but bounded` | Max four passes and bounded extent; increasing reach increases memory/work. |
| `ZYL-CAP-035` | Multipass arbitrary vertical world | `ZYL-S10` | `PARTIAL` | Column multipass uses a fixed generated vertical region; `VoxelTerrain` itself can extend beyond it. |
| `ZYL-CAP-036` | Multipass use with `VoxelLodTerrain` | `ZYL-S10` | `NOT-PROVIDED` | Current multipass generator is `VoxelTerrain` only. |
| `ZYL-CAP-037` | Very large structures spanning many chunks | `ZYL-S09` | `EXTENSION / P3-NEEDED` | Upstream itself suggests precomputed/deterministic blueprints rasterized into intersecting columns for huge structures. This fits Leyforge's structure-source model but needs implementation. |
| `ZYL-CAP-038` | Determinism under arbitrary generation order | `ZYL-S09`, `ZYL-S10` | `REQUIRED, not automatically guaranteed` | Upstream explicitly warns multipass ordering/neighbor writes can break determinism unless designed carefully. |
| `ZYL-CAP-039` | Generator called exactly once per chunk | `ZYL-S10` | `NO` | Generators may be called again. Leyforge generator logic must be deterministic/idempotent and not create one-time side effects. |
| `ZYL-CAP-040` | Huge world feature ownership/commit DAG | `ZYL-S10` | `NOT-PROVIDED as Leyforge system` | Zylann provides primitives; Leyforge still needs a deterministic feature-intent/ownership scheme. |

---

# 9. Streaming / LOD / Far-Distance Blocky World

| ID | Capability | Evidence | Result | Leyforge implication |
|---|---|---|---|---|
| `ZYL-CAP-041` | Viewer-driven chunk streaming | `ZYL-S04`, `ZYL-S06` | `DIRECT` | Strong base for near-field terrain streaming. |
| `ZYL-CAP-042` | Multiple `VoxelViewer` nodes / priority by viewer | `ZYL-S08` / `VoxelViewer` API | `DIRECT` | Useful for players/remote interest and staging, but multi-viewer teleport behaviour needs testing. |
| `ZYL-CAP-043` | Constant-LOD blocky `VoxelTerrain` | `ZYL-S04`, `ZYL-S06` | `DIRECT` | Current best-supported blocky terrain path. |
| `ZYL-CAP-044` | Very large view distance using `VoxelTerrain` alone | `ZYL-S06` | `LIMITED` | `max_view_distance` is bounded and clamps at 512 in large-bound configurations to avoid huge chunk loads. |
| `ZYL-CAP-045` | Octree LOD terrain | `ZYL-S07` | `DIRECT` | Mature design path primarily for smooth/Transvoxel terrain. |
| `ZYL-CAP-046` | Blocky mesher on `VoxelLodTerrain` | `ZYL-S07` | `PARTIAL` | Official API states blocky meshers can be used but do not have as much LOD support. |
| `ZYL-CAP-047` | Production-ready Minecraft-like blocky far LOD | `ZYL-S01`, `ZYL-S07` | `PROTOTYPE-REQUIRED / upstream area of interest` | **Major PRD-02 risk.** Must not assume long-distance Leyforge blocky terrain is solved. |
| `ZYL-CAP-048` | Edit all distant voxels while using LOD | `ZYL-S07` | `PARTIAL` | Distant full-resolution data is normally not loaded; `full_load_mode` changes memory behaviour. |
| `ZYL-CAP-049` | Separate data/mesh LOD levels | `ZYL-S07` | `DIRECT concept` | Useful foundation, but Leyforge simulation LOD remains separate. |
| `ZYL-CAP-050` | Far-distance low-detail custom Leyforge representation outside stock blocky LOD | — | `NOT-PROVIDED / EXTENSION` | PRD-04 must consider Leyforge-owned far-terrain proxy/clipmap/other representation if stock blocky LOD fails. |

---

# 10. Collision / Physics

| ID | Capability | Evidence | Result | Leyforge implication |
|---|---|---|---|---|
| `ZYL-CAP-051` | Static mesh collision for voxel terrain | `ZYL-S04`, `ZYL-S15` | `DIRECT` | Supports arbitrary terrain shapes through Godot physics. |
| `ZYL-CAP-052` | Fast Minecraft-like AABB collision | `ZYL-S05`, `ZYL-S15` | `DIRECT` | `VoxelBoxMover` is promising for player/NPC blocky movement. |
| `ZYL-CAP-053` | Voxel raycasts independent of mesh physics | `ZYL-S05`, `ZYL-S12` | `DIRECT` | Useful for mining/interaction and reduced physics dependence. |
| `ZYL-CAP-054` | Cheap rebuild of arbitrary mesh colliders after every edit | `ZYL-S05`, `ZYL-S15` | `PARTIAL / performance risk` | Upstream notes trimesh rebuild is slow; Leyforge must profile collision strategy under rapid edits. |
| `ZYL-CAP-055` | Moving terrain with reliable surface physics | `ZYL-S15` | `UNSUITABLE-AS-IS` | Docs explicitly warn not to expect physics on a moving terrain surface to work correctly. |
| `ZYL-CAP-056` | Moving voxel vessel as a moved `VoxelTerrain` node | `ZYL-S15` | `REJECT AS CURRENT FOUNDATION` | Leyforge vessels require their own vessel-local voxel/spatial-frame implementation or another proven approach. |

---

# 11. Persistence / Streams / Save Interaction

| ID | Capability | Evidence | Result | Leyforge implication |
|---|---|---|---|---|
| `ZYL-CAP-057` | Save/load voxel chunks through `VoxelStream` | `ZYL-S11` | `DIRECT` | Useful low-level terrain persistence primitive. |
| `ZYL-CAP-058` | SQLite stream in one database file | `ZYL-S11` | `DIRECT` | Most featured built-in stream; saves voxels and instancing data. |
| `ZYL-CAP-059` | Region-file stream | `ZYL-S11` | `DIRECT` | Older multi-file voxel-only storage option. |
| `ZYL-CAP-060` | Custom scripted stream | `ZYL-S11` | `DIRECT extension point` | Important candidate interface for Leyforge-owned save/world-data architecture. |
| `ZYL-CAP-061` | Terrain async load/save against stream | `ZYL-S11` | `DIRECT` | Heavy terrain I/O already uses background work when driven by terrain. |
| `ZYL-CAP-062` | Save modified blocks explicitly | `ZYL-S06`, `ZYL-S11` | `DIRECT` | Useful save primitive; not a complete game save transaction. |
| `ZYL-CAP-063` | Save generator output option | `ZYL-S11` | `DIRECT` | Can trade storage for avoiding regeneration; policy remains Leyforge-owned. |
| `ZYL-CAP-064` | World manifest, stable semantic registry snapshot, multi-domain journal and migration coordinator | — | `NOT-PROVIDED` | These remain Leyforge persistence responsibilities. |
| `ZYL-CAP-065` | Transactional atomic save across voxels + people + economy + structures + realms | — | `NOT-PROVIDED` | Zylann stream is a voxel persistence component, not the complete Leyforge save authority. |
| `ZYL-CAP-066` | Sparse exceptional voxel metadata persistence | `ZYL-S12` | `DIRECT primitive / P4-NEEDED` | Must be benchmarked before using at scale. |

---

# 12. Instancing / Foliage / Surface Objects

| ID | Capability | Evidence | Result | Leyforge implication |
|---|---|---|---|---|
| `ZYL-CAP-067` | Hardware-instanced surface foliage/rocks | `ZYL-S13` | `DIRECT` | Good candidate for decorative/environmental surface populations. |
| `ZYL-CAP-068` | Scene instances on terrain surface | `ZYL-S13` | `DIRECT but expensive` | Useful in low quantities only. |
| `ZYL-CAP-069` | Instancer as settlement/house/village system | `ZYL-S13` | `UNSUITABLE-AS-IS` | Upstream explicitly says it is not intended for complex man-made structures. |
| `ZYL-CAP-070` | Persistent modified instancer items | `ZYL-S13` | `PARTIAL` | Built-in persistence stores limited item state and relies on stable numerical library IDs. |
| `ZYL-CAP-071` | Rich persistent entity/NPC identity through instancer | `ZYL-S13` | `NOT-PROVIDED` | Persistent people remain Leyforge-owned records/entities. |
| `ZYL-CAP-072` | Manual editor painting of instances | `ZYL-S13` | `NOT-PROVIDED` | Forge environment/ecology authoring must own its own editor workflow if needed. |

---

# 13. Multiplayer / Networking

| ID | Capability | Evidence | Result | Leyforge implication |
|---|---|---|---|---|
| `ZYL-CAP-073` | Experimental server-authoritative `VoxelTerrain` synchronization | `ZYL-S14` | `PARTIAL / EXPERIMENTAL` | Useful reference/hook set; not yet a complete Leyforge multiplayer solution. |
| `ZYL-CAP-074` | Server-side remote `VoxelViewer` interest | `ZYL-S14`, `ZYL-S06` | `DIRECT primitive` | Good basis for voxel-interest determination. |
| `ZYL-CAP-075` | Client `automatic_loading_enabled=false` and server-fed blocks | `ZYL-S06`, `ZYL-S14` | `DIRECT primitive` | Supports server-owned terrain streaming pattern. |
| `ZYL-CAP-076` | Peer IDs queryable for viewers near an edited area | `ZYL-S06` | `DIRECT primitive` | Helpful for interest-targeted edit replication. |
| `ZYL-CAP-077` | Production multiplayer sync for `VoxelLodTerrain` | `ZYL-S14` | `NOT-PROVIDED` | Official multiplayer docs state no support for `VoxelLodTerrain`. |
| `ZYL-CAP-078` | Complete world/game replication, command authority, reconnect, save and social/economy sync | — | `NOT-PROVIDED` | Leyforge networking remains a game-level subsystem. |
| `ZYL-CAP-079` | Block caching/versioning/diff protocol | `ZYL-S14` | `IDEA / NOT BUILT-IN CONTRACT` | Upstream lists these as points to explore. Leyforge must design/prove its own protocol. |

---

# 14. Dedicated Server / Headless

| ID | Capability | Evidence | Result | Leyforge implication |
|---|---|---|---|---|
| `ZYL-CAP-080` | Use with Godot dedicated-server export | `ZYL-S05` | `PARTIAL / supported scenario` | Docs warn mesh resources must not be stripped if runtime mesh-based voxel collisions require them. |
| `ZYL-CAP-081` | Headless terrain generation with no rendering dependency under all current paths | `ZYL-S18` | `PROTOTYPE-REQUIRED` | Current upstream build activity includes fixes/workarounds for headless threaded graphics-resource construction. |
| `ZYL-CAP-082` | Headless server needing no visual meshes if using box/raycast voxel collision | `ZYL-S05`, `ZYL-S15` | `PLAUSIBLE EXTENSION / P3-NEEDED` | Strong candidate, but must be proved in the exact Leyforge server build. |
| `ZYL-CAP-083` | Production Leyforge dedicated-server administration/realm operations | — | `NOT-PROVIDED` | Future Set 38/LFE responsibility. |

---

# 15. Fluids / Oceans / Water

| ID | Capability | Evidence | Result | Leyforge implication |
|---|---|---|---|---|
| `ZYL-CAP-084` | Blocky water/fluid visual model support | `ZYL-S05`, `ZYL-S16` | `DIRECT presentation primitive` | A voxel can visually represent fluid/water. |
| `ZYL-CAP-085` | General authoritative liquid simulation with bounded flow/volume transfer | — | `NOT-PROVIDED` | Zylann is not the complete Leyforge fluid engine. |
| `ZYL-CAP-086` | Ocean-scale tides/currents/waves/hydrology | — | `NOT-PROVIDED` | Set-26 ocean fields remain Leyforge-owned. |
| `ZYL-CAP-087` | Local flooding/pipes/pumps crossing voxel chunks | — | `NOT-PROVIDED / P3-NEEDED` | Needs Leyforge fluid architecture using voxel data/edits only as one physical representation input. |
| `ZYL-CAP-088` | Unlimited spreading water as required Leyforge behaviour | — | `NO` | Leyforge explicitly does not want an uncontrolled Minecraft-like infinite-spread model. |

---

# 16. Navigation / AI Movement

| ID | Capability | Evidence | Result | Leyforge implication |
|---|---|---|---|---|
| `ZYL-CAP-089` | Complete dynamic voxel navigation/pathfinding subsystem | — | `NOT-PROVIDED` | Navigation remains Leyforge/Godot/custom technology work. |
| `ZYL-CAP-090` | Terrain edit notifications usable for nav invalidation | `ZYL-S06` | `EXTENSION` | Promising bridge; exact granularity and threading need source/prototype validation. |
| `ZYL-CAP-091` | Fast voxel occupancy/raycast queries for custom movement/navigation | `ZYL-S05`, `ZYL-S12` | `DIRECT primitive` | Useful for a voxel-aware navigation/movement implementation. |
| `ZYL-CAP-092` | Mover-specific route/capability graph | — | `NOT-PROVIDED` | Remains Set-30/LFE-owned. |

---

# 17. Moving Voxel Spaces / Vessels

| ID | Capability | Evidence | Result | Leyforge implication |
|---|---|---|---|---|
| `ZYL-CAP-093` | Arbitrary movable voxel volume | `ZYL-S15` | `PARTIAL mechanically, unsuitable physics` | A terrain node can move, but documented physics limitations make this insufficient for vessels. |
| `ZYL-CAP-094` | Vessel-local stable voxel coordinates + moving-frame occupants/cargo | — | `NOT-PROVIDED` | Must be Leyforge-owned or provided by another proven component. |
| `ZYL-CAP-095` | Incremental arbitrary hull collision/buoyancy | — | `NOT-PROVIDED` | Maritime P3/P4 prototypes remain mandatory. |
| `ZYL-CAP-096` | Transition static voxel construction → commissioned moving vessel without duplication | — | `NOT-PROVIDED` | Requires Leyforge transaction/spatial-frame architecture. |

---

# 18. Forge / Authoring Integration

| ID | Capability | Evidence | Result | Leyforge implication |
|---|---|---|---|---|
| `ZYL-CAP-097` | Godot Resource-based block model libraries | `ZYL-S05` | `DIRECT` | Can be a generated runtime target from Forge. |
| `ZYL-CAP-098` | Editor preview of block models/types | `ZYL-S05` | `DIRECT` | Useful for technical inspection; not a replacement for The Forge. |
| `ZYL-CAP-099` | Stable canonical FCC-13 registry authored directly as `VoxelBlockyTypeLibrary` | `ZYL-S05` | `UNSUITABLE AS SOLE AUTHORITY` | Upstream type system is experimental and its names/attributes map directly to numeric IDs. Leyforge should compile into it or a classic library rather than make it canon. |
| `ZYL-CAP-100` | Deterministic Forge bake → Zylann block library/model IDs | `ZYL-S05` | `EXTENSION / P3-NEEDED` | Strong candidate workflow: Leyforge stable IDs → compiled per-build/per-world palette → Zylann model indices. |
| `ZYL-CAP-101` | Environment/structure/vessel/character Forge workspaces | — | `NOT-PROVIDED` | FORGE-ENG remains Leyforge-owned. |
| `ZYL-CAP-102` | `.vox` import capability | `ZYL-S17` / current extension config | `DIRECT utility` | Useful interchange option, not canonical Forge source architecture. |

---

# 19. Diagnostics / Profiling / Testing Hooks

| ID | Capability | Evidence | Result | Leyforge implication |
|---|---|---|---|---|
| `ZYL-CAP-103` | Terrain statistics for block loading/updating/drops | `ZYL-S06`, `ZYL-S07` | `DIRECT` | Valuable for PRD-07 performance harness. |
| `ZYL-CAP-104` | Engine task/GPU statistics | `ZYL-S16` | `DIRECT` | Useful for loading/profiling and async GPU-work visibility. |
| `ZYL-CAP-105` | Debug drawing for loaded blocks/metadata/LOD | `ZYL-S06`, `ZYL-S07` | `DIRECT` | Strong diagnostic aid. |
| `ZYL-CAP-106` | Tracy-instrumented custom builds | `ZYL-S02` | `DIRECT build option` | Useful for deep profiling if module/custom-build path is tested. |
| `ZYL-CAP-107` | Full Leyforge structured diagnostics/reason-code/support-bundle architecture | — | `NOT-PROVIDED` | LFE/Branch-B/Set-40 obligation. |

---

# 20. Upstream Stability / Maintenance Risk

| ID | Capability / risk | Evidence | Result | Leyforge implication |
|---|---|---|---|---|
| `ZYL-CAP-108` | Active maintained upstream project | `ZYL-S01`, `ZYL-S02`, `ZYL-S16` | `POSITIVE FACT` | Current repository remains actively developed. |
| `ZYL-CAP-109` | Module maturity | `ZYL-S03` | `RELATIVELY MATURE` | Historically primary development path. |
| `ZYL-CAP-110` | GDExtension maturity | `ZYL-S02`, `ZYL-S03` | `AMBER` | Current and usable, but upstream still warns of less testing. |
| `ZYL-CAP-111` | API stability of blocky type/state system | `ZYL-S05` | `AMBER/EXPERIMENTAL` | Do not make it canonical identity authority. |
| `ZYL-CAP-112` | API stability of multipass column generator | `ZYL-S10` | `AMBER/EXPERIMENTAL` | Useful reference/possible component; large Leyforge worldgen should not depend on it without prototype. |
| `ZYL-CAP-113` | Forkability | `ZYL-S01` | `DIRECT` | MIT + C++ makes a Leyforge fork feasible if evidence requires it. |
| `ZYL-CAP-114` | Fork maintenance cost | — | `OPEN RISK` | PRD-04/06 must compare forked-module, upstream extension, thin wrapper and mixed approaches. |

---

# 21. Preliminary PRD-02 Boundary Verdict

Round 1 supports the following **provisional technology boundary hypothesis**.

This is **not yet an architecture lock**.

## 21.1 Strong candidate to delegate to Zylann

Zylann is currently a strong candidate to own:

- near-field editable voxel storage;
- chunk paging/loading;
- blocky mesh generation;
- local runtime terrain edits and remeshing;
- compact runtime model IDs/channels;
- voxel raycasts;
- optional fast AABB block collision;
- terrain collision generation where appropriate;
- low-level procedural block requests;
- low-level voxel stream I/O;
- surface instancing for foliage/rocks;
- terrain loading/edit profiling primitives.

## 21.2 Strong candidate for Leyforge-owned layer above Zylann

Leyforge should expect to own:

- FCC-13 canonical stable-ID registry and palette compilation;
- semantic block/object/item projection rules;
- world manifest and generator version;
- deterministic worldgen phase/feature ownership;
- cross-chunk megastructure blueprint/intention system;
- authoritative transaction/evidence kernel;
- full save/journal/migration/recovery coordination;
- people, settlements, structures, ecology, economy, social, biology and magic state;
- navigation/pathfinding/route semantics;
- realm topology/access/portal state;
- multiplayer game authority and protocol;
- world/server/client interest policy above low-level voxel hooks;
- local fluid simulation and ocean fields;
- moving-vessel voxel/frame system;
- Forge source/validation/bake/provenance;
- diagnostics/support/recovery tooling.

## 21.3 Areas where stock Zylann may require extension, fork or adjacent technology

The following are the highest-priority boundary questions:

1. **Blocky far-distance LOD**
2. **Large cross-chunk / multi-region generated structures**
3. **High-throughput authoritative bulk mutation**
4. **Stable semantic-ID → compact voxel palette binding**
5. **Custom persistence stream / edit-delta integration**
6. **Dynamic navigation invalidation**
7. **Server/headless terrain processing**
8. **Voxel-network bulk transport**
9. **Large-coordinate build strategy**
10. **Custom rendering/far proxy strategy**

---

# 22. Critical Findings

## Finding ZYL-F01 — Blocky near-field support is strong

The official stack directly supports blocky voxel terrain, compact model IDs, model libraries, realtime edits, streaming, block collision alternatives and runtime remeshing.

**Interpretation:** Zylann remains a credible voxel-core candidate.

## Finding ZYL-F02 — Blocky far-distance LOD is not certified

`VoxelLodTerrain` exists and supports large-distance terrain, but official documentation states blocky meshers do not have the same LOD support as smooth/Transvoxel terrain. The project README still lists blocky LOD as an area of interest.

**Interpretation:** Minecraft-scale world extent does not equal proven Minecraft-scale blocky *render distance*. This becomes a mandatory prototype/risk item.

## Finding ZYL-F03 — FCC-13 identity must stay above Zylann

Zylann's classic block library uses numeric indices. Its higher-level type/state library creates portable names and per-world numeric IDs, but it is experimental and its state naming directly affects mapping.

**Interpretation:** Leyforge should preserve FCC-13 IDs and generated `(material_id, form_id)` semantics in its own registry/compiler, then bind compiled runtime handles into the voxel library.

## Finding ZYL-F04 — Zylann streams are a voxel persistence component, not Leyforge's save architecture

SQLite/region/custom streams are useful low-level chunk I/O. They do not replace the world manifest, stable-ID migration, people/economy/structure saves, multi-domain transactions or recovery journal.

**Interpretation:** PRD-04 should evaluate Zylann stream use *inside* Leyforge persistence, not vice versa.

## Finding ZYL-F05 — Cross-chunk generation exists, but the convenient upstream tool is intentionally bounded

`VoxelGeneratorMultipassCB` can generate across neighbor chunks, but is experimental, `VoxelTerrain`-only, column-based, fixed-height for its multipass region and bounded in pass count/extent.

Upstream documentation itself suggests precomputing/deterministically defining a large blueprint and progressively rasterizing its intersecting sections for very large structures.

**Interpretation:** this directly reinforces PRD-01's Structure/Blueprint separation.

## Finding ZYL-F06 — Moving terrain is not the vessel solution

Official performance/physics documentation says moving terrain remains possible but physics should not be expected to work correctly on its moving surface.

**Interpretation:** do not commission a player-built ship by reparenting/moving a `VoxelTerrain`. Vessel-local voxel grids/spatial frames remain a separate prototype/architecture problem.

## Finding ZYL-F07 — Multiplayer hooks exist, complete multiplayer does not

There is an experimental server-authoritative `VoxelTerrain` synchronization approach, viewer peer IDs and client-side automatic-loading control.

However official docs state no current `VoxelLodTerrain` multiplayer support and the broader game protocol remains the developer's responsibility.

**Interpretation:** useful low-level reference/hook set; Leyforge still owns authoritative networking.

## Finding ZYL-F08 — Dynamic navigation and fluids remain external

No current Zylann-owned navigation/pathfinding system or bounded Leyforge-style fluid/ocean simulation was found.

**Interpretation:** edit notifications/query APIs may feed these systems, but they remain separate LFE capabilities.

## Finding ZYL-F09 — Headless viability must be proved on the exact build path

Dedicated-server export is discussed, but current upstream activity also includes headless/threaded graphics-resource fixes.

**Interpretation:** headless server is plausible, but must be a P3/P4 target before the voxel stack is production-qualified for dedicated realms.

---

# 23. PRD-01 High-Risk Requirement Mapping — Round 1

| PRD-01 pressure | Zylann result | Current disposition |
|---|---|---|
| Editable blocky terrain | Strong direct support | Candidate ACCEPT |
| Compact runtime block palette | Strong low-level support | Candidate ACCEPT with Leyforge semantic compiler |
| Runtime voxel edits | Direct | ACCEPT, benchmark bulk/concurrency |
| Stable semantic identity | Zylann numeric/type mapping is insufficient as canon | LEYFORGE-OWN |
| Cross-chunk structures | Bounded experimental multipass | PROTOTYPE / likely Leyforge intent layer |
| Minecraft-scale world extent | Infinite/paged terrain supported | ACCEPT at data-streaming concept level |
| Minecraft-scale blocky far rendering | Partial/uncertain | CRITICAL PROTOTYPE |
| Dynamic collision | Direct but update costs vary | PROTOTYPE |
| Fast blocky movement collision | Direct AABB utility | PROTOTYPE as movement candidate |
| Full persistence/journal/migration | Not provided | LEYFORGE-OWN |
| Multiplayer authoritative voxel sync | Experimental partial | LEYFORGE-OWN protocol using hooks if suitable |
| Voxel LOD multiplayer | Not provided | CRITICAL GAP if stock LOD chosen |
| Fluids/oceans | Not provided as required | LEYFORGE-OWN |
| Dynamic navigation | Not provided | LEYFORGE/Godot/custom |
| Moving vessel voxel frame | Not provided | LEYFORGE-OWN / critical prototype |
| Forge authoring | Low-level resource editors only | FORGE-ENG |
| Diagnostics/profiling | Useful direct primitives | ACCEPT as component |
| Dedicated/headless server | Plausible, not yet certified | PROTOTYPE |
| Large coordinates | Double build + huge voxel coords available | PROTOTYPE full stack |

---

# 24. Initial Prototype Obligations Emitted by PRD-02

PRD-02 Round 1 emits the following prototype candidates to PRD-06/07.

| Prototype | Goal | Minimum success evidence |
|---|---|---|
| `ZP-01 Blocky Far LOD` | Determine whether stock `VoxelLodTerrain` + blocky mesher can satisfy Leyforge visual/edit/streaming requirements. | Stable block identity, no unacceptable holes/seams/popping, required view-distance profile, bounded CPU/GPU/RAM. |
| `ZP-02 VoxelTerrain 16 vs 32 Mesh Blocks` | Quantify render vs edit/remesh cost. | Packaged benchmark under traversal + mining/building bursts. |
| `ZP-03 FCC-13 Palette Compiler` | Bind stable Leyforge IDs/generated forms to compact Zylann model IDs. | Deterministic bake, stable manifest, migration-safe remap, no canonical dependence on model index. |
| `ZP-04 Bulk Edit Transaction` | Test large construction/destruction/repair edits. | Bounded lock/remesh stalls, deterministic changed-region evidence, recoverable save. |
| `ZP-05 Cross-Chunk Structure Rasterizer` | Compare multipass generator vs Leyforge deterministic structure-intent rasterization. | Order/core-count deterministic output across large structures. |
| `ZP-06 Custom Stream / Base+Delta` | Prove a Leyforge save layer can drive Zylann terrain without surrendering world-manifest authority. | Save/load/migration/crash recovery with generated base + edits. |
| `ZP-07 Dynamic Nav Invalidation` | Connect voxel edits to bounded movement/navigation rebuild. | Local invalidation, no global rebuild, valid routes after mine/build. |
| `ZP-08 Headless Voxel Server` | Prove terrain generation/edit/save on dedicated/headless build. | Repeated server start/stop, no rendering dependency crash, bounded memory. |
| `ZP-09 Voxel Network Streaming` | Test authoritative server voxel blocks + edits under latency/loss. | No duplication/stale overwrite, bounded bandwidth, reconnect recovery. |
| `ZP-10 Moving Vessel Grid` | Prove the correct non-`VoxelTerrain` moving-local-frame approach. | Editable hull, occupants/cargo, collision/buoyancy handoff, save/load. |
| `ZP-11 Local Fluid Cells` | Prove bounded local water/flood simulation around Zylann terrain. | Cross-chunk conservation, activation/deactivation, pump/breach interaction. |
| `ZP-12 Large Coordinates` | Compare standard vs double build/coordinate strategy. | Long-distance travel, editing, physics, networking, Forge placement precision. |

---

# 25. Round-1 Unknowns

PRD-02 maintains its own technology unknowns rather than silently resolving PRD-01 questions.

1. Does Voxel Tools 1.7 materially improve blocky `VoxelLodTerrain` enough for Leyforge's required far rendering compared with older demos/documentation?
2. What exact seams/state/meshing limitations remain when blocky models with non-cube geometry are used at LOD transitions?
3. Can blocky LOD preserve FCC-13 block/form semantics when multiple near voxels collapse into a distant cell?
4. What actual loaded data/mesh memory occurs at Leyforge target view distances for 16 vs 32 mesh blocks?
5. Can `VoxelBlockyLibrary` be generated/baked at runtime or startup from a Leyforge manifest within acceptable load time, or must it be precompiled?
6. What is the practical ceiling before 65,536 block model variants becomes a memory/bake/editor problem even if the integer range is sufficient?
7. Is arbitrary per-voxel metadata sufficiently sparse/compact for the exceptional states Leyforge needs?
8. Which edit notification callbacks are safe/available in GDExtension and module editions for navigation/structure invalidation?
9. What cross-thread ownership guarantees apply when Leyforge performs large region edits outside normal `VoxelTool` convenience calls?
10. Should Leyforge use `VoxelGeneratorMultipassCB`, a custom generator, an upstream fork, or a separate deterministic feature-intent layer for world structures?
11. What generator APIs can be safely called headlessly and asynchronously under the exact Godot/Voxel Tools release chosen?
12. How should unexplored generated terrain and edited streamed blocks integrate with Leyforge generator-version migration?
13. Is built-in SQLite streaming performant enough for huge explored worlds, or should Leyforge implement a custom stream/region format?
14. How should Zylann chunk save completion integrate with multi-domain atomic checkpoints?
15. Can server-side `VoxelTerrain` avoid all visual mesh work for remote players while still serving collision/world queries?
16. What headless regression remains before Godot 4.8's upstream RenderingServer thread-safety fix?
17. Can a client generate unchanged blocks locally from seed while receiving only versioned authoritative deltas without race/stale overwrite?
18. If stock blocky LOD fails, which far-terrain strategy best preserves blocky visual identity: custom coarse block aggregation, clipmap/proxy meshes, distant generated meshes, or another system?
19. Does a maintained Leyforge fork materially reduce architecture complexity enough to justify upstream-sync cost?
20. Which features differ materially between Module and GDExtension in the exact release used by the rebuild?

---

# 26. Round-1 Gate Result

## 26.1 What is already strong enough to retain Zylann as candidate

Round 1 finds no reason to reject Zylann as the voxel foundation.

The stack directly provides enough core capability to justify continued deep evaluation:

- high-performance C++ voxel storage/meshing;
- blocky terrain;
- realtime edits;
- paging/streaming;
- compact model IDs;
- custom generators;
- threaded generation;
- collisions/raycasting;
- save streams;
- useful diagnostic APIs;
- extensible/forkable source.

## 26.2 What prevents architecture lock today

The following remain architecture blockers until PRD-02/06/07 evidence exists:

- blocky far-distance LOD;
- Module vs GDExtension;
- semantic registry/palette binding;
- cross-chunk large structure strategy;
- custom persistence integration;
- headless/dedicated-server certification;
- multiplayer voxel transport at Leyforge scale;
- dynamic navigation invalidation;
- fluid/ocean boundary;
- moving-vessel grid/frame approach;
- large-coordinate whole-stack behaviour.

## 26.3 Current verdict

> **Zylann Voxel Tools remains the leading voxel-core candidate, with strong near-field blocky/editing/streaming primitives. It is not a complete Leyforge engine and must not own stable canon IDs, whole-game persistence, simulation, multiplayer, navigation, oceans or moving-vessel truth.**

---

# 27. Planned PRD-02 Rounds

1. **Round 1 — Current version/source baseline + core capability surface** — **COMPLETE**
2. **Round 2 — Blocky representation, model/state/palette and Forge-binding deep dive** — **COMPLETE**
3. **Round 3 — Storage, edits, streams, persistence and crash/recovery boundary** — **COMPLETE**
4. **Round 4 — Worldgen, threading, determinism and cross-chunk structure deep dive** — **COMPLETE**
5. **Round 5 — LOD, far-distance blocky rendering, collisions and large coordinates** — **COMPLETE**
6. **Round 6 — Multiplayer, viewers, headless/dedicated server and network data paths** — **COMPLETE**
7. **Round 7 — Navigation, fluids/oceans, moving vessels and specialist integration boundaries** — **COMPLETE****
8. **Round 8 — Prototype/benchmark obligations, source-code inspection, final capability matrix and PRD-02 closure candidate** — **COMPLETE**

---

# 28. Official Web Sources

The following official upstream sources were used for this Round-1 technology audit:

- Zylann / `godot_voxel` GitHub repository — https://github.com/Zylann/godot_voxel
- Releases — https://github.com/Zylann/godot_voxel/releases
- Voxel Tools documentation — https://voxel-tools.readthedocs.io/en/latest/
- Blocky terrain — https://voxel-tools.readthedocs.io/en/latest/blocky_terrain/
- Overview — https://voxel-tools.readthedocs.io/en/latest/overview/
- Scripting — https://voxel-tools.readthedocs.io/en/latest/scripting/
- Performance — https://voxel-tools.readthedocs.io/en/latest/performance/
- Generators — https://voxel-tools.readthedocs.io/en/latest/generators/
- Streams — https://voxel-tools.readthedocs.io/en/latest/streams/
- Instancing — https://voxel-tools.readthedocs.io/en/latest/instancing/
- Multiplayer — https://voxel-tools.readthedocs.io/en/latest/multiplayer/
- Changelog — https://voxel-tools.readthedocs.io/en/latest/changelog/
- Current generated API documentation — https://voxel-tools.readthedocs.io/en/latest/api/

---

**ROUND-1 RESULT: PRD-02 CURRENT-VERSION BASELINE + CORE CAPABILITY SURFACE COMPLETE.**

---

# 29. Round-2 Live Project Authority Delta

Before the block/state binding analysis, PRD-02 consumed the current project-state change:

## 29.1 FCC-14 is complete

`FCC-14D v0.1` has issued:

> **LEYFORGE CURRENT FINAL CONTENT CANON — CROSS-REALM CERTIFIED**

Current FCC-14 closure state:

- Steps 1A–1E complete;
- FCC-14A–D complete;
- open FCC-14 semantic holds = **0**;
- the Abysscap amendment is incorporated;
- no active-authority contradiction remains in the certified FCC scope;
- FCC-14 does **not** freeze final art or technical implementation architecture.

Therefore PRD-02 may treat FCC-12/FCC-13/FCC-14 semantic identity and technical handoff requirements as a complete upstream content contract rather than a pending delta.

## 29.2 Branch C framework is complete; the mass audit is not executed

Current project state treats the Branch-C C-AUD-00→11 methodology family as complete.

This does **not** mean:

> `LEYFORGE DOCUMENTATION V1.0 — GLOBAL CORPUS LOCKED`

has been issued.

C-AUD-11 explicitly distinguishes:

```text
AUDIT FRAMEWORK COMPLETE
        ≠
ACTUAL FROZEN-CORPUS AUDIT EXECUTED
        ≠
GLOBAL V1 CORPUS LOCK
```

The eventual mass audit still waits for the required corpus to mature/freeze, including PRD closure and final LFE/FORGE-ENG technical canon where they fall inside the V1 boundary.

This distinction is carried into all PRD-02 evidence labels.

---

# 30. Round-2 Scope

Round 2 deep-dives the runtime representation boundary between:

- FCC-13 semantic content identity;
- generated standard forms;
- block/object/item projections;
- compact voxel state;
- specialist authored geometry;
- Zylann `VoxelBlockyLibrary`;
- experimental `VoxelBlockyTypeLibrary`;
- model IDs;
- attributes/variants;
- rotations;
- transparency/culling;
- blocky fluids;
- collisions;
- sparse metadata;
- materials;
- Forge-generated runtime libraries.

The core engineering question is:

> **Can Leyforge compile its stable semantic content model into Zylann's fast 16-bit blocky runtime representation without allowing Zylann's experimental names, generated numeric IDs, material resources or model variants to become canonical gameplay identity?**

Round-2 result:

> **YES, a clean adapter/compiler boundary is plausible and strongly supported by current APIs — but it must be Leyforge-owned and prototype-certified.**

---

# 31. Technology Facts — Classic `VoxelBlockyLibrary`

| ID | Capability | Official evidence | Result | Leyforge interpretation |
|---|---|---|---|---|
| `ZYL-CAP-115` | `VoxelBlockyLibrary` is a simple ordered model list | Blocky terrain docs / API | `DIRECT` | Its index→TYPE value relationship is straightforward and deterministic once the compiled library is fixed. |
| `ZYL-CAP-116` | Model index 0 is conventionally empty/air | `VoxelBlockyLibrary` API | `DIRECT` | Leyforge compiled palette should reserve a controlled empty/air runtime handle rather than infer emptiness from content display names. |
| `ZYL-CAP-117` | Classic library may be created from code | Blocky docs / API | `DIRECT` | Enables a Leyforge registry compiler or generated build artifact. |
| `ZYL-CAP-118` | Programmatically created library must be baked | `VoxelBlockyLibrary` API | `DIRECT` | Runtime models are a generated/baked product, matching FCC-14C source→bake→runtime doctrine. |
| `ZYL-CAP-119` | `VoxelBlockyLibraryBase.MAX_MODELS = 65,536` | current API | `DIRECT hard ceiling for one library` | All compiled visual/state variants sharing TYPE must fit under this limit unless architecture changes. |
| `ZYL-CAP-120` | `MAX_MATERIALS = 65,536` | current API | `DIRECT API ceiling` | Numerical ceiling is large, but draw calls/resources make the practical budget far lower. |
| `ZYL-CAP-121` | 16-bit TYPE channel is the default blocky representation | blocky docs / changelog | `DIRECT` | Two bytes per block-state runtime handle is a strong candidate near-field representation. |
| `ZYL-CAP-122` | Classic model IDs are array indices | blocky docs / API | `DIRECT` | They are build/world-local implementation handles and cannot be FCC-13 IDs. |
| `ZYL-CAP-123` | Resource-name lookup exists but returns the first matching model resource name | API | `DIRECT utility only` | Resource names are not strong enough to be Leyforge canonical identity or migration authority. |

### 31.1 Round-2 classic-library verdict

`VoxelBlockyLibrary` is intentionally simple.

That simplicity is advantageous for Leyforge if it is treated as:

```text
FCC-13 semantic truth
        ↓
Leyforge Registry / Forge compiler
        ↓
stable compiled manifest
        ↓
VoxelBlockyLibrary
        ↓
16-bit TYPE handle
```

It is **not** suitable as the canonical authoring database by itself.

---

# 32. Technology Facts — Experimental `VoxelBlockyTypeLibrary`

| ID | Capability | Official evidence | Result | Leyforge interpretation |
|---|---|---|---|---|
| `ZYL-CAP-124` | `VoxelBlockyTypeLibrary` is explicitly experimental | current blocky docs/API | `EXPERIMENTAL` | Cannot become a rebuild-critical semantic authority without substantial upstream stability evidence. |
| `ZYL-CAP-125` | High-level block type names and attributes produce combinations of numeric models | blocky docs | `DIRECT experimental workflow` | Closely resembles Leyforge block-state concepts, but its semantics are upstream-owned if used directly. |
| `ZYL-CAP-126` | Type/attribute names form identifiers such as `button[direction=up,pressed=yes]` | blocky docs | `DIRECT` | Useful reference model, but not automatically compatible with FCC-13 domain/form/projection semantics. |
| `ZYL-CAP-127` | Changing type/attribute names may produce a different identifier/model ID | blocky docs | `DIRECT / migration risk` | **Major reason not to make upstream type names canonical.** |
| `ZYL-CAP-128` | Numerical IDs may differ between worlds and are meant as efficient local handles | blocky docs | `DIRECT` | This concept aligns strongly with Leyforge's canonical-ID→world/runtime-palette doctrine. |
| `ZYL-CAP-129` | Type names may be namespaced | blocky docs | `DIRECT` | Conceptually compatible, but namespace syntax/authority remains FCC-13/Leyforge-owned. |
| `ZYL-CAP-130` | ID map can be serialized to JSON/StringArray and loaded again | current API | `DIRECT experimental primitive` | Useful reference/possible generated artifact; final world manifest must remain Leyforge-owned. |
| `ZYL-CAP-131` | Reverse lookup from model index to type name+attributes exists | current API | `DIRECT experimental primitive` | Helpful for diagnostics/migration, but should not be the only canonical reverse mapping. |
| `ZYL-CAP-132` | A `VoxelBlockyType` currently supports max 4 attributes | current API | `DIRECT experimental limit` | A critical combinatorial/state-model constraint if the type system is used directly. |
| `ZYL-CAP-133` | Attribute values may support up to 256 values | current API | `DIRECT experimental limit` | The nominal value range is not the practical limit because variant products consume model IDs. |
| `ZYL-CAP-134` | Every attribute-state combination can reserve a model ID | blocky docs | `DIRECT / combinatorial risk` | A naïve large state model can exhaust 65,536 variants quickly. |
| `ZYL-CAP-135` | Frequently queried type/attribute→ID results are expected to be cached by the game | blocky docs | `DIRECT usage fact` | Supports a generated fast Leyforge runtime lookup table rather than string/dictionary resolution in hot loops. |

### 32.1 Important architectural convergence

Zylann independently uses the same broad principle Leyforge reached through FCC-13:

```text
portable semantic-ish identifier
        ↓
world/build-local compact numeric ID
        ↓
voxel storage/network
```

The convergence is strong evidence that the **pattern** is technically sensible.

It is **not** evidence that `VoxelBlockyTypeLibrary` should own Leyforge semantics.

---

# 33. State Explosion Audit

A block-like concept can consume one numeric model ID for every baked visual/geometry state combination.

Example:

```text
direction   = 4
open        = 2
powered     = 2
damage look = 4

4 × 2 × 2 × 4
=
64 numeric model variants
for one high-level object
```

That becomes dangerous when repeated across thousands of material/form combinations.

Round 2 therefore distinguishes four classes of state.

## 33.1 Class A — model-changing compact voxel state

State that materially changes immediate chunk mesh/collision may justify a different TYPE handle.

Examples:

- orientation;
- stair/slab geometry;
- door upper/lower part;
- door open/closed geometry;
- rail geometry;
- crop visible growth stage;
- selected connection geometry;
- fluid visual level.

## 33.2 Class B — gameplay state that does not require a distinct voxel model

State such as:

- ownership;
- inventory contents;
- machine job;
- contract;
- power quantity;
- exact durability;
- detailed temperature;
- provenance;
- rich biological/ecological state;
- settlement service status;

must **not** automatically multiply TYPE IDs.

That state belongs in the owning specialist record, Block Entity/structure/instance state, sparse metadata where justified, or a derived presentation channel.

## 33.3 Class C — pure presentation variant

Presentation variants that can be resolved through material/shader/instance/profile data should not automatically consume canonical identities.

Whether they consume a Zylann model/material handle is an optimisation decision.

## 33.4 Class D — semantic transformation

If FCC-12/13 says the underlying thing has genuinely changed identity, the runtime mapping may change because the **semantic ID changed first**.

Zylann never decides this threshold.

---

# 34. Attribute / Rotation Deep Dive

| ID | Capability | Evidence | Result | Leyforge interpretation |
|---|---|---|---|---|
| `ZYL-CAP-136` | Built-in Axis attribute | API | `EXPERIMENTAL / DIRECT` | Useful for logs/beams/pillars. |
| `ZYL-CAP-137` | Built-in Direction attribute | API | `EXPERIMENTAL / DIRECT` | Useful for directional blocks/components. |
| `ZYL-CAP-138` | Built-in Rotation attribute | API | `EXPERIMENTAL / DIRECT` | Up to orthogonal rotation family; model variants are pre-generated. |
| `ZYL-CAP-139` | Horizontal-only restriction exists for rotation/direction attributes | API | `DIRECT` | Can prevent unnecessary vertical variants. |
| `ZYL-CAP-140` | Rotated variants are precomputed at bake time | blocky docs | `DIRECT` | Excellent hot-path behaviour, but increases bake memory/model count. |
| `ZYL-CAP-141` | Full rotation attribute has the highest variant cost | blocky docs | `DIRECT warning` | Forge compiler should choose the smallest valid state cardinality. |
| `ZYL-CAP-142` | Classic library does not dynamically rotate/flop one stored model per voxel at mesh time | blocky docs | `DIRECT` | Leyforge compiler must generate required rotated variants or use type-library automation. |
| `ZYL-CAP-143` | Model has a 24-way orthogonal mesh rotation index | current API | `DIRECT` | Supports full cube orthogonal orientations as compiled variants. |

### 34.1 Forge requirement emitted

The Forge compiler should calculate and display:

- semantic object count;
- generated model-state count;
- rotation multiplier;
- material count;
- collision variant count;
- total TYPE-handle consumption;
- estimated bake memory;
- warnings as the 65,536 hard model ceiling or project performance budgets are approached.

This is an **evidence-driven Forge requirement**, not a claim that the final compiler design is already chosen.

---

# 35. Custom Geometry / Specialist Forms

| ID | Capability | Evidence | Result | Leyforge interpretation |
|---|---|---|---|---|
| `ZYL-CAP-144` | Block models may use arbitrary custom meshes | `VoxelBlockyModelMesh` docs | `DIRECT` | Supports specialist FCC-13 authored forms and unusual block geometry. |
| `ZYL-CAP-145` | Custom model vertices should generally remain inside one 1×1×1 voxel cell | blocky docs/API | `DIRECT practical constraint` | Multi-cell semantic objects cannot be assumed to fit one block model. |
| `ZYL-CAP-146` | Model origin/coordinate conventions are strict | blocky docs | `DIRECT` | Forge exporter must normalise/police model coordinate conventions. |
| `ZYL-CAP-147` | High-poly repeated models can degrade performance quickly | blocky docs | `DIRECT warning` | Geometry budgets must be enforced during Forge validation. |
| `ZYL-CAP-148` | Boundary faces must align correctly for culling | blocky docs | `DIRECT` | Forge validation should check side alignment/culling masks. |
| `ZYL-CAP-149` | Up to two+ mesh surfaces/material paths can be used, including mixed transparent/opaque geometry | blocky docs | `DIRECT` | Useful for specialist models, but increases render/material complexity. |
| `ZYL-CAP-150` | Per-surface mesh collision may be enabled/disabled | current API | `DIRECT` | Supports specialist interaction/collision separation. |
| `ZYL-CAP-151` | Multiple AABB collisions are supported on a model | API/blocky docs | `DIRECT` | Strong fit for blocky movement/interaction proxies. |

### 35.1 Multi-cell objects

Zylann's block model is fundamentally a **one-voxel-cell model representation**.

Leyforge multi-cell/compound objects therefore need an ownership layer such as:

```text
semantic Object / Structure element
      ↓
multiple voxel projections / parts
      ↓
coordinated stable part roles
      ↓
Zylann model handles per occupied cell
```

Examples include:

- doors spanning two cells;
- large machinery;
- port frames;
- compound magical apparatus;
- structures with functional multi-block semantics.

The voxel renderer can draw the parts. It does not become the multi-cell object's authoritative gameplay record.

---

# 36. Face Culling / Transparency / Partial Shapes

Round 2 finds an important practical limitation.

`VoxelMesherBlocky` removes whole model-side faces based on precomputed side coverage. It does not perform arbitrary CSG between every touching pair of shapes.

| ID | Capability | Evidence | Result | Leyforge interpretation |
|---|---|---|---|---|
| `ZYL-CAP-152` | Occluded neighbor sides are culled | blocky docs / mesher API | `DIRECT` | Good baseline performance. |
| `ZYL-CAP-153` | Culling uses precomputed side coverage rather than runtime CSG | blocky docs | `DIRECT` | Excellent hot-path design, but geometry combinations need content rules. |
| `ZYL-CAP-154` | Cube touching partial slab-like side can leave partially visible full cube side | blocky docs | `KNOWN LIMITATION` | Certain transparent/partial-shape combinations can reveal visual artifacts. |
| `ZYL-CAP-155` | `transparency_index` controls side-occlusion relationships | blocky docs/API | `DIRECT` | Useful for glass/leaves/water distinction. |
| `ZYL-CAP-156` | `culls_neighbors` may be disabled for dense foliage/transparent effects | blocky docs/API | `DIRECT` | Useful but can substantially increase geometry. |
| `ZYL-CAP-157` | Alpha-clip and alpha-blend workflows are supported via materials | blocky docs | `DIRECT` | Forge needs material-category governance and performance validation. |
| `ZYL-CAP-158` | Transparent specialist partial blocks can expose culling limitations with no universal fix | blocky docs | `PARTIAL / CONTENT CONSTRAINT` | Forge validation may need to forbid or special-case problematic combinations. |

### 36.1 Consequence

Leyforge cannot assume:

> “Any arbitrary microvoxel silhouette + any transparent neighboring silhouette will mesh perfectly.”

This is not a reason to reject Zylann.

It is a **content/compiler validation requirement**.

---

# 37. Materials / Texture Strategy

The blocky documentation recommends atlas reuse because material reuse reduces draw calls.

Current model/material layering permits:

1. material on an imported mesh;
2. model material override;
3. terrain-level material override.

`VoxelBlockyLibraryBase` also exposes all distinct baked materials.

| ID | Capability | Evidence | Result | Leyforge interpretation |
|---|---|---|---|---|
| `ZYL-CAP-159` | Cube models support texture-atlas tile coordinates | blocky docs / cube API | `DIRECT` | Strong fit for 32×32 base texture governance. |
| `ZYL-CAP-160` | Atlas/material reuse is recommended to reduce draw calls | blocky docs | `DIRECT performance guidance` | Forge bake should batch/reuse materials aggressively. |
| `ZYL-CAP-161` | Models may override mesh materials | blocky docs/API | `DIRECT` | Generated material variants do not require duplicated source meshes. |
| `ZYL-CAP-162` | Terrain material may override library materials | blocky docs | `DIRECT` | Useful for special global terrain rendering experiments; dangerous if used to erase semantic presentation distinctions. |
| `ZYL-CAP-163` | Bake tangents can be disabled to save memory/small processing cost when normal mapping is unnecessary | library-base API | `DIRECT` | Potential low-end/profile optimisation while preserving visual semantic truth. |
| `ZYL-CAP-164` | A library may technically contain very many distinct materials | API | `DIRECT ceiling, not practical budget` | Draw calls and shader/resource costs remain the actual production constraint. |

### 37.1 Art-governance compatibility

Nothing in the current Zylann block system requires Leyforge to abandon:

- 32×32 base textures;
- material-family colour governance;
- culture/biome variants;
- derived-item colour inheritance;
- semantic damage/corruption/charge presentation.

But those rules must compile into a **bounded runtime material/model set**.

FCC-14B's semantic-art handoff remains upstream authority; Zylann merely renders the baked result.

---

# 38. Blocky Fluid Model Deep Dive

`VoxelBlockyModelFluid` is a **meshing/presentation feature**, not a liquid simulation.

| ID | Capability | Evidence | Result | Leyforge interpretation |
|---|---|---|---|---|
| `ZYL-CAP-165` | Blocky fluid visual models with multiple levels | blocky docs | `DIRECT visual primitive` | Useful for local liquid-cell presentation if Leyforge adopts discrete levels. |
| `ZYL-CAP-166` | Top fluid corners adapt to neighboring same-fluid level | blocky docs | `DIRECT meshing behaviour` | Gives Minecraft-like sloped visual water surfaces. |
| `ZYL-CAP-167` | Fluid model can encode flow direction for shaders | blocky docs | `DIRECT presentation primitive` | Could visualize authoritative/local flow supplied by Leyforge. |
| `ZYL-CAP-168` | Fluid behaviour is explicitly not simulated by the model | blocky docs | `NOT-PROVIDED simulation` | Reconfirms local fluids/oceans remain Leyforge-owned. |
| `ZYL-CAP-169` | Fluid variants are not fully precomputed because level combinations would be too numerous | blocky docs | `DIRECT architecture fact` | Upstream already treats fluids as a special procedural meshing path to avoid state explosion. |
| `ZYL-CAP-170` | Fluid transparency/culling requires appropriate transparency index | blocky docs | `DIRECT` | Forge/compiler must configure fluid presentation coherently. |
| `ZYL-CAP-171` | Fluid visual implementation has known backface/shading limitations | blocky docs | `PARTIAL` | Leyforge ocean/local-fluid presentation needs prototype/art evaluation. |

---

# 39. Random Tick / Tags / Gameplay-State Boundary

Current `VoxelBlockyModel` includes:

- `random_tickable`;
- `tags_mask`;
- collision information;
- visual/culling state.

`VoxelToolTerrain.run_blocky_random_tick` can sample blocky voxels flagged as tickable.

This is useful, but it creates a dangerous ownership temptation.

| ID | Capability | Evidence | Result | Leyforge interpretation |
|---|---|---|---|---|
| `ZYL-CAP-172` | Random-tick candidate sampling exists for blocky terrain | current API | `DIRECT primitive` | Could assist low-level block behaviours. |
| `ZYL-CAP-173` | Model tag mask can filter random-tick operations | current API/changelog | `DIRECT primitive` | Useful runtime grouping, not semantic ontology authority. |
| `ZYL-CAP-174` | Random ticking is tied to loaded terrain/tool areas | API | `PARTIAL` | Cannot replace Leyforge regional/distant simulation and schedules. |
| `ZYL-CAP-175` | Render/model flags can be queried cheaply from numeric IDs | APIs | `DIRECT` | Good for hot paths if derived from canonical compiled definitions. |

### 39.1 Rejected shortcut

PRD-02 rejects using Zylann random ticks as the universal owner of:

- crop simulation;
- machine processing;
- ecology;
- decay;
- settlement production;
- biological change;
- historical world events.

Those systems require Leyforge's persistent/LOD simulation model.

Random tick may be a **provider/implementation primitive** for carefully scoped local block effects only.

---

# 40. `VoxelBuffer` Channels vs Rich Leyforge State

Current `VoxelBuffer` exposes eight channels:

- TYPE;
- SDF;
- COLOR;
- INDICES;
- WEIGHTS;
- DATA5;
- DATA6;
- DATA7.

The block format supports configurable depth and uniform-channel compression.

Round-2 interpretation:

## 40.1 Strong uses for channels

Potentially appropriate:

- compact model/type handle;
- simple presentation/state bitfields;
- local numeric field;
- cached derived flags;
- temporary authoring/runtime masks.

## 40.2 Weak uses for channels

Not appropriate as the sole authoritative location for:

- item inventories;
- ownership/legal state;
- contracts;
- large machine recipes/jobs;
- named identities;
- complex portal data;
- persistent people;
- multi-cell object records;
- provenance histories;
- full material-state documents.

Those require specialist persistent records.

## 40.3 Sparse voxel metadata

Per-voxel metadata is serializable and sparse in the block format.

This makes it potentially useful for **exceptional voxel-local records**, but not yet production-qualified for mass use.

A metadata-heavy architecture must be stress-tested for:

- memory;
- serialization size;
- load latency;
- lookup cost;
- migration;
- network transfer.

---

# 41. FCC-13 → Zylann Binding Model — Round-2 Candidate

Round 2 produces the following leading **binding hypothesis**.

It remains provisional until PRD-04/06/07.

```text
             FCC-12 / FCC-13 CANON
                     │
       ┌─────────────┴─────────────┐
       │                           │
stable semantic ID        generated standard form
<namespace>:<domain/path>  (material_id, form_id)
       │                           │
       └─────────────┬─────────────┘
                     │
          Leyforge Definition Compiler
                     │
          ┌──────────┴──────────┐
          │                     │
   gameplay definition     presentation/model recipe
          │                     │
          │              Forge-generated geometry
          │              material/atlas bindings
          │              collision profile
          │              compact mesh state
          │                     │
          └──────────┬──────────┘
                     │
             Runtime Palette Build
                     │
      semantic/runtime-state key → uint16
                     │
             VoxelBlockyLibrary
                     │
             Voxel TYPE channel
```

Reverse mapping must also exist:

```text
uint16 TYPE handle
        ↓
compiled palette table
        ↓
semantic ID + model-state key
```

A save/world must never require a contributor to remember that:

> “4127 happens to be north-facing oak stairs.”

The mapping belongs to an explicit manifest/palette version.

---

# 42. Classic Library vs Type Library — Current Decision Posture

## 42.1 Classic `VoxelBlockyLibrary`

**Current strength:**

- simpler;
- stable/mature workflow;
- explicit numeric ordering;
- code-generatable;
- bakes to fast runtime data;
- keeps semantic policy entirely in Leyforge.

**Current cost:**

- Leyforge must build its own semantic→variant compiler;
- rotations/states must be generated explicitly;
- palette migration/manifests are entirely Leyforge's responsibility.

## 42.2 Experimental `VoxelBlockyTypeLibrary`

**Current strength:**

- already models named types + attributes;
- can generate rotations/state combinations;
- serializable ID map;
- supports world-local numeric IDs;
- conceptual alignment with mods/palettes.

**Current risk:**

- explicitly experimental;
- max four attributes per type;
- combinatorial variant multiplication;
- upstream name/attribute edits alter identity mapping;
- upstream model is not identical to FCC-13 material/form/state/projection ontology;
- making it canon would couple saves/content semantics to a likely-changing plugin API.

## 42.3 Round-2 preferred prototype direction

For the first serious Leyforge palette prototype:

> **Prototype a Leyforge-owned semantic compiler targeting the mature classic `VoxelBlockyLibrary` first.**

In parallel, build a comparison adapter targeting `VoxelBlockyTypeLibrary` only far enough to determine whether its automated state/rotation tooling provides enough value to justify its experimental dependency.

This is an **engineering test direction**, not the final LFE decision.

---

# 43. Forge Binding Requirements Emitted by Round 2

The future Forge/compiler path needs to be able to validate or derive:

1. canonical semantic ID;
2. projection eligibility;
3. material/form composition;
4. model/state key;
5. model geometry source;
6. rotations actually required;
7. generated variant count;
8. visual material/atlas binding;
9. transparency/culling category;
10. collision AABBs/mesh collision;
11. interaction/tag masks;
12. fluid presentation role where applicable;
13. whether state belongs in TYPE, specialist record, metadata or presentation;
14. final runtime model-handle usage;
15. reverse map to semantic identity;
16. migration from prior palette;
17. deterministic bake hash;
18. hard ceiling/budget warnings;
19. unsupported culling/transparency combinations;
20. dedicated-server collision resource requirements.

The Forge should reject a compiled content set before runtime if the content would exceed the selected runtime palette model ceiling.

---

# 44. Round-2 Risk Register

| Risk | Current level | Why |
|---|---|---|
| `ZYL-R02-01` TYPE-handle exhaustion | AMBER | 65,536 is large, but state/material/rotation combinations can multiply quickly. |
| `ZYL-R02-02` TypeLibrary experimental coupling | RED if canonical; AMBER if optional adapter | Stable FCC identity must not depend on experimental upstream naming rules. |
| `ZYL-R02-03` rotation/state combinatorial explosion | AMBER | Precomputed variants are fast but consume models/memory. |
| `ZYL-R02-04` transparent partial-shape culling artifacts | AMBER | Known mesher limitation; content compiler may need restrictions. |
| `ZYL-R02-05` excessive distinct materials/draw calls | AMBER | API ceiling is not a practical rendering budget. |
| `ZYL-R02-06` metadata abuse | AMBER | Sparse metadata exists, but large-scale use is unproven. |
| `ZYL-R02-07` semantic state leaking into voxel TYPE | RED architecture risk | Could multiply IDs and create save/migration coupling. |
| `ZYL-R02-08` multi-cell gameplay identity fragmented into voxel parts | RED architecture risk | Must retain external object/structure identity. |
| `ZYL-R02-09` fluid visual model mistaken for fluid simulation | RED architecture risk | Upstream explicitly leaves behaviour to the game. |
| `ZYL-R02-10` runtime/library rebake on large content sets | AMBER / UNKNOWN | Needs timing/memory benchmark. |

---

# 45. Prototype Obligations Added / Refined by Round 2

## `ZP-PAL-01 — Classic Palette Compiler`

Compile a representative FCC-13 semantic registry into `VoxelBlockyLibrary`.

Must prove:

- stable semantic→model-state key;
- deterministic uint16 allocation;
- reverse lookup;
- deterministic bake/hash;
- save/world manifest;
- rebuild with identical input gives identical mapping;
- content order does not accidentally change semantic results.

## `ZP-PAL-02 — TypeLibrary Comparison Adapter`

Compile the same representative content into `VoxelBlockyTypeLibrary`.

Must measure:

- convenience gained;
- attribute limitations;
- generated model count;
- bake time;
- memory;
- ID-map migration behaviour;
- breakage when attributes/types are renamed or added;
- API churn risk.

## `ZP-PAL-03 — State Explosion Fixture`

Representative worst cases:

- stairs;
- doors;
- fences/connections;
- rails;
- crops;
- orientation-heavy machinery;
- multi-material generated forms;
- damage/condition visual variants.

Output:

- semantic content count;
- runtime model count;
- ratio;
- memory;
- bake time;
- practical ceiling margin.

## `ZP-PAL-04 — Culling / Transparency Torture Room`

Include:

- opaque cube;
- glass;
- leaves;
- water;
- slab;
- stairs;
- transparent slab/stair candidate;
- custom cutout geometry;
- two-material models;
- rotated variants.

Goal:

- catalogue visual combinations Zylann can render correctly;
- convert unsupported combinations into Forge validation rules or custom rendering requirements.

## `ZP-PAL-05 — Generated Material/Form Matrix`

Generate a large sample of FCC-style combinations:

```text
material × standard form × rotation × limited presentation state
```

Measure:

- runtime model usage;
- material reuse;
- atlas pressure;
- library bake time;
- startup/load time;
- memory.

## `ZP-PAL-06 — Sparse Metadata Cost`

Compare:

- no metadata;
- rare metadata;
- moderate metadata;
- pathological metadata-per-voxel.

Measure save size, memory, lookup and load time.

---

# 46. Round-2 Resolved / Narrowed Questions

## 46.1 Narrowed from Round 1

### Round-1 Unknown 5
**Can `VoxelBlockyLibrary` be generated from a Leyforge manifest?**

Narrowed strongly:

> Official API supports creation from code and explicit `bake()`.

Remaining question is performance/packaging strategy, not API possibility.

### Round-1 Unknown 6
**Is the 65,536 model range enough?**

Still open as a scale question, but Round 2 clarifies that the primary danger is **variant explosion**, not the semantic definition count itself.

### Round-1 Unknown 7
**Is per-voxel metadata appropriate for exceptional state?**

Technically supported and serializable, but production suitability remains P4-required.

### Round-1 Unknown 20
**Which features differ materially between Module and GDExtension?**

Round 2 finds no representation-level reason yet to choose one edition. Edition comparison remains active and will be revisited in source/build-specific rounds.

---

# 47. Round-2 New Unknowns

1. How many compiled model handles does the complete current FCC-13 physical-content set require before optional/player content?
2. How much additional headroom should be reserved for official expansions and loaded community packs?
3. Should each world use one universal model palette, realm-specific palettes, or a globally consistent build palette with world-local compact remaps?
4. Can palettes differ between clients if the network protocol transfers semantic IDs/dictionary negotiation, or must all peers share identical uint16 assignments?
5. How expensive is rebuilding/baking a library containing tens of thousands of models?
6. Can a baked library be generated offline by Forge/CI and loaded as an immutable runtime resource, avoiding startup bake?
7. What exact source representation should own model-state keys when one semantic block has many geometry states?
8. Which states justify separate model IDs versus a shader/material parameter or separate specialist record?
9. How many material resources/draw calls remain practical in representative dense terrain?
10. Does atlas size/texture strategy need multiple atlases/material sets once the complete material corpus and mods are included?
11. How should culture/realm/condition visual variants be resolved without multiplying TYPE handles unnecessarily?
12. Are transparent partial-height blocks sufficiently important to Leyforge to justify custom mesher work if stock culling is visually unacceptable?
13. Can multi-cell specialist objects use coordinated voxel parts without creating costly repair/migration edge cases?
14. Should `random_tickable` be used anywhere in production, or should all consequential simulation scheduling remain Leyforge-owned?
15. Which free `VoxelBuffer` channels, if any, should Leyforge reserve as runtime ABI contracts?
16. Can a world safely change its palette mapping after update if voxel data is migrated in streaming batches, or should mappings remain immutable per world generation?
17. What deterministic allocation algorithm best balances stability, mod loading and compact contiguous lookup?
18. How does the palette system interact with Zylann's built-in stream/network block serializer?
19. Are palette model handles required to remain stable across server restarts, or can a semantic manifest remap them before chunk activation?
20. What hard Forge warning thresholds should apply before the 65,536 limit?

---

# 48. Round-2 Boundary Verdict

## 48.1 What Zylann provides well

The blocky runtime has a strong, efficient representation model:

```text
uint16 voxel value
       ↓
pre-baked model lookup
       ↓
mesh/collision/material behaviour
```

This is exactly the kind of compact hot-path representation Leyforge needs.

## 48.2 What Leyforge must not surrender

Leyforge must retain authority over:

```text
what the thing IS
why it has a state
whether state changes identity
what persists outside the voxel cell
what migration means
what mods may change
what world/save compatibility means
```

Zylann may own:

```text
how a compiled voxel model is looked up and meshed quickly
```

## 48.3 Preferred working hypothesis

Round 2 strengthens the hypothesis:

> **FCC-13 semantic registry → Leyforge compiler/palette manifest → Zylann classic block library/uint16 TYPE runtime**

with experimental TypeLibrary features evaluated as optional tooling inspiration or adapter functionality.

No architecture freeze occurs yet.

---

# 49. Round-2 Gate Result

**PASS — CONTINUE DEEP AUDIT**

No block/model/state representation incompatibility has been found that would disqualify Zylann.

The most important finding is instead architectural:

> Zylann's fast block-state representation is compatible with Leyforge **if and only if it remains a compiled runtime projection rather than becoming the semantic source of truth**.

The following remain P3/P4 gates:

- complete FCC model-count fit;
- state-explosion margin;
- bake/load performance;
- material/draw-call budget;
- culling/transparency acceptance;
- sparse metadata cost;
- palette save/migration behaviour;
- network palette negotiation/remapping;
- large official + mod pack capacity.

---

# 50. Updated PRD-02 Round Sequence

1. **Round 1 — Current version/source baseline + core capability surface** — **COMPLETE**
2. **Round 2 — Blocky representation, model/state/palette and Forge-binding deep dive** — **COMPLETE**
3. **Round 3 — Storage, edits, streams, persistence and crash/recovery boundary** — **NEXT**
4. **Round 4 — Worldgen, threading, determinism and cross-chunk structure deep dive**
5. **Round 5 — LOD, far-distance blocky rendering, collisions and large coordinates**
6. **Round 6 — Multiplayer, viewers, headless/dedicated server and network data paths**
7. **Round 7 — Navigation, fluids/oceans, moving vessels and specialist integration boundaries**
8. **Round 8 — Prototype/benchmark obligations, source-code inspection, final capability matrix and PRD-02 closure candidate**

---

# 51. Additional Official Sources Used in Round 2

- Blocky terrain documentation  
  `https://voxel-tools.readthedocs.io/en/latest/blocky_terrain/`
- `VoxelBlockyLibrary` API  
  `https://voxel-tools.readthedocs.io/en/latest/api/VoxelBlockyLibrary/`
- `VoxelBlockyLibraryBase` API  
  `https://voxel-tools.readthedocs.io/en/latest/api/VoxelBlockyLibraryBase/`
- `VoxelBlockyTypeLibrary` API  
  `https://voxel-tools.readthedocs.io/en/latest/api/VoxelBlockyTypeLibrary/`
- `VoxelBlockyType` API  
  `https://voxel-tools.readthedocs.io/en/latest/api/VoxelBlockyType/`
- `VoxelBlockyAttribute` and rotation/direction/axis APIs  
  `https://voxel-tools.readthedocs.io/en/latest/api/`
- `VoxelBlockyModel` API  
  `https://voxel-tools.readthedocs.io/en/latest/api/VoxelBlockyModel/`
- `VoxelBlockyModelCube` API  
  `https://voxel-tools.readthedocs.io/en/latest/api/VoxelBlockyModelCube/`
- `VoxelBlockyModelMesh` API  
  `https://voxel-tools.readthedocs.io/en/latest/api/VoxelBlockyModelMesh/`
- `VoxelBuffer` API and block-format v4  
  `https://voxel-tools.readthedocs.io/en/latest/api/VoxelBuffer/`  
  `https://voxel-tools.readthedocs.io/en/latest/specs/block_format_v4/`
- Voxel Tools changelog  
  `https://voxel-tools.readthedocs.io/en/latest/changelog/`

---

**ROUND-2 RESULT: BLOCKY REPRESENTATION / MODEL / STATE / PALETTE / FORGE-BINDING AUDIT COMPLETE.**

---

# 52. Round-3 Scope

Round 3 audits the persistence boundary between loaded voxel blocks, modified-block tracking, terrain unload, asynchronous save tasks, `VoxelStream`, built-in/custom stream backends, `VoxelBuffer`, standalone block serialization, custom metadata, generator output, world switching, crash/shutdown behaviour, format migration, and Leyforge world manifests/journals/checkpoints.

The engineering question is:

> **Can Zylann provide efficient block persistence underneath Leyforge's authoritative save/journal system without owning the whole save transaction?**

Round-3 answer:

> **YES — but only as a voxel persistence participant. Zylann's asynchronous stream lifecycle requires an explicit Leyforge save barrier/coordinator above it.**

# 53. Round-3 Official Source Register

| Ref | Official source | Principal use |
|---|---|---|
| `ZYL-S19` | Current Streams documentation | Save lifecycle, async behaviour, world switching, file locking, abrupt shutdown |
| `ZYL-S20` | `VoxelStream` API | Save-generator-output, compression, flush semantics |
| `ZYL-S21` | `VoxelStreamSQLite` API/source | SQLite coordinate formats, sparse key cache, stream-path hazards, internal cache/transactions |
| `ZYL-S22` | SQLite format v1 | Database schema, block keys, block format, coordinate range |
| `ZYL-S23` | `VoxelStreamRegionFiles` API | Region-file behaviour and threading limits |
| `ZYL-S24` | `VoxelStreamScript` API | Custom stream extension boundary |
| `ZYL-S25` | `VoxelStreamMemory` API | Testing-only in-memory stream and artificial latency |
| `ZYL-S26` | `VoxelTerrain` / `VoxelLodTerrain` API | Async `save_modified_blocks()` and completion tracker |
| `ZYL-S27` | `VoxelSaveCompletionTracker` API | Save-barrier tracking |
| `ZYL-S28` | `VoxelBlockSerializer` API | Standalone block/network serialization and compression |
| `ZYL-S29` | Voxel block format v4 | Versioned block layout, metadata, corruption epilogue, endianness caveat |
| `ZYL-S30` | `VoxelBuffer` API | Dense channels, uniform compression and sparse metadata |
| `ZYL-S31` | `VoxelFormat` API | Channel-depth compatibility/migration warning |
| `ZYL-S32` | Current changelog | Save cache flushing, format migration history, stream fixes |

# 54. `VoxelStream` Ownership Boundary

The official stream abstraction is intentionally narrow: block coordinate + LOD → load/save voxel block. It is an access point to block persistence, not a whole-game database.

| ID | Capability | Evidence | Result | Leyforge interpretation |
|---|---|---|---|---|
| `ZYL-CAP-176` | `VoxelStream` loads/saves voxel blocks independently of the terrain node | `ZYL-S19`, `ZYL-S20` | `DIRECT` | Clean low-level persistence boundary. |
| `ZYL-CAP-177` | Streams do not themselves own the whole in-memory terrain | `ZYL-S19` | `DIRECT` | Compatible with paging and external world authority. |
| `ZYL-CAP-178` | Load returns block-found / block-not-found / error | `ZYL-S20` | `DIRECT` | Supports saved-delta→generator fallback. |
| `ZYL-CAP-179` | Missing saved block may fall back to procedural generation | `ZYL-S20` | `DIRECT` | Strong fit for Seed + Generated Base + Sparse Delta. |
| `ZYL-CAP-180` | `save_generator_output=false` saves only modified blocks by default | `ZYL-S19`, `ZYL-S20` | `DIRECT` | Strong match for sparse-edit persistence. |
| `ZYL-CAP-181` | `save_generator_output=true` can persist generated blocks too | `ZYL-S20` | `DIRECT policy option` | Useful for expensive/non-reproducible generation, with higher disk/network cost. |
| `ZYL-CAP-182` | Stream compression supports LZ4 and ZSTD | `ZYL-S20`, `ZYL-S28` | `DIRECT` | Benchmark size vs CPU/latency. |
| `ZYL-CAP-183` | Existing blocks using another supported compression mode remain loadable | `ZYL-S20` | `DIRECT` | Compression can evolve more safely than semantic layout. |
| `ZYL-CAP-184` | `flush()` only flushes data already inside the stream/cache | `ZYL-S20` | `DIRECT lifecycle fact` | A stream flush is not a whole terrain-save barrier. |
| `ZYL-CAP-185` | `flush()` may not help while terrain save tasks are still queued upstream | `ZYL-S20` | `DIRECT critical fact` | Wait terrain completion before checkpoint-ready status. |

# 55. Asynchronous Save Lifecycle

| ID | Capability | Evidence | Result | Leyforge interpretation |
|---|---|---|---|---|
| `ZYL-CAP-186` | Modified blocks may save automatically when unloaded | `ZYL-S19`, `ZYL-S26` | `DIRECT` | Voxel writes can occur outside explicit player Save. |
| `ZYL-CAP-187` | `save_modified_blocks()` queues asynchronous saving | `ZYL-S26` | `DIRECT` | Calling it is not durable completion. |
| `ZYL-CAP-188` | Save completion is trackable with `VoxelSaveCompletionTracker` | `ZYL-S26`, `ZYL-S27` | `DIRECT` | Supplies a useful voxel-side barrier primitive. |
| `ZYL-CAP-189` | Tracker covers the tasks known at the call, not unrelated later saves | `ZYL-S26` | `DIRECT` | Checkpoint orchestration needs a defined cutoff/revision. |
| `ZYL-CAP-190` | Tracker exposes total/remaining/complete/aborted status | `ZYL-S27` | `DIRECT` | Useful for UI, shutdown and tests. |
| `ZYL-CAP-191` | Current release lineage flushes stream caches when save-all-modified completion finishes | `ZYL-S32` | `DIRECT` | Stronger durability barrier, still scoped to covered tasks. |
| `ZYL-CAP-192` | Saving can remain active after the terrain node is destroyed | `ZYL-S19` | `DIRECT` | Session lifetime must include outstanding tasks/resources. |
| `ZYL-CAP-193` | Supported graceful shutdown paths can wait for queued terrain saves | `ZYL-S26` | `DIRECT` | Helpful, but crash safety cannot rely on graceful shutdown. |
| `ZYL-CAP-194` | Abrupt process kill can lose pending saves and may corrupt in-progress files | `ZYL-S19` | `DIRECT documented risk` | Production design must tolerate sudden death. |

# 56. World Switching / Stream Lifetime Hazards

| ID | Capability / hazard | Evidence | Result | Leyforge implication |
|---|---|---|---|---|
| `ZYL-CAP-195` | Repointing a stream while old async tasks remain can write to the wrong save | `ZYL-S19`, `ZYL-S21` | `CRITICAL lifecycle hazard` | Never reuse one live stream by retargeting it between worlds/realms. |
| `ZYL-CAP-196` | New worlds should use separate stream instances | `ZYL-S19` | `DIRECT recommended pattern` | Fits world/session-owned persistence adapters. |
| `ZYL-CAP-197` | Scene/resource caching can keep stream resources alive after node destruction | `ZYL-S19` | `DIRECT Godot-resource hazard` | Create/own streams explicitly per session. |
| `ZYL-CAP-198` | Stream files often remain locked while in use | `ZYL-S19` | `DIRECT` | Backup/delete/migration needs a controlled close/barrier. |
| `ZYL-CAP-199` | Forcing SQLite close by emptying path can make pending operations fail | `ZYL-S19` | `DIRECT` | Close only after draining. |
| `ZYL-CAP-200` | Current forced-close workflow lacks a simple equivalent wait for all pending loads | `ZYL-S19` | `PARTIAL lifecycle limitation` | Prefer resource-lifetime drain over abrupt repoint/close. |
| `ZYL-CAP-201` | Editor and runtime can conflict if they use the same save | `ZYL-S19` | `DIRECT tooling risk` | Forge/editor previews need separate disposable/read-only data. |

Working session rule:

```text
WorldSession
    owns
VoxelPersistenceAdapter
    owns
VoxelStream instance
```

The stream is not repointed to another world.

# 57. SQLite Stream Deep Dive

`VoxelStreamSQLite` is currently the most featured built-in stream.

| ID | Capability | Evidence | Result | Leyforge interpretation |
|---|---|---|---|---|
| `ZYL-CAP-202` | One SQLite file can store voxel blocks | `ZYL-S21`, `ZYL-S22` | `DIRECT` | Operationally convenient voxel-volume component. |
| `ZYL-CAP-203` | SQLite stream also stores Zylann instancing payload | `ZYL-S19`, `ZYL-S22` | `DIRECT` | Does not make it the persistent-NPC/object authority. |
| `ZYL-CAP-204` | SQLite backend batches recent saves in an in-memory cache | `ZYL-S21` | `DIRECT source fact` | Reinforces save-barrier/flush requirements. |
| `ZYL-CAP-205` | Internal cache flush uses a database transaction path | `ZYL-S21` | `DIRECT source fact` | Useful local atomicity at block-batch level. |
| `ZYL-CAP-206` | Cache is retained if a transaction cannot start | `ZYL-S21` | `DIRECT source fact` | Some pre-commit failure preserves pending data. |
| `ZYL-CAP-207` | Cached blocks may be lost if the database commit itself fails | `ZYL-S21` | `DIRECT source warning` | Not enough for whole-world crash-proof checkpoints. |
| `ZYL-CAP-208` | Sparse key cache can accelerate edited-block-only worlds | `ZYL-S21` | `DIRECT` | Attractive for sparse deltas. |
| `ZYL-CAP-209` | Key cache can become inappropriate/large if every generated block is persisted | `ZYL-S21` | `DIRECT warning` | `save_generator_output` changes memory behaviour. |
| `ZYL-CAP-210` | SQLite DB execution is effectively serialized despite thread-safe use | `ZYL-S21` | `DIRECT source fact` | Burst throughput needs stress testing. |
| `ZYL-CAP-211` | Recent releases include fixes for hangs/failures when stream functions overlap threaded terrain use | `ZYL-S32` | `MAINTENANCE / RISK` | Concurrency belongs in permanent regression tests. |
| `ZYL-CAP-212` | String coordinate keys provide broad practical range | `ZYL-S21`, `ZYL-S22` | `DIRECT` | Avoids narrow packed-coordinate ceilings at some query cost. |
| `ZYL-CAP-213` | 16-bit and 19-bit packed coordinate formats exist | `ZYL-S21`, `ZYL-S22` | `DIRECT` | Potentially too restrictive for intended world scales. |
| `ZYL-CAP-214` | 80-bit packed format supports 25-bit signed XYZ + 5-bit LOD | `ZYL-S21`, `ZYL-S22` | `DIRECT` | Stronger fixed-width option; still verify final world bounds. |
| `ZYL-CAP-215` | Existing DB coordinate format cannot simply be changed in place | `ZYL-S21`, `ZYL-S22` | `DIRECT migration constraint` | Conversion/copy is required. |
| `ZYL-CAP-216` | SQLite schema has its own version field | `ZYL-S22` | `DIRECT` | Local backend schema marker, not Leyforge world/save version. |

**Current posture:** SQLite is the first built-in backend to prototype, not a final architecture decision.

# 58. Region-File Stream Deep Dive

| ID | Capability | Evidence | Result | Leyforge interpretation |
|---|---|---|---|---|
| `ZYL-CAP-217` | Region files group nearby blocks | `ZYL-S23` | `DIRECT` | Familiar spatial persistence structure. |
| `ZYL-CAP-218` | Region backend uses multiple files | `ZYL-S23` | `DIRECT` | Different backup/repair/file-management trade-off. |
| `ZYL-CAP-219` | Region backend stores voxel data only | `ZYL-S19`, `ZYL-S23` | `DIRECT limitation` | Other Leyforge state remains external. |
| `ZYL-CAP-220` | Region files are not thread-safe; mutexing can serialize access | `ZYL-S23` | `DIRECT risk` | Must be benchmarked under server/edit load. |
| `ZYL-CAP-221` | Region-file conversion method exists | `ZYL-S23` | `PARTIAL migration utility` | Guarantees are underdocumented; prototype/source proof required. |

Round-3 posture: region files remain a comparison backend, not the leading built-in candidate.

# 59. Custom Stream Boundary

| ID | Capability | Evidence | Result | Leyforge interpretation |
|---|---|---|---|---|
| `ZYL-CAP-222` | Custom scripted stream can override block load | `ZYL-S24` | `DIRECT extension point` | Leyforge can redirect reads into its persistence service. |
| `ZYL-CAP-223` | Custom scripted stream can override block save | `ZYL-S24` | `DIRECT extension point` | Enables base+delta/journal experiments. |
| `ZYL-CAP-224` | Custom stream declares supported channel mask | `ZYL-S24` | `DIRECT` | Supports explicit runtime ABI control. |
| `ZYL-CAP-225` | Script stream remains block-oriented, not a world-transaction API | `ZYL-S24` | `DIRECT boundary fact` | Whole-world checkpoint stays above it. |
| `ZYL-CAP-226` | Public script API exposes individual block callbacks rather than the richer internal native batch surface | `ZYL-S24`, current source/API comparison | `PARTIAL / throughput risk` | Final high-throughput adapter may need native extension/fork work. |
| `ZYL-CAP-227` | Tool-mode custom streams may execute on background threads in editor | `ZYL-S19`, scripting/editor docs | `DIRECT tooling hazard` | Do not hot-mutate active stream scripts/resources. |

A custom backend is technically plausible without replacing Zylann terrain streaming. Its production performance is unproven.

# 60. In-Memory Stream as Test Infrastructure

| ID | Capability | Evidence | Result | Leyforge interpretation |
|---|---|---|---|---|
| `ZYL-CAP-228` | `VoxelStreamMemory` stores blocks in RAM | `ZYL-S25` | `DIRECT` | Excellent deterministic test double. |
| `ZYL-CAP-229` | Upstream explicitly says it is testing-oriented, not a proper save system | `ZYL-S25` | `DIRECT` | Prevents accidental production adoption. |
| `ZYL-CAP-230` | Artificial save latency can be injected | `ZYL-S25` | `DIRECT test primitive` | Excellent for race/shutdown/world-switch tests. |

# 61. Voxel Block Serialization Format

| ID | Capability | Evidence | Result | Leyforge interpretation |
|---|---|---|---|---|
| `ZYL-CAP-231` | Current block serialization carries explicit format version | `ZYL-S29` | `DIRECT` | Better migration/diagnostic foundation than old versionless data. |
| `ZYL-CAP-232` | Serialized block carries dimensions | `ZYL-S29` | `DIRECT` | Supports standalone validation. |
| `ZYL-CAP-233` | Each channel carries depth/compression information | `ZYL-S29` | `DIRECT` | Blocks are more self-describing. |
| `ZYL-CAP-234` | Uniform channels serialize as one value | `ZYL-S29`, `ZYL-S30` | `DIRECT` | Excellent for air/solid uniform regions. |
| `ZYL-CAP-235` | Optional block and per-voxel metadata are serialized | `ZYL-S29` | `DIRECT` | Useful for exceptional voxel-local state. |
| `ZYL-CAP-236` | Application-defined metadata type IDs are possible | `ZYL-S29` | `EXTENSION` | Could support compact custom metadata if chosen deliberately. |
| `ZYL-CAP-237` | Block ends with a corruption-check epilogue marker | `ZYL-S29` | `DIRECT integrity check` | Detects some malformed/truncated blocks, not whole-world integrity. |
| `ZYL-CAP-238` | Docs still note incomplete endianness guarantees for >8-bit channels | `ZYL-S29` | `PORTABILITY RISK` | Must be solved/proved before portable block ABI claims. |
| `ZYL-CAP-239` | `VoxelBlockSerializer` writes byte arrays or StreamPeer data | `ZYL-S28` | `DIRECT` | Useful for save adapters and network transport. |
| `ZYL-CAP-240` | Serializer supports LZ4 and ZSTD | `ZYL-S28` | `DIRECT` | Enables latency/size trade-off testing. |

# 62. Format Compatibility / Migration Risk

| ID | Capability / risk | Evidence | Result | Leyforge interpretation |
|---|---|---|---|---|
| `ZYL-CAP-241` | Upstream voxel formats have had breaking changes | `ZYL-S32` | `DIRECT historical fact` | Leyforge cannot outsource long-term save compatibility. |
| `ZYL-CAP-242` | Some historical block-format changes had no automatic migration | `ZYL-S32` | `DIRECT historical fact` | Leyforge needs its own version/migration envelope. |
| `ZYL-CAP-243` | More recent targeted channel migrations have been added upstream | `ZYL-S32` | `POSITIVE evidence` | Helpful, but each supported upgrade still needs Leyforge tests. |
| `ZYL-CAP-244` | `VoxelFormat` warns channel depths should be chosen early because saves depend on them | `ZYL-S31` | `DIRECT warning` | Runtime voxel ABI is migration-sensitive. |
| `ZYL-CAP-245` | SQLite `channels` table is not currently fully used/enforced for format consistency | `ZYL-S22` | `PARTIAL` | Leyforge manifest/validator should independently assert voxel format. |

# 63. Dense Channels vs Sparse Delta Economics

A `VoxelBuffer` is dense for each allocated non-uniform channel; uniform channels can collapse to one stored value. This strongly favours a compact TYPE channel for blocky terrain and discourages using wide extra channels for rare rich gameplay facts.

Potentially appropriate channel uses:

- compact model/type handle;
- simple local state bitfield;
- temporary/runtime masks;
- bounded cached numeric fields.

Poor candidates for dense voxel channels:

- inventories;
- ownership/legal state;
- contracts;
- detailed machine jobs;
- named identity;
- provenance/history;
- rich portal data;
- full settlement/person state.

Those belong in specialist records, sparse metadata where justified, or external sparse indexes.

PRD-07 should measure TYPE-only blocks against added 8/16-bit channels and sparse metadata under realistic loaded-world and save workloads.

# 64. Seed + Base + Delta Compatibility

Round 3 confirms that Zylann naturally supports the *shape* of Leyforge's preferred persistence model:

```text
world seed + generator version
              │
              ▼
        generator fallback
              │
     ┌────────┴────────┐
     │                 │
saved block exists   no saved block
     │                 │
     ▼                 ▼
load saved block     generate base
```

With `save_generator_output=false`, only modified blocks need persistence.

However, an edited block is stored as a **materialized voxel snapshot**, not as a semantic operation log. If the generator later changes, the saved block may still embody old base-generation assumptions. Leyforge therefore needs explicit generator-version and migration policy above the stream.

# 65. Edited-Block Snapshot vs Causal Journal

Two concepts must stay separate.

## 65.1 Zylann block snapshot

```text
16³ block after edits
→ serialized voxel values
```

Advantages: fast reload, no edit-history replay, natural chunk locality.

## 65.2 Leyforge causal journal

```text
transaction / operation
actor + authority
semantic IDs
revision + world time
cross-domain consequences
commit evidence
```

Advantages: atomicity, audit, recovery, multiplayer idempotency, provenance and migration context.

Round 3 does not recommend preserving every voxel edit forever. The leading hypothesis is recent/consequential journal → validated checkpoint → materialized block/domain snapshots → journal compaction/rotation.

# 66. Cross-Domain Save Barrier Hypothesis

Zylann supplies the voxel-side completion primitive; Leyforge still needs the coordinator.

Candidate shape:

```text
BEGIN CHECKPOINT N
1. establish authoritative cutoff revision/time
2. gate/version new checkpoint-owned mutations
3. settle required domain transactions
4. call terrain.save_modified_blocks()
5. await voxel completion tracker
6. persist domain snapshots/journals
7. persist world manifest + registry/palette version
8. validate written checkpoint
9. atomically publish checkpoint N as current
10. retain prior known-good checkpoint
END
```

This is not architecture canon. It demonstrates why some equivalent barrier is mandatory.

# 67. Crash / Recovery Analysis

Zylann contributes useful pieces:

- versioned block format;
- block corruption marker;
- SQLite local transaction behaviour;
- save completion tracking;
- stream cache flushing.

No current Zylann subsystem was found that guarantees:

- atomic commit across voxels + player + inventory + settlement + economy + realm state;
- rotating whole-world checkpoints;
- world-manifest commit markers;
- backup lifecycle;
- cross-domain migration rollback;
- semantic registry migration;
- player-facing repair/quarantine.

Production save design must therefore assume:

> **The process can die at any instruction.**

Graceful shutdown is helpful, not the integrity guarantee.

# 68. Multi-Realm / Multi-World Persistence Implication

The current evidence favours an outer world-save owner with separate realm voxel backends rather than repointing one stream resource:

```text
Leyforge WorldSave
    ├── World Manifest
    ├── Registry / Pack Snapshot
    ├── Journal / Checkpoints
    ├── Global services/history
    ├── Realm A voxel backend
    ├── Realm B voxel backend
    └── Realm ...
```

Whether this becomes one DB, one DB per realm, region files, a Leyforge container, or mixed storage remains open. The locked principle is lifetime/identity separation, not file count.

# 69. Editor / Forge Persistence Boundary

Official stream behaviour reinforces:

```text
Canonical Forge source
        ≠
Development terrain preview/cache
        ≠
Player world save
```

Forge/editor workflows should prefer disposable/in-memory streams, development databases, immutable fixture saves and read-only migration copies rather than sharing a live player save backend.

# 70. Round-3 Persistence Backend Comparison

| Criterion | SQLite | Region Files | Custom Stream |
|---|---|---|---|
| Built-in maturity | strongest current built-in | older | extension point |
| Single-file convenience | yes | no | design-dependent |
| Voxel data | yes | yes | yes |
| Zylann instancing | yes | no | custom |
| Sparse-edited key cache | yes | no documented equivalent | custom |
| Internal transaction batching | yes | not equivalent/documented | custom |
| Threading | DB execution effectively serialized | not thread-safe / mutex constrained | implementation-dependent |
| Coordinate range | multiple formats | format-specific | custom |
| Custom world integration | limited to stream contract | limited | strongest |
| Migration control | backend-specific | backend-specific | strongest |
| Leyforge production proof | not yet | not yet | not yet |

**Round-3 preference:** prototype SQLite first, while retaining a custom-stream adapter as the strategic escape hatch.

# 71. Persistence Risk Register

| Risk | Level | Reason |
|---|---|---|
| `ZYL-R03-01` Async save mistaken for durable save | RED if unmanaged | `save_modified_blocks()` returns before completion. |
| `ZYL-R03-02` Stream repoint between worlds | RED | Pending writes may reach wrong save. |
| `ZYL-R03-03` Abrupt kill during write | RED | Documented loss/corruption risk. |
| `ZYL-R03-04` Whole-world atomicity assumed from SQLite | RED | DB transactions do not cover all Leyforge domains. |
| `ZYL-R03-05` Upstream format migration dependency | RED | Historical formats have broken without migration. |
| `ZYL-R03-06` Coordinate encoding too narrow | AMBER/RED | Some packed formats constrain huge worlds. |
| `ZYL-R03-07` Region-file serialization | AMBER | Backend is not thread-safe. |
| `ZYL-R03-08` SQLite serialized throughput | AMBER | Must survive edit bursts/server workloads. |
| `ZYL-R03-09` Sparse metadata growth | AMBER | Supported but unmeasured at Leyforge scale. |
| `ZYL-R03-10` `save_generator_output` misuse | AMBER | Can greatly increase disk/network/cache cost. |
| `ZYL-R03-11` Script custom-stream throughput | AMBER/UNKNOWN | Per-block script path may be costly. |
| `ZYL-R03-12` Edited snapshot + generator-version change | RED architecture question | Old block may materialize old base assumptions. |
| `ZYL-R03-13` Editor/game save overlap | AMBER | Documented lock/conflict hazard. |
| `ZYL-R03-14` Endianness portability | AMBER | Current block-format docs retain a portability caveat. |

# 72. Prototype Obligations Added / Refined by Round 3

## `ZP-PST-01 — SQLite Sparse Delta World`

Generate a large deterministic base world and persist only edits. Measure database growth, sparse-key-cache memory, random edited/unedited loads, save latency, repeated session reopen and long-lived maintenance behaviour.

## `ZP-PST-02 — SQLite Save Burst`

Perform large structure/destruction/edit bursts over many blocks. Measure queued tasks, completion latency, DB/cache behaviour, main-thread impact, injected failures and post-reload correctness.

## `ZP-PST-03 — Custom Stream Adapter`

Implement a minimal Leyforge-owned stream adapter and compare script/native approaches where practical. Measure block-call overhead, batching opportunity, generator fallback, shutdown and instrumentation.

## `ZP-PST-04 — Cross-Domain Save Barrier`

Fixture domains: voxels, inventory, construction, NPC, economy and portal/realm state. Trigger checkpoints while all are changing. Recovery must produce one coherent state with no duplicate/lost items or voxel/domain disagreement.

## `ZP-PST-05 — Crash Injection Matrix`

Kill/crash before queue, during queue, during SQLite commit, after voxel tracker but before manifest, during domain snapshot, during manifest publish and during migration. Recovery must select the last coherent checkpoint.

## `ZP-PST-06 — World Switch Torture`

Rapidly move among World A/B/C with artificial save latency. Success requires zero cross-world writes, no leaked stream handles, no stale locks and bounded memory after repeated cycles.

## `ZP-PST-07 — Generator-Version + Edited Block Migration`

Create edits under generator V1, upgrade to V2 and compare explicit migration policies. Determine how edited materialized blocks coexist with new generator rules.

## `ZP-PST-08 — Metadata Scale`

Measure no metadata, rare metadata, 1%, 10% and pathological per-voxel metadata for memory/save/load/network cost.

## `ZP-PST-09 — Compression Comparison`

Compare representative blocks under LZ4 and ZSTD (and uncompressed where appropriate) for size, CPU, latency and server throughput.

## `ZP-PST-10 — Coordinate Format Stress`

Test candidate SQLite coordinate modes at intended Leyforge world limits including negative/positive extremes, query speed, conversion and portability.

# 73. Round-3 Resolved / Narrowed Questions

### Round-1 Unknown 13 — built-in SQLite viability

Narrowed: it is clearly intended for persistent chunked worlds and has a sparse-edited-block key-cache mode. Huge Leyforge-scale viability remains P4-required.

### Round-1 Unknown 14 — voxel save completion inside whole-world checkpoints

Narrowed strongly: `save_modified_blocks()` + `VoxelSaveCompletionTracker` provide the voxel-side barrier; Leyforge needs the outer cross-domain coordinator.

### Round-2 Unknown 16 — palette changes after updates

Added constraint: raw TYPE values cannot be interpreted under a different palette without explicit remap/migration before or during block activation.

### Round-2 Unknown 18 — palette interaction with stream serialization

Narrowed: streams serialize numeric channel values, not FCC-13 semantic meaning. Palette/registry compatibility must be external.

# 74. Round-3 New Unknowns

1. Should voxel persistence be one backend per realm, one world-wide backend, or a Leyforge container over multiple backends?
2. Can `VoxelStreamSQLite` sustain worst-case multiplayer construction/destruction bursts?
3. What SQLite journal/synchronous durability configuration does the upstream wrapper use per platform, and is it suitable/configurable?
4. What happens under disk-full, permission-loss and I/O/device failure?
5. Can live backups be created safely, or should backups only copy published immutable checkpoints?
6. How expensive is conversion/copy of extremely large voxel databases during migration?
7. Should production persist Zylann block format directly or wrap it inside a Leyforge-owned container/version envelope?
8. Should Leyforge use application-defined block metadata types or store rich metadata externally?
9. How can palette/registry migration transform saved TYPE values without loading every block at once?
10. Can block migration be lazy/on-access while remaining multiplayer-deterministic and backup-safe?
11. What durability level differs between autosave, Save & Quit and dedicated-server checkpoint?
12. How long may checkpoint barriers gate new authoritative mutations?
13. Can checkpoint N+1 accept new mutations while N is still durably writing?
14. How are unload-triggered save tasks assigned to a checkpoint/revision?
15. What happens when a block unload-save, reload-edit and later checkpoint overlap?
16. Does SQLite caching guarantee correct final ordering for repeated writes to the same block under all terrain task schedules?
17. Is native/custom `VoxelStream` needed for production batching/diagnostics?
18. Does GDExtension expose every stream/custom-serializer hook Leyforge needs without a fork?
19. Should generated base output ever be persisted, and in which regions/domains?
20. How should full-load edited-block modes behave with very large historical worlds?
21. What repair policy applies if one block fails its corruption marker inside an otherwise valid checkpoint?
22. Should Leyforge add stronger hashes/checksums above the current block epilogue?
23. What cross-platform endianness guarantee is needed for world/server transfer?
24. How does mod removal/quarantine preserve saved voxel values referencing unavailable semantic content?
25. Can platform copy-on-write/filesystem snapshots accelerate backups without becoming a required platform feature?

# 75. Round-3 Architecture Boundary Verdict

Round 3 strongly supports:

```text
LEYFORGE SAVE AUTHORITY
│
├── world manifest
├── registry / palette snapshot
├── generator version
├── authoritative journals
├── checkpoint generation
├── people / civ / economy / etc.
├── migration / quarantine / recovery
│
└── VOXEL PERSISTENCE ADAPTER
        │
        ├── Zylann save barrier/tracker
        ├── VoxelStream
        │     ├── SQLite candidate
        │     ├── region comparison
        │     └── custom-stream escape hatch
        │
        └── versioned voxel block snapshots
```

Zylann is a strong persistence **component**. It should not be the component that decides whether the whole Leyforge world is durably saved.

# 76. Round-3 Gate Result

**PASS — CONTINUE DEEP AUDIT**

No persistence incompatibility currently disqualifies Zylann. Its block-oriented streams and modified-block-only policy align unusually well with Leyforge's procedural-base + sparse-delta model.

Mandatory caveat:

> **Leyforge must own checkpoint identity, cross-domain atomicity, manifest/version authority, migration and crash recovery above the Zylann stream.**

Critical P3/P4 gates now include SQLite sparse-delta scale, burst throughput, artificial-latency world switching, cross-domain save barriers, crash injection, generator-version migration, palette migration, metadata scale, compression trade-offs, coordinate range and disk/error recovery.

# 77. Updated PRD-02 Round Sequence

1. **Round 1 — Current version/source baseline + core capability surface** — **COMPLETE**
2. **Round 2 — Blocky representation, model/state/palette and Forge-binding deep dive** — **COMPLETE**
3. **Round 3 — Storage, edits, streams, persistence and crash/recovery boundary** — **COMPLETE**
4. **Round 4 — Worldgen, threading, determinism and cross-chunk structure deep dive** — **NEXT**
5. **Round 5 — LOD, far-distance blocky rendering, collisions and large coordinates**
6. **Round 6 — Multiplayer, viewers, headless/dedicated server and network data paths**
7. **Round 7 — Navigation, fluids/oceans, moving vessels and specialist integration boundaries**
8. **Round 8 — Prototype/benchmark obligations, source-code inspection, final capability matrix and PRD-02 closure candidate**

# 78. Additional Official Sources Used in Round 3

- Streams — `https://voxel-tools.readthedocs.io/en/latest/streams/`
- `VoxelStream` — `https://voxel-tools.readthedocs.io/en/latest/api/VoxelStream/`
- `VoxelStreamSQLite` — `https://voxel-tools.readthedocs.io/en/latest/api/VoxelStreamSQLite/`
- SQLite format v1 — `https://voxel-tools.readthedocs.io/en/latest/specs/sqlite_format_v1/`
- `VoxelStreamRegionFiles` — `https://voxel-tools.readthedocs.io/en/latest/api/VoxelStreamRegionFiles/`
- `VoxelStreamScript` — `https://voxel-tools.readthedocs.io/en/latest/api/VoxelStreamScript/`
- `VoxelStreamMemory` — `https://voxel-tools.readthedocs.io/en/latest/api/VoxelStreamMemory/`
- `VoxelTerrain` — `https://voxel-tools.readthedocs.io/en/latest/api/VoxelTerrain/`
- `VoxelLodTerrain` — `https://voxel-tools.readthedocs.io/en/latest/api/VoxelLodTerrain/`
- `VoxelSaveCompletionTracker` — `https://voxel-tools.readthedocs.io/en/latest/api/VoxelSaveCompletionTracker/`
- `VoxelBlockSerializer` — `https://voxel-tools.readthedocs.io/en/latest/api/VoxelBlockSerializer/`
- `VoxelBuffer` — `https://voxel-tools.readthedocs.io/en/latest/api/VoxelBuffer/`
- `VoxelFormat` — `https://voxel-tools.readthedocs.io/en/latest/api/VoxelFormat/`
- Voxel block format v4 — `https://voxel-tools.readthedocs.io/en/latest/specs/block_format_v4/`
- Current changelog — `https://voxel-tools.readthedocs.io/en/latest/changelog/`
- Current `VoxelStreamSQLite` source — `https://github.com/Zylann/godot_voxel/blob/master/streams/sqlite/voxel_stream_sqlite.h`

---

**ROUND-3 RESULT: STORAGE / EDITS / STREAMS / PERSISTENCE / CRASH-RECOVERY BOUNDARY AUDIT COMPLETE.**

---

# 79. Round-4 Scope

Round 4 audits the procedural-generation boundary between:

- `VoxelGenerator`;
- `VoxelGeneratorScript`;
- `VoxelGeneratorGraph`;
- `VoxelGeneratorMultipassCB`;
- Zylann's threaded generation task system;
- generator caching and thread safety;
- deterministic seeded generation;
- block/column boundaries;
- neighbour-dependent structures;
- caves and 3D geology;
- trees/foliage/structures crossing block boundaries;
- large structures and multi-stage generation;
- Forge-authored worldgen data;
- Leyforge feature generation;
- generated voxel state versus authoritative simulation state.

The engineering question is:

> **Can Zylann provide the low-level deterministic block-generation substrate for Leyforge's worldgen without forcing Leyforge's higher-level world-generation logic into an order-dependent chunk callback model?**

Round-4 answer:

> **YES for local deterministic generation and bounded multi-pass work; NO as a complete world-generation authority for Leyforge-scale cross-region features. Leyforge should own deterministic feature planning and worldgen orchestration above Zylann, while Zylann performs bounded voxel materialisation.**

---

# 80. Round-4 Official Source Register

| Ref | Official source | Principal use |
|---|---|---|
| `ZYL-S33` | Generators documentation | Generator architecture, thread model, multipass, determinism |
| `ZYL-S34` | `VoxelGenerator` API | Block/LOD generation contract |
| `ZYL-S35` | `VoxelGeneratorScript` API | Script generator boundary and threading constraints |
| `ZYL-S36` | Scripting documentation | Thread safety, GDScript performance, generator examples |
| `ZYL-S37` | Procedural generation documentation | Block boundaries and deterministic structure placement |
| `ZYL-S38` | `VoxelGeneratorMultipassCB` documentation | Neighbour access, columns, pass semantics, determinism hazards |
| `ZYL-S39` | Multipass design issue | Interdependency, completion-radius and determinism failure analysis |
| `ZYL-S40` | `VoxelGeneratorGraph` API/source | Compiled graph generation, caching and execution model |
| `ZYL-S41` | Voxel engine source | Thread pool, generation tasks, priorities, task lifetime |
| `ZYL-S42` | Voxel data source | On-demand generation fallback and generator invocation |
| `ZYL-S43` | Performance documentation | Memory/cache iteration and GDScript cost |

---

# 81. Generator Contract

The base generator API is deliberately narrow:

```text
generate_block(buffer, origin, lod)
```

The caller supplies the destination block and world-space origin; the generator fills the requested voxel area.

Current documentation states that generators are primarily block-oriented and run on the CPU. The block model exists specifically to split work across threads and generate only the area relevant to viewers. `VoxelGenerator.generate_block()` also receives an LOD index, with the requested block representing increasingly larger world-space cells at higher LODs. `ZYL-S33`, `ZYL-S34`

| ID | Capability | Evidence | Result | Leyforge interpretation |
|---|---|---|---|---|
| `ZYL-CAP-246` | Generator can produce a requested 3D block | `ZYL-S34` | `DIRECT` | Excellent low-level terrain materialisation primitive. |
| `ZYL-CAP-247` | Generator receives world-space origin | `ZYL-S34` | `DIRECT` | Supports deterministic coordinate-derived generation. |
| `ZYL-CAP-248` | Generator receives LOD index | `ZYL-S34` | `DIRECT` | Important for far-world generation strategy. |
| `ZYL-CAP-249` | Same generator may be invoked from multiple threads | `ZYL-S33`, `ZYL-S36` | `DIRECT` | Generator state must be immutable/thread-local or explicitly synchronised. |
| `ZYL-CAP-250` | Generated blocks can be requested on demand | `ZYL-S33`, `ZYL-S42` | `DIRECT` | Supports sparse/infinite-world model. |
| `ZYL-CAP-251` | Generator output is procedural and does not require persistent storage by itself | `ZYL-S33` | `DIRECT` | Strong fit for generated base vs saved edits. |
| `ZYL-CAP-252` | Generators may support multiple voxel channels | `ZYL-S33`, `ZYL-S34` | `DIRECT` | Supports terrain TYPE plus selected additional generated channels. |
| `ZYL-CAP-253` | Missing generator output defaults to air in normal generator-less terrain paths | `ZYL-S33` | `DIRECT` | Useful as a bounded fallback, but Leyforge should explicitly define empty-space semantics. |
| `ZYL-CAP-254` | Generator API itself does not define a global world-generation transaction | `ZYL-S34` | `DIRECT boundary` | Higher-level feature scheduling remains Leyforge-owned. |
| `ZYL-CAP-255` | Generator API itself does not provide a persistent cross-block dependency graph | `ZYL-S34`, `ZYL-S38` | `DIRECT boundary` | Large feature planning cannot simply be hidden inside `generate_block()`. |

---

# 82. Threading Model

Current source shows a general threaded task pool whose thread count is derived from hardware-thread hints and configured bounds. Generation tasks are one class of work alongside streaming and meshing tasks. `ZYL-S41`

This is an important architectural fact:

```text
Viewer demand
      ↓
Zylann task scheduling
      ↓
Generation / streaming / meshing work
      ↓
worker threads
```

Leyforge should therefore treat a generator call as:

> **a re-entrant, potentially parallel pure-ish computation over a requested spatial domain.**

It should not be treated as:

> **the world's sequential generation event.**

| ID | Capability / constraint | Evidence | Result | Leyforge interpretation |
|---|---|---|---|---|
| `ZYL-CAP-256` | General generation work is threaded | `ZYL-S41` | `DIRECT` | Main-thread worldgen orchestration must not be assumed. |
| `ZYL-CAP-257` | Generation, streaming and meshing share the general task ecosystem | `ZYL-S41` | `DIRECT` | Heavy generation can compete with other terrain work. |
| `ZYL-CAP-258` | Thread count is configurable and bounded against hardware hints | `ZYL-S41` | `DIRECT` | Scalability controls exist, but Leyforge needs its own workload policy. |
| `ZYL-CAP-259` | Existing long-running generation tasks may not immediately reflect changed priority data | `ZYL-S41` | `DIRECT source warning` | Slow generators can cause viewer-priority anomalies. |
| `ZYL-CAP-260` | Generator resources/parameters may be read by multiple threads | `ZYL-S36` | `DIRECT` | Mutable exported state must not be changed concurrently. |
| `ZYL-CAP-261` | Mutexes can preserve correctness but serialize contention-heavy generation | `ZYL-S36` | `DIRECT` | Shared mutable generator caches should be avoided where possible. |
| `ZYL-CAP-262` | Lazy initialization inside shared resources can race | `ZYL-S36` | `DIRECT` | Generator construction/bake phase must eagerly prepare unsafe resources. |
| `ZYL-CAP-263` | Scene-tree access from `VoxelGeneratorScript` is unsafe | `ZYL-S35` | `DIRECT hard rule` | No gameplay-node reads/writes inside block generation. |
| `ZYL-CAP-264` | Generated buffers are temporary call-owned data | `ZYL-S35` | `DIRECT` | Generator must not retain the supplied output buffer. |

---

# 83. Generator State Rule

Round 4 strengthens a major design rule:

```text
SAFE GENERATOR INPUT
=
world seed
+ immutable generator configuration
+ deterministic coordinate
+ LOD
+ immutable registry/palette snapshot
+ immutable world-generation version
+ immutable feature configuration
```

Avoid:

```text
SAFE?

current scene tree
current player position
mutable global RNG
last generated chunk
unordered shared dictionary
current wall-clock time
network arrival order
other thread's partially generated block
```

Those inputs can make generation order-dependent, nondeterministic, or unsafe.

### Working generator purity rule

For the base generator:

> Same `(world_id, generator_version, seed, coordinate, LOD, immutable generation configuration)` should produce the same result regardless of which worker executes it or which neighbouring block was requested first.

This is a Leyforge requirement, not merely a Zylann feature.

---

# 84. Deterministic Randomness

Zylann's own procedural-generation guidance demonstrates deriving a per-block random seed from the world seed and block coordinates rather than using one global RNG stream. `ZYL-S37`

This is precisely the direction Leyforge should use.

Conceptually:

```text
Feature RNG seed
=
Hash(
    world_seed,
    generation_version,
    feature_id,
    canonical_anchor_coordinate,
    optional salt
)
```

Not:

```text
rng.next()
```

where the result depends on which chunk happened to generate first.

| ID | Capability / result | Evidence | Result | Leyforge interpretation |
|---|---|---|---|---|
| `ZYL-CAP-265` | Coordinate-derived RNG can make local structure placement deterministic | `ZYL-S37` | `DIRECT technique` | Use for local foliage/resources/details. |
| `ZYL-CAP-266` | Global sequential RNG state is incompatible with arbitrary parallel generation order | `ZYL-S37`, `ZYL-S38` | `DIRECT inference` | Prohibit global generation RNG streams. |
| `ZYL-CAP-267` | Same seed/parameters should reproduce the same generated column/block | `ZYL-S38` | `DIRECT documented goal` | Becomes a P3/P4 test requirement. |
| `ZYL-CAP-268` | Player approach direction can alter multipass processing order | `ZYL-S38`, `ZYL-S39` | `DIRECT documented hazard` | Neighbour-writing generation needs special treatment. |

---

# 85. The Fundamental Block-Boundary Problem

Ordinary `VoxelGeneratorScript._generate_block()` receives one block.

That is excellent for parallelism.

It becomes awkward for structures such as:

- trees;
- bridges;
- roads;
- houses;
- cliffs with overhanging features;
- large rocks;
- cave entrances;
- rivers crossing boundaries;
- dungeons;
- giant roots;
- walls;
- settlements.

Zylann's documentation identifies two broad approaches:

1. **derive the same feature from deterministic information in every affected block**, or
2. **use multipass generation with bounded neighbour access**.

`ZYL-S37`, `ZYL-S38`

The first approach is highly attractive for Leyforge because it preserves block-local parallelism.

The second is useful but carries substantially more scheduling complexity.

---

# 86. Deterministic Feature Rasterisation

The strongest Round-4 finding for Leyforge is that we should distinguish:

```text
FEATURE PLANNING
```

from:

```text
VOXEL RASTERISATION
```

Example:

```text
World seed
   ↓
Feature planner
   ↓
"Oak tree exists at X,Y,Z"
   ↓
canonical feature ID + seed + parameters
   ↓
query any affected block
   ↓
rasterise only the intersecting part
```

The tree does not need to be "spawned" by whichever block happens to load first.

Instead:

```text
Tree #A17
anchor = (1024, 74, 2080)
height = 11
radius = 4
variant = 3
```

Any block intersecting the tree's bounding volume can independently determine:

> “Does Tree #A17 intersect me, and what voxels of it belong here?”

This is much closer to Leyforge's desired **Feature Intent → local materialisation** model.

### Why this matters

It turns a potentially order-dependent worldgen problem into:

```text
same feature definition
      ↓
independent block queries
      ↓
same result
```

without requiring every neighbour block to be fully generated first.

---

# 87. Feature Ownership Rule

Round 4 recommends a working rule for future LFE design:

> **A generated feature has one canonical owner/anchor, but may materialise into many voxel blocks.**

Example:

```text
Road_00482
owner region = cell R17
anchor = canonical spline origin
bounds = [x1..x2, y1..y2, z1..z2]
```

Every intersected block asks the feature index:

```text
features intersecting my block?
```

and receives immutable feature descriptions.

This avoids:

```text
Block A creates road
Block B sees road
Block C creates overlapping road
Block D loads first and changes result
```

Instead:

```text
Feature registry/index
        ↓
canonical road
        ↓
A/B/C/D all rasterise same road
```

This is a Leyforge architectural hypothesis, not a Zylann feature claim.

---

# 88. What Zylann Multipass Actually Solves

`VoxelGeneratorMultipassCB` exists specifically to address structures crossing chunk boundaries and needing access to neighbouring generated columns. It works in passes and has a bounded extent. `ZYL-S38`

This is useful for:

- trees;
- small structures;
- staged terrain passes;
- cases where seeing previous-pass neighbour data is genuinely easier than reconstructing the feature analytically.

It is **not** a free-form global worldgen system.

The documentation describes a column-based model with a fixed vertical generation region, 16×16 columns and configurable neighbour extents. `ZYL-S38`

Therefore:

```text
VoxelGeneratorMultipassCB
```

should be considered a **bounded local generation primitive**.

Not:

```text
Leyforge Global World Generator
```

---

# 89. Multipass Determinism Hazard

This is one of the most important Round-4 findings.

Zylann's own documentation explicitly states that multipass columns execute in parallel and can be requested from different directions. Therefore neighbour-writing can happen in unpredictable order. `ZYL-S38`

Example:

```text
A → writes tree into B
B → writes tree into A
```

Depending on scheduling:

```text
A then B
```

or:

```text
B then A
```

can produce different results if writes conflict.

The upstream design issue goes further: neighbour-writing can create dependency rings where determining that one chunk is truly complete requires additional surrounding chunks to have progressed through earlier passes. `ZYL-S39`

This can create an expanding completion radius.

### Verdict

Do not use multipass as the default mechanism for large-scale Leyforge structures.

Use it where:

- bounded extent is known;
- pass ordering is explicit;
- writes are monotonic/commutative or priority-resolved;
- completion radius is bounded;
- performance is proven.

---

# 90. Monotonic / Conflict-Resolved Structure Writes

Where neighbour-writing is unavoidable, Round 4 identifies a useful engineering pattern from the upstream discussion:

```text
priority(feature/material/state)
```

rather than:

```text
last writer wins
```

Example:

```text
AIR
< GRASS
< LOG
< LEAF
< ROAD
< STRUCTURE
< PLAYER_EDIT
```

This is only an illustrative ordering, **not Leyforge canon**.

The real Leyforge ordering must come from the material/feature authority documents.

The important concept is:

> Conflict resolution must be a deterministic function of the competing inputs, not execution order.

This is particularly important for:

- trees crossing block borders;
- vegetation over terrain;
- roads crossing terrain;
- cave/ore placement conflicts;
- settlement structures;
- generated bridges;
- natural feature overlap.

---

# 91. Large Features Need a Different Layer

Round 4 strongly separates:

### Local features

Examples:

- grass patch;
- tree;
- boulder;
- small ore cluster;
- small pond;
- bush.

These can often be generated deterministically per block or bounded neighbourhood.

### Regional features

Examples:

- river;
- road;
- valley;
- forest region;
- biome transition;
- mountain chain.

These require a stable regional field/feature planner.

### Global features

Examples:

- continent-scale geography;
- civilisation distribution;
- major trade routes;
- world-scale ocean basins;
- giant dungeon networks;
- realm boundary structures.

These should **not** be rediscovered independently inside each `generate_block()` call.

Leading architecture:

```text
GLOBAL / REGIONAL WORLDGEN
        ↓
canonical feature / field data
        ↓
LOCAL BLOCK GENERATION
        ↓
Zylann VoxelBuffer
```

This is a major LFE boundary candidate.

---

# 92. Caves and 3D Geology

Zylann's generator model is not inherently limited to heightmaps. Current documentation describes 3D noise generation capable of caves and overhangs, and `VoxelGeneratorGraph` can generate both smooth and blocky terrain. `ZYL-S33`, `ZYL-S40`

Therefore the low-level engine can support:

```text
surface
+ overhangs
+ caves
+ 3D geological fields
```

without requiring a 2D heightmap-only world.

This is important because Leyforge's geology requirements extend well beyond:

```text
height(x,z)
```

### But

A mathematically continuous noise field is not equivalent to Leyforge geology.

Leyforge needs higher-level concepts such as:

- strata;
- deposits;
- faulting;
- cave systems;
- aquifers;
- underground ecology;
- deep realm transitions;
- resource distributions;
- generated structures.

Those should remain in the Leyforge worldgen layer and feed voxel materialisation.

---

# 93. VoxelGeneratorGraph

`VoxelGeneratorGraph` is a compiled graph-based generator. The current API exposes compiled graph generation and optimisation-related features such as execution maps, subdivision and XZ caching. Graph modification is a main-thread operation; generation is performed after compilation. `ZYL-S40`

This gives us a strong candidate for:

- base mathematical terrain fields;
- noise combinations;
- SDF operations;
- reusable low-level terrain functions;
- high-performance generated scalar fields.

It should not automatically become the entire Leyforge worldgen language.

A useful split is:

```text
Forge / Worldgen Authoring
        ↓
semantic worldgen graph/config
        ↓
compiled low-level field functions
        ↓
Zylann VoxelGeneratorGraph or native implementation
        ↓
VoxelBuffer
```

The Forge should author **meaning**, while the graph handles efficient field evaluation.

---

# 94. GDScript Generator Performance Boundary

Official performance documentation states that GDScript is slow for intensive 3D voxel loops, and that `VoxelGeneratorScript` is likely slower than built-in/native/compiled paths. Editor execution is particularly affected by debug synchronisation overhead. `ZYL-S36`, `ZYL-S43`

Therefore:

```text
GDScript
```

is excellent for:

- prototypes;
- orchestration glue;
- low-frequency authoring logic;
- validation;
- test generators.

It is not automatically suitable for:

- full 16³ voxel inner loops;
- complex 3D geology;
- high-frequency structure rasterisation;
- massive procedural feature evaluation.

Potential production layers:

```text
GDScript
   ↓
prototype

C# / GDExtension / native
   ↓
performance-critical custom generation

VoxelGeneratorGraph
   ↓
compiled graph arithmetic
```

The exact choice is a benchmark decision.

---

# 95. Cache Safety

Zylann's documentation explicitly warns about mutable resources and lazy initialisation under multithreaded generator execution. `ZYL-S36`

That makes shared generator caches dangerous unless their concurrency semantics are explicit.

Safer candidates:

```text
immutable lookup table
read-only generated feature data
thread-local scratch
pre-baked resources
coordinate-keyed pure functions
```

Riskier candidates:

```text
lazy global dictionary
mutable Resource cache
scene-tree object
random shared state
runtime-modified generator settings
```

### Working rule

> **Precompute/bake immutable generation resources before terrain workers can call the generator.**

If runtime mutation is required, the mutation should produce a new generation-version snapshot rather than modifying the live generator underneath worker threads.

---

# 96. Generation Version as a First-Class Input

Round 4 strengthens the persistence finding from Round 3.

Generation should be keyed by an explicit version:

```text
GeneratorVersion
    =
    base terrain algorithm version
    + biome rules version
    + feature planner version
    + structure catalogue version
    + registry/palette compatibility version
```

Then:

```text
(seed, coordinate, generation_version)
```

defines the expected procedural base.

This matters for:

- save compatibility;
- multiplayer compatibility;
- replay/debugging;
- world migration;
- generated feature identity;
- deterministic regeneration.

This is now a strong candidate for LFE canonical architecture.

---

# 97. Registry / Palette Interaction

The current `VoxelRegistry.json` contains stable-looking `unique_id`, `original_id`, numeric IDs, categories, type information and asset paths for a broad set of blocks/items. Examples include basic terrain, fluids, farming, construction and village/defence entries. fileciteturn93file2L1-L12 fileciteturn93file16L1-L25 fileciteturn93file19L1-L28

Round 4 therefore treats registry identity as **generation input metadata**, not something the generator should invent.

A generator should ask for semantic IDs through an immutable registry/palette snapshot and resolve those to the runtime numeric voxel representation.

Conceptually:

```text
Forge / Registry
      ↓
semantic block ID
      ↓
worldgen compiler
      ↓
validated runtime palette
      ↓
numeric voxel TYPE
```

This avoids hard-coding:

```text
"stone = 3"
```

throughout worldgen code.

The current registry already demonstrates why this matters: numeric entries cover terrain, fluids, farming, construction, villages, machines, items and other semantic domains. fileciteturn93file6L1-L20 fileciteturn93file11L1-L30

The exact FCC-13 palette authority remains subject to the certified FCC corpus and later architecture cross-check; this round does not redefine that authority.

---

# 98. Worldgen / Simulation Boundary

Round 4 exposes another important distinction:

```text
GENERATED BASE
```

is not the same thing as:

```text
LIVE SIMULATION
```

Example:

A generated tree can be represented as:

```text
TreeFeature
seed
anchor
species
size
```

But once the player cuts it:

```text
TreeFeature
      ↓
player edit
      ↓
materialised voxel delta
```

The generator must not simply recreate the tree because the procedural base says it should exist.

Likewise:

```text
river generated
      ↓
player dam
      ↓
water simulation changes
```

The procedural generator provides the **initial/base condition**.

The runtime simulation becomes authoritative afterwards.

This is essential for Leyforge's deeper simulation goals.

---

# 99. Generated Structure Identity

Round 4 recommends that generated major structures receive stable identities where later systems need to refer to them.

Example:

```text
STR_Village_8F4A...
STR_Dungeon_2C91...
STR_Bridge_91AD...
STR_Road_00482...
```

The identity should be derived from canonical worldgen inputs, not load order.

This allows:

- persistence;
- NPC/settlement ownership;
- quest references;
- damage tracking;
- regeneration/migration;
- Forge preview;
- debugging;
- multiplayer consistency.

However, not every decorative grass tuft needs a persistent identity. The system should classify features by persistence significance.

---

# 100. Generation Tiers

Round 4 suggests a useful four-tier model for LFE consideration:

### Tier 0 — Pure field

```text
noise / mathematical field
```

Examples:

- base terrain height;
- temperature;
- humidity;
- geology scalar fields.

### Tier 1 — Deterministic local feature

```text
seed + coordinate → feature
```

Examples:

- trees;
- rocks;
- vegetation;
- ore pockets.

### Tier 2 — Regional canonical feature

```text
regional planner → feature intent
```

Examples:

- rivers;
- roads;
- mountain chains;
- large caves;
- settlements.

### Tier 3 — Persistent/generated simulation object

```text
worldgen intent
      ↓
canonical entity/structure
      ↓
live simulation
      ↓
persistence
```

Examples:

- villages;
- dungeons with state;
- ships;
- civilisation infrastructure;
- generated NPC populations.

Zylann is strongest at **Tier 0–1 voxel materialisation**.

Leyforge should own **Tier 2–3 orchestration and identity**.

---

# 101. Multipass Use Cases That Remain Attractive

Despite its hazards, `VoxelGeneratorMultipassCB` should not be rejected.

Good candidate uses include:

- small tree/foliage structures;
- bounded terrain decoration;
- local lighting-like derived passes if deterministic/monotonic;
- staged local materialisation where neighbour access is truly necessary;
- controlled test/prototype generation.

Poor candidates include:

- continent-scale roads;
- world-spanning rivers;
- civilisation generation;
- economy-aware settlements;
- giant dungeon networks;
- arbitrary cross-world effects;
- features whose correct result depends on player approach order.

---

# 102. Generation Scheduling Principle

The safest high-level model is:

```text
Worldgen planner
      ↓
canonical feature intents
      ↓
spatial index
      ↓
requested block
      ↓
collect intersecting intents
      ↓
deterministically rasterise
      ↓
VoxelBuffer
```

Zylann then remains responsible for efficiently asking for and processing blocks.

Leyforge does **not** need to make Zylann understand every high-level world concept.

---

# 103. Round-4 Risk Register

| Risk | Level | Reason |
|---|---|---|
| `ZYL-R04-01` Global mutable RNG | RED | Makes generation order-dependent. |
| `ZYL-R04-02` Scene-tree access from generator | RED | Explicitly unsafe on worker threads. |
| `ZYL-R04-03` Mutable shared generator resources | RED | Concurrent reads/writes can race. |
| `ZYL-R04-04` Multipass neighbour-write order | RED | Documented nondeterminism hazard. |
| `ZYL-R04-05` Unbounded neighbour dependencies | RED | Completion radius can expand. |
| `ZYL-R04-06` GDScript inner-loop generation | RED/AMBER | Performance may be unacceptable at scale. |
| `ZYL-R04-07` Large features hidden inside `generate_block()` | RED | Cannot reliably discover global structure context. |
| `ZYL-R04-08` Generator version not persisted | RED | Regeneration/migration becomes ambiguous. |
| `ZYL-R04-09` Hard-coded numeric block IDs | AMBER/RED | Registry/palette changes can invalidate worldgen. |
| `ZYL-R04-10` Generated base mistaken for simulation authority | RED | Player changes can be overwritten. |
| `ZYL-R04-11` Shared lazy caches | AMBER/RED | Race/crash/performance risk. |
| `ZYL-R04-12` Slow generator starves viewer priority | AMBER | Upstream notes long-running tasks can load oddly. |
| `ZYL-R04-13` Multipass fixed vertical generation assumptions | AMBER | Does not represent unlimited Leyforge worldgen by itself. |
| `ZYL-R04-14` Graph authoring mistaken for worldgen authority | AMBER | Graph is a low-level evaluator, not a semantic world model. |

---

# 104. Prototype Obligations Added / Refined by Round 4

## `ZP-WGEN-01 — Determinism Across Worker Order`

Generate the same world region repeatedly while deliberately changing:

- worker count;
- viewer approach direction;
- request order;
- artificial task latency;
- regeneration order.

Success:

```text
identical canonical output
```

for all requirements where determinism is mandatory.

## `ZP-WGEN-02 — Feature Rasterisation`

Implement a minimal feature-intent system:

```text
FeatureID
anchor
bounds
seed
parameters
```

Then request intersecting blocks in arbitrary order.

Success:

- identical blocks;
- no duplicate structures;
- no order dependence;
- bounded query cost.

## `ZP-WGEN-03 — Multipass Conflict Torture`

Generate overlapping trees/structures with deliberately conflicting writes.

Compare:

- execution order;
- deterministic priority resolution;
- no-overwrite rules;
- multipass extent sizes.

Measure correctness and cost.

## `ZP-WGEN-04 — Regional Feature Planner`

Prototype one river or road whose canonical path is generated independently of block request order.

Test:

- teleport traversal;
- reverse traversal;
- sparse block requests;
- regeneration;
- persistence of modified sections.

## `ZP-WGEN-05 — GDScript vs Native/Compiled Generation`

Benchmark representative:

- 3D terrain field;
- cave field;
- ore distribution;
- structure rasterisation.

Compare GDScript, Graph and native/custom implementation where practical.

## `ZP-WGEN-06 — Generator State Race`

Attempt concurrent reads/writes against:

- exported parameters;
- curves;
- dictionaries;
- cached resources;
- generated feature tables.

Success requires deterministic output and no race/crash.

## `ZP-WGEN-07 — Generation-Version Migration`

Generate a region under V1.

Change generation configuration to V2.

Verify:

- untouched blocks regenerate according to policy;
- edited blocks remain authoritative;
- generated structure identities remain traceable;
- migration is explicit.

## `ZP-WGEN-08 — Generation Load/Starvation`

Introduce intentionally slow generators.

Measure:

- viewer latency;
- task backlog;
- mesh latency;
- I/O interference;
- CPU saturation;
- far-away task starvation.

## `ZP-WGEN-09 — Large Structure Bounds`

Test structures spanning:

- 1 block;
- 2 blocks;
- 4×4 blocks;
- 16×16 blocks;
- regional scale.

Compare deterministic rasterisation versus multipass.

## `ZP-WGEN-10 — Registry Snapshot`

Freeze a registry/palette snapshot and generate a world.

Then change registry ordering/numeric IDs while retaining stable semantic IDs.

Success:

- semantic worldgen remains identical;
- runtime numeric mapping is regenerated from the snapshot;
- old save remains readable under the migration policy.

---

# 105. Round-4 Resolved / Narrowed Questions

## Can Zylann generate genuinely 3D caves/geology?

**Yes.** Current generators support 3D fields and the graph can support blocky terrain as well as SDF terrain. `ZYL-S33`, `ZYL-S40`

The remaining question is not capability but **performance and Leyforge geological semantics**.

## Can Zylann generate structures crossing block boundaries?

**Yes, through deterministic approaches and/or multipass.** `ZYL-S37`, `ZYL-S38`

The engineering question is which approach is appropriate for each feature tier.

## Is multipass deterministic automatically?

**No.** Upstream explicitly documents order-dependent hazards. `ZYL-S38`, `ZYL-S39`

## Can a custom generator safely access gameplay state?

**Not directly from the scene tree.** Generation is threaded. `ZYL-S35`, `ZYL-S36`

The worldgen input must be immutable data prepared outside the generator.

## Is GDScript sufficient for final worldgen?

**Not established.** It is viable for prototypes and glue, but current performance documentation warns about intensive voxel loops. `ZYL-S36`, `ZYL-S43`

## Can Zylann itself be the Leyforge worldgen authority?

**No.** Its generator API is a spatial block evaluator, not a global semantic worldgen authority.

---

# 106. Round-4 New Unknowns

1. What exact task ordering guarantees exist between generation, streaming and meshing when workloads saturate the general pool?
2. Can Leyforge obtain enough scheduling hooks to reserve CPU budget for simulation while terrain generation is heavy?
3. What are the practical deterministic limits of floating-point generation across supported hardware/platforms?
4. Should deterministic worldgen use fixed-point/integer formulations for critical decisions?
5. What hash function should become the Leyforge canonical deterministic seed derivation?
6. How should worldgen versioning interact with Forge-authored generator packages?
7. What is the right spatial index for regional feature intents?
8. How large can a feature bounding volume become before querying it for every affected block becomes expensive?
9. Should large features be subdivided into deterministic subfeatures?
10. How should regional features survive world edits and partial regeneration?
11. How should roads/rivers interact with player-built infrastructure without order dependence?
12. How should generated settlements become persistent simulation objects without duplicating generation work?
13. What is the best representation for cave systems: scalar field, graph, explicit feature intent, or hybrid?
14. How should geology remain deterministic when ore deposits need region-scale correlations?
15. Can `VoxelGeneratorGraph` represent enough of the base terrain to keep custom native generation small?
16. How much overhead does crossing from Leyforge feature planning into Zylann block rasterisation add?
17. Is a custom native generator required for acceptable large-world generation throughput?
18. Can custom generators use SIMD/vectorisation effectively enough to justify native implementation?
19. What happens to generator determinism when LOD changes the evaluation path?
20. Should far-LOD generation use a mathematically related but not identical representation?
21. How should generated structures appear at lower LOD without materialising all block detail?
22. How should feature identities be stored and queried without turning worldgen into a massive persistent database?
23. What is the maximum safe multipass extent for Leyforge target hardware?
24. Can multipass be restricted to Tier-1 local features while regional/global features remain outside it?
25. How should worldgen handle dynamic seasons/climate without turning procedural base generation into live simulation?
26. Which worldgen values must be frozen into the save manifest to guarantee later reconstruction?
27. How should random seeds be derived for nested feature hierarchies while preventing accidental correlation?
28. What deterministic conflict-resolution lattice should exist for generated voxel writes?
29. Can generation be made reproducible enough for automated golden-world tests across engine versions?
30. What minimum P3/P4 benchmark set is sufficient to certify worldgen for rebuild?

---

# 107. Round-4 Architecture Boundary Verdict

Round 4 strongly supports this separation:

```text
FORGE / WORLDGEN AUTHORING
        │
        ▼
WORLDGEN COMPILER / VERSIONED CONFIG
        │
        ▼
LEYFORGE WORLDGEN AUTHORITY
        │
        ├── global / regional feature planning
        ├── deterministic feature identities
        ├── spatial feature index
        ├── generator version
        ├── registry/palette snapshot
        └── simulation handoff
                │
                ▼
        LOCAL MATERIALISATION
                │
        ┌───────┴────────┐
        │                │
 VoxelGeneratorGraph   Custom/native generator
        │                │
        └───────┬────────┘
                ▼
         VoxelGenerator API
                ▼
           VoxelBuffer
                ▼
         Zylann terrain
```

`VoxelGeneratorMultipassCB` sits beside this as a **bounded local neighbour-aware tool**, not the global worldgen authority.

---

# 108. Round-4 Gate Result

**PASS — CONTINUE DEEP AUDIT**

No world-generation incompatibility currently disqualifies Zylann.

The strongest finding is architectural rather than API-specific:

> **Zylann is very well suited to executing deterministic local voxel generation, but Leyforge must own feature identity, regional/global planning, generation versioning and order-independent worldgen semantics.**

This is consistent with the pre-rebuild roadmap requirement that deterministic worldgen must be proven across generation order and worker scheduling rather than accepted from demo behaviour. fileciteturn93file8L1-L18

The recovered Project Optimisation Discussion also explicitly established that risky questions should be settled by research and benchmarks rather than preference, and that technical facts, engineering decisions and Leyforge design decisions must remain distinct. fileciteturn93file0L1-L12

---

# 109. Updated PRD-02 Round Sequence

1. **Round 1 — Current version/source baseline + core capability surface** — **COMPLETE**
2. **Round 2 — Blocky representation, model/state/palette and Forge-binding deep dive** — **COMPLETE**
3. **Round 3 — Storage, edits, streams, persistence and crash/recovery boundary** — **COMPLETE**
4. **Round 4 — Worldgen, threading, determinism and cross-chunk structure deep dive** — **COMPLETE**
5. **Round 5 — LOD, far-distance blocky rendering, collisions and large coordinates** — **NEXT**
6. **Round 6 — Multiplayer, viewers, headless/dedicated server and network data paths**
7. **Round 7 — Navigation, fluids/oceans, moving vessels and specialist integration boundaries**
8. **Round 8 — Prototype/benchmark obligations, source-code inspection, final capability matrix and PRD-02 closure candidate**

---

# 110. Additional Official Sources Used in Round 4

- Generators — `https://voxel-tools.readthedocs.io/en/latest/generators/`
- `VoxelGenerator` — `https://github.com/Zylann/godot_voxel/blob/master/doc/source/api/VoxelGenerator.md`
- `VoxelGeneratorScript` — `https://github.com/Zylann/godot_voxel/blob/master/doc/source/api/VoxelGeneratorScript.md`
- Scripting / thread safety — `https://github.com/Zylann/godot_voxel/blob/master/doc/source/scripting.md`
- Procedural generation / block boundaries — `https://github.com/Zylann/godot_voxel/blob/master/doc/source/procedural_generation.md`
- Multipass generator — `https://github.com/Zylann/godot_voxel/blob/master/doc/source/generators.md`
- Multipass design issue — `https://github.com/Zylann/godot_voxel/issues/545`
- `VoxelGeneratorGraph` — `https://github.com/Zylann/godot_voxel/blob/master/doc/source/api/VoxelGeneratorGraph.md`
- Voxel generator source — `https://github.com/Zylann/godot_voxel/blob/master/generators/voxel_generator.cpp`
- Voxel engine source — `https://github.com/Zylann/godot_voxel/blob/master/engine/voxel_engine.cpp`
- Voxel data source — `https://github.com/Zylann/godot_voxel/blob/master/storage/voxel_data.cpp`
- Performance — `https://github.com/Zylann/godot_voxel/blob/master/doc/source/performance.md`

---

**ROUND-4 RESULT: WORLDGEN / THREADING / DETERMINISM / CROSS-CHUNK STRUCTURE BOUNDARY AUDIT COMPLETE.**

---

# 111. Round-5 Scope

Round 5 audits the runtime scalability boundary between:

- fixed-resolution blocky terrain;
- variable LOD terrain;
- blocky LOD support;
- mesh-block sizing;
- view distance;
- LOD distance;
- memory pressure;
- draw-call pressure;
- mesh creation/destruction;
- collision generation;
- collision update latency;
- fast movement;
- large-coordinate terrain bounds;
- double-precision Godot builds;
- voxel coordinate encoding;
- editing at LOD0;
- far-distance representation;
- low-end scalability.

The core engineering question is:

> **Can Leyforge use Zylann as the near-field voxel/mesh/collision core while maintaining useful far-distance representation and bounded performance across low-end to high-end hardware?**

Round-5 answer:

> **YES as a layered architecture, but stock Zylann blocky LOD is not yet sufficient evidence for Leyforge's final far-world renderer. Rendering LOD, authoritative voxel data, simulation LOD and collision LOD must remain separate systems.**

This directly reinforces the comparative architecture finding that render LOD, terrain/data LOD, simulation LOD and persistence LOD are distinct optimisation domains. fileciteturn94file8L1-L12

---

# 112. Round-5 Official Source Register

| Ref | Official source | Principal use |
|---|---|---|
| `ZYL-S33` | Current overview | `VoxelTerrain` vs `VoxelLodTerrain` responsibilities |
| `ZYL-S34` | Current `VoxelTerrain` API | view distance, bounds, mesh block size, collision settings |
| `ZYL-S35` | Current `VoxelLodTerrain` API/source | variable LOD storage/rendering/editing boundary |
| `ZYL-S36` | Current scripting docs | LOD editing restriction and loaded-area boundary |
| `ZYL-S37` | Current performance guide | draw calls, mesh size, LOD distance, collision costs |
| `ZYL-S38` | Current physics/performance documentation | standard mesh collisions vs block collision path |
| `ZYL-S39` | Current `VoxelToolLodTerrain` source | LOD0 editing and data-grid operations |
| `ZYL-S40` | Current blocky quick-start | supported blocky model path |
| `ZYL-S41` | Current generator documentation | blocky vs LOD generator suitability |
| `ZYL-S42` | Current `VoxelGeneratorGraph` API | graph generation and blocky compatibility |
| `ZYL-S43` | Current registration/source surface | exact current class availability |
| `ZYL-S44` | Current GitHub issue history | known performance/LOD/physics limitations |

---

# 113. Fixed-LOD `VoxelTerrain` vs Variable-LOD `VoxelLodTerrain`

The current official overview makes the architectural distinction clear:

- `VoxelTerrain` uses a simple grid and streams blocks around viewers.
- `VoxelLodTerrain` uses an octree and stores voxels at multiple detail levels to render much larger distances. citeturn1search1

For Leyforge this should **not** become:

```text
VoxelTerrain = small worlds
VoxelLodTerrain = big worlds
```

Instead:

```text
Authoritative World Data
        │
        ├── Near-field voxel terrain
        │       └── Zylann fixed-resolution path
        │
        ├── Render LOD
        │       └── disposable representation
        │
        ├── Simulation LOD
        │       └── Leyforge scheduler
        │
        └── Persistence LOD
                └── Leyforge checkpoint/storage
```

The comparative architecture study already established that chunk/storage scale should not be chosen purely from rendering scale. fileciteturn94file8L1-L12

---

# 114. Blocky LOD Status

Current documentation confirms that `VoxelLodTerrain` exists specifically to support much larger distances through multiple voxel detail levels. citeturn1search1

However, the blocky case remains materially less certain than smooth/Transvoxel terrain.

The current documentation describes blocky `VoxelLodTerrain` support as more limited than the smooth path, while the official quick-start presents `VoxelLodTerrain` primarily through a smooth `VoxelMesherTransvoxel` example. citeturn1search3turn1search7

Therefore:

| Capability | Result |
|---|---|
| Variable-LOD terrain concept | `DIRECT` |
| Large-distance smooth terrain | `DIRECT / demonstrated` |
| Blocky near-field terrain | `DIRECT` |
| Blocky variable LOD at Leyforge scale | `PROTOTYPE-REQUIRED` |
| Minecraft-like far blocky world | `NOT-CERTIFIED` |
| Far representation independent of Zylann voxel LOD | `OPEN / Leyforge renderer option` |

This is not a rejection of `VoxelLodTerrain`.

It is a deliberate refusal to let the existence of an LOD node become proof of a finished Leyforge far-world solution.

---

# 115. Mesh Block Size

Current performance documentation states that terrain uses many unique meshes/draw calls and identifies three direct levers:

- reduce view distance;
- reduce LOD distance when using `VoxelLodTerrain`;
- increase mesh block size.

The default mesh block size is 16, while 32 can reduce draw calls but increases the cost of voxel modification/remeshing. citeturn1search2

This gives Leyforge a direct optimisation axis:

```text
16³ mesh block
    ↓
more mesh objects
more draw/culling work
smaller edit/remesh region

32³ mesh block
    ↓
fewer mesh objects
less draw/culling work
larger edit/remesh region
```

Therefore `16³` and `32³` are **not** competing philosophical choices.

They are workload parameters.

Round 5 therefore preserves the existing benchmark requirement rather than selecting one prematurely.

---

# 116. View Distance Is Not Simulation Distance

Zylann's viewer system determines what terrain blocks are loaded around viewers, and the terrain has explicit view-distance controls. citeturn1search1turn1search2

Leyforge must not use that radius as the distance within which every system operates.

Working separation:

```text
0–Near
  full voxel detail
  full collision
  full interaction
  high-frequency simulation

Near–Medium
  reduced render detail
  selective collision
  active gameplay only where needed

Medium–Far
  render proxy / LOD
  reduced structural detail
  low-frequency simulation or no simulation

Far
  terrain silhouette / proxy
  strategic/environmental state
  no full voxel collision
  no individual voxel simulation
```

This is directly aligned with the recovered comparative research, which found that combining render, terrain, simulation and persistence distance into one chunk-distance control wastes major optimisation opportunities. fileciteturn94file8L1-L12

---

# 117. LOD0 Editing Boundary

Current scripting documentation explicitly states that with `VoxelLodTerrain`, voxel data beyond the first LOD is not available at full resolution for editing. citeturn1search0

Current source also shows `VoxelToolLodTerrain` currently operates on LOD0 for editing operations. citeturn1search4

This gives us a very clean working rule:

> **Player-authoritative physical editing remains an LOD0 operation.**

That means we should not design:

```text
player mines distant LOD5 voxel
        ↓
somehow edits coarse voxel representation
        ↓
hope the near world agrees later
```

Instead:

```text
player approaches
      ↓
region becomes LOD0-authoritative
      ↓
full voxel data available
      ↓
edit
      ↓
materialise/remesh/collision
```

For distant editing, Leyforge should operate on **semantic world actions/features**, not pretend a low-resolution render proxy is the authoritative editable voxel field.

---

# 118. Collision Architecture

Zylann currently exposes two fundamentally different collision approaches.

## 118.1 Standard physics

Terrain blocks can generate static mesh colliders through Godot's physics API. These can represent arbitrary terrain shapes, but collider creation is expensive and much of the shape creation work is constrained to the main thread. citeturn1search2

## 118.2 Block physics

`VoxelBoxMover` and voxel raycasts provide a specialised AABB/blocky collision path that is more limited but can perform faster on blocky terrain. citeturn1search2

This strongly supports a Leyforge split:

```text
ordinary terrain/player movement
        ↓
fast block/AABB collision candidate

complex dynamic physics
        ↓
standard Godot/Jolt/etc. collision candidate
```

Neither should automatically be used everywhere.

---

# 119. Collision Cost Is a First-Class Streaming Constraint

The current performance documentation is unusually explicit:

- terrain collision is generated from terrain meshes;
- mesh collider creation can be several times more expensive than meshing;
- safe creation of the final physics shape cannot simply be pushed into the voxel worker threads;
- collision generation can therefore slow terrain loading substantially. citeturn1search2

This means:

```text
terrain visible
```

must not imply:

```text
terrain fully collidable
```

A working Leyforge streaming pipeline should be able to stage:

```text
voxel data
    ↓
generated
    ↓
meshed
    ↓
render-ready
    ↓
collision candidate
    ↓
collision committed
```

with separate budgets.

The existing POC already demonstrates why this matters: authored spawner volumes are intentionally inactive until the relevant terrain mesh **and collision** have both been committed. fileciteturn95file17L1-L15

That is strong evidence from the existing project that collision readiness is already treated as a gameplay-state boundary.

---

# 120. Collision and Fast-Movement Risk

Zylann documents tunnelling risks with thin mesh terrain colliders, particularly for fast/small-moving objects. Recommended mitigations include:

- limiting speed;
- elongated shapes/raycast trails;
- continuous collision detection where supported;
- voxel checks for underground state. citeturn1search2

This is highly relevant to:

- fast mounts;
- vehicles;
- projectiles;
- falling objects;
- moving vessels;
- future aircraft/flight systems.

Therefore the voxel terrain collider cannot be treated as the universal physics truth for every Leyforge moving object.

---

# 121. Large Coordinate Boundary

Current `VoxelTerrain` API documentation exposes extremely large terrain bounds, while voxel coordinates themselves have their own encoding/storage constraints. The terrain API therefore demonstrates that very large coordinate ranges are possible in the terrain layer, but this does **not** prove that the complete Godot/Leyforge stack is numerically safe at those distances. citeturn1search3

The correct interpretation is:

```text
Zylann terrain coordinate capacity
        ≠
complete Leyforge large-world capacity
```

The latter includes:

- Godot transforms;
- physics;
- camera;
- navigation;
- networking;
- floating-point precision;
- procedural noise;
- Forge placement;
- entity transforms;
- audio;
- particles;
- animation;
- UI/world-space interactions.

Therefore large coordinates remain a full-stack prototype, as already recorded in `ZP-12`. fileciteturn95file0L1-L18

---

# 122. Double-Precision Strategy

A double-precision Godot build is a potential tool for increasing world-coordinate precision, but it must not be treated as a magic solution.

Working hypothesis:

```text
double precision
        ↓
larger numerical safety envelope
        ↓
still requires:
    physics validation
    network validation
    voxel-coordinate validation
    camera validation
    Forge precision validation
    origin/rebasing policy
```

A large-world implementation may ultimately combine:

```text
high-precision authoritative coordinates
+
local floating-point simulation frames
+
voxel integer coordinates
+
camera-relative rendering
```

The exact combination remains a PRD-07 prototype decision.

---

# 123. Origin Rebasing / Local Frames

Round 5 does not promote an origin-rebasing architecture to canon.

However, the evidence now supports treating it as a serious candidate.

The reason is architectural rather than merely numerical:

```text
World coordinate
      ↓
authoritative integer / high precision position

Local simulation frame
      ↓
small coordinates around active player

Render frame
      ↓
camera-relative coordinates
```

This is especially relevant for:

- huge overland travel;
- oceans;
- moving vessels;
- multiplayer;
- Forge placement at distant coordinates;
- physics stability.

The moving-vessel prototype `ZP-10` should eventually test whether vessel-local coordinates can be isolated cleanly from world coordinates.

---

# 124. Far Rendering Should Not Necessarily Be Voxel Rendering

This is one of the most important Round-5 architectural findings.

Zylann's voxel LOD is useful, but Leyforge does not have to render every far region as a lower-resolution voxel terrain.

A future far renderer could consume:

```text
World feature representation
        ↓
terrain/biome/material summary
        ↓
far proxy mesh / height representation / impostor
        ↓
renderer
```

while the actual voxel terrain only exists where needed.

Possible layers:

```text
L0  full voxel + gameplay
L1  reduced voxel / mesh detail
L2  terrain proxy
L3  regional/world proxy
L4  horizon / sky / atmospheric representation
```

This is consistent with the comparative research conclusion that rendering representation can be replaced without redefining authoritative world data. fileciteturn94file8L1-L12

No decision is made here that Leyforge must build a custom far renderer.

Only this boundary is now explicit:

> **Stock `VoxelLodTerrain` is not the sole permitted solution for far rendering.**

---

# 125. Low-End Scalability Model

The project requirement is not:

> “Make the highest-end machine render the largest possible world.”

It is:

> **Allow world simulation/rendering complexity to scale down without destroying the world model.**

Round 5 therefore establishes a candidate capability ladder.

| Tier | Render | Collision | Simulation | Voxel detail |
|---|---|---|---|---|
| Low | short view + aggressive proxy | local/block collision | highly local | LOD0 near player |
| Balanced | moderate view + some LOD | local standard/block mix | bounded active areas | LOD0 + selected LOD |
| High | long view + richer LOD | broader collision | larger active radius | LOD0 + multiple representations |
| Extreme | maximum tested view | selective | large active region | richer far representation |

This is not yet a player-facing settings contract.

It is an engineering principle for the future world-creation scalability system.

---

# 126. Mesh Destruction / Fast Traversal

Current performance documentation records a specific Godot 4/Vulkan issue: rapidly moving through terrain with many small mesh blocks can cause significant main-thread destruction work when many buffers are freed. Mitigations include larger mesh blocks, lower LOD distance and limiting movement speed near terrain. citeturn0search0

This is directly relevant to Leyforge's intended exploration style.

A player moving:

```text
walking
```

and one moving:

```text
horse / vehicle / ship / fast travel
```

are not equivalent streaming workloads.

Therefore performance benchmarks must include:

1. slow walking;
2. sprinting;
3. mounted travel;
4. high-speed traversal;
5. teleport;
6. large camera turns;
7. multi-viewer/remote-interest movement.

A world that performs well while walking but freezes when a player crosses the map quickly is not production-ready.

---

# 127. Memory Is a More Important Constraint Than View Distance Alone

LOD can reduce visible detail, but it does not automatically eliminate:

- voxel data;
- cached blocks;
- generated meshes;
- collision shapes;
- metadata;
- feature caches;
- entity state;
- navigation data.

Therefore Round 5 adds a memory accounting requirement:

```text
per loaded region:
    voxel bytes
  + mesh bytes
  + collision bytes
  + metadata
  + instancing
  + generator cache
  + renderer resources
```

The benchmark must report each category separately where possible.

This follows the comparative research warning that heap telemetry alone can miss native/direct-memory consumption. fileciteturn94file8L1-L12

---

# 128. Round-5 Capability Matrix

| ID | Capability | Result | Leyforge boundary |
|---|---|---|---|
| `ZYL-CAP-268` | Fixed-resolution blocky terrain streaming | `DIRECT` | Strong near-field candidate |
| `ZYL-CAP-269` | Variable LOD terrain storage/rendering | `DIRECT` | Useful LOD component |
| `ZYL-CAP-270` | Large-distance smooth LOD | `DIRECT / DEMONSTRATED` | Strong upstream capability |
| `ZYL-CAP-271` | Blocky variable LOD | `PARTIAL` | Prototype required |
| `ZYL-CAP-272` | Minecraft-scale blocky far render | `NOT-CERTIFIED` | Must prove or provide alternate renderer |
| `ZYL-CAP-273` | Viewer-driven streaming | `DIRECT` | Near-field streaming |
| `ZYL-CAP-274` | Multiple viewers | `DIRECT` | Interest/staging primitive |
| `ZYL-CAP-275` | 16³ mesh blocks | `DIRECT` | Baseline benchmark |
| `ZYL-CAP-276` | 32³ mesh blocks | `DIRECT` | Fewer draw calls, larger edit/remesh scope |
| `ZYL-CAP-277` | View-distance reduction | `DIRECT` | Low-end scaling lever |
| `ZYL-CAP-278` | LOD-distance reduction | `DIRECT` | Performance lever |
| `ZYL-CAP-279` | LOD0 full-resolution editing | `DIRECT` | Authoritative physical edit layer |
| `ZYL-CAP-280` | Editing beyond first LOD | `UNSUITABLE-AS-IS` | Use semantic action/approach-and-promote model |
| `ZYL-CAP-281` | Standard mesh terrain collision | `DIRECT` | Complex terrain candidate |
| `ZYL-CAP-282` | Fast block/AABB collision | `DIRECT` | Blocky movement candidate |
| `ZYL-CAP-283` | Cheap dynamic terrain collision creation | `NOT-PROVIDED` | Must budget carefully |
| `ZYL-CAP-284` | Collision generation from worker threads | `LIMITED` | Main-thread/Godot constraints remain |
| `ZYL-CAP-285` | Collision-ready terrain staging | `DIRECT primitive` | Leyforge gameplay readiness gate |
| `ZYL-CAP-286` | Thin-mesh fast-object collision | `PARTIAL` | Additional CCD/raycast logic required |
| `ZYL-CAP-287` | Huge terrain coordinate bounds | `DIRECT at terrain layer` | Full-stack proof required |
| `ZYL-CAP-288` | Double-precision whole-engine strategy | `EXTERNAL / PROTOTYPE` | Godot build choice, not Zylann capability alone |
| `ZYL-CAP-289` | Origin/local-frame support as Leyforge architecture | `EXTENSION` | Leyforge-owned |
| `ZYL-CAP-290` | Far proxy rendering independent of voxels | `NOT-PROVIDED` | Potential Leyforge renderer |
| `ZYL-CAP-291` | Low-end view-distance scaling | `DIRECT primitive` | Candidate scalability lever |
| `ZYL-CAP-292` | Low-end collision scaling | `EXTENSION` | Leyforge scheduler |
| `ZYL-CAP-293` | Separate simulation distance | `NOT-PROVIDED as Leyforge system` | Leyforge scheduler |
| `ZYL-CAP-294` | Separate persistence distance | `NOT-PROVIDED as Leyforge system` | Leyforge save policy |
| `ZYL-CAP-295` | Fast traversal streaming stability | `PROTOTYPE-REQUIRED` | Critical benchmark |
| `ZYL-CAP-296` | Native/direct-memory accounting | `EXTERNAL / PROTOTYPE` | Must instrument whole stack |
| `ZYL-CAP-297` | Far-view semantic block preservation | `PROTOTYPE-REQUIRED` | FCC-13 + renderer test |
| `ZYL-CAP-298` | Far-view structure/feature proxy | `EXTENSION` | Candidate Leyforge renderer input |

---

# 129. Round-5 Findings

## Finding ZYL-F10 — Zylann is strong at near-field block terrain

The fixed-resolution terrain path remains the strongest direct match for Leyforge's editable blocky world.

## Finding ZYL-F11 — Variable LOD exists, but blocky far-world proof is incomplete

`VoxelLodTerrain` is real and useful, but smooth/Transvoxel support is the stronger documented path. Blocky far rendering remains a critical prototype.

## Finding ZYL-F12 — LOD0 is the correct physical-edit boundary

The current API explicitly limits full-resolution voxel access/editing beyond the first LOD.

## Finding ZYL-F13 — Collision is more expensive than meshing

Collision creation can become the actual terrain-streaming bottleneck, not just mesh generation.

## Finding ZYL-F14 — Fast traversal is a separate stress case

Rapid movement can cause mesh destruction/resource spikes even where ordinary traversal performs acceptably.

## Finding ZYL-F15 — Mesh-block size is a workload parameter

16 and 32 should both remain supported benchmark candidates.

## Finding ZYL-F16 — Large coordinates remain full-stack

Zylann's terrain bounds are not proof of complete large-world numerical stability.

## Finding ZYL-F17 — Far rendering must remain replaceable

Leyforge should be free to use Zylann LOD, custom proxy geometry, or a hybrid approach without changing authoritative world data.

## Finding ZYL-F18 — Simulation/render/persistence distance must remain separate

This is now reinforced by both the comparative research and direct Zylann limitations.

---

# 130. Round-5 Risk Register Additions

| Risk | Level | Reason |
|---|---|---|
| `ZYL-R05-01` Stock blocky LOD fails required far view | RED | Capability exists but scale/quality is not certified. |
| `ZYL-R05-02` Collision generation dominates terrain load | RED | Main-thread shape creation is expensive. |
| `ZYL-R05-03` Fast traversal causes mesh destruction spikes | RED | Documented Godot 4/Vulkan behaviour. |
| `ZYL-R05-04` One distance setting controls too many systems | RED architecture risk | Would couple rendering to simulation and persistence. |
| `ZYL-R05-05` Far proxy loses semantic/visual identity | AMBER/RED | FCC-13 and block/form fidelity must be proven. |
| `ZYL-R05-06` 32³ blocks make edits/remesh too expensive | AMBER | Explicit upstream trade-off. |
| `ZYL-R05-07` 16³ blocks create too many render resources | AMBER | Draw-call/resource count rises. |
| `ZYL-R05-08` Large-world precision fails outside voxel layer | RED | Full stack remains unproven. |
| `ZYL-R05-09` Collision unsuitable for fast objects | AMBER/RED | Thin mesh collider tunnelling risk. |
| `ZYL-R05-10` Low-end profile becomes a collection of ad-hoc hacks | AMBER | Needs central scalability policy. |
| `ZYL-R05-11` Far renderer becomes coupled to voxel storage | AMBER | Would restrict future optimisation. |
| `ZYL-R05-12` Native/direct memory exceeds visible heap budget | AMBER | Terrain resources include meshes/colliders/native allocations. |

---

# 131. Round-5 Prototype Obligations

## `ZP-LOD-01 — Blocky LOD Fidelity`

Compare:

- `VoxelTerrain`;
- `VoxelLodTerrain`;
- 16³ mesh blocks;
- 32³ mesh blocks;
- several LOD distances.

Measure:

- seams;
- popping;
- block identity;
- texture/material identity;
- model/form identity;
- memory;
- draw calls;
- CPU;
- GPU;
- traversal stability.

## `ZP-LOD-02 — Collision Budget`

Measure:

```text
generation
→ mesh
→ collider
→ gameplay-ready
```

for:

- flat terrain;
- caves;
- dense structures;
- chunk boundaries;
- edit bursts.

## `ZP-LOD-03 — Fast Traversal Stress`

Run:

- walking;
- sprinting;
- mounted;
- vehicle-speed;
- teleport;
- large camera rotation.

Record:

- frame time;
- mesh creation/destruction;
- collision backlog;
- RAM;
- native memory;
- streaming backlog.

## `ZP-LOD-04 — Low-End Scalability Matrix`

At least three hardware profiles:

```text
low
balanced
high
```

Test:

- view distance;
- LOD distance;
- mesh size;
- collision radius;
- simulation radius;
- memory cap.

Goal:

> Same world, different execution budgets.

## `ZP-LOD-05 — Large Coordinate Full-Stack Test`

Compare:

- standard precision;
- double build;
- local-origin/rebased strategy.

Test:

- movement;
- terrain;
- physics;
- camera;
- editing;
- networking;
- Forge placement.

## `ZP-LOD-06 — Far Proxy Experiment`

Create a disposable far representation from the same authoritative terrain/feature source.

Goal:

```text
far rendering
≠
authoritative voxel storage
```

Prove it can swap independently.

## `ZP-LOD-07 — Collision/Simulation Separation`

Allow terrain to be visible farther than it is physically collidable.

Measure:

- player perception;
- gameplay correctness;
- collision readiness;
- streaming latency.

## `ZP-LOD-08 — Native Memory Budget`

Instrument:

- voxel storage;
- mesh resources;
- collision shapes;
- instancing;
- generator caches;
- Godot native/direct allocations.

Do not rely on managed/heap memory alone.

---

# 132. Round-5 Resolved / Narrowed Questions

### Blocky far LOD

**Previous:** Is blocky `VoxelLodTerrain` good enough?

**Now:** It remains a viable candidate but is explicitly **not certified** for final Leyforge-scale far rendering.

### Editing at LOD

**Previous:** Can distant LOD be edited?

**Now:** Full-resolution physical editing belongs at LOD0; distant actions require an approach/promote/authoritative-action model.

### Collision

**Previous:** Can Zylann handle terrain collision?

**Now:** Yes, but collision creation must be treated as its own streaming budget and readiness state.

### Large coordinates

**Previous:** Does Zylann support huge coordinates?

**Now:** The terrain layer has large bounds, but the complete Leyforge stack remains unproven.

### Low-end scalability

**Previous:** Can view distance simply be reduced?

**Now:** View distance is one lever among several; simulation, collision and persistence must have independent policies.

---

# 133. Round-5 New Unknowns

1. What exact blocky LOD artefacts occur in current Voxel Tools when using `VoxelMesherBlocky` with non-cube models?
2. Can a Leyforge-specific blocky LOD mesher be added without replacing Zylann's terrain streaming/storage?
3. Can a far proxy preserve enough FCC-13 material/form identity for visually important structures?
4. What is the maximum practical blocky view distance before resource destruction or culling becomes the dominant cost?
5. What is the best mesh-block size under simultaneous mining/building and high-speed traversal?
6. How should collision radius differ from render radius for low-end hardware?
7. Can block/AABB collision remain authoritative for ordinary player movement while standard physics is selectively enabled?
8. How should moving vessels interact with local terrain collision and origin shifting?
9. What precision loss appears at 1 km, 10 km, 100 km and larger world coordinates?
10. Does double precision alone solve the required precision envelope, or is origin rebasing still needed?
11. Can networking preserve stable authoritative coordinates while clients use local render origins?
12. How much native/direct memory does the complete voxel stack consume relative to visible process heap?
13. Can distant generated terrain be represented from feature summaries without loading full voxel blocks?
14. What is the minimum viable far representation for mountains, coastlines, cities and megastructures?
15. Can Forge preview the same far representation without loading full gameplay terrain?
16. How should distant edits be represented before the player reaches them?
17. Can the render LOD system be rebuilt independently of save/persistence formats?
18. How many simultaneous viewers can be supported before shared terrain streaming becomes a bottleneck?
19. Can low-end world-creation settings cap world simulation without changing canonical world identity?
20. Which portions of Zylann's LOD system would need modification/forking to support Leyforge's blocky target?
21. Can the terrain renderer support camera-relative transforms cleanly enough for extreme coordinates?
22. Which physics backend is best for Leyforge's mixed block/mesh collision requirements?
23. How should collision regeneration be prioritised around gameplay-critical objects?
24. What happens when a player edits a region immediately after its collision is unloaded but its render mesh remains?
25. Can a render-only far proxy transition into LOD0 without visible topology/material discontinuity?

---

# 134. Round-5 Boundary Verdict

**PASS — CONTINUE DEEP AUDIT**

No Zylann limitation found in Round 5 disqualifies the engine-core approach.

However, two things are now explicitly **not allowed to become assumptions**:

1. stock `VoxelLodTerrain` is the final Leyforge far renderer;
2. terrain render distance, collision distance, simulation distance and persistence distance are one shared radius.

The stronger architecture is:

```text
                 LEYFORGE WORLD AUTHORITY
                         │
             ┌───────────┼────────────┐
             │           │            │
        Simulation   Persistence   Feature Source
             │
             └──────────┬────────────┘
                        │
               AUTHORITATIVE VOXELS
                        │
             ┌──────────┼───────────┐
             │          │           │
           LOD0      LOD/proxy   Far renderer
             │          │           │
         collision   optional     optional
             │
         gameplay
```

Zylann remains the strongest candidate for the **near-field voxel execution layer**.

The far renderer remains replaceable.

---

# 135. Updated PRD-02 Round Sequence

1. **Round 1 — Current version/source baseline + core capability surface** — **COMPLETE**
2. **Round 2 — Blocky representation, model/state/palette and Forge-binding deep dive** — **COMPLETE**
3. **Round 3 — Storage, edits, streams, persistence and crash/recovery boundary** — **COMPLETE**
4. **Round 4 — Worldgen, threading, determinism and cross-chunk structure deep dive** — **COMPLETE**
5. **Round 5 — LOD, far-distance blocky rendering, collisions and large coordinates** — **COMPLETE**
6. **Round 6 — Multiplayer, viewers, headless/dedicated server and network data paths** — **NEXT**
7. **Round 7 — Navigation, fluids/oceans, moving vessels and specialist integration boundaries**
8. **Round 8 — Prototype/benchmark obligations, source-code inspection, final capability matrix and PRD-02 closure candidate**

---

# 136. Additional Official Sources Used in Round 5

- Current overview  
  `https://github.com/Zylann/godot_voxel/blob/master/doc/source/overview.md`
- Current performance guide  
  `https://github.com/Zylann/godot_voxel/blob/master/doc/source/performance.md`
- Current scripting documentation  
  `https://github.com/Zylann/godot_voxel/blob/master/doc/source/scripting.md`
- Current generators documentation  
  `https://github.com/Zylann/godot_voxel/blob/master/doc/source/generators.md`
- Current `VoxelTerrain` API  
  `https://github.com/Zylann/godot_voxel/blob/master/doc/source/api/VoxelTerrain.md`
- Current `VoxelGeneratorGraph` API  
  `https://github.com/Zylann/godot_voxel/blob/master/doc/source/api/VoxelGeneratorGraph.md`
- Current `VoxelToolLodTerrain` source  
  `https://github.com/Zylann/godot_voxel/blob/master/edition/voxel_tool_lod_terrain.cpp`
- Current class registration/source surface  
  `https://github.com/Zylann/godot_voxel/blob/master/register_types.cpp`
- Current quick-start  
  `https://github.com/Zylann/godot_voxel/blob/master/doc/source/quick_start.md`
- Current GitHub performance/physics issue history  
  `https://github.com/Zylann/godot_voxel/issues/54`

---

**ROUND-5 RESULT: LOD / FAR-DISTANCE / COLLISION / LARGE-COORDINATE BOUNDARY AUDIT COMPLETE.**

---

# 137. Round-6 Scope

Round 6 audits the multiplayer boundary between:

- authoritative Leyforge simulation;
- Godot high-level multiplayer;
- `VoxelTerrainMultiplayerSynchronizer`;
- `VoxelViewer` and per-client terrain interest;
- server-side versus client-side voxel loading;
- block transfer versus procedural regeneration;
- headless/dedicated server operation;
- network packet size and bandwidth;
- remote edits;
- late joins;
- teleport/preload behaviour;
- multiple simultaneous viewers;
- multiplayer persistence;
- LOD terrain limitations;
- entity replication versus voxel replication.

The engineering question is:

> **Can Zylann provide the voxel-world streaming/editing substrate for a Leyforge authoritative multiplayer game without becoming the multiplayer authority itself?**

Round-6 answer:

> **YES for fixed-LOD/blocky terrain with explicit client streaming; NO as a complete multiplayer architecture. `VoxelTerrainMultiplayerSynchronizer` is useful infrastructure, but Leyforge must own authority, interest management, operation validation, persistence, replication policy and cross-domain consistency.**

---

# 138. Round-6 Official Source Register

| Ref | Official source | Principal use |
|---|---|---|
| `ZYL-S33` | Current `VoxelTerrain` API | Client-side automatic loading and multiplayer server/client loading boundary |
| `ZYL-S34` | Current class registration | Confirms `VoxelTerrainMultiplayerSynchronizer` is a first-class native component |
| `ZYL-S35` | Current changelog | Introduction and evolution of terrain multiplayer synchronizer |
| `ZYL-S36` | Current overview | Viewer-driven terrain streaming model |
| `ZYL-S37` | Current generators documentation | Deterministic regeneration and repeated generation assumptions |
| `ZYL-S38` | Current scripting documentation | Loaded-border editing limitations and LOD editing boundary |
| `ZYL-S39` | Current `VoxelGeneratorScript` API | LOD-aware generator request contract |
| `ZYL-S40` | Current Godot scene replication implementation | Packet MTU, authority, visibility and synchronizer behaviour |
| `ZYL-S41` | Current Zylann multiplayer synchronizer source surface | Terrain-specific replication implementation boundary |
| `ZYL-S42` | Current GitHub multiplayer/teleport issue history | Practical viewer/preload limitations |
| `ZYL-S43` | Current GitHub multiplayer/LOD issue history | LOD terrain multiplayer limitation evidence |

---

# 139. Multiplayer Capability Boundary

Zylann now has a dedicated `VoxelTerrainMultiplayerSynchronizer` registered as part of the engine module. The changelog explicitly describes it as simplifying replication using Godot's high-level multiplayer API. `VoxelTerrain` also exposes `automatic_loading_enabled`, with the documented multiplayer use case being client-side terrain where blocks are instead sent by the server.

| ID | Capability | Evidence | Result | Leyforge interpretation |
|---|---|---|---|---|
| `ZYL-CAP-299` | Zylann provides a dedicated terrain multiplayer synchronizer | `ZYL-S34`, `ZYL-S35` | `DIRECT` | Useful integration point, not a complete network architecture. |
| `ZYL-CAP-300` | `VoxelTerrain` can disable automatic local block loading | `ZYL-S33` | `DIRECT` | Strong fit for server-authoritative client terrain streaming. |
| `ZYL-CAP-301` | Official docs explicitly identify client-side terrain as a multiplayer use case for disabling automatic loading | `ZYL-S33` | `DIRECT` | Confirms intended server-to-client terrain delivery pattern. |
| `ZYL-CAP-302` | Terrain still requires viewer-driven loading when automatic loading is enabled | `ZYL-S36` | `DIRECT` | Viewer is an interest/priority mechanism, not an authority system. |
| `ZYL-CAP-303` | Voxel terrain can be edited in real time | `ZYL-S36` | `DIRECT` | Supports authoritative voxel operations. |
| `ZYL-CAP-304` | Client-side editing must respect loaded-area boundaries | `ZYL-S38` | `DIRECT` | Client cannot assume arbitrary remote voxel access. |
| `ZYL-CAP-305` | LOD terrain exposes a different multiplayer problem than fixed-Lod terrain | `ZYL-S43` | `DIRECT / limitation evidence` | Fixed-Lod blocky terrain is the safer multiplayer baseline. |
| `ZYL-CAP-306` | Godot high-level multiplayer provides authority/visibility/synchronizer primitives | `ZYL-S40` | `DIRECT` | Leyforge can use Godot transport/replication primitives without making them its whole state model. |
| `ZYL-CAP-307` | Godot synchronizer deltas are packet-size bounded | `ZYL-S40` | `DIRECT` | Large voxel edits cannot simply be treated as ordinary property replication. |
| `ZYL-CAP-308` | Godot synchronizer rejects/does not send states larger than configured MTU in the current implementation | `ZYL-S40` | `DIRECT source fact` | Large world operations require chunked/custom voxel messages. |
| `ZYL-CAP-309` | Godot replication validates synchronizer authority on receive | `ZYL-S40` | `DIRECT` | Useful baseline security/correctness primitive. |
| `ZYL-CAP-310` | Godot synchronizer visibility can be peer-specific | `ZYL-S40` | `DIRECT` | Useful for player/entity replication and interest filtering. |

---

# 140. Voxel Replication Is Not Entity Replication

This distinction is now explicit.

Godot's `MultiplayerSynchronizer` is designed around replicated node properties and state deltas. Zylann's terrain synchronizer exists to simplify terrain replication, but the voxel world itself is not naturally represented as a collection of ordinary scene-node properties.

Therefore:

```text
ENTITY REPLICATION
    player transform
    health
    inventory summary
    animation state
    vehicle state

VOXEL REPLICATION
    block/region revision
    block payload
    edit operation
    authoritative materialisation

WORLD SIMULATION
    settlement
    economy
    NPC decisions
    weather
    farming
    vessels
    structures
```

These are separate replication classes.

| ID | Finding | Result |
|---|---|---|
| `ZYL-CAP-311` | Ordinary property synchronisation is not an efficient representation of arbitrary voxel volumes | `DIRECT architecture fact` |
| `ZYL-CAP-312` | Voxel blocks already have compact standalone serialization | `DIRECT` |
| `ZYL-CAP-313` | Voxel edits can be represented as block snapshots or semantic operations above the engine | `DIRECT + Leyforge design` |
| `ZYL-CAP-314` | Entity replication should not force voxel persistence into scene-node state | `DIRECT architecture rule` |
| `ZYL-CAP-315` | Leyforge can use Godot replication for entities while using a specialised voxel protocol | `STRONG architecture candidate` |

---

# 141. Server-Authoritative Terrain Loading

The current `VoxelTerrain` API exposes the exact switch needed for the model we want:

```text
Server
    owns authoritative voxel state
        ↓
Client terrain
    automatic_loading_enabled = false
        ↓
Server sends required blocks
        ↓
Client materialises received blocks
```

This is significantly cleaner than allowing each client to procedurally generate arbitrary terrain and hoping every generator, mod set, version and seed remains identical.

However, deterministic client generation remains potentially valuable as an optimisation.

### Candidate two-mode protocol

```text
MODE A — AUTHORITATIVE BLOCK STREAM
server → client block data

MODE B — VERIFIED PROCEDURAL REGENERATION
server → seed/generator/region revision
client → deterministic local generation
server → authoritative edits/deltas
```

Mode B should only be enabled when the client has the exact compatible world-generation contract.

---

# 142. Deterministic Generation as Network Compression

The generator documentation states that generators are designed to be deterministic and may be called again for the same area. This creates a powerful networking possibility.

Instead of sending:

```text
millions of untouched voxels
```

the server can send:

```text
World generation identity
+
region/area seed
+
generator version
+
feature configuration snapshot
+
edit deltas
```

and let the client reconstruct untouched terrain locally.

This is **not yet accepted as the default multiplayer protocol**.

It requires proof of:

- exact generator compatibility;
- registry/palette compatibility;
- deterministic floating/integer behaviour;
- mod/pack compatibility;
- cross-platform reproducibility;
- version migration;
- cheating resistance;
- acceptable CPU cost on low-end clients.

The safe baseline remains authoritative block delivery.

---

# 143. Interest Management Boundary

`VoxelViewer` tells the terrain system where to load blocks and gives priority to nearby mesh updates. This is an engine-side spatial streaming mechanism.

It is not sufficient by itself as Leyforge's network interest manager.

Leyforge needs to answer:

```text
Which player?
Which world?
Which realm?
Which spatial volume?
Which LOD?
Which entity classes?
Which simulation systems?
Which voxel revisions?
Which updates are already known?
Which updates are priority-critical?
```

Therefore:

```text
LEYFORGE NETWORK INTEREST MANAGER
             ↓
     per-client interest set
       ┌─────┴─────┐
       ↓           ↓
 entity interest  voxel interest
       ↓           ↓
 Godot replication specialised voxel stream
```

| ID | Capability | Evidence | Result |
|---|---|---|---|
| `ZYL-CAP-316` | `VoxelViewer` provides spatial terrain loading priority | `ZYL-S36` | `DIRECT` |
| `ZYL-CAP-317` | Multiple viewers can be used by the terrain system | `ZYL-S36`, source/API surface | `DIRECT` |
| `ZYL-CAP-318` | Viewer placement can affect what terrain remains loaded | `ZYL-S36`, `ZYL-S42` | `DIRECT` |
| `ZYL-CAP-319` | Viewer management alone does not express player-specific network visibility | `ZYL-S36` | `DIRECT limitation` |
| `ZYL-CAP-320` | Leyforge needs an outer network-interest layer | Architecture inference | `REQUIRED` |

---

# 144. Teleport / Preload Problem

A current 2026 GitHub issue reports a multiplayer project using `VoxelTerrain`, `VoxelMesherBlocky`, `VoxelGeneratorScript` and `VoxelStreamRegionFiles` attempting to move a second `VoxelViewer` to a teleport destination before moving the player. The report describes terrain unloading/loading interactions that can make this unreliable.

This is highly relevant to Leyforge because teleportation, portals and large-distance travel are already expected systems.

The conclusion is not that multiple viewers are unusable.

The conclusion is:

> **Teleport preloading must be treated as a coordinated streaming operation rather than simply moving another viewer and hoping the terrain lifecycle converges correctly.**

Candidate protocol:

```text
Teleport request accepted
        ↓
calculate destination interest set
        ↓
server begins destination preload
        ↓
minimum terrain readiness reached
        ↓
client receives required block/region revisions
        ↓
destination collision readiness reached
        ↓
entity transfer / teleport commit
        ↓
old interest set released
```

This aligns directly with our existing gameplay rule that systems should not activate on terrain before required mesh/collision readiness.

---

# 145. Multiple Viewers: Useful but Dangerous

Multiple `VoxelViewer` nodes are a useful engine mechanism, but they create overlapping streaming demands.

Potential costs:

- duplicate generation requests;
- duplicate block residency;
- competing mesh priorities;
- increased memory;
- unload/reload churn;
- teleport races;
- network interest mismatches.

Therefore the number of viewers is not merely a convenience setting.

It becomes a measurable scalability parameter.

Required benchmark:

```text
1 viewer
2 viewers
4 viewers
8 viewers
many simulated viewers
```

with:

- overlapping areas;
- disjoint areas;
- rapid movement;
- teleports;
- different view distances;
- different LOD settings.

---

# 146. Headless / Dedicated Server Boundary

The current module registration confirms that Zylann's terrain system is compiled as native engine functionality and exposes the terrain, viewer, stream, generator and save-completion classes independently of graphical editor use.

This makes a dedicated/headless deployment technically plausible.

However, a dedicated server should not necessarily instantiate all rendering responsibilities.

Candidate architecture:

```text
DEDICATED SERVER
├── Leyforge simulation
├── voxel authority
├── persistence
├── generator/materialisation services
├── network interest
└── minimal terrain data residency

CLIENT
├── local visual terrain
├── mesh generation
├── collision
├── player presentation
└── received authoritative voxel state
```

The exact amount of client-side generation remains benchmark-dependent.

---

# 147. Dedicated Server Does Not Mean "No Voxels"

A server still needs enough voxel state to answer authoritative gameplay questions:

- is this position solid?
- did this block change?
- can the player place here?
- did a projectile hit terrain?
- can this structure occupy the location?
- does this construction operation conflict?

But it does **not** necessarily need to retain the same mesh/collision/rendering footprint as a client.

This strengthens the separation:

```text
VOXEL DATA AUTHORITY
        ≠
VOXEL VISUAL REPRESENTATION
        ≠
CLIENT PHYSICS REPRESENTATION
```

A future server-specific terrain configuration can therefore have much smaller visual budgets while retaining authoritative data around active simulation areas.

---

# 148. Network Payload Classes

Round 6 identifies at least five distinct payload classes.

| Payload | Example | Default direction | Priority |
|---|---|---|---|
| `NET-01` Entity state | player position/velocity | server → client | high |
| `NET-02` Entity input | movement/build request | client → server | high |
| `NET-03` Voxel operation | place/remove/modify request | client → server | high |
| `NET-04` Voxel materialisation | block snapshot/revision | server → client | medium/high |
| `NET-05` World-generation identity | generator/registry/region version | server → client | low frequency |

This should not be collapsed into one generic synchronizer stream.

---

# 149. Voxel Operation vs Voxel Snapshot

For player edits, there are two useful representations.

### Operation

```text
REMOVE
world
position
expected revision
actor
transaction ID
```

### Result snapshot

```text
block coordinate
new block revision
compressed block state
```

The authoritative server should receive the operation and decide whether it is legal.

The resulting block revision/snapshot can then be distributed to interested clients.

This creates a clean anti-cheat and persistence boundary:

```text
CLIENT REQUEST
      ↓
VALIDATION
      ↓
AUTHORITATIVE OPERATION
      ↓
WORLD JOURNAL
      ↓
VOXEL MATERIALISATION
      ↓
BLOCK REVISION
      ↓
CLIENT DISTRIBUTION
```

Zylann supplies the final materialisation mechanism; Leyforge owns the causal chain.

---

# 150. Revision Numbers Are Mandatory Candidates

Networked voxel state should not rely solely on arrival order.

A block should conceptually have:

```text
World revision
Region revision
Block revision
```

or an equivalent monotonic identity.

This supports:

- late packets;
- reconnects;
- duplicate operations;
- out-of-order delivery;
- partial region streaming;
- checkpoint recovery;
- client resynchronisation.

This is a Leyforge protocol requirement candidate, not a Zylann feature claim.

---

# 151. Late Join / Reconnect Boundary

A newly connected client should not need to replay the entire history of a world.

Candidate sequence:

```text
authenticate
   ↓
world/realm identity
   ↓
current world generation contract
   ↓
current checkpoint/revision
   ↓
player/entity snapshot
   ↓
initial voxel interest set
   ↓
incremental voxel revisions
   ↓
normal live replication
```

The persistence work from Round 3 therefore directly feeds multiplayer.

The checkpoint provides a stable baseline; the journal/revisions bridge the gap to live state.

---

# 152. Network Interest Should Be Revision-Aware

A client interest manager should ask:

```text
Does client have block X?
What revision does client have?
What revision is authoritative?
```

not merely:

```text
Is block X inside the view distance?
```

This avoids resending unchanged blocks and gives reconnects a deterministic repair path.

Candidate state:

```text
ClientVoxelKnowledge
    block_id
    known_revision
    generation_contract
    residency_state
```

This becomes especially useful for huge worlds where the same client repeatedly leaves and re-enters regions.

---

# 153. Bandwidth Risk

The biggest multiplayer voxel risk is not a single large block.

It is a burst:

```text
player enters new region
+
large construction loads
+
terrain edits
+
entities spawn
+
weather/state changes
```

Therefore network tests must measure:

- initial region join;
- walking into fresh territory;
- high-speed travel;
- teleport;
- mass block destruction;
- mass block construction;
- multiple players editing the same region;
- reconnect;
- server restart + reconnect.

The payload must be prioritised.

Suggested priority:

```text
P0 — player survival / control / immediate collision-relevant data
P1 — nearby voxel changes
P2 — nearby entities
P3 — local visual detail
P4 — distant prefetch
P5 — cosmetic/background state
```

Exact ordering remains FORGE-ENG/network design work.

---

# 154. Client Procedural Generation: Conditional Optimisation

A major possible optimisation is:

```text
server says:
"You have generator contract G42"

client verifies:
"I possess exact G42"

client generates untouched blocks locally

server only sends:
- edits
- non-deterministic results
- incompatible features
- revision corrections
```

This could drastically reduce bandwidth.

But it creates additional attack and compatibility surfaces.

The client must not be trusted merely because it generated the same expected terrain visually.

Authoritative gameplay queries remain server-owned.

So:

> **Client generation can be a rendering/streaming optimisation, never the source of truth.**

---

# 155. LOD Multiplayer Boundary

Round 5 already established that LOD0 is the physical-edit boundary and that current upstream evidence does not establish a mature multiplayer path for `VoxelLodTerrain`.

Round 6 therefore adopts a conservative architecture:

```text
MULTIPLAYER BASELINE
VoxelTerrain + blocky mesher

OPTIONAL FUTURE
VoxelLodTerrain / custom far renderer
```

A far renderer can be fed from:

- deterministic generator data;
- cached region summaries;
- simplified terrain representations;
- feature proxies;
- server-supplied far-world data.

This prevents the multiplayer architecture from being locked to the current LOD terrain implementation.

---

# 156. Multiplayer / Persistence Integration

Round 3's checkpoint architecture and Round 6's replication architecture now intersect.

Candidate flow:

```text
LIVE WORLD
    │
    ├── authoritative operations
    │
    ├── voxel materialisation
    │
    ├── journal/revision
    │
    └── client replication
           │
           ▼
      CHECKPOINT N
           │
           └── stable reconnect baseline
```

This allows the server to recover from restart without replaying the entire history since world creation.

It also gives reconnecting clients a clean point from which to request missing revisions.

---

# 157. Multiplayer Risk Register

| Risk | Level | Reason |
|---|---|---|
| `ZYL-R06-01` Client treated as voxel authority | RED | Enables cheating and divergence. |
| `ZYL-R06-02` Ordinary property replication used for large voxel payloads | RED | Packet-size and bandwidth mismatch. |
| `ZYL-R06-03` Client/server generator mismatch | RED | Deterministic reconstruction becomes invalid. |
| `ZYL-R06-04` Multiple viewers cause teleport/unload churn | RED | Current practical issue evidence. |
| `ZYL-R06-05` LOD terrain assumed to be multiplayer-ready | RED | Current upstream evidence does not support that assumption. |
| `ZYL-R06-06` No block revisions | RED | Out-of-order/reconnect repair becomes difficult. |
| `ZYL-R06-07` Initial region stream saturates bandwidth | RED | Join/travel experience collapses under bursts. |
| `ZYL-R06-08` Server stores client rendering state | AMBER | Wastes resources at scale. |
| `ZYL-R06-09` Server generates unnecessary distant terrain | AMBER | CPU/memory waste. |
| `ZYL-R06-10` Deterministic generation trusted without contract verification | AMBER/RED | Mod/version/platform divergence. |
| `ZYL-R06-11` Voxel operation accepted without server validation | RED | Exploit path. |
| `ZYL-R06-12` Late join requires full history replay | AMBER | Poor reconnect scaling. |
| `ZYL-R06-13` Viewer and network-interest systems independently stream the same area | AMBER | Duplicate work and inconsistent residency. |
| `ZYL-R06-14` Headless server accidentally carries rendering workload | AMBER | Wasted CPU/GPU/resources. |
| `ZYL-R06-15` Large voxel edit exceeds network packet limits | RED | Update cannot be delivered as one ordinary sync state. |

---

# 158. Round-6 Prototype Obligations

## `ZP-NET-01 — Authoritative Block Streaming`

Server owns the world. Clients have automatic terrain loading disabled.

Measure:

- first-load latency;
- block throughput;
- bandwidth;
- client memory;
- server memory;
- movement smoothness;
- edit propagation.

## `ZP-NET-02 — Deterministic Client Regeneration`

Compare:

```text
server block transmission
vs
client deterministic generation + edit deltas
```

under matching and intentionally mismatched contracts.

## `ZP-NET-03 — Teleport / Preload Torture`

Test:

- short teleport;
- long teleport;
- portal transfer;
- repeated teleport;
- simultaneous teleports;
- multiple clients teleporting to different locations.

Measure terrain churn and readiness correctness.

## `ZP-NET-04 — Multi-Viewer Stress`

Run 1 / 2 / 4 / 8 / simulated many viewers with:

- overlapping regions;
- separate regions;
- high-speed movement;
- teleports.

## `ZP-NET-05 — Voxel Edit Burst`

Simulate:

- 1 player placing;
- 10 players building;
- 50 players editing;
- large construction import;
- mass destruction.

Measure bandwidth and server queue behaviour.

## `ZP-NET-06 — Late Join / Reconnect`

Join at:

- fresh world;
- moderately explored world;
- heavily modified region;
- during active construction;
- immediately after checkpoint;
- immediately before checkpoint.

## `ZP-NET-07 — Packet Loss / Reordering`

Inject:

- latency;
- jitter;
- packet loss;
- reordering;
- duplicate packets;
- disconnect/reconnect.

Success:

```text
client eventually converges to authoritative voxel state
```

## `ZP-NET-08 — Generator Contract Mismatch`

Change:

- generator version;
- registry version;
- palette;
- mod set;
- platform;

and ensure deterministic-client mode refuses unsafe reconstruction.

## `ZP-NET-09 — Headless Server`

Run dedicated server with no graphical client rendering.

Measure:

- CPU;
- RAM;
- terrain residency;
- generation throughput;
- persistence;
- networking.

## `ZP-NET-10 — Region Handoff`

Move clients repeatedly across region boundaries and measure:

- redundant blocks;
- stale blocks;
- missing blocks;
- revision corrections;
- memory churn.

---

# 159. Round-6 Resolved / Narrowed Questions

1. **Can Zylann support a server-authoritative voxel client?**

   Yes. `VoxelTerrain.automatic_loading_enabled` explicitly supports the multiplayer pattern where client terrain is populated by server-sent blocks.

2. **Can Godot's high-level multiplayer layer carry all voxel state directly?**

   No. It is better suited to entity/property replication; voxel payloads require specialised block/operation messages.

3. **Can client-side deterministic generation reduce bandwidth?**

   Yes in principle, but only after strict generator/registry/palette/version compatibility is proven.

4. **Can Zylann's terrain synchronizer become Leyforge's authoritative multiplayer system?**

   No. It is an integration helper, not the world authority, persistence coordinator or full interest-management system.

5. **Can multiple viewers solve teleport preloading automatically?**

   No guarantee. Current practical issue evidence requires explicit teleport/preload testing and coordination.

6. **Should multiplayer be based on `VoxelLodTerrain`?**

   Not for the baseline. Current evidence is insufficient; fixed-Lod blocky terrain is the safer starting point.

---

# 160. Round-6 New Unknowns

1. What exact terrain synchronizer payloads and revision semantics does the current Zylann implementation transmit?
2. Does the terrain synchronizer transmit complete blocks, modified regions, or another representation under different configurations?
3. How does terrain synchronizer behaviour interact with unloaded client blocks?
4. Can the synchronizer be replaced cleanly with a Leyforge custom block protocol without forking terrain internals?
5. What batching opportunities exist for multiple block updates?
6. What is the practical bandwidth cost of initial terrain population at 16³ blocks?
7. How much server CPU is consumed when generating blocks for many clients with overlapping interests?
8. Does one server terrain instance efficiently serve many client interests, or does each viewer produce substantial duplicate work?
9. How should server-side voxel residency differ from client-side visual residency?
10. Can authoritative server collision queries operate without generating the same visual mesh workload as clients?
11. What exact headless build/configuration is required for all required Zylann terrain functionality?
12. Can Zylann's SQLite/region streams remain performant under simultaneous save + network streaming load?
13. What network protocol should carry large block snapshots exceeding ordinary synchronizer MTU?
14. Should voxel operations be reliable-ordered, unreliable-sequenced, or hybrid?
15. How should block revision conflicts be represented and repaired?
16. How should clients request missing blocks/revisions after packet loss or reconnect?
17. What is the ideal client-side cache lifetime for previously visited voxel regions?
18. Can deterministic generation safely operate on heterogeneous CPU architectures without numerical divergence for Leyforge's chosen algorithms?
19. How should modded/custom worldgen contracts be authenticated and versioned for multiplayer?
20. How should server-generated non-deterministic structures be replicated without transmitting their entire underlying world state?
21. How should ownership of player-created persistent realms interact with server authority and save permissions?
22. How should cross-realm travel transfer player/entity state atomically with voxel interest state?
23. What is the maximum practical number of simultaneous active voxel viewers on the target server budget?
24. How should low-end client settings alter network interest distance without changing authoritative simulation?
25. Should distant terrain be represented by a separate far-world protocol rather than normal voxel blocks?

---

# 161. Round-6 Architecture Boundary Verdict

Round 6 strongly supports this separation:

```text
                    LEYFORGE SERVER
                         │
        ┌────────────────┼─────────────────┐
        │                │                 │
   World Authority   Network Authority   Persistence
        │                │                 │
        │          Interest Manager       │
        │          /      |      \         │
        │       entity  voxel   far-world  │
        │         │       │        │       │
        │         ▼       ▼        ▼       │
        │      Godot   custom     custom   │
        │      sync    voxel      proxy    │
        │                │                 │
        └──────────── Zylann ──────────────┘
                         │
                   voxel materialisation
                         │
                 client VoxelTerrain
```

The most important rule is:

> **Zylann manages voxel data movement and materialisation; Leyforge manages multiplayer meaning.**

That means Zylann can remain highly replaceable underneath the protocol boundary.

---

# 162. Round-6 Gate Result

**PASS — CONTINUE DEEP AUDIT**

No multiplayer incompatibility currently disqualifies Zylann.

The fixed-Lod `VoxelTerrain` path provides an explicit server-authoritative client-loading mechanism, and the dedicated terrain multiplayer synchronizer gives us useful integration support.

However, the following remain mandatory before implementation architecture is frozen:

- authoritative block streaming benchmark;
- deterministic client-regeneration benchmark;
- teleport/preload torture;
- multi-viewer scaling;
- packet-loss/reordering convergence;
- late-join/reconnect;
- headless server;
- mass voxel-edit bandwidth;
- generator-contract mismatch;
- server CPU/memory under many clients;
- save + network concurrency.

---

# 163. Updated PRD-02 Round Sequence

1. **Round 1 — Current version/source baseline + core capability surface** — **COMPLETE**
2. **Round 2 — Blocky representation, model/state/palette and Forge-binding deep dive** — **COMPLETE**
3. **Round 3 — Storage, edits, streams, persistence and crash/recovery boundary** — **COMPLETE**
4. **Round 4 — Worldgen, threading, determinism and cross-chunk structure deep dive** — **COMPLETE**
5. **Round 5 — LOD, far-distance blocky rendering, collisions and large coordinates** — **COMPLETE**
6. **Round 6 — Multiplayer, viewers, headless/dedicated server and network data paths** — **COMPLETE**
7. **Round 7 — Navigation, fluids/oceans, moving vessels and specialist integration boundaries** — **NEXT**
8. **Round 8 — Prototype/benchmark obligations, source-code inspection, final capability matrix and PRD-02 closure candidate**

---

# 164. Additional Official Sources Used in Round 6

- Current `VoxelTerrain` API  
  `https://github.com/Zylann/godot_voxel/blob/master/doc/source/api/VoxelTerrain.md`
- Current overview  
  `https://github.com/Zylann/godot_voxel/blob/master/doc/source/overview.md`
- Current scripting documentation  
  `https://github.com/Zylann/godot_voxel/blob/master/doc/source/scripting.md`
- Current generators documentation  
  `https://github.com/Zylann/godot_voxel/blob/master/doc/source/generators.md`
- Current `VoxelGeneratorScript` API  
  `https://github.com/Zylann/godot_voxel/blob/master/doc/source/api/VoxelGeneratorScript.md`
- Current Zylann class registration  
  `https://github.com/Zylann/godot_voxel/blob/master/register_types.cpp`
- Current changelog  
  `https://voxel-tools.readthedocs.io/en/latest/changelog/`
- Current Godot scene replication implementation  
  `https://github.com/godotengine/godot/blob/master/modules/multiplayer/scene_replication_interface.cpp`
- Current multiplayer teleport/preload issue evidence  
  `https://github.com/Zylann/godot_voxel/issues/854`
- Current LOD multiplayer issue evidence  
  `https://github.com/Zylann/godot_voxel/issues/571`

---

**ROUND-6 RESULT: MULTIPLAYER / VIEWERS / HEADLESS SERVER / NETWORK DATA PATH BOUNDARY AUDIT COMPLETE.**

---

# 165. Round-7 Scope

Round 7 audits the boundary between Zylann's voxel terrain runtime and the specialist Leyforge systems that must react to, query, or materialise through voxel space:

- local navigation and dynamic path invalidation;
- mover-specific traversal;
- blocky fluids and local flooding;
- oceans, tides, currents and environmental water fields;
- moving voxel spaces and vessels;
- detached/floating voxel debris;
- farming and local block behaviours;
- ecological presentation;
- structures and construction;
- machines/automation;
- portals and realm infrastructure;
- specialist simulation promotion/demotion;
- loaded/meshed/edit lifecycle hooks.

The central question is:

> **Does Zylann provide enough low-level spatial data, edit notifications and rendering/physics primitives that Leyforge can keep these specialist systems adjacent to the voxel core instead of embedding them inside it?**

Round-7 answer:

> **YES. Zylann supplies several useful primitives and one experimental local blocky pathfinder, but none of the major Leyforge specialist systems should be owned by Zylann itself.**

The strongest emerging boundary is:

```text
Leyforge specialist authority
        │
        ├── queries voxel state
        ├── receives voxel lifecycle/edit evidence
        ├── commits semantic gameplay consequences
        └── requests bounded voxel materialisation
                         │
                         ▼
                   Zylann voxel core
```

---

# 166. Round-7 Official Source Register

| Ref | Official/current source | Principal use |
|---|---|---|
| `ZYL-S45` | `VoxelAStarGrid3D` current generated API | Experimental blocky voxel A* capabilities and limits |
| `ZYL-S46` | `voxel_a_star_grid_3d.cpp` current source | Terrain coupling, cache strategy, async behaviour |
| `ZYL-S47` | Feature-branch tracker #640 | Navigation branch status; floating-chunks WIP |
| `ZYL-S48` | Navigation issue #610 | Upstream/Godot navmesh integration difficulty |
| `ZYL-S49` | `VoxelTerrain` current API | Edit hooks, block/mesh lifecycle, readiness signals |
| `ZYL-S50` | Performance documentation | Edit side effects, moving-terrain physics warning |
| `ZYL-S51` | `VoxelToolTerrain` current API | Metadata iteration and blocky random-tick primitive |
| `ZYL-S52` | Blocky terrain / `VoxelBlockyModelFluid` | Fluid visual levels, flow presentation and simulation boundary |
| `ZYL-S53` | `VoxelToolLodTerrain` API/source | `separate_floating_chunks` behaviour |
| `ZYL-S54` | Instancing documentation | Surface decoration purpose and man-made-structure limitation |
| `ZYL-S55` | `VoxelInstanceLibraryItem` API | Persistent instance transform semantics and numeric-ID caveat |
| `ZYL-S56` | `VoxelBlockyModel` API | `random_tickable`, tags, culling/presentation flags |
| `ZYL-S57` | Current class registration/source | Availability of `VoxelAStarGrid3D`, terrain tools and specialist helpers |
| `ZYL-S58` | Current changelog | Floating-chunk changes, edit/load/save fixes and current feature state |

---

# 167. Navigation — Current Built-In Primitive

Round 1 correctly concluded that Zylann does not provide a **complete Leyforge dynamic navigation system**.

Round 7 adds an important refinement:

> Current Voxel Tools **does** provide an experimental `VoxelAStarGrid3D` class for small-area blocky pathfinding.

This is a useful local primitive, but its documented assumptions are much narrower than Set-30/Leyforge movement requirements.

| ID | Capability | Evidence | Result | Leyforge interpretation |
|---|---|---|---|---|
| `ZYL-CAP-321` | Grid-based A* pathfinding directly over blocky voxel terrain | `ZYL-S45` | `DIRECT / EXPERIMENTAL` | Useful reference/local primitive; no navmesh bake required. |
| `ZYL-CAP-322` | Pathfinder reads voxel terrain directly | `ZYL-S45`, `ZYL-S46` | `DIRECT` | Avoids rebuilding a second static occupancy source for simple agents. |
| `ZYL-CAP-323` | No NavigationMesh is required | `ZYL-S45` | `DIRECT` | Attractive for rapidly edited local blocky terrain. |
| `ZYL-CAP-324` | Current mover assumption is 2 voxels tall × 1 voxel wide | `ZYL-S45` | `HARD CURRENT LIMIT` | Cannot represent Leyforge's heterogeneous bodies/mounts/vehicles directly. |
| `ZYL-CAP-325` | Current movement assumption includes standing on solid blocks and jumping one voxel | `ZYL-S45` | `HARD CURRENT LIMIT` | No ladders, crawling, flying, swimming, ropes, doors, squeezing, mounts or semantic traversal. |
| `ZYL-CAP-326` | Current occupancy rule treats TYPE ID 0 as air and every other TYPE ID as solid | `ZYL-S45`, `ZYL-S46` | `HARD CURRENT LIMIT` | Incompatible as-is with passable plants, fluids, doors, hazards and capability-sensitive movement. |
| `ZYL-CAP-327` | Search is bounded by an explicit voxel region | `ZYL-S45` | `DIRECT` | Useful for local path requests but not world/regional route planning. |
| `ZYL-CAP-328` | Documentation warns ~50-voxel and larger search regions become relatively expensive | `ZYL-S45` | `DIRECT SCALE WARNING` | Rules out using this as Leyforge's global pathfinder. |
| `ZYL-CAP-329` | Synchronous path query is available | `ZYL-S45` | `DIRECT` | Suitable only where search size/budget permits. |
| `ZYL-CAP-330` | Asynchronous path query runs on a separate task/thread | `ZYL-S45`, `ZYL-S46` | `DIRECT` | Valuable experimental reference for local off-thread path queries. |
| `ZYL-CAP-331` | Only one async search may run on one `VoxelAStarGrid3D` instance at a time | `ZYL-S45` | `DIRECT LIMIT` | Dense settlement navigation would require pooling/another architecture. |
| `ZYL-CAP-332` | Current implementation binds to `VoxelTerrain` | `ZYL-S45`, `ZYL-S46` | `DIRECT LIMIT` | Does not provide one universal pathfinder across LOD terrain, vessels and realm providers. |
| `ZYL-CAP-333` | Current source copies/caches local voxel occupancy during a path query | `ZYL-S46` | `DIRECT IMPLEMENTATION FACT` | Good locality idea, but cache invalidation/large-agent semantics remain Leyforge work. |
| `ZYL-CAP-334` | Upstream's generic navmesh feature branch is currently inactive/rough due to Godot navigation integration difficulty | `ZYL-S47`, `ZYL-S48` | `RISK / NOT PRODUCTION FEATURE` | Do not plan Leyforge architecture around an upstream generic navmesh solution appearing later. |

## 167.1 Navigation verdict

`VoxelAStarGrid3D` should be treated as:

- an experimental local reference;
- a useful prototype for simple villagers/creatures in a bounded test;
- evidence that direct voxel path queries can be practical at small scale.

It should **not** become the Set-30 navigation authority.

Leyforge still requires:

```text
regional route graph
      ↓
local navigation
      ↓
mover capability / body profile
      ↓
doors / ladders / ropes / lifts / mounts
      ↓
reservations / crowds / deadlock
      ↓
authoritative movement execution
```

The most likely architecture remains hierarchical and mover-aware, with voxel occupancy as one input.

---

# 168. Edit and Terrain-Lifecycle Hooks for Navigation / Specialist Systems

Current `VoxelTerrain` provides several useful lifecycle signals and virtual hooks.

| ID | Capability | Evidence | Result | Leyforge interpretation |
|---|---|---|---|---|
| `ZYL-CAP-335` | `block_loaded` signal identifies data-block arrival | `ZYL-S49` | `DIRECT` | Useful promotion/materialisation hook; data may arrive before mesh/collision. |
| `ZYL-CAP-336` | `block_unloaded` signal identifies streamed data departure | `ZYL-S49` | `DIRECT` | Useful cache/detailed-representation teardown hook. |
| `ZYL-CAP-337` | `mesh_block_entered` reports first processed mesh update in viewer range | `ZYL-S49` | `DIRECT` | Useful visual/readiness event. |
| `ZYL-CAP-338` | `mesh_block_exited` reports mesh-block removal | `ZYL-S49` | `DIRECT` | Useful presentation/local-navigation teardown input. |
| `ZYL-CAP-339` | `is_area_meshed()` can query whether an area has completed mesh processing | `ZYL-S49` | `DIRECT` | Useful readiness primitive for spawn/teleport/construction tests. |
| `ZYL-CAP-340` | `area_edit_notification_enabled` and virtual `_on_area_edited()` exist | `ZYL-S49` | `EXTENSION / UNDERDOCUMENTED` | Promising event bridge for nav/structure/fluid invalidation; exact edition/thread semantics require source/prototype confirmation. |
| `ZYL-CAP-341` | Terrain internal edit processing already knows changed blocks and schedules remesh/network/instancer consequences | `ZYL-S50` | `DIRECT INTERNAL FACT` | Confirms changed-area aggregation exists; public external integration must still be validated. |
| `ZYL-CAP-342` | Bulk voxel edits reduce repeated per-voxel notification/remesh overhead | `ZYL-S50` | `DIRECT` | Specialist systems should emit bounded change regions rather than thousands of independent edits. |

## 168.1 Important boundary

A voxel edit should ideally produce one reusable semantic/spatial change envelope such as:

```text
EditedArea
  bounds
  changed channels
  world revision
  cause / transaction
       │
       ├── terrain remesh
       ├── persistence dirtying
       ├── nav invalidation
       ├── structure integrity
       ├── fluid activation
       ├── ecology/habitat update
       └── network interest/update
```

Zylann already handles several internal consequences.

The **cross-system Leyforge envelope** remains external.

---

# 169. Fluids — What the Blocky Runtime Actually Provides

Zylann's blocky fluid model is more capable as presentation than a normal static block, but the official documentation is unambiguous:

> **It does not simulate fluid behaviour.**

| ID | Capability | Evidence | Result | Leyforge interpretation |
|---|---|---|---|---|
| `ZYL-CAP-343` | `VoxelBlockyModelFluid` represents a discrete fluid level | `ZYL-S52` | `DIRECT PRESENTATION` | Suitable candidate visual projection of Leyforge local fluid cells. |
| `ZYL-CAP-344` | Up to 256 fluid levels are supported by the fluid model API | `ZYL-S52` | `DIRECT HARD LIMIT` | Far more than likely needed; practical simulation should use much fewer states unless evidence demands otherwise. |
| `ZYL-CAP-345` | Fluid top corners adapt to neighboring levels of the same fluid | `ZYL-S52` | `DIRECT MESHING` | Gives sloped blocky liquid surfaces without pre-baking every neighbor combination. |
| `ZYL-CAP-346` | Mesher encodes flow direction/state into UV data for shaders | `ZYL-S52` | `DIRECT PRESENTATION` | Leyforge can visually express authoritative local flow. |
| `ZYL-CAP-347` | Fluid meshing is procedural to avoid combinatorial precomputed model explosion | `ZYL-S52` | `DIRECT ARCHITECTURE FACT` | Strong pattern for specialist states whose neighbor combinations explode. |
| `ZYL-CAP-348` | Fluid models themselves perform no volume transfer/flow simulation | `ZYL-S52` | `NOT-PROVIDED SIMULATION` | Local water conservation/flow remains Leyforge-owned. |
| `ZYL-CAP-349` | Current fluid rendering has known top-normal/backface/transparency limitations | `ZYL-S52` | `PARTIAL PRESENTATION` | Art/visibility testing required for water viewed from above/below/inside. |
| `ZYL-CAP-350` | Voxel edits can materialise changed fluid-level TYPE handles in loaded terrain | `ZYL-S49`, `ZYL-S50`, `ZYL-S52` | `DIRECT PRIMITIVE` | A Leyforge fluid solver can drive Zylann local visuals if bounded edit cost is acceptable. |
| `ZYL-CAP-351` | Ordinary `VoxelTool` edits cannot operate beyond loaded streaming borders | existing scripting evidence | `LIMIT` | Fluid simulation crossing inactive/unloaded boundaries needs summary/boundary state outside local voxel edits. |

---

# 170. Oceans / Hydrology Boundary

No current Zylann subsystem was found that owns:

- ocean basin identity;
- tides;
- regional currents;
- waves as physical environmental fields;
- salinity;
- temperature layers;
- storms;
- hydrological routing;
- pressure/depth environment;
- vessel displacement;
- conserved flooding;
- pump/pipe networks.

Therefore:

| ID | Capability | Evidence | Result | Leyforge interpretation |
|---|---|---|---|---|
| `ZYL-CAP-352` | Ocean-scale current/tide/wave simulation | current upstream surface | `NOT-PROVIDED` | Set-26/LFE environmental-field system remains Leyforge-owned. |
| `ZYL-CAP-353` | Conserved local flooding/breach/tank/pump simulation | current upstream surface | `NOT-PROVIDED` | Requires bounded Leyforge local fluid cells/network transactions. |
| `ZYL-CAP-354` | Fluid boundary exchange between loaded local cells and unloaded regional summary | current upstream surface | `NOT-PROVIDED` | Critical specialist LOD architecture problem. |
| `ZYL-CAP-355` | Continuous ocean visual surface independent of block-cell liquid presentation | current upstream surface | `NOT-PROVIDED as dedicated system` | Adjacent Godot/custom renderer may be preferable for large oceans. |

## 170.1 Leading hybrid hypothesis

Round 7 strengthens the Set-26 hybrid-water model:

```text
REGIONAL WATER BODY
  sea level / tide / current / storm / temperature
                    │
                    ▼
       active local interaction window
                    │
       ┌────────────┴────────────┐
       │                         │
  local voxel fluid         vessel flooding
  cells / channels          compartments/tanks
       │                         │
       └────────────┬────────────┘
                    ▼
        Zylann visual materialisation
              where appropriate
```

This keeps an ocean from becoming billions of permanently ticking water voxels.

---

# 171. Moving Terrain / Vessel Boundary

The current upstream physics guidance remains explicit:

> moving a terrain node is possible, but physics should not be expected to behave correctly on its surface while moving.

That disqualifies the easy vessel shortcut.

| ID | Capability | Evidence | Result | Leyforge interpretation |
|---|---|---|---|---|
| `ZYL-CAP-356` | A voxel terrain node can technically have a transform/move | `ZYL-S50` | `MECHANICALLY POSSIBLE` | Not sufficient for gameplay-quality moving vessels. |
| `ZYL-CAP-357` | Physics on a moving terrain surface is documented as unreliable | `ZYL-S50` | `UNSUITABLE-AS-IS` | Reaffirms rejection of "commission ship by moving VoxelTerrain". |
| `ZYL-CAP-358` | Terrain physics/collision generation is designed primarily around static chunk colliders | `ZYL-S50` | `DIRECT ARCHITECTURE FACT` | Moving-vessel collision needs a different representation. |
| `ZYL-CAP-359` | No stable vessel-local frame/occupant/cargo authority exists in Zylann | current upstream surface | `NOT-PROVIDED` | Set-26/LFE spatial-frame system remains Leyforge-owned. |
| `ZYL-CAP-360` | No hull buoyancy/hydrodynamics/trim/list system exists in Zylann | current upstream surface | `NOT-PROVIDED` | Maritime physics prototype remains mandatory. |
| `ZYL-CAP-361` | No static-construction→commissioned-vessel atomic conversion is provided | current upstream surface | `NOT-PROVIDED` | Must use Leyforge transaction/persistence/identity architecture. |
| `ZYL-CAP-362` | No persistent editable moving voxel-grid save/network protocol is provided | current upstream surface | `NOT-PROVIDED` | Vessel grid remains a separate specialist voxel consumer. |

---

# 172. `separate_floating_chunks` — Useful, but Not the Ship System

Current `VoxelToolLodTerrain` contains a fascinating helper: `separate_floating_chunks()`.

It detects disconnected voxel islands in a bounded box, removes them from the source terrain and converts them into `RigidBody3D` objects with convex collision.

| ID | Capability | Evidence | Result | Leyforge interpretation |
|---|---|---|---|---|
| `ZYL-CAP-363` | Floating voxel islands can be detected in a bounded area | `ZYL-S53` | `DIRECT / SPECIALISED` | Potential debris/collapse prototype primitive. |
| `ZYL-CAP-364` | Detected islands are removed from terrain and converted to rigid bodies | `ZYL-S53` | `DIRECT` | Demonstrates voxel→physics-object conversion path. |
| `ZYL-CAP-365` | Output uses convex collision shapes | `ZYL-S53` | `DIRECT` | Suitable for debris, not arbitrary exact vessel hull collision. |
| `ZYL-CAP-366` | Detached bodies initially use kinematic staging before becoming rigid | `ZYL-S53` | `DIRECT` | Avoids overlap while source terrain collision updates. |
| `ZYL-CAP-367` | Only islands entirely contained in the supplied search box are detached | `ZYL-S53` | `DIRECT BOUNDARY` | Function is deliberately local/bounded. |
| `ZYL-CAP-368` | Current implemented public helper is on `VoxelToolLodTerrain` | `ZYL-S53` | `DIRECT CURRENT LIMIT` | Not directly aligned with Leyforge's fixed-LOD blocky baseline. |
| `ZYL-CAP-369` | Upstream tracker lists making floating chunks available to `VoxelTerrain`, blocky voxels and customizable handling as WIP | `ZYL-S47` | `EXPERIMENTAL/WIP` | Do not build vessel architecture on the future branch. |
| `ZYL-CAP-370` | Floating-chunk conversion does not preserve Leyforge vessel identity, interiors, machinery, cargo or editable local grid semantics | `ZYL-S53` + Leyforge requirements | `NOT SUFFICIENT` | Could inform rubble/fracture systems, not vessel commissioning. |

### 172.1 Potential reuse

`separate_floating_chunks` is worth prototyping for:

- cave-in debris;
- destroyed wall fragments;
- terrain collapse presentation;
- magical fragmentation;
- temporary rubble.

It is **not** a shortcut for ships.

---

# 173. Farming / Local Block Behaviour Boundary

Zylann has two useful local primitives:

- block-model `random_tickable` + tag masks;
- sparse per-voxel metadata iteration.

| ID | Capability | Evidence | Result | Leyforge interpretation |
|---|---|---|---|---|
| `ZYL-CAP-371` | Block models can opt into random-tick sampling | `ZYL-S51`, `ZYL-S56` | `DIRECT PRIMITIVE` | May assist local cosmetic/simple block processes. |
| `ZYL-CAP-372` | Random ticks can be filtered with model tag masks | `ZYL-S51`, `ZYL-S56` | `DIRECT` | Fast local classification primitive. |
| `ZYL-CAP-373` | Random-tick sampling is batched by terrain blocks | `ZYL-S51` | `DIRECT` | Shows locality optimisation but introduces statistical sampling semantics. |
| `ZYL-CAP-374` | Sparse voxel metadata can be iterated over a bounded area | `ZYL-S51` | `DIRECT` | Useful for exceptional voxel-local records/debugging. |
| `ZYL-CAP-375` | Random ticks do not preserve Leyforge's distant crop/automation/ecology schedules by themselves | capability comparison | `NOT SUFFICIENT` | Agriculture/decay/machines remain specialist simulation. |
| `ZYL-CAP-376` | Random-tick callbacks occur only over the supplied/available terrain area | `ZYL-S51` | `LOCAL REPRESENTATION` | Cannot be the authoritative mechanism for unloaded settlements/regions. |

### 173.1 Farming verdict

A crop's voxel TYPE may efficiently represent:

```text
crop species + visible growth geometry
```

while actual growth ownership remains:

```text
Agriculture / biology / environment state
        ↓
scheduled deterministic progression
        ↓
visible growth stage changes
        ↓
Zylann TYPE projection
```

This prevents crop progress from depending on whether the player happened to keep a chunk loaded.

---

# 174. Ecology / Instancing Boundary

The current Zylann instancer is explicitly designed primarily for natural surface spawning such as grass, rocks and trees.

It is not intended to become civilisation or rich persistent ecology.

| ID | Capability | Evidence | Result | Leyforge interpretation |
|---|---|---|---|---|
| `ZYL-CAP-377` | Surface `MultiMesh` instancing supports extremely numerous decoration objects | `ZYL-S54` | `DIRECT` | Strong candidate for grass/rocks/decorative vegetation. |
| `ZYL-CAP-378` | Scene instances are supported but substantially slower | `ZYL-S54` | `DIRECT` | Use only for bounded special surface objects. |
| `ZYL-CAP-379` | Instancer is primarily aimed at natural semi-random surface spawning | `ZYL-S54` | `DIRECT SCOPE` | Fits presentation/ecology decoration, not population truth. |
| `ZYL-CAP-380` | Documentation explicitly says instancer is not suited to complex houses/villages | `ZYL-S54` | `DIRECT BOUNDARY` | Settlements/structures must remain Leyforge-owned. |
| `ZYL-CAP-381` | Instancer persistent mode saves modified item transforms where supported | `ZYL-S55` | `PARTIAL` | Useful decoration persistence, not rich creature/tree/structure identity. |
| `ZYL-CAP-382` | Persistent instancer item identity relies on numerical library IDs | `ZYL-S55` | `MIGRATION RISK` | Cannot be canonical Leyforge stable identity. |
| `ZYL-CAP-383` | Instancer state does not provide ecology populations, migration, reproduction, trophic relationships or named organisms | capability comparison | `NOT-PROVIDED` | Ecology remains Leyforge-owned; instancer may render derived vegetation/ambient populations. |

### 174.1 Good ecology use

Potentially:

```text
Leyforge habitat/ecology state
        ↓
presentation density / species eligibility
        ↓
VoxelInstancer
        ↓
grass / bushes / rocks / ambient vegetation
```

Not:

```text
VoxelInstancer count
        =
authoritative ecosystem population
```

---

# 175. Structures / Construction Boundary

Round 4 already established the likely large-feature architecture:

```text
Feature Intent / Blueprint
        ↓
intersecting chunk query
        ↓
local deterministic rasterisation
        ↓
Zylann voxels
```

Round 7 adds specialist runtime integration.

| ID | Capability | Evidence | Result | Leyforge interpretation |
|---|---|---|---|---|
| `ZYL-CAP-384` | Bulk copy/paste/edit operations can efficiently materialise structure voxel changes | existing scripting/performance evidence | `DIRECT PRIMITIVE` | Strong construction/repair materialisation path. |
| `ZYL-CAP-385` | Terrain edit processing remeshes/collides affected blocks and informs related terrain systems | `ZYL-S50` | `DIRECT INTERNAL SUPPORT` | Good low-level reaction to construction/destruction. |
| `ZYL-CAP-386` | Zylann does not own Blueprint/StructureInstance identity | capability comparison | `NOT-PROVIDED` | Persistent structure identity remains Set-24/22/LFE-owned. |
| `ZYL-CAP-387` | Zylann does not own project phases, material reservations, workers or construction evidence | capability comparison | `NOT-PROVIDED` | Construction system remains Leyforge-owned. |
| `ZYL-CAP-388` | Complex settlements/man-made structures are explicitly outside instancer's intended scope | `ZYL-S54` | `DIRECT BOUNDARY` | Prevents tempting "settlement = instanced scenes" shortcut. |
| `ZYL-CAP-389` | Mesh/readiness events can gate activation after physical materialisation | `ZYL-S49` | `DIRECT PRIMITIVE` | Useful for buildings/sites becoming locally usable only when physical representation is ready. |

---

# 176. Machines / Automation / Block-Entity Boundary

A voxel model can represent the physical shell of a machine, conduit, pipe, rune component or control block.

Zylann does not provide the authoritative functional network.

| ID | Capability | Evidence | Result | Leyforge interpretation |
|---|---|---|---|---|
| `ZYL-CAP-390` | Block models can encode geometry, collision, tags and compact visual state | blocky APIs | `DIRECT` | Good physical projection for machine parts. |
| `ZYL-CAP-391` | Sparse per-voxel metadata exists for exceptional local data | `ZYL-S51` | `DIRECT PRIMITIVE` | May store lightweight references/flags if benchmarks approve. |
| `ZYL-CAP-392` | No authoritative BlockEntity/machine-job framework is provided | current upstream surface | `NOT-PROVIDED` | Machines require Leyforge stable records/services. |
| `ZYL-CAP-393` | No logistics/power/mana/control graph is provided | current upstream surface | `NOT-PROVIDED` | Set-20/automation/magic systems remain external. |
| `ZYL-CAP-394` | No inventory/resource reservation/transaction system is provided | current upstream surface | `NOT-PROVIDED` | Voxel state cannot own production conservation. |
| `ZYL-CAP-395` | Machine visual state may be projected into a compact model/state handle without owning machine truth | Round-2 binding model | `STRONG EXTENSION FIT` | Enables visual on/off/open/damaged variants from specialist state. |

---

# 177. Portals / Realm Infrastructure Boundary

Zylann can render and edit portal-frame voxels but provides none of the FCC portal semantics.

| ID | Capability | Evidence | Result | Leyforge interpretation |
|---|---|---|---|---|
| `ZYL-CAP-396` | Portal frames/anchors may be represented by normal/specialist block models | blocky APIs | `DIRECT PRESENTATION/PHYSICAL` | Suitable physical projection. |
| `ZYL-CAP-397` | No portal-family identity/access/certification/arrival/recovery system is provided | capability comparison | `NOT-PROVIDED` | FCC-13D/14C contracts remain Leyforge Realm Access authority. |
| `ZYL-CAP-398` | Terrain readiness signals can participate in safe arrival/preload gating | `ZYL-S49` | `EXTENSION` | Useful after realm-transfer authority determines destination. |
| `ZYL-CAP-399` | Realm-specific environmental/support laws are not provided by voxel core | capability comparison | `NOT-PROVIDED` | Voxel layer consumes resulting materialisation/presentation only. |

---

# 178. Specialist Promotion / Demotion Boundary

Zylann's loaded/unloaded/meshed events describe **terrain representation lifecycle**.

They do not decide simulation fidelity.

| ID | Capability | Evidence | Result | Leyforge interpretation |
|---|---|---|---|---|
| `ZYL-CAP-400` | Data-block load/unload state is observable | `ZYL-S49` | `DIRECT` | Can trigger local representation setup/teardown. |
| `ZYL-CAP-401` | Mesh-block enter/exit state is observable | `ZYL-S49` | `DIRECT` | Can trigger presentation/physics readiness transitions. |
| `ZYL-CAP-402` | Terrain representation lifecycle is viewer-driven | `ZYL-S49` + prior viewer evidence | `DIRECT` | Must not become the sole cause of civilisation/ecology/economy simulation LOD. |
| `ZYL-CAP-403` | No cross-domain promotion/demotion coordinator exists in Zylann | capability comparison | `NOT-PROVIDED` | Global simulation authority remains Leyforge-owned. |
| `ZYL-CAP-404` | Specialist systems may use terrain lifecycle as evidence after the global simulation decision | boundary synthesis | `EXTENSION` | Example: materialise a local NPC scene after regional person state is promoted and terrain is ready. |

---

# 179. Round-7 Specialist-System Mapping

| Leyforge specialist | Zylann direct role | Zylann must **not** own |
|---|---|---|
| Movement/navigation | voxel occupancy, raycast, experimental local A* | mover profiles, route truth, traversal capability, reservations, arrival |
| Fluids | visual levels, local voxel materialisation | conservation, flow, pumps, pressure, ocean fields |
| Oceans | terrain coast/seabed geometry | tides, currents, storms, water-body identity |
| Vessels | possible voxel-source data/debris helpers | local frame, buoyancy, cargo, crew, commissioning |
| Farming | block growth presentation, optional local tick sampling | crop schedule, resources, distant growth |
| Ecology | vegetation/rock instancing | populations, migration, reproduction, habitat truth |
| Structures | bulk voxel materialisation | StructureInstance, Blueprint, project/work/material truth |
| Machines | physical block/model representation | jobs, inventory, automation graph, power/control |
| Portals | frame geometry and local arrival terrain | portal family/access/transition/recovery |
| Simulation LOD | terrain representation lifecycle events | world simulation fidelity authority |

This table is one of the clearest PRD-02 boundaries found so far:

> **Zylann owns voxel representation; Leyforge owns semantic systems operating through that representation.**

---

# 180. Corrections / Refinements to Earlier PRD-02 Findings

## 180.1 `ZYL-CAP-089` — navigation

Earlier wording said a "complete dynamic voxel navigation/pathfinding subsystem" was not provided.

That remains correct.

Round 7 now records `VoxelAStarGrid3D` as a **real experimental local blocky A*** primitive. The earlier row should be interpreted as:

> no complete Leyforge-scale navigation stack exists.

It should **not** be interpreted as:

> Zylann contains no pathfinding code.

## 180.2 `ZYL-CAP-090` — edit notifications

Earlier classification as an extension hook is strengthened.

Current `VoxelTerrain` exposes:

- area edit notification configuration;
- `_on_area_edited`;
- block load/unload;
- mesh enter/exit;
- `is_area_meshed()`.

Exact callback semantics under Module vs GDExtension and bulk edits remain P3 items.

## 180.3 `ZYL-CAP-093` — moving voxel volume

The existence of `separate_floating_chunks()` does not change the vessel verdict.

Detached voxel rubble converted into convex rigid bodies is a different problem from a persistent editable ship with local coordinates, interior systems, cargo, crew and buoyancy.

---

# 181. Round-7 Risk Register

| Risk | Level | Reason |
|---|---|---|
| `ZYL-R07-01` Experimental A* mistaken for final navigation | RED | Current mover/occupancy/search assumptions are far narrower than Leyforge. |
| `ZYL-R07-02` Navmesh upstream dependency | RED | Generic nav branch is inactive/rough; Godot integration remains difficult. |
| `ZYL-R07-03` Edit invalidation storm | AMBER | Every voxel change can drive remesh/network/instancer + Leyforge specialist invalidations. |
| `ZYL-R07-04` Fluid visual state mistaken for conserved fluid truth | RED | Official docs explicitly leave behaviour to the game. |
| `ZYL-R07-05` Ocean represented as active voxel-fluid simulation everywhere | RED | Violates bounded simulation architecture. |
| `ZYL-R07-06` Moving `VoxelTerrain` used as ship | RED | Documented physics limitation. |
| `ZYL-R07-07` Floating debris helper promoted into vessel system | RED | Identity/physics/persistence semantics do not match. |
| `ZYL-R07-08` Random ticks become gameplay clock | RED | Loaded/local sampling cannot preserve distant causal simulation. |
| `ZYL-R07-09` Instancer becomes ecology population truth | RED | Instancer is a surface presentation/spawning tool. |
| `ZYL-R07-10` Instancer used for persistent settlements | RED | Upstream explicitly says it is unsuitable for complex houses/villages. |
| `ZYL-R07-11` Sparse metadata becomes universal BlockEntity database | AMBER/RED | Scale/migration/network costs remain unproved. |
| `ZYL-R07-12` Specialist systems each subscribe independently to raw voxel edits | AMBER | Can multiply work; one Leyforge spatial-change envelope may be required. |
| `ZYL-R07-13` Terrain streaming controls simulation LOD | RED | Viewer residency is representation, not authoritative simulation policy. |

---

# 182. Prototype Obligations Added / Refined by Round 7

## `ZP-NAV-01 — Experimental Voxel A* Baseline`

Test current `VoxelAStarGrid3D` on blocky terrain.

Measure:

- 10 / 25 / 50 / 75 voxel search regions;
- synchronous vs asynchronous latency;
- visited-cell count;
- concurrent-agent scaling using multiple instances;
- response to live voxel edits.

Purpose:

- establish whether it is useful as a local/simple-agent primitive or only reference code.

## `ZP-NAV-02 — Mover-Aware Navigation Adapter`

Extend a prototype around voxel occupancy with:

- passable nonzero voxels;
- semantic collision masks;
- variable height/width;
- doors;
- ladders;
- one simple crawl/climb capability.

Compare:

- adapting Zylann A*;
- Godot nav regions;
- custom hierarchical cell/portal graph.

## `ZP-NAV-03 — Dynamic Edit Invalidation`

Connect bounded voxel edit events to local navigation data.

Test:

```text
dig doorway
build wall
remove bridge
open/close gate
place ladder
collapse tunnel
```

Success:

- no global nav rebuild;
- stale paths are detected;
- affected movers replan;
- unrelated regions remain untouched.

## `ZP-FLUID-01 — Conserved Local Fluid Cells`

Implement bounded local fluid state above Zylann.

Must prove:

- volume conservation;
- cross-chunk transfer;
- activate/deactivate;
- unloaded-boundary summary;
- no infinite-source behaviour unless explicitly configured;
- Zylann visual levels follow authoritative state.

## `ZP-FLUID-02 — Ocean / Local-Water Boundary`

Prototype:

```text
regional sea level + tide/current
              ↓
shore / vessel interaction zone
              ↓
bounded local cells
```

Measure activation seams, shoreline updates and CPU budget.

## `ZP-FLUID-03 — Fluid Presentation Torture`

Test `VoxelBlockyModelFluid` from:

- above;
- underwater;
- cave edge;
- glass tank;
- waterfall;
- adjacent transparent blocks;
- multiple levels/flows.

Determine whether stock rendering is acceptable or custom water presentation is needed.

## `ZP-VES-01 — Static Construction → Vessel Commissioning`

Do **not** move `VoxelTerrain`.

Prototype:

1. build a static blocky hull;
2. identify owned hull cells;
3. validate/scan;
4. atomically extract/copy into vessel-local voxel storage;
5. leave one authoritative representation;
6. preserve block/model semantic IDs.

Success requires zero duplication/loss.

## `ZP-VES-02 — Moving Local Frame`

Prototype an independent moving voxel vessel with:

- character standing/walking aboard;
- cargo;
- one machine;
- block edits;
- save/load;
- world collision.

The purpose is to prove the non-terrain moving-frame boundary.

## `ZP-VES-03 — Floating Debris Comparison`

Evaluate `separate_floating_chunks()` only as rubble/debris evidence.

Test:

- cave wall fragment;
- destroyed structure fragment;
- performance under repeated debris creation;
- cleanup/despawn;
- collision correctness.

Do not add vessel requirements to this prototype.

## `ZP-INT-01 — Specialist Change Envelope`

Create one Leyforge `SpatialChangeSet` prototype emitted after an authoritative voxel transaction.

Consumers:

- navigation;
- structure integrity;
- local fluid;
- ecology/habitat;
- network;
- diagnostics.

Measure whether one aggregated change record prevents redundant rescans.

## `ZP-INT-02 — Random Tick Scope`

Use the upstream blocky random-tick API for a deliberately non-authoritative local effect.

Compare behaviour across:

- frame rate;
- viewer movement;
- unload/reload;
- different batch sizes.

Goal:

- define exactly what kinds of effects may safely use random ticks.

## `ZP-INT-03 — Ecology Presentation Instancing`

Feed a Leyforge-owned habitat/population summary into `VoxelInstancer`.

Prove:

- visual density can change;
- authoritative population remains unchanged by rendering unload/reload;
- destroyed terrain removes invalid instances;
- persistent special vegetation does not rely solely on instancer numeric IDs.

## `ZP-INT-04 — Structure / Machine Materialisation`

Create:

- one multi-cell machine;
- one small building;
- one damaged/repaired structure.

Prove:

- external stable object identity;
- voxel parts can unload/reload;
- machine/project state remains authoritative;
- bulk voxel changes trigger bounded downstream invalidation.

---

# 183. Round-7 Resolved / Narrowed Questions

## Navigation

The previous question "Does Zylann expose any usable voxel-native pathfinding?" is now resolved:

> **Yes, experimentally and locally through `VoxelAStarGrid3D`.**

The production navigation question remains open because the current primitive is limited to simple block occupancy, small regions and one basic mover profile.

## Fluids

The visual boundary is now strong:

> `VoxelBlockyModelFluid` can render discrete local fluid state and shader flow direction, but **all authoritative fluid behaviour remains external**.

## Moving vessels

The easy shortcut remains rejected.

The presence of floating-chunk extraction does not provide vessel-local voxel authority.

## Specialist systems

No source evidence was found requiring farming, ecology, structures, machines, portals or simulation LOD to be embedded in Zylann.

The existing APIs instead support an adjacent-system model.

---

# 184. Round-7 New Unknowns

1. Is `VoxelAStarGrid3D` present and equally usable in the exact Module and GDExtension builds selected for Leyforge?
2. Can its solid/air rule be extended through public API, or would mover-aware occupancy require custom/forked code?
3. Does its cached voxel copy remain coherent if terrain is edited during an asynchronous search?
4. How many simultaneous A* instances can run before the shared voxel/task system becomes a bottleneck?
5. Can its internal cache strategy be reused for a custom mover-aware local pathfinder without depending on experimental class ABI?
6. Does `_on_area_edited` fire once per bulk edit or under what exact aggregation semantics?
7. Is `_on_area_edited` overridable cleanly in GDExtension builds?
8. What changed-channel information, if any, is available without rereading the edited area?
9. Does `is_area_meshed()` reliably imply collision readiness for the specific physics path Leyforge chooses?
10. What explicit event indicates collision commit if mesh readiness is insufficient?
11. How many local fluid cells may update per tick before voxel remesh/collision costs dominate?
12. Should local water state be stored directly as TYPE levels, an external cell grid projected into TYPE, or both?
13. How should local water cross an unloaded terrain boundary without keeping the neighboring chunk active?
14. What visual approach should represent deep/open ocean where blocky fluid geometry is wasteful?
15. Can regional wave/current fields affect local blocky water and vessels without requiring water-voxel updates every frame?
16. What vessel-local voxel storage implementation best reuses Zylann data structures without making a moving `VoxelTerrain`?
17. Can `VoxelBuffer`/block mesher be reused directly for a custom moving vessel renderer?
18. Can vessel-local mesh/collision updates be generated independently of terrain streaming?
19. How should vessel blocks map to world-space raycast/interaction queries while the vessel moves?
20. Can floating-chunk extraction be ported/usefully adapted to fixed-LOD blocky terrain without taking on unstable upstream branch dependencies?
21. Which block behaviours, if any, are safe to implement with random ticking?
22. What exact distinction separates decorative instanced vegetation from persistent harvestable/biological plants?
23. How should destruction of terrain invalidate instanced presentation while preserving ecology truth?
24. Should multi-cell machine part references be stored as sparse voxel metadata or resolved from an external spatial index?
25. What single spatial-change envelope is sufficient for navigation, fluid, structure, ecology and network consumers without being too expensive?
26. Should specialist systems consume changes synchronously on commit or through queued/revisioned downstream jobs?
27. How are repeated nearby edits coalesced before expensive specialist recalculation?
28. What representation owns "physics-ready" area status independently from "mesh-ready" status?
29. Which specialist systems must remain active when their voxels are unloaded, and what summaries are required?
30. What specialist integration hooks are missing enough to justify a Zylann fork instead of a Leyforge wrapper?

---

# 185. Round-7 Architecture Boundary Verdict

Round 7 produces the strongest full-stack boundary yet:

```text
                    LEYFORGE
                       │
       ┌───────────────┼────────────────┐
       │               │                │
  Specialist Truth   Spatial Change   Simulation LOD
       │               │                │
 nav / fluid /       revisioned         │
 ecology /           affected area      │
 structures /            │              │
 machines /              ▼              │
 vessels             local jobs         │
       │               │                │
       └───────────────┼────────────────┘
                       │
                       ▼
                 ZYLANN VOXEL CORE
                       │
            storage / mesh / edits
           collision / raycast / I/O
              block lifecycle hooks
                       │
                       ▼
                Godot presentation
```

The key conclusion is:

> **Zylann should be treated as a high-performance spatial substrate, not as Leyforge's world-simulation framework.**

This is positive.

It means specialist complexity can grow without requiring every gameplay rule to enter the voxel plugin.

---

# 186. Fork / Wrapper Implication After Round 7

Round 7 finds **no specialist-system reason by itself to fork Zylann immediately**.

A thin Leyforge integration layer appears plausible for:

- semantic palette binding;
- spatial edit/change envelopes;
- local voxel queries;
- terrain lifecycle observation;
- persistence adapter;
- specialist materialisation.

A fork becomes justified only if later evidence shows a required low-level capability cannot be implemented efficiently or safely through public APIs, for example:

- edit notifications lack required information/edition support;
- custom block streaming/batching is insufficient;
- blocky far LOD requires voxel-core changes;
- vessel-local meshing needs internal-only APIs;
- headless/network paths require fixes;
- mover-aware voxel path primitives warrant upstream-level modification.

This decision remains PRD-04/06/07 territory.

---

# 187. Round-7 Gate Result

**PASS — CONTINUE TO FINAL PRD-02 RECONCILIATION**

Round 7 finds no specialist-integration incompatibility that disqualifies Zylann.

Important positive findings:

- current blocky voxel A* exists as a useful experimental local primitive;
- terrain lifecycle/readiness/edit hooks exist;
- blocky fluid presentation is directly usable as a projection target;
- bulk voxel edits remain suitable for structures/repair;
- instancing is useful for derived natural presentation;
- floating-chunk extraction provides interesting debris evidence.

Important non-Zylann ownership confirmed:

- complete movement/navigation;
- fluid conservation;
- oceans/hydrology;
- moving vessel frames;
- ecology populations;
- farming schedules;
- structure/project identity;
- automation/machine truth;
- portal/realm truth;
- cross-domain simulation LOD.

No hidden "specialist system inside the voxel plugin" dependency has emerged.

---

# 188. Updated PRD-02 Round Sequence

1. **Round 1 — Current version/source baseline + core capability surface** — **COMPLETE**
2. **Round 2 — Blocky representation, model/state/palette and Forge-binding deep dive** — **COMPLETE**
3. **Round 3 — Storage, edits, streams, persistence and crash/recovery boundary** — **COMPLETE**
4. **Round 4 — Worldgen, threading, determinism and cross-chunk structure deep dive** — **COMPLETE**
5. **Round 5 — LOD, far-distance blocky rendering, collisions and large coordinates** — **COMPLETE**
6. **Round 6 — Multiplayer, viewers, headless/dedicated server and network data paths** — **COMPLETE**
7. **Round 7 — Navigation, fluids/oceans, moving vessels and specialist integration boundaries** — **COMPLETE**
8. **Round 8 — Prototype/benchmark obligations, source-code inspection, final capability matrix and PRD-02 closure candidate** — **NEXT**

---

# 189. Additional Official / Current Sources Used in Round 7

- `VoxelAStarGrid3D` current API  
  `https://voxel-tools.readthedocs.io/en/latest/api/VoxelAStarGrid3D/`
- Current `VoxelAStarGrid3D` implementation  
  `https://github.com/Zylann/godot_voxel/blob/master/terrain/voxel_a_star_grid_3d.cpp`
- Current class registration  
  `https://github.com/Zylann/godot_voxel/blob/master/register_types.cpp`
- Feature-branch tracker  
  `https://github.com/Zylann/godot_voxel/issues/640`
- Navigation issue evidence  
  `https://github.com/Zylann/godot_voxel/issues/610`
- Current `VoxelTerrain` API  
  `https://voxel-tools.readthedocs.io/en/latest/api/VoxelTerrain/`
- Current performance documentation  
  `https://github.com/Zylann/godot_voxel/blob/master/doc/source/performance.md`
- Current `VoxelToolTerrain` API  
  `https://voxel-tools.readthedocs.io/en/latest/api/VoxelToolTerrain/`
- Current blocky-fluid documentation  
  `https://github.com/Zylann/godot_voxel/blob/master/doc/source/blocky_terrain.md`
- Current `VoxelBlockyModelFluid` API  
  `https://github.com/Zylann/godot_voxel/blob/master/doc/source/api/VoxelBlockyModelFluid.md`
- Current `VoxelToolLodTerrain` API/source  
  `https://voxel-tools.readthedocs.io/en/latest/api/VoxelToolLodTerrain/`  
  `https://github.com/Zylann/godot_voxel/blob/master/edition/voxel_tool_lod_terrain.cpp`
- Instancing documentation  
  `https://voxel-tools.readthedocs.io/en/latest/instancing/`
- `VoxelInstanceLibraryItem` current API  
  `https://voxel-tools.readthedocs.io/en/latest/api/VoxelInstanceLibraryItem/`
- Current changelog  
  `https://voxel-tools.readthedocs.io/en/latest/changelog/`

---

**ROUND-7 RESULT: NAVIGATION / FLUIDS / OCEANS / MOVING VESSELS / SPECIALIST-INTEGRATION BOUNDARY AUDIT COMPLETE.**

---

# 190. Round-8 Scope — Final Reconciliation

Round 8 closes the initial PRD-02 technology-audit programme.

It does not attempt to turn every open technical risk into a solved implementation. Its job is to ensure that:

1. the current upstream baseline is identified;
2. material source claims are re-verified;
3. experimental/master-only evidence is separated from released capability;
4. the 404 earlier capability findings are reconciled rather than contradicted;
5. prototype labels are unique and downstream-routable;
6. the wrapper/fork boundary is explicit;
7. every important Leyforge requirement has one of:
   - a credible Zylann capability;
   - a credible extension/wrapper path;
   - a deliberate Leyforge-owned implementation path;
   - or an explicit P3/P4 proof obligation;
8. no convenient plugin feature is silently promoted into game/engineering canon.

Round 8 adds a small number of **source-verification findings**, then issues the PRD-02 closure candidate.

---

# 191. Round-8 Current Baseline Verification

The current official release index was rechecked on **4 September 2026**.

The latest packaged line remains:

- **Voxel Tools 1.7** custom-module build with **Godot 4.7.2**;
- **Voxel Tools 1.7 GDExtension** for **Godot 4.5+**.

The release page continues to warn that the GDExtension build has received less testing than module builds.

Current `master` contains activity after the 1.7 release, including headless/threaded-rendering fixes and other ongoing work. Therefore:

> **PRD-02 release facts are pinned to the 1.7 release line unless a row explicitly says `current master` / WIP / issue evidence.**

PRD-07 must pin the exact tag/commit used by each prototype.

| ID | Final verification fact | Evidence | Result | Closure interpretation |
|---|---|---|---|---|
| `ZYL-CAP-405` | Voxel Tools 1.7 remains the latest official packaged release line at closure-candidate time | release index | `TF-REL VERIFIED` | PRD-02 baseline remains current as of 4 Sep 2026. |
| `ZYL-CAP-406` | The 1.7 GDExtension release still carries an upstream lower-testing warning versus module builds | release index | `TF-REL VERIFIED / RISK` | Module vs GDExtension remains an evidence decision, not a preference decision. |
| `ZYL-CAP-407` | Current source registers `VoxelTerrain`, `VoxelLodTerrain`, `VoxelBlockyTypeLibrary`, `VoxelSaveCompletionTracker`, `VoxelTerrainMultiplayerSynchronizer`, `VoxelAStarGrid3D`, stream classes and core meshers | current `register_types.cpp` | `TF-SRC VERIFIED` | These are real current API surfaces, not documentation-only concepts. |
| `ZYL-CAP-408` | `VoxelMesher.build_mesh()` can manually mesh a supplied `VoxelBuffer` without a terrain node | current `VoxelMesher` API | `DIRECT / IMPORTANT EXTENSION` | A custom finite/moving voxel representation may reuse Zylann meshing without moving `VoxelTerrain`. |
| `ZYL-CAP-409` | Standalone meshing requires neighbor padding around the target voxel volume | current `VoxelMesher` API | `DIRECT CONTRACT` | Vessel/debris/custom-volume meshing must include correct padding/boundary data. |
| `ZYL-CAP-410` | Current master contains post-release headless/threaded-rendering fixes and explicitly notes further Godot-side thread-safety improvement in 4.8 | current CI/master activity | `MASTER-AHEAD-OF-RELEASE RISK` | Never mix 1.7-release claims and master fixes without an exact build pin. |
| `ZYL-CAP-411` | `VoxelBlockyTypeLibrary` remains explicitly experimental in current generated docs | current API | `TF-API VERIFIED` | It remains unsuitable as Leyforge canonical identity authority. |
| `ZYL-CAP-412` | `VoxelAStarGrid3D` remains explicitly experimental and documents its simple-agent/solid-air/search-size limits | current API | `TF-API VERIFIED` | Useful prototype primitive, not final navigation architecture. |
| `ZYL-CAP-413` | `VoxelLodTerrain` still states that blocky meshers have less LOD support than the smooth/Transvoxel path | current API | `TF-API VERIFIED / CRITICAL GAP` | Blocky far-distance rendering remains a P3/P4 gate. |
| `ZYL-CAP-414` | Current stream documentation still warns that saving is asynchronous, process kills can lose/corrupt pending writes, and save switching requires lifecycle care | current Streams docs | `TF-DOC VERIFIED / CRITICAL` | Leyforge's outer checkpoint/journal coordinator remains mandatory. |

---

# 192. Final Corrections / Refinements

## 192.1 Moving-vessel meshing unknown narrowed

Round-7 Unknown 17 asked whether `VoxelBuffer` / block meshing can be reused directly for a custom moving vessel renderer.

Round 8 narrows this strongly:

> **YES at the mesh-generation primitive level.**

`VoxelMesher` can build a standalone mesh from a padded `VoxelBuffer`.

This does **not** solve:

- incremental vessel chunk partitioning;
- collision generation;
- moving-frame physics;
- character attachment;
- buoyancy;
- vessel networking;
- vessel-local persistence.

But it materially improves the moving-vessel architecture outlook because a custom finite voxel volume does not automatically require a new block mesher.

## 192.2 Experimental APIs stay experimental

The final source pass confirms that:

- `VoxelBlockyTypeLibrary`;
- `VoxelAStarGrid3D`;
- multipass generation;
- floating-chunk expansion work;
- several feature-branch ideas;

must remain `EXPERIMENTAL`, WIP or prototype evidence where upstream labels them that way.

## 192.3 Release vs master is now a formal evidence distinction

PRD-02 previously used current source inspection to discover useful forward evidence.

The closure rule is now explicit:

```text
RELEASE TAG / PACKAGED BUILD
        =
candidate implementation baseline

MASTER / OPEN ISSUE / FEATURE BRANCH
        =
forward evidence / risk / possible future path
```

A master-only fix cannot be silently assumed present in release 1.7.

---

# 193. Prototype-ID Reconciliation

Earlier working rounds reused several `ZP-07*` labels for unrelated domains as the audit expanded.

v0.8 removes that ambiguity.

Canonical detailed prototype families are now:

| Family | Purpose |
|---|---|
| `ZP-PAL-*` | FCC-13 palette, state explosion, culling/material and metadata binding |
| `ZP-PST-*` | streams, sparse deltas, checkpoints, crashes, world switching and migration |
| `ZP-WGEN-*` | determinism, feature intents, multipass, generator performance and registry snapshots |
| `ZP-LOD-*` | blocky far LOD, collision, fast traversal, low-end profiles, large coordinates and memory |
| `ZP-NET-*` | authoritative voxel streaming, regeneration, teleport/viewers, reconnect, headless and region handoff |
| `ZP-NAV-*` | local voxel pathfinding, mover-aware navigation and edit invalidation |
| `ZP-FLUID-*` | conserved local fluids, ocean/local boundary and presentation |
| `ZP-VES-*` | commissioning, moving local frame and floating-debris comparison |
| `ZP-INT-*` | shared spatial changes, local random-tick scope, ecology instancing and structure/machine projection |

Round-1 `ZP-01`→`ZP-12` entries are retained as **legacy umbrella prototype seeds**. Later domain-specific prototypes refine them and should be used as the implementation-facing identifiers in PRD-06/07.

Machine audit after renaming:

- detailed prototype labels are no longer semantically duplicated;
- no capability IDs are duplicated;
- capability sequence is consecutive through `ZYL-CAP-414`.

---

# 194. Master Capability Disposition

PRD-02 does not reduce 414 evidence rows into one simplistic PASS/FAIL.

Instead the final boundary uses five disposition groups.

## 194.1 Group A — Strong Zylann-owned substrate candidates

These are capabilities PRD-02 finds sufficiently real/current to retain as the leading implementation baseline, subject to benchmark qualification:

- block-based voxel storage;
- `VoxelBuffer`;
- blocky `TYPE` representation;
- classic `VoxelBlockyLibrary`;
- `VoxelMesherBlocky`;
- custom/specialist one-cell block models;
- runtime voxel queries and edits;
- bulk edit/copy/paste primitives;
- viewer-driven `VoxelTerrain` streaming;
- voxel raycasts;
- AABB block collision helper;
- static terrain collision generation;
- custom/threaded generator API;
- block-oriented stream API;
- SQLite / region / custom-stream backends as candidate components;
- versioned block serialization;
- terrain statistics/debug tooling;
- natural surface instancing;
- manual standalone meshing from `VoxelBuffer`.

**Disposition:** `CONDITIONAL ACCEPT AS VOXEL-CORE SUBSTRATE`.

## 194.2 Group B — Zylann primitive + Leyforge wrapper

These capabilities are useful, but the authoritative contract must remain Leyforge-owned:

- FCC-13 semantic ID → uint16 model palette;
- palette/world manifest;
- block-state compilation;
- large-feature intent → local voxel rasterisation;
- voxel save barrier → whole-world checkpoint;
- terrain edit hooks → `SpatialChangeSet`;
- voxel viewer/peer hooks → Leyforge network interest;
- voxel block serializer → Leyforge transport protocol;
- terrain readiness → teleport/spawn/realm-arrival gating;
- local fluid levels → authoritative fluid projection;
- instancing → ecology presentation;
- block geometry → structure/machine/portal projection;
- standalone mesher → possible vessel-local rendering component.

**Disposition:** `ACCEPT WITH LEYFORGE INTEGRATION LAYER`.

## 194.3 Group C — Experimental / monitor / prototype only

Do not make architecture depend on these without explicit P3/P4 adoption:

- `VoxelBlockyTypeLibrary`;
- attribute/state automation APIs;
- `VoxelAStarGrid3D`;
- `VoxelGeneratorMultipassCB` for large-world architecture;
- current experimental multiplayer synchronizer as the complete network solution;
- stock blocky use of `VoxelLodTerrain` for Leyforge's final far renderer;
- floating-chunk WIP expansion;
- unmerged connected-texture/custom-mesher/other feature branches;
- master-only fixes not present in the selected release tag.

**Disposition:** `REFERENCE / PROTOTYPE / WATCH`.

## 194.4 Group D — Leyforge-owned systems

PRD-02 found no evidence that these should be delegated to Zylann:

- canonical stable identity and migration semantics;
- world/content/registry manifests;
- whole-game save/checkpoint/journal authority;
- cross-domain transactions;
- worldgen planning/feature ownership/history;
- regional simulation and LOD;
- complete movement/navigation;
- mover capability/traversal/reservation systems;
- conserved fluids;
- oceans/tides/currents/weather-water fields;
- moving vessel identity/local frames/buoyancy;
- persistent people/ecology/civilisation/economy/social/biology;
- structures/projects/construction ownership;
- machine/automation/power/mana networks;
- realm access/portal semantics;
- authoritative multiplayer command/protocol layer;
- mods/content security;
- Unified Forge;
- diagnostics/support/recovery policy.

**Disposition:** `LEYFORGE OWN / ADJACENT TECHNOLOGY`.

## 194.5 Group E — Rejected shortcuts

The following convenient shortcuts are rejected by evidence or authority:

- Zylann numeric model IDs as canonical FCC identity;
- experimental TypeLibrary names as save/canon identity;
- one `VoxelTerrain` stream resource repointed between worlds;
- `save_modified_blocks()` treated as a complete durable world save;
- SQLite transaction treated as whole-world atomicity;
- moving `VoxelTerrain` used as a commissioned ship;
- random block ticks used as the universal simulation clock;
- `VoxelInstancer` used as authoritative ecology population;
- instancer used as persistent settlement/house system;
- `VoxelAStarGrid3D` used as universal movement/navigation;
- blocky fluid model used as fluid conservation/flow authority;
- stock blocky LOD assumed production-ready without benchmark;
- client-generated terrain treated as authoritative;
- master/WIP features assumed present in release builds.

**Disposition:** `REJECT AS FOUNDATION`.

---

# 195. Wrapper vs Fork Decision Posture

## 195.1 Default posture — wrapper first

PRD-02 finds **no current evidence requiring an immediate Leyforge fork of `godot_voxel`**.

The preferred discovery posture is:

```text
Godot
  ↓
Zylann Voxel Tools
  ↓
Leyforge Voxel Integration Layer
  ├── semantic palette
  ├── worldgen adapter
  ├── persistence adapter
  ├── spatial-change adapter
  ├── network adapter
  ├── diagnostics
  └── specialist materialisation
```

Advantages:

- upstream fixes remain easier to consume;
- experimental internals stay isolated;
- Leyforge gameplay law remains outside plugin internals;
- Module/GDExtension can be compared against the same Leyforge-facing interface.

## 195.2 Fork trigger

A fork may be justified only when a **critical P3/P4 result** shows that a required capability:

1. cannot be expressed through current public APIs;
2. cannot meet performance/correctness requirements through a wrapper;
3. is unlikely to be supplied upstream in a compatible timeframe;
4. materially simplifies the system enough to justify long-term upstream-sync debt.

Potential fork triggers include:

- production blocky far LOD requiring mesher/streaming-core changes;
- missing high-throughput batch stream APIs;
- insufficient edit-change information;
- headless/network bugs requiring maintained patches;
- vessel-local meshing requiring inaccessible internal facilities;
- mover-aware voxel navigation proving valuable enough to warrant lower-level changes.

## 195.3 Fork governance if triggered

A Leyforge fork would require:

- exact upstream base commit;
- patch ledger;
- reason/requirement for every patch;
- upstream issue/PR reference where applicable;
- automated parity/regression suite;
- scheduled upstream merge policy;
- removal plan for patches later solved upstream;
- no gameplay canon embedded directly into the fork.

---

# 196. Module vs GDExtension Final PRD-02 Posture

PRD-02 intentionally does **not** select the edition.

Current facts:

- module/custom-engine builds are the historically more-tested path;
- GDExtension allows use with official Godot builds and reduces custom-engine distribution/maintenance burden;
- the current 1.7 GDExtension release still carries a lower-testing warning;
- some source paths and build behaviour differ;
- headless/threading behaviour is still receiving upstream work.

Therefore:

> **PRD-07 should test both editions through the same core fixture set before PRD-04/LFE lock an integration edition.**

Recommended evidence posture:

- use the **module build as a control/reference** for upstream behaviour;
- treat **GDExtension as strategically preferable only if it meets parity, stability, headless, profiling and performance gates**;
- do not accept a permanent custom-engine burden without measured reason;
- do not accept extension convenience if it loses required hooks/stability.

---

# 197. Final Critical Risk Register

| Risk | Severity | Required disposition |
|---|---|---|
| Blocky far-distance LOD not production-proven | **RED** | `ZP-LOD-*`, PRD-06/07 |
| Stable semantic palette/model-handle migration | **RED** | `ZP-PAL-*`, PRD-04/07 |
| Async voxel persistence integrated with whole-world checkpoint | **RED** | `ZP-PST-*` |
| Generator determinism under worker/order variation | **RED** | `ZP-WGEN-*` |
| Huge cross-chunk feature ownership/materialisation | **RED** | `ZP-WGEN-*` |
| Moving editable voxel vessels | **RED** | `ZP-VES-*` |
| Conserved local fluids + ocean boundary | **RED** | `ZP-FLUID-*` |
| Dynamic mover-aware navigation after voxel edits | **RED** | `ZP-NAV-*` |
| Authoritative voxel networking/reconnect/teleport | **RED** | `ZP-NET-*` |
| Headless dedicated-server parity | **RED/AMBER** | `ZP-NET-*` + edition matrix |
| Collision/update cost under rapid edits/fast travel | **AMBER/RED** | `ZP-LOD-*` |
| 65,536 runtime-model state explosion | **AMBER** | `ZP-PAL-*` |
| Material/draw-call/content-pack pressure | **AMBER** | `ZP-PAL-*`, Forge budgets |
| Metadata abuse / dense extra channels | **AMBER** | `ZP-PAL-*`, `ZP-PST-*` |
| SQLite throughput / enormous-world maintenance | **AMBER** | `ZP-PST-*` |
| Module vs GDExtension divergence | **AMBER** | edition parity suite |
| Current-master/WIP dependency creep | **AMBER** | exact source pinning |
| Upstream fork maintenance | **AMBER/RED if triggered** | PRD-04 + Branch-B governance |

No RED item currently means "Zylann cannot support Leyforge."

They mean:

> **this is too consequential to trust without a Leyforge prototype/stress result.**

---

# 198. Critical Prototype Packages for PRD-06 / PRD-07

The detailed prototypes throughout PRD-02 remain authoritative evidence candidates.

For planning purposes they consolidate into twelve critical proof packages:

## `ZYL-PKG-01 — Semantic Runtime Palette`

Consumes:

- `ZP-PAL-*`

Must prove:

- full current FCC content fits;
- deterministic semantic→runtime mapping;
- state/rotation headroom;
- migration;
- mods/official expansion reserve;
- bake/load performance.

## `ZYL-PKG-02 — Voxel Persistence & Recovery`

Consumes:

- `ZP-PST-*`

Must prove:

- sparse delta scale;
- save bursts;
- cross-domain checkpoint;
- crash recovery;
- world switching;
- generator/palette migration;
- compression/coordinate portability.

## `ZYL-PKG-03 — Deterministic Worldgen`

Consumes:

- `ZP-WGEN-*`

Must prove:

- worker/order determinism;
- feature-intent ownership;
- large structures;
- generator versioning;
- load/backpressure;
- implementation-language performance.

## `ZYL-PKG-04 — Blocky Distance / Performance`

Consumes:

- `ZP-LOD-*`

Must prove:

- far representation;
- blocky visual fidelity;
- 16/32 mesh-block trade-offs;
- collision budget;
- fast travel;
- low-end profiles;
- large coordinates;
- native/GPU memory.

## `ZYL-PKG-05 — Authoritative Voxel Networking`

Consumes:

- `ZP-NET-*`

Must prove:

- server block authority;
- interest/viewers;
- deterministic client regeneration if used;
- edit bursts;
- packet loss;
- reconnect;
- teleport;
- headless server;
- region handoff.

## `ZYL-PKG-06 — Dynamic Navigation`

Consumes:

- `ZP-NAV-*`

Must prove:

- local path primitive;
- mover-aware semantics;
- bounded edit invalidation;
- no global rebuild.

## `ZYL-PKG-07 — Fluids / Ocean Boundary`

Consumes:

- `ZP-FLUID-*`

Must prove:

- conserved local volume;
- cross-chunk/unloaded boundaries;
- regional ocean integration;
- acceptable presentation.

## `ZYL-PKG-08 — Moving Voxel Vessel`

Consumes:

- `ZP-VES-*`

Must prove:

- static construction→commission;
- finite voxel-local mesh reuse;
- moving frame;
- occupants/cargo;
- block edits;
- collision;
- save/load.

## `ZYL-PKG-09 — Specialist Spatial Integration`

Consumes:

- `ZP-INT-*`

Must prove:

- one bounded `SpatialChangeSet`;
- coalesced downstream invalidation;
- structure/machine projection;
- ecology presentation separation.

## `ZYL-PKG-10 — Edition Parity`

New closure package.

Run the same core fixtures against:

- 1.7 module/custom build;
- 1.7 GDExtension;
- any later candidate version only under explicit source delta.

Compare:

- API availability;
- headless;
- task/thread behaviour;
- performance;
- crashes;
- editor/tooling;
- export/deployment;
- diagnostics/profiling.

## `ZYL-PKG-11 — Fork Threshold`

Use failing results from Packages 1–10 to implement the minimum representative missing hook **through wrapper first**.

Only then compare an upstream patch/fork.

Success criterion:

> prove whether a fork removes a real blocker rather than merely feeling cleaner.

## `ZYL-PKG-12 — Long Soak / Combined Hostile World`

Final P4-style combined scenario:

- large explored world;
- active construction;
- edits;
- streaming;
- save/checkpoint;
- NPC navigation;
- local fluid;
- multiplayer viewers;
- teleport;
- server/headless;
- unload/reload;
- long run.

Purpose:

- catch queue/backlog/lifetime interactions that subsystem tests miss.

---

# 199. PRD-01 → PRD-02 Coverage Closure

PRD-02 now has an explicit disposition for every major voxel/terrain technology pressure emitted by PRD-01.

| PRD-01 pressure family | PRD-02 result |
|---|---|
| Editable blocky voxel world | **DIRECT candidate support** |
| Compact runtime block representation | **DIRECT + Leyforge palette wrapper** |
| FCC stable semantic identity | **LEYFORGE-OWN; clean compile boundary found** |
| Runtime mining/building/bulk edits | **DIRECT; benchmark required** |
| Worldgen generator execution | **DIRECT** |
| Worldgen ownership/determinism/history | **LEYFORGE-OWN + P3/P4** |
| Cross-chunk structures | **PARTIAL upstream + Leyforge Feature Intent** |
| Persistence block storage | **DIRECT component** |
| Whole-world saves/migration/recovery | **LEYFORGE-OWN** |
| Long-distance blocky rendering | **CRITICAL P3/P4** |
| Terrain collision/raycast | **DIRECT/partial** |
| Large coordinates | **SUPPORTED OPTIONS + P3/P4** |
| Multiplayer terrain hooks | **PARTIAL/experimental component** |
| Complete multiplayer authority/protocol | **LEYFORGE-OWN** |
| Dedicated/headless terrain | **PLAUSIBLE + P3/P4** |
| Dynamic navigation | **experimental local primitive + Leyforge ownership** |
| Fluids/oceans | **presentation primitive only + Leyforge ownership** |
| Moving vessels | **standalone meshing primitive useful; vessel system Leyforge-owned** |
| Farming/ecology | **presentation/local primitives only** |
| Structures/machines/portals | **physical projection only** |
| Forge authoring/bake | **LEYFORGE-OWN; Zylann runtime target is plausible** |
| Diagnostics/profiling | **useful direct primitives + Leyforge system above** |
| Low-end scalability | **supported by separable budgets, still P3/P4** |
| Mod/content expansion | **semantic palette/package layer must remain Leyforge-owned** |

**Coverage result: PASS.**

No PRD-01 voxel-technology family is left with an accidental "maybe Zylann handles it somehow" assumption.

---

# 200. PRD-02 Closure Criteria

| Criterion | Result |
|---|---|
| Current official release identified | **PASS** |
| Module/GDExtension distinction recorded | **PASS** |
| Core storage/meshing/edit capability audited | **PASS** |
| Block/state/palette boundary audited | **PASS** |
| Persistence/save lifecycle audited | **PASS** |
| Worldgen/threading/determinism audited | **PASS** |
| LOD/collision/large coordinates audited | **PASS** |
| Multiplayer/headless hooks audited | **PASS** |
| Navigation/fluid/vessel/specialist boundaries audited | **PASS** |
| Experimental/WIP features labelled | **PASS** |
| Release vs master evidence separated | **PASS** |
| Wrapper/fork threshold defined | **PASS** |
| Critical prototype programme routed | **PASS** |
| PRD-01 voxel pressure coverage | **PASS** |
| Exact production integration edition chosen | **DEFERRED BY DESIGN to PRD-03/04/07** |
| P3/P4 production qualification complete | **DEFERRED BY DESIGN to PRD-06/07/08** |

The two deferred rows are **not failures of PRD-02**. They are downstream decisions/results that PRD-02 exists to inform.

---

# 201. PRD-02 Closure-Candidate Verdict

> **Zylann Voxel Tools 1.7 remains Leyforge's leading voxel-core candidate and is conditionally accepted for continued architecture/prototype work.**

The audit found a strong match for the role:

```text
high-performance editable spatial substrate
```

It did **not** find evidence that Zylann should become:

```text
the Leyforge world/game architecture
```

The recommended working boundary is:

```text
                    LEYFORGE
                       │
          stable semantic authority
          worldgen ownership/history
          persistence/checkpoints
          simulation / gameplay
          networking authority
          navigation / fluids / vessels
          Forge / diagnostics
                       │
               integration adapters
                       │
                       ▼
              ZYLANN VOXEL TOOLS
                       │
                voxel buffers
                block models
                chunk streaming
                meshing
                local edits
                raycasts
                collision helpers
                generator execution
                block streams
                lifecycle hooks
                       │
                       ▼
                     GODOT
```

## 201.1 No immediate fork

**Wrapper-first** is the current recommendation.

A fork is conditional on measured blockers.

## 201.2 No final edition lock

Module vs GDExtension remains a deliberately open evidence question.

## 201.3 No production qualification claim

PRD-02 certifies the **quality/completeness of the technology audit**, not that the voxel stack has passed Leyforge P4/P5 engineering qualification.

---

# 202. PRD-02 Status

**PRD-02 v0.8 — CLOSURE CANDIDATE**

Rounds 1–8 are complete.

The document is ready to hand off into:

- PRD-03 — Godot & Supporting Technology Audit;
- PRD-04 — Architecture Boundary Study;
- PRD-05 — Research Evidence Crosswalk;
- PRD-06 — Technical Risk & Proof Register;
- PRD-07 — Prototype & Benchmark Programme.

PRD-02 should be reopened by controlled delta if:

- a materially newer Voxel Tools release becomes the intended rebuild candidate;
- PRD-03 discovers a Godot/platform constraint that invalidates a PRD-02 technology fact;
- PRD-07 proves a critical capability/limitation materially different from the current audit;
- a required capability forces a maintained fork and changes the upstream boundary;
- an upstream deprecation/removal affects an adopted API before architecture lock.

---

# 203. Immediate Next Action

> **PRD-03 — Godot & Supporting Technology Audit**

PRD-03 should now investigate the rest of the technical stack around the voxel core, including:

- Godot version/build strategy;
- module vs GDExtension implications;
- large-world precision;
- physics engines/servers;
- navigation technology;
- networking/transport;
- threading/task architecture;
- serialization/database/file APIs;
- headless/dedicated-server behaviour;
- rendering/shader/GPU capabilities;
- UI/input/accessibility;
- audio;
- platform/export/toolchain;
- profiling/testing/CI support;
- security/sandboxing/mod constraints;
- candidate supporting plugins/libraries.

PRD-03 must treat Zylann as the **conditionally accepted voxel candidate defined by PRD-02**, not re-run the entire voxel audit from scratch.

---

# 204. Round-8 Official / Current Sources

- Voxel Tools releases  
  `https://github.com/Zylann/godot_voxel/releases`
- Current class registration/source surface  
  `https://github.com/Zylann/godot_voxel/blob/master/register_types.cpp`
- Current generated API documentation  
  `https://voxel-tools.readthedocs.io/en/latest/api/`
- `VoxelMesher` standalone mesh API  
  `https://voxel-tools.readthedocs.io/en/latest/api/VoxelMesher/`
- `VoxelBlockyTypeLibrary` experimental API  
  `https://voxel-tools.readthedocs.io/en/latest/api/VoxelBlockyTypeLibrary/`
- `VoxelAStarGrid3D` experimental API  
  `https://voxel-tools.readthedocs.io/en/latest/api/VoxelAStarGrid3D/`
- `VoxelLodTerrain` API  
  `https://voxel-tools.readthedocs.io/en/latest/api/VoxelLodTerrain/`
- `VoxelTerrain` API  
  `https://voxel-tools.readthedocs.io/en/latest/api/VoxelTerrain/`
- Scripting/edit limits  
  `https://voxel-tools.readthedocs.io/en/latest/scripting/`
- Streams / async persistence warnings  
  `https://voxel-tools.readthedocs.io/en/latest/streams/`
- Current feature-branch tracker  
  `https://github.com/Zylann/godot_voxel/issues/640`
- Current CI/build activity  
  `https://github.com/Zylann/godot_voxel/actions`

---

**ROUND-8 RESULT: FINAL CAPABILITY / SOURCE / PROTOTYPE RECONCILIATION COMPLETE.**

**PRD-02 RESULT: CLOSURE CANDIDATE ISSUED.**
