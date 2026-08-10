---
title: "25K - Asset Budgets and Forge, Animation, Audio, VFX, Socket and Event Manifest Contract"
document_id: "25K"
version: "0.1"
status: "Core Production Asset and Presentation Handoff Draft"
project: "Leyforge - Fantasy Voxel Civilisation Sandbox"
document_set: "25 - Post-Atlas Production Governance, Registries, Classification and Integration"
owner: "Ash"
depends_on:
  - "[[25A - Post-Atlas Production Governance]]"
  - "[[25B - Canonical Registry Kernel]]"
  - "[[25C - Domain Schemas and Completeness Contracts]]"
  - "[[25D - Content Packs, Manifests and Migration]]"
  - "[[25E - Validation Architecture and Release Gates]]"
  - "[[25F - Core Production Atlas Classification and Scope Lock]]"
  - "[[25G - Core Production Package Dependency and Progression Matrix]]"
  - "[[25H - Core Production Block Family Catalogue]]"
  - "[[25I - Core Production Item Family Catalogue]]"
  - "[[25J - Resource, Loot, Provenance, Progression and Recipe-Chain Matrix]]"
next_document: "[[25L - Production Backlog, Summer Engine Task Contract and Source-of-Truth Integrity Audit]]"
tags: [leyforge, assets, forge, animation, audio, vfx, sockets, events, manifests, budgets, godot, summer-engine]
---

# FANTASY VOXEL CIVILISATION SANDBOX

## DOCUMENT SET 25

# 25K - Asset Budgets and Forge, Animation, Audio, VFX, Socket and Event Manifest Contract

Version 0.1 - Core Production Asset Scope, Reuse, Presentation and Forge-Handoff Draft

A governed production contract translating the approved Core Production packages, blocks, items, chains, cultures, environments, creatures, structures, bosses and realms into reusable asset packages, Forge manifests, budget envelopes, animation families, spatial roles, presentation events, audio/VFX attachments, accessibility evidence and release-ready handoffs.

Project Lead and Final Authority: Ash

Architecture, systems planning, documentation and production support: GPT-5.6 Thinking

---

# Revision History

| Version | Status | Summary |
| --- | --- | --- |
| 0.1 | Initial draft | Creates 86 asset-package contracts, source-derived manifest coverage for 217 block families and 296 item families, reusable Forge/animation/presentation contracts, recommended Core budget envelopes, Set 26 admission boundaries, and the asset handoff required before 25L closes the implementation backlog. |

# Document Purpose

Document 25K converts the approved Core Production scope into an asset-production plan that can be executed without treating every Atlas foundation, block family, item family, creature, structure or state as a bespoke art request. It defines what every selected package must present, which reusable kits should be produced first, how Forge sources and generated runtime products remain linked, which animation and spatial roles must exist, how gameplay events bind to audio/VFX/UI feedback, what planning budget envelopes constrain production, and what evidence is required before content may claim **Asset Ready**.

This document works at **asset requirement, package, manifest and budget-contract level**. It does not create final models, textures, animation clips, sounds, effects, icons, Godot resources or numerical runtime limits. Detailed authoring tools and presentation schemas remain owned by Forge Documents 21-23; executable system behaviour remains owned by Documents 03-18 and Document Set 26; numeric hardware budgets remain owned by the rewritten Document 18. Document 25K supplies the exact intake and acceptance contract those owners must consume.

By proceeding from 25J to 25K, Ash has accepted the 25J chain matrix as the current working physical-progression intake. The asset package identities and budget envelopes in this draft become working locks only when this document is approved. Source-derived counts are distinguished from recommended planning envelopes throughout.

# Design Sources and Supersession Rules

| Source | Authority Used by 25K |
| --- | --- |
| Documents 25A-25E | Governance, lifecycle, stable IDs, source ownership, packs, optional content, migration, validation, performance classes and release evidence. |
| Documents 25F-25G | Approved Core scope, 36 package identities, 214 selected Atlas foundations, conditional debts, complete realm/teaser boundaries and Set 26 integration. |
| Documents 25H-25J | 217 block-family contracts, 296 item-family contracts, 105 production chains, physical state roles, contextual loot and exact downstream manifest obligations. |
| Atlas 24A-24L | World identity, presentation completeness, reusable-kit strategy, model/material/animation/audio/VFX/icon fields and the rule that planning counts are not implementation claims. |
| Forge Documents 21A-21G | Voxel modelling, 32 x 32 materials, blocks/items, source/runtime separation, snapshots, animation/effect hooks and asset production foundations. |
| Forge Documents 22A-22L | Entity, creature, rigging, animation, blueprint, structure and semantic authoring foundations. |
| Forge Documents 23A-23J | Spatial anchors, events, VFX, audio, material response, accessibility, Godot products, production libraries, provenance, testing and migration. |
| Documents 03-18 v0.1 | Retain visual/readability, animation, UI, accessibility, LOD and system-attachment intentions where compatible. POC-specific asset lists and Unreal assumptions are legacy. |
| Document Set 26 | Owns detailed water, vessel, port, crew, naval, marine ecology, weather and maritime asset contracts. 25K defines only general admission, extension, packaging and compatibility requirements. |

> **Supersession Rule**
>
> Document 25K supersedes POC-specific asset targets such as the Forest Hamlet presentation library as production scope. Archived POC assets may remain regression fixtures. Reusable Golden Core tests, Forge contracts and generic source assets remain valid after renaming, relinking and validation against the production packages.

# Static Table of Contents

- 1. Locked Asset and Presentation Contract Identity
- 2. Decision Boundary and Approval Status
- 3. Scope, Non-Goals and Handoff Boundaries
- 4. Canonical Terminology
- 5. Source-of-Truth and Ownership Boundaries
- 6. Asset Requirement Architecture and Planning Identity
- 7. Universal Asset Requirement Manifest
- 8. Gameplay Definition, Asset Source and Runtime Product Separation
- 9. Asset Classes and Canonical Taxonomy
- 10. Canonical Lifecycle and Asset Work-State Mapping
- 11. Reuse, Composition, Variant and Signature-Identity Rules
- 12. Budget Philosophy and Scope-Control Rules
- 13. Core Production Budget Envelope
- 14. Material, Texture, Surface and State Contracts
- 15. Voxel Models, Shapes, Collision and Structure Modules
- 16. Item Models, Equipment, Wearables and Icon Generation
- 17. NPC, Creature, Body-Plan and Rig Contracts
- 18. Animation Families, Events, Retargeting and State Coverage
- 19. Spatial Anchors, Sockets, Regions, Paths and Local/World Space
- 20. Presentation Event Contracts and Context Bindings
- 21. Audio, Ambience and Acoustic Attachments
- 22. VFX, Lights, Trails and Surface Presentation
- 23. UI, Icons, Maps, Codex, Portraits and Generated Snapshots
- 24. Accessibility, Readability and Equivalent Cues
- 25. Performance Classes, LOD, Aggregation and Virtualisation
- 26. Provenance, Rights, AI Assistance and Source-Control Requirements
- 27. Forge Project, Export, Import and Runtime-Product Contract
- 28. Content Packs, Optional Expansions, Overrides and Missing Assets
- 29. Asset Package Status Summary
- 30. Shared Production Foundation Packages
- 31. Block, Material and Surface Packages
- 32. Item, Equipment and Inventory-Presentation Packages
- 33. World, Biome, Weather and Environment Packages
- 34. Civilisation, Culture, NPC and Settlement Packages
- 35. Structure, Route, Dungeon and Adventure-Site Packages
- 36. Creature, Rig, Animation and Boss Packages
- 37. Automation, Magic and Realm-Access Presentation Packages
- 38. Verdant Covenant and Ancestral Veil Packages
- 39. UI, Accessibility, Audio and VFX Foundation Packages
- 40. Document Set 26 Compatibility and Admission Boundary
- 41. Validation, Review and Acceptance Evidence
- 42. Production Batches, Dependencies and Entry Gates
- 43. Asset Ready Gate and Release Admission
- 44. Decisions Locked by 25K
- 45. Handoff to 25L, Main Documents and Forge
- 46. Risks, Redesign Triggers and Open Decisions
- Appendix A. Master Asset Package Register
- Appendix B. Universal Asset Requirement Manifest Template
- Appendix C. Core Production Budget Envelope Register
- Appendix D. Presentation Event Contract Register
- Appendix E. Spatial Anchor and Socket Role Register
- Appendix F. Asset Quality, LOD and Accessibility Profiles
- Appendix G. Forge Intake and Source-Control Checklist
- Appendix H. Set 26 Major-Expansion Asset Admission Checklist
- Appendix I. Document 25K Acceptance Criteria


# 1. Locked Asset and Presentation Contract Identity

> **Locked Rule**
>
> A selected content package is not Asset Ready because one model, texture, icon, animation, sound or effect exists. It becomes Asset Ready only when every required presentation role has an approved source or declared coherent fallback, the source can rebuild the runtime product, sockets and events resolve, state and LOD variants are complete, accessibility and performance evidence pass, rights are known, and the owning gameplay definition remains the authority for meaning and behaviour.

| Identity Layer | 25K Meaning | Player-Facing Result |
| --- | --- | --- |
| Reusable physical kit | Material, shape, body, rig, structure and icon systems are composed from approved families. | The world has breadth without inconsistent one-off assets. |
| Gameplay-owned presentation | Systems emit declared events and state; assets communicate but do not invent truth. | Feedback matches what actually happened. |
| Forge-traceable source | Every runtime result links back to editable source, export settings, provenance and owner. | Updates and fixes do not depend on lost files or private folders. |
| Bounded quality | Every asset declares cost, LOD/quality chain, density and criticality. | Dense settlements, automation and encounters remain readable and performant. |
| Equivalent cue | Critical information has visual/audio/haptic/text alternatives. | Players are not locked out by one sensory channel or effect setting. |
| Expansion-safe package | Optional packs add assets and facets through stable contracts and safe missing-content behaviour. | Set 26 and future expansions can extend the game without rewriting the kernel. |

# 2. Decision Boundary and Approval Status

| Statement Type | Status in 25K |
| --- | --- |
| 25A-25J governance, scope, package and family counts | Locked working authority. |
| Asset package contracts and manifest fields in this document | Proposed working locks; approved when Ash accepts 25K. |
| Budget envelopes | Recommendations for planning and scope control; not final quotas or hardware budgets. |
| Exact source files, artists/agents, production hours and dates | Deferred to 25L and production scheduling. |
| Exact Godot memory, draw, voice, particle and build-size numbers | Deferred to Document 18 v1.0 after hardware tests. |
| Detailed maritime assets and behaviour | Owned by Set 26; only extension/admission rules are defined here. |

# 3. Scope, Non-Goals and Handoff Boundaries

## 3.1 In scope

- Core Production asset requirement packages and reuse strategy.
- Material, texture, model, structure, item, entity, rig, animation, icon, audio, VFX, socket, event and accessibility manifest fields.
- Planning envelopes derived from selected content and family counts.
- Forge source, export, generated runtime product and evidence relationships.
- Asset lifecycle, production batches, validation and Asset Ready gates.
- Verdant Covenant complete realm assets and Ancestral Veil teaser limits.
- Set 26 major-expansion admission, optional dependency and missing-asset behaviour.
- Exact handoff to 25L, replacement Documents 03-18 and Forge documents.

## 3.2 Explicit non-goals

- No final asset creation, generated image delivery, animation clip production, audio recording or VFX graph authoring in this document.
- No detailed water, vessel, port, crew, naval combat or marine asset inventory.
- No final staffing, contractor, cost or calendar estimate.
- No final engine-specific memory, draw-call, particle, audio-voice or package-size numbers.
- No one-off asset for every block, item, biome, creature or structure.
- No revival of Forest Hamlet, fixed watchtower, named POC villagers or POC raid presentation as production content.
- No requirement that unfinished dedicated Audio/VFX tools exist before validated minimal attachments can be integrated.

## 3.3 Handoff boundaries

| Concern | Canonical Owner after 25K |
| --- | --- |
| Gameplay identity, states, rules and events | Owning Documents 03-18 and Set 26. |
| Asset requirement, reuse, budget class and acceptance | 25K and owning content package. |
| Voxel/material/model authoring | Forge 21 and relevant asset source pack. |
| Entity/rig/animation/blueprint authoring | Forge 22. |
| Audio/VFX/spatial/event presentation authoring | Forge 23. |
| Generated Godot resources, importers, streaming and runtime services | Document 18 v1.0. |
| Source-control, manifests, packs and migrations | 25D plus Forge 23J. |
| Validation and release evidence | 25E, 25K and owning test suites. |
| Task breakdown, files, commands, rollback and production sequence | 25L. |
| Detailed maritime assets | Set 26F-26O and downstream registries. |

# 4. Canonical Terminology

| Term | Definition |
| --- | --- |
| Asset requirement | A governed declaration of presentation work required by one or more gameplay definitions. |
| Asset package | A dependency-bounded group of requirements produced and validated together. |
| Asset family | Reusable source/runtime group sharing form, material, rig, animation, sound, VFX or UI behaviour. |
| Signature asset | Distinctive authored presentation required to preserve identity; cannot be replaced by a generic family without approval. |
| Derived variant | Rule-bounded output inheriting source, family, rig or material and overriding declared differences. |
| Generated product | Replaceable Godot-facing output compiled/imported from canonical source. |
| Presentation profile | Combined audio, VFX, light, surface, UI and accessibility response selected by events/context. |
| Critical cue | Feedback needed to understand danger, state, confirmation, navigation or consequence. |
| Asset Ready | Canonical 25A lifecycle status requiring approved assets and hooks, not merely a finished-looking preview. |
| Budget envelope | Planning range controlling scope; revised by evidence and never used as filler quota. |

# 5. Source-of-Truth and Ownership Boundaries

| Layer | Owns | Must Not Own |
| --- | --- | --- |
| Gameplay/Atlas definitions | Meaning, world role, physical rules, states, relationships and player consequence. | Editable art files or presentation timing as gameplay truth. |
| 25K asset requirement | Required asset classes, family assignment, budget, sockets/events, fallback and acceptance. | Final gameplay logic or source media. |
| Forge source project | Editable models, textures, rigs, animations, graphs, masks, audio sources and export metadata. | Stable gameplay identity or runtime quantities. |
| Presentation definitions | How declared events/context resolve to audio/VFX/light/surface/UI. | Authoritative state change. |
| Generated runtime product | Optimised Godot-facing data and media. | Only editable copy or canonical source. |
| Runtime/save | Current asset-linked state, active phase, durable surfaces and references where needed. | Authored source or unapproved replacement truth. |
| Evidence/provenance | Review results, tests, rights, source lineage and benchmarks. | Gameplay decisions or creative source. |
| Content pack | Ownership, dependencies, versions, bundles, overrides and migrations. | Silent last-write-wins replacement of protected contracts. |

# 6. Asset Requirement Architecture and Planning Identity

Asset-package codes such as `AP-BLK-01` are production-planning identities. Shipped assets use qualified IDs under the namespaces defined by 25B and their owning Forge/registry domains. One package may produce many definitions, and one reusable family may satisfy many package requirements.

| Layer | Example | Rule |
| --- | --- | --- |
| Asset package contract | AP-CRE-03 Grazer, Livestock and Domestic Animal Kit. | Planning/backlog identity; not shipped gameplay definition. |
| Gameplay definition | leyforge.core.creature.<path>. | Owns role and behaviour. |
| Asset family | leyforge.core.asset.family.creature.quadruped.medium. | Owns reusable source/runtime presentation. |
| Forge source project | Versioned project and source records. | Editable canonical source. |
| Runtime product | Generated Godot Resource/mesh/animation/audio/effect bundle. | Rebuildable and replaceable. |
| Binding | Gameplay event/context -> presentation profile -> asset variants. | No hard-coded scene path. |
| Evidence | Test/review/provenance record. | Matches exact revision and build signature. |

# 7. Universal Asset Requirement Manifest

| Field Group | Required Contract |
| --- | --- |
| Identity | asset_requirement_id; owner_definition_ids; owner_package_id; source_document; schema_version; lifecycle status; milestone tier. |
| Classification | asset class; required/optional/conditional/teaser; authored/generated/derived; signature/reusable; critical cue level. |
| Inheritance | parent/family IDs; variant rules; palette/material slots; body/rig compatibility; allowed overrides. |
| Source | Forge project/source path; source hashes; creator; licence; AI assistance; transformation history; editable master. |
| Geometry/material | scale; pivots; collision; mesh/voxel source; material DNA; texture maps; state overlays; shape/LOD mappings. |
| Rig/animation | body plan; skeleton; clips/state families; retarget; events; root motion; mirrored roles; fallback clips. |
| Spatial | anchors; sockets; regions; masks; paths; local/world-space rules; required/optional mappings; LOD remaps. |
| Presentation | event contracts; bindings; audio/VFX/light/surface/UI profiles; ambience; criticality; accessibility alternatives. |
| Budget | quality class; density; memory/streaming class; draw/voice/effect expectations; virtualisation/aggregation; split-screen policy. |
| Runtime products | generated Godot Resources; meshes; atlases; animation libraries; imported audio; compiled graphs; build signatures. |
| Persistence/authority | save relevance; durable state; local/world container identity; replication class; late-join/reconstruction rules. |
| Validation/evidence | schema/reference; art/audio review; accessibility; performance; packaged build; migration; test scenario IDs; evidence links. |
| Fallback/migration | approved shared fallback; missing-pack behaviour; aliases; replacement; deprecation; tombstone; rollback. |

# 8. Gameplay Definition, Asset Source and Runtime Product Separation

