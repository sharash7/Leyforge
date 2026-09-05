# REBUILD-00 — R0 to R1 pre-archive assessment

**Execution record:** WORK-20260905-001  
**Date:** 5 September 2026  
**Owner:** Ash  
**Executor:** Codex  
**Scope:** Local pre-archive inventory, preservation, verification and freeze preparation  
**State:** R0–R1 assessment complete; freeze candidate prepared; final POC commit pending; R2 not verified  
**Gameplay rebuild permission:** Closed

## 1. Authority and permission

Ash authorised beginning R0–R1 in this task. REBUILD-00 is the active transition
procedure for this assessment, subject to its owning sources. Its document-wide
lock-candidate status and owner sign-offs have not been changed.

The assessment follows REBUILD-00 sections 06–12 and the R0→R1 checklist,
Document 25A's retirement boundary, PRD-00's authority/evidence distinction,
the certified Branch B operating contract, and the repository's Godot safety
instructions. It makes no production architecture or compatibility decision.

All project-relevant pre-existing edits are presumed valuable. The proposed
freeze scope preserves them as legacy implementation or source evidence; it
does not admit their implementation into the future rebuild. Local capture
and verification are authorised. Staging, committing, tagging, pushing,
destructive cleanup and owner certification are separate actions.

## 2. Identified working-state baseline

| Field | Observed value |
|---|---|
| Repository | `D:\AI\Projects\leyforge` |
| Pre-archive branch | `main` |
| HEAD | `57c1a2a732cbe94dd6dd7f38db0466ab54f564f1` |
| HEAD date/message | 10 August 2026, 19:42:48 +08:00; `Manual Commit` |
| Primary remote | `https://github.com/sharash7/Leyforge.git` |
| Live remote observation | `main` points to the same SHA; no remote tags returned |
| Local branches/tags | `main` only; no local tags |
| Tracked paths | 10,917 |
| Initial dirty state | 71 modified tracked paths; 83 tracked deletions; 343 untracked paths |
| Staged changes | None |
| Shallow clone / submodules / LFS configuration | No / none in index / no LFS filters in the repository attributes; no LFS payload admission is proposed |
| Current save envelope | v18 |
| Current worldgen / regional plan | v5 / v3; regional-worldgen v4 compatibility retained |
| Forge presentation persistence | Internal v17, distinct from the world-save envelope |
| Registry | 312 serialized records: 143 blocks, 162 items, 7 retired aliases |
| Settlement catalogue | 120 definitions, blueprints and projects; 25 packs |
| Final POC commit / tag | Not created |

The initial state was captured between 07:51:32 and 07:54:08 UTC on 5 September.
The capture excludes this assessment's own output directory. Exact paths,
hashes, dispositions and original Git blob IDs are in
[file-inventory.json](2026-09-05/file-inventory.json) and its CSV view.

All 83 deleted tracked documents have current content matches after CRLF/LF
normalisation. Their original blobs remain in Git and their deletion changes
are recorded in the local binary patch. See
[deleted-document-reconciliation.json](2026-09-05/deleted-document-reconciliation.json).
This proves the observed relocation of their contents; it does not promote
duplicate manifests or historical copies into independent authority.

## 3. Local preservation completed

| Material | Treatment |
|---|---|
| Current source, generated POC products, docs and tracked historical fixtures | 11,172 files / 240,046,550 bytes captured in an immutable local ZIP and an initially matching verification project |
| Integrity of the ZIP | ZIP CRC plus every entry's SHA-256 verified; source hashes rechecked after capture with no drift |
| Dirty Git changes | Byte-preserving binary/full-index unstaged and staged patches captured; no index mutation |
| Player state | 80 files / 18,269,852 bytes copied from Leyforge's default user-data directory, including 11 `world.json` files; original before/after and copy hashes match |
| Fixed Godot toolchain | Both companion executables and provenance README copied and hashed |
| Historical packaged POC | July `build/Leyforge.exe` and `.pck` copied and hashed; no launch |
| Forge rotation backups | Ignored `.previous.bak` recovery files deliberately copied |
| Older diagnostic fixtures | Selected Stage B profiles, safe-runner validation profile and both Godot shutdown-fix patches copied |
| Historical agent plans | Four `.trae` planning records copied as historical evidence |
| Summer Engine local history | Three `refs/gitsummer/...` references captured in a verified local Git bundle |

Capture root: `D:\AI\Projects\leyforge\.local\r01-20260905`.
The immutable `working-state.zip` is distinct from the `p/` verification copy,
which is allowed to generate imports, fixtures and captures during testing.

The local Summer Git store is bare and its `main` is unborn; its useful history
is in its three custom refs. A primary-repository bundle alone would omit it.
Its refs were unchanged across this capture. This bundle is a supplemental
history record, not REBUILD-00's final primary archive.

