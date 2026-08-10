# FANTASY VOXEL CIVILISATION SANDBOX

## DOCUMENT SET 25

# 25E - Validation Architecture, Seed QA, Progression Reachability, Performance and Release Gates

**Version 0.1 - Production Validation and Release Assurance Architecture Draft**

A canonical assurance architecture defining how Leyforge proves registry integrity, procedural-world coherence, progression reachability, save and migration safety, runtime correctness, performance, accessibility, representation, player trust and optional-expansion compatibility before content advances through production or enters a released build.

**Project Lead and Final Authority:** Ash

**Architecture, systems planning, documentation and production support:** GPT-5.6 Thinking

> **Production Validation and Release Assurance Statement**  
> Leyforge content is not validated because one document is complete, one seed looks good, one test passes or one packaged build launches. It is validated when the exact source, pack, schema, registry snapshot, seed, world profile, runtime build and test conditions are recorded; required checks can be repeated; failures produce actionable evidence; procedural worlds preserve capability and progression; runtime systems conserve authoritative state; performance is measured against approved budgets; and Ash can make a release decision from trustworthy evidence rather than assumption.

| Field | Locked Direction |
| --- | --- |
| Document Scope | Validation architecture, validator and suite registration, evidence records, severity and gate behaviour, schema/identity/reference/semantic/completeness checks, content-pack validation, POC-leak prevention, deterministic seed QA, progression reachability, fallback and repair verification, runtime/save/migration/LOD/authority tests, performance methodology, presentation/accessibility/representation/player-trust review, Set 26 expansion admission, reports, CI profiles and release gates. |
| Identity Dependency | All validators, suites, evidence records, fixtures, baselines, exceptions and reports use the qualified IDs, namespaces, versions, aliases, tombstones, persistent identities and spatial-frame rules of Document 25B v0.2. |
| Semantic Dependency | Validation evaluates the registered schemas, relationships, capabilities, suitability, exclusions, fallbacks, dynamic states, progression guarantees and completeness contracts defined by Document 25C v0.1. |
| Packaging Dependency | Tests resolve content through the pack manifests, dependency modes, build profiles, lockfiles, snapshots, authoring-source maps, world manifests, migration chains and quarantine rules of Document 25D v0.1. |
| Validation Philosophy | Validate as early and cheaply as possible, then repeat at increasingly integrated levels. A later passing test never excuses an earlier contract violation, and a large test corpus never replaces human design judgement. |
| Determinism Direction | Definition resolution, pack resolution, world-generation selection, generated identities and recorded repair decisions must be reproducible from the same approved inputs. Real-time physics need authoritative and repeatable outcomes appropriate to their owning system; bitwise cross-platform physics determinism is not assumed unless later approved. |
| Seed QA Direction | Procedural quality is tested across golden, broad-distribution, adversarial, minimal-pack, maximal-pack, migration, long-running and expansion-compatibility corpora. One favourite seed is never sufficient evidence. |
| Progression Direction | Reachability is proven through capabilities, valid providers, acquisition conditions, substitutions, trade/salvage/knowledge routes, realm access and bounded repairs rather than guaranteed named content. |
| Performance Direction | Every major definition declares cost classes and every milestone approves measurable budgets. This document locks measurement categories, evidence and gate behaviour; final numeric hardware targets remain for the rewritten Document 18 and Ash's approval. |
| Quality Direction | Accessibility, representation, localisation, player trust, readability, fun and balance use combined automated and human gates. Automation may identify risks but cannot authoritatively approve sensitive meaning or release readiness. |
| Expansion Direction | Document Set 26 is the first major expansion validation case. Set 25 defines general cross-pack and release-admission rules; Set 26 retains ownership of maritime behaviour, detailed test scenarios and its final shipping composition. |
| POC Direction | Archived POC fixtures may test reusable mechanics only inside protected test/archive packs. Any production dependency on retired identities, fixed locations or fixed arrangements is a blocking failure. |
| Implementation Boundary | This document defines required validation contracts and evidence. Exact Godot classes, Summer Engine commands, CI provider, dashboard technology, profiling integration, hardware values and test-runner implementation belong to the rewritten Document 18 and bounded 25L implementation tasks. |
| Next Deliverable | 25F - Core Production Atlas Classification and Scope Lock. |

# Revision History

| Version | Status | Summary |
| --- | --- | --- |
| 0.1 | Production Validation and Release Assurance Architecture Draft | Establishes the project-wide validation layers, evidence contracts, seed corpora, progression proofs, performance methodology, quality review, expansion admission, CI profiles and release gates required before Core Production classification and implementation scaling. |

# Document Purpose

Document 25E turns the identity, semantic and packaging foundations of Documents 25B-25D into an enforceable quality system. It defines what must be checked, when it must be checked, which evidence is retained, which failures block production status, how procedural worlds are evaluated beyond anecdotal play, how capability-based progression is proven, how updates and optional packs are tested, and what evidence is required before Ash can approve a milestone or release.

The document preserves a strict distinction between **data validity**, **world validity**, **runtime correctness**, **quality**, and **release approval**. A definition can be syntactically valid while producing an incoherent ecology. A seed can generate a valid topology while failing progression. A runtime system can preserve saves while exceeding performance budgets. A build can pass automated tests while still failing readability, representation, player trust or fun. Each layer therefore has its own owners, evidence and gate behaviour.

This document does not classify the Core Production roster, select final block/item/recipe families, set final hardware specifications, implement the validator, design complete maritime test cases, rewrite Document 18 or grant final release approval. It creates the assurance contract those tasks must follow.

# Design Sources and Supersession Rules

| Source | Authority Used by 25E |
| --- | --- |
| 00-02 - Vision, Loop and Progression | Preserve the four connected game pillars, sandbox freedom, configurable difficulty, physical progression, multiple valid pathways and meaningful world consequence. Validation must prove the final game identity rather than only isolated mechanics. |
| 03-06 - Blocks, Items, Recipes and Resources | Preserve separate registries, exact physical inputs/outputs, substitutions, tool/station gates, resource conservation, quality/state data and spreadsheet-scale validation requirements. POC-specific counts and chains are not production acceptance criteria. |
| 07-17 - Gameplay Systems | Preserve NPC persistence, settlement needs, automation transactions, practical magic, ecology, structures, factions, realms, events, combat aftermath and UI authority. Their runtime and cross-system claims require integrated tests. |
| 18 - Technical Implementation Plan v0.1 | Retain automated tests, invalid-content rejection, deterministic seed suites, performance budgets, atomic saves, migration fixtures, recovery, simulation LOD, authority, profiling and packaged-build gates. Unreal-specific tools, stages and POC acceptance cases are superseded. |
| 24A - Atlas Foundations | Primary authority for deterministic staged generation, capability guarantees, bounded repair, simulation profiles, golden/random/adversarial/minimal/maximal/long-running seed sets and POC-content detection. |
| 24L - Registry and Production Roadmap | Primary authority for validation layers, coherence examples, seed suites, performance budget categories, migration behaviour, risk triggers, release gates and Definition of Done. |
| 25A v0.2 | Governs production lifecycle, authority, archived validation, evidence, Set 26 checkpoints, milestone decisions and final Set 25 closure. |
| 25B v0.2 | Governs identity for validators, suites, fixtures, baselines, generated worlds, persistent records, local spatial frames and official expansion compatibility. |
| 25C v0.1 | Governs schemas, typed relationships, capabilities, constraints, deterministic selection, fallback groups, progression guarantees and package completeness. |
| 25D v0.1 | Governs pack resolution, build profiles, lockfiles, snapshots, world manifests, migration, quarantine, authoring provenance and expansion admission. |
| Approved Set 26 Direction | Locks a separate maritime/naval expansion and requires Set 25 to support its validation admission. Detailed fluid, vessel, fleet, naval-combat and maritime-performance test definitions remain with 26B-26O. |
| Forge and Presentation Sets | Own authoring workflows and detailed asset schemas. 25E validates required manifests, exported outputs, event/socket bindings, provenance, accessibility and budget evidence. |

> **Supersession Rule**  
> Older acceptance language that treats the Forest Hamlet, fixed watchtower, fixed goblin raid, controlled POC valley, Unreal test commands or a single scripted playthrough as production proof is superseded. Reusable mechanics may remain in synthetic fixtures, but production validation uses seed-generated content, capability-based progression and Godot/Summer Engine evidence.

> **No Evidence by Assertion Rule**  
> A document statement, implementation comment, task completion message or manual observation is not validation evidence unless it identifies the tested contract, inputs, build, result, owner and reproducible artefacts required by this document.

# Static Table of Contents

- Revision History
- 1. Locked Validation and Release-Assurance Identity
- 2. Source-Derived Direction and Canonical Resolution Boundary
- 3. Scope, Non-Goals and Handoff Boundaries
- 4. Canonical Terminology
- 5. Assurance Layer Model
- 6. Validator, Suite and Fixture Registry
- 7. Evidence, Provenance and Reproducibility Contract
- 8. Severity, Disposition and Blocking Behaviour
- 9. Production Lifecycle and Gate Mapping
- 10. Execution Profiles and Trigger Rules
- 11. Local, Editor, CI, Nightly, Milestone and Release Runs
- 12. Schema and Field Validation
- 13. Identity, Namespace, Alias and Tombstone Validation
- 14. Reference, Relationship, Cycle and Cardinality Validation
- 15. Capability, Suitability, Fallback and Completeness Validation
- 16. Semantic Coherence and Human Design Review
- 17. Content-Pack, Manifest and Optional-Dependency Validation
- 18. POC Leakage and Archive-Isolation Validation
- 19. Deterministic World-Generation Contract
- 20. Seed Corpus Architecture
- 21. Golden Seeds and Regression Snapshots
- 22. Broad-Distribution and Statistical Seed QA
- 23. Adversarial, Boundary, Minimal-Pack and Maximal-Pack Seeds
- 24. Staged Worldgen Validation and Bounded Repair
- 25. Topology, Transition, Route and Placement Validation
- 26. Spawn, Early Survival, Readability and Building-Space Validation
- 27. Ecology, Civilisation, Site, Boss and Narrative Coherence
- 28. Diversity, Repetition and Procedural Blandness Review
- 29. Progression Reachability Architecture
- 30. Progression Proof and Supported-Profile Requirements
- 31. Substitute Paths, Fallback Repair and Controlled Failure
- 32. World Upgrade, New Content and Explored-World Stability
- 33. Runtime, Save, Load, Migration and Recovery Validation
- 34. Simulation LOD, Promotion, Demotion and Catch-Up Validation
- 35. Transactions, Conservation, Economy, Automation and Magic Validation
- 36. Multiplayer Authority, Compatibility and Reconnection Validation
- 37. Performance Budget Architecture
- 38. Workload Profiles and Representative Scenarios
- 39. Performance Baselines, Regression and Profiling Evidence
- 40. Asset, Presentation, Localisation and Provenance Validation
- 41. Accessibility, Representation, Player Trust, Fun and Balance Gates
- 42. Document Set 26 Major-Expansion Validation Case
- 43. AI-Assisted Validation and Human Authority
- 44. Reports, Dashboards, Diagnostics and Retained Artefacts
- 45. Exceptions, Waivers and Temporary Debt
- 46. Defect Triage, Reproduction and Regression Ownership
- 47. Release-Gate Architecture
- 48. Core Production Definition of Done
- 49. Authoring and Review Workflow
- 50. Decisions Locked by 25E and Handoff to Later Documents
- 51. Risks, Redesign Triggers and Open Decisions
- Appendix A. Validator and Test-Suite Definition Template
- Appendix B. Validation Evidence and Failure Report Template
- Appendix C. Seed Corpus and Seed-Run Manifest Template
- Appendix D. Progression-Reachability Proof Template
- Appendix E. Performance Baseline and Regression Template
- Appendix F. Release-Gate Checklist
- Appendix G. Set 26 Expansion-Admission Validation Checklist
- Appendix H. POC Leakage Scan Checklist
- Appendix I. Document 25E Acceptance Criteria

