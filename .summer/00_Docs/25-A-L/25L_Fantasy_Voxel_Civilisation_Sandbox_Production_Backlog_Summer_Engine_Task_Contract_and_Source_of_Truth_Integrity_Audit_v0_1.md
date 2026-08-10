---
title: "25L - Production Backlog, Summer Engine Task Contract and Source-of-Truth Integrity Audit"
document_id: "25L"
version: "0.1"
status: "Interim Production Backlog and Integration-Closure Draft"
project: "Leyforge - Fantasy Voxel Civilisation Sandbox"
document_set: "25 - Post-Atlas Production Governance, Registries, Classification and Integration"
owner: "Ash"
depends_on:
  - "[[25A - Post-Atlas Production Governance v0.2]]"
  - "[[25B - Canonical Registry Kernel v0.2]]"
  - "[[25C - Domain Schemas and Completeness Contracts]]"
  - "[[25D - Content Packs, Manifests and Migration]]"
  - "[[25E - Validation Architecture and Release Gates]]"
  - "[[25F - Core Production Atlas Classification and Scope Lock]]"
  - "[[25G - Core Production Package Dependency and Progression Matrix]]"
  - "[[25H - Core Production Block Family Catalogue]]"
  - "[[25I - Core Production Item Family Catalogue]]"
  - "[[25J - Resource, Loot, Provenance, Progression and Recipe-Chain Matrix]]"
  - "[[25K - Asset Budgets and Forge Manifest Contract]]"
next_document: "[[18 - Godot and Summer Engine Technical Implementation Plan v1.0]]"
final_revision_dependency: "Document Set 26 sufficient lock and downstream integration audit"
tags: [leyforge, production, backlog, summer-engine, godot, tasks, integrity-audit, source-of-truth, release-gates, set-26]
---

# FANTASY VOXEL CIVILISATION SANDBOX

## DOCUMENT SET 25

# 25L - Production Backlog, Summer Engine Task Contract and Source-of-Truth Integrity Audit

Version 0.1 - Interim Production Conversion, Implementation Readiness and Integration-Closure Draft

A governed final planning document converting the approved post-Atlas architecture, Core Production scope, physical catalogues, chain matrices and asset requirements into bounded documentation, Godot/Summer Engine, registry, data, world, simulation, asset, validation and release work packages while auditing what is authoritative, obsolete, unimplemented, conditional or blocked.

Project Lead and Final Authority: Ash

Architecture, systems planning, documentation and production support: GPT-5.6 Thinking

---

# Revision History

| Version | Status | Summary |
| --- | --- | --- |
| 0.1 | Initial draft | Completes the planned 25A-25L document sequence; consolidates 36 Core packages, 214 selected Atlas foundations, 217 block families, 296 item families, 105 production chains and 86 asset packages into a bounded backlog; defines the Summer Engine task contract, source-of-truth audit, main-document replacement programme, implementation gates and provisional Set 26 integration closure. This version does not claim final maritime integration closure. |

# Document Purpose

Document 25L is the final planned document in Document Set 25. It converts the governance, registry, classification, physical-content, progression and asset contracts created by Documents 25A-25K into an ordered production backlog that can be executed through Godot and Summer Engine without broad, unbounded prompts or unsupported implementation assumptions.

It also performs a source-of-truth integrity audit. The audit distinguishes what has been approved as a production contract from what still exists only as a POC-era source, a planning catalogue, a proposed budget, a conditional package, an unimplemented tool, an unmeasured technical assumption or an external Set 26 dependency. It therefore prevents the completion of this document set from being mistaken for completion of the game, completion of the revised Documents 00-18, or readiness to claim Data Ready, Asset Ready, Integrated, Balanced or Released status.

> **Closure Boundary**
>
> Approval of 25L v0.1 completes the planned **Document Set 25 drafting sequence** and authorises the next bounded documentation and technical-foundation tasks. It does not complete final Set 25 integration closure. Final closure requires the main-document replacement programme, executable registry/validation evidence, resolution or explicit deferral of blocker-level debt, and sufficiently locked Document Set 26 outputs with an approved downstream amendment map.

No attached Godot/Summer Engine repository, exact project folder map, command implementation or Set 26 source documents were available as canonical implementation evidence for this draft. Accordingly, 25L defines task and command contracts, path classes, entry gates and required outputs. The first technical-discovery task must inspect the real repository and freeze exact changed-file paths before any implementation task becomes Ready.

# Design Sources and Supersession Rules

| Source | Authority Used by 25L |
| --- | --- |
| Documents 25A-25E | Governance, lifecycle, Set 26 checkpoints, stable IDs, schemas, relationships, capabilities, packs, authoring, migration, validation, evidence and release gates. |
| Documents 25F-25G | Accepted Living Frontier Network working scope, 36 packages, 214 Atlas foundations, CAP-00 to CAP-10, histories/events/states, conditional debts and Core/Set 26 boundary. |
| Documents 25H-25J | 217 block-family contracts, 296 item-family contracts, 105 chains, substitutions, provenance, ownership, conservation and replacement gates for Documents 03-06. |
| Document 25K | 86 asset packages, Forge/source/runtime boundaries, animation/audio/VFX/socket/event requirements, accessibility and Asset Ready evidence. |
| Atlas 24A-24L | World context, ecology, culture, distribution, relationships, suitability, package completeness and Document 24L production roadmap. |
| Documents 00-18 v0.1 | Legacy design intent and system boundaries. POC identities, fixed arrangements and Unreal-specific Document 18 implementation are not active production authority. |
| Forge Documents 21-23 | Existing voxel, entity, animation, blueprint, spatial, audio/VFX, source/runtime, provenance and testing foundations. |
| Document Set 26 approved programme | Separate maritime and naval authority. This document tracks admission and closure dependencies but does not design maritime systems. |

> **Supersession Rule**
>
> Document 25L does not silently supersede Documents 00-18. It records their required treatment. The active source of truth changes only when a replacement or revision pack is approved, indexed, linked to migrations where needed and marked in the canonical supersession register. Until then, incompatible POC and Unreal sections remain legacy sources rather than production instructions.

# Static Table of Contents

- 1. Locked Production Backlog and Integrity-Audit Identity
- 2. Decision Boundary, Closure States and Approval Status
- 3. Scope, Non-Goals and Implementation Boundary
- 4. Canonical Terminology
- 5. Consolidated Production Truth Snapshot
- 6. Source-of-Truth Integrity Audit Method
- 7. Canonical Authority and Supersession Hierarchy
- 8. Document Set 25 Status and Handoff Matrix
- 9. Main Documents 00-18 Amendment and Replacement Matrix
- 10. Forge, Atlas and Related Document Integration Status
- 11. Document Set 26 Integration and Sufficient-Lock Boundary
- 12. Current Contradictions, Gaps and Blocker Register
- 13. POC Retirement Execution Backlog
- 14. Production Documentation Revision Programme
- 15. Master Backlog Architecture
- 16. Work-Package Identity, Status and Dependency Rules
- 17. Summer Engine Task Contract
- 18. Changed-File, Branch and Repository Discipline
- 19. Validation Commands, Evidence and Rollback Contract
- 20. Production Lanes and Workstream Ownership
- 21. Technical Discovery and Document 18 Rewrite Lane
- 22. Registry Kernel and Generated-Data Lane
- 23. Content Packs, Authoring, Import/Export and Migration Lane
- 24. Validation, Seed QA and Release-Evidence Lane
- 25. Core Registry Data Conversion Lane
- 26. Voxel, Blocks, Items, Resources and Recipes Lane
- 27. Seed World, Topology, Biomes and Repair Lane
- 28. Save, Persistence, Migration and Missing-Pack Lane
- 29. Simulation LOD, Time, Authority and Conservation Lane
- 30. NPC Civilisation, Settlement, Economy and Trade Lane
- 31. Automation, Magic and Practical Infrastructure Lane
- 32. Ecology, Creatures, Raids, Bosses and Aftermath Lane
- 33. Structures, Dungeons, Quests and World-State Lane
- 34. Verdant Covenant and Ancestral Veil Lane
- 35. Forge, Assets, Animation, Audio, VFX and Presentation Lane
- 36. UI/UX, Accessibility and Player-Trust Lane
- 37. Performance, Scalability and Profiling Lane
- 38. Multiplayer-Ready Architecture and Reconnection Lane
- 39. Set 26 Expansion Admission and Final Integration Lane
- 40. Critical Dependency Graph
- 41. Milestone Sequence and Entry/Exit Gates
- 42. Initial Executable Queue
- 43. Conditional, Deferred and Tooling-Research Work
- 44. Production Board, Evidence and Integration-Debt Tracking
- 45. Change Control, Substitution and Scope Reduction
- 46. Risks, Redesign Triggers and Escalation
- 47. Implementation Readiness Verdict
- 48. Set 25 Completion versus Final Integration Closure
- 49. Decisions Locked by 25L
- 50. Handoff and Next Action Sequence
- Appendix A. Master Backlog Register
- Appendix B. Summer Engine Task Card Template
- Appendix C. Source-of-Truth Integrity Audit Register
- Appendix D. Main-Document Amendment Checklist
- Appendix E. Validation Command-ID Register
- Appendix F. Repository Path-Class and Evidence Layout
- Appendix G. Integration Debt Register
- Appendix H. Set 26 Admission and Closure Checklist
- Appendix I. Document 25L Acceptance Criteria

# 1. Locked Production Backlog and Integrity-Audit Identity

> **Locked Rule**
>
> No Leyforge implementation task is Ready because its desired feature is described in prose. A task becomes Ready only when its source authority, exact objective, dependencies, changed files, exclusions, validator and suite IDs, acceptance tests, evidence destination, rollback method, owner and gate effect are explicit. A completed task changes only its declared files and cannot approve its own release gate.

| Identity Layer | 25L Meaning | Production Result |
| --- | --- | --- |
| Source integrity | Every active rule has one owner, version and supersession state. | Summer Engine does not receive contradictory instructions from POC, Atlas, registry and technical sources. |
| Bounded backlog | Large systems are decomposed into dependency-bounded packages and smaller task cards. | Each change is reviewable, testable and reversible. |
| Evidence-first status | Lifecycle claims require retained validation, build, save, performance, accessibility and human evidence. | Planning documents cannot be mistaken for implemented features. |
| Critical path | Documentation, registry, validation, physical data, world generation, persistence and simulation gates are ordered. | Content production does not outrun foundations. |
| Expansion-safe closure | Set 26 enters through the same identities, packs, schemas and evidence contracts. | Maritime work extends rather than forks Leyforge. |
| Human authority | Ash approves scope, canon, representation, licensing, major architecture and release. | AI and tooling support production but do not self-approve. |

# 2. Decision Boundary, Closure States and Approval Status

| Closure State | Meaning | Status after 25L v0.1 approval |
| --- | --- | --- |
| Set 25 Document Sequence Complete | Documents 25A-25L exist as the planned governance and production-conversion set. | Yes, subject to document approval. |
| Production Specification Closure | Documents 00-18, registries, Forge handoffs and technical architecture are updated and internally aligned. | No; replacement and revision programme remains. |
| Foundation Implementation Ready | A repository audit, Document 18 v1.0, exact file map, test harness and bounded task queue exist. | Partially; documentation/discovery may begin, code waits for gates. |
| Core Integration Closure | Core packages, data, world, saves, assets and systems pass Integrated gates. | No. |
| Set 26 Integration Closure | Approved maritime outputs are admitted, amended, tested or explicitly deferred/excluded. | No; final 25L revision required. |
| Release Closure | Core build passes all technical, content, performance, accessibility, human and release gates. | No; far downstream. |

The backlog identities and order in this document become working locks when Ash approves 25L. Numeric estimates, exact repository paths, exact command syntax, staffing and calendar dates remain pending until the repository audit and rewritten Document 18 supply evidence.

# 3. Scope, Non-Goals and Implementation Boundary

## 3.1 In scope

- Source-of-truth and supersession audit across Set 25, Documents 00-18, Forge and Set 26 integration records.
- Main-document replacement/revision programme before broad implementation.
- Package-level production backlog and critical dependency graph.
- Summer Engine task-card requirements, changed-file discipline, validation command identities, evidence and rollback.
- Registry, packs, validation, data conversion, worldgen, saves, simulation, living-world, adventure, asset, UI, performance and multiplayer-ready lanes.
- Initial executable queue and blocked/conditional work.
- Set 26 admission and final closure gates.

## 3.2 Explicit non-goals

- No Godot code, exact class name, project folder, command implementation or numeric budget is claimed to exist.
- No final schedule, staffing plan, cost estimate or contractor assignment is approved.
- No maritime gameplay design is duplicated from Set 26.
- No main document is silently amended by this backlog.
- No block, item, recipe or asset contract becomes implemented merely by being listed.
- No placeholder is accepted without an owner, replacement gate and supported fallback.
- No task may use an open-ended instruction such as “implement the whole system”.

## 3.3 Implementation boundary

Read-only discovery, document replacement, schema fixtures and isolated technical spikes may begin according to their gates. Broad Core content conversion, production world generation and gameplay implementation must wait until the rewritten Document 18, exact repository map, registry/validator foundations and owning main-document revisions are approved.

# 4. Canonical Terminology

| Term | Definition |
| --- | --- |
| Work package | A dependency-bounded production unit in the master backlog; it may decompose into multiple Summer Engine task cards. |
| Task card | The smallest authorised unit of change with one objective, exact files, tests, evidence and rollback. |
| Changed-file list | Exhaustive file paths a task may modify. Any extra file requires a revised task card or split task. |
| Command ID | Stable role for a validator/test/build command before final syntax is chosen by Document 18. |
| Gate | A mandatory entry or exit condition preventing downstream assumptions. |
| Evidence bundle | Versioned reports, lockfiles, build identity, test results, profiles, screenshots/logs and approvals for one gate. |
| Integration debt | A known cross-document, cross-pack or technical obligation not yet resolved. |
| Blocker debt | Debt that prevents a lifecycle, milestone or closure claim and cannot be silently deferred. |
| Conditional package | Approved scope whose implementation waits for a named technical, content or performance gate. |
| Sufficient lock | Set 26 state where selected packages are at least Specified, amendment map is approved and blocker technical risks are resolved or explicitly excluded. |
| Interim closure | Completion of this planning document without claiming final Set 26 integration closure. |
| Path class | Logical repository ownership category used before the real project audit freezes exact paths. |

