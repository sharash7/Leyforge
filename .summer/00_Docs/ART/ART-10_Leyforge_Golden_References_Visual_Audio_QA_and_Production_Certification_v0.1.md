# Leyforge Art Production Corpus

## ART-10 — Golden References, Visual/Audio QA & Production Certification

**Document ID:** ART-10  
**Title:** Leyforge Golden References, Visual/Audio QA & Production Certification  
**Version:** v0.1  
**Date:** 4 September 2026  
**Status:** **LOCKED ART-PRODUCTION CERTIFICATION BASELINE — OWNER ACCEPTED 4 SEPTEMBER 2026**  
**Project:** Leyforge  
**Product context:** Ley Realms / The Forge  
**Corpus:** ART — Final Art Direction, Asset Production & Codex/Forge Handoff  
**Constitutional parent:** ART-00 — Art Production Constitution & Authority Map  
**Style parents:** ART-01 through ART-08  
**Execution parent:** ART-09 — Codex / The Forge Asset Production Execution Contract  
**Forge system parents:** Documents 21A–21G and 22A–22L  
**Engineering/governance interfaces:** applicable ENG-GOV, B-OPS, testing, CI, benchmark, registry/stable-identity, provenance, exception and Brain↔Governance authorities  
**Primary downstream consumers:** Codex/coding agents, The Forge, Forge engineering, Project Brain, build/release pipelines, content teams, migration programmes and future V1 certification

---

# 00. Executive Certification Contract

ART-10 defines how Leyforge proves that an art-production result is actually fit to ship.

The governing principle is:

> **A Leyforge asset is certified by evidence, not by confidence.**

The reference principle is:

> **Golden references are canonical production exemplars used to test rules; they are not immutable visual fossils that prevent controlled evolution.**

The context principle is:

> **An asset that passes in isolation but fails in gameplay context is not certified.**

The accessibility principle is:

> **Critical visual or audio meaning must survive the supported accessibility and scalability envelopes.**

The automation principle is:

> **Machine validation should eliminate obvious failures and family drift before human review is spent on judgement-heavy questions.**

The release principle is:

> **No production family, batch or migration may claim ART certification while required evidence, provenance, cross-authority handoffs or blocking defects remain unresolved.**

---

# 01. Purpose

ART-10 closes the missing Leyforge art-production handoff by defining:

- golden-reference governance;
- reference asset and scene selection;
- visual/audio test laboratories;
- machine-verifiable art checks;
- human review gates;
- gameplay-context review;
- family and batch certification;
- accessibility/scalability validation;
- migration certification;
- defect severity and waiver handling;
- certification records and expiry/revalidation;
- corpus-level readiness for Codex-driven production.

ART-10 is the final ART document. It does not create new visual style law; it verifies compliance with ART-00 through ART-09.

---

# 02. Authority Boundary

ART-10 owns **art-production certification**.

It does not own:

- gameplay balance;
- world truth;
- progression mechanics;
- save/network semantics;
- performance targets owned by engineering, except where ART consumes them as acceptance envelopes;
- accessibility mechanics outside presentation;
- canonical content identity;
- source-code quality gates outside the asset pipeline;
- narrative approval;
- legal/licensing approval beyond art-provenance evidence required for handoff.

If certification discovers a failure outside ART ownership, it creates a cross-authority handoff rather than silently changing the foreign system.

---

# 03. Certification Objects

ART-10 can certify:

1. a single asset package;
2. a derived representation set;
3. a material family;
4. an object/model family;
5. a character/creature family;
6. an animation package;
7. a VFX package;
8. an audio package;
9. a UI/icon family;
10. an environment/realm reference scene;
11. a procedural-generation rule set;
12. a batch-produced family;
13. a migration/replacement programme;
14. a Forge authoring template;
15. an agent production procedure;
16. an ART golden reference;
17. an ART production release/corpus baseline.

---

# 04. Certification States

Every governed object has one of these states:

- **UNREVIEWED** — production exists but no ART evidence review has begun;
- **IN REVIEW** — evidence package exists and gates are being evaluated;
- **CONDITIONALLY ACCEPTED** — usable for bounded work with documented non-blocking issues;
- **CERTIFIED** — all required gates pass;
- **CERTIFIED WITH WAIVER** — blocking rule is explicitly waived by authorised governance with scope/expiry;
- **REJECTED** — unacceptable or materially inconsistent;
- **STALE / REVALIDATION REQUIRED** — parent authority, pipeline or reference changed enough to invalidate prior confidence;
- **SUPERSEDED** — replaced by a newer certified object;
- **ARCHIVED** — retained for history/migration only.

Only **CERTIFIED** or valid **CERTIFIED WITH WAIVER** objects may serve as production golden references.

---

# 05. Golden Reference Definition

A **Golden Reference** is a deliberately selected, fully sourced, fully validated example that demonstrates one or more ART rules at production quality.

It must be:

- canonically valid;
- representative rather than anomalous;
- authored from retained Forge source;
- reproducible;
- registry/manifest bound where applicable;
- reviewed in context;
- accessible/scalable within its declared envelope;
- provenance complete;
- suitable for comparison by humans and automated tools;
- narrow enough that downstream agents understand what it is authoritative *for*.

