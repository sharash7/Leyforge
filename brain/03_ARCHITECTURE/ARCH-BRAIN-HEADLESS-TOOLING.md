---
brain_schema: 1
id: "ARCH-BRAIN-HEADLESS-TOOLING"
type: "architecture"
title: "Headless Brain Tooling Architecture"
status: "active"
information_class: "authored"
created: "2026-09-06"
updated: "2026-09-06"
authority_domain: "brain_operations"
authority_role: "implementation_record"
authority_status: "authoritative"
requirements:
  - "REQ-BRAIN-HEADLESS-001"
decisions:
  - "DEC-0001"
implemented_by:
  - "MOD-BRAIN-CLI"
interfaces:
  - "IFACE-BRAIN-CLI"
tested_by:
  - "TEST-BRAIN-ACCEPTANCE"
---

# Headless Brain Tooling Architecture

One standard-library command family reads schema-1 frontmatter and repository artifacts directly. Doctor, query, ID, index, ingest, links, trace, migrate, impact and certify commands share the same parser and relationship graph. Committed generated outputs are deterministic and checked for drift. Obsidian Bases and Canvas consume the same Markdown properties as convenient views.