# 5. Consolidated Production Truth Snapshot

| Area | Current Source-Derived Position | Implementation Evidence | Verdict |
| --- | --- | --- | --- |
| Governance | 25A v0.2 defines authority, lifecycle, POC retirement and Set 26 checkpoints. | No automated governance registers or shipping-manifest enforcement yet. | Specified, not implemented. |
| Registry architecture | 25B-25C define IDs, facets, schemas, relationships, capabilities, suitability and fallbacks. | No executable resolver, schema registry, graph or provider query service. | Specified, not implemented. |
| Packs/migration | 25D defines manifests, profiles, hashes, world manifests, quarantine and migrations. | No pack loader, compiler, lockfile or migration harness. | Specified, not implemented. |
| Validation | 25E defines suites, corpora, evidence and gates. | No validator tools, seed runner, corpora, baselines or numeric budgets. | Specified, not implemented. |
| Core scope | 25F-25G define 36 packages, 214 foundations and CAP-00 to CAP-10. | No production world or package data loaded in Godot. | Scope specified. |
| Blocks | 25H defines 217 family contracts. | Document 03 remains v0.1 POC-era source; no v1.0 registry. | Catalogue only. |
| Items | 25I defines 296 family contracts. | Document 04 remains v0.1 POC-era source; no v1.0 registry. | Catalogue only. |
| Resources/recipes | 25J defines 105 chains, fallbacks and loot/provenance. | Documents 05-06 remain v0.1; no executable chain registry. | Matrix only. |
| Assets | 25K defines 86 packages and budget envelopes. | No approved source/export/evidence package supplied by 25K itself. | Requirements only. |
| Technical plan | Document 18 is Unreal Engine and Forest Hamlet based. | Incompatible with current Godot/Summer Engine direction. | Obsolete; replacement blocker. |
| POC retirement | Policy and archive rules exist. | No complete repository/content leakage inventory in current source set. | Not executed. |
| Set 26 | Programme and 26A-26O working structure are approved. | Detailed source documents and sufficient-lock evidence are outside the reviewed source bundle. | Integration pending. |
| Release | Release gates are defined conceptually. | No packaged Core Integration Candidate or evidence bundle. | Not release ready. |

# 6. Source-of-Truth Integrity Audit Method

The integrity audit uses five tests:

1. **Identity:** the record has a stable document/definition/task ID, version and owner.
2. **Authority:** exactly one source owns each editable field or decision.
3. **Compatibility:** dependencies, supersession, aliases and extension boundaries are explicit.
4. **Evidence:** lifecycle claims are backed by validators, builds, tests, profiles or approved human review.
5. **Closure:** every blocker has an owner, task, gate and clearing evidence; deferral is explicit rather than implied.

A source fails integrity when it contains active instructions that conflict with later authority, is treated as implemented without evidence, duplicates editable truth, points to retired POC identities, relies on unknown files or tools, or leaves a required dependency without an owner.

# 7. Canonical Authority and Supersession Hierarchy

1. Ash's explicit approved decisions and current governance records.
2. Document 00 for final game identity where not superseded by approved post-POC decisions.
3. Set 25 for production governance, registries, classification, validation, packs and integration.
4. Atlas Set 24 for world context, ecology, culture, distribution, history, relationships and suitability.
5. Revised Documents 01-18 for executable gameplay and technical system definitions.
6. Forge Documents 21-23 for asset authoring/source/runtime and presentation tooling boundaries.
7. Set 26 for detailed oceans, maritime civilisation, vessels and naval systems.
8. Generated registries/resources and runtime state as derived products, never editable design truth.
9. Archived POC sources and fixtures, isolated from shipping profiles.

When two active documents disagree, implementation stops at the affected boundary. The conflict is entered into the decision or integration-debt register and resolved by the canonical owner; an AI or implementation task may not choose silently.

# 8. Document Set 25 Status and Handoff Matrix

| Document | Authority | Current Status | Remaining Closure Effect |
| --- | --- | --- | --- |
| 25A v0.2 | Governance, POC retirement, decisions and Set 26 integration | Specified / active working authority | Final closure revision still required after Set 26 sufficient lock. |
| 25B v0.2 | Canonical registry kernel, IDs, namespaces and ownership | Specified / active working authority | Detailed maritime schemas remain Set 26-owned. |
| 25C v0.1 | Schemas, relationships, capabilities, suitability and completeness | Specified | No runtime schema registry or graph implementation yet. |
| 25D v0.1 | Packs, manifests, authoring, import/export and migration | Specified | Exact Godot services, commands and repository layout remain unimplemented. |
| 25E v0.1 | Validation, seed QA, reachability, performance and release gates | Specified | Validator binaries, seed corpora and numeric budgets do not yet exist. |
| 25F v0.1 | Core Production Atlas classification and scope lock | Accepted working scope | Core intake is frozen subject to 25A change control and dependency-equivalent substitutions. |
| 25G v0.1 | 36 Core packages and CAP-00 to CAP-10 dependency graph | Specified | Conditional debts remain for water baseline, realm packages and measured budgets. |
| 25H v0.1 | 217 block-family contracts | Catalogue specified | Document 03 v1.0 has not yet replaced the POC-era registry. |
| 25I v0.1 | 296 item-family contracts | Catalogue specified | Document 04 v1.0 has not yet replaced the POC-era registry. |
| 25J v0.1 | 105 resource, loot, provenance and recipe-chain contracts | Matrix specified | Documents 05 and 06 v1.0 have not yet been produced. |
| 25K v0.1 | 86 asset-package and presentation-manifest contracts | Asset requirements specified | No package is Asset Ready until sources, exports and evidence exist. |
| 25L v0.1 | Backlog, task contract and integrity audit | This document | Completes the planned Set 25 document sequence, not final maritime integration closure. |

# 9. Main Documents 00-18 Amendment and Replacement Matrix

| Doc | Title | Treatment | Required Change | Primary Intake |
| --- | --- | --- | --- | --- |
| 00 | Master Game Design Bible | Revision pack | Remove active POC target; bind final vision to production worlds, Core scope and expansion governance. | 25A, 25F-25G; later Set 26 integration |
| 01 | Core Gameplay Loop | Revision pack | Retire fixed demonstration loop; preserve seed-adaptive start and multi-pillar production loop. | 25F-25G, 25J; later maritime loop |
| 02 | Player Progression | Revision pack | Adopt CAP-00 to CAP-10, capability substitutes, settlement taxonomy and parallel mana progression. | 25G, 25J |
| 03 | Blocks Registry | Complete replacement | Convert 217 family contracts into executable block definitions and generated variants. | 25B-25E, 25H, 25K; Set 26 adds maritime extensions later |
| 04 | Items Registry | Complete replacement | Convert 296 item families; separate scarcity, quality, condition, provenance and significance. | 25B-25E, 25I, 25K |
| 05 | Crafting and Recipe Registry | Complete replacement | Instantiate 105 chains, substitutions, project recipes, conservation and validation. | 25J plus Documents 03/04/06 v1.0 |
| 06 | Resource Progression | Complete replacement | Replace universal ladder with capability, ecology, trade, culture, realm and provenance pathways. | 25G, 25J |
| 07 | NPC Village System | Revision pack | Remove Forest Hamlet roster and fixed watchtower loop; use generated cultures, settlements and seven needs. | 25G, 25J; settlement sets |
| 08 | Automation System | Revision pack | Remove fixed miner-to-watchtower chain; bind machines to authoritative transactions and package capabilities. | 25C, 25G, 25J |
| 09 | Magic System | Revision pack | Remove fixed tutorial mana/ward sequence; retain practical magic and realm-compatible infrastructure. | 25G, 25J; Verdant and later Set 26 |
| 10 | Creatures and Monsters | Revision pack | Replace POC creature list with bounded ecology, nests, pressure, factions and selected bosses. | 25F-25G, 25J, 25K |
| 11 | Biomes and World Generation | Complete replacement | Replace controlled valley with deterministic relationship-driven seed assembly and repair. | 25B-25G, 25E |
| 12 | Structures | Revision pack | Replace fixed structure arrangement with grammars, states, ownership, routes and package contracts. | 25G, 25H, 25K |
| 13 | Races, Peoples, Cultures and Factions | Revision pack | Bind ancestry, culture, citizenship and faction layers to selected Core packages. | 25F-25G |
| 14 | Dimensions | Revision pack | Specify Verdant Covenant as full conditional realm and Ancestral Veil as safe teaser. | 25F-25G, 25H-25K |
| 15 | Quest and Event System | Revision pack | Use selected histories, arcs, events and persistent aftermath; bind participants through stable IDs. | 25G, 25E |
| 16 | Combat, Gear and Defence | Revision pack | Bind gear, creature roles, raids, bosses and aftermath to production registries. | 25I-25K |
| 17 | UI/UX System | Revision pack | Add registry/world inspectors, seed settings, provenance, accessibility and production UI obligations. | 25E, 25K |
| 18 | Godot/Summer Engine Technical Implementation Plan | Complete replacement | Replace Unreal architecture and POC plan with measured Godot/Summer Engine production architecture. | All Set 25; actual repository audit; Set 26 technical extension |

No row in this matrix is complete merely because Set 25 defines its replacement input. The supersession register changes only after the new document is drafted, reviewed, approved and linked to migration or implementation obligations.

# 10. Forge, Atlas and Related Document Integration Status

| Source Group | Retained Authority | Required Follow-Up |
| --- | --- | --- |
| Atlas 24A-24L | World context and content-foundation relationships. | Publish the selected 25F/25G classifications and registry mappings back into Atlas production status fields without turning Atlas into executable data. |
| Forge 21 | Voxel materials, blocks, items and source/runtime asset separation. | Consume 25H-25K family/manifests; add generated registry IDs and evidence links. |
| Forge 22 | Entity, rig, animation, blueprint and structure authoring. | Consume body-plan, socket, event, structure and realm package requirements. |
| Forge 23 | Spatial, audio/VFX, accessibility, Godot products, provenance and migration. | Consume 25K event/manifests and 25E evidence gates. |
| Settlement Sets 19-20 | Settlement stages, blueprints and seven needs. | Reconcile stage naming with 25F/25G and remove fixed POC project examples from active scope. |
| Archived POC | Historical/regression evidence only. | Assign archive namespace, fixtures and shipping exclusion tests. |

The Forge documents remain valid authoring foundations, but no asset package becomes authoritative until its Forge source, gameplay owner, runtime product, content pack and evidence records are linked through 25D and 25K contracts.

# 11. Document Set 26 Integration and Sufficient-Lock Boundary

| Set 26 Doc | Primary Authority | Set 25 / Main-Document Consumer | 25L Closure Requirement |
| --- | --- | --- | --- |
| 26A | Vision, scope, authority and integration | 25A, 25F-25G, 25L | Required before final closure; no gameplay duplication. |
| 26B | Water/liquid/fluid overhaul | 25C-25E, Documents 03/11/18 | Defines extension schemas and migration from bounded Core water baseline. |
| 26C | Oceans, coasts, islands and underwater worldgen | Documents 11/12/14; WLD lane | Adds optional world packages and seed/repair fixtures. |
| 26D | Wind, waves, tides, currents and storms | Documents 11/18; PERF/VAL lanes | Adds dynamic profiles, LOD and performance evidence. |
| 26E | Swimming, diving and underwater interaction | Documents 01/02/16/17/18 | Adds player capabilities, controls, accessibility and hazards. |
| 26F | Voxel vessel architecture and commissioning | 25B-25C; Documents 03/12/18 | Uses stable mobile-container and local/world-space identities. |
| 26G | Movement, buoyancy, propulsion and navigation | Document 18; PERF/MP lanes | Defines authoritative physics and movement contracts. |
| 26H | Shipwright construction, repair, refit and salvage | Documents 03-06/12; 25J | Adds physical chains, ownership and migration-safe refit state. |
| 26I | Vessel Forge and blueprint authoring | 25D, 25K, Forge 21-23 | Adds player/official blueprint pack contracts. |
| 26J | Ports, harbours, shipyards, crews and civilisation | Documents 07/12/13 | Adds settlement, job, structure and permission extensions. |
| 26K | Trade, fleets, piracy, navies and regional power | Documents 07/13/15 | Adds fleet, route, cargo, faction and economy records. |
| 26L | Naval combat, boarding, flooding, fire and siege | Documents 16/18; SAVE/SIM/MP lanes | Adds damage, authority, moving-interior and aftermath tests. |
| 26M | Marine ecology, fishing, creatures, dungeons and bosses | Documents 10-12/15 | Adds ecology, resource, encounter and reward packages. |
| 26N | Progression, registries, magic, automation, economy, quests/events | Documents 02-09/15; DATA lane | Canonical physical and gameplay registry handoff. |
| 26O | UI/UX, multiplayer, technical plan, performance, QA and integration | Documents 17-18; 25E/25L | Required sufficient-lock evidence and final downstream amendment map. |

## 11.1 Sufficient-lock recommendation

For the final 25L revision, a selected Set 26 package is sufficiently locked when:

- its scope and owner are approved;
- required identities and extension schemas are registered;
- physical inputs/outputs and downstream documents are mapped;
- pack dependencies and safe absence/removal behaviour are defined;
- save, migration, authority, LOD and validation obligations are specified;
- blocker-level technical risks have evidence, an approved redesign or explicit exclusion;
- no detailed maritime field is duplicated inside Set 25.

