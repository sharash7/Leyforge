---
brain_schema: 1
id: "SYS-PROJECT-BRAIN"
type: "system"
title: "Leyforge Project Brain"
status: "active"
information_class: "authored"
created: "2026-09-06"
updated: "2026-09-06"
authority_domain: "brain_operations"
authority_role: "implementation_record"
authority_status: "authoritative"
depends_on:
  - "DOC-LF-BRAIN-01"
  - "DOC-LF-BRAIN-02"
  - "DOC-LF-BRAIN-03"
  - "DOC-LF-BRAIN-04"
  - "DOC-LF-BRAIN-05"
  - "DOC-LF-BRAIN-06"
  - "DOC-LF-BRAIN-07"
  - "DOC-LF-BRAIN-08"
  - "DOC-LF-BRAIN-09"
  - "DOC-LF-BRAIN-10"
  - "DOC-LF-BRAIN-11"
  - "DOC-LF-BRAIN-12"
  - "DOC-LF-BRAIN-13"
requirements:
  - "REQ-BRAIN-HEADLESS-001"
architecture:
  - "ARCH-BRAIN-HEADLESS-TOOLING"
implemented_by:
  - "MOD-BRAIN-CLI"
tested_by:
  - "TEST-BRAIN-ACCEPTANCE"
---

# Leyforge Project Brain

The Project Brain is the repository-owned knowledge, navigation, work-memory and evidence system defined by Branch A. Its durable substrate is Markdown, JSON, `.base`, Canvas and Python files under `brain/`. Obsidian is the primary human interface; the headless CLI is the automation and CI interface.
