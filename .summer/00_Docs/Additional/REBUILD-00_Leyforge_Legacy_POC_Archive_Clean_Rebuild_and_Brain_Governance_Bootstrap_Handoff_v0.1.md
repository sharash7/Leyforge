# Leyforge Rebuild Transition

## REBUILD-00 — Legacy POC Archive, Clean Rebuild & Brain/Governance Bootstrap Handoff

**Document ID:** REBUILD-00  
**Title:** Leyforge Legacy POC Archive, Clean Rebuild & Brain/Governance Bootstrap Handoff  
**Version:** v0.1  
**Date:** 5 September 2026  
**Status:** **LOCK CANDIDATE — READY FOR OWNER REVIEW AND EXECUTION**  
**Project:** Leyforge  
**Product context:** Ley Realms / The Forge  
**Project Lead and Final Authority:** Ash  
**Document class:** One-time transition control, execution gate and handoff record  
**Primary purpose:** Retire and preserve the legacy POC; establish a clean active rebuild workspace; activate the Project Brain and certified engineering-governance system; prove the Brain↔Governance operating model before production gameplay redevelopment resumes.  

**Primary upstream authorities and evidence:**

- Document 25A — Post-Atlas Production Governance, POC Retirement Baseline and Decision Register;
- Branch A — Project Brain / Obsidian corpus;
- Branch B — ENG-GOV-00 through ENG-GOV-15 and B-OPS-00 through B-OPS-06;
- Branch C — C-AUD-00 through C-AUD-11 audit/certification framework;
- Branch D — pre-rebuild roadmap and rebuild-readiness controls;
- PRD programme, including the current PRD-00 through PRD-05 state and later PRD-06 through PRD-09 closure gates;
- ART corpus where legacy POC presentation assets or evidence are involved;
- Leyforge POC Manual Testing Guide and associated historical POC verification evidence;
- current authoritative Leyforge design/content/FCC/registry sources as resolved by the source and authority registers.

---

# 00. Executive Transition Statement

Leyforge has reached the point where the original proof-of-concept implementation must stop functioning as the active project baseline.

The POC proved that many important Leyforge capabilities could be connected in one playable environment. It also accumulated demonstration identities, fixed arrangements, temporary implementation choices, prototype visual values, old technical assumptions and code structures that must not silently become the architecture of the production rebuild.

REBUILD-00 therefore performs one controlled transition:

> **Preserve the old Leyforge POC completely enough that it can be recovered, studied and regression-tested; remove it from active production authority; create a clean active rebuild workspace; implement the Project Brain and certified engineering governance inside that workspace; prove that those systems can control real project work; and only then continue toward the later technical-canon and gameplay-rebuild gates.**

This document deliberately separates two permissions that must never be confused:

1. **Archive and bootstrap permission** — permission to freeze the POC, create the clean active workspace, implement the Brain, implement engineering governance, establish repository/CI/validation foundations and run the Brain↔Governance pilot.
2. **Production gameplay rebuild permission** — permission to begin rebuilding Leyforge gameplay/runtime systems against the final production architecture.

REBUILD-00 can complete the first permission while the second remains closed.

The pre-rebuild research and technical programme remains authoritative for the second permission. The clean repository is therefore a **controlled foundation**, not evidence that unresolved PRD, prototype, LFE, FORGE-ENG, audit or readiness gates may be skipped.

---

# 01. Why REBUILD-00 Exists

Leyforge already has policy describing POC retirement, engineering governance, Project Brain behaviour, audit methodology and pre-rebuild gating. What was still missing was a single operational instrument that says exactly how the project crosses from the legacy implementation into the controlled rebuild environment.

REBUILD-00 exists to prevent the following failure modes:

1. deleting or rewriting the POC before a verified archive exists;
2. carrying legacy code into the rebuild simply because it already works;
3. allowing archived POC names, registries, fixed world arrangements or technical assumptions to leak back into production;
4. creating a new repository or branch without preserving traceable history;
5. allowing the Project Brain to become a competing source of truth;
6. installing governance documents without actually activating their enforcement, logging, ADR, testing and agent-control mechanisms;
7. letting Codex or another coding agent begin broad gameplay implementation before the research/architecture gates close;
8. losing useful tests, fixtures, saves, screenshots, benchmark evidence or discovered engineering techniques from the POC;
9. preserving the POC so aggressively that production becomes permanently obligated to support POC-only saves or identities;
10. mistaking “clean tree” for “production architecture approved.”

REBUILD-00 is therefore a **bridge document**, not a new permanent design corpus.

---

# 02. Authority Boundary

## 02.1 REBUILD-00 owns

REBUILD-00 owns the one-time operational transition for:

- identifying the exact final legacy POC baseline;
- freezing and preserving that baseline;
- creating verifiable archive references and cold recovery evidence;
- classifying legacy material for archive, fixture, reuse, replacement or deletion;
- establishing the clean active rebuild workspace;
- defining the no-legacy-leakage boundary;
- activating the Project Brain in the repository;
- activating Branch B engineering governance and its operational surfaces;
- defining the Brain↔Governance bootstrap pilot;
- recording the transition evidence and sign-off;
- defining when the archive/bootstrap phase is complete;
- explicitly keeping the production gameplay rebuild gate closed until its separate prerequisites are satisfied.

## 02.2 REBUILD-00 does not own

REBUILD-00 does **not** redefine:

- gameplay canon;
- world, realm, biome, ecology, creature, civilisation, item or material canon;
- final registry semantics;
- final save architecture;
- final worldgen architecture;
- final networking architecture;
- final voxel-engine ownership boundaries;
- LFE architecture;
- FORGE-ENG architecture;
- ART authority;
- ENG-GOV engineering law;
- B-OPS enforcement semantics;
- Project Brain architecture beyond executing the already-approved Branch A design;
- C-AUD audit/certification methodology;
- Branch D rebuild-readiness authority;
- unresolved PRD research decisions.

Where REBUILD-00 conflicts with an owning authority, the owning authority wins and REBUILD-00 must be amended rather than silently overriding it.

---

# 03. Current Programme Position at REBUILD-00 Creation

At the creation of this v0.1 document, the controlled programme state is:

- Project Brain / Branch A theoretical design: complete;
- Engineering Governance / Branch B: certified for rebuild bootstrap;
- Branch C audit framework: complete as the theoretical C-AUD-00 through C-AUD-11 framework; mass audit execution remains future work;
- Branch D rebuild/readiness programme: established;
- PRD-00: FINAL / CLOSED;
- PRD-01: CLOSURE CANDIDATE;
- PRD-02: CLOSURE CANDIDATE;
- PRD-03: CLOSURE CANDIDATE;
- PRD-04: CLOSURE CANDIDATE;
- PRD-05: active research-evidence crosswalk workstream;
- later PRD risk/proof/prototype/ADR/closure work remains ahead;
- the old POC is still the legacy implementation being retired;
- the ART production corpus is available as downstream art-production authority and explicitly treats POC visuals as historical/implementation evidence rather than automatic final-art authority.