Set 26 does not need every final asset or balanced number before the closure audit, but it must be specific enough that no required amendment, registry, migration or technical obligation remains hidden.

# 12. Current Contradictions, Gaps and Blocker Register

| ID | Gap | Severity | Clearing Condition |
| --- | --- | --- | --- |
| BLK-001 | Document 18 remains Unreal/POC-based | Blocker | Complete read-only project audit, then approve Document 18 v1.0 for Godot/Summer Engine. |
| BLK-002 | Documents 00-17 still contain active POC assumptions | Blocker for broad implementation | Complete replacement/revision programme and publish supersession map. |
| BLK-003 | POC retirement is policy only | Blocker for shipping manifests | Inventory and isolate legacy IDs, scenes, assets, literals, saves and tests; add leakage validator. |
| BLK-004 | Registry kernel is specified but not implemented | Blocker for content conversion | Implement representative definition envelope, schema registry, ID resolver and graph. |
| BLK-005 | Validation architecture has no executable tools or corpora | Blocker for Data Ready/Integrated claims | Build validator CLI/editor entry points, fixtures, seed runner and evidence bundle. |
| BLK-006 | Block/item/chain catalogues are not executable registries | Blocker for physical gameplay | Replace Documents 03-06 and compile representative data before bulk conversion. |
| BLK-007 | World generation production contract is not implemented | Blocker for production worlds | Replace Document 11; implement named sub-seeds, graph assembly, repair and explored-world stability. |
| BLK-008 | Numeric performance and simulation budgets are unmeasured | Blocker for release admission | Profile representative packaged scenarios and approve budgets in Document 18. |
| BLK-009 | Asset packages have no approved source/export evidence | Blocker for Asset Ready | Create Forge/source manifests, provenance and representative runtime products. |
| BLK-010 | Set 26 outputs are not fully admitted into this source set | Blocker for final Set 25 integration closure only | Reach sufficient-lock threshold, approve downstream amendment map and clear blocker-level maritime debt. |

The blockers do not prevent approval of this backlog. They determine which tasks can start and which status claims remain prohibited.

# 13. POC Retirement Execution Backlog

The following retirement sequence is mandatory before a production shipping profile is trusted:

1. Inventory every POC identity, scene, script symbol, localisation key, seed branch, coordinate, asset, save fixture and test.
2. Classify each record as Retired Identity, Reusable Mechanic, Reusable Asset, Regression Fixture, Obsolete Implementation or Historical Documentation.
3. Move regression-only material into the protected archive/test namespace and profile.
4. Rename and rebind reusable generic assets/mechanics without aliasing retired content directly into production identities.
5. Remove fixed Forest Hamlet, valley, named villagers, watchtower, goblin raid, fixed cave/ruin/camp and fixed portal assumptions from active sources.
6. Add POC leakage validation over documents, canonical data, generated registries, scenes, scripts, localisation, tests and manifests.
7. Produce a clean production build-profile report proving no shipping dependency on the archive pack.

POC saves may remain regression fixtures. Normal production compatibility begins from the approved production baseline defined by 25A and the rewritten Document 18.

# 14. Production Documentation Revision Programme

The documentation lane is part of production, not optional editorial cleanup. The current main documents contain executable design assumptions used by later code and content; leaving them contradictory would create duplicate authority.

## 14.1 Required order

1. Read-only repository and technical discovery.
2. Document 18 v1.0 rewrite for Godot/Summer Engine.
3. Documents 00-02 revision pack.
4. Document 03 replacement.
5. Document 04 replacement.
6. Document 06 replacement.
7. Document 05 replacement.
8. Document 11 replacement.
9. Documents 07-10 revision pack.
10. Documents 12-17 revision pack.
11. Forge and settlement amendment maps.
12. Set 26 downstream amendment map when sufficiently locked.
13. Final source-of-truth audit and 25A/25L closure revisions.

The order may overlap review work, but a downstream document cannot assume an upstream replacement has passed its gate.

# 15. Master Backlog Architecture

The master backlog uses work packages rather than one enormous implementation prompt. Packages are organised by lanes and gates; each package decomposes into task cards after exact repository paths are known.

| Layer | Purpose | Example |
| --- | --- | --- |
| Programme | Document Set 25 production conversion. | Leyforge Post-Atlas Production Programme. |
| Milestone gate | Coherent readiness threshold. | G3 Registry and Validation Foundation. |
| Lane | Owner/dependency grouping. | REG, WLD, SAVE, GAME, ASSET. |
| Work package | Bounded deliverable with dependencies and gate. | REG-001 Definition Envelope and ID Resolver. |
| Task card | Smallest Summer Engine change. | Add resolver interface and unit tests in exact listed files. |
| Evidence record | Proof tied to revision/build. | Validator report, test output, screenshot, profile or approval. |

The Appendix A register contains the current package-level backlog. It is not a calendar estimate and does not imply that all packages can be worked in parallel.

# 16. Work-Package Identity, Status and Dependency Rules

## 16.1 ID prefixes

| Prefix | Lane |
| --- | --- |
| DOC | Documentation, audit, governance and source integration. |
| TEC | Technical foundation and shared services. |
| REG / PACK | Registry, compiler, pack and generated-data pipeline. |
| VAL | Validators, seed QA, migration fixtures and evidence. |
| DATA | Canonical Core data conversion and snapshot. |
| WLD | Seed lineage, world topology, biomes, placement and repair. |
| SAVE / SIM | Persistence, migration, LOD and unloaded simulation. |
| GAME | Blocks, items, transactions, NPCs, ecology, automation, magic, adventure and combat. |
| REALM | Realm instances, Verdant Covenant and Ancestral Veil. |
| AST / UI | Forge/runtime assets, presentation, UI and accessibility. |
| PERF / MP / REL | Performance, multiplayer readiness and release integration. |
| SET26 | Maritime admission and final integration. |

## 16.2 Planning statuses

- **Ready:** source and dependencies exist for the next bounded task-card pass.
- **Ready after gate:** no design contradiction remains, but a named predecessor must pass.
- **Blocked:** a missing authority, file map, schema, evidence or decision prevents safe work.
- **Conditional:** approved scope whose production depends on a named technical/content gate.
- **Parallel / staged:** may advance within extension boundaries while other lanes continue.
- **Deferred:** not selected for the current milestone.
- **Complete:** only after acceptance evidence exists; no package in this draft is marked complete by prose alone.

A package may be split when its changed-file set or acceptance suite becomes too broad. Packages may not be merged merely to reduce task count.

# 17. Summer Engine Task Contract

Every task card must contain all fields below. Missing fields block execution.

| Field | Required Content |
| --- | --- |
| Task ID and title | Stable unique ID and one action-oriented objective. |
| Source authority | Exact documents, sections, decisions, schema versions and package IDs. |
| Current-state evidence | Repository paths, existing classes/resources, test state and known constraints discovered before editing. |
| Dependencies | Passed task/gate IDs and required build profile. |
| Objective | One measurable result; not a broad system name. |
| In scope | Exact behaviours and outputs included. |
| Out of scope | Related behaviours explicitly excluded. |
| Changed files | Exhaustive existing/new/deleted paths. Unknown paths make the task Not Ready. |
| Data/migration effect | IDs, schemas, saves, generated outputs, aliases and compatibility impact. |
| Command IDs | Required validation, tests, compile, seed, migration or profile commands. |
| Acceptance tests | Concrete pass/fail scenarios, including negative and regression tests. |
| Evidence outputs | Report/log/build/profile/screenshot/approval destinations and retention. |
| Rollback | Revert strategy, generated-file cleanup, save backup/restore and migration rollback. |
| Risk and debt | Known failure modes, follow-up debt and gate impact. |
| Owner/reviewer | Implementer, architecture reviewer, content reviewer and final approver where applicable. |

> **Task Size Rule**
>
> A task should normally produce one service, one schema family, one importer, one validator, one migration, one bounded data batch, one UI flow or one test fixture set. If it cannot be reviewed and rolled back as a single change, split it.

# 18. Changed-File, Branch and Repository Discipline

- The first repository audit is read-only and freezes the existing project map.
- Every implementation task uses a dedicated branch or isolated change set linked to its task ID.
- A task may change only its declared files. Newly discovered required files trigger task revision or a separate task.
- Generated files are identified as generated and rebuilt through commands; they are not manually edited.
- Canonical source, generated runtime product, save fixture and evidence output live in separate path classes.
- Schema, registry and migration changes include version increments and compatibility notes.
- Large formatting, rename or generated-output changes are separated from behavioural changes where practical.
- The task's rollback is tested before merge when saves, migrations, pack removal or world data are affected.
- No task commits secrets, personal paths, licensed source media without permission, temporary caches or unreviewed AI output.

Exact folder names remain for the repository audit and Document 18. Appendix F defines required ownership classes rather than pretending those paths already exist.

# 19. Validation Commands, Evidence and Rollback Contract

| Command ID | Role | Implementation Note |
| --- | --- | --- |
| CMD-DOC-AUDIT | Audit document metadata, IDs, dependencies, supersession and POC references. | Exact script/syntax chosen by Document 18/25L implementation pass. |
| CMD-REG-VALIDATE | Validate schemas, IDs, field ownership, relationships and completeness. | Must support source locations and machine-readable report. |
| CMD-PACK-RESOLVE | Resolve a build profile and emit deterministic pack lockfile. | Must test required/optional/missing/incompatible dependencies. |
| CMD-REG-COMPILE | Normalise canonical data and generate registry snapshot/resources. | Must emit semantic hashes and compile provenance. |
| CMD-POC-SCAN | Reject shipping-profile references to retired POC identities or arrangements. | Scans documents, data, scenes, scripts, localisation and manifests. |
| CMD-TEST-HEADLESS | Run bounded Godot unit/integration suites without editor interaction. | Exact Godot invocation owned by Document 18. |
| CMD-SEED-BATCH | Generate and validate named seed corpora and repair traces. | Supports golden, broad, adversarial and pack-profile corpora. |
| CMD-REACHABILITY | Prove required capability paths for supported profiles. | Emits provider, cost, permission, route and failure trace. |
| CMD-SAVE-DRYRUN | Load/migrate/save fixtures against a temporary copy and validate postconditions. | Never overwrites the last good fixture. |
| CMD-PROFILE-PACKAGED | Profile representative packaged scenarios and compare baselines. | Emits frame, memory, simulation, audio/effect, save and network evidence. |
| CMD-EVIDENCE-FREEZE | Freeze reports, lockfiles, build signature and approvals into a release bundle. | Required for Integrated/Released gate evidence. |

Task cards reference stable command IDs until Document 18 maps them to exact commands. A command ID is not evidence by itself; the retained output must include build/profile inputs, tool version, result, timestamp, relevant source revision and failure details.

Rollback may use version-control revert, pack/profile rollback, generated-output regeneration, migration reversal where explicitly supported, or restoration from a verified pre-change backup. A rollback note that merely says “revert changes” is insufficient for save or migration tasks.

# 20. Production Lanes and Workstream Ownership

| Lane | Package Count | Primary Owner | Gate Effect |
| --- | --- | --- | --- |
| ASSET | 4 | Owning main document + Document 18/Set 25 contracts | See Appendix A |
| DATA | 6 | Owning main document + Document 18/Set 25 contracts | See Appendix A |
| DATA/ASSET | 1 | Owning main document + Document 18/Set 25 contracts | See Appendix A |
| DATA/UI | 1 | Owning main document + Document 18/Set 25 contracts | See Appendix A |
| DOC | 15 | Owning main document + Document 18/Set 25 contracts | See Appendix A |
| DOC/TEC | 1 | Owning main document + Document 18/Set 25 contracts | See Appendix A |
| GAME | 15 | Owning main document + Document 18/Set 25 contracts | See Appendix A |
| MP | 2 | Owning main document + Document 18/Set 25 contracts | See Appendix A |
| PERF | 3 | Owning main document + Document 18/Set 25 contracts | See Appendix A |
| REALM | 3 | Owning main document + Document 18/Set 25 contracts | See Appendix A |
| REG | 6 | Owning main document + Document 18/Set 25 contracts | See Appendix A |
| REG/PACK | 3 | Owning main document + Document 18/Set 25 contracts | See Appendix A |
| REG/SAVE | 1 | Owning main document + Document 18/Set 25 contracts | See Appendix A |
| REL | 2 | Owning main document + Document 18/Set 25 contracts | See Appendix A |
| SAVE | 5 | Owning main document + Document 18/Set 25 contracts | See Appendix A |
| SET26 | 3 | Owning main document + Document 18/Set 25 contracts | See Appendix A |
| SIM | 3 | Owning main document + Document 18/Set 25 contracts | See Appendix A |
| TEC | 8 | Owning main document + Document 18/Set 25 contracts | See Appendix A |
| UI | 3 | Owning main document + Document 18/Set 25 contracts | See Appendix A |
| VAL | 6 | Owning main document + Document 18/Set 25 contracts | See Appendix A |
| VAL/SAVE | 1 | Owning main document + Document 18/Set 25 contracts | See Appendix A |
| VAL/WLD | 1 | Owning main document + Document 18/Set 25 contracts | See Appendix A |
| WLD | 8 | Owning main document + Document 18/Set 25 contracts | See Appendix A |

The counts are planning decomposition, not staffing quotas. One owner may coordinate multiple lanes, but field ownership and review responsibility remain distinct.

# 21. Technical Discovery and Document 18 Rewrite Lane

This lane converts current project reality into the authoritative Godot/Summer Engine architecture. It begins with read-only inspection, not code changes. Document 18 must then name the actual module/service topology, project paths, toolchain, build profiles, command syntax, testing integration, voxel/world architecture, persistence, LOD, authority, performance measurement and staged implementation sequence. Unreal module maps and the Forest Hamlet technical Definition of Done are archived.