| Question | Correct Owner |
| --- | --- |
| Which block is hard stone and which tool can mine it | Block/resource/tool gameplay definitions. |
| Which texture, debris and impact family presents that stone | Asset/material and presentation definitions. |
| Which creature attacks, flees or has personhood | Creature/AI/personhood gameplay definitions. |
| Which body, rig, clips, calls and sockets present it | Entity/animation/audio asset families. |
| Which event occurred and whether it was authoritative | Gameplay/runtime transaction. |
| Which sound/VFX/light/UI response is selected | Presentation binding and local accessibility settings. |
| Which imported file Godot streams | Generated runtime product. |
| Which file may be edited to change the source | Forge/source manifest only. |

# 9. Asset Classes and Canonical Taxonomy

| Asset Class | Required Content | Primary Owner |
| --- | --- | --- |
| Voxel/material source | Editable voxel model, texture/material graph, palette, mask and Material DNA. | Forge 21 / source pack. |
| Block/structure module | Placed geometry, shape template, collision, pivot, material slots and construction/damage states. | Documents 03/12; Forge 21/22. |
| Item/equipment asset | Icon, held/ground/worn model, sockets, condition variants and snapshot settings. | Document 04; Forge 21/22. |
| Entity/body asset | Body plan, model, rig, regions, sockets, LOD and presentation metadata. | Documents 07/10/13; Forge 22. |
| Animation asset | Clip/state family, rig compatibility, events, root-motion policy, retarget and fallback. | Forge 22; owning gameplay system. |
| UI/icon/map asset | Icon, symbol, portrait, diagram, layout/caption metadata and target-size evidence. | Document 17; Forge 23H. |
| Audio asset | Source, Sound Event, family, loop/variation, routing, spatial rules, caption and budget. | Forge 23F/23G. |
| VFX/presentation asset | Effect graph, voxel form, surface layer, light/trail/volume, LOD and accessibility. | Forge 23D/23E. |
| Spatial attachment asset | Socket, anchor, region, mask, path, zone or temporary contact mapping. | Forge 23B. |
| Presentation binding | Event/context to profile relationship; criticality, prediction and fallback. | Forge 23C. |
| Runtime product | Generated Godot Resource, mesh, atlas, audio import, animation library or compiled effect plan. | Document 18 v1.0 / build pipeline. |
| Evidence asset | Reference capture, review, benchmark, listening note, test result and provenance/rights record. | 25E / Forge 23J. |

# 10. Canonical Lifecycle and Asset Work-State Mapping

25A supplies the only canonical production lifecycle. Forge work queues may use local task states, but those states are evidence beneath the canonical status rather than a competing lifecycle.

| Canonical Status | Asset Meaning | Typical Local Evidence |
| --- | --- | --- |
| Concept | Presentation role and likely asset classes identified. | Reference board or rough brief. |
| Foundation | Stable owner, family direction, source pack and initial manifest exist. | Prototype source or kit assignment. |
| Specified | All required asset roles, states, sockets/events, budgets, fallbacks and tests are documented. | Approved asset brief. |
| Data Ready | Machine-readable manifest passes schema/reference checks. | Registry/manifest build. |
| Prototype Ready | Placeholder or early assets prove the complete loop. | Playable source/runtime round-trip. |
| Asset Ready | Approved production source and runtime products exist; required reviews pass. | Final source, exports and evidence. |
| Integrated | Assets operate with gameplay, saves, UI, LOD and authority. | Packaged scenario. |
| Validated | Accessibility, performance, migration and regression evidence pass. | Release evidence bundle. |
| Release Candidate/Released | Locked, packaged, localised and monitored. | Signed bundle and compatibility report. |
| Deprecated/Archived | Replacement/migration or test-only retention published. | Alias, tombstone and archive pack. |

# 11. Reuse, Composition, Variant and Signature-Identity Rules

- Reuse begins with material, shape, body-plan, rig, animation, structure, icon, audio and VFX families before bespoke work is approved.
- A derived variant must declare its parent, changed fields, source cost, runtime cost and reason it cannot use the parent unchanged.
- Palette swaps alone do not create a new gameplay identity; signature silhouettes, behaviours or cultural meanings may justify dedicated source.
- Procedural generation may compose approved modules, but generated outputs remain bounded by manifests and do not bypass art, accessibility or performance review.
- Bosses, realm authorities, culture identity and critical hazards require signature presentation even when they reuse mechanic modules.
- No asset family may imply ancestry, hostility, personhood, culture or moral status that the gameplay definition does not own.
- Shared fallbacks must be visually coherent and must not conceal missing critical state.

# 12. Budget Philosophy and Scope-Control Rules

| Rule | Locked Direction |
| --- | --- |
| Budgets are envelopes | Ranges guide intake and review; they do not force content to reach a number. |
| Manifest coverage is mandatory | Every selected gameplay family has an asset requirement or approved shared fallback. |
| Unique source is constrained | A new bespoke source displaces other work or proves that composition cannot satisfy identity. |
| Reuse is measured | Reports show definitions per family, variants per source, and cost by package. |
| Signature identity is protected | Reuse cannot flatten bosses, cultures, realms or critical states into indistinguishable presentation. |
| Numeric engine budgets wait for evidence | Document 18 sets measured numbers; 25K sets required classes and tests. |
| Calm space remains a budget | Environment density preserves building, traversal, recovery and player-authored landscapes. |
| Scope freezes before full asset production | New foundations require change control and displaced work. |
| Set 26 is separate | Maritime assets do not consume Core budget silently; they enter through expansion manifests. |

# 13. Core Production Budget Envelope

| Budget Area | Recommended Envelope | Interpretation |
| --- | --- | --- |
| Source-derived gameplay family links | 217 block-family contracts; 296 item-family contracts; 105 chain contracts; 214 selected Atlas foundations. | Every selected family receives a manifest link; these are not equal to unique authored assets. |
| Asset package contracts | 86 total: 74 Core Required, 10 Core Conditional, 2 Teaser Only. | Package count is a planning result, not an asset quota. |
| Surface/material masters | 72-96 production masters. | Shared across terrain, construction, items, structures, creatures and effects. |
| State overlays and masks | 24-36 overlays plus 18-30 state masks. | Damage, wetness, frost, scorch, growth, corruption, cleansing, power and occupancy. |
| Animated material/surface sets | 12-20 sets. | Water baseline, mana flow, growth, heat, corruption and selected realm states. |
| Voxel shape/mesh templates | 28-40 reusable templates. | Generate eligible block shapes and modular structure pieces. |
| Block-family manifest bindings | 217 required bindings. | Most use generated shapes/material composition; signature functional blocks may require bespoke models. |
| Item-family icon bindings | 296 required bindings. | Approximately 140-190 authored icon masters; remaining bindings generated or derived where readability passes. |
| Non-block held/ground/placed item models | 56-84 reusable models or modular assemblies. | Tools, weapons, foci, containers, machine parts, relics and signature goods. |
| Culture presentation kits | 6 complete kits. | Architecture palette, clothing/props, signage/heraldry, ambience and settlement usage. |
| Structure and route modular kits | 18-26 kits, approximately 120-180 reusable modules. | Must cover 45 structure and 12 route foundations without one bespoke model per structure. |
| Creature foundation bindings | 49 creature foundations plus approved derived variants. | 44 Overworld and 5 Verdant native foundations; definitions may share body plans/rigs. |
| Body-plan and rig masters | 16-22 body plans; 12-18 production rigs. | Humanoid, quadruped, avian, arthropod, serpentine, construct, spirit and signature exceptions. |
| Animation state families | 36-54 reusable families, approximately 220-360 authored clips. | Locomotion, jobs, interactions, combat, damage, death, social, creature and machine motion. |
| Boss/realm-authority signature packages | 8-11 packages. | Distinct silhouette, telegraphs, territory evidence, audio/VFX and aftermath; reuse mechanic modules where coherent. |
| VFX definitions/templates | 220-320 Core baseline definitions. | Includes material contacts, machines, weather, magic, creatures, bosses, states and realm presentation. |
| Sound Events | 360-540 Core baseline events. | Includes material, item, machine, magic, creature, settlement, biome, UI and warning families. |
| Audio source clips/support layers | 900-1,600 approved sources/layers. | Planning envelope subject to actual reuse, recording access, licensing and runtime mixing needs. |
| Presentation profiles/bindings | 180-280 profiles plus contract bindings. | Combine audio, VFX, light, surface, UI and accessibility equivalents. |
| Ambience/acoustic profiles | 40-64 ambience components; 18-28 acoustic/portal profiles. | Biome, cave, settlement, structure, realm and weather coverage. |
| UI/icon/map/Codex authored masters | 180-260 masters plus generated bindings. | Inventory, status, map, Codex, journal, warning and provenance/custody presentation. |
| Accessibility/equivalent-cue profiles | 36-60 profiles. | Critical warnings, combat, navigation, machine, magic, event and realm cues. |
| Golden/regression scenarios | 32-48 scenarios. | Representative source rebuild, LOD, accessibility, dense scene, migration and packaged-build checks. |
| Numeric memory/storage/build-size budgets | Deferred to Document 18 v1.0 hardware targets. | 25K requires every asset to declare a class; it does not invent unapproved MB limits. |

> **Budget Integrity Rule**
>
> The fixed counts of 217 block families, 296 item families, 105 chain contracts and 214 selected Atlas foundations are source-derived planning inputs. All other ranges in Section 13 are recommendations to control scope and must be revised after Golden Core production, Godot profiling, source availability and reuse measurements.

# 14. Material, Texture, Surface and State Contracts

- Base textures retain the established 32 x 32 surface direction unless an owning Forge document approves a different presentation class.
- Material DNA links physical response, visual parameters, sound/VFX response, state compatibility and culture/realm variants without duplicating gameplay definitions.
- State presentation must distinguish damage, wetness, cold, heat, corruption, cleansing, power, occupancy and construction progress by more than colour alone where gameplay-relevant.
- Worldgen variation uses approved palettes, masks and parameter ranges; it may not create unreadable noise or untracked source assets.
- Surface assets declare tiling, seams, orientation, shape compatibility, distance behaviour, merge/atlas eligibility and icon snapshot treatment.
- Fluid and water assets remain a bounded Core baseline until Set 26 supplies authoritative extensions.

# 15. Voxel Models, Shapes, Collision and Structure Modules

| Concern | Requirement |
| --- | --- |
| Scale/pivot | Uses declared grid scale, origin, rotation and placement reference. |
| Collision | Gameplay collision profile is owned by the definition; source asset supplies validated geometry/mapping. |
| Shape variants | Generated only for eligible material/shape combinations; exceptions are explicit. |
| Modular structures | Modules expose entrances, rooms, job sites, sockets, damage stages and material slots. |
| Construction states | Blueprint preview, scaffold/stage and completed/damaged/repaired presentation map to project state. |
| LOD/merge | Defines mesh simplification, greedy/combined rendering eligibility and silhouette preservation. |
| Destruction | Debris and fracture are bounded presentation; authoritative block/item outputs come from gameplay transactions. |
| Moving containers | Kernel supports local-space assets; detailed vessels remain Set 26-owned. |

# 16. Item Models, Equipment, Wearables and Icon Generation

| Area | Requirement |
| --- | --- |
| Icon coverage | Every item family resolves to an approved icon or generated snapshot with target-size evidence. |
| Held/ground models | Only required where player/world interaction or readability benefits; not every stack needs a unique 3D model. |
| Equipment | Body-slot, grip, sheath, back and attachment roles validate across supported body plans. |
| Condition/quality | Overlays or model changes communicate required state without multiplying full source unnecessarily. |
| Block item forms | Generated from approved block/model/texture source where coherent; manually reviewed at inventory sizes. |
| Unique/relic items | Custody, provenance, loss/recovery and signature presentation remain visible. |
| First/third person | Separate variants only where the camera and interaction truly require them. |
| Accessibility | Silhouette and labels distinguish categories independently of rarity colour. |

# 17. NPC, Creature, Body-Plan and Rig Contracts

| Concern | Requirement |
| --- | --- |
| Body plans | Stable semantic body roles independent of exact bones or mesh topology. |
| Rigs | Versioned skeleton, constraints, deformation, retarget profile and LOD mapping. |
| Personhood | Presentation and harvest/loot mappings honour the gameplay personhood flag. |
| Culture/ancestry | Separate layers; clothing, architecture and faction overlays do not redefine ancestry. |
| Creature readability | Silhouette, motion, sound, habitat evidence and telegraph identify role. |
| Derived variants | Share body/rig/animation families and document changed silhouette/material/effect. |
| Boss exception | Signature body/effect may be bespoke but still uses common event/socket contracts. |
| Performance | Crowd/ambient forms have simplified rigs, animation and aggregation profiles. |

# 18. Animation Families, Events, Retargeting and State Coverage

| Animation Family | Minimum Coverage |
| --- | --- |
| Humanoid locomotion | Idle, walk, run, sprint, turn, jump/land, crouch, carry and approved traversal. |
| Humanoid work | Mine, chop, farm, build, craft, haul, trade, heal, research, cast and maintain. |
| Humanoid combat | Equip, ready, attack, block/parry, dodge, hit, stagger, downed, surrender/flee and death. |
| Humanoid social | Talk, gesture, sit, eat, sleep, celebrate, mourn, warn and group reactions. |
| Creature locomotion | Body-plan-specific idle, move, turn, flee, climb/fly/crawl where approved and rest. |
| Creature ecology | Feed, drink, hunt, nest, track/evidence, interact and territory display. |
| Creature combat | Telegraph, attack, hit, status, retreat, defeat and alternate resolution. |
| Machine motion | Start, loop, load/process/unload, stop, blocked, damaged and maintenance. |
| Boss/authority | Signature phases, critical telegraphs, transitions, outcome and aftermath. |
| Realm/portal | Charge, open, cross, arrive, return, fail and rescue presentation timing. |

- Animation events use stable semantic names such as foot_contact, tool_impact, release, channel_tick, phase_change and interaction_commit.
- Gameplay transactions do not depend on decorative frames unless the owning system declares an authoritative animation window.
- Retargeting preserves semantic events, sockets and contact timing; invalid remaps block the variant.
- Root motion is declared per action and authority model; locomotion cannot silently diverge between clients.
- Fallback clips preserve action readability even when a high-detail variant is absent.

# 19. Spatial Anchors, Sockets, Regions, Paths and Local/World Space

| Role Family | Examples | Boundary |
| --- | --- | --- |
| Spatial Block Roles | block.center, face.*, edge.*, corner.*, surface_mask.*, state_volume, emission_origin, contact_point. | Raw coordinates may be generated, but authored bindings use semantic roles. |
| Item and Tool Roles | grip.main, grip.off, tool.head, blade.edge, release.origin, focus.core, container.opening, attachment.*. | Required mappings vary by item class; missing critical roles block Asset Ready. |
| Humanoid Body Roles | root, pelvis, chest, head, eyes, mouth, hand.*, foot.*, back, waist, weapon.*, carry.*, status.*. | Body-plan variants provide remaps and mirrored roles. |
| Creature Body Roles | root, core, head, mouth, horn.*, claw.*, wing.*, foot.*, tail.*, shell.*, effect.*, evidence.*. | Not gameplay hitboxes unless separately bound by combat data. |
| Machine Roles | input.*, output.*, power.*, mana.*, moving.*, maintenance.*, hazard.*, exhaust.*, ui_indicator.*. | Ports and moving parts map to gameplay interfaces by stable role. |
| Structure and Blueprint Roles | entrance.*, room.*, job.*, storage.*, defence.*, banner.*, light.*, damage.*, loot_context.*, event.*. | Room/structure grammars can generate repeated socket instances. |
| Route and Network Roles | path.start/end, waypoint.*, junction.*, crossing.*, delivery.*, patrol.*, ambience_zone.*. | Supports movement, effects, audio and event placement. |
| Portal and Realm Roles | threshold, source_anchor, destination_anchor, return_anchor, rescue_anchor, warning_zone, transition_path. | Safe-return mappings are mandatory before Integration. |
| UI and Camera Roles | icon_camera, portrait_camera, preview_light.*, tooltip_focus, comparison_origin. | Used by generated snapshots and inspection UI. |
| Temporary Runtime Roles | impact_contact, projectile_hit, foot_contact, spill_origin, dynamic_path_point, local_listener. | Generated state is saved only where persistence requires it. |

# 20. Presentation Event Contracts and Context Bindings

Gameplay systems own event truth. 25K requires each asset package to declare which events it consumes, which context fields are mandatory, which feedback channels are critical and which safe fallback profile applies.

