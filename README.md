# Leyforge governed rebuild

R5 Branch B engineering governance is complete and certified over the clean rebuild workspace. R6 is next: a bounded Brain-to-governance operating pilot. Gameplay implementation has not begun.

Start with the [Brain home](brain/HOME.md), [agent contract](brain/AGENTS.md), [current handoff](brain/CURRENT_HANDOFF.md), and [governance health](brain/00_CONTROL/DASH-GOVERNANCE.md). Canonical project sources remain under `.summer/00_Docs`; generated Brain proxies and operational governance records are navigation, implementation and evidence records, not replacement authority.

The protected tag `legacy-poc-2026-09-05` preserves the complete POC history. The rebuild retains the immutable 441-artifact R3 source baseline plus three hash-pinned R5 PRD-05/06 intake artifacts, with no legacy runtime. There is deliberately no `project.godot` or runnable game yet. Do not restore POC code to make the workspace launchable.

Run the governed checks from the repository root:

```powershell
python tools/verify.py --tier build
python tools/verify.py --tier focused
python tools/verify.py --tier full
```

R5 implementation commit `f9ea015a90706b302df9846040a1fe51f02ce6f9` passed exact certification. Its evidence is `brain/10_TESTING/Evidence/r5-governance-certification.json`; the completion summary is `docs/rebuild/r5/completion-receipt.json`. The active handoff opens only R6. R8 gameplay permission remains closed.
