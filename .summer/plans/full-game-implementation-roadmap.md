# Leyforge Full-Game Implementation Roadmap

**Roadmap version:** 1  
**Started:** 27 July 2026  
**Current phase:** Phase 0 - Baseline, traceability, and development reset

## Completion contract

The canonical Documents 00-20 and 20A-20H define the product boundary. Work is
complete only when every accepted requirement in the generated ledger has a
terminal disposition and evidence. Documentation may be clarified through an
explicit decision record; scope must not silently disappear because the POC
does not yet implement it.

The historical `0.9.0-rc1` package remains POC evidence. New work uses
`0.10.0-dev`. `main.tscn` retains gameplay ownership while the approved Stage A
main menu remains the intended production startup shell. During development,
Summer may freely select the menu, gameplay scene, or a directly runnable test
scene as the current project target.

## Phase map

| Phase | Outcome | Principal exit gate |
|---|---|---|
| 0. Baseline and traceability | Reproducible current build, checksummed documents, requirements ledger, honest coverage baseline | Phase 0 gate green; manual POC sign-off explicitly tracked |
| 1. POC closure and Stage A stabilization | Close remaining owner testing, finish multi-world/regional-worldgen v4 and settlement-lab hardening, trace every POC requirement | No unverified POC acceptance rows; migrations and current gate green |
| 2. Alpha breadth | Expand progression, resources, creatures, structures, quests, villages, automation, magic, combat and UI beyond the single vertical slice | Alpha feature matrix green across fresh, migrated and long-running worlds |
| 3. Civilisation depth | Deliver town/city growth, households, economy, governance, culture/faction simulation, logistics and large settlement projects | Multi-settlement simulation and conservation/LOD gates green |
| 4. Full-game completion | Complete realms/dimensions, player Blueprint Workshop, content packs, late game and all accepted full-game systems | No accepted ledger rows remain absent, partial or unverified |
| 5. Production readiness | Performance profiles, accessibility/localisation, security/privacy, platform/network decisions, packaging and long-term save support | Release-candidate gates, signed manual matrix and migration policy green |

## Phase 0 work packages

### 0.1 Baseline preservation

- Record the committed Document 20 foundation and preserve the separate Stage A
  working tree.
- Validate only in an isolated writable copy so live saves are untouched.
- Pin the official Godot 4.6.3 runner and verify its published checksum.

### 0.2 Reproducible verification

- Run every existing current regression probe.
- Bootstrap a missing Godot class cache automatically for source-only copies.
- Keep the 256-seed gate fast and retain the optional 10,000-seed extension.
- Pin the completed Stage A regional baseline at 4,488 aggregate checks and
  130,007 extended planner checks across 10,000 seeds.
- Treat script errors, parse errors, registry fallback, count drift, or missing
  machine-readable results as failures.

### 0.3 Documentation integrity

- Cover canonical Markdown, the voxel registry, and DOCX mirrors with
  `SHA256SUMS.txt`.
- Regenerate and check the manifest through a committed script.
- Keep manual-test claims distinct from automated evidence.

### 0.4 Traceability and coverage

- Generate deterministic IDs linked to document, line and section.
- Classify candidate rows as requirements, decisions, milestones, acceptance
  criteria, or deferrals.
- Map each row to a proposed roadmap phase.
- Begin with `unverified`; add code/test evidence during phase triage rather
  than claiming heuristic matches as implementation.

### 0.5 Development reset

- Use active metadata `0.10.0-dev` and `post_poc_development`.
- Retain the historical Stage 9 report and packaged benchmark as immutable
  evidence for `0.9.0-rc1`.
- Produce one Phase 0 command that validates ledger freshness, document
  integrity, all current probes, and whitespace health.

## Phase 1 first queue

1. Complete the owner/manual packaged POC sign-off and record any defects.
2. Finish Stage A main-menu, world-lifecycle, legacy-import, regional worldgen,
   multi-settlement, and progression-lab review without changing gameplay
   ownership in `main.tscn`.
3. Trace all Phase 1 ledger candidates to code, tests, deferral or
   non-applicability; split compound rows where necessary.
4. Resolve any POC claim whose evidence is missing, stale, or only
   implementation-based.
5. Freeze the `0.10.x` save/worldgen compatibility contract before broad Alpha
   content expansion.

## Decision gates before later phases

- Decide networking scope and authority model before online co-op code.
- Reassess streaming, navigation, simulation LOD and persistence before
  civilisation-scale populations.
- Validate the realm save/streaming contract before the first dimension.
- Decide public mod scripting and content-package policy before promising mod
  compatibility.
- Select supported platforms, reference hardware and certification targets
  before Phase 5 scheduling.

## Verification commands

Generate/update Phase 0 artifacts:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .summer/tools/generate_requirement_ledger.ps1
powershell -NoProfile -ExecutionPolicy Bypass -File .summer/tools/update_document_checksums.ps1
```

Run the full technical Phase 0 gate:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .summer/verification/run_phase0_gate.ps1 `
  -GodotConsole <absolute-path-to-Godot-console.exe>
```

Use `-ExtendedWorldgenSeeds 10000` for the extended planner gate.
