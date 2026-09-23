# LEYFORGE PRODUCTION PROGRAMME

## PROD-04 — The Forge Engineering & Creation Journey Architecture

**Document ID:** PROD-04  
**Title:** Leyforge Forge Engineering & Creation Journey Architecture  
**Version:** v0.1  
**Date:** 21 September 2026  
**Status:** **DRAFT FOR OWNER REVIEW — FORGE ARCHITECTURE CANDIDATE**  
**Project:** Leyforge  
**Product context:** Ley Realms / The Forge  
**Programme:** PROD — Detailed Production Plan & Implementation Handoff  
**Constitutional parent:** PROD-00 — Production Constitution, Authority & Scope  
**Source-routing parent:** PROD-01 — Legacy Canon & Source Crosswalk  
**Roadmap parent:** PROD-02 — Master Production Roadmap & Dependency Atlas  
**Runtime parent:** PROD-03 — Leyforge Runtime Engineering Architecture  
**Primary Forge baselines:** Document Set 21A–21G; Document Set 22A–22L; applicable Document 19/20 settlement creator constraints; Set 26 Vessel Forge authority; Sets 24–30 specialist content/system authority  
**Primary production baselines:** ART-00 through ART-10, especially ART-09 source-to-bake execution and ART-10 certification  
**Primary downstream consumers:** PROD-05 through PROD-17, ProductionRegistry, Project Brain, Codex/coding agents, asset/content production, player creator tools, package/mod runtime and collaborative Forge work

---

# 00. Executive Forge Statement

The Forge is not a collection of unrelated editors.

The Forge is Leyforge's **authoring operating system**.

Its job is to transform authorised intent into editable, versioned, semantically-valid source records that Leyforge understands, validate those records against canon and engineering contracts, bake reproducible runtime products, test them in the real game, and package them for controlled use.

The governing promise is:

> **The Forge should not merely create assets. It should create things Leyforge can understand.**

The architectural consequence is:

> **Specialist Forge workflows orchestrate shared Forge services instead of duplicating them.**

Creature Forge does not contain a private animation editor, private sound editor and private VFX editor.

Vessel Forge does not implement a second block/material system.

Realm Forge does not contain its own secret World Forge, Biome Forge, Creature Forge and Sound Forge.

Instead:

```text
SPECIALIST WORKFLOW
      │
      ├── Identity / Registry Service
      ├── Model / Voxel Service
      ├── Material Service
      ├── Rig / Animation Service
      ├── VFX / Lighting Service
      ├── Sound / Music Service
      ├── Structure / Composition Service
      ├── Signal / Logic Service
      ├── Capture Service
      ├── Validation Service
      ├── Test Laboratory
      └── Bake / Package Service
```

A specialist workflow owns:

- the domain-specific questions;
- the creation order;
- required stages;
- allowed capabilities;
- required semantic markers;
- domain-specific validation;
- production-ready definition.

Shared services own the actual reusable authoring machinery.

This architecture is what makes a future request such as:

> “Create a Flux-powered voxel pipe organ.”

possible without implementing a bespoke `PipeOrganEditor`.

The organ is composed from already-understood blocks, structure semantics, machine parts, signals, Flux, sound, music, animation, lighting and validation.

---

# 01. Scope

PROD-04 owns production architecture for:

- Forge Core;
- Forge workspace shell;
- Forge project/content browser;
- source identity and manifest handling;
- editable source records;
- Creation Journey Engine;
- specialist workspace registration;
- shared authoring services;
- source → validation → bake → runtime pipeline;
- dependency/composition graph;
- inheritance and variants;
- Forge runtime adapters;
- Test Laboratory;
- live playtest;
- hot reload;
- capture/thumbnail production;
- validation architecture;
- production-readiness state;
- source/revision comparison;
- provenance/work records;
- developer authority;
- player creator authority;
- package/content-pack creation;
- runtime package compatibility;
- mod/community-content boundary;
- collaborative Forge readiness;
- later AI access boundary.

PROD-04 does **not** own:

- gameplay rules invented solely to make an asset work;
- canonical world/content definitions already owned by FCC/system documents;
- final ART direction;
- runtime simulation implementation owned by PROD-03;
- universal semantic primitives owned by PROD-05;
- task/approval evidence law owned by PROD-06;
- detailed individual P-slice implementation contracts;
- unrestricted public scripting/mod execution.

---

# 02. Source-of-Truth Hierarchy

The Forge respects the following production hierarchy:

```text
CANON / PRODUCT AUTHORITY
what the thing means
        ↓
ART / PRESENTATION AUTHORITY
how that meaning should be presented
        ↓
FORGE SOURCE
editable authored implementation
        ↓
VALIDATION
semantic / technical / art / performance checks
        ↓
BAKE
reproducible runtime products
        ↓
RUNTIME REGISTRATION
stable identity → runtime representation
        ↓
LEY REALMS
live use in the game
```

Editable Forge source and canonical registry bindings are the production source of truth for Forge-supported content classes.

Generated products are disposable/rebuildable unless a later authority explicitly classifies one otherwise.

Examples of generated products include:

- meshes;
- collision;
- baked textures;
- runtime Resources;
- animation products;
- VFX products;
- icon captures;
- thumbnails;
- preview renders;
- cached dependency products;
- runtime lookup tables;
- generated scenes;
- compact manifests.

A generated scene must not become the only place where an object's semantic markers exist.

---

# 03. Forge Core Principles

## 03.1 Canon before convenience

The Forge may make creation easy.

It may not make canon optional.

A convenient authoring shortcut must eventually resolve to:

- valid stable identity;
- valid semantic source;
- valid dependencies;
- valid runtime contract.

## 03.2 One canonical thing, multiple presentations

Presentation needs do not create duplicate gameplay identities.

A canonical block may have:

- placed presentation;
- held presentation;
- dropped presentation;
- inventory icon;
- damage state;
- blueprint preview.

Those are representations of one canonical identity where the content semantics say the thing remains the same thing.

If breaking a block canonically transforms it into a different item, that transformed identity may be separate.

The Forge follows the current single-definition rule rather than reproducing historical duplicate block/item modelling where later canon supersedes it.

## 03.3 Source is editable

Every Forge-supported production object should have an editable source form.

The exact serialization may use:

- Godot Resources;
- structured text;
- project data;
- dedicated Forge source files;
- composition graphs;

but the format must be:

- versioned;
- identifiable;
- inspectable;
- migratable;
- reproducibly bakeable.

## 03.4 Runtime products are derivatives

If a runtime product is damaged or deleted, Forge should be able to rebuild it from authorised source and dependencies.

## 03.5 No hidden local canon

A specialist Forge may not invent a private material, block, port type, magic rule, anatomy category or gameplay tag merely because the editor needs one.

Missing semantic capability routes to the owning authority.

## 03.6 Guided, not restrictive

The Forge guides creation through the correct dependency order.

Advanced developers may navigate non-linearly.

Guidance does not mean forcing every creator through a fixed wizard one screen at a time.

## 03.7 Composition over bespoke code

Whenever possible, complex content is created by composing existing capabilities.

The more of Leyforge that can be expressed through known components, sockets, signals, states, routes and transactions, the more powerful the Forge becomes.

---

# 04. Forge Workspace Architecture

The Forge is one application/workspace with registered specialist environments.

The base shell provides:

- project/content browser;
- global search;
- recent items;
- favourites;
- tabs/workspaces;
- inspector;
- viewport;
- hierarchy/outliner;
- dependency panel;
- validation panel;
- task/journey panel;
- revision/history panel;
- Test Laboratory launch;
- capture tools;
- package tools;
- context help;
- diagnostics;
- permissions/authority indicators.