```{=openxml}
<w:p><w:r><w:br w:type="page"/></w:r></w:p>
```

# 1. Locked Validation and Release-Assurance Identity

Validation is Leyforge's evidence layer. It connects authored rules to trustworthy production decisions by proving that definitions are well-formed, relationships are coherent, worlds are seed-safe, progression remains reachable, runtime state is conserved, updates preserve saves, optional packs fail safely, presentation is readable, performance is measured and release promises are supported by the build.

> **Locked Rule**  
> No definition, package, system or milestone may advance because its documentation appears complete or its intended behaviour sounds plausible. Status advancement requires the evidence assigned to that gate, and release approval remains a deliberate human decision even when all automated suites pass.

| Assurance Objective | Meaning | Player-Facing Result |
| --- | --- | --- |
| Trustworthy Data | IDs, schemas, references, ownership, packs and migrations are consistent. | Content loads as intended and updates do not silently reinterpret the world. |
| Coherent Generation | Seeds assemble valid geography, societies, ecologies, sites, threats, routes and history. | Worlds feel authored and surprising rather than random or broken. |
| Reachable Progression | Required capabilities have valid providers and substitutes under supported profiles. | Players are not trapped because one named material, culture, teacher or portal failed to generate. |
| Persistent Consequence | Saves, LOD, transactions and migrations preserve identity and aftermath. | Villages, machines, dungeons, bosses and realms remember what happened. |
| Measured Performance | Workloads are profiled against approved budgets on representative hardware. | The living world remains responsive instead of collapsing under content scale. |
| Responsible Quality | Accessibility, representation, readability, player trust, fun and balance receive explicit review. | Procedural breadth does not create exclusion, stereotyping, manipulative loss or unreadable gameplay. |
| Release Accountability | Gate evidence, known issues, waivers, rollback and approval are recorded. | Public promises match the actual packaged build. |

# 2. Source-Derived Direction and Canonical Resolution Boundary

| Classification | Treatment in 25E |
| --- | --- |
| Source-Derived Rule | The Atlas requires schema, semantic, seed, progression, performance, accessibility, representation, migration and regression gates. It requires golden, random, adversarial, minimal/maximal and long-running world tests. |
| 25B Dependency | Validation identities, target definitions, generated instances, spatial frames and expansion namespaces must resolve through the canonical identity kernel. |
| 25C Dependency | Validators evaluate registered field rules, relationships, capability offers/requirements, suitability, exclusions, fallbacks and completeness contracts rather than inventing new meaning. |
| 25D Dependency | Every run records the resolved pack lockfile, registry snapshot, build profile, world manifest and migration state. Tests do not bypass normal package resolution. |
| 25E Canonical Resolution | Defines validation layers, suite/evidence records, severity, execution profiles, seed corpora, progression proofs, performance methodology, human-quality gates, Set 26 admission checks and release evidence. |
| Recommendation | Use a single validation orchestrator callable from command line, Godot editor, Summer Engine tasks and CI, with domain-specific validators registered through stable suite IDs. |
| Deferred Decision | Exact executable names, CI platform, database/dashboard implementation, hardware targets, numeric performance budgets and final statistical sample sizes remain for Document 18, 25F, 25L and Ash. |

# 3. Scope, Non-Goals and Handoff Boundaries

## 3.1 In scope

- validator, suite, fixture, corpus, baseline and evidence identity;
- validation layers and execution order;
- severity, blocking, suppression, waiver and debt rules;
- schema, identity, reference, relationship and dependency checks;
- semantic coherence and completeness review;
- POC leakage scanning;
- deterministic world generation and seed corpora;
- progression reachability and fallback proof;
- save, migration, recovery, LOD and authority validation;
- performance budget categories and regression methodology;
- asset, localisation, accessibility, representation and player-trust gates;
- optional expansion and Set 26 admission tests;
- CI profiles, reports, dashboards and release evidence.

## 3.2 Explicit non-goals

This document does not:

- classify which Atlas foundations enter Core Production;
- define final implementation class names or test commands;
- set final frame-rate, memory, save-size or network budgets;
- design detailed water, vessel, fleet or naval-combat simulations;
- decide Set 26's final shipping topology;
- replace playtesting with automated agents;
- author final accessibility, representation or legal policy;
- permit exceptions to redefine canon or source-of-truth ownership;
- guarantee that every future platform uses identical numeric budgets.

## 3.3 Handoff boundaries

| Owner | Receives from 25E | Remains owned elsewhere |
| --- | --- | --- |
| 25F-25G | Gate obligations, validation-cost fields, reachability requirements and evidence expectations. | Core Production selection, dependency matrix and accepted scope. |
| 25H-25J | Physical-registry validator requirements, conservation checks and progression-proof format. | Actual block, item, resource, loot and recipe content. |
| 25K | Asset, presentation, accessibility, provenance and budget evidence contracts. | Exact asset families, production estimates and Forge manifests. |
| 25L | Suite IDs, gate checklists, unresolved debt, report paths and release-evidence expectations. | Bounded implementation tasks and final integration audit. |
| Document 18 | Orchestrator, validators, test harnesses, seed runner, profiling, CI, dashboards, save fixtures and packaged-build automation. | Design meaning, production scope and human release authority. |
| Set 26 | General expansion, mobile-container, optional-pack, authority, save, migration, performance and admission requirements. | Detailed maritime acceptance scenarios and system-specific tolerances. |
| Ash | Transparent pass/fail evidence, exceptions, risk and readiness recommendation. | Final approval of scope, canon, sensitive meaning and release. |

# 4. Canonical Terminology

| Term | Definition |
| --- | --- |
| Validator | Versioned executable rule that evaluates one defined contract and produces structured findings. |
| Test Suite | Ordered collection of validators and runtime tests with a declared target, profile, fixtures and gate behaviour. |
| Fixture | Controlled definition, pack, save, world, scene, input sequence or synthetic state used to reproduce a contract. |
| Seed Corpus | Versioned set or generation rule for seeds, profiles and pack configurations used by world QA. |
| Golden Seed | Named deterministic seed whose selected definitions, world relationships and approved diagnostics are retained for regression comparison. |
| Adversarial Seed | Seed or generated input chosen to stress constraint boundaries, rare combinations, repair logic or known risks. |
| Validation Evidence | Structured result plus inputs, versions, hashes, logs, snapshots, measurements and reviewer outcome. |
| Finding | One validator result with severity, target, contract, evidence and recommended owner. |
| Blocking Failure | Finding that prevents a production status, build profile or release gate from passing. |
| Quality Signal | Measurement or review result that informs judgement but is not automatically pass/fail without an approved threshold. |
| Baseline | Approved measurement set used to detect regressions under equivalent conditions. |
| Tolerance | Approved range within which nondeterministic or variable runtime measurements are acceptable. |
| Reachability Proof | Recorded path or set of paths from supported starting conditions to required capabilities under one world/build profile. |
| Repair Trace | Deterministic record explaining why generation repair occurred, what candidates were considered and what changed. |
| Waiver | Time-bounded human-approved exception to a non-protected gate, carrying owner, risk, expiry and removal plan. |
| Quarantine Test | Test proving missing optional content is preserved safely and cannot corrupt or reinterpret authoritative state. |
| Release Evidence Bundle | Immutable collection of lockfile, build hash, suite reports, baselines, known issues, waivers, rollback and approval records for a milestone. |

# 5. Assurance Layer Model

Validation runs from inexpensive source checks to expensive full-world evidence. Layers are cumulative: a package that fails identity validation is not promoted because its gameplay test happened to succeed.

| Layer | Primary Question | Typical Evidence |
| --- | --- | --- |
| Source and Schema | Is the authored data structurally valid and owned correctly? | Source map, schema report, field diagnostics. |
| Identity and Package | Can definitions, packs, aliases and versions resolve unambiguously? | Namespace, dependency and lockfile report. |
| Relationship and Semantic | Do links, capabilities, constraints and world roles make sense? | Graph report, completeness report, human review. |
| Generation and Progression | Can supported seeds generate coherent, traversable and progression-valid worlds? | Seed manifests, hashes, maps, repair traces, reachability proofs. |
| Runtime and Persistence | Do systems preserve state, authority and resource conservation through play, LOD and saves? | Automated flows, transaction audits, save diffs, migration results. |
| Performance and Presentation | Does the build meet approved budgets and communicate gameplay accessibly? | Profiles, screenshots, videos, accessibility/localisation reports. |
| Release and Human Approval | Is the milestone scope honest, complete, recoverable and acceptable? | Release evidence bundle, known issues, waivers, Ash approval. |

# 6. Validator, Suite and Fixture Registry

Validators and suites are production definitions rather than anonymous scripts. Each receives a stable identity so reports, gates, migrations and historical evidence remain traceable as tooling evolves.

## 6.1 Validator definition

Every validator declares:

- `validator_id` and version;
- owning document/system;
- contract or schema evaluated;
- accepted target domains;
- required inputs and pack interfaces;
- deterministic or variable result mode;
- finding codes and default severity;
- safe automated fix availability;
- protected fields it may never rewrite;
- output schema;
- minimum runner version;
- deprecation/replacement rule.

## 6.2 Suite definition

Every suite declares:

- `suite_id` and version;
- execution profile;
- ordered validators/tests;
- fixtures or corpus selection;
- target build profile and platforms;
- stop/continue behaviour;
- pass criteria;
- evidence retention;
- gate(s) it may satisfy;
- human review requirements.

## 6.3 Fixture rules

Fixtures must be:

- isolated in `leyforge.test` or `leyforge.archive` namespaces unless they are genuine production seeds;
- minimal enough to identify the failing contract;
- versioned with source packs and schemas;
- safe to distribute internally;
- explicit about whether they represent synthetic edge cases or real player-world captures;
- scrubbed of private player data before becoming retained regression material.

