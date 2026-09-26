---
brain_schema: 1
id: "DEP-ZYLANN"
type: "implementation_module"
title: "Zylann Voxel"
status: "proposed"
information_class: "authored"
created: "2026-09-06"
updated: "2026-09-26"
authority_domain: "implementation_state"
authority_role: "implementation_record"
authority_status: "authoritative"
repository_paths:
  - "UNINSTALLED"
record_type: "dependency"
governance_status: "planned"
category: "FOUNDATIONAL"
template_version: 1
related_adrs:
  - "ADR-0002"
  - "ADR-0003"
provenance_status: "verified_for_r7_w0"
licence_status: "resolved_for_r7_w0"
derived_from:
  - "DOC-B-OPS-06"
  - "DOC-ENG-GOV-15"
  - "DOC-PRD-02"
  - "DOC-PRD-03"
  - "DOC-PRD-07"
related_to:
  - "ADR-0002"
  - "ADR-0003"
  - "TASK-20260906-005"
  - "WORK-20260906-005"
  - "EVID-0006"
  - "AUDIT-0006"
  - "HANDOFF-20260906-005"
  - "DEP-GODOT"
  - "SYS-ENGINEERING-GOVERNANCE"
---

# DEP-ZYLANN — Zylann Voxel

## Purpose

Foundational production voxel-provider candidate identified by the Branch B reconstruction backlog and the exact provider used by the bounded R7 W0 GDExtension proof lane. Those roles remain distinct.

## Accepted PROD Direction — Uninstalled Until P01

The owner accepted **Zylann Voxel Tools 1.7** as the production voxel substrate on 26 September 2026, paired with the accepted Godot 4.7.2 stable baseline and governed by [[ADR-0002]] and [[ADR-0003]]. Zylann owns supported voxel storage, terrain editing, meshing, streaming and materialisation; Leyforge retains semantic rules, stable identity, authoritative mutation, gameplay, persistence coordination, content and Forge authority behind its adapter boundary.

The Brain implementation-module status remains `proposed` because the production artifact is not yet selected or installed; engineering governance status remains `planned` and repository path `UNINSTALLED`. Owner acceptance approves the provider family and default upstream-plus-adapter ownership mode, not an installed artifact. P01 must choose and pin the exact compatible module or GDExtension edition/build, commit/archive, hashes, licence materials, export profile and diagnostics before activation or completion. The R7 W0 GDExtension artifact below remains proof-only and is not silently promoted.

## Governed R7 W0 State

The W0 candidate is upstream **Voxel Tools 1.7 GDExtension for Godot 4.5+**, tag `v1.7x`, exact commit `75d3c6d996ed2331c80edcd8c3ebc947afc0f041`. This is a proof-only candidate. [[ADR-0002]] and [[ADR-0003]] remain proposed, and no module-versus-GDExtension production choice has been made.

| Artifact | Exact identity |
| --- | --- |
| Official release archive | 54,457,774 bytes; SHA-256 `600737572a5e25541ba6f503e842a3717ba19afafa5474510a6ceff995a1d2d8` |
| Windows editor DLL | 11,337,216 bytes; SHA-256 `e7191869989607805660de8f54c3aa2ab2e3ab08902bdd6976ac8aa6b3fe07ad` |
| Windows release-template DLL | 10,173,952 bytes; SHA-256 `cff4fdefa8d3348860bc241ed9eb86f96d31c2e6e7da8a304c890ec018115bf0` |
| Extension descriptor | Compatibility minimum `4.4.1`; SHA-256 `353b33a3b5631803785a7fb28810c8dee2ff97bc0a1675d80e1b7b28b7101770` |

The runner verifies the official archive, stages only the descriptor, UID, licence and two Windows x86_64 DLLs into each ignored clean proof workspace, and exports through `proofs/r7/w0/runtime/src/provider/voxel_tools_adapter.gd`. The adapter uses provider operations without admitting provider types or runtime IDs into canonical domain state.

## Source / Provenance

- Upstream repository: `https://github.com/Zylann/godot_voxel`.
- Official release: `https://github.com/Zylann/godot_voxel/releases/tag/v1.7x`.
- Exact tag commit: `75d3c6d996ed2331c80edcd8c3ebc947afc0f041`.
- Acquisition, staged-file inventory and SHA-256 identities are locked in `proofs/r7/w0/dependencies.lock.json`.
- Installation state: verified isolated proof cache and per-build staging only. No archived POC addon, binary or source is used.
- Patch state: `NO-LOCAL-PATCH`; clean upstream release artifact.

## Licence

The selected archive contains the upstream MIT licence, copyright 2016–2024 Marc Gilleron. Licence status is resolved for this R7 proof use.

## Provider Boundary and Known Limits

- Ownership mode: external dependency behind a Leyforge-owned provider adapter.
- Permitted use: R7 W0 provider, export, readiness/failure and conformance evidence only.
- The GDExtension is upstream's less-tested edition relative to its module build. The W0 lane does not claim module equivalence.
- Full editor shutdown with this exact GDExtension currently exits `0xC0000005`; the command-line export and exported client/headless runtime paths pass. The editor surface is not claimed.
- This initial W0 conformance surface does not establish terrain streaming, collision, navigation, performance or later-wave feature support.

## Update Policy

Any upstream tag/commit, archive, staged binary, compatibility or adapter-boundary change requires an updated lock and rerun of affected provider/export/architecture continuing proofs. Local modifications require a new patch identity and PRD04-PROOF-73 re-execution; none exist now.

## Observed R7 W0 Result

The exact `v1.7x` GDExtension loaded in all six exported runtime smokes and passed the bounded fake/real adapter and provider-contract scenarios. Editor shutdown still exits `0xC0000005` and remains outside the certified lane. [[EVID-0006]] retains both outcomes. This does not accept [[ADR-0002]] or [[ADR-0003]] or establish production edition parity.

## Production Activation Conditions

- [[ADR-0002]] and [[ADR-0003]] explicitly accept or replace the proposed provider family and upstream-plus-adapter ownership mode.
- The governing implementation gate opens the selected provider edition.
- P01 pins and verifies the exact compatible production edition/build, provenance, hashes, licence materials, packaging and diagnostics before activation or completion.
- Later provider-dependent, performance and dependency-upgrade evidence remains required at its owning production gates.