A creator should be able to navigate a dependency directly.

Example:

```text
Creature
  ↓ references
Animation Set
  ↓ references
Footstep Event Profile
  ↓ references
Material Sound Family
```

Selecting the dependency opens the relevant specialist workspace without exporting/importing manually.

---

# 05. Forge Workspace State

Forge workspace state is separate from canonical source.

Examples:

- panel layout;
- viewport camera;
- open tabs;
- favourite filters;
- local selection;
- unsaved inspector expansion;
- temporary gizmo state.

These may be saved as user/editor preferences.

They do not become gameplay content.

---

# 06. Forge Project Browser

The browser resolves content by semantic identity and source type.

Primary capabilities:

- search by name;
- stable ID;
- tags;
- family;
- domain;
- status;
- package;
- dependency;
- author;
- validation state;
- production-ready state.

Filters should distinguish:

- canonical base content;
- development content;
- player/community content;
- package overrides;
- deprecated content;
- test fixtures;
- generated products.

The browser must never visually collapse source and generated output into one ambiguous file list.

---

# 07. Forge Source Record

Every Forge-supported source record should conceptually contain:

```text
SourceHeader
- stable identity / source identity
- source schema version
- content class
- package / namespace
- parent / inheritance source
- source provenance
- author / generator
- creation timestamp
- last modified revision
- authority class
- validation state
- production-ready state
- dependency references
```

Domain-specific source data follows the shared header.

Exact serialization is an implementation detail.

---

# 08. Source Identity vs Gameplay Identity

Not every Forge source is itself a gameplay identity.

Examples:

- animation clip source;
- capture profile;
- palette role set;
- rig template;
- material family;
- dungeon room module;
- worldgen rule set.

The source graph may contain authoring-only identities that ultimately contribute to one or more canonical runtime definitions.

The Forge must therefore distinguish:

- canonical gameplay identity;
- authoring source identity;
- reusable library identity;
- generated product identity;
- runtime handle.

---

# 09. Specialist Forge Registry

Specialist workspaces register themselves with Forge Core.

A `ForgeWorkspaceDescriptor` conceptually includes:

```text
workspace_id
display_name
content_classes
required_permissions
journey_profile
shared_services_used
domain_validators
preview_modes
runtime_test_modes
bake_targets
package_capabilities
```

This permits later Forge families to plug into the same shell without forking the application.

---

# 10. Creation Journey Engine

The Creation Journey Engine is a shared orchestration service.

Its purpose is to answer:

> **What does someone need to do to turn this idea into a complete, valid Leyforge thing?**

A journey consists of ordered/branching stages.

Each stage may define:

- purpose;
- required inputs;
- prerequisite stages;
- optional stages;
- shared services to open;
- domain-specific workspace;
- required outputs;
- automatic checks;
- human-review checks;
- completion state;
- blocking issues;
- suggested next stage.

The journey engine tracks **semantic completeness**, not merely whether a screen was visited.

---

# 11. Journey Stage States

Recommended stage states:

- `NOT_STARTED`
- `AVAILABLE`
- `ACTIVE`
- `BLOCKED`
- `PARTIAL`
- `VALID`
- `COMPLETE`
- `REVIEW_REQUIRED`
- `INVALIDATED`

A completed stage may become `INVALIDATED` if an upstream dependency changes.

Example:

Changing creature body topology may invalidate:

- rig;
- animation coverage;
- equipment fit;
- hit regions;
- capture products.

---

# 12. Guided and Expert Modes

## 12.1 Guided mode

Guided mode emphasises:

- next recommended step;
- contextual explanations;
- examples;
- required/optional distinction;
- incomplete dependency warnings;
- limited advanced controls;
- safe defaults.

## 12.2 Expert mode

Expert mode permits:

- direct workspace navigation;
- multi-panel editing;
- dependency graph navigation;
- advanced properties;
- batch editing;
- scripting of approved Forge operations where permitted internally;
- bulk validation.

Both modes edit the same underlying source schema.

Guided mode is not a different, simplified content format.

---

# 13. Generic Creation Journey Spine

Most specialist journeys should map onto this common conceptual spine:

1. **Identity**
2. **Form**
3. **Materials**
4. **Functional anatomy / semantic parts**
5. **Rig / moving parts**
6. **Animation**
7. **VFX / lighting**
8. **Audio / music**
9. **Behaviour / function**
10. **States / variants**
11. **UI / icon / thumbnail products**
12. **Validation**
13. **Test Laboratory**
14. **Bake**
15. **Package / register**
16. **Production Ready**

Not every content class uses every stage.

A block has no skeleton.

A biome does not require equipment fit.

A music track may not need a model.

The journey engine therefore expresses reusable stage types with domain-specific profiles.

---

# 14. Example — Creature Journey

```text
Identity
→ body plan
→ voxel/model form
→ materials
→ anatomy / semantic regions
→ rig
→ required locomotion animations
→ behaviour capability profile
→ combat markers
→ ecology/habitat
→ VFX/audio event mapping
→ equipment compatibility if applicable
→ states/variants
→ capture/icon products
→ validation
→ controlled Test Lab encounter
→ bake/register
→ Production Ready
```

Creature Forge orchestrates:

- Model/Voxel Forge;
- Material Forge;
- Rig Forge;
- Animation Forge;
- Behaviour tools;
- VFX Forge;
- Sound Forge;
- Capture Studio;
- validators;
- Test Lab.

Creature Forge does not independently reimplement those systems.

---

# 15. Example — Vessel Journey

```text
Identity / class / purpose
→ hull envelope
→ canonical construction materials/components
→ structural roles
→ decks / compartments
→ access / hatches / ladders
→ propulsion
→ steering
→ cargo
→ crew stations
→ power / Flux / signal ports
→ equipment / weapons if allowed
→ rigging / sails
→ animation / VFX / audio
→ damage / fire / flood states
→ buoyancy / stability validation
→ Sea Trial
→ bake/register
→ Production Ready
```

The vessel source references canonical block/component definitions.

Vessel Forge may not create `ship_oak_plank` simply to avoid using `oak_plank` if canon says the same plank is being used.

---

# 16. Example — Realm Journey

Realm Forge is primarily an orchestration/composition workflow.

```text
Realm identity
→ physical/world-law profile
→ topology
→ World Forge configuration
→ biome library
→ geology/material families
→ hydrology/fluid profile
→ ecology
→ hazards
→ resources
→ cultures/factions
→ structures/dungeons
→ audio/music atmosphere
→ VFX/lighting atmosphere
→ portal
→ progression/discovery
→ worldgen statistical validation
→ realm Test World
→ package/register
→ Production Ready
```

Realm Forge calls existing services rather than duplicating them.

This is the strongest example of the shared-service law.

---

# 17. Shared Forge Service Layer

Forge Core should expose shared services comparable to the following.

| Service | Responsibility |
| --- | --- |
| `ForgeIdentityService` | source IDs, canonical bindings, namespaces |
| `ForgeAuthorityService` | creator permissions and protected operations |
| `ForgeSourceService` | create/load/save/version source records |
| `ForgeDependencyService` | dependency graph and invalidation |
| `ForgeInheritanceService` | parent/override/variant resolution |
| `ForgeVoxelService` | voxel/model source editing |
| `ForgeMaterialService` | Material DNA / surfaces / palette roles |
| `ForgeRigService` | skeleton/joint/socket authoring |
| `ForgeAnimationService` | clips, timelines, states, semantic events |
| `ForgeVFXService` | effects, emitters, state/event binding |
| `ForgeLightingService` | lights/emission/lighting profiles |
| `ForgeAudioService` | sounds, semantic event mappings, spatial audio |
| `ForgeMusicService` | tracks, motifs, adaptive structures, sequencer |
| `ForgeStructureService` | structure composition, rooms, markers, modules |
| `ForgeLogicService` | bounded signal/control graphs |
| `ForgeWorldService` | worldgen/biome/realm composition |
| `ForgeCaptureService` | icons, thumbnails, portraits, references |
| `ForgeValidationService` | common + domain validators |
| `ForgeTestService` | Test Laboratory scenarios |
| `ForgeBakeService` | deterministic product generation |
| `ForgePackageService` | manifest/package/export |
| `ForgeReviewService` | revisions, comparison, approval |
| `ForgeDiagnosticsService` | source/bake/runtime/performance diagnostics |