| Package | Title | Status | Primary Output | Gate |
| --- | --- | --- | --- | --- |
| DOC-003 | Read-only Godot/Summer Engine repository audit | Ready | Project map, existing systems, dependencies, risks and exact file inventory | G0 |
| DOC-004 | Rewrite Document 18 v1.0 | Blocked by DOC-003 | Godot/Summer Engine architecture, commands, budgets plan and implementation stages | G1 |
| TEC-001 | Approve project/module/service topology | Blocked by DOC-004 | Module ownership, dependency direction and communication map | G2 |
| TEC-002 | Establish logging, diagnostics and build identity | Depends TEC-001 | Structured logs, build/pack/world signature display and diagnostics overlay | G2 |
| TEC-003 | Establish automated test and fixture harness | Depends TEC-001 | Headless unit/integration fixture framework | G2 |
| TEC-004 | Establish CI and evidence collection baseline | Depends TEC-002/003 | Repeatable validation/test/package jobs and retained reports | G2 |
| TEC-005 | Establish command/event/transaction foundation | Depends TEC-001 | Authoritative commands, events and integer transaction records | G2 |
| TEC-006 | Establish time, scheduler and bounded async work | Depends TEC-001 | Deterministic scheduling and cancellable bounded jobs | G2 |
| TEC-007 | Establish feature/build-profile service | Depends TEC-001 | Core/optional/dev/archive profile resolution | G2 |
| TEC-008 | Establish runtime authority context | Depends TEC-005 | Solo-host authoritative context with multiplayer-ready request boundaries | G2 |

# 22. Registry Kernel and Generated-Data Lane

The first registry implementation is deliberately representative. It proves definition envelopes, IDs, schemas, facets, relationships, capabilities, pack loading, compilation and generated Godot Resources using one cross-domain fixture before bulk conversion. It must expose source locations and explainability; no system may hard-code content identities as an alternative registry.

| Package | Title | Status | Primary Output | Gate |
| --- | --- | --- | --- | --- |
| REG-001 | Implement definition envelope and qualified ID resolver | Depends TEC-001/003 | Representative immutable definitions and reference resolution | G3 |
| REG-002 | Implement schema and extension-facet registry | Depends REG-001 | Registered schemas, conditional fields and field ownership | G3 |
| REG-003 | Implement relationship graph and reverse indexes | Depends REG-002 | Typed edges, derived inverses and graph queries | G3 |
| REG-004 | Implement capability, suitability and exclusion queries | Depends REG-003 | Provider selection and explainability traces | G3 |
| REG-005 | Implement fallback groups and deterministic repair contracts | Depends REG-004 | Bounded repair plans with trace output | G3 |
| REG-006 | Implement content-pack manifest parser and resolver | Depends REG-001; TEC-007 | Dependency resolution and deterministic load plan | G3 |
| REG-007 | Implement canonical JSON normaliser/compiler | Depends REG-002/006 | Normalised definitions, semantic hashes and compile reports | G3 |
| REG-008 | Implement spreadsheet import/export round trip | Depends REG-007 | Schema-aware bulk authoring with loss detection | G3 |
| REG-009 | Implement generated Godot Resource output | Depends REG-007; DOC-004 | Typed generated resources and build signatures | G3 |
| REG-010 | Implement aliases, tombstones and definition migration | Depends REG-001/006 | Versioned identity recovery and deprecation path | G3 |

# 23. Content Packs, Authoring, Import/Export and Migration Lane

This lane turns 25D into tools and versioned records: pack manifests, dependency resolution, normalised JSON, spreadsheet round trips, semantic hashes, aliases, tombstones, world manifests, quarantine and migration. Core-only and one optional fixture pack are sufficient for the first vertical proof; Set 26 becomes the first major expansion admission case later.

| Package | Title | Status | Primary Output | Gate |
| --- | --- | --- | --- | --- |
| REG-006 | Implement content-pack manifest parser and resolver | Depends REG-001; TEC-007 | Dependency resolution and deterministic load plan | G3 |
| REG-007 | Implement canonical JSON normaliser/compiler | Depends REG-002/006 | Normalised definitions, semantic hashes and compile reports | G3 |
| REG-008 | Implement spreadsheet import/export round trip | Depends REG-007 | Schema-aware bulk authoring with loss detection | G3 |
| REG-010 | Implement aliases, tombstones and definition migration | Depends REG-001/006 | Versioned identity recovery and deprecation path | G3 |
| SAVE-004 | Implement ordered migration chain and postconditions | Depends REG-010; SAVE-003 | Dry-run, backup-first, deterministic migrations | G6 |
| SAVE-005 | Implement absent-pack quarantine/reactivation | Depends SAVE-001/004; VAL-004 | No silent deletion or reinterpretation of optional content | G6 |

# 24. Validation, Seed QA and Release-Evidence Lane

Validators are built alongside the features they gate. Schema/reference and POC leakage checks precede bulk data. Reachability precedes production world acceptance. Seed corpora precede balance claims. Save/migration, LOD, conservation, authority, performance and accessibility evidence precede Integrated or Released status.

| Package | Title | Status | Primary Output | Gate |
| --- | --- | --- | --- | --- |
| VAL-001 | Implement schema/identity/reference validator | Depends REG-001-003 | CLI/editor validation with severity and source location | G3 |
| VAL-002 | Implement field ownership and generated-file tamper checks | Depends REG-002/007 | Duplicate truth and generated-edit failures | G3 |
| VAL-003 | Implement POC leakage and archive-isolation scanner | Depends DOC-002; REG-006 | Shipping-profile rejection of retired content and literals | G3 |
| VAL-004 | Implement pack combination and removal fixtures | Depends REG-006/010 | Core-only, optional, missing, quarantine and reactivation tests | G3 |
| VAL-005 | Implement capability reachability proof runner | Depends REG-004/005 | CAP-00 to CAP-10 proof and failure traces | G4 |
| VAL-006 | Implement deterministic seed-batch runner | Depends WLD-001; TEC-003 | Golden, broad, adversarial and pack-profile seed corpora | G5 |
| VAL-007 | Implement save/migration dry-run fixture runner | Depends SAVE-003-006 | Backup, postcondition, rollback and compatibility evidence | G6 |
| VAL-008 | Implement frozen release evidence bundle | Depends TEC-004 and all gate suites | Build lockfile, reports, profiles, approvals and traceable artifacts | G8 |

# 25. Core Registry Data Conversion Lane

Bulk data conversion begins only after a representative cross-domain fixture compiles, loads and validates. The 36 packages, 214 Atlas foundations, 217 block families, 296 item families, 105 chains and 86 asset manifests are converted in batches with source ownership and reverse-reference reports. Counts are obligations, not a reason to generate unused filler.

| Package | Title | Status | Primary Output | Gate |
| --- | --- | --- | --- | --- |
| DATA-001 | Create representative cross-domain registry fixture | Depends REG-001-009 | One definition per major domain, pack, relationship and state class | G3 |
| DATA-002 | Convert 36 package identities and 214 Atlas foundations | Depends DATA-001; DOC-010-012 | Validator-ready package and world-context records | G4 |
| DATA-003 | Convert 217 block families | Depends DOC-006; DATA-001 | Block-family source workbook/JSON and generated registry | G4 |
| DATA-004 | Convert 296 item families | Depends DOC-007; DATA-003 | Item-family source workbook/JSON and generated registry | G4 |
| DATA-005 | Convert 105 production-chain contracts | Depends DOC-008/009; DATA-003/004 | Resource/recipe/provenance chain records and tests | G4 |
| DATA-006 | Create 86 asset requirement manifests | Depends DOC-013; DATA-002-005 | Forge-ready asset package manifests and fallback assignments | G7 |
| DATA-007 | Create localisation, Codex and map-symbol source records | Depends DATA-002-006 | Localisation keys, knowledge state and presentation references | G7 |
| DATA-008 | Freeze Core registry snapshot v1 | Depends DATA-002-007; VAL-001-005 | Immutable Core content lockfile and semantic hash | G7 |

# 26. Voxel, Blocks, Items, Resources and Recipes Lane

This lane implements the physical world/inventory/transformation contracts owned by replacement Documents 03-06. It preserves the block/item boundary, state conservation, capability substitutes, provenance and authoritative transactions. It starts with representative soil/stone/timber, a small tool and food set, one station, one machine and one mana infrastructure chain before the full catalogue.

| Package | Title | Status | Primary Output | Gate |
| --- | --- | --- | --- | --- |
| GAME-001 | Implement block runtime, states and generated shape bindings | Depends DATA-003; REG-009; WLD-008 | Place, mine, state, drop and persist representative blocks | G6 |
| GAME-002 | Implement item stack, instance state and ownership baseline | Depends DATA-004; SAVE-002 | Conserving stacks, durability/charge/condition and provenance references | G6 |
| GAME-003 | Implement recipe/transaction/reservation service | Depends DATA-005; TEC-005 | Deterministic inputs, outputs, by-products, project reservations and rollback | G6 |

# 27. Seed World, Topology, Biomes and Repair Lane

Production worlds use named sub-seeds, typed relationships, suitability, exclusions and bounded repair. The first world kernel proves multiple connected region/biome families, transitions, settlements, resources, ecology, sites and progression capability without fixed tutorial geography. Invalid supported worlds are defects or controlled generation failures, not accepted random outcomes.

| Package | Title | Status | Primary Output | Gate |
| --- | --- | --- | --- | --- |
| WLD-001 | Implement seed lineage and named sub-seed service | Depends TEC-006; REG-001 | Deterministic named RNG streams and trace records | G5 |
| WLD-002 | Implement region/topology graph assembly | Depends WLD-001; REG-003/004 | Connected macro-region graph and route candidates | G5 |
| WLD-003 | Implement biome and transition assembly | Depends WLD-002; DATA-002/003 | Biome placement, edges and meaningful transitions | G5 |
| WLD-004 | Implement bounded land-water/hydrology baseline | Conditional | Rivers/lakes/wetlands/coasts sufficient for land-Core without naval simulation | G5 |
| WLD-005 | Implement structure, settlement and route placement | Depends WLD-003; DATA-002 | Suitability-driven sites with fallbacks and no fixed tutorial arrangement | G5 |
| WLD-006 | Implement resource, ecology and pressure placement | Depends WLD-003/005; DATA-005 | Deposits, habitats, nests, threats and carrying-capacity inputs | G5 |
| WLD-007 | Implement deterministic world repair and reachability check | Depends WLD-002-006; VAL-005 | Bounded repairs or controlled failure with explainable trace | G5 |
| WLD-008 | Implement chunk streaming and explored-world stability contract | Depends DOC-004; WLD-003 | No silent rewrite of explored terrain after updates | G5 |

# 28. Save, Persistence, Migration and Missing-Pack Lane

Every persistent world binds to its seed lineage, registry snapshot, pack lockfile, worldgen versions and migration history. Explored chunks remain stable. Missing optional content is quarantined, not deleted. Failed migration never overwrites the last good save. Fixtures cover aliases, removed definitions, changed schemas, pack reactivation and realm records.

| Package | Title | Status | Primary Output | Gate |
| --- | --- | --- | --- | --- |
| REG-010 | Implement aliases, tombstones and definition migration | Depends REG-001/006 | Versioned identity recovery and deprecation path | G3 |
| SAVE-001 | Implement world manifest and registry snapshot binding | Depends REG-006-010; WLD-001 | World-to-pack/schema/worldgen version binding | G6 |
| SAVE-002 | Implement seed-plus-delta persistence baseline | Depends SAVE-001; WLD-008 | Persistent explored chunks, entity state and world deltas | G6 |
| SAVE-003 | Implement atomic save, backup and failed-load recovery | Depends SAVE-002 | Last-good preservation and explicit recovery path | G6 |
| SAVE-004 | Implement ordered migration chain and postconditions | Depends REG-010; SAVE-003 | Dry-run, backup-first, deterministic migrations | G6 |
| SAVE-005 | Implement absent-pack quarantine/reactivation | Depends SAVE-001/004; VAL-004 | No silent deletion or reinterpretation of optional content | G6 |

# 29. Simulation LOD, Time, Authority and Conservation Lane

Nearby actors, medium-detail services and distant summaries must preserve stable identity, quantities, ownership, projects, danger and aftermath. Promotion/demotion and catch-up are deterministic and bounded. Solo uses one authoritative local world context; later multiplayer uses the same command/request boundaries rather than parallel client-owned truth.

| Package | Title | Status | Primary Output | Gate |
| --- | --- | --- | --- | --- |
| TEC-005 | Establish command/event/transaction foundation | Depends TEC-001 | Authoritative commands, events and integer transaction records | G2 |
| TEC-006 | Establish time, scheduler and bounded async work | Depends TEC-001 | Deterministic scheduling and cancellable bounded jobs | G2 |
| TEC-008 | Establish runtime authority context | Depends TEC-005 | Solo-host authoritative context with multiplayer-ready request boundaries | G2 |
| SIM-001 | Implement persistent entity/settlement/structure records | Depends SAVE-002; REG-001 | Stable runtime state separate from definitions and scenes | G6 |
| SIM-002 | Implement LOD promotion/demotion contract | Depends SIM-001; TEC-006 | Identity and resource-preserving detail transitions | G6 |
| SIM-003 | Implement bounded unloaded-world catch-up | Depends SIM-002 | Deterministic summaries and catch-up limits | G6 |

# 30. NPC Civilisation, Settlement, Economy and Trade Lane

Generated NPCs and settlements consume real resources through Housing, Provisions, Health, Work, Safety, Infrastructure and Morale. Projects, warehouses, trade, permissions, damage, repair and history use authoritative records. No fixed Forest Hamlet roster or watchtower chain survives as production content.