# 7. Evidence, Provenance and Reproducibility Contract

A pass or failure without its inputs is not trustworthy. Every retained run records enough information to reproduce the decision.

| Evidence Group | Required Fields |
| --- | --- |
| Run Identity | run_id, suite_id/version, validator versions, start/end time, trigger, owner, status. |
| Product Identity | application build hash, Godot version, Summer Engine/task version, platform, configuration. |
| Content Identity | build profile, pack lockfile hash, registry snapshot hash, schema/interface versions, localisation set. |
| World Identity | world seed, derived-seed contract version, world profile, generation version, selected definitions, repair trace. |
| Fixture Identity | fixture/corpus IDs, save version, input sequence, migration origin, expected outcome. |
| Environment | hardware class, OS, driver/runtime information, process settings, network topology where relevant. |
| Results | findings, measurements, screenshots/maps, logs, transaction audit, save hashes, crash/hang artefacts. |
| Review | automated verdict, human reviewer, exceptions, disposition, linked defect/decision/change record. |

> **Reproducibility Rule**  
> Deterministic failures must reproduce from recorded inputs. Variable performance or runtime failures must reproduce within an approved tolerance or include sufficient capture data to explain why they cannot.

# 8. Severity, Disposition and Blocking Behaviour

## 8.1 Severity levels

| Severity | Meaning | Default Behaviour |
| --- | --- | --- |
| Blocker | Data loss, authority breach, unrecoverable progression failure, production POC dependency, crash in required flow, impossible world, protected representation violation or release-integrity failure. | Stops the affected gate and release. No ordinary waiver. |
| Error | Contract violation that makes content invalid, incomplete, ambiguous, unsafe or unusable under a supported profile. | Blocks status advancement and affected build profile. |
| Warning | Credible design, quality, compatibility or maintenance risk that may be acceptable with review. | Requires disposition before milestone closure. |
| Advisory | Improvement, trend or non-blocking observation. | Recorded for planning; no automatic gate block. |
| Information | Diagnostic context or successful evidence. | Retained according to suite policy. |

## 8.2 Dispositions

A finding may be:

- open;
- confirmed;
- false positive;
- accepted by design;
- deferred with owner and milestone;
- waived temporarily;
- fixed awaiting verification;
- closed by verified regression;
- superseded by a new contract.

## 8.3 Protected non-waivable failures

The following cannot be waived for public release:

- known save overwrite or unrecoverable corruption;
- unresolved authoritative resource duplication/loss in required flows;
- client authority over persistent world state;
- production dependency on archived POC identities;
- missing required pack or migration silently ignored;
- required progression impossible under a supported profile;
- protected personhood/representation rule violation;
- shipped asset without required rights/provenance evidence;
- blocker crash or hang in an approved required flow;
- release bundle whose build or content identity cannot be reproduced.

# 9. Production Lifecycle and Gate Mapping

Validation evidence increases with the production lifecycle defined by 25A.

| Production Status | Minimum Validation Expectation |
| --- | --- |
| Concept | Source and ownership identified; unsupported claims and open decisions marked. |
| Foundation | Schema target, relationship roles, capability obligations and completeness contract identified. |
| Specified | Required fields, dependencies, fallback, presentation, runtime and test obligations complete on paper. |
| Data Ready | Schema, identity, reference, pack and initial semantic validation pass. |
| Prototype Ready | Complete interaction path works with controlled fixtures; failure and recovery are represented. |
| Asset Ready | Required assets, source manifests, bindings, readability and cost classes pass asset validation. |
| Integrated | Worldgen, runtime systems, physical registries, saves and UI connect under representative profiles. |
| Validated | Required automated suites and human quality reviews pass with no unresolved blocker. |
| Release Candidate | Scope, content, localisation, packaging, migration, performance baseline and evidence bundle are frozen. |
| Released | Shipped build and lockfile are archived; compatibility and regression monitoring continues. |
| Deprecated | Replacement, aliases, migration and affected evidence are defined. |
| Archived | Excluded from normal production; retained evidence and tests remain discoverable. |

# 10. Execution Profiles and Trigger Rules

Validation profiles define how much evidence is appropriate for a change. They are not substitutes for production tiers.

| Profile | Typical Trigger | Required Scope |
| --- | --- | --- |
| Authoring Check | Save/import of one source record or Forge manifest. | Changed fields, schema, identity, immediate references and local completeness. |
| Change-Set Gate | Pull request, Summer Engine task completion or controlled document-to-data update. | Changed targets, reverse dependencies, affected suites, selected deterministic seeds and migration checks. |
| Integration Gate | Merge to production integration branch or new pack/interface version. | Cross-pack resolution, representative domain fixtures, runtime smoke, save/load and affected seed corpus. |
| Nightly Assurance | Scheduled development run. | Broad seed batch, golden seeds, long-running summaries, migration corpus, performance trend and POC scan. |
| Milestone Gate | Core classification lock, prototype milestone, Asset Ready/Integrated/Validated promotion. | Full milestone suite, target hardware profiles, human reviews and known-debt disposition. |
| Release Candidate Gate | Build/profile freeze. | Complete release suite, migration from supported versions, packaging, localisation, recovery, authority and evidence bundle. |
| Post-Release Regression | Patch, pack update or compatibility incident. | Affected release suites, captured player-world fixtures and rollback verification. |

# 11. Local, Editor, CI, Nightly, Milestone and Release Runs

## 11.1 Local and editor validation

Local validation should finish quickly enough to guide authors. It includes:

- schema and field checks;
- namespace and collision checks;
- immediate hard references;
- source ownership;
- local completeness;
- asset binding existence;
- simple preview or seed placement where relevant.

## 11.2 Continuous integration validation

Every change set must run:

- normalisation and clean-rebuild comparison;
- schema/identity/reference checks;
- pack dependency resolution;
- changed-domain semantic checks;
- affected progression proof;
- migration compilation where versions changed;
- test fixture and packaged-headless smoke appropriate to the change;
- generated-artifact cleanliness check.

## 11.3 Nightly and milestone validation

Nightly runs extend coverage to broad seed distributions, LOD soak, transaction conservation, performance trends, localisation, POC leakage and known-risk suites. Milestone runs use frozen candidate packs and retain complete evidence.

## 11.4 Recommended provisional seed-run scale

The source documents do not lock exact sample counts. The following are **recommended starting values**, subject to profiling and approval in Document 18:

| Profile | Recommended Starting Corpus |
| --- | --- |
| Change Set | All affected golden/adversarial seeds plus at least 32 deterministic broad seeds. |
| Nightly | All golden seeds, at least 256 broad seeds, 16 adversarial/boundary seeds and 4 long-running simulations. |
| Milestone | All retained corpora plus at least 2,048 broad seeds across supported world/build profiles. |
| Release Candidate | Statistically justified corpus not smaller than the milestone set, plus all supported migration, pack-removal and multiplayer compatibility fixtures. |

Counts may increase or be stratified by world profile, pack set and risk. A smaller corpus requires an explicit reason, not silent convenience.

# 12. Schema and Field Validation

Schema validation is the first executable gate. It answers whether each record can be interpreted according to its registered contract before the project spends time evaluating gameplay meaning.

## 12.1 Required checks

- schema ID and compatible version resolve;
- required and conditional fields exist;
- data types, ranges, enums and patterns are valid;
- inherited and extension-facet fields obey merge rules;
- derived fields are not hand-authored as independent truth;
- planning-only fields are excluded from shipped runtime records where required;
- deprecated fields carry migration or removal rules;
- unknown fields are either declared extensions or rejected;
- source maps identify the authoritative authoring location;
- defaults are explicit and versioned rather than silently injected by a tool update.

## 12.2 Failure behaviour

Invalid records do not enter the compiled registry. The compiler may continue to report additional findings, but the affected pack is not admissible. Safe automated fixes may propose formatting or canonical-order changes; they may not invent missing design meaning, change IDs, choose a fallback provider or alter protected fields.

# 13. Identity, Namespace, Alias and Tombstone Validation

Identity validation enforces Document 25B and prevents persistent worlds from confusing one definition with another.

| Check | Blocking Condition |
| --- | --- |
| Qualified ID | Invalid grammar, illegal token, wrong domain or unregistered namespace. |
| Namespace Ownership | Pack authors a canonical identity outside its declared ownership. |
| Collision | Two logical definitions claim the same qualified ID. |
| Alias | Alias loops, ambiguity, cross-domain incompatibility or missing target. |
| Replacement | Replacement violates compatibility, lacks migration or silently changes identity. |
| Tombstone | Removed persistent identity has no historical/recovery contract. |
| Localisation Key | Duplicate incompatible ownership or missing required fallback. |
| Generated Identity | Same generating inputs produce different IDs, or different persistent instances collide. |
| Spatial Frame | Container-local reference resolves without its owning frame or changes identity after movement. |

Identity findings are errors by default. Historical aliases may produce warnings only when they resolve unambiguously and their deprecation window remains supported.

# 14. Reference, Relationship, Cycle and Cardinality Validation

Reference validation checks that the graph can be resolved. Relationship validation checks that the graph obeys the semantics declared in 25C.

## 14.1 Hard and soft references

- Hard references must resolve in every build profile that admits the source definition.
- Optional references must declare absence behaviour.
- Soft queries must return at least one eligible provider when required by a supported profile.
- Reverse links must match registered inverse expectations.
- Generated bindings must record selected providers and selection evidence.

## 14.2 Cycles

Cycles are evaluated by relationship type:

- hierarchy cycles are blocking where `contains/part_of` forbids them;
- dependency cycles are blocking unless an explicitly registered interface resolves them;
- social, trade or rivalry cycles may be valid;
- progression cycles are blocking when no initial capability can enter the loop;
- migration dependency cycles are always blocking.

## 14.3 Cardinality and scope

Validators check minimums, maximums, uniqueness, exclusivity, local/world/realm/container scope and temporal mode. A culture may have several factions, but a generated instance cannot have two mutually exclusive sovereign owners at the same time unless the state model explicitly supports contested control.

# 15. Capability, Suitability, Fallback and Completeness Validation

These checks turn the Atlas from a list into a usable production graph.

## 15.1 Capability validation

For every requirement:

- the capability ID resolves;
- provider type, band, access, capacity and quality are compatible;
- required environmental, cultural, legal, knowledge or progression conditions can be met;
- provider availability is evaluated per supported world/build profile;
- capacity is not double-counted across consumers where exclusivity applies;
- optional providers are not treated as guaranteed Core dependencies.

## 15.2 Suitability validation

Validators evaluate:

- hard constraints before weighted preferences;
- exclusions before positive suitability;
- deterministic candidate ordering;
- required explanation fields for unusual adjacency or placement;
- whether no-candidate results invoke a registered fallback rather than an arbitrary default.