Actual code may combine/split services where implementation evidence justifies it.

The ownership boundaries should remain conceptually visible.

---

# 18. Specialist Forge Families

The production programme currently expects specialist workflows including:

## Core asset authoring

- Block / Voxel Forge;
- Material Forge;
- Item / Tool Forge;
- Equipment Forge;
- Recipe Forge;
- Icon & Capture Forge;
- UI / 2D Forge.

## Entity authoring

- Character Forge;
- Creature Forge;
- Rig Forge;
- Animation Forge;
- Voice / Character Audio Forge;
- Equipment-fit workflows.

## Presentation

- VFX Forge;
- Lighting Forge;
- Sound Forge;
- Music Forge;
- Music Lab;
- Presentation-state tooling.

## Structures and civilisation

- Structure / Blueprint Forge;
- Dungeon Forge;
- Work / Profession Forge;
- Dialogue Forge;
- Faction Forge;
- Government / Law Forge;
- Commerce Forge;
- Knowledge / Codex Forge;
- Quest / Event Forge.

## Machines and magic

- Machine Forge;
- Signal & Logic Forge;
- Rune Forge;
- Spell Forge;
- Magical Infrastructure Forge;
- Alchemy Forge;
- Ritual Forge.

## World and travel

- World Forge;
- Biome Forge;
- Flora / Ecology Forge;
- Weather authoring;
- Hydrology / Water Forge;
- Land Transport Forge where justified;
- Vessel Forge;
- Portal Forge;
- Realm Forge;
- Cartography authoring.

## Platform / release authoring

- Package Forge;
- Review/Comparison Forge;
- Test Laboratory;
- Performance/Scalability certification views;
- Accessibility review views.

Some of these may be specialist **journeys** over the same workspace/service rather than distinct top-level tabs.

---

# 19. Asset Editors vs Composition Editors

The Forge needs both.

## 19.1 Asset editor

Creates or edits one reusable thing.

Examples:

- block;
- material;
- creature body;
- sound;
- animation clip;
- item;
- VFX effect.

## 19.2 Composition editor

Connects existing things into a higher-level understood system.

Examples:

- structure;
- machine;
- ritual;
- dungeon;
- ecology network;
- vessel;
- trade network;
- realm;
- pipe organ.

Composition editors are where Leyforge's emergent sandbox becomes powerful.

They should reference stable content identities rather than duplicating embedded copies.

---

# 20. Reference vs Embed

Default rule:

> **Reference reusable canonical content; embed only truly composition-local data.**

Examples:

Structure blueprint should reference:

- canonical blocks;
- canonical doors;
- canonical machines;
- semantic room roles.

It may embed:

- local placement transform;
- construction-stage membership;
- local marker positions;
- blueprint-local optional-module graph.

Creature should reference:

- material family;
- rig template if reusable;
- sound family.

It may embed:

- creature-specific body geometry;
- local animation requirements;
- body-region mapping.

---

# 21. Dependency Graph

Every source declares dependencies.

The Forge Dependency Graph tracks:

- source → source;
- source → canonical identity;
- source → shared library;
- source → golden reference;
- source → bake target;
- source → package;
- source → runtime contract.

Example:

```text
iron_sword
├── item.weapon.sword.iron
├── material.iron
├── sword_blade_source
├── sword_grip_source
├── humanoid_sword_socket_profile
├── sword_animation_profile
├── metal_impact_audio_family
├── sword_icon_capture_profile
└── recipe.sword.iron
```

---

# 22. Dependency Invalidation

When a dependency changes, Forge decides which downstream products become:

- unaffected;
- warning-only;
- source-review required;
- rebake required;
- validation required;
- manual review required;
- incompatible.

Changing an audio clip should not force a voxel mesh rebake.

Changing body topology may require rig/animation/equipment-fit recertification.

The invalidation system must be granular enough to avoid “rebuild the entire game because oak changed.”

---

# 23. Dependency Impact Preview

Before consequential edits, Forge should be able to show:

> **This change affects 1,842 dependent sources.**

Impact view should group by:

- direct dependencies;
- transitive dependencies;
- runtime products;
- packages;
- golden references;
- test fixtures.

For very large changes, production governance may require dedicated migration/review tasks.

---

# 24. Inheritance and Variants

Inheritance supports controlled reuse.

Examples:

```text
base oak material
    ↓
weathered oak
    ↓
culture-applied painted oak
```

```text
base cottage blueprint
    ↓
cold-biome adaptation
    ↓
prosperous cold-biome adaptation
```

Inheritance is not unrestricted property patching.

Each content class defines:

- inheritable fields;
- locked fields;
- override rules;
- merge behavior;
- compatibility validation.

---

# 25. Variants vs New Identity

Forge must distinguish:

- visual variant;
- state variant;
- deterministic variation;
- cultural adaptation;
- quality/state;
- actual new canonical identity.

A different paint colour does not automatically become a new gameplay block.

A different wood species usually is materially distinct if canon says so.

The owning semantic authority decides.

Forge exposes the distinction but does not invent it.

---

# 26. Shared Semantic Sockets

Forge authoring should surface the shared connection contracts owned by PROD-05.

Examples include:

- attachment socket;
- interaction anchor;
- item port;
- mechanical port;
- Flux port;
- signal port;
- fluid port;
- navigation connection;
- audio/event anchor;
- effect anchor.

Specialist Forge workflows may restrict which socket classes are legal.

They should not implement incompatible local socket concepts with the same meaning.

---

# 27. Shared State Model

Content sources may declare supported semantic states.

Examples:

- idle;
- active;
- blocked;
- damaged;
- broken;
- open;
- closed;
- powered;
- unpowered;
- flooded;
- burning;
- corrupted;
- repaired.

Presentation services bind to these states.

Forge validation should detect missing required representation.

Example:

```text
Machine contract requires BLOCKED_OUTPUT.
No animation, VFX, sound or UI fallback expresses BLOCKED_OUTPUT.
→ production warning/error according to class.
```

---

# 28. Animation Forge Shared Service

Animation Forge should support:

- clips;
- reusable timelines;
- layers;
- masks;
- state graphs;
- semantic events;
- attachment motion;
- root/local motion policy;
- retarget profiles;
- preview;
- performance/LOD variants.

Specialist journeys declare required animation roles.

Example Creature Journey may require:

- idle;
- locomotion;
- turn;
- hit;
- death;
- attack if combat-capable.

Forge can then report completeness without Creature Forge owning animation tooling.

---

# 29. VFX and Lighting Shared Services

These services author presentation bound to semantic state/events.

They must support:

- world-space anchors;
- sockets;
- timing;
- scale;
- LOD;
- reduced-flash alternatives;
- reduced-motion alternatives;
- realm/culture presentation where authorised.

They may not invent damage areas, portal rules or hazards.

If an effect requires gameplay behavior that does not exist, the journey blocks/escalates.

---

# 30. Sound and Music Shared Services

Sound Forge owns reusable sonic products and semantic event binding.

