# Leyforge Art Production Corpus

## ART-09 — Codex / The Forge Asset Production Execution Contract

**Document ID:** ART-09  
**Title:** Leyforge Codex / The Forge Asset Production Execution Contract  
**Version:** v0.1  
**Date:** 4 September 2026  
**Status:** **LOCKED ART-PRODUCTION EXECUTION BASELINE**  
**Project:** Leyforge  
**Product context:** Ley Realms / The Forge  
**Corpus:** ART — Final Art Direction, Asset Production & Codex/Forge Handoff  
**Constitutional parent:** ART-00 — Art Production Constitution & Authority Map  
**Visual parent:** ART-01 — Master Leyforge Visual Language & Style Bible  
**Material parent:** ART-02 — Materials, Colour, Texture, Surface & Shader Art Standard  
**Environment parent:** ART-03 — World, Realm, Biome, Architecture & Culture Art Direction  
**Model parent:** ART-04 — Blocks, Items, Machines, Structures, Equipment & Vessel Modelling Standard  
**Entity/motion parent:** ART-05 — Characters, Creatures, Rigging & Animation Style Handoff  
**Effects parent:** ART-06 — VFX, Lighting, Weather, Magic & Environmental Effects Bible  
**Audio parent:** ART-07 — Audio, Music & Sonic Identity Bible  
**2D/UI parent:** ART-08 — UI, Icons, Cartography, Codex & 2D Presentation Standard  
**Forge system parents:** Documents 21A–21G and 22A–22L  
**Engineering/governance interfaces:** applicable ENG-GOV and B-OPS authorities, especially coding-agent bootstrap, testing/verification, registry/stable identity, ADR/exception handling, Brain↔Governance interface and work-log/skills procedures  
**Primary downstream consumers:** Codex/coding agents, The Forge, Forge engineering, Project Brain, asset-production batches, runtime content packaging, ART-10 certification  

---

# 00. Executive Production Contract

ART-09 converts Leyforge's art direction into a repeatable production procedure.

The governing promise is:

> **Codex may autonomously manufacture presentation assets only after it has resolved the authoritative identity, the applicable ART rules, the required Forge source products, the runtime contract and the acceptance gates.**

The non-invention promise is:

> **An agent may infer production detail inside a bounded art envelope; it may not silently invent gameplay canon, progression, mechanics, world truth, cultural truth, stable identities or engineering law in order to finish an asset.**

The source-of-truth promise is:

> **Editable Forge source and canonical registry bindings are authoritative production records. Baked meshes, textures, materials, captures, icons, animation products, VFX/audio products and runtime scenes are reproducible generated outputs.**

The completion promise is:

> **An asset is not done because it looks good in isolation. It is done only when all required representations, states, bindings, validation, context review, accessibility/scalability requirements, provenance and production records pass.**

The recovery promise is:

> **Every agent-authored production change must be reviewable, reproducible and reversible.**

---

# 01. Purpose

ART-09 defines the standard operating contract for turning canonical Leyforge content into production-ready visual, motion, effects, audio and 2D assets through The Forge.

It exists to prevent five recurring failure modes:

1. producing attractive assets that contradict canon;
2. creating presentation variants as accidental new gameplay identities;
3. solving missing mechanics inside an art task;
4. generating assets without complete runtime/registry/variant/state coverage;
5. losing the reasoning, source lineage or repeatable procedure used to create the result.

---

# 02. Authority Boundary

ART-09 owns **how art-production work is executed**.

It does not own:

- new gameplay mechanics;
- stable gameplay identity creation outside the owning registry authority;
- balance or numerical simulation rules;
- world-generation rules;
- save-schema law;
- networking law;
- final engineering implementation choices owned by ENG-GOV/FORGE-ENG/LFE;
- narrative/cultural facts not supplied by canon;
- interaction or accessibility semantics owned by the appropriate gameplay/UI authority;
- approval powers assigned elsewhere.

If production encounters one of those missing decisions, ART-09 routes it outward instead of consuming it.

---

# 03. Mandatory End-to-End Production Flow

Every governed asset task follows this chain unless a documented specialist exception applies:

```text
TASK INTAKE
→ AUTHORITY LOOKUP
→ CANONICAL IDENTITY RESOLUTION
→ DEPENDENCY / REPRESENTATION RESOLUTION
→ ART RULE RESOLUTION
→ GOLDEN REFERENCE SELECTION
→ ASSET FAMILY / INHERITANCE RESOLUTION
→ PRODUCTION PLAN
→ FORGE SOURCE AUTHORING
→ MATERIAL / TEXTURE AUTHORING
→ MODEL / BLUEPRINT AUTHORING AS APPLICABLE
→ RIG / ANIMATION AS APPLICABLE
→ VFX / LIGHTING AS APPLICABLE
→ AUDIO AS APPLICABLE
→ ICON / THUMBNAIL / 2D PRODUCTS AS APPLICABLE
→ VARIANT / STATE / LOD COMPLETION
→ BAKE / EXPORT
→ REGISTRY / MANIFEST BINDING
→ AUTOMATED VALIDATION
→ IN-CONTEXT REVIEW
→ ACCESSIBILITY / SCALABILITY REVIEW
→ PROVENANCE / WORK LOG / DISCOVERY RECORD
→ APPROVAL, REVISION OR ESCALATION
→ ART-10 CERTIFICATION WHEN REQUIRED
```

Skipping a stage is allowed only when that stage is genuinely not applicable and the reason is machine-readable or recorded in the task report.

---

# 04. Production Task Classes

ART-09 recognises at least the following task classes:

- new canonical presentation package;
- visual replacement/migration of a legacy or POC asset;
- family expansion;
- derived material/form generation;
- culture/biome/realm variant;
- damage/age/weather/corruption/state variant;
- animation package;
- VFX package;
- audio package;
- UI/icon/cartographic 2D package;
- golden-reference candidate;
- corrective QA task;
- optimisation/LOD task;
- accessibility remediation;
- registry/binding repair;
- batch migration;
- art-direction revision propagation.

The task class determines which gates and representations are mandatory.

---

# 05. Task Intake Record

Before authoring begins, the agent must create or resolve a production task record containing, at minimum:

- task ID;
- requested canonical identity or scoped content family;
- requested product/representation;
- task class;
- source authority references;
- target Forge tool/workspace;
- known dependencies;
- required variants/states;
- requested acceptance scope;
- migration status if replacing existing content;
- provenance requirements;
- output locations;
- known blockers or uncertainties.

Free-form “make this cooler” work is not a sufficient production brief without authority resolution.

---

# 06. Authority Lookup Order

The agent resolves sources in this order:

1. current constitutional/governance authority;
2. current stable registry/canonical identity authority;
3. current product/content canon and relevant FCC/PRD/system authority;
4. ART-00 through ART-08;
5. Forge system contracts and specialist authoring documents;
6. engineering implementation constraints;
7. current golden references and certified family assets;
8. approved migration/override records;
9. historical POC/legacy evidence only where still useful.

Lower authority cannot silently override higher authority.

---

# 07. Freshness and Supersession Check

Before relying on a source, Codex must determine whether it is current, superseded, historical, deferred or migration-only.

A recently modified old document is not automatically current canon.

Where source status cannot be resolved, the task stops at authority resolution rather than guessing.

---

# 08. Canonical Identity Resolution

The agent must resolve the stable gameplay/content identity before presentation work begins.

The record must distinguish:

- canonical identity;
- presentation family;
- Forge source asset;
- representation products;
- variants;
- runtime states;
- generated outputs.

Visual work never creates a second gameplay identity merely because the asset needs a held, dropped, equipped, icon, preview, damaged or biome-specific representation.

---

# 09. Identity-Ambiguity Rule

If two sources appear to describe the same thing under different IDs, or one ID appears to cover semantically incompatible things, Codex must not merge or split them independently.

It creates a registry/canon escalation record.

---

# 10. Presentation Requirement Matrix

For every canonical identity, ART-09 requires a resolved representation matrix.

Possible representation rows include:

- world/placed;
- held;
- equipped;
- dropped;
- inventory icon;
- Codex image;
- blueprint/build preview;
- damaged/broken;
- active/inactive;
- construction stages;
- animation clips;
- VFX states;
- audio one-shots/loops;
- LOD/runtime tiers;
- accessibility-safe presentation;
- culture/biome/realm variants.

Each row is marked **required**, **optional**, **not applicable** or **blocked by upstream authority**.

---

# 11. Dependency Resolution

Before authoring, Codex resolves dependencies such as:

- parent material family;
- parent shape/model family;
- body plan/skeleton;
- equipment attachment standard;
- animation vocabulary;
- machine state contract;
- magic school/effect semantics;
- audio material family;
- UI/icon semantic role;
- culture/realm/biome styling;
- construction/blueprint modules;
- vessel structural role;
- known runtime sockets/ports/markers;
- current performance/LOD constraints.

Unknown dependencies are blockers, not opportunities for improvising gameplay truth.

---

# 12. ART Rule Resolution Packet

Each task produces an ART rule packet that identifies which rules from ART-01 through ART-08 apply.

The packet should be as narrow as possible while still complete.

Example:

```text
Iron Rune Miner
- ART-01: global silhouette, material truth, readability, escalation rules
- ART-02: iron, stone, mana crystal, wear, emission and state overlays
- ART-03: culture/realm context if variant requested
- ART-04: machine grammar, ports, moving parts, pivots, collision, projections
- ART-05: only if animated entity/character interaction applies
- ART-06: mana flow, rune activation, machine fault effects
- ART-07: mechanism, load, fault, rune/mana audio layers
- ART-08: inventory icon, machine inspection thumbnail/status imagery
```

---

# 13. Golden Reference Selection

Before significant authoring, Codex identifies the closest certified ART-10 reference assets or scenes.

Golden references are constraints and comparison anchors, not copy templates.

The agent records:

- reference IDs;
- why each reference applies;
- what may be inherited;
- what must remain distinct.

If no suitable golden reference exists, the asset may become a candidate reference after review.

---

# 14. Asset Family Resolution

Codex must decide whether the target:

- belongs to an existing asset family;
- derives from an existing parent;
- requires a bounded variant;
- requires a genuinely new family.

New family creation is more consequential than a child asset and may require owner/art-direction review.

---

# 15. Inheritance Before Reinvention

Where a parent family already defines scale, material DNA, texture language, shape rules, rig, socket conventions, sound family, icon framing or state grammar, the child inherits those rules by default.

Overrides must be intentional and recorded.

---

# 16. Variant Classification

Every variant is classified by cause, such as:

- material;
- culture;
- biome;
- realm;
- age;
- damage;
- weather;
- corruption;
- charge/power;
- gameplay state;
- deterministic cosmetic seed;
- accessibility/scalability tier.

Codex may not use “variant” as a bucket for unexplained visual divergence.

---

# 17. Bounded Inference Envelope

Codex may autonomously infer low-risk production details when all of the following are true:

1. higher authority does not specify the detail;
2. the detail does not create or change gameplay truth;
3. the detail stays inside locked ART rules;
4. the detail is reversible;
5. the detail does not materially alter stable identity;
6. the detail can be validated against references and family rules;
7. provenance records the inference.

Examples may include modest wear placement, deterministic knot variation, safe secondary beveling, non-semantic idle variation, minor decorative distribution or equivalent presentational choices.

---

# 18. Forbidden Autonomous Inference

Codex must not independently invent:

- new materials with gameplay implications;
- new crafting requirements;
- new stats;
- new progression tiers;
- new magic behaviour;
- new creature abilities;
- new culture or ancestry canon;
- new realm laws;
- new settlement capability rules;
- new map knowledge mechanics;
- new surveying mechanics;
- new UI permissions or interactions;
- new network/automation semantics;
- new vessel physics;
- hidden-world information;
- save/network/schema behaviour;
- release-critical performance budgets;
- new stable gameplay identities.

---

# 19. Cross-Authority Handoff Register

When an art task exposes a missing non-art decision, Codex creates a **Cross-Authority Handoff** instead of resolving it inside ART.

Required fields:

- handoff ID;
- originating asset/task;
- unresolved question;
- why ART cannot own it;
- suspected owning authority;
- affected ART products;
- temporary safe assumption, if any;
- blocker severity;
- required follow-up document/work item;
- status.

This register is visible to the Project Brain and relevant governance owners.

---

# 20. Cartography Cross-Authority Rule