GPU caches, local Summer Engine settings and `.vscode/settings.json` were not
admitted to the capture. The VS Code setting points to a separate Summer editor
installation; it is not a verified automation runner. Other ignored caches,
old diagnostic project copies, quarantined engines and disposable historical
workspaces are inventoried and retained in place pending R2 disposition.

**These are local safety captures inside the active working copy. They are not
the independent cold recovery artifact required for R2.** No archive reference,
remote protection, final archive restore or archive sign-off is asserted.

## 4. Toolchain and historical evidence

The verified automation engine is `4.8.dev.custom_build.a9c94cd21`, source commit
`a9c94cd21fc1e95c56a17aca0b310c346e6c41fa`. Both executable hashes match the
adjacent provenance README. Automation uses the console wrapper and its required
editor companion. The custom build omits AccessKit and Direct3D 12, as recorded
by its existing provenance, while retaining headless/OpenGL/Vulkan support.

Gates run with Windows PowerShell 5.1, `-NoProfile -ExecutionPolicy Bypass`, the
fixed console runner, an isolated writable project and explicit profile roots.
The capture tools use Python 3.9.5 standard-library modules. The project-owned
Forge editor plugin declares v0.1.0. No native voxel GDExtension or submodule
is identified in the captured index; PRD technology research is not evidence
that such a dependency exists in this POC.

The POC Manual Testing Guide is preserved byte-for-byte in the source capture.
Its own header is version 0.3, dated 28 July, despite the `_v0_1` filename, and
describes save v17 / regional plan v4. The July packaged benchmark identifies
save v13 / worldgen v2 / Godot 4.6.3. The two current build files match that
historical benchmark's hashes. These are historical facts, not current-run
or final-commit qualification. The historical 4.6.3 package was not executed.

The legacy production roadmap records 58 scenes / 20,078 checks, 256 worldgen
seeds and 10,000 Forge structure seeds. That record is preserved as a previous
claim. Current verification is recorded independently below.

## 5. Source and programme reconciliation

| Source | Local evidence and treatment |
|---|---|
| Branch A | LF-BRAIN-01–13, lock register and README present; all 15 checksum entries match. Design locked; operational Brain absent. |
| Branch B | All 23 individual ENG-GOV/B-OPS sources match the certified manifest. Bootstrap certification is a design/operating baseline, not evidence of installed enforcement. |
| PRD-00–04 | All five current source hashes match. PRD-00 is FINAL/CLOSED; PRD-01–04 are closure candidates. |
| PRD-05 | REBUILD-00 declares an active workstream; no local PRD-05 file was found under `.summer`. Source location remains unresolved, not inferred as not started. |
| Branch C | C-AUD-00–11 framework files are present; REBUILD-00 reports theoretical completion. No global audit execution/certification is claimed by this assessment. |
| Branch D | D-ROAD-02 is dated 30 August and still reports B-OPS-05 and PRD-01-next. Its freshness rule requires reconciliation before consequential roadmap decisions. |
| REBUILD-00 | User authorised this assessment; document remains a lock candidate with later execution/sign-off fields open. |

This table is an execution crosswalk. It does not silently amend the owning
source records or fabricate missing PRD, FCC, audit or architecture closure.
Branch D's live register needs a separately traceable current-state refresh
using the owning evidence. The old gameplay package queue is historical
implementation context for this transition.

## 6. Verification and defects

The unchanged current regression gate imported the captured project and then
stopped at `phase8_ui_learning_probe`: the village overview omitted explicit
non-colour permission reasons. The official gate result is **FAIL**.

A diagnostic continuation runs the remaining original scene list serially and
checks the original exact check counts, structured results, process exit and
blocking diagnostics. It did not edit the gate, retry away failures or turn
the official failure into a pass. The continuation completed on 5 September
at 16:33:36 +08:00. All 58 original scenes have an execution record:

- **48 strict gate passes; 10 strict gate failures.**
- **20,112 reported checks**, with the menu probe failing before a structured
  result. The current gate pins 20,115 checks; the older roadmap's 20,078 is
  historical and does not describe this captured gate.
- Four scenes have assertion failures; five have check-count mismatches;
  one has a script error and no structured result.

| Failed scene | Recorded limitation |
|---|---|
| `phase8_ui_learning_probe` | Village overview lacks explicit non-colour permission reasons. |
| `npc_runtime_probe` | Builder does not reach its authored work target, performs an unauthorised jump and places no visible project block. |
| `forge_mvp_probe` | Route catalogue guide coverage is incomplete. |
| `forge_end_to_end_probe` | Deterministic end-to-end hash differs from the expected value. |
| `main_menu_probe` | Null-instance `process_frame` access at probe line 90; no structured result. This is a probe execution failure, not a proven general menu-startup failure. |
| `phase7_stabilization_probe` | Clean payload: 34 checks; gate expects 30. |
| `phase4_save_probe` | Clean payload: 40 checks; gate expects 39. |
| `creative_menu_probe` | Clean payload: 15 checks; gate expects 11. |
| `settlement_project_probe` | Clean payload: 76 checks; gate expects 73. |
| `stageb_living_settlement_probe` | Clean payload: 546 checks; gate expects 534. |