This means **archive + Brain/governance bootstrap may proceed**, while broad production gameplay redevelopment remains gated.

---

# 04. Core Transition Laws

## REBUILD-C01 — Archive before destructive change

No deletion, large-scale cleanup, history rewrite or active-tree replacement may occur until the exact legacy POC state has a verified recoverable archive.

## REBUILD-C02 — Preserve Git history

The normal transition retains repository history. A clean active rebuild tree does not require destroying or orphaning the historical lineage.

Any later proposal to rewrite history or use an orphan production root requires explicit engineering-governance approval and an ADR where required.

## REBUILD-C03 — Historical evidence is not production authority

Legacy POC code, POC test guides, screenshots, saves, registry values, visual placeholders and implementation notes may remain excellent evidence. They do not become active production authority merely because they are preserved.

## REBUILD-C04 — No hidden POC dependency

Normal production configuration must not require retired POC identities, fixed arrangements, archive-only scenes, archive-only registries, POC saves or POC-specific fallback branches.

## REBUILD-C05 — Bootstrap does not authorise gameplay rebuild

The archive, clean workspace, Brain implementation and governance implementation may proceed before the final production gameplay rebuild gate.

No one may interpret completion of those activities as permission to bypass unfinished PRD, prototype, LFE, FORGE-ENG, audit or readiness requirements.

## REBUILD-C06 — Brain indexes authority; it does not become authority

The Project Brain may index, summarise, cross-link, report status and expose relationships. When a Brain summary conflicts with an owning source, the owning source wins.

## REBUILD-C07 — Governance must be operational, not decorative

Copying ENG-GOV/B-OPS Markdown files into the repository is not governance activation. Required work logs, coding-agent bootstrap, ADR/exception procedures, templates, enforcement hooks, validators, CI/quality gates, debt tracking and Brain interface behaviour must be operationally instantiated to the extent required by the certified Branch B bootstrap.

## REBUILD-C08 — Legacy reuse is admitted, never assumed

Anything reintroduced from the POC must pass the legacy-admission process in this document and the owning production authorities.

## REBUILD-C09 — Preserve useful verification evidence

Tests, benchmark baselines, regression fixtures, representative saves and manual acceptance evidence with continuing diagnostic value must not be discarded simply because the implementation is retired.

## REBUILD-C10 — POC save compatibility is not a permanent production promise

The production save epoch begins with the approved production save architecture. POC saves may remain recoverable through the archived build or dedicated tooling without imposing indefinite compatibility obligations on the rebuilt game.

## REBUILD-C11 — No silent architecture selection during bootstrap

Repository structure, dependency setup, initial interfaces and tooling established during bootstrap must not resolve open PRD/LFE/FORGE-ENG architecture questions by accident.

When a bootstrap choice would materially constrain the future architecture, work must stop at the appropriate boundary and route the decision through the owning authority/ADR process.

## REBUILD-C12 — Every irreversible step requires evidence

Destructive cleanup, branch retirement, archive pruning and replacement of old files require recorded evidence that recovery exists and dependencies have been checked.

---

# 05. Transition State Model

REBUILD-00 uses the following states.

| State | Meaning | Gameplay rebuild permission |
|---|---|---|
| **R0 — Prepared** | REBUILD-00 exists; no destructive action has occurred. | Closed |
| **R1 — POC Freeze Candidate** | Final working state identified; outstanding local material captured; verification evidence gathered. | Closed |
| **R2 — Archive Verified** | Final POC Git reference and independent recovery artifact verified. | Closed |
| **R3 — Clean Bootstrap Workspace** | Active rebuild line exists with legacy implementation removed from the active tree and authoritative docs retained. | Closed |
| **R4 — Brain Operational** | Branch A Project Brain is instantiated and can resolve project authority/status/provenance. | Closed |
| **R5 — Governance Operational** | ENG-GOV/B-OPS operational surfaces are active and enforceable. | Closed |
| **R6 — Brain↔Governance Pilot Passed** | Representative tasks prove the operating model. | Closed |
| **R7 — Pre-Rebuild Technical Programme** | PRD/LFE/FORGE-ENG/prototype/audit work proceeds in the controlled environment. | Closed |
| **R8 — Gameplay Rebuild Authorised** | Separate final rebuild-readiness authority confirms all required gates. | Open |

REBUILD-00 directly executes R0 through R6 and records the handoff into R7.

R8 is **not granted by REBUILD-00 alone**.

---

# 06. Final Legacy POC Baseline Record

Before archive creation, record the exact state being retired.

## 06.1 Required baseline fields

```yaml
legacy_poc_baseline:
  repository: ""
  primary_remote: ""
  pre_archive_branch: ""
  final_commit_sha: ""
  final_commit_date: ""
  final_commit_message: ""
  final_tag: ""
  archive_branch: ""
  engine_version: ""
  voxel_plugin_or_engine_extensions: []
  toolchain_versions: []
  save_version: ""
  worldgen_version: ""
  regional_plan_version: ""
  registry_versions: []
  content_pack_versions: []
  test_gate_command: ""
  test_gate_result: ""
  manual_test_result: ""
  known_blockers: []
  known_non_blocking_defects: []
  final_build_artifact: ""
  final_build_hash: ""
  recorded_by: ""
  recorded_at: ""
```

## 06.2 Baseline evidence rule

The existing POC Manual Testing Guide is historical evidence and must be preserved with the archive. It records extensive connected-system coverage, release-candidate testing, save/recovery behaviour, worldgen/settlement verification, map/UI behaviour, visual test infrastructure and historical automated gate results.

Those recorded historical results must not be falsely described as the final archive commit unless they are rerun or otherwise shown to apply to that exact commit.

The execution record must distinguish:

- **historical evidence already available**;
- **verification rerun against the final archive commit**;
- **verification intentionally not rerun**, with reason.

---

# 07. Pre-Archive Inventory

Before freezing the final POC commit, inspect the working environment for material that Git alone may not capture.

At minimum record:

- tracked source files;
- untracked but project-relevant files;
- ignored but required local configuration examples;
- Git LFS state if used;
- Git submodules if used;
- external tools/scripts required to reproduce tests;
- engine/plugin dependency versions;
- local-only generated registries that contain useful evidence;
- test fixtures;
- representative saves;
- benchmark outputs;
- screenshots and captures used for acceptance evidence;
- build/export configuration;
- archive-worthy release packages;
- documentation referenced by tests or migration tools;
- known environment assumptions that would make the archive difficult to run later.

Secrets, personal credentials, tokens, machine-specific sensitive data and unnecessary local caches must **not** be added merely to make the archive complete.

---

# 08. Archive Architecture

The legacy preservation model has two distinct layers.

## 08.1 Layer A — Full repository-history archive

This is the recoverable historical project state.