| Package | Title | Status | Primary Output | Gate |
| --- | --- | --- | --- | --- |
| GAME-004 | Implement storage, warehouse and trade transaction baseline | Depends GAME-002/003; SIM-001 | Authoritative inventories, donations, contracts and reservations | G6 |
| GAME-005 | Implement NPC identity, jobs, needs and schedules baseline | Depends SIM-001/002; DATA-002 | Generated named NPCs and seven-need service links | G6 |
| GAME-006 | Implement settlement stages, projects and persistent aftermath | Depends GAME-004/005; WLD-005 | Seed-generated settlements, projects, damage, repair and history | G6 |

# 31. Automation, Magic and Practical Infrastructure Lane

Mechanical logistics, power, storage, processing, mana, wards and runes are implemented as physical, conserving infrastructure connected to settlements and world state. The first chain is selected for representative coverage, not as a guaranteed world script. Distant networks use summary transactions that reconcile with detailed simulation.

| Package | Title | Status | Primary Output | Gate |
| --- | --- | --- | --- | --- |
| GAME-009 | Implement automation power/logistics/processing baseline | Depends GAME-001-004; TEC-005 | Mechanical supply chain with authoritative flow and LOD summary | G6 |
| GAME-010 | Implement practical mana, ward and rune infrastructure baseline | Depends GAME-001-003/009 | Mana storage/flow, ward service and practical magic interfaces | G6 |

# 32. Ecology, Creatures, Raids, Bosses and Aftermath Lane

Ecology uses bounded populations, habitats, nests, migration pressure and local consequences. Creatures have readable roles and conserving drops. Raids and bosses arise from package/world state rather than fixed schedules. Boss pressure, confrontation alternatives and persistent aftermath are first-class records.

| Package | Title | Status | Primary Output | Gate |
| --- | --- | --- | --- | --- |
| GAME-007 | Implement ecology populations, nests and migration pressure | Depends WLD-006; SIM-002/003 | Bounded populations and local pressure without full-world actors | G6 |
| GAME-008 | Implement creature AI profiles, drops and village interaction | Depends GAME-007; DATA-004/005 | Wildlife/monster roles, readable behaviour and conserving rewards | G6 |
| GAME-014 | Implement combat, raid and defence contribution baseline | Depends GAME-008/009/010 | Damage packets, guards, structures, threats and aftermath records | G6 |
| GAME-015 | Implement regional/wandering boss pressure framework | Depends GAME-007/011-014 | Territory pressure, confrontation alternatives, rewards and persistent aftermath | G6 |

# 33. Structures, Dungeons, Quests and World-State Lane

Structures use modular grammars, markers, ownership and states. Dungeons require solvability and return safety. Quests/events bind to stable existing participants and locations, cannot invent unavailable content, and leave persistent evidence. Restoration, occupation and reoccupation are tested across LOD.

| Package | Title | Status | Primary Output | Gate |
| --- | --- | --- | --- | --- |
| GAME-011 | Implement structure grammar, occupation and restoration baseline | Depends WLD-005; GAME-001/006 | Modular structures with states, markers, ownership and repair | G6 |
| GAME-012 | Implement dungeon grammar and solvability validation | Depends GAME-011; VAL-006 | Generated rooms/routes, return safety, rewards and state transitions | G6 |
| GAME-013 | Implement quest/event binding and world-state chronicle | Depends GAME-005-012; REG-003 | Stable participant bindings, events, histories and aftermath | G6 |

# 34. Verdant Covenant and Ancestral Veil Lane

Verdant Covenant is a complete conditional realm package requiring its own worldgen, ecology, structures, resources, progression, authority, save and return path. Ancestral Veil remains a bounded, non-extractive teaser with guaranteed return and no hidden Core dependency. Neither enters implementation before the general realm-instance foundation passes.

| Package | Title | Status | Primary Output | Gate |
| --- | --- | --- | --- | --- |
| REALM-001 | Implement realm-instance and route foundation | Depends SAVE-001-005; WLD-001-008 | Derived-seed world instances, route anchors and safe return | G6 |
| REALM-002 | Implement Verdant Covenant complete conditional package | Conditional on realm gates | Playable realm package through CAP-10 with ecology, sites and authority | G7 |
| REALM-003 | Implement Ancestral Veil bounded teaser | Conditional after REALM-001 | Non-extractive threshold route, memory evidence and guaranteed return | G7 |

# 35. Forge, Assets, Animation, Audio, VFX and Presentation Lane

Asset work starts from approved requirement manifests and reusable kits. Gameplay owns meaning; Forge owns editable source; runtime products are generated and traceable. Critical events require minimal complete audio/VFX/UI/accessibility attachments even when dedicated production tools are unfinished. Rights and source provenance block release when unresolved.

| Package | Title | Status | Primary Output | Gate |
| --- | --- | --- | --- | --- |
| DATA-006 | Create 86 asset requirement manifests | Depends DOC-013; DATA-002-005 | Forge-ready asset package manifests and fallback assignments | G7 |
| AST-001 | Implement Forge manifest import and runtime-product linkage | Depends DATA-006; DOC-013; REG-009 | Source-traceable import and generated product signatures | G7 |
| AST-002 | Produce shared block/material/item foundation kits | Depends AST-001; DATA-003/004 | Representative reusable visual and collision families | G7 |
| AST-003 | Produce creature body-plan, rig and animation foundations | Depends AST-001; GAME-008 | Reusable rigs, clips, sockets, events and LOD mappings | G7 |
| AST-004 | Produce audio/VFX/event/accessibility foundation | Depends AST-001; TEC-002 | Critical cue bindings and imported validated assets | G7 |

# 36. UI/UX, Accessibility and Player-Trust Lane

Developer inspectors arrive early because explainability is required for registries, seeds, packs and world state. Player UI follows owning system contracts, supports controller/touch foundations, and never invents authority. Critical cues have equivalent visual/audio/text/haptic alternatives; reduced motion and flash profiles are tested.

| Package | Title | Status | Primary Output | Gate |
| --- | --- | --- | --- | --- |
| DATA-007 | Create localisation, Codex and map-symbol source records | Depends DATA-002-006 | Localisation keys, knowledge state and presentation references | G7 |
| UI-001 | Implement developer registry/world/seed inspectors | Depends REG/VAL/WLD foundations | Explainability, graph, pack, seed and state diagnostics | G6 |
| UI-002 | Implement Core player-facing inventory/crafting/world UI | Depends GAME-001-013; DATA-007 | Searchable, controller-ready, knowledge-aware production UI | G7 |
| UI-003 | Implement accessibility and reduced-effects profiles | Depends AST-004; UI-002 | Equivalent cues, reduced motion/flash and readable state alternatives | G7 |

# 37. Performance, Scalability and Profiling Lane

Planning envelopes become numeric budgets only after representative packaged scenarios are profiled on approved hardware tiers. Scenarios include dense settlements, machines, ecology, dungeons, realms, save/load, split local players where selected and optional packs. Budget failure triggers scope/reuse/LOD redesign before release.

| Package | Title | Status | Primary Output | Gate |
| --- | --- | --- | --- | --- |
| PERF-001 | Establish packaged representative profiling scenarios | Depends G6 systems; TEC-004 | Dense settlement, automation, dungeon, realm and save workloads | G7 |
| PERF-002 | Approve numeric hardware and simulation budgets | Depends PERF-001 | Measured frame, memory, chunk, entity, audio, effect, save and network limits | G7 |
| PERF-003 | Optimise LOD, aggregation and streaming against budgets | Depends PERF-002 | Passing representative workloads without state loss | G8 |

# 38. Multiplayer-Ready Architecture and Reconnection Lane

Core remains solo-first unless Ash changes the shipping decision, but authority, persistent IDs, ownership and command validation are foundational. Representative host/client, invalid request, late-join, reconnection and state reconstruction tests prevent designs that would require replacement later.

| Package | Title | Status | Primary Output | Gate |
| --- | --- | --- | --- | --- |
| TEC-008 | Establish runtime authority context | Depends TEC-005 | Solo-host authoritative context with multiplayer-ready request boundaries | G2 |
| MP-001 | Implement multiplayer-ready request/authority test harness | Depends TEC-008; GAME-001-014 | Host authority, invalid request rejection and deterministic outcomes | G7 |
| MP-002 | Implement reconnection and late-join state reconstruction tests | Depends MP-001; SAVE/SIM | Representative world, inventory, settlement, machine and realm reconstruction | G8 |

# 39. Set 26 Expansion Admission and Final Integration Lane

Set 26 may proceed in parallel within the 25B-25E contracts. Final 25L closure waits for selected maritime packages to reach sufficient lock, for 26N/26O to publish registry/technical/amendment handoffs, and for all blocker-level debt to have evidence or explicit exclusion. Land-Core implementation does not need to wait for the entire maritime programme.

| Package | Title | Status | Primary Output | Gate |
| --- | --- | --- | --- | --- |
| DOC-014 | Set 26 downstream amendment map | Blocked by sufficient Set 26 specification | Maritime-to-main-document/registry/Forge/technical map | G9 |
| DOC-015 | Final source-of-truth integrity audit | Depends DOC-004-014 | No duplicate truth, stale references or unowned blocker debt | G9 |
| DOC-016 | 25A and 25L final integration revisions | Depends DOC-014/015 | Final maritime-aware closure versions | G9 |
| SET26-001 | Admit Set 26 schemas/packs into general extension contracts | Parallel / staged | No parallel registry, duplicate ownership or unsafe removal | G9 |
| SET26-002 | Integrate selected maritime amendments and tasks | Blocked by sufficient lock | Main-document, registry, Forge, save, validation and technical updates | G9 |
| SET26-003 | Run final Set 26/Set 25 closure audit | Depends SET26-001/002 | No unowned blocker maritime integration debt | G9 |

# 40. Critical Dependency Graph

```text
Set 25 v0.1 approval
        |
        +--> DOC-001/002 source and POC registers
        +--> DOC-003 read-only repository audit
                    |
                    v
              DOC-004 Document 18 v1.0
                    |
        +-----------+-------------------+
        |                               |
        v                               v
 Main-document revisions          TEC test/diagnostic foundation
        |                               |
        +---------------+---------------+
                        v
              REG/PACK/VAL representative kernel
                        |
                        v
                 DATA-001 vertical fixture
                        |
          +-------------+--------------+
          |                            |
          v                            v
   Documents 03-06/11 v1.0        Registry bulk conversion
          |                            |
          +-------------+--------------+
                        v
             WLD + SAVE + SIM foundations
                        |
                        v
      Physical gameplay + living world + adventure
                        |
          +-------------+--------------+
          |                            |
          v                            v
      Forge/assets/UI              Realm packages
          |                            |
          +-------------+--------------+
                        v
            Packaged profiling and Core evidence
                        |
                        v
             Core Integration Candidate / review

Parallel lane: Set 26 -> 25B-25E admission -> 26N/26O handoff
                        |
                        v
          DOC-014/015/016 final Set 25 closure revision
```

The critical path prevents bulk data and asset production from preceding the representative registry/validator proof, and prevents world/simulation content from preceding save, identity and repair contracts.

# 41. Milestone Sequence and Entry/Exit Gates

| Gate | Milestone | Entry | Exit Evidence |
| --- | --- | --- | --- |
| G0 | Source Baseline | 25L approved. | Canonical Set 25 bundle; POC inventory; repository audit; blocker/debt register. |
| G1 | Production Documentation | G0 complete. | Document 18 v1.0 and required Documents 00-17 replacements/revisions approved and indexed. |
| G2 | Technical Test Foundation | G1 technical topology approved. | Diagnostics, test harness, CI, command/event, scheduler and authority contexts pass bounded tests. |
| G3 | Registry and Validation Vertical | G2 complete. | Representative cross-domain fixture compiles, loads, validates and rolls back across one optional pack. |
| G4 | Core Data Foundation | G3 complete and registry documents approved. | Package, block, item and chain batches validate; CAP reachability passes; snapshot candidate exists. |
| G5 | Seed World Kernel | G4 representative data available. | Multiple connected biomes/regions, placements and bounded repair pass seed corpora with no POC content. |
| G6 | Persistent Living Slice | G5 plus save/simulation foundations. | Survival, gathering, crafting, building, NPC settlement, ecology, automation, magic, threats and aftermath persist across save/LOD. |
| G7 | Adventure, Realm and Presentation | G6 stable. | Dungeons/bosses, Verdant conditional package, Veil teaser, asset manifests, UI/accessibility and representative packaged profiles. |
| G8 | Core Integration Candidate | G7 evidence and numeric budgets approved. | Frozen Core snapshot/pack lockfile, migration tests, performance, authority, accessibility and human review. |
| G9 | Set 26 Integration Closure | Selected Set 26 packages sufficiently locked. | Downstream amendments, admission tests and final 25A/25L audit show no unowned blocker debt. |
| G10 | Release Candidate | All selected release gates pass. | Frozen evidence bundle and Ash release approval. |

# 42. Initial Executable Queue