The advanced/3D cartography direction in ART-08 is a canonical **presentation architecture**, not a mechanics specification.

ART-08/ART-09 may govern:

- visual map tiers;
- map relief/volumetric presentation;
- symbols, layers and confidence styling;
- accessible 2D equivalents;
- visual occlusion and readability;
- Forge map-preview art products.

They may not independently decide:

- how maps are crafted or upgraded;
- how surveying works;
- how knowledge is discovered;
- what sensing magic can reveal;
- confidence/age simulation rules;
- multiplayer knowledge sharing;
- map progression costs;
- persistence/network schemas;
- performance architecture for runtime 3D map data.

Those mechanics must be reconciled into the appropriate non-art gameplay/UI/cartography/engineering authorities before implementation.

---

# 21. Production Plan

Before modifying source, Codex creates a concise production plan containing:

- target identity;
- required representations;
- parent/family dependencies;
- ART rules;
- golden references;
- Forge tool path;
- authoring order;
- validation plan;
- expected generated outputs;
- known risks;
- escalation points.

For batch work, the plan may be shared at family level with per-asset deltas.

---

# 22. Forge Source Is the Editable Art Authority

Production assets must resolve to reproducible editable Forge source where the Forge supports that asset class.

Runtime meshes, baked textures, captures, icons, animation resources, thumbnails and package products are generated outputs.

Manual edits to generated outputs are prohibited unless a specialist pipeline explicitly declares them authoritative.

---

# 23. Source Locality and Repository Rule

Forge source, manifests, generated-product metadata and production records must live in the repository-defined locations established by the final repository/Forge engineering authorities.

ART-09 defines the required relationships, not hard-coded directory paths before repository bootstrap finalises them.

---

# 24. Deterministic Authoring Inputs

Where procedural or generated authoring is used, the task records the deterministic inputs required to reproduce it, including as applicable:

- source identity;
- parent family version;
- seed;
- generator/tool version;
- rule-set version;
- palette/material version;
- variant parameters;
- capture profile;
- bake profile.

---

# 25. Material and Texture Authoring Gate

Material/texture work follows ART-02 before downstream projection products are accepted.

The asset must not advance if material family, derivation, palette role or critical state overlay is unresolved.

---

# 26. Model and Blueprint Authoring Gate

Model/blueprint work follows ART-04 and applicable Forge/blueprint contracts.

Required checks include as applicable:

- scale;
- silhouette;
- orientation;
- pivots;
- sockets;
- collision intent;
- ports/connections;
- negative space;
- construction stages;
- held/equipped/drop projections;
- damage/restoration forms;
- LOD/source separation.

---

# 27. Entity/Rig/Animation Gate

Entity production follows ART-05 and Set 22 technical rigging/animation authority.

A visually appealing creature is incomplete without required body-plan semantics, skeleton/attachment compatibility, locomotion, interaction anchors, combat/casting telegraphs and LOD behaviour.

---

# 28. VFX/Lighting Gate

Effects follow ART-06.

Every gameplay-significant effect must resolve:

- source;
- phase/timing;
- direction/shape;
- medium;
- interaction with materials;
- semantic state;
- reduced-motion/flash behaviour;
- low-end fallback.

Colour alone is never the entire semantic contract.

---

# 29. Audio Gate

Audio follows ART-07.

Required production must address as applicable:

- source/attachment point;
- one-shot/loop/state classification;
- material/family identity;
- variation/repetition policy;
- spatial behaviour;
- gameplay priority;
- accessibility redundancy;
- provenance/licensing.

---

# 30. Icon, Thumbnail and 2D Gate

ART-08 controls icon/capture/diagram/map-product presentation.

Where a 3D form itself is the identity, deterministic Forge capture is preferred over an unrelated hand-painted reinterpretation unless ART-08 explicitly permits illustration.

---

# 31. Projection Consistency Gate

Placed, held, equipped, dropped, icon, Codex, preview and blueprint representations must remain recognisably the same canonical thing.

Differences in scale, simplification or camera framing are allowed; identity drift is not.

---

# 32. State Completeness Gate

Codex must identify all presentation-bearing runtime states supplied by authority.

Examples:

- off/on;
- idle/working;
- powered/unpowered;
- empty/full;
- blocked/fault;
- safe/danger;
- intact/damaged/broken;
- dry/wet/frozen/burning;
- uncharged/charged;
- uncorrupted/corrupted;
- closed/open;
- construction stages;
- boss phases;
- injured/dead;
- discovered/unknown/rumoured/outdated.

Missing state products are explicit incompleteness, not implicit future work.

---

# 33. Variant Completeness Gate

A family may not be declared complete until required material, cultural, biome, realm, age, state, damage and accessibility/scalability variants are either produced or explicitly marked not applicable/deferred by authority.

---

# 34. Family Completeness Record

For scalable production, Codex maintains a family matrix tracking:

- canonical members;
- parent inheritance;
- required representations;
- required states;
- required variants;
- current source status;
- validation status;
- certification status;
- migration status.

This enables ART-10 to test coverage rather than only individual examples.

---

# 35. Bake Contract

Bake/export converts approved editable source into deterministic runtime products.

The bake must not silently alter gameplay identity or semantics.

Bake products may include:

- runtime mesh/voxel products;
- textures/material resources;
- collision products;
- animation resources;
- VFX/audio references;
- icons/thumbnails;
- LODs;
- manifests;
- dependency metadata;
- preview products.

---

# 36. Bake Reproducibility

Equivalent approved source, relevant tool versions and bake configuration should produce equivalent product manifests.

Non-deterministic generation that materially changes presentation must use controlled seeds or approved variation logic.

---

# 37. Registry and Manifest Binding

After authoring/bake, products bind back to stable gameplay/content identities through the approved registry/manifest pipeline.

Codex must validate:

- canonical ID exists;
- binding target is correct;
- expected representations resolve;
- no unintended identity duplication occurs;
- dependencies resolve;
- parent/fallback behaviour remains valid;
- migration/override precedence is correct.

---

# 38. Override Rule

Presentation overrides preserve gameplay identity unless the owning gameplay authority explicitly creates a new identity.

Overrides must declare:

- target;
- layer(s) replaced;
- inherited fallback;
- scope;
- reason;
- version;
- compatibility/migration notes.

---