It must include:

- the final POC commit;
- an immutable or protected tag identifying that commit;
- a protected archive branch or equivalent historical reference if required by repository policy;
- complete Git history sufficient to recover the POC source state;
- a cold recovery artifact such as a Git bundle or equivalent repository backup;
- a hash/verification record for the cold recovery artifact.

The exact Git reference naming must obey ENG-GOV Git conventions. Example intent names such as `pre-rebuild-legacy`, `archive/legacy-poc` and `rebuild/v1` are descriptive only unless they comply with the active governance naming standard.

## 08.2 Layer B — Archived Validation material

Document 25A establishes a protected, non-shipping Archived Validation concept for selected POC fixtures and evidence.

The active rebuild does **not** copy the whole legacy implementation back into itself as an “archive pack.” Instead, only deliberately selected regression/migration material may later enter a non-shipping Archived Validation area according to the governing registry/package/test authorities.

Examples may include:

- representative old saves;
- deterministic seed fixtures;
- expected serialized payloads;
- selected old scenes used purely for compatibility tests;
- screenshots or golden reference captures;
- regression sequences;
- old IDs needed by migration/tombstone tests.

Archived Validation material must never become a hidden runtime dependency.

---

# 09. POC Retirement Classification

Every legacy element considered for movement into the new active workspace must be classified before admission.

The classification model inherits Document 25A:

| Classification | Meaning | REBUILD-00 treatment |
|---|---|---|
| **Retired Identity** | POC-specific named person, place, event, project, structure, reward, portal or arrangement. | Archive only. No normal production dependency. |
| **Reusable Mechanic** | General behaviour proved by the POC. | Requirement/lesson may survive; production implementation is re-derived against current authority. |
| **Reusable Asset** | Presentation asset potentially useful outside the POC identity. | Requires current identity, provenance, ART/Forge and registry admission before reuse. |
| **Regression Fixture** | Scene, seed, save, expected payload or sequence useful for detecting breakage. | May enter protected non-shipping validation storage. |
| **Obsolete Implementation** | Hardcoded branch, coordinate, enum, shortcut or architecture tied to the POC. | Do not reintroduce. Preserve evidence/test only where useful. |
| **Historical Documentation** | Old guide, screenshot, build note, implementation write-up. | Preserve as history; never treat as active authority. |

## 09.1 Retirement log template

```yaml
legacy_retirement_record:
  record_id: ""
  old_name_or_id: ""
  old_path: ""
  source_commit: ""
  classification: ""
  disposition: ""
  proposed_replacement: ""
  governing_authority: []
  dependency_impact: []
  validation_evidence: []
  owner: ""
  status: "OPEN | IN_PROGRESS | VERIFIED | DEFERRED | BLOCKED"
```

---

# 10. Final POC Verification Before Freeze

The archive must preserve an understood state, not merely whatever happened to be on disk.

Before the final POC freeze, perform the strongest practical verification that does not require new feature development.

## 10.1 Minimum verification

- working tree state recorded;
- build/startup state recorded;
- current automated regression entry point executed where practicable;
- fast smoke test performed where practicable;
- representative save/load verified;
- known blocking failures recorded;
- historical testing evidence linked;
- final registry/content counts recorded where useful;
- engine/toolchain version recorded;
- final build/export state recorded if a runnable package is being preserved.

## 10.2 No fake green baseline

A final archive may still be created if the POC has known defects.

The requirement is **truthful preservation**, not manufacturing a perfect final score.

If a test is failing:

- record the failure;
- preserve reproduction evidence;
- do not spend rebuild time fixing a POC-only defect unless the defect prevents useful archival recovery;
- do not label the archive “fully passing.”

---

# 11. Git Freeze Procedure

Exact command syntax may be adjusted to local Git tooling and ENG-GOV rules, but the following outcomes are mandatory.

## 11.1 Record current repository state

Record:

- current branch;
- current HEAD SHA;
- configured remotes;
- working-tree status;
- untracked project-relevant material disposition;
- submodule/LFS state where applicable.

## 11.2 Create final legacy commit if needed

If archive-worthy changes exist outside version control, classify and commit the appropriate material before creating the final legacy reference.

Do not add temporary caches, secrets or irrelevant machine-local files merely to obtain a clean status.

## 11.3 Create immutable historical reference

Create an annotated/protected tag or equivalent governed reference pointing to the exact final legacy POC commit.

Record:

- tag name;
- target SHA;
- annotation/message;
- creation date;
- creator;
- remote push result.

## 11.4 Create protected archive line if required

Create the governed archive branch/reference required by repository policy and push it to the remote.

The archive line is frozen except for explicitly authorised archival metadata corrections.

## 11.5 Create independent cold recovery artifact

Create a complete repository recovery artifact, preferably a Git bundle or governance-approved equivalent, and store it outside the active working copy.

Record a SHA-256 or equivalent integrity hash.

## 11.6 Verify recovery

The archive is **not verified** merely because the files were copied.

In a separate disposable location:

- validate the cold artifact;
- restore/clone from it;
- checkout the final POC tag;
- confirm the expected HEAD SHA;
- inspect representative required files;
- run at least a lightweight repository/build validation if practical.

No destructive transition begins until this verification passes or an explicit approved exception exists.

---

# 12. Archive Evidence Manifest

The archive record should include or point to the following evidence.

| Evidence | Required |
|---|---:|
| Final commit SHA | Yes |
| Final historical tag/reference | Yes |
| Archive branch/reference | As required by Git governance |
| Remote confirmation | Yes |
| Cold recovery artifact | Yes |
| Cold artifact hash | Yes |
| Recovery verification result | Yes |
| POC Manual Testing Guide | Yes |
| Final/representative automated test result | Yes where practicable |
| Manual smoke result | Yes where practicable |
| Known failure/limitation register | Yes |
| Engine/plugin/toolchain versions | Yes |
| Representative saves/fixtures | Yes where diagnostically useful |
| Relevant screenshots/captures | Recommended |
| Final executable/package | Recommended where reproducible and legally/technically practical |
| Registry snapshot(s) | Yes where useful for migration/history |
| Legacy retirement log | Begins at archive and remains available during controlled migration |

---

# 13. Clean Active Rebuild Workspace

After R2 — Archive Verified, create the active rebuild line.

## 13.1 History continuity

The normal preferred model is:

> **branch from the verified historical lineage, then make branch-local cleanup commits that remove the retired implementation from the active tree.**

This preserves traceability while giving the active rebuild a genuinely clean working tree.

## 13.2 What remains active

The clean workspace retains or receives the authoritative material required for controlled work, including as applicable:

- canonical/current project documentation;
- authority/source registers;
- PRD programme material;
- Project Brain implementation;
- ENG-GOV/B-OPS governance corpus;
- approved templates and governance records;
- repository metadata required by governance;
- controlled tooling/scripts needed for documentation, validation and bootstrap;
- test/validation infrastructure deliberately admitted to the rebuild;
- explicit Archived Validation fixtures admitted under the relevant authority.

