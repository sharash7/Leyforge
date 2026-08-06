# Fantasy Voxel Civilisation Sandbox
## 23J - Presentation Forge
### Asset Libraries, Registries, Production Pipeline, Testing and Migration
**Version 0.1 - Detailed Design Bible and Production Operations Draft**

*A production-facing framework for building, governing, testing, migrating and releasing Leyforge's shared audio, voxel VFX and presentation libraries, covering stable registries, naming catalogues, provenance, licensing, family inheritance, content packs, golden assets, review roles, accessibility evidence, performance gates, migration from temporary content and the Forest Hamlet foundation library.*

*Working production design document - library governance, asset intake, registry ownership, validation, review, release readiness, migration rollout and long-term content scaling*

# Presentation Forge Production Statement

| Field | Locked Direction |
|---|---|
| Document Scope | Defines the production-facing asset libraries, registries, naming catalogues, lifecycle states, intake rules, provenance, licensing, review roles, quality gates, testing suites, packaging checks, migration procedures and release acceptance requirements for Documents 23A through 23I. |
| Core Philosophy | Build one traceable presentation library rather than disconnected folders of effects and sounds. Every approved asset must have stable identity, known ownership, reproducible source, legal provenance, validated dependencies, declared budgets, accessibility evidence and a controlled migration path. |
| Library Direction | Use layered libraries: a small Golden Core for tool and regression testing, a Forest Hamlet Foundation Library for the first complete game-facing scenario, and expandable culture, biome, dimension and feature packs for later production. |
| Registry Direction | Registries are authoritative catalogues of definitions and relationships, not merely file lists. Stable IDs, schema versions, family inheritance, lifecycle state, owner pack, aliases, replacement rules and runtime products are recorded explicitly. |
| Naming Direction | Use controlled namespaces and semantic names based on gameplay meaning, material, action, intensity and variant. File names may support discoverability but never replace stable IDs. |
| Production Direction | Work moves through brief, intake, authoring, technical validation, specialist review, accessibility review, scenario testing, approval, bake, package verification and release-ready states. No asset bypasses the shared lifecycle because it appears simple. |
| Provenance Direction | Original recordings, imported libraries, generated audio, AI-assisted content, voxel forms, reference assets and third-party dependencies all retain source, creator, licence, transformation history and approval evidence. Unresolved rights block release. |
| Quality Direction | Validation is layered: schema and dependency checks, style and readability review, audio quality review, accessibility evidence, runtime correctness, performance budgets, multiplayer/replay behaviour and packaged-build verification. |
| Migration Direction | Temporary POC assets, hard-coded callbacks, scene-path references, one-off particles and unmanaged audio are inventoried, classified, wrapped or replaced in controlled waves. Migration preserves gameplay behaviour first, then improves presentation quality. |
| Accessibility Direction | Critical information requires approved equivalent feedback and test evidence before release-ready status. Accessibility assets are part of the same profile and library, not an optional post-production patch. |
| Performance Direction | Every release-ready asset declares a budget profile, LOD or quality chain, aggregation or virtualisation behaviour where relevant, and stress-test evidence. Critical cues survive decorative budget pressure. |
| Content Pack Direction | Base libraries, project packs, culture packs, biome packs, dimension packs and optional mod packs use the same manifest, override, compatibility and migration rules. Protected contracts and critical behaviour cannot be silently removed. |
| Testing Direction | Use golden assets, deterministic captures, reference renders, reference audio, Test Laboratory scenarios, regression matrices, packaged-build smoke tests and hardware-tier stress scenes. |
| MVP Direction | Ship the Golden Core and Forest Hamlet Foundation Library needed to prove mining, footsteps, building, furnace and mana-furnace cycles, village ambience, rain and shelter, ward defence, goblin raid telegraphs, accessibility alternatives and dense-scene budget behaviour. |
| Deferred Scope | Full dialogue and voice production, adaptive music libraries, cinematic editorial, platform certification loudness targets, public marketplace policy and final game-wide content counts remain future production modules. |

# Document Purpose

Documents 23A through 23I define what the Presentation Forge is, how spatial attachments work, how events and context resolve, how voxel VFX and Sound Events are authored, how acoustics and mixing behave, how creators use the unified interface, and how Godot executes the resulting products. This final document defines how a real production team turns those systems into a dependable library over months and years of development.

The project will eventually contain thousands of presentation definitions and many more source files, variants, mappings and generated products. Without a production model, even strong authoring tools can become a maze of duplicated assets, unclear ownership, broken references, unlicensed sources and effects that behave differently in editor previews than in packaged builds. The Presentation Forge therefore needs production governance from its first useful library.

This document establishes the catalogue structure, naming rules, lifecycle, source intake, review roles, testing evidence, migration process and release gates required to keep the library trustworthy. It also defines the initial Golden Core and Forest Hamlet Foundation Library so implementation can begin with bounded, representative content instead of attempting the final game catalogue immediately.

This is not a final content bible for every creature, biome, spell or machine. Those systems decide which experiences exist. Presentation Forge production translates approved gameplay content into reusable audio, VFX, light, surface, spatial and accessibility assets while preserving gameplay authority and the fixed three-dimensional voxel style.

# Design Sources

| Source Document | Relevant Direction | How 23J Uses It |
|---|---|---|
| 18 - Technical Implementation Plan | Stable IDs, registries, content packs, authoritative state, migrations, version control, testing, CI, diagnostics and packaged-build gates. | Reuses the wider project engineering and governance rules for presentation content production. |
| 23A - Shared Foundation | Presentation Profiles, contracts, context, Material DNA, source/runtime separation, accessibility, budgets and document-set boundaries. | Defines the production objects, shared terminology and release principles governed here. |
| 23B - Spatial Attachment | Anchors, sockets, regions, paths, Surface Masks, zones, portals, remapping, fallbacks and migrations. | Defines spatial catalogue governance, required anchor sets and migration evidence. |
| 23C - Events and Integration | Event Contracts, Context Packets, bindings, parameters, channels, composition, replay and multiplayer rules. | Defines event-contract catalogues, binding libraries, compatibility tests and deprecation policy. |
| 23D - VFX Forge Core | Voxel VFX families, effects, forms, palettes, persistent surfaces, source records, lifecycle and validation. | Defines VFX library families, counts, style gates, golden assets and production review. |
| 23E - Voxel Particle Graph | Graph nodes, compiled plans, emitters, trails, volumes, lights, surfaces, budgets and deterministic behaviour. | Defines graph-template libraries, compiler regression assets and cost evidence. |
| 23F - Sound Forge Core | Sound sources, layers, Sound Events, families, variation, loops, provenance, captions and runtime products. | Defines audio intake, source library, Sound Event catalogue, source audit and listening review. |
| 23G - Spatial Audio and Mixing | Material response, acoustic zones, sound portals, ambience, buses, snapshots, concurrency and virtualisation. | Defines material matrices, ambience packs, acoustic profile libraries and mix regression scenes. |
| 23H - Unified UI/UX | Dashboards, guided workflows, Test Laboratory, evidence capture, review, collaboration, accessibility and diagnostics. | Defines production queues, role layouts, evidence retention and review responsibilities. |
| 23I - Technical Implementation | Canonical source, runtime products, registries, import/bake, CI, hot reload, diagnostics, packaging and staged implementation. | Defines the enforceable technical pipeline and runtime verification used by this production plan. |

# Static Table of Contents

1. Locked Production Identity
2. Approved Production Direction Summary
3. Production Goals, Principles and Non-Goals
4. Library Layers and Scaling Model
5. Production Organisation, Ownership and Roles
6. Asset Classes and Canonical Taxonomy
7. Stable IDs, Namespaces and Naming Catalogue
8. Registry Architecture and Source of Truth
9. Registry Fields, Relationships and Indexing
10. Family Inheritance, Templates and Generated Variants
11. Content Lifecycle and Status Model
12. Work Intake, Briefs and Production Queues
13. Source Provenance, Rights and Licensing
14. AI-Assisted and Generated Content Governance
15. Canonical Source File and Media Standards
16. VFX Library Strategy
17. Golden VFX Core Library
18. Forest Hamlet VFX Foundation Library
19. Audio Library Strategy
20. Golden Audio Core Library
21. Forest Hamlet Audio Foundation Library
22. Presentation Profile and Binding Libraries
23. Material Response and Material DNA Libraries
24. Spatial Anchor, Socket and Surface Mask Catalogues
25. Acoustic Zone, Sound Portal and Ambience Libraries
26. Accessibility Equivalence Library
27. Budget, Quality, LOD and Virtualisation Profiles
28. Culture, Biome, Dimension and Faction Variant Packs
29. Content Pack, Override and Compatibility Governance
30. Production Batches, Milestones and Backlog Planning
31. Authoring, Review and Approval Workflow
32. Review Roles and Evidence Requirements
33. Validation Codes, Severity and Blocking Policy
34. Automated Test Strategy
35. Golden Assets and Regression Baselines
36. Test Laboratory Scenario Suite
37. VFX Style, Readability and Visual QA
38. Audio Quality, Mix and Playback QA
39. Accessibility QA and Critical-Cue Verification
40. Performance, Stress and Hardware-Tier Testing
41. Multiplayer, Split-Screen, Save and Replay Regression
42. Packaging, Runtime Product and Release Verification
43. Migration Inventory and Classification
44. Migration From POC and Temporary Presentation
45. Spatial, Event, Schema and Registry Migration
46. Deprecation, Aliases, Replacements and Removal
47. Rollout, Training and Change Management
48. Continuous Integration and Release Gates
49. Defect Handling, Rollback and Emergency Repair
50. Forest Hamlet MVP Production Scope
51. Post-MVP Expansion Roadmap
52. Definition of Done and Acceptance Matrix
53. Relationships With Future Presentation Modules

- Appendix A. Registry and Manifest Templates
- Appendix B. Naming and Namespace Catalogue
- Appendix C. Initial Foundation Library Targets
- Appendix D. Validation Code Register
- Appendix E. Golden Asset and Regression Suite
- Appendix F. Production Workflow Checklists
- Appendix G. Migration Checklists
- Appendix H. Release Acceptance Matrix
- Appendix I. Content Pack Manifest Example
- Appendix J. Open Questions for Production Planning