## 15.3 Completeness validation

A package is incomplete when required world role, physical inputs/outputs, dependencies, failure/recovery, presentation, state, LOD, save, migration or test obligations are absent. Completeness blocks status advancement even when all individual field types are valid.

# 16. Semantic Coherence and Human Design Review

Semantic validation identifies contradictions that schemas cannot understand alone. It combines registered rules, graph queries, heuristics and human review.

| Coherence Family | Example Blocking or Review Condition |
| --- | --- |
| World | A biome transition has no climate, elevation, magical, historical or disaster explanation. |
| Capability | A settlement lacks water, food, shelter, storage, route access or an approved alternative survival model. |
| Ecology | Predator population lacks prey, scavenging, magical sustenance or migration source. |
| Civilisation | A culture exports goods with no material source, labour process, structure or trade acquisition. |
| Site | A dungeon has loot and occupants but no valid entrance, purpose, state behaviour, safe return or ownership logic. |
| Boss | A boss has statistics and drops but no territory, discovery, pressure, counterplay, aftermath or alternative outcome. |
| Narrative | An event selects destroyed, absent, unreachable or historically incompatible participants. |
| Representation | Personhood, culture, morality or hostility is inferred from anatomy, ancestry or appearance contrary to protected rules. |
| Player Trust | Permanent loss or irreversible world change occurs without readable cause, warning, agency, settings or recovery where promised. |

Automated semantic findings are recommendations or errors according to registered rules. Human review remains required for tone, cultural meaning, moral framing, fun and whether a technically valid repair preserves the intended fantasy.

# 17. Content-Pack, Manifest and Optional-Dependency Validation

Pack validation uses the exact resolution pipeline from 25D rather than loading loose files directly.

## 17.1 Manifest checks

- pack ID, version, namespace and trust class;
- schema/interface compatibility;
- required, optional, profile-required and incompatible dependencies;
- feature declarations and build-profile admission;
- definition and asset hashes;
- localisation and font coverage;
- migrations, aliases and tombstones;
- platform and memory classes;
- provenance and licence records;
- validation-suite and baseline declarations.

## 17.2 Resolution checks

- deterministic dependency resolution;
- no unresolved required pack;
- no hidden ownership conflict resolved by load order;
- no dependency cycle;
- extension facets target compatible definitions and fields;
- patches remain inside permitted operations;
- clean compilation reproduces the same semantic snapshot hash.

## 17.3 Optional-content checks

Every optional major pack must be tested in at least four states:

1. absent before world creation;
2. enabled before world creation;
3. added to an existing compatible world;
4. missing or removed from a world that contains its persistent instances.

The fourth state must produce warning, quarantine, recovery and reinstall paths without deleting unknown payloads or converting unique content into unrelated Core content.

# 18. POC Leakage and Archive-Isolation Validation

The proof of concept remains useful only as historical and regression evidence.

## 18.1 Production leakage scan

The scan covers:

- qualified IDs and aliases;
- source pack membership;
- display/localisation strings;
- code literals and enum branches;
- scene/resource paths;
- worldgen anchors and coordinates;
- tutorial assumptions;
- quest/event participant bindings;
- fixture names and build-profile dependencies;
- asset manifests and generated registries.

## 18.2 Blocking conditions

A production build fails when it:

- includes archived POC definitions in normal selection pools;
- requires Forest Hamlet, the fixed valley, named POC villagers, the watchtower, scripted goblin raid, fixed cave/ruin/camp layout or fixed portal destination;
- uses a renamed asset while retaining a hardcoded POC dependency;
- allows archive/test namespaces in a shipping lockfile except explicitly permitted non-runtime evidence.

## 18.3 Regression-fixture safety

Archived fixtures must be synthetic or isolated, cannot appear in player world lists, and must prove reusable mechanics rather than preserve production lore authority.

# 19. Deterministic World-Generation Contract

Determinism applies to authored selection and generated identity. The same approved inputs must produce the same selected definitions, topology, relationships, generated IDs and repair trace.

## 19.1 Deterministic input set

- world seed;
- world profile and settings affecting generation;
- generation-contract version;
- pack lockfile and registry snapshot;
- schema/interface versions;
- ordered named sub-seed derivation contract;
- approved platform-independent canonical data representation.

## 19.2 Required equality

Equivalent runs must match:

- selected world, region, biome, realm and history foundations;
- generated relationship graph;
- persistent generated IDs;
- placement decisions within approved deterministic representation;
- capability-provider selections;
- repair decisions and reason codes;
- world-manifest semantic hash.

Presentation-only ordering, asynchronous completion timing and non-authoritative visual effects do not need to match unless their owning system requires it.

## 19.3 Cross-version behaviour

A changed generation contract must increment its version. Existing explored content remains governed by its saved manifest and deltas. Unexplored content may adopt a new version only through explicit world-upgrade policy and tested migration.

# 20. Seed Corpus Architecture

No single seed set can prove every risk. The project therefore maintains multiple versioned corpora.

| Corpus Class | Purpose |
| --- | --- |
| Golden | Stable regression comparison for known representative worlds and prior defects. |
| Broad Distribution | Statistical coverage of ordinary seeds across supported profiles and pack sets. |
| Adversarial | Constraint boundaries, rare combinations, extreme topology and known risk patterns. |
| Minimal Pack | Core-only and smallest supported optional-content configurations. |
| Maximal Pack | All compatible official packs and representative heavy content combinations. |
| Migration | Worlds created under supported older generation, schema and pack versions. |
| Long-Running | Abstract and local simulation over extended time, catch-up and event sequences. |
| Multiplayer | Host/client, join/leave, reconnect and compatibility conditions on generated worlds. |
| Expansion Admission | New major expansion enabled, absent, added, removed and version-migrated. |
| Captured Defect | Minimal reproduction seeds/worlds from discovered failures. |

Every corpus has an owner, version, inclusion reason, retention policy and expected suites. Seeds are not removed merely because they become inconvenient; they are deprecated with reason or replaced by better reproductions.

# 21. Golden Seeds and Regression Snapshots

Golden seeds provide stable comparisons, not a preferred final-world canon.

## 21.1 Golden-seed evidence

Each golden seed retains:

- input manifest and lockfile;
- generated world-manifest hash;
- selected-definition list;
- relationship graph summary;
- region/route maps and key diagnostics;
- repair trace;
- progression proof;
- approved screenshots or map captures where presentation is relevant;
- expected warnings and accepted design notes.

## 21.2 Snapshot comparison

A changed snapshot is not automatically a failure. The run must classify the change as:

- intended by an approved source/contract change;
- migration-compatible;
- presentation-only;
- unexplained regression;
- improvement requiring new baseline approval.

Baseline updates require review and cannot be accepted automatically by the same change that produced them.

# 22. Broad-Distribution and Statistical Seed QA

Broad seed batches detect invalid rates, clustering, missing coverage and repetitive worlds.

## 22.1 Required measurements

- invalid-world and blocking-repair count;
- capability and progression failure count;
- start suitability and hazard distribution;
- region, biome and transition coverage;
- settlement/culture/faction distribution;
- ecology role coverage and population extremes;
- site/dungeon/boss density and isolation;
- route connectivity;
- realm access distribution where selected;
- resource scarcity and substitute-path availability;
- repeated package/kit/combination frequency;
- generation time, memory and manifest/save size;
- warning and non-blocking repair rate.

## 22.2 Pass principles

- Required deterministic and progression-valid outcomes are 100 percent across the approved release corpus.
- Any invalid world is a defect, not an acceptable statistical percentage.
- Quality distributions use approved envelopes rather than one universal target.
- Rare content may be rare, but required capability providers may not become statistically absent.
- High repair frequency is a design warning even when repairs succeed.

# 23. Adversarial, Boundary, Minimal-Pack and Maximal-Pack Seeds

Adversarial tests deliberately target conditions ordinary random sampling may miss.

## 23.1 Boundary families

- biome/climate transition edges;
- narrow land bridges, enclosed valleys, islands and disconnected underground spaces;
- minimum/maximum region and settlement density;
- sparse required resources;
- competing unique sites or owners;
- realm-route constraints;
- high corruption, hazard or magical-density combinations;
- destroyed/abandoned starting world-state combinations where allowed;
- maximal route, ecology and event graph complexity;
- local-space mobile structures at chunk/region boundaries for compatible expansions.

## 23.2 Minimal-pack profiles

Minimal packs prove Core Production does not rely on optional expansion content. Required capability queries must resolve entirely through the admitted Core profile or an explicitly approved error that prevents world creation before play.

## 23.3 Maximal-pack profiles

Maximal packs prove namespace compatibility, selection weighting, memory/load behaviour, conflicting suitability, optional feature interactions and pack-removal safety. They are stress cases, not a promise that every official expansion must always be active simultaneously unless the build profile states it.

# 24. Staged Worldgen Validation and Bounded Repair

World generation emits diagnostics after each stage. Repair is explicit, bounded and explainable.

| Stage | Example Validation |
| --- | --- |
| Topology | Land/sea/realm graph validity, connected playable space, scale bounds. |
| Climate and Terrain | Plausible bands, drainage, elevation, coast/underground transitions, buildable space. |
| Regions and Biomes | Suitability, adjacency, diversity, exclusions, transformation states. |
| History and Societies | Valid causes, culture/faction identities, settlements, ownership and conflict. |
| Ecology | Habitat, food web, migration/nest pressure and settlement interaction. |
| Routes and Services | Connectivity, traversal capability, trade/migration/raid access and clues. |
| Structures and Sites | Placement volume, entrances, purpose, ownership, rewards and state behaviour. |
| Threats and Bosses | Territory, warning, counterplay, pressure, aftermath and alternative outcomes. |
| Resources and Progression | Physical sources, substitutions, knowledge/station/tool access and capability paths. |
| Final Repair | Missing provider selection, optional relocation, clue/route creation or controlled generation failure. |

## 24.1 Repair rules

- repair decisions use registered fallback groups;
- repair cannot introduce POC content;
- repair cannot silently violate hard exclusions;
- repair steps have deterministic reason codes and candidate traces;
- each stage has a maximum repair budget;
- exceeding the budget produces a controlled invalid-world report;
- repeated repair patterns create a design finding against the source content or generation rule.

# 25. Topology, Transition, Route and Placement Validation

## 25.1 Topology

Required checks include:

- no unreachable required world component;
- no trapped start without an approved escape capability;
- realm routes include safe return or clearly approved one-way consequences;
- underground/sky/special environments connect through valid access families;
- major route graphs remain navigable after generated obstacles and state changes where required.

## 25.2 Transitions

Biome and region transitions require:

- valid adjacency or an explanatory modifier;
- traversable geometry appropriate to supported player capabilities;
- readable visual and gameplay cues;
- no unintended hard progression wall;
- transition assets and material/state coverage.