## 13.3 What leaves the active runtime tree

The active rebuild must not retain legacy runtime material solely because it existed in the POC, including:

- POC-specific gameplay scenes;
- POC-specific fixed world layouts;
- retired named POC identities;
- fixed demo quest/event chains;
- POC-only registry defaults;
- prototype visual placeholders presented as final authority;
- obsolete hardcoded implementation branches;
- temporary compatibility shims that have no approved production purpose;
- generated build/cache artifacts;
- old code whose only justification is “it already works.”

This does not delete history; it removes legacy material from the **active production surface**.

---

# 14. Clean-Workspace Commit Boundary

The first active rebuild commit should be intentionally boring.

Its purpose is to establish the controlled foundation, not to begin gameplay redevelopment.

The commit should clearly identify:

- legacy implementation removed from active tree;
- authoritative documents preserved/installed;
- Brain/governance bootstrap directories established according to their owning specifications;
- no gameplay architecture claimed as final;
- no mass asset production started;
- no POC save compatibility promise created;
- current pre-rebuild programme status recorded.

Suggested semantic intent:

> **Establish clean Leyforge rebuild-bootstrap baseline after verified legacy POC archive.**

The actual commit wording must follow active Git governance.

---

# 15. Legacy Leakage Scan

After the clean active tree is created, scan for unwanted POC dependencies.

Search categories include:

- retired POC place/person/project/event names;
- old scene/resource paths;
- fixed coordinates and fixed seed branches;
- old save/schema identifiers;
- old registry IDs and aliases;
- POC-only default providers;
- archive namespace references;
- hardcoded tutorial/quest chains;
- fixed portal destination logic;
- old build/export resource lists;
- comments or test helpers that still cause runtime inclusion;
- generated files that recreate removed POC content;
- tool prompts that assume POC structures are production structures.

Each surviving reference is classified as:

- legitimate historical reference;
- legitimate Archived Validation fixture;
- current authority citation;
- required migration/tombstone evidence;
- leakage defect.

All leakage defects must be removed or explicitly governed before R3 is marked complete.

---

# 16. Project Brain Bootstrap

The Project Brain now moves from theoretical Branch A design into repository implementation.

## 16.1 Brain purpose

The Brain is the persistent operational knowledge layer that makes Leyforge locatable and governable.

It must help a human or coding agent answer questions such as:

- What is the current authority for this system?
- Which version is active?
- What supersedes what?
- Which PRD/ADR/registry/engineering document implements this requirement?
- What work happened recently?
- What is blocked?
- What reusable procedures have been discovered?
- What failures or dead ends have already been learned from?
- What evidence supports the current state?

## 16.2 Required Brain capabilities at bootstrap

Implement the already-approved Branch A structure for at least:

- authority/source navigation;
- document metadata and status;
- supersession relationships;
- system/domain maps;
- work logs;
- decisions and links to owning ADR/governance records;
- tasks/handoffs where Branch A defines them;
- Skills / Procedures / Shortcuts;
- failure/antipattern or problem/solution learning records where defined;
- change/recent-work visibility;
- Git integration and traceability;
- project status dashboards/indexes;
- links into engineering governance;
- links into PRD/FCC/ART/LFE/FORGE-ENG/current design authority;
- archive-history discoverability without treating archive content as current authority.

## 16.3 Initial corpus ingestion

Initial Brain ingestion must classify sources by authority/status rather than merely indexing text.

At minimum distinguish:

- active locked authority;
- controlled closure candidate;
- active workstream;
- superseded source;
- historical evidence;
- prototype evidence;
- external research evidence;
- future/deferred requirement;
- archived POC implementation;
- governance record;
- execution/work record.

## 16.4 Brain non-authority test

The Brain must prove that a stale or incorrect summary cannot silently override its linked owning source.

If conflicting state is detected:

1. surface the conflict;
2. prefer the owning authority;
3. mark the Brain summary/index stale;
4. repair the index/metadata;
5. record the maintenance event if required.

---

# 17. Engineering Governance Bootstrap

Branch B is already certified for rebuild bootstrap. REBUILD-00 therefore executes it rather than redesigning it.

## 17.1 Required corpus

Install/activate:

- ENG-GOV-00 through ENG-GOV-15;
- B-OPS-00 through B-OPS-06.

Branch B contains 23 controlled documents and is the engineering-law/enforcement baseline for the rebuild workspace.

## 17.2 Required operational surfaces

To the extent defined by Branch B, bootstrap must instantiate and connect:

- engineering authority/index surfaces;
- repository/module rules;
- code style/naming rules;
- Git/change-control rules;
- testing/verification rules;
- CI/quality-gate rules;
- diagnostics/logging/observability rules;
- save/schema/migration rules as governance constraints;
- registry/stable-identity rules;
- performance/benchmark rules;
- ADR handling;
- coding-agent rules;
- security/player-content boundaries;
- exception/waiver/deprecation handling;
- third-party/upstream dependency handling;
- rule-enforcement matrix;
- coding-agent bootstrap contract;
- Branch B template pack;
- Brain↔Governance interface;
- governance-debt/validator backlog;
- certification state.

## 17.3 Root coding-agent instruction surface

Create the repository-level coding-agent instruction surface required by Branch B, including the root `AGENTS.md` or its governed equivalent.

It must make clear that during R3-R7:

- agents must resolve authority before consequential work;
- archived POC code is not current architecture authority;
- open PRD/LFE/FORGE-ENG decisions may not be silently decided in code;
- required work logs/evidence must be produced;
- ADR triggers must be respected;
- governance exceptions require the proper mechanism;
- tests/validators appropriate to the task must run;
- reusable discoveries should be promoted to the Brain Skills/Procedures/Shortcuts system;
- completion may not be claimed while required gates remain unresolved.

---

# 18. Governance Bootstrap Without Premature Architecture

The clean workspace needs enough engineering infrastructure to conduct research, prototypes, documentation and controlled foundation work.

It must **not** use bootstrap as an excuse to decide unresolved production architecture.

Allowed examples include:

- repository/governance folder creation;
- documentation validation;
- authority/index validators;
- link checking;
- metadata/schema validation for the Brain itself;
- governance templates;
- work-log automation;
- CI that checks repository/governance/document health;
- dependency inventory records;
- non-gameplay research/prototype harness foundations where authorised;
- branch protections and code-review rules;
- safe local development bootstrap scripts.

Potentially premature examples include:

- choosing final world partition ownership because a folder is convenient;
- creating permanent save schemas before persistence authority is ready;
- locking a networking model before the owning PRD/LFE work;
- porting the POC voxel integration wholesale;
- defining production registries from prototype JSON values;
- treating a temporary prototype interface as the final runtime boundary.

Where uncertain, default to a reversible bootstrap boundary and route the architecture decision to its owner.

