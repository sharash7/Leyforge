# PRD-03 — Godot & Supporting Technology Audit

**Project:** Leyforge / Ley Realms / The Forge  
**Document:** PRD-03  
**Version:** 0.8 CLOSURE CANDIDATE  
**Date:** 4 September 2026  
**Status:** CLOSURE CANDIDATE — Rounds 1–8 complete; Godot/supporting-technology discovery reconciled; evidence/prototypes routed to PRD-04/05/06/07  
**Upstream:** PRD-00 v1.0; PRD-01 v0.15 Closure Candidate; PRD-02 v0.8 Closure Candidate  
**Downstream:** PRD-04, PRD-05, PRD-06, PRD-07, PRD-08, PRD-09, LFE, FORGE-ENG

---

# 1. Purpose

PRD-03 audits the **Godot engine and supporting technology surface around the conditionally accepted Zylann voxel-core candidate**.

PRD-02 answered:

> What can the voxel substrate actually do?

PRD-03 asks:

> What should the rest of Leyforge rely on in Godot, what must remain Leyforge-owned, what requires supporting technology, and what engine/build choices need evidence before architecture lock?

This document is a **technology-fact and evidence audit**.

It does not decide final architecture simply because a Godot feature exists.

---

# 2. Round-1 Scope

Round 1 establishes the current stable engine baseline and audits:

- Godot release/version policy;
- standard vs .NET builds;
- GDExtension vs engine module implications;
- custom engine builds;
- single vs double precision;
- large-world coordinates;
- headless/dedicated-server export;
- default 3D physics;
- physics interpolation;
- threading/task primitives;
- renderer and graphics-driver tiers;
- baseline networking surface;
- file/resource serialization primitives;
- deployment/support posture.

Later rounds will deep-dive each specialist surface.

---

# 3. Evidence Rules

Technology claims use these evidence classes:

| Class | Meaning |
|---|---|
| `GOD-TF-REL` | Official Godot stable release/release-policy fact |
| `GOD-TF-DOC` | Official stable documentation fact |
| `GOD-TF-API` | Stable generated API fact |
| `GOD-TF-SRC` | Current source fact where required |
| `GOD-FUTURE` | Development snapshot/current-master evidence, not stable baseline |
| `P3-NEEDED` | Leyforge prototype required |
| `P4-NEEDED` | Stress/production-like benchmark required |

Rule:

> **Godot 4.8 development documentation or master-only behaviour cannot be treated as present in the 4.7.2 stable baseline.**

---

# 4. Current Godot Baseline

## 4.1 Stable release

At 4 September 2026:

- **Godot 4.7.2-stable** is the latest official stable release;
- it was released **18 August 2026**;
- Godot's maintenance announcement reports no known incompatibilities with 4.7.1 and encourages 4.7 users to upgrade;
- Godot 4.7 remains within the supported release window.

## 4.2 Future release line

The official download archive currently lists:

- **Godot 4.8-dev4** — 26 August 2026;
- 4.8 remains a development line, not the Leyforge baseline.

Therefore:

> **PRD-03 uses Godot 4.7.2 stable as the current discovery baseline.**

A later stable release can enter through a controlled technology delta.

## 4.3 Zylann alignment

PRD-02's current packaged module baseline also targets **Godot 4.7.2**, so the current Godot and Zylann stable lines align.

This is favourable but does not automatically settle:

- Module vs GDExtension;
- standard vs double precision;
- Standard vs .NET build;
- renderer;
- physics strategy;
- headless architecture.

---

# 5. Round-1 Official Source Register

| Ref | Official source | Principal use |
|---|---|---|
| `GOD-S01` | Godot 4.7.2 stable archive / maintenance release | Stable engine baseline |
| `GOD-S02` | Godot release policy | Supported-version status |
| `GOD-S03` | Godot archive index | 4.8 dev vs 4.7 stable distinction |
| `GOD-S04` | GDExtension 4.7 documentation | Native-extension architecture |
| `GOD-S05` | `.gdextension` file documentation | Extension compatibility boundaries |
| `GOD-S06` | Large world coordinates | Double precision and origin-shifting trade-offs |
| `GOD-S07` | Dedicated server export | Headless/server build path |
| `GOD-S08` | Using Jolt Physics | 3D physics default / limitations |
| `GOD-S09` | 4.6→4.7 upgrade docs | Current changed defaults inherited by 4.7 |
| `GOD-S10` | WorkerThreadPool | Built-in task-pool primitive |
| `GOD-S11` | Using multiple threads / thread-safe APIs | Engine threading limits |
| `GOD-S12` | Internal rendering architecture | Renderers/drivers |
| `GOD-S13` | System requirements | Hardware/runtime floors |
| `GOD-S14` | High-level multiplayer | ENet/WebRTC/WebSocket and low-level options |
| `GOD-S15` | Navigation feature docs | Runtime nav capabilities |
| `GOD-S16` | Physics interpolation | Physics/render cadence separation |
| `GOD-S17` | ResourceSaver / feature list | Built-in serialization/file primitives |

---

# 6. Engine Release / Support Surface

| ID | Capability / fact | Evidence | Result | Leyforge implication |
|---|---|---|---|---|
| `GOD-CAP-001` | Godot 4.7.2 is current stable baseline | `GOD-S01`, `GOD-S03` | `GOD-TF-REL` | Use as PRD-03 baseline. |
| `GOD-CAP-002` | Godot 4.8 is development-only at audit date | `GOD-S03` | `GOD-FUTURE` | Do not base rebuild requirements on 4.8-only APIs yet. |
| `GOD-CAP-003` | Godot 4.7 is still supported | `GOD-S02` | `GOD-TF-REL` | Appropriate current production-discovery line. |
| `GOD-CAP-004` | 4.7.2 maintenance release reports no known incompatibility with 4.7.1 | `GOD-S01` | `GOD-TF-REL` | Positive maintenance signal, not proof of Leyforge compatibility. |
| `GOD-CAP-005` | Stable engine upgrades can still regress projects | `GOD-S01` | `GOD-TF-REL / PROCESS` | Engine upgrades require Git, tests and explicit upgrade gate. |
| `GOD-CAP-006` | Godot uses an active minor-release cadence | `GOD-S02`, `GOD-S03` | `GOD-TF-REL` | Leyforge needs engine-version pinning and deliberate upgrade policy. |

---

# 7. Standard / .NET / Native Extension Surface

## 7.1 Standard Godot

Standard builds support:

- GDScript;
- native GDExtensions;
- engine modules when using custom builds.

## 7.2 .NET Godot

Official 4.7.2 downloads also provide .NET builds for desktop platforms/export templates, enabling C#.

Round 1 does not choose GDScript vs C#.

## 7.3 GDExtension

Godot 4.7 documents GDExtension as native shared-library integration **without recompiling the engine**.

The `.gdextension` file supports explicit:

- minimum compatible Godot version;
- maximum compatible Godot version;
- platform/feature-specific native library selection.

| ID | Capability / fact | Evidence | Result | Leyforge implication |
|---|---|---|---|---|
| `GOD-CAP-007` | GDExtension loads native shared libraries at runtime | `GOD-S04` | `DIRECT` | Strong candidate for high-performance Leyforge subsystems and Zylann extension build. |
| `GOD-CAP-008` | GDExtension avoids compiling native plugin code directly into engine | `GOD-S04` | `DIRECT` | Reduces custom-engine burden where public extension APIs suffice. |
| `GOD-CAP-009` | Extensions can declare minimum Godot compatibility | `GOD-S05` | `DIRECT` | Useful for explicit plugin/build contract. |
| `GOD-CAP-010` | Extensions can declare maximum Godot compatibility | `GOD-S05` | `DIRECT` | Useful to prevent unsafe loading on unqualified future engine versions. |
| `GOD-CAP-011` | Extension libraries can vary by platform/build feature | `GOD-S05` | `DIRECT` | Enables Windows/Linux/macOS/server-specific binaries. |
| `GOD-CAP-012` | GDExtension is not a substitute for unavailable internal engine APIs | architectural fact | `BOUNDARY` | Some low-level needs may still require module/fork/custom engine. |
| `GOD-CAP-013` | Native-extension reload exists for development but is primarily a dev/debug feature | `GOD-S05` | `DIRECT / DEV-ONLY` | Forge/editor hot tooling must not assume arbitrary runtime-native reload is production-safe. |

---

# 8. Custom Engine / Module Build Surface

Some Leyforge options require a custom Godot build:

- Zylann module path;
- large-world double precision;
- future engine-module patches;
- potentially custom low-level hooks.

| ID | Capability / fact | Evidence | Result | Leyforge implication |
|---|---|---|---|---|
| `GOD-CAP-014` | Godot can be rebuilt from source with custom configuration/modules | `GOD-S06` + standard build system | `DIRECT` | Custom engine remains technically viable. |
| `GOD-CAP-015` | Large-world double precision specifically requires recompiling editor and export templates | `GOD-S06` | `DIRECT HARD REQUIREMENT` | Cannot enable large-world coordinates as a normal project toggle. |
| `GOD-CAP-016` | Custom engine builds increase distribution/toolchain ownership | engineering implication | `RISK` | Must earn their maintenance cost through evidence. |
| `GOD-CAP-017` | Module-based Zylann and double precision may be combined in one custom engine candidate | PRD-02 + `GOD-S06` | `PLAUSIBLE / P3-NEEDED` | Potentially efficient if both are required; must be built/tested. |
| `GOD-CAP-018` | GDExtension can reduce custom-engine needs if required features remain exposed | `GOD-S04` | `STRATEGIC OPTION` | Supports PRD-02 wrapper-first posture. |

---

# 9. Large-World Coordinate Surface

Godot's default 3D vector representation uses single-precision vector components.

Official docs state precision decreases as positions move away from origin.

Godot provides **large world coordinates** through double-precision engine builds.

| ID | Capability / fact | Evidence | Result | Leyforge implication |
|---|---|---|---|---|
| `GOD-CAP-019` | Default 3D vectors use 32-bit precision | `GOD-S06` | `DIRECT` | Large world precision must be explicitly evaluated. |
| `GOD-CAP-020` | Precision degrades with increasing distance from origin | `GOD-S06` | `DIRECT` | Minecraft-scale continuous coordinates can become a physics/render concern. |
| `GOD-CAP-021` | Double-precision builds increase Vector precision across engine | `GOD-S06` | `DIRECT` | Strong candidate for huge continuous world coordinates. |
| `GOD-CAP-022` | Rendering uses a special high-precision technique because GPU shaders remain single precision | `GOD-S06` | `DIRECT` | Large-world rendering is supported beyond naive float-vector behaviour. |
| `GOD-CAP-023` | Double precision costs CPU performance and memory | `GOD-S06` | `DIRECT TRADE-OFF` | Low-end scalability may favour another strategy. |
| `GOD-CAP-024` | Docs warn double precision may perform poorly on low-end/mobile hardware | `GOD-S06` | `DIRECT` | Conflicts with blindly enabling it for all hardware. |
| `GOD-CAP-025` | Origin shifting is an alternative for large worlds using single precision | `GOD-S06` | `DIRECT ALTERNATIVE` | Requires more complex game logic, especially multiplayer. |
| `GOD-CAP-026` | Godot docs explicitly note origin shifting adds multiplayer complexity | `GOD-S06` | `DIRECT` | Must be tested against Leyforge server authority/spatial frames. |
| `GOD-CAP-027` | Godot states many open worlds do not require double precision if playable range remains bounded around origin | `GOD-S06` | `DIRECT CONTEXT` | Leyforge must benchmark its actual coordinate needs rather than assume double precision. |
| `GOD-CAP-028` | Binary resources record whether saved using double-precision build | `GOD-S06` | `DIRECT COMPATIBILITY FACT` | Build precision can affect resource compatibility/tooling pipelines. |

## 9.1 Round-1 coordinate posture

Three candidates remain:

```text
A. standard precision + local/world partitioning
B. standard precision + origin shifting
C. double-precision custom Godot
```

PRD-03 does not choose yet.

PRD-07 must compare them against:

- player movement;
- voxel coordinates;
- realm addresses;
- vessel-local frames;
- networking;
- physics;
- Forge placement precision;
- low-end performance.

---

# 10. 3D Physics Surface — Jolt

Godot documentation states Jolt was integrated as an engine option and is now the **default 3D physics engine for new projects**.

| ID | Capability / fact | Evidence | Result | Leyforge implication |
|---|---|---|---|---|
| `GOD-CAP-029` | Jolt Physics is built into current Godot | `GOD-S08` | `DIRECT` | No external extension is required for baseline Jolt. |
| `GOD-CAP-030` | New Godot projects use Jolt as default 3D physics engine | `GOD-S08`, `GOD-S09` | `DIRECT CURRENT DEFAULT` | Jolt becomes the initial physics candidate. |
| `GOD-CAP-031` | Godot Physics remains selectable | `GOD-S08` | `DIRECT` | Allows comparison/regression if needed. |
| `GOD-CAP-032` | Jolt focuses on game/VR physics workloads | `GOD-S08` | `UPSTREAM DESIGN FACT` | Strong conceptual fit, still needs Leyforge benchmark. |
| `GOD-CAP-033` | Some Godot joint properties are not represented identically in Jolt | `GOD-S08` | `PARTIAL API DIFFERENCE` | Vessel/mechanical systems cannot assume perfect backend interchange. |
| `GOD-CAP-034` | Jolt/Godot physics choice is project-configurable | `GOD-S08` | `DIRECT` | Physics backend can be A/B tested before LFE lock. |
| `GOD-CAP-035` | Built-in physics remains separate from Zylann voxel semantic truth | PRD-02 boundary | `ARCHITECTURE FIT` | Physics consumes voxel collision/proxies; it does not own voxel identity. |

## 10.1 Physics posture

Jolt is the **leading general 3D physics candidate**, not automatic final canon.

High-risk future tests:

- terrain collision updates;
- thousands of characters;
- moving vessel frame interactions;
- debris;
- carts;
- mounts;
- projectiles;
- large coordinates;
- low physics-tick profiles.

---

# 11. Physics Interpolation / Tick Separation

Godot 4.7 supports automatic physics interpolation.

Official guidance:

- game/physics motion should occur in `_physics_process()`;
- rendering can interpolate between physics states;
- teleports require interpolation reset to avoid streaking;
- cameras may benefit from manual interpolation.

| ID | Capability / fact | Evidence | Result | Leyforge implication |
|---|---|---|---|---|
| `GOD-CAP-036` | Physics interpolation is built into Godot 4.7 | `GOD-S16` | `DIRECT` | Useful for lower simulation/physics tick profiles. |
| `GOD-CAP-037` | Physics tick rate can be lower than render rate while interpolation smooths presentation | `GOD-S16` | `DIRECT` | Strong support for low-end execution profiles. |
| `GOD-CAP-038` | Teleports require interpolation reset handling | `GOD-S16` | `DIRECT` | Realm travel/fast travel/network correction must integrate explicitly. |
| `GOD-CAP-039` | Camera interpolation may need custom handling | `GOD-S16` | `DIRECT` | First/third-person camera system remains Leyforge-owned. |
| `GOD-CAP-040` | MultiMesh supports interpolation-specific handling | `GOD-S16` | `DIRECT` | Relevant to ecology crowds/visual instances. |

---

# 12. Threading / Task Surface

Godot provides:

- explicit `Thread`;
- synchronization primitives;
- `WorkerThreadPool`;
- server-style APIs;
- thread-safe subsets.

But engine objects and containers are not universally thread-safe.

| ID | Capability / fact | Evidence | Result | Leyforge implication |
|---|---|---|---|---|
| `GOD-CAP-041` | `WorkerThreadPool` exists as a built-in worker-task service | `GOD-S10` | `DIRECT` | Candidate for bounded Leyforge worker jobs where appropriate. |
| `GOD-CAP-042` | Worker pool supports single tasks | `GOD-S10` | `DIRECT` | Useful for asynchronous specialist computations. |
| `GOD-CAP-043` | Worker pool supports group tasks distributed across workers | `GOD-S10` | `DIRECT` | Useful for partitioned batch simulation/analysis. |
| `GOD-CAP-044` | Godot warns small tasks can perform worse when distributed | `GOD-S10` | `DIRECT WARNING` | Do not parallelise by ideology. |
| `GOD-CAP-045` | Godot exposes Mutex/semaphore/thread synchronization primitives | `GOD-S11` | `DIRECT` | Sufficient basic concurrency toolbox. |
| `GOD-CAP-046` | Engine/object APIs are not universally thread-safe | `GOD-S11` | `DIRECT CRITICAL` | Workers should compute data/proposals rather than freely mutate scene/world state. |
| `GOD-CAP-047` | Godot core containers are not inherently thread-safe | stable architecture docs | `DIRECT` | Ownership/synchronization policy remains mandatory. |
| `GOD-CAP-048` | SceneTree mutation from arbitrary workers is unsafe unless specific API guarantees exist | `GOD-S11` | `DIRECT` | Reinforces PRD-02/Pass-5 owner-commit pattern. |
| `GOD-CAP-049` | Threading primitives do not provide simulation ownership architecture automatically | technology boundary | `NOT-PROVIDED` | LFE must define partitions/owners/commit phases. |

## 12.1 Concurrency convergence

Godot's limitations reinforce the existing research hypothesis:

```text
worker
  computes proposal/result
        ↓
authoritative owner
  commits state change
```

rather than:

```text
every worker
  mutates whatever it can reach
```

This remains a PRD-04/07 decision, not a Round-1 lock.

---

# 13. Renderer / Hardware-Tier Surface

Godot 4 has three rendering methods:

1. **Forward+**
2. **Mobile**
3. **Compatibility**

They are meaningfully different technology profiles.

## 13.1 Forward+

- desktop-oriented;
- clustered lighting;
- modern rendering-device backend;
- highest feature set.

## 13.2 Mobile

- modern RenderingDevice backend;
- reduced complexity;
- designed around mobile/low-bandwidth GPU characteristics;
- can also run on desktop;
- may outperform Forward+ on simple scenes/integrated GPUs.

## 13.3 Compatibility

- OpenGL-based;
- widest old/low-end hardware support;
- lower high-end feature set;
- only renderer available for web.

| ID | Capability / fact | Evidence | Result | Leyforge implication |
|---|---|---|---|---|
| `GOD-CAP-050` | Forward+, Mobile and Compatibility are distinct renderer choices | `GOD-S12` | `DIRECT` | Leyforge can define renderer-backed hardware profiles. |
| `GOD-CAP-051` | Forward+ targets feature-rich desktop rendering | `GOD-S12` | `DIRECT` | Leading high-end desktop candidate. |
| `GOD-CAP-052` | Mobile renderer can run on desktop and targets lower complexity/bandwidth | `GOD-S12` | `DIRECT` | Strong candidate for low/mid desktop profile. |
| `GOD-CAP-053` | Compatibility targets legacy/low-end hardware | `GOD-S12`, `GOD-S13` | `DIRECT` | Potential lowest graphical tier if voxel stack/features remain compatible. |
| `GOD-CAP-054` | Compatibility has materially fewer advanced rendering features | `GOD-S12` | `DIRECT` | Presentation must preserve semantic truth without relying on unavailable effects. |
| `GOD-CAP-055` | Vulkan is the main Godot 4 rendering driver with most development focus | `GOD-S12` | `DIRECT` | Natural primary cross-platform modern driver candidate. |
| `GOD-CAP-056` | Direct3D 12 supports Forward+/Mobile but is still described as experimental in 4.7 docs | `GOD-S12` | `AMBER` | Do not assume Windows D3D12 is more stable than Vulkan solely because it is default on new Windows projects. |
| `GOD-CAP-057` | Native Metal supports Forward+/Mobile on Apple platforms | `GOD-S12` | `DIRECT` | Apple path exists without requiring MoltenVK on supported Apple Silicon. |
| `GOD-CAP-058` | OpenGL only supports Compatibility renderer | `GOD-S12` | `DIRECT` | Low-end/web feature set must be designed explicitly. |
| `GOD-CAP-059` | Forward+/Mobile can fall back between modern driver paths and then Compatibility | renderer docs | `DIRECT` | Useful resilience but can change appearance/features. |
| `GOD-CAP-060` | Renderer fallback may produce visually different output | renderer docs | `DIRECT` | Forge semantic presentation certification must test every supported renderer tier. |

---

# 14. Low-End Scalability Implication

Godot's render architecture gives Leyforge a real engine-level basis for differentiated profiles.

Potential mapping:

```text
LEYFORGE HIGH
  Forward+
  high view distance
  rich lighting/VFX
  higher collision/sim budgets

LEYFORGE BALANCED
  Forward+ or Mobile
  reduced presentation budgets
  moderate view/simulation

LEYFORGE LOW
  Mobile or Compatibility
  reduced presentation
  reduced physics/simulation radius
  same authoritative world semantics
```

Round 1 does not guarantee Zylann supports every renderer equally.

That must be tested.

| ID | Capability / fact | Evidence | Result | Leyforge implication |
|---|---|---|---|---|
| `GOD-CAP-061` | Godot supports renderer choices spanning modern high-end to legacy low-end hardware | `GOD-S12`, `GOD-S13` | `DIRECT` | Strong match for world/profile scalability requirement. |
| `GOD-CAP-062` | Rendering profiles alone do not change simulation truth | architectural boundary | `LEYFORGE RULE` | Graphics and simulation profiles stay separate. |
| `GOD-CAP-063` | Double precision may conflict with lowest hardware goals | `GOD-S06` | `CRITICAL TRADE-OFF` | Precision architecture must be benchmarked with low-end targets. |
| `GOD-CAP-064` | Mobile renderer may be useful on desktop integrated/low-end GPUs | `GOD-S12` | `DIRECT` | Valuable alternative to jumping directly to Compatibility. |

---

# 15. Dedicated Server / Headless Surface

Godot 4 supports headless operation without a separate special server executable architecture.

Official docs support:

- `--headless`;
- dedicated-server export presets;
- automatic `dedicated_server` feature tag;
- stripping visual resources from server exports.

| ID | Capability / fact | Evidence | Result | Leyforge implication |
|---|---|---|---|---|
| `GOD-CAP-065` | Godot can run headless on ordinary platform binaries | `GOD-S07` | `DIRECT` | Strong dedicated-server base. |
| `GOD-CAP-066` | Dedicated-server export mode exists | `GOD-S07` | `DIRECT` | Enables separate server artifact. |
| `GOD-CAP-067` | Dedicated-server feature tag is automatically available for server exports | `GOD-S07` | `DIRECT` | Clean conditional startup/configuration path. |
| `GOD-CAP-068` | Server exports can strip visual assets while preserving resource references | `GOD-S07` | `DIRECT` | Supports smaller server builds. |
| `GOD-CAP-069` | Standard export templates are preferred over editor binary for dedicated servers | `GOD-S07` | `DIRECT` | Production deployment path is explicit. |
| `GOD-CAP-070` | Headless mode does not automatically solve plugin-specific graphics/thread dependencies | PRD-02 + Godot boundary | `P3-NEEDED` | Exact Zylann/Godot build still requires server qualification. |
| `GOD-CAP-071` | One project can contain both client and server startup paths | `GOD-S07` | `DIRECT` | Fits shared simulation code with separate export artifacts. |

---

# 16. Networking Surface — Baseline

Godot supports both low-level networking and its higher-level multiplayer abstractions.

Current built-in `MultiplayerPeer` implementations include:

- ENet;
- WebSocket;
- WebRTC.

Low-level APIs include TCP and UDP.

| ID | Capability / fact | Evidence | Result | Leyforge implication |
|---|---|---|---|---|
| `GOD-CAP-072` | Low-level UDP is available | `GOD-S14` | `DIRECT` | Custom transport/protocol remains possible. |
| `GOD-CAP-073` | Low-level TCP is available | `GOD-S14` | `DIRECT` | Useful for non-realtime/admin/tool traffic where appropriate. |
| `GOD-CAP-074` | High-level multiplayer supports ENet | `GOD-S14` | `DIRECT` | Leading first prototype transport candidate. |
| `GOD-CAP-075` | ENet path supports reliable/unreliable/ordered transfer modes | `GOD-S14` | `DIRECT` | Useful for differentiated Leyforge traffic classes. |
| `GOD-CAP-076` | Godot's high-level multiplayer uses UDP/ENet for ordinary native real-time networking | `GOD-S14` | `DIRECT` | Good fit for authoritative game server prototype. |
| `GOD-CAP-077` | WebSocket multiplayer implementation exists | `GOD-S14` | `DIRECT` | Potential tools/web/backend path, not automatically game transport. |
| `GOD-CAP-078` | WebRTC multiplayer implementation exists | `GOD-S14` | `DIRECT/PARTIAL PLATFORM` | Native platforms may require additional plugin support; web differs. |
| `GOD-CAP-079` | `MultiplayerPeer` can be custom-implemented beneath higher-level API | `GOD-S14` | `EXTENSION` | Leyforge can replace/extend transport later without throwing away all multiplayer logic. |
| `GOD-CAP-080` | Godot networking does not provide Leyforge voxel/world protocol semantics | technology boundary | `NOT-PROVIDED` | PRD-02 networking boundary remains valid. |
| `GOD-CAP-081` | HTML/web networking capabilities differ from native platforms | `GOD-S14` | `DIRECT` | Web cannot be assumed equivalent to desktop server/client target. |

---

# 17. Navigation Surface — Baseline

Godot's built-in navigation stack provides:

- 2D/3D A*;
- navigation meshes;
- runtime navigation-mesh generation;
- agent avoidance;
- dynamic avoidance obstacles.

This is significantly richer than Zylann's experimental voxel A* but operates through a different representation.

| ID | Capability / fact | Evidence | Result | Leyforge implication |
|---|---|---|---|---|
| `GOD-CAP-082` | Godot provides A* in 3D | `GOD-S15` | `DIRECT` | Candidate building block for regional/local route graphs. |
| `GOD-CAP-083` | Godot provides 3D navigation meshes | `GOD-S15` | `DIRECT` | Candidate local navigation representation. |
| `GOD-CAP-084` | Navigation meshes can be generated at runtime/exported game | `GOD-S15` | `DIRECT` | Dynamic voxel-world integration is technically possible. |
| `GOD-CAP-085` | Navigation obstacles support dynamic avoidance | `GOD-S15` | `DIRECT` | Useful crowd/local motion primitive. |
| `GOD-CAP-086` | Dynamic avoidance obstacles can move without navmesh rebuild for avoidance purposes | nav obstacle docs | `DIRECT` | Useful for local agents/vehicles, but not hard path obstruction. |
| `GOD-CAP-087` | Avoidance is not a reliable substitute for hard navigation constraints in narrow/crowded spaces | nav docs | `DIRECT WARNING` | Full movement system still requires path/topology ownership. |
| `GOD-CAP-088` | Godot navigation does not automatically consume Zylann voxel edits | integration boundary | `P3-NEEDED` | Dynamic invalidation/bake architecture remains major prototype. |

---

# 18. Built-In File / Resource Surface

Godot supports:

- text and binary scenes/resources;
- arbitrary binary/text file access;
- JSON;
- configuration files;
- compressed/encrypted file access;
- custom resource formats.

| ID | Capability / fact | Evidence | Result | Leyforge implication |
|---|---|---|---|---|
| `GOD-CAP-089` | Text-based scenes/resources are version-control friendly | `GOD-S17` | `DIRECT` | Good for Forge/dev canonical editable assets where appropriate. |
| `GOD-CAP-090` | Binary resource formats provide faster/larger-data paths | `GOD-S17` | `DIRECT` | Good generated/baked runtime option. |
| `GOD-CAP-091` | `FileAccess` supports raw text/binary data | `GOD-S17` | `DIRECT` | Basic persistence/tooling primitive. |
| `GOD-CAP-092` | Godot can read/write JSON and config formats | `GOD-S17` | `DIRECT` | Suitable for manifests/settings where scale allows. |
| `GOD-CAP-093` | `ResourceSaver` supports extensible resource-format savers | `GOD-S17` | `EXTENSION` | Forge can potentially define custom generated/runtime resource formats. |
| `GOD-CAP-094` | Built-in resource saving does not provide Leyforge whole-world transactional persistence | boundary | `NOT-PROVIDED` | PRD-02 persistence architecture remains external. |

---

# 19. Initial Technology Boundary

Round 1 supports this provisional stack picture:

```text
                    LEYFORGE
                       │
           simulation / authority
           registries / manifests
           save/checkpoints
           Forge
           game networking
           nav integration
                       │
          ┌────────────┴────────────┐
          │                         │
       GODOT                     ZYLANN
          │                         │
   scene/runtime shell        voxel substrate
   renderer                   voxel storage
   input/UI/audio             meshing/edits
   Jolt physics               generator execution
   networking APIs            block streams
   threading primitives       voxel queries
   navigation APIs            lifecycle hooks
   headless/export
          │
          └────────────┬────────────┘
                       ▼
             Leyforge integration
```

The engine provides a large amount of infrastructure.

It still does not replace Leyforge's authoritative domain architecture.

---

# 20. Round-1 Critical Findings

## `GOD-F01 — 4.7.2 is the correct current stable audit baseline`

4.8 is already in development, but using 4.8 dev behaviour as foundation would mix future evidence into current stable architecture.

**Disposition:** pin 4.7.2 until a controlled upgrade audit.

## `GOD-F02 — Large-world precision is an actual architecture choice`

Godot supports double precision, but only through a custom engine build and with meaningful performance/memory cost.

Origin shifting remains a viable alternative with greater gameplay/network complexity.

**Disposition:** critical PRD-06/07 comparison.

## `GOD-F03 — Jolt is the natural first physics candidate`

It is now built in and default for new projects.

It is still not automatically sufficient for Leyforge's ships, huge voxel edit collision workloads or extreme agent counts.

**Disposition:** baseline candidate, stress-test required.

## `GOD-F04 — Godot's renderer tiers map well onto Leyforge scalability`

Forward+, Mobile and Compatibility are genuinely different renderer paths.

This gives the future settings system real engine-level levers.

**Disposition:** strong positive finding; renderer parity/semantic presentation requires testing.

## `GOD-F05 — Dedicated server support is first-class enough to design around`

Godot has explicit headless and dedicated-server export workflows.

**Disposition:** strong baseline, exact Zylann/headless build still P3-required.

## `GOD-F06 — Godot threading supports the project, but does not solve ownership`

WorkerThreadPool and primitives exist.

Godot's thread-safety constraints strongly reinforce worker-compute / owner-commit architecture.

## `GOD-F07 — Godot navigation is a candidate supporting layer, not automatic voxel navigation`

Runtime navmesh generation and avoidance exist, but Zylann edit integration must be designed/prototyped.

## `GOD-F08 — GDExtension is strategically important`

It provides a way to keep heavy native systems outside a custom engine build.

Whether this is enough for Zylann and other specialist systems remains a parity/test question.

---

# 21. Round-1 Risk Register

| Risk | Severity | Reason |
|---|---|---|
| `GOD-R01-01` Double precision enabled globally without evidence | RED | Custom build + low-end cost. |
| `GOD-R01-02` Origin shifting chosen casually | RED | Multiplayer/spatial-frame complexity. |
| `GOD-R01-03` Module path becomes permanent by inertia | AMBER/RED | Custom-engine maintenance debt. |
| `GOD-R01-04` GDExtension chosen only for convenience | AMBER/RED | Required API/perf/headless parity unproven. |
| `GOD-R01-05` Jolt treated as proof of all vessel/physics requirements | RED | Specialist physics remains unproven. |
| `GOD-R01-06` SceneTree mutated freely from worker threads | RED | Thread-safety violation risk. |
| `GOD-R01-07` Forward+ visual effects become semantic requirements | RED | Low-end renderer tiers may lack them. |
| `GOD-R01-08` Compatibility assumed to run full voxel feature set identically | AMBER | Zylann/render integration still requires validation. |
| `GOD-R01-09` Headless server assumed equivalent to visual build | AMBER | Plugins/resources may behave differently. |
| `GOD-R01-10` Godot high-level multiplayer becomes whole Leyforge protocol | RED | Voxel/world/domain protocol remains project-owned. |
| `GOD-R01-11` Godot navmesh becomes universal movement authority | RED | Mover-specific voxel/navigation requirements exceed it. |
| `GOD-R01-12` 4.8 development features silently leak into 4.7 architecture | AMBER | Must separate stable/future evidence. |

---

# 22. Round-1 Prototype Obligations

## `GOD-PKG-01 — Precision Strategy`

Compare:

- standard precision/partitioned local frames;
- standard precision + origin shifting;
- double-precision custom Godot.

Test:

- large travel distances;
- first-person precision;
- voxel editing;
- physics;
- vessel local frame;
- network coordinates;
- Forge placement;
- memory/CPU on low/mid/high hardware.

## `GOD-PKG-02 — Module vs GDExtension`

Use PRD-02 fixture suite.

Compare:

- APIs;
- performance;
- build complexity;
- headless;
- export;
- diagnostics;
- crash behaviour;
- editor tooling;
- upgrade maintenance.

## `GOD-PKG-03 — Jolt Voxel Physics`

Test:

- static voxel terrain collisions;
- rapid terrain edit/collider churn;
- CharacterBody movement;
- carts;
- mounts;
- debris;
- projectiles;
- moving-vessel integration prototype.

## `GOD-PKG-04 — Renderer Tier Matrix`

Run representative Leyforge scene through:

- Forward+;
- Mobile;
- Compatibility where technically supported.

Verify:

- blocky terrain;
- water;
- transparency;
- VFX;
- UI;
- semantic state cues;
- FPS/GPU memory;
- visual fallback correctness.

## `GOD-PKG-05 — Headless Dedicated Server`

Test:

- normal server export;
- stripped visuals;
- Zylann module;
- Zylann GDExtension;
- worldgen;
- voxel queries;
- saves;
- networking;
- long soak.

## `GOD-PKG-06 — Worker / Owner-Commit`

Prototype:

```text
worker computes proposal
        ↓
owner validates/commits
```

Measure against:

```text
coarse main-thread processing
```

for representative world/simulation tasks.

## `GOD-PKG-07 — Godot Nav + Voxel Edit`

Prototype runtime navmesh or hybrid navigation after:

- dig;
- build;
- door;
- bridge collapse;
- ladder;
- structure placement.

Compare against PRD-02 voxel-local A* path.

## `GOD-PKG-08 — Physics Tick / Interpolation Profiles`

Test low/balanced/high:

- physics ticks;
- render FPS;
- interpolation;
- NPC movement;
- mounts;
- combat;
- camera quality;
- network correction.

---

# 23. Round-1 Unknowns

1. Does Leyforge actually require Godot double precision if realms/world regions use hierarchical local coordinates?
2. Can origin shifting coexist cleanly with Zylann streaming, multiplayer and moving vessels?
3. Does the Zylann module compile and behave identically in `precision=double` Godot?
4. Does the Zylann GDExtension support double-precision Godot builds correctly?
5. What save/network ABI consequences arise between float and double engine builds?
6. Should production development use Standard Godot, .NET Godot or both?
7. Which Leyforge systems justify C# over GDScript/native C++?
8. Can one repository/build matrix support module and GDExtension fixtures without excessive complexity?
9. Does Jolt materially outperform Godot Physics for Leyforge's terrain/character workloads?
10. Which Jolt joint differences matter for carts, doors, machinery or vessels?
11. Can vessel-local motion use Jolt bodies without numerical instability at world scale?
12. What physics tick rates remain acceptable under the lowest simulation profile?
13. Which Godot server/thread APIs are safe from WorkerThreadPool tasks?
14. How many worker tasks can coexist with Zylann's own worker pools before contention dominates?
15. Should Leyforge use Godot's WorkerThreadPool or own dedicated worker pools for simulation partitions?
16. Can profiler/task diagnostics attribute worker saturation cleanly enough for support bundles?
17. Does Zylann blocky rendering support Forward+, Mobile and Compatibility at required fidelity?
18. Which shaders/material features fail or differ on Compatibility?
19. Is Mobile renderer the best default low-end desktop profile rather than Compatibility?
20. Should Windows production default to Vulkan or D3D12 given 4.7's current driver maturity?
21. What renderer/driver combinations are required for official support?
22. How should renderer fallback interact with world/profile settings and support diagnostics?
23. Can dedicated-server export strip enough voxel visual data while retaining required collision model resources?
24. Can headless builds avoid RenderingServer dependencies in every required Zylann path?
25. Should dedicated servers run Standard or custom double-precision Godot?
26. Is ENet sufficient for the full Leyforge authoritative server design?
27. Should voxel bulk transport use Godot `MultiplayerPeer` directly rather than high-level replication nodes?
28. Does Godot's ENet implementation provide enough control for voxel traffic classes/congestion policies?
29. What NAT traversal/lobby/discovery technology is required beyond raw ENet?
30. Is WebRTC relevant only to optional web/P2P modes, or should it remain out of core scope?
31. Can runtime Godot Navigation meshes be rebuilt locally enough for highly editable voxel settlements?
32. Can navigation meshes represent caves, multi-level structures, ladders and unusual bodies without excessive fragmentation?
33. Should navigation use Godot navmeshes only as one provider behind a Leyforge route/movement facade?
34. What pathfinding/avoidance performance occurs with hundreds/thousands of local NPC agents?
35. Which canonical editable Forge documents should use Godot text resources versus project-owned schemas?
36. Which generated/baked products should use `.res`/custom binary resources?
37. How stable are resource formats across future Godot minor versions for long-lived Forge artifacts?
38. What engine-level hooks are needed for mod sandboxing/security?
39. Which supporting databases/libraries should remain external rather than relying on Godot file primitives?
40. Which 4.8 features are attractive enough to track but not yet adopt?

---

# 24. Round-1 Gate Result

**PASS — CONTINUE PRD-03**

Godot 4.7.2 remains a credible and well-aligned engine-shell candidate around the Zylann voxel core.

Strong current capabilities include:

- open/customisable engine source;
- GDExtension;
- custom engine/module builds;
- double-precision option;
- built-in Jolt;
- physics interpolation;
- worker-task infrastructure;
- three renderer tiers;
- dedicated-server export;
- ENet and other networking abstractions;
- runtime navigation;
- flexible file/resource systems.

No Round-1 fact disqualifies Godot.

The main unresolved architecture choices are meaningful and measurable rather than vague:

- precision strategy;
- Module vs GDExtension;
- scripting/native-language split;
- physics configuration;
- renderer tiers;
- navigation integration;
- network layer;
- task ownership;
- headless build.

---

# 25. Planned PRD-03 Rounds

1. **Round 1 — Current Godot baseline, build strategy, precision, physics, render, headless, networking/threading surface** — **COMPLETE**
2. **Round 2 — Threading, task scheduling, servers, SceneTree/resource lifetime and native-code boundaries** — **COMPLETE**
3. **Round 3 — Physics, movement, large coordinates, interpolation and vessel-supporting technology** — **COMPLETE**
4. **Round 4 — Navigation, pathfinding, avoidance and dynamic voxel-world integration** — **COMPLETE**
5. **Round 5 — Networking, transport, dedicated-server topology, security and deployment** — **COMPLETE**
6. **Round 6 — Rendering, shaders, GPU, low-end scalability, VFX/audio/input/UI/accessibility** — **COMPLETE**
7. **Round 7 — Files, databases, serialization, mod/plugin sandbox, platform/export, profiling/testing/CI and supporting libraries** — **COMPLETE**
8. **Round 8 — Supporting-technology comparison, risk/prototype reconciliation and PRD-03 closure candidate** — **COMPLETE**

---

# 26. Official Sources — Round 1

- Godot 4.7.2 maintenance release  
  `https://godotengine.org/article/maintenance-release-godot-4-7-2/`
- Godot archive / 4.7.2 stable / 4.8 dev line  
  `https://godotengine.org/download/archive/`
- Godot release policy  
  `https://docs.godotengine.org/en/latest/about/release_policy.html`
- What is GDExtension? (4.7)  
  `https://docs.godotengine.org/en/4.7/engine_details/engine_api/gdextension/what_is_gdextension.html`
- `.gdextension` file (4.7)  
  `https://docs.godotengine.org/en/4.7/engine_details/engine_api/gdextension/gdextension_file.html`
- Large world coordinates  
  `https://docs.godotengine.org/en/stable/tutorials/physics/large_world_coordinates.html`
- Exporting for dedicated servers  
  `https://docs.godotengine.org/en/stable/tutorials/export/exporting_for_dedicated_servers.html`
- Using Jolt Physics  
  `https://docs.godotengine.org/en/4.7/tutorials/physics/using_jolt_physics.html`
- WorkerThreadPool  
  `https://docs.godotengine.org/en/4.7/classes/class_workerthreadpool.html`
- Using multiple threads  
  `https://docs.godotengine.org/en/stable/tutorials/performance/using_multiple_threads.html`
- Internal rendering architecture  
  `https://docs.godotengine.org/en/4.7/engine_details/architecture/internal_rendering_architecture.html`
- System requirements  
  `https://docs.godotengine.org/en/4.7/about/system_requirements.html`
- High-level multiplayer  
  `https://docs.godotengine.org/en/4.7/tutorials/networking/high_level_multiplayer.html`
- Navigation features / obstacles  
  `https://docs.godotengine.org/en/4.7/about/list_of_features.html`  
  `https://docs.godotengine.org/en/4.7/tutorials/navigation/navigation_using_navigationobstacles.html`
- Physics interpolation  
  `https://docs.godotengine.org/en/4.7/tutorials/physics/interpolation/physics_interpolation_quick_start_guide.html`
- ResourceSaver / file features  
  `https://docs.godotengine.org/en/4.7/classes/class_resourcesaver.html`  
  `https://docs.godotengine.org/en/4.7/about/list_of_features.html`

---

**ROUND-1 RESULT: CURRENT GODOT BASELINE + BUILD / PRECISION / PHYSICS / RENDER / HEADLESS / NETWORK / THREADING SURFACE COMPLETE.**

---

# 27. Round-2 Scope

Round 2 deep-dives Godot's actual execution/lifetime boundaries:

- `WorkerThreadPool`;
- explicit `Thread`;
- process thread groups;
- active `SceneTree` access;
- deferred/thread-safe calls;
- global singleton/server APIs;
- `RenderingServer`;
- `PhysicsServer3D`;
- `NavigationServer3D`;
- Resources and the global resource cache;
- background resource loading;
- `Object` vs `RefCounted` lifetime;
- RID/resource lifetime;
- GDExtension/native C++ ownership;
- task dependency/deadlock risks;
- shutdown/drain requirements.

The core engineering question is:

> **What concurrency model can Leyforge safely build on without making authoritative simulation depend on undocumented thread behaviour or unrestricted shared mutation?**

Round-2 answer:

> **Godot strongly supports a worker-compute / bounded-owner-commit architecture. It also offers sub-thread Node groups and direct Server APIs, but these should be specialised tools rather than Leyforge's universal execution model.**

---

# 28. Round-2 Official / Current Source Register

| Ref | Official/current source | Principal use |
|---|---|---|
| `GOD-S18` | Godot 4.7 `WorkerThreadPool` API | Task/group-task semantics, priority and wait lifecycle |
| `GOD-S19` | Thread-safe APIs | SceneTree, servers, resources, GPU/physics/nav thread rules |
| `GOD-S20` | Godot 4.7 `Node` process thread groups | Sub-thread Node processing and communication rules |
| `GOD-S21` | Godot 4.7 core types | Container thread safety and native synchronization primitives |
| `GOD-S22` | Godot `Thread` API | Explicit threads and cleanup/thread-safety checks |
| `GOD-S23` | `RenderingServer` | RID/server-side rendering and render-thread handoff |
| `GOD-S24` | `PhysicsServer3D` | Low-level physics objects independent of Nodes |
| `GOD-S25` | `NavigationServer` usage/threading | Thread-safe queued changes and synchronization phase |
| `GOD-S26` | `ResourceLoader` | Background loading and cache modes |
| `GOD-S27` | Godot object-class architecture | `ObjectID`, `RefCounted`, C++ lifetime rules |
| `GOD-S28` | `Object` / `RefCounted` docs | Script-facing lifetime semantics |
| `GOD-S29` | GDExtension system docs | Native-library boundary |
| `GOD-S30` | Current Node/Node3D source evidence | Deferred transform handling for threaded Node processing |

---

# 29. WorkerThreadPool Deep Dive

Godot's global `WorkerThreadPool` is a ready-made job system.

It is useful, but it is not an ECS scheduler, simulation ownership framework or automatically safe dependency graph.

| ID | Capability / fact | Evidence | Result | Leyforge implication |
|---|---|---|---|---|
| `GOD-CAP-095` | Worker pool is allocated globally at project startup | `GOD-S18` | `DIRECT` | No need to create OS threads for ordinary background jobs. |
| `GOD-CAP-096` | Worker pool supports one-shot tasks | `GOD-S18` | `DIRECT` | Good for bounded asynchronous calculations. |
| `GOD-CAP-097` | Worker pool supports group tasks spread over workers | `GOD-S18` | `DIRECT` | Good for partitioned loops over immutable/snapshot data. |
| `GOD-CAP-098` | Group task thread count can be constrained | `GOD-S18` | `DIRECT` | Leyforge can avoid consuming the whole pool for one subsystem. |
| `GOD-CAP-099` | Tasks expose high/normal priority distinction | `GOD-S18` | `DIRECT` | Useful but too coarse to become whole-game scheduling policy. |
| `GOD-CAP-100` | Tasks can carry descriptions for debugging | `GOD-S18` | `DIRECT` | Should be used for diagnostics/profiling taxonomy. |
| `GOD-CAP-101` | Every submitted task/group must eventually be waited/collected for cleanup | `GOD-S18` | `DIRECT LIFECYCLE RULE` | Task handles cannot be fire-and-forget indefinitely. |
| `GOD-CAP-102` | Waiting from inside another worker task can return busy where scheduling could deadlock | `GOD-S18` | `DIRECT DEADLOCK GUARD` | Nested task dependencies require explicit DAG/ownership design. |
| `GOD-CAP-103` | Small/light jobs may become slower when parallelized | `GOD-S18` | `DIRECT WARNING` | Batch work; do not schedule per voxel/per NPC trivially. |
| `GOD-CAP-104` | Group-task examples assume collection size stays stable during parallel work | `GOD-S18` | `DIRECT` | Snapshot immutable index/range before parallel processing. |
| `GOD-CAP-105` | Pool task IDs expose completion/progress queries | `GOD-S18` | `DIRECT` | Useful for bounded barriers and diagnostics. |
| `GOD-CAP-106` | Worker pool does not supply data ownership/version validation | technology boundary | `NOT-PROVIDED` | Leyforge must own revisions/snapshots/commit validation. |

## 29.1 Recommended WorkerThreadPool use

Strong candidates:

```text
snapshot state
     ↓
batch/partition
     ↓
workers calculate:
  path proposals
  economy proposals
  ecology deltas
  visibility analysis
  worldgen analysis
  Forge bake analysis
     ↓
return immutable result
     ↓
owner validates revision
     ↓
commit
```

Poor candidates:

```text
one task per block
one task per tiny NPC operation
workers freely mutating SceneTree
workers waiting recursively on older tasks
```

---

# 30. Explicit `Thread` Deep Dive

Godot also exposes explicit `Thread` objects.

| ID | Capability / fact | Evidence | Result | Leyforge implication |
|---|---|---|---|---|
| `GOD-CAP-107` | Explicit OS-style threads may execute object methods concurrently | `GOD-S22` | `DIRECT` | Available for long-lived specialist workers where pool semantics are unsuitable. |
| `GOD-CAP-108` | Thread destruction requires correct cleanup and `wait_to_finish()` | `GOD-S22` | `DIRECT LIFETIME RULE` | Long-lived workers require explicit shutdown/drain. |
| `GOD-CAP-109` | Threads must not be destroyed while holding mutexes/waiting semaphores | `GOD-S22` | `DIRECT` | Shutdown architecture must cancel/wake/join safely. |
| `GOD-CAP-110` | `Thread.is_main_thread()` is available | `GOD-S22` | `DIRECT` | Useful assertions/diagnostics at integration boundaries. |
| `GOD-CAP-111` | Godot thread-safety checks are enabled conservatively by default | `GOD-S22` | `DIRECT` | Treat warnings as architectural feedback, not nuisance. |
| `GOD-CAP-112` | Safety checks can be manually disabled in advanced cases | `GOD-S22` | `DANGEROUS ESCAPE HATCH` | Branch-B governance should forbid ordinary use without evidence/waiver. |
| `GOD-CAP-113` | Disabling checks transfers full correctness responsibility to application code | `GOD-S22` | `DIRECT` | Not an acceptable performance shortcut by itself. |

### 30.1 Explicit-thread posture

Use explicit threads only where evidence shows a long-lived dedicated loop/service is superior to:

- Godot's worker pool;
- a Server API;
- Zylann's own tasking;
- asynchronous I/O API.

---

# 31. Active SceneTree Thread Boundary

Godot documentation is explicit:

> **Interacting with the active SceneTree is not thread-safe.**

This is one of the most important Round-2 constraints.

| ID | Capability / fact | Evidence | Result | Leyforge implication |
|---|---|---|---|---|
| `GOD-CAP-114` | Active SceneTree access is not generally thread-safe | `GOD-S19` | `DIRECT CRITICAL` | Authoritative worker simulation must not directly mutate Nodes. |
| `GOD-CAP-115` | `call_deferred()` can marshal operations for later execution | `GOD-S19` | `DIRECT` | Useful main-thread commit/handoff primitive. |
| `GOD-CAP-116` | deferred property setters exist | `GOD-S19` | `DIRECT` | Useful for bounded scene presentation updates. |
| `GOD-CAP-117` | Scene chunks may be constructed off-tree and then attached on main thread in documented cases | `GOD-S19` | `PARTIAL` | Useful for controlled loading, but shared Resource hazards remain. |
| `GOD-CAP-118` | Multi-threaded scene construction can race through shared cached Resources | `GOD-S19` | `DIRECT WARNING` | Prefer immutable resources or one controlled loader/baker. |
| `GOD-CAP-119` | Rendering Node creation/manipulation is not thread-safe by default | `GOD-S19` | `DIRECT` | Worker-owned presentation must use server/deferred boundaries. |
| `GOD-CAP-120` | Node references can become invalid after Nodes are freed | `GOD-S28` | `DIRECT` | Workers should not retain naked Node references as persistent identity. |
| `GOD-CAP-121` | `is_instance_valid()` is required when validity of manually managed Objects is uncertain | `GOD-S28` | `DIRECT` | Prefer stable IDs/domain handles over scene-node identity. |

## 31.1 Leyforge SceneTree rule

The SceneTree should primarily be treated as:

- presentation;
- input;
- local active actors;
- local physics/render integration;
- UI;
- transient scene composition.

It should **not** be the database of all persistent world simulation.

This independently reinforces Foundation/PRD-01 doctrine.

---

# 32. Node Process Thread Groups

Godot's `Node.process_thread_group` provides another concurrency mechanism: a subtree may process on a sub-thread.

This is more structured than arbitrary SceneTree access, but it has strict boundaries.

| ID | Capability / fact | Evidence | Result | Leyforge implication |
|---|---|---|---|---|
| `GOD-CAP-122` | Node subtrees may be assigned to main-thread or sub-thread processing groups | `GOD-S20` | `DIRECT` | Potentially useful for isolated scene-level systems. |
| `GOD-CAP-123` | Child Nodes inherit the nearest explicit process-thread group by default | `GOD-S20` | `DIRECT` | Enables isolated threaded subtrees. |
| `GOD-CAP-124` | Accessing most Nodes outside a sub-thread group is forbidden during group processing | `GOD-S20` | `DIRECT CRITICAL` | Thread groups are isolation domains, not unrestricted SceneTree multithreading. |
| `GOD-CAP-125` | `call_thread_safe()` can marshal a call when caller thread lacks access | `GOD-S20` | `DIRECT` | Useful controlled bridge. |
| `GOD-CAP-126` | deferred calls can target process thread groups | `GOD-S20` | `DIRECT` | Enables explicit inter-group messaging. |
| `GOD-CAP-127` | process-thread group order can coordinate groups | `GOD-S20` | `DIRECT` | Could support staged scene processing, but creates dependency complexity. |
| `GOD-CAP-128` | Node3D source contains special deferred handling because SceneTree transform-change lists are not thread-safe | `GOD-S30` | `GOD-TF-SRC` | Confirms even built-in Node threading must bridge back to main-owned structures. |
| `GOD-CAP-129` | Process thread groups do not automatically make shared external Resources safe | `GOD-S19`, `GOD-S20` | `BOUNDARY` | Resource ownership remains separate concern. |

## 32.1 Thread-group posture

Thread groups are worth prototyping for narrowly isolated active-scene systems, e.g.:

- a self-contained local visual simulation;
- bounded non-authoritative presentation;
- specialised actor clusters.

They should **not** be assumed to replace Leyforge's data-oriented worker/snapshot architecture for civilisation/world simulation.

---

# 33. Global Servers / RID Boundary

Godot's Server APIs are a major alternative to Nodes.

The thread-safe API documentation states most global-scope singletons are thread-safe by default and Server APIs can be accessed from threads, with special project settings applying to rendering/physics thread safety.

| ID | Capability / fact | Evidence | Result | Leyforge implication |
|---|---|---|---|---|
| `GOD-CAP-130` | Low-level Servers can operate without equivalent Nodes in SceneTree | `GOD-S23`, `GOD-S24` | `DIRECT` | Useful where Node overhead/lifetime is unnecessary. |
| `GOD-CAP-131` | Server objects are generally addressed by opaque RIDs | `GOD-S23`, `GOD-S24` | `DIRECT` | RIDs are implementation handles, not canonical Leyforge IDs. |
| `GOD-CAP-132` | Server APIs can be more performant when SceneTree overhead is the bottleneck | `GOD-S23` | `DIRECT CONTEXT` | Use only after profiling, not as default complexity. |
| `GOD-CAP-133` | Server-owned RIDs require explicit freeing/lifetime management | `GOD-S23` | `DIRECT` | Integration layer needs RID ownership registries/RAII. |
| `GOD-CAP-134` | Server APIs do not provide gameplay identity/lifecycle semantics | boundary | `NOT-PROVIDED` | Leyforge domain IDs must remain above RIDs. |
| `GOD-CAP-135` | Global-server access can be thread-friendly within documented server rules | `GOD-S19` | `DIRECT/PARTIAL` | Promising for bulk low-level operations, but per-server constraints matter. |

---

# 34. RenderingServer Thread Boundary

The RenderingServer can bypass Node rendering and can itself run with separate-thread behaviour, but GPU access remains special.

| ID | Capability / fact | Evidence | Result | Leyforge implication |
|---|---|---|---|---|
| `GOD-CAP-136` | RenderingServer exposes low-level render resources through RIDs | `GOD-S23` | `DIRECT` | Potential low-overhead presentation path for extreme counts. |
| `GOD-CAP-137` | `call_on_render_thread()` explicitly marshals work onto the render thread | `GOD-S23` | `DIRECT` | Correct route for code touching rendering internals/RenderingDevice. |
| `GOD-CAP-138` | Direct GPU operations from arbitrary worker threads can stall/synchronize | `GOD-S19` | `DIRECT WARNING` | Forge/runtime GPU asset creation needs staged upload. |
| `GOD-CAP-139` | Separate render-thread project mode exists | `GOD-S19` | `DIRECT` | Potential concurrency option. |
| `GOD-CAP-140` | Official docs warn Separate render-thread mode has known bugs | `GOD-S19` | `AMBER` | Do not assume it is universally production-safe. |
| `GOD-CAP-141` | RenderingServer cannot make GPU-bound scenes faster merely by bypassing Nodes | `GOD-S23` | `DIRECT` | Low-level APIs solve CPU overhead, not GPU saturation. |

---

# 35. PhysicsServer Thread Boundary

`PhysicsServer3D` can directly create spaces, bodies, areas, joints and shapes without Nodes.

Official thread-safe guidance requires separate-thread physics configuration for thread-safe physics-server operation.

| ID | Capability / fact | Evidence | Result | Leyforge implication |
|---|---|---|---|---|
| `GOD-CAP-142` | Physics bodies/shapes/areas can exist entirely outside SceneTree Nodes | `GOD-S24` | `DIRECT` | Potential high-volume/low-level physics integration path. |
| `GOD-CAP-143` | Physics Nodes are wrappers over PhysicsServer objects | `GOD-S24` | `DIRECT` | Clarifies Node vs RID representation boundary. |
| `GOD-CAP-144` | PhysicsServer has self-contained physics spaces | `GOD-S24` | `DIRECT` | Potentially relevant to isolated realms/vessel simulation experiments. |
| `GOD-CAP-145` | Physics server thread-safe operation requires appropriate separate-thread project configuration | `GOD-S19` | `DIRECT CONFIGURATION` | Build/profile decision must be benchmarked. |
| `GOD-CAP-146` | Force-integration callbacks allow lower-level body control | `GOD-S24` | `DIRECT` | Relevant to vessel/cart/advanced-motion research. |
| `GOD-CAP-147` | Low-level PhysicsServer use does not solve gameplay collision ownership or vessel-frame semantics | boundary | `NOT-PROVIDED` | LFE remains authority. |

---

# 36. NavigationServer Thread Boundary

Navigation is unusually thread-friendly in current Godot.

Official docs state:

- NavigationServer is thread-safe;
- query functions may run in true parallel;
- changes are queued and synchronized during the physics frame;
- thread count for parallel map queries is configurable;
- nav resources have internal locks and can become congested when edited concurrently.

| ID | Capability / fact | Evidence | Result | Leyforge implication |
|---|---|---|---|---|
| `GOD-CAP-148` | NavigationServer is thread-safe | `GOD-S19`, `GOD-S25` | `DIRECT` | Strong candidate behind Leyforge local navigation provider. |
| `GOD-CAP-149` | Navigation queries can execute in true parallel | `GOD-S19` | `DIRECT` | Useful for many local path queries. |
| `GOD-CAP-150` | Maximum parallel pathfinding threads are configurable | `GOD-S19` | `DIRECT` | Needs coordination with Zylann/WorkerThreadPool CPU budgets. |
| `GOD-CAP-151` | Navigation changes are queued for a synchronization phase | `GOD-S25` | `DIRECT` | Same-frame writes are not automatically immediately visible. |
| `GOD-CAP-152` | Many getters may reflect prior synchronized state after a same-frame change | `GOD-S25` | `DIRECT CONSISTENCY FACT` | Movement code must understand revision/frame timing. |
| `GOD-CAP-153` | NavigationServer already uses its own thread pool for some work such as avoidance | `GOD-S25` | `DIRECT` | Total CPU scheduler budget spans multiple independent pools. |
| `GOD-CAP-154` | Navigation resources use internal read/write locks | `GOD-S19` | `DIRECT` | Concurrent editing of one huge nav resource can serialize/congest. |
| `GOD-CAP-155` | AStar helper objects are not safe for simultaneous access by multiple threads | `GOD-S19` | `DIRECT` | Per-object ownership/pooling needed if used. |

---

# 37. Resource Cache / Resource Lifetime Boundary

Godot's `Resource` system is globally cached by path by default.

That is convenient for content, but dangerous if workers assume every load returns an independent mutable object.

| ID | Capability / fact | Evidence | Result | Leyforge implication |
|---|---|---|---|---|
| `GOD-CAP-156` | `ResourceLoader.load()` normally reuses cached resources | `GOD-S26` | `DIRECT` | Treat loaded canonical Resources as shared/immutable by default. |
| `GOD-CAP-157` | Resource cache mode can ignore, reuse or replace cached resources | `GOD-S26` | `DIRECT` | Forge/dev workflows can request controlled cache semantics. |
| `GOD-CAP-158` | Background threaded resource requests are built in | `GOD-S26` | `DIRECT` | Useful for scene/content streaming. |
| `GOD-CAP-159` | Background loader may use additional subthreads | `GOD-S26` | `DIRECT` | Faster loads can contend with game/voxel/simulation workers. |
| `GOD-CAP-160` | Official docs warn subthreaded loading can affect main-thread/game performance | `GOD-S26` | `DIRECT` | Loading policy needs global task-budget awareness. |
| `GOD-CAP-161` | References to Resources can be handled across threads | `GOD-S19` | `DIRECT` | Immutable resource snapshots are viable shared inputs. |
| `GOD-CAP-162` | Mutating one unique/shared Resource concurrently from multiple threads is unsupported | `GOD-S19` | `DIRECT CRITICAL` | Forge/runtime compilation should use immutable inputs + generated outputs. |
| `GOD-CAP-163` | Loading/manipulating the same cached Resource from multiple workers can cause unexpected behaviour | `GOD-S19` | `DIRECT WARNING` | Avoid mutable shared-cache worker pipelines. |

## 37.1 Canonical-resource posture

Strong pattern:

```text
authoritative source file
       ↓
load
       ↓
immutable Resource / data snapshot
       ↓
worker computation
       ↓
new generated result
       ↓
main/owner publish
```

Avoid:

```text
many workers
       ↓
same cached Resource
       ↓
mutate in-place
```

---

# 38. `Object` vs `RefCounted` Lifetime

Godot has two materially different ownership models.

## 38.1 Object / Node

Ordinary `Object`/`Node` lifetime may end independently of a stored script/native pointer.

## 38.2 RefCounted

`RefCounted` objects retain themselves while references remain.

| ID | Capability / fact | Evidence | Result | Leyforge implication |
|---|---|---|---|---|
| `GOD-CAP-164` | Ordinary Objects can leave invalid stored references after being freed | `GOD-S28` | `DIRECT` | Never use Node/Object pointer identity as persistent simulation identity. |
| `GOD-CAP-165` | C++ docs recommend storing `ObjectID` rather than raw pointer where another owner may free the Object | `GOD-S27` | `DIRECT` | Native integration should resolve handles at use time where needed. |
| `GOD-CAP-166` | `RefCounted` objects automatically live while references remain | `GOD-S27`, `GOD-S28` | `DIRECT` | Good for immutable task results/snapshots. |
| `GOD-CAP-167` | C++ `Ref<T>` provides shared ownership for RefCounted types | `GOD-S27` | `DIRECT` | Strong native snapshot/result representation option. |
| `GOD-CAP-168` | Raw pointers to RefCounted subclasses are specifically unsafe as ownership storage | `GOD-S27` | `DIRECT` | godot-cpp/native code needs strict ownership conventions. |
| `GOD-CAP-169` | Ref-count cycles can leak | `GOD-S28` | `DIRECT` | Domain object graphs need weak/stable-ID references where cyclic. |
| `GOD-CAP-170` | Reference-counting lifetime does not make object mutation automatically thread-safe | concurrency boundary | `CRITICAL DISTINCTION` | Shared lifetime ≠ shared mutable-state safety. |

---

# 39. Native C++ / GDExtension Boundary

GDExtension lets Leyforge run native code while staying outside the engine binary.

The native code is still bound by Godot's object/thread/lifetime contracts whenever it touches Godot APIs.

| ID | Capability / fact | Evidence | Result | Leyforge implication |
|---|---|---|---|---|
| `GOD-CAP-171` | GDExtension can implement native high-performance data-oriented services | `GOD-S29` | `DIRECT` | Good candidate for hot Leyforge services if script performance is insufficient. |
| `GOD-CAP-172` | Native extension code can own plain C++ data not represented as Nodes | `GOD-S29` + language boundary | `DIRECT` | Useful for simulation kernels/caches/queues. |
| `GOD-CAP-173` | Native code touching Godot Objects must still respect Godot thread-safety rules | `GOD-S19`, `GOD-S29` | `DIRECT` | C++ is not a thread-safety bypass. |
| `GOD-CAP-174` | Native code can use explicit synchronization/atomics appropriate to its own data | `GOD-S21` | `DIRECT` | Allows efficient owned worker data structures. |
| `GOD-CAP-175` | Engine-module access remains broader than public GDExtension API surface | integration boundary | `DIRECT ARCHITECTURE FACT` | Fork/module is an escalation path if public API blocks critical capability. |
| `GOD-CAP-176` | Native module/extension types should not embed game canon into engine/plugin internals | Branch-B/PRD boundary | `LEYFORGE RULE` | Keep semantic law in data/contracts above technology adapter. |

---

# 40. C# / Async Concurrency Boundary — Round-2 Posture

PRD-03 has not yet selected C#.

If C# is used, normal .NET concurrency must still respect Godot's main-thread/SceneTree rules.

Round 2 therefore establishes a technology-neutral rule:

> **Returning from an asynchronous/native task does not imply permission to immediately mutate SceneTree state.**

Every language integration must marshal back through the correct owner/thread boundary.

This applies to:

- GDScript worker tasks;
- explicit Godot threads;
- C# Tasks/threads;
- native C++ workers.

---

# 41. Global CPU Scheduler Problem

Leyforge will not have only one worker pool.

Potential concurrent systems include:

- Godot WorkerThreadPool;
- NavigationServer internal work;
- Zylann worker/task systems;
- resource loader threads;
- rendering thread;
- physics thread;
- Leyforge native workers if added;
- OS/network/I/O work.

Round 2 therefore identifies an important architecture requirement:

> **Thread-safe does not mean budget-safe.**

Each subsystem may individually be correct while collectively oversubscribing the CPU.

| ID | Capability / fact | Evidence | Result | Leyforge implication |
|---|---|---|---|---|
| `GOD-CAP-177` | Multiple Godot subsystems may use independent internal workers | `GOD-S18`, `GOD-S25`, PRD-02 | `DIRECT` | Need global observability and workload budgeting. |
| `GOD-CAP-178` | Resource loading can add subthread pressure | `GOD-S26` | `DIRECT` | Streaming must coordinate with simulation/worldgen peaks. |
| `GOD-CAP-179` | Navigation has configurable parallelism | `GOD-S19` | `DIRECT` | One tuning lever for CPU-budget profiles. |
| `GOD-CAP-180` | WorkerThreadPool task count can be constrained per group task | `GOD-S18` | `DIRECT` | Another tuning lever. |
| `GOD-CAP-181` | Zylann also schedules threaded world work | PRD-02 | `DIRECT CROSS-TECH FACT` | PRD-04 needs one system-level scheduling/budget model. |
| `GOD-CAP-182` | No built-in Godot system globally arbitrates all subsystem CPU budgets for Leyforge | technology boundary | `NOT-PROVIDED` | Leyforge needs profiling/budget policy, not necessarily one replacement scheduler. |

---

# 42. Proposed Leyforge Execution Roles — Candidate

Round 2 produces a concrete, still-provisional execution-role model.

```text
ROLE 1 — AUTHORITATIVE OWNER
  owns canonical mutable state
  validates revision
  commits result
  publishes events/snapshots

ROLE 2 — WORKER
  receives immutable/bounded input
  computes proposal/result
  does not mutate foreign canonical state

ROLE 3 — ENGINE SERVER
  owns low-level physics/render/nav RID state
  receives explicit commands/projections

ROLE 4 — SCENE REPRESENTATION
  Nodes for local active presentation/input/actors
  not persistent world truth

ROLE 5 — I/O / STREAM
  loads/saves bounded data
  completion reported back to owner/checkpoint coordinator
```

A concrete simulation flow:

```text
Owner revision 410
       ↓ snapshot
Worker computes proposal against r410
       ↓
World has advanced to r412
       ↓
Owner validates:
   still applicable?
   merge?
   reject/recompute?
       ↓
Commit r413
       ↓
Spatial/domain events
       ↓
Scene / Servers / persistence projection
```

This is much safer than locking the world while workers calculate.

Final ownership/granularity belongs to PRD-04/LFE.

---

# 43. SceneTree Role Classification

Round 2 classifies candidate SceneTree uses.

## 43.1 Appropriate

- local player;
- locally active characters/mobs;
- visible structures/components;
- cameras;
- input;
- UI;
- audio emitters;
- VFX;
- local physics wrappers;
- Forge/editor interface;
- scene composition.

## 43.2 Poor fit as canonical authority

- every historical person;
- every settlement;
- all distant ecology;
- economy ledger;
- world history;
- unloaded machinery;
- regional water;
- worldgen feature ownership;
- canonical registries;
- save journal;
- server-wide interest state.

This is consistent with PRD-01's engine-neutral SceneTree doctrine.

---

# 44. Round-2 Risk Register

| Risk | Severity | Reason |
|---|---|---|
| `GOD-R02-01` SceneTree mutation from workers | RED | Explicitly unsupported. |
| `GOD-R02-02` Shared cached Resources mutated from workers | RED | Unsupported/racy. |
| `GOD-R02-03` Worker tasks wait recursively and deadlock | RED | WorkerThreadPool documents scheduling deadlock case. |
| `GOD-R02-04` Fire-and-forget task handles never collected | AMBER | Task resources require completion wait. |
| `GOD-R02-05` Tiny tasks flood worker pool | AMBER/RED | Scheduling overhead can exceed work. |
| `GOD-R02-06` One subsystem consumes all worker capacity | AMBER | Group tasks may fan across all workers by default. |
| `GOD-R02-07` Multiple independent worker pools oversubscribe CPU | RED at scale | Godot/Zylann/nav/loading may all compete. |
| `GOD-R02-08` Thread-safety checks disabled to suppress errors | RED | Transfers correctness to Leyforge without proof. |
| `GOD-R02-09` Process thread groups treated as unrestricted SceneTree threading | RED | Cross-group access remains forbidden. |
| `GOD-R02-10` Server RID leaked/double-freed | AMBER/RED | Low-level server lifetime becomes explicit. |
| `GOD-R02-11` Separate rendering/physics thread modes enabled globally without profiling | AMBER | Can shift bugs/contention rather than improve performance. |
| `GOD-R02-12` Same nav/resource object edited concurrently by many workers | AMBER/RED | Internal locks can serialize/congest; resource mutation unsupported. |
| `GOD-R02-13` Node/Object pointer retained as simulation identity | RED | Lifetime invalidation and representation coupling. |
| `GOD-R02-14` RefCounted mistaken for thread-safe mutable state | RED | Lifetime safety ≠ mutation safety. |
| `GOD-R02-15` Native C++ used to bypass engine safety contract | RED | Same Godot APIs remain constrained. |
| `GOD-R02-16` Background loader saturates CPU during worldgen/simulation peak | AMBER | `use_sub_threads` can affect main/game performance. |
| `GOD-R02-17` Navigation changes assumed immediately visible | AMBER | Server synchronizes queued changes later in physics frame. |
| `GOD-R02-18` Low-level Server APIs adopted everywhere before profiling | AMBER | Complexity gains nothing if SceneTree is not bottleneck. |

---

# 45. Round-2 Prototype / Benchmark Packages

## `GOD-PKG-09 — Worker Proposal / Owner Commit`

Representative state:

- 10k persistent people summaries;
- ecology cells;
- economy market calculations;
- one construction/planning batch.

Compare:

1. main-thread/coarse processing;
2. WorkerThreadPool snapshots + owner commit;
3. native data-oriented worker implementation if necessary.

Measure:

- wall time;
- main-thread stalls;
- worker occupancy;
- rejected stale proposals;
- determinism;
- allocation;
- low-core scaling.

## `GOD-PKG-10 — Task DAG / Deadlock Torture`

Construct:

- nested tasks;
- older/newer dependency edges;
- cancellation/shutdown;
- save/world unload during work.

Goal:

- prove Leyforge's task policy never relies on unsafe worker waits;
- define completion/barrier APIs.

## `GOD-PKG-11 — Scene Thread Group Experiment`

Place a self-contained non-authoritative scene subsystem in a sub-thread group.

Test:

- local processing;
- cross-group messages;
- deferred main-thread updates;
- destruction/unload;
- profiling.

Goal:

- determine whether thread groups deserve any production role or should remain avoided.

## `GOD-PKG-12 — Server-vs-Node Scale`

Represent a high-volume simple object set through:

- Nodes;
- direct Server RIDs;
- MultiMesh where appropriate.

Measure:

- CPU;
- memory;
- lifecycle cost;
- code complexity.

Goal:

- define the threshold where low-level Server APIs actually pay for themselves.

## `GOD-PKG-13 — Resource Cache Concurrency`

Test:

- one loader;
- many background loads;
- `use_sub_threads`;
- shared Resource reuse;
- immutable resources;
- attempted concurrent mutation;
- Forge reload/replace cache mode.

Goal:

- establish safe immutable-resource/bake rules.

## `GOD-PKG-14 — World Shutdown / Worker Drain`

During:

- worldgen;
- nav queries;
- resource loading;
- Leyforge worker tasks;
- Zylann save work;

trigger world exit/server shutdown.

Success:

- no dangling task;
- no Node/RID access after release;
- no deadlock;
- bounded shutdown;
- correct checkpoint.

## `GOD-PKG-15 — Global CPU Contention Matrix`

Artificially combine:

- Zylann generation/meshing;
- 100s navigation queries;
- resource streaming;
- Leyforge group tasks;
- save work.

Run on:

- 4-thread low target;
- 8-thread mid;
- high-core desktop.

Goal:

- derive subsystem concurrency budgets rather than relying on all-default thread counts.

## `GOD-PKG-16 — Native Extension Service`

Implement one simple data-oriented service twice:

- GDScript/WorkerThreadPool;
- C++ GDExtension.

Keep the same Leyforge-facing interface.

Measure:

- performance;
- allocations;
- build complexity;
- diagnostics;
- shutdown;
- portability.

Goal:

- establish an evidence threshold for promoting a service to native code.

---

# 46. Round-2 Resolved / Narrowed Round-1 Unknowns

## Unknown 13 — server/thread API safety

Narrowed substantially:

- NavigationServer is explicitly thread-safe/thread-friendly.
- Rendering/physics server thread-safe operation has project-setting/thread-model caveats.
- active SceneTree remains unsafe from arbitrary workers.

The remaining question is **which servers Leyforge will actually use directly and under which project thread settings**.

## Unknown 14 — contention with Zylann

Strengthened rather than resolved:

> Godot has multiple internal/pool-based concurrency systems, so contention with Zylann is a first-class benchmark problem.

## Unknown 15 — WorkerThreadPool vs dedicated Leyforge workers

Narrowed:

- use WorkerThreadPool as the baseline for bounded data jobs;
- dedicated workers/native service require measured benefit or different lifetime semantics.

## Unknown 16 — task diagnostics

Partially narrowed:

- WorkerThreadPool supports task descriptions/progress;
- whole-stack CPU attribution across Godot/Zylann/nav/resource loading remains to be proven.

## Unknown 31 — voxel nav rebuild

Narrowed technologically:

- NavigationServer is thread-safe and runtime-capable;
- PRD-02 exposes voxel edit regions;
- exact voxel→navigation incremental representation remains P3.

---

# 47. Round-2 New Unknowns

1. How many WorkerThreadPool workers does Godot 4.7.2 allocate on each target CPU configuration?
2. Can/should Leyforge globally constrain pool size, or only constrain individual group tasks?
3. How should high-priority tasks be governed so they cannot starve ordinary/background work?
4. What cancellation model should Leyforge use for WorkerThreadPool jobs that Godot cannot forcibly stop?
5. Should workers receive immutable copied snapshots, shared read-only arrays, or versioned native buffers?
6. What snapshot copy cost becomes unacceptable at civilisation scale?
7. What merge strategy is valid when a worker result was computed against an older owner revision?
8. Which simulation owners can commit independently without requiring one global main-thread commit bottleneck?
9. Can authoritative owner commits themselves be partitioned onto separate dedicated owner threads?
10. What operations are safe enough for process thread groups to justify their complexity?
11. Are process thread groups compatible with every Node type Leyforge would want to place there?
12. How are process-thread-group errors surfaced in release vs debug exports?
13. Do direct RenderingServer/PhysicsServer calls produce measurable gains for any Leyforge workloads?
14. Should high-volume transient VFX/markers/ambient objects use direct RIDs, MultiMesh or Nodes?
15. Which Server RIDs can be safely created/freed off-main-thread under our chosen project settings?
16. What render/physics separate-thread settings are stable with Zylann and Jolt in 4.7.2?
17. Does running physics separately increase latency/complexity for authoritative owner commits?
18. How should NavServer synchronization revisions be exposed to movement logic so same-frame stale queries are understood?
19. How many parallel nav query threads are optimal on low/mid/high hardware?
20. Can a huge settlement use many smaller nav maps/resources to avoid one internally locked giant resource?
21. What Resource types are safe to construct/manipulate off-thread under each renderer/build?
22. Which Forge-generated Resources must be immutable after publication?
23. Can cache-replace workflows provide safe editor hot reload without mutating Resources used by active workers?
24. Should runtime game definitions avoid Godot Resources entirely after compile and live in Leyforge-native immutable tables?
25. How should ObjectID lookup be guarded against object destruction between lookup and operation?
26. Which task-result types should derive from RefCounted versus use plain native data?
27. How will C# garbage collection interact with RefCounted-heavy simulation data if C# is chosen?
28. Does GDExtension expose enough diagnostics to profile native worker jobs alongside GDScript/Godot work?
29. What native thread primitives should a GDExtension service use: Godot primitives, C++ standard primitives, or a limited abstraction?
30. Should long-lived native workers share CPUs with WorkerThreadPool or be avoided entirely?
31. What explicit drain order is required at WorldSession teardown across Leyforge workers, NavigationServer jobs, Zylann tasks and resource loads?
32. Can pending ResourceLoader requests be cancelled or safely abandoned on world switch?
33. What task-generation ID scheme prevents old-world worker results being committed into a new WorldSession?
34. Should every asynchronous proposal carry WorldID/RealmID/revision/owner ID for stale-result rejection?
35. What diagnostics identify pool saturation versus lock contention versus main-thread commit congestion?
36. How should low-end simulation profiles reduce concurrent worker pressure as well as total work?
37. Can heavy background Forge compilation run while a playable world is active without stealing simulation/voxel workers?
38. Should developer Forge builds and player builds have different worker/task budgets?
39. Which Godot thread model options materially change crash risk on each supported renderer/platform?
40. Which 4.8 threading improvements, if any, justify a controlled upgrade later?

---

# 48. Round-2 Architecture Boundary Verdict

Round 2 strongly supports this provisional execution model:

```text
                 CANONICAL LEYFORGE STATE
                          │
                    OWNER/PARTITION
                          │
               immutable/versioned input
                          │
             ┌────────────┼────────────┐
             │            │            │
        Godot workers   Zylann jobs  Nav queries
             │            │            │
             └────────────┼────────────┘
                          │
                   result/proposal
                          │
                    owner validates
                          │
                       COMMIT
                          │
         ┌────────────────┼─────────────────┐
         │                │                 │
      SceneTree         Servers         persistence
   local projection   RID projection   journal/snapshot
```

The main thread may host some owners, but **"owner" is a semantic consistency concept, not necessarily "everything commits on one global thread forever."**

PRD-04 must determine partitioning and commit topology.

---

# 49. Round-2 Gate Result

**PASS — CONTINUE PRD-03**

Godot's threading architecture is compatible with Leyforge's emerging design provided the project obeys strict boundaries:

- active SceneTree is not shared mutable world state;
- workers operate on bounded/versioned data;
- shared Resources are treated as immutable unless exclusively owned;
- task dependencies avoid unsafe nested waits;
- low-level Servers remain projections/technology handles;
- native C++ obeys the same ownership rules;
- all asynchronous world work participates in explicit lifetime/drain policy.

No evidence currently requires a custom global job system.

No evidence currently supports allowing arbitrary concurrent mutation of canonical game state.

---

# 50. Updated PRD-03 Round Sequence

1. **Round 1 — Current Godot baseline, build strategy, precision, physics, render, headless, networking/threading surface** — **COMPLETE**
2. **Round 2 — Threading, task scheduling, servers, SceneTree/resource lifetime and native-code boundaries** — **COMPLETE**
3. **Round 3 — Physics, movement, large coordinates, interpolation and vessel-supporting technology** — **NEXT**
4. **Round 4 — Navigation, pathfinding, avoidance and dynamic voxel-world integration**
5. **Round 5 — Networking, transport, dedicated-server topology, security and deployment**
6. **Round 6 — Rendering, shaders, GPU, low-end scalability, VFX/audio/input/UI/accessibility**
7. **Round 7 — Files, databases, serialization, mod/plugin sandbox, platform/export, profiling/testing/CI and supporting libraries**
8. **Round 8 — Supporting-technology comparison, risk/prototype reconciliation and PRD-03 closure candidate**

---

# 51. Additional Official / Current Sources Used in Round 2

- WorkerThreadPool 4.7  
  `https://docs.godotengine.org/en/4.7/classes/class_workerthreadpool.html`
- Thread-safe APIs  
  `https://docs.godotengine.org/en/stable/tutorials/performance/thread_safe_apis.html`
- Node process thread groups  
  `https://docs.godotengine.org/en/stable/classes/class_node.html`
- Core types / native synchronization  
  `https://docs.godotengine.org/en/4.7/engine_details/architecture/core_types.html`
- Thread API  
  `https://docs.godotengine.org/en/stable/classes/class_thread.html`
- RenderingServer  
  `https://docs.godotengine.org/en/stable/classes/class_renderingserver.html`
- PhysicsServer3D 4.7  
  `https://docs.godotengine.org/en/4.7/classes/class_physicsserver3d.html`
- NavigationServer usage  
  `https://docs.godotengine.org/en/stable/tutorials/navigation/navigation_using_navigationservers.html`
- ResourceLoader  
  `https://docs.godotengine.org/en/4.7/classes/class_resourceloader.html`
- Object-class architecture 4.7  
  `https://docs.godotengine.org/en/4.7/engine_details/architecture/object_class.html`
- Object / RefCounted APIs  
  `https://docs.godotengine.org/en/stable/classes/class_object.html`  
  `https://docs.godotengine.org/en/stable/classes/class_refcounted.html`
- GDExtension system 4.7  
  `https://docs.godotengine.org/en/4.7/engine_details/engine_api/gdextension/index.html`
- Current Node3D source evidence  
  `https://github.com/godotengine/godot/blob/master/scene/3d/node_3d.cpp`

---

**ROUND-2 RESULT: THREADING / TASK / SCENETREE / SERVER / RESOURCE-LIFETIME / NATIVE-CODE BOUNDARY AUDIT COMPLETE.**

---

# 52. Round-3 Scope

Round 3 audits Godot's 3D physical-execution surface against Leyforge's requirements:

- Jolt vs Godot Physics;
- static, kinematic, animatable, character and rigid bodies;
- moving platforms;
- terrain collision;
- primitive/convex/concave shape strategy;
- contact reporting;
- continuous collision detection;
- custom force integration;
- direct physics-space queries;
- moving bodies and fast motion;
- large-world precision;
- physics interpolation;
- physics tick-rate scaling;
- carts/mounts/vehicles;
- moving-vessel supporting primitives;
- isolated physics spaces;
- custom physics-extension escape hatches.

The engineering question is:

> **Can Godot/Jolt provide the local physical substrate Leyforge needs without becoming the authority for movement, vessels or world state?**

Round-3 answer:

> **YES. Godot 4.7.2/Jolt provides a strong general-purpose 3D physics substrate and useful character/moving-platform APIs. The major remaining risks are dynamic voxel-derived collision, very large coordinates, high-speed movement, massive active-body counts and vessel-local physics.**

---

# 53. Round-3 Official / Current Source Register

| Ref | Official/current source | Principal use |
|---|---|---|
| `GOD-S31` | Godot 4.7 `PhysicsServer3D` | Body modes, spaces, force callbacks, motion testing, direct physics access |
| `GOD-S32` | Using Jolt Physics 4.7 | Jolt/Godot-Physics differences |
| `GOD-S33` | `CharacterBody3D` | Scripted character movement and moving-platform behaviour |
| `GOD-S34` | `AnimatableBody3D` | Moving platforms/doors and physics-synchronised scripted movement |
| `GOD-S35` | `RigidBody3D` / `PhysicsDirectBodyState3D` | Forces, custom integrator, contacts, inertia and direct-body state |
| `GOD-S36` | `PhysicsDirectSpaceState3D` | Ray/shape/motion queries |
| `GOD-S37` | Collision shapes (3D) | Primitive/convex/concave performance and validity boundaries |
| `GOD-S38` | `ConvexPolygonShape3D` / `ConcavePolygonShape3D` | Dynamic-body collision constraints |
| `GOD-S39` | VehicleBody3D / physics troubleshooting | Vehicle limitations and high-speed physics |
| `GOD-S40` | Large world coordinates | Precision thresholds and double/origin-shift trade-off |
| `GOD-S41` | Physics interpolation docs | Tick/render separation, teleports, camera/manual interpolation |
| `GOD-S42` | Godot 4.7 feature list | Supported body/physics categories |
| `GOD-S43` | `Area3D` | Local gravity/damping/trigger regions |
| `GOD-S44` | `PhysicsServer3DExtension` / direct-space-state extension | Custom physics backend/extension escape hatch |

---

# 54. Physics Body Taxonomy

Godot exposes several distinct body types rather than one universal physics object.

| ID | Capability / fact | Evidence | Result | Leyforge implication |
|---|---|---|---|---|
| `GOD-CAP-183` | Static bodies represent non-simulated level/world collision | `GOD-S31`, `GOD-S42` | `DIRECT` | Natural fit for voxel terrain collision chunks. |
| `GOD-CAP-184` | Kinematic server bodies move by code and collide along their path | `GOD-S31` | `DIRECT` | Low-level movement primitive. |
| `GOD-CAP-185` | Rigid bodies are force/inertia-driven | `GOD-S31`, `GOD-S35` | `DIRECT` | Candidate for debris, carts, physical objects and vessel rigid-body shell. |
| `GOD-CAP-186` | Rigid-linear mode prevents rotation | `GOD-S31` | `DIRECT` | Useful specialised body mode. |
| `GOD-CAP-187` | CharacterBody3D is script-driven and not force-driven | `GOD-S33` | `DIRECT` | Strong player/NPC locomotion candidate. |
| `GOD-CAP-188` | AnimatableBody3D is manually moved but influences bodies in its path | `GOD-S34` | `DIRECT` | Good doors/lifts/platform candidate. |
| `GOD-CAP-189` | Areas detect overlaps and can override gravity/damping | `GOD-S31`, `GOD-S43` | `DIRECT` | Useful for hazards, water volumes, magic/gravity fields and triggers. |
| `GOD-CAP-190` | Physics body category does not define gameplay identity | architecture boundary | `LEYFORGE RULE` | Body is a runtime physical projection only. |

---

# 55. CharacterBody3D Deep Dive

`CharacterBody3D` is a high-level scripted movement body intended for player-controlled or otherwise explicitly controlled characters.

| ID | Capability / fact | Evidence | Result | Leyforge implication |
|---|---|---|---|---|
| `GOD-CAP-191` | CharacterBody3D provides `move_and_slide()` | `GOD-S33` | `DIRECT` | Strong baseline for player/local NPC movement. |
| `GOD-CAP-192` | Floor/wall/ceiling classification uses configurable up direction and slope angle | `GOD-S33` | `DIRECT` | Supports grounded movement on irregular terrain. |
| `GOD-CAP-193` | Floor snapping is built in | `GOD-S33` | `DIRECT` | Useful for blocky slopes/steps and stable ground following. |
| `GOD-CAP-194` | Character movement can use grounded or floating motion modes | `GOD-S33` | `DIRECT` | Potential shared primitive for walking vs swimming/flying-like collision movement. |
| `GOD-CAP-195` | Moving platform velocity is automatically incorporated by `move_and_slide()` | `GOD-S33` | `DIRECT` | Strong evidence for basic lift/platform and vessel-deck experiments. |
| `GOD-CAP-196` | Character exposes moving-platform linear and angular velocity information | `GOD-S33` | `DIRECT` | Useful for leaving-platform behaviour and local-frame analysis. |
| `GOD-CAP-197` | Platform collision layers can be filtered | `GOD-S33` | `DIRECT` | Useful for selective moving surfaces. |
| `GOD-CAP-198` | Leaving a platform can inherit platform velocity | `GOD-S33` | `DIRECT` | Important for jumping from moving carts/vessels. |
| `GOD-CAP-199` | `move_and_slide()` is intended for physics-tick processing | `GOD-S33` | `DIRECT` | Movement must align with physics cadence/interpolation. |
| `GOD-CAP-200` | CharacterBody3D does not automatically implement stamina, climbing, swimming, ladders, traversal abilities or network authority | technology boundary | `NOT-PROVIDED` | Movement semantics remain Set-30/Leyforge-owned. |

## 55.1 Character posture

Use `CharacterBody3D` as the first **physical movement executor**, not as the movement-system authority.

Candidate flow:

```text
Leyforge Mover Profile
        ↓
desired movement / traversal state
        ↓
CharacterBody3D executor
        ↓
collision result
        ↓
Leyforge movement state / evidence
```

---

# 56. AnimatableBody3D / Moving Platform Surface

`AnimatableBody3D` is intended for bodies moved by script or animation that should influence other physics bodies.

| ID | Capability / fact | Evidence | Result | Leyforge implication |
|---|---|---|---|---|
| `GOD-CAP-201` | Animatable bodies estimate linear/angular velocity from manual movement | `GOD-S34` | `DIRECT` | Good ordinary moving-platform behaviour. |
| `GOD-CAP-202` | AnimatableBody3D is explicitly useful for moving platforms and doors | `GOD-S34` | `DIRECT` | Strong fit for lifts/doors/simple moving mechanisms. |
| `GOD-CAP-203` | `sync_to_physics` aligns scripted movement with physics frames | `GOD-S34` | `DIRECT` | Avoids idle-frame platform inconsistencies. |
| `GOD-CAP-204` | Animatable bodies cannot be moved by external forces | `GOD-S34` | `DIRECT` | Not a buoyant/free-dynamic ship solution. |
| `GOD-CAP-205` | Animatable platform behaviour can transfer velocity to CharacterBody3D | `GOD-S33`, `GOD-S34` | `DIRECT` | Useful vessel-deck/local-platform experiment. |

---

# 57. RigidBody3D / Direct Integration Surface

Rigid bodies expose the physical state required for advanced dynamics.

| ID | Capability / fact | Evidence | Result | Leyforge implication |
|---|---|---|---|---|
| `GOD-CAP-206` | RigidBody3D exposes mass, inertia, center of mass and damping | `GOD-S35` | `DIRECT` | Necessary ingredients for carts/vessels/debris. |
| `GOD-CAP-207` | Constant and instantaneous forces/torques/impulses are supported | `GOD-S35` | `DIRECT` | Enables thrust, buoyancy forces, impacts and control forces. |
| `GOD-CAP-208` | Custom force integration can be enabled | `GOD-S35` | `DIRECT` | Strong extension point for specialist physical models. |
| `GOD-CAP-209` | `PhysicsDirectBodyState3D` exposes linear/angular velocity, inertia, center of mass and timestep | `GOD-S35` | `DIRECT` | Useful for custom vessel/cart physics. |
| `GOD-CAP-210` | Direct body state exposes contact normals, impulses and collider velocities when contact reporting is enabled | `GOD-S35` | `DIRECT` | Useful damage/impact/grounding evidence. |
| `GOD-CAP-211` | Direct body state can query its physics space | `GOD-S35` | `DIRECT` | Enables specialist collision/shape queries during physics. |
| `GOD-CAP-212` | Bodies can sleep when inactive | `GOD-S31`, `GOD-S35` | `DIRECT` | Important active-body scaling tool. |
| `GOD-CAP-213` | Axis locks are available | `GOD-S31` | `DIRECT` | Useful for constrained prototypes/simple vehicles. |
| `GOD-CAP-214` | Contact monitoring is opt-in and has configurable contact-count cost | `GOD-S35` | `DIRECT` | Consequential contact evidence should be enabled selectively. |

---

# 58. Jolt vs Godot Physics — Round-3 Detail

Jolt is the current leading backend, but API parity is not perfect.

| ID | Capability / fact | Evidence | Result | Leyforge implication |
|---|---|---|---|---|
| `GOD-CAP-215` | Jolt is integrated and default for new projects | `GOD-S32` | `DIRECT` | Baseline physics candidate. |
| `GOD-CAP-216` | Godot Physics remains an available alternative | `GOD-S32` | `DIRECT` | A/B fallback/control backend. |
| `GOD-CAP-217` | Several joint soft-limit properties are unsupported by Jolt through Godot's current joint interface | `GOD-S32` | `DIRECT DIFFERENCE` | Mechanical/vessel constraints must use actually supported parameters. |
| `GOD-CAP-218` | Joint solver priority is ignored by Jolt | `GOD-S31`, `GOD-S32` | `DIRECT DIFFERENCE` | Do not architect machinery around priority ordering. |
| `GOD-CAP-219` | Some single-body joint frame behaviour differs between backends | `GOD-S32` | `DIRECT DIFFERENCE` | Backend switches can change physical results. |
| `GOD-CAP-220` | Physics-backend interchange cannot be assumed bit-identical/deterministic | technology implication | `P3/P4-NEEDED` | Multiplayer must not depend on independent client physics producing identical state. |

---

# 59. Collision Shape Strategy

This is one of the most consequential Round-3 findings.

Official Godot guidance strongly prefers primitive shapes for dynamic bodies.

| ID | Capability / fact | Evidence | Result | Leyforge implication |
|---|---|---|---|---|
| `GOD-CAP-221` | Primitive collision shapes are fastest/recommended for dynamic bodies | `GOD-S37` | `DIRECT` | Use for characters, simple entities and coarse vessel parts where possible. |
| `GOD-CAP-222` | Convex collision can represent arbitrary convex geometry | `GOD-S37`, `GOD-S38` | `DIRECT` | Strong candidate for complex moving objects. |
| `GOD-CAP-223` | Multiple convex shapes can approximate concave dynamic bodies | `GOD-S38` | `DIRECT` | Key vessel-hull collision candidate. |
| `GOD-CAP-224` | Runtime convex decomposition is possible | `GOD-S38` | `DIRECT / COSTLY` | Could generate collision from commissioned hull, but must be benchmarked. |
| `GOD-CAP-225` | Concave/trimesh collision is the slowest shape family | `GOD-S37`, `GOD-S38` | `DIRECT` | Reserve for static terrain/level geometry. |
| `GOD-CAP-226` | Concave shapes are intended for static bodies and are unsuitable for ordinary dynamic rigid/character bodies | `GOD-S37`, `GOD-S38` | `HARD BOUNDARY` | Exact arbitrary voxel mesh cannot simply become one dynamic ship collider. |
| `GOD-CAP-227` | Concave shapes are hollow rather than volumetric | `GOD-S38` | `DIRECT` | Poor hull/body representation for dynamics. |
| `GOD-CAP-228` | Many collision shapes on one body can reduce broad-phase efficiency | `GOD-S37` | `DIRECT PERFORMANCE WARNING` | Hull decomposition must be bounded/simplified. |
| `GOD-CAP-229` | Transforming many collision shapes can reduce physics optimizations | `GOD-S37` | `DIRECT` | Prefer baked local hull proxies. |
| `GOD-CAP-230` | Visual mesh and collision representation should be allowed to differ | `GOD-S37` | `DIRECT DESIGN GUIDANCE` | Crucial for voxel terrain and vessel performance. |

## 59.1 Vessel collision implication

Leading hypothesis:

```text
Vessel voxel truth
       ↓
visual block mesh
       │
       └──────────────┐
                      ↓
              collision compiler
                simplify / merge
                      ↓
          primitive + convex proxies
                      ↓
                RigidBody3D/Jolt
```

The collision compiler becomes part of the vessel commissioning/repair pipeline.

---

# 60. Static Voxel Terrain Collision

PRD-02 established that Zylann can generate static voxel collision.

Godot's collision-shape guidance supports this role because concave/static geometry is appropriate for level collision.

| ID | Capability / fact | Evidence | Result | Leyforge implication |
|---|---|---|---|---|
| `GOD-CAP-231` | Static terrain may legitimately use detailed concave collision | `GOD-S37` | `DIRECT` | Aligns with voxel terrain chunk colliders. |
| `GOD-CAP-232` | Terrain collision details can be simplified separately from visual geometry | `GOD-S37` | `DIRECT` | Potential optimisation if Zylann collision path permits. |
| `GOD-CAP-233` | Collider regeneration after voxel edits remains a CPU/physics cost | PRD-02 + physics boundary | `P3/P4-NEEDED` | Edit bursts need collision-budget testing. |
| `GOD-CAP-234` | Physics readiness may lag voxel-data/visual-mesh readiness | PRD-02 + server lifecycle | `ARCHITECTURE FACT` | Spawn/nav/teleport activation needs explicit physics-ready evidence. |

---

# 61. Direct Physics Queries

Godot exposes direct space queries separately from persistent physics bodies.

| ID | Capability / fact | Evidence | Result | Leyforge implication |
|---|---|---|---|---|
| `GOD-CAP-235` | Ray intersections are available | `GOD-S36` | `DIRECT` | Useful projectiles/interactions/ground tests. |
| `GOD-CAP-236` | Shape intersection queries are available | `GOD-S36` | `DIRECT` | Useful placement/occupancy/volumetric checks. |
| `GOD-CAP-237` | Shape cast/motion testing is available | `GOD-S31`, `GOD-S36` | `DIRECT` | Useful mover/vessel future-motion checks. |
| `GOD-CAP-238` | Body motion can be tested through PhysicsServer without actually committing movement | `GOD-S31` | `DIRECT` | Useful predictive physical validation. |
| `GOD-CAP-239` | Physics queries are runtime spatial evidence, not semantic permission | architecture boundary | `LEYFORGE RULE` | Build/access rules remain gameplay authority. |

---

# 62. High-Speed Motion / CCD

Godot supports continuous collision detection, but high-speed physics still becomes more demanding.

| ID | Capability / fact | Evidence | Result | Leyforge implication |
|---|---|---|---|---|
| `GOD-CAP-240` | Rigid bodies support continuous collision detection | `GOD-S31`, `GOD-S35` | `DIRECT` | Candidate for fast projectiles/objects. |
| `GOD-CAP-241` | High-speed simulation has less temporal information per tick and can tunnel/misbehave | `GOD-S39` | `DIRECT` | Fast mounts/vehicles/projectiles require tick/CCD strategy. |
| `GOD-CAP-242` | Raising physics TPS improves high-speed simulation at CPU cost | `GOD-S39` | `DIRECT TRADE-OFF` | High-end vs low-end profiles may differ. |
| `GOD-CAP-243` | Godot's built-in VehicleBody3D is arcade-oriented and has known limitations | `GOD-S39`, `GOD-S42` | `PARTIAL` | Do not use it as universal Leyforge cart/mount/vessel simulation. |
| `GOD-CAP-244` | Advanced vehicle physics may require custom CharacterBody/RigidBody integration | `GOD-S39` | `DIRECT GUIDANCE` | Carts/mounts should be prototyped from simpler primitives. |

---

# 63. Carts / Mounts / Ground Vehicles

Round 3 does not choose one universal body type.

Candidate patterns:

```text
simple controlled mount
    CharacterBody3D

scripted rail/lift/cart
    AnimatableBody3D

force-driven cart/wagon
    RigidBody3D + custom wheel/contact model

arcade wheeled vehicle
    VehicleBody3D reference/prototype only
```

| ID | Capability / fact | Evidence | Result | Leyforge implication |
|---|---|---|---|---|
| `GOD-CAP-245` | Multiple physical execution strategies exist for vehicles/mounts | body APIs | `DIRECT` | Choose per gameplay class after prototype. |
| `GOD-CAP-246` | VehicleBody3D should not be assumed realistic enough for systemic logistics vehicles | `GOD-S39` | `REJECT AS UNIVERSAL FOUNDATION` | Build custom system if physics depth requires it. |
| `GOD-CAP-247` | CharacterBody3D can push/be affected by moving rigid/character bodies during slide resolution | `GOD-S33` | `DIRECT` | Useful ordinary character/object interaction. |

---

# 64. Physics Spaces and Vessel-Local Worlds

`PhysicsServer3D` can create multiple self-contained physics spaces.

This is technically interesting for moving/local-frame architecture but does not solve cross-space interaction.

| ID | Capability / fact | Evidence | Result | Leyforge implication |
|---|---|---|---|---|
| `GOD-CAP-248` | PhysicsServer3D supports multiple independent spaces | `GOD-S31` | `DIRECT` | Potential experimental local-frame/isolation primitive. |
| `GOD-CAP-249` | A body belongs to one physics space at a time | `GOD-S31` | `DIRECT` | Cross-space collision is not automatically provided. |
| `GOD-CAP-250` | Separate physics spaces can be activated/deactivated independently | `GOD-S31` | `DIRECT` | Could support isolated simulations/testing. |
| `GOD-CAP-251` | Separate physics spaces do not create automatic moving coordinate frames relative to one another | technology boundary | `NOT-PROVIDED` | Leyforge must own frame transforms/handoff. |
| `GOD-CAP-252` | Vessel occupants and world terrain needing mutual collision are simpler if represented in the same active space | inference from server model | `ARCHITECTURE PRESSURE` | Separate-space vessel strategy requires explicit cross-space bridge. |

## 64.1 Round-3 posture on vessel physics spaces

Do **not** assume "one physics space per ship" is the answer.

Prototype both:

- vessel body + occupants in world physics space with local-frame transforms;
- isolated vessel-local space + explicit world interaction bridge.

The first is likely simpler for ordinary contact; the second may offer precision/isolation benefits.

---

# 65. Large-World Precision — Quantified

Official Godot docs give useful practical single-precision thresholds.

Approximate guidance:

- first-person: around **2–4 km from origin** before precision concerns become more visible;
- third-person: around **4–8 km**;
- any 3D game: beyond roughly **32–65 km**, double precision is generally recommended.

These are not Leyforge limits; they are engine guidance.

| ID | Capability / fact | Evidence | Result | Leyforge implication |
|---|---|---|---|---|
| `GOD-CAP-253` | Single precision can represent integer values exactly to ±16,777,216 but sub-unit precision degrades much earlier | `GOD-S40` | `DIRECT` | Integer voxel addresses and precise physics have different constraints. |
| `GOD-CAP-254` | Godot recommends tighter practical ranges for first-person physics/render quality than raw float integer capacity | `GOD-S40` | `DIRECT` | Leyforge first-person precision is a real issue well before coordinate overflow. |
| `GOD-CAP-255` | Large-world double precision greatly extends vector/physics precision | `GOD-S40` | `DIRECT` | Strong solution for continuous huge coordinates. |
| `GOD-CAP-256` | Double precision does not make shader arithmetic fully double precision | `GOD-S40` | `DIRECT` | Some visual techniques still have far-origin limitations. |
| `GOD-CAP-257` | Triplanar mapping does not gain large-world precision | `GOD-S40` | `DIRECT LIMIT` | Relevant if used for terrain/material presentation. |
| `GOD-CAP-258` | Some GPU particle/world-coordinate modes do not gain large-world precision | `GOD-S40` | `DIRECT LIMIT` | Far-world VFX needs testing. |
| `GOD-CAP-259` | Shaders using certain world-coordinate modes bypass large-world rendering precision assistance | `GOD-S40` | `DIRECT LIMIT` | Forge shader validation must account for precision profile. |
| `GOD-CAP-260` | Origin shifting avoids global double cost but increases logic/network complexity | `GOD-S40` | `DIRECT TRADE-OFF` | Remains viable candidate, especially low-end. |

---

# 66. Hierarchical Coordinate Hypothesis

PRD-03 adds a third practical concept beyond "double precision" and "shift everything":

```text
Canonical coordinate:
  realm
  region/chunk
  voxel/local-cell
  local sub-voxel offset

Active physics/render coordinate:
  bounded local frame near active origin
```

This could allow:

- exact integer world addressing;
- bounded single-precision active physics;
- large logical worlds;
- vessel-local frames;
- reduced dependence on global floating-point positions.

This remains a PRD-04/P3 architecture hypothesis.

It does **not** eliminate the need to test double precision or origin shifting.

---

# 67. Physics Interpolation Deep Dive

Physics interpolation is strategically important for low-end simulation profiles.

| ID | Capability / fact | Evidence | Result | Leyforge implication |
|---|---|---|---|---|
| `GOD-CAP-261` | Rendered motion can be interpolated between physics ticks | `GOD-S41` | `DIRECT` | Physics TPS can be decoupled from display FPS. |
| `GOD-CAP-262` | Physics/game movement should normally occur on physics ticks when interpolation is enabled | `GOD-S41` | `DIRECT` | Movement architecture needs clear tick ownership. |
| `GOD-CAP-263` | Lower physics tick rates improve CPU cost but increase latency/physical coarseness | `GOD-S41` | `DIRECT TRADE-OFF` | Low-end profiles can reduce TPS only within gameplay-quality limits. |
| `GOD-CAP-264` | High tick rates improve fast-motion physics at increased CPU cost | `GOD-S39`, `GOD-S41` | `DIRECT` | Combat/projectiles/vehicles may set minimum acceptable TPS. |
| `GOD-CAP-265` | Teleports/spawns require interpolation reset to avoid streaking | `GOD-S41` | `DIRECT` | Realm/fast travel and network correction need explicit reset. |
| `GOD-CAP-266` | Camera interpolation may require manual treatment | `GOD-S41` | `DIRECT` | First-person visual quality cannot rely entirely on automatic interpolation. |
| `GOD-CAP-267` | MultiMesh has dedicated interpolation support | `GOD-S41` | `DIRECT` | Helpful for ambient/ecology presentation. |
| `GOD-CAP-268` | Low-level 3D PhysicsServer-created bodies are not automatically covered by SceneTree-side interpolation | `GOD-S41` | `DIRECT LIMIT` | Direct-RID physics representations need manual visual interpolation. |

---

# 68. Local Gravity / Environmental Physics

Godot Areas can override gravity and damping.

| ID | Capability / fact | Evidence | Result | Leyforge implication |
|---|---|---|---|---|
| `GOD-CAP-269` | Areas can override/combine gravity | `GOD-S31`, `GOD-S43` | `DIRECT` | Useful for magical gravity regions, underwater/realm effects or local fields. |
| `GOD-CAP-270` | Areas can override damping | `GOD-S31`, `GOD-S43` | `DIRECT` | Useful physical projection of water/air/magic conditions. |
| `GOD-CAP-271` | Area gravity/damping are physical effects, not authoritative environment laws | boundary | `LEYFORGE RULE` | Realm/environment systems decide values and applicability. |
| `GOD-CAP-272` | Server-created area/body interaction can differ from Node signal expectations | `GOD-S43` | `DIRECT CAUTION` | Low-level RIDs and Node-level trigger APIs need integration tests. |

---

# 69. Vessel-Supporting Technology Boundary

Round 3 does **not** find a built-in "ship system".

It does find strong primitives:

```text
Vessel authoritative state
  hull / mass / cargo / flooding / machinery
                 │
                 ▼
          physical projection
                 │
    ┌────────────┼────────────┐
    │            │            │
RigidBody3D   convex hull   custom forces
    │            │            │
    └────────────┼────────────┘
                 ▼
               Jolt
```

Potential custom integration can apply:

- buoyancy;
- drag;
- thrust;
- rudder/steering;
- wave/current forces;
- damage impulses.

| ID | Capability / fact | Evidence | Result | Leyforge implication |
|---|---|---|---|---|
| `GOD-CAP-273` | Rigid-body custom integration can own specialised force calculations | `GOD-S35` | `DIRECT` | Strong vessel-physics primitive. |
| `GOD-CAP-274` | Hull center of mass/inertia are queryable/configurable | `GOD-S35` | `DIRECT` | Cargo/damage mass-distribution experiments are feasible. |
| `GOD-CAP-275` | Contact impulses can feed vessel collision/damage logic | `GOD-S35` | `DIRECT` | Damage authority still Leyforge-owned. |
| `GOD-CAP-276` | Dynamic concave voxel hull collision cannot be used directly as one exact trimesh body | `GOD-S37`, `GOD-S38` | `HARD DESIGN CONSTRAINT` | Commissioning needs collision proxy generation. |
| `GOD-CAP-277` | Multiple convex proxies can model complex moving hulls | `GOD-S38` | `DIRECT / P3-NEEDED` | Primary collision candidate. |
| `GOD-CAP-278` | Character moving-platform support provides an initial basis for standing on a moving vessel body | `GOD-S33` | `DIRECT / P3-NEEDED` | Must test translation + rotation + waves + network corrections. |
| `GOD-CAP-279` | Engine does not provide vessel-local coordinate hierarchy/boarding handoff | technology boundary | `NOT-PROVIDED` | Leyforge spatial-frame authority remains mandatory. |
| `GOD-CAP-280` | Engine does not compute hull buoyancy from arbitrary player-built voxel geometry | technology boundary | `NOT-PROVIDED` | Leyforge maritime physics must supply it. |

---

# 70. Physics Backend Extension Escape Hatch

Godot exposes extension classes for physics server/direct-state implementation.

| ID | Capability / fact | Evidence | Result | Leyforge implication |
|---|---|---|---|---|
| `GOD-CAP-281` | `PhysicsServer3DExtension` permits custom physics-server implementations through extension API | `GOD-S44` | `EXTENSION ESCAPE HATCH` | Alternative physics backend is technically possible. |
| `GOD-CAP-282` | Direct-space-state extension APIs can override collision query implementation | `GOD-S44` | `EXTENSION` | Specialist query providers are possible. |
| `GOD-CAP-283` | Custom physics backend would carry very high engineering/maintenance cost | engineering implication | `LAST RESORT` | Do not build unless Jolt/Godot cannot satisfy critical needs. |

---

# 71. Round-3 Architecture Rules

Round 3 emits the following provisional rules.

## 71.1 Physical projection is not semantic truth

```text
Leyforge entity/vessel/person
          ↓
physical projection
          ↓
CharacterBody / RigidBody / RID / collider
```

Destroying/recreating the projection does not change persistent identity.

## 71.2 Dynamic collision should be simplified

For player-built moving structures:

```text
voxel geometry
     ≠
exact dynamic collision geometry
```

Use bounded primitive/convex proxies generated from the authoritative shape.

## 71.3 Local precision and canonical coordinates should be separable

World identity should not depend solely on one floating-point `global_position`.

## 71.4 Physics does not decide gameplay consequences

A contact impulse may be evidence for damage.

It does not independently decide:

- ownership;
- item destruction;
- injury;
- structure failure;
- quest consequences.

Those remain Leyforge transactions/rules.

---

# 72. Round-3 Risk Register

| Risk | Severity | Reason |
|---|---|---|
| `GOD-R03-01` CharacterBody3D treated as entire movement system | RED | Traversal semantics remain external. |
| `GOD-R03-02` Exact voxel ship mesh used as dynamic concave collider | RED | Unsupported/slow/hollow. |
| `GOD-R03-03` Hull decomposed into thousands of convex shapes | RED | Broad/narrow-phase cost can explode. |
| `GOD-R03-04` Runtime convex decomposition stalls commissioning/repair | AMBER/RED | Must benchmark and possibly incrementalise. |
| `GOD-R03-05` Jolt backend differences ignored | AMBER | Joint/property behaviour differs. |
| `GOD-R03-06` Client and server physics assumed deterministic | RED | Multiplayer authority must remain server-side. |
| `GOD-R03-07` Continuous collision enabled universally | AMBER | Added cost; use where needed. |
| `GOD-R03-08` Physics tick lowered for low-end without combat/vehicle validation | RED | Can alter game feel/correctness. |
| `GOD-R03-09` Physics tick raised globally for fast vehicles | AMBER/RED | Can destroy low-end CPU budget. |
| `GOD-R03-10` Single-precision global coordinates used beyond practical first-person range | RED | Precision/jitter/physics risk. |
| `GOD-R03-11` Double precision assumed to solve all far-render shader/VFX precision | AMBER | Documented exceptions remain. |
| `GOD-R03-12` Origin shifting combined with multiplayer/vessels without ownership contract | RED | Coordinate-frame ambiguity. |
| `GOD-R03-13` Separate physics spaces used for vessels without cross-space collision plan | RED | Spaces are isolated. |
| `GOD-R03-14` Physics-server RIDs used without manual interpolation in low-level rendering path | AMBER | 3D interpolation is scene-side. |
| `GOD-R03-15` VehicleBody3D used as universal logistics physics | RED | Upstream says it is arcade/limited. |
| `GOD-R03-16` Every rigid-body contact monitored at high detail | AMBER | Contact reporting has cost. |
| `GOD-R03-17` Terrain collider updates accepted before physics-ready barrier | RED | Spawn/movement can race collision. |
| `GOD-R03-18` Visual collision fidelity prioritized over stable gameplay | AMBER | Simplified collision is often preferable. |

---

# 73. Round-3 Prototype / Benchmark Packages

## `GOD-PKG-17 — Character on Edited Voxel Terrain`

Test:

- stairs/slabs;
- irregular custom voxel shapes;
- slopes;
- one-block holes;
- rapid voxel edit beside/under player;
- low/high safe margin;
- 30/60+ TPS;
- interpolation.

Measure:

- jitter;
- sticking;
- tunneling;
- slope classification;
- remesh/collision readiness.

## `GOD-PKG-18 — Moving Platform / Vessel Deck`

Start with `AnimatableBody3D`, then a `RigidBody3D` platform.

Test character:

- standing;
- walking;
- jumping;
- platform translation;
- platform rotation;
- sudden acceleration;
- leaving velocity;
- interpolation;
- network correction fixture.

Purpose:

- determine how much built-in platform handling can be reused aboard vessels.

## `GOD-PKG-19 — Voxel Hull Collision Compiler`

Input:

- representative player-built voxel hull.

Generate candidates:

1. boxes/primitive aggregation;
2. coarse convex decomposition;
3. finer convex decomposition.

Measure:

- shape count;
- commissioning time;
- repair/update time;
- contact stability;
- CPU;
- memory;
- collision fidelity.

## `GOD-PKG-20 — Custom Vessel RigidBody`

Apply custom:

- buoyancy;
- drag;
- thrust;
- steering;
- cargo mass shift;
- flooding mass shift;
- wave/current forces.

Measure:

- stability;
- timestep sensitivity;
- Jolt vs Godot Physics;
- low-end CPU;
- collision response.

## `GOD-PKG-21 — Precision Matrix`

At increasing canonical distances, test:

- standard global coordinates;
- hierarchical local frame;
- origin shifting;
- double precision.

Scenarios:

- first-person walking;
- voxel placement;
- projectile;
- rigid body;
- moving vessel;
- camera;
- shader/VFX.

## `GOD-PKG-22 — Physics Tick / Interpolation Matrix`

Run:

- 20;
- 30;
- 60;
- 120 TPS where relevant.

Test:

- walking;
- combat;
- projectiles;
- mounts;
- carts;
- vessel;
- camera.

Goal:

- establish minimum per-profile tick requirements rather than one universal arbitrary rate.

## `GOD-PKG-23 — Terrain Collider Churn`

Repeatedly:

- mine/build;
- explosions;
- large construction paste;
- cave-in;
- repair.

Measure:

- collider generation;
- physics-server commit;
- main-thread spike;
- player collision correctness;
- physics-ready latency.

## `GOD-PKG-24 — Physics Body Scale`

Spawn increasing counts of:

- sleeping rigid debris;
- active debris;
- carts;
- characters;
- simple direct PhysicsServer bodies.

Measure:

- broad phase;
- active object count;
- collision pairs;
- island count;
- physics frame time.

## `GOD-PKG-25 — Jolt/Godot Backend Differential`

Identical fixtures:

- character movement;
- joints;
- carts;
- projectile collision;
- vessel prototype.

Record:

- behavioural differences;
- unsupported settings;
- performance;
- stability.

---

# 74. Round-3 Resolved / Narrowed Earlier Unknowns

## Round-1 Unknown 9 — Jolt terrain/character fit

Narrowed:

- CharacterBody3D/Jolt is a credible first movement substrate;
- static voxel collision fits Godot's recommended static-concave use;
- edit-churn scale remains P3/P4.

## Round-1 Unknown 10 — Jolt joint differences

Partially resolved:

- several soft joint parameters and solver priority are unavailable/ignored with Jolt;
- exact Leyforge mechanical requirements must avoid backend-assumption leakage.

## Round-1 Unknown 11 — vessel-local motion

Narrowed:

- custom RigidBody force integration + convex/primitive hull proxies is a plausible path;
- moving platform support helps occupants;
- vessel-local coordinate authority remains external.

## Round-1 Unknown 12 — low physics tick

Narrowed:

- physics interpolation enables lower TPS;
- Godot guidance explicitly associates low TPS with CPU savings but greater delay/simpler behaviour;
- exact minimum remains workload-specific.

## Round-2 Unknown 17 — separate physics thread latency

Still open, but Round 3 establishes that physics cadence/interpolation and owner commit must be benchmarked together rather than separately.

---

# 75. Round-3 New Unknowns

1. Does CharacterBody3D remain stable on Zylann custom block collision shapes during high edit churn?
2. Are Zylann's fast AABB block collisions preferable to physics-trimesh character collision for some mover classes?
3. Should player movement use CharacterBody3D while simple NPCs use voxel-box movement?
4. Can one movement facade support multiple physical executors without behavioural drift?
5. How accurately does CharacterBody3D follow a rotating RigidBody3D deck?
6. At what angular velocity does moving-platform support become unstable or visually poor?
7. Does character-platform inheritance behave correctly under low TPS + interpolation?
8. How should a player transition between world-local and vessel-local movement authority?
9. Should vessel bodies be one RigidBody3D with many shapes or a compound of multiple constrained rigid bodies?
10. What hull-proxy generation algorithm gives the best collision/shape-count trade-off?
11. Can hull collision be incrementally updated after local damage without rebuilding the whole proxy?
12. How should holes/interior walkable decks be represented when the external hull uses convex proxies?
13. Should interior occupant collision use a separate vessel-local static collision set while external hull uses coarse rigid proxies?
14. Can internal collision be transformed with the vessel without creating the same moving-trimesh problems as terrain?
15. Would multiple AnimatableBody/StaticBody proxies attached to a vessel give reliable internal deck collision?
16. What buoyancy integration model is stable under Godot/Jolt at 30/60 TPS?
17. How many buoyancy sample points are affordable for large vessels?
18. Can flooding/compartments update vessel center of mass/inertia without instability?
19. Does changing collision shape/mass properties at runtime wake/rebuild Jolt bodies expensively?
20. Which contact data is reliable enough for collision damage and grounding?
21. Should projectile hits use physics raycasts, voxel raycasts, CCD rigid bodies or a hybrid by projectile class?
22. What physics backend is more stable for large compound convex bodies?
23. Does double-precision Godot materially change Jolt performance or memory at Leyforge scale?
24. Does Jolt fully support Godot double-precision builds in the intended configuration?
25. Can standard precision + hierarchical coordinates avoid origin shifting entirely for ordinary realms?
26. What canonical coordinate representation should network packets use independent of engine precision?
27. How are physics transforms reconstructed from realm/region/local coordinates?
28. How often may an active origin/frame shift occur without destabilising contacts/interpolation?
29. Can vessel-local coordinates reduce large-world precision pressure enough to keep local physics single precision?
30. Which shaders/VFX fail visibly under extreme double-precision world positions?
31. Can renderer and physics active origins differ safely if hierarchical coordinates are used?
32. Should low-end profiles reduce physics TPS or reduce number/radius/detail of active physics objects first?
33. What minimum TPS is required for melee combat?
34. What minimum TPS is required for arrows/projectiles?
35. What minimum TPS is required for fast mounts/carts?
36. Which projectile classes need CCD?
37. Can collision-proxy LOD be reduced for distant/noninteractive rigid bodies?
38. How aggressively can sleeping be used without breaking simulation truth?
39. Should distant physical objects demote to non-physics simulation summaries?
40. What precise event constitutes "physics ready" after a voxel collider rebuild?
41. Does direct PhysicsServer body representation provide meaningful savings for debris/carts at scale?
42. Can a physics body migrate safely between PhysicsServer spaces?
43. Is separate-space vessel simulation ever worth cross-space interaction complexity?
44. Could a second physics space be useful for Forge physical-preview tools even if runtime vessels stay in main space?
45. Which custom physics extension capabilities are actually unavailable in stock Jolt/Godot before considering another backend?

---

# 76. Round-3 Architecture Boundary Verdict

Round 3 supports the following provisional physical architecture:

```text
              LEYFORGE SEMANTIC STATE
                       │
          movement / vessel / damage law
                       │
                       ▼
               PHYSICAL PROJECTION
                       │
      ┌────────────────┼────────────────┐
      │                │                │
 CharacterBody3D   RigidBody3D     AnimatableBody3D
      │                │                │
      └────────────────┼────────────────┘
                       │
                primitive/convex
                collision proxies
                       │
                       ▼
                 JOLT / GODOT
                       │
                contact/query data
                       │
                       ▼
               LEYFORGE EVIDENCE
```

For static voxel terrain:

```text
Zylann voxel geometry
       ↓
static terrain collider
       ↓
Jolt
```

For moving player-built vessels:

```text
Vessel voxel truth
       ↓
mesh + interior projection
       ↓
collision-proxy compiler
       ↓
RigidBody3D / Jolt
       ↓
custom buoyancy/forces
```

This is a strong candidate architecture, not a lock.

---

# 77. Round-3 Gate Result

**PASS — CONTINUE PRD-03**

Godot 4.7.2 + Jolt remains a strong general physics candidate.

No evidence currently requires replacing the physics backend.

No evidence supports delegating Leyforge vessel/movement authority to the physics engine.

Critical downstream proof remains:

- voxel collider churn;
- CharacterBody movement over edited block terrain;
- high-speed projectiles/vehicles;
- compound dynamic hull collision;
- vessel custom force integration;
- occupants on rotating moving decks;
- precision strategy;
- low-end physics tick profiles;
- Jolt/module/GDExtension/double-precision compatibility.

---

# 78. Updated PRD-03 Round Sequence

1. **Round 1 — Current Godot baseline, build strategy, precision, physics, render, headless, networking/threading surface** — **COMPLETE**
2. **Round 2 — Threading, task scheduling, servers, SceneTree/resource lifetime and native-code boundaries** — **COMPLETE**
3. **Round 3 — Physics, movement, large coordinates, interpolation and vessel-supporting technology** — **COMPLETE**
4. **Round 4 — Navigation, pathfinding, avoidance and dynamic voxel-world integration** — **NEXT**
5. **Round 5 — Networking, transport, dedicated-server topology, security and deployment**
6. **Round 6 — Rendering, shaders, GPU, low-end scalability, VFX/audio/input/UI/accessibility**
7. **Round 7 — Files, databases, serialization, mod/plugin sandbox, platform/export, profiling/testing/CI and supporting libraries**
8. **Round 8 — Supporting-technology comparison, risk/prototype reconciliation and PRD-03 closure candidate**

---

# 79. Additional Official / Current Sources Used in Round 3

- PhysicsServer3D 4.7  
  `https://docs.godotengine.org/en/4.7/classes/class_physicsserver3d.html`
- Using Jolt Physics 4.7  
  `https://docs.godotengine.org/en/4.7/tutorials/physics/using_jolt_physics.html`
- CharacterBody3D  
  `https://docs.godotengine.org/en/stable/classes/class_characterbody3d.html`
- AnimatableBody3D  
  `https://docs.godotengine.org/en/stable/classes/class_animatablebody3d.html`
- RigidBody3D / PhysicsDirectBodyState3D  
  `https://docs.godotengine.org/en/stable/classes/class_rigidbody3d.html`  
  `https://docs.godotengine.org/en/stable/classes/class_physicsdirectbodystate3d.html`
- PhysicsDirectSpaceState3D  
  `https://docs.godotengine.org/en/stable/classes/class_physicsdirectspacestate3d.html`
- Collision shapes 3D  
  `https://docs.godotengine.org/en/stable/tutorials/physics/collision_shapes_3d.html`
- Convex / concave shapes  
  `https://docs.godotengine.org/en/stable/classes/class_convexpolygonshape3d.html`  
  `https://docs.godotengine.org/en/stable/classes/class_concavepolygonshape3d.html`
- VehicleBody3D / troubleshooting  
  `https://docs.godotengine.org/en/stable/classes/class_vehiclebody3d.html`  
  `https://docs.godotengine.org/en/stable/tutorials/physics/troubleshooting_physics_issues.html`
- Large world coordinates  
  `https://docs.godotengine.org/en/stable/tutorials/physics/large_world_coordinates.html`
- Physics interpolation  
  `https://docs.godotengine.org/en/stable/tutorials/physics/interpolation/physics_interpolation_quick_start_guide.html`  
  `https://docs.godotengine.org/en/stable/tutorials/physics/interpolation/using_physics_interpolation.html`  
  `https://docs.godotengine.org/en/stable/tutorials/physics/interpolation/advanced_physics_interpolation.html`
- Area3D  
  `https://docs.godotengine.org/en/4.7/classes/class_area3d.html`
- Godot feature list 4.7  
  `https://docs.godotengine.org/en/4.7/about/list_of_features.html`

---

**ROUND-3 RESULT: PHYSICS / MOVEMENT / LARGE-COORDINATE / INTERPOLATION / VESSEL-SUPPORTING-TECHNOLOGY AUDIT COMPLETE.**

---

# 80. Round-4 Scope

Round 4 audits Godot's navigation technology against Leyforge's dynamic voxel-world requirements.

The audit covers:

- `NavigationServer3D`;
- navigation maps;
- navigation regions;
- navigation meshes;
- runtime baking;
- source geometry;
- asynchronous baking;
- path-query objects;
- path metadata;
- path search limits;
- navigation layers;
- traversal links;
- actor-size / locomotion variants;
- avoidance agents;
- avoidance obstacles;
- voxel-edit invalidation;
- caves and multi-level terrain;
- roads / settlements / regional travel;
- doors / ladders / lifts / teleports;
- walking / crawling / swimming / flying;
- crowd scaling;
- Zylann experimental voxel A* interaction;
- regional / local hierarchical route architecture.

The core engineering question is:

> **Can Godot navigation act as a scalable local navigation provider inside a highly editable voxel world without forcing Leyforge to rebuild one global navmesh or surrender mover/traversal authority to the engine?**

Round-4 answer:

> **YES, conditionally. Godot's NavigationServer is a strong local surface-navigation provider if Leyforge uses bounded regions/maps, procedural source geometry, asynchronous local rebakes and explicit traversal links. It is not a complete movement or world-route system. A hybrid regional-graph + local-nav + specialist-provider architecture is strongly indicated.**

---

# 81. Round-4 Official / Current Source Register

| Ref | Official/current source | Principal use |
|---|---|---|
| `GOD-S45` | Godot 4.7 `NavigationPathQueryParameters3D` | Search limits, metadata, layers, include/exclude regions |
| `GOD-S46` | Godot 4.7 `NavigationPathQueryResult3D` | Region/link/RID/ObjectID metadata |
| `GOD-S47` | Godot 4.7 `NavigationAgent3D` | Path following, avoidance, search parameters |
| `GOD-S48` | Godot 4.7 NavigationMeshGenerator | Main-thread parsing vs threaded baking |
| `GOD-S49` | Godot NavigationMesh source/baking docs | Procedural source geometry and runtime baking |
| `GOD-S50` | Godot 4.7 `NavigationMeshSourceGeometryData3D` | Direct procedural triangle/mesh/obstruction input |
| `GOD-S51` | Godot `NavigationRegion3D` | Regional nav partitioning, costs and connections |
| `GOD-S52` | Navigation maps docs | Isolated maps and map switching |
| `GOD-S53` | Navigation layers docs | Query filtering |
| `GOD-S54` | Navigation links docs | Explicit traversal links and custom execution |
| `GOD-S55` | Different actor locomotion docs | Separate maps for standing/crouched/crawling profiles |
| `GOD-S56` | Navigation obstacles docs | Baking obstruction vs avoidance obstacle behaviour |
| `GOD-S57` | Navigation agents/avoidance docs | RVO separation from pathfinding |
| `GOD-S58` | NavigationServer docs/source | Synchronization, parallel queries, map/region/link APIs |
| `GOD-S59` | Navigation performance docs | Runtime baking and geometry complexity guidance |
| `GOD-S60` | PRD-02 Zylann navigation/edit evidence | Voxel A*, edit regions and terrain lifecycle boundary |

---

# 82. NavigationServer3D as a Provider

Godot's navigation server is not fundamentally tied to one `NavigationRegion3D` Node.

It owns abstract maps, regions, links, agents and obstacles addressed by RIDs.

| ID | Capability / fact | Evidence | Result | Leyforge implication |
|---|---|---|---|---|
| `GOD-CAP-284` | NavigationServer3D exposes pathfinding through abstract navigation maps | `GOD-S52`, `GOD-S58` | `DIRECT` | Suitable behind a Leyforge navigation-provider interface. |
| `GOD-CAP-285` | One navigation map may contain many navigation regions | `GOD-S52` | `DIRECT` | Supports spatially partitioned local navigation rather than one monolithic mesh. |
| `GOD-CAP-286` | Navigation maps are isolated from each other | `GOD-S52` | `DIRECT` | Useful for actor locomotion classes, realms or specialist navigation domains. |
| `GOD-CAP-287` | Regions and agents can switch maps | `GOD-S52`, `GOD-S55` | `DIRECT` | Mover state can select a different navigation representation. |
| `GOD-CAP-288` | Map changes take effect on NavigationServer synchronization | `GOD-S52`, `GOD-S55` | `DIRECT CONSISTENCY RULE` | Map switching is not immediate same-instruction state. |
| `GOD-CAP-289` | NavigationServer path queries are thread-friendly and can execute in parallel | Round-2 `GOD-CAP-148/149` | `DIRECT` | Strong active-set pathfinding substrate. |
| `GOD-CAP-290` | NavigationServer does not own mover locomotion execution | `GOD-S54` + technology boundary | `NOT-PROVIDED` | Movement remains Leyforge-owned. |

---

# 83. Navigation Regions / Tiling

`NavigationRegion3D` packages one `NavigationMesh` into a map.

Regions can connect through sufficiently matching nearby edges.

| ID | Capability / fact | Evidence | Result | Leyforge implication |
|---|---|---|---|---|
| `GOD-CAP-291` | Navigation maps can combine multiple region meshes | `GOD-S51`, `GOD-S52` | `DIRECT` | Natural basis for active-area nav tiling. |
| `GOD-CAP-292` | Region edge connections depend on compatible nearby edges, not merely overlapping area | `GOD-S51` | `DIRECT` | Neighbor tiles must be baked/aligned consistently. |
| `GOD-CAP-293` | Edge connection margin is configurable per map | `GOD-S51`, `GOD-S54` | `DIRECT` | Useful for small tile-boundary numerical gaps; not a substitute for bad geometry. |
| `GOD-CAP-294` | Regions can be enabled/disabled | `GOD-S51` | `DIRECT` | Allows active/inactive navigation tiles without rebuilding whole map. |
| `GOD-CAP-295` | Regions have navigation-layer membership | `GOD-S51`, `GOD-S53` | `DIRECT` | Useful mover/traversal filtering. |
| `GOD-CAP-296` | Regions support enter cost | `GOD-S51` | `DIRECT` | Can bias route choice at region transitions. |
| `GOD-CAP-297` | Regions support travel-cost multipliers | `GOD-S51` | `DIRECT` | Can represent coarse terrain/travel preference where appropriate. |
| `GOD-CAP-298` | NavigationRegion3D is currently marked experimental in generated API docs | `GOD-S51` | `EXPERIMENTAL API LABEL` | Depend primarily on server contract and prototype exact release behaviour. |
| `GOD-CAP-299` | Region Nodes cache properties independently from direct RID edits | `GOD-S51` | `DIRECT CAUTION` | Avoid mixing Node wrapper and server-RID authority casually. |

## 83.1 Candidate active navigation tile model

```text
Active Navigation Sector
     ├── NavTile A
     ├── NavTile B
     ├── NavTile C
     └── ...
          ↓
NavigationServer map
```

A "tile" is a Leyforge integration concept.

Exact tile dimensions must be benchmarked.

---

# 84. Runtime Navigation-Mesh Baking

Godot supports runtime navigation-mesh baking, but the cost model matters greatly.

| ID | Capability / fact | Evidence | Result | Leyforge implication |
|---|---|---|---|---|
| `GOD-CAP-300` | Navigation meshes may be baked at runtime | `GOD-S48`, `GOD-S49` | `DIRECT` | Dynamic voxel-world navigation is technically possible. |
| `GOD-CAP-301` | Navigation baking involves voxelization, collision/walkability tests and mesh optimisation | `GOD-S48` | `DIRECT COST FACT` | Rebake scope must be tightly bounded. |
| `GOD-CAP-302` | Actual navmesh baking can be performed asynchronously/on background threads | `GOD-S48`, `GOD-S49`, `GOD-S58` | `DIRECT` | Strong fit for local invalidation jobs. |
| `GOD-CAP-303` | SceneTree source-geometry parsing must run on the main thread | `GOD-S48`, `GOD-S49` | `DIRECT CRITICAL` | Repeatedly parsing dynamic voxel Nodes would cause avoidable main-thread work. |
| `GOD-CAP-304` | Parsing visual Mesh resources can stall RenderingServer/GPU readback | `GOD-S48`, `GOD-S49` | `DIRECT PERFORMANCE WARNING` | Do not use rendered Zylann meshes as the default nav-rebuild input. |
| `GOD-CAP-305` | Physics/collision shapes are preferred over detailed render meshes for runtime parsing where possible | `GOD-S48`, `GOD-S59` | `DIRECT GUIDANCE` | Simplified geometry is preferable. |
| `GOD-CAP-306` | NavigationServer can bake from pre-existing source geometry without re-parsing SceneTree | `GOD-S49` | `DIRECT` | Strong basis for Leyforge procedural nav source. |
| `GOD-CAP-307` | Source geometry can be reused for multiple bakes | `GOD-S49` | `DIRECT` | Useful for multiple mover-size nav profiles. |
| `GOD-CAP-308` | Source geometry can be generated procedurally rather than parsed from Nodes | `GOD-S49`, `GOD-S50` | `DIRECT / HIGH VALUE` | Ideal interface from voxel occupancy/change data. |
| `GOD-CAP-309` | NavigationMeshGenerator's old all-in-one bake path is deprecated due to threading changes | `GOD-S48` | `DIRECT` | Use parse/source-data/bake separation rather than old convenience API. |

---

# 85. Procedural Navigation Source Geometry

`NavigationMeshSourceGeometryData3D` can be populated directly with triangles/meshes/arrays and projected obstructions.

This is one of the most important Round-4 findings.

| ID | Capability / fact | Evidence | Result | Leyforge implication |
|---|---|---|---|---|
| `GOD-CAP-310` | Procedural triangulated faces can be added directly | `GOD-S50` | `DIRECT` | Leyforge can derive walkable surfaces from voxel data without SceneTree parsing. |
| `GOD-CAP-311` | Mesh arrays can be added directly | `GOD-S50` | `DIRECT` | Allows generated simplified source geometry. |
| `GOD-CAP-312` | Source geometry stores explicit vertices/indices | `GOD-S50` | `DIRECT` | Enables deterministic nav-source generation/bake fixtures. |
| `GOD-CAP-313` | Multiple source-geometry containers can be merged | `GOD-S50` | `DIRECT` | Useful tile/structure composition primitive. |
| `GOD-CAP-314` | Projected obstructions can be added procedurally | `GOD-S50`, `GOD-S56` | `DIRECT` | Useful temporary/static carve input at bake time. |
| `GOD-CAP-315` | Source-geometry data exposes bounds | `GOD-S50` | `DIRECT` | Supports validation against intended invalidation tile. |
| `GOD-CAP-316` | SourceGeometryData3D is itself marked experimental | `GOD-S50` | `EXPERIMENTAL API LABEL` | Keep adapter isolated and version-pinned. |
| `GOD-CAP-317` | Invalid manually supplied source arrays can crash underlying bake libraries | `GOD-S50` | `DIRECT SAFETY WARNING` | Procedural geometry compiler requires strict validators/fuzz tests. |

## 85.1 Preferred voxel integration hypothesis

```text
Zylann / Leyforge voxel snapshot
          ↓
walkable-surface extractor
          ↓
simplified procedural triangles
          ↓
NavigationMeshSourceGeometryData3D
          ↓
async bake
          ↓
new NavigationMesh tile
          ↓
revision-validated publish
```

This avoids:

```text
voxel
  ↓
render mesh
  ↓ GPU
read mesh back
  ↓
parse SceneTree
  ↓
navmesh
```

---

# 86. Dynamic Voxel Edit Invalidation

PRD-02 established a candidate `SpatialChangeSet` emitted from authoritative voxel edits.

Round 4 gives it a direct navigation consumer.

Candidate flow:

```text
Voxel transaction commits revision 812
          ↓
SpatialChangeSet
  bounds / cause / channels / revision
          ↓
navigation tile overlap query
          ↓
mark tiles dirty
          ↓
coalesce nearby edits
          ↓
build simplified source from voxel snapshot
          ↓
async bake against source revision
          ↓
if current revision still compatible:
    publish tile
else:
    discard/rebake
```

| ID | Capability / fact | Evidence | Result | Leyforge implication |
|---|---|---|---|---|
| `GOD-CAP-318` | Godot can replace/update region navmesh data independently | `GOD-S51`, `GOD-S58` | `DIRECT` | Local tile replacement is feasible. |
| `GOD-CAP-319` | Baking is separable from region publication | `GOD-S49`, `GOD-S58` | `DIRECT` | Allows version-checked asynchronous rebuild. |
| `GOD-CAP-320` | Navigation changes synchronize rather than appearing instantaneously | Round-2 + `GOD-S58` | `DIRECT` | Movement must tolerate bounded nav revision lag. |
| `GOD-CAP-321` | No built-in API automatically maps arbitrary voxel edits to affected nav tiles | technology boundary | `NOT-PROVIDED` | Leyforge owns invalidation indexing. |
| `GOD-CAP-322` | No built-in API guarantees a path remains valid after terrain changes | technology boundary | `NOT-PROVIDED` | Path revision/validation remains Leyforge-owned. |
| `GOD-CAP-323` | Old nav data can remain active while a new tile bakes | integration possibility | `P3-NEEDED` | Need policy for dangerous edits such as removed bridge/floor. |

## 86.1 Safety distinction

Two edit classes likely need different treatment:

**Additive obstruction**

```text
build wall
close gate
collapse tunnel
```

Old path may become physically blocked before nav catches up.

Movement collision can reject traversal while path is stale.

**Subtractive support**

```text
remove bridge
dig cliff edge
destroy floor
```

Old nav may point through empty space.

These changes may require immediate route invalidation/temporary block overlay before the asynchronous navmesh catches up.

---

# 87. Path Queries — Capabilities and Limits

Godot 4.7 path-query objects expose significantly more control than a simple `start → target`.

| ID | Capability / fact | Evidence | Result | Leyforge implication |
|---|---|---|---|---|
| `GOD-CAP-324` | Path queries use A* over navigation polygons | `GOD-S45` | `DIRECT` | Strong local path engine. |
| `GOD-CAP-325` | Queries may restrict navigation layers | `GOD-S45`, `GOD-S53` | `DIRECT` | Useful mover/traversal filtering. |
| `GOD-CAP-326` | Queries can explicitly include regions | `GOD-S45` | `DIRECT` | Useful bounded/local route requests. |
| `GOD-CAP-327` | Queries can explicitly exclude regions | `GOD-S45` | `DIRECT` | Useful temporary quarantines or capability filters. |
| `GOD-CAP-328` | Path search can be limited by maximum searched distance | `GOD-S45` | `DIRECT` | Prevent pathological local searches. |
| `GOD-CAP-329` | Path search can be limited by polygon count | `GOD-S45` | `DIRECT` | Important active-set CPU budget control. |
| `GOD-CAP-330` | Default path search polygon limit is 4096 in 4.7 query parameters | `GOD-S45` | `DIRECT DEFAULT` | Huge route queries should not rely on one local nav request. |
| `GOD-CAP-331` | Return path can be clipped by length/radius independently from search scope | `GOD-S45` | `DIRECT` | Useful bounded steering/movement horizons. |
| `GOD-CAP-332` | Path simplification is built in | `GOD-S45` | `DIRECT` | Can reduce steering/path-following complexity. |
| `GOD-CAP-333` | Tile/grid-like nav layouts can create artificial corners under corridor-funnel postprocessing | `GOD-S45` | `DIRECT` | Nav tile geometry/postprocessing must be tested for voxel worlds. |
| `GOD-CAP-334` | Edge-centered postprocessing exists for grid-like layouts | `GOD-S45` | `DIRECT` | Potential alternative for cell-oriented movement. |
| `GOD-CAP-335` | Raw path corridor postprocessing is available | `GOD-S45` | `DIRECT` | Leyforge may provide custom postprocessing where needed. |
| `GOD-CAP-336` | Query parameter classes are currently marked experimental | `GOD-S45` | `EXPERIMENTAL API LABEL` | Isolate direct dependencies behind provider wrapper. |

---

# 88. Path Metadata as Traversal Evidence

Godot path queries can return metadata for each path point, including whether it belongs to a region or a link.

| ID | Capability / fact | Evidence | Result | Leyforge implication |
|---|---|---|---|---|
| `GOD-CAP-337` | Path results can include primitive type (region vs link) | `GOD-S45`, `GOD-S46` | `DIRECT` | Movement system can detect upcoming special traversal. |
| `GOD-CAP-338` | Path results can include region/link RIDs | `GOD-S45`, `GOD-S46` | `DIRECT` | Runtime handle to navigation primitive. |
| `GOD-CAP-339` | Path results can include owner ObjectIDs | `GOD-S45`, `GOD-S46` | `DIRECT` | Useful Node-wrapper linkage where needed. |
| `GOD-CAP-340` | Unneeded path metadata can be disabled for performance/memory | `GOD-S45` | `DIRECT` | Bulk/simple NPC paths need not pay all metadata cost. |
| `GOD-CAP-341` | RID/ObjectID metadata is runtime identity, not canonical traversal identity | architecture boundary | `LEYFORGE RULE` | Links/regions need Leyforge semantic IDs if persistent/gameplay-significant. |

---

# 89. Navigation Links — Specialist Traversal

`NavigationLink3D` is explicitly designed to connect otherwise disconnected navmesh polygons over arbitrary distances.

Godot examples include ladders, jump pads and teleports.

Critically:

> **The link only tells pathfinding that traversal is possible. Game code must execute the actual movement.**

| ID | Capability / fact | Evidence | Result | Leyforge implication |
|---|---|---|---|---|
| `GOD-CAP-342` | Links connect two nav areas over arbitrary distances | `GOD-S54` | `DIRECT` | Strong specialist traversal primitive. |
| `GOD-CAP-343` | Links can be bidirectional or one-way | `GOD-S54` | `DIRECT` | Supports one-way climbs/drop-downs/etc. |
| `GOD-CAP-344` | Links participate in navigation layers | `GOD-S54` | `DIRECT` | Capability filtering possible. |
| `GOD-CAP-345` | Link endpoints attach to nearest valid nav polygons within configurable radius | `GOD-S54` | `DIRECT` | Dynamic geometry needs endpoint validation after rebakes. |
| `GOD-CAP-346` | A link becomes unusable when no valid endpoint polygon is found | `GOD-S54` | `DIRECT` | Good safety behaviour, but reattachment timing must be understood. |
| `GOD-CAP-347` | Links do not implement traversal animation/motion | `GOD-S54` | `DIRECT BOUNDARY` | Leyforge movement executor owns ladder/jump/teleport/lift behaviour. |
| `GOD-CAP-348` | Links can model ladders, jump pads and teleports conceptually | `GOD-S54` | `DIRECT EXAMPLE` | Strong fit for Set-30 traversal provider architecture. |
| `GOD-CAP-349` | Links can represent moving-platform access only as route semantics, not waiting/boarding mechanics | `GOD-S54` | `DIRECT CAUTION` | Scheduling/reservations remain Leyforge-owned. |

## 89.1 Candidate Leyforge traversal link

```text
TraversalLink
  stable_id
  type = ladder / jump / lift / portal / squeeze / climb
  requirements
  direction
  cost
  reservation policy
  current availability
       ↓
NavigationLink3D projection
       ↓
path metadata
       ↓
Leyforge traversal executor
```

This preserves semantic movement law above the nav server.

---

# 90. Different Actor Sizes / Locomotion

One navmesh cannot safely encode every body size and locomotion capability.

Godot's own different-locomotion tutorial demonstrates using separate navigation maps for standing, crouching and crawling.

| ID | Capability / fact | Evidence | Result | Leyforge implication |
|---|---|---|---|---|
| `GOD-CAP-350` | Different actor locomotion profiles can use different navigation maps | `GOD-S55` | `DIRECT` | Strong model for large/small/crouching mover classes. |
| `GOD-CAP-351` | One source geometry can be reused for multiple navmesh bakes | `GOD-S49` | `DIRECT` | Efficiently derive multiple agent-size profiles. |
| `GOD-CAP-352` | Navigation agent avoidance radius does not redefine navmesh walkability | navigation model | `DIRECT DISTINCTION` | Path-space body radius must be encoded by bake/map, not just avoidance radius. |
| `GOD-CAP-353` | Agent map switches apply after server synchronization | `GOD-S55` | `DIRECT` | Posture transitions need bounded state handoff. |
| `GOD-CAP-354` | Navigation layers can restrict regions/links without requiring entirely separate maps | `GOD-S53` | `DIRECT` | Useful for capability categories where geometry is otherwise identical. |
| `GOD-CAP-355` | Maps and layers solve different problems | architecture synthesis | `IMPORTANT` | Use maps for different traversable geometry/profile; layers for filtering compatible primitives. |

## 90.1 Candidate mover-nav profiles

Possible active profiles:

```text
small ground
standard ground
large ground
crouched/crawl
special climbing links
swimming provider
flying provider
```

Do **not** pre-commit to one map per species.

Map/profile count must be bounded by actual geometric differences.

---

# 91. Caves and Multi-Level Terrain

3D navigation meshes can represent surfaces at multiple heights.

This is useful for:

- caves;
- mines;
- towers;
- bridges;
- multistorey structures;
- underground roads.

However navmesh baking only marks traversable surfaces for a configured mover profile.

| ID | Capability / fact | Evidence | Result | Leyforge implication |
|---|---|---|---|---|
| `GOD-CAP-356` | 3D source geometry can contain arbitrary vertically distributed walkable surfaces | `GOD-S49`, `GOD-S50` | `DIRECT` | Caves/multi-level structures are representable. |
| `GOD-CAP-357` | Navmesh baking voxelizes source geometry according to agent parameters | `GOD-S48` | `DIRECT` | Tunnel width/height affects walkability automatically when configured correctly. |
| `GOD-CAP-358` | Very detailed source geometry increases bake cost | `GOD-S48`, `GOD-S59` | `DIRECT` | Extract simplified walkable surfaces from voxels. |
| `GOD-CAP-359` | Navmesh alone does not represent free-volume flight or swimming in arbitrary 3D space | navigation model | `NOT-PROVIDED` | Use specialist volume/grid/waypoint providers. |

---

# 92. Flying and Swimming Navigation

Ground navmesh pathfinding solves surface traversal.

Leyforge also requires movers whose legal path exists in a **volume**, not just on surfaces.

Examples:

- birds;
- flying monsters;
- swimming fish;
- fully submerged creatures;
- aerial constructs;
- some spells/projectiles.

Godot has 3D avoidance, but 3D avoidance is **not 3D pathfinding through environmental volume**.

| ID | Capability / fact | Evidence | Result | Leyforge implication |
|---|---|---|---|---|
| `GOD-CAP-360` | NavigationServer navmesh pathfinding is surface/polygon based | `GOD-S52`, `GOD-S58` | `DIRECT` | Best fit for terrestrial/grounded traversal. |
| `GOD-CAP-361` | NavigationAgent3D supports 3D avoidance mode | `GOD-S47` | `DIRECT` | Useful local collision avoidance for volumetric movers. |
| `GOD-CAP-362` | 3D avoidance does not create a volumetric environmental path graph | `GOD-S57` | `DIRECT BOUNDARY` | Flying/swimming path planning still requires another provider. |
| `GOD-CAP-363` | Zylann voxel occupancy can provide volumetric free/solid information | PRD-02 | `DIRECT CROSS-TECH INPUT` | Candidate basis for bounded 3D grid/graph routing. |
| `GOD-CAP-364` | Regional aerial/marine routes can be represented above local volume pathing | Leyforge requirement synthesis | `LEYFORGE-OWN` | Hybrid provider needed. |

---

# 93. Avoidance — Separate from Pathfinding

Godot documentation is explicit:

> **Avoidance is a separate system from pathfinding.**

Avoidance agents do not know about the navmesh or physics world unless obstacles/agent configuration represents relevant constraints.

| ID | Capability / fact | Evidence | Result | Leyforge implication |
|---|---|---|---|---|
| `GOD-CAP-365` | RVO avoidance is separate from pathfinding | `GOD-S47`, `GOD-S57` | `DIRECT CRITICAL` | Do not assume avoidance changes route topology. |
| `GOD-CAP-366` | Avoidance does not automatically know physics collision | `GOD-S57` | `DIRECT` | Physical collision remains final safety authority. |
| `GOD-CAP-367` | Ground-style avoidance can operate in a planar mode | `GOD-S47` | `DIRECT` | Likely cheaper/default for terrestrial crowds. |
| `GOD-CAP-368` | Full 3D avoidance mode exists | `GOD-S47` | `DIRECT` | Candidate for aerial/swimming local steering. |
| `GOD-CAP-369` | Agent radius, height, neighbor distance, max neighbors and time horizons are configurable | `GOD-S47` | `DIRECT` | Significant crowd-quality/performance tuning surface. |
| `GOD-CAP-370` | Avoidance layers/masks filter interactions | `GOD-S47`, `GOD-S57` | `DIRECT` | Useful categories such as pedestrians/large carts/etc. |
| `GOD-CAP-371` | Avoidance priority can bias which agents yield | `GOD-S47`, `GOD-S57` | `DIRECT` | Potential VIP/large-vehicle handling primitive. |
| `GOD-CAP-372` | Avoidance must be explicitly enabled; it has runtime cost | `GOD-S47`, `GOD-S56` | `DIRECT` | Do not enable for every simulated/distant NPC. |
| `GOD-CAP-373` | NavigationAgent3D itself is marked experimental in 4.7 | `GOD-S47` | `EXPERIMENTAL API LABEL` | Prefer a Leyforge movement facade over direct game-wide coupling. |

---

# 94. Navigation Obstacles

Godot obstacles serve two distinct roles:

1. source/bake obstruction;
2. runtime avoidance.

These must not be conflated.

| ID | Capability / fact | Evidence | Result | Leyforge implication |
|---|---|---|---|---|
| `GOD-CAP-374` | Obstacles may affect navmesh baking | `GOD-S56` | `DIRECT` | Useful for scripted bake-time exclusion. |
| `GOD-CAP-375` | Obstacles may affect avoidance | `GOD-S56` | `DIRECT` | Useful moving/local steering constraint. |
| `GOD-CAP-376` | Runtime avoidance obstacle does not automatically alter pathfinding route topology | `GOD-S56`, `GOD-S57` | `DIRECT` | A new wall still needs nav invalidation/rebake or temporary route exclusion. |
| `GOD-CAP-377` | Bake-time obstacles remove cells rather than add traversable source geometry | `GOD-S56` | `DIRECT` | Useful for carving, not generating roads/floors. |
| `GOD-CAP-378` | 3D obstacle outlines are projected horizontally with height | `GOD-S56` | `DIRECT LIMIT` | Not a full arbitrary 3D volumetric blocker representation. |
| `GOD-CAP-379` | Avoidance-only obstacles can be cheaper than rebaking for temporary moving objects | `GOD-S56` | `DIRECT USE CASE` | Good for carts/crowds/local temporary obstacles; not permanent topology change. |

---

# 95. Doors / Gates / Lifts / Bridges

Dynamic world interactions require more than raw navmesh.

Candidate strategy:

## 95.1 Door / gate

```text
closed:
  link disabled / region excluded / immediate obstacle
  physical collider blocks

open:
  link/route enabled
  physical collider permits
```

Depending on geometry, a door may not require navmesh rebake if the doorway surface already exists and accessibility is represented by a dynamic traversal/link or immediate blocking layer.

## 95.2 Lift

Navigation link describes route possibility.

Leyforge scheduler/reservation decides:

- wait;
- call lift;
- board;
- ride;
- exit.

## 95.3 Destructible bridge

Bridge surface likely exists as a local region/tile.

Destruction:

- immediately disable/quarantine affected nav primitive;
- rebuild local nav asynchronously.

| ID | Capability / fact | Evidence | Result | Leyforge implication |
|---|---|---|---|---|
| `GOD-CAP-380` | Links can be enabled/disabled and costed through navigation APIs | `GOD-S54`, `GOD-S58` | `DIRECT` | Good dynamic traversal gate. |
| `GOD-CAP-381` | Physical collision and navigation availability remain separate | nav/physics boundary | `CRITICAL` | Door/bridge state must update both coherently. |
| `GOD-CAP-382` | Navigation links do not manage queues/reservations | `GOD-S54` | `NOT-PROVIDED` | Leyforge owns congestion/deadlock/transport scheduling. |
| `GOD-CAP-383` | Path metadata can expose when route passes through a link | `GOD-S45`, `GOD-S46` | `DIRECT` | Movement executor can switch traversal mode at link. |

---

# 96. Regional / Local Hierarchical Navigation

A Minecraft-scale world cannot sensibly issue one polygon search from one continent to another.

Round 4 strongly supports a hierarchy:

```text
LEVEL R — REGIONAL ROUTE GRAPH
  roads
  passes
  rivers/coasts
  settlements
  known portals
  major cave routes
  vessel lanes
        ↓
choose active/local entry goals

LEVEL L — LOCAL NAVIGATION
  Godot NavigationServer navmesh regions
  active settlements / caves / terrain
        ↓
special traversal

LEVEL T — TRAVERSAL / VOLUME PROVIDERS
  NavigationLink
  voxel/grid path
  flying volume
  swimming volume
  vehicle/vessel provider
```

| ID | Capability / fact | Evidence | Result | Leyforge implication |
|---|---|---|---|---|
| `GOD-CAP-384` | Godot local path queries expose search limits suited to bounded searches | `GOD-S45` | `DIRECT` | Supports local-provider role. |
| `GOD-CAP-385` | Navigation maps can hold many regions but do not encode civilisation road/route semantics | `GOD-S52` | `BOUNDARY` | Regional route graph remains Leyforge-owned. |
| `GOD-CAP-386` | Region travel/enter costs provide local cost inputs | `GOD-S51` | `DIRECT` | Can project some local terrain preference. |
| `GOD-CAP-387` | Long-distance route planning can hand off to local nav at waypoints/portals | architecture synthesis | `STRONG HYPOTHESIS` | Avoid global detailed-path searches. |
| `GOD-CAP-388` | Regional graph can persist when local nav tiles are unloaded | Leyforge requirement | `LEYFORGE-OWN` | Supports simulation LOD and distant travel. |

---

# 97. Zylann Voxel A* vs Godot NavigationServer

PRD-02 found `VoxelAStarGrid3D`, an experimental simple blocky A*.

Round 4 does not pick one winner.

They solve different problems.

| Dimension | Zylann `VoxelAStarGrid3D` | Godot NavigationServer |
|---|---|---|
| Representation | block occupancy grid | polygon/surface navmesh |
| Dynamic voxel locality | direct | requires nav data rebuild/update |
| Mover model | currently very simple | bake-specific agent radius/height + links/layers |
| Search scale | documented small-area orientation | scalable polygon surface queries |
| Path smoothing | grid-like | funnel/edge/raw + simplification |
| Caves | occupancy capable | surface capable |
| Flying/swimming volume | potentially adaptable custom grid | not volumetric pathfinding |
| Experimental | yes | several wrappers/query classes experimental; server is core |
| Dynamic edit cost | query sees voxel state | nav tile invalidation/bake |
| Crowds/avoidance | no complete system | RVO avoidance provided |

### 97.1 Leading division

**Godot NavigationServer**
- ordinary ground NPCs;
- settlements;
- roads/local terrain;
- caves/mines where surfaces are suitable;
- buildings;
- crowd pathing.

**Voxel/grid/volume provider**
- highly volatile local tunnels where rebake latency is unacceptable;
- flying;
- swimming;
- unusual body occupancy;
- emergency/local direct occupancy checks.

**Leyforge regional graph**
- long-distance travel and simulation.

---

# 98. Dynamic Navigation Consistency Model

Navigation state is eventually consistent with physical voxel state because local rebakes take time.

That must be explicit.

Candidate states:

```text
NAV_CURRENT
  tile matches current physical revision

NAV_DIRTY
  physical change committed; old nav may be unsafe

NAV_BAKING
  replacement in progress

NAV_PENDING_SYNC
  region updated; waiting NavigationServer sync

NAV_CURRENT(new revision)
```

Potential immediate guards during `DIRTY/BAKING`:

- physical collision;
- disabled link/region;
- temporary local occupancy test;
- excluded region in path query;
- immediate route invalidation;
- direct voxel walkability check before movement.

This prevents an NPC from trusting a path over a bridge that was removed two frames ago.

---

# 99. Navmesh Build Geometry from Voxels — Candidate Algorithm Family

PRD-03 does not choose the extractor yet.

Candidate approaches:

### A — collision-derived surface mesh

Use simplified collision surfaces already generated for terrain.

Pros:
- less duplicated geometry logic.

Cons:
- collision readiness may lag;
- extraction API/cost unclear.

### B — direct voxel occupancy surface extractor

Read voxel blocks and emit only walkable boundary faces.

Pros:
- deterministic;
- no RenderingServer readback;
- direct edit integration.

Cons:
- custom extractor required;
- stair/slab/special geometry complexity.

### C — heightfield-like ground extractor where topology is simple

Pros:
- very cheap for open surface terrain.

Cons:
- insufficient for caves/multi-level structures.

### D — hybrid

Use different extractors for open surface, caves and authored structures.

**Round-4 preference:** prototype direct voxel/procedural source before attempting SceneTree visual-mesh parsing.

---

# 100. Navigation Scaling / Crowd Boundary

Godot provides pathfinding and RVO avoidance, but Leyforge may have settlements containing very large populations.

Not every persistent person should be an active NavigationAgent.

Candidate LOD:

```text
REGIONAL / DISTANT
  route/event simulation
  no local nav agent

LOCAL ABSTRACT
  coarse destination / occupancy

LOCAL ACTIVE
  path query
  physical mover

LOCAL CROWD
  selected avoidance participation
```

| ID | Capability / fact | Evidence | Result | Leyforge implication |
|---|---|---|---|---|
| `GOD-CAP-389` | Avoidance has configurable neighbor count/distance/time horizon | `GOD-S47` | `DIRECT` | Crowd cost/quality can be profiled. |
| `GOD-CAP-390` | Path queries can be parallelised but still consume shared CPU budget | Round-2 + Round-4 | `DIRECT` | Active NPC count needs budget. |
| `GOD-CAP-391` | NavigationAgent methods can trigger repaths | `GOD-S47` | `DIRECT` | Calling agent path updates blindly on every NPC/frame can create path storms. |
| `GOD-CAP-392` | `get_next_path_position()` is expected each physics frame for NavigationAgent's internal path following | `GOD-S47` | `DIRECT` | Node helper may be too heavy for huge agent counts; direct server queries/provider caching should be compared. |
| `GOD-CAP-393` | NavigationAgent callback misuse can cause recursive repath behaviour | `GOD-S47` | `DIRECT WARNING` | Movement integration needs disciplined state machine. |
| `GOD-CAP-394` | Distant simulated people do not require live NavigationAgent Nodes | architecture boundary | `LEYFORGE RULE` | Preserve simulation/presentation separation. |

---

# 101. Navigation Authority Model

Round 4 clarifies five different notions that must not be conflated:

```text
ROUTE INTENT
  "travel to market"

REGIONAL ROUTE
  settlement road graph / route plan

LOCAL PATH
  navmesh/grid points

TRAVERSAL ACTION
  climb ladder / open gate / board lift

PHYSICAL EXECUTION
  CharacterBody/RigidBody movement
```

Godot can provide much of **LOCAL PATH** and some avoidance.

It does not own the others.

---

# 102. Round-4 Risk Register

| Risk | Severity | Reason |
|---|---|---|
| `GOD-R04-01` One global navmesh for entire voxel world | RED | Bake/update/search scale and streaming mismatch. |
| `GOD-R04-02` Parse rendered voxel meshes from SceneTree after every edit | RED | Main-thread parse + possible RenderingServer stalls. |
| `GOD-R04-03` Rebuild navmesh synchronously after voxel edit | RED | Runtime bake is expensive. |
| `GOD-R04-04` Old nav remains trusted after destructive edit | RED | Path may traverse removed floor/bridge. |
| `GOD-R04-05` Every block edit triggers immediate independent rebake | RED | Edit storms cause nav bake storms. |
| `GOD-R04-06` Nav tiles have inconsistent boundaries/cell parameters | RED | Region edges may fail to connect. |
| `GOD-R04-07` One navmesh profile used for all body sizes | RED | Small/large/crouched movers differ. |
| `GOD-R04-08` One map per species | AMBER/RED | Could explode memory/maintenance; profile by geometry needs. |
| `GOD-R04-09` Navigation layers used as replacement for geometry clearance | RED | Layers do not resize corridors. |
| `GOD-R04-10` Avoidance treated as pathfinding | RED | Explicitly separate systems. |
| `GOD-R04-11` Avoidance treated as physics collision | RED | It knows neither full navmesh nor physics environment automatically. |
| `GOD-R04-12` Dynamic obstacle treated as permanent topology update | RED | Avoidance can steer around but path may remain invalid. |
| `GOD-R04-13` NavigationLink expected to execute ladder/lift/portal traversal | RED | Game code must execute it. |
| `GOD-R04-14` Flying/swimming forced onto ground navmesh | RED | Surface representation is wrong. |
| `GOD-R04-15` NavigationAgent Node created for every persistent person | RED | Violates simulation LOD and active-set budget. |
| `GOD-R04-16` Unbounded local path queries to unreachable distant goals | AMBER/RED | Search can expand widely; query limits exist for a reason. |
| `GOD-R04-17` Procedural nav source arrays emitted without validation | RED | Invalid geometry can crash baking libraries. |
| `GOD-R04-18` Experimental wrapper classes treated as permanent project ABI | AMBER | Isolate behind Leyforge provider. |
| `GOD-R04-19` Navigation map synchronization latency ignored | AMBER | Changes are not immediately visible. |
| `GOD-R04-20` Local nav cost used as economic/social travel truth | RED | Regional semantics belong to Leyforge. |

---

# 103. Round-4 Prototype / Benchmark Packages

## `GOD-PKG-26 — Procedural Voxel → Nav Tile`

Build a local nav tile directly from voxel data.

Compare:

1. SceneTree/render-mesh parsing;
2. collision-source parsing;
3. direct procedural triangle generation.

Measure:

- main-thread time;
- bake time;
- allocations;
- nav polygon count;
- path quality;
- custom block/stair/slab handling.

## `GOD-PKG-27 — Dynamic Edit Invalidation`

Fixtures:

- dig doorway;
- build wall;
- destroy bridge;
- collapse cave;
- place stairs;
- place/remove ladder;
- multi-block construction paste.

Measure:

- dirty detection;
- edit coalescing;
- bake latency;
- old-path safety;
- region publish/sync latency;
- affected vs unaffected agents.

## `GOD-PKG-28 — Navigation Tile Size Matrix`

Test multiple tile/sector sizes.

Measure:

- source extraction;
- bake latency;
- polygon count;
- region connection cost;
- path quality across boundaries;
- memory;
- edit invalidation amplification.

## `GOD-PKG-29 — Mover Profile Matrix`

Reuse one voxel source for:

- small;
- standard;
- large;
- crouched/crawl.

Measure:

- number of maps/resources;
- bake cost;
- memory;
- correctness in doors/tunnels/stairs.

Goal:

- minimise map-profile count while preserving geometric correctness.

## `GOD-PKG-30 — Links / Traversal State Machine`

Implement:

- ladder;
- one-way drop;
- jump;
- lift;
- door;
- teleporter/portal-like transition.

Prove:

- path metadata identifies link;
- mover stops/changes mode;
- requirements validated;
- reservation works where needed;
- failure/repath is safe.

## `GOD-PKG-31 — Ground Crowd`

Scale:

- 10;
- 100;
- 500;
- 1,000+ local pathing actors as hardware allows.

Compare:

- NavigationAgent3D Nodes;
- direct NavigationServer path queries;
- avoidance off;
- planar avoidance on;
- differing neighbor settings.

Measure:

- path-query CPU;
- avoidance CPU;
- physics CPU;
- main-thread overhead;
- path storms.

## `GOD-PKG-32 — Cave / Multi-Level Nav`

Generate:

- winding cave;
- stacked floors;
- mine shafts;
- bridges;
- narrow tunnels.

Test multiple mover profiles and edit rebakes.

## `GOD-PKG-33 — Flight / Swim Provider`

Implement bounded 3D occupancy/waypoint provider using voxel/environment data.

Compare:

- custom 3D grid;
- sparse graph;
- Zylann voxel-A* adaptation.

Use Godot 3D avoidance only for local steering.

## `GOD-PKG-34 — Regional → Local Handoff`

Create:

```text
settlement A
  ↓ regional road graph
mountain pass
  ↓
active local nav
  ↓
settlement B
```

Test:

- unloaded route portions;
- local obstacles;
- reroute;
- simulation-LOD transitions.

## `GOD-PKG-35 — Nav Bake Storm Torture`

Rapid edits over many nearby tiles.

Prove:

- coalescing;
- bounded concurrent bakes;
- stale-result rejection;
- newest-revision publication;
- no queue growth without bound.

## `GOD-PKG-36 — Nav Synchronization / Revision`

Measure exact frames/timestamps across:

```text
tile publish
NavigationServer sync
new path query
agent replan
physical movement
```

Define the first safe "nav-current" signal for Leyforge.

---

# 104. Round-4 Resolved / Narrowed Earlier Unknowns

## Round-1 Unknown 31 — runtime local navmesh rebuild

Strongly narrowed:

- runtime baking is supported;
- baking can run asynchronously;
- SceneTree parsing is main-thread-only;
- procedural source geometry can bypass repeated SceneTree parsing;
- local tiling is therefore a credible path.

Exact performance remains P3/P4.

## Round-1 Unknown 32 — caves / multi-level / ladders

Narrowed:

- caves/multi-level surfaces fit 3D navmesh;
- ladders/jumps/lifts/teleports fit navigation links + custom traversal;
- volumetric flying/swimming require another provider.

## Round-1 Unknown 33 — provider facade

Strengthened:

> Godot Navigation should be one provider behind a Leyforge route/movement facade, not the global movement authority.

## Round-1 Unknown 34 — hundreds/thousands of agents

Still open at scale, but now decomposed into:

- path-query cost;
- NavigationAgent Node overhead;
- avoidance cost;
- active-set simulation LOD.

## Round-2 Unknown 18 — navigation synchronization revisions

Narrowed:

- server synchronization is a real boundary;
- PRD-04 should expose a Leyforge nav revision/current-state contract above it.

## PRD-02 navigation comparison

Narrowed:

- Zylann voxel A* and Godot navmesh are complementary rather than mutually exclusive.

---

# 105. Round-4 New Unknowns

1. What nav-tile dimensions minimise rebake amplification in representative voxel edits?
2. Should nav tiles align with Zylann data chunks, mesh chunks, Leyforge simulation cells or an independent grid?
3. How much overlap/padding is required around a nav tile to bake correct edge walkability?
4. How are tile-edge polygons clipped so adjacent independently baked regions connect reliably?
5. Does Godot's region edge-connection logic remain stable across repeated asynchronous tile replacement?
6. Should neighboring tiles be rebaked together when an edit touches their shared boundary?
7. What voxel-to-surface extraction algorithm handles cube/slab/stair/custom block models correctly?
8. Can collision AABBs from FCC/Zylann block models generate nav source more cheaply than triangles?
9. Should nav extraction use semantic mover walkability before geometry, e.g. passable plants/fluids?
10. How should partial blocks and low obstacles affect different mover profiles?
11. How many mover-size nav maps are actually needed?
12. Can several species share one standard ground profile with movement-specific link filtering?
13. How should very large creatures navigate terrain that standard agents can traverse?
14. How should crawling/crouching posture switch if the destination map update is delayed until sync?
15. How should doors be represented: always-baked opening + dynamic link/gate, or rebaked topology?
16. How should player-built doors and gates register traversal links automatically?
17. How should elevators/lifts expose time-dependent route cost?
18. How should agents reserve narrow links to avoid deadlock?
19. Can path metadata efficiently identify stable semantic link IDs without SceneTree ObjectID dependence?
20. Should navigation links be server RIDs only rather than Nodes in high-volume/generated worlds?
21. How quickly can a destructive bridge/floor edit quarantine affected route regions before rebake?
22. Should stale paths perform a direct voxel/physics validity probe before each segment?
23. How often should active movers revalidate path revisions?
24. What edits are small enough to avoid rebake and use temporary blockers instead?
25. Can repeated building-wall edits be coalesced for 50–200 ms without unacceptable NPC behaviour?
26. How many nav bakes may run concurrently before competing badly with Zylann and simulation workers?
27. Does NavigationServer baking use its own workers or the global worker pool in 4.7.2?
28. How should navigation bake concurrency scale on 4-core hardware?
29. What source geometry can safely be prepared on Leyforge workers without mutating shared Resource state?
30. Should each bake own a fresh source-geometry Resource?
31. How expensive is navigation source geometry memory for many dirty tiles?
32. Can source geometry be cached per unchanged voxel tile and merged with structure overlays?
33. How should dynamic authored structures contribute navigation without parsing the SceneTree?
34. Should Forge bake navigation source proxies for standard structures?
35. How should destroyed structures invalidate both pre-baked structure nav source and terrain nav source?
36. Can a local NavigationServer map be streamed/unloaded safely while path queries are in flight?
37. How should stale path-query results be rejected after map/WorldSession replacement?
38. Should each realm have a separate nav map or multiple maps per realm/profile?
39. How are moving vessels represented to world navigation while underway?
40. Do vessel interiors need vessel-local navigation providers rather than world NavigationServer regions?
41. Can a moving vessel's interior navmesh be transformed efficiently or should it remain local and route through boarding links?
42. How should boarding/disembark links update while ship moves?
43. How should swimming creatures transition between navmesh shore and volumetric water provider?
44. How should amphibious creatures choose between ground and swim providers?
45. How should flying creatures route around terrain/structures without a dense full 3D voxel search over long distance?
46. What sparse aerial waypoint/region representation best complements local voxel occupancy?
47. Can regional wind/current fields affect route cost without rewriting local navmesh?
48. How many avoidance agents are practical on low/mid/high hardware?
49. Is planar RVO sufficient for terrestrial crowds on slopes/multilevel paths?
50. When does 3D RVO cost become excessive?
51. How should carts/large vehicles interact with pedestrian avoidance?
52. Can avoidance priority prevent pedestrians from forcing large carts into unstable steering?
53. Should vehicles use a separate avoidance layer or entirely separate movement provider?
54. How should crowd reservations complement rather than fight RVO?
55. Which NavigationAgent3D helper behaviour is useful enough to keep versus direct server queries?
56. Can path caches be shared among agents with similar origins/goals without producing bad crowd behaviour?
57. Should settlement streets maintain flow fields or route trees for common destinations?
58. At what crowd size does a higher-level local traffic graph outperform independent navmesh A*?
59. How should path-query search limits vary by mover and simulation profile?
60. Which nav diagnostics must be included in support bundles: polygon counts, dirty tile count, bake queue, query timing, avoidance count, sync revision?
61. How should low-end settings reduce navigation cost without changing persistent movement outcomes?
62. Can distant travel use deterministic route-time simulation while active agents use exact physical nav?
63. How should a regional path respond when a road becomes permanently destroyed by player action?
64. What world-history event updates the regional graph from local physical change?
65. What accessibility/debug visualisation is needed in Forge to inspect mover-profile navigation?

---

# 106. Round-4 Architecture Boundary Verdict

Round 4 strongly supports a **hierarchical multi-provider navigation architecture**:

```text
                 LEYFORGE MOVEMENT AUTHORITY
                           │
               goal / capabilities / policy
                           │
             ┌─────────────┴─────────────┐
             │                           │
       REGIONAL ROUTER              LOCAL PROVIDER
  roads / settlements /           selected by mover
  passes / portals / routes              │
             │            ┌──────────────┼──────────────┐
             │            │              │              │
             ▼       Godot navmesh   voxel/grid     volume graph
        local goal      ground         special      fly/swim
                           │              │              │
                           └───────┬──────┴──────────────┘
                                   │
                         traversal metadata/links
                                   │
                                   ▼
                          MOVEMENT EXECUTOR
                          CharacterBody/etc.
                                   │
                                   ▼
                              PHYSICS
```

For dynamic voxel terrain:

```text
voxel edit
    ↓
SpatialChangeSet
    ↓
nav tile invalidation
    ↓
procedural source extraction
    ↓
async local bake
    ↓
revision validation
    ↓
NavigationServer publish/sync
```

This keeps Godot Navigation where it is strongest:

> **active local traversable-surface pathfinding and avoidance**

without making it own:

- world route semantics;
- distant travel simulation;
- mover capability law;
- traversal execution;
- flying/swimming volume routing;
- reservations/deadlock;
- persistent navigation history.

---

# 107. Round-4 Gate Result

**PASS — CONTINUE PRD-03**

Godot NavigationServer remains a strong candidate supporting technology.

No evidence supports one monolithic world navmesh.

No evidence requires abandoning Godot navigation simply because the world is voxel-editable.

The most promising integration is:

> **procedural voxel-derived local nav source + asynchronous tiled rebakes + immediate revision/blocking guards + Leyforge hierarchical routing.**

Critical downstream proof:

- tile dimensions;
- source extraction;
- stair/slab/custom-block handling;
- edit-bake latency;
- stale-path safety;
- mover-profile count;
- crowd scaling;
- avoidance budgets;
- flight/swim provider;
- regional/local handoff;
- moving-vessel navigation.

---

# 108. Updated PRD-03 Round Sequence

1. **Round 1 — Current Godot baseline, build strategy, precision, physics, render, headless, networking/threading surface** — **COMPLETE**
2. **Round 2 — Threading, task scheduling, servers, SceneTree/resource lifetime and native-code boundaries** — **COMPLETE**
3. **Round 3 — Physics, movement, large coordinates, interpolation and vessel-supporting technology** — **COMPLETE**
4. **Round 4 — Navigation, pathfinding, avoidance and dynamic voxel-world integration** — **COMPLETE**
5. **Round 5 — Networking, transport, dedicated-server topology, security and deployment** — **NEXT**
6. **Round 6 — Rendering, shaders, GPU, low-end scalability, VFX/audio/input/UI/accessibility**
7. **Round 7 — Files, databases, serialization, mod/plugin sandbox, platform/export, profiling/testing/CI and supporting libraries**
8. **Round 8 — Supporting-technology comparison, risk/prototype reconciliation and PRD-03 closure candidate**

---

# 109. Additional Official / Current Sources Used in Round 4

- NavigationPathQueryParameters3D 4.7  
  `https://docs.godotengine.org/en/4.7/classes/class_navigationpathqueryparameters3d.html`
- NavigationPathQueryResult3D 4.7  
  `https://docs.godotengine.org/en/4.7/classes/class_navigationpathqueryresult3d.html`
- NavigationAgent3D 4.7  
  `https://docs.godotengine.org/en/4.7/classes/class_navigationagent3d.html`
- NavigationMeshGenerator 4.7  
  `https://docs.godotengine.org/en/4.7/classes/class_navigationmeshgenerator.html`
- NavigationMeshSourceGeometryData3D 4.7  
  `https://docs.godotengine.org/en/4.7/classes/class_navigationmeshsourcegeometrydata3d.html`
- NavigationRegion3D  
  `https://docs.godotengine.org/en/stable/classes/class_navigationregion3d.html`
- Using navigation meshes  
  `https://docs.godotengine.org/en/4.7/tutorials/navigation/navigation_using_navigationmeshes.html`
- Navigation maps  
  `https://docs.godotengine.org/en/4.7/tutorials/navigation/navigation_using_navigationmaps.html`
- Navigation layers  
  `https://docs.godotengine.org/en/4.7/tutorials/navigation/navigation_using_navigationlayers.html`
- Navigation links  
  `https://docs.godotengine.org/en/4.7/tutorials/navigation/navigation_using_navigationlinks.html`
- Different actor locomotion  
  `https://docs.godotengine.org/en/4.7/tutorials/navigation/navigation_different_actor_locomotion.html`
- Navigation obstacles  
  `https://docs.godotengine.org/en/4.7/tutorials/navigation/navigation_using_navigationobstacles.html`
- Navigation agents / avoidance  
  `https://docs.godotengine.org/en/4.7/tutorials/navigation/navigation_using_navigationagents.html`
- NavigationServer usage  
  `https://docs.godotengine.org/en/4.7/tutorials/navigation/navigation_using_navigationservers.html`
- Navigation performance  
  `https://docs.godotengine.org/en/4.7/tutorials/navigation/navigation_optimizing_performance.html`
- Current NavigationServer source  
  `https://github.com/godotengine/godot/blob/master/modules/navigation_3d/3d/godot_navigation_server_3d.h`

---

**ROUND-4 RESULT: NAVIGATION / PATHFINDING / AVOIDANCE / DYNAMIC-VOXEL-WORLD INTEGRATION AUDIT COMPLETE.**

---

# 110. Round-5 Scope

Round 5 audits Godot's networking/deployment technology against Leyforge's future multiplayer requirements.

The audit covers:

- `MultiplayerPeer`;
- `ENetMultiplayerPeer`;
- `SceneMultiplayer`;
- RPCs;
- raw byte messages;
- channels and transfer modes;
- `MultiplayerSynchronizer`;
- `MultiplayerSpawner`;
- interest/visibility filtering;
- authentication handshake;
- server authority;
- peer/session lifecycle;
- NAT and UPnP;
- WebSocket;
- WebRTC;
- TCP/UDP;
- TLS/DTLS;
- dedicated-server exports;
- headless/server process configuration;
- deployment/platform concerns;
- server capacity/bandwidth limits;
- denial-of-service and untrusted-input boundaries;
- admin/control-plane separation;
- service/backend integration;
- custom transport escape hatches.

The core engineering question is:

> **Can Godot provide a robust transport/runtime shell for Leyforge's authoritative multiplayer while keeping the actual world protocol, security policy and persistence authority under Leyforge control?**

Round-5 answer:

> **YES. Godot provides strong native real-time transport and server primitives, with ENet as the leading initial gameplay transport. The high-level SceneMultiplayer stack is useful for bounded scene/entity replication and connection plumbing, but should not become Leyforge's durable world/voxel protocol. Authentication, authorization, semantic validation, rate limiting, service discovery and long-lived protocol versioning remain Leyforge-owned.**

---

# 111. Round-5 Official / Current Source Register

| Ref | Official/current source | Principal use |
|---|---|---|
| `GOD-S61` | Godot 4.7 High-level multiplayer | ENet, channels, RPCs, authentication, secure multiplayer guidance, NAT |
| `GOD-S62` | `ENetMultiplayerPeer` 4.7 | channels, bandwidth, max clients, mesh mode, bind IP |
| `GOD-S63` | `MultiplayerPeer` 4.7/current | transfer modes/channels, target peers, custom implementations |
| `GOD-S64` | `SceneMultiplayer` 4.7 | auth, raw bytes, relay, packet-size limits, object-decoding warning |
| `GOD-S65` | `MultiplayerSynchronizer` | replication intervals, visibility filters and unsupported identity types |
| `GOD-S66` | `MultiplayerSpawner` | automatic scene spawning and spawn limits |
| `GOD-S67` | `MultiplayerPeerExtension` 4.7 | custom transport via GDExtension |
| `GOD-S68` | Dedicated-server export docs | headless/server export and resource stripping |
| `GOD-S69` | Godot 4.7 Linux/server compilation | production server templates / deployment compatibility |
| `GOD-S70` | Networking feature list | TCP/UDP/HTTP/ENet/WebSocket/WebRTC/UPnP availability |
| `GOD-S71` | `UPNP` | NAT port mapping limitations |
| `GOD-S72` | WebSocket docs / `WebSocketMultiplayerPeer` | TCP/WebSocket and TLS-backed `wss` |
| `GOD-S73` | WebRTC docs | browser/native plugin boundary |
| `GOD-S74` | `StreamPeerTLS` / TLS certificate docs | TLS service/control-plane security |
| `GOD-S75` | `PacketPeerDTLS` / `DTLSServer` | secured datagram primitive and limitations |
| `GOD-S76` | `PacketPeer` | raw packet/Variant object-decoding security warning |
| `GOD-S77` | HTTPRequest / HTTPClient | HTTPS service integration |
| `GOD-S78` | Godot command-line / OS APIs | server process configuration |
| `GOD-S79` | PCK encryption docs | asset-package protection distinction |

---

# 112. Networking Layer Taxonomy

Godot exposes multiple networking layers.

They should not be conflated.

```text
APPLICATION / LEYFORGE PROTOCOL
           │
           ▼
SceneMultiplayer / custom MultiplayerAPI
           │
           ▼
MultiplayerPeer
  ├── ENetMultiplayerPeer
  ├── WebSocketMultiplayerPeer
  ├── WebRTCMultiplayerPeer
  └── custom MultiplayerPeerExtension
           │
           ▼
network transport / OS
```

Godot also exposes lower-level:

```text
PacketPeerUDP / UDPServer
StreamPeerTCP / TCPServer
HTTPClient / HTTPRequest
StreamPeerTLS
PacketPeerDTLS
```

These can be used independently from SceneTree multiplayer.

| ID | Capability / fact | Evidence | Result | Leyforge implication |
|---|---|---|---|---|
| `GOD-CAP-395` | Godot exposes low-, mid- and high-level networking APIs | `GOD-S61`, `GOD-S70` | `DIRECT` | Leyforge is not forced into SceneTree RPC replication. |
| `GOD-CAP-396` | `MultiplayerPeer` abstracts different transport implementations | `GOD-S61`, `GOD-S63` | `DIRECT` | Protocol-facing adapter can survive transport changes. |
| `GOD-CAP-397` | Custom `MultiplayerPeer` implementations can be supplied through extension | `GOD-S67` | `DIRECT EXTENSION` | Escape hatch for future platform/custom transport needs. |
| `GOD-CAP-398` | Godot high-level multiplayer protocol is explicitly an implementation detail that may change | `GOD-S64` | `CRITICAL BOUNDARY` | Do not define Leyforge's durable external/world protocol as "whatever SceneMultiplayer currently sends". |
| `GOD-CAP-399` | High-level multiplayer can coexist with lower/custom traffic paths | architecture from exposed layers | `DIRECT/PLAUSIBLE` | Entity/RPC convenience and custom voxel messages can be separated. |

---

# 113. ENet as the Leading Realtime Transport Candidate

Godot's native high-level multiplayer path uses a modified ENet implementation over UDP.

| ID | Capability / fact | Evidence | Result | Leyforge implication |
|---|---|---|---|---|
| `GOD-CAP-400` | `ENetMultiplayerPeer` uses UDP only | `GOD-S62`, `GOD-S61` | `DIRECT` | Realtime gameplay server requires UDP reachability. |
| `GOD-CAP-401` | Godot's ENet path supports IPv4 and IPv6 | `GOD-S61`, `GOD-S62` | `DIRECT` | Good modern native-network baseline. |
| `GOD-CAP-402` | ENet server/client can allocate multiple logical channels | `GOD-S62`, `GOD-S63` | `DIRECT` | Essential traffic-class separation primitive. |
| `GOD-CAP-403` | ENet supports incoming/outgoing bandwidth limits per peer/host creation | `GOD-S62` | `DIRECT` | Useful first-line network budgeting. |
| `GOD-CAP-404` | ENet uses bandwidth information to constrain reliable in-flight window and may drop traffic to respect limits | `GOD-S62` | `DIRECT` | Bandwidth settings have protocol behaviour consequences; benchmark, don't guess. |
| `GOD-CAP-405` | ENet server API accepts up to 4095 configured clients | `GOD-S62` | `DIRECT API MAXIMUM` | Not a claim that a Leyforge world can support 4095 players. |
| `GOD-CAP-406` | Upstream explicitly says achievable simultaneous clients may be far lower and app-dependent | `GOD-S62` | `DIRECT WARNING` | Capacity is a whole-stack P4 benchmark. |
| `GOD-CAP-407` | ENet server can bind to a selected interface/IP | `GOD-S62` | `DIRECT` | Useful dedicated-server/container/interface control. |
| `GOD-CAP-408` | ENet mesh mode exists for manually connected peer topology | `GOD-S62` | `DIRECT ADVANCED` | Interesting NAT/load-distribution primitive, not default Leyforge topology. |
| `GOD-CAP-409` | ENet client can bind/listen on a local port for some NAT traversal techniques | `GOD-S62` | `DIRECT` | Useful experimental NAT-punch path. |
| `GOD-CAP-410` | ENet remains the strongest first native dedicated-server transport candidate | synthesis | `CANDIDATE` | Prototype before considering custom UDP protocol. |

---

# 114. Transfer Modes and Channels

Godot's `MultiplayerPeer` supports:

- unreliable;
- unreliable ordered;
- reliable;

plus logical channels.

The default channel `0` effectively separates the three transfer modes internally.

| ID | Capability / fact | Evidence | Result | Leyforge implication |
|---|---|---|---|---|
| `GOD-CAP-411` | Unreliable packets may be lost/reordered | `GOD-S61`, `GOD-S63` | `DIRECT` | Good for disposable state such as frequent motion snapshots. |
| `GOD-CAP-412` | Unreliable-ordered drops late packets rather than stalling for retransmission | `GOD-S61`, `GOD-S63` | `DIRECT` | Good for state superseded by newer state. |
| `GOD-CAP-413` | Reliable mode retransmits and preserves ordering at higher latency/cost | `GOD-S61`, `GOD-S63` | `DIRECT` | Use for critical commands/events, not everything. |
| `GOD-CAP-414` | Separate channels prevent independent reliable streams from head-of-line blocking one another | `GOD-S61`, `GOD-S63` | `DIRECT` | Leyforge should define explicit traffic classes. |
| `GOD-CAP-415` | Variable-size unreliable-ordered traffic sharing a channel can increase avoidable loss | `GOD-S61` | `DIRECT` | Group homogeneous packet types by channel. |
| `GOD-CAP-416` | Transfer mode/channel selection is per RPC/raw message | `GOD-S61`, `GOD-S64` | `DIRECT` | Protocol schema should own message-class transport policy. |

## 114.1 Candidate traffic classes

Provisional classes:

```text
CH-A INPUT
  client → server
  small / frequent

CH-B MOTION SNAPSHOTS
  server → client
  unreliable / ordered as appropriate

CH-C GAMEPLAY COMMANDS/EVENTS
  reliable

CH-D VOXEL OPERATIONS
  reliable ordered transaction/control

CH-E VOXEL BLOCK PAYLOADS
  custom segmented/streamed policy

CH-F CHAT/SOCIAL
  reliable but isolated from gameplay

CH-G ADMIN/CONTROL
  preferably separate secured service plane
```

Exact channel/mode assignments remain PRD-07 work.

---

# 115. Authoritative Server Model

Godot's own secure multiplayer guidance recommends server authority for gameplay-critical state and treating client input as untrusted.

This exactly matches PRD-02.

| ID | Capability / fact | Evidence | Result | Leyforge implication |
|---|---|---|---|---|
| `GOD-CAP-417` | Godot documentation recommends server-authoritative critical gameplay | `GOD-S61` | `DIRECT SECURITY GUIDANCE` | Matches Leyforge authority model. |
| `GOD-CAP-418` | Godot recommends validating RPC arguments rather than trusting client reports | `GOD-S61` | `DIRECT` | Every client command enters a validation boundary. |
| `GOD-CAP-419` | Godot explicitly warns against trusting client-reported positions/timers/cooldowns/resources | `GOD-S61` | `DIRECT` | Client state is proposal/prediction, not truth. |
| `GOD-CAP-420` | Official guidance calls for rate/safety limits on frequently triggerable actions | `GOD-S61` | `DIRECT` | Abuse budgeting becomes protocol requirement. |
| `GOD-CAP-421` | Server-side authority implies client prediction/reconciliation may be needed for responsiveness | `GOD-S61` | `DIRECT TRADE-OFF` | Movement/combat prototypes must include latency. |
| `GOD-CAP-422` | Godot peer ID is a connection/session handle, not persistent player identity | networking model | `LEYFORGE RULE` | Account/character identity remains external stable authority. |

---

# 116. RPC Layer — Useful but Coupled

Godot RPCs are convenient but tied to Node/SceneTree structure.

| ID | Capability / fact | Evidence | Result | Leyforge implication |
|---|---|---|---|---|
| `GOD-CAP-423` | RPC methods are defined on Nodes | `GOD-S61`, `GOD-S64` | `DIRECT` | RPCs fit local scene/controller endpoints, not arbitrary domain records. |
| `GOD-CAP-424` | Matching RPC NodePaths/signatures are required on sender/receiver | `GOD-S61` | `DIRECT COUPLING` | Fragile basis for a long-lived independently versioned world protocol. |
| `GOD-CAP-425` | RPC authority can default to server or allow any peer | `GOD-S61` | `DIRECT` | Client-input RPC endpoints are possible but require validation. |
| `GOD-CAP-426` | Remote sender peer ID is available during RPC handling | `GOD-S61` | `DIRECT` | Useful attribution to authenticated connection/session. |
| `GOD-CAP-427` | RPC checksum/signature matching does not validate argument semantics | `GOD-S61` | `DIRECT` | Schema validation remains Leyforge responsibility. |
| `GOD-CAP-428` | High-level RPC protocol is not guaranteed stable for non-Godot external servers | `GOD-S64` | `DIRECT` | Do not couple future backend services to internal SceneMultiplayer wire format. |

### 116.1 RPC posture

Strong uses:

- lobby/session convenience;
- local actor control endpoints;
- bounded UI/game events;
- dev prototypes.

Avoid making RPC declarations themselves the canonical schema for:

- world save/network migration;
- voxel block payloads;
- persistent economy transactions;
- external account/backend APIs.

---

# 117. Raw Byte Messages inside SceneMultiplayer

`SceneMultiplayer.send_bytes()` and `peer_packet` allow custom byte payloads to peers.

| ID | Capability / fact | Evidence | Result | Leyforge implication |
|---|---|---|---|---|
| `GOD-CAP-429` | SceneMultiplayer can send arbitrary PackedByteArray messages | `GOD-S64` | `DIRECT` | Useful custom protocol payload path. |
| `GOD-CAP-430` | Raw messages can choose target peer, transfer mode and channel | `GOD-S64` | `DIRECT` | Suitable for custom message classes. |
| `GOD-CAP-431` | Peer source ID is supplied with incoming custom packets | `GOD-S64` | `DIRECT` | Supports per-session validation/rate accounting. |
| `GOD-CAP-432` | Raw bytes avoid forcing large domain messages into property replication | `GOD-S64` | `STRONG FIT` | Candidate transport for voxel/custom world protocol over Godot peer management. |
| `GOD-CAP-433` | Using raw bytes does not automatically create framing/versioning/checksums/rate limits | technology boundary | `NOT-PROVIDED` | Leyforge protocol layer must supply them. |

---

# 118. Scene Replication — Entity Convenience, Not World Database

`MultiplayerSynchronizer` and `MultiplayerSpawner` provide automatic SceneTree replication.

This is useful for active scene representations.

It is not a whole-world persistence/network architecture.

| ID | Capability / fact | Evidence | Result | Leyforge implication |
|---|---|---|---|---|
| `GOD-CAP-434` | MultiplayerSynchronizer can replicate configured Node properties | `GOD-S64`, `GOD-S65` | `DIRECT` | Useful for active entity state. |
| `GOD-CAP-435` | Replication can run always or on change with configurable intervals | `GOD-S65` | `DIRECT` | Useful bandwidth/latency tuning. |
| `GOD-CAP-436` | Synchronizer visibility can be controlled per peer and with filters | `GOD-S65` | `DIRECT` | Useful active-entity interest projection. |
| `GOD-CAP-437` | Visibility can be manually updated rather than recomputed every frame | `GOD-S65` | `DIRECT` | Good for Leyforge-owned interest decisions. |
| `GOD-CAP-438` | Synchronizer does not support Resource/Object identity replication as canonical state | `GOD-S65` | `DIRECT LIMIT` | Stable IDs/domain records remain external. |
| `GOD-CAP-439` | Object instance IDs and RIDs are explicitly unsuitable replicated property identity | `GOD-S65` | `DIRECT` | Reinforces runtime-handle vs stable-ID rule. |
| `GOD-CAP-440` | SceneMultiplayer default sync packet maximum is 1350 bytes | `GOD-S64` | `DIRECT DEFAULT` | Strong signal not to use property sync for voxel chunks. |
| `GOD-CAP-441` | SceneMultiplayer delta packet maximum defaults to 65535 and docs warn larger values increase congestion/disconnection risk | `GOD-S64` | `DIRECT` | Large domain state should be explicitly chunked/protocol-managed. |
| `GOD-CAP-442` | MultiplayerSpawner can automatically spawn approved scene types | `GOD-S66` | `DIRECT` | Useful local active entities. |
| `GOD-CAP-443` | Spawner supports a configurable spawn limit, default unlimited | `GOD-S66` | `DIRECT SECURITY/PERF FACT` | Never leave untrusted spawn paths without Leyforge-side limits. |

---

# 119. Interest Management Boundary

Godot synchronizer visibility is a useful projection mechanism.

Leyforge still owns the actual interest policy.

Candidate flow:

```text
Leyforge Interest Manager
  player position
  realm
  permissions
  active simulation cells
  relevance
  bandwidth budget
        ↓
peer interest set
        ├── active entities → MultiplayerSynchronizer visibility
        ├── voxel blocks → custom block protocol
        ├── world events → event protocol
        └── far summaries → low-rate protocol
```

| ID | Capability / fact | Evidence | Result | Leyforge implication |
|---|---|---|---|---|
| `GOD-CAP-444` | Godot visibility filters can implement per-peer scene replication visibility | `GOD-S65` | `DIRECT` | Useful final projection mechanism. |
| `GOD-CAP-445` | Godot does not know Leyforge's voxel/civilisation/permission interest semantics | boundary | `NOT-PROVIDED` | One project interest manager must coordinate domains. |
| `GOD-CAP-446` | Scene visibility and voxel block interest can be driven from one Leyforge spatial-interest source | synthesis | `STRONG HYPOTHESIS` | Avoid competing independent radius systems. |

---

# 120. Authentication Handshake

`SceneMultiplayer` contains an authentication phase before ordinary peer acceptance.

Important default:

> if no auth callback is set, peers are automatically accepted.

| ID | Capability / fact | Evidence | Result | Leyforge implication |
|---|---|---|---|---|
| `GOD-CAP-447` | SceneMultiplayer supports a pre-connection authentication callback/data exchange | `GOD-S61`, `GOD-S64` | `DIRECT` | Useful session admission primitive. |
| `GOD-CAP-448` | Authenticated peer is withheld from normal connected-peer list until auth completes | `GOD-S64` | `DIRECT` | Good isolation of untrusted connecting peers. |
| `GOD-CAP-449` | Only authentication data is exchanged while peer is authenticating | `GOD-S64` | `DIRECT` | Reduces pre-auth gameplay attack surface. |
| `GOD-CAP-450` | Auth timeout defaults to 3 seconds | `GOD-S64` | `DIRECT DEFAULT` | Must be tuned for real auth service latency/network conditions. |
| `GOD-CAP-451` | Empty/default auth callback automatically accepts peers | `GOD-S64` | `CRITICAL DEFAULT` | Public servers must explicitly configure admission/auth policy. |
| `GOD-CAP-452` | Authentication handshake does not itself define accounts/roles/bans/character ownership | technology boundary | `NOT-PROVIDED` | Leyforge/backend identity authority remains external. |
| `GOD-CAP-453` | Network peer/session identity must be mapped to stable account/player/character IDs after validation | architecture boundary | `LEYFORGE-OWN` | Never use random peer ID as saved identity. |

---

# 121. Network Deserialization Security

Godot explicitly warns against decoding serialized Objects from untrusted network data.

| ID | Capability / fact | Evidence | Result | Leyforge implication |
|---|---|---|---|---|
| `GOD-CAP-454` | SceneMultiplayer object decoding defaults to disabled | `GOD-S64` | `DIRECT SAFE DEFAULT` | Preserve disabled state for untrusted multiplayer. |
| `GOD-CAP-455` | Godot warns decoded serialized Objects can execute code and create RCE risk | `GOD-S64`, `GOD-S76` | `DIRECT CRITICAL` | Network protocol must use explicit primitive/schema data only. |
| `GOD-CAP-456` | PacketPeer Variant decoding also warns against allowing Objects from untrusted sources | `GOD-S76` | `DIRECT` | Same rule applies below SceneMultiplayer. |
| `GOD-CAP-457` | Network messages should not deserialize arbitrary Resource/Script/Object graphs | security synthesis | `LEYFORGE RULE` | Schema-controlled binary/primitive messages only. |

---

# 122. Protocol Versioning / Compatibility Boundary

Godot manages connections and packet delivery.

Leyforge needs its own compatibility contract.

Every custom protocol session should eventually negotiate something equivalent to:

```text
Leyforge protocol version
server build
world save version
registry/content-pack manifest
generator contract
feature flags
compression capabilities
optional mod compatibility
```

| ID | Capability / fact | Evidence | Result | Leyforge implication |
|---|---|---|---|---|
| `GOD-CAP-458` | SceneMultiplayer does not expose a Leyforge semantic protocol/version handshake automatically | boundary | `NOT-PROVIDED` | Define explicit protocol hello/capability negotiation. |
| `GOD-CAP-459` | Godot RPC checksum compatibility is scene/script-structure compatibility, not world/content compatibility | `GOD-S61` | `DIRECT DISTINCTION` | FCC/registry/generator compatibility needs separate validation. |
| `GOD-CAP-460` | Custom byte protocol can remain stable independently from Node paths if designed explicitly | `GOD-S64` + synthesis | `STRONG FIT` | Prefer stable message IDs/schema for long-lived world traffic. |

---

# 123. Voxel / World Network Protocol Boundary

PRD-02 established:

- authoritative block revisions;
- deterministic client regeneration possibility;
- snapshots/deltas;
- server interest;
- reconnect repair.

Round 5 maps that onto Godot transport.

Candidate:

```text
ENet MultiplayerPeer
       ↓
Leyforge Protocol Mux
  ├── NET-INPUT
  ├── NET-ENTITY
  ├── NET-VOXEL-OP
  ├── NET-VOXEL-BLOCK
  ├── NET-WORLD-EVENT
  └── NET-CONTROL
       ↓
authoritative domain services
```

| ID | Capability / fact | Evidence | Result | Leyforge implication |
|---|---|---|---|---|
| `GOD-CAP-461` | Godot exposes raw packet/byte delivery suitable for application framing | `GOD-S63`, `GOD-S64` | `DIRECT` | No need to encode voxel chunks as RPC argument/property trees. |
| `GOD-CAP-462` | ENet channels/reliability allow voxel control and bulk payload separation | `GOD-S62`, `GOD-S63` | `DIRECT` | Good protocol transport substrate. |
| `GOD-CAP-463` | Godot does not provide chunk revision/segmentation/reassembly semantics for Leyforge | boundary | `NOT-PROVIDED` | PRD-02 custom voxel protocol remains required. |
| `GOD-CAP-464` | Voxel block payload size may exceed desirable datagram/message sizing | PRD-02 + SceneMultiplayer sizing | `P3/P4-NEEDED` | Segment/compress/backpressure strategy required. |
| `GOD-CAP-465` | Client deterministic regeneration can reduce transmitted terrain only after content/generator compatibility handshake | PRD-02 + protocol boundary | `LEYFORGE-OWN` | Treat as optional optimization. |

---

# 124. Session Lifecycle

Network connection lifecycle must remain separate from persistent character/world identity.

Candidate state machine:

```text
SOCKET_CONNECTED
      ↓
AUTHENTICATING
      ↓
PROTOCOL_NEGOTIATION
      ↓
SESSION_ACCEPTED
      ↓
WORLD_JOIN_PRELOAD
      ↓
ACTIVE
      ↓
DISCONNECTING
      ↓
PERSIST/LEASE CLEANUP
```

Godot supplies several connection signals/statuses.

Leyforge owns the higher semantic phases.

| ID | Capability / fact | Evidence | Result | Leyforge implication |
|---|---|---|---|---|
| `GOD-CAP-466` | MultiplayerAPI emits peer connect/disconnect and client connection outcome signals | `GOD-S61` | `DIRECT` | Good transport/session event input. |
| `GOD-CAP-467` | MultiplayerPeer can refuse new connections | `GOD-S63`, `GOD-S64` | `DIRECT` | Useful draining/full/maintenance state. |
| `GOD-CAP-468` | Peer can be explicitly disconnected | `GOD-S63`, `GOD-S64` | `DIRECT` | Supports kicks/auth failure/server drain. |
| `GOD-CAP-469` | Transport disconnect does not automatically resolve persistent leases/transactions/character state | boundary | `NOT-PROVIDED` | Leyforge owns disconnect cleanup/reconnect grace. |

---

# 125. NAT / Player-Hosted Games

ENet uses UDP, so Internet-hosted listen servers behind residential NAT commonly require a reachability strategy.

Godot provides UPnP and lower-level hooks, but not one guaranteed universal NAT solution.

| ID | Capability / fact | Evidence | Result | Leyforge implication |
|---|---|---|---|---|
| `GOD-CAP-470` | Godot high-level ENet hosting normally requires UDP port forwarding when behind NAT | `GOD-S61` | `DIRECT` | Player-hosted games need NAT UX. |
| `GOD-CAP-471` | Godot provides UPnP port-mapping support | `GOD-S70`, `GOD-S71` | `DIRECT` | Useful first attempt for local-host mode. |
| `GOD-CAP-472` | UPnP is not universally supported/enabled | `GOD-S71` | `DIRECT` | Cannot be sole connectivity strategy. |
| `GOD-CAP-473` | UPnP mappings/external IP may change and need refresh/recovery | `GOD-S71` | `DIRECT` | Host session needs lifecycle monitoring. |
| `GOD-CAP-474` | UPnP calls are synchronous/blocking | `GOD-S71` | `DIRECT` | Run away from time-critical game path. |
| `GOD-CAP-475` | ENet local-port and mesh APIs can support advanced NAT-punch approaches | `GOD-S62` | `DIRECT PRIMITIVE` | Needs dedicated prototype/service. |
| `GOD-CAP-476` | Godot does not provide a complete matchmaking/STUN/TURN/relay service for ENet out of the box | technology boundary | `NOT-PROVIDED AS COMPLETE SERVICE` | External/backend service likely needed for seamless public hosting. |
| `GOD-CAP-477` | Manual port forwarding remains a necessary fallback for some player-hosted configurations | `GOD-S61`, `GOD-S71` | `DIRECT` | UX/documentation requirement if listen-server hosting ships. |

---

# 126. Dedicated Authoritative Server Topology

The preferred production topology remains:

```text
CLIENTS
   │
   │ realtime gameplay
   ▼
AUTHORITATIVE WORLD SERVER
   │
   ├── simulation
   ├── voxel authority
   ├── persistence coordinator
   └── interest manager
```

Optional service plane:

```text
AUTH / ACCOUNT / DIRECTORY / MATCHMAKING
                    │
                    ▼
             world-server ticket
```

| ID | Capability / fact | Evidence | Result | Leyforge implication |
|---|---|---|---|---|
| `GOD-CAP-478` | Godot dedicated server can run headless without GPU/display | `GOD-S68` | `DIRECT` | Strong topology fit. |
| `GOD-CAP-479` | Dedicated-server export can strip visual resources while preserving references | `GOD-S68` | `DIRECT` | Smaller deployment artifact. |
| `GOD-CAP-480` | Dedicated export supplies `dedicated_server` feature tag | `GOD-S68` | `DIRECT` | Clean server/client startup split. |
| `GOD-CAP-481` | Server can also be started from normal binary via `--headless` for development/ops | `GOD-S68` | `DIRECT` | Useful automation/debugging. |
| `GOD-CAP-482` | Export templates are preferred over editor binary for production server use | `GOD-S68` | `DIRECT` | Production artifact policy. |
| `GOD-CAP-483` | Linux production server template can be compiled with production optimization | `GOD-S69` | `DIRECT` | Good custom/module/double-precision deployment path. |
| `GOD-CAP-484` | Linux binary compatibility depends on build environment age/glibc distribution | `GOD-S69` | `DIRECT DEPLOYMENT FACT` | Build in controlled old-enough container/toolchain. |
| `GOD-CAP-485` | Client and server may share one Godot project with conditional startup paths | `GOD-S68` | `DIRECT` | Strong shared-code path; authority boundaries still required. |

---

# 127. Listen Server / Local Multiplayer

Godot high-level API can run server and client contexts in one process/SceneTree branch arrangement.

This is useful for:

- single-player using server authority;
- LAN host;
- local host + remote clients;
- testing.

But production semantics should not depend on host-player special cases.

| ID | Capability / fact | Evidence | Result | Leyforge implication |
|---|---|---|---|---|
| `GOD-CAP-486` | Different SceneTree branches can use different MultiplayerAPI instances | `GOD-S61`, `GOD-S64` | `DIRECT` | Useful in-process client/server testing or host mode. |
| `GOD-CAP-487` | Godot examples warn dedicated server must not be treated as a player | `GOD-S61` | `DIRECT` | Keep server identity separate from player identity. |
| `GOD-CAP-488` | `call_local` RPC mode supports host-as-player patterns | `GOD-S61` | `DIRECT` | Convenience only; do not make authoritative rules host-dependent. |
| `GOD-CAP-489` | Single-player can potentially run through same server-authority service interfaces without network serialization | architecture hypothesis | `STRONG CANDIDATE` | Reduces SP/MP semantic divergence. |

---

# 128. WebSocket Boundary

Godot supports WebSockets on native and web platforms, including TLS (`wss://`).

WebSockets run over TCP.

Godot's own documentation notes they are useful for messaging/push-style workloads but are not ideal for latency-sensitive fast realtime traffic.

| ID | Capability / fact | Evidence | Result | Leyforge implication |
|---|---|---|---|---|
| `GOD-CAP-490` | WebSocket client/server exists on supported native/web platforms | `GOD-S70`, `GOD-S72` | `DIRECT` | Useful control/service/tool path. |
| `GOD-CAP-491` | WebSocket supports TLS-backed secure connections | `GOD-S72` | `DIRECT` | Candidate admin/dashboard/lobby connection. |
| `GOD-CAP-492` | WebSocket uses TCP semantics and is not the leading fast-realtime gameplay transport | `GOD-S72` | `DIRECT GUIDANCE` | Keep ENet for native gameplay baseline. |
| `GOD-CAP-493` | WebSocket peer exposes queue/buffer limits | `GOD-S72` | `DIRECT` | Abuse/backpressure still requires configuration. |
| `GOD-CAP-494` | WebSocket can use subprotocols/handshake headers | `GOD-S72` | `DIRECT` | Useful authenticated service integration. |

---

# 129. WebRTC Boundary

WebRTC is most relevant to browser/P2P/NAT-traversed use cases.

Current Godot docs state browser support is built in, while native platforms require the WebRTC native extension/plugin.

| ID | Capability / fact | Evidence | Result | Leyforge implication |
|---|---|---|---|---|
| `GOD-CAP-495` | Godot exposes WebRTC multiplayer/data-channel abstractions | `GOD-S70`, `GOD-S73` | `DIRECT` | Optional future P2P/browser technology. |
| `GOD-CAP-496` | Native WebRTC requires an external GDExtension plugin in current docs | `GOD-S73` | `DEPENDENCY` | Adds another native dependency for desktop if adopted. |
| `GOD-CAP-497` | WebRTC still requires signalling/ICE coordination beyond simply creating a peer | WebRTC model/docs | `DIRECT` | Not a zero-backend NAT solution. |
| `GOD-CAP-498` | WebRTC is not needed for the initial dedicated ENet server architecture | synthesis | `DEFER` | Track only if browser/P2P requirement becomes concrete. |

---

# 130. TCP / HTTP Service Plane

Godot provides TCP, HTTP and HTTPS independently from multiplayer.

This is important because not every network interaction should share the realtime game socket.

Candidate service-plane uses:

- authentication token exchange;
- account/session service;
- server directory;
- matchmaking;
- mod/package manifest service;
- telemetry/crash intake;
- admin/API control;
- update metadata.

| ID | Capability / fact | Evidence | Result | Leyforge implication |
|---|---|---|---|---|
| `GOD-CAP-499` | Godot provides TCP client/server primitives | `GOD-S70` | `DIRECT` | Available for bespoke reliable control traffic. |
| `GOD-CAP-500` | HTTPClient/HTTPRequest support HTTP(S) | `GOD-S70`, `GOD-S77` | `DIRECT` | Natural external-service client path. |
| `GOD-CAP-501` | HTTPRequest explicitly recommends TLS and avoiding credentials in GET URLs | `GOD-S77` | `DIRECT SECURITY GUIDANCE` | Account/auth calls must use secure request patterns. |
| `GOD-CAP-502` | HTTPS uses Godot's TLS support | `GOD-S74`, `GOD-S77` | `DIRECT` | Suitable protected control/service channel. |
| `GOD-CAP-503` | Godot client networking primitives do not turn the game server into a full web/backend framework | technology boundary | `NOT-PROVIDED` | External service implementation may use more appropriate backend technology. |

---

# 131. TLS / DTLS Boundary

Godot supports TLS for stream connections and DTLS for UDP packet peers.

These are distinct from ENetMultiplayerPeer's exposed API.

| ID | Capability / fact | Evidence | Result | Leyforge implication |
|---|---|---|---|---|
| `GOD-CAP-504` | StreamPeerTLS can secure stream/TCP connections and validate hostnames/certificates | `GOD-S74` | `DIRECT` | Strong admin/service/control primitive. |
| `GOD-CAP-505` | Godot can use OS CA stores and bundled Mozilla certificates | `GOD-S74` | `DIRECT` | Standard public TLS is practical. |
| `GOD-CAP-506` | DTLS client/server primitives exist over UDP packet peers | `GOD-S75` | `DIRECT` | Secured datagram building block exists. |
| `GOD-CAP-507` | Current DTLS docs warn certificate revocation and certificate pinning are unsupported | `GOD-S75` | `DIRECT SECURITY LIMIT` | Do not assume full enterprise PKI behaviour. |
| `GOD-CAP-508` | `ENetMultiplayerPeer` does not expose TLS/DTLS options in its 4.7 API | `GOD-S62` vs `GOD-S75` | `DIRECT API BOUNDARY` | Realtime transport confidentiality/integrity needs explicit architecture if required. |
| `GOD-CAP-509` | A custom peer/relay/VPN/platform transport could provide additional secure transport semantics | `GOD-S67` + architecture | `ESCAPE HATCH` | Evaluate against threat model, not by default. |

## 131.1 Security distinction

Application authentication does **not** automatically mean:

```text
transport is encrypted
```

Transport encryption does **not** automatically mean:

```text
client commands are trustworthy
```

Leyforge needs both:

- secure transport/service choices where required;
- server-authoritative validation regardless.

---

# 132. Server Relay / Peer-to-Peer Boundary

`SceneMultiplayer.server_relay` can relay client traffic and connection notifications through the server.

| ID | Capability / fact | Evidence | Result | Leyforge implication |
|---|---|---|---|---|
| `GOD-CAP-510` | SceneMultiplayer can relay client messages through server when supported | `GOD-S64` | `DIRECT` | Convenience for peer messaging. |
| `GOD-CAP-511` | Server relay can be disabled | `GOD-S64` | `DIRECT` | Dedicated authoritative topology can avoid unnecessary client-to-client traffic. |
| `GOD-CAP-512` | Changing relay mode with active peers may cause unexpected behaviour | `GOD-S64` | `DIRECT` | Configure topology before admission. |
| `GOD-CAP-513` | Leyforge does not require clients to communicate authoritatively with one another | authority model | `LEYFORGE RULE` | Default to server-mediated authoritative state. |

---

# 133. Capacity / Backpressure / Abuse Limits

A public server must assume hostile or simply malfunctioning clients.

Godot provides some limits, but not a complete abuse-management layer.

Potential limits include:

- max clients;
- ENet bandwidth;
- auth timeout;
- refuse-new-connections;
- SceneMultiplayer packet limits;
- WebSocket buffer/queue limits;
- spawner limit;
- per-message application rate limits.

| ID | Capability / fact | Evidence | Result | Leyforge implication |
|---|---|---|---|---|
| `GOD-CAP-514` | ENet server has explicit max-client setting | `GOD-S62` | `DIRECT` | First admission capacity gate. |
| `GOD-CAP-515` | ENet has configurable bandwidth caps | `GOD-S62` | `DIRECT` | Useful connection-level backpressure. |
| `GOD-CAP-516` | SceneMultiplayer has auth timeout and connection refusal controls | `GOD-S64` | `DIRECT` | Admission abuse controls. |
| `GOD-CAP-517` | Scene replication has packet-size configuration | `GOD-S64` | `DIRECT` | Protect against oversized auto-replication. |
| `GOD-CAP-518` | MultiplayerSpawner has optional spawn limit but default is unlimited | `GOD-S66` | `DIRECT` | Explicit production limits required. |
| `GOD-CAP-519` | Godot does not automatically rate-limit semantic RPC/actions per player | `GOD-S61` security guidance | `NOT-PROVIDED` | Leyforge command budgets/token buckets required. |
| `GOD-CAP-520` | Godot does not know the computational cost of a valid-looking action | boundary | `NOT-PROVIDED` | Rate limit by work category, not packets alone. |
| `GOD-CAP-521` | Worldgen/teleport/block requests can create server-side amplification even with small inbound messages | project inference | `SECURITY/PERF RISK` | Include cost accounting and request coalescing. |

---

# 134. Command Validation Boundary

A network command needs more than a syntactically valid packet.

Example:

```text
BuildBlockCommand
  session
  sequence
  world/realm
  target coordinate
  material semantic ID
  expected revision
  tool/action context
```

Server validates:

```text
authenticated?
authorized?
correct realm?
loaded/accessible?
distance/reach?
resource available?
placement legal?
revision compatible?
rate/work budget?
```

Then commits one authoritative transaction.

This preserves single-player and multiplayer semantic parity.

---

# 135. Sequence / Idempotency / Replay Handling

Godot transport modes provide ordering/reliability.

Leyforge still needs semantic operation identity where duplicate/retry matters.

Examples:

- construction order;
- inventory transfer;
- trade;
- voxel edit;
- commissioning;
- realm transition;
- purchase;
- administrative action.

| ID | Capability / fact | Evidence | Result | Leyforge implication |
|---|---|---|---|---|
| `GOD-CAP-522` | Reliable transport acknowledgement is not the same as semantic transaction idempotency | protocol boundary | `CRITICAL` | Consequential commands need operation IDs/revision checks. |
| `GOD-CAP-523` | Reconnect can create new network peer IDs | connection model | `DIRECT IMPLICATION` | Persistent operation/session identity cannot be peer-ID-only. |
| `GOD-CAP-524` | Server journal/revision system can provide dedupe/replay evidence above transport | PRD-02 persistence boundary | `STRONG FIT` | Network and save transaction architecture should share operation IDs where sensible. |

---

# 136. Reconnect / Resume Boundary

Godot handles new connection establishment.

Leyforge must decide whether a disconnect means:

- immediate character logout;
- grace period;
- temporary AI/idle representation;
- preserved vessel seat/control lease;
- resumable block/world transfer;
- full fresh join.

Candidate reconnect handshake:

```text
authenticate
    ↓
recover stable session/account
    ↓
world compatibility
    ↓
last acknowledged world/block revisions
    ↓
repair deltas/snapshots
    ↓
reclaim or safely reassign active character
```

| ID | Capability / fact | Evidence | Result | Leyforge implication |
|---|---|---|---|---|
| `GOD-CAP-525` | Godot connection API does not automatically restore semantic player/world session after reconnect | boundary | `NOT-PROVIDED` | Resume protocol remains Leyforge-owned. |
| `GOD-CAP-526` | PRD-02 block revisions provide a strong voxel-resume primitive | PRD-02 | `CROSS-TECH FIT` | Reconnect can compare block revision sets rather than resend blindly. |
| `GOD-CAP-527` | Custom byte messages can carry resume acknowledgements/manifests | `GOD-S64` | `DIRECT` | Transport supports the planned repair protocol. |

---

# 137. Deployment Configuration

Godot supports command-line arguments and environment access suitable for server startup configuration.

Candidate server configuration:

```text
--world=<id/path>
--port=<udp>
--bind=<ip>
--max-players=<n>
--profile=<low/server/high>
--log-level=<...>
--admin-endpoint=<...>
```

Secrets should not simply be passed in visible command lines when a safer secret mechanism/environment/file/service is available.

| ID | Capability / fact | Evidence | Result | Leyforge implication |
|---|---|---|---|---|
| `GOD-CAP-528` | Exported Godot processes can inspect custom command-line arguments | `GOD-S78` | `DIRECT` | Good server-instance configuration primitive. |
| `GOD-CAP-529` | Godot can read environment variables | `GOD-S78` | `DIRECT` | Useful deployment configuration/secret indirection. |
| `GOD-CAP-530` | Godot command-line export/headless workflow is automation-friendly | `GOD-S68`, `GOD-S78` | `DIRECT` | CI/server orchestration fit. |
| `GOD-CAP-531` | Process supervision/restart/container orchestration is outside Godot's game architecture | boundary | `EXTERNAL OPS` | Use OS/container/service tooling rather than inventing inside game. |

---

# 138. Dedicated Server Artifact / Content Separation

Dedicated server export can strip visual resources.

This creates an important production requirement:

> **Server-authoritative logic must not require visual-only assets to answer gameplay questions.**

The server should retain:

- semantic registries;
- collision/voxel data needed for authority;
- worldgen data;
- physical/material properties;
- recipes;
- gameplay definitions.

It should be able to strip:

- high-resolution textures;
- client-only shaders;
- UI;
- decorative VFX;
- unnecessary meshes where not used for authoritative collision.

| ID | Capability / fact | Evidence | Result | Leyforge implication |
|---|---|---|---|---|
| `GOD-CAP-532` | Dedicated export can replace/strip selected visual resource classes | `GOD-S68` | `DIRECT` | Good server package reduction. |
| `GOD-CAP-533` | Server logic depending on visual resources may break when those are stripped | deployment implication | `ARCHITECTURE PRESSURE` | Forge runtime definitions must separate semantic/physics data from client visuals. |
| `GOD-CAP-534` | PRD-02 Zylann headless path must be validated with stripped resource set | PRD-02 + `GOD-S68` | `P3/P4-NEEDED` | Server fixture must mirror production export, not editor. |

---

# 139. Build / Deployment Reproducibility

If Leyforge uses:

- Zylann module;
- precision=double;
- custom engine patches;
- PCK encryption;

then official precompiled templates may no longer be sufficient.

Round 5 reinforces a reproducible build pipeline.

| ID | Capability / fact | Evidence | Result | Leyforge implication |
|---|---|---|---|---|
| `GOD-CAP-535` | Custom server/export templates can be built from source | `GOD-S69` | `DIRECT` | Supports module/double-precision/custom-patch paths. |
| `GOD-CAP-536` | PCK encryption requires custom export templates containing the same key | `GOD-S79` | `DIRECT` | Another custom-build cost if enabled. |
| `GOD-CAP-537` | PCK encryption protects packaged assets from casual extraction but embeds required key into binary | `GOD-S79` | `DIRECT LIMIT` | It is not a substitute for network/server security. |
| `GOD-CAP-538` | Production server binary/toolchain needs exact version/build manifest | Branch-B + build facts | `LEYFORGE RULE` | Support bundle should record Godot/Zylann/build hash/precision/edition. |

---

# 140. Admin / RCON / Control Plane Boundary

No Godot gameplay API discovered in this audit constitutes a complete secure RCON/admin platform.

Godot provides suitable primitives to build or connect one:

- HTTPS;
- TLS streams;
- WebSocket TLS;
- TCP.

Recommended separation:

```text
PUBLIC GAMEPLAY PORT
  ENet/UDP
  player protocol

PRIVATE ADMIN/SERVICE PORT
  HTTPS/WSS/TLS
  strong authentication
  role-based authorization
  rate limits
  audit log
```

Do not expose arbitrary Godot remote calls as administration.

| ID | Capability / fact | Evidence | Result | Leyforge implication |
|---|---|---|---|---|
| `GOD-CAP-539` | Godot provides secure stream/HTTP/WebSocket primitives for admin/control integration | `GOD-S72`, `GOD-S74`, `GOD-S77` | `DIRECT` | Enough client/runtime plumbing. |
| `GOD-CAP-540` | Godot does not provide Leyforge admin roles/audit/command governance automatically | boundary | `NOT-PROVIDED` | Branch-B/security/admin design remains project-owned. |
| `GOD-CAP-541` | Admin traffic should be isolated from gameplay channels/authorization | security architecture | `STRONG RECOMMENDATION` | Reduce blast radius and head-of-line contention. |

---

# 141. Local Network / Offline Modes

The future multiplayer requirements include:

- single player;
- local/LAN host;
- online host;
- dedicated server.

Round 5 recommends one semantic authority contract across all modes.

```text
SINGLE PLAYER
  local authoritative WorldServer service

LAN HOST
  same WorldServer + ENet listener

ONLINE LISTEN
  same + admission/NAT

DEDICATED
  same authority in headless process
```

The transport may disappear in single player, but command validation/transaction semantics should remain equivalent where practical.

This sharply reduces SP↔MP migration bugs.

---

# 142. Security Trust Boundary

Round 5 formalizes four trust zones.

## Zone A — Unauthenticated network

May:

- connect;
- exchange bounded auth handshake.

Must not:

- touch world state;
- allocate expensive world resources;
- trigger worldgen/teleports;
- receive sensitive data.

## Zone B — Authenticated session

May submit commands.

Still untrusted.

## Zone C — Authoritative server domain

Validates/commits.

## Zone D — Admin/operator plane

Separate stronger credentials/roles/audit.

This model applies even to "friendly/co-op" public servers because malformed clients can exist accidentally.

---

# 143. Server Security Baseline Requirements

PRD-03 Round 5 emits these minimum future rules:

1. `allow_object_decoding=false` for untrusted multiplayer.
2. Explicit authentication on public servers.
3. Client messages are commands/proposals, never trusted final world state.
4. Validate all semantic IDs and ranges.
5. Bound packet/message lengths before allocation.
6. Bound per-session request frequency.
7. Bound expensive world operations by work budget.
8. Use stable operation IDs/revisions for consequential transactions.
9. Separate persistent identity from peer ID.
10. Do not include server secrets/private keys in client builds.
11. Admin/control traffic uses separate authorization and preferably separate transport/service endpoint.
12. Server logs security-relevant rejects without logging secrets.
13. Mod/custom content crosses the stricter Branch-B player-content boundary.
14. Dedicated server must run with least required OS/network permissions.
15. Network parser fuzzing becomes part of PRD-07.

---

# 144. Round-5 Risk Register

| Risk | Severity | Reason |
|---|---|---|
| `GOD-R05-01` SceneMultiplayer wire protocol treated as permanent Leyforge protocol | RED | Upstream explicitly calls it implementation detail. |
| `GOD-R05-02` RPC NodePath coupling leaks into domain/network schema | RED | Scene refactors can become protocol breaks. |
| `GOD-R05-03` MultiplayerSynchronizer used for voxel chunks | RED | Property/packet model is wrong for bulk world data. |
| `GOD-R05-04` Reliable transfer used for every message | RED | Latency/head-of-line/bandwidth cost. |
| `GOD-R05-05` All reliable data shares one channel | AMBER/RED | Independent traffic blocks. |
| `GOD-R05-06` Unreliable-ordered mixed packet sizes on one channel | AMBER | Can induce extra loss. |
| `GOD-R05-07` Peer ID saved as player identity | RED | Peer IDs are connection-local. |
| `GOD-R05-08` Empty auth callback on public server | RED | Peers are automatically accepted. |
| `GOD-R05-09` Arbitrary Object decoding enabled | CRITICAL | Godot warns of remote code execution risk. |
| `GOD-R05-10` Client-reported position/inventory/resources trusted | RED | Direct cheat/desync path. |
| `GOD-R05-11` Packet rate limit without computational-work limit | RED | Cheap packet can trigger expensive server work. |
| `GOD-R05-12` Large voxel block sent as one unbounded message | RED | Fragmentation/congestion/allocation risk. |
| `GOD-R05-13` ENet configured for thousands of clients because API allows 4095 | RED | Real capacity app-dependent. |
| `GOD-R05-14` UPnP assumed universal | RED | Many networks disable/do not support it. |
| `GOD-R05-15` UPnP discovery/mapping on game-critical main path | AMBER | Calls are synchronous/blocking. |
| `GOD-R05-16` WebRTC introduced without concrete browser/P2P requirement | AMBER | Native plugin + signalling complexity. |
| `GOD-R05-17` WebSocket used for latency-critical native gameplay | AMBER/RED | TCP behaviour is poor fit. |
| `GOD-R05-18` Authentication mistaken for transport encryption | RED | Separate security properties. |
| `GOD-R05-19` TLS/DTLS mistaken for command trust | RED | Server must still validate clients. |
| `GOD-R05-20` ENet confidentiality assumed without explicit secure transport design | RED | 4.7 ENet peer exposes no TLS/DTLS option. |
| `GOD-R05-21` Client build contains server private keys/admin credentials | CRITICAL | Credential compromise. |
| `GOD-R05-22` Dedicated server requires client-only visual resources | RED | Breaks stripped/headless deployment. |
| `GOD-R05-23` Editor/headless fixture used instead of production server export for qualification | AMBER | Artifact behaviour can differ. |
| `GOD-R05-24` Custom server built on too-new Linux distro | AMBER | Binary compatibility issue. |
| `GOD-R05-25` Admin commands exposed as normal gameplay RPCs | CRITICAL | Privilege/blast-radius problem. |
| `GOD-R05-26` No protocol version/content manifest negotiation | RED | Update/mod/save mismatches create corruption/desync. |
| `GOD-R05-27` Reconnect treated as ordinary new character join | AMBER/RED | Duplication/lease/state loss risk. |
| `GOD-R05-28` Single-player and multiplayer use different semantic transaction paths | RED | Long-term divergence/bugs. |

---

# 145. Round-5 Prototype / Benchmark Packages

## `GOD-PKG-37 — ENet Traffic-Class Matrix`

Define representative channels/messages:

- input;
- motion;
- gameplay events;
- voxel operations;
- voxel payload;
- chat.

Inject:

- latency;
- jitter;
- 1/5/10% packet loss;
- bandwidth caps.

Measure:

- responsiveness;
- retransmission;
- head-of-line effects;
- queue growth;
- bandwidth.

## `GOD-PKG-38 — Scene Replication vs Custom Entity Protocol`

Implement the same active NPC/player fixture using:

1. MultiplayerSynchronizer/Spawner;
2. custom raw binary entity snapshots.

Measure:

- engineering complexity;
- bytes/sec;
- CPU;
- interest filtering;
- reconciliation;
- debugging.

Goal:

- decide where SceneMultiplayer replication earns its keep.

## `GOD-PKG-39 — Voxel Bulk Transport`

Transmit representative compressed voxel blocks/deltas.

Test:

- segmentation;
- multiple block sizes;
- LZ4/ZSTD output from PRD-02;
- reliable/custom channels;
- loss/retransmission;
- teleport burst.

Success:

- bounded memory/queue;
- no gameplay starvation.

## `GOD-PKG-40 — Authentication / Admission`

Fixture:

```text
connect
  ↓
auth token
  ↓
backend/session validation
  ↓
protocol/content negotiation
  ↓
world join
```

Test:

- wrong token;
- expired token;
- timeout;
- repeated attempts;
- auth service delay;
- disconnect mid-auth.

## `GOD-PKG-41 — Hostile Command / Rate-Limit`

Automated client sends:

- impossible movement;
- oversized IDs;
- invalid block IDs;
- spam mine/build;
- teleport requests;
- malformed payload lengths;
- duplicated operation IDs;
- stale revisions.

Success:

- no crash;
- bounded CPU/memory;
- reject reason/metrics;
- no world mutation.

## `GOD-PKG-42 — Reconnect / Resume`

Drop connection during:

- ordinary movement;
- inventory transfer;
- construction;
- voxel stream;
- vessel control;
- portal transition.

Reconnect with stable account/session.

Prove exactly-once/coherent semantic recovery.

## `GOD-PKG-43 — Dedicated Server Production Export`

Test actual stripped release server artifact:

- no display/GPU;
- production Zylann edition;
- worldgen;
- physics queries;
- navigation;
- persistence;
- networking;
- long soak.

Compare memory/artifact size with client build.

## `GOD-PKG-44 — Server Capacity Staircase`

Scale peers:

```text
1 → 4 → 8 → 16 → 32 → 64 → ...
```

with representative active-world workload.

Measure:

- CPU;
- memory;
- bandwidth;
- voxel interest;
- nav;
- persistence;
- tick latency.

Do not target ENet's theoretical API maximum.

## `GOD-PKG-45 — Listen Server / NAT`

Test:

- LAN;
- manual forwarding;
- UPnP success;
- UPnP unavailable;
- mapping expiry/change;
- multiple hosts behind same gateway.

Evaluate whether separate relay/hole-punch service is required for acceptable UX.

## `GOD-PKG-46 — Transport Security Study`

Threat model and prototype:

- HTTPS authentication/service;
- WSS admin/control;
- DTLS/raw UDP proof;
- ENet without additional transport encryption;
- optional VPN/relay/custom peer architecture.

Goal:

- decide what confidentiality/integrity is required for game data and how to implement it without inventing cryptography.

## `GOD-PKG-47 — Protocol Version Mismatch`

Connect clients with:

- old protocol;
- wrong registry;
- wrong mod pack;
- wrong generator;
- wrong world schema capability.

Server must reject/upgrade/quarantine before world state is exchanged incorrectly.

## `GOD-PKG-48 — Fuzz Network Decoder`

Fuzz:

- message header;
- lengths;
- enum IDs;
- semantic IDs;
- compression;
- segmentation;
- operation payloads.

No arbitrary object decoding permitted.

Run under sanitizers/native debug builds where possible.

## `GOD-PKG-49 — Admin Plane`

Build minimal authenticated admin service separate from gameplay RPCs.

Actions:

- health;
- metrics;
- graceful drain;
- save/checkpoint;
- kick/ban;
- shutdown.

Prove:

- privilege checks;
- audit log;
- no client exposure;
- secret redaction.

---

# 146. Round-5 Resolved / Narrowed Earlier Unknowns

## Round-1 Unknown 26 — Is ENet sufficient?

Narrowed:

> **ENet is the leading first native realtime transport and provides the key channel/reliability/bandwidth primitives Leyforge needs.**

Whether it satisfies final security, high-player-count and voxel-burst requirements remains P3/P4.

## Round-1 Unknown 27 — voxel bulk transport

Strongly narrowed:

- use raw/custom bytes or lower peer APIs;
- do not force voxel blocks through MultiplayerSynchronizer;
- segment/compress/backpressure at Leyforge protocol layer.

## Round-1 Unknown 28 — ENet traffic control

Narrowed:

- Godot exposes channels and in/out bandwidth constraints;
- exact congestion/traffic-class behaviour still requires hostile network benchmark.

## Round-1 Unknown 29 — NAT/lobby/discovery

Narrowed:

- UPnP exists but is not universal;
- ENet exposes primitives useful for advanced NAT traversal;
- seamless public hosting likely requires external signalling/directory/relay/hole-punch infrastructure.

## Round-1 Unknown 30 — WebRTC relevance

Current posture:

> **defer from core native dedicated-server architecture.**

Reconsider if browser/P2P becomes an explicit target.

## PRD-02 networking boundary

Strengthened:

- Godot can provide transport/session and bounded scene replication;
- Leyforge should own authoritative voxel/world protocol.

---

# 147. Round-5 New Unknowns

1. Should realtime gameplay use `SceneMultiplayer.send_bytes()` or direct `MultiplayerPeer` packet access as the main custom-protocol boundary?
2. Does SceneMultiplayer add measurable overhead to high-rate raw-byte traffic compared with direct peer polling?
3. Should entity replication use MultiplayerSynchronizer at all, or only custom binary snapshots?
4. Which entity classes benefit from automatic Spawner/Synchronizer replication?
5. How should SceneTree replication visibility consume the Leyforge Interest Manager without duplicating spatial work?
6. What exact channels should the ENet peer create?
7. How many ENet channels are safe/useful before complexity outweighs benefit?
8. Which message classes use unreliable vs unreliable-ordered?
9. Which reliable event streams must be isolated from one another?
10. Does voxel block reliability belong on one reliable channel or a custom segmented scheduler over several channels?
11. What maximum application message payload should Leyforge accept before segmentation?
12. What MTU assumptions should the protocol avoid hardcoding?
13. How should block segments be prioritized relative to immediate nearby collision-critical data?
14. Should teleport destination blocks use a high-priority stream class?
15. What fair-queue algorithm prevents one player's huge build/teleport from starving others?
16. What per-peer outbound memory/queued-byte cap should disconnect or throttle a slow client?
17. How should server-interest changes cancel obsolete queued voxel payloads?
18. What sequence scheme handles unreliable state snapshots safely?
19. Which commands require semantic operation IDs?
20. How long does the server retain recent operation IDs for reconnect/deduplication?
21. Should movement input be sequenced with tick numbers, monotonic counters or timestamps?
22. How should server tick/revision be encoded for prediction/reconciliation?
23. What prediction is required for player movement, mining and building?
24. Should block placement be predicted visually while awaiting server commit?
25. How are server rejection corrections presented without jarring players?
26. What authentication provider/account model will Leyforge use, if any?
27. Can offline/LAN worlds support no-account local identities while keeping stable owner IDs?
28. How are bans/roles/permissions represented independent of transport peer ID?
29. What token format/lifetime should public dedicated servers accept?
30. Should auth validation be local-signature verification or remote backend lookup?
31. What happens when central auth service is unavailable but an existing dedicated world is running?
32. Is guest/self-hosted mode allowed without central service?
33. How are player-hosted world credentials shared safely?
34. What NAT traversal quality is required for listen-server mode?
35. Is relay service acceptable for users who cannot port-forward?
36. Does relay traffic need to be end-to-end protected separately from relay operator?
37. Does Leyforge need encryption of realtime gameplay traffic or is authenticated integrity/privacy via secure tunnel/relay sufficient?
38. Can ENet be cleanly wrapped by an external secure tunnel without harming latency?
39. Is a custom DTLS/UDP `MultiplayerPeer` realistic, or unjustified engineering?
40. Can platform networking APIs (Steam/etc.) later implement `MultiplayerPeerExtension` behind the same Leyforge protocol?
41. Should external platform transports be optional adapters rather than canon?
42. Which public-server attacks must be included in threat model: packet flood, auth flood, decompression bomb, path/worldgen amplification, malicious mod IDs, chat abuse?
43. How does protocol enforce compressed/uncompressed size limits before allocating?
44. What compression ratios trigger bomb rejection?
45. Should every binary message carry CRC/checksum in addition to ENet integrity?
46. Should consequential messages carry MAC/signature above transport in any topology?
47. How does server handle old clients during rolling server upgrades?
48. Can a live dedicated server drain connections and save cleanly before process replacement?
49. Should worlds support hot reconnect after server process restart?
50. How are in-flight transactions recovered after network process crash?
51. What deployment supervisor/container/runtime will official servers use?
52. Which Linux base image/distribution provides oldest practical compatibility for custom server builds?
53. Should official server images ship only release templates, no editor/tools?
54. How are Godot/Zylann/build hashes exposed to diagnostics/admin health endpoint?
55. What production command-line options are safe vs sensitive?
56. Which secrets belong in environment, mounted files or external secret manager?
57. How are logs protected from accidentally printing auth tokens?
58. Does dedicated export strip any resource required by Zylann collision/worldgen unexpectedly?
59. Which resources must be explicitly kept in server export?
60. Is PCK encryption useful for client/IP protection enough to justify custom templates beyond module/double needs?
61. Should dedicated server PCK be encrypted at all, given server filesystem is already trusted/admin-controlled?
62. Does custom double-precision/module build affect network serialization compatibility with standard-precision clients?
63. Should network coordinates always use project-defined fixed/int hierarchical encoding rather than engine Vector3 serialization?
64. What endian/version policy applies to binary Leyforge protocol?
65. Should protocol schemas be hand-written binary, schema-generated (e.g. FlatBuffers/Protobuf-like), or a custom minimal codec?
66. Which serialization library best supports deterministic bounded parsing and version evolution?
67. Should service-plane account APIs use JSON while realtime uses binary?
68. How is admin command audit persisted independently from ordinary server logs?
69. What health/readiness endpoint should orchestration use?
70. What constitutes "server ready": process up, world loaded, voxel ready, checkpoint recovered, network accepting?
71. What graceful drain sequence prevents new players while finishing active checkpoint?
72. How does `refuse_new_connections` integrate with draining and matchmaking directory?
73. Should a full server hide from directory before refusing new connections?
74. What metrics indicate imminent overload before tick latency becomes unacceptable?
75. Should overload policy reduce simulation/view distance before rejecting players?
76. Can per-player interest budgets be reduced dynamically under server load without semantic inconsistency?
77. How are local split-screen players represented over one network connection in future?
78. Does one peer carry multiple local player identities, or one local server session per controller?
79. How will local split-screen interact with online authority and per-player permissions?
80. What test harness can emulate hundreds of headless synthetic clients cheaply?

---

# 148. Round-5 Architecture Boundary Verdict

Round 5 strongly supports a two-plane network architecture.

## 148.1 Gameplay data plane

```text
             LEYFORGE AUTHORITATIVE SERVER
                         │
                 Protocol / Interest
                         │
             ┌───────────┴────────────┐
             │                        │
      entity/control traffic      voxel/world traffic
             │                        │
             └───────────┬────────────┘
                         │
                  Godot MultiplayerPeer
                         │
                        ENet
                         │
                       UDP
```

SceneMultiplayer may be used **inside** this plane for bounded active-scene conveniences.

It is not the persistent network law.

## 148.2 Service/control plane

```text
accounts / auth / directory / matchmaking / admin
                         │
                   HTTPS / WSS / TLS
                         │
                external/internal service
```

## 148.3 Authority rule

```text
client
  sends input / command / request
       ↓
server validates
       ↓
authoritative transaction
       ↓
journal/world state
       ↓
interest-filtered result
       ↓
clients
```

This is identical in principle to the single-player semantic transaction path, except that the command crosses a transport boundary first.

---

# 149. Round-5 Gate Result

**PASS — CONTINUE PRD-03**

Godot provides a credible multiplayer/deployment substrate for Leyforge.

The strongest current candidate is:

> **authoritative Godot dedicated/listen server + ENet transport + Leyforge-owned binary world/voxel protocol + optional SceneMultiplayer entity conveniences + separate secured service/admin plane.**

No evidence currently requires a custom networking engine.

No evidence supports letting SceneMultiplayer's implementation-detail protocol become the durable world protocol.

Critical downstream proof remains:

- ENet traffic classes;
- packet loss/latency;
- voxel segmentation/backpressure;
- entity replication choice;
- authentication;
- command validation/rate limiting;
- reconnect;
- NAT/listen-server UX;
- secure transport threat model;
- production server export;
- capacity;
- protocol versioning;
- parser fuzzing.

---

# 150. Updated PRD-03 Round Sequence

1. **Round 1 — Current Godot baseline, build strategy, precision, physics, render, headless, networking/threading surface** — **COMPLETE**
2. **Round 2 — Threading, task scheduling, servers, SceneTree/resource lifetime and native-code boundaries** — **COMPLETE**
3. **Round 3 — Physics, movement, large coordinates, interpolation and vessel-supporting technology** — **COMPLETE**
4. **Round 4 — Navigation, pathfinding, avoidance and dynamic voxel-world integration** — **COMPLETE**
5. **Round 5 — Networking, transport, dedicated-server topology, security and deployment** — **COMPLETE**
6. **Round 6 — Rendering, shaders, GPU, low-end scalability, VFX/audio/input/UI/accessibility** — **NEXT**
7. **Round 7 — Files, databases, serialization, mod/plugin sandbox, platform/export, profiling/testing/CI and supporting libraries**
8. **Round 8 — Supporting-technology comparison, risk/prototype reconciliation and PRD-03 closure candidate**

---

# 151. Additional Official / Current Sources Used in Round 5

- Godot 4.7 High-level multiplayer  
  `https://docs.godotengine.org/en/4.7/tutorials/networking/high_level_multiplayer.html`
- ENetMultiplayerPeer 4.7  
  `https://docs.godotengine.org/en/4.7/classes/class_enetmultiplayerpeer.html`
- MultiplayerPeer  
  `https://docs.godotengine.org/en/4.7/classes/class_multiplayerpeer.html`
- SceneMultiplayer 4.7  
  `https://docs.godotengine.org/en/4.7/classes/class_scenemultiplayer.html`
- MultiplayerSynchronizer  
  `https://docs.godotengine.org/en/4.7/classes/class_multiplayersynchronizer.html`
- MultiplayerSpawner  
  `https://docs.godotengine.org/en/4.7/classes/class_multiplayerspawner.html`
- MultiplayerPeerExtension 4.7  
  `https://docs.godotengine.org/en/4.7/classes/class_multiplayerpeerextension.html`
- Dedicated server export  
  `https://docs.godotengine.org/en/4.7/tutorials/export/exporting_for_dedicated_servers.html`
- Linux/server compilation  
  `https://docs.godotengine.org/en/4.7/engine_details/development/compiling/compiling_for_linuxbsd.html`
- Networking feature list  
  `https://docs.godotengine.org/en/4.7/about/list_of_features.html`
- UPNP  
  `https://docs.godotengine.org/en/4.7/classes/class_upnp.html`
- WebSocket  
  `https://docs.godotengine.org/en/4.7/tutorials/networking/websocket.html`  
  `https://docs.godotengine.org/en/4.7/classes/class_websocketmultiplayerpeer.html`
- WebRTC  
  `https://docs.godotengine.org/en/4.7/tutorials/networking/webrtc.html`
- StreamPeerTLS / TLS certificates  
  `https://docs.godotengine.org/en/4.7/classes/class_streampeertls.html`  
  `https://docs.godotengine.org/en/4.7/tutorials/networking/ssl_certificates.html`
- PacketPeerDTLS / DTLSServer  
  `https://docs.godotengine.org/en/4.7/classes/class_packetpeerdtls.html`  
  `https://docs.godotengine.org/en/4.7/classes/class_dtlsserver.html`
- PacketPeer  
  `https://docs.godotengine.org/en/4.7/classes/class_packetpeer.html`
- HTTPRequest / HTTP client  
  `https://docs.godotengine.org/en/4.7/classes/class_httprequest.html`  
  `https://docs.godotengine.org/en/4.7/tutorials/networking/http_client_class.html`
- Command-line / OS  
  `https://docs.godotengine.org/en/4.7/tutorials/editor/command_line_tutorial.html`  
  `https://docs.godotengine.org/en/4.7/classes/class_os.html`
- PCK encryption  
  `https://docs.godotengine.org/en/4.7/engine_details/development/compiling/compiling_with_script_encryption_key.html`

---

**ROUND-5 RESULT: NETWORKING / TRANSPORT / DEDICATED-SERVER / SECURITY / DEPLOYMENT AUDIT COMPLETE.**

---

# 152. Round-6 Scope

Round 6 audits the player-facing rendering, presentation and interaction technology around Leyforge.

The audit covers:

- Forward+, Mobile and Compatibility renderers;
- rendering drivers;
- blocky material/shader portability;
- lighting, shadows, GI and reflection feature tiers;
- transparency/water;
- post-processing;
- resolution scaling and upscalers;
- texture compression and GPU-memory pressure;
- visibility ranges/HLOD and occlusion culling;
- particles and VFX;
- render-thread/custom compositor boundaries;
- low-end hardware profiles;
- semantic presentation fallbacks;
- UI scaling and multiple resolutions;
- input actions and rebinding;
- keyboard/mouse/gamepad/touch;
- local split-screen viewports;
- audio buses and 3D sound;
- accessibility metadata/screen readers/TTS;
- localization/complex text;
- Forge presentation certification.

The core engineering question is:

> **Can Godot let Leyforge preserve the same gameplay meaning and usability across high-end and low-end presentation profiles without duplicating game logic or making advanced graphics semantically mandatory?**

Round-6 answer:

> **YES. Godot provides unusually broad renderer, UI, input, audio and accessibility primitives for a scalable presentation shell. The critical architectural rule is that rendering, VFX and audio are projections of semantic state—not the only carrier of that state.**

---

# 153. Round-6 Official / Current Source Register

| Ref | Official/current source | Principal use |
|---|---|---|
| `GOD-S80` | Godot 4.7 internal rendering architecture | renderer/driver distinctions, Mobile bandwidth strategy, driver maturity |
| `GOD-S81` | Godot 4.7 feature list | renderer, material, lighting, texture, audio/input/accessibility feature surface |
| `GOD-S82` | 3D rendering limitations | texture-size/color-precision limits |
| `GOD-S83` | Renderer comparison | Forward+/Mobile/Compatibility feature differences |
| `GOD-S84` | Spatial shader reference | material/shader render modes |
| `GOD-S85` | Compositor | custom render pipeline effects and renderer limitations |
| `GOD-S86` | Resolution scaling | bilinear/FSR/scaling trade-offs |
| `GOD-S87` | Multiple resolutions | separate 3D/UI scaling and runtime UI scale |
| `GOD-S88` | GPU optimization | VRAM compression, shadows and GPU cost |
| `GOD-S89` | Image import / compressed texture docs | VRAM compression/Basis Universal behaviour |
| `GOD-S90` | Occlusion culling | CPU culling characteristics |
| `GOD-S91` | Visibility ranges/HLOD | manual distance representation tiers |
| `GOD-S92` | 3D particles | GPU vs CPU particle systems |
| `GOD-S93` | InputEvent/InputMap | action abstraction and runtime remapping |
| `GOD-S94` | Controllers/gamepads | SDL3 controller path and platform differences |
| `GOD-S95` | Viewports/SubViewports | multiple rendered views and isolated cameras |
| `GOD-S96` | UI anchors/Control/Theme | responsive layouts, focus, theming |
| `GOD-S97` | Audio feature list / audio streams | buses, 3D audio, polyphony, platform support |
| `GOD-S98` | Window/Control accessibility APIs | assistive-app metadata |
| `GOD-S99` | Accessibility feature list / server surface | screen-reader support |
| `GOD-S100` | DisplayServer TTS | platform-provided text-to-speech |
| `GOD-S101` | TextServerAdvanced / font APIs | BiDi, shaping, fallback fonts, complex text |
| `GOD-S102` | System requirements | renderer hardware floors |

---

# 154. Renderer-Tier Boundary

Godot 4.7 has three materially different rendering methods:

- Forward+;
- Mobile;
- Compatibility.

They are not just quality presets over one identical renderer.

| ID | Capability / fact | Evidence | Result | Leyforge implication |
|---|---|---|---|---|
| `GOD-CAP-542` | Forward+ uses clustered forward lighting and RenderingDevice | `GOD-S80`, `GOD-S81` | `DIRECT` | Leading high-end desktop profile. |
| `GOD-CAP-543` | Mobile uses a simpler raster-oriented forward renderer optimized for bandwidth/tile GPUs | `GOD-S80` | `DIRECT` | Strong low/mid modern-GPU profile. |
| `GOD-CAP-544` | Compatibility uses OpenGL and a separate lower-feature rendering path | `GOD-S80`, `GOD-S81` | `DIRECT` | Lowest/legacy hardware profile candidate. |
| `GOD-CAP-545` | Forward+ and Mobile share substantially more technology than Compatibility | `GOD-S80` | `DIRECT` | High↔Balanced fallback easier than either↔Compatibility. |
| `GOD-CAP-546` | Compatibility is the renderer with the broadest legacy/low-end GPU reach | `GOD-S81`, `GOD-S102` | `DIRECT` | Valuable if Zylann/material requirements remain compatible. |
| `GOD-CAP-547` | Renderer switching can materially change visual output and available effects | `GOD-S80`, `GOD-S83` | `DIRECT` | Every supported renderer tier requires visual/semantic certification. |
| `GOD-CAP-548` | Renderer selection is an execution/presentation decision, not world-generation or game-rule choice | architecture boundary | `LEYFORGE RULE` | One saved world must not change truth when renderer changes. |

---

# 155. Rendering Drivers

Current renderer/driver pairings include:

```text
Forward+/Mobile:
  Vulkan
  Direct3D 12
  Metal

Compatibility:
  OpenGL
```

| ID | Capability / fact | Evidence | Result | Leyforge implication |
|---|---|---|---|---|
| `GOD-CAP-549` | Vulkan supports Forward+ and Mobile | `GOD-S80` | `DIRECT` | Natural primary cross-platform modern driver. |
| `GOD-CAP-550` | Direct3D 12 supports Forward+ and Mobile on Windows | `GOD-S80` | `DIRECT / CURRENTLY LESS-MATURE` | Keep as fallback/Windows option, benchmark exact 4.7.2 behaviour. |
| `GOD-CAP-551` | Godot 4.7 docs still recommend Vulkan for most projects over current D3D12 path | `GOD-S80` | `DIRECT GUIDANCE` | Do not select D3D12 merely because some new projects default to it. |
| `GOD-CAP-552` | Native Metal supports Forward+/Mobile on Apple Silicon | `GOD-S80` | `DIRECT` | Apple modern-renderer path exists. |
| `GOD-CAP-553` | OpenGL supports Compatibility only | `GOD-S80` | `DIRECT` | Compatibility-specific shader/feature certification required. |
| `GOD-CAP-554` | Modern-driver failure can fall back to Compatibility in supported configurations | `GOD-S83` | `DIRECT` | Startup fallback must communicate changed presentation capability to settings/diagnostics. |

---

# 156. Renderer Feature Differences

The renderer comparison exposes hard capability differences.

| ID | Capability / fact | Evidence | Result | Leyforge implication |
|---|---|---|---|---|
| `GOD-CAP-555` | Normal/roughness screen buffer exists in Forward+ but not Mobile/Compatibility | `GOD-S83` | `DIRECT` | Do not make gameplay readability depend on such buffer-based effects. |
| `GOD-CAP-556` | Compute shaders are unavailable on Compatibility and may be expensive on older Mobile targets | `GOD-S83` | `DIRECT` | Compute-based presentation requires fallback path. |
| `GOD-CAP-557` | Compatibility lacks decals while Forward+/Mobile support them | `GOD-S83`, `GOD-S81` | `DIRECT` | Damage/ownership/marking cannot rely solely on decals. |
| `GOD-CAP-558` | Compatibility lacks particle trails and particle SDF collision | `GOD-S83` | `DIRECT` | VFX fallback required. |
| `GOD-CAP-559` | Compatibility lacks depth-of-field blur | `GOD-S83` | `DIRECT` | Pure optional polish. |
| `GOD-CAP-560` | Forward+ has higher color/depth precision than Mobile/Compatibility | `GOD-S83`, `GOD-S82` | `DIRECT` | Gradients/fog/water must tolerate lower precision. |
| `GOD-CAP-561` | Mobile can enable higher-precision HDR buffers at increased bandwidth cost | `GOD-S80` | `DIRECT TRADE-OFF` | HDR becomes an opt-in/high-tier cost, not baseline semantic dependency. |
| `GOD-CAP-562` | Compositor effects are supported only in Forward+ and Mobile | `GOD-S85` | `DIRECT` | Compatibility needs non-compositor fallbacks. |

---

# 157. Lighting and Shadow Scalability

Godot exposes substantial per-light and per-effect scalability.

| ID | Capability / fact | Evidence | Result | Leyforge implication |
|---|---|---|---|---|
| `GOD-CAP-563` | Directional, omni, spot and area-light primitives exist | `GOD-S81` | `DIRECT` | Strong lighting substrate. |
| `GOD-CAP-564` | Forward+ clustered lighting avoids strict low per-mesh light limits | `GOD-S81` | `DIRECT` | High-tier settlement/magic lighting can be rich. |
| `GOD-CAP-565` | Mobile has finite per-mesh local-light limits | `GOD-S81` | `DIRECT` | Low/mid profile must aggregate/fade/bake lights. |
| `GOD-CAP-566` | Per-light distance fade is supported | `GOD-S81` | `DIRECT` | Strong performance lever for dense settlements. |
| `GOD-CAP-567` | Shadows can be disabled selectively per light/object | `GOD-S88` | `DIRECT` | High-value low-end lever. |
| `GOD-CAP-568` | Shadow-map resolution reduction can improve performance | `GOD-S88` | `DIRECT` | Expose shadow quality independently. |
| `GOD-CAP-569` | Post-processing and shadows can be major fragment-cost drivers | `GOD-S88` | `DIRECT` | Profile them independently from voxel geometry cost. |
| `GOD-CAP-570` | Lighting/shadow fidelity must not determine whether a hazard/resource/state is perceivable | architecture boundary | `LEYFORGE RULE` | Use icons/material cues/audio/text where needed. |

---

# 158. Material / Shader Portability

Leyforge will have authored/custom shaders for water, magic, portals, animated materials, biome effects, damage/state cues and Forge previews.

| ID | Capability / fact | Evidence | Result | Leyforge implication |
|---|---|---|---|---|
| `GOD-CAP-571` | Spatial shaders expose unshaded and other simplified render modes | `GOD-S84` | `DIRECT` | Low-end material fallbacks can remain stylistically intentional. |
| `GOD-CAP-572` | Advanced shader behaviour differs across renderer backends | `GOD-S80`, `GOD-S83` | `DIRECT` | Forge needs renderer-target validation. |
| `GOD-CAP-573` | Forward+/Mobile use reverse-Z and different depth conventions from Compatibility in advanced shader workflows | stable shader/migration evidence | `DIRECT` | Screen/depth shaders require explicit cross-renderer validation. |
| `GOD-CAP-574` | Material feature combinations generate shader permutations | `GOD-S80` | `DIRECT` | Large content libraries can create shader-compilation stutter/cache pressure. |
| `GOD-CAP-575` | Material feature restraint can reduce shader permutation count | `GOD-S80` | `DIRECT` | Forge should consolidate standard material templates. |
| `GOD-CAP-576` | A visual effect being technically available does not justify a unique shader variant per block/material | architecture synthesis | `LEYFORGE RULE` | Material families/templates over bespoke one-offs. |

---

# 159. Water / Transparency Presentation

Round 6 keeps the authoritative water boundary from PRD-02.

| ID | Capability / fact | Evidence | Result | Leyforge implication |
|---|---|---|---|---|
| `GOD-CAP-577` | Spatial shaders support transparent/unshaded/custom surface rendering | `GOD-S84` | `DIRECT` | Suitable basis for water/material projection. |
| `GOD-CAP-578` | Screen/depth textures exist across renderers, but supporting buffers/features differ | `GOD-S83` | `DIRECT` | Refraction/shore effects need tier-specific fallback. |
| `GOD-CAP-579` | Compatibility has lower color precision and fewer advanced effects | `GOD-S82`, `GOD-S83` | `DIRECT` | Low-tier water may need simpler appearance. |
| `GOD-CAP-580` | Transparency can increase overdraw/draw complexity | renderer model | `PERFORMANCE RISK` | Avoid enormous overlapping transparent voxel surfaces. |
| `GOD-CAP-581` | Water semantics such as depth, flow, hazard and salinity cannot be encoded only by shader appearance | architecture boundary | `LEYFORGE RULE` | UI/audio/material-state cues must carry required meaning. |

---

# 160. Resolution Scaling / Upscaling

| ID | Capability / fact | Evidence | Result | Leyforge implication |
|---|---|---|---|---|
| `GOD-CAP-582` | 3D resolution scale is runtime-adjustable independently from 2D/UI | `GOD-S86`, `GOD-S87` | `DIRECT / HIGH VALUE` | UI remains sharp while world rendering is cheaper. |
| `GOD-CAP-583` | Bilinear 3D scaling works across renderers | `GOD-S86` | `DIRECT` | Universal fallback. |
| `GOD-CAP-584` | Higher-quality upscaling support is renderer-dependent | `GOD-S86`, `GOD-S81` | `DIRECT` | Do not assume same upscaler on Compatibility. |
| `GOD-CAP-585` | Halving per-axis render scale quarters rendered pixel count | `GOD-S86` | `DIRECT` | Powerful GPU budget control. |
| `GOD-CAP-586` | Resolution scaling helps GPU-bound workloads, not CPU/simulation bottlenecks | `GOD-S86` | `DIRECT` | Settings diagnostics should distinguish CPU vs GPU bottleneck. |
| `GOD-CAP-587` | Godot 4.7 internal docs state automatic dynamic resolution scaling is not yet provided as a generic built-in solution | `GOD-S80` | `NOT-PROVIDED` | If adaptive scaling is desired, Leyforge must orchestrate it. |
| `GOD-CAP-588` | Resolution scaling should coexist with actual graphics-setting reductions | `GOD-S86` | `DIRECT GUIDANCE` | Low profile is not just one resolution slider. |

---

# 161. Texture / VRAM Strategy

| ID | Capability / fact | Evidence | Result | Leyforge implication |
|---|---|---|---|---|
| `GOD-CAP-589` | Godot supports desktop/mobile VRAM texture compression families | `GOD-S81`, `GOD-S89` | `DIRECT` | Platform export can produce appropriate GPU formats. |
| `GOD-CAP-590` | Basis Universal can provide one transcodable encoding with disk-size/quality/encode-time trade-offs | `GOD-S81`, `GOD-S89` | `DIRECT` | Useful distribution option, not automatic best runtime choice. |
| `GOD-CAP-591` | Only GPU/VRAM compression reduces GPU memory; ordinary disk compression does not | `GOD-S89` | `DIRECT` | Asset-budget tools must report VRAM, not archive size only. |
| `GOD-CAP-592` | Godot optimization guidance says low-resolution pixel-art textures generally should not use VRAM compression | `GOD-S88` | `DIRECT / IMPORTANT` | Leyforge 32×32 material art needs visual validation rather than blanket compression. |
| `GOD-CAP-593` | Very large textures can exceed old/mobile GPU limits | `GOD-S82` | `DIRECT` | Atlases/material sets must remain bounded. |
| `GOD-CAP-594` | Mipmaps improve downsampling quality at additional memory cost | `GOD-S87` | `DIRECT TRADE-OFF` | Block textures need style tests at distance. |
| `GOD-CAP-595` | Platform texture-format choice should be export/build concern rather than canonical material identity | architecture boundary | `LEYFORGE RULE` | One source texture can compile to different platform representations. |

---

# 162. Draw Calls / Material Consolidation Boundary

| ID | Capability / fact | Evidence | Result | Leyforge implication |
|---|---|---|---|---|
| `GOD-CAP-596` | Material/shader state changes and additional surfaces contribute rendering overhead | renderer architecture | `DIRECT` | Runtime block library should consolidate materials. |
| `GOD-CAP-597` | Forward+ lifts some lighting limits but not geometry/material cost | `GOD-S81` | `DIRECT` | Content density still needs budgets. |
| `GOD-CAP-598` | MultiMesh exists for huge numbers of repeated instances | `GOD-S81`, PRD-02 | `DIRECT` | Ecology/presentation instancing remains strong. |
| `GOD-CAP-599` | Block semantic variants should not automatically imply separate material/shader resources | PRD-02 + synthesis | `LEYFORGE RULE` | Keep state projection compact. |

---

# 163. Visibility / HLOD / Occlusion

| ID | Capability / fact | Evidence | Result | Leyforge implication |
|---|---|---|---|---|
| `GOD-CAP-600` | GeometryInstance visibility ranges support manual HLOD/fade by distance | `GOD-S91` | `DIRECT` | Good for structures, vegetation and far non-voxel presentation. |
| `GOD-CAP-601` | HLOD can apply to MultiMesh, particles, 3D labels and other geometry nodes | `GOD-S91` | `DIRECT` | Broad presentation-scaling tool. |
| `GOD-CAP-602` | Occlusion culling can reduce hidden-object rendering in suitably occluded scenes | `GOD-S90` | `DIRECT` | Valuable towns/interiors/caves candidate. |
| `GOD-CAP-603` | Godot occlusion culling uses CPU-side low-resolution occluder testing | `GOD-S90` | `DIRECT` | Has CPU cost; not always beneficial outdoors. |
| `GOD-CAP-604` | Occlusion benefits depend heavily on scene structure | `GOD-S90` | `DIRECT` | Benchmark settlements/interiors and open terrain separately. |
| `GOD-CAP-605` | Mobile may benefit more from occlusion because it lacks Forward+'s depth prepass | `GOD-S90` | `DIRECT` | Useful low/mid renderer tool. |
| `GOD-CAP-606` | Generic HLOD/occlusion does not solve Zylann blocky far-terrain LOD | PRD-02 boundary | `NOT-PROVIDED` | Keep terrain-distance proof separate. |

---

# 164. VFX / Particle Surface

| ID | Capability / fact | Evidence | Result | Leyforge implication |
|---|---|---|---|---|
| `GOD-CAP-607` | GPU particles can handle very high particle counts on modern hardware | `GOD-S92` | `DIRECT` | Rich high-tier magic/weather VFX possible. |
| `GOD-CAP-608` | CPU particles work on wider/older hardware but support fewer particles/features | `GOD-S92` | `DIRECT` | Compatibility/fallback path. |
| `GOD-CAP-609` | GPU particle shaders allow custom multi-frame behaviour | `GOD-S92` | `DIRECT` | Powerful but hardware-sensitive. |
| `GOD-CAP-610` | GPU particle collisions/attractors provide presentation interactions | `GOD-S92` | `DIRECT` | VFX only; not simulation authority. |
| `GOD-CAP-611` | Compatibility lacks several GPU particle features/trails | `GOD-S83` | `DIRECT` | Tier-specific VFX assets/settings required. |
| `GOD-CAP-612` | Particle count/lifetime/emission are scalable budgets | `GOD-S92` | `DIRECT` | Quality profile can reduce VFX density. |
| `GOD-CAP-613` | Critical hazards/spells must remain legible with particles disabled/reduced | architecture boundary | `LEYFORGE RULE` | Add geometry/icon/audio/text/material cues. |

---

# 165. Compositor / Custom Post-Processing Boundary

| ID | Capability / fact | Evidence | Result | Leyforge implication |
|---|---|---|---|---|
| `GOD-CAP-614` | Compositor effects can customize render pipeline stages | `GOD-S85` | `DIRECT` | Advanced magical/realm effects possible. |
| `GOD-CAP-615` | Compositor is unavailable on Compatibility | `GOD-S85` | `DIRECT` | Never sole semantic representation. |
| `GOD-CAP-616` | Compositor effect logic runs on the rendering thread | `GOD-S85` | `DIRECT` | Must obey Round-2 render-thread rules. |
| `GOD-CAP-617` | Compositor should be treated as premium presentation technology | synthesis | `STRONG RECOMMENDATION` | Keep fallback material/UI path. |

---

# 166. Semantic Presentation Contract

> **No gameplay-significant state may exist only as a renderer-specific visual effect.**

Examples:

| Semantic state | High-tier cue | Required fallback |
|---|---|---|
| poisoned/corrupted | post FX + shader | status icon/text/audio |
| magical barrier | glow/distortion | visible geometry/material/icon |
| hostile ownership | decal/emissive | icon/banner/text/colour-safe marking |
| fluid hazard | refraction/particles | surface geometry + UI/audio |
| low oxygen/pressure | fog/post FX | meter/warning/audio |
| portal ready/unready | animated shader | shape/state icon/text |
| machine powered | emissive animation | indicator geometry/UI/sound |

---

# 167. Low-End Presentation Profile Candidate

A credible low-end profile can use multiple independent levers:

```text
renderer:
  Mobile or Compatibility
3D resolution:
  lower
view distance:
  lower
terrain/far representation:
  cheaper
shadows:
  fewer / lower resolution
lights:
  shorter range / fewer shadows
particles:
  reduced / fallback
post FX:
  reduced / off
reflection/decal:
  reduced / off
physics/simulation:
  separately budgeted
```

| ID | Capability / fact | Evidence | Result | Leyforge implication |
|---|---|---|---|---|
| `GOD-CAP-618` | Godot exposes enough independent rendering levers to build multi-dimensional quality profiles | Rounds 1/6 | `DIRECT/SYNTHESIS` | Avoid one monolithic internal quality knob. |
| `GOD-CAP-619` | Mobile renderer may be preferable to Compatibility for some low-end modern hardware | `GOD-S80`, `GOD-S102` | `DIRECT` | Detect/support capability rather than map Low=OpenGL blindly. |
| `GOD-CAP-620` | Low-end presentation settings can change GPU cost without changing simulation truth | architecture | `LEYFORGE RULE` | Separate graphics and simulation menus/profiles. |
| `GOD-CAP-621` | Renderer-specific hardware floors differ | `GOD-S102` | `DIRECT` | Startup capability detection/support diagnostics required. |

---

# 168. UI Architecture Surface

| ID | Capability / fact | Evidence | Result | Leyforge implication |
|---|---|---|---|---|
| `GOD-CAP-622` | Control anchors support changing aspect ratios/resolutions | `GOD-S96` | `DIRECT` | Good HUD/menu responsiveness. |
| `GOD-CAP-623` | Container-driven layout supports complex application-style UI | `GOD-S96` | `DIRECT` | Strong fit for The Forge/editor tooling. |
| `GOD-CAP-624` | Themes can apply project-wide or to UI subtrees | `GOD-S96` | `DIRECT` | Central UI style/accessibility variants practical. |
| `GOD-CAP-625` | Control focus supports keyboard/gamepad navigation | `GOD-S96` | `DIRECT` | Controller-accessible menus feasible. |
| `GOD-CAP-626` | Focus and mouse/touch input are distinct behaviours | `GOD-S96` | `DIRECT` | UI should not be cursor-only. |
| `GOD-CAP-627` | UI hierarchy is presentation and interaction, not authoritative settings truth | architecture boundary | `LEYFORGE RULE` | Settings model lives separately from Controls. |

---

# 169. UI Scaling / Multiple Resolutions

| ID | Capability / fact | Evidence | Result | Leyforge implication |
|---|---|---|---|---|
| `GOD-CAP-628` | Godot supports a base design resolution and flexible stretch/aspect handling | `GOD-S87` | `DIRECT` | One UI can adapt across resolutions. |
| `GOD-CAP-629` | Root content scale can be changed at runtime | `GOD-S87` | `DIRECT` | Player UI-scale setting feasible. |
| `GOD-CAP-630` | UI scaling can remain independent of 3D render scaling | `GOD-S87` | `DIRECT / HIGH VALUE` | Keep text/UI crisp on low 3D resolution. |
| `GOD-CAP-631` | Anchors/containers handle ultrawide/tall aspect changes | `GOD-S87`, `GOD-S96` | `DIRECT` | Avoid fixed-position HUD. |
| `GOD-CAP-632` | Font oversampling keeps dynamic fonts sharp under scaling | `GOD-S87` | `DIRECT` | Supports accessibility/UI-scale changes. |
| `GOD-CAP-633` | Very high-resolution base UI assets increase memory/file cost | `GOD-S87` | `DIRECT` | Prefer scalable/vector/font resources where sensible. |
| `GOD-CAP-634` | UI-scale setting should be player-controlled rather than inferred perfectly from DPI | `GOD-S87` | `DIRECT GUIDANCE` | Required accessibility option. |

---

# 170. Input Action Abstraction

| ID | Capability / fact | Evidence | Result | Leyforge implication |
|---|---|---|---|---|
| `GOD-CAP-635` | One named input action can map to keyboard, mouse, gamepad and other events | `GOD-S93` | `DIRECT` | Gameplay code should consume semantic actions. |
| `GOD-CAP-636` | InputMap can be modified/remapped at runtime | `GOD-S93` | `DIRECT` | Full user rebinding is feasible. |
| `GOD-CAP-637` | Runtime InputMap changes are not automatically persisted | `GOD-S93` | `DIRECT` | Settings layer must persist bindings. |
| `GOD-CAP-638` | Event-driven and polled input models are both supported | `GOD-S93` | `DIRECT` | Appropriate handling per action type. |
| `GOD-CAP-639` | Input action semantics can remain stable while physical mapping changes | `GOD-S93` | `DIRECT` | Strong cross-device architecture. |
| `GOD-CAP-640` | InputMap action name is a runtime/project key, not persistent gameplay command authority | architecture boundary | `LEYFORGE RULE` | Network protocol uses explicit command schema. |

---

# 171. Controllers / Gamepads

| ID | Capability / fact | Evidence | Result | Leyforge implication |
|---|---|---|---|---|
| `GOD-CAP-641` | Godot supports broad gamepad/controller coverage | `GOD-S94` | `DIRECT` | Controller-first gameplay feasible. |
| `GOD-CAP-642` | Desktop controller support uses SDL3 in current Godot lineage | `GOD-S94` | `DIRECT` | Strong mainstream device baseline. |
| `GOD-CAP-643` | Android/Web controller path differs from desktop SDL3 path | `GOD-S94` | `DIRECT` | Cross-platform controller certification required. |
| `GOD-CAP-644` | Gamepad deadzones are configurable per action | `GOD-S94` | `DIRECT` | Expose/tune deadzone options. |
| `GOD-CAP-645` | Mouse-look and stick-look require different handling despite action abstraction | `GOD-S94` | `DIRECT` | Preserve device-specific response curves. |
| `GOD-CAP-646` | Specialized wheels/HOTAS devices are less tested | `GOD-S94` | `LIMIT` | No promise without hardware testing. |

---

# 172. Touch / Mobile Input

| ID | Capability / fact | Evidence | Result | Leyforge implication |
|---|---|---|---|---|
| `GOD-CAP-647` | Godot supports virtual joystick/button patterns for mobile | `GOD-S81` | `DIRECT` | Touch gameplay technically feasible. |
| `GOD-CAP-648` | Touch-generated actions can map to shared gameplay semantics | `GOD-S93` | `DIRECT` | Avoid separate touch game rules. |
| `GOD-CAP-649` | Touch UI requires different layout/interaction density than keyboard/controller | UX boundary | `LEYFORGE-OWN` | Dedicated touch HUD profile. |
| `GOD-CAP-650` | Touch support does not imply the full desktop Forge UI is usable unchanged on phones | architecture/UX | `NOT-PROVIDED` | Forge mobile scope remains separate. |

---

# 173. Local Split-Screen / Multiple Viewports

| ID | Capability / fact | Evidence | Result | Leyforge implication |
|---|---|---|---|---|
| `GOD-CAP-651` | SubViewports can render independent camera views | `GOD-S95` | `DIRECT` | Local split-screen feasible. |
| `GOD-CAP-652` | Each Viewport has one active camera | `GOD-S95` | `DIRECT` | One-camera-per-local-player model. |
| `GOD-CAP-653` | SubViewports have independent render sizes | `GOD-S95` | `DIRECT` | Per-player split resolution/budget possible. |
| `GOD-CAP-654` | Input does not automatically route to arbitrary standalone SubViewports | `GOD-S95` | `DIRECT` | Local-player input routing explicit. |
| `GOD-CAP-655` | Rendering multiple full views multiplies substantial presentation cost | renderer principle | `P3/P4-NEEDED` | Dedicated split-screen profile. |
| `GOD-CAP-656` | Split-screen player identities must remain separate from Viewport identity | architecture boundary | `LEYFORGE RULE` | Player/session model stays above rendering. |

---

# 174. Audio System Surface

| ID | Capability / fact | Evidence | Result | Leyforge implication |
|---|---|---|---|---|
| `GOD-CAP-657` | Godot supports mono/stereo/5.1/7.1 output | `GOD-S97` | `DIRECT` | Broad output configurations. |
| `GOD-CAP-658` | 2D and 3D positional audio are supported | `GOD-S97` | `DIRECT` | World spatial audio substrate. |
| `GOD-CAP-659` | Audio buses can reroute and process categories independently | `GOD-S97` | `DIRECT` | Music/SFX/UI/voice/environment mix architecture. |
| `GOD-CAP-660` | Areas can reroute 3D audio to different buses/reverb profiles | `GOD-S97` | `DIRECT` | Cave/underwater/interior acoustic projection. |
| `GOD-CAP-661` | Polyphonic playback supports many streams through one player abstraction | `GOD-S97` | `DIRECT` | Useful pooled SFX. |
| `GOD-CAP-662` | Godot supports procedural audio generation and microphone input | `GOD-S97` | `DIRECT` | Future voice/tooling/synthesis options. |
| `GOD-CAP-663` | Audio presentation does not own AI-hearing/gameplay sound-event truth | architecture boundary | `LEYFORGE RULE` | Emit semantic sound events separately. |

---

# 175. Audio Scalability / Semantic Sound

Potential audio execution profiles can change emitter count, attenuation distance, reverbs, effect chains, polyphony and ambient-layer density.

Gameplay sound semantics remain independent.

---

# 176. Accessibility Surface

| ID | Capability / fact | Evidence | Result | Leyforge implication |
|---|---|---|---|---|
| `GOD-CAP-664` | Controls/Windows expose accessibility names/descriptions and relationships | `GOD-S98` | `DIRECT` | Menus/Forge can expose semantic UI to assistive apps. |
| `GOD-CAP-665` | Godot reports screen-reader support on Windows/macOS/Linux | `GOD-S99` | `DIRECT PLATFORM SUPPORT` | Desktop screen-reader accessibility is a real target. |
| `GOD-CAP-666` | UI focus navigation is built into Control system | `GOD-S96` | `DIRECT` | Keyboard/gamepad accessibility foundation. |
| `GOD-CAP-667` | Accessibility metadata must be authored meaningfully | boundary | `LEYFORGE-OWN` | Forge/UI standards require accessibility fields. |
| `GOD-CAP-668` | Custom-drawn/world-space interaction does not automatically become screen-reader-accessible | architecture implication | `P3/DESIGN NEEDED` | Important information needs accessible UI representation. |

---

# 177. Text-to-Speech

| ID | Capability / fact | Evidence | Result | Leyforge implication |
|---|---|---|---|---|
| `GOD-CAP-669` | Platform-provided TTS is available through DisplayServer APIs | `GOD-S100`, `GOD-S97` | `DIRECT` | Potential menu/chat/narration accessibility feature. |
| `GOD-CAP-670` | TTS supports language/voice selection, volume, pitch and rate | `GOD-S100` | `DIRECT` | Player-configurable spoken UI possible. |
| `GOD-CAP-671` | TTS availability/voices differ by host platform | platform service model | `DIRECT` | Capability detection/fallback. |
| `GOD-CAP-672` | TTS is not equivalent to full screen-reader semantics | accessibility boundary | `IMPORTANT` | Accessible UI metadata still needed. |

---

# 178. Localization / Complex Text

| ID | Capability / fact | Evidence | Result | Leyforge implication |
|---|---|---|---|---|
| `GOD-CAP-673` | Default TextServerAdvanced supports BiDi and complex text shaping | `GOD-S101` | `DIRECT` | Strong internationalization foundation. |
| `GOD-CAP-674` | Fonts support fallback chains | `GOD-S101` | `DIRECT` | Multi-script UI feasible. |
| `GOD-CAP-675` | Dynamic fonts can remain crisp at varying sizes/scales | `GOD-S87`, font docs | `DIRECT` | Good UI-scale/localization support. |
| `GOD-CAP-676` | Localization can expand text and alter layout direction | text-layout reality | `LEYFORGE REQUIREMENT` | Responsive layouts, not hard-sized English strings. |
| `GOD-CAP-677` | Runtime semantic IDs and localized display strings must remain separate | architecture boundary | `LEYFORGE RULE` | Registry IDs never depend on translated names. |

---

# 179. Colour / Motion / Readability Accessibility

Candidate player settings:

- UI scale;
- subtitle size/background;
- colour-blind-safe palettes;
- high-contrast interaction outlines;
- reduce flashes;
- reduce camera shake;
- disable motion blur/DOF;
- particle density;
- FOV;
- camera bob;
- hold/toggle inputs;
- controller deadzone/sensitivity;
- audio dynamic range/category volumes;
- TTS/screen-reader compatible UI.

Round 6 makes these first-class settings requirements.

---

# 180. Main Menu / Settings Architecture Implication

Recommended settings model:

```text
Settings Registry
  stable setting ID
  type/range
  default
  availability predicate
  renderer/platform constraints
  restart-required flag
  profile ownership
  accessible label/help
        ↓
UI projection
        ↓
Godot renderer/input/audio/window APIs
```

Do not bury settings logic directly inside menu widgets.

---

# 181. Semantic Presentation Certification for The Forge

The Forge should eventually test content across:

```text
Forward+
Mobile
Compatibility

high/medium/low resolution scale
normal/high UI scale
particles on/off
shadows high/off
post FX on/off
colour-accessibility profiles
```

Verify:

- material remains identifiable;
- interactable state remains readable;
- hazard remains perceivable;
- ownership/faction state remains interpretable;
- portal/machine state remains visible;
- text/icons remain legible;
- no hidden semantic dependency on unsupported shader effect.

---

# 182. Round-6 Risk Register

| Risk | Severity | Reason |
|---|---|---|
| `GOD-R06-01` Forward+-only effect carries required gameplay information | RED | Low renderer loses semantics. |
| `GOD-R06-02` Compatibility assumed visually equivalent | RED | Many feature/precision differences. |
| `GOD-R06-03` Renderer fallback happens silently | AMBER/RED | Profile may need adjustment. |
| `GOD-R06-04` Every material uses bespoke shader features | RED | Permutation/stutter/maintenance explosion. |
| `GOD-R06-05` Compute/compositor required for core visuals | RED | Compatibility unavailable. |
| `GOD-R06-06` Water depends on expensive transparency/refraction everywhere | AMBER/RED | Ocean/low-end cost. |
| `GOD-R06-07` Resolution scale lowers UI readability | RED | Separate 3D/UI scaling. |
| `GOD-R06-08` Dynamic resolution assumed built in | AMBER | Generic automatic path not present in 4.7 baseline. |
| `GOD-R06-09` 32×32 pixel-art materials globally VRAM-compressed | AMBER/RED | Artifact/benefit trade-off. |
| `GOD-R06-10` Archive size mistaken for VRAM size | AMBER | Compression modes differ. |
| `GOD-R06-11` Occlusion culling enabled universally | AMBER | CPU cost can exceed benefit. |
| `GOD-R06-12` Generic HLOD mistaken for voxel far LOD | RED | Different subsystem. |
| `GOD-R06-13` Particle effects become authoritative hazard visibility | RED | Low/disabled particles break semantics. |
| `GOD-R06-14` Split-screen assumed cheap because Viewports exist | RED | Multiple full views can multiply cost. |
| `GOD-R06-15` Input keys hardcoded in gameplay | RED | Breaks rebinding/device abstraction. |
| `GOD-R06-16` Runtime remaps not persisted | AMBER | InputMap does not save them. |
| `GOD-R06-17` Mouse and controller look use identical response curve | AMBER | Different device behaviour. |
| `GOD-R06-18` Desktop controller assumptions reused on Android/Web unchecked | AMBER | Different backend. |
| `GOD-R06-19` Touch UI is desktop UI with virtual buttons pasted over it | RED UX | Dedicated touch design. |
| `GOD-R06-20` Audio playback count defines gameplay hearing | RED | Presentation quality must not alter simulation. |
| `GOD-R06-21` Screen-reader support assumed automatic | RED | Metadata/structure must be authored. |
| `GOD-R06-22` Colour alone communicates critical state | RED ACCESSIBILITY | Add shape/icon/text/audio cues. |
| `GOD-R06-23` Motion-heavy effects cannot be disabled | AMBER/RED | Accessibility requirement. |
| `GOD-R06-24` Fixed-pixel UI breaks high-DPI/ultrawide/localization | RED | Responsive layout/scale. |
| `GOD-R06-25` Localized display name becomes registry identity | RED | Stable IDs separate. |
| `GOD-R06-26` Forge preview tests only Forward+ | RED | Runtime tier regressions missed. |

---

# 183. Round-6 Prototype / Benchmark Packages

## `GOD-PKG-50 — Renderer Parity Matrix`

Representative world scene with voxel terrain, water, vegetation, settlement, lights, portals/magic, weather and UI.

Run Forward+, Mobile and Compatibility. Measure FPS, CPU/GPU frame, VRAM, shader compilation and semantic visual differences.

## `GOD-PKG-51 — Semantic Fallback Torture`

Disable/reduce decals, particles, post-processing, emissive effects, shadows and transparency effects. Verify every critical state remains understandable.

## `GOD-PKG-52 — Shader Permutation / Warmup`

Compare bespoke shaders against consolidated Forge standard templates.

## `GOD-PKG-53 — Water Tier Matrix`

Test high, Mobile and Compatibility water paths including underwater/ocean/local voxel fluids.

## `GOD-PKG-54 — Resolution Scale Matrix`

Test multiple output resolutions and 3D scales while UI remains full-resolution.

## `GOD-PKG-55 — Texture Import Matrix`

Use actual 32×32 Leyforge textures. Compare compression, mipmaps, atlases and filters.

## `GOD-PKG-56 — Settlement GPU Torture`

Dense settlement with lights, shadows, decals, machines, particles, transparencies and NPC presentation.

## `GOD-PKG-57 — Occlusion / HLOD`

Open plains, forest, city streets, castle interior and caves.

## `GOD-PKG-58 — VFX Accessibility`

Fire, poison, corruption, magic, portals and machine faults across reduced-particle/flash/colour profiles.

## `GOD-PKG-59 — UI Scale / Resolution / Localization`

720p→4K, ultrawide/mobile shapes, 100→200% UI scale, long translations and RTL.

## `GOD-PKG-60 — Input Rebinding Matrix`

Keyboard/mouse, major controllers, generic controller and touch. Prove rebinding, persistence, conflict handling, prompts and deadzones.

## `GOD-PKG-61 — Local Split-Screen`

2 players, and 4 if target remains desired. Measure voxel viewers, rendering, UI/input isolation and audio policy.

## `GOD-PKG-62 — Audio Scale`

Settlement/machines/combat/weather/wildlife with emitter pooling/polyphony/virtualization strategies.

## `GOD-PKG-63 — Accessible Menu / Forge Panel`

One real settings screen and one Forge editor panel tested keyboard-only, gamepad-only, screen-reader where supported, 200% UI scale, high contrast and localized/RTL text.

---

# 184. Round-6 Resolved / Narrowed Earlier Unknowns

## Renderer compatibility

Godot itself supports all three tiers, but exact Zylann/material parity still requires `GOD-PKG-50`.

## Mobile as low-end desktop profile

Strengthened:

> **Mobile is a serious low/mid desktop candidate, especially on integrated modern GPUs.**

## Compatibility

Useful but materially different; official support must be earned by the parity matrix rather than assumed.

## Windows driver

Vulkan remains the reference candidate; D3D12 remains available and should be compared.

---

# 185. Round-6 New Unknowns

1. Does Zylann 1.7 blocky output work identically on Compatibility?
2. Which Zylann shader/material paths require RenderingDevice?
3. Should Compatibility be officially supported or best-effort?
4. What GPU floor should Leyforge advertise per renderer tier?
5. Should Mobile auto-select on integrated GPUs?
6. Can renderer be changed without restart?
7. Which settings become invalid under each renderer?
8. What startup benchmark should choose defaults?
9. Which lighting techniques preserve day/night readability on Compatibility?
10. What dynamic-light budget is acceptable in dense Mobile settlements?
11. How should player-placed lights enter shadow budgets?
12. What replaces decals on Compatibility?
13. Can block damage use model/material-state variants instead?
14. How many material/shader templates can Forge support before warmup hurts?
15. Can shader warmup/cache avoid gameplay stutter?
16. How should mod-added shaders be governed?
17. Which water features survive every renderer?
18. Should open ocean and local voxel water render differently?
19. What transparency artifacts occur with water/glass/foliage?
20. Should foliage prefer alpha clip?
21. What resolution scale preserves first-person block targeting?
22. Should targeting/crosshair remain native-resolution UI?
23. Is project-managed adaptive resolution worth building?
24. Which upscalers blur block/pixel-art style?
25. Do TAA/upscalers ghost on block edges?
26. Should nearest filtering be universal for base blocks?
27. Do mipmaps preserve the intended style?
28. Does atlas mip generation need custom edge padding?
29. What atlas/page size fits low-end GPUs?
30. How many texture pages/material sets per realm?
31. Can realm streaming unload GPU resources cleanly?
32. Should Forge report VRAM per pack/profile?
33. Can generated voxel structures contribute occlusion efficiently?
34. Should occlusion be limited to buildings/caves?
35. How do HLOD and voxel far-rendering compose?
36. What particle budgets fit high/mid/low?
37. Which VFX need CPU fallback?
38. Should weather particles be camera-local presentation?
39. What reduced-motion settings alter shake/flashes/bob/FOV?
40. What photosensitivity controls/warnings are required?
41. Which current state cues rely too heavily on colour?
42. What icon/shape/pattern alternatives are needed?
43. How large can UI scale go before HUD reflow?
44. Should HUD layout be user-customizable?
45. How does Forge reflow at 150–200% UI scale?
46. What minimum Forge window size is required?
47. Which Forge actions must be controller-accessible?
48. How should input glyph prompts switch by device?
49. How are per-device bindings stored?
50. Do local players need a Leyforge input router above InputMap?
51. How are controllers assigned/reassigned during split-screen?
52. Can keyboard+mouse and multiple controllers coexist cleanly?
53. What touch HUD minimum screen target is realistic?
54. Is mobile full gameplay or a later secondary target?
55. Can split-screen share voxel streaming caches efficiently?
56. What render distance is acceptable for 2/4-way split?
57. How should split-screen audio listeners work?
58. Can audio emitters be virtualized before Godot playback?
59. How should caves/interiors aggregate reverb zones?
60. Should AI-hearing and audible playback share one semantic source?
61. What subtitle system covers speech and important non-speech sounds?
62. How should TTS duck or mix normal audio?
63. Which platforms/voices are adequate for TTS?
64. What screen-reader behaviour works in real 4.7.2 exports?
65. Which Controls expose enough accessibility metadata automatically?
66. Does custom Forge drawing need explicit accessibility-server integration?
67. What keyboard alternative exists for every drag operation?
68. Which HUD data needs an accessible list/menu projection?
69. How should generated fantasy names localize?
70. Which user/mod text requires fallback fonts/sanitization?
71. How are RTL layouts and icon flow handled?
72. What font licensing/distribution constraints exist?
73. Should player-created books/signs support full Unicode?
74. What multiplayer text limits/sanitization are needed?
75. Can presentation fallback rules become Forge validators?
76. What screenshot/image-diff suite can catch renderer regressions?
77. What physical GPU/driver test lab is required?
78. Which settings can change live vs require restart/reload?
79. How are unsupported settings migrated when renderer changes?
80. Which settings are per-player/per-device/per-world/global?
81. How do world-creation simulation presets stay separate from graphics?
82. Which accessibility options appear before first world entry?
83. Should first launch offer renderer detection + UI scale/high contrast?
84. What emergency safe-graphics mode recovers from bad shader/renderer settings?

---

# 186. Round-6 Architecture Boundary Verdict

Round 6 strongly supports a semantic-state → multi-profile presentation architecture:

```text
                  LEYFORGE SEMANTIC STATE
                           │
              interaction / danger / status
                           │
              ┌────────────┼────────────┐
              │            │            │
           VISUAL        AUDIO          UI/A11Y
              │            │            │
        renderer tier     buses       text/icons
        shader/material   3D audio    screen reader
        VFX/HLOD          TTS         scalable UI
              │            │            │
              └────────────┼────────────┘
                           │
                        PLAYER
```

Presentation can become richer or cheaper. Semantic meaning does not disappear.

---

# 187. Round-6 Gate Result

**PASS — CONTINUE PRD-03**

Godot's rendering/input/audio/UI/accessibility technology is broad enough for Leyforge's intended presentation and settings architecture.

No Round-6 finding requires changing the Godot engine candidate.

Critical downstream proof remains renderer parity, shader/material profile design, low-end renderer policy, water, texture strategy, dense-settlement GPU load, semantic fallbacks, split-screen cost, rebinding/input routing, audio virtualization, screen-reader/TTS behaviour, localization/RTL and Forge presentation certification.

---

# 188. Updated PRD-03 Round Sequence

1. **Round 1 — Current Godot baseline, build strategy, precision, physics, render, headless, networking/threading surface** — **COMPLETE**
2. **Round 2 — Threading, task scheduling, servers, SceneTree/resource lifetime and native-code boundaries** — **COMPLETE**
3. **Round 3 — Physics, movement, large coordinates, interpolation and vessel-supporting technology** — **COMPLETE**
4. **Round 4 — Navigation, pathfinding, avoidance and dynamic voxel-world integration** — **COMPLETE**
5. **Round 5 — Networking, transport, dedicated-server topology, security and deployment** — **COMPLETE**
6. **Round 6 — Rendering, shaders, GPU, low-end scalability, VFX/audio/input/UI/accessibility** — **COMPLETE**
7. **Round 7 — Files, databases, serialization, mod/plugin sandbox, platform/export, profiling/testing/CI and supporting libraries** — **NEXT**
8. **Round 8 — Supporting-technology comparison, risk/prototype reconciliation and PRD-03 closure candidate**

---

# 189. Additional Official / Current Sources Used in Round 6

- Internal rendering architecture 4.7  
  `https://docs.godotengine.org/en/4.7/engine_details/architecture/internal_rendering_architecture.html`
- Godot 4.7 feature list  
  `https://docs.godotengine.org/en/4.7/about/list_of_features.html`
- 3D rendering limitations 4.7  
  `https://docs.godotengine.org/en/4.7/tutorials/3d/3d_rendering_limitations.html`
- Renderer overview/comparison  
  `https://docs.godotengine.org/en/4.7/tutorials/rendering/renderers.html`
- Spatial shaders 4.7  
  `https://docs.godotengine.org/en/4.7/tutorials/shaders/shader_reference/spatial_shader.html`
- Compositor 4.7  
  `https://docs.godotengine.org/en/4.7/tutorials/rendering/compositor.html`
- Resolution scaling  
  `https://docs.godotengine.org/en/4.7/tutorials/3d/resolution_scaling.html`
- Multiple resolutions  
  `https://docs.godotengine.org/en/4.7/tutorials/rendering/multiple_resolutions.html`
- GPU optimization  
  `https://docs.godotengine.org/en/4.7/tutorials/performance/gpu_optimization.html`
- Image import / texture compression  
  `https://docs.godotengine.org/en/4.7/tutorials/assets_pipeline/importing_images.html`
- Occlusion culling  
  `https://docs.godotengine.org/en/4.7/tutorials/3d/occlusion_culling.html`
- Visibility ranges / HLOD  
  `https://docs.godotengine.org/en/4.7/tutorials/3d/visibility_ranges.html`
- 3D particles  
  `https://docs.godotengine.org/en/4.7/tutorials/3d/particles/index.html`
- InputEvent / InputMap  
  `https://docs.godotengine.org/en/4.7/tutorials/inputs/inputevent.html`
- Controller/gamepad support  
  `https://docs.godotengine.org/en/4.7/tutorials/inputs/controllers_gamepads_joysticks.html`
- Viewports  
  `https://docs.godotengine.org/en/4.7/tutorials/rendering/viewports.html`
- Control / UI anchors / themes  
  `https://docs.godotengine.org/en/4.7/classes/class_control.html`  
  `https://docs.godotengine.org/en/4.7/tutorials/ui/size_and_anchors.html`
- Audio features / audio streams  
  `https://docs.godotengine.org/en/4.7/about/list_of_features.html`
- Window/Control accessibility  
  `https://docs.godotengine.org/en/4.7/classes/class_window.html`  
  `https://docs.godotengine.org/en/4.7/classes/class_control.html`
- DisplayServer TTS  
  `https://docs.godotengine.org/en/4.7/classes/class_displayserver.html`
- TextServerAdvanced  
  `https://docs.godotengine.org/en/4.7/classes/class_textserveradvanced.html`
- Godot 4.7 system requirements  
  `https://docs.godotengine.org/en/4.7/about/system_requirements.html`

---

**ROUND-6 RESULT: RENDERING / SHADERS / GPU / LOW-END / VFX / AUDIO / INPUT / UI / ACCESSIBILITY AUDIT COMPLETE.**

---

# 190. Round-7 — Files, Databases, Serialization, Mod Trust, Platform, Export, Profiling, Testing and CI
**Round-7 verdict:** PASS. Godot supplies a strong file/resource/export/diagnostic shell, but long-lived Leyforge schema, whole-world transactional persistence, safe player-content boundaries, dependency selection and project testing remain project-owned.
## 190.1 Critical architecture findings

- Godot Resources are appropriate authored/baked assets, not the only durable world schema.
- SQLite is the leading **database technology class** to prototype for structured domain state; no adapter is accepted yet.
- Untrusted player content defaults to **data-only declarative packs**. Godot PCK/script/native loading is not a sandbox.
- Export presets/CLI/headless workflows are strong enough for governed CI.
- Production support needs matching native symbols, structured Leyforge metrics/log correlation, and exported-artifact tests.
- Project test framework remains a bakeoff between current candidates rather than an assumption.
## 190.2 Capability register

| ID | Area | Finding |
|---|---|---|
| `GOD-CAP-678` | File / directory surface | FileAccess supports runtime text/binary reads and writes. |
| `GOD-CAP-679` | File / directory surface | DirAccess supports directory and file management operations. |
| `GOD-CAP-680` | File / directory surface | user:// is the intended writable persistent-user-data scope. |
| `GOD-CAP-681` | File / directory surface | Exported res:// is a virtual/imported project filesystem, not the editor source tree. |
| `GOD-CAP-682` | File / directory surface | Imported source assets may not survive export under their original source filenames. |
| `GOD-CAP-683` | File / directory surface | Absolute filesystem paths are usable where OS permissions permit. |
| `GOD-CAP-684` | File / directory surface | Temporary directory creation is available for staging workflows. |
| `GOD-CAP-685` | File / directory surface | Filesystem rename/move primitives do not provide multi-file transactional durability. |
| `GOD-CAP-686` | File / directory surface | Filesystem case sensitivity varies by platform/filesystem. |
| `GOD-CAP-687` | File / directory surface | Symlink behavior and permissions vary by platform. |
| `GOD-CAP-688` | Godot Resource formats | ResourceSaver writes text and binary Godot resource formats. |
| `GOD-CAP-689` | Godot Resource formats | Binary Godot resources can be compressed. |
| `GOD-CAP-690` | Godot Resource formats | TSCN is human-readable and version-control-friendly. |
| `GOD-CAP-691` | Godot Resource formats | Godot resource UIDs help project asset references survive path moves. |
| `GOD-CAP-692` | Godot Resource formats | Godot Resource UIDs are not FCC stable semantic identity. |
| `GOD-CAP-693` | Godot Resource formats | Godot resource formats are engine-owned formats and can evolve across engine generations. |
| `GOD-CAP-694` | Godot Resource formats | Resource serialization is convenient for Variant/resource graphs. |
| `GOD-CAP-695` | Godot Resource formats | Resource files do not provide Leyforge cross-domain journals, transactions, or migrations. |
| `GOD-CAP-696` | Custom resource / config formats | Custom ResourceFormatLoader implementations can add project file formats. |
| `GOD-CAP-697` | Custom resource / config formats | Custom ResourceFormatSaver implementations can complement custom loaders. |
| `GOD-CAP-698` | Custom resource / config formats | Registered custom formats can integrate with ResourceLoader/ResourceSaver. |
| `GOD-CAP-699` | Custom resource / config formats | Custom format integration does not transfer schema authority to Godot. |
| `GOD-CAP-700` | Custom resource / config formats | Performance-critical custom format handling can live in native/plugin code. |
| `GOD-CAP-701` | Custom resource / config formats | Godot provides JSON parsing and generation primitives. |
| `GOD-CAP-702` | Custom resource / config formats | JSON is unsuitable as a universal hot-path/huge-world binary state format. |
| `GOD-CAP-703` | Custom resource / config formats | ConfigFile provides INI-like section/key configuration. |
| `GOD-CAP-704` | Custom resource / config formats | ConfigFile supports encrypted local configuration files. |
| `GOD-CAP-705` | Custom resource / config formats | At-rest encryption is not authorization or safe secret storage if a client ships the key. |
| `GOD-CAP-706` | Custom resource / config formats | Human-readable configuration is useful for diagnostics/admin/development. |
| `GOD-CAP-707` | Durable database boundary | Godot file/resource APIs do not provide relational queries, indexes, and transactions. |
| `GOD-CAP-708` | Durable database boundary | Godot stable does not provide a built-in SQL database as part of core engine functionality. |
| `GOD-CAP-709` | Durable database boundary | SQLite is a strong candidate class for embedded structured domain storage. |
| `GOD-CAP-710` | Durable database boundary | A community Godot-SQLite 4.x integration exists as an external candidate. |
| `GOD-CAP-711` | Durable database boundary | External database integration adds native dependency, export, versioning, and threading obligations. |
| `GOD-CAP-712` | Durable database boundary | A domain database transaction is not automatically atomic with Zylann voxel persistence. |
| `GOD-CAP-713` | Durable database boundary | Database schema must store Leyforge semantic IDs without redefining them. |
| `GOD-CAP-714` | PCK / ZIP and mod trust | Godot can export additional PCK/ZIP packs. |
| `GOD-CAP-715` | PCK / ZIP and mod trust | PCK/ZIP packs can contain executable scripts as well as data/assets. |
| `GOD-CAP-716` | PCK / ZIP and mod trust | PCK/ZIP packs can mount additional virtual filesystem content. |
| `GOD-CAP-717` | PCK / ZIP and mod trust | Pack loading can implement patch/override layering. |
| `GOD-CAP-718` | PCK / ZIP and mod trust | Godot explicitly warns automatic mod/PCK loading can be a security vulnerability. |
| `GOD-CAP-719` | PCK / ZIP and mod trust | Pack signatures can be implemented using asymmetric cryptography. |
| `GOD-CAP-720` | PCK / ZIP and mod trust | A valid signature proves origin/integrity, not safety of third-party executable code. |
| `GOD-CAP-721` | PCK / ZIP and mod trust | Godot pack loading is not a secure sandbox for arbitrary scripts. |
| `GOD-CAP-722` | PCK / ZIP and mod trust | Native GDExtensions execute native in-process code. |
| `GOD-CAP-723` | PCK / ZIP and mod trust | Editor plugins execute trusted tooling code inside the editor. |
| `GOD-CAP-724` | PCK / ZIP and mod trust | A safe declarative mod system requires Leyforge-owned schemas and allowlists. |
| `GOD-CAP-725` | PCK / ZIP and mod trust | Data-only mods can still cause resource/performance abuse without code execution. |
| `GOD-CAP-726` | PCK / ZIP and mod trust | Mod load order must not grant canonical namespace authority. |
| `GOD-CAP-727` | Loose user content / Forge | ZIPReader/ZIPPacker support ordinary ZIP archives. |
| `GOD-CAP-728` | Loose user content / Forge | Runtime file loading can import user textures/audio/fonts/models without editor-made PCKs. |
| `GOD-CAP-729` | Loose user content / Forge | Loose runtime files do not receive every normal import-pipeline benefit automatically. |
| `GOD-CAP-730` | Loose user content / Forge | External/user files must be treated as potentially malformed or adversarial. |
| `GOD-CAP-731` | Loose user content / Forge | User source formats and baked runtime formats should remain distinct when beneficial. |
| `GOD-CAP-732` | Plugins / GDExtension governance | EditorPlugin can add editor tooling. |
| `GOD-CAP-733` | Plugins / GDExtension governance | Godot supports import, inspector, gizmo, and main-screen editor-plugin categories. |
| `GOD-CAP-734` | Plugins / GDExtension governance | Android plugin v2 can combine platform code and GDExtension/native functionality. |
| `GOD-CAP-735` | Plugins / GDExtension governance | .gdextension can select binaries by platform/build feature tags. |
| `GOD-CAP-736` | Plugins / GDExtension governance | .gdextension can declare minimum and maximum compatible Godot versions. |
| `GOD-CAP-737` | Plugins / GDExtension governance | Editor plugins and GDExtensions are trusted code dependencies and require governance. |
| `GOD-CAP-738` | Plugins / GDExtension governance | Developer editor tooling does not replace the player-facing Unified Forge. |
| `GOD-CAP-739` | Export presets / build matrix | Export presets define platform build/package configuration. |
| `GOD-CAP-740` | Export presets / build matrix | export_presets.cfg is suitable for version-controlled non-secret export settings. |
| `GOD-CAP-741` | Export presets / build matrix | Confidential export options are stored separately from export_presets.cfg. |
| `GOD-CAP-742` | Export presets / build matrix | Godot command line supports release/debug/pack export automation. |
| `GOD-CAP-743` | Export presets / build matrix | PCK/ZIP-only export supports patch/DLC/launcher workflows. |
| `GOD-CAP-744` | Export presets / build matrix | Dedicated-server resource export is a first-class Godot mode. |
| `GOD-CAP-745` | Export presets / build matrix | Dot-prefixed folders such as .git are excluded from export. |
| `GOD-CAP-746` | Export presets / build matrix | Feature tags expose target platforms. |
| `GOD-CAP-747` | Export presets / build matrix | Feature tags distinguish debug/release/editor/template builds. |
| `GOD-CAP-748` | Export presets / build matrix | Feature tags distinguish single vs double precision builds. |
| `GOD-CAP-749` | Export presets / build matrix | Feature tags include dedicated-server/shader-baker states. |
| `GOD-CAP-750` | Export presets / build matrix | Custom feature tags can be added per export preset. |
| `GOD-CAP-751` | Export presets / build matrix | Feature tags are build/platform facts, not runtime hardware benchmarks. |
| `GOD-CAP-752` | Platform surface | Godot supports native Windows, Linux, and macOS exports. |
| `GOD-CAP-753` | Platform surface | Godot has Android and iOS export paths. |
| `GOD-CAP-754` | Platform surface | macOS supports modern universal architecture packaging. |
| `GOD-CAP-755` | Platform surface | Platform exports may require external SDK/signing toolchains. |
| `GOD-CAP-756` | Platform surface | Custom Linux binaries require controlled build-environment compatibility. |
| `GOD-CAP-757` | Platform surface | Console support depends on closed-platform access and third-party/approved tooling. |
| `GOD-CAP-758` | Platform surface | Engine export capability alone does not qualify a Leyforge platform target. |
| `GOD-CAP-759` | Web boundary | Godot supports Web export/runtime. |
| `GOD-CAP-760` | Web boundary | The Godot Web editor does not support the full native/C# extension stack. |
| `GOD-CAP-761` | Web boundary | The Web editor lacks several native-editor/export/debug capabilities. |
| `GOD-CAP-762` | Web boundary | Web remains materially constrained relative to the native Leyforge stack. |
| `GOD-CAP-763` | Web boundary | Web companion/admin services are a different question from full browser gameplay. |
| `GOD-CAP-764` | Profiling / observability | Godot provides standard CPU/script profiling. |
| `GOD-CAP-765` | Profiling / observability | Godot provides visual CPU/GPU rendering profiling. |
| `GOD-CAP-766` | Profiling / observability | Godot provides high-level multiplayer network profiling. |
| `GOD-CAP-767` | Profiling / observability | Debugger monitors expose FPS, memory, node, and other runtime metrics. |
| `GOD-CAP-768` | Profiling / observability | Godot exposes per-resource and total video-memory information. |
| `GOD-CAP-769` | Profiling / observability | Profiler coverage varies by renderer/platform. |
| `GOD-CAP-770` | Profiling / observability | Performance exposes process/physics/navigation timing metrics. |
| `GOD-CAP-771` | Profiling / observability | Performance exposes object/node/resource counts. |
| `GOD-CAP-772` | Profiling / observability | Performance exposes 3D physics active-body/pair/island metrics. |
| `GOD-CAP-773` | Profiling / observability | Performance exposes navigation map/region/agent/polygon/edge metrics. |
| `GOD-CAP-774` | Profiling / observability | Performance exposes rendering memory, draw-call, and primitive metrics. |
| `GOD-CAP-775` | Profiling / observability | Performance exposes pipeline-compilation counters useful for shader-stutter diagnosis. |
| `GOD-CAP-776` | Profiling / observability | Custom Performance monitors can expose Leyforge-specific metrics. |
| `GOD-CAP-777` | Profiling / observability | Some performance monitors are debug-only/coarse and cannot be the sole production health signal. |
| `GOD-CAP-778` | External profiling / logging | Godot documentation recommends measure-first optimization. |
| `GOD-CAP-779` | External profiling / logging | External CPU profilers are appropriate for native/engine bottlenecks. |
| `GOD-CAP-780` | External profiling / logging | Godot documents tracing/profiling integration such as Tracy/Perfetto/platform tools. |
| `GOD-CAP-781` | External profiling / logging | Production-like profiling should use optimized builds with matching debug symbols. |
| `GOD-CAP-782` | External profiling / logging | Official binaries do not provide all symbols needed for deep native symbolication. |
| `GOD-CAP-783` | External profiling / logging | GPU profiler choice varies by API/vendor/platform. |
| `GOD-CAP-784` | External profiling / logging | Desktop builds support rotating log files. |
| `GOD-CAP-785` | External profiling / logging | Log paths and retention can be configured. |
| `GOD-CAP-786` | External profiling / logging | Crash traces are emitted to logs/stderr. |
| `GOD-CAP-787` | External profiling / logging | Useful native crash symbolication requires matching build symbols. |
| `GOD-CAP-788` | External profiling / logging | Release GDScript call-stack tracking has performance trade-offs. |
| `GOD-CAP-789` | External profiling / logging | Release stdout buffering can affect last-moment server logs unless flush policy is configured. |
| `GOD-CAP-790` | External profiling / logging | Error/stderr logging is flushed promptly. |
| `GOD-CAP-791` | External profiling / logging | Godot logging does not automatically provide Leyforge structured correlation/redaction schema. |
| `GOD-CAP-792` | Testing / CI | Godot source integrates doctest-based C++ unit tests. |
| `GOD-CAP-793` | Testing / CI | Godot engine tests require a tests-enabled tools/editor build. |
| `GOD-CAP-794` | Testing / CI | Engine tests can be filtered and executed from command line. |
| `GOD-CAP-795` | Testing / CI | Engine doctest is not a turnkey user-project GDScript test framework. |
| `GOD-CAP-796` | Testing / CI | Engine-level tests are appropriate for future Godot/Zylann module or fork patches. |
| `GOD-CAP-797` | Testing / CI | GUT is a current community Godot-4 project testing candidate with CLI/JUnit support. |
| `GOD-CAP-798` | Testing / CI | GdUnit4 is a current community testing candidate supporting GDScript/C# and CI/JUnit. |
| `GOD-CAP-799` | Testing / CI | Community test frameworks remain governed external dependencies. |
| `GOD-CAP-800` | Testing / CI | Exact Godot 4.7.2 compatibility must be fixture-tested before adoption. |
| `GOD-CAP-801` | Testing / CI | Test fixtures/data should remain as framework-neutral as practical. |
| `GOD-CAP-802` | Testing / CI | Godot supports headless command-line execution. |
| `GOD-CAP-803` | Testing / CI | Godot export automation can be driven from CI. |
| `GOD-CAP-804` | Testing / CI | CLI export consumes version-controlled export presets. |
| `GOD-CAP-805` | Testing / CI | Custom Godot/module builds can be built in reproducible toolchains. |
| `GOD-CAP-806` | Testing / CI | CI must inject signing/export secrets separately. |
| `GOD-CAP-807` | Testing / CI | Headless CI does not qualify GPU/renderer behavior. |
| `GOD-CAP-808` | Testing / CI | Production dedicated-server tests must run the actual exported server artifact. |

## 190.3 Mod trust classes

```text
M0 DATA-ONLY
  Leyforge schema + validation; no arbitrary script/native code

M1 TRUSTED SCRIPT
  explicit executable extension; user/server knowingly trusts it

M2 NATIVE / GDEXTENSION
  full native application trust
```

## 190.4 Candidate persistence shell

```text
World Manifest / Schema
        |
Leyforge Save Coordinator + Journal
        |
        +-- Zylann voxel persistence
        +-- structured domain DB candidate (SQLite class)
        +-- bounded files/resources/config for appropriate jobs
```

## 190.5 Round-7 proof packages

`GOD-PKG-64` Resource vs Leyforge Schema; `65` World Structured DB; `66` Cross-Store Checkpoint; `67` Data-Only Mod Sandbox; `68` Trusted Pack Signature; `69` Exported Resource Layout; `70` Dependency Fixture Matrix; `71` Production Symbols/Crash; `72` Observability Baseline; `73` Profiler Correlation; `74` Project Test Framework Bakeoff; `75` CI Export Matrix; `76` User Content Parser Fuzz; `77` Update/Patch Layering.

## 190.6 Round-7 gate

**PASS — CONTINUE TO FINAL RECONCILIATION.**

Round 8 must decide technology disposition, consolidate proof packages, identify residual red risks, and determine whether PRD-03 can become a closure candidate.

---

# 191. Round-8 — Final Technology Reconciliation and Closure Candidate

## 191.1 Current upstream checkpoint

As of **4 September 2026**, the audit reference remains **Godot 4.7.2 stable (18 Aug 2026)**. Godot 4.8 remains on the development line (dev4 as of 26 Aug 2026). Stable baseline facts therefore remain pinned to 4.7.2 until a controlled technology delta is issued.

The current external candidates observed during reconciliation remain **Godot-SQLite 4.7**, **GUT 9.6.1**, and **GdUnit4 6.2.0** in the Godot Asset Library. Their listing does not establish exact Leyforge/Godot-4.7.2 qualification; the relevant bakeoffs remain mandatory.

## 191.2 Final capability/disposition register

| ID | Domain | Final disposition |
|---|---|---|
| `GOD-CAP-809` | Baseline | Godot 4.7.2 remains the current stable PRD-03 reference baseline; 4.8-dev evidence is tracked but non-authoritative. |
| `GOD-CAP-810` | Engine | No PRD-03 finding disqualifies Godot as Leyforge engine shell. |
| `GOD-CAP-811` | Voxel boundary | Zylann remains a specialised voxel substrate under Leyforge, not semantic/world authority. |
| `GOD-CAP-812` | Build | Zylann module build remains the reference/control path for qualification; GDExtension remains the portability candidate. |
| `GOD-CAP-813` | Build | No maintained Godot/Zylann fork is justified before a critical public-API limitation is proven. |
| `GOD-CAP-814` | Precision | Hierarchical canonical coordinates plus bounded active local frames are the preferred architecture direction to prototype. |
| `GOD-CAP-815` | Precision | Double-precision custom Godot remains an explicit control/alternative, not an automatic global requirement. |
| `GOD-CAP-816` | Precision | Origin shifting remains a fallback candidate and is not preferred by default because of multiplayer/frame complexity. |
| `GOD-CAP-817` | Language | GDScript/C#/native language choice remains workload-driven; no whole-project language mandate is justified by PRD-03. |
| `GOD-CAP-818` | Native code | GDExtension is the preferred escalation path for measured hot services before engine-module/fork escalation where APIs suffice. |
| `GOD-CAP-819` | Concurrency | Worker-compute plus versioned owner-commit is accepted as an architecture input for PRD-04. |
| `GOD-CAP-820` | Concurrency | No custom global job scheduler is currently justified; global CPU budgeting/observability is still required. |
| `GOD-CAP-821` | SceneTree | SceneTree is accepted primarily as active representation/UI/runtime composition, not persistent civilisation/world database. |
| `GOD-CAP-822` | Physics | Jolt is the leading general 3D physics candidate; Godot Physics remains a comparison/control backend. |
| `GOD-CAP-823` | Physics | CharacterBody3D is the leading ordinary player/NPC physical movement executor candidate, not movement-law authority. |
| `GOD-CAP-824` | Vessels | Moving voxel vessels require Leyforge-owned hull/state/local-frame architecture with simplified primitive/convex physical proxies. |
| `GOD-CAP-825` | Navigation | Hybrid navigation is preferred: Leyforge regional graph + Godot local navmesh + specialist voxel/volume providers. |
| `GOD-CAP-826` | Navigation | Dynamic voxel navigation should use bounded procedural source extraction and asynchronous revisioned local rebakes. |
| `GOD-CAP-827` | Networking | ENet is the leading native real-time transport candidate for authoritative gameplay. |
| `GOD-CAP-828` | Networking | Leyforge owns durable binary world/voxel protocol, interest management, semantic validation, rate/work budgets and reconnect semantics. |
| `GOD-CAP-829` | Networking | SceneMultiplayer/Spawner/Synchronizer are optional bounded active-scene conveniences, not durable world protocol authority. |
| `GOD-CAP-830` | Networking | Authentication/account/directory/admin functions should use a distinct secured service/control plane where appropriate. |
| `GOD-CAP-831` | Rendering | Forward+ Vulkan is the reference high-end renderer/driver candidate for qualification. |
| `GOD-CAP-832` | Rendering | Mobile renderer is a serious balanced/low modern-hardware candidate. |
| `GOD-CAP-833` | Rendering | Compatibility renderer is conditional support pending Zylann/material semantic-parity proof. |
| `GOD-CAP-834` | Presentation | No gameplay-significant state may exist only as a renderer-specific VFX/shader/audio cue. |
| `GOD-CAP-835` | UI/input | Godot Control/InputMap/audio/accessibility systems are accepted supporting primitives behind Leyforge registries/facades. |
| `GOD-CAP-836` | Split screen | Local split-screen is technically viable through multiple Viewports but remains performance-qualified, not guaranteed by API existence. |
| `GOD-CAP-837` | Persistence | Leyforge owns world manifest, journal, checkpoint, migration and cross-store recovery semantics. |
| `GOD-CAP-838` | Persistence | Zylann may own low-level voxel persistence transport/storage while structured domain storage remains separate. |
| `GOD-CAP-839` | Database | SQLite is accepted only as the leading database technology class for prototype comparison; no wrapper/library dependency is yet approved. |
| `GOD-CAP-840` | Resources | Godot Resources are accepted for suitable authored/baked/config assets but rejected as the sole long-lived world/domain schema. |
| `GOD-CAP-841` | Mods | Untrusted/default player modding is data-only declarative M0; arbitrary script/native packs are trusted executable extensions. |
| `GOD-CAP-842` | Security | PCK signatures/pack origin verification complement but do not replace mod sandbox/trust classification. |
| `GOD-CAP-843` | Testing | A project-level test framework is required; GUT and GdUnit4 remain candidates pending exact 4.7.2 bakeoff. |
| `GOD-CAP-844` | CI | CLI/headless/export workflows are sufficient to build a layered CI pipeline, but exported-artifact and real-GPU lanes remain mandatory. |
| `GOD-CAP-845` | Observability | Godot profiler/Performance/logging are accepted inputs; Leyforge must add structured domain metrics/correlation/redaction and retain symbols. |
| `GOD-CAP-846` | Dependencies | No broad plugin/library expansion is justified; every external dependency must close a concrete gap under ENG-GOV-15. |
| `GOD-CAP-847` | Platforms | Windows/Linux are the natural first qualification targets; macOS/mobile/web/console remain separately gated by evidence and roadmap. |
| `GOD-CAP-848` | Evidence | Technology facts discovered in PRD-03 do not become architecture law until PRD-04/ADR/prototype gates where required. |
| `GOD-CAP-849` | Proof | All unresolved production-critical claims are routed to PRD-06 risk and PRD-07 P3/P4 proof rather than silently accepted. |
| `GOD-CAP-850` | Closure | PRD-03 is sufficient to proceed to PRD-04 Architecture Boundary Study under controlled technology deltas. |

## 191.3 Final Godot/Leyforge boundary

```text
                         LEYFORGE
  semantic IDs / game law / world history / simulation authority
  transactions / save coordination / content trust / Forge sources
  regional routing / movement capability / world protocol / settings
                              |
                   governed adapter facades
                              |
          +-------------------+--------------------+
          |                                        |
        GODOT                                   ZYLANN
 scene/runtime shell                         voxel substrate
 renderer + UI/input/audio                  voxel buffers/models
 Jolt/physics APIs                          streaming/meshing
 NavigationServer                           edits/generation hooks
 ENet/network primitives                   voxel persistence hooks
 threads/servers/resources                 voxel queries/collision
 export/profiling/tooling
          |                                        |
          +-------------------+--------------------+
                              |
                   optional governed support
          SQLite-class DB / test framework / native tools
```

## 191.4 Technology disposition table

| Technology / surface | PRD-03 disposition | Qualification still required |
|---|---|---|
| Godot 4.7.2 | **CONTINUE / reference baseline** | Whole-stack P3/P4 |
| Zylann Voxel Tools 1.7 | **CONTINUE / specialised voxel candidate** | PRD-02 proof programme |
| Jolt | **LEADING PHYSICS CANDIDATE** | voxel churn, vessels, scale |
| Vulkan + Forward+ | **REFERENCE HIGH-END CLIENT** | renderer/Zylann parity |
| Mobile renderer | **LEADING BALANCED/LOW MODERN CANDIDATE** | content parity/perf |
| Compatibility | **CONDITIONAL** | Zylann/material/VFX semantic parity |
| Module build | **REFERENCE CONTROL** | compare GDExtension |
| GDExtension | **STRATEGIC PORTABILITY CANDIDATE** | API/perf/headless/export parity |
| precision=double | **CONTROL / ALTERNATIVE** | low-end cost + Zylann/Jolt compatibility |
| hierarchical local frames | **PREFERRED PROOF DIRECTION** | full coordinate/vessel/network prototype |
| ENet | **LEADING REALTIME TRANSPORT** | loss/load/security/capacity |
| SceneMultiplayer auto replication | **LIMITED/OPTIONAL** | active-entity bakeoff |
| Godot NavigationServer | **LOCAL NAV PROVIDER** | tiled voxel rebake/crowds |
| SQLite technology | **LEADING STRUCTURED-DB CLASS** | adapter/perf/recovery bakeoff |
| Godot-SQLite plugin | **UNAPPROVED EXTERNAL CANDIDATE** | exact 4.7.2/build/platform matrix |
| GUT | **UNAPPROVED TEST CANDIDATE** | bakeoff |
| GdUnit4 | **UNAPPROVED TEST CANDIDATE** | bakeoff |
| arbitrary PCK script mods | **REJECT AS SAFE DEFAULT** | only explicit trusted-code tier |
| custom Godot/Zylann fork | **DEFER / evidence-triggered only** | critical API/fix threshold |
| Web full game | **DEFER** | native-stack/platform proof |
| Console | **DEFER** | platform access/toolchain/business gate |

## 191.5 Consolidated PRD-07 proof programme

The 77 detailed `GOD-PKG-*` packages are preserved as source obligations but consolidated for programme management into these macro proof suites:

1. **GOD-PROOF-A — Build / Precision / Extension Parity** — Module vs GDExtension, standard vs double, export/headless/platform matrix.
2. **GOD-PROOF-B — Execution / Concurrency / Lifetime** — workers, owner-commit, task DAG, shutdown/drain, global CPU contention.
3. **GOD-PROOF-C — Physics / Movement / Vessel** — CharacterBody, collider churn, hull proxies, buoyancy, moving decks, Jolt differential.
4. **GOD-PROOF-D — Navigation / Dynamic World** — procedural nav tiles, invalidation, crowds, links, flight/swim provider, regional handoff.
5. **GOD-PROOF-E — Network / Server / Security** — ENet traffic classes, voxel bulk transport, auth, reconnect, fuzzing, capacity, NAT, admin plane.
6. **GOD-PROOF-F — Rendering / Low-End / Semantic Presentation** — renderer parity, water, shaders, 32x32 textures, HLOD/occlusion, VFX fallback.
7. **GOD-PROOF-G — UI / Input / Accessibility / Audio / Split Screen** — scaling, rebinding, controllers/touch, a11y, localization, multi-view/audio.
8. **GOD-PROOF-H — Persistence / DB / Recovery** — Resource-vs-schema, SQLite-class DB, cross-store checkpoints, migration/restart.
9. **GOD-PROOF-I — Content Trust / Mods / Updates** — data-only sandbox, parser fuzz, signatures, patch layering, missing-mod quarantine.
10. **GOD-PROOF-J — CI / Diagnostics / Dependency Toolchain** — test-framework bakeoff, symbols/crashes, custom metrics, export matrix, profiler correlation.
11. **GOD-PROOF-K — Whole-Stack Hostile Soak** — combine voxel streaming, simulation, nav, physics, network, save, rendering/client churn and repeated world/session transitions.

## 191.6 Residual critical risk register

The following remain the principal red/amber-red items for PRD-06:

- blocky far-distance rendering/LOD and huge view distances;
- Module↔GDExtension parity and custom-build burden;
- large-world precision strategy across voxel/physics/network/vessels;
- terrain collision/nav rebuild churn during heavy edits;
- moving voxel-vessel collider/local-frame/occupant behaviour;
- global CPU contention across Godot/Zylann/nav/resource/simulation workers;
- authoritative voxel/network bulk backpressure and reconnect repair;
- cross-store save atomicity/recovery;
- Compatibility renderer semantic parity;
- split-screen multi-view cost;
- untrusted content parser/resource amplification;
- external dependency compatibility/abandonment/security;
- long-soak stability and exported-server parity.

None is a current **technology disqualifier**. Each is measurable and has an assigned proof path.

## 191.7 Rejected architectural shortcuts

PRD-03 rejects the following as foundations:

- SceneTree as the persistent civilisation database;
- Godot Resource UID as Leyforge semantic identity;
- exact dynamic concave voxel hull mesh as a ship collider;
- VehicleBody3D as universal carts/mounts/vessels;
- one global navmesh for the world;
- Navigation avoidance as pathfinding or physics;
- SceneMultiplayer wire format/RPC NodePaths as durable world protocol;
- MultiplayerSynchronizer as voxel streaming;
- client-reported authoritative world state;
- renderer-specific VFX as sole gameplay information;
- PCK loading as an untrusted-code sandbox;
- raw Godot Resource serialization as the sole long-lived world-save schema;
- adding a custom global job scheduler, network engine, physics engine, or maintained fork before evidence requires it.

## 191.8 PRD-04 handoff contract

PRD-04 must now turn these technology findings into explicit architecture boundaries without promoting unproven P3/P4 claims to fact. At minimum PRD-04 must define:

- Godot ↔ Leyforge ↔ Zylann module ownership;
- canonical coordinate/spatial-frame ownership;
- SceneTree vs persistent-domain representation;
- worker/owner/commit topology;
- physics and movement facade;
- voxel/nav regional/local provider boundary;
- network protocol / interest / service-plane boundary;
- save coordinator / DB / voxel-store boundary;
- Forge source/bake/runtime boundary;
- mod trust classes and plugin boundary;
- settings/presentation profile boundary;
- diagnostics/test/dependency interfaces.

## 191.9 Final PRD-03 verdict

> **PASS — PRD-03 CLOSURE CANDIDATE.**

> **Godot 4.7.2 remains Leyforge's leading engine-shell baseline. No current audited fact disqualifies it. The architecture must keep Godot as an execution/tooling substrate beneath Leyforge-owned semantic, simulation, persistence, protocol, content-trust and Forge authority.**

> **Proceed to PRD-04 Architecture Boundary Study while routing all production-critical unknowns through PRD-05/06/07 evidence and proof gates.**

PRD-03 should only be reopened by controlled delta if a material technology fact changes, such as a new stable Godot/Zylann release, a proof invalidating a candidate boundary, or discovery of a required capability absent from the audited stack.

---

# 192. Round-8 Source Refresh

Current refresh used for closure reconciliation:

- Godot 4.7.2 maintenance release — 18 Aug 2026.
- Godot archive — 4.8 remains dev4 (26 Aug 2026), not stable baseline.
- Godot 4.7 GDExtension documentation — native shared libraries without engine recompilation; explicit compatibility bounds supported.
- Godot dedicated-server documentation — headless/export-template path and visual stripping remain first-class.
- Godot high-level multiplayer / SceneMultiplayer documentation — high-level wire protocol remains implementation detail; low-level/custom paths remain available.
- Godot PCK/mod documentation — explicit warning remains against automatically loading potentially malicious executable packs.
- Asset Library refresh — Godot-SQLite 4.7, GUT 9.6.1 and GdUnit4 6.2.0 remain visible candidate versions; exact 4.7.2 qualification is not implied by listing.

**ROUND-8 RESULT: PRD-03 GODOT & SUPPORTING TECHNOLOGY AUDIT — CLOSURE CANDIDATE.**