| Contract | Purpose | Required Context | Presentation Obligation |
| --- | --- | --- | --- |
| EV-BLOCK-CONTACT | Contact, footstep, scrape, slide and land against a declared material/surface. | Material, action, intensity, actor/foot/tool, wetness, environment and spatial contact. | Audio + VFX + surface response; critical only where gameplay-relevant. |
| EV-BLOCK-HARVEST | Mine, chop, dig, cut, harvest and progress/failure stages. | Tool capability, block family/state, progress, grade, impact point and authority result. | Impact, debris, sound, crack/state update and accessibility cue. |
| EV-BLOCK-PLACE-REMOVE | Place, rotate, configure, remove and invalid-placement result. | Block/item ID, orientation, support, owner, success/failure and socket context. | Placement/removal profile, UI cue and state evidence. |
| EV-BLOCK-DAMAGE-STATE | Damage, burn, freeze, wet, corrupt, cleanse, power and repair transitions. | Old/new state, cause, severity, owner and persistence. | State overlay, effect/audio, warning and journal/history when important. |
| EV-ITEM-EQUIP-USE | Equip, swing, fire/release, consume, read, activate and fail. | Item family/instance state, hand/socket, action, target, quality and authority result. | Model/animation/audio/VFX/UI profile. |
| EV-ITEM-REPAIR-CHARGE | Repair, maintain, refill, recharge, enchant and break. | Condition/charge before/after, material, station/tool, owner and result. | State update, effect, sound and explanation. |
| EV-ACTOR-MOVEMENT | Walk, run, jump, land, climb, crouch, crawl and approved traversal contacts. | Body plan, locomotion state, surface, speed, burden and environment. | Animation + contact + camera/haptic/accessibility profile. |
| EV-NPC-WORK-SOCIAL | Work action, carry, build, trade, teach, heal, socialise, celebrate and mourn. | Role, tool, target, culture, schedule, relationship and outcome. | Animation, props, voice/foley, UI/Codex and crowd aggregation. |
| EV-NPC-ALERT-COMBAT | Notice, warn, flee, defend, surrender, capture, wound and death. | Faction/relationship, threat, morale, target and authority. | Telegraph, voice, animation, UI and persistent aftermath cue. |
| EV-CREATURE-ECOLOGY | Feed, nest, migrate, hunt, flee, mate, sleep, leave tracks and interact with habitat. | Species/body family, habitat, state, target and simulation detail. | Animation/audio/evidence props; aggregate at distance. |
| EV-CREATURE-COMBAT | Telegraph, attack, hit, stagger, status, defeat and alternate resolution. | Creature, ability, phase, target, impact and outcome. | Animation, VFX, sound, camera/haptic and accessibility equivalents. |
| EV-MACHINE-LIFECYCLE | Start, idle, loop, process, stop, blocked, jammed, overloaded, damaged and maintained. | Machine ID, recipe/state, power, throughput, ports, risk and owner. | Motion, audio/VFX, indicators and UI warnings; phase continuity required. |
| EV-LOGISTICS-FLOW | Item enters, exits, transfers, spills, reroutes or jams. | Item proxy, quantity class, path, port, owner and simulation LOD. | Visible proxy/path effect/audio; aggregate fallback. |
| EV-MAGIC-CAST-FLOW | Charge, cast, release, impact, channel, ward pulse, ritual phase and fail. | School/effect, source, target, mana/purity, risk, sockets/path and authority. | Animation, VFX, audio, surface/light and equivalent cue. |
| EV-PORTAL-REALM | Discover, stabilise, open, enter, arrive, return, rescue and close. | Route/realm IDs, state, participants, destination certainty and authority handoff. | Gate/transition presentation, UI warning and save/migration evidence. |
| EV-STRUCTURE-PROJECT | Plan, supply, construct stage, pause, complete, damage, restore, claim and abandon. | Blueprint/project, stage, resources, workers, owner and world state. | Visible construction/state, audio/VFX, map/journal update. |
| EV-WEATHER-ENVIRONMENT | Rain, wind, thunder, heat/cold, fog, season and environmental hazard change. | Region/biome, intensity, shelter, time, player settings and LOD. | Weather/ambience/surface response and comfort fallback. |
| EV-QUEST-EVENT-WORLDSTATE | Objective update, discovery, warning, consequence, route change and outcome. | Event ID, participants, uncertainty, contribution, severity and persistence. | Journal/map/UI, world evidence and optional audio/VFX. |
| EV-BOSS-PHASE-AFTERMATH | Territory warning, phase change, critical attack, defeat/retreat/pact and aftermath. | Boss instance, phase/outcome, contributors, territory and world state. | Protected telegraph, presentation, proof/reward and region-state change. |
| EV-UI-SYSTEM | Confirm, deny, error, discover, unlock, save, migrate, missing-content and accessibility notice. | UI context, severity, action result, input device and local settings. | Visual/audio/haptic/caption profile; no decorative-only blocking cue. |

# 21. Audio, Ambience and Acoustic Attachments

- Every required Sound Event has stable identity, family, source provenance, variation/loop rules, priority, concurrency, virtualisation, spatial behaviour and caption/accessibility metadata.
- Material response resolves from gameplay material and contact context rather than one hard-coded sound per block ID.
- Long-lived machine, ambience and realm loops preserve phase/state through LOD and virtualisation.
- Critical warnings remain intelligible through captions, directional UI/haptics or equivalent visual rhythm; loudness alone is insufficient.
- Settlement, biome and structure ambience is layered and density-aware; it must not become a continuous undifferentiated noise bed.
- Dialogue, full voice production, adaptive music and platform certification remain outside 25K unless separately approved.
- Temporary or third-party audio may prove Prototype Ready only when provenance and replacement status are explicit.

# 22. VFX, Lights, Trails and Surface Presentation

- VFX retains the established fixed three-dimensional voxel/cuboid presentation direction for generated particle forms unless a separately approved non-particle effect class applies.
- Effects declare shape, motion, duration, intensity, collision/surface interaction, light contribution, LOD, pooling and deterministic/reconstruction needs.
- Critical telegraphs use silhouette, timing, motion, ground shape, UI and audio equivalents rather than colour alone.
- Persistent surfaces such as wetness, scorch, corruption and growth have bounded write, save and cleanup policies.
- Weather and ambience aggregate by region/volume and respect comfort settings.
- Boss and realm effects may receive higher budgets, but signature presentation cannot bypass dense-scene and reduced-effect tests.
- VFX never creates damage, resources or state by itself; it presents authoritative outcomes.

# 23. UI, Icons, Maps, Codex, Portraits and Generated Snapshots

| Output | Requirement |
| --- | --- |
| Inventory icon | Readable at target sizes; transparent framing; category and state distinct without colour dependence. |
| Block/structure preview | Generated from approved source and orientation; scale and material state controlled. |
| Codex portrait | Represents silhouette, culture/personhood or creature role accurately; knowledge/uncertainty variants supported. |
| Map symbol | Stable symbol family, discovery/uncertainty/cleared/damaged states and accessible shape. |
| Journal/history art | Supports event, faction, route, realm and aftermath evidence without inventing canon. |
| Recipe/blueprint preview | Shows required station/shape/assembly meaning; final quantities remain registry-owned. |
| Status/warning icon | Matches criticality, caption and equivalent cue; no rarity-colour substitute. |
| Snapshot pipeline | Camera, lighting, background, scale, animation pose and source revision are reproducible. |

# 24. Accessibility, Readability and Equivalent Cues

| Requirement | Contract |
| --- | --- |
| Criticality classification | Every cue is decorative, informative, important or critical; fallback rules follow classification. |
| Colour independence | Critical states differ by shape, motion, icon, pattern, text, audio or haptic alternative. |
| Audio independence | Warnings and directional information have captions/indicators/haptic or map/UI equivalents. |
| Reduced motion/flash | Provides reduced or static telegraphs without changing gameplay timing or hit area. |
| Target-size readability | Icons, map symbols, particles and markers are tested at actual UI/camera scale. |
| Cognitive load | Dense scenes aggregate decorative cues; important state remains prioritised and explainable. |
| Input/comfort | Presentation does not require rapid repetitive input or camera motion to understand state. |
| Local settings | Accessibility choices are local presentation settings and do not alter authoritative world truth. |

# 25. Performance Classes, LOD, Aggregation and Virtualisation

| Class | Typical Use | Required Behaviour |
| --- | --- | --- |
| AQ-0 Metadata Only | No runtime visual/audio cost; registry, localisation or evidence only. | Always resident if required by UI/validation. |
| AQ-1 Micro/Common | Tiny icon, simple prop, contact effect or short one-shot. | Aggressive batching/pooling; full -> reduced -> hidden where decorative. |
| AQ-2 Standard Interactive | Common block/item/entity/loop visible near player. | Full -> reduced -> minimal; retains state/readability. |
| AQ-3 Persistent Local | Machine loop, settlement ambience, persistent surface or interactive structure. | Aggregation/virtualisation and phase continuity mandatory. |
| AQ-4 Major Encounter | Large creature, dungeon event, storm, ritual or regional structure state. | Capped concurrency; protected telegraphs; reduced fallback. |
| AQ-5 Critical/Boss/Realm | Boss, realm transition, critical warning or signature realm presentation. | Distinctive budget allowed; critical cue survives all quality levels. |
| AQ-6 Research/Unbounded | Concept requires unproven renderer, simulation, rig, audio or network cost. | Tooling Research; cannot enter milestone without profiling and redesign gate. |

Every scalable asset declares a quality chain such as `Full -> Reduced -> Minimal -> Critical Cue Only -> Hidden/Virtualised`. Not every stage is valid for every asset. A gameplay-critical telegraph may never become Hidden while relevant.

# 26. Provenance, Rights, AI Assistance and Source-Control Requirements

| Concern | Requirement |
| --- | --- |
| Source identity | Original filename/project, creator/provider, date, hashes and version recorded. |
| Licence/rights | Allowed uses, attribution, redistribution and derivative rights reviewed before release. |
| AI assistance | Tool/model and assistance state recorded; source inputs and output rights reviewed; human approval mandatory. |
| Transformation history | Meaningful edits, conversion, generation and cleanup steps traceable. |
| References | Reference images/audio are not shipped unless rights allow; influence and copying risk reviewed. |
| Large files | Use approved large-file storage; generated products may be rebuilt but released revisions are reproducible. |
| Private folders | No release source exists only on a personal device or ephemeral AI session. |
| POC assets | Generic reusable source may migrate after rename/relink; archive fixtures remain separately pinned. |

# 27. Forge Project, Export, Import and Runtime-Product Contract

1. Approve the asset requirement and assign an existing family or justify new source.
2. Create or update the canonical Forge/source project with stable source records and semantic parts/sockets.
3. Validate style, scale, pivots, materials, rig/animation events and required variants in the Forge preview/test laboratory.
4. Export through a versioned profile that records source revision, settings, dependencies and hashes.
5. Import or compile to generated Godot Resources and runtime products; never edit generated output as canonical truth.
6. Run schema, reference, rights, art/audio, accessibility, performance and scenario checks.
7. Package products with the owning content pack, localisation, licences, aliases and migrations.
8. Promote lifecycle status only when evidence matches the exact asset revision and runtime build.

| Product Type | Canonical Source | Generated Runtime Output |
| --- | --- | --- |
| Voxel/block/structure | Forge voxel/model/material project. | Mesh/voxel resource, material resource, collision/LOD mapping. |
| Item/equipment | Forge model/icon/snapshot project. | Mesh/wearable resource, icon atlas entry, socket mapping. |
| Entity/rig/animation | Entity/rig/animation source project. | Skeleton/skin, AnimationLibrary, event/retarget tables, LOD bodies. |
| Audio | Source media and Sound Event definition. | Imported streams, event bundle, bus/routing metadata. |
| VFX | Effect definition/graph/voxel forms. | Compiled effect plan, meshes/materials and budget variants. |
| UI/icon/map | Vector/raster/source scene and framing manifest. | Atlases, textures, symbol tables and localisation metadata. |
| Evidence | Capture/test/review source. | Signed report/baseline referenced by release bundle. |

# 28. Content Packs, Optional Expansions, Overrides and Missing Assets

- Every asset belongs to one owner pack and declares required/optional dependencies, compatibility range, runtime bundles and source/evidence manifests.
- Base packs may expose extension slots; optional expansions add facets, variants and new definitions without duplicating base ownership.
- Overrides are explicit, traceable and cannot remove protected gameplay or accessibility behaviour without an approved equivalent.
- When an optional asset pack is absent, definitions either use an approved base fallback, remain unavailable with a clear dependency report, or preserve opaque persistent state for reactivation.
- A missing decorative asset may use a coherent fallback; a missing critical silhouette, telegraph, icon or state representation blocks admission.
- Aliases, deprecation and replacement preserve save and manifest identity; asset IDs are never reused for unrelated content.
- Mod packs use the same source/provenance and budget contracts within their admitted trust boundary.

# 29. Asset Package Status Summary

| Result | Count / Meaning |
| --- | --- |
| Total asset-package contracts | 86 |
| Core Required | 74 |
| Core Conditional | 10 |
| Teaser Only | 2 |
| Source-derived block-family bindings | 217 |
| Source-derived item-family bindings | 296 |
| Recommended removals | None at planning stage; scope reduction remains available if source, tooling or budget evidence fails. |
| Implementation-ready conclusion | No. Packages are asset-addressable; actual source, products and evidence are still required. |

# 30. Shared Production Foundation Packages

| Package | Role | Required Deliverables | Reuse / Fallback | Status / Owner |
| --- | --- | --- | --- | --- |
| AP-CORE-01<br>**Material DNA and Surface Response Foundation** | Defines reusable physical/presentation material families used by blocks, items, structures, creatures and effects. | Material master records; response tags; shader parameters; footstep/impact families; wet/burnt/frozen/corrupted variants; source and runtime links. | One family may serve many gameplay definitions; overrides are narrow and pack-owned. | Core Required<br>Forge 21/23; 25H; 25J |
| AP-CORE-02<br>**Voxel Texture and Palette Template Library** | Provides the 32 x 32 authored surface language, tile conventions, colour/value ranges and culture/realm palette extension points. | Editable texture templates; palette records; edge/tiling rules; normal/emission/roughness masks where approved; preview scenes. | Derived colour and weathering variants use rules rather than copied textures. | Core Required<br>Forge 21; Art Direction |
| AP-CORE-03<br>**State Overlay, Damage and Transformation Library** | Provides reusable overlays for damage, cracks, wetness, frost, scorch, growth, corruption, cleansing, powered and inactive states. | Overlay masks; blend priorities; state evidence profiles; accessibility-safe shape/motion cues; migration mapping from legacy states. | Shared overlays prevent a unique texture for every state permutation. | Core Required<br>25H; Forge 21/23 |
| AP-CORE-04<br>**Voxel Shape, Collision and Mesh Template Library** | Provides common full-block, slab, stair, slope, beam, post, fence, wall, arch, roof, furniture and machine-shell geometry. | Editable source meshes/voxel projects; pivots; collision profiles; placement markers; LOD/merge eligibility. | Generated geometry and material assignment serve eligible families. | Core Required<br>Forge 21; Document 03 v1.0 |
| AP-CORE-05<br>**Icon Capture, Framing and Snapshot Foundation** | Defines consistent icon generation from Forge sources plus review rules for hand-authored exceptions. | Camera/lighting presets; silhouettes; borders; scale/centering; transparency; state/quality overlays; target-size tests. | Generated snapshots cover block forms and many items; signature icons remain authored. | Core Required<br>Forge 21/22/23; Document 17 |
| AP-CORE-06<br>**Spatial Anchor, Socket, Region and Path Catalogue** | Provides stable semantic attachment roles for models, voxels, bones, structures, machines, paths and temporary contacts. | Anchor-role definitions; required/optional mappings; mirrored roles; LOD remaps; fallbacks; validation fixtures. | Semantic roles survive model, variant and LOD changes. | Core Required<br>Forge 22/23B; 25B-25C |
| AP-CORE-07<br>**Presentation Event and Binding Catalogue** | Provides the governed bridge from authoritative gameplay events to presentation profiles. | Event-contract references; context fields; binding rules; prediction/confirmation handling; critical-cue classification; deprecation map. | Shared events feed material, sound, VFX, light, UI and accessibility layers. | Core Required<br>Forge 23C; Documents 03-18 |
| AP-CORE-08<br>**Budget, LOD, Accessibility and Evidence Template Pack** | Provides reusable cost classes, quality chains, equivalent-cue profiles and evidence formats. | Budget profiles; LOD/virtualisation chains; reduced-motion/flash modes; caption/haptic hooks; test scenarios; review records. | All packages inherit a tested profile and override only justified differences. | Core Required<br>25E; Forge 23H-23J; Document 18 v1.0 |

# 31. Block, Material and Surface Packages