---

# 19. Brain↔Governance Interface Activation

The Brain and Branch B governance must operate as complementary layers.

## 19.1 Governance owns engineering meaning

ENG-GOV/B-OPS own engineering law, enforcement semantics, ADR/waiver/deprecation processes and engineering acceptance expectations.

## 19.2 Brain owns operational discoverability

The Brain owns navigation, status exposure, work history, cross-links and reusable knowledge capture.

## 19.3 No duplicate bureaucracy

Do not create separate Brain-native replacements for records that Branch B already governs.

The Brain should link/index those records rather than inventing parallel ADRs, waiver systems or engineering-law copies.

## 19.4 Required trace path

For consequential engineering work, the controlled environment should progressively support traceability resembling:

> **authority → requirement/PRD → technical owner (LFE/FORGE-ENG/ADR) → registry/schema/interface → implementation → automated verification → manual acceptance/certification**

Not every link exists at bootstrap. Missing links must be visible rather than fabricated.

---

# 20. Initial Governance/Brain Artifacts

The bootstrap should create only the operational artifacts required by the owning Branch A/B specifications.

Expected examples include:

- root coding-agent bootstrap instructions;
- authority index;
- current project status index;
- work-log location and first rebuild-bootstrap work log;
- Skills/Procedures/Shortcuts registry;
- ADR index and templates;
- waiver/exception/deprecation templates;
- dependency register location;
- benchmark/test register location;
- governance debt/validator backlog;
- automation hooks/checks;
- Brain↔Governance cross-links;
- archive baseline reference;
- current PRD workstream reference.

REBUILD-00 does not create a second document set for these outputs. They are implementation/operational artifacts generated under Branch A/B authority.

---

# 21. Legacy Reintroduction Gate

No legacy source, asset or system is reintroduced because it is convenient.

Every consequential reintroduction follows this decision path:

```text
Legacy element identified
        |
        v
Classify under POC retirement model
        |
        +--> Retired / obsolete ----------> Archive only
        |
        +--> Regression fixture ----------> Non-shipping validation admission
        |
        +--> Potentially reusable
                    |
                    v
Resolve current authority and requirement
                    |
                    v
Does the old solution still fit the approved architecture?
            | no                | yes / potentially
            v                   v
Re-derive / rewrite       Validate provenance, IDs,
from requirement          dependencies, tests, migration
                                |
                                v
                         Governed admission
```

## 21.1 Legacy code

Before reuse, legacy code must demonstrate:

- a still-valid requirement;
- compatibility with current architecture ownership;
- no retired identity assumptions;
- no hidden POC world/layout dependency;
- acceptable dependency/licence/provenance status;
- appropriate tests;
- compliance with current code/governance standards;
- migration/compatibility treatment where relevant.

Large blocks of legacy code should normally be **re-derived or selectively ported**, not wholesale restored.

## 21.2 Legacy assets

A legacy asset may be reused only after current identity, art authority, Forge source/provenance and registry requirements are resolved.

POC colours, textures or silhouettes do not become final art merely because they are technically usable.

## 21.3 Legacy registries

Historical registries are migration and evidence sources unless an owning current registry authority explicitly admits a value.

Numeric IDs, temporary paths, placeholder colours and prototype categories must not leak into the production registry by copy-forward inertia.

## 21.4 Legacy tests

Tests may be among the most valuable POC outputs.

However, distinguish:

- tests proving a still-valid invariant;
- tests proving POC-only behaviour;
- migration fixtures;
- obsolete tests tied to retired fixed content.

A POC test does not get to redefine a changed production requirement.

---

# 22. Brain↔Governance Pilot

Before relying on the new operating environment for the rest of the pre-rebuild programme, run a bounded pilot.

The pilot should use real project work where possible without prematurely beginning gameplay redevelopment.

## 22.1 Pilot Task A — Authority lookup

Give the Brain a cross-domain question and verify that it:

- resolves the correct owning source;
- reports its current status/version;
- identifies superseded or historical alternatives;
- does not promote the POC as current authority.

## 22.2 Pilot Task B — Work logging

Perform a small governed repository/documentation task and verify:

- task intent is recorded;
- sources used are traceable;
- files changed are recorded;
- validation is recorded;
- outcome and remaining work are visible.

## 22.3 Pilot Task C — ADR trigger recognition

Present a synthetic or real decision that crosses an ADR threshold.

The system must recognise that the decision cannot be silently buried in implementation.

The pilot does not need to resolve an intentionally still-open PRD issue; it needs to prove the routing behaviour.

## 22.4 Pilot Task D — Governance violation

Introduce or simulate a harmless rule violation in a disposable branch/task and prove that the validator/review path detects it or clearly records the current enforcement gap.

An enforcement gap becomes governance debt rather than being hidden.

## 22.5 Pilot Task E — Skills/Procedures/Shortcuts

Complete a task that reveals a reusable procedure and verify it can be promoted from a work log into the governed reusable-knowledge registry without being mistaken for engineering law.

## 22.6 Pilot Task F — Stale Brain summary

Create or identify a stale summary/index state and verify that the owning source wins and the Brain repairs its cached state.

## 22.7 Pilot Task G — Legacy boundary

Ask the system to solve a problem where the old POC has an obvious implementation.

It must:

- identify the old implementation as historical evidence;
- resolve current authority;
- avoid automatic copy-forward;
- classify any proposed reuse through the legacy gate.

---

# 23. Brain↔Governance Pilot Pass Criteria

R6 passes only when all of the following are true:

- [ ] authoritative sources can be found reliably;
- [ ] source status and supersession are represented;
- [ ] POC history is visible but not mistaken for production authority;
- [ ] consequential work produces the required work log/evidence;
- [ ] ADR-trigger behaviour works;
- [ ] exception/waiver routing is understood;
- [ ] at least one governance validation path is operational;
- [ ] enforcement gaps are recorded in governance debt rather than hidden;
- [ ] reusable discoveries can be promoted to Skills/Procedures/Shortcuts;
- [ ] Brain summaries defer to owning sources;
- [ ] Brain and governance records cross-link without duplicating ownership;
- [ ] Git history makes the bootstrap work auditable;
- [ ] the active rebuild tree has no accidental runtime dependency on the archived POC;
- [ ] no broad gameplay rebuild has begun prematurely.

---

# 24. Post-Pilot Handoff

When R6 passes, the controlled repository becomes the normal place for the remaining pre-rebuild programme.

Expected work includes:

- continuing and closing the remaining PRDs;
- performing required technical research and prototypes;
- recording prototype results and ADR evidence;
- drafting/locking LFE;
- drafting/locking FORGE-ENG;
- performing cross-corpus reconciliation;
- running the Branch C audit/certification programme at the appropriate time;
- updating Branch D readiness state;
- creating final implementation staging and benchmark/regression gates.

The Project Brain should now help execute and track that programme.

---