# 1. Locked Production Identity

The Presentation Forge production system is the governance and delivery layer that turns creative source into a coherent, legal, testable and releasable library. It is where a voxel spark, footstep family, furnace loop, ward warning, acoustic zone, material response, caption, accessibility variant and runtime profile become managed production assets rather than isolated experiments.

**Locked Rule:** An asset is not production-ready merely because it looks or sounds good in one preview. It becomes production-ready only when its source is traceable, identity is stable, dependencies resolve, behaviour is bounded, accessibility is addressed, required scenarios pass, runtime products rebuild and migration or replacement rules are known.

## 1.1 Production Promise

A team member should be able to answer the following questions for any approved presentation result:

- What stable asset or profile ID produced it?
- Which source files, recordings, voxel forms, graphs and licences support it?
- Who owns the asset and who approved it?
- Which event contracts, materials, anchors and contexts can invoke it?
- Which quality, LOD, accessibility and platform variants exist?
- Which Test Laboratory scenarios and packaged builds verify it?
- Which content pack supplies it and what may override it?
- What replaces it if it is deprecated?
- Can the runtime product be rebuilt from canonical source?

If those answers are unavailable, the asset remains draft or blocked regardless of its visual or audio quality.

## 1.2 Production Identity Layers

| Layer | Responsibility | Example |
|---|---|---|
| Source Library | Original media, editable voxel forms, graphs, masks, palettes and authoring data. | Recorded hammer hit, editable smoke graph, rune Surface Mask. |
| Definition Registry | Stable semantic definitions and relationships. | `vfx.effect.machine.furnace.smoke_basic`. |
| Family Library | Shared behaviour, inheritance and fallback. | Stone debris family, footstep family, machine-loop family. |
| Presentation Library | Profiles and bindings that combine sound, VFX, light, surface and accessibility. | Heavy iron-pick impact on stone. |
| Generated Product Library | Baked Godot Resources, imported audio products, meshes and lookup tables. | Runtime Sound Event bundle and compiled VFX plan. |
| Evidence Library | Captures, screenshots, reference renders, listening notes and automated results. | Ward-breach reduced-flash comparison. |
| Migration Library | Aliases, replacements, version transforms and compatibility reports. | POC `smoke_01` mapped to stable furnace smoke family. |

## 1.3 What Production Governance Is Not

- It is not a requirement that every experiment receive full release metadata before creators can explore.
- It is not permission to keep production assets in private folders outside version control.
- It is not a substitute for artistic judgement or specialist review.
- It is not a reason to duplicate one asset for every block, creature or machine.
- It is not a file naming convention pretending to be a registry.
- It is not a guarantee that all third-party or generated content is legally usable.
- It is not a process where AI output approves itself.
- It is not a release gate based only on editor previews.

# 2. Approved Production Direction Summary

| Area | Approved Direction |
|---|---|
| Library shape | Golden Core -> Forest Hamlet Foundation -> Alpha packs -> production-scale libraries. |
| Canonical identity | Stable namespace IDs with human-readable display names and independent file paths. |
| Source control | Canonical source and metadata are version-controlled; large binary media use the approved large-file workflow. |
| Generated products | Replaceable, reproducible and published atomically; never the only editable copy. |
| Registry ownership | One shared registry architecture with specialist catalogues for profiles, VFX, audio, spatial data, materials, acoustics, budgets and evidence. |
| Inheritance | Families and templates carry common behaviour; variants override only intentional differences. |
| Lifecycle | Proposed -> Briefed -> In Production -> Technical Review -> Specialist Review -> Scenario Review -> Approved -> Release Ready -> Shipped -> Deprecated/Archived. |
| Provenance | Rights and transformation history are mandatory for release-ready sources. |
| AI governance | AI assistance is declared, source inputs are legal, outputs remain reviewable and human approval is mandatory. |
| Naming | Semantic names based on role and meaning; no temporary names survive release without migration aliases. |
| Accessibility | Critical cues require documented equivalents and evidence before approval. |
| Performance | Every runtime asset declares a budget and fallback chain; dense-scene evidence is required. |
| Reviews | Technical, artistic/audio, accessibility and scenario reviews are distinct gates even when one person holds several roles. |
| Testing | Automated validation plus human visual/listening review plus packaged-build scenarios. |
| Migration | Inventory first, wrap or replace in waves, preserve gameplay events, use aliases, retain rollback. |
| Content packs | Explicit manifests, dependency ranges, override policy, protected behaviour and compatibility reports. |
| Release | Release-ready status requires clean validation, evidence, successful bake and packaged runtime verification. |

# 3. Production Goals, Principles and Non-Goals

## 3.1 Primary Goals

1. Establish a small but representative presentation library that proves the complete pipeline.
2. Prevent duplicate, untraceable and incompatible asset growth.
3. Make every important effect and sound reusable across blocks, items, creatures, machines, villages and dimensions.
4. Preserve the fixed 3D cube voxel style across all VFX production.
5. Preserve tactile, readable and coherent audio identity across all Sound Events.
6. Support rapid iteration without weakening provenance, validation or migration.
7. Make accessibility and performance visible during production rather than at the end.
8. Allow culture, biome, faction and dimension variants without forking the entire base library.
9. Provide regression evidence so engine, schema and content changes can be trusted.
10. Migrate temporary POC content without interrupting gameplay implementation.

## 3.2 Production Principles

- **Reuse before duplication:** search families, templates and profiles before creating a new asset.
- **Meaning before file:** stable semantic identity describes purpose, not storage location.
- **Small golden set first:** tool confidence grows from carefully chosen representative assets.
- **Evidence follows state:** each lifecycle gate records the evidence that justified it.
- **Source remains recoverable:** destructive edits produce a new source revision or preserve originals.
- **Families own consistency:** shared defaults live in families, not copied into every child.
- **Overrides remain narrow:** variants document why they differ from the parent.
- **Critical cues are protected:** readability and accessibility override decorative density.
- **Packaged builds are truth:** editor success is necessary but not sufficient.
- **Migration is planned work:** replacing temporary assets is tracked, tested and reversible.

## 3.3 Non-Goals

- Completing final-game audio and VFX content in this document set.
- Locking final loudness, codec or platform certification values before target hardware is confirmed.
- Requiring bespoke recordings or effects where a reusable family is sufficient.
- Creating public marketplace policy.
- Defining final dialogue, voice or music pipelines.
- Replacing gameplay content registries with presentation catalogues.
- Treating every generated variation as a separately reviewed source asset when it is bounded by an approved grammar.

# 4. Library Layers and Scaling Model

The Presentation Forge should not jump directly from prototypes to thousands of assets. Production uses four library layers with different purposes and review expectations.

## 4.1 Golden Core

The Golden Core is a deliberately small set of exemplary assets used to prove tools, schemas, importers, runtime services and regression tests. Each asset should exercise several important features and have unusually complete documentation.

Golden assets are not placeholders. They are production-quality reference implementations that later content should imitate.

## 4.2 Forest Hamlet Foundation Library

The Foundation Library supports one complete, connected gameplay area and its stress cases. It includes enough material, weather, machine, magic, creature, village and accessibility content to test the real production workflow without pretending to cover the whole game.

## 4.3 Alpha Feature Packs

After the Foundation Library is stable, content expands through bounded packs such as:

- additional overworld biome presentation;
- expanded combat and equipment;
- creature family packs;
- automation tier packs;
- magic-school packs;
- culture and faction packs;
- dungeon and boss packs;
- dimension packs.

Each pack declares dependencies and acceptance scenarios rather than inheriting release status from the base library.

## 4.4 Production-Scale Library

The final library may contain thousands of definitions, but the management model remains the same. Registry indexes, search metadata, ownership, family inheritance, evidence retention and migrations become more important as scale increases.

## 4.5 Planning Count Rule

Counts in this document are planning targets, not hard gameplay requirements. A smaller coherent library is better than a larger duplicated one. Generated material combinations do not need individual hand-authored assets when an approved family and response grammar can resolve them safely.

# 5. Production Organisation, Ownership and Roles

## 5.1 Core Roles

| Role | Primary Responsibility |
|---|---|
| Presentation Lead | Owns overall visual/audio identity, priority, library boundaries and final creative arbitration. |
| VFX Artist/Technical Artist | Authors voxel forms, graphs, palettes, trails, surfaces, variants and visual evidence. |
| Sound Designer | Records/imports sources, builds layers, Sound Events, variation, loops and listening evidence. |
| Technical Audio/VFX Developer | Maintains import, bake, runtime services, graph execution, audio routing and diagnostics. |
| Integration Designer | Owns Presentation Profiles, bindings, Event Contracts and cross-system scenarios. |
| Spatial Author | Maintains anchors, sockets, masks, paths, zones, portals and remapping. |
| Accessibility Reviewer | Verifies equivalent cues, captions, reduced-motion/flash behaviour and settings interaction. |
| QA/Scenario Tester | Maintains Test Laboratory scenarios, packaged tests, regression evidence and defect reproduction. |
| Library Curator | Maintains names, tags, duplicates, ownership, lifecycle, packs and deprecation records. |
| Producer | Plans batches, resolves blockers, tracks review capacity and release gates. |

A small team may combine roles, but the responsibilities remain separate in checklists. The same person may author and technically review an asset only when another reviewer covers creative or release approval.

## 5.2 Ownership Fields

Every production asset declares:

- primary owner;
- backup owner or team;
- owner content pack;
- review roles required;
- current assignee;
- target milestone;
- maintenance risk;
- replacement or deprecation owner.

## 5.3 Ownership Transfer

Ownership transfers require updated registry metadata, unresolved review notes and known dependencies. Assets must not become orphaned when a contributor leaves or a feature moves teams.

# 6. Asset Classes and Canonical Taxonomy

The library uses explicit asset classes so tools, reviews and migrations know what is being managed.