| Package | Role | Required Deliverables | Reuse / Fallback | Status / Owner |
| --- | --- | --- | --- | --- |
| AP-BLK-01<br>**Common Soil, Turf and Loose-Ground Material Kit** | Supports start areas, farms, roads, erosion, tracks and common construction fill. | Soil/turf/mud/gravel/sand-like surface masters; loose-material shapes; wet/dry/frozen states; contact audio/VFX bindings. | Biome palettes and fertility/moisture overlays derive from shared masters. | Core Required<br>25H terrain families; Document 03 v1.0 |
| AP-BLK-02<br>**Common Stone, Deepstone and Rubble Kit** | Supports terrain, caves, masonry, mining, ruins, roads and structural construction. | Stone families; cut/brick/polished forms; rubble/debris; crack/damage states; mining particles and impacts. | Culture and realm stone variants inherit shape and response families. | Core Required<br>25H; Documents 03/12 |
| AP-BLK-03<br>**Clay, Ceramic, Brick and Glass Kit** | Supports storage, roofs, windows, furnaces, pipes, decoration and industry. | Clay/brick/tile/glass masters; transparency and fracture rules; ceramic vessel forms; heat states; shard/debris effects. | Colour and culture variants use palette/material inheritance. | Core Required<br>25H-25J; Documents 03-06 |
| AP-BLK-04<br>**Hardwood, Softwood and Worked-Timber Kit** | Supports terrain vegetation, tools, buildings, furniture, machines and route structures. | Log/plank/beam/post/roof/furniture surfaces; growth rings; bark; cut/burnt/rotted states; chop/saw response. | Tree species reuse structural roles while retaining material identity. | Core Required<br>25H; Forge 21 |
| AP-BLK-05<br>**Fibre, Reed, Thatch and Flexible-Construction Kit** | Supports wetland cultures, roofing, screens, baskets, farms, rope interfaces and temporary shelter. | Reed/thatch/woven/fibre materials; wind/bend states; woven patterns; light modular pieces; rustle/contact audio. | Pattern and palette variants serve cultures and biomes. | Core Required<br>25H-25J |
| AP-BLK-06<br>**Metal, Ore, Crystal and Refined-Surface Kit** | Supports deposits, tools, machines, armour, structures, conduits and magic. | Copper/iron/alloy/ore/crystal masters; raw/refined/oxidised/heated states; sparkle/emission rules; mining/forge response. | Material families share geometry and response templates but preserve distinct capability cues. | Core Required<br>25H-25J; Documents 03-06 |
| AP-BLK-07<br>**Core Water and Fluid Presentation Baseline** | Supports bounded rivers, lakes, wetlands, shoreline readability, containers and simple fluid-state evidence before Set 26. | Calm-water surface; flow direction; depth/readability cues; wet contact; simple splash/ripple families; safe placeholder interfaces for future overhaul. | Must be replaceable/extended by Set 26 without breaking IDs or saves. | Core Conditional<br>Document 11 v1.0; Set 26B-26D |
| AP-BLK-08<br>**Agriculture, Crop, Growth and Harvest-State Kit** | Supports food production, settlement needs, growth, disease and seasonal change. | Crop-stage models; seedling/mature/harvested/damaged states; soil markers; harvest sockets; growth VFX and ambient loops. | Shared stage templates support many crop definitions. | Core Required<br>25H-25J; Documents 07/10/11 |
| AP-BLK-09<br>**Damage, Ruin, Occupation and Restoration Kit** | Supports persistent aftermath across structures, settlements, dungeons, machines and routes. | Burnt/broken/collapsed/occupied/repaired/cleansed overlays; debris modules; scaffolds; restoration markers; before/after evidence. | Reusable state kit applies to many structures through declared mappings. | Core Required<br>25H; Documents 12/15/16 |
| AP-BLK-10<br>**Magic, Rune, Ward and Conduit Kit** | Supports practical magic, machine interfaces, settlement wards and realm access. | Rune surfaces; conduit segments; ward boundaries; charge states; ritual anchors; portal frame sockets; readable mana flow profiles. | Shared magical infrastructure carries culture/realm variants through palettes and motifs. | Core Required<br>25H; Documents 08/09/14 |
| AP-BLK-11<br>**Automation, Logistics, Power and Machine-Shell Kit** | Supports chutes, storage, frames, shafts, belts/carts, processors, power interfaces and maintenance. | Machine shells; port indicators; moving parts; input/output/power sockets; active/blocked/damaged states; loop bindings. | Common frame and interface families reduce one-off machine models. | Core Required<br>25H-25J; Document 08 v1.0 |
| AP-BLK-12<br>**Verdant Living-Material and Realm-State Kit** | Supports the complete Verdant Covenant realm, living structures, seasonal states and Overworld utility. | Living wood/stone/growth surfaces; seasonal/blight/cleansed states; animated growth; realm runes; portal/return markers. | Uses terrestrial base kits with bounded realm-specific forms. | Core Conditional<br>25F-25J; Documents 03/11/14 |

# 32. Item, Equipment and Inventory-Presentation Packages

| Package | Role | Required Deliverables | Reuse / Fallback | Status / Owner |
| --- | --- | --- | --- | --- |
| AP-ITM-01<br>**Raw, Refined and Component Item Presentation Kit** | Covers physical resource, ingot, plate, rod, fibre, cloth, leather, glass, crystal, scrap and component families. | Icon masters; stack silhouettes; held/ground models where needed; grade/quality/condition overlays; source bindings. | Template-driven icons and material swaps cover most definitions. | Core Required<br>25I-25J; Document 04 v1.0 |
| AP-ITM-02<br>**Food, Water, Medicine and Provision Kit** | Covers fresh, cooked, preserved, medicinal, contaminated and relief-supply items. | Food/container icons; small models; freshness/spoilage cues; recipe snapshots; warning/caption metadata. | Container and meal families reuse plates, jars, bowls and packaging templates. | Core Required<br>25I-25J; Documents 04/05/07 |
| AP-ITM-03<br>**Tools, Instruments and Maintenance Kit** | Covers primitive to iron tools, survey devices, repair tools, rune tools and specialist instruments. | Held models; grip/tool-head sockets; icons; wear states; swing/contact event maps; Forge previews. | Handles, heads and materials compose into approved variants. | Core Required<br>25I; Documents 02/04/16 |
| AP-ITM-04<br>**Weapons, Foci and Combat-Readability Kit** | Covers melee, ranged and magical focus families required by Core combat. | Models; icons; grip/release/impact sockets; trails; telegraph profiles; condition states; first/third-person views where required. | Shared weapon silhouettes and animation families support material variants. | Core Required<br>25I; Document 16 v1.0 |
| AP-ITM-05<br>**Armour, Clothing and Wearable Kit** | Covers protective gear, work clothing, culture garments, backpacks and accessories. | Wearable meshes/voxel layers; body-slot mappings; icons; damage/condition states; clipping tests; body-plan variants. | Layered modular garments reduce ancestry/culture duplication. | Core Required<br>25I; Forge 22; Documents 02/13/16 |
| AP-ITM-06<br>**Containers, Storage and Cargo-Presentation Kit** | Covers crates, sacks, barrels, baskets, contract packs, project supplies and trade cargo. | Models/icons; seal/label/ownership states; open/closed variants; content-category markings; carrying sockets. | Shared container shell with culture and content markers. | Core Required<br>25I-25J; Documents 07/08/13 |
| AP-ITM-07<br>**Automation Parts and Machine-Component Kit** | Covers gears, plates, shafts, filters, frames, coils, batteries, cores and maintenance parts. | Component models/icons; material variants; assembly previews; wear/damage states; machine-socket compatibility. | One component family serves many recipes and machines. | Core Required<br>25I-25J; Document 08 |
| AP-ITM-08<br>**Magic Components, Runes and Realm Supplies Kit** | Covers mana crystals, dust, runes, catalysts, ward supplies, ritual items and route-stabilisation goods. | Icons/models; charge/purity states; emission masks; socket roles; ritual placement previews; accessibility descriptions. | Shared rune and crystal families receive school/culture variants. | Core Required<br>25I-25J; Documents 09/14 |
| AP-ITM-09<br>**Culture, Trade-Good and Civic-Record Kit** | Covers signature goods, banners, permits, contracts, taxes, relief goods and settlement records. | Icons/models; labels/seals; culture motifs; legal/ownership warnings; map/Codex links. | Six culture palettes and shared document/cargo templates. | Core Required<br>25I; Documents 07/13/15 |
| AP-ITM-10<br>**Knowledge, Map, Relic and Contextual-Loot Kit** | Covers books, maps, blueprints, relic fragments, boss proof, research records and historical evidence. | Icon/portrait/map-symbol sets; readable document previews; unique-item presentation; provenance and custody cues. | Shared record/relic frames with authored signature exceptions. | Core Required<br>25I-25J; Documents 12/15/17 |

# 33. World, Biome, Weather and Environment Packages

| Package | Role | Required Deliverables | Reuse / Fallback | Status / Owner |
| --- | --- | --- | --- | --- |
| AP-WLD-01<br>**Temperate Woodland and Forest Environment Kit** | Supports multiple connected woodland/forest foundations without a fixed tutorial forest. | Terrain palette; trees/understory; rocks/debris; ambience; weather response; wildlife evidence; map symbol family. | Species and seasonal variants inherit a common environment kit. | Core Required<br>25F-25G; Document 11 v1.0 |
| AP-WLD-02<br>**Boreal, Upland and Cold-Forest Environment Kit** | Supports colder forest/upland transitions, survival pressure and specialised resources. | Conifers; snow/frost overlays; wind response; cold ambience; route/readability props; transition rules. | Shares timber, rock and weather families with AP-WLD-01/03. | Core Required<br>25F-25G; Document 11 |
| AP-WLD-03<br>**Grassland, Heath and Agricultural-Edge Kit** | Supports open travel, settlement suitability, grazing, farming and wind-readable landscapes. | Ground palettes; grasses/shrubs; crop-edge props; wind animation; distant silhouettes; ambient insects/birds. | Density and season profiles create variants without new foundations. | Core Required<br>25F-25G; Documents 07/10/11 |
| AP-WLD-04<br>**Wetland, Fen and Mire Environment Kit** | Supports waterlogged terrain, reeds, medicine, hazards, culture adaptation and special ecology. | Wet soil; reed kits; pools; fog; insect ambience; hazard markers; boardwalk/route compatibility. | Shares water baseline and plant families; avoids full ocean simulation. | Core Required<br>25F-25G; Documents 10/11 |
| AP-WLD-05<br>**Rocky, Arid and Exposed-Land Environment Kit** | Supports dry/exposed travel, quarries, ruins, scarce water and distinct settlement choices. | Rock/scree palettes; sparse vegetation; dust/wind effects; heat/readability cues; shelter props. | Uses common stone and weather families with different density and colour control. | Core Required<br>25F-25G; Document 11 |
| AP-WLD-06<br>**River, Lake, Estuary and Coastal-Edge Environment Kit** | Supports inland water routes and bounded shoreline/coast foundations selected by 25F. | Banks, reeds, calm water, ford/ferry/bridge markers, shore debris, storm-exposure cues and simple ambience. | Must not imply waves, tides, currents, ships or underwater systems; Set 26 extends it. | Core Conditional<br>25F-25G; Document 11; Set 26C-26D |
| AP-WLD-07<br>**Cave, Mine and Underground Environment Kit** | Supports caves, extraction, underground biomes, ruins, lairs and settlement variants. | Rock strata; cave vegetation; crystals; darkness/light cues; acoustic profiles; hazard props; map symbols. | Room/terrain grammars reuse shared materials and socket templates. | Core Required<br>25F-25G; Documents 10-12 |
| AP-WLD-08<br>**Leyline, Magical and Ancient-Influence Environment Kit** | Supports mana discovery, ancient sites, magical weather and region identity. | Leyline traces; runic debris; mana glow; ambient effects/sound; corruption/blessing overlays; map/Codex cues. | Composes with ordinary biomes rather than becoming isolated colour swaps. | Core Required<br>25F-25G; Documents 09/11/12 |
| AP-WLD-09<br>**Corruption, Cleansing and Persistent-Aftermath Environment Kit** | Supports damaged, occupied, blighted, repaired and cleansed world states. | State overlays; altered vegetation; debris; ambience shifts; hazard telegraphs; restoration transitions. | Reuses state library with biome-specific mapping. | Core Required<br>25G; Documents 10-12/15 |
| AP-WLD-10<br>**Season, Weather and Regional-Ambience Kit** | Supports day/night, seasons, rain, wind, storms, heat/cold and region identity within Core technical limits. | Weather profiles; cloud/precipitation/lightning cues; ambience layers; shelter transitions; quality/LOD chains. | Set 26 owns full marine weather, waves and storm coupling. | Core Required<br>Documents 11/17/18; Forge 23 |

# 34. Civilisation, Culture, NPC and Settlement Packages

| Package | Role | Required Deliverables | Reuse / Fallback | Status / Owner |
| --- | --- | --- | --- | --- |
| AP-CIV-01<br>**Shared Humanoid and Personhood Presentation Foundation** | Provides common body, face, hands, equipment, expression and interaction roles while keeping ancestry/culture separate. | Body-plan sources; rig mappings; sockets; animation retarget profile; portrait/camera setup; accessibility descriptors. | Shared base does not erase body diversity; approved ancestry variants retain identity. | Core Required<br>Forge 22; Documents 07/13/16 |
| AP-CIV-02<br>**Human Culture Kit** | Supports the selected Human culture package without treating Humans as the default for all civilisations. | Architecture palette; clothing; tools/props; signage; banners; settlement ambience; portrait motifs. | Uses shared humanoid, structure and material kits. | Core Required<br>25F-25G; Document 13 |
| AP-CIV-03<br>**Goblin Culture Kit** | Supports Goblin personhood, settlement life, industry, trade and faction diversity beyond hostile stereotypes. | Architecture; clothing; tools; domestic props; banners; job assets; social audio/animation; Codex presentation. | Hostile factions use faction overlays, not a separate species truth. | Core Required<br>25F-25G; Documents 07/13 |
| AP-CIV-04<br>**Dwarf Culture Kit** | Supports selected Dwarf settlement, industry, craft, route and magical infrastructure identity. | Stone/metal architecture; clothing/gear; tools; signs; industry props; ambience; portrait motifs. | Builds on common stone/metal/machine kits. | Core Required<br>25F-25G; Document 13 |
| AP-CIV-05<br>**Elven Kindreds Culture Kit** | Supports selected Elven culture package, woodland/realm links and internal diversity. | Architecture; clothing; living-material motifs; tools/props; banners; social/ritual presentation. | Uses terrestrial and Verdant-compatible families without ancestry lock. | Core Required<br>25F-25G; Documents 13/14 |
| AP-CIV-06<br>**Awakened Construct Culture Kit** | Supports personhood, repair, work, law and settlement identity for constructed people. | Body shells; modular parts; expressive lights/motion; tools; architecture/charging/repair props; voice/presentation profiles. | Machine parts do not become generic loot from persons; body and item boundaries validate. | Core Required<br>25F-25G; Documents 07/10/13 |
| AP-CIV-07<br>**Six-Culture Wardrobe, Job and Equipment Overlay Kit** | Provides role-readable clothing and tools for farmer, builder, miner, guard, merchant, mage, healer, courier and related jobs. | Layered garments; job props; equipment sockets; state variants; portrait combinations; LOD rules. | Role layers combine with body and culture kits. | Core Required<br>Documents 07/13; Forge 22 |
| AP-CIV-08<br>**Settlement Stage and Civic-Service Kit** | Supports Camp through Magical Metropolis progression and branch states without one fixed village layout. | Service markers; household/work/civic modules; growth/damage/repair variants; project previews; map symbols. | Stage/state composition rather than unique complete town models. | Core Required<br>Documents 07/12/19/20 |
| AP-CIV-09<br>**Signs, Heraldry, Language and Ownership Kit** | Communicates faction, culture, law, claims, routes and public/private storage. | Banner/sign templates; emblems; seals; ownership markers; warning symbols; accessibility-safe shapes. | Text/localisation and iconography remain separable. | Core Required<br>Documents 13/15/17 |
| AP-CIV-10<br>**Trade, Market, Warehouse and Caravan Kit** | Supports physical economy, contracts, cargo, storage and route activity. | Market stalls; crates; scales; ledgers; carts/pack loads; route signs; transaction audio/animation. | Cargo types use labels and manifests rather than unique models for every item. | Core Required<br>Documents 07/08/13 |
| AP-CIV-11<br>**Agriculture, Workshop and Industry Prop Kit** | Supports farms, mills, forges, sawmills, kitchens, healers, research and machine-assisted work. | Work props; station dressing; tool racks; material piles; job sockets; loop/interaction bindings. | Props are modular and shared across structure blueprints. | Core Required<br>Documents 07/08/12 |
| AP-CIV-12<br>**Festival, Morale, Memorial and Aftermath Kit** | Supports morale, culture events, mourning, celebration, public memory and recovery. | Decorations; memorials; gathering markers; crowd/social animation cues; ambience and state variants. | Event overlays attach to existing settlements instead of requiring unique settlement copies. | Core Required<br>Documents 07/15; Settlement Needs |

# 35. Structure, Route, Dungeon and Adventure-Site Packages

| Package | Role | Required Deliverables | Reuse / Fallback | Status / Owner |
| --- | --- | --- | --- | --- |
| AP-STR-01<br>**Shared Modular Structure and Blueprint Kit** | Provides walls, floors, roofs, entrances, rooms, markers and sockets for procedural and authored construction. | Module sources; grid/pivot rules; material slots; doorway/room sockets; damage stages; preview thumbnails. | One grammar serves culture, settlement and adventure variants. | Core Required<br>Forge 22; Documents 12/19 |
| AP-STR-02<br>**Road, Bridge, Crossing and Route Infrastructure Kit** | Supports the twelve selected route foundations and physical connectivity. | Road surfaces; bridges; culverts; signs; waymarkers; damage/repair variants; route event sockets. | Material and culture variants reuse route geometry. | Core Required<br>25F-25G; Documents 11/12 |
| AP-STR-03<br>**Farm, Workshop, Warehouse and Industry Structure Kit** | Supports production, storage, projects and settlement economy. | Building modules; station sockets; storage/hauling markers; machine bays; construction stages; ambience hooks. | Shared modules combine with culture palettes. | Core Required<br>Documents 07/08/12 |
| AP-STR-04<br>**Defence, Gate, Wall and Watch Infrastructure Kit** | Supports settlement defence, patrols, raids, regional pressure and recovery without restoring the fixed POC watchtower. | Walls/gates/towers/traps/ward mounts; guard sockets; damage/repair states; warning/event bindings. | Generic defence modules serve many settlements and threats. | Core Required<br>Documents 07/12/16 |
| AP-STR-05<br>**Civic, Sacred, Research and Magical Structure Kit** | Supports halls, shrines, libraries, mage buildings, ritual sites and realm gates. | Room modules; ritual/ward sockets; archive props; service markers; culture variants; state transitions. | Shared civic grammar with specialised functional modules. | Core Required<br>Documents 07/09/12/14 |
| AP-STR-06<br>**Ruin, Lair and Standard Dungeon Grammar Kit** | Supports the selected ruins, lairs and dungeon families with histories, occupants and outcomes. | Room/connector modules; hazards; secrets; loot contexts; enemy sockets; damage/occupation/restoration states. | Grammar and material/state composition multiply layouts safely. | Core Required<br>25F-25G; Documents 10/12/15 |
| AP-STR-07<br>**Root-Below Megadungeon Seed-Family Kit** | Supports the bounded megadungeon foundation without requiring a second game-sized content set. | Distinct entrance/zone modules; progression/readability markers; boss/service sockets; save/LOD-safe state modules. | Reuses standard dungeon grammar; unique modules are budget-capped. | Core Conditional<br>25F-25G; Documents 12/18 |
| AP-STR-08<br>**Boss Territory, Arena and Persistent-Aftermath Kit** | Supports regional and wandering boss evidence, confrontation spaces and post-outcome changes. | Territory markers; arena modules; telegraph anchors; destructible/repairable states; proof/reward display; aftermath variants. | Shared territory evidence and arena sockets support different bosses. | Core Required<br>25G; Documents 10/12/16 |