# 25. Production Gameplay Rebuild Gate

REBUILD-00 explicitly does **not** declare the gameplay rebuild ready merely because R6 has passed.

The final restart authority must still prove the current required gates, including the applicable successors/current forms of:

- required content/FCC closure;
- PRD-00 through PRD-09 closure;
- required critical unknowns supported at their target proof levels;
- LFE completion/internal consistency;
- FORGE-ENG completion/internal consistency;
- cross-checking against the canonical Leyforge corpus;
- explicit disposition/ADR treatment for superseded old technical rules;
- implementation order locked;
- benchmark suite locked;
- regression gates locked;
- profiling requirements locked;
- repository/build/CI/test foundation ready;
- Branch C certification requirements satisfied where required;
- Branch D final rebuild-readiness sign-off satisfied.

Only the proper final readiness authority may transition the project to R8 — Gameplay Rebuild Authorised.

---

# 26. Relationship to Branch C Audit

The Brain is intentionally implemented before the global V1 audit execution so it can assist with corpus discovery, status, traceability and evidence handling.

REBUILD-00 therefore unlocks the **environment** in which Branch C can later run its audit framework.

It does not replace:

- C-AUD classification;
- defect handling;
- certification registers;
- final cross-corpus certification;
- V1 lock authority.

C-AUD findings route to their owning authorities. The Brain records/indexes them; it does not silently repair canon or engineering law.

---

# 27. Relationship to ART and The Forge

The ART corpus treats the POC Manual Testing Guide and historical prototype visuals as evidence rather than final presentation authority.

During rebuild bootstrap:

- no mass final-asset production is required;
- placeholder/bootstrap presentation may exist where explicitly labelled;
- legacy POC art does not become final art by default;
- reusable art assets must pass ART/Forge/provenance/registry admission;
- The Forge implementation remains subject to FORGE-ENG/LFE/ENG-GOV technical authority;
- Brain records may expose art-production status but do not replace ART authority.

---

# 28. Save, World and Migration Boundary

The archive and rebuild intentionally form a compatibility epoch boundary.

## 28.1 POC worlds

POC saves/worlds are preserved as historical and test evidence where useful.

They do not automatically create a promise that the production rebuild will load every POC world.

## 28.2 Production epoch

Normal long-term compatibility begins with the first approved production save/world architecture.

## 28.3 Future conversion path

If Ash later decides that public or personal POC-world conversion is valuable, it becomes a separately governed migration feature with explicit scope, evidence and failure recovery.

## 28.4 Non-destructive migration principle

Any future migration attempt must preserve the original input and fail safely rather than partially rewriting the only copy.

---

# 29. Security and Sensitive Material

Before creating external archive artifacts, inspect for:

- credentials;
- API tokens;
- private keys;
- personal local paths where unnecessary;
- unrelated personal files;
- machine-specific caches;
- large generated artifacts not needed for recovery;
- third-party material that cannot legally be redistributed.

The archival goal is project recoverability, not indiscriminate copying of a workstation.

---

# 30. Rollback and Failure Rules

## 30.1 Archive verification fails

If the tag/branch/cold artifact cannot be verified:

- stop destructive transition;
- repair the archive;
- repeat recovery verification.

## 30.2 Clean workspace is wrong

If important source material was removed from the active tree accidentally:

- recover it from the verified historical reference;
- classify it;
- re-admit only what belongs in the active workspace.

## 30.3 Brain bootstrap is defective

Do not compensate by bypassing the Brain with unlogged project work if the intended operating model depends on it.

Fix or explicitly govern the defect, record the failure/lesson, then repeat the pilot.

## 30.4 Governance bootstrap is incomplete

Do not begin broad coding-agent implementation while critical governance surfaces are missing.

Record incomplete enforcement as governance debt and keep the affected work gate closed.

## 30.5 Never solve a transition problem with history destruction

Force-pushing, deleting the only archive reference, rewriting the final POC commit or removing the only cold backup is prohibited unless a separately governed recovery plan exists.

---

# 31. Archive Execution Checklist

## R0 → R1: Prepare and freeze candidate

- [x] Confirm REBUILD-00 is the active transition procedure.
- [x] Record current repository/remotes/branch/HEAD.
- [x] Capture project-relevant untracked material.
- [x] Record engine/plugin/toolchain versions.
- [x] Preserve POC Manual Testing Guide.
- [x] Preserve registry snapshots useful for history/migration.
- [x] Preserve representative saves/fixtures.
- [x] Preserve key screenshots/captures/benchmark evidence.
- [x] Run/record final practical automated verification — snapshot result FAIL; see execution record.
- [x] Run/record final practical manual smoke verification — explicitly NOT RERUN with reason; no manual pass claimed.
- [x] Record known defects and non-blocking limitations.
- [x] Create final POC commit if required. Verified local freeze: `799305859bb0ba4230ef87d934e961cc21220afa`.

## R1 → R2: Verify archive

- [x] Create governed final POC tag/reference. Annotated, published and protected: `legacy-poc-2026-09-05`.
- [x] Push and verify remote tag/reference.
- [x] Create governed archive branch/reference if required. Local: `codex/chore/rebuild-00-archive`.
- [x] Push and protect archive branch/reference. Exact-ref rulesets 22329948/22329949 verified active; updates/deletion blocked; no bypass actors.
- [x] Create cold repository recovery artifact.
- [x] Generate integrity hash for cold artifact.
- [x] Restore into a disposable location.
- [x] Checkout exact final POC SHA.
- [x] Confirm representative files and repository health.
- [x] Record recovery result. R2 Archive Verified — PASS. See sections 32.1 and 33.1.

## R2 → R3: Create clean active workspace

- [x] Create governed rebuild-bootstrap branch/line.
- [x] Remove retired POC runtime implementation from active tree.
- [x] Retain authoritative documentation and required controlled tooling.
- [x] Add only deliberately approved Archived Validation material.
- [x] Run legacy leakage scan.
- [x] Resolve/record every leakage defect.
- [x] Commit the clean rebuild-bootstrap baseline.

## R3 → R4: Brain bootstrap

- [ ] Install Branch A Brain structure.
- [ ] Establish metadata/authority model.
- [ ] Ingest current controlled corpus by status/authority.
- [ ] Link supersession/history.
- [ ] Establish work logs.
- [ ] Establish Skills/Procedures/Shortcuts.
- [ ] Establish decision/ADR links.
- [ ] Establish project/domain indexes.
- [ ] Establish Git traceability.
- [ ] Verify Brain defers to source authority.

## R4 → R5: Governance bootstrap

- [ ] Install ENG-GOV-00 through ENG-GOV-15.
- [ ] Install B-OPS-00 through B-OPS-06.
- [ ] Activate coding-agent bootstrap instructions.
- [ ] Activate governance templates.
- [ ] Activate ADR/waiver/deprecation routes.
- [ ] Establish governance debt/validator backlog.
- [ ] Activate initial validation/CI surfaces.
- [ ] Connect governance records into the Brain.
- [ ] Verify no duplicate authority system was created.