# 39. Migration Rule

Legacy/POC replacement is a controlled migration, not simple deletion.

Until replacement passes required gates, the previous product remains an explicit fallback where technically feasible.

Removal/deprecation occurs only after replacement validation and compatibility review.

---

# 40. POC Asset Treatment

POC visuals are evidence for:

- functional hooks;
- scale/proportion lessons;
- runtime constraints;
- state coverage;
- interaction/camera requirements;
- migration test cases.

They are not automatically final art references.

---

# 41. Automated Validation Layers

ART-09 expects machine-checkable validation wherever practical, including:

- schema validity;
- registry identity validity;
- dependency completeness;
- missing product detection;
- missing sockets/pivots/markers;
- illegal dimensions/orientation;
- palette/material-family linkage;
- animation/event contract presence;
- required state coverage;
- icon/capture presence;
- deterministic bake checks;
- file/provenance metadata;
- LOD/fallback presence;
- accessibility metadata;
- packaging manifest validity.

Automated validation does not replace visual review.

---

# 42. Visual Test Environment Requirement

Important assets must be reviewed in controlled Forge/test-room environments that support relevant comparisons such as:

- neutral lighting;
- representative Overworld lighting;
- dark/interior lighting;
- realm lighting where applicable;
- held/equipped view;
- world scale;
- animation playback;
- state switching;
- damage variants;
- icon/capture preview;
- LOD distances;
- accessibility profiles.

---

# 43. In-Context Review Requirement

Studio/test-room approval is necessary but not sufficient for consequential assets.

The asset must also be reviewed in representative gameplay context where scale, terrain, weather, neighbouring assets, UI, combat distance, settlement density or movement can change readability.

---

# 44. Silhouette Review

Objects/entities that must be recognised quickly receive silhouette review at intended gameplay distance.

Micro-detail cannot compensate for failed silhouette identity.

---

# 45. Material-Family Review

Derived products are compared against their material-family references.

A gear made of copper, a copper plate and a copper machine trim must remain recognisably related without becoming identical.

---

# 46. Motion Review

Animated content is reviewed for:

- anatomy;
- weight;
- contacts;
- timing;
- action readability;
- equipment fit;
- transitions;
- first/third-person coherence where applicable;
- reduced-motion behaviour;
- LOD behaviour.

---

# 47. Effects Review

VFX/lighting is reviewed with bloom reduced/off, reduced flashes and lower particle profiles where applicable.

Critical effects must remain understandable without colour alone.

---

# 48. Audio Review

Audio is reviewed for:

- source legibility;
- material/phenomenon identity;
- repetition fatigue;
- spatial behaviour;
- priority mixing;
- gameplay masking;
- low/high density scenes;
- accessibility alternatives.

---

# 49. UI/Icon Review

2D products are tested at intended UI sizes, high UI scale, controller/keyboard focus states, colour-reduced/high-contrast conditions and representative localisation expansion.

---

# 50. Scalability Review

Every consequential asset family must identify which presentation layers may be simplified at lower profiles and which identity/state cues are non-negotiable.

Low-end profiles may reduce complexity; they may not make the game semantically misleading.

---

# 51. Accessibility Review

Where information is gameplay-significant, Codex validates that ART presentation requirements survive relevant accessibility modes, including as applicable:

- reduced motion;
- reduced flashes;
- reduced bloom;
- high contrast;
- non-colour redundancy;
- UI/text scaling;
- captions/text equivalents;
- 2D alternatives to spatially complex 3D UI presentation.

---

# 52. Failure Classification

Production failures are classified at minimum as:

- **AUTHORITY** — canon/governance conflict or gap;
- **IDENTITY** — registry/stable-ID ambiguity;
- **DEPENDENCY** — required parent or product missing;
- **ART-DIRECTION** — violates ART rules;
- **TECHNICAL** — Forge/bake/runtime integration failure;
- **COMPLETENESS** — representation/state/variant missing;
- **PERFORMANCE** — exceeds validated constraints;
- **ACCESSIBILITY** — critical information fails accessible presentation;
- **PROVENANCE** — source/licence/generation lineage incomplete;
- **MIGRATION** — replacement breaks compatibility or fallback;
- **REGRESSION** — previously certified behaviour/presentation degraded.

---

# 53. Stop-and-Escalate Conditions

Codex must stop autonomous completion and escalate when:

- canonical identity is missing or contradictory;
- required gameplay behaviour is undefined;
- two authorities conflict materially;
- a new content family with gameplay meaning would be invented;
- a new magic/realm/culture rule is required;
- a visual feature would expose hidden world truth;
- an art decision would change accessibility semantics;
- a registry/schema/network/save change is required;
- a new performance exception is needed;
- licensing/provenance is uncertain;
- a migration would break stable identity or persistence;
- a golden-reference conflict cannot be reconciled;
- owner review is explicitly required by another authority.

---

# 54. Escalation Is a Successful Outcome

A correctly classified escalation is not task failure.

It is preferable to a polished but canonically invalid asset.

---

# 55. Temporary Assumption Rule

A temporary assumption is permitted only if:

- it does not change gameplay truth;
- it is reversible;
- it is visibly marked temporary;
- it cannot accidentally ship as final without a gate failure;
- the unresolved owner is recorded.

---

# 56. Agent Production Report

Every completed or halted task emits an Art Production Agent Report containing, at minimum:

- task ID;
- canonical identity;
- task class;
- authority sources consulted;
- ART rules applied;
- references used;
- inherited family;
- autonomous inferences made;
- source assets created/changed;
- generated products;
- registry/manifest changes;
- validation results;
- context-review result;
- accessibility/scalability result;
- provenance/licensing record;
- unresolved handoffs;
- failures/escalations;
- final status;
- suggested reusable skill/procedure discoveries.

---

# 57. Work Log Integration

ART production participates in the project-wide work-log system.

The log records what changed, why, how it was validated and which authority justified the result.

It should link rather than duplicate authoritative documents.

---

# 58. Skills / Procedures / Shortcuts Promotion

If Codex discovers a repeatable safe method—such as an improved deterministic capture routine, family-generation procedure, validation shortcut, rig-transfer method or material derivation technique—it should create a candidate Skills/Procedures/Shortcuts entry under Project Brain governance.

The discovery must include:

- trigger/use case;
- exact procedure;
- inputs/outputs;
- safety boundaries;
- validation evidence;
- known failure modes;
- whether it changes any authority.

No discovered shortcut may bypass required gates.

---

# 59. Anti-Pattern Recording

Repeated failures should be promoted into the project's failure/antipattern knowledge so future agents do not rediscover the same mistake.

Examples:

- duplicate gameplay IDs created for presentation forms;
- hand-edited bake outputs;
- colour-only state semantics;
- magic-school recolour generation;
- generic machine cube generation;
- wrong inherited material DNA;
- invalid grip/pivot assumptions;
- missing damage/state representations;
- inaccessible 3D-map-only information;
- source files without provenance.

---

# 60. Batch Production

Batch generation is allowed only after the family template and a representative member pass the required gates.

The recommended pattern is:

```text
family authority resolution
→ golden/representative asset
→ validate
→ freeze bounded generation rules
→ batch children
→ automated family audit
→ sampled in-context review
→ outlier review
→ certification
```

Mass generation before reference approval is prohibited for consequential families.

---

# 61. Batch Outlier Detection

Batch pipelines should detect likely outliers in:

- dimensions;
- palette/material assignment;
- silhouette class;
- socket presence;
- file size/complexity;
- state count;
- animation count;
- icon framing;
- variant coverage;
- LOD structure;
- bake manifest.

Outliers are reviewed rather than silently normalised.

---

# 62. Family Propagation Rule

When an approved parent-family rule changes, Codex first computes the affected dependency set.

It must not blindly regenerate all children where overrides or migration constraints exist.

---

# 63. Art-Direction Change Procedure

A consequential ART rule change requires:

1. authority update;
2. dependency impact analysis;
3. golden-reference impact review;
4. affected-family list;
5. migration strategy;
6. staged regeneration;
7. regression validation;
8. ART-10 recertification where required.

---

# 64. Source-Control Rule

Agent production changes must be source-control friendly:

- bounded task scope;
- deterministic generated outputs where feasible;
- reviewable manifests;
- no unrelated churn;
- migration records for renamed/moved authority;
- clear separation of source and generated products where repository architecture supports it.

The final Git mechanics remain owned by ENG-GOV.

---

# 65. Concurrency Rule

Multiple agents may work concurrently only when task ownership and overlapping asset families are explicit.

Two agents must not independently redefine the same parent family, golden reference or manifest binding without coordination.

---

# 66. Locking and Ownership

The production system should support logical ownership/claims at task or asset-family level where required to avoid conflicting edits.

A claim does not grant authority to change canon.

---

# 67. Provenance Requirements

Each source asset records as applicable:

- creator/agent/tool;
- source authorities;
- generator/model/tool versions;
- external references;
- licence/rights status;
- AI-assisted/generated status where relevant;
- source date/version;
- transformation history;
- review/approval history.

---

# 68. External Reference Rule

External art/audio references may inform production only when their rights and role are understood.

A reference is inspiration/evidence, not permission to reproduce protected expression.

Codex should prefer internal ART/golden references for style matching.

---

# 69. AI-Generated Source Rule

AI-assisted art/audio may be used only under project-approved rights/provenance policy and still must pass all ART and technical gates.

“AI generated it” never substitutes for editable source, lineage, validation or ownership clarity.

---

# 70. Capture and Thumbnail Determinism

Forge captures used for icons, portraits, previews or comparison should use versioned capture profiles controlling as applicable:

- camera;
- framing;
- lighting;
- background;
- pose/state;
- scale;
- resolution;
- accessibility/profile variant.

This makes visual regression review practical.

---

# 71. Golden Reference Candidate Promotion

An asset may be proposed as a new ART-10 golden reference when it:

- resolves a previously underdefined family;
- demonstrates a reusable pattern;
- passes full production gates;
- has strong provenance;
- has stable canonical authority;
- is representative without being overly idiosyncratic.

Promotion requires ART-10 process, not unilateral agent declaration.

---

# 72. Approval Levels

ART-09 distinguishes at least:

- **SOURCE VALID** — editable source passes structural checks;
- **REPRESENTATION VALID** — a specific product/view passes;
- **FAMILY VALID** — required family members/variants pass;
- **RUNTIME VALID** — bake/bind/runtime checks pass;
- **ART APPROVED** — visual/audio direction accepted;
- **MIGRATION APPROVED** — safe replacement/fallback confirmed;
- **RELEASE READY** — all required representations and system gates pass;
- **ART-10 CERTIFIED** — certified against golden/regression framework where required.

Approval is representation-specific until the full package is complete.

---

# 73. Partial Approval Rule

A model may be approved while its icon, animation, VFX, LOD or audio remains incomplete.

The canonical asset package remains non-release-ready until every required representation passes.

---

# 74. Production Status Vocabulary

Recommended task/asset statuses:

- UNASSESSED;
- AUTHORITY_RESOLVED;
- BLOCKED_UPSTREAM;
- PLANNED;
- SOURCE_IN_PROGRESS;
- SOURCE_VALID;
- PRODUCTS_IN_PROGRESS;
- VALIDATION_FAILED;
- REVIEW_REQUIRED;
- REVISION_REQUIRED;
- ART_APPROVED;
- MIGRATION_PENDING;
- RUNTIME_VALID;
- RELEASE_READY;
- CERTIFIED;
- DEPRECATED;
- SUPERSEDED.

---

# 75. No Silent Completion

If any required representation, state, validation or handoff remains unresolved, the task must not be reported as simply “done.”

The report states exactly what is complete and what is not.

---

# 76. No Silent Canon Repair

If source canon is inconsistent, Codex may describe the inconsistency and propose a resolution, but it may not edit the owning canon as a side effect of art production unless explicitly tasked under that authority.

---

# 77. No Silent Engineering Repair

If Forge or runtime implementation cannot support a required ART behaviour, Codex may create an engineering task/ADR/debt item as appropriate, but must not weaken ART requirements inside the source asset just to make the current implementation pass.

Temporary fallbacks must be labelled.

---

# 78. No Silent Scope Expansion

Producing a sword does not automatically author a new metallurgy tree, combat move-set, culture, quest, enchantment system or crafting station.

Production scope expands only through explicit authority/task updates.

---

# 79. Codex Single-Asset Procedure