## 25.3 Placement

Structures, settlements, sites, nests, deposits and bosses validate:

- spatial volume and clearance;
- terrain and environmental suitability;
- required route and service access;
- density and minimum separation;
- local performance class;
- ownership/history compatibility;
- fallback and relocation behaviour.

# 26. Spawn, Early Survival, Readability and Building-Space Validation

The production game has no fixed tutorial region, so every eligible start must be understandable and survivable under its selected settings.

## 26.1 Spawn contract

Every eligible start must provide or reveal:

- a safe initial placement volume;
- readable immediate gathering opportunities or local substitutes;
- at least one shelter/building strategy;
- an escape from immediate hazards;
- enough open/buildable space for basic player agency;
- at least one discoverable progression direction;
- guidance appropriate to the selected tutorial setting without creating fixed world content.

## 26.2 Profile-aware validation

A harsh world profile may permit greater danger, scarcity or travel. Validation compares the result to that profile's promises rather than applying relaxed-mode expectations. However, difficulty cannot excuse unavoidable failure before the player can perceive or respond.

## 26.3 Readability review

Automated checks can identify slope, light, distance and density problems, but human review confirms that landmarks, roads, smoke, sounds, weather, creature signs, resource clues and interface guidance make choices legible.

# 27. Ecology, Civilisation, Site, Boss and Narrative Coherence

These domain tests evaluate whole packages rather than isolated rows.

## 27.1 Ecology

- habitat and climate fit;
- prey/food or approved alternative;
- bounded populations and spawn caps;
- migration/nest behaviour where declared;
- resource drops and harvesting routes;
- settlement, agriculture, magic and automation interactions;
- depletion/recovery and LOD summary compatibility.

## 27.2 Civilisation

- ancestry/personhood, culture, citizenship and faction remain separate;
- settlement needs have providers or approved alternatives;
- production and exports have physical sources;
- jobs, structures, routes and storage support claimed activity;
- hostility and morality arise from history/interest, not protected identity shortcuts;
- dynamic ownership and migration can persist through saves.

## 27.3 Sites and bosses

- valid discovery and entry;
- solvable/escapable traversal according to profile;
- occupants and ecology;
- rewards with physical provenance;
- multiple outcomes where promised;
- state transitions, restoration/reoccupation and aftermath;
- no boss reduced to an isolated arena and reward chest.

## 27.4 Narrative and events

- participants exist and can be reached;
- objectives bind to current world state;
- failure/expiry has defined consequences;
- events do not resurrect destroyed state without explanation;
- rumours and knowledge certainty reflect what the player can know;
- generated arcs do not claim unsupported canon.

# 28. Diversity, Repetition and Procedural Blandness Review

Technical validity is insufficient when worlds feel interchangeable.

## 28.1 Diversity signals

- distribution across geography, culture, ecology, sites, threats and history;
- repeated adjacency and package combinations;
- repeated settlement layouts and structure kits;
- repeated creature body plans without mechanical or ecological distinction;
- repeated dungeon grammar or boss pattern;
- overuse of the same capability provider;
- regional material, weather and state variation;
- meaningful differences in player routes and consequences.

## 28.2 Human review questions

- Can reviewers distinguish regions without reading debug labels?
- Do cultures differ through production, architecture, law, values and history rather than cosmetic palettes alone?
- Does the seed change practical decisions, not only names and colours?
- Do repairs erase unusual worlds into one standard template?
- Does selected content prove all four game pillars in connected play?

A blandness finding usually triggers content-family redesign, stronger relationship rules or narrower scope, not simply more names.

# 29. Progression Reachability Architecture

Progression validation treats the game as a conditional capability graph.

## 29.1 Graph elements

| Element | Meaning |
| --- | --- |
| Start State | Capabilities and knowledge available at world/character start under one supported profile. |
| Provider | Block, item, resource, NPC, settlement, site, recipe, machine, spell, event, trade route or realm that grants a capability. |
| Requirement | Material, tool, station, knowledge, reputation, environment, time, risk or prior capability needed to use a provider. |
| Transformation | Recipe, action, project, research, trade, salvage, ritual or world-state change producing a new capability. |
| Substitute Group | Multiple providers satisfying the same progression obligation. |
| Optional Branch | Valuable pathway not required to prove the supported minimum experience. |
| Required Goal | Capability or connected gameplay promise required by the build/milestone profile. |
| Hazard Gate | Danger or preparation requirement that is reachable and telegraphed rather than a hidden dead end. |

## 29.2 Supported profiles

Reachability is evaluated separately for world settings, difficulty profiles, enabled packs, multiplayer mode and milestone scope. A capability may be required in Core Production but optional in a peaceful preset, or vice versa, only when the profile declaration is explicit and player-facing.

# 30. Progression Proof and Supported-Profile Requirements

Every Core Production package affecting progression supplies a machine-readable proof obligation.

## 30.1 Proof contents

- starting capability set;
- required capability goals;
- eligible provider families;
- acquisition conditions;
- dependency and transformation edges;
- mutually exclusive choices;
- substitutions and fallback groups;
- trade, salvage, teaching, research and exploration routes;
- maximum acceptable gate depth where defined;
- seed/world/profile assumptions;
- proof result and selected example paths;
- unreachable nodes and reason codes.

## 30.2 Required progression coverage

The Core Production slice must prove reachable, connected use of:

- survival and shelter;
- gathering and physical resources;
- crafting and building;
- automation scaling;
- practical magic;
- NPC civilisation, trade and settlement change;
- exploration, sites, dungeons and threats;
- quests/events and persistent aftermath;
- the selected playable dimension;
- save, migration and LOD continuity.

The proof does not require every player to follow one path. It requires at least one valid path and the approved alternatives for each supported profile, while preserving sandbox freedom.

# 31. Substitute Paths, Fallback Repair and Controlled Failure

Fallbacks preserve capability, not identical content.

## 31.1 Substitute-path validation

A substitute is valid only when it:

- satisfies the required capability band;
- is reachable under the same supported profile;
- does not require the missing provider indirectly;
- preserves required physical inputs/outputs;
- respects culture, realm, legality, difficulty and world-state constraints;
- provides readable discovery or guidance;
- records which provider was selected in the world manifest.

## 31.2 Repair validation

Repairs are tested for:

- deterministic selection;
- bounded number and cost;
- no hard-exclusion violation;
- no unexplained teleportation or retroactive change to explored content;
- preserved world identity and diversity;
- visible clue, route, trade or knowledge support where needed;
- complete diagnostic trace.

## 31.3 Controlled failure

When no valid repair exists, world creation must fail before normal play with an actionable report. A controlled failure is preferable to generating a world that becomes impossible hours later.

# 32. World Upgrade, New Content and Explored-World Stability

Adding content must not silently regenerate history or terrain already experienced by players.

## 32.1 Upgrade tests

- compare old and new pack lockfiles;
- load the last supported world-manifest versions;
- preserve explored chunks, generated instance IDs and recorded history;
- generate new content only under approved unexplored-region or explicit retrofit rules;
- create discoverable routes or rumours for newly admitted content where promised;
- preserve unique rewards and tombstones;
- verify that removed or deprecated providers leave progression-valid alternatives;
- compare save size, load time and migration duration against budgets.

## 32.2 Retrofit rules

A retrofit into explored space requires an owning design rule, player-facing explanation, conflict handling and rollback. A tool cannot place new content into player builds merely because the site is technically empty.

# 33. Runtime, Save, Load, Migration and Recovery Validation

Runtime validation proves that the authoritative world survives ordinary and adverse lifecycle events.

## 33.1 Save/load matrix

Test at minimum:

- clean save and immediate reload;
- autosave during normal simulation;
- save after world edits, construction, combat, event and realm travel;
- save with active machines, projects, effects and mobile containers;
- repeated save/load cycles;
- forced interruption before, during and after commit;
- backup selection and last-known-good recovery;
- damaged-copy diagnosis without overwriting evidence.

## 33.2 Migration matrix

- every supported source version to current version;
- definition rename, split, merge and replacement;
- schema/interface changes;
- pack addition, removal and reactivation;
- worldgen contract update;
- unique content and historical records;
- local-frame/mobile-instance records for admitted expansions;
- failed migration, rollback and diagnostic package.

## 33.3 Pass conditions

- atomic or equivalently safe commit behaviour;
- unchanged authoritative state where no migration applies;
- deterministic migration output from identical inputs;
- no silent field loss;
- aliases/tombstones resolve correctly;
- failed migration leaves the source save untouched;
- recovery steps are understandable and testable.

# 34. Simulation LOD, Promotion, Demotion and Catch-Up Validation

Leyforge's living world depends on switching between detailed local simulation and compact distant summaries without changing identity or creating resources.

## 34.1 LOD test cycle

1. Create a known local state.
2. Demote it to the owning summary model.
3. Advance time and events at distance.
4. Save, close and reload where applicable.
5. Promote the state near a player.
6. Compare identity, inventories, population, damage, projects, routes, ecology, events and history against expected conservation rules.

## 34.2 Required domains

- NPCs and households;
- settlements, needs and construction;
- ecology, nests and migrations;
- routes, caravans and fleets where admitted;
- automation, storage and power/mana networks;
- dungeons, occupation and reoccupation;
- bosses and regional pressure;
- quests, events and world states;
- realms and inactive-world summaries;
- mobile constructs under Set 26-compatible profiles.

## 34.3 Catch-up limits

Catch-up is bounded. Extremely long absence may aggregate outcomes, but it must preserve major identities, unique items, protected state, project accounting and player-relevant history. Catch-up cannot execute an unbounded number of hidden ticks or create irreversible surprises without the warning and settings promised by the owning system.

# 35. Transactions, Conservation, Economy, Automation and Magic Validation

Authoritative quantities require transaction-level tests.

## 35.1 Conservation ledger

Every test records:

- starting quantities and ownership;
- reservations;
- inputs consumed;
- outputs and by-products created;
- losses through spoilage, damage, waste, theft or destruction;
- transfers and trade value;
- ending quantities;
- reason-coded deltas.

## 35.2 Required scenarios

- crafting, batch crafting and cancellation;
- machine blockage, overflow and restart;
- cross-chunk and LOD transition;
- warehouse donation, sale, contract and reservation;
- NPC project consumption and refund policy;
- repair and salvage;
- mana/fuel consumption and network faults;
- event interruption and raid damage;
- save/load during queued work;
- duplicate command, retry and reconnection;
- optional-pack quarantine of owned inventories or machine parts.

## 35.3 Economy checks

Economy validation looks for:

- goods with no physical source;
- sinks with no player-facing purpose;
- unbounded value loops;
- free conversion through substitutions;
- village demand disconnected from needs;
- trade routes that ignore stock, danger or capacity;
- old materials made useless by new tiers;
- unique or claimed goods duplicated through migration or fallback.

