# Leyforge governed rebuild

R4 Project Brain v0.1 is certified and the R5 Branch B governance bootstrap is installed over the clean workspace. Gameplay implementation has not begun.

Start with the [Brain home](brain/HOME.md), [agent contract](brain/AGENTS.md), [current handoff](brain/CURRENT_HANDOFF.md), and [governance health](brain/00_CONTROL/DASH-GOVERNANCE.md). Canonical project sources remain under `.summer/00_Docs`; generated Brain proxies and operational governance records are navigation, implementation and evidence records, not replacement authority.

The protected tag `legacy-poc-2026-09-05` preserves the complete POC history. The rebuild retains the immutable 441-artifact R3 source baseline plus three hash-pinned R5 PRD-05/06 intake artifacts, with no legacy runtime. There is deliberately no `project.godot` or runnable game yet. Do not restore POC code to make the workspace launchable.

Run the governed checks from the repository root:

```powershell
python tools/verify.py --tier build
python tools/verify.py --tier focused
python tools/verify.py --tier full
```

The R5 worktree gate passes. Publication against an exact commit completes R5 and opens only the bounded R6 Brain-to-governance pilot. R8 gameplay permission remains closed.