A golden reference is not automatically authoritative for every visual decision visible inside it.

---

# 06. Golden Reference Scope Declaration

Every golden reference declares its scope, for example:

```yaml
golden_reference:
  id: art.golden.material.oak.basic
  authoritative_for:
    - oak_material_identity
    - ordinary_wood_value_range
    - plank/log/beam inheritance
    - readable_damage_states
  not_authoritative_for:
    - final culture ornament
    - all wood species
    - weapon proportions
    - settlement architecture
```

This prevents accidental copy-by-example from becoming hidden canon.

---

# 07. Golden Reference Hierarchy

Golden references may exist at four levels:

1. **Primitive Reference** — material, shape, sound, VFX behaviour, icon grammar.
2. **Asset Reference** — complete production asset package.
3. **Scene Reference** — multiple systems interacting in representative context.
4. **Stress Reference** — dense/high-risk scenario proving readability and scalability.

Higher levels do not replace lower ones.

---

# 08. Golden Reference Change Control

Changing a golden reference requires:

- reason for change;
- affected ART rules;
- parent authority revision check;
- comparison captures/evidence;
- downstream family impact analysis;
- migration/revalidation list;
- owner approval at the required level.

A golden reference may evolve. Unrecorded mutation is prohibited.

---

# 09. Reference Inheritance

Derived families should reference the smallest relevant golden set.

Example:

```text
Iron Sword
→ iron material golden
→ ordinary one-handed weapon silhouette golden
→ humanoid grip/socket golden
→ melee swing readability golden
→ iron impact/audio golden
→ inventory icon projection golden
```

Agents should not select unrelated “similar-looking” references merely because they are visually convenient.

---

# 10. Golden Material Reference Programme

ART-10 initially requires golden coverage for:

1. Oak / ordinary structural wood;
2. ordinary stone;
3. iron;
4. copper;
5. glass;
6. water;
7. mana crystal;
8. leather / cloth;
9. clay / fired brick;
10. corruption overlays.

Each family should demonstrate raw, processed and representative final-product states where relevant.

---

# 11. Material Golden Evidence

A material golden package should include:

- canonical palette/Material DNA record;
- source textures/material graph;
- one-metre surface tile;
- at least one shaped/derived product;
- lighting comparison;
- wet/dry or relevant environmental state;
- damage/wear state where applicable;
- low-end/scalability view;
- colour-independent readability evidence where state meaning exists;
- reference screenshots/captures.

---

# 12. Model Golden Reference Programme

Initial modelling golden references should cover:

- full cube terrain block;
- generated slab/stair/wall/fence family;
- directional functional block;
- transparent block;
- ordinary raw/processed item;
- tool;
- weapon;
- armour/equipment piece;
- storage object;
- workstation;
- mechanical machine;
- connected logistics piece;
- magical infrastructure object;
- architecture module;
- complete building/blueprint;
- vessel component;
- representative vessel.

---

# 13. Representation Projection Golden

At least one reference family must prove coordinated:

- placed/world representation;
- held representation;
- equipped representation;
- dropped representation;
- inventory/icon representation;
- blueprint/preview representation where applicable.

All remain projections of one canonical gameplay identity unless the owning registry authority explicitly says otherwise.

---

# 14. Character and Creature Golden Programme

Initial entity goldens should include:

1. baseline player humanoid;
2. named civilian/NPC;
3. armoured humanoid;
4. non-standard humanoid/body-plan reference;
5. livestock quadruped;
6. predator quadruped;
7. mount;
8. arthropod/spider;
9. segmented crawler;
10. bird/aerial creature;
11. dragon/large winged creature;
12. aquatic creature;
13. spirit/non-solid being;
14. construct/golem;
15. plant being;
16. worker-motion set;
17. combat/casting set;
18. boss phase set;
19. unified first/third-person player;
20. injury/state/LOD comparison.

---

# 15. Entity Golden Evidence

Entity references include:

- body-plan source;
- proportions sheet;
- skeleton/rig source;
- sockets/attachment roles;
- locomotion set;
- representative work/social action;
- representative combat or threat action where applicable;
- expression/pose references;
- equipment fit;
- first/third-person compatibility where applicable;
- animation LOD;
- reduced-motion/readability evidence;
- runtime capture at gameplay camera distances.

---

# 16. Environment Golden Programme

Initial environment scene goldens should include at least:

1. ordinary Overworld temperate scene;
2. arid Overworld scene;
3. cold Overworld scene;
4. wetland/coastal scene;
5. underground/deep Overworld scene;
6. Camp;
7. Hamlet/Village progression comparison;
8. Town/City progression comparison;
9. Capital/Magical Metropolis comparison;
10. representative ruin/history scene;
11. representative dungeon/megadungeon district;
12. maritime/port environment;
13. Verdant Covenant scene;
14. Ancestral Veil scene;
15. Somnolent Expanse scene;
16. Ascendant Reach scene;
17. Impossible Deep scene;
18. Ashen Lower Realms scene.

ART-03 may require additional culture-specific goldens after first production review.

---

# 17. Environment Scene Evidence

Environment goldens must prove:

- realm identity;
- biome identity;
- material truth;
- ecological coherence;
- architecture/culture rules where present;
- readable traversal and function;
- lighting/weather interaction;
- settlement-history/state layering where relevant;
- representative camera distances;
- low-end profile viability;
- no dependence on global tint/filter alone.

