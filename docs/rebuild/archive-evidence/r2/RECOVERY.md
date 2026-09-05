# Restore the legacy POC

Archive directory: `D:\AI\Archives\Leyforge\legacy-poc-2026-09-05`.

1. Verify every entry in the archive's `SHA256SUMS.txt`, and the separate evidence checksum list, before recovery.
2. Select a new empty restore location. Do not restore over the active project or live player saves.
3. Clone `leyforge-history.bundle` with `git clone --no-checkout <bundle> <new-project>`.
4. In the clone, run `git config --local core.longpaths true` before checkout or status operations.
5. Run `git checkout --detach legacy-poc-2026-09-05`.
6. Confirm `git rev-parse HEAD` is `799305859bb0ba4230ef87d934e961cc21220afa` and `git rev-parse HEAD^{tree}` is `e78d6567ed38986fe06bd090420461d2509ba605`.
7. Run `git bundle verify <bundle>`, `git fsck --full`, and `git status --porcelain`. The recorded recovery passed with a clean status.
8. Run the restored `.summer/verification/poc_archive_isolation_probe.ps1` and `canonical_block_inventory_projection_probe.ps1` using `powershell -NoProfile -ExecutionPolicy Bypass -File <script> -ProjectPath <new-project>`. Expected counts: 28 and 140, respectively.

The `preservation/working-state.zip` retains pre-freeze working-copy bytes, including original line endings. `preservation/supplements.zip` retains selected non-Git material. Their manifests distinguish player state, safe engine, historical build and Summer history. Extract only into an isolated recovery location and check the entry hashes in `recovery-manifest.json`. Preserve the Summer bundle separately from the primary Git bundle.

Do not execute the historical packaged build, Godot 4.6.3/4.7.1, or quarantined `.exe.disabled` files. If further Godot verification is required, use the preserved fixed 4.8-dev console runner and its companion binary in an isolated writable profile. The lightweight recovery checks above require no engine launch.

The archive has known defects; recovery PASS is not a gameplay or release PASS. Do not move published archive refs. R2 remote publication and protection are verified complete as recorded in ARCHIVE-STATUS.md and publication-result.json. On GitHub the tag and archive branch block updates and deletion with no bypass actors.