Music Forge/Music Lab own:

- tracks;
- stems;
- motifs;
- sequences;
- adaptive transitions;
- instrument definitions;
- note/event relationships.

Machine Forge, Creature Forge, Realm Forge and others reference these shared products.

The Flux organ therefore uses:

- Music Lab notes/sequencer;
- Signal Forge control;
- machine moving parts;
- Flux power;
- shared audio;
- shared lighting;
- structure composition.

---

# 31. Structure Forge

Structure Forge is a composition editor over registered content.

It authors:

- footprint;
- voxel/block placements;
- component placements;
- material roles;
- rooms;
- entrances/exits;
- paths;
- job markers;
- storage markers;
- utilities;
- sockets/ports;
- construction stages;
- damage/restoration states;
- modules;
- terrain adaptation;
- validation rules.

It does not create private blocks.

If an author needs a new wall block:

1. leave/branch Structure Journey;
2. create the block in the owning Forge;
3. validate/register it;
4. return to Structure Forge;
5. use the new stable identity.

---

# 32. Semantic Material Roles

A composition may use roles such as:

- `wall_primary`;
- `roof_primary`;
- `floor_primary`;
- `trim`;
- `foundation`.

Roles are not materials.

At validation/bake/runtime resolution they must map to actual authorised material/block families.

This permits biome/culture adaptation without hiding undeclared content.

---

# 33. Machine Forge

Machine Forge composes:

- physical form;
- moving parts;
- ports;
- buffers;
- process;
- recipes;
- power requirements;
- signals;
- states;
- failure conditions;
- maintenance;
- animation;
- VFX;
- audio.

The machine runtime contract owns processing truth.

Machine Forge authors valid definitions and presentation.

---

# 34. Signal & Logic Forge

Signal/Logic Forge is bounded.

It may expose approved logical primitives such as:

- trigger;
- toggle;
- pulse;
- timer;
- counter;
- comparison;
- AND / OR / NOT;
- state read;
- approved action;
- event output.

It does not expose arbitrary filesystem/network/native scripting by default.

Signal definitions use semantic ports and approved actions.

---

# 35. Spell, Rune and Ritual Forge

These specialist journeys compose approved magic capabilities.

## Rune Forge

Defines:

- rune identity/form;
- authorised effect/capability;
- activation condition;
- compatible surface/socket;
- Flux requirements;
- signals;
- presentation;
- failure/instability.

## Spell Forge

Defines:

- magic family;
- cast method;
- target mode;
- cost;
- effect modules;
- timing;
- required animations;
- VFX/audio;
- progression/unlock reference;
- failure/interruption.

## Ritual Forge

Adds spatial composition:

- site geometry;
- participants;
- components;
- rune network;
- activation sequence;
- phases;
- interruption;
- hazards;
- outcome.

None may create unrestricted arbitrary code.

---

# 36. World Forge

World Forge authors generator intent, not one static final world.

Tools may include:

- seed preview;
- macro terrain maps;
- elevation;
- climate;
- geology;
- hydrology;
- biome assignment;
- resource distribution;
- structure/route overlays;
- ecology diagnostics;
- settlement suitability;
- generation statistics;
- feature-ID inspection;
- multi-seed test batches.

A world rule that only looks good on one chosen seed has not been validated.

---

# 37. Biome / Ecology Composition

Biome Forge and Ecology Composer should treat ecology as relationships.

Possible authored relationships:

```text
climate
→ soil
→ flora
→ herbivore
→ predator
→ settlement pressure
→ regeneration
```

Creature Forge owns creature definitions.

Flora Forge owns plant definitions.

Ecology Composer owns approved relationships among them.

This prevents every creature definition from becoming its own isolated ecology simulator.

---

# 38. Dungeon Forge

Dungeon Forge should support both:

- fully authored layouts;
- procedural composition from authored modules/rules.

It may author:

- identity/theme;
- room/module library;
- topology rules;
- entrances/exits;
- progression;
- encounters;
- traps;
- puzzles;
- loot references;
- environmental story;
- boss hooks;
- states;
- validation.

Dungeon Forge references canonical creatures/items/structures/signals.

---

# 39. Capture Studio

Capture is a shared deterministic service.

Capture profiles control:

- source;
- state;
- pose;
- camera;
- framing;
- lighting;
- background;
- scale;
- crop;
- resolution;
- accessibility/profile variant where required.

Outputs may include:

- inventory icon;
- portrait;
- thumbnail;
- comparison image;
- turntable;
- golden-reference render.

Capture settings are versioned.

A changed capture profile can invalidate downstream captures without invalidating the source asset itself.

---

# 40. UI & 2D Forge

UI/2D Forge creates:

- icon families;
- map symbols;
- status icons;
- diagrams;
- panel/theme assets;
- Codex illustrations;
- Forge preview products.

It must respect:

- localisation/reflow;
- non-colour redundancy;
- player knowledge;
- permissions;
- accessibility;
- low-end presentation.

Reusable art must avoid baked localisable text unless explicitly justified.

---

# 41. Validation Architecture

Validation is layered.

Recommended layers:

1. schema;
2. identity;
3. authority;
4. dependency;
5. semantic;
6. geometric;
7. placement/collision;
8. sockets/ports;
9. runtime contract;
10. animation/state coverage;
11. VFX/audio coverage;
12. UI/capture coverage;
13. accessibility;
14. performance;
15. package compatibility;
16. migration;
17. in-context certification.

Not every content class uses every layer.

---

# 42. Validation Severity

Recommended severities:

- `INFO`
- `SUGGESTION`
- `WARNING`
- `ERROR`
- `BLOCKER`

A `BLOCKER` prevents Production Ready/bake/package state where the affected gate requires it.

Example:

> `BLOCKER: Humanoid locomotion profile requires walk_forward animation.`

A warning may permit use in development while visibly marking incomplete production quality.

---

# 43. Actionable Diagnostics

Forge errors should explain:

- what failed;
- why;
- where;
- authoritative rule;
- affected dependency;
- recommended fix;
- whether automatic repair exists.

Bad:

> Error 48031.

Good:

> **Vessel cannot pass Sea Trial validation: port-side cargo compartment has no watertight isolation path after Bulkhead B is damaged.**

Where possible:

> **Open compartment graph**

takes the author directly to the problem.

---

# 44. STOP AND ESCALATE

Forge production must stop/escalate when:

- gameplay semantics required by the content are undefined;
- two current authorities conflict;
- stable identity cannot be resolved;
- requested content requires new canonical capability outside current permission;
- a specialist Forge would need to invent a private port/socket/type;
- presentation implies gameplay behavior not owned by the source;
- player creator attempts a developer-only operation;
- a package override would mutate protected canon illegally;
- performance cannot meet requirements without deleting critical semantic cues;
- a migration would silently reinterpret saved content;
- an agent cannot determine whether a choice is aesthetic or semantic.

The correct result is a blocked journey with reason.

Not a guess.

---

# 45. Production Readiness State

A source may be:

- draft;
- authoring;
- valid-local;
- test-ready;
- review-required;
- production-ready;
- deprecated;
- blocked;
- superseded.

`Production Ready` means:

- required journey stages complete;
- dependencies resolved;
- required validators pass;
- required Test Lab scenarios pass;
- required captures/references exist;
- runtime bake succeeds;
- package/registry binding is valid;
- source/provenance is recorded;
- no unresolved blocker remains.

It does **not** mean “the editor can render it.”

---

# 46. Test Laboratory

The Test Laboratory is a shared Forge/runtime integration service.

It should be able to create controlled scenarios around actual runtime systems.

Test Lab capabilities may include:

- spawn source;
- place source;
- set environment;
- choose biome/realm;
- set time/weather;
- inject authorised test resources;
- simulate damage;
- simulate fault;
- activate signals;
- run animation states;
- test collision;
- test navigation;
- test combat;
- test machine IO;
- test Flux network;
- test vessel buoyancy;
- test portal transition;
- run performance capture;
- run accessibility profile.

The Test Lab does not create alternative fake gameplay logic.

It arranges the real runtime into controlled conditions.

---

# 47. Test Laboratory Scene Families

Representative shared environments may include:

- neutral visual studio;
- material comparison room;
- entity locomotion/combat field;
- structure terrain-fit field;
- machine/logistics bench;
- magic/rune chamber;
- weather environment;
- water tank/coast;
- Sea Trial area;
- dungeon topology test;
- worldgen statistical runner;
- portal/realm transition test;
- multiplayer test arena;
- low-end performance scene.

ART-10 golden-reference scenes can be implemented through the same infrastructure.

---

# 48. Live Playtest

Forge can launch the selected source/composition into the real Leyforge runtime.

Live playtest state must identify:

- source revision;
- bake revision;
- runtime package revision;
- test world;
- dependency versions.

This prevents reviewing an older bake while believing it represents the current source.

---

# 49. Hot Reload

Hot reload is allowed only where the changed source class can safely update live runtime representations.

Possible safe examples:

- material parameter;
- non-authoritative presentation;
- audio;
- some UI/icon assets.

Potentially unsafe:

- voxel identity remap;
- collision topology;
- save schema;
- rig hierarchy;
- network schema;
- worldgen contract;
- active structure semantic graph.

Unsafe changes require controlled respawn/reload/restart.

Forge should say why.

---

# 50. Bake Architecture

Bake transforms editable source into runtime-efficient products.

A bake is:

- deterministic where required;
- versioned;
- dependency-aware;
- cacheable;
- reproducible;
- traceable to source revision.

A bake manifest records:

- source identity/revision;
- dependency revisions;
- tool/bake version;
- generated products;
- validation result;
- warnings;
- hash/integrity data.

---

# 51. Incremental Bake

Forge should avoid rebuilding unrelated products.

If only a sound mapping changes:

- audio binding may rebake;
- creature geometry need not.

If material source changes:

- affected textures/material products may rebake;
- dependent captures may invalidate;
- unrelated animation clips may remain valid.

Dependency graph drives incremental bake.

---

# 52. Runtime Registration

Bake outputs register through the runtime registry adapter established by PROD-03.

Forge source must not directly assign provider-local runtime handles.

Pipeline:

```text
stable semantic/source identity
→ bake product
→ registry manifest
→ WorldSession/runtime projection
→ provider-local handle
```

This protects save/network compatibility.

---

# 53. Source / Bake / Runtime Parity

Forge must be able to detect drift such as:

- source updated, stale bake loaded;
- registry references missing output;
- runtime product produced by different schema;
- package contains older dependency;
- hot reload failed partially.

Production build/package should refuse invalid parity where required.

---

# 54. Revision History

Forge revision tooling should track:

- source property changes;
- dependency changes;
- author;
- task/work reference;
- migration;
- bake result;
- approval/review state.

This may integrate with Git rather than replacing Git.

Forge history is semantic/editor-facing.

Repository history remains engineering/source-control authority.

---

# 55. Visual and Semantic Diff

Forge Review can provide content-class-aware diffs.

Examples:

## Block

- geometry changed;
- collision changed;
- material changed;
- semantic capability unchanged.

## Creature

- body dimensions;
- rig;
- animation requirements;
- hit regions;
- ecology tags.

## Structure

- block count;
- rooms;
- doors;
- jobs;
- utilities;
- cost;
- construction stages.

## Worldgen

- biome distribution;
- elevation;
- feature density;
- structure placement;
- statistical seed comparison.

A useful diff communicates consequence, not just serialized text.

---

# 56. Golden References

Forge integrates ART-10 golden references.

A source can declare applicable references for:

- material family;
- silhouette;
- motion;
- VFX;
- audio;
- UI;
- biome/realm;
- structure;
- vessel.

Golden references are comparisons and validated examples.

They are not templates that every asset must copy identically.

---

# 57. Provenance

Every production source should preserve enough provenance to answer:

- who/what created it;
- under what task;
- which upstream canon;
- which source assets;
- which AI/tool involvement if applicable;
- which external licences where applicable;
- which revision;
- which validators/reviews approved it.

“AI generated it” is not provenance sufficient for production.

---

# 58. Forge Permissions Model

The Forge must not be split into “developer software” and a totally unrelated “player editor” when they are editing the same supported content class.

Instead:

> **same core services + same source schemas + different permissions/capability envelopes.**

Permission can govern:

- create canonical ID;
- edit base-game content;
- create package-local identity;
- override;
- change stable semantics;
- use advanced validators;
- access developer-only metadata;
- publish package;
- sign/certify content;
- use experimental tools.

---

# 59. Developer Forge

Developer authority may allow:

- canonical base-game definitions;
- protected registry changes;
- migrations;
- engine-facing semantic capabilities;
- Forge schema changes;
- final content certification;
- protected package signing.

These operations should visibly identify elevated authority.

---

# 60. Player Forge

Player/community creator tools should support powerful creation inside approved capabilities.

Depending on final product design, players may create:

- structures;
- settlements/plans;
- vessels;
- creatures;
- items;
- music;
- machines;
- spells/runes;
- worlds/biomes;
- content packs;

only where relevant capability has been deliberately exposed and secured.

Player tools may not silently:

- alter protected canonical base-game IDs;
- change save/network schemas;
- add arbitrary native code;
- grant unrestricted filesystem/network access;
- modify server authority;
- bypass package permissions.

---

# 61. Restricted Creator Source

A player-authored structure can use the same underlying Structure Source schema as a developer-created structure, but fields may be constrained.

Example player restrictions:

- only approved blocks/components;
- package-local namespace;
- no protected semantic room roles unless permitted;
- no arbitrary world-state effect;
- validated construction cost;
- no server-only debug markers.

This avoids creating a second inferior structure format.

---

# 62. Content Package Architecture

A Forge package should record:

- package identity;
- namespace;
- version;
- creator;
- dependencies;
- compatible game/Forge schema ranges;
- source classes included;
- canonical/base overrides if allowed;
- migrations;
- runtime products;
- previews;
- licences/provenance;
- validation records;
- security class.

Package Forge assembles and validates this record.

---

# 63. Package Namespace

Content identity must not depend on load order.

A package owns a namespace or equivalent stable identity scope.

Two packages cannot both accidentally define `item.sword` and rely on whichever loaded second.

Overrides are explicit and permission-controlled.

---

# 64. Package Dependency Resolution

Before loading/installing a package, Forge/runtime resolves:

- required packages;
- version ranges;
- missing dependencies;
- conflicts;
- superseded versions;
- override rules;
- schema compatibility;
- required migrations.

The player should receive a human-readable reason when installation is blocked.

---

# 65. Package Security

Untrusted/community packages are validated data by default.

Security checks include:

- schema;
- namespace;
- prohibited references;
- invalid overrides;
- oversized/budget-breaking assets;
- malformed files;
- package traversal/path abuse;
- unsupported executable payloads;
- server policy.

This forms the base for P155's protected mod runtime.

---

# 66. Forge Import / External Tools

External tools may contribute source products.

Import boundary must preserve:

- scale;
- orientation;
- pivots;
- sockets;
- semantic identity;
- material mapping;
- licences/provenance.

External assets do not become Production Ready simply because they successfully import.

They still pass Forge validation/certification.

---

# 67. 3D Environment Editor

The Forge retains a genuine 3D authoring environment.

