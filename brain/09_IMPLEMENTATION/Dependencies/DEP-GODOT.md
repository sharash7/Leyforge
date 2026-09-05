---
brain_schema: 1
id: "DEP-GODOT"
type: "implementation_module"
title: "Godot Engine"
status: "proposed"
information_class: "authored"
created: "2026-09-06"
updated: "2026-09-06"
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
provenance_status: "unresolved"
licence_status: "unresolved"
derived_from:
  - "DOC-B-OPS-06"
  - "DOC-ENG-GOV-15"
related_to:
  - "ADR-0001"
  - "SYS-ENGINEERING-GOVERNANCE"
---

# DEP-GODOT — Godot Engine

## Purpose

Planned foundational game-engine dependency for the later V1 runtime.

## Current State

No Godot runtime is installed in the clean rebuild and R8 gameplay permission is closed. Historical POC binaries and versions are not a valid dependency selection.

## Source / Provenance

Upstream source, supported version/tag/commit and acquisition path are unresolved pending [[ADR-0001]].

## Licence

Licence and required notices must be verified against the selected upstream artifact before activation.

## Activation Conditions

- ADR-0001 is accepted.
- Exact provenance, licence and supported platform information are verified.
- The governing implementation gate explicitly opens runtime work.