| Asset Class | Purpose |
|---|---|
| Presentation Profile | Combines sound, VFX, light, surface, camera/haptic references and accessibility equivalents for a semantic event. |
| Presentation Binding | Maps an Event Contract or state condition to a profile and spatial reference. |
| Event Contract | Declares legal event payload and ownership. |
| Context Schema | Defines reusable context fields and compatibility. |
| VFX Effect | Runtime-ready visual effect definition. |
| VFX Family | Shared defaults, grammar and fallback for related effects. |
| VFX Graph Template | Reusable bounded graph structure. |
| Voxel Form/Sequence | Editable cube, cuboid, shard or cluster geometry. |
| Surface Presentation Layer | Persistent wetness, soot, frost, scorch, corruption and similar state. |
| Sound Source | Original or derived audio media with provenance. |
| Sound Event | Runtime audio definition with layers, variation, lifecycle and routing. |
| Audio Family | Shared event construction, material response, concurrency and spatial defaults. |
| Material Profile | Visual and audio response defaults for a material family. |
| Spatial Definition | Anchor, socket, region, path, mask, zone or portal. |
| Acoustic Profile | Zone, portal, reverb, transmission or ambience behaviour. |
| Mix Asset | Bus intent, snapshot, ducking profile or dynamic-range profile. |
| Budget Profile | Cost limits and fallback chain. |
| Accessibility Profile | Equivalent feedback and comfort variants. |
| Test Scenario | Deterministic setup, actions, expected traces and evidence. |
| Evidence Record | Capture, reference render, listening note, performance result or approval record. |
| Migration Record | Alias, replacement, transform, version rule or compatibility report. |
| Content Pack Manifest | Declares pack identity, dependencies, provided assets and override policy. |

# 7. Stable IDs, Namespaces and Naming Catalogue

## 7.1 Stable ID Structure

Recommended structure:

```text
<domain>.<class>.<family>.<semantic_role>[.<material>][.<intensity>][.<variant>]
```

Examples:

```text
vfx.effect.contact.mining.stone.medium
vfx.family.debris.wood
sound.event.machine.furnace.work_loop
sound.family.footstep.boot
presentation.profile.combat.block.shield_wood
spatial.socket.creature.breath_origin
surface.mask.machine.chimney_opening
acoustic.profile.room.workshop_stone_small
budget.profile.vfx.combat_critical
access.profile.warning.ward_breach
```

## 7.2 Naming Rules

- Use lowercase ASCII and underscores within tokens.
- Use periods to separate semantic hierarchy.
- Name by purpose, not by creator or file location.
- Avoid version numbers inside stable IDs; versions are separate fields.
- Avoid visual colour names when the gameplay meaning is more stable.
- Avoid `final`, `new`, `copy`, `temp`, `test2` and similar production names.
- Variants state the meaningful difference: culture, material, intensity, damage, corruption or realm.
- Generated children may include deterministic suffixes internally but remain grouped under the parent family.

## 7.3 Display Names and Localisation

Stable IDs are never player-facing. Display names, captions and tool descriptions use localisation keys. Internal names may remain technical and precise.

## 7.4 Aliases

Aliases support migration from temporary IDs and renamed semantics. They are versioned, logged when resolved and removed only after dependent content is migrated and the supported compatibility window ends.

# 8. Registry Architecture and Source of Truth

## 8.1 Registry Layers

```text
Master Presentation Registry
  -> Contract and Context Registry
  -> Spatial Registry
  -> Material Registry
  -> VFX Registry
  -> Audio Registry
  -> Profile and Binding Registry
  -> Acoustic and Mix Registry
  -> Budget and Accessibility Registry
  -> Test and Evidence Registry
  -> Migration and Alias Registry
  -> Content Pack Registry
```

Each specialist registry can be edited and validated separately but participates in one dependency graph and one build manifest.

## 8.2 Source of Truth Rules

- Canonical source metadata is authoritative for asset identity and relationships.
- Original media is authoritative for raw source content.
- Editable graphs and voxel forms are authoritative for creative construction.
- Generated Godot resources are authoritative only for a specific bake output, not for future editing.
- Runtime state is authoritative only for current playback and world evidence, not for library definitions.
- Review comments and evidence records do not silently change asset definitions.

## 8.3 Registry Indexes

Required indexes include:

- stable ID;
- asset class;
- family and parent;
- owner pack;
- lifecycle state;
- review blocker;
- event contract consumer;
- material tags;
- spatial dependency;
- accessibility importance;
- budget profile;
- source rights state;
- replacement/deprecation state;
- target milestone;
- test scenario coverage.

## 8.4 Registry Health Metrics

The dashboard should report:

- orphan definitions;
- missing source files;
- duplicated semantic roles;
- unresolved aliases;
- assets without owners;
- release-ready assets without evidence;
- critical cues without accessibility alternatives;
- families without fallback chains;
- assets exceeding budgets;
- content packs with incompatible dependencies;
- assets unused by any profile or test scenario.

# 9. Registry Fields, Relationships and Indexing

## 9.1 Universal Fields

Every registry definition includes:

```text
stable_id
schema_version
display_name_key
description_key
asset_class
owner_pack
primary_owner
parent_id
family_id
tags[]
lifecycle_state
production_status
source_records[]
dependencies[]
consumers[]
budget_profile_id
accessibility_importance
validation_summary
review_summary
bake_signature
runtime_product_ids[]
created_revision
modified_revision
deprecated_by
aliases[]
```

## 9.2 Relationship Types

- inherits from;
- contains;
- references;
- consumes event;
- requires spatial definition;
- resolves material;
- supplies accessibility alternative;
- overrides;
- replaces;
- tested by;
- packaged by;
- generated from;
- licensed through.

Relationships are typed so dependency graphs and migration tools can explain why one asset blocks another.

## 9.3 Required Versus Optional Dependencies

Required dependencies block approval or bake when absent. Optional dependencies must declare fallback behaviour. An optional decorative child effect may be removed by quality settings; a critical ward warning cannot silently disappear.

# 10. Family Inheritance, Templates and Generated Variants

## 10.1 Family Purpose

Families keep timing, identity, budget, routing and accessibility behaviour consistent. They reduce duplicated authoring and make global changes predictable.

## 10.2 Inheritance Rule

A child stores only differences from the parent wherever practical. The Forge UI must show inherited values, local overrides and the reason for each protected override.

## 10.3 Template Versus Family

- A **family** defines semantic behaviour and fallback.
- A **template** provides a starting authoring structure.
- A **grammar** generates bounded variations from approved parameters.
- A **preset** stores convenient parameter values.

Templates may be copied; family relationships remain live until deliberately detached.

## 10.4 Generated Variant Governance

Generated variants inherit approval only when:

- the grammar is approved;
- input ranges are bounded;
- source materials are approved;
- output style and loudness remain within validation limits;
- seeds and parameters are reproducible;
- generated outputs do not create new licence or provenance uncertainty.

A grammar update triggers regression tests for representative seeds rather than manual review of every possible result.

# 11. Content Lifecycle and Status Model

## 11.1 Lifecycle States

| State | Meaning |
|---|---|
| Proposed | Idea exists but no approved brief or production slot. |
| Briefed | Scope, purpose, dependencies and acceptance tests are defined. |
| In Production | Source is actively being authored. |
| Technical Review | Schemas, dependencies, loops, graphs, spatial references and budgets are checked. |
| Specialist Review | VFX, sound, spatial, mix or accessibility specialist reviews craft quality. |
| Scenario Review | Asset is tested in required Test Laboratory and game scenarios. |
| Approved | Creative and technical intent is accepted; further release checks may remain. |
| Release Ready | All required evidence, packaged tests, rights and migration checks pass. |
| Shipped | Included in an approved release or milestone package. |
| Deprecated | Supported for compatibility but no longer preferred. |
| Archived | Removed from active builds and retained only for history or migration. |
| Blocked | Work cannot advance because of rights, dependencies, defect or design uncertainty. |

## 11.2 State Transition Rules

State transitions are command-based, permissioned and recorded. Bulk transitions require the same validations as individual assets. A lifecycle state cannot be set by renaming a folder.

## 11.3 Reopening Approved Assets

Changes to approved assets create a new revision and return affected gates to pending. The system should identify which evidence remains valid and which tests must rerun.

# 12. Work Intake, Briefs and Production Queues

## 12.1 Intake Sources

Work may originate from:

- a new gameplay feature;
- a missing material response;
- a creature or machine content pack;
- a bug or readability failure;
- accessibility review;
- performance reduction work;
- migration of temporary content;
- culture or dimension variation;
- a Test Laboratory gap;
- an engine or schema upgrade.

## 12.2 Presentation Brief

Every brief should answer:

- What gameplay fact or state is being communicated?
- Who or what owns the event?
- Which contexts and materials matter?
- Which spatial references are required?
- Is the cue decorative, informative, important or critical?
- Which audio, VFX, light, surface and accessibility components are expected?
- Which family or template should be reused?
- Which budgets and scenarios apply?
- Which source or recording work is needed?
- Which variant packs are in scope?

## 12.3 Queue Types

- New assets.
- Review queue.
- Rights/provenance blockers.
- Migration queue.
- Validation repair queue.
- Accessibility queue.
- Performance optimisation queue.
- Packaged-build failures.
- Deprecation and cleanup.

## 12.4 Definition Before Assignment

A task should not enter active production without a semantic ID reservation, owner pack, brief, required reviewers and acceptance scenarios. Exploratory sandbox work may remain outside the production queue until promoted.

# 13. Source Provenance, Rights and Licensing

## 13.1 Source Record Requirements

Each source record stores:

```text
source_id
source_type
original_filename
creator_or_provider
capture_or_generation_date
licence_id
licence_text_location
allowed_uses
territory_or_platform_limits
attribution_required
source_url_or_invoice_reference
transformation_history
AI_assistance_state
consent_or_release_reference
rights_review_state
approved_by
```

## 13.2 Rights States

- Clear for project use.
- Clear with attribution.
- Clear with platform or distribution restrictions.
- Evaluation only.
- Unknown or incomplete.
- Rejected.

Only clear states may enter release-ready products. Evaluation content must be visibly watermarked in dashboards and excluded from release packaging.

## 13.3 Recording Sessions

Original recording sessions should retain session sheets, microphone and environment notes, performers or object sources, consent where applicable, raw takes and edit lineage. The project does not need to store irrelevant personal data.

## 13.4 Third-Party Libraries

Third-party libraries are imported through a controlled source package. Individual derived assets reference the package licence rather than duplicating legal text, while still recording the exact source file and transformation.