For a normal single asset, Codex should execute:

1. identify task class;
2. resolve canonical ID;
3. resolve authority freshness;
4. build representation matrix;
5. resolve dependencies;
6. collect ART rules;
7. select golden references;
8. select/infer family parent;
9. classify permitted variants;
10. identify non-art gaps;
11. create cross-authority handoffs if needed;
12. plan Forge source;
13. author source geometry/materials;
14. add rigs/animation/VFX/audio as applicable;
15. generate 2D/capture products;
16. complete states/variants/LOD;
17. bake;
18. bind registry/manifest;
19. run automated validation;
20. review in test room;
21. review in gameplay context;
22. test accessibility/scalability;
23. record provenance;
24. emit agent/work report;
25. promote reusable discoveries;
26. request approval/certification or revise.

---

# 80. Codex Family-Production Procedure

For a scalable family:

1. resolve family authority;
2. enumerate canonical members;
3. identify inherited vs unique fields;
4. create representation/variant matrix;
5. choose a golden representative;
6. author and fully validate the representative;
7. freeze bounded generation rules;
8. generate children deterministically;
9. validate every child structurally;
10. sample and review visual outliers;
11. review family consistency and differentiation;
12. complete migration/bindings;
13. emit family report;
14. certify family or return failures to queue.

---

# 81. Codex Migration Procedure

For replacement of legacy/POC assets:

1. capture current identity and runtime dependencies;
2. record old source/product paths and bindings;
3. classify what is presentation-only vs semantic;
4. preserve stable identity where authority permits;
5. author replacement Forge source;
6. reproduce required representation/state contracts;
7. validate old/new comparisons;
8. test save/runtime compatibility where relevant;
9. retain fallback until accepted;
10. switch binding explicitly;
11. regression test;
12. deprecate/remove legacy output only after migration approval.

---

# 82. Codex Corrective-QA Procedure

For a failed asset:

1. classify failure;
2. identify owning layer;
3. reproduce in controlled test;
4. fix source rather than generated product where possible;
5. rerun the narrow validator;
6. rerun affected family/regression gates;
7. update work/failure record;
8. promote a reusable antipattern or validator if recurrence risk is meaningful.

---

# 83. Minimum Production Package by Asset Class

## Block / construction form
Typically requires source model/shape, material family, orientation, collision intent, held/drop/icon projection as applicable, state variants, bake products and registry binding.

## Item / tool / weapon / equipment
Typically requires source model, material family, grip/equip anchors, held/equipped/drop/icon products, damage/wear where relevant, animation compatibility and registry binding.

## Machine / magic infrastructure
Typically requires model, ports/sockets, moving parts, state grammar, VFX, audio, icon/inspection products, LOD, collision and runtime binding.

## Character / creature
Typically requires body source, materials, skeleton/rig, locomotion, required action clips, equipment/interaction anchors, combat/hit-region compatibility, audio/VFX where applicable, icons/portraits and LOD.

## Structure / blueprint
Typically requires material roles, modules/blueprint source, entrances/routes/markers, construction stages, damage/restoration, network/interaction markers, thumbnail/preview and context validation.

## Vessel
Typically requires voxel-authored structural presentation, hull/deck/rigging/propulsion visual roles, moving parts, damage/flooding presentation hooks where supplied by vessel authority, crew/cargo/interaction anchors, icon/preview and LOD.

## VFX package
Typically requires source/medium/phase semantics, particle/shader/light products, material interaction, accessibility fallbacks, LOD and event/state binding.

## Audio package
Typically requires source recordings/synthesis, variation set, loop/one-shot/state configuration, spatial/source sockets, priority/mix expectations, accessibility notes and provenance.

## UI/icon/cartography package
Typically requires semantic source, icon/panel/map assets, state/focus variants, capture profile where applicable, localisation/accessibility tests and knowledge-filter contract.

---

# 84. The Forge Integration Contract

The Forge should ultimately expose ART-09 as an executable production workflow rather than requiring an agent to remember it manually.

Desirable workflow support includes:

- authority/source links in asset inspectors;
- family/parent display;
- representation matrix;
- state/variant checklist;
- golden-reference panel;
- source-vs-generated distinction;
- deterministic bake controls;
- validation panel;
- test-room launch;
- context-preview launch;
- capture profiles;
- provenance panel;
- migration/fallback panel;
- cross-authority handoff action;
- agent report generation;
- certification state.

Engineering implementation belongs to FORGE-ENG/LFE/ENG-GOV; ART-09 defines the production behaviour that tooling should enable.

---

# 85. Project Brain Integration Contract

The Brain should be able to answer for any production asset:

- what canonical thing it represents;
- which documents govern it;
- which family it belongs to;
- what source asset is authoritative;
- what products exist;
- what state/variant coverage exists;
- what has been approved/certified;
- what migration replaced it;
- what handoffs/blockers remain;
- what reusable procedures were learned.

The Brain indexes status; it does not become the art authority.

---

# 86. ART-10 Interface

ART-09 produces the records ART-10 needs to certify assets and families.

ART-10 consumes:

- authority packet;
- source/bake manifest;
- golden-reference mapping;
- representation matrix;
- family matrix;
- automated validation results;
- context captures;
- accessibility/scalability evidence;
- provenance;
- migration evidence;
- agent/work reports.

---

# 87. Production Readiness Gate

The Leyforge art-production handoff is operationally ready when:

- ART-00 through ART-09 are locked;
- ART-10 certification framework is available;
- Forge source/bake/registry paths exist for target asset classes;
- Project Brain can resolve authority and status;
- Codex has access to required sources and Forge tools;
- representative golden assets exist;
- validators cover identity, representation, state and manifest basics;
- work/provenance/handoff logging is active.

Not every final asset must exist before the rebuild starts; the **production contract** must exist.

---

# 88. Pre-Rebuild Rule

The fresh production rebuild must not begin mass final-asset generation before ART-09 is locked and the ART-10 minimum certification path is established.

Prototype/engineering placeholders may still be used where explicitly labelled.

---

# 89. Lock-Candidate Decisions