---

# 18. VFX and Lighting Golden Programme

Initial VFX/lighting scenes should cover:

- ordinary impacts by material;
- fire/smoke/steam;
- water/rain/snow/wind/fog/storm;
- lightning/electrical discharge;
- furnace/machine active/fault cycle;
- mana flow;
- rune activation;
- ward state;
- portal state;
- corruption comparison;
- all thirteen magic-school behaviour families;
- all seven realm atmosphere comparisons;
- boss/high-density telegraph scene;
- accessibility/reduced-flash scene;
- low-particle/bloom-off scene.

---

# 19. Audio Golden Programme

Initial sonic goldens should cover:

- material impacts;
- footsteps/surface families;
- tool work loops;
- construction/crafting;
- melee/ranged combat;
- creature anatomy/mass comparison;
- machine start/run/load/fault/stop;
- logistics network density;
- mana/rune/ward/portal;
- all thirteen magic-school behaviour families;
- weather and environmental ambience;
- ocean/underwater/maritime;
- settlement progression;
- all seven realm identities;
- raid/boss priorities;
- UI critical/non-critical cues;
- adaptive music transitions;
- accessibility mix/reference.

---

# 20. UI, Icon and 2D Golden Programme

Initial 2D goldens should include:

- HUD baseline;
- inventory family;
- crafting family;
- settlement/civilisation UI;
- machine/network UI;
- magic/rune UI;
- world creation;
- settings/accessibility;
- Codex/knowledge page;
- quest/journal page;
- ordinary map;
- surveyed map;
- magical relief/volumetric cartography presentation reference;
- equivalent 2D advanced-cartography mode;
- icon family comparison;
- unknown/stale/conflicting knowledge states.

The volumetric map reference certifies **presentation only** until XAUTH-ART-0001 and downstream mechanics/engineering amendments are resolved.

---

# 21. The Forge Art Test Laboratory

The Forge should provide a reusable Art Test Laboratory capable of loading certified and candidate products side by side.

Minimum functions:

- neutral lighting;
- controlled lighting presets;
- representative world lighting;
- scale reference;
- turntable/free camera;
- placed/held/dropped/equipped projection review;
- animation playback/scrub;
- VFX playback;
- audio playback/spatialisation test;
- state/variant selector;
- LOD/profile selector;
- accessibility selector;
- reference/candidate comparison;
- capture/export of evidence;
- validator result display.

The historical POC Visual Test Room is useful precedent, but ART-10 defines the final production requirement rather than inheriting POC implementation details.

---

# 22. Neutral Material Test Chamber

Material review must include a neutral chamber with:

- fixed geometry samples;
- controlled diffuse lighting;
- directional light;
- low light;
- wet/environmental overlay option;
- bloom on/off;
- high/low quality shader profiles;
- colour-vision simulation where supported.

Materials that only work under flattering lighting fail.

---

# 23. Silhouette Test

Models and entities must be reviewable as flat silhouettes.

The test asks:

- is category readable?
- is facing readable?
- are interaction points readable?
- are dangerous parts readable?
- does the family remain distinguishable at gameplay distance?
- does added ornament preserve core shape?

A texture cannot rescue a structurally unreadable silhouette.

---

# 24. Value and Desaturation Test

Critical identity/state must be assessed without relying exclusively on hue.

The test may use:

- grayscale/desaturation;
- high-contrast mode;
- colour-vision simulation;
- reduced emissive/bloom.

Meaning that disappears completely under these conditions needs another channel.

---

# 25. Scale and Distance Test

Every relevant asset is reviewed at:

- inspection distance;
- ordinary interaction distance;
- gameplay/navigation distance;
- LOD-transition distance;
- silhouette-only distance where relevant.

Fine detail that only exists in screenshots cannot substitute for gameplay readability.

---

# 26. Rotation and Orientation Test

Directional objects are validated in every supported orientation.

This includes:

- placement rotation;
- mirrored/hinged state where supported;
- connected neighbours;
- held/equipped orientation;
- save/reload orientation persistence through the runtime owner.

ART validates presentation; gameplay/runtime authority validates state correctness.

---

# 27. Connection Geometry Test

Connected assets such as:

- fences;
- walls;
- chutes;
- conveyors;
- pipes;
- mana conduits;
- tracks;
- structural seams;

must be tested across straight, corner, T, cross, end, vertical and endpoint conditions where supported.

No gap, z-fighting, impossible rail/wall logic or contradictory port geometry may be hidden by camera angle.

---

# 28. State Completeness Test

The validator compares authoritative state definitions to produced art states.

Examples:

- idle;
- active;
- powered;
- unpowered;
- blocked;
- fault;
- damaged;
- repaired;
- burning;
- wet;
- frozen;
- corrupted;
- enchanted;
- open/closed;
- construction stages.

Missing required states block certification.

---

# 29. Variant Completeness Test

Variants may derive from:

- material;
- culture;
- biome;
- realm;
- quality;
- age;
- damage;
- procedural seed;
- faction/state.

The validator checks that variation rules preserve family identity and required gameplay readability.

---

# 30. Family Drift Test