# 14. AI-Assisted and Generated Content Governance

## 14.1 Allowed Assistance

Summer Engine or other approved tools may help:

- propose names and tags;
- identify duplicate assets;
- suggest loop points;
- classify source materials;
- generate first-pass graph parameters;
- propose accessibility alternatives;
- generate regression tests or migration drafts;
- create synthetic support layers when provenance is clear;
- analyse loudness, clipping, density or budget risk.

## 14.2 Mandatory Records

AI-assisted assets record:

- tool and model/service identifier where available;
- date and operator;
- source inputs or reference categories;
- licence or usage basis;
- generated versus edited portions;
- human reviewer;
- known restrictions or uncertainty.

## 14.3 Prohibited Shortcuts

- AI output may not invent rights metadata.
- AI output may not approve itself.
- Unclear training or commercial-use terms block release.
- Generated content may not imitate protected characters, brands or identifiable performers without permission.
- AI cannot change Event Contracts or gameplay truth merely to fit generated presentation.

## 14.4 Reproducibility

Where practical, retain prompts, seeds, settings and post-processing history. If a service cannot reproduce output exactly, the resulting file remains canonical source and receives a normal source hash.

# 15. Canonical Source File and Media Standards

## 15.1 General Rules

- Preserve original-quality source before destructive edits.
- Use lossless or editing-appropriate formats for canonical audio.
- Store authored voxel forms and graphs in text-friendly or deterministic source formats.
- Use consistent colour space and import settings for VFX support textures.
- Do not embed final runtime compression into the only source copy.
- Source files carry stable source IDs through metadata or adjacent manifests.

## 15.2 Audio Source Standards

Canonical audio should use an approved lossless format, consistent sample rate policy, sensible channel layout and no untracked normalisation. Exact runtime codec and bitrate values remain platform and implementation decisions.

## 15.3 VFX Source Standards

Voxel forms retain editable cells, palette roles, pivots and scale. Graph source retains node IDs, comments, parameter ranges, family links and schema version. Preview renders are evidence, not the source asset.

## 15.4 Folder Boundaries

Recommended high-level source structure:

```text
presentation_source/
  profiles/
  bindings/
  contracts/
  spatial/
  materials/
  vfx/
    families/
    graphs/
    forms/
    palettes/
    surfaces/
  audio/
    sources/
    events/
    families/
    ambience/
    mix/
  acoustics/
  accessibility/
  budgets/
  tests/
  evidence/
  migrations/
  packs/
```

Folder layout supports humans, but registries remain authoritative.

# 16. VFX Library Strategy

## 16.1 Library Construction Order

1. Contact and debris families.
2. Fire, smoke, steam and heat.
3. Weather and fluids.
4. Machines and automation.
5. Mana, runes and wards.
6. Creature movement and combat telegraphs.
7. Construction and damage.
8. Persistent surface states.
9. Ambient biome and village effects.
10. Culture, dimension and boss variants.

## 16.2 Reuse Targets

A material debris family should serve mining, block breaking, combat impacts, construction damage and creature collisions. A smoke grammar should serve torches, campfires, furnaces, village chimneys and damaged machines through bounded variants.

## 16.3 VFX Review Dimensions

- genuine 3D voxel construction;
- silhouette and motion readability;
- palette and material identity;
- spatial alignment;
- event timing;
- transparency and overdraw;
- reduced-motion and reduced-flash behaviour;
- LOD family continuity;
- critical cue protection;
- dense-scene cost.

# 17. Golden VFX Core Library

The Golden VFX Core should remain small enough for exhaustive regression testing while covering the full system.

## 17.1 Golden VFX Targets

| Group | Target | Purpose |
|---|---:|---|
| Contact effects | 6 | Dirt footstep, stone mining, wood impact, metal spark, water splash, heavy landing. |
| Machine lifecycle | 4 | Furnace smoke loop, ignition burst, blocked warning, damage sparks. |
| Magic infrastructure | 4 | Mana pulse, rune activation, ward idle boundary, ward breach. |
| Weather/volume | 3 | Rain cells, roof contact, cave dust volume. |
| Persistent surfaces | 4 | Wetness, soot, scorch and corruption. |
| Critical telegraphs | 2 | Goblin captain attack arc and lethal-area boundary. |
| Graph templates | 6 | Burst, loop, path pulse, segmented trail, volume and surface write. |
| Total representative definitions | 29 | Some effects share forms and families. |

## 17.2 Golden Asset Standard

Golden assets require:

- complete source and provenance;
- annotated graph or timeline;
- clear family and profile relationships;
- all quality levels;
- accessibility variants where relevant;
- reference renders from several angles and distances;
- cost trace and packaged-build capture;
- migration fixture for at least one prior schema revision.

# 18. Forest Hamlet VFX Foundation Library

## 18.1 Planning Targets

| Category | Target Definitions |
|---|---:|
| Footstep, landing and movement contact | 12 |
| Mining, tool and block contact | 18 |
| Material debris families | 14 |
| Placement, construction and repair | 10 |
| Fire, smoke, ember, steam and heat | 14 |
| Rain, water, mud, wind and weather | 14 |
| Furnace, mana furnace and automation | 16 |
| Mana, rune, spell and ward | 18 |
| Goblin, cave creature and wisp | 16 |
| Village ambience and celebration/alarm | 8 |
| Persistent surface layers | 12 |
| Critical telegraphs and warnings | 8 |
| Shared graph templates and grammars | 18 |
| Total planning target | 178 |

Definitions include reusable families, templates and persistent layers; not every row is a unique bespoke visual asset. Generated material variations remain children of approved families.

## 18.2 Foundation Coverage

The Foundation Library must support:

- crude and iron tools striking dirt, stone, wood, ore and mana crystal;
- block placement, breaking and repair;
- campfire, torch, furnace and mana-furnace states;
- chute item flow and basic mechanical movement;
- mana conduit pulses and ward boundary behaviour;
- forest ambience, cave motes, river contact and heavy rain;
- goblin raid telegraphs, impacts and damage states;
- spider/crawler movement and wisp interaction;
- watchtower construction, completion, damage and repair;
- wetness, soot, scorch, mud and corruption evidence.

# 19. Audio Library Strategy

## 19.1 Library Construction Order

1. Core material contacts and footsteps.
2. Player movement and interaction.
3. Tool, block and construction audio.
4. Combat contacts and equipment.
5. Machine lifecycle and automation.
6. Magic infrastructure and spell events.
7. Creature and NPC activity.
8. Biome, weather and structure ambience.
9. Mix snapshots, critical cues and accessibility support.
10. Culture, dimension and boss variants.

## 19.2 Source Versus Event Counts

A Sound Event may use several source clips, and one source clip may support several events through non-destructive processing. Production should track source counts and event counts separately.

## 19.3 Coherence Targets

Audio families should share transient character, body weight, tails, variation range, routing and loudness intent. New events should not sound as though they belong to a different game merely because they came from a different source library.

# 20. Golden Audio Core Library

## 20.1 Golden Audio Targets

| Group | Sound Events | Purpose |
|---|---:|---|
| Footsteps/material contact | 8 | Dirt, stone, wood and water at two movement intensities. |
| Mining/block interaction | 6 | Stone, ore, wood, placement, break and repair. |
| Machine lifecycle | 8 | Fuel, ignite, work loop, blocked, damage, output, shutdown and warning. |
| Magic infrastructure | 6 | Mana pickup, conduit loop, rune activation, ward idle, warning and breach. |
| Creature/raid | 6 | Goblin alert, telegraph, attack, hurt, horn and critical warning. |
| Environment | 6 | Forest day/night, cave, river, open rain and roof rain. |
| UI/accessibility | 4 | Confirm, error, critical warning and directional cue. |
| Total Golden Sound Events | 44 | Built from an expected 100-160 approved source clips and support layers. |

## 20.2 Golden Listening Evidence

Each golden event requires:

- isolated preview;
- rapid repetition test;
- in-context game capture;
- quiet and loud playback check;
- headphones and speakers check;
- loop transition evidence where relevant;
- caption and accessibility evidence for important cues;
- dense-scene mix evidence;
- packaged-build playback verification.

# 21. Forest Hamlet Audio Foundation Library

## 21.1 Planning Targets

| Category | Target Sound Events |
|---|---:|
| Footsteps and body movement | 28 |
| Blocks, mining, placement and breaking | 34 |
| Tools, crafting and construction | 24 |
| Player movement, needs and interaction | 18 |
| Combat, shields, projectiles and gear | 28 |
| Goblins and raid communication | 24 |
| Cave creatures and wisp | 20 |
| Furnace, mana furnace and automation | 30 |
| Magic, runes, ward and spell basics | 28 |
| Village jobs, doors, bells and crowd beds | 22 |
| Forest, cave, river, weather and fire ambience | 30 |
| UI and critical accessibility cues | 14 |
| Total planning target | 300 |

This target counts runtime Sound Events, many of which share families and source layers. The expected canonical source pool may be several times larger because variation, round robins, loops and layered construction require multiple clips.

## 21.2 Initial Source Pool Planning

A practical Foundation source target is approximately 700-1,100 approved clips and procedural support layers, including raw variations. The exact count is not a quality goal. Coverage, variation and legal provenance matter more.

# 22. Presentation Profile and Binding Libraries

## 22.1 Profile Library Strategy

Profiles should represent reusable semantic outcomes such as:

- light mining impact;
- heavy mining impact;
- block placement;
- shield block;
- furnace active;
- machine blocked;
- mana conduit active;
- ward breach;
- goblin attack telegraph;
- heavy rain on exposed structure;
- construction stage complete.

A profile can combine audio, VFX, surface, light and accessibility components while preserving independent specialist assets.

## 22.2 Foundation Profile Targets

| Profile Group | Target |
|---|---:|
| Material contact and movement | 28 |
| Block/tool/construction | 24 |
| Combat and creature threats | 24 |
| Machines and automation | 18 |
| Magic and wards | 20 |
| Weather and ambience transitions | 12 |
| Village and structure states | 14 |
| UI/critical equivalents | 10 |
| Total | 150 |

## 22.3 Binding Catalogue

