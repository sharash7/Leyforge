---
brain_schema: 1
id: "REQ-BRAIN-HEADLESS-001"
type: "requirement"
title: "Brain integrity must work without Obsidian"
status: "verified"
information_class: "authored"
created: "2026-09-06"
updated: "2026-09-06"
authority_domain: "brain_operations"
authority_role: "delegated"
authority_status: "authoritative"
verification_method: "Run Brain Doctor, query, link, ingestion and index checks with Python standard library only."
derived_from:
  - "DOC-LF-BRAIN-11"
decisions:
  - "DEC-0001"
architecture:
  - "ARCH-BRAIN-HEADLESS-TOOLING"
implemented_by:
  - "MOD-BRAIN-CLI"
tested_by:
  - "TEST-BRAIN-ACCEPTANCE"
---

# Brain integrity must work without Obsidian

Critical schema validation, ID uniqueness, relationship checking, query, ingestion, deterministic index generation, migration checks and certification must operate directly on repository files while Obsidian is unavailable.

This Requirement restates locked LF-BRAIN-11 behavior. Its verified state refers to the R4 pilot evidence, not a new grant of project authority.