A family is reviewed together, not one asset at a time.

The test asks whether:

- material inheritance remains coherent;
- scale/proportions stay bounded;
- detail density stays compatible;
- icons remain recognisable;
- state language stays consistent;
- generated children have drifted from the golden parent;
- one outlier is visually over-authored relative to peers.

Batch outliers should be flagged automatically where measurable.

---

# 31. Material Inheritance Test

Derived objects must visibly and sonically retain source-material identity unless an authorised transformation changes it.

Examples:

- oak log → plank → beam → door → furniture;
- iron ore → ingot → plate → gear → weapon → machine part;
- stone → cobble → brick → pillar → wall.

Random recolouring or unrelated roughness/impact sounds fail.

---

# 32. Material-State Behaviour Test

State overlays are checked against material behaviour.

Examples:

- wood splits/chars;
- stone chips/cracks;
- metal dents/oxidises where appropriate;
- cloth tears/frays;
- glass fractures;
- wetness modifies surfaces consistently;
- frost/snow accumulates plausibly within stylised rules;
- corruption remains a layered transformation rather than replacement paint.

---

# 33. Animation Contact Test

Animations must preserve credible:

- foot contact;
- hand/tool contact;
- weapon grip;
- seat/mount contact;
- work-surface contact;
- door/lever/crank contact;
- terrain adaptation;
- landing/impact contact.

IK may assist but must not stretch anatomy beyond the ART-05 envelope.

---

# 34. Animation Readability Test

Movement is assessed for:

- anticipation;
- direction;
- commitment;
- active/release moment;
- follow-through;
- recovery;
- interruption/state clarity;
- gameplay timing compatibility.

Technically valid clips that conceal attack timing or task meaning fail.

---

# 35. Retargeting Validation

Retargeted animation must be re-certified if changes in body plan materially affect:

- reach;
- stride;
- centre of mass;
- foot placement;
- weapon alignment;
- anatomy;
- personality/weight.

“Retarget completed without errors” is not an artistic pass condition.

---

# 36. First-Person / Third-Person Coherence Test

The player character must retain a coherent single identity across supported viewpoints.

Review includes:

- head/camera anchor;
- connected body visibility;
- shoulders/arms;
- hand grip;
- tool direction;
- equipped items;
- outside-observer representation;
- animation compatibility;
- clipping and obstruction.

---

# 37. VFX Source Test

Effects must visibly originate from the correct:

- socket;
- material;
- rune path;
- machine port;
- projectile;
- contact point;
- environmental volume;
- world phenomenon.

Effects that float near the correct object but are not causally attached fail production quality.

---

# 38. VFX Phase Test

Effects are checked through:

- anticipation/charge;
- activation;
- sustained state;
- impact/release;
- decay/recovery;
- fault/interruption where applicable.

State meaning should survive reduced particle density.

---

# 39. Magic Differentiation Test

A comparison scene should prove that magic families are distinguishable by more than hue.

Review uses:

- shape;
- medium;
- source;
- motion;
- timing;
- interaction;
- sound;
- substrate;
- world response.

A “same particle emitter, different colour” family fails.

---

# 40. Lighting Dependency Test

Critical objects and effects are checked with:

- bloom off;
- reduced emissive;
- daytime;
- night;
- interior lighting;
- high contrast;
- lower shader quality.

Gameplay meaning may become less spectacular but must remain legible.

---

# 41. Audio Source and Spatial Test

Sound is checked for:

- correct source position;
- attenuation;
- occlusion/obstruction where supported;
- loop transitions;
- start/stop coherence;
- animation-event sync;
- multiplayer source ownership where relevant;
- excessive range or masking.

---

# 42. Audio Material Test

Impact, movement and work sounds should identify broad material classes without looking at the screen.

The objective is not perfect forensic identification; it is coherent differentiation between meaningful families.

---

# 43. Audio Density and Masking Test

Dense scenes must preserve priority.

Stress tests include:

- settlement market;
- workshop/factory;
- storm;
- raid;
- boss encounter;
- vessel under load;
- magical infrastructure cluster.

Critical warnings and threats must not disappear under music/ambience/machine layers.

---

# 44. Repetition Fatigue Test

Frequently repeated sounds/animations/VFX should be evaluated over time.

Where variation is appropriate, the system should avoid obvious short-cycle repetition while preserving identity and determinism requirements.

---

# 45. Music Adaptation Test

Adaptive music is validated for:

- exploration;
- settlement state;
- construction milestones;
- danger escalation;
- raids;
- bosses;
- realm transition;
- recovery/aftermath;
- silence/low-intensity periods.

Transitions should support gameplay rather than announce every state change theatrically.

---

# 46. UI Semantic Consistency Test

UI review checks that shared semantics remain consistent across:

- HUD;
- inventory;
- crafting;
- settlement;
- automation;
- magic;
- map;
- Codex;
- quests;
- settings;
- world creation.

Success/warning/unknown/stale/damaged/corrupted/etc. cannot arbitrarily change meaning by screen.

---

# 47. Icon Recognition Test

Icons are reviewed at intended display sizes and in families.

Checks include:

- silhouette;
- negative space;
- material/functional identity;
- tier distinction;
- spell behaviour;
- non-colour differentiation;
- readability at UI scale;
- consistency with world/held representation.