It must support tasks such as:

- modelling voxel assets;
- placing structures/components;
- editing rooms/markers;
- composing dungeons;
- authoring vessel layouts;
- editing world/biome test regions;
- placing semantic anchors;
- previewing states;
- testing interactions.

This is not just a form-based database editor.

The power of the 3D workspace is paired with explicit semantic meaning.

---

# 68. Transform and Snapping

Shared 3D authoring supports:

- world-grid snapping;
- sub-voxel/detail snapping where allowed;
- rotation increments;
- pivot editing;
- socket snapping;
- alignment;
- symmetry;
- array/duplicate;
- semantic connection snapping.

Specialist workspaces can constrain transforms to legal values.

---

# 69. Undo / Redo

Forge undo/redo operates at source-operation level.

Operations should be meaningful where practical:

- “Place 42 blocks”
- “Assign room role”
- “Connect power port”
- “Retarget animation set”

rather than thousands of unrelated property mutations.

Large/generated operations should be reversible.

---

# 70. Batch Operations

Forge should support controlled batch work:

- change material family;
- rebake asset family;
- validate package;
- capture icon family;
- migrate schema;
- replace dependency;
- create approved variants;
- run seed suite.

Batch operations preview scope before destructive changes.

---

# 71. Performance Budgeting in Forge

Forge source validators should expose authoring-time budgets where possible.

Examples:

- voxel/model complexity;
- material count;
- animation bones/tracks;
- VFX particle cost;
- audio voice density;
- structure block count;
- machine graph complexity;
- worldgen generation time;
- package memory footprint.

Warnings should be profile-aware.

A source may be valid but too expensive for its intended category.

---

# 72. Scalability Products

Forge may create scalable products from one source family where appropriate:

- LOD;
- reduced-effects;
- reduced-motion;
- lower particle count;
- simplified geometry;
- lower-distance animation;
- simplified ambience.

Scalability must preserve semantic truth.

The Forge should validate that critical state remains readable in low profiles.

---

# 73. Accessibility Validation

Specialist journeys can declare accessibility obligations.

Examples:

- critical VFX not colour-only;
- state indicator has non-audio alternative;
- UI icon has accessible label;
- flash threshold review;
- reduced-motion fallback;
- captions for information-bearing sound.

Accessibility is therefore part of Production Ready rather than a final afterthought.

---

# 74. Localisation Boundary

Source records do not bake localisable text into reusable graphics where avoidable.

Text references stable localisation keys.

Forge preview can test:

- long strings;
- different scripts;
- reflow;
- controller focus;
- subtitle/caption layouts.

---

# 75. Forge Diagnostics

Forge diagnostics should distinguish:

- source issue;
- dependency issue;
- bake issue;
- runtime adapter issue;
- validation issue;
- package issue;
- permission issue;
- tool defect.

Stable reason codes should allow Project Brain/Codex/tests to identify known classes of failure.

---

# 76. Forge Recovery

Forge should protect against:

- interrupted saves;
- incomplete bake;
- broken temp products;
- schema mismatch;
- partial package export;
- stale lock;
- invalid dependency migration.

Editable source should use safe-save/versioning strategies appropriate to the chosen serialization.

A failed bake must not corrupt the source.

---

# 77. Forge and Source Control

Forge integrates with, but does not replace, repository governance.

Useful integration may include:

- dirty status;
- changed source list;
- semantic diff summary;
- task/work record link;
- conflict warning;
- revision identifier.

Automatic commit/push remains governed by ENG-GOV/PROD-06, not by whichever editor button is convenient.

---

# 78. Multi-user Collaboration Readiness

Before P154, Forge should avoid assumptions that make collaboration impossible.

Sources should have:

- stable identity;
- bounded ownership;
- mergeable structure where practical;
- revision identifiers;
- change history.

Later collaboration may support:

- shared review;
- comments;
- locks;
- branch/draft sharing;
- co-test;
- selected real-time co-edit where conflict handling is proven.

Not every source type requires Google-Docs-style simultaneous editing.

---

# 79. AI Access Boundary

AI comes later.

Forge architecture exposes a controlled operation layer such that optional AI can:

- inspect authorised source;
- query dependencies;
- create a plan;
- propose source edits;
- invoke approved Forge operations;
- run validators;
- interpret diagnostics.

AI does not receive privileged undocumented internal mutation access.

The same operation API should support:

- human UI;
- automation;
- tests;
- later AI.

This is crucial for P172–P174.

---

# 80. Forge Operation API

A Forge operation should be semantic and permission-checked.

Examples:

```text
create_source(content_class, namespace)
set_material_role(source, role, material_id)
add_structure_component(source, component_id, transform)
connect_port(source, port_a, port_b)
bind_animation_role(source, role, animation_id)
run_validation(source)
bake_source(source)
launch_test_scenario(source, scenario_id)
```

Avoid exposing “write arbitrary property path” as the only automation interface.

Higher-level operations preserve semantic validation.

---

# 81. Deterministic Automation

Automated Forge operations should be deterministic where required.

If a batch generator creates a standard stair family from the same source/settings, it should not randomly output different geometry because thread timing changed.

Random/procedural authoring uses explicit seed/context when reproducibility matters.

---

# 82. Generated Suggestions vs Accepted Source

Forge may generate:

- suggested palette;
- generated variants;
- inferred collision;
- automatic LOD;
- recommended sockets;
- generated icon framing.

Generated suggestions do not become canonical merely because a tool produced them.

They must be accepted/validated into source.

---

# 83. Auto-fix Policy

Validators may offer automatic fixes only when the correction is mechanically safe.

Safe example:

> Missing generated thumbnail → regenerate thumbnail.

Unsafe example:

> Creature lacks canonical habitat → invent “forest”.

Forge must distinguish repair from design invention.

---

# 84. Work Record Integration

A consequential Forge production task should be able to emit/update a work record containing:

- task;
- sources changed;
- authority consulted;
- generated products;
- validators;
- manual reviews;
- discoveries;
- unresolved issues;
- package outputs.

This supports Project Brain and later production audit.

---

# 85. Forge Source Status Dashboard

Unified dashboard should answer:

- What is being worked on?
- What is blocked?
- What is Production Ready?
- What is stale?
- What needs rebake?
- What failed validation?
- What has no icon?
- What depends on changed canon?
- What package is incompatible?

The dashboard should operate from real source/dependency state, not a separately-maintained spreadsheet that drifts.

---

# 86. Forge Search as Production Tool

Search should support production questions such as:

- show all machines with unbound `BLOCKED_OUTPUT` presentation;
- show all structures using deprecated oak block family;
- show all creatures missing reduced-effects VFX;
- show all sources dependent on old rig template;
- show all realm packages failing low-end budget;
- show all player-package overrides touching protected canon.

This makes the dependency graph operational.

---

# 87. Forge Test Matrix

Every content class should define its minimum Test Lab matrix.

Example:

## Block

- placement;
- collision;
- break/drop;
- save/reload;
- lighting;
- icon;
- neighbour states.

## Creature

- spawn;
- locomotion;
- collision;
- animation;
- combat;
- death;
- persistence;
- LOD;
- equipment if relevant.

## Vessel

- construction;
- launch;
- float/stability;
- propulsion;
- steering;
- boarding;
- cargo;
- damage;
- flood/fire;
- save/reload;
- streaming;
- multiplayer later.

The journey engine can derive required test status from the source class.

---

# 88. Forge Production Certification Layers

A source can pass several levels:

1. **Source Valid**
2. **Bake Valid**
3. **Runtime Valid**
4. **Context Valid**
5. **Accessibility/Scalability Valid**
6. **Package Valid**
7. **Production Certified**