**ART09-D01** — Codex may autonomously manufacture assets only after resolving canonical identity, authority, ART rules, Forge source products and acceptance gates.  
**ART09-D02** — Missing gameplay/canon/engineering decisions are escalated rather than silently invented during art production.  
**ART09-D03** — Editable Forge source is the art-production source of truth where the Forge supports the asset class; runtime products are reproducible outputs.  
**ART09-D04** — Every asset task begins with a structured task-intake record.  
**ART09-D05** — Every task resolves authority freshness/supersession before authoring.  
**ART09-D06** — Presentation forms never create duplicate gameplay identities merely because they require different models/captures.  
**ART09-D07** — Every canonical identity receives a representation requirement matrix.  
**ART09-D08** — Dependencies are resolved before authoring; unknown semantic dependencies block autonomous completion.  
**ART09-D09** — Every task resolves a narrow ART rule packet from ART-01 through ART-08.  
**ART09-D10** — Consequential work selects and records appropriate ART-10 golden references before authoring.  
**ART09-D11** — Existing family inheritance is used before creating new art families.  
**ART09-D12** — Variants are classified by explicit cause rather than unexplained style divergence.  
**ART09-D13** — Autonomous inference is allowed only for reversible low-risk presentation detail inside the locked authority envelope.  
**ART09-D14** — Codex may not autonomously invent gameplay, progression, culture, realm, stable identity, save/network or performance-law decisions.  
**ART09-D15** — Missing non-art decisions create Cross-Authority Handoff records visible to the Project Brain.  
**ART09-D16** — ART-08 advanced/3D cartography remains a presentation authority; its mechanics must be reconciled into appropriate non-art authorities.  
**ART09-D17** — Production plans identify representations, inheritance, rules, references, authoring order, validation and escalation points.  
**ART09-D18** — Generated runtime products are not manually edited as authoritative source unless a specialist pipeline explicitly defines them as source.  
**ART09-D19** — Procedural authoring records deterministic reproduction inputs.  
**ART09-D20** — Material, model, entity/animation, VFX, audio and 2D products each pass their applicable ART gate before release readiness.  
**ART09-D21** — Placed, held, equipped, dropped, icon, Codex and preview products remain recognisably one canonical identity.  
**ART09-D22** — All authority-supplied presentation states are explicitly completed or recorded as blocked/deferred.  
**ART09-D23** — Families are not complete until required variants/states/representations are accounted for.  
**ART09-D24** — Bakes are deterministic/reproducible enough for manifest and regression review.  
**ART09-D25** — Registry/manifest binding validates stable identity, dependencies, representation resolution and override precedence.  
**ART09-D26** — Visual overrides preserve gameplay identity unless the owning gameplay authority explicitly creates a new identity.  
**ART09-D27** — Legacy/POC replacement is controlled migration with fallback until replacement gates pass.  
**ART09-D28** — POC visuals are evidence and migration inputs, not automatic final-art authority.  
**ART09-D29** — Automated validators supplement rather than replace visual/audio/context review.  
**ART09-D30** — Consequential assets are reviewed both in controlled Forge/test rooms and representative gameplay context.  
**ART09-D31** — Accessibility and low-end/scalability review are required production gates where applicable.  
**ART09-D32** — Production failures use standard classifications so ownership and remediation are explicit.  
**ART09-D33** — Correct escalation is a valid successful task outcome.  
**ART09-D34** — Temporary assumptions are reversible, labelled, blocked from accidental final shipment and assigned an owner.  
**ART09-D35** — Every completed/halted agent task emits a structured Art Production Agent Report.  
**ART09-D36** — Art work integrates with project-wide work logs rather than keeping isolated agent memory.  
**ART09-D37** — Reusable production discoveries are promoted to the Brain Skills/Procedures/Shortcuts system with safety and validation boundaries.  
**ART09-D38** — Repeated failures are promoted into failure/antipattern knowledge.  
**ART09-D39** — Batch generation begins only after a representative/golden family member validates the bounded generation rules.  
**ART09-D40** — Batch pipelines perform structural validation plus outlier review.  
**ART09-D41** — Parent-family changes use dependency analysis before propagation/regeneration.  
**ART09-D42** — Consequential art-direction changes trigger migration and ART-10 regression/recertification as required.  
**ART09-D43** — Agent production remains source-control friendly and does not create unrelated generated churn.  
**ART09-D44** — Parallel agents require explicit overlapping-asset/family ownership coordination.  
**ART09-D45** — Source assets carry creator/tool/source/licence/generation/review provenance.  
**ART09-D46** — AI-assisted/generated art/audio must still satisfy rights, editable-source, lineage and validation requirements.  
**ART09-D47** — Capture/thumbnail profiles are versioned and deterministic enough for regression comparison.  
**ART09-D48** — Approval is representation-specific until the whole canonical package satisfies release-readiness requirements.  
**ART09-D49** — No task may report silent completion while required products, states, handoffs or validation remain unresolved.  
**ART09-D50** — Codex does not silently repair canon or engineering authority as a side effect of art production.  
**ART09-D51** — The Forge should eventually expose ART-09 as an executable workflow with authority, family, matrix, validation, provenance, migration and certification support.  
**ART09-D52** — The Project Brain indexes art authority/status/handoffs/procedures but does not replace ART authority.  
**ART09-D53** — ART-09 output records form the principal evidence package consumed by ART-10 certification.  
**ART09-D54** — Mass final-asset generation for the fresh rebuild waits until ART-09 is locked and a minimum ART-10 certification path exists.  

---

# 90. Owner Lock Checklist

Before locking ART-09, confirm:

- [ ] the end-to-end task flow is accepted;
- [ ] Codex inference limits are accepted;
- [ ] cross-authority escalation is accepted;
- [ ] 3D cartography presentation/mechanics separation is accepted;
- [ ] Forge source vs generated-product authority is accepted;
- [ ] representation/state/family completeness gates are accepted;
- [ ] migration/fallback rules are accepted;
- [ ] provenance and AI-assisted source rules are accepted;
- [ ] work-log and Skills/Procedures/Shortcuts promotion are accepted;
- [ ] batch-generation restrictions are accepted;
- [ ] Project Brain/Forge/ART-10 interfaces are accepted;
- [ ] pre-rebuild mass-production gate is accepted.

---

# 91. Closing Production Law

Leyforge's final art pipeline must be capable of scaling from one hand-authored block to thousands of assets without turning artistic consistency into guesswork or governance into manual babysitting.