| Queue | Package | Task | Boundary |
| --- | --- | --- | --- |
| Q-001 | DOC-001 | Publish Set 25 source bundle/index | No code changes; create canonical document manifest and checksums. |
| Q-002 | DOC-002 | POC retirement inventory | Read-only scan of 00-18 and project sources; record exact disposition. |
| Q-003 | DOC-003 | Repository audit | Read-only inspection; output exact Godot/Summer Engine file and dependency map. |
| Q-004 | DOC-004 | Document 18 v1.0 rewrite | Use audit evidence; no implementation assumptions without source. |
| Q-005 | DOC-005 | Documents 00-02 revision pack | Remove active POC framing and lock final progression/start rules. |
| Q-006 | DOC-006 | Document 03 v1.0 replacement | Translate 25H families and 25K presentation requirements. |
| Q-007 | DOC-007 | Document 04 v1.0 replacement | Translate 25I families and item-state/provenance rules. |
| Q-008 | DOC-008 | Document 06 v1.0 replacement | Translate capability progression and material ecology. |
| Q-009 | DOC-009 | Document 05 v1.0 replacement | Instantiate recipe/transaction/substitution contracts. |
| Q-010 | DOC-010 | Document 11 v1.0 replacement | Define production seed assembly and repair before world implementation. |
| Q-011 | DOC-011 | Documents 07-10 revision pack | Bind living-world systems to production packages. |
| Q-012 | DOC-012 | Documents 12-17 revision pack | Bind adventure, realm, combat and UI systems to production packages. |
| Q-013 | TEC-001 | Approve module/service topology | Begins only after Document 18 approval. |
| Q-014 | TEC-002/003 | Diagnostics and test harness baseline | First bounded technical implementation tasks. |
| Q-015 | REG-001 | Definition envelope and ID resolver | Small representative implementation with unit tests. |
| Q-016 | REG-002 | Schema/extension registry | Adds one schema family at a time; no bulk content. |
| Q-017 | REG-006/007 | Pack resolver and compiler spike | Core-only plus one optional fixture pack. |
| Q-018 | VAL-001/003 | Core validator and POC scanner | Blocks bulk conversion until passing. |
| Q-019 | DATA-001 | Representative cross-domain fixture | Proves one vertical chain before 217/296/105 bulk conversion. |
| Q-020 | REG-009 | Generated Godot Resource output | Proves canonical source -> generated runtime product -> load test. |

The first twelve queue items are documentation/discovery work. The first code-bearing tasks begin only after Document 18 v1.0 and exact changed-file paths are approved. The representative fixture deliberately precedes bulk conversion.

# 43. Conditional, Deferred and Tooling-Research Work

## 43.1 Conditional Core work

- Core bounded water/coast baseline pending Document 11 and Set 26-compatible interface.
- Root-Below/megadungeon breadth pending dungeon grammar and performance proof.
- Verdant Covenant pending realm-instance, save, return-route, ecology and budget gates.
- Ancestral Veil teaser pending safe-return and non-extractive state tests.
- Crossbows, advanced sensors, conveyors and utility pipes may move between internal milestones without removing their family contracts.
- Playable multiplayer remains later unless feasibility and scope are explicitly approved; authority readiness is not deferred.

## 43.2 Tooling Research

- Unsupported locomotion/body plans, large mobile structures and complex fluid/physics systems remain research until bounded prototypes meet redesign triggers.
- Dedicated Audio Forge and VFX/Particle Forge production software remains deferred; imported, schema-valid assets and minimal event bindings are allowed.
- Full public executable mod scripting, workshop distribution and moderation are not part of the initial data-pack-first scope.

## 43.3 Later expansion

Atlas foundations outside the frozen 25F scope and full maritime content outside admitted Set 26 packages remain Later Expansion or their approved tier. They may not enter Core by opportunistic implementation.

# 44. Production Board, Evidence and Integration-Debt Tracking

The production board must expose, at minimum:

- task/package ID, title, lane, status, owner and reviewer;
- source documents and decision IDs;
- dependency and gate status;
- exact changed files and branch/change set;
- command IDs and latest result;
- evidence locations and build/profile signature;
- blockers, risks, integration debt and deferral expiry;
- migration/save impact;
- Set 26 or optional-pack exposure;
- approval history.

Chat history is not the canonical backlog. The board and repository records must be exportable, versioned and reviewable without this conversation.

# 45. Change Control, Substitution and Scope Reduction

- Any change to the frozen Core foundation intake uses 25A/25F change control.
- Dependency-equivalent substitution is permitted only when capability, world role, physical I/O, presentation, fallback and acceptance obligations remain complete.
- Removing a package requires reverse-reference, progression, migration, asset and save impact reports.
- Adding a package requires budget, schema, pack, validation, asset and release-admission evidence.
- A task may recommend a redesign but cannot silently change canon, ownership, progression or release tier.
- When performance or production capacity fails, reduce low-value variants, use reusable kits, defer conditional packages or substitute equivalent packages before weakening validation or save safety.
- Set 26 changes enter via extension contracts and amendment records; they do not rewrite Set 25 after every maritime document.

# 46. Risks, Redesign Triggers and Escalation

| Risk | Area | Trigger | Response | Owner |
| --- | --- | --- | --- | --- |
| RISK-001 | Documentation outruns implementation evidence | Many contracts may look complete while no runtime services exist. | Keep lifecycle status explicit; no Data Ready or Integrated claim without evidence. | 25L / 25E |
| RISK-002 | Main-document rewrite cascade | A late schema or progression change could force repeated replacements. | Freeze 25B-25J contracts; use change records and migration assessments. | 25A / main-document owners |
| RISK-003 | Registry overengineering | Kernel work could expand before representative content proves value. | Build one vertical representative set across all domains before bulk tooling. | Document 18 / REG lane |
| RISK-004 | Worldgen incoherence despite valid schemas | Tag-valid worlds may still be bland, unfair or contradictory. | Use typed relationships, human review, broad seed corpora and diversity metrics. | 25E / WLD lane |
| RISK-005 | Physical catalogue explosion | 217 block and 296 item families could multiply into unmanageable variants. | Generate eligible variants; require family-first and signature exception approval. | 25H-25I |
| RISK-006 | Save breakage during pack/schema evolution | IDs, worldgen or optional packs may invalidate worlds. | World manifests, aliases, backups, quarantine and migration dry runs. | 25D / SAVE lane |
| RISK-007 | Simulation LOD loses identity or resources | Promotion/demotion may duplicate, delete or alter state. | Conservation ledgers, stable IDs, golden fixtures and catch-up bounds. | 25E / SIM lane |
| RISK-008 | Asset reuse flattens culture and realm identity | Shared kits may make packages indistinguishable. | Preserve bounded signature assets and culture/realm palettes. | 25K / Forge |
| RISK-009 | Set 26 duplicates or bypasses base ownership | Maritime work may invent parallel IDs, fluid truth or save records. | Use 25B-25E admission contracts and final 25L integration audit. | Set 26 / 25L |
| RISK-010 | Summer Engine tasks become broad prompts | Large tasks may change unrelated files and be hard to validate. | Enforce the task contract, exact files, command IDs, rollback and one objective. | 25L |

Escalation to Ash is mandatory when a proposed fix changes locked scope, personhood/representation, progression identity, first playable realm, shipping tier, multiplayer scope, licensing policy, core save compatibility or Set 26 ownership.

# 47. Implementation Readiness Verdict

## 47.1 Verdict

Leyforge is **Foundation-Ready with Blockers**.

The project has enough approved production architecture to begin the bounded source, repository, documentation and representative registry/validation tasks identified in the initial queue. It is not ready for broad feature implementation, bulk asset production, full registry population, production world generation or release scheduling.

## 47.2 Work authorised immediately after approval

- Publish the Set 25 bundle and source index.
- Perform the POC retirement inventory.
- Perform the read-only Godot/Summer Engine repository audit.
- Rewrite Document 18 v1.0 from actual project evidence.
- Begin the main-document revision/replacement programme.
- Prepare exact Summer Engine task cards for the first technical-foundation tasks after Document 18 approval.

## 47.3 Work not yet authorised as production-complete

- Bulk conversion of 217 block, 296 item or 105 chain families.
- Production seed worlds or save compatibility claims.
- Core asset packages claiming Asset Ready.
- Verdant Covenant or Ancestral Veil runtime implementation.
- Public multiplayer or maritime implementation.
- Integrated, Balanced, Release Candidate or Released status.

# 48. Set 25 Completion versus Final Integration Closure

Approval of 25L v0.1 means:

- the planned governance and production-conversion document set is structurally complete;
- the current Core scope and backlog can be used to drive bounded follow-up work;
- unresolved implementation and integration gaps are explicitly recorded.

It does not mean:

- the legacy Documents 00-18 have been updated;
- the POC has been removed from the repository;
- the registry/pack/validator architecture exists in code;
- performance budgets have been proven;
- Set 26 has been incorporated;
- the game is ready for broad implementation or release.

A later 25L v0.2 or next controlled version must perform the final integration audit after Set 26 reaches sufficient lock and the downstream amendment programme is complete enough to verify.

# 49. Decisions Locked by 25L

On approval, the following become working locks:

- The project uses the package-level backlog and G0-G10 gate sequence in this document.
- The first implementation-adjacent work is source/repository discovery and Document 18 replacement, not broad gameplay coding.
- Every Summer Engine task uses the complete task contract, exact changed files, command IDs, evidence and rollback.
- A representative cross-domain registry/pack/validator vertical precedes bulk content conversion.
- Documents 03, 04, 05, 06, 11 and 18 require complete replacements; remaining main documents use controlled revision packs unless later evidence justifies replacement.
- No planning count is an implementation, asset or release claim.
- POC retirement requires repository-level inventory and automated leakage enforcement.
- Core Production may proceed without a hard dependency on Set 26, but final Set 25 integration closure waits for selected Set 26 outputs.
- Exact file paths, command syntax, numeric budgets, staffing and dates are not invented; they are locked after repository audit and Document 18 evidence.
- Ash retains final authority over scope, canon, major architecture, representation, licensing, milestone classification and release.

# 50. Handoff and Next Action Sequence

1. Approve Document 25L v0.1 or record amendments.
2. Bundle Documents 25A-25L with a canonical index, manifest and checksums.
3. Execute DOC-002 and DOC-003: POC retirement inventory and read-only Godot/Summer Engine repository audit.
4. Rewrite Document 18 v1.0 using the repository audit and all Set 25 contracts.
5. Complete the Documents 00-17 replacement/revision sequence.
6. Convert the first technical tasks into exact Summer Engine task cards and implement the registry/validation representative vertical.
7. Proceed through G3-G8 only when each gate's evidence passes.
8. Continue Set 26 in parallel under the admission contracts.
9. After Set 26 sufficient lock and downstream amendments, perform DOC-014-016 and publish the final 25A/25L integration revisions.

The immediate next creation task after this document set is therefore **Document 18 v1.0 - Godot and Summer Engine Technical Implementation Plan**, preceded by the read-only repository/technical discovery report that gives it factual project paths and constraints.

# Appendix A. Master Backlog Register