Not every early development source must immediately reach level 7.

Production Ready requires the level specified by its owning milestone.

---

# 89. Placeholder Classification

Placeholders are allowed during production if explicitly marked.

Placeholder source must declare:

- what is temporary;
- owning replacement milestone;
- dependencies relying on it;
- whether save/runtime identity is final;
- whether presentation is final.

A placeholder must not accidentally become final because nobody remembers it was temporary.

---

# 90. Migration of Historical POC Content

Historical POC assets are treated as:

- evidence;
- fixtures;
- migration source;
- functional references.

Forge migration tooling may classify each historical asset:

- preserve identity;
- rebuild source;
- restyle;
- migrate to family;
- retain as test fixture;
- deprecate;
- replace.

The historical asset itself does not gain authority merely by existing.

---

# 91. Forge Runtime Preview Boundary

Preview modes fall into two broad classes.

## Editor preview

Fast approximation for:

- model;
- material;
- animation;
- VFX;
- audio;
- icon.

## Runtime preview

Real game systems for:

- physics;
- pathfinding;
- machine IO;
- combat;
- settlement function;
- water;
- vessel behavior;
- portal travel.

The Forge must label approximations clearly.

A viewport animation looking correct is not evidence that a creature navigates correctly in runtime.

---

# 92. Preview Context Profiles

Reusable context profiles may include:

- neutral daylight;
- night;
- interior;
- forest;
- desert;
- snow;
- rain;
- underwater;
- magical/realm lighting;
- combat density;
- settlement density;
- low-end;
- reduced effects;
- accessibility.

This supports ART's requirement that content be judged in representative context.

---

# 93. Forge Performance Isolation

Heavy authoring tasks should run asynchronously where safe.

Examples:

- worldgen statistical tests;
- large dependency scans;
- bake;
- capture batches;
- package validation.

They must obey PROD-03's worker-compute/owner-commit model.

A background bake may not mutate source while the author is editing without revision checks.

---

# 94. Source Locking and Revisions

Long tasks capture a source revision.

If the source changes before the result completes:

- result may be discarded as stale;
- result may be retained as comparison;
- user may be offered a re-run.

It must not silently overwrite newer source.

---

# 95. Forge Service Plugins

Forge internally may use a registered plugin/service architecture.

An extension may contribute:

- workspace;
- journey profile;
- validator;
- bake target;
- test scenario;
- inspector;
- operation.

Extension loading is developer-controlled.

This internal extensibility is not automatically equivalent to public executable modding.

---

# 96. Specialist Workflow Ownership

A specialist Forge should own **questions**, not duplicate machinery.

Example — Creature Forge asks:

- What body plan?
- Which locomotion modes?
- Which required animations?
- Which habitat/ecology role?
- Which combat capabilities?

Animation Forge answers:

- how animation source is authored.

Sound Forge answers:

- how sound source/event binding is authored.

This distinction should be enforced architecturally.

---

# 97. Forge UX Grammar

Shared interaction grammar should include:

- inspect;
- select;
- edit;
- assign;
- connect;
- place;
- validate;
- test;
- compare;
- capture;
- bake;
- package.

Specialist workspaces should avoid inventing wildly different controls for the same semantic action.

---

# 98. Contextual Help

The Creation Journey should explain **why** a stage exists.

Example:

> “This vessel needs watertight compartment boundaries because the runtime simulates flooding by compartment.”

This turns architecture into learnable creator knowledge.

Context help can link to:

- relevant Codex/Forge docs;
- golden reference;
- validation rule;
- runtime concept.

---

# 99. Production Capability Discovery

The Forge UI should expose what is currently possible rather than only what is unavailable.

Examples:

- allowed port types;
- compatible materials;
- available animation roles;
- legal structure markers;
- approved ritual components;
- valid realm hazards.

This reduces creators guessing internal strings.

---

# 100. Creation Templates

Templates may accelerate common content.

Examples:

- humanoid creature;
- quadruped;
- simple machine;
- small house;
- workboat;
- basic spell;
- merchant faction.

A template creates valid starting source.

It does not bypass journey requirements.

Templates should reference stable reusable families rather than copy giant source blobs unnecessarily.

---

# 101. Forge Family Production

Mass production should happen through families where possible.

Example tool family:

```text
shared grip / silhouette law
+ material tier
+ head geometry
+ durability/capability
+ icon capture profile
+ animation compatibility
```

This increases consistency and makes migrations tractable.

---

# 102. Forge and Procedural Generation

Procedural generation is authorised production tooling when:

- inputs are canonical/approved;
- seed/settings are recorded where needed;
- output is reviewable;
- runtime products remain deterministic where required;
- generated result does not invent new semantics.

Procedural assistance is not the same as random uncontrolled content generation.

---

# 103. Forge and Runtime Definitions

Some Forge sources may compile into pure runtime data.

Others may compile into:

- Godot Resources;
- voxel library products;
- scenes;
- graphs;
- animation libraries;
- audio products.

The Forge-facing semantic contract must not be defined solely by the output format.

This protects the project if provider/runtime implementation changes later.

---

# 104. Forge and Godot Editor

The Forge may be:

- implemented partly inside Godot tooling;
- implemented as game/editor scenes;
- implemented as custom editor plugins;
- use standalone Forge UI surfaces where justified.

The exact UI host is an implementation decision.

The Forge architecture itself must remain independent enough that content source and journey semantics are not trapped in temporary editor widgets.

---

# 105. Forge Data Serialization

Preferred source serialization qualities:

- text-diffable where practical;
- stable ordering where practical;
- explicit schema version;
- no dependence on transient object IDs;
- no duplicated derived data;
- deterministic bake inputs;
- migratable.

Binary formats may be justified for large source assets.

A binary source still requires manifest/provenance/version metadata.

---

# 106. Forge Caches

Caches are disposable.

Examples:

- thumbnails;
- dependency indexes;
- search indexes;
- bake caches;
- preview meshes;
- generated waveform data.

Deleting a cache should reduce performance temporarily, not destroy canonical source.

---

# 107. Forge Registry Integration

Registry binding occurs explicitly.

A source that looks like a sword but has no valid canonical identity/registration is an unregistered draft.

The Forge should visibly distinguish:

- registered canonical source;
- package-local registered source;
- unregistered draft;
- orphaned source;
- missing canonical binding.

---

# 108. Stable References

Forge sources reference other content by stable identities/source identities.

File paths may be implementation metadata.

Moving a file within the repository should not necessarily sever semantic references.

---

# 109. Source Deletion

Deletion is governed.

Before deleting a source, Forge checks:

- direct dependencies;
- transitive dependencies;
- packages;
- saves/migrations where relevant;
- replacement/supersession.

Typical options:

- block deletion;
- deprecate;
- replace references;
- create migration alias;
- delete only unreferenced source.

---

# 110. Deprecation

Deprecated content remains resolvable where compatibility requires it.

Forge can hide deprecated content from new creation while retaining:

- migration;
- old saves;
- package compatibility;
- historical references.

---

# 111. Source Schema Migration

Forge source schemas evolve through explicit migrations.

Migration must preserve:

- identity;
- semantic meaning;
- dependency links;
- authoring intent;
- provenance where possible.

A new editor UI does not justify throwing away source compatibility.

---

# 112. Package Migration

Package Forge may produce migration rules for:

- renamed IDs;
- changed source schemas;
- split definitions;
- merged definitions;
- changed dependencies.

Protected base-game migrations require developer authority.

---

# 113. Forge Validation Modes

Validation can run:

- live/lightweight during editing;
- on save;
- on bake;
- on package;
- in CI;
- in Test Lab;
- as release certification.

Heavy validators should not make every click unusably slow.