# 36. Creature, Rig, Animation and Boss Packages

| Package | Role | Required Deliverables | Reuse / Fallback | Status / Owner |
| --- | --- | --- | --- | --- |
| AP-CRE-01<br>**Creature Body-Plan, Rig and Retarget Foundation** | Defines reusable humanoid, quadruped, avian, arthropod, serpentine, construct and spirit body roles. | Body-plan records; skeletons/rigs; sockets; hit/presentation regions; retarget maps; LOD bodies; preview scenes. | Derived variants must map to an approved body plan or enter Tooling Research. | Core Required<br>Forge 22; Document 10 v1.0 |
| AP-CRE-02<br>**Small Wildlife, Ambient and Pollinator Family Kit** | Supports ambient life, clues, pollination and low-cost ecology. | Small models; lightweight rigs; idle/flight/crawl loops; calls; tracks/nest evidence; LOD/aggregation rules. | Many species derive from a few bounded body/animation families. | Core Required<br>25F-25G; Document 10 |
| AP-CRE-03<br>**Grazer, Livestock and Domestic Animal Kit** | Supports food, fibre, trade, breeding, work and village ecology. | Quadruped/body variants; locomotion; feeding/resting/fleeing; production interactions; pens/feeding props; calls. | Shared quadruped rig and behaviour animation sets. | Core Required<br>Documents 07/10 |
| AP-CRE-04<br>**Predator, Scavenger and Territorial Wildlife Kit** | Supports hunting pressure, carcass ecology, territory and player counterplay. | Models/rigs; stalking/chase/attack/flee/eat animations; tracks/den evidence; combat telegraphs; calls. | Shared predator body and state families with distinct silhouettes. | Core Required<br>Document 10 |
| AP-CRE-05<br>**Burrowing, Cave and Arthropod Threat Kit** | Supports underground/cave pressure, nests, resources and hazards. | Arthropod/burrower bodies; climb/crawl/attack; nest props; web/chitin effects; acoustic cues; LOD. | Complex free-burrowing remains conditional; bounded tunnels/markers are supported. | Core Required<br>Documents 10-12 |
| AP-CRE-06<br>**Humanoid Faction Combatant and Raider Kit** | Supports intelligent hostile/neutral faction members without tying hostility to ancestry. | Humanoid combat animations; equipment sets; banners; patrol/camp props; surrender/flee/capture states; voice/event hooks. | Uses personhood/culture kits plus faction overlays. | Core Required<br>Documents 10/13/16 |
| AP-CRE-07<br>**Spirit, Elemental and Magical-Creature Kit** | Supports wisps, spirits, elementals and magic-linked ecology. | Voxel forms; rigs or procedural motion; emission/VFX; calls; interaction sockets; readable state changes. | Approved motion/effect templates prevent uncontrolled bespoke simulation. | Core Required<br>Documents 09/10 |
| AP-CRE-08<br>**Construct, Golem and Machine-Creature Kit** | Supports non-person constructs, personhood-safe Awakened variants and bounded labour/combat constructs. | Modular bodies; rig roles; power/core sockets; work/combat animations; damage/repair states; machine audio. | Personhood flag changes loot, damage and presentation handling. | Core Required<br>Documents 08/10/13 |
| AP-CRE-09<br>**Creature Interaction, Harvest, Taming and Evidence Kit** | Supports tracks, nests, feeding, handling, ethical harvest and Codex discovery. | Interaction animations; evidence props; body regions; tool sockets; welfare/readability cues; non-lethal outcome presentation. | Shared interaction library applies across eligible body plans. | Core Required<br>Document 10; 25J provenance |
| AP-CRE-10<br>**Unique Boss and Realm-Authority Production Kit** | Supports eight Overworld bosses and three realm authorities with distinctive silhouettes, telegraphs and aftermath. | Unique models or bounded signature modules; phase animations; telegraph sockets; audio/VFX profiles; arena/territory evidence; defeat/alternate-outcome states. | Shared mechanic/effect modules may be reused, but each boss retains signature identity. | Core Conditional<br>25F-25G; Documents 10/14/16 |

# 37. Automation, Magic and Realm-Access Presentation Packages

| Package | Role | Required Deliverables | Reuse / Fallback | Status / Owner |
| --- | --- | --- | --- | --- |
| AP-AUT-01<br>**Mechanical Power and Motion Animation Kit** | Supports cranks, shafts, wheels, wind/water/fuel interfaces and moving machine parts. | Loop animations; phase continuity; pivots; power-flow indicators; start/stop/blocked states; sound/VFX bindings. | Shared motion modules attach to machine families. | Core Required<br>Document 08; Forge 21/23 |
| AP-AUT-02<br>**Logistics, Sorting and Visible-Flow Kit** | Supports chutes, carts, storage transfer, filters and readable bottlenecks. | Moving-item proxies; path anchors; filter indicators; jam/overflow states; aggregation/LOD profiles. | Uses item icons/proxies rather than full item models at distance. | Core Required<br>Document 08; Document 18 v1.0 |
| AP-AUT-03<br>**Processing, Heat, Smoke and Maintenance Kit** | Supports furnaces, forges, mills, crushers, kitchens and repairable machines. | Active/idle/blocked/damaged loops; heat/smoke/spark effects; maintenance sockets; warning audio; surface states. | Material and machine-class families share profiles. | Core Required<br>Documents 05/08; Forge 23 |
| AP-AUT-04<br>**Mana Flow, Battery, Conduit and Ward Presentation Kit** | Supports practical magical infrastructure and settlement defence. | Flow paths; charge indicators; pulse/overload/blocked states; ward boundaries; critical warning equivalents. | Culture/realm variants inherit core logic and budgets. | Core Required<br>Documents 08/09; Forge 23 |
| AP-AUT-05<br>**Spell, Ritual and Enchantment Presentation Kit** | Supports selected utility/combat spells, research, rituals and item/block enchantment states. | Cast/release/impact profiles; focus sockets; ritual volumes; persistent surface states; accessibility alternatives. | Effect families are parameterised by element/school/context. | Core Required<br>Document 09; Forge 23 |
| AP-AUT-06<br>**Realm Gate, Transition and Safe-Return Presentation Kit** | Supports portal discovery, stabilisation, entry, return, rescue and failure states. | Gate models/anchors; transition VFX/audio; warning/UI cues; destination/return state evidence; loading/authority handoff hooks. | Set 26 may extend to maritime routes without changing base gate identity. | Core Conditional<br>Documents 09/14/18 |

# 38. Verdant Covenant and Ancestral Veil Packages

| Package | Role | Required Deliverables | Reuse / Fallback | Status / Owner |
| --- | --- | --- | --- | --- |
| AP-REALM-01<br>**Verdant Covenant Environment and Seasonal-State Pack** | Supports the fully playable realm landscape, transitions, weather, growth, blight and cleansing. | Realm palette/materials; vegetation; terrain features; ambience; seasonal state variants; map/Codex presentation. | Reuses terrestrial kits with bounded signature families. | Core Conditional<br>25F-25J; Documents 11/14 |
| AP-REALM-02<br>**Verdant Covenant Culture, Settlement and Structure Pack** | Supports Verdant Pact enclaves, native services, architecture, routes and diplomacy. | Culture/structure kit; props; clothing; banners; ritual/ward modules; damage/restoration states. | Uses shared civilisation/structure grammars with realm motifs. | Core Conditional<br>25F-25G; Documents 07/12-14 |
| AP-REALM-03<br>**Verdant Covenant Creature, Boss and Animation Pack** | Supports five native creature foundations, bounded derived variants and three realm authorities. | Bodies/variants; animations; calls; effects; territory evidence; authority telegraphs; aftermath assets. | Must remain within approved shared body/animation budgets. | Core Conditional<br>25F-25G; Document 10/14 |
| AP-REALM-04<br>**Verdant Covenant Resource, Item and Overworld-Use Pack** | Supports living materials, realm goods, route supplies and visible Overworld utility. | Block/item forms; icons/models; growth/charge states; recipe/structure previews; provenance cues. | Uses 25H-25J conditional families and chain contracts. | Core Conditional<br>25H-25J; Documents 03-06/14 |
| AP-TEASER-01<br>**Ancestral Veil Safe-Threshold Environment Pack** | Provides a bounded, safe, non-farmable threshold presentation only. | Threshold environment; route/return markers; limited ambience; safety warnings; no full realm ecology or production assets. | May reuse abstract/spirit presentation; no gameplay promise beyond approved teaser. | Teaser Only<br>25F-25G; Document 14 |
| AP-TEASER-02<br>**Ancestral Veil Evidence, Knowledge and UI Pack** | Supports Codex, journal, map, testimony and one-time threshold evidence. | Symbols; document/knowledge presentation; route-state icons; accessibility descriptions; no repeatable resource reward. | Uses shared knowledge and realm UI frames. | Teaser Only<br>25I-25J; Documents 15/17 |

# 39. UI, Accessibility, Audio and VFX Foundation Packages

| Package | Role | Required Deliverables | Reuse / Fallback | Status / Owner |
| --- | --- | --- | --- | --- |
| AP-UI-01<br>**Core HUD, Inventory, Crafting and System-Status Icon Pack** | Supports health/stamina/mana/survival, inventory, recipes, machine states, settlement needs and warnings. | Icon masters; generated family bindings; state frames; target-size tests; non-colour distinctions; controller/touch variants. | One icon system serves multiple screens and knowledge levels. | Core Required<br>Document 17 v1.0; Forge 23H |
| AP-UI-02<br>**Map, Codex, Journal, History and World-State Presentation Pack** | Supports discovery, uncertainty, routes, sites, cultures, ecology, bosses, realms and persistent aftermath. | Map symbols; Codex portraits; diagrams; history/event markers; uncertainty states; provenance/custody views. | Symbols derive from foundation families and remain readable without colour. | Core Required<br>Documents 15/17 |
| AP-UI-03<br>**Accessibility Equivalent-Cue and Comfort Pack** | Ensures critical information survives reduced motion/flash, colour-blindness, hearing differences and control constraints. | Caption families; directional indicators; shape/motion alternatives; haptic hooks; reduced-effect profiles; test evidence. | Attached to presentation profiles, not duplicated as optional afterthoughts. | Core Required<br>25E; Forge 23; Document 17 |
| AP-UI-04<br>**Core Audio, VFX, Ambience and Presentation Foundation Pack** | Provides the minimum complete presentation library for Core Production without requiring every final dedicated tool before integration. | Material response; impacts; footsteps; machine/magic loops; creature calls; weather/ambience; critical warnings; presentation profiles and tests. | Uses Forge 23 contracts and may begin with validated external authoring/import workflows. | Core Required<br>Forge 23A-23J; Documents 03-18 |

# 40. Document Set 26 Compatibility and Admission Boundary

| Set 26 Area | 25K Extension Point | Set 26 Ownership |
| --- | --- | --- |
| Water/liquid overhaul | Fluid material/source classes, state overlays, event/anchor/budget fields and migration from Core water baseline. | 26B. |
| Ocean/coast/island generation | Environment kit manifests, streaming classes, ambience/weather bindings and shoreline transition assets. | 26C-26D. |
| Swimming/diving | Body/animation/socket/event/UI/audio/VFX requirement fields. | 26E. |
| Voxel vessels | Mobile-container model/voxel source, local-space anchors, structure modules, damage states and LOD fields. | 26F-26I. |
| Ports/crews/fleets | Culture/structure/wardrobe/job/prop/vehicle package manifests. | 26J-26K. |
| Naval combat/damage | Weapon, telegraph, flooding/fire/sinking state, boarding and aftermath asset contracts. | 26L. |
| Marine ecology/sites/bosses | Body plans, rigs, environment kits, dungeons, territory evidence and boss signature packages. | 26M. |
| Progression/UI/technical | Registry bindings, icons, maps, audio/VFX, authority, LOD, performance and migration evidence. | 26N-26O. |

> **Set 26 Boundary Rule**
>
> Document 25K does not pre-allocate the detailed maritime asset inventory or hide it inside Core budgets. Set 26 must publish its own package-level manifests and recommended envelopes using 25K fields. Those packages may reuse Core families where coherent and must declare the incremental source, runtime, validation and migration burden.

# 41. Validation, Review and Acceptance Evidence

| Review Area | Acceptance Requirement | Blocking Result |
| --- | --- | --- |
| Identity and ownership | Stable asset requirement ID, owner definitions, pack, source document and lifecycle state resolve. | Missing/duplicate owner or orphan asset blocks admission. |
| Source recoverability | Editable source and export settings rebuild runtime products. | Runtime-only asset cannot reach Asset Ready. |
| Rights and provenance | Creator/provider, licence, AI assistance, transformation history and attribution approved. | Unresolved rights are non-waivable release blockers. |
| Style and readability | Voxel style, silhouette, scale, material response and target-size readability pass. | A visually attractive but unreadable asset remains blocked. |
| Rig/animation | Body/rig compatibility, sockets, events, transitions and fallback clips validate. | Broken event timing or missing required role blocks integration. |
| Presentation integration | Event, context, anchor, sound, VFX, light, surface and UI references resolve. | No hard-coded scene path or raw callback substitute. |
| Accessibility | Critical cues have non-colour/non-audio alternatives and reduced-effect evidence. | Critical information cannot depend on one sensory channel. |
| Performance/LOD | Budget class, LOD/quality chain, aggregation/virtualisation and dense-scene evidence pass. | No undefined cost class in Release Candidate. |
| Save/migration | Persistent asset state, replacement, missing-pack and reactivation behaviour pass. | No silent deletion or duplication. |
| Authority/multiplayer | Authoritative events, prediction, confirmation, late join and local accessibility settings behave correctly. | Clients cannot invent state because an asset is missing. |
| Packaging | Correct runtime products, licences, localisation, dependencies and blocked-content exclusion verified in packaged build. | Editor-only success is insufficient. |
| POC leakage | No shipping manifest depends on Forest Hamlet or other retired POC identities. | Legacy assets remain only in archive/test packs. |

# 42. Production Batches, Dependencies and Entry Gates

| Batch Order | Primary Packages | Entry Gate | Exit Evidence |
| --- | --- | --- | --- |
| B0 - Golden Shared Foundation | AP-CORE-01 to AP-CORE-08. | 25B-25E stable; representative definitions selected. | Source/runtime round-trip, style, socket/event, icon, audio/VFX and budget tests. |
| B1 - Immediate World and Survival | AP-BLK-01 to 06, AP-ITM-01 to 03, AP-WLD-01 to 03. | 25H-25J approved. | Safe-start assets, materials, tools, icons, contacts and first-10-minute scenarios. |
| B2 - Civilisation and Production | AP-CIV-01 to 12, AP-STR-01 to 05, AP-AUT-01 to 04. | Culture/settlement/structure definitions Specified. | NPC work, settlement stage, trade, machine and project scenarios. |
| B3 - Ecology and Adventure | AP-CRE-01 to 09, AP-STR-06/08, world underground/magic/aftermath. | Creature/site/boss contracts Specified. | Ecology, dungeon, combat, loot and aftermath scenarios. |
| B4 - Boss and Megadungeon Conditional | AP-CRE-10, AP-STR-07. | Technology substitution and runtime budgets resolved. | Signature telegraphs, save/LOD, dense encounter and fallback evidence. |
| B5 - Verdant Complete Realm | AP-BLK-12, AP-REALM-01 to 04, AP-AUT-06. | Realm executable contract and safe-return path Specified. | Complete realm entry, ecology, society, adventure, return and aftermath scenarios. |
| B6 - Ancestral Veil Teaser | AP-TEASER-01/02. | Teaser safety/absence rules approved. | Bounded threshold, return, no farmable content and clear UI evidence. |
| B7 - Expansion Admission | Set 26 package manifests. | Relevant Set 26 documents Specified and 25B-25E compatible. | Cross-pack build, missing-pack, migration, authority, LOD and source evidence. |
| B8 - Release Consolidation | All selected packages and AP-UI-01 to 04. | 25L backlog and Document 18 budgets active. | Packaged build, accessibility, performance, provenance and rollback bundle. |

# 43. Asset Ready Gate and Release Admission

- All required asset roles in the owning package resolve to approved source or declared fallback.
- Canonical source, export profile and runtime products rebuild with matching signatures.
- Required material, state, shape, model, rig, animation, icon, audio/VFX and spatial/event bindings are complete.
- Critical cues pass accessibility and target-scale readability checks.
- Budget class, LOD/quality chain, aggregation/virtualisation and stress evidence are present.
- Gameplay, saves, migration, optional pack absence and multiplayer authority do not depend on missing decorative state.
- Rights, provenance, AI assistance and attribution are approved.
- POC-only identities are absent from shipping manifests.
- Owning system, Forge reviewer, accessibility review and technical validation agree on the exact revision.
- Asset Ready does not imply Integrated, Validated or Released; later gates still apply.