| ID | Work Package | Lane | Planning Status | Sources / Dependencies | Primary Output | Gate |
| --- | --- | --- | --- | --- | --- | --- |
| DOC-001 | Publish Set 25 source bundle and canonical index | DOC | Ready | 25A-25L | Versioned bundle, manifest, checksums and supersession index | G0 |
| DOC-002 | Create complete POC retirement inventory | DOC | Ready | 25A; 00-18; current repository | Legacy identity/fixture/disposition register | G0 |
| DOC-003 | Read-only Godot/Summer Engine repository audit | DOC/TEC | Ready | Current project repository | Project map, existing systems, dependencies, risks and exact file inventory | G0 |
| DOC-004 | Rewrite Document 18 v1.0 | DOC | Blocked by DOC-003 | All Set 25; repository audit | Godot/Summer Engine architecture, commands, budgets plan and implementation stages | G1 |
| DOC-005 | Revision Pack: Documents 00-02 | DOC | Ready after DOC-004 architecture decisions | 25A; 25F-25G; 25J | Post-POC vision, loop and progression amendments | G1 |
| DOC-006 | Replace Document 03 v1.0 | DOC | Ready after DOC-004 | 25H; 25K; registry contracts | Executable Blocks Registry source document | G1 |
| DOC-007 | Replace Document 04 v1.0 | DOC | Depends DOC-006 interface lock | 25I; 25K | Executable Items Registry source document | G1 |
| DOC-008 | Replace Document 06 v1.0 | DOC | Depends DOC-006/007 identities | 25G; 25J | Capability-based Resource Progression source document | G1 |
| DOC-009 | Replace Document 05 v1.0 | DOC | Depends DOC-006-008 | 25J | Executable Crafting and Recipe Registry source document | G1 |
| DOC-010 | Replace Document 11 v1.0 | DOC | Depends DOC-004 and registry contracts | 25B-25G | Production Biomes and World Generation source document | G1 |
| DOC-011 | Revision Pack: Documents 07-10 | DOC | Depends DOC-006-010 | 25G-25J | Civilisation, automation, magic and ecology amendments | G1 |
| DOC-012 | Revision Pack: Documents 12-17 | DOC | Depends DOC-006-011 | 25G-25K | Structures, factions, realms, events, combat and UI amendments | G1 |
| DOC-013 | Forge document amendment map | DOC | Ready after 25K approval | Forge 21-23; 25K | Exact source/manifest/import responsibilities and amendment list | G1 |
| DOC-014 | Set 26 downstream amendment map | DOC | Blocked by sufficient Set 26 specification | 26A-26O; 25A-25K | Maritime-to-main-document/registry/Forge/technical map | G9 |
| DOC-015 | Final source-of-truth integrity audit | DOC | Depends DOC-004-014 | All active sources | No duplicate truth, stale references or unowned blocker debt | G9 |
| DOC-016 | 25A and 25L final integration revisions | DOC | Depends DOC-014/015 | 25A v0.2; 25L v0.1 | Final maritime-aware closure versions | G9 |
| TEC-001 | Approve project/module/service topology | TEC | Blocked by DOC-004 | Document 18 v1.0 | Module ownership, dependency direction and communication map | G2 |
| TEC-002 | Establish logging, diagnostics and build identity | TEC | Depends TEC-001 | 25D-25E; Document 18 | Structured logs, build/pack/world signature display and diagnostics overlay | G2 |
| TEC-003 | Establish automated test and fixture harness | TEC | Depends TEC-001 | 25E; Document 18 | Headless unit/integration fixture framework | G2 |
| TEC-004 | Establish CI and evidence collection baseline | TEC | Depends TEC-002/003 | 25E | Repeatable validation/test/package jobs and retained reports | G2 |
| TEC-005 | Establish command/event/transaction foundation | TEC | Depends TEC-001 | 25B-25C; Documents 01/18 | Authoritative commands, events and integer transaction records | G2 |
| TEC-006 | Establish time, scheduler and bounded async work | TEC | Depends TEC-001 | 25E; Document 18 | Deterministic scheduling and cancellable bounded jobs | G2 |
| TEC-007 | Establish feature/build-profile service | TEC | Depends TEC-001 | 25D | Core/optional/dev/archive profile resolution | G2 |
| TEC-008 | Establish runtime authority context | TEC | Depends TEC-005 | 25B; 25E; Document 18 | Solo-host authoritative context with multiplayer-ready request boundaries | G2 |
| REG-001 | Implement definition envelope and qualified ID resolver | REG | Depends TEC-001/003 | 25B | Representative immutable definitions and reference resolution | G3 |
| REG-002 | Implement schema and extension-facet registry | REG | Depends REG-001 | 25C | Registered schemas, conditional fields and field ownership | G3 |
| REG-003 | Implement relationship graph and reverse indexes | REG | Depends REG-002 | 25C | Typed edges, derived inverses and graph queries | G3 |
| REG-004 | Implement capability, suitability and exclusion queries | REG | Depends REG-003 | 25C | Provider selection and explainability traces | G3 |
| REG-005 | Implement fallback groups and deterministic repair contracts | REG | Depends REG-004 | 25C; 25E | Bounded repair plans with trace output | G3 |
| REG-006 | Implement content-pack manifest parser and resolver | REG/PACK | Depends REG-001; TEC-007 | 25D | Dependency resolution and deterministic load plan | G3 |
| REG-007 | Implement canonical JSON normaliser/compiler | REG/PACK | Depends REG-002/006 | 25D | Normalised definitions, semantic hashes and compile reports | G3 |
| REG-008 | Implement spreadsheet import/export round trip | REG/PACK | Depends REG-007 | 25D | Schema-aware bulk authoring with loss detection | G3 |
| REG-009 | Implement generated Godot Resource output | REG | Depends REG-007; DOC-004 | 25D; Document 18 | Typed generated resources and build signatures | G3 |
| REG-010 | Implement aliases, tombstones and definition migration | REG/SAVE | Depends REG-001/006 | 25B; 25D | Versioned identity recovery and deprecation path | G3 |
| VAL-001 | Implement schema/identity/reference validator | VAL | Depends REG-001-003 | 25E | CLI/editor validation with severity and source location | G3 |
| VAL-002 | Implement field ownership and generated-file tamper checks | VAL | Depends REG-002/007 | 25D-25E | Duplicate truth and generated-edit failures | G3 |
| VAL-003 | Implement POC leakage and archive-isolation scanner | VAL | Depends DOC-002; REG-006 | 25A; 25E | Shipping-profile rejection of retired content and literals | G3 |
| VAL-004 | Implement pack combination and removal fixtures | VAL | Depends REG-006/010 | 25D-25E | Core-only, optional, missing, quarantine and reactivation tests | G3 |
| VAL-005 | Implement capability reachability proof runner | VAL | Depends REG-004/005 | 25C; 25E; 25G | CAP-00 to CAP-10 proof and failure traces | G4 |
| VAL-006 | Implement deterministic seed-batch runner | VAL/WLD | Depends WLD-001; TEC-003 | 25E; Document 11 v1.0 | Golden, broad, adversarial and pack-profile seed corpora | G5 |
| VAL-007 | Implement save/migration dry-run fixture runner | VAL/SAVE | Depends SAVE-003-006 | 25D-25E | Backup, postcondition, rollback and compatibility evidence | G6 |
| VAL-008 | Implement frozen release evidence bundle | VAL | Depends TEC-004 and all gate suites | 25E | Build lockfile, reports, profiles, approvals and traceable artifacts | G8 |
| DATA-001 | Create representative cross-domain registry fixture | DATA | Depends REG-001-009 | 25B-25K | One definition per major domain, pack, relationship and state class | G3 |
| DATA-002 | Convert 36 package identities and 214 Atlas foundations | DATA | Depends DATA-001; DOC-010-012 | 25F-25G | Validator-ready package and world-context records | G4 |
| DATA-003 | Convert 217 block families | DATA | Depends DOC-006; DATA-001 | 25H | Block-family source workbook/JSON and generated registry | G4 |
| DATA-004 | Convert 296 item families | DATA | Depends DOC-007; DATA-003 | 25I | Item-family source workbook/JSON and generated registry | G4 |
| DATA-005 | Convert 105 production-chain contracts | DATA | Depends DOC-008/009; DATA-003/004 | 25J | Resource/recipe/provenance chain records and tests | G4 |
| DATA-006 | Create 86 asset requirement manifests | DATA/ASSET | Depends DOC-013; DATA-002-005 | 25K | Forge-ready asset package manifests and fallback assignments | G7 |
| DATA-007 | Create localisation, Codex and map-symbol source records | DATA/UI | Depends DATA-002-006 | 25B; 25K; Document 17 | Localisation keys, knowledge state and presentation references | G7 |
| DATA-008 | Freeze Core registry snapshot v1 | DATA | Depends DATA-002-007; VAL-001-005 | 25D-25E | Immutable Core content lockfile and semantic hash | G7 |
| WLD-001 | Implement seed lineage and named sub-seed service | WLD | Depends TEC-006; REG-001 | 25C; 25E; Document 11 | Deterministic named RNG streams and trace records | G5 |
| WLD-002 | Implement region/topology graph assembly | WLD | Depends WLD-001; REG-003/004 | 25G; Document 11 | Connected macro-region graph and route candidates | G5 |
| WLD-003 | Implement biome and transition assembly | WLD | Depends WLD-002; DATA-002/003 | 25F-25G; Document 11 | Biome placement, edges and meaningful transitions | G5 |
| WLD-004 | Implement bounded land-water/hydrology baseline | WLD | Conditional | 25G; 25H; Document 11; Set 26 interface | Rivers/lakes/wetlands/coasts sufficient for land-Core without naval simulation | G5 |
| WLD-005 | Implement structure, settlement and route placement | WLD | Depends WLD-003; DATA-002 | 25G; Documents 07/12 | Suitability-driven sites with fallbacks and no fixed tutorial arrangement | G5 |
| WLD-006 | Implement resource, ecology and pressure placement | WLD | Depends WLD-003/005; DATA-005 | 25G; Documents 06/10 | Deposits, habitats, nests, threats and carrying-capacity inputs | G5 |
| WLD-007 | Implement deterministic world repair and reachability check | WLD | Depends WLD-002-006; VAL-005 | 25C; 25E | Bounded repairs or controlled failure with explainable trace | G5 |
| WLD-008 | Implement chunk streaming and explored-world stability contract | WLD | Depends DOC-004; WLD-003 | 25D-25E; Document 18 | No silent rewrite of explored terrain after updates | G5 |
| SAVE-001 | Implement world manifest and registry snapshot binding | SAVE | Depends REG-006-010; WLD-001 | 25D | World-to-pack/schema/worldgen version binding | G6 |
| SAVE-002 | Implement seed-plus-delta persistence baseline | SAVE | Depends SAVE-001; WLD-008 | 25A; Document 18 | Persistent explored chunks, entity state and world deltas | G6 |
| SAVE-003 | Implement atomic save, backup and failed-load recovery | SAVE | Depends SAVE-002 | 25D-25E | Last-good preservation and explicit recovery path | G6 |
| SAVE-004 | Implement ordered migration chain and postconditions | SAVE | Depends REG-010; SAVE-003 | 25D | Dry-run, backup-first, deterministic migrations | G6 |
| SAVE-005 | Implement absent-pack quarantine/reactivation | SAVE | Depends SAVE-001/004; VAL-004 | 25D | No silent deletion or reinterpretation of optional content | G6 |
| SIM-001 | Implement persistent entity/settlement/structure records | SIM | Depends SAVE-002; REG-001 | 25B-25C | Stable runtime state separate from definitions and scenes | G6 |
| SIM-002 | Implement LOD promotion/demotion contract | SIM | Depends SIM-001; TEC-006 | 25E; Document 18 | Identity and resource-preserving detail transitions | G6 |
| SIM-003 | Implement bounded unloaded-world catch-up | SIM | Depends SIM-002 | 25E | Deterministic summaries and catch-up limits | G6 |
| GAME-001 | Implement block runtime, states and generated shape bindings | GAME | Depends DATA-003; REG-009; WLD-008 | Documents 03/18; 25H | Place, mine, state, drop and persist representative blocks | G6 |
| GAME-002 | Implement item stack, instance state and ownership baseline | GAME | Depends DATA-004; SAVE-002 | Document 04; 25I | Conserving stacks, durability/charge/condition and provenance references | G6 |
| GAME-003 | Implement recipe/transaction/reservation service | GAME | Depends DATA-005; TEC-005 | Documents 05-06; 25J | Deterministic inputs, outputs, by-products, project reservations and rollback | G6 |
| GAME-004 | Implement storage, warehouse and trade transaction baseline | GAME | Depends GAME-002/003; SIM-001 | Documents 07-08 | Authoritative inventories, donations, contracts and reservations | G6 |
| GAME-005 | Implement NPC identity, jobs, needs and schedules baseline | GAME | Depends SIM-001/002; DATA-002 | Document 07 | Generated named NPCs and seven-need service links | G6 |
| GAME-006 | Implement settlement stages, projects and persistent aftermath | GAME | Depends GAME-004/005; WLD-005 | Documents 07/12/15 | Seed-generated settlements, projects, damage, repair and history | G6 |
| GAME-007 | Implement ecology populations, nests and migration pressure | GAME | Depends WLD-006; SIM-002/003 | Document 10 | Bounded populations and local pressure without full-world actors | G6 |
| GAME-008 | Implement creature AI profiles, drops and village interaction | GAME | Depends GAME-007; DATA-004/005 | Documents 10/16 | Wildlife/monster roles, readable behaviour and conserving rewards | G6 |
| GAME-009 | Implement automation power/logistics/processing baseline | GAME | Depends GAME-001-004; TEC-005 | Document 08 | Mechanical supply chain with authoritative flow and LOD summary | G6 |
| GAME-010 | Implement practical mana, ward and rune infrastructure baseline | GAME | Depends GAME-001-003/009 | Document 09 | Mana storage/flow, ward service and practical magic interfaces | G6 |
| GAME-011 | Implement structure grammar, occupation and restoration baseline | GAME | Depends WLD-005; GAME-001/006 | Document 12 | Modular structures with states, markers, ownership and repair | G6 |
| GAME-012 | Implement dungeon grammar and solvability validation | GAME | Depends GAME-011; VAL-006 | 25G; Documents 12/15 | Generated rooms/routes, return safety, rewards and state transitions | G6 |
| GAME-013 | Implement quest/event binding and world-state chronicle | GAME | Depends GAME-005-012; REG-003 | Document 15 | Stable participant bindings, events, histories and aftermath | G6 |
| GAME-014 | Implement combat, raid and defence contribution baseline | GAME | Depends GAME-008/009/010 | Document 16 | Damage packets, guards, structures, threats and aftermath records | G6 |
| GAME-015 | Implement regional/wandering boss pressure framework | GAME | Depends GAME-007/011-014 | 25G; Documents 10/15/16 | Territory pressure, confrontation alternatives, rewards and persistent aftermath | G6 |
| REALM-001 | Implement realm-instance and route foundation | REALM | Depends SAVE-001-005; WLD-001-008 | Documents 14/18 | Derived-seed world instances, route anchors and safe return | G6 |
| REALM-002 | Implement Verdant Covenant complete conditional package | REALM | Conditional on realm gates | 25F-25K | Playable realm package through CAP-10 with ecology, sites and authority | G7 |
| REALM-003 | Implement Ancestral Veil bounded teaser | REALM | Conditional after REALM-001 | 25F-25K | Non-extractive threshold route, memory evidence and guaranteed return | G7 |
| AST-001 | Implement Forge manifest import and runtime-product linkage | ASSET | Depends DATA-006; DOC-013; REG-009 | 25K; Forge 21-23 | Source-traceable import and generated product signatures | G7 |
| AST-002 | Produce shared block/material/item foundation kits | ASSET | Depends AST-001; DATA-003/004 | 25K | Representative reusable visual and collision families | G7 |
| AST-003 | Produce creature body-plan, rig and animation foundations | ASSET | Depends AST-001; GAME-008 | 25K; Forge 22 | Reusable rigs, clips, sockets, events and LOD mappings | G7 |
| AST-004 | Produce audio/VFX/event/accessibility foundation | ASSET | Depends AST-001; TEC-002 | 25K; Forge 23 | Critical cue bindings and imported validated assets | G7 |
| UI-001 | Implement developer registry/world/seed inspectors | UI | Depends REG/VAL/WLD foundations | 25E; Document 17 | Explainability, graph, pack, seed and state diagnostics | G6 |
| UI-002 | Implement Core player-facing inventory/crafting/world UI | UI | Depends GAME-001-013; DATA-007 | Document 17 | Searchable, controller-ready, knowledge-aware production UI | G7 |
| UI-003 | Implement accessibility and reduced-effects profiles | UI | Depends AST-004; UI-002 | 25E; 25K | Equivalent cues, reduced motion/flash and readable state alternatives | G7 |
| PERF-001 | Establish packaged representative profiling scenarios | PERF | Depends G6 systems; TEC-004 | 25E; Document 18 | Dense settlement, automation, dungeon, realm and save workloads | G7 |
| PERF-002 | Approve numeric hardware and simulation budgets | PERF | Depends PERF-001 | Document 18; 25K | Measured frame, memory, chunk, entity, audio, effect, save and network limits | G7 |
| PERF-003 | Optimise LOD, aggregation and streaming against budgets | PERF | Depends PERF-002 | 25E; Document 18 | Passing representative workloads without state loss | G8 |
| MP-001 | Implement multiplayer-ready request/authority test harness | MP | Depends TEC-008; GAME-001-014 | 25E; Document 18 | Host authority, invalid request rejection and deterministic outcomes | G7 |
| MP-002 | Implement reconnection and late-join state reconstruction tests | MP | Depends MP-001; SAVE/SIM | 25E | Representative world, inventory, settlement, machine and realm reconstruction | G8 |
| REL-001 | Create Core Integration Candidate build profile | REL | Depends DATA-008; G6/G7 gates | 25D-25E | Frozen pack lockfile, evidence and packaged build | G8 |
| REL-002 | Run Core Definition of Done and human review | REL | Depends REL-001; PERF-003; MP tests | 25E | Technical, content, accessibility, representation, fun and balance approvals | G8 |
| SET26-001 | Admit Set 26 schemas/packs into general extension contracts | SET26 | Parallel / staged | 25B-25E; 26A-26O | No parallel registry, duplicate ownership or unsafe removal | G9 |
| SET26-002 | Integrate selected maritime amendments and tasks | SET26 | Blocked by sufficient lock | 26N-26O; DOC-014 | Main-document, registry, Forge, save, validation and technical updates | G9 |
| SET26-003 | Run final Set 26/Set 25 closure audit | SET26 | Depends SET26-001/002 | 25A; 25L; 26O | No unowned blocker maritime integration debt | G9 |