Bindings should be generated or templated where possible, but every binding remains inspectable. The catalogue records contract version, condition, profile, spatial reference, parameter mapping, channel, priority and fallback.

# 23. Material Response and Material DNA Libraries

## 23.1 Foundation Material Families

The first shared material catalogue should include:

- dirt/soil;
- mud;
- sand/gravel;
- grass/foliage;
- timber;
- leaves/fibre;
- stone;
- deepstone;
- clay/brick;
- glass;
- water;
- ice;
- copper;
- iron;
- steel;
- bone;
- leather/cloth;
- flesh;
- chitin;
- mana crystal;
- rune stone;
- corruption;
- void placeholder family;
- generic magical energy.

## 23.2 Material DNA Requirements

Each material profile may define:

- density, hardness and resonance;
- approved debris form and palette;
- footsteps and movement family;
- mining, impact, placement and break family;
- spark, dust, chip or splash probability;
- heat, wetness, frost and corruption response;
- acoustic absorption/transmission hints;
- default surface layers;
- quality and budget fallbacks.

## 23.3 Response Matrix Coverage

The initial matrix should prioritise common source-target-action combinations rather than attempt every theoretical pair. Missing combinations resolve through family fallbacks and are reported for future coverage.

# 24. Spatial Anchor, Socket and Surface Mask Catalogues

## 24.1 Required Anchor Templates

Standard templates should exist for:

- humanoid entity;
- quadruped;
- winged creature;
- serpentine creature;
- handheld tool;
- sword/weapon;
- bow/projectile weapon;
- furnace/machine;
- storage block;
- conduit/path block;
- door/window/portal;
- village structure;
- boss arena.

## 24.2 Naming Catalogue

Common spatial roles include:

```text
socket.audio.origin
socket.audio.mouth
socket.audio.feet
socket.vfx.breath_origin
socket.vfx.chimney
socket.vfx.spark_contact
socket.magic.core
path.weapon.trail
path.mana.flow
region.damage.body
surface.mask.rune_glow
surface.mask.vent_opening
zone.acoustic.interior
portal.acoustic.door
```

## 24.3 Coverage and Fallback Evidence

Release-ready entities and machines must show required anchor resolution at base, variant, damage and LOD states. Missing optional anchors may fall back; missing protected anchors block approval.

# 25. Acoustic Zone, Sound Portal and Ambience Libraries

## 25.1 Acoustic Profile Families

Initial profiles should include:

- open field;
- forest light/dense;
- small timber room;
- small stone room;
- stone hall;
- workshop mixed material;
- shallow cave;
- deep cave;
- mine tunnel;
- water edge;
- sheltered porch;
- portal chamber;
- warded magical room;
- corrupted space.

## 25.2 Sound Portal Families

- open doorway;
- closed wooden door;
- heavy stone door;
- window opening;
- tunnel transition;
- vent/chimney;
- water boundary;
- magical portal.

## 25.3 Ambience Components

Ambience should be assembled from reusable components: bed, intermittent detail, ecology, weather, civilisation activity, magic tone and threat layer. Biome or structure packs combine components rather than importing one uneditable stereo loop for every location.

# 26. Accessibility Equivalence Library

## 26.1 Shared Equivalence Assets

The library should include reusable:

- directional indicators;
- critical warning shapes;
- reduced-motion profiles;
- reduced-flash profiles;
- colour-independent material/pattern variants;
- caption styles and semantic phrase keys;
- controller-response references;
- audio substitutes for visual warnings;
- visual substitutes for audio warnings.

## 26.2 Importance Classes

| Class | Requirement |
|---|---|
| Decorative | May be reduced or removed with no gameplay loss. |
| Informative | Should retain at least one clear channel where practical. |
| Important | Requires tested fallback in reduced settings. |
| Critical | Requires approved equivalent feedback and protected budget priority. |

## 26.3 Evidence Rule

Accessibility completion is demonstrated through scenario evidence, not merely the presence of fields. Tests must show that reduced settings still communicate timing, direction and consequence.

# 27. Budget, Quality, LOD and Virtualisation Profiles

## 27.1 Shared Profile Library

Initial budget profiles should cover:

- tiny ambient VFX;
- standard contact VFX;
- important combat VFX;
- critical warning VFX;
- machine loop VFX;
- weather volume;
- persistent surface write;
- ordinary one-shot audio;
- machine managed loop;
- creature voice;
- ambience component;
- critical warning audio;
- dense village aggregate;
- split-screen constrained mode.

## 27.2 Quality Chain Requirement

Every scalable asset declares:

```text
Full -> Reduced -> Minimal -> Critical Cue Only -> Hidden/Virtualised
```

Not every asset uses every stage. Critical cues may never reach Hidden while gameplay-relevant.

## 27.3 Virtualisation Evidence

Managed loops and long-lived effects require tests showing that phase, state and ownership survive virtualisation and resume without false start cues.

# 28. Culture, Biome, Dimension and Faction Variant Packs

## 28.1 Variant Philosophy

Variants should alter identity without duplicating base logic. A dwarven furnace may replace metallic layers, rhythm, palette and sparks while inheriting lifecycle states, budgets and critical warnings.

## 28.2 Pack Types

- culture audio/VFX pack;
- biome ambience and weather pack;
- faction communication pack;
- creature-family pack;
- magic-school pack;
- automation-tier pack;
- dimension presentation pack;
- accessibility language/locale support pack;
- optional cosmetic pack.

## 28.3 Variant Review

Variants require comparison against the parent for readability, timing, loudness, style, accessibility and cost. A visually impressive variant cannot remove essential state communication.

# 29. Content Pack, Override and Compatibility Governance

## 29.1 Pack Manifest Requirements

Each pack declares:

- stable pack ID and version;
- project/game compatibility range;
- required pack dependencies;
- assets provided;
- assets overridden;
- protected behaviours preserved;
- migration scripts or rules;
- licence summary;
- known conflicts;
- load order intent;
- test scenarios required.

## 29.2 Override Rules

- Overrides are explicit and traceable.
- Protected Event Contracts cannot be redefined by ordinary content packs.
- Critical accessibility components cannot be removed without an approved equivalent.
- Base IDs remain stable; replacement content declares provenance.
- Circular overrides block loading.
- Conflicts produce a compatibility report rather than silent last-write wins.

## 29.3 Mod Boundaries

Future user content may add definitions through approved schemas, but unrestricted scripts, arbitrary DSP code and unbounded graph nodes remain outside the safe content-pack boundary.

# 30. Production Batches, Milestones and Backlog Planning

## 30.1 Batch Size

Production should use small thematic batches that can reach scenario review together. Example batches:

- stone/wood/dirt contact batch;
- furnace lifecycle batch;
- rain and shelter batch;
- ward defence batch;
- goblin raid batch;
- village construction batch.

## 30.2 Batch Exit Criteria

A batch exits when:

- all briefs have stable IDs and owners;
- required source rights are clear;
- shared families and templates are approved;
- assets pass specialist and technical review;
- profiles and bindings are integrated;
- required scenarios pass;
- release blockers are resolved or explicitly deferred;
- migration records exist for replaced temporary content.

## 30.3 Backlog Tags

Recommended tags:

- foundation;
- critical cue;
- migration blocker;
- tool regression;
- accessibility;
- performance;
- content pack;
- culture/biome/dimension;
- polish;
- deferred final-game.

# 31. Authoring, Review and Approval Workflow

## 31.1 Standard Workflow

```text
Brief and ID Reservation
  -> Source Intake and Rights Check
  -> Family/Template Selection
  -> Authoring
  -> Local Validation
  -> Technical Review
  -> Specialist Craft Review
  -> Profile/Binding Integration
  -> Accessibility Review
  -> Test Laboratory Scenario Review
  -> Packaged-Build Verification
  -> Approval
  -> Release Ready
```

## 31.2 Fast Path

A fast path may exist for low-risk variations generated from approved families. It still requires automated validation, representative scenario review and registry publication. It does not bypass rights or critical-cue requirements.

## 31.3 Repair Path

Validation failures should create actionable repair tasks linked to assets and dependencies. Repairing a parent family reruns affected child tests.

# 32. Review Roles and Evidence Requirements

## 32.1 Technical Review

Checks schemas, dependencies, graph bounds, loops, spatial references, lifecycle ownership, registry state, budgets and bake output.

## 32.2 VFX Review

Checks fixed voxel style, silhouette, motion, colour-independent readability, timing, spatial alignment, LOD and overdraw.

## 32.3 Audio Review

Checks source cleanliness, layering, variation, loop quality, loudness consistency, routing, spatial intent, mix interaction and repeat fatigue.

## 32.4 Integration Review

Checks event meaning, context mapping, profile composition, state channels, cancellation, prediction and fallback behaviour.

## 32.5 Accessibility Review

Checks critical cue equivalents, captions, direction, reduced settings, flash/motion comfort and settings combinations.

## 32.6 Evidence Retention

Evidence records should include tool version, asset revision, scenario revision, quality settings, platform/build ID and reviewer notes. Old evidence remains attached to the revision it tested.

# 33. Validation Codes, Severity and Blocking Policy

## 33.1 Severity Classes

| Severity | Meaning |
|---|---|
| Info | Recommendation or trace note; does not block state. |
| Warning | Quality or maintainability risk; approval may proceed with recorded decision. |
| Error | Asset cannot become Approved until resolved. |
| Blocker | Asset cannot bake or enter release packaging. |
| Critical Release Blocker | Pack or build cannot ship because gameplay-critical presentation or rights are unsafe. |

## 33.2 Code Families

- `REG` registry and identity;
- `SRC` source and provenance;
- `LIC` rights and licensing;
- `SPT` spatial mapping;
- `EVT` event and binding;
- `VFX` visual effect;
- `SND` sound event;
- `ACU` acoustics and mix;
- `ACC` accessibility;
- `BUD` budget and performance;
- `TST` scenario and regression;
- `MIG` migration;
- `PAK` content pack and packaging.

## 33.3 Blocking Policy

Blockers must be deterministic and explain repair steps. Human reviewers may waive warnings with justification, but errors and blockers require explicit exception authority and expiry; silent waivers are prohibited.

# 34. Automated Test Strategy

## 34.1 Test Pyramid