# 44. Decisions Locked by 25K

| Decision | Locked Direction |
| --- | --- |
| Asset ownership | Gameplay owns meaning; Forge/source owns editable assets; runtime products are generated. |
| Package strategy | Use 86 bounded asset-package contracts with reusable families and signature exceptions. |
| Manifest coverage | Every selected block, item, content package and required chain presentation has an asset requirement or coherent fallback. |
| Budget status | Ranges are planning envelopes; numeric engine limits wait for Document 18 profiling. |
| POC migration | Forest Hamlet presentation targets are archived, not production scope. |
| Animation/events | Semantic body roles, sockets and events are stable across variants and LOD. |
| Audio/VFX | Minimal complete attachments are mandatory; dedicated tool completion is not a prerequisite for validated imported assets. |
| Accessibility | Critical state cannot rely on colour, loudness, flash or motion alone. |
| Provenance | Unresolved rights or untraceable source blocks release. |
| Set 26 | Maritime assets use 25K admission contracts but remain separately budgeted and authored by Set 26. |
| Closure | 25L cannot claim final production closure without approved asset manifests and Set 26 integration status. |

# 45. Handoff to 25L, Main Documents and Forge

| Consumer | Required Handoff from 25K |
| --- | --- |
| 25L | Asset package IDs, dependencies, status, recommended envelopes, production batch order, tests, risks and unresolved conditional work. |
| Document 03 v1.0 | Material/model/state/icon/audio/VFX/socket requirements for all 217 block families. |
| Document 04 v1.0 | Icon/model/wearable/condition/provenance presentation requirements for all 296 item families. |
| Documents 05-06 v1.0 | Station, process, source/output, by-product, warning and recipe-preview asset obligations. |
| Documents 07-17 | NPC, settlement, automation, magic, creatures, world, structures, factions, realms, events, combat and UI manifest consumption. |
| Document 18 v1.0 | Runtime resource types, importers, streaming, LOD, memory/voice/effect budgets, build pipeline and diagnostics. |
| Forge 21 | Material, block, item, structure and snapshot intake. |
| Forge 22 | Entity, rig, animation, blueprint and structure-module intake. |
| Forge 23 | Spatial, event, audio, VFX, accessibility and evidence intake. |
| Set 26 | General manifest schema, local/world-space roles, optional-pack and admission evidence; detailed maritime inventory remains Set 26-owned. |

# 46. Risks, Redesign Triggers and Open Decisions

| Risk | Trigger | Response |
| --- | --- | --- |
| Asset backlog exceeds milestone | Unique source requests or estimated authoring hours exceed package capacity. | Reduce scope, increase reuse, replace a foundation or defer conditional package. |
| Reuse flattens identity | Cultures, bosses, realms or materials become visually indistinguishable. | Approve bounded signature assets and reduce low-value variants elsewhere. |
| Forge/tool dependency blocks progress | Required editor is unfinished or unstable. | Use schema-valid external source/import workflow; preserve future Forge project linkage and migration. |
| Animation explosion | Every creature/item requests unique clips. | Consolidate body plans, retarget, parameterise and move unsupported locomotion to Tooling Research. |
| Presentation overload | Audio/VFX counts or density obscure state and exceed runtime. | Prioritise critical cues, aggregate, virtualise, simplify and tighten budgets. |
| Source/provenance gap | Asset cannot prove rights or editable origin. | Block release and replace; do not rely on plausible AI-generated appearance. |
| Icon generation unreadable | Snapshots fail target-size silhouette or category clarity. | Author exception icon or revise model/material framing. |
| POC leakage | Shipping pack references retired identities or scenes. | Block build; migrate/relink or isolate in archive pack. |
| Set 26 duplicates base ownership | Maritime pack redefines base IDs/materials/events. | Move to extension facet/variant or publish explicit supersession/migration. |
| Document 18 budgets invalidate envelope | Measured memory/render/audio/network cost exceeds planning range. | Revise 25K envelope, package scope and 25L backlog under change control. |

Open decisions that still require later authority include exact hardware tiers, staffing and production calendar; approved third-party audio/texture libraries; recording and motion-capture access; final tool implementation order; and which Set 26 packages enter which release milestone. None block approval of the 25K contract itself.

# Appendix A. Master Asset Package Register

