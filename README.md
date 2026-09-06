# Leyforge governed rebuild

R0 through R6 are complete and certified. The legacy POC is recoverably archived, the active workspace is clean of runtime dependencies, the Project Brain and Branch B governance are operational, and the seven-path operating pilot passes. R7 is the controlled pre-rebuild technical and audit programme. Gameplay implementation has not begun.

Start with the [Brain home](brain/HOME.md), [agent contract](brain/AGENTS.md), [current handoff](brain/CURRENT_HANDOFF.md), and [governance health](brain/00_CONTROL/DASH-GOVERNANCE.md). Canonical project sources remain under `.summer/00_Docs`; generated Brain proxies and operational governance records are navigation, implementation and evidence records, not replacement authority.

The protected tag `legacy-poc-2026-09-05` preserves the complete POC history. The rebuild retains the immutable 441-artifact R3 source baseline plus three hash-pinned R5 PRD-05/06 intake artifacts, with no legacy runtime. There is deliberately no `project.godot` or runnable game yet. Do not restore POC code to make the workspace launchable.

Run the governed checks from the repository root:

```powershell
python tools/verify.py --tier build
python tools/verify.py --tier focused
python tools/verify.py --tier full
```

R6 implementation commit `dd17cd6c5a24ab71aafd5ebf0c252461aa09aef4` passed exact certification. Its evidence is `brain/10_TESTING/Evidence/r6-brain-governance-pilot.json`; the completion summary is `docs/rebuild/r6/completion-receipt.json`. The active handoff opens R7 technical and audit work while R8 gameplay permission remains closed.
