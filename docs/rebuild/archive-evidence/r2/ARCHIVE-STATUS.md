# REBUILD-00 R2 archive execution

**Date:** 5 September 2026  
**Work record:** WORK-20260905-002  
**Executor:** Codex, following Ash's request to continue  
**State:** R2 Archive Verified — PASS. Local cold recovery, remote publication and exact-reference protection are complete. R3 workspace work has not begun; R8 gameplay permission remains closed.

The final POC commit is `799305859bb0ba4230ef87d934e961cc21220afa`, tree `e78d6567ed38986fe06bd090420461d2509ba605`. The previous R0–R1 assessment records the precommit state; the freeze receipt and this execution record close that pending local commit action without rewriting the historical commit.

## Completed archive work

- Annotated local tag: `legacy-poc-2026-09-05`, tag object `de23f72ba5419b899f059e21fc21cce5315e2ab9`.
- Local archive branch: `codex/chore/rebuild-00-archive`, pointing to the exact final POC commit.
- Independent directory: `D:\AI\Archives\Leyforge\legacy-poc-2026-09-05`.
- Complete Git history: `leyforge-history.bundle`, verified with Git; no prerequisites. Includes all source repository refs present at creation, including the Codex capture ref.
- Bundle SHA-256: `5c763489196d34fd31d25ef703da52097179858eb440f3168228ee3e6ac8a272`.
- Original working-state ZIP, patches, freeze receipt and operational manifests copied byte-for-byte.
- Supplemental ZIP: 184 entries, including 80 player-state files, safe toolchain, historical build, recoverability fixtures, historical plans and the separate Summer Git-history bundle. All entry hashes verified against source copies and applicable R1 inventories.
- Cold restore: `D:\AI\Archives\Leyforge\restore-test-20260905`.
- Exact commit, tree and annotated tag verified; `git fsck --full` passed; no alternate object-store dependency; restored tracked/untracked status clean.
- Original source ZIP CRC verified across 11,172 entries. All 184 supplemental files extracted and verified. Summer bundle verification passed.
- Restored repository checks: archive isolation **28/28 PASS**; canonical Block/Item projection **140/140 PASS**.

Evidence: [recovery result](recovery-result.json), [bundle verification](bundle-verify.log), [Git health](fsck.log), [archive isolation](poc_archive_isolation_probe.log), [canonical projection](canonical_block_inventory_projection_probe.log), [freeze receipt](freeze-commit-receipt.json).

## Recovery requirements and limitations

The initial restore used long-path support for checkout but not later Git commands. Git then reported nine deeply nested historical fixture files as missing because their names exceeded the Windows path limit. Setting `git config --local core.longpaths true` in the disposable clone resolved this; the files and Git objects were intact. The initial diagnostic is preserved in `tracked-diff-before-longpaths.log`. Future recovery must retain this local setting.

Git normalizes text line endings. The committed R1 SHA256SUMS describes original working-copy bytes, not necessarily bytes from a normalized Git checkout. Use the original ZIP for byte-preserving recovery; use the recorded commit/tree and Git integrity checks for source checkout verification.

This archive is outside the active working copy but on the same D: drive. It does not provide off-device or off-site protection. The historical build is retained as evidence and was not launched. Only the fixed Godot 4.8 development runner is permitted for any future automation.

Cold recovery success does not erase the frozen baseline's defects: prior runtime verification remains **48 passes / 10 failures across 58 scenes**; two legacy static gates failed. Manual smoke was not rerun. No gameplay fixes, active-project cleanup, production admission or owner certification occurred.

## Completed remote publication and protection

Destination: `https://github.com/sharash7/Leyforge.git` (existing public repository).

Following Ash's explicit GitHub authorization, these refs were published atomically, without force or any update to main:

1. `refs/tags/legacy-poc-2026-09-05` (annotated tag targeting the final POC SHA).
2. `refs/heads/codex/chore/rebuild-00-archive` (same SHA).

Both remote refs were read back and match the recorded tag object and final POC commit. Remote main remains `57c1a2a732cbe94dd6dd7f38db0466ab54f564f1`.

Two exact-ref GitHub rulesets are active, block updates and deletion, and contain no bypass actors. The complete configurations were read back; effective branch rules were checked independently:

- Tag: [ruleset 22329948](https://github.com/sharash7/Leyforge/rules/22329948).
- Archive branch: [ruleset 22329949](https://github.com/sharash7/Leyforge/rules/22329949).

Evidence: [publication result](publication-result.json), [remote refs](remote-refs.txt), [protection configurations](remote-protection.json), [effective branch rules](effective-branch-rules.json).

The earlier approval-review rejection was resolved by Ash's explicit GitHub authorization. The authorized operation then succeeded. Local preservation ZIPs and their externally captured player-state bytes were not uploaded. Existing historical tracked fixtures remain part of the deliberately frozen Git history.

R2's prerequisite for the clean workspace phase is satisfied. No cleanup, mainline integration or gameplay rebuild authorization is implied. A second-device copy remains optional additional resilience beyond the required outside-working-copy archive.