1. Schema and field validation.
2. Dependency and registry tests.
3. Graph and Sound Event compile tests.
4. Deterministic resolver tests.
5. Spatial fallback and remap tests.
6. Runtime service unit/integration tests.
7. Scenario trace tests.
8. Performance budget tests.
9. Packaged-build smoke tests.
10. Human visual/listening/accessibility review.

## 34.2 Deterministic Fixtures

Tests use fixed Event Contracts, context packets, seeds, spatial fixtures and expected resolver outputs. Decorative randomness may vary within bounded checks; semantic selection and critical timing should remain reproducible.

## 34.3 Changed-Asset Test Selection

The dependency graph identifies affected tests. A change to the stone debris family should rerun mining, impact, block-break, quality and budget scenarios that consume it.

# 35. Golden Assets and Regression Baselines

## 35.1 Golden Asset Purpose

Golden assets are stable references for import, bake, runtime, UI, accessibility and migration tests. They represent difficult or representative cases, not only attractive showcase content.

## 35.2 Baseline Types

- source hash and metadata baseline;
- compiled graph structure baseline;
- resolver output baseline;
- reference frame sequence or screenshot;
- waveform/loop boundary analysis;
- loudness and peak envelope range;
- runtime trace;
- cost range;
- accessibility comparison;
- packaged-build capture.

## 35.3 Visual Diff Policy

Pixel-perfect image comparison may be too strict across render backends. Use masks, tolerance ranges, semantic counters and human review for changes outside expected bounds.

## 35.4 Audio Diff Policy

Exact waveform equality is not always required when importers or platform codecs differ. Tests should compare duration, channel layout, loop continuity, peak/loudness ranges, event structure and perceptual spot review.

# 36. Test Laboratory Scenario Suite

## 36.1 Foundation Scenarios

| Scenario | Main Coverage |
|---|---|
| Stone Mining Bench | Material response, runtime contact, debris, impact audio, repetition and dust budget. |
| Block Placement and Break | Placement/break families, surface normals, old/new material transitions. |
| Furnace Lifecycle | Start, loop, blocked, damage, output, shutdown, phase continuity and warning priority. |
| Mana Conduit and Ward | Paths, boundaries, state parameters, breach, accessibility and critical cues. |
| Heavy Rain and Shelter | Weather volume, roof contacts, sound portals, wetness and indoor/outdoor transition. |
| Village Workday | NPC job audio, construction VFX, ambience aggregation and mix. |
| Goblin Raid | Creature voices, telegraphs, impacts, alarms, critical readability and dense combat. |
| Cave Exploration | Acoustic zones, creature movement, mana hints, low visibility and direction cues. |
| Split-Screen Stress | Multiple listeners, independent accessibility settings and shared budgets. |
| Save/Load Reconstruction | Managed loops, wetness, damage surfaces, ward state and no false one-shots. |
| Hot Reload | Atomic replacement, active loop migration and rollback. |
| Content Pack Override | Parent/child compatibility, protected cues and conflict report. |

## 36.2 Scenario Evidence

Each scenario stores expected contracts, state transitions, selected profiles, budget decisions, captions, active voices/effects and human acceptance notes.

# 37. VFX Style, Readability and Visual QA

## 37.1 Required Views

VFX review should include:

- close orthographic or inspection view;
- normal gameplay distance;
- first-person and third-person views where relevant;
- dark and bright backgrounds;
- several camera angles;
- full, reduced and minimal quality;
- reduced motion and reduced flash;
- dense-scene overlap;
- post-processing disabled.

## 37.2 Style Blockers

- billboard or smooth-ribbon visible body;
- effect unreadable without excessive bloom;
- geometry no longer clearly three-dimensional;
- critical timing lost at lower quality;
- transparent overdraw beyond profile limit;
- incorrect scale relative to voxel world;
- effect origin visibly detached from anchor or runtime contact.

## 37.3 Palette Review

Palette roles should communicate material and gameplay meaning while remaining distinguishable under colour-vision modes and common environmental lighting.

# 38. Audio Quality, Mix and Playback QA

## 38.1 Listening Conditions

At minimum review through:

- neutral headphones;
- ordinary consumer speakers;
- low-volume playback;
- loud but safe playback;
- mono compatibility where relevant;
- dynamic-range presets;
- busy mix and isolated event;
- indoor, outdoor and cave acoustic contexts.

## 38.2 Audio Blockers

- clipping or corrupt source;
- audible loop click in managed loop;
- unresolved rights;
- unbounded repetition or voice count;
- critical cue masked in required scenario;
- caption missing for required event;
- event route bypasses approved bus policy;
- inconsistent loudness that breaks family identity;
- false start/stop cue after virtualisation or save reconstruction.

## 38.3 Repetition Tests

Footsteps, mining, tools, creature calls and machine contacts should be tested at realistic and abusive repetition rates. Repeat avoidance and variation should reduce fatigue without losing identity.

# 39. Accessibility QA and Critical-Cue Verification

## 39.1 Required Settings Matrix

Critical scenarios should run under:

- default;
- reduced motion;
- reduced flash;
- colour-independent mode;
- reduced particles;
- reduced audio or muted categories;
- captions and directional indicators;
- combined reduced settings.

## 39.2 Critical Cue Questions

- Can the player identify the threat or state?
- Can the player identify approximate direction or affected area?
- Is timing clear enough to respond?
- Is the alternative distinct from ordinary decorative feedback?
- Does budget pressure preserve the cue?
- Does split-screen preserve each local player's settings?

## 39.3 Evidence State

A checkbox saying “accessible” is insufficient. Release-ready critical profiles require linked scenario captures or test records.

# 40. Performance, Stress and Hardware-Tier Testing

## 40.1 Stress Scenes

- hundreds of operating furnaces and chutes;
- busy village market in heavy rain;
- goblin raid with fires and ward effects;
- multiple spellcasters and creature telegraphs;
- large cave with many sound portals and ambience components;
- split-screen players in different dense locations;
- rapid mining and block destruction;
- persistent surface accumulation and cleanup.

## 40.2 Measured Areas

- active voxel cells and draw batches;
- transparency/overdraw;
- graph update time;
- light requests;
- surface writes;
- active and virtual audio voices;
- streaming memory;
- acoustic zone updates;
- event traffic and resolver time;
- frame-time spikes during spawn or migration;
- save/load reconstruction cost.

## 40.3 Hardware Tiers

Targets should include minimum, recommended and high-quality profiles once hardware goals are confirmed. Test evidence records engine build, platform, resolution, listener count and quality profile.

## 40.4 Pass Rule

An asset may exceed its standalone nominal cost only when a higher-level budget profile guarantees bounded admission and an approved fallback. Unbounded worst-case behaviour blocks release.

# 41. Multiplayer, Split-Screen, Save and Replay Regression

## 41.1 Multiplayer Tests

- predicted event then authoritative confirmation;
- rejected prediction cleanup;
- duplicate suppression;
- late join during machine and ward loops;
- content-pack mismatch reporting;
- stable seed and semantic selection where required;
- local quality and accessibility differences.

## 41.2 Split-Screen Tests

- listener priority and budget sharing;
- local captions and direction indicators;
- one player indoors and one outdoors;
- one player near raid combat and one near machines;
- no duplicate global ambience explosion;
- bounded voice and VFX counts.

## 41.3 Save/Load Tests

Save reconstruction restores durable world evidence and managed states without replaying one-shot ignition, impact or breach events that did not just occur.

## 41.4 Replay Tests

Captured traces should resolve the same semantic profiles and critical timings after compatible schema or engine upgrades. Visual/audio details may differ only where a migration explicitly changes them.

# 42. Packaging, Runtime Product and Release Verification

## 42.1 Package Checks

- all referenced runtime products exist;
- no evaluation-only or unresolved-rights sources are included;
- editor-only files are excluded from runtime package;
- content pack manifests resolve;
- registry bundles load in deterministic order;
- aliases and migrations required by supported saves are included;
- audio import formats are supported on target platform;
- shaders and voxel materials compile;
- captions/localisation keys resolve;
- packaged build passes smoke scenarios.

## 42.2 Rebuild Test

A clean environment should rebuild runtime products from canonical source using the pinned toolchain. Differences outside approved non-deterministic ranges block release investigation.

## 42.3 Runtime Audit

Development builds expose asset ID, owner pack, profile, source revision, budget decision and fallback reason for selected instances.

# 43. Migration Inventory and Classification

Before replacing temporary presentation, create an inventory of:

- hard-coded particle spawns;
- scene-path audio references;
- direct AudioStreamPlayer nodes;
- temporary smooth/billboard particles;
- placeholder recordings;
- duplicated material impacts;
- gameplay scripts that choose presentation directly;
- unnamed sockets and transforms;
- POC-specific structure emitters;
- temporary captions and UI warnings;
- saved state containing old presentation IDs.

## 43.1 Migration Classes

| Class | Treatment |
|---|---|
| Wrap | Keep source temporarily but route through stable profile and registry. |
| Convert | Transform source into approved Forge definition. |
| Replace | Author new production asset and retain alias/fallback. |
| Remove | Delete unused or harmful content after dependency proof. |
| Defer | Isolate behind explicit temporary status and deadline. |
| Preserve | Keep because it already satisfies standards; add missing metadata/evidence. |

## 43.2 Risk Priority

Highest priority goes to gameplay-critical warnings, frequently repeated sounds, core machine loops, save-referenced IDs, networked events and POC content that violates the fixed voxel style.

# 44. Migration From POC and Temporary Presentation

## 44.1 Migration Principles

- Preserve gameplay behaviour and event timing first.
- Introduce stable IDs and profiles before artistic replacement where necessary.
- Avoid a “big bang” replacement of all presentation.
- Keep temporary wrappers visibly marked.
- Use aliases and side-by-side A/B scenarios.
- Retain rollback until packaged builds and saves pass.

## 44.2 Recommended Waves

### Wave 1 - Inventory and Containment

Catalogue all temporary content, block new direct wiring and create wrapper profiles.

### Wave 2 - Core Contracts and Spatial References

Replace raw callbacks and transforms with Event Contracts, Context Packets and stable anchors.

### Wave 3 - Golden Core Replacement

Migrate mining, furnace, mana, ward, rain and goblin critical content to production families.