# 36. Multiplayer Authority, Compatibility and Reconnection Validation

The authoritative host/server owns persistent state in solo and multiplayer-compatible architecture.

## 36.1 Required checks

- client commands are validated before state changes;
- inventories, world edits, machines, quests, combat, ownership and generated bindings cannot be authored by clients;
- host and clients resolve compatible pack lockfiles and registry snapshots;
- missing required presentation/content blocks join before world state is exposed;
- sequence IDs and retries do not duplicate transactions;
- join-in-progress reconstructs current world and local-frame state;
- disconnect/reconnect preserves ownership, reservations and event contribution;
- split-screen/local players retain separate input/UI identity;
- migrated host save is validated before clients join.

## 36.2 Moving-container boundary

For Set 26-compatible systems, tests must verify that actors and blocks inside a moving persistent container retain local identity, world transform, authority, inventory, damage and save state through movement, chunk boundaries, join/leave and LOD. Detailed vessel physics tolerances remain owned by 26F-26O and Document 18.

# 37. Performance Budget Architecture

Performance is a design constraint recorded in data and tested in representative builds.

> **Numeric-Budget Boundary**  
> The current sources require early measurable budgets but do not establish final Godot/Summer Engine hardware numbers. Document 25E therefore locks categories, scenarios, baseline practice and gate behaviour. The rewritten Document 18 proposes numeric targets and reference hardware for Ash's approval.

## 37.1 Budget categories

| Budget Family | Example Measurements |
| --- | --- |
| Frame and Responsiveness | frame time, percentile hitches, input latency, main-thread and render-thread time. |
| Rendering | draw calls, visible sections, triangles/voxels, material instances, lights, shadows, particles and overdraw. |
| World Streaming | chunk generation/mesh/collision time, upload time, active radius, queue depth and cancellation. |
| CPU Simulation | NPC/creature AI, pathing, settlements, ecology, automation, magic, events and LOD manager time. |
| Memory | registries, chunks, navigation, actors, assets, saves, caches and peak migration memory. |
| Persistence | save duration, autosave hitch, journal growth, compaction, load time, migration time and recovery time. |
| Network | bandwidth, snapshot/delta size, command rate, join payload, moving-container relevance and authority cost. |
| Content | expected density, actor count, effect count, animation/rig cost, texture/material class and state variants. |
| Tooling | import, validation, clean compile, seed batch and packaging duration. |

## 37.2 Budget declaration

Every major definition or package declares cost classes rather than pretending exact cost is known before implementation. Cost classes become measured values when representative assets and runtime behaviour exist.

# 38. Workload Profiles and Representative Scenarios

Performance must be measured against scenes representing the final game identity, not empty test maps only.

| Scenario | Required Connected Load |
| --- | --- |
| New Seed Start | World generation/streaming, terrain, resources, weather, basic creatures, UI and save creation. |
| Dense Settlement | Named NPCs, schedules, needs, inventories, construction, trade, lighting, audio and nearby ecology. |
| Production Network | Mining/farming, transport, storage, processing, mana/power, visible items, NPC deliveries and LOD boundary. |
| Adventure Site | Procedural rooms, enemies, navigation, hazards, loot, effects, state changes and save/reload. |
| Regional Threat | Settlement, guards, creatures, projectiles, effects, damage, events, aftermath and history recording. |
| Realm Travel | Portal/route transition, separate realm streaming, realm rules, return path, save and inactive-world summary. |
| Long-Running World | Many explored regions, settlements, routes, dungeons, events, deltas, migrations and content packs. |
| Multiplayer Representative | Approved player count, split-screen/online mode, join/reconnect, authority, replication and content validation. |
| Set 26 Stress Case | Water/marine environment, mobile vessel interior, crew/AI, cargo, weather/waves, combat/damage and LOD according to admitted Set 26 scope. |

Each milestone selects the scenarios relevant to its scope. A release cannot exclude a scenario required by the player-facing feature set.

# 39. Performance Baselines, Regression and Profiling Evidence

## 39.1 Baseline requirements

A baseline records:

- exact build and content snapshot;
- hardware/OS/runtime configuration;
- scenario and input path;
- warm-up and capture duration;
- measurement tool/version;
- frame, memory, streaming, save and network metrics;
- captured spikes and subsystem attribution;
- known limitations and approved thresholds.

## 39.2 Regression policy

A performance change is reviewed when it:

- exceeds an approved absolute budget;
- regresses against the comparable baseline beyond its tolerance;
- shifts cost into another subsystem;
- increases tail hitches despite improving average time;
- increases save, migration or join cost disproportionately;
- turns a previously supported content density into a failure.

A better average does not excuse blocker hitches, memory exhaustion or data-loss risk.

## 39.3 Profiling discipline

- profile packaged builds, not only editor sessions;
- capture representative worst-case content;
- retain raw traces for milestone failures;
- compare equivalent settings and content snapshots;
- separate first-run shader/import cost from steady-state play;
- identify CPU, GPU, IO, memory and network bottlenecks before reducing design scope;
- trigger redesign when repeated optimisation cannot fit the approved budget.

# 40. Asset, Presentation, Localisation and Provenance Validation

## 40.1 Asset checks

- referenced asset exists and matches owning definition;
- source project and export manifest resolve;
- model/voxel/material/animation/audio/VFX/icon/map/Codex families are complete for required states;
- sockets and events use registered names;
- LOD/cost class and collision/navigation metadata exist;
- visual variants do not conceal gameplay-significant differences;
- placeholder assets are excluded from statuses that forbid them;
- shared fallback asset is approved and visually coherent.

## 40.2 Localisation checks

- required keys exist for selected locales;
- fallback locale resolves;
- generated names preserve deterministic identity and grammar rules;
- UI handles text expansion and right-to-left support where adopted;
- font coverage includes required glyphs;
- audio/subtitle relationships are complete;
- untranslated developer labels do not enter player-facing builds.

## 40.3 Provenance checks

- source, contributor and licence/permission recorded;
- AI-assisted generation or transformation recorded according to policy;
- derivative dependencies identified;
- export settings and version retained;
- unapproved or ambiguous-rights assets block release.

# 41. Accessibility, Representation, Player Trust, Fun and Balance Gates

These gates combine tools, specialist review and playtesting.

## 41.1 Accessibility

Validation covers:

- keyboard/mouse, controller and approved touch paths;
- focus, back, navigation and remapping;
- scalable text and UI;
- colour-independent critical cues;
- subtitles/captions and audio alternatives;
- reduced motion/flash and effect intensity settings;
- readable telegraphs and timing alternatives where promised;
- split-screen legibility where included;
- Codex/help access without forced pop-ups.

## 41.2 Representation

Protected reviews test that procedural systems do not:

- collapse ancestry, personhood, culture, citizenship and faction;
- infer morality, intelligence or criminality from anatomy or appearance;
- make one people universally hostile, primitive or biologically restricted to one culture;
- use generated history to reproduce prohibited stereotypes;
- deny personhood because a being is artificial, undead, non-humanoid or magical without an approved narrative rule;
- create insensitive names or combinations through procedural generation.

## 41.3 Player trust

Reviewers examine:

- clear causes and warnings for loss;
- recoverability and settings promises;
- ownership and consent around storage, settlements and multiplayer;
- no hidden conversion of optional content into required purchases/dependencies;
- honest difficulty and worldgen descriptions;
- no silent world rewrites;
- known-issue disclosure and rollback.

## 41.4 Fun and balance

Automated metrics may find extremes, but humans judge:

- whether connected loops are satisfying;
- whether travel, gathering, automation and settlement support feel purposeful;
- whether threats have counterplay;
- whether worlds remain surprising without becoming incoherent;
- whether repair rules preserve variety;
- whether rewards justify effort;
- whether any pillar dominates or disappears unintentionally.

# 42. Document Set 26 Major-Expansion Validation Case

Set 26 is the first real test of the general expansion architecture. This section defines admission categories without designing maritime gameplay.

## 42.1 General Set 26 checks

- all maritime namespaces and extension schemas are registered through 25B-25D;
- base-game build profiles remain valid without Set 26 unless Ash later classifies packages as required;
- required and optional cross-pack references are explicit;
- adding Set 26 to an existing world preserves explored content and creates approved discovery routes;
- removing Set 26 quarantines maritime instances and unknown payload safely;
- reactivation restores identity and state;
- downstream Documents 00-18 and Forge amendment dependencies are tracked;
- final 25L closure includes selected Set 26 evidence.

## 42.2 System-specific admission families

Detailed thresholds remain with 26B-26O, but Set 26 must eventually supply suites for:

- fluid/water-state persistence and bounded simulation;
- ocean, coast, island and underwater generation;
- wind, wave, tide, current and storm profiles;
- swimming/diving and underwater interaction;
- vessel blueprint, class, commissioned instance and refit identity;
- local-space vessel blocks/components and world-space transforms;
- buoyancy, propulsion, steering, navigation and collision;
- construction, repair, salvage and resource conservation;
- ports, shipyards, crews, fleets, routes and maritime economy;
- naval combat, boarding, flooding, fire, damage and sinking;
- marine ecology, sites, bosses and persistent aftermath;
- multiplayer ownership, moving interiors, join/leave and reconnect;
- LOD for distant vessels, fleets, routes and weather;
- save, migration, optional-pack removal and performance.

## 42.3 Determinism boundary for maritime simulation

World selection, generated vessel/site identities, route definitions and saved repair decisions must be deterministic. Real-time buoyancy, waves and collision may use authoritative simulation with approved tolerances rather than bitwise identical cross-platform results. Set 26 and Document 18 must state which outcomes require exact replay, bounded tolerance or server authority.

## 42.4 Set 25 closure boundary

Set 25 may continue while Set 26 is incomplete, but final integration closure cannot claim that expansion admission is proven until the selected Set 26 packages publish compatible schemas, manifests, suites, migration requirements and evidence or are explicitly deferred by Ash.

# 43. AI-Assisted Validation and Human Authority

AI may accelerate validation but does not become the source of truth.

| Permitted AI Work | Required Control |
| --- | --- |
| Generate candidate test cases from approved schemas and relationships. | Human reviews coverage and prevents invented requirements. |
| Detect missing fields, broken links, unusual distributions and likely dead ends. | Validators and source documents determine formal failure; humans review false positives. |
| Summarise seed batches, traces and migration diffs. | Raw evidence remains available; summaries cannot hide outliers. |
| Propose minimal reproductions and likely owners. | Maintainers confirm before changing content or code. |
| Run playtest agents for navigation/economy/ecology signals. | Human playtesting judges fun, readability, ethics and player freedom. |
| Suggest baseline or repair updates. | Baseline, canon, fallback and release changes require authorised approval. |

AI must not silently:

- update golden baselines;
- waive failures;
- change protected representation rules;
- choose final release scope;
- rewrite canon to make a test pass;
- delete evidence or player-world payload;
- mark a milestone released.

