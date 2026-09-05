# Leyforge governed rebuild

R4 Project Brain v0.1 is installed and certified over the R3 clean workspace. Gameplay implementation has not begun.

Start with the [Brain home](brain/HOME.md), [agent contract](brain/AGENTS.md), [current handoff](brain/CURRENT_HANDOFF.md), and [R4 status](docs/rebuild/r4/STATUS.md). Canonical project sources remain under `.summer/00_Docs`; generated Brain proxies are navigation and traceability records, not replacement authority.

The protected tag `legacy-poc-2026-09-05` preserves the complete POC history. The rebuild branch retains 441 controlled source artifacts and no legacy runtime. There is deliberately no `project.godot` or runnable game yet. Do not restore POC code to make the workspace launchable.

Run the governed checks from the repository root:

```powershell
python brain/92_SCRIPTS/brain.py doctor --profile certification
python -m unittest discover brain/92_SCRIPTS/tests -v
python brain/92_SCRIPTS/brain.py ingest --check
python brain/92_SCRIPTS/brain.py index --check
python tools/verify_rebuild_boundary.py
```

R5 audit/reconciliation is the next gate. R8 gameplay permission remains closed.