### Wave 4 - Foundation Library Expansion

Replace remaining Forest Hamlet ambience, creatures, village work and construction content.

### Wave 5 - Cleanup and Removal

Remove obsolete assets, aliases beyond support window and dead scene wiring after dependency proof.

# 45. Spatial, Event, Schema and Registry Migration

## 45.1 Spatial Migration

Changes to anchors, masks, paths or zones require:

- old-to-new mapping;
- variant and LOD coverage;
- fallback behaviour;
- affected binding list;
- preview comparison;
- runtime save impact where persistent surfaces use the reference.

## 45.2 Event Migration

Event Contract versions may add optional fields compatibly. Renaming, changing meaning or removing fields requires a version migration and consumer report.

## 45.3 Schema Migration

Migrations are deterministic, versioned, testable and reversible where possible. Source migrations create backups or version-control commits before destructive transformation.

## 45.4 Registry Migration

Registry tools detect duplicate IDs, conflicting aliases, owner-pack changes and replacement cycles. A migration report lists transformed, skipped, blocked and manually reviewed assets.

# 46. Deprecation, Aliases, Replacements and Removal

## 46.1 Deprecation Record

A deprecated asset declares:

- replacement ID;
- reason;
- first deprecated version;
- final supported version;
- affected packs and saves;
- behavioural differences;
- migration owner;
- removal criteria.

## 46.2 Alias Policy

Aliases are compatibility tools, not permanent naming clutter. New content should use preferred IDs immediately. Alias resolution is logged in development builds.

## 46.3 Removal Gate

An asset may be archived or removed only when:

- no supported content directly depends on it;
- save migration covers persistent references;
- content-pack compatibility policy permits removal;
- replacement scenarios pass;
- rollback package or version-control history exists.

# 47. Rollout, Training and Change Management

## 47.1 Role Layouts

The first shipped Forge layouts should support:

- VFX author;
- sound author;
- integration designer;
- spatial author;
- reviewer/QA;
- library curator.

Each layout exposes guided tasks, required validation and context-appropriate help.

## 47.2 Training Sequence

1. Shared Presentation Forge concepts and authority boundary.
2. Stable IDs, families and registries.
3. Spatial anchors and Event Contracts.
4. VFX or audio specialist authoring.
5. Profiles, bindings and accessibility.
6. Test Laboratory and evidence.
7. migration and content-pack rules.
8. release and packaged-build checks.

## 47.3 Adoption Rule

Once a feature area migrates to Presentation Forge, new direct-wired audio/VFX in that area is prohibited except approved emergency debugging. Tool friction should be repaired rather than bypassed permanently.

# 48. Continuous Integration and Release Gates

## 48.1 CI Stages

1. Source and licence metadata validation.
2. Schema and registry validation.
3. Dependency graph build.
4. Import and bake.
5. Unit and resolver tests.
6. graph/audio compile tests.
7. scenario trace tests.
8. accessibility and critical-cue checks.
9. budget and stress checks.
10. clean packaged-build smoke test.
11. artifact and compatibility report publication.

## 48.2 Release Gate Classes

- Asset gate.
- Batch gate.
- Content pack gate.
- Milestone library gate.
- Packaged build gate.
- Save compatibility gate.

## 48.3 Gate Evidence

CI stores machine-readable reports and links to human review evidence. A green automated build does not replace specialist listening or visual review where required.

# 49. Defect Handling, Rollback and Emergency Repair

## 49.1 Defect Classes

- broken reference;
- rights/provenance issue;
- critical cue missing;
- visual style violation;
- audio corruption or loop defect;
- performance regression;
- multiplayer duplication;
- save/replay reconstruction defect;
- content-pack compatibility defect;
- migration data loss.

## 49.2 Emergency Disable

Release builds may disable a defective optional asset through registry hotfix or content-pack patch while preserving a safe fallback. Critical cues require replacement rather than simple removal.

## 49.3 Rollback

Bakes and pack publications are atomic. The previous known-good registry bundle and runtime products remain available for rollback. Source history remains in version control.

## 49.4 Post-Incident Review

Severe defects create a short review describing cause, missed gate, affected assets, repair and prevention. Relevant validators or tests are added so the same class does not recur.

# 50. Forest Hamlet MVP Production Scope

## 50.1 Required Library Components

The MVP requires:

- Golden Core registries and examples;
- Foundation material profiles;
- mining, placement, break and footstep families;
- furnace and mana-furnace lifecycle presentation;
- chute and storage contacts;
- mana conduit and ward profiles;
- goblin raid voices, telegraphs and alarms;
- spider/crawler/wisp baseline presentation;
- forest, cave, river, rain and shelter ambience;
- watchtower construction, damage and repair;
- accessibility equivalents for critical warnings;
- core budget, quality and virtualisation profiles;
- Test Laboratory scenarios and evidence;
- migration wrappers for remaining temporary POC content.

## 50.2 MVP Production Success

The MVP is successful when a clean build can reconstruct the complete Foundation Library from canonical source, migrate the selected POC content, load the Forest Hamlet scenarios, remain within budgets, preserve critical cues under reduced settings and produce traceable evidence for every release-ready asset.

## 50.3 Explicit MVP Deferrals

- complete final-game material matrix;
- every creature and weapon family;
- full dimension packs;
- dialogue and voice pipeline;
- adaptive music;
- cinematic presentation;
- public mod publishing;
- final platform mastering and certification.

# 51. Post-MVP Expansion Roadmap

## 51.1 Phase 1 - Foundation Hardening

Resolve production friction, expand validators, improve golden tests and complete POC cleanup.

## 51.2 Phase 2 - Overworld Alpha Packs

Add major biomes, weather, common creatures, equipment, village tiers and early automation.

## 51.3 Phase 3 - Magic and Faction Packs

Expand magic schools, culture identity, faction warnings, rituals, corruption and settlement variation.

## 51.4 Phase 4 - Dungeon and Boss Packs

Add dungeon acoustics, boss telegraphs, arena boundaries, phase transitions and large-effect budget profiles.

## 51.5 Phase 5 - Dimension Packs

Add realm-specific materials, ambience, acoustic behaviour, portals, hazards and civilisation presentation.

## 51.6 Phase 6 - Future Presentation Modules

Attach dialogue, voice, music, cinematics and richer haptics through the shared profile, contract, bus, budget and accessibility architecture.

# 52. Definition of Done and Acceptance Matrix

## 52.1 Asset Definition of Done

An asset is release-ready when:

- stable ID, class, family, owner and pack are valid;
- canonical source and provenance are complete;
- rights permit release;
- dependencies and spatial references resolve;
- authoring source rebuilds the runtime product;
- technical and specialist reviews pass;
- required accessibility equivalents exist;
- budget and fallback behaviour pass;
- required scenarios and packaged tests pass;
- migration/replacement fields are complete where relevant;
- evidence is attached to the tested revision.

## 52.2 Library Definition of Done

A milestone library is release-ready when:

- required catalogues reach coverage targets or approved exceptions;
- no blockers or critical release blockers remain;
- registry health checks pass;
- content packs and overrides are compatible;
- clean rebuild and package verification pass;
- save, replay, multiplayer and split-screen regressions pass where applicable;
- rights and attribution reports are complete;
- rollback artifacts exist;
- known limitations are documented.

## 52.3 Completion Rule

**Document 23J is fulfilled not when the project owns many sounds and effects, but when the presentation library can grow without losing identity, legality, performance, accessibility, compatibility or the ability to rebuild and explain every shipped result.**

# 53. Relationships With Future Presentation Modules

Future dialogue, voice, music, cinematics and expanded haptics should use the same production rules:

- stable IDs and registries;
- source provenance and rights;
- content lifecycle and review evidence;
- Presentation Profiles and Event Contracts;
- spatial references and buses;
- accessibility equivalents;
- budgets and quality variants;
- content pack manifests;
- migration and deprecation policy;
- packaged-build verification.

Those modules may add specialist standards, but they should not create parallel identity, licensing, test or migration systems.

# Appendix A. Registry and Manifest Templates

## A.1 Universal Production Definition

```text
ProductionDefinition
{
    stable_id
    schema_version
    asset_class
    display_name_key
    description_key

    owner_pack_id
    primary_owner
    target_milestone
    lifecycle_state

    parent_id
    family_id
    tags[]

    source_records[]
    dependency_ids[]
    consumer_ids[]

    budget_profile_id
    accessibility_importance
    accessibility_profile_ids[]

    validation_results[]
    review_records[]
    evidence_ids[]

    bake_signature
    runtime_product_ids[]

    aliases[]
    deprecated_by
    removal_version
}
```

## A.2 Source Record

```text
SourceRecord
{
    source_id
    source_type
    original_filename
    creator_or_provider
    source_package_id
    capture_or_generation_date
    licence_id
    allowed_uses
    attribution_required
    transformation_history[]
    AI_assistance_state
    rights_review_state
    source_hash
}
```

## A.3 Review Record

```text
ReviewRecord
{
    review_id
    asset_id
    asset_revision
    review_type
    reviewer
    date
    result
    findings[]
    evidence_ids[]
    exception_id
}
```

## A.4 Migration Record

```text
MigrationRecord
{
    migration_id
    from_id_or_schema
    to_id_or_schema
    migration_type
    affected_assets[]
    transform_version
    fallback_policy
    save_impact
    content_pack_impact
    test_ids[]
    rollback_reference
    status
}
```

# Appendix B. Naming and Namespace Catalogue