ART-09 therefore makes the production method itself part of the project architecture.

> **Resolve what the thing is. Resolve which rules govern how it must present. Inherit before reinventing. Build editable Forge source. Generate every required representation. Validate identity, state, accessibility, scalability and runtime binding. Record provenance and what was learned. Escalate what art does not own. Certify before mass propagation.**

This is the operational handoff that allows Codex and The Forge to create Leyforge rather than merely decorate it.

---

# Appendix A — Art Production Task Intake Template

```yaml
art_task:
  task_id: ART-TASK-XXXX
  title: ""
  task_class: ""
  canonical_identity: ""
  canonical_registry: ""
  requested_products: []
  authority_sources: []
  art_rule_sources: []
  forge_workspace: ""
  parent_family: ""
  required_representations: []
  required_states: []
  required_variants: []
  golden_references: []
  migration_from: null
  known_dependencies: []
  known_blockers: []
  provenance_requirements: []
  output_scope: []
  acceptance_scope: []
```

---

# Appendix B — Representation Matrix Template

| Representation / State | Required? | Source Product | Generated Product | Validator | Review | Status | Notes |
|---|---|---|---|---|---|---|---|
| World / placed | | | | | | | |
| Held | | | | | | | |
| Equipped | | | | | | | |
| Dropped | | | | | | | |
| Inventory icon | | | | | | | |
| Codex image | | | | | | | |
| Blueprint / preview | | | | | | | |
| Active / inactive | | | | | | | |
| Damage states | | | | | | | |
| Construction states | | | | | | | |
| LOD / low-end | | | | | | | |
| Accessibility fallback | | | | | | | |

Additional rows are added for the asset's actual authoritative states and variants.

---

# Appendix C — Cross-Authority Handoff Template

```yaml
cross_authority_handoff:
  handoff_id: XAUTH-XXXX
  originating_task: ""
  originating_art_document: ""
  subject: ""
  unresolved_question: ""
  reason_art_cannot_own: ""
  suspected_owner: []
  affected_art_products: []
  safe_temporary_assumption: null
  implementation_blocked: true
  severity: ""
  required_follow_up: []
  status: OPEN
```

---

# Appendix D — Initial Cross-Authority Handoff: Advanced / 3D Cartography

```yaml
cross_authority_handoff:
  handoff_id: XAUTH-ART-0001
  originating_task: "ART-08 / ART-09 corpus integration"
  originating_art_document: "ART-08"
  subject: "Ordinary → surveyed → magical relief/volumetric cartography gameplay integration"
  unresolved_question: >
    Which authoritative gameplay systems control map crafting/upgrading, surveying,
    knowledge acquisition, confidence and age, magical sensing, multiplayer knowledge
    sharing, persistence, progression and runtime 3D-map data/scalability?
  reason_art_cannot_own: >
    ART-08 defines presentation and accessibility only. These decisions alter gameplay
    truth, progression, simulation, networking, persistence and runtime architecture.
  suspected_owner:
    - "map/cartography gameplay authority"
    - "Document 17 / UI-UX interaction authority where applicable"
    - "knowledge/research/exploration authorities"
    - "multiplayer authority"
    - "performance/scalability and engineering governance"
    - "future implementation PRD/FORGE-ENG/LFE authority as appropriate"
  affected_art_products:
    - "Tier I field map"
    - "Tier II surveyed/civilisational cartography"
    - "Tier III magical relief/volumetric cartography"
    - "2D accessibility-equivalent advanced map mode"
  safe_temporary_assumption: >
    ART may produce reference presentation mock-ups only from explicitly supplied known
    data. It may not define how that data was acquired or expose hidden engine truth.
  implementation_blocked: true
  severity: "PRE-IMPLEMENTATION INTEGRATION REQUIRED"
  required_follow_up:
    - "reconcile progression/unlock mechanics"
    - "define survey and knowledge-confidence model"
    - "define persistence and multiplayer knowledge behaviour"
    - "define runtime data and scalability architecture"
    - "cross-reference ART-08 presentation tiers from the owning mechanics documents"
  status: OPEN
```

This handoff is **not a defect in ART-08**. It is the correct boundary between art presentation and gameplay/system ownership.

---

# Appendix E — Art Production Agent Report Template

```yaml
art_agent_report:
  task_id: ""
  canonical_identity: ""
  task_class: ""
  final_status: ""

  authority:
    consulted: []
    supersession_checks: []
    conflicts_found: []

  art_resolution:
    rules_applied: []
    golden_references: []
    parent_family: ""
    bounded_inferences: []

  production:
    source_assets_created: []
    source_assets_changed: []
    generated_products: []
    registry_manifest_changes: []
    states_completed: []
    variants_completed: []

  validation:
    automated: []
    test_room: ""
    gameplay_context: ""
    accessibility: ""
    scalability: ""

  provenance:
    tools_and_versions: []
    generators_and_seeds: []
    external_references: []
    licence_rights_notes: []

  handoffs_and_failures:
    cross_authority_handoffs: []
    failure_classifications: []
    unresolved_items: []

  knowledge_promotion:
    skill_candidates: []
    procedure_candidates: []
    shortcut_candidates: []
    antipattern_candidates: []
```

---

# Appendix F — Family Production Matrix Template

| Canonical Member | Parent | Required Products | Required States | Required Variants | Source Status | Runtime Status | Review | Certification | Migration |
|---|---|---|---|---|---|---|---|---|---|
| | | | | | | | | | |

Family matrices should be stored in a machine-readable companion format when the final Forge/Brain implementation provides one.

---

# Appendix G — ART-09 Production Gate Summary

```text
GATE 0 — Authority resolved?
GATE 1 — Canonical identity resolved?
GATE 2 — Representation/state/variant matrix resolved?
GATE 3 — ART rules and golden references resolved?
GATE 4 — Forge source valid?
GATE 5 — Required products complete?
GATE 6 — Bake + registry/manifest valid?
GATE 7 — Automated validation passed?
GATE 8 — Controlled visual/audio review passed?
GATE 9 — Gameplay-context review passed?
GATE 10 — Accessibility/scalability passed?
GATE 11 — Provenance/work log/handoffs complete?
GATE 12 — Approval / ART-10 certification achieved as required?
```

Any unresolved required gate prevents silent **DONE** status.