| Package | Role | Deliverables | Reuse / Fallback | Status / Owner |
| --- | --- | --- | --- | --- |
| AP-CORE-01<br>**Material DNA and Surface Response Foundation** | Defines reusable physical/presentation material families used by blocks, items, structures, creatures and effects. | Material master records; response tags; shader parameters; footstep/impact families; wet/burnt/frozen/corrupted variants; source and runtime links. | One family may serve many gameplay definitions; overrides are narrow and pack-owned. | Core Required<br>Forge 21/23; 25H; 25J |
| AP-CORE-02<br>**Voxel Texture and Palette Template Library** | Provides the 32 x 32 authored surface language, tile conventions, colour/value ranges and culture/realm palette extension points. | Editable texture templates; palette records; edge/tiling rules; normal/emission/roughness masks where approved; preview scenes. | Derived colour and weathering variants use rules rather than copied textures. | Core Required<br>Forge 21; Art Direction |
| AP-CORE-03<br>**State Overlay, Damage and Transformation Library** | Provides reusable overlays for damage, cracks, wetness, frost, scorch, growth, corruption, cleansing, powered and inactive states. | Overlay masks; blend priorities; state evidence profiles; accessibility-safe shape/motion cues; migration mapping from legacy states. | Shared overlays prevent a unique texture for every state permutation. | Core Required<br>25H; Forge 21/23 |
| AP-CORE-04<br>**Voxel Shape, Collision and Mesh Template Library** | Provides common full-block, slab, stair, slope, beam, post, fence, wall, arch, roof, furniture and machine-shell geometry. | Editable source meshes/voxel projects; pivots; collision profiles; placement markers; LOD/merge eligibility. | Generated geometry and material assignment serve eligible families. | Core Required<br>Forge 21; Document 03 v1.0 |
| AP-CORE-05<br>**Icon Capture, Framing and Snapshot Foundation** | Defines consistent icon generation from Forge sources plus review rules for hand-authored exceptions. | Camera/lighting presets; silhouettes; borders; scale/centering; transparency; state/quality overlays; target-size tests. | Generated snapshots cover block forms and many items; signature icons remain authored. | Core Required<br>Forge 21/22/23; Document 17 |
| AP-CORE-06<br>**Spatial Anchor, Socket, Region and Path Catalogue** | Provides stable semantic attachment roles for models, voxels, bones, structures, machines, paths and temporary contacts. | Anchor-role definitions; required/optional mappings; mirrored roles; LOD remaps; fallbacks; validation fixtures. | Semantic roles survive model, variant and LOD changes. | Core Required<br>Forge 22/23B; 25B-25C |
| AP-CORE-07<br>**Presentation Event and Binding Catalogue** | Provides the governed bridge from authoritative gameplay events to presentation profiles. | Event-contract references; context fields; binding rules; prediction/confirmation handling; critical-cue classification; deprecation map. | Shared events feed material, sound, VFX, light, UI and accessibility layers. | Core Required<br>Forge 23C; Documents 03-18 |
| AP-CORE-08<br>**Budget, LOD, Accessibility and Evidence Template Pack** | Provides reusable cost classes, quality chains, equivalent-cue profiles and evidence formats. | Budget profiles; LOD/virtualisation chains; reduced-motion/flash modes; caption/haptic hooks; test scenarios; review records. | All packages inherit a tested profile and override only justified differences. | Core Required<br>25E; Forge 23H-23J; Document 18 v1.0 |
| AP-BLK-01<br>**Common Soil, Turf and Loose-Ground Material Kit** | Supports start areas, farms, roads, erosion, tracks and common construction fill. | Soil/turf/mud/gravel/sand-like surface masters; loose-material shapes; wet/dry/frozen states; contact audio/VFX bindings. | Biome palettes and fertility/moisture overlays derive from shared masters. | Core Required<br>25H terrain families; Document 03 v1.0 |
| AP-BLK-02<br>**Common Stone, Deepstone and Rubble Kit** | Supports terrain, caves, masonry, mining, ruins, roads and structural construction. | Stone families; cut/brick/polished forms; rubble/debris; crack/damage states; mining particles and impacts. | Culture and realm stone variants inherit shape and response families. | Core Required<br>25H; Documents 03/12 |
| AP-BLK-03<br>**Clay, Ceramic, Brick and Glass Kit** | Supports storage, roofs, windows, furnaces, pipes, decoration and industry. | Clay/brick/tile/glass masters; transparency and fracture rules; ceramic vessel forms; heat states; shard/debris effects. | Colour and culture variants use palette/material inheritance. | Core Required<br>25H-25J; Documents 03-06 |
| AP-BLK-04<br>**Hardwood, Softwood and Worked-Timber Kit** | Supports terrain vegetation, tools, buildings, furniture, machines and route structures. | Log/plank/beam/post/roof/furniture surfaces; growth rings; bark; cut/burnt/rotted states; chop/saw response. | Tree species reuse structural roles while retaining material identity. | Core Required<br>25H; Forge 21 |
| AP-BLK-05<br>**Fibre, Reed, Thatch and Flexible-Construction Kit** | Supports wetland cultures, roofing, screens, baskets, farms, rope interfaces and temporary shelter. | Reed/thatch/woven/fibre materials; wind/bend states; woven patterns; light modular pieces; rustle/contact audio. | Pattern and palette variants serve cultures and biomes. | Core Required<br>25H-25J |
| AP-BLK-06<br>**Metal, Ore, Crystal and Refined-Surface Kit** | Supports deposits, tools, machines, armour, structures, conduits and magic. | Copper/iron/alloy/ore/crystal masters; raw/refined/oxidised/heated states; sparkle/emission rules; mining/forge response. | Material families share geometry and response templates but preserve distinct capability cues. | Core Required<br>25H-25J; Documents 03-06 |
| AP-BLK-07<br>**Core Water and Fluid Presentation Baseline** | Supports bounded rivers, lakes, wetlands, shoreline readability, containers and simple fluid-state evidence before Set 26. | Calm-water surface; flow direction; depth/readability cues; wet contact; simple splash/ripple families; safe placeholder interfaces for future overhaul. | Must be replaceable/extended by Set 26 without breaking IDs or saves. | Core Conditional<br>Document 11 v1.0; Set 26B-26D |
| AP-BLK-08<br>**Agriculture, Crop, Growth and Harvest-State Kit** | Supports food production, settlement needs, growth, disease and seasonal change. | Crop-stage models; seedling/mature/harvested/damaged states; soil markers; harvest sockets; growth VFX and ambient loops. | Shared stage templates support many crop definitions. | Core Required<br>25H-25J; Documents 07/10/11 |
| AP-BLK-09<br>**Damage, Ruin, Occupation and Restoration Kit** | Supports persistent aftermath across structures, settlements, dungeons, machines and routes. | Burnt/broken/collapsed/occupied/repaired/cleansed overlays; debris modules; scaffolds; restoration markers; before/after evidence. | Reusable state kit applies to many structures through declared mappings. | Core Required<br>25H; Documents 12/15/16 |
| AP-BLK-10<br>**Magic, Rune, Ward and Conduit Kit** | Supports practical magic, machine interfaces, settlement wards and realm access. | Rune surfaces; conduit segments; ward boundaries; charge states; ritual anchors; portal frame sockets; readable mana flow profiles. | Shared magical infrastructure carries culture/realm variants through palettes and motifs. | Core Required<br>25H; Documents 08/09/14 |
| AP-BLK-11<br>**Automation, Logistics, Power and Machine-Shell Kit** | Supports chutes, storage, frames, shafts, belts/carts, processors, power interfaces and maintenance. | Machine shells; port indicators; moving parts; input/output/power sockets; active/blocked/damaged states; loop bindings. | Common frame and interface families reduce one-off machine models. | Core Required<br>25H-25J; Document 08 v1.0 |
| AP-BLK-12<br>**Verdant Living-Material and Realm-State Kit** | Supports the complete Verdant Covenant realm, living structures, seasonal states and Overworld utility. | Living wood/stone/growth surfaces; seasonal/blight/cleansed states; animated growth; realm runes; portal/return markers. | Uses terrestrial base kits with bounded realm-specific forms. | Core Conditional<br>25F-25J; Documents 03/11/14 |
| AP-ITM-01<br>**Raw, Refined and Component Item Presentation Kit** | Covers physical resource, ingot, plate, rod, fibre, cloth, leather, glass, crystal, scrap and component families. | Icon masters; stack silhouettes; held/ground models where needed; grade/quality/condition overlays; source bindings. | Template-driven icons and material swaps cover most definitions. | Core Required<br>25I-25J; Document 04 v1.0 |
| AP-ITM-02<br>**Food, Water, Medicine and Provision Kit** | Covers fresh, cooked, preserved, medicinal, contaminated and relief-supply items. | Food/container icons; small models; freshness/spoilage cues; recipe snapshots; warning/caption metadata. | Container and meal families reuse plates, jars, bowls and packaging templates. | Core Required<br>25I-25J; Documents 04/05/07 |
| AP-ITM-03<br>**Tools, Instruments and Maintenance Kit** | Covers primitive to iron tools, survey devices, repair tools, rune tools and specialist instruments. | Held models; grip/tool-head sockets; icons; wear states; swing/contact event maps; Forge previews. | Handles, heads and materials compose into approved variants. | Core Required<br>25I; Documents 02/04/16 |
| AP-ITM-04<br>**Weapons, Foci and Combat-Readability Kit** | Covers melee, ranged and magical focus families required by Core combat. | Models; icons; grip/release/impact sockets; trails; telegraph profiles; condition states; first/third-person views where required. | Shared weapon silhouettes and animation families support material variants. | Core Required<br>25I; Document 16 v1.0 |
| AP-ITM-05<br>**Armour, Clothing and Wearable Kit** | Covers protective gear, work clothing, culture garments, backpacks and accessories. | Wearable meshes/voxel layers; body-slot mappings; icons; damage/condition states; clipping tests; body-plan variants. | Layered modular garments reduce ancestry/culture duplication. | Core Required<br>25I; Forge 22; Documents 02/13/16 |
| AP-ITM-06<br>**Containers, Storage and Cargo-Presentation Kit** | Covers crates, sacks, barrels, baskets, contract packs, project supplies and trade cargo. | Models/icons; seal/label/ownership states; open/closed variants; content-category markings; carrying sockets. | Shared container shell with culture and content markers. | Core Required<br>25I-25J; Documents 07/08/13 |
| AP-ITM-07<br>**Automation Parts and Machine-Component Kit** | Covers gears, plates, shafts, filters, frames, coils, batteries, cores and maintenance parts. | Component models/icons; material variants; assembly previews; wear/damage states; machine-socket compatibility. | One component family serves many recipes and machines. | Core Required<br>25I-25J; Document 08 |
| AP-ITM-08<br>**Magic Components, Runes and Realm Supplies Kit** | Covers mana crystals, dust, runes, catalysts, ward supplies, ritual items and route-stabilisation goods. | Icons/models; charge/purity states; emission masks; socket roles; ritual placement previews; accessibility descriptions. | Shared rune and crystal families receive school/culture variants. | Core Required<br>25I-25J; Documents 09/14 |
| AP-ITM-09<br>**Culture, Trade-Good and Civic-Record Kit** | Covers signature goods, banners, permits, contracts, taxes, relief goods and settlement records. | Icons/models; labels/seals; culture motifs; legal/ownership warnings; map/Codex links. | Six culture palettes and shared document/cargo templates. | Core Required<br>25I; Documents 07/13/15 |
| AP-ITM-10<br>**Knowledge, Map, Relic and Contextual-Loot Kit** | Covers books, maps, blueprints, relic fragments, boss proof, research records and historical evidence. | Icon/portrait/map-symbol sets; readable document previews; unique-item presentation; provenance and custody cues. | Shared record/relic frames with authored signature exceptions. | Core Required<br>25I-25J; Documents 12/15/17 |
| AP-WLD-01<br>**Temperate Woodland and Forest Environment Kit** | Supports multiple connected woodland/forest foundations without a fixed tutorial forest. | Terrain palette; trees/understory; rocks/debris; ambience; weather response; wildlife evidence; map symbol family. | Species and seasonal variants inherit a common environment kit. | Core Required<br>25F-25G; Document 11 v1.0 |
| AP-WLD-02<br>**Boreal, Upland and Cold-Forest Environment Kit** | Supports colder forest/upland transitions, survival pressure and specialised resources. | Conifers; snow/frost overlays; wind response; cold ambience; route/readability props; transition rules. | Shares timber, rock and weather families with AP-WLD-01/03. | Core Required<br>25F-25G; Document 11 |
| AP-WLD-03<br>**Grassland, Heath and Agricultural-Edge Kit** | Supports open travel, settlement suitability, grazing, farming and wind-readable landscapes. | Ground palettes; grasses/shrubs; crop-edge props; wind animation; distant silhouettes; ambient insects/birds. | Density and season profiles create variants without new foundations. | Core Required<br>25F-25G; Documents 07/10/11 |
| AP-WLD-04<br>**Wetland, Fen and Mire Environment Kit** | Supports waterlogged terrain, reeds, medicine, hazards, culture adaptation and special ecology. | Wet soil; reed kits; pools; fog; insect ambience; hazard markers; boardwalk/route compatibility. | Shares water baseline and plant families; avoids full ocean simulation. | Core Required<br>25F-25G; Documents 10/11 |
| AP-WLD-05<br>**Rocky, Arid and Exposed-Land Environment Kit** | Supports dry/exposed travel, quarries, ruins, scarce water and distinct settlement choices. | Rock/scree palettes; sparse vegetation; dust/wind effects; heat/readability cues; shelter props. | Uses common stone and weather families with different density and colour control. | Core Required<br>25F-25G; Document 11 |
| AP-WLD-06<br>**River, Lake, Estuary and Coastal-Edge Environment Kit** | Supports inland water routes and bounded shoreline/coast foundations selected by 25F. | Banks, reeds, calm water, ford/ferry/bridge markers, shore debris, storm-exposure cues and simple ambience. | Must not imply waves, tides, currents, ships or underwater systems; Set 26 extends it. | Core Conditional<br>25F-25G; Document 11; Set 26C-26D |
| AP-WLD-07<br>**Cave, Mine and Underground Environment Kit** | Supports caves, extraction, underground biomes, ruins, lairs and settlement variants. | Rock strata; cave vegetation; crystals; darkness/light cues; acoustic profiles; hazard props; map symbols. | Room/terrain grammars reuse shared materials and socket templates. | Core Required<br>25F-25G; Documents 10-12 |
| AP-WLD-08<br>**Leyline, Magical and Ancient-Influence Environment Kit** | Supports mana discovery, ancient sites, magical weather and region identity. | Leyline traces; runic debris; mana glow; ambient effects/sound; corruption/blessing overlays; map/Codex cues. | Composes with ordinary biomes rather than becoming isolated colour swaps. | Core Required<br>25F-25G; Documents 09/11/12 |
| AP-WLD-09<br>**Corruption, Cleansing and Persistent-Aftermath Environment Kit** | Supports damaged, occupied, blighted, repaired and cleansed world states. | State overlays; altered vegetation; debris; ambience shifts; hazard telegraphs; restoration transitions. | Reuses state library with biome-specific mapping. | Core Required<br>25G; Documents 10-12/15 |
| AP-WLD-10<br>**Season, Weather and Regional-Ambience Kit** | Supports day/night, seasons, rain, wind, storms, heat/cold and region identity within Core technical limits. | Weather profiles; cloud/precipitation/lightning cues; ambience layers; shelter transitions; quality/LOD chains. | Set 26 owns full marine weather, waves and storm coupling. | Core Required<br>Documents 11/17/18; Forge 23 |
| AP-CIV-01<br>**Shared Humanoid and Personhood Presentation Foundation** | Provides common body, face, hands, equipment, expression and interaction roles while keeping ancestry/culture separate. | Body-plan sources; rig mappings; sockets; animation retarget profile; portrait/camera setup; accessibility descriptors. | Shared base does not erase body diversity; approved ancestry variants retain identity. | Core Required<br>Forge 22; Documents 07/13/16 |
| AP-CIV-02<br>**Human Culture Kit** | Supports the selected Human culture package without treating Humans as the default for all civilisations. | Architecture palette; clothing; tools/props; signage; banners; settlement ambience; portrait motifs. | Uses shared humanoid, structure and material kits. | Core Required<br>25F-25G; Document 13 |
| AP-CIV-03<br>**Goblin Culture Kit** | Supports Goblin personhood, settlement life, industry, trade and faction diversity beyond hostile stereotypes. | Architecture; clothing; tools; domestic props; banners; job assets; social audio/animation; Codex presentation. | Hostile factions use faction overlays, not a separate species truth. | Core Required<br>25F-25G; Documents 07/13 |
| AP-CIV-04<br>**Dwarf Culture Kit** | Supports selected Dwarf settlement, industry, craft, route and magical infrastructure identity. | Stone/metal architecture; clothing/gear; tools; signs; industry props; ambience; portrait motifs. | Builds on common stone/metal/machine kits. | Core Required<br>25F-25G; Document 13 |
| AP-CIV-05<br>**Elven Kindreds Culture Kit** | Supports selected Elven culture package, woodland/realm links and internal diversity. | Architecture; clothing; living-material motifs; tools/props; banners; social/ritual presentation. | Uses terrestrial and Verdant-compatible families without ancestry lock. | Core Required<br>25F-25G; Documents 13/14 |
| AP-CIV-06<br>**Awakened Construct Culture Kit** | Supports personhood, repair, work, law and settlement identity for constructed people. | Body shells; modular parts; expressive lights/motion; tools; architecture/charging/repair props; voice/presentation profiles. | Machine parts do not become generic loot from persons; body and item boundaries validate. | Core Required<br>25F-25G; Documents 07/10/13 |
| AP-CIV-07<br>**Six-Culture Wardrobe, Job and Equipment Overlay Kit** | Provides role-readable clothing and tools for farmer, builder, miner, guard, merchant, mage, healer, courier and related jobs. | Layered garments; job props; equipment sockets; state variants; portrait combinations; LOD rules. | Role layers combine with body and culture kits. | Core Required<br>Documents 07/13; Forge 22 |
| AP-CIV-08<br>**Settlement Stage and Civic-Service Kit** | Supports Camp through Magical Metropolis progression and branch states without one fixed village layout. | Service markers; household/work/civic modules; growth/damage/repair variants; project previews; map symbols. | Stage/state composition rather than unique complete town models. | Core Required<br>Documents 07/12/19/20 |
| AP-CIV-09<br>**Signs, Heraldry, Language and Ownership Kit** | Communicates faction, culture, law, claims, routes and public/private storage. | Banner/sign templates; emblems; seals; ownership markers; warning symbols; accessibility-safe shapes. | Text/localisation and iconography remain separable. | Core Required<br>Documents 13/15/17 |
| AP-CIV-10<br>**Trade, Market, Warehouse and Caravan Kit** | Supports physical economy, contracts, cargo, storage and route activity. | Market stalls; crates; scales; ledgers; carts/pack loads; route signs; transaction audio/animation. | Cargo types use labels and manifests rather than unique models for every item. | Core Required<br>Documents 07/08/13 |
| AP-CIV-11<br>**Agriculture, Workshop and Industry Prop Kit** | Supports farms, mills, forges, sawmills, kitchens, healers, research and machine-assisted work. | Work props; station dressing; tool racks; material piles; job sockets; loop/interaction bindings. | Props are modular and shared across structure blueprints. | Core Required<br>Documents 07/08/12 |
| AP-CIV-12<br>**Festival, Morale, Memorial and Aftermath Kit** | Supports morale, culture events, mourning, celebration, public memory and recovery. | Decorations; memorials; gathering markers; crowd/social animation cues; ambience and state variants. | Event overlays attach to existing settlements instead of requiring unique settlement copies. | Core Required<br>Documents 07/15; Settlement Needs |
| AP-STR-01<br>**Shared Modular Structure and Blueprint Kit** | Provides walls, floors, roofs, entrances, rooms, markers and sockets for procedural and authored construction. | Module sources; grid/pivot rules; material slots; doorway/room sockets; damage stages; preview thumbnails. | One grammar serves culture, settlement and adventure variants. | Core Required<br>Forge 22; Documents 12/19 |
| AP-STR-02<br>**Road, Bridge, Crossing and Route Infrastructure Kit** | Supports the twelve selected route foundations and physical connectivity. | Road surfaces; bridges; culverts; signs; waymarkers; damage/repair variants; route event sockets. | Material and culture variants reuse route geometry. | Core Required<br>25F-25G; Documents 11/12 |
| AP-STR-03<br>**Farm, Workshop, Warehouse and Industry Structure Kit** | Supports production, storage, projects and settlement economy. | Building modules; station sockets; storage/hauling markers; machine bays; construction stages; ambience hooks. | Shared modules combine with culture palettes. | Core Required<br>Documents 07/08/12 |
| AP-STR-04<br>**Defence, Gate, Wall and Watch Infrastructure Kit** | Supports settlement defence, patrols, raids, regional pressure and recovery without restoring the fixed POC watchtower. | Walls/gates/towers/traps/ward mounts; guard sockets; damage/repair states; warning/event bindings. | Generic defence modules serve many settlements and threats. | Core Required<br>Documents 07/12/16 |
| AP-STR-05<br>**Civic, Sacred, Research and Magical Structure Kit** | Supports halls, shrines, libraries, mage buildings, ritual sites and realm gates. | Room modules; ritual/ward sockets; archive props; service markers; culture variants; state transitions. | Shared civic grammar with specialised functional modules. | Core Required<br>Documents 07/09/12/14 |
| AP-STR-06<br>**Ruin, Lair and Standard Dungeon Grammar Kit** | Supports the selected ruins, lairs and dungeon families with histories, occupants and outcomes. | Room/connector modules; hazards; secrets; loot contexts; enemy sockets; damage/occupation/restoration states. | Grammar and material/state composition multiply layouts safely. | Core Required<br>25F-25G; Documents 10/12/15 |
| AP-STR-07<br>**Root-Below Megadungeon Seed-Family Kit** | Supports the bounded megadungeon foundation without requiring a second game-sized content set. | Distinct entrance/zone modules; progression/readability markers; boss/service sockets; save/LOD-safe state modules. | Reuses standard dungeon grammar; unique modules are budget-capped. | Core Conditional<br>25F-25G; Documents 12/18 |
| AP-STR-08<br>**Boss Territory, Arena and Persistent-Aftermath Kit** | Supports regional and wandering boss evidence, confrontation spaces and post-outcome changes. | Territory markers; arena modules; telegraph anchors; destructible/repairable states; proof/reward display; aftermath variants. | Shared territory evidence and arena sockets support different bosses. | Core Required<br>25G; Documents 10/12/16 |
| AP-CRE-01<br>**Creature Body-Plan, Rig and Retarget Foundation** | Defines reusable humanoid, quadruped, avian, arthropod, serpentine, construct and spirit body roles. | Body-plan records; skeletons/rigs; sockets; hit/presentation regions; retarget maps; LOD bodies; preview scenes. | Derived variants must map to an approved body plan or enter Tooling Research. | Core Required<br>Forge 22; Document 10 v1.0 |
| AP-CRE-02<br>**Small Wildlife, Ambient and Pollinator Family Kit** | Supports ambient life, clues, pollination and low-cost ecology. | Small models; lightweight rigs; idle/flight/crawl loops; calls; tracks/nest evidence; LOD/aggregation rules. | Many species derive from a few bounded body/animation families. | Core Required<br>25F-25G; Document 10 |
| AP-CRE-03<br>**Grazer, Livestock and Domestic Animal Kit** | Supports food, fibre, trade, breeding, work and village ecology. | Quadruped/body variants; locomotion; feeding/resting/fleeing; production interactions; pens/feeding props; calls. | Shared quadruped rig and behaviour animation sets. | Core Required<br>Documents 07/10 |
| AP-CRE-04<br>**Predator, Scavenger and Territorial Wildlife Kit** | Supports hunting pressure, carcass ecology, territory and player counterplay. | Models/rigs; stalking/chase/attack/flee/eat animations; tracks/den evidence; combat telegraphs; calls. | Shared predator body and state families with distinct silhouettes. | Core Required<br>Document 10 |
| AP-CRE-05<br>**Burrowing, Cave and Arthropod Threat Kit** | Supports underground/cave pressure, nests, resources and hazards. | Arthropod/burrower bodies; climb/crawl/attack; nest props; web/chitin effects; acoustic cues; LOD. | Complex free-burrowing remains conditional; bounded tunnels/markers are supported. | Core Required<br>Documents 10-12 |
| AP-CRE-06<br>**Humanoid Faction Combatant and Raider Kit** | Supports intelligent hostile/neutral faction members without tying hostility to ancestry. | Humanoid combat animations; equipment sets; banners; patrol/camp props; surrender/flee/capture states; voice/event hooks. | Uses personhood/culture kits plus faction overlays. | Core Required<br>Documents 10/13/16 |
| AP-CRE-07<br>**Spirit, Elemental and Magical-Creature Kit** | Supports wisps, spirits, elementals and magic-linked ecology. | Voxel forms; rigs or procedural motion; emission/VFX; calls; interaction sockets; readable state changes. | Approved motion/effect templates prevent uncontrolled bespoke simulation. | Core Required<br>Documents 09/10 |
| AP-CRE-08<br>**Construct, Golem and Machine-Creature Kit** | Supports non-person constructs, personhood-safe Awakened variants and bounded labour/combat constructs. | Modular bodies; rig roles; power/core sockets; work/combat animations; damage/repair states; machine audio. | Personhood flag changes loot, damage and presentation handling. | Core Required<br>Documents 08/10/13 |
| AP-CRE-09<br>**Creature Interaction, Harvest, Taming and Evidence Kit** | Supports tracks, nests, feeding, handling, ethical harvest and Codex discovery. | Interaction animations; evidence props; body regions; tool sockets; welfare/readability cues; non-lethal outcome presentation. | Shared interaction library applies across eligible body plans. | Core Required<br>Document 10; 25J provenance |
| AP-CRE-10<br>**Unique Boss and Realm-Authority Production Kit** | Supports eight Overworld bosses and three realm authorities with distinctive silhouettes, telegraphs and aftermath. | Unique models or bounded signature modules; phase animations; telegraph sockets; audio/VFX profiles; arena/territory evidence; defeat/alternate-outcome states. | Shared mechanic/effect modules may be reused, but each boss retains signature identity. | Core Conditional<br>25F-25G; Documents 10/14/16 |
| AP-AUT-01<br>**Mechanical Power and Motion Animation Kit** | Supports cranks, shafts, wheels, wind/water/fuel interfaces and moving machine parts. | Loop animations; phase continuity; pivots; power-flow indicators; start/stop/blocked states; sound/VFX bindings. | Shared motion modules attach to machine families. | Core Required<br>Document 08; Forge 21/23 |
| AP-AUT-02<br>**Logistics, Sorting and Visible-Flow Kit** | Supports chutes, carts, storage transfer, filters and readable bottlenecks. | Moving-item proxies; path anchors; filter indicators; jam/overflow states; aggregation/LOD profiles. | Uses item icons/proxies rather than full item models at distance. | Core Required<br>Document 08; Document 18 v1.0 |
| AP-AUT-03<br>**Processing, Heat, Smoke and Maintenance Kit** | Supports furnaces, forges, mills, crushers, kitchens and repairable machines. | Active/idle/blocked/damaged loops; heat/smoke/spark effects; maintenance sockets; warning audio; surface states. | Material and machine-class families share profiles. | Core Required<br>Documents 05/08; Forge 23 |
| AP-AUT-04<br>**Mana Flow, Battery, Conduit and Ward Presentation Kit** | Supports practical magical infrastructure and settlement defence. | Flow paths; charge indicators; pulse/overload/blocked states; ward boundaries; critical warning equivalents. | Culture/realm variants inherit core logic and budgets. | Core Required<br>Documents 08/09; Forge 23 |
| AP-AUT-05<br>**Spell, Ritual and Enchantment Presentation Kit** | Supports selected utility/combat spells, research, rituals and item/block enchantment states. | Cast/release/impact profiles; focus sockets; ritual volumes; persistent surface states; accessibility alternatives. | Effect families are parameterised by element/school/context. | Core Required<br>Document 09; Forge 23 |
| AP-AUT-06<br>**Realm Gate, Transition and Safe-Return Presentation Kit** | Supports portal discovery, stabilisation, entry, return, rescue and failure states. | Gate models/anchors; transition VFX/audio; warning/UI cues; destination/return state evidence; loading/authority handoff hooks. | Set 26 may extend to maritime routes without changing base gate identity. | Core Conditional<br>Documents 09/14/18 |
| AP-REALM-01<br>**Verdant Covenant Environment and Seasonal-State Pack** | Supports the fully playable realm landscape, transitions, weather, growth, blight and cleansing. | Realm palette/materials; vegetation; terrain features; ambience; seasonal state variants; map/Codex presentation. | Reuses terrestrial kits with bounded signature families. | Core Conditional<br>25F-25J; Documents 11/14 |
| AP-REALM-02<br>**Verdant Covenant Culture, Settlement and Structure Pack** | Supports Verdant Pact enclaves, native services, architecture, routes and diplomacy. | Culture/structure kit; props; clothing; banners; ritual/ward modules; damage/restoration states. | Uses shared civilisation/structure grammars with realm motifs. | Core Conditional<br>25F-25G; Documents 07/12-14 |
| AP-REALM-03<br>**Verdant Covenant Creature, Boss and Animation Pack** | Supports five native creature foundations, bounded derived variants and three realm authorities. | Bodies/variants; animations; calls; effects; territory evidence; authority telegraphs; aftermath assets. | Must remain within approved shared body/animation budgets. | Core Conditional<br>25F-25G; Document 10/14 |
| AP-REALM-04<br>**Verdant Covenant Resource, Item and Overworld-Use Pack** | Supports living materials, realm goods, route supplies and visible Overworld utility. | Block/item forms; icons/models; growth/charge states; recipe/structure previews; provenance cues. | Uses 25H-25J conditional families and chain contracts. | Core Conditional<br>25H-25J; Documents 03-06/14 |
| AP-TEASER-01<br>**Ancestral Veil Safe-Threshold Environment Pack** | Provides a bounded, safe, non-farmable threshold presentation only. | Threshold environment; route/return markers; limited ambience; safety warnings; no full realm ecology or production assets. | May reuse abstract/spirit presentation; no gameplay promise beyond approved teaser. | Teaser Only<br>25F-25G; Document 14 |
| AP-TEASER-02<br>**Ancestral Veil Evidence, Knowledge and UI Pack** | Supports Codex, journal, map, testimony and one-time threshold evidence. | Symbols; document/knowledge presentation; route-state icons; accessibility descriptions; no repeatable resource reward. | Uses shared knowledge and realm UI frames. | Teaser Only<br>25I-25J; Documents 15/17 |
| AP-UI-01<br>**Core HUD, Inventory, Crafting and System-Status Icon Pack** | Supports health/stamina/mana/survival, inventory, recipes, machine states, settlement needs and warnings. | Icon masters; generated family bindings; state frames; target-size tests; non-colour distinctions; controller/touch variants. | One icon system serves multiple screens and knowledge levels. | Core Required<br>Document 17 v1.0; Forge 23H |
| AP-UI-02<br>**Map, Codex, Journal, History and World-State Presentation Pack** | Supports discovery, uncertainty, routes, sites, cultures, ecology, bosses, realms and persistent aftermath. | Map symbols; Codex portraits; diagrams; history/event markers; uncertainty states; provenance/custody views. | Symbols derive from foundation families and remain readable without colour. | Core Required<br>Documents 15/17 |
| AP-UI-03<br>**Accessibility Equivalent-Cue and Comfort Pack** | Ensures critical information survives reduced motion/flash, colour-blindness, hearing differences and control constraints. | Caption families; directional indicators; shape/motion alternatives; haptic hooks; reduced-effect profiles; test evidence. | Attached to presentation profiles, not duplicated as optional afterthoughts. | Core Required<br>25E; Forge 23; Document 17 |
| AP-UI-04<br>**Core Audio, VFX, Ambience and Presentation Foundation Pack** | Provides the minimum complete presentation library for Core Production without requiring every final dedicated tool before integration. | Material response; impacts; footsteps; machine/magic loops; creature calls; weather/ambience; critical warnings; presentation profiles and tests. | Uses Forge 23 contracts and may begin with validated external authoring/import workflows. | Core Required<br>Forge 23A-23J; Documents 03-18 |

