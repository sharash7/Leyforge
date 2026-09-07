---
brain_schema: 1
id: "DEP-GODOT"
type: "implementation_module"
title: "Godot Engine"
status: "proposed"
information_class: "authored"
created: "2026-09-06"
updated: "2026-09-07"
authority_domain: "implementation_state"
authority_role: "provisional_record"
authority_status: "proposed"
repository_paths:
  - "UNINSTALLED"
record_type: "dependency"
governance_status: "planned"
category: "FOUNDATIONAL"
template_version: 1
related_adrs:
  - "ADR-0001"
provenance_status: "verified_for_r7_w0"
licence_status: "resolved_for_r7_w0"
derived_from:
  - "DOC-B-OPS-06"
  - "DOC-ENG-GOV-15"
  - "DOC-PRD-03"
  - "DOC-PRD-07"
related_to:
  - "ADR-0001"
  - "TASK-20260906-005"
  - "WORK-20260906-005"
  - "EVID-0006"
  - "AUDIT-0006"
  - "HANDOFF-20260906-005"
  - "DEP-ZYLANN"
  - "SYS-ENGINEERING-GOVERNANCE"
---

# DEP-GODOT — Godot Engine

## Purpose

Foundational engine candidate for later V1 runtime work and the exact build/runtime dependency used by the bounded R7 W0 proof lane.

## Governed R7 W0 State

The clean rebuild has no production Godot activation and R8 gameplay permission remains closed. [[TASK-20260906-005]] authorizes only the nested proof project at `proofs/r7/w0/runtime/project.godot` and ignored clean build workspaces. This proof use does not accept [[ADR-0001]].

The W0 lane deliberately records two exact identities:

| Role | Identity | Immutable evidence |
| --- | --- | --- |
| Build/export driver | `4.8.dev.custom_build.a9c94cd21`, upstream commit `a9c94cd21fc1e95c56a17aca0b310c346e6c41fa` | Console SHA-256 `06e7be7ed0298e81be421076a4a3166a7ae0e6b72c8a948d6faefd5823b3ee1a`; 301,056 bytes |
| Exported runtime template | official Windows x86_64 `4.8-dev4`, runtime `4.8.dev4.official.b56a91878` | Release package SHA-256 `cebaad066428083f111515c74fba35e3ca64942eadf2323f1c7241d23abb73ea`; template SHA-256 `d66dd49185e7d6bc27594f755347ca68f8e3828f074742b1788a98950491ac3f` |

The fixed driver was built from clean upstream source with `platform=windows target=editor arch=x86_64 production=yes debug_symbols=no accesskit=no d3d12=no -j6`. Its two lifetime fixes are upstream commits, so its governed patch state is `NO-LOCAL-PATCH`.

## Source / Provenance

- Engine source: `https://github.com/godotengine/godot` at exact commit `a9c94cd21fc1e95c56a17aca0b310c346e6c41fa`.
- Runtime artifact: official `godotengine/godot-builds` release `4.8-dev4`.
- Acquisition and every local artifact hash are locked in `proofs/r7/w0/dependencies.lock.json`.
- Installation state: verified isolated proof cache only. Nothing is copied from the archived POC and no dependency binary is tracked as production content.

## Licence

Godot is MIT licensed. Licence status is resolved for the R7 W0 proof lane; production notice/package handling remains part of later release governance.

## Known Limits

- The development build driver and exported runtime template are distinct, explicitly identified development snapshots.
- This package claims Windows x86_64 proof export only. It does not establish final platform, renderer, performance or release support.
- Loading Voxel Tools `v1.7x` in a full fixed-editor session currently produces a `0xC0000005` exit during editor shutdown. Command-line export exits zero and exported runtime processes exit zero. Editor mode is excluded from the claimed proof lane and the failure remains recorded for later provider/engine evaluation.

## Ownership and Update Policy

The dependency remains externally owned. Leyforge owns the build manifest, adapter boundary and proof evidence. Any version, source, template, build-flag or artifact-hash change requires a new governed lock plus re-execution of affected continuing proofs, including PRD04-PROOF-70 and PRD04-PROOF-74.

## Observed R7 W0 Result

Six real Windows x86_64 exports built and smoked successfully: three client and three dedicated/headless. Exported runtimes self-reported `4.8.dev4.official.b56a91878`, exact build identity and the loaded Voxel Tools provider. [[EVID-0006]] retains the hashes and measurements. This proves the bounded W0 surfaces only; it does not accept [[ADR-0001]] or activate a production engine.

## Production Activation Conditions

- [[ADR-0001]] is accepted through its own authority process.
- The governing implementation gate opens production runtime work.
- Final supported platform/profile, release packaging and dependency evidence pass the later PRD-07 qualification waves.