# 44. Reports, Dashboards, Diagnostics and Retained Artefacts

## 44.1 Required reports

- schema and source-map report;
- identity/namespace/alias report;
- reference and relationship graph report;
- capability and completeness report;
- pack resolution and lockfile report;
- POC leakage report;
- seed distribution and invalid-world report;
- progression reachability and fallback report;
- runtime transaction/conservation report;
- save/migration/recovery report;
- LOD promotion/demotion report;
- performance baseline and trend report;
- asset/provenance/localisation report;
- accessibility/representation/player-trust review;
- release-gate summary and evidence index.

## 44.2 Diagnostic tools

The rewritten Document 18 should provide or plan:

- registry browser;
- relationship/capability graph inspector;
- pack and lockfile inspector;
- seed viewer and generation-stage timeline;
- repair-trace explorer;
- progression path visualiser;
- save/world-manifest inspector;
- transaction ledger viewer;
- LOD state inspector;
- performance dashboard and hitch capture;
- migration preview;
- POC-reference scanner.

## 44.3 Retention

Release evidence bundles, supported migration fixtures, golden seeds, blocker reproductions and approved baselines are retained for the compatibility window. Large raw traces may use tiered retention, but summary, build identity and critical failure artefacts remain discoverable.

# 45. Exceptions, Waivers and Temporary Debt

A waiver acknowledges risk; it does not convert failure into correctness.

## 45.1 Waiver fields

- waiver ID;
- finding and affected gate;
- reason and player impact;
- owner;
- accepted risk;
- affected build profiles/platforms;
- mitigation;
- expiry or milestone;
- verification/removal test;
- approver.

## 45.2 Waiver limits

- no waiver for protected non-waivable failures;
- waivers expire automatically;
- release notes disclose player-relevant limitations;
- repeated renewal triggers redesign review;
- a warning suppressed in tooling still remains in retained evidence;
- optional features may be disabled instead of waiving unsafe behaviour.

## 45.3 Integration debt

Set 26 and future expansions use an integration-debt register for pending schemas, tests, migrations, downstream amendments and performance evidence. Debt is not closed by stating that another document will cover it; an owner and gate are required.

# 46. Defect Triage, Reproduction and Regression Ownership

## 46.1 Defect record

Every confirmed defect records:

- finding code and severity;
- affected definitions/packs/builds/worlds;
- reproduction inputs;
- expected and actual result;
- likely owning system/document;
- player impact and data-loss risk;
- workaround/recovery;
- fix version;
- regression test/fixture;
- closure evidence.

## 46.2 Triage order

1. Protect player data and stop destructive automation.
2. Preserve the failing save, seed, lockfile and logs.
3. Determine whether source data, generation, runtime, migration, presentation or tooling owns the defect.
4. Create the smallest reproduction that preserves the failure.
5. Fix the canonical source, not a generated symptom.
6. Add regression coverage.
7. Re-run reverse dependencies and release gates.

## 46.3 Reopen policy

A defect reopens when the same contract fails under a different content pack, seed, platform or LOD state. A narrow test that only fixes one seed is insufficient when the underlying rule remains general.

# 47. Release-Gate Architecture

A release gate is a signed decision over a frozen candidate, not a collection of informal green checks.

## 47.1 Gate inputs

- approved milestone scope and build profile;
- application build hash;
- pack lockfile and registry snapshot;
- supported save/migration range;
- suite versions and reports;
- performance baseline and hardware results;
- accessibility, representation, localisation and player-trust reviews;
- known issues and waivers;
- backup, rollback and recovery proof;
- documentation/source-of-truth integrity report;
- Ash's approval record.

## 47.2 Gate outcomes

| Outcome | Meaning |
| --- | --- |
| Pass | All required evidence complete; no unresolved blockers; approved warnings/waivers recorded. |
| Conditional Pass | Internal milestone may proceed under explicit constraints; not equivalent to public release. |
| Hold | Evidence incomplete or material risk unresolved; candidate remains frozen or returns to integration. |
| Fail | One or more blocking criteria violated; release prohibited. |
| Withdrawn | Candidate superseded before decision; evidence retained. |

## 47.3 Gate independence

The person or automation producing a candidate cannot unilaterally approve its release baseline, suppress blockers or alter the gate contract. Ash retains final authority.

# 48. Core Production Definition of Done

The Core Production slice passes only when every selected package and the connected build satisfy the following.

| Gate | Required Result |
| --- | --- |
| POC Removal | No production seed, registry, quest, event, asset manifest, build profile or code branch depends on retired POC identities or fixed arrangements. |
| Registry Integrity | Core definitions pass schema, identity, namespace, reference, dependency, alias, facet and pack validation. |
| Relationship Completeness | Every selected world, biome, realm, culture, settlement, creature, site, boss, structure, material and event meets its registered package contract. |
| World Generation | Approved seed corpora are deterministic, coherent, traversable, diverse, progression-valid and free of blocking repair. |
| Physical Content | Required blocks, items, recipes, resources, structures, drops, rewards and state variants exist and connect to real systems. |
| Progression | Supported profiles have recorded valid capability paths and approved substitutes without named-content hardcoding. |
| Living Simulation | NPCs, settlements, ecology, automation, magic, threats, events and world states preserve identity and consequences near and far. |
| Adventure | Selected dungeons, boss/threat and playable realm support discovery, preparation, outcomes, rewards, return and aftermath. |
| Persistence | Saves, backups, migrations, pack changes, LOD and recovery preserve authoritative state. |
| Authority | Solo/multiplayer-ready transactions and persistent changes follow the approved authority model. |
| Presentation | Required Forge assets, animation, audio/VFX bindings, icons, UI, map, Codex, localisation and accessibility metadata are integrated. |
| Performance | Packaged Godot build meets approved scenario budgets on reference hardware with retained traces and no blocker regression. |
| Quality | Accessibility, representation, player trust, fun and balance reviews pass for milestone scope. |
| Documentation | Active source documents, schemas, registry snapshots, change logs, deferrals and known issues match the candidate build. |
| Expansion Readiness | General optional-expansion admission works; selected Set 26 integration obligations are complete or explicitly deferred by Ash. |
| Human Approval | Ash approves scope, creative direction, major design decisions, accepted risks and release readiness. |

# 49. Authoring and Review Workflow

1. Author changes only in declared source-of-truth files or tools.
2. Run local schema, identity, reference and completeness checks.
3. Normalise and compile through the same pack pipeline used by CI.
4. Run affected suites and reverse-dependency checks.
5. Review generated diffs, repair traces and progression changes.
6. Submit the change with source documents, acceptance criteria and evidence paths.
7. CI runs change-set and integration gates.
8. Human reviewers evaluate semantic, quality, scope and sensitive meaning.
9. Merge only when blocking findings are closed.
10. Nightly/milestone suites extend seed, runtime, migration and performance coverage.
11. Promote production status only with the required evidence.
12. Freeze release candidates and assemble immutable evidence bundles.

## 49.1 Review questions

- Is the validator testing an approved contract rather than inventing one?
- Can the failure be reproduced from retained inputs?
- Did the change fix canonical truth or only generated output?
- Are optional packs and profile variations covered?
- Did a baseline change hide an unintended regression?
- Does the seed repair preserve player choice and world identity?
- Are save, migration, LOD and authority consequences tested?
- Has human review covered meaning automation cannot judge?

# 50. Decisions Locked by 25E and Handoff to Later Documents

## 50.1 Working locks established by this draft

- validation is layered and evidence-backed;
- validators, suites, fixtures, corpora and baselines receive versioned identities;
- exact pack/build/world inputs accompany retained evidence;
- blocker/error/warning/advisory/information severities and protected non-waivable failures apply;
- deterministic world-selection equality and repair tracing are mandatory;
- seed QA uses multiple corpus classes, not one favourite seed;
- required progression is proven through capability graphs and substitutes;
- invalid supported worlds are defects, not an accepted percentage;
- repair is deterministic, bounded and visible;
- explored worlds are not silently rewritten by content updates;
- save/migration/recovery, LOD and transaction conservation are release gates;
- performance uses approved data budgets, representative packaged scenarios and retained baselines;
- accessibility, representation, player trust, fun and balance require human gates;
- Set 26 is tested through general expansion admission without duplicating maritime design;
- release approval requires a frozen evidence bundle and Ash's authority.

## 50.2 Handoff to 25F-25G

Core classification and dependency matrices must declare:

- required validation suites and risk class;
- progression obligations and supported profiles;
- seed/worldgen coverage;
- performance and simulation cost class;
- asset/presentation/accessibility obligations;
- migration and optional-expansion exposure;
- evidence needed for each production status.

## 50.3 Handoff to Documents 25H-25J

Physical registries must provide:

- validator-ready IDs and field ownership;
- block-item-resource-recipe relationship completeness;
- exact inputs/outputs and substitutions;
- conservation and reachability tests;
- asset/state/cost metadata;
- migration and deprecation fixtures.

## 50.4 Handoff to 25K

Asset planning must define budget classes, source/provenance, state coverage, socket/event bindings, LOD, accessibility and automated export checks.

## 50.5 Handoff to 25L

Every Summer Engine task must name:

- source documents and contracts;
- changed files;
- validator/suite IDs;
- acceptance and regression tests;
- evidence output paths;
- rollback notes;
- unresolved debt and gate impact.

## 50.6 Handoff to rewritten Document 18

Document 18 must specify:

- Godot/Summer Engine validation architecture;
- runtime/test modules and project topology;
- command-line/editor integration;
- CI and packaged-build automation;
- seed runner and headless world simulation;
- save/migration fixture framework;
- profiling tools and approved numeric budgets;
- dashboards/diagnostics;
- multiplayer and Set 26 technical test harnesses.

## 50.7 Handoff to Set 26

Set 26 must define system-specific schemas, tolerances, fixtures, scenarios and pass criteria for its selected packages while conforming to the general identities, manifests, evidence and gates of Set 25.

# 51. Risks, Redesign Triggers and Open Decisions

## 51.1 Risks