# Appendix B. Universal Asset Requirement Manifest Template

```text
AssetRequirementManifest
{
    asset_requirement_id
    schema_version
    owner_definition_ids[]
    owner_package_id
    source_document_ids[]
    milestone_tier
    lifecycle_status

    asset_class
    requirement_level
    criticality
    authored_generated_or_derived
    signature_identity

    parent_asset_family_id
    variant_of
    allowed_overrides[]
    material_slot_ids[]
    body_plan_id
    rig_id

    required_source_records[]
    forge_project_uri
    source_hashes[]
    export_profile_id
    provenance_and_rights
    AI_assistance_state

    model_or_voxel_requirements
    texture_material_requirements
    icon_snapshot_requirements
    rig_animation_requirements
    spatial_anchor_requirements[]
    presentation_event_contracts[]
    presentation_profile_ids[]
    accessibility_profile_ids[]

    budget_profile_id
    LOD_quality_chain[]
    aggregation_virtualisation_policy
    density_and_streaming_class
    save_and_authority_relevance

    runtime_product_ids[]
    generated_build_signature
    validation_test_ids[]
    evidence_ids[]

    approved_fallback_id
    missing_pack_policy
    aliases[]
    deprecated_by
    migration_ids[]
    rollback_reference
}
```

# Appendix C. Core Production Budget Envelope Register

| Budget Area | Recommended Envelope | Interpretation |
| --- | --- | --- |
| Source-derived gameplay family links | 217 block-family contracts; 296 item-family contracts; 105 chain contracts; 214 selected Atlas foundations. | Every selected family receives a manifest link; these are not equal to unique authored assets. |
| Asset package contracts | 86 total: 74 Core Required, 10 Core Conditional, 2 Teaser Only. | Package count is a planning result, not an asset quota. |
| Surface/material masters | 72-96 production masters. | Shared across terrain, construction, items, structures, creatures and effects. |
| State overlays and masks | 24-36 overlays plus 18-30 state masks. | Damage, wetness, frost, scorch, growth, corruption, cleansing, power and occupancy. |
| Animated material/surface sets | 12-20 sets. | Water baseline, mana flow, growth, heat, corruption and selected realm states. |
| Voxel shape/mesh templates | 28-40 reusable templates. | Generate eligible block shapes and modular structure pieces. |
| Block-family manifest bindings | 217 required bindings. | Most use generated shapes/material composition; signature functional blocks may require bespoke models. |
| Item-family icon bindings | 296 required bindings. | Approximately 140-190 authored icon masters; remaining bindings generated or derived where readability passes. |
| Non-block held/ground/placed item models | 56-84 reusable models or modular assemblies. | Tools, weapons, foci, containers, machine parts, relics and signature goods. |
| Culture presentation kits | 6 complete kits. | Architecture palette, clothing/props, signage/heraldry, ambience and settlement usage. |
| Structure and route modular kits | 18-26 kits, approximately 120-180 reusable modules. | Must cover 45 structure and 12 route foundations without one bespoke model per structure. |
| Creature foundation bindings | 49 creature foundations plus approved derived variants. | 44 Overworld and 5 Verdant native foundations; definitions may share body plans/rigs. |
| Body-plan and rig masters | 16-22 body plans; 12-18 production rigs. | Humanoid, quadruped, avian, arthropod, serpentine, construct, spirit and signature exceptions. |
| Animation state families | 36-54 reusable families, approximately 220-360 authored clips. | Locomotion, jobs, interactions, combat, damage, death, social, creature and machine motion. |
| Boss/realm-authority signature packages | 8-11 packages. | Distinct silhouette, telegraphs, territory evidence, audio/VFX and aftermath; reuse mechanic modules where coherent. |
| VFX definitions/templates | 220-320 Core baseline definitions. | Includes material contacts, machines, weather, magic, creatures, bosses, states and realm presentation. |
| Sound Events | 360-540 Core baseline events. | Includes material, item, machine, magic, creature, settlement, biome, UI and warning families. |
| Audio source clips/support layers | 900-1,600 approved sources/layers. | Planning envelope subject to actual reuse, recording access, licensing and runtime mixing needs. |
| Presentation profiles/bindings | 180-280 profiles plus contract bindings. | Combine audio, VFX, light, surface, UI and accessibility equivalents. |
| Ambience/acoustic profiles | 40-64 ambience components; 18-28 acoustic/portal profiles. | Biome, cave, settlement, structure, realm and weather coverage. |
| UI/icon/map/Codex authored masters | 180-260 masters plus generated bindings. | Inventory, status, map, Codex, journal, warning and provenance/custody presentation. |
| Accessibility/equivalent-cue profiles | 36-60 profiles. | Critical warnings, combat, navigation, machine, magic, event and realm cues. |
| Golden/regression scenarios | 32-48 scenarios. | Representative source rebuild, LOD, accessibility, dense scene, migration and packaged-build checks. |
| Numeric memory/storage/build-size budgets | Deferred to Document 18 v1.0 hardware targets. | 25K requires every asset to declare a class; it does not invent unapproved MB limits. |

# Appendix D. Presentation Event Contract Register

| Contract | Purpose | Required Context | Presentation Obligation |
| --- | --- | --- | --- |
| EV-BLOCK-CONTACT | Contact, footstep, scrape, slide and land against a declared material/surface. | Material, action, intensity, actor/foot/tool, wetness, environment and spatial contact. | Audio + VFX + surface response; critical only where gameplay-relevant. |
| EV-BLOCK-HARVEST | Mine, chop, dig, cut, harvest and progress/failure stages. | Tool capability, block family/state, progress, grade, impact point and authority result. | Impact, debris, sound, crack/state update and accessibility cue. |
| EV-BLOCK-PLACE-REMOVE | Place, rotate, configure, remove and invalid-placement result. | Block/item ID, orientation, support, owner, success/failure and socket context. | Placement/removal profile, UI cue and state evidence. |
| EV-BLOCK-DAMAGE-STATE | Damage, burn, freeze, wet, corrupt, cleanse, power and repair transitions. | Old/new state, cause, severity, owner and persistence. | State overlay, effect/audio, warning and journal/history when important. |
| EV-ITEM-EQUIP-USE | Equip, swing, fire/release, consume, read, activate and fail. | Item family/instance state, hand/socket, action, target, quality and authority result. | Model/animation/audio/VFX/UI profile. |
| EV-ITEM-REPAIR-CHARGE | Repair, maintain, refill, recharge, enchant and break. | Condition/charge before/after, material, station/tool, owner and result. | State update, effect, sound and explanation. |
| EV-ACTOR-MOVEMENT | Walk, run, jump, land, climb, crouch, crawl and approved traversal contacts. | Body plan, locomotion state, surface, speed, burden and environment. | Animation + contact + camera/haptic/accessibility profile. |
| EV-NPC-WORK-SOCIAL | Work action, carry, build, trade, teach, heal, socialise, celebrate and mourn. | Role, tool, target, culture, schedule, relationship and outcome. | Animation, props, voice/foley, UI/Codex and crowd aggregation. |
| EV-NPC-ALERT-COMBAT | Notice, warn, flee, defend, surrender, capture, wound and death. | Faction/relationship, threat, morale, target and authority. | Telegraph, voice, animation, UI and persistent aftermath cue. |
| EV-CREATURE-ECOLOGY | Feed, nest, migrate, hunt, flee, mate, sleep, leave tracks and interact with habitat. | Species/body family, habitat, state, target and simulation detail. | Animation/audio/evidence props; aggregate at distance. |
| EV-CREATURE-COMBAT | Telegraph, attack, hit, stagger, status, defeat and alternate resolution. | Creature, ability, phase, target, impact and outcome. | Animation, VFX, sound, camera/haptic and accessibility equivalents. |
| EV-MACHINE-LIFECYCLE | Start, idle, loop, process, stop, blocked, jammed, overloaded, damaged and maintained. | Machine ID, recipe/state, power, throughput, ports, risk and owner. | Motion, audio/VFX, indicators and UI warnings; phase continuity required. |
| EV-LOGISTICS-FLOW | Item enters, exits, transfers, spills, reroutes or jams. | Item proxy, quantity class, path, port, owner and simulation LOD. | Visible proxy/path effect/audio; aggregate fallback. |
| EV-MAGIC-CAST-FLOW | Charge, cast, release, impact, channel, ward pulse, ritual phase and fail. | School/effect, source, target, mana/purity, risk, sockets/path and authority. | Animation, VFX, audio, surface/light and equivalent cue. |
| EV-PORTAL-REALM | Discover, stabilise, open, enter, arrive, return, rescue and close. | Route/realm IDs, state, participants, destination certainty and authority handoff. | Gate/transition presentation, UI warning and save/migration evidence. |
| EV-STRUCTURE-PROJECT | Plan, supply, construct stage, pause, complete, damage, restore, claim and abandon. | Blueprint/project, stage, resources, workers, owner and world state. | Visible construction/state, audio/VFX, map/journal update. |
| EV-WEATHER-ENVIRONMENT | Rain, wind, thunder, heat/cold, fog, season and environmental hazard change. | Region/biome, intensity, shelter, time, player settings and LOD. | Weather/ambience/surface response and comfort fallback. |
| EV-QUEST-EVENT-WORLDSTATE | Objective update, discovery, warning, consequence, route change and outcome. | Event ID, participants, uncertainty, contribution, severity and persistence. | Journal/map/UI, world evidence and optional audio/VFX. |
| EV-BOSS-PHASE-AFTERMATH | Territory warning, phase change, critical attack, defeat/retreat/pact and aftermath. | Boss instance, phase/outcome, contributors, territory and world state. | Protected telegraph, presentation, proof/reward and region-state change. |
| EV-UI-SYSTEM | Confirm, deny, error, discover, unlock, save, migrate, missing-content and accessibility notice. | UI context, severity, action result, input device and local settings. | Visual/audio/haptic/caption profile; no decorative-only blocking cue. |

# Appendix E. Spatial Anchor and Socket Role Register

| Role Family | Examples | Boundary |
| --- | --- | --- |
| Spatial Block Roles | block.center, face.*, edge.*, corner.*, surface_mask.*, state_volume, emission_origin, contact_point. | Raw coordinates may be generated, but authored bindings use semantic roles. |
| Item and Tool Roles | grip.main, grip.off, tool.head, blade.edge, release.origin, focus.core, container.opening, attachment.*. | Required mappings vary by item class; missing critical roles block Asset Ready. |
| Humanoid Body Roles | root, pelvis, chest, head, eyes, mouth, hand.*, foot.*, back, waist, weapon.*, carry.*, status.*. | Body-plan variants provide remaps and mirrored roles. |
| Creature Body Roles | root, core, head, mouth, horn.*, claw.*, wing.*, foot.*, tail.*, shell.*, effect.*, evidence.*. | Not gameplay hitboxes unless separately bound by combat data. |
| Machine Roles | input.*, output.*, power.*, mana.*, moving.*, maintenance.*, hazard.*, exhaust.*, ui_indicator.*. | Ports and moving parts map to gameplay interfaces by stable role. |
| Structure and Blueprint Roles | entrance.*, room.*, job.*, storage.*, defence.*, banner.*, light.*, damage.*, loot_context.*, event.*. | Room/structure grammars can generate repeated socket instances. |
| Route and Network Roles | path.start/end, waypoint.*, junction.*, crossing.*, delivery.*, patrol.*, ambience_zone.*. | Supports movement, effects, audio and event placement. |
| Portal and Realm Roles | threshold, source_anchor, destination_anchor, return_anchor, rescue_anchor, warning_zone, transition_path. | Safe-return mappings are mandatory before Integration. |
| UI and Camera Roles | icon_camera, portrait_camera, preview_light.*, tooltip_focus, comparison_origin. | Used by generated snapshots and inspection UI. |
| Temporary Runtime Roles | impact_contact, projectile_hit, foot_contact, spill_origin, dynamic_path_point, local_listener. | Generated state is saved only where persistence requires it. |

# Appendix F. Asset Quality, LOD and Accessibility Profiles

| Profile | Typical Use | Required Behaviour |
| --- | --- | --- |
| AQ-0 Metadata Only | No runtime visual/audio cost; registry, localisation or evidence only. | Always resident if required by UI/validation. |
| AQ-1 Micro/Common | Tiny icon, simple prop, contact effect or short one-shot. | Aggressive batching/pooling; full -> reduced -> hidden where decorative. |
| AQ-2 Standard Interactive | Common block/item/entity/loop visible near player. | Full -> reduced -> minimal; retains state/readability. |
| AQ-3 Persistent Local | Machine loop, settlement ambience, persistent surface or interactive structure. | Aggregation/virtualisation and phase continuity mandatory. |
| AQ-4 Major Encounter | Large creature, dungeon event, storm, ritual or regional structure state. | Capped concurrency; protected telegraphs; reduced fallback. |
| AQ-5 Critical/Boss/Realm | Boss, realm transition, critical warning or signature realm presentation. | Distinctive budget allowed; critical cue survives all quality levels. |
| AQ-6 Research/Unbounded | Concept requires unproven renderer, simulation, rig, audio or network cost. | Tooling Research; cannot enter milestone without profiling and redesign gate. |

# Appendix G. Forge Intake and Source-Control Checklist

- Approved asset requirement ID, owner definitions, package, status and source documents.
- Existing family search completed and new-source justification recorded.
- Editable source project exists under approved version control/large-file workflow.
- Scale, pivots, material slots, sockets, regions, paths and LOD mappings validate.
- Rig, animation events and retarget profile validate where applicable.
- Icons/snapshots pass target-size and state readability checks.
- Audio/VFX source, family, budget, criticality and accessibility equivalents validate.
- Provenance, rights, AI assistance, attribution and transformation history are complete.
- Export/import is reproducible and generated runtime products are not the only editable copy.
- Required scenarios, packaged build and migration/rollback evidence are attached.

# Appendix H. Set 26 Major-Expansion Asset Admission Checklist

- Set 26 owner document and package identity are approved.
- Maritime asset requirements use 25B IDs and 25K manifest fields rather than new parallel governance.
- Base assets are referenced or extended without duplicate field ownership.
- Water, vessel, local-space, port, crew, fleet, combat, ecology and UI packages declare incremental source and runtime cost.
- Moving-vessel interiors declare local/world-space anchors, LOD, save and authority relevance.
- Missing expansion, removal, reinstallation and migration behaviour are tested.
- Critical naval/marine warnings have accessibility equivalents.
- Performance classes cover dense ports, fleets, storms, flooding/fire, marine ecology and multiplayer moving interiors.
- Main-document and Forge amendment map is approved.
- No Set 25 closure claim is made while blocker-level Set 26 asset dependencies remain unresolved.

# Appendix I. Document 25K Acceptance Criteria

- Every 25F/25G selected package has a production asset package or approved shared fallback.
- All 217 block-family and 296 item-family contracts have manifest coverage paths.
- Asset source, runtime product, gameplay definition, presentation binding and evidence ownership are separated.
- Recommended envelopes are identified as recommendations rather than approved quotas.
- Reuse, derived variants and signature exceptions are governed and testable.
- Animation, socket, event, audio/VFX, icon/UI and accessibility contracts are complete enough for Forge and Document 18 handoff.
- Verdant Covenant is asset-complete on paper; Ancestral Veil remains teaser-bounded.
- Set 26 admission is explicit without duplicating maritime design.
- Asset Ready and release gates include provenance, LOD, accessibility, migration, packaging and POC-leak checks.
- 25L receives a bounded package register, batch order, risks and unresolved conditional work.

# Navigation

- Previous: [[25J - Resource, Loot, Provenance, Progression and Recipe-Chain Matrix]]
- Next: [[25L - Production Backlog, Summer Engine Task Contract and Source-of-Truth Integrity Audit]]
- Related: [[21A-21G - Voxel Asset Forge]]; [[22A-22L - Entity and Blueprint Forge]]; [[23A-23J - Presentation Forge]]; [[26A-26O - Maritime and Naval Expansion]]