---

# 48. Knowledge-State Presentation Test

Known, unknown, approximate, rumoured, stale, conflicting and restricted information must remain visibly distinct where the owning gameplay system supplies those states.

ART does not create the states; it verifies their presentation.

---

# 49. Cartography Presentation Certification

Cartography references are tested at three visual tiers:

1. field/ordinary map;
2. surveyed/civilisational cartography;
3. magical relief/volumetric cartography.

Certification verifies:

- layer readability;
- uncertainty/confidence presentation;
- route/landmark distinction;
- zoom/detail hierarchy;
- 3D depth legibility;
- equivalent 2D access mode;
- no visual dependence on hidden developer truth.

**Mechanical certification remains blocked until the owning non-ART documents are amended under XAUTH-ART-0001.**

---

# 50. Accessibility Matrix

Every relevant golden/candidate declares which settings apply:

- UI/text scale;
- high contrast;
- reduced motion;
- reduced flashes;
- captions/subtitles;
- colour-independent cues;
- bloom off/reduced;
- controller/focus navigation where 2D UI applies;
- audio cue alternatives;
- camera motion reduction.

A critical feature that becomes unusable under a supported accessibility setting is a blocker.

---

# 51. Scalability Matrix

Relevant art packages are tested across declared quality profiles.

Profiles may reduce:

- particle counts;
- secondary lights;
- shader complexity;
- animation update density;
- audio emitters;
- texture/mip detail;
- distant geometry detail;
- map rendering complexity;
- decorative simulation.

They may not remove authoritative information needed to understand or play the system.

---

# 52. Performance Evidence Interface

ART-10 does not set final frame-time budgets. It requires art packages to expose measurable cost evidence compatible with ENG-GOV performance authorities.

Evidence may include:

- triangle/voxel/mesh counts;
- material/shader complexity class;
- texture memory;
- animation bone/update count;
- VFX emitter/particle budget;
- dynamic-light count;
- audio voice/emitter count;
- UI/map render cost class;
- LOD transition data;
- dense-scene benchmark results.

---

# 53. Automated Validator Classes

The final Forge/CI implementation should support validators for at least:

- missing source asset;
- missing canonical binding;
- missing manifest entry;
- missing representation;
- missing required state;
- invalid pivot/origin;
- invalid socket/anchor;
- scale violation;
- texture-resolution/profile violation;
- material-family mismatch;
- unsupported transparency/emission mode;
- collision/source mismatch evidence;
- disconnected variant;
- broken LOD reference;
- animation missing event/socket;
- VFX/audio source missing;
- icon missing/stale;
- golden-reference mismatch threshold where measurable;
- provenance/rights metadata missing;
- deprecated/POC presentation leaking into shipping scope.

---

# 54. Comparison Metrics

Automated comparison may use bounded metrics such as:

- dimensions/proportions;
- palette-role distribution;
- material graph identity;
- texture density;
- silhouette occupancy;
- socket locations;
- animation contact error;
- VFX spawn origin;
- audio loudness/range class;
- icon bounding/silhouette similarity;
- family outlier detection;
- performance-budget class.

Metrics support judgement; they do not replace human art review.

---

# 55. Human Review Roles

Human review may include:

- project owner/art-direction approval;
- specialist technical-art review;
- animation review;
- VFX review;
- audio review;
- UI/accessibility review;
- gameplay-context review;
- engineering/performance review.

Not every small asset needs every specialist, but high-impact goldens and family templates should receive appropriate cross-discipline review.

---

# 56. Two-Pass Human Review

Recommended review occurs in two passes:

**Pass A — Controlled Review**
- neutral test environment;
- direct reference comparison;
- technical defects;
- family identity;
- rule compliance.

**Pass B — Gameplay Context Review**
- real biome/settlement/dungeon/combat/workflow;
- actual camera and lighting;
- surrounding assets;
- sound mix;
- UI scale;
- gameplay readability.

Both are required for major goldens.

---

# 57. Defect Severity

ART defects use at least:

- **BLOCKER** — breaks canon/identity, hides critical gameplay meaning, violates accessibility, missing required product, invalid provenance, runtime-breaking art contract;
- **MAJOR** — materially inconsistent family/style/readability problem requiring correction before broad production;
- **MINOR** — visible quality issue that does not invalidate the package;
- **POLISH** — optional improvement with no correctness impact;
- **OBSERVATION** — note for future comparison/research.

Severity does not silently redefine engineering defect classes.

---

# 58. Failure Classification

Failure records should identify cause where possible:

- canon misunderstanding;
- authority lookup failure;
- family inheritance drift;
- modelling defect;
- material defect;
- rig/animation defect;
- VFX defect;
- audio defect;
- 2D/UI defect;
- state/variant incompleteness;
- accessibility defect;
- scalability/performance defect;
- runtime integration defect;
- registry/manifest defect;
- provenance/licensing defect;
- tooling/validator defect;
- missing upstream mechanic/design decision.

This enables useful Brain antipatterns and governance debt rather than generic “failed art review” logs.

---

# 59. Waivers and Exceptions

ART-10 cannot invent its own exception authority.

A blocker may ship only if the appropriate governance authority creates an explicit waiver containing:

- affected asset/family;
- failed rule/gate;
- reason;
- player/production risk;
- mitigation;
- scope;
- owner;
- expiry/review trigger;
- follow-up issue.

“Looks fine to me” is not a waiver record.

---

# 60. Certification Evidence Package

A certification package contains, as applicable:

- canonical IDs;
- source authority references;
- ART rules applied;
- golden references used;
- Forge source paths/IDs;
- baked/runtime product IDs;
- representation/state/variant matrix;
- automated validator output;
- controlled captures;
- gameplay-context captures;
- accessibility/scalability evidence;
- performance evidence refs;
- audio evidence;
- provenance/licence evidence;
- defect/waiver list;
- reviewer/approval state;
- certificate record.

---

# 61. Certificate Record

Conceptual certificate:

```yaml
art_certificate:
  certificate_id: ""
  subject_id: ""
  subject_type: "asset|family|scene|template|batch|migration|corpus"
  art_corpus_version: ""
  source_revision: ""
  golden_refs: []
  passed_gates: []
  waivers: []
  evidence_refs: []
  certified_by: []
  certified_at: ""
  revalidate_on:
    - parent_authority_change
    - golden_reference_change
    - forge_pipeline_breaking_change
    - runtime_representation_change
  status: "CERTIFIED"
```

---

# 62. Revalidation Triggers

Certification is rechecked when materially affected by:

- ART rule revision;
- canonical content change;
- material DNA change;
- golden-reference replacement;
- body-plan/rig change;
- Forge format/bake change;
- runtime renderer/audio change;
- accessibility requirement change;
- quality-profile change;
- asset family expansion revealing drift;
- migration of IDs/source assets;
- significant optimisation that changes presentation.

Minor unrelated changes should not force full-corpus recertification.

---

# 63. Family Certification

A family can be certified only after:

1. family law/parent identified;
2. representative member certified;
3. bounded variation/generation rules frozen;
4. batch members produced;
5. automated family audit passed;
6. outliers reviewed;
7. required states/representations complete;
8. context/accessibility/scalability checks pass;
9. provenance complete.

This is the mandatory pattern for Codex mass production.

---

# 64. Batch Certification

Batch certification records:

- batch task ID;
- generation procedure/version;
- seeds/inputs where procedural;
- parent family/golden;
- member list;
- automated-pass statistics;
- outlier list;
- sampled human-review strategy;
- blocked members;
- final accepted set.

A batch is never “all certified” merely because the generator exited successfully.

---

# 65. Procedural Variation Certification

Procedural art rules must prove:

- deterministic reconstruction where required;
- bounded palette/material variation;
- no silhouette-breaking mutations unless authorised;
- no clipping/interpenetration beyond tolerances;
- no illegal socket/anchor movement;
- family recognisability;
- outlier limits;
- save/reload or network determinism where owned by runtime systems.

---

# 66. Migration Certification

POC/legacy replacement is certified by comparing:

- canonical identity continuity;
- saved/runtime references;
- required representations;
- visual semantic improvements;
- removal of placeholder art leakage;
- collision/interaction compatibility evidence;
- registry aliases/migrations;
- screenshot/test-room regressions;
- accessibility/performance impact.

Legacy art may remain archived without being production-certified.

---

# 67. POC Reference Policy

Historical POC assets are evidence of tested gameplay hooks and may inform:

- pivots;
- grips;
- interaction/readability constraints;
- test scenes;
- representation needs;
- regression cases.

They do **not** automatically define final:

- colour;
- texture;
- silhouette;
- animation polish;
- VFX;
- audio;
- UI style;
- final art quality.

---

# 68. Cross-Authority Handoff Gate

Any open cross-authority handoff marked implementation-blocking prevents full production certification of the affected feature.

Reference mock-ups may still be certified as **presentation reference only** if clearly labelled.

This applies directly to XAUTH-ART-0001 for advanced/3D cartography.

---

# 69. 3D Cartography Temporary Certification Rule

Until XAUTH-ART-0001 is resolved:

- ART-08/ART-10 may certify visual prototypes;
- prototypes must use explicitly supplied known/uncertain data;
- no prototype may imply final crafting/progression/survey mechanics;
- no prototype may expose hidden world truth;
- no prototype may define multiplayer knowledge behaviour;
- no prototype may be called mechanically complete.

After the mechanics amendments are approved, the reference is revalidated against the final data contract.

---

# 70. Project Brain Integration

ART certification writes into the Brain:

- certificate status;
- evidence links;
- golden-reference index;
- open defects;
- waivers;
- cross-authority handoffs;
- migration state;
- revalidation triggers;
- family/batch status;
- discovered procedures/shortcuts;
- known antipatterns.

The Brain is navigation/status memory, not the authority that approves art law.

---

# 71. Skills / Procedures / Shortcuts Promotion

A production technique may be promoted after repeated successful evidence.

Examples:

- deterministic connected-pipe generation;
- automated voxel silhouette comparison;
- safe rig retarget procedure;
- material-family derivation workflow;
- icon projection pipeline;
- audio variation batching;
- VFX accessibility reduction procedure;
- golden-scene capture automation.

Promotion records inputs, constraints, outputs and known failure cases.

---

# 72. Antipattern Promotion

Repeated failures should become explicit antipatterns, for example:

- “advanced = more glow”;
- random colour drift between derived materials;
- one universal magic particle with hue swaps;
- one generic creature roar pitch-shifted across species;
- machine cube with decorative gears but no functional read;
- scaled-down adult child rig;
- omniscient map presentation;
- generating a whole family before validating one representative;
- treating successful bake as successful art review.

---

# 73. CI / Automated Gate Interface

Where technically practical, production CI should fail on machine-verifiable BLOCKER conditions before human review.

CI should output:

- stable reason codes;
- affected IDs;
- source locations;
- expected/observed state;
- links to relevant ART authority;
- repair guidance where deterministic.

Human taste cannot be compiled into CI, but missing files and broken contracts can.

---

# 74. Review Sampling Policy

High-volume families may use sampling only after:

- representative golden exists;
- generator/rules are frozen;
- automated full-batch validation passes;
- outlier detection is active;
- high-risk members are always reviewed;
- random/deterministic sample size is documented.

New or unstable generators require heavier review.

---

# 75. High-Risk Art Classes

The following normally require stronger certification:

- player body/first-person assets;
- combat telegraphs;
- bosses;
- critical UI/HUD;
- accessibility-critical effects;
- portals/realm transitions;
- large settlement/factory stress scenes;
- procedural family templates;
- golden references;
- major culture/ancestry representation;
- 3D cartography after mechanics integration;
- mass migration tools.

---

# 76. Owner Review Pack

For owner approval, ART-10 should present concise evidence rather than forcing inspection of raw implementation files.

A review pack may contain:

- what is being approved;
- canonical identity;
- key ART rules;
- golden comparison;
- controlled captures;
- in-game captures;
- state/variant sheet;
- known differences;
- accessibility/low-end comparison;
- unresolved issues/waivers;
- approval decision.

---

# 77. ART Corpus Readiness Gate

The ART corpus is **theoretically ready for rebuild bootstrap** when:

- ART-00 through ART-10 are locked;
- authority boundaries are consistent;
- no unresolved contradiction exists inside ART;
- ART-09 production flow is complete;
- ART-10 certification flow is complete;
- golden-reference programme is defined;
- cross-authority dependencies are registered;
- implementation-specific Forge/CI tasks are handed to their proper owners.

This does **not** mean every golden asset already exists before coding begins.

---

# 78. Golden Bootstrap Minimum Before Mass Final-Art Production

Before Codex performs broad final-art batch production, at minimum the project should implement and certify representative goldens for:

- ordinary wood;
- ordinary stone;
- iron;
- basic terrain;
- ordinary construction family;
- one machine/logistics family;
- one magical infrastructure family;
- baseline humanoid/player;
- one ordinary creature;
- one hostile creature;
- one work-animation set;
- one combat/casting set;
- mundane VFX/material interactions;
- mana/rune/ward VFX;
- baseline sonic materials;
- one machine sonic cycle;
- baseline HUD/icon grammar;
- ordinary map/knowledge-state presentation;
- one representative Overworld environment scene.

This minimum establishes anchors without demanding the entire game be art-complete first.

---

# 79. Extended Golden Bootstrap

Before realm/culture/family mass production, add goldens for:

- each realm;
- major culture/architecture families;
- advanced materials;
- vessel construction;
- bosses/large creatures;
- specialised magic schools;
- large settlement/factory scenes;
- advanced cartography after mechanics integration;
- adaptive music/realm sonic packages.

---

# 80. Rebuild Bootstrap Relationship

ART certification sits alongside, not above:

- Project Brain bootstrap;
- ENG-GOV/B-OPS engineering bootstrap;
- PRD/FCC/system authority;
- Forge engineering implementation;
- audit/certification Branch C.

The fresh rebuild should consume ART as production law while engineering governance controls how the tooling/code is implemented.

---

# 81. Final ART-10 Lock-Candidate Decisions

The following decisions are proposed for owner lock:

1. ART certification is evidence-based.
2. Goldens are scoped exemplars, not universal hidden canon.
3. Goldens require retained editable Forge source and provenance.
4. Controlled and gameplay-context review are both required for major goldens.
5. Accessibility-critical meaning must survive supported accessibility profiles.
6. Low-end profiles may simplify presentation but not remove critical meaning.
7. Families are certified representative-first, then batch-produced and audited.
8. Successful generation/bake is not successful art certification.
9. Automated validation handles machine-verifiable contracts; human review handles judgement-heavy art quality.
10. POC assets are regression evidence, not final-art authority.
11. Material inheritance is validated across derived families.
12. Silhouette/readability tests precede micro-detail judgement.
13. Animation must preserve contact, anatomy and gameplay readability.
14. Magic families must differ by behaviour/medium/source, not hue alone.
15. Audio density never hides gameplay-critical information.
16. UI semantics remain consistent across screens.
17. Map presentation remains knowledge-filtered.
18. 3D cartography is presentation-only until XAUTH-ART-0001 mechanics integration is completed.
19. Open implementation-blocking cross-authority handoffs prevent full feature certification.
20. Certification records have explicit revalidation triggers.
21. Waivers require external authorised governance and scope/expiry.
22. Batch sampling is allowed only after full automated validation and stable representative goldens.
23. Golden changes require downstream impact analysis.
24. Art production knowledge and antipatterns are promoted into the Project Brain.
25. ART-00 through ART-10 collectively form the final theoretical art-production handoff corpus.
26. Broad Codex final-art production waits for the minimum golden bootstrap set, not the entire game art catalogue.

