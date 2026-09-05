---
brain_schema: 1
id: "SYS-ENGINEERING-GOVERNANCE"
type: "system"
title: "Leyforge Engineering Governance Control Plane"
status: "active"
information_class: "authored"
created: "2026-09-06"
updated: "2026-09-06"
authority_domain: "engineering_governance"
authority_role: "implementation_record"
authority_status: "authoritative"
depends_on:
  - "DOC-ENG-GOV-00"
  - "DOC-ENG-GOV-01"
  - "DOC-ENG-GOV-02"
  - "DOC-ENG-GOV-03"
  - "DOC-ENG-GOV-04"
  - "DOC-ENG-GOV-05"
  - "DOC-ENG-GOV-06"
  - "DOC-ENG-GOV-07"
  - "DOC-ENG-GOV-08"
  - "DOC-ENG-GOV-09"
  - "DOC-ENG-GOV-10"
  - "DOC-ENG-GOV-11"
  - "DOC-ENG-GOV-12"
  - "DOC-ENG-GOV-13"
  - "DOC-ENG-GOV-14"
  - "DOC-ENG-GOV-15"
  - "DOC-B-OPS-00"
  - "DOC-B-OPS-01"
  - "DOC-B-OPS-02"
  - "DOC-B-OPS-03"
  - "DOC-B-OPS-04"
  - "DOC-B-OPS-05"
  - "DOC-B-OPS-06"
related_to:
  - "SYS-PROJECT-BRAIN"
  - "WORK-20260906-001"
---

# Leyforge Engineering Governance Control Plane

This system record points to the operational R5 controls for the certified Branch B corpus. The 23 source documents retain primary authority. `brain/00_CONTROL/governance-manifest.json` pins their identities, `brain/91_SCHEMA/governance.schema.json` maps their record forms into Brain schema 1, and `brain/92_SCRIPTS/governance.py` performs the mechanical checks.

## Active G0 Surfaces

- Source-derived governance templates under `brain/90_TEMPLATES/Governance/`.
- ADR, waiver, deprecation, dependency and governance-debt record paths inside the existing Brain vault.
- Stable ID, metadata, risk, reference, rule-link and waiver-expiry validation.
- Root agent contract, stable verification entrypoints and GitHub Actions.
- Foundational ADR and dependency backlogs with unresolved facts kept explicit.

## Authority Boundary

This is an implementation and navigation record. It does not reproduce Branch B law, accept proposed ADRs, or grant gameplay permission.