See [verification-summary.json](2026-09-05/verification-summary.json) for
every scene, assertion, count, process exit, diagnostic and underlying log.

The save probe already reports 40 checks and 8 migration checks, no failures,
save v18 and clean exit. The gate expects 39 checks, so this is a gate-count
mismatch despite a successful probe payload. The same distinction is retained
for all diagnostic results. The save-coordinator probe passed 156 checks and
16 migration steps; world lifecycle passed 54 checks. These are synthetic
verification results, not claims that all 11 captured player worlds were loaded.

The seven legacy static checks were run independently in read-only/check mode:

- Requirement ledger: **FAIL**, conflicting `PACKAGE-27-30-MANIFEST` identity.
- Root document checksum manifest: **FAIL**, stale against the present corpus.
- Implementation coverage and production roadmap freshness: **PASS**.
- Legacy document governance: **PASS**, 831 checks against its declared baseline.
- POC archive isolation: **PASS**, 28 checks.
- Canonical block projection: **PASS**, 140 checks.

The legacy governance pass covers its declared 137 primary/164 manifest-document
baseline; it does not certify the entire newly supplied corpus. All 43 separate
Branch A/B/PRD bundle hash checks pass. `git diff --check` on the pre-existing
tracked changes passes. `git fsck --full --no-reflogs` exits 0; dangling objects,
four orphan pack indexes and temporary-object garbage are recorded without
pruning or repairing Git. R2 must still prove exact recovery from its final
independent artifact.

**Manual smoke disposition: NOT RERUN.** Interactive owner smoke/feel acceptance
has not been performed by this agent. This bounded archival assessment already
has fresh automated runtime/save/recovery evidence and known failures; additional
rendered or interactive qualification is deferred rather than spending further
verification time on a POC being retired. Historical captures are preserved.
This is an explicit non-rerun record under REBUILD-00 sections 06.2 and 10.1,
not manual acceptance, a waiver, or a passing release claim. No test here
is labelled as a rerun against a final POC commit, because that commit does not
yet exist. POC defects remain preserved; there is no feature-development or
green-baseline repair scope in this assessment.

## 7. Freeze candidate and next boundary

The proposed final POC scope preserves all 71 initial tracked modifications,
all 83 verified document relocations/deletions and the project-relevant new
source/docs/probes/assets. Historical `.trae` records and atomic-save temporary
files belong in the recovery supplement; machine-local VS Code configuration
is inventory-only. The [freeze candidate](2026-09-05/freeze-candidate.csv)
contains all 497 initial dirty paths: **489 proposed for the final POC commit**
(406 added/modified paths plus 83 deletions), seven supplement-only paths and
one inventory-only setting. This assessment's operational evidence is a separate
explicit addition, listed in `2026-09-05/evidence-files.json` and covered by
`SHA256SUMS.txt`. Player-state bytes, engine binaries, ZIPs and local bundles
remain in ignored local preservation storage and are not proposed Git additions.

No old source, tracked fixture or generated POC product is removed by this
assessment. Retaining these in the final historical POC commit does not admit
them to the future active rebuild. Existing untracked material is reviewed
without staging the whole workspace indiscriminately.

The post-verification source check found no unexpected changes to pre-existing
files. The only deliberate later source-document edit is the REBUILD-00 execution
annotation; its original remains in the captured ZIP. No gameplay source was edited.

Remaining R1 closure action:

Review the explicit freeze scope and authorise the local final POC commit,
then verify the resulting tree against that scope. The proposed task branch is
`codex/chore/rebuild-00-freeze`; no branch switch, staging or commit has occurred.
No additional external locations have been supplied by the owner; this inventory
covers the workspace and the verified default Leyforge user-data location.
Additional locations, if later supplied, require an explicit supplement.

The first failed disposable capture is retained under
`.local/rebuild-r01-20260905/`; it is not the verified capture. A combined
finalisation/cleanup command was rejected when the automatic approval reviewer
hit a usage limit. That command did not execute. Cleanup is unnecessary for R1
and has not been retried. The verified capture remains `.local/r01-20260905/`.

R2 then needs the governed final tag/reference, remote confirmation and any
required protection, an independent cold archive outside the active working
copy, a SHA-256 record and an exact-reference restore test. No destructive
transition or Brain implementation starts before that gate.