---

# 82. ART Production Certification Checklist

Before marking a subject **CERTIFIED**:

- [ ] authority/current revision resolved;
- [ ] canonical identity resolved;
- [ ] ART rules resolved;
- [ ] correct golden refs selected;
- [ ] Forge source retained;
- [ ] required representations complete;
- [ ] required states complete;
- [ ] required variants complete;
- [ ] materials/model/rig/VFX/audio/2D products complete as applicable;
- [ ] registry/manifest binding valid;
- [ ] automated validators pass;
- [ ] controlled review passes;
- [ ] gameplay-context review passes;
- [ ] accessibility review passes;
- [ ] scalability/performance evidence is acceptable to owning authority;
- [ ] provenance/rights evidence complete;
- [ ] no unresolved BLOCKER;
- [ ] waivers, if any, valid;
- [ ] cross-authority handoffs resolved or subject explicitly limited to presentation-only scope;
- [ ] certificate written;
- [ ] Brain/status records updated.

---

# Appendix A — Golden Reference Record Template

```yaml
golden_reference:
  id: ""
  title: ""
  category: ""
  canonical_subject_refs: []
  art_corpus_version: ""
  authoritative_for: []
  not_authoritative_for: []
  forge_source_refs: []
  runtime_product_refs: []
  evidence_refs: []
  accessibility_profiles_tested: []
  quality_profiles_tested: []
  provenance_refs: []
  certificate_id: ""
  status: "CERTIFIED"
```

---

# Appendix B — ART Defect Record Template

```yaml
art_defect:
  defect_id: ""
  subject_id: ""
  severity: "BLOCKER|MAJOR|MINOR|POLISH|OBSERVATION"
  classification: ""
  art_rule_refs: []
  expected: ""
  observed: ""
  evidence_refs: []
  affected_family_members: []
  owner: ""
  repair_task_ref: ""
  waiver_ref: ""
  status: "OPEN"
```

---

# Appendix C — Golden Scene Evidence Pack

```yaml
golden_scene_evidence:
  scene_id: ""
  purpose: ""
  authoritative_for: []
  included_subjects: []
  lighting_profiles: []
  weather_profiles: []
  quality_profiles: []
  accessibility_profiles: []
  camera_positions: []
  captures: []
  audio_captures: []
  automated_results: []
  human_review: []
  performance_evidence_refs: []
  certificate_id: ""
```

---

# Appendix D — Family / Batch Certification Summary

```yaml
art_family_certificate:
  family_id: ""
  parent_golden_ref: ""
  generation_rule_ref: ""
  representative_certificate: ""
  total_members: 0
  automated_passed: 0
  outliers: []
  human_review_sample: []
  blocked_members: []
  accepted_members: []
  provenance_complete: false
  certificate_id: ""
```

---

# Appendix E — ART Corpus Readiness Certificate Template

```yaml
art_corpus_readiness:
  corpus: "ART-00..ART-10"
  version: "v0.1"
  documents_locked: []
  contradictions_open: []
  cross_authority_handoffs_open: []
  implementation_dependencies: []
  golden_bootstrap_status: "NOT_STARTED|IN_PROGRESS|READY"
  theoretical_handoff_status: "READY|NOT_READY"
  rebuild_bootstrap_status: "READY_WITH_EXTERNAL_DEPENDENCIES|BLOCKED"
  owner_approval: ""
  date: ""
```

---

# Appendix F — XAUTH-ART-0001 Certification Note

**Advanced / 3D Cartography** remains a registered cross-authority dependency.

ART-08 and ART-10 may certify presentation references, but final system certification requires amendments or explicit interfaces in the non-art owners covering:

- map progression/unlock;
- physical map/survey item behaviour;
- surveying and discovery;
- knowledge precision/confidence/age;
- route planning and ETA confidence;
- magical sensing/leyline/realm information;
- multiplayer sharing/privacy;
- save/persistence;
- runtime 3D data and scalability;
- accessibility-equivalent 2D mode semantics.

ART must consume those contracts after approval rather than defining them itself.

---

# Appendix G — Final ART Corpus Closure Statement

When ART-10 is owner-locked, the **theoretical Art Production Handoff corpus is complete**:

```text
ART-00  Authority and constitution
ART-01  Global visual language
ART-02  Materials / colour / texture / shader art
ART-03  World / realm / biome / architecture / culture art
ART-04  Models / blocks / items / machines / structures / equipment / vessels
ART-05  Characters / creatures / rigs / animation style
ART-06  VFX / lighting / weather / magic / environmental effects
ART-07  Audio / music / sonic identity
ART-08  UI / icons / cartography / Codex / 2D presentation
ART-09  Codex / Forge production execution contract
ART-10  Golden references / QA / certification
```

The remaining work after theoretical lock is implementation and evidence production: building the Forge/CI validators and test laboratories, producing the golden bootstrap assets/scenes, resolving registered cross-authority handoffs such as 3D cartography mechanics, and then certifying production output against this corpus.