## R5 → R6: Pilot

- [ ] Authority lookup passes.
- [ ] Work-log path passes.
- [ ] ADR trigger recognition passes.
- [ ] Governance violation detection/debt path passes.
- [ ] Skills/Procedures/Shortcuts promotion passes.
- [ ] Stale Brain summary repair passes.
- [ ] Legacy POC boundary test passes.
- [ ] Active tree remains free of hidden POC runtime dependencies.
- [ ] No premature gameplay rebuild work occurred.

---

# 32. Execution Record

This section is deliberately left fillable. Completing these fields records execution; changing the governing procedure requires a versioned document amendment.

## 32.0 R0–R1 assessment — 5 September 2026

Ash authorised beginning R0–R1 and subsequently explicitly authorised the
reviewed local freeze commit. The assessment and commit are complete; final
POC SHA is `799305859bb0ba4230ef87d934e961cc21220afa`. The historical assessment
retains its precommit status; the R2 record below includes the closing receipt.
This records execution and does not lock the whole candidate procedure or grant
any R2/R8 sign-off.

- Work record: [WORK-20260905-001](https://github.com/sharash7/Leyforge/blob/legacy-poc-2026-09-05/.summer/verification/rebuild_00/WORK-20260905-001.md).
- Assessment and limitations: [R0–R1 assessment](https://github.com/sharash7/Leyforge/blob/legacy-poc-2026-09-05/.summer/verification/rebuild_00/ASSESSMENT.md).
- Exact baseline/inventory: [baseline.json](https://github.com/sharash7/Leyforge/blob/legacy-poc-2026-09-05/.summer/verification/rebuild_00/2026-09-05/baseline.json).
- Proposed freeze scope: [freeze-candidate.csv](https://github.com/sharash7/Leyforge/blob/legacy-poc-2026-09-05/.summer/verification/rebuild_00/2026-09-05/freeze-candidate.csv).
- Pre-archive branch/HEAD: `main` / `57c1a2a732cbe94dd6dd7f38db0466ab54f564f1`.
- Initial dirty state: 71 modifications, 83 tracked deletions, 343 untracked paths; nothing staged.
- Capture: 11,172 source/evidence files with verified ZIP entry hashes; 80 player-state files copied with matching hashes; no original save writes.
- Automated evidence: 58 scenes executed; 48 strict passes, 10 failures. Known failures are preserved; this is not a green baseline or final-commit qualification.
- Manual smoke: NOT RERUN. Fresh automated runtime/save/recovery evidence and known failures are recorded for this bounded archival assessment; extra interactive/rendered qualification is deferred. Historical captures are preserved; no manual acceptance is claimed.
- Final POC commit, protected remote tag/branch and independent cold recovery: completed and verified; see section 32.1.

## 32.1 Archive record

Execution evidence: [R2 archive status](../../../docs/rebuild/archive-evidence/r2/ARCHIVE-STATUS.md), [cold recovery result](../../../docs/rebuild/archive-evidence/r2/recovery-result.json), [recovery instructions](../../../docs/rebuild/archive-evidence/r2/RECOVERY.md), and [initial retirement log](../../../docs/rebuild/archive-evidence/r2/RETIREMENT-LOG.md).

| Field | Value |
|---|---|
| Execution date | 5 September 2026 |
| Executed by | Codex under Ash's task instructions; no owner sign-off asserted |
| Pre-archive branch | `main`; freeze committed on `codex/chore/rebuild-00-freeze` |
| Final POC commit SHA | `799305859bb0ba4230ef87d934e961cc21220afa` |
| Final POC tag/reference | `legacy-poc-2026-09-05` (annotated, published and protected) |
| Archive branch/reference | `codex/chore/rebuild-00-archive` (published and protected) |
| Remote archive verified | YES — exact tag object/commit and branch commit read back; active rulesets 22329948/22329949 block updates/deletion with no bypass actors; main unchanged |
| Cold recovery artifact | `D:\AI\Archives\Leyforge\legacy-poc-2026-09-05\leyforge-history.bundle`; adjacent preservation ZIPs and manifests |
| Cold artifact SHA-256 | `5c763489196d34fd31d25ef703da52097179858eb440f3168228ee3e6ac8a272` |
| Recovery test location | `D:\AI\Archives\Leyforge\restore-test-20260905` |
| Recovery verified | PASS — exact SHA/tree, full Git integrity, 184 supplemental hashes, source ZIP CRC, clean checkout, 168 repository checks |
| Final automated gate result | Frozen baseline: 48/58 runtime scenes pass, 10 fail; two legacy static gates fail. Fresh cold recovery checks: 28/28 and 140/140 pass |
| Final manual smoke result | NOT RERUN; no manual acceptance claim |
| Known archive limitations | Same D: physical drive; local long-path Git setting required; raw R1 checksums describe original bytes, not normalized checkout; frozen POC retains documented failures |

## 32.2 Clean workspace record

| Field | Value |
|---|---|
| Rebuild-bootstrap branch/reference | `codex/chore/rebuild-00-bootstrap`; `D:\AI\Projects\leyforge-rebuild` |
| First clean-baseline commit SHA | 3a2cebaa76728de8b97db2c0a932ec1de1c0d420 |
| Legacy leakage scan result | PASS — allowlisted active tree; every surviving match classified; see `docs/rebuild/r3/leakage-result.json` |
| Archived Validation material admitted | None. Historical documents/evidence only; no runtime fixture admission. |
| Active POC dependencies remaining | None. No Godot project, scenes, runtime scripts, registry defaults or generators retained. |
| Exception/waiver references | None. Brain directory placeholders only; operational Brain deferred to R4. |

## 32.3 Brain record

| Field | Value |
|---|---|
| Brain bootstrap commit SHA | |
| Brain root/path | |
| Corpus ingestion status | |
| Authority resolution test | |
| Supersession test | |
| Work-log test | |
| Skills/Procedures/Shortcuts test | |
| Git integration test | |

## 32.4 Governance record

| Field | Value |
|---|---|
| Governance bootstrap commit SHA | |
| ENG-GOV corpus installed | |
| B-OPS corpus installed | |
| AGENTS/coding-agent bootstrap active | |
| ADR route active | |
| Exception/waiver route active | |
| Governance debt register active | |
| Initial validators active | |
| Initial CI/quality gate active | |
| Brain↔Governance links verified | |

## 32.5 Pilot record

| Pilot | Result | Evidence |
|---|---|---|
| Authority lookup | | |
| Work logging | | |
| ADR trigger | | |
| Governance violation | | |
| Skill/procedure promotion | | |
| Stale-summary correction | | |
| Legacy boundary | | |

---

# 33. Completion States and Sign-Off

## 33.1 Archive Verified sign-off

Mark only when R2 is complete.

```yaml
archive_verified:
  status: "PASS"
  final_poc_sha: "799305859bb0ba4230ef87d934e961cc21220afa"
  recovery_verified: true
  evidence:
    - ".summer/verification/rebuild_00/r2-2026-09-05/ARCHIVE-STATUS.md"
    - ".summer/verification/rebuild_00/r2-2026-09-05/recovery-result.json"
    - ".summer/verification/rebuild_00/r2-2026-09-05/publication-result.json"
  signed_by: "Codex — execution verification under Ash's explicit GitHub authorization; not owner gameplay certification"
  signed_at: "2026-09-05"
```

## 33.2 Rebuild Bootstrap Authorised sign-off

Mark only when R6 is complete.

This sign-off means:

> **The old POC is safely archived; the active workspace is clean; the Project Brain and Branch B governance are operational; their interface has passed a bounded pilot; and Leyforge may conduct the remaining pre-rebuild technical/audit programme in the new controlled environment.**

It does **not** mean gameplay rebuild authorised.

```yaml
rebuild_bootstrap_authorised:
  status: "PASS | FAIL | CONDITIONAL"
  archive_state: ""
  brain_state: ""
  governance_state: ""
  pilot_state: ""
  open_bootstrap_blockers: []
  signed_by: ""
  signed_at: ""
```

## 33.3 Gameplay Rebuild Authorised

This field remains **DEFERRED TO THE FINAL REBUILD-READINESS AUTHORITY**.

```yaml
gameplay_rebuild_authorised:
  status: "NOT AUTHORISED BY REBUILD-00"
  final_gate_authority: "Branch D / current approved successor readiness instrument"
  evidence_required: "PRD + technical canon + proof + audit + implementation readiness"
```

---

# 34. Lock-Candidate Decisions

**REBUILD-D01** — Leyforge uses one transition-control document, REBUILD-00, rather than creating a new archive document set.  
**REBUILD-D02** — The legacy POC must be preserved before destructive cleanup.  
**REBUILD-D03** — The normal transition preserves Git history; a clean rebuild tree does not require history destruction.  
**REBUILD-D04** — The final POC receives an exact recoverable historical reference and independent cold recovery artifact.  
**REBUILD-D05** — Archived POC material is historical/regression evidence and is not active production authority.  
**REBUILD-D06** — Document 25A retirement classifications govern legacy disposition.  
**REBUILD-D07** — The full repository archive and the selected non-shipping Archived Validation material are separate concepts.  
**REBUILD-D08** — The active rebuild tree may contain selected legacy fixtures only through explicit governed admission.  
**REBUILD-D09** — POC saves do not create a permanent production compatibility obligation.  
**REBUILD-D10** — Project Brain implementation begins after archive verification and lives inside the controlled Leyforge repository.  
**REBUILD-D11** — The Brain indexes authority/status/work/learning but never replaces owning source authority.  
**REBUILD-D12** — Branch B’s certified 23-document ENG-GOV/B-OPS corpus is activated rather than redesigned by REBUILD-00.  
**REBUILD-D13** — Governance activation includes operational instruction, logging, ADR/exception, validation, CI and debt surfaces as required by Branch B; copying documents alone is insufficient.  
**REBUILD-D14** — Brain and governance must be piloted together before they become the normal operating environment.  
**REBUILD-D15** — Reusable POC techniques are captured as evidence/skills/procedures where appropriate, but legacy implementation is never automatically reinstated.  
**REBUILD-D16** — Archive/Brain/governance bootstrap may proceed while the later production gameplay rebuild gate remains closed.  
**REBUILD-D17** — No open PRD/LFE/FORGE-ENG architecture question may be silently decided as a side effect of bootstrap.  
**REBUILD-D18** — After the pilot, the new controlled environment becomes the normal workspace for remaining PRD, technical-canon, prototype, audit and readiness work.  
**REBUILD-D19** — Branch C audit authority is preserved; the Brain assists audit execution but does not replace certification.  
**REBUILD-D20** — Final gameplay rebuild permission remains owned by the current final readiness gate and requires the applicable PRD/technical/proof/audit conditions.  

---

# 35. Owner Review Checklist

Before locking REBUILD-00 v0.1, confirm:

- [ ] one-document approach is accepted;
- [ ] full-history archive + selected Archived Validation split is accepted;
- [ ] Git-history preservation rule is accepted;
- [ ] cold recovery artifact requirement is accepted;
- [ ] POC retirement classifications are accepted;
- [ ] active-tree legacy leakage scan is accepted;
- [ ] Brain bootstrap sequence is accepted;
- [ ] governance bootstrap sequence is accepted;
- [ ] Brain↔Governance pilot is accepted;
- [ ] no automatic POC code reuse rule is accepted;
- [ ] POC save epoch boundary is accepted;
- [ ] archive/bootstrap permission versus gameplay-rebuild permission split is accepted;
- [ ] execution record and sign-off model is accepted.

---

# 36. Closing Transition Law

The POC has already done its job. Its purpose now is to preserve evidence, lessons and recoverability—not to dictate the architecture of the game that replaces it.

The Project Brain and Engineering Governance have also done their theoretical-design jobs. Their next purpose is to become **real repository infrastructure** that controls how Leyforge is researched, decided, implemented, tested, learned from and audited.

REBUILD-00 therefore closes the old mode of work with the following rule:

> **Freeze before deleting. Preserve before replacing. Keep history, but remove legacy authority. Build the Brain before trusting project memory. Activate governance before trusting agents. Prove the operating model before scaling it. Finish the technical gates before rebuilding gameplay. Then rebuild Leyforge from its current canon—not from the accidents of its prototype.**

---

# 37. Principal Source Basis

REBUILD-00 was drafted from the current Leyforge project state and specifically relies on:

- Document 25A v0.2 POC retirement baseline, including the Post-POC Production Boundary, POC Retirement Classification, Archived Validation Pack Contract, Production Branch/Save/Compatibility Baseline and leakage-scan requirements;
- the certified Branch B ENG-GOV/B-OPS rebuild-bootstrap status and Brain↔Governance model;
- the completed Branch A Project Brain design, including authority navigation, work logs and Skills/Procedures/Shortcuts;
- Branch C’s completed audit framework and its planned use after Brain implementation/pilot;
- Branch D’s pre-rebuild sequencing rule that research/PRD/proofs/technical canon precede gameplay redevelopment;
- the current PRD status through PRD-05;
- ART’s explicit treatment of the POC Manual Testing Guide and prototype presentation as historical/current implementation evidence rather than automatic final-art authority;
- the Leyforge POC Manual Testing Guide as evidence of the retired implementation’s connected capabilities, regression infrastructure and historical verification state.

Where any cited source is superseded before execution, the source/authority register must resolve the current owner and REBUILD-00 must be updated if the transition rule materially changes.

---

**End of REBUILD-00 v0.1 — Lock Candidate**
