# R3 clean workspace

**Work:** WORK-20260905-003  
**State:** R3 COMPLETE — clean baseline committed and boundary validation passed.
**Owner authorization:** Ash explicitly authorised R3 and the commands needed to complete it.  
**Source:** protected legacy POC commit `799305859bb0ba4230ef87d934e961cc21220afa`.

The isolated worktree at `D:\AI\Projects\leyforge-rebuild` preserves 441 source documents and required repository metadata. It retires 10,824 old paths from this branch, including runtime scripts/scenes, addons, assets, content/data, generated products, exports, old profiles, POC tools and implementation ledgers. The original checkout and protected archive remain intact.

The only admitted executable tool is `tools/verify_rebuild_boundary.py`, a read-only Python standard-library validator. It checks retained source identities, the active path allowlist, forbidden runtime/build artifacts and legacy-reference classification. It does not import modules from legacy code or launch Godot. No Archived Validation fixture is admitted. Existing docs/ARCHIVED content remains historical documentation.

The canonical `brain/` directories are placeholders from LF-BRAIN-05. Governance sources remain at their supplied B-ENG-GOV+B-OPS location. No operational Brain, final architecture, mass asset production, save compatibility promise or gameplay readiness is claimed.

Next: R4, implement Branch A's approved Brain metadata/navigation/record model. Do not resume the old gameplay package queue. Resolve source-status conflicts from their owning authorities; D-ROAD-02 now distinguishes the new execution update from its dated old snapshot.

Run `python tools/verify_rebuild_boundary.py`. First clean-baseline commit: `3a2cebaa76728de8b97db2c0a932ec1de1c0d420`. Evidence: `completion-receipt.json`, `leakage-result.json` and `baseline-manifest.json`. Any matching POC text in source documents is classified as source/historical citation, never an active dependency; archive-evidence matches are historical records; bootstrap/tool matches are boundary enforcement or retirement records. Anything outside the approved surfaces is a leakage defect.