| Risk | Early Warning | Mitigation |
| --- | --- | --- |
| Validator Theatre | Many green reports but failures cannot be reproduced or tests assert trivial conditions. | Require evidence contracts, mutation/negative fixtures and reviewer ownership. |
| Slow Feedback | Authors bypass checks because suites take too long. | Layer profiles, cache safely, run affected graph locally and full corpora asynchronously. |
| Flaky Tests | Variable timing/physics produces intermittent failures. | Separate deterministic contracts from tolerance-based runtime tests; capture environment and seeds. |
| Golden-Seed Overfitting | Generator is tuned to a few retained worlds. | Maintain broad/adversarial corpora and review baseline changes. |
| Repair Masking | Most seeds pass only because repair rewrites them heavily. | Measure repair rate/cost and trigger content/generator redesign. |
| Progression False Proof | Graph path exists but is practically undiscoverable or circular through hidden conditions. | Include discovery, access, risk and player-facing guidance in proof edges; human playtest paths. |
| Performance Drift | Small content additions cumulatively exceed budgets. | Cost classes, trend baselines, scenario captures and status gates. |
| Save Corpus Decay | Old fixtures no longer load or are discarded. | Versioned retention, migration support matrix and fixture-health suite. |
| Optional-Pack Data Loss | Removed expansion content is deleted or replaced. | Quarantine tests, unknown payload preservation and reinstall verification. |
| Human Review Bottleneck | Sensitive and quality reviews accumulate late. | Schedule review at Specified, Asset Ready and Integrated rather than only release. |
| AI Confidence Error | AI summaries misclassify severity or hide unsupported assumptions. | Raw evidence, schema-grounded outputs and human approval. |
| Set 26 Premature Closure | Set 25 claims expansion readiness before mobile, fluid, save and authority contracts exist. | Integration debt register and final 25L checkpoint. |

## 51.2 Redesign triggers

Redesign rather than patch when:

- deterministic results cannot be reproduced across supported environments;
- required worlds frequently need repair;
- progression relies on increasing exception lists;
- transaction conservation needs per-content special cases;
- LOD promotion cannot reconstruct valid state;
- save migrations repeatedly require destructive fallback;
- performance budgets fail under the smallest identity-complete slice;
- optional pack removal cannot preserve persistent instances;
- validator rules duplicate incompatible source-of-truth fields;
- maritime mobile-container support would require replacing the registry kernel rather than extending it.

## 51.3 Open decisions for later authority

The following are not locked by current sources and require later approval:

- exact reference hardware and platform performance targets;
- final seed-corpus counts and statistical confidence requirements;
- final CI provider and dashboard/artefact retention technology;
- supported save/migration compatibility window;
- public telemetry/crash-reporting policy;
- exact multiplayer scope for Core Production;
- final Set 26 package/build-profile composition;
- specialist accessibility, localisation and representation review process;
- which warnings may block specific milestones by default.

```{=openxml}
<w:p><w:r><w:br w:type="page"/></w:r></w:p>
```

# Appendix A. Validator and Test-Suite Definition Template

## A.1 Validator definition

| Field | Entry |
| --- | --- |
| Validator ID / Version |  |
| Owner / Canonical Document |  |
| Contract Evaluated |  |
| Target Domains / Schemas |  |
| Required Inputs / Interfaces |  |
| Deterministic or Tolerance-Based |  |
| Finding Codes / Default Severity |  |
| Automated Fixes Permitted |  |
| Protected Fields |  |
| Output Schema / Evidence |  |
| Runner Compatibility |  |
| Replacement / Deprecation |  |

## A.2 Suite definition

| Field | Entry |
| --- | --- |
| Suite ID / Version |  |
| Execution Profile |  |
| Build / World Profiles |  |
| Validators and Order |  |
| Fixtures / Seed Corpora |  |
| Platforms / Hardware Classes |  |
| Stop / Continue Rules |  |
| Pass Criteria |  |
| Human Review |  |
| Evidence Retention |  |
| Gates Satisfied |  |

# Appendix B. Validation Evidence and Failure Report Template

| Field | Entry |
| --- | --- |
| Run / Finding ID |  |
| Suite / Validator Version |  |
| Date / Trigger / Owner |  |
| Build Hash / Godot Version |  |
| Pack Lockfile / Snapshot Hash |  |
| Seed / World Profile / Generation Version |  |
| Fixture / Save / Migration Origin |  |
| Platform / Hardware / Network |  |
| Expected Result |  |
| Actual Result |  |
| Severity / Blocking Gate |  |
| Logs / Trace / Map / Screenshot / Save |  |
| Reproduction Steps |  |
| Likely Owner / Source Document |  |
| Player Impact / Data Risk |  |
| Disposition / Waiver / Decision |  |
| Fix Version / Regression Test |  |
| Reviewer / Closure Evidence |  |

# Appendix C. Seed Corpus and Seed-Run Manifest Template

## C.1 Corpus manifest

| Field | Entry |
| --- | --- |
| Corpus ID / Version |  |
| Class | Golden / Broad / Adversarial / Minimal / Maximal / Migration / Long-Running / Multiplayer / Expansion / Defect |
| Owner and Purpose |  |
| Seed Source / Generation Rule |  |
| Build and World Profiles |  |
| Pack Configurations |  |
| Required Suites |  |
| Inclusion / Deprecation Reason |  |
| Retention Policy |  |

## C.2 Seed-run record

| Field | Entry |
| --- | --- |
| Seed / Derived-Seed Contract |  |
| Lockfile / Registry Snapshot |  |
| Generation Version |  |
| World-Manifest Hash |  |
| Selected Definitions |  |
| Repair Trace |  |
| Determinism Result |  |
| Progression Proof |  |
| Connectivity / Density / Diversity |  |
| Performance Measurements |  |
| Warnings / Failures |  |
| Retained Maps / Saves / Logs |  |

# Appendix D. Progression-Reachability Proof Template

| Field | Entry |
| --- | --- |
| Proof ID / Version |  |
| Build / World / Difficulty Profile |  |
| Starting Capabilities |  |
| Required Goals |  |
| Provider Families |  |
| Requirements and Conditions |  |
| Transformation Edges |  |
| Substitution / Fallback Groups |  |
| Trade / Salvage / Knowledge Routes |  |
| Mutual Exclusions |  |
| Selected Example Paths |  |
| Unreachable Nodes / Reasons |  |
| Discovery / Readability Review |  |
| Seed Corpus Coverage |  |
| Pass / Fail / Reviewer |  |

# Appendix E. Performance Baseline and Regression Template

| Field | Entry |
| --- | --- |
| Baseline ID / Version |  |
| Scenario / Input Path |  |
| Build / Content Snapshot |  |
| Hardware / OS / Runtime |  |
| Settings / Resolution / Player Count |  |
| Warm-Up / Capture Duration |  |
| Tool / Trace Version |  |
| Frame / Tail-Hitch Metrics |  |
| CPU / GPU Breakdown |  |
| Memory / Streaming |  |
| Save / Load / Migration |  |
| Network / Join / Reconnect |  |
| Worldgen / Validation Tool Time |  |
| Approved Budgets / Tolerances |  |
| Regression Summary |  |
| Raw Artefacts / Reviewer |  |

# Appendix F. Release-Gate Checklist

## F.1 Candidate identity

- [ ] Milestone scope and build profile approved.
- [ ] Application build hash recorded.
- [ ] Pack lockfile and registry snapshot frozen.
- [ ] Supported platforms, world profiles and save versions declared.
- [ ] Source documents and change log match the candidate.

## F.2 Data and generation

- [ ] Schema, identity, references, relationships and packs pass.
- [ ] Completeness contracts pass.
- [ ] POC leakage scan passes.
- [ ] Golden, broad, adversarial, minimal/maximal and required expansion corpora pass.
- [ ] Progression proofs pass for supported profiles.
- [ ] Repair rate and diagnostics reviewed.

## F.3 Runtime and persistence

- [ ] Required gameplay flows pass in packaged build.
- [ ] Transaction conservation passes.
- [ ] LOD promotion/demotion and catch-up pass.
- [ ] Save/load, migration, recovery and rollback pass.
- [ ] Authority, join/reconnect and compatibility pass for approved multiplayer scope.

## F.4 Quality and release

- [ ] Performance budgets pass on reference hardware.
- [ ] Assets, provenance, localisation and packaging pass.
- [ ] Accessibility, representation and player-trust reviews pass.
- [ ] Fun/balance review completed.
- [ ] Known issues and waivers reviewed.
- [ ] Release evidence bundle archived.
- [ ] Ash approves release readiness.

# Appendix G. Set 26 Expansion-Admission Validation Checklist

- [ ] Set 26 programme and actual pack topology distinguished.
- [ ] Namespace, schema and interface ownership registered.
- [ ] Base profile works without optional maritime packs.
- [ ] Required/optional cross-pack references resolve correctly.
- [ ] Add-to-world path preserves explored content.
- [ ] Removal quarantines vessel, cargo, crew, port/fleet and maritime-state payload safely where applicable.
- [ ] Reactivation restores persistent identity.
- [ ] Local/world spatial-frame references pass movement, save/load, LOD and authority tests.
- [ ] System-specific fluid, ocean, weather, vessel, crew, trade, combat, ecology and site suites are supplied by 26B-26O.
- [ ] Worldgen/progression tests include maritime capabilities only when admitted by the build profile.
- [ ] Performance scenarios cover selected maritime worst cases.
- [ ] Migration from supported Set 26 versions passes.
- [ ] Main-document and Forge amendment dependencies recorded.
- [ ] Final 25L closure status recorded.

# Appendix H. POC Leakage Scan Checklist

- [ ] Archived IDs blocked from production selection.
- [ ] Fixed names and localisation keys scanned.
- [ ] Fixed coordinates and placement anchors removed.
- [ ] Fixed day/timing/raid branches removed from production logic.
- [ ] POC quest/event participants excluded.
- [ ] POC asset paths isolated or relinked as approved generic families.
- [ ] Archive/test packs excluded from shipping lockfile.
- [ ] Regression fixtures remain reproducible and non-player-facing.
- [ ] Documentation labels POC examples as historical.
- [ ] No fallback selects archived POC content.

# Appendix I. Document 25E Acceptance Criteria

| Acceptance Area | Pass Condition |
| --- | --- |
| Validation Architecture | Defines layered validators, suite identity, evidence, severity, profiles and gate behaviour. |
| Data Integrity | Covers schema, identity, relationships, capabilities, completeness, packs and POC isolation. |
| Seed QA | Defines deterministic inputs, corpus classes, staged validation, repair, diversity, survival and coherence checks. |
| Progression | Defines capability-graph proofs, supported profiles, substitutes, fallback and controlled failure. |
| Runtime | Covers saves, migration, recovery, LOD, transactions, authority and multiplayer-compatible identity. |
| Performance | Defines budget categories, representative scenarios, baselines, regression and profiling without inventing final hardware numbers. |
| Quality | Includes assets, localisation, provenance, accessibility, representation, player trust, fun and balance gates. |
| Expansion | Uses Set 26 as a general admission case while preserving maritime ownership. |
| Release | Defines evidence bundles, non-waivable blockers, Definition of Done and Ash's final authority. |
| Handoff Readiness | Provides actionable obligations to 25F-25L, rewritten Document 18 and Set 26. |

> **Document 25E Completion Statement**  
> Leyforge now has a defined evidence architecture for deciding whether authored data, generated worlds, progression, runtime systems, optional expansions and packaged builds are trustworthy. The next step is to apply these contracts during **25F - Core Production Atlas Classification and Scope Lock**, where the project selects the deliberately bounded content packages that must satisfy them.