| Domain | Example Prefix | Notes |
|---|---|---|
| Presentation profiles | `presentation.profile` | Semantic combined feedback. |
| Bindings | `presentation.binding` | Contract/state to profile mapping. |
| Event contracts | `event` or `presentation.contract` | Owner-defined versioned event identity. |
| VFX effects | `vfx.effect` | Runtime-ready effect definitions. |
| VFX families | `vfx.family` | Shared visual behaviour. |
| VFX graphs | `vfx.graph` | Editable or template graph source. |
| Voxel forms | `vfx.form` | Cube/cuboid/cluster geometry. |
| Surface layers | `surface.layer` | Persistent surface presentation. |
| Sound events | `sound.event` | Runtime audio events. |
| Audio families | `sound.family` | Shared audio behaviour. |
| Sound sources | `sound.source` | Canonical media identity. |
| Materials | `material.presentation` | Material DNA and response. |
| Spatial anchors | `spatial.anchor` / `spatial.socket` | Stable placement roles. |
| Masks | `surface.mask` | Named texel/face eligibility masks. |
| Paths | `spatial.path` | Ordered presentation routes. |
| Acoustic zones | `acoustic.zone` | Room/space behaviour. |
| Sound portals | `acoustic.portal` | Openings and transmission. |
| Mix snapshots | `audio.snapshot` | Runtime mix state. |
| Budgets | `budget.profile` | Cost and fallback chain. |
| Accessibility | `access.profile` | Equivalent feedback. |
| Test scenarios | `test.presentation` | Deterministic regression scenario. |
| Content packs | `pack.presentation` | Package identity. |
| Migrations | `migration.presentation` | Version and replacement transforms. |

# Appendix C. Initial Foundation Library Targets

## C.1 Golden Core Summary

| Library | Target |
|---|---:|
| Golden VFX definitions/templates | 29 |
| Golden Sound Events | 44 |
| Golden Presentation Profiles | 24 |
| Golden material profiles | 8 |
| Golden spatial templates | 6 |
| Golden acoustic profiles | 6 |
| Golden accessibility profiles | 6 |
| Golden budget profiles | 8 |
| Golden Test Laboratory scenarios | 8 |

## C.2 Forest Hamlet Foundation Summary

| Library | Planning Target |
|---|---:|
| VFX definitions, families, surfaces and templates | 178 |
| Sound Events | 300 |
| Approved audio source clips/support layers | 700-1,100 |
| Presentation Profiles | 150 |
| Foundation material profiles | 24 |
| Spatial templates and required-role catalogues | 12+ templates |
| Acoustic/reverb/portal profiles | 22 |
| Ambience components | 36 |
| Accessibility profiles/equivalents | 24 |
| Budget/quality/virtualisation profiles | 16 |
| Regression and stress scenarios | 20 |

These targets should be reviewed after the Golden Core reveals actual reuse and authoring cost.

# Appendix D. Validation Code Register

| Code | Severity | Meaning |
|---|---|---|
| REG-001 | Error | Stable ID is missing, malformed or duplicated. |
| REG-002 | Error | Owner pack or primary owner is missing. |
| REG-003 | Warning | Asset has no known consumer or test coverage. |
| REG-004 | Error | Inheritance or replacement cycle detected. |
| SRC-001 | Blocker | Canonical source is missing. |
| SRC-002 | Error | Source hash or transformation history is inconsistent. |
| LIC-001 | Critical Release Blocker | Rights or licence are unresolved. |
| LIC-002 | Blocker | Attribution requirement is missing from package report. |
| LIC-003 | Error | Evaluation-only content is included in release package. |
| EVT-001 | Error | Binding references unknown or incompatible Event Contract. |
| EVT-002 | Error | Context field is undeclared or has incompatible type. |
| SPT-001 | Error | Required anchor/socket/mask/path does not resolve. |
| SPT-002 | Warning | LOD or variant uses an approximate fallback. |
| VFX-001 | Blocker | Visible effect body violates fixed 3D voxel style. |
| VFX-002 | Error | Graph is unbounded, cyclic or exceeds approved node/cost limits. |
| VFX-003 | Warning | LOD changes critical silhouette or timing. |
| VFX-004 | Error | Persistent surface layer has no bounded save/expiry policy. |
| SND-001 | Error | Sound Event has missing source, invalid loop or unbounded voice policy. |
| SND-002 | Warning | Repetition set is insufficient or inconsistent. |
| SND-003 | Error | Critical event bypasses approved routing/caption policy. |
| ACU-001 | Warning | Acoustic zone/portal has invalid geometry or fallback. |
| ACU-002 | Error | Mix snapshot can mask protected critical cues. |
| ACC-001 | Critical Release Blocker | Critical cue lacks approved equivalent feedback. |
| ACC-002 | Error | Reduced-motion/flash variant fails timing or direction requirement. |
| BUD-001 | Error | Budget profile is missing. |
| BUD-002 | Error | Worst-case cost is unbounded or fallback chain is invalid. |
| TST-001 | Error | Required scenario has not passed the current asset revision. |
| TST-002 | Warning | Human review evidence is stale after a material change. |
| MIG-001 | Error | Deprecated asset lacks replacement or supported fallback. |
| MIG-002 | Blocker | Save/content-pack migration test failed. |
| PAK-001 | Error | Pack dependency or compatibility range is invalid. |
| PAK-002 | Blocker | Pack override removes protected behaviour. |
| PAK-003 | Blocker | Packaged runtime product is missing or cannot load. |

# Appendix E. Golden Asset and Regression Suite

## E.1 Golden VFX Assets

- stone mining impact;
- water footstep splash;
- furnace smoke managed loop;
- blocked furnace warning;
- mana conduit path pulse;
- ward breach critical effect;
- heavy rain and roof contact;
- wetness persistent layer;
- goblin captain attack telegraph.

## E.2 Golden Audio Assets

- dirt/stone footsteps;
- stone mining impact;
- block placement and break;
- furnace start/work/blocked/shutdown;
- mana conduit and ward breach;
- goblin alert and war horn;
- forest/cave/rain ambience;
- critical warning and caption.

## E.3 Golden Integration Fixtures

- humanoid anchor template;
- machine socket/mask template;
- material response matrix fixture;
- acoustic timber room with door portal;
- profile composition with critical accessibility equivalent;
- old-schema migration fixture;
- content-pack override fixture;
- split-screen scenario fixture.

# Appendix F. Production Workflow Checklists

## F.1 Intake Checklist

- Brief approved.
- Stable ID reserved.
- Owner pack and assignee set.
- Family/template reuse checked.
- Event and spatial dependencies known.
- Importance and accessibility requirements set.
- Source/recording needs and rights plan clear.
- Required scenarios assigned.

## F.2 Author Checklist

- Canonical source saved.
- Provenance complete.
- Family inheritance used appropriately.
- Parameters bounded and documented.
- Local validation clean.
- Quality and accessibility variants authored.
- Preview tested at gameplay distance and repetition rate.

## F.3 Review Checklist

- Technical review passed.
- Specialist review passed.
- Integration/profile review passed.
- Accessibility evidence linked.
- Performance trace within profile.
- Required scenarios passed.
- Packaged-build verification passed.

## F.4 Release Checklist

- Rights report clean.
- Registry health clean.
- Runtime products rebuilt.
- Content pack compatibility clean.
- Save/replay/multiplayer tests passed where relevant.
- Attribution/localisation/captions included.
- Rollback artifact available.

# Appendix G. Migration Checklists

## G.1 Inventory

- Find direct audio players and particle nodes.
- Find scene-path and raw node-name references.
- Find temporary IDs and duplicate files.
- Find non-voxel VFX.
- Find save data with old IDs.
- Find network events carrying presentation implementation details.
- Find unlicensed or unknown sources.

## G.2 Conversion

- Reserve stable replacement IDs.
- Create source/provenance records.
- Map event and context contracts.
- Map anchors/masks/paths.
- Select families and profiles.
- Add quality/accessibility/budget metadata.
- Create aliases and migration record.
- Run A/B scenario and packaged test.

## G.3 Removal

- Verify no supported dependencies.
- Verify save and pack migration.
- Remove temporary wrappers.
- Archive source where legally appropriate.
- Remove alias after support window.
- Update documentation and regression fixtures.

# Appendix H. Release Acceptance Matrix

| Area | Acceptance Requirement |
|---|---|
| Identity | Stable IDs, owners, packs, schemas and relationships are valid. |
| Source | Canonical editable source exists and runtime products rebuild. |
| Rights | All release sources have approved rights and attribution. |
| VFX | Fixed 3D voxel style, readability, LOD and cost pass. |
| Audio | Source quality, variation, loops, routing and mix pass. |
| Integration | Contracts, context, spatial references and lifecycle pass. |
| Accessibility | Critical equivalents and reduced-setting evidence pass. |
| Performance | Budget, aggregation, virtualisation and stress tests pass. |
| Multiplayer | Prediction, confirmation, late join and local settings pass where required. |
| Persistence | Save/load reconstructs durable state without false events. |
| Packaging | Clean package loads all registry products and excludes blocked content. |
| Migration | Supported old IDs/schemas/saves/packs migrate or report clearly. |
| Evidence | Reviews and test artifacts match the released revisions. |
| Rollback | Previous known-good package and migration rollback are available. |

# Appendix I. Content Pack Manifest Example

```text
PresentationContentPack
{
    pack_id: pack.presentation.forest_hamlet
    version: 0.1.0
    schema_version: 1

    game_compatibility: ">=0.1 <0.2"
    required_packs:
      - pack.presentation.core

    provides:
      profiles[]
      bindings[]
      vfx_definitions[]
      sound_events[]
      material_profiles[]
      spatial_templates[]
      acoustic_profiles[]
      accessibility_profiles[]
      budget_profiles[]
      tests[]

    overrides[]
    protected_behaviour_assertions[]
    migrations[]
    licence_summary
    attribution_entries[]
    build_signature
    compatibility_report
}
```

# Appendix J. Open Questions for Production Planning

- Which exact hardware tiers and audio device classes define the first budget matrix?
- Which third-party audio libraries, if any, are approved for the Foundation Library?
- What recording equipment and room access are available for original Foley?
- Which roles are filled by the same person during early production?
- How long should alias and save compatibility windows remain during pre-alpha?
- Which content-pack override capabilities are exposed to external modders first?
- What evidence storage format and retention period best balances traceability and repository size?
- Which automated perceptual audio checks are reliable enough to gate builds?
- Which VFX reference captures need tolerance-based image comparison versus human-only review?
- How often are acoustic zones regenerated for player-built structures?
- Which Foundation counts should be revised after Golden Core production metrics are known?
- When should dialogue, music and cinematic production documents begin?

---

**End of Document 23J - Presentation Forge Asset Libraries, Registries, Production Pipeline, Testing and Migration v0.1**

**Document Set 23A-23J Status:** Complete planning foundation for the Presentation Forge.