# Appendix B. Summer Engine Task Card Template

| Field | Task Entry |
| --- | --- |
| Task ID / Title |  |
| Lane / Work Package |  |
| Objective |  |
| Source Documents / Sections / Decision IDs |  |
| Current-State Evidence |  |
| Dependencies / Passed Gates |  |
| Build Profile / Pack Set |  |
| In Scope |  |
| Explicitly Out of Scope |  |
| Existing Files Changed |  |
| New Files Created |  |
| Files Deleted / Renamed |  |
| Schema / Registry / ID Impact |  |
| Save / Migration / Compatibility Impact |  |
| Command IDs |  |
| Acceptance Tests |  |
| Negative / Regression Tests |  |
| Evidence Outputs |  |
| Performance / LOD Check |  |
| Accessibility / Player-Trust Check |  |
| Rollback Procedure |  |
| Risks / Debt / Follow-Up |  |
| Implementer / Reviewers / Approval |  |

A task card remains Draft until the changed-file fields contain exact repository paths and the current-state evidence has been inspected.

# Appendix C. Source-of-Truth Integrity Audit Register

| Source | Canonical Role | Current Integrity Status | Required Action |
| --- | --- | --- | --- |
| 25A v0.2 | Governance and decisions | Active; final closure pending | Final revision after Set 26 sufficient lock. |
| 25B v0.2 | Identity and ownership kernel | Active | Implement and validate; review only if Set 26 reveals incompatible identity needs. |
| 25C-25E | Schemas, packs and validation | Active specifications | Implement representative vertical and command/evidence tooling. |
| 25F-25G | Core scope and dependency contracts | Accepted working lock | Maintain freeze/change control and conditional debt. |
| 25H-25K | Physical and asset contracts | Active planning intake | Convert through owning registries, Forge and evidence; no direct runtime ownership. |
| 00-02 v0.1 | Vision/loop/progression | Partly compatible but POC-era | Revision pack. |
| 03-06 v0.1 | Physical registries/progression | Superseded planning basis, not production-ready | Complete replacements. |
| 07-10 v0.1 | Civilisation/automation/magic/creatures | System intent retained; fixed POC examples active | Revision pack. |
| 11 v0.1 | World generation | POC valley incompatible | Complete replacement. |
| 12-17 v0.1 | Structures through UI | System intent retained; POC/fixed assumptions remain | Revision pack. |
| 18 v0.1 | Technical plan | Obsolete Unreal/POC authority | Complete replacement before code programme. |
| Atlas 24 | World context | Active source | Annotate production selection and preserve Atlas/gameplay ownership boundary. |
| Forge 21-23 | Authoring foundations | Active but require production handoff maps | Amend through DOC-013. |
| Set 26 | Maritime authority | Approved programme; detailed status external | Admission and final integration through 26N/26O and DOC-014-016. |
| POC archive | Historical/regression | Not yet fully isolated by evidence | DOC-002 plus VAL-003. |

# Appendix D. Main-Document Amendment Checklist

| Doc | Treatment | POC Removed | Set 25 Intake Applied | Set 26 Hook Tracked | Supersession Indexed | Status |
| --- | --- | --- | --- | --- | --- | --- |
| 00 | Revision pack | ☐ | ☐ | ☐ | ☐ | Pending |
| 01 | Revision pack | ☐ | ☐ | ☐ | ☐ | Pending |
| 02 | Revision pack | ☐ | ☐ | ☐ | ☐ | Pending |
| 03 | Complete replacement | ☐ | ☐ | ☐ | ☐ | Pending |
| 04 | Complete replacement | ☐ | ☐ | ☐ | ☐ | Pending |
| 05 | Complete replacement | ☐ | ☐ | ☐ | ☐ | Pending |
| 06 | Complete replacement | ☐ | ☐ | ☐ | ☐ | Pending |
| 07 | Revision pack | ☐ | ☐ | ☐ | ☐ | Pending |
| 08 | Revision pack | ☐ | ☐ | ☐ | ☐ | Pending |
| 09 | Revision pack | ☐ | ☐ | ☐ | ☐ | Pending |
| 10 | Revision pack | ☐ | ☐ | ☐ | ☐ | Pending |
| 11 | Complete replacement | ☐ | ☐ | ☐ | ☐ | Pending |
| 12 | Revision pack | ☐ | ☐ | ☐ | ☐ | Pending |
| 13 | Revision pack | ☐ | ☐ | ☐ | ☐ | Pending |
| 14 | Revision pack | ☐ | ☐ | ☐ | ☐ | Pending |
| 15 | Revision pack | ☐ | ☐ | ☐ | ☐ | Pending |
| 16 | Revision pack | ☐ | ☐ | ☐ | ☐ | Pending |
| 17 | Revision pack | ☐ | ☐ | ☐ | ☐ | Pending |
| 18 | Complete replacement | ☐ | ☐ | ☐ | ☐ | Pending |

# Appendix E. Validation Command-ID Register

| Command ID | Required Inputs | Required Outputs | Minimum Failure Behaviour |
| --- | --- | --- | --- |
| CMD-DOC-AUDIT | Document/source bundle and supersession registry | Dependency, stale-reference, duplicate-owner and POC report | Non-zero/blocking result for active contradictory authority. |
| CMD-REG-VALIDATE | Canonical source, schema/interface versions, pack profile | Machine-readable issues with source locations and severity | No generated registry on blocker errors. |
| CMD-PACK-RESOLVE | Pack manifests, versions and profile | Deterministic load plan and lockfile | Fail on missing required, cycle, incompatible or protected conflict. |
| CMD-REG-COMPILE | Validated canonical JSON and lockfile | Generated resources, snapshot hash and compile report | No partial canonical overwrite; outputs are disposable/rebuildable. |
| CMD-POC-SCAN | Shipping profile sources, scenes, scripts, localisation and manifests | Exact legacy references and classification | Block shipping build on any non-approved archive dependency. |
| CMD-TEST-HEADLESS | Build/profile and suite IDs | Structured pass/fail report and logs | Non-zero on test failure; no interactive-only hidden dependency. |
| CMD-SEED-BATCH | World preset, pack lockfile, seed corpus and validator versions | World summaries, repair traces, screenshots/statistics and failures | Invalid supported world blocks gate or enters controlled-failure record. |
| CMD-REACHABILITY | Registry snapshot, world summary and CAP requirements | Provider/path proof or exact missing edge/cost/permission/route | No “provider exists” false positive without accessible path. |
| CMD-SAVE-DRYRUN | Fixture copy, source/target versions and migration chain | Backup, migration report, postconditions and recovered save | Original fixture remains unchanged on failure. |
| CMD-PROFILE-PACKAGED | Packaged build, hardware tier, scenario and budget baseline | Frame/memory/simulation/audio/effect/save/network metrics | Regression or budget breach fails target gate. |
| CMD-EVIDENCE-FREEZE | All reports, build signature, lockfiles and approvals | Immutable evidence index/bundle | Fail when required evidence or approval is missing. |

# Appendix F. Repository Path-Class and Evidence Layout

Exact paths are pending DOC-003 and Document 18. The repository must nevertheless separate these classes:

| Path Class | Owns | Must Not Contain |
| --- | --- | --- |
| Canonical design/docs | Approved source documents, decision and supersession records. | Generated runtime registries or caches. |
| Canonical content source | JSON/spreadsheets/Forge manifests and localisation source. | Runtime-only state or hand-edited generated Resources. |
| Schemas/interfaces | Versioned schema, relationship, capability, event and manifest contracts. | Content-specific hidden overrides. |
| Tools | Importers, compilers, validators, seed/migration/profile runners. | Canonical game content. |
| Generated products | Godot Resources, indexes, atlases and compiled registries. | Only editable copy. |
| Runtime/game modules | Godot services, scenes and UI consuming generated products. | Canonical registry source. |
| Test fixtures | Golden data, seeds, saves, pack combinations and regression scenes. | Shipping-only secrets or unlicensed source media. |
| Evidence | Reports, lockfiles, profiles, screenshots/logs and approvals. | Editable canonical content. |
| Archive | POC and deprecated fixtures under excluded profiles. | Production dependencies. |

A recommended evidence identity is `<build_signature>/<gate>/<task_or_suite_id>/...`; Document 18 may choose the physical path while preserving this traceability.

# Appendix G. Integration Debt Register

| Debt ID | Obligation | Owner | Blocks | Clearing Evidence |
| --- | --- | --- | --- | --- |
| DEBT-001 | Godot/Summer Engine Document 18 replacement | DOC-004 / Ash | G2 onward | Approved v1.0 using repository audit. |
| DEBT-002 | POC repository retirement and leakage enforcement | DOC-002 / VAL-003 | Shipping profiles and final closure | Inventory, archive manifest and clean scan. |
| DEBT-003 | Main Documents 00-17 revision/replacement | DOC-005-012 | Broad implementation authority | Approved documents and supersession index. |
| DEBT-004 | Representative registry/pack/validator vertical | REG/VAL/DATA-001 | Bulk data conversion | Compiled load test and passing evidence. |
| DEBT-005 | Numeric performance and hardware budgets | PERF-001/002 | G8 release admission | Packaged profiles and Ash-approved budgets. |
| DEBT-006 | Core water boundary before Set 26 overhaul | WLD-004 / Set 26B-D | Water-dependent world packages | Document 11 contract, migration/extension interface and tests. |
| DEBT-007 | Verdant realm runtime feasibility | REALM-001/002 | Verdant Integrated status | Save, return, ecology, performance and progression evidence. |
| DEBT-008 | Ancestral Veil teaser safety | REALM-003 | Teaser admission | Guaranteed return, no extraction dependency and migration tests. |
| DEBT-009 | Asset source/provenance and Forge handoffs | DOC-013 / AST / DATA-006 | Asset Ready | Source manifests, rights, imports and package evidence. |
| DEBT-010 | Set 26 sufficient-lock and amendment map | 26N-26O / DOC-014 | Final 25L closure | Approved map, pack/schema admission and no blocker debt. |
| DEBT-011 | Final source-of-truth audit | DOC-015 | G9 | Clean duplicate/stale/unowned report. |
| DEBT-012 | Final 25A/25L revisions | DOC-016 | Set 25 integration closure | Ash-approved closure versions. |

# Appendix H. Set 26 Admission and Closure Checklist

- ☐ 26A authority, boundaries and package strategy are approved.
- ☐ Maritime IDs use the 25B kernel; no parallel registry or scene-path save identity exists.
- ☐ 26B-26D fluid/world/climate extension schemas and migrations are registered.
- ☐ 26F-26I mobile-container, local/world-space, blueprint and Forge contracts are validated.
- ☐ Ports, crews, fleets, cargo and factions extend existing civilisation/economy owners.
- ☐ Naval damage, flooding, fire, boarding and sinking preserve authority, saves and LOD.
- ☐ Marine ecology, structures, bosses and loot have physical inputs/outputs and fallbacks.
- ☐ 26N publishes canonical block/item/resource/recipe/magic/automation/quest handoffs.
- ☐ 26O publishes UI, multiplayer, performance, QA and main-document amendment map.
- ☐ Required/optional/deferred maritime packs have safe absence and removal behaviour.
- ☐ Migration fixtures cover enabling, updating, removing and reactivating selected packs.
- ☐ All blocker-level maritime integration debt is resolved, redesigned or explicitly excluded.
- ☐ DOC-014-016 are complete and Ash approves final Set 25 closure.

# Appendix I. Document 25L Acceptance Criteria

- ☐ Clearly distinguishes Set 25 document completion from production, implementation, Set 26 and release closure.
- ☐ Audits current authority without claiming unimplemented tools, data, assets or budgets are complete.
- ☐ Records treatment for every main document 00-18.
- ☐ Defines the POC retirement execution and leakage-validation path.
- ☐ Provides bounded work packages across documentation, registry, validation, data, world, saves, simulation, gameplay, assets, UI, performance and multiplayer readiness.
- ☐ Defines mandatory Summer Engine task fields, exact-file rule, command IDs, acceptance evidence and rollback.
- ☐ Orders a representative registry/validator vertical before bulk conversion.
- ☐ Preserves 25F-25K package counts as planning obligations rather than implementation claims.
- ☐ Keeps detailed maritime design in Set 26 while tracking admission and final closure requirements.
- ☐ Identifies blockers, risks, conditional work, integration debt and clearing evidence.
- ☐ Gives an immediate next action sequence beginning with repository discovery and Document 18 v1.0.
- ☐ Retains Ash as final authority over scope, canon, representation, licensing, architecture and release.