Fast validators catch common errors early.

---

# 114. Forge CI Integration

Headless/automated Forge validation should be possible.

CI may run:

- schema validation;
- dependency resolution;
- deterministic bake;
- registry parity;
- missing products;
- package checks;
- performance smoke tests;
- golden-reference regression where automatable.

Human judgement remains required where ART-10 demands it.

---

# 115. Forge Reproducibility

Given:

- source revision;
- dependencies;
- tool version;
- bake settings;

Forge should reproduce equivalent required runtime products.

If a process depends on undocumented manual steps, it is not fully productionised.

---

# 116. Forge Auditability

For a shipped asset/package, we should eventually be able to answer:

- which source produced this;
- which bake produced this;
- which canon governed it;
- which validators passed;
- which package contains it;
- which runtime version consumes it.

This is why source/bake/runtime identities remain separate.

---

# 117. Unified Forge Milestone

P127 is not the first time Forge exists.

It is the milestone where earlier specialist Forge services become a deliberately unified platform.

By P127, the project should already have proven:

- Forge Core;
- registry;
- block/material tools;
- Test Lab;
- items/recipes;
- presentation tools;
- creatures/rigging;
- structures;
- professions;
- machines;
- signals;
- magic;
- world/biome;
- commerce;
- vessels;
- realms.

P127 consolidates.

It does not rewrite them all from scratch.

---

# 118. Creation Journey Engine Milestone

P128 formalises journey metadata and guided navigation across already-proven specialist workflows.

Earlier Forge tools may use local/static checklists.

P128 migrates those into one shared engine.

Therefore:

> **Do not delay useful Forge authoring until P128.**

P128 is convergence, not initial invention.

---

# 119. Dependency Graph Milestone

P129 similarly formalises cross-Forge dependency navigation/change propagation at platform scale.

Earlier source classes must already declare stable dependencies so they can be incorporated.

Do not build specialist tools around opaque file-path-only references that make P129 impossible.

---

# 120. Universal Validation Milestone

P132 consolidates validators.

Earlier milestones build domain validators incrementally.

P132 provides:

- shared orchestration;
- common severity;
- dependency-aware results;
- actionable fix navigation;
- final production-readiness aggregation.

---

# 121. Test Laboratory Milestone

P10 creates Test Lab v1.

Every later Forge should reuse/extend it.

P133 is final Test Lab consolidation, not a late invention.

---

# 122. Package Forge Milestone

Basic manifests/registry/bake packaging exist early enough to support development.

P136 makes package creation a full creator-facing system with:

- namespaces;
- dependencies;
- versions;
- compatibility;
- migrations;
- publication class;
- validation;
- preview products.

---

# 123. Multiplayer / Collaborative Forge Readiness

P154 adds collaboration.

Pre-P154 architecture must already support:

- source revision;
- identity;
- permissions;
- package namespaces;
- bounded operations.

Otherwise collaboration becomes a destructive rewrite.

---

# 124. AI Forge Readiness

P172–P174 come after P170.

Forge operation APIs, journeys, dependencies and validators should already be machine-operable enough that AI can use them later.

The AI layer should not require new hidden privileged editor entry points.

---

# 125. The Pipe Organ Certification Principle

The Flux-powered voxel pipe organ remains a flagship integration proof because it asks the Forge/runtime to compose capabilities that were not created specifically for “pipe organ.”

It should require:

- registered blocks/materials;
- Structure Forge;
- machine components;
- Flux ports/network;
- Signal & Logic Forge;
- Music Lab;
- Sound Forge;
- Animation Forge;
- lighting/VFX;
- Test Lab.

If successful without bespoke pipe-organ engine code, it demonstrates:

> **Leyforge understands composition rather than merely a list of hard-coded inventions.**

This principle should guide future Forge certification challenges.

---

# 126. Forge Acceptance Gate

PROD-04 is ready for owner lock when the owner agrees that:

- [ ] The Forge is one authoring platform rather than unrelated editors;
- [ ] specialist workflows orchestrate shared services;
- [ ] Forge creates semantically understood source, not only presentation assets;
- [ ] editable source + registry binding is authoritative for Forge-supported production content;
- [ ] baked/runtime products are reproducible derivatives;
- [ ] Creation Journey Engine tracks semantic completeness, not screen visits;
- [ ] guided and expert modes edit the same source;
- [ ] specialist workflows own domain questions, not duplicate modelling/animation/VFX/audio machinery;
- [ ] asset editors and composition editors are both first-class;
- [ ] composition references existing canonical content by default;
- [ ] Structure/Vessel Forge cannot silently create private canonical blocks/materials;
- [ ] dependencies are explicit and drive invalidation/incremental bake;
- [ ] inheritance/variants cannot silently create new gameplay identity;
- [ ] shared semantic sockets/ports/states are exposed from PROD-05 contracts;
- [ ] Test Laboratory uses real runtime systems;
- [ ] hot reload is safety-classified rather than promised universally;
- [ ] Capture Studio is deterministic/versioned;
- [ ] validation is layered and actionable;
- [ ] Production Ready requires validation/test/bake/registry/provenance, not merely visual quality;
- [ ] developer and player Forge share core services/source schemas where capability overlaps;
- [ ] player authority is capability-restricted rather than implemented as a separate incompatible editor;
- [ ] packages use stable namespaces/dependencies/versions/migrations;
- [ ] untrusted packages do not gain unrestricted executable code by default;
- [ ] collaborative Forge is enabled by stable identities/revisions/operations but implemented later;
- [ ] optional AI later uses the same permission-checked Forge operations as humans/automation;
- [ ] Unified Forge P127 is consolidation of earlier specialist services, not a total rewrite;
- [ ] P128/P129/P132/P133 consolidate journey/dependency/validation/Test Lab capabilities already seeded earlier;
- [ ] the pipe organ remains a formal emergent-composition proof.

---

# 127. Proposed Lock Statement

If owner-approved, lock the following:

> **PROD-04 — LEYFORGE FORGE ENGINEERING & CREATION JOURNEY ARCHITECTURE — v0.1**
>
> The Forge is Leyforge's unified authoring operating system. It converts authorised content intent into editable, versioned and semantically-understood source records; resolves stable identity and dependencies; guides creators through content-class-specific Creation Journeys; orchestrates shared modelling, material, rigging, animation, VFX, lighting, audio, music, structure, logic, world, capture, validation, test, bake and package services; and produces reproducible runtime products registered through Leyforge's stable-ID architecture. Specialist Forge workflows own domain-specific questions and completion rules rather than duplicate shared editors. Complex creations are preferably compositions of existing understood content and capabilities. Developer and player creator tools share the same core services and compatible source schemas where their capabilities overlap, while permissions protect canonical definitions and runtime authority. The Test Laboratory exercises real game systems, validation is layered and actionable, packages are namespace/version/dependency governed, and later collaboration or AI operates only through the same explicit permission-checked Forge operations available to the rest of the production system.

---

# 128. Next Document

After PROD-04 acceptance/reconciliation, continue to:

> **PROD-05 — Universal Simulation Primitives & Cross-System Contracts**

PROD-05 will formalise the recurring shared primitives that now span nearly every Leyforge system:

- Identity;
- State;
- Permission / Jurisdiction;
- Signal;
- Transaction;
- Route;
- Knowledge;
- History;
- Composition;
- typed sockets/ports;
- ownership;
- reason codes;
- provenance;
- capability contracts;
- domain-specific extensions.

That document prevents settlements, automation, vessels, magic, multiplayer, realms and Forge from independently reinventing the same underlying language.

---

**End of PROD-04 v0.1 — Forge Engineering & Creation Journey Architecture Candidate**
