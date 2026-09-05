# Leyforge rebuild bootstrap

This is the R3 clean workspace. Gameplay implementation has not begun.

Start with [current status](docs/rebuild/r3/STATUS.md), [authority locations](docs/rebuild/AUTHORITY-LOCATIONS.md), and the [REBUILD-00 handoff](.summer/00_Docs/Additional/REBUILD-00_Leyforge_Legacy_POC_Archive_Clean_Rebuild_and_Brain_Governance_Bootstrap_Handoff_v0.1.md).

The protected tag `legacy-poc-2026-09-05` preserves the complete POC history. This branch retains the supplied source documents at their existing paths and removes the legacy runtime. There is deliberately no project.godot or runnable game yet. Do not restore POC code to make the workspace launchable.

Run `python tools/verify_rebuild_boundary.py` to verify the source-preservation and legacy-leakage boundary. Brain placeholders under `brain/` follow LF-BRAIN-05; R4 must implement and verify their behavior before any operational Brain claim.
