# Leyforge Art Production Corpus

## ART-00 — Art Production Constitution & Authority Map

**Document ID:** ART-00  
**Title:** Leyforge Art Production Constitution & Authority Map  
**Version:** v0.1  
**Date:** 4 September 2026  
**Status:** **LOCKED ART-PRODUCTION GOVERNANCE BASELINE — OWNER ACCEPTED 4 SEPTEMBER 2026**  
**Project:** Leyforge  
**Product context:** Ley Realms / The Forge  
**Corpus:** ART — Final Art Direction, Asset Production & Codex/Forge Handoff  
**Primary upstream authority:** Locked/current FCC content canon, especially FCC-12, FCC-13 and FCC-14A–D  
**Primary downstream consumers:** Codex/coding agents, The Forge, FORGE-ENG, LFE/runtime implementation, asset validation/CI, Project Brain  
**Major inherited design baselines:** Document Set 21 — Voxel Asset Forge; Document Set 22 — Forge Entity & Blueprint Expansion  
**Companion governance:** Branch B — ENG-GOV + B-OPS; Branch A — Project Brain / Obsidian  

---

# 00. Executive Statement

Leyforge now possesses a large and highly reconciled body of **content canon**, **semantic visual requirements**, **Forge authoring concepts**, **entity/blueprint production concepts**, and **engineering governance**.

What it does not yet possess is one explicit downstream authority answering:

> **How must Leyforge finally look, move, read, sound and feel, and how must Codex/The Forge turn canonical game content into production-ready assets without inventing canon or drifting stylistically?**

ART-00 establishes that missing authority layer.

The ART corpus is not another content-design branch and is not a replacement for The Forge engineering documents. It is the project-wide **art-production authority** that sits between locked semantic canon and technical asset implementation.

Its governing principle is:

> **Canon decides what a thing is and which distinctions matter. ART decides the authorised presentation language. The Forge provides the authoring capability. Engineering implements and validates the pipeline. Production assets instantiate the result.**

The intended end state is that an authorised Codex/agent task can begin from a canonical Leyforge identity and reliably produce or revise the required model, texture/material treatment, animation, VFX, audio, iconography and associated presentation products using a repeatable Forge workflow, with sufficient provenance and validation that the result can be audited rather than accepted by guesswork.

---

# 01. Why the ART Corpus Exists

## 01.1 The missing bridge

FCC-14 deliberately stopped before selecting final presentation values. Its semantic art handoff protects distinctions such as material identity, form, state, provenance, realm identity, portal identity, corruption versus native state, damage/restoration and non-colour readability while explicitly leaving final palettes, textures, shaders, decorative geometry, animation timing, VFX, lighting, sound/music, UI art and exact performance presentation downstream.

Document Sets 21 and 22 already provide broad Forge capability and production concepts, including:

- voxel and compound modelling;
- source-versus-baked asset separation;
- world scale and density profiles;
- palette architecture;
- Material DNA;
- texture channels and connected textures;
- animation systems and runtime visual-state bindings;
- particle/effect sockets;
- lights and emission;
- audio cues, loops and sound sockets;
- overrides, inheritance and variants;
- entity anatomy, rigs, IK and attachments;
- humanoid and creature creation;
- blueprint/structure authoring;
- icon and portrait capture;
- golden assets/templates;
- migration workflows;
- validation and test laboratories.

Those systems establish **what the Forge should be capable of doing**. They do not, by themselves, fully lock the final Leyforge aesthetic or teach a coding/asset agent how to choose among valid artistic possibilities.

ART therefore exists to prevent a future production failure where:

1. canon is correct;
2. Forge tooling is technically capable;
3. assets are individually functional;
4. but the game still looks and sounds inconsistent because every task independently invents its own interpretation.

## 01.2 ART is production law, not decorative advice

ART documents are normative where they use mandatory language.

A production asset is not considered final merely because:

- it loads;
- it has the correct stable ID;
- it matches collision/gameplay requirements;
- it is technically valid in The Forge;
- or an agent considers it attractive.

It must also satisfy the applicable ART rules and semantic readability obligations.

## 01.3 ART does not reopen completed content canon

The ART corpus consumes canonical meaning.

It may decide presentation where presentation remains open. It may not silently decide that:

- two distinct materials are actually one;
- a realm has a new species;
- a weapon has new gameplay capability;
- a building belongs to a different culture;
- a portal reaches a different destination;
- a corruption state is a new material;
- a cosmetic difference creates a new canonical object identity;
- a historical prototype colour is final because it already exists in data.

When an art decision exposes a genuine content ambiguity, production stops at that ambiguity and routes it to the owning canon authority.

---

# 02. ART Corpus Scope

ART governs final presentation and production rules for the following domains.

## 02.1 Visual language

- overall Leyforge visual identity;
- voxel/pixel/stylisation language;
- proportions and shape language;
- silhouette hierarchy;
- detail density;
- value structure;
- readability at gameplay distance;
- relationship between ordinary, exceptional, magical, cultural and realm-specific presentation.

## 02.2 Materials, colour, texture and surfaces

- global material-family appearance rules;
- colour roles and palette logic;
- Material DNA presentation;
- inheritance across derived forms;
- wear, dirt, heat, wetness, frost, damage and other overlays;
- glass, fluids, crystal, metal, wood, stone, fibre, organic and magical-surface language;
- shader-facing visual requirements;
- emissive and transparency art direction;
- accessibility-safe distinction rules.

## 02.3 World and environmental art

- realm visual identities;
- biome/environment composition language;
- geology and terrain presentation;
- flora/fungi/ecological dressing;
- architecture and settlement visual grammar;
- cultural/faction overlays;
- dungeon/site/environmental storytelling presentation;
- weather, time-of-day and atmospheric art direction.

## 02.4 Models and physical assets

- terrain blocks and generated construction families;
- unique blocks;
- items and resources;
- tools, weapons, armour and equipment;
- furniture and props;
- functional stations and machines;
- automation/logistics assets;
- magical infrastructure;
- structures and blueprint modules;
- vessels and maritime assets;
- special physical content.

## 02.5 Characters, creatures and motion

- humanoid presentation;
- peoples/species visual interpretation within canon;
- clothing/equipment styling;
- creature/monster/boss presentation;
- art-facing rig requirements;
- animation style, weight, timing and exaggeration;
- locomotion personality;
- work, combat, interaction and casting presentation;
- first-person/third-person consistency.

## 02.6 Effects and lighting

- spell and magic-family VFX;
- impacts and hits;
- machine/automation effects;
- portals and realm transitions;
- weather/environmental VFX;
- corruption, restoration and state effects;
- particles, emission and light language;
- reduced-flash/reduced-motion alternatives.

## 02.7 Audio and music

- material interaction sound families;
- tools and weapons;
- machinery and automation;
- magic and realm sonic identity;
- creatures and characters;
- ambience and environmental layers;
- UI/interface sounds;
- music direction and adaptive music principles;
- repetition control and variation;
- accessibility and information-bearing audio.

## 02.8 UI, iconography and 2D presentation

- inventory icons;
- tooltips and visual tokens;
- skill/spell imagery;
- status-effect symbols;
- map/cartography language;
- Codex imagery;
- portraits/thumbnails;
- menu visual skin;
- Forge preview presentation;
- non-colour state communication.

## 02.9 AI/Codex production procedure

- authority lookup order;
- source gathering;
- inference boundaries;
- use of golden references;
- asset-family generation;
- controlled variation;
- Forge authoring sequence;
- bake/export/registry handoff;
- validation;
- work logging and reusable-skill capture;
- escalation conditions.

---

# 03. Explicit Non-Scope

ART does not independently own:

- gameplay rules;
- content identity or ontology;
- stable-ID allocation law;
- save/network architecture;
- authoritative simulation behaviour;
- physics algorithms;
- AI behaviour;
- engine/module boundaries;
- exact Godot/Zylann implementation;
- exact Forge data schema;
- exact CI product or repository workflow;
- legal/licensing policy;
- multiplayer authority;
- mod-security architecture;
- final performance architecture.

ART may impose **presentation requirements** that those systems must satisfy.

Example:

> ART may require that an active Mana Conduit be recognisably active at gameplay distance and remain distinguishable in reduced-effects mode.

ART does not decide how the runtime network calculates mana flow or how a shader parameter is stored.

---

# 04. Authority Chain

## 04.1 Project-wide hierarchy

For an art-production question, use the following authority chain:

```text
LOCKED CONTENT / PRODUCT CANON
FCC realm documents + FCC-12 + FCC-13 + FCC-14
        ↓
ART CORPUS
final visual / motion / VFX / audio / UI production authority
        ↓
FORGE-ENG + LFE + ENG-GOV / accepted ADRs
technical architecture, implementation rules and feasibility
        ↓
THE FORGE AUTHORING SOURCES
editable source assets, definitions, manifests, libraries
        ↓
BAKED / GENERATED PRODUCTS
runtime meshes, textures, materials, clips, audio products, icons, registries
        ↓
LEY REALMS RUNTIME PRESENTATION
what the player actually sees/hears
```

The Project Brain sits alongside this chain as navigation, status, history, reusable knowledge and work-log infrastructure. It does not replace any owning authority.

## 04.2 When authorities appear to disagree

Use this classification.

### Content meaning conflict

If ART appears to contradict a locked FCC identity or semantic distinction:

> **FCC wins. ART must be corrected or formally reopen the owner-level question.**

### Art-versus-engineering conflict

If ART requires a presentation that current engineering cannot implement efficiently:

> Engineering may propose an alternative implementation or presentation technique, but it may not silently delete the ART requirement.

The resolution is one of:

- technically satisfy the ART rule another way;
- create an accepted bounded ART amendment;
- defer with explicit governance record;
- prove the original requirement infeasible and reopen it through authority.

### Historical source conflict

Historical POC, Unreal-era, Summer-era or prototype asset values are evidence only unless rebound by current authority.

Historical RGB/hex values, texture indices, placeholder meshes, temporary asset paths and low-poly POC visuals do not become final art merely because they exist in a registry or test scene.

### Tool limitation conflict

The Forge is a tool, not art authority.

If an ART requirement cannot currently be authored in The Forge, the missing capability becomes Forge/engineering work. Production must not redefine Leyforge art around an accidental temporary editor limitation without an explicit decision.

---

# 05. Primary Upstream Authorities

## 05.1 FCC-14A — semantic invariants

ART must preserve FCC-14A project-wide identities and boundaries.

This includes, where relevant:

- material identity;
- form versus identity;
- state versus identity;
- provenance;
- cross-realm identity conservation;
- portal-family boundaries;
- current realm identity boundaries;
- native phenomena versus Void corruption;
- personhood and other protected semantic ownership.

## 05.2 FCC-14B — semantic art handoff

FCC-14B is the principal direct parent of the ART corpus.

It defines what must remain perceptually distinguishable and explicitly reserves final presentation choices for later art governance.

ART must consume applicable `VD-*` requirements.

ART must not “solve” visual consistency by collapsing distinctions FCC-14B protects.

## 05.3 FCC-14C — Forge/validation handoff

FCC-14C defines what The Forge, registry/bake/runtime pipeline and validation systems must be capable of preserving.

ART consumes these obligations when specifying production workflows and certification gates.

ART does not replace `HT-*` / `VAL-*` requirements.

## 05.4 FCC-12 — material/form/state/provenance doctrine

ART must treat FCC-12 as upstream authority for the identity and relationships of matter.

A visual family may express inheritance. It may not invent a new material identity where FCC-12 defines a form or state.

## 05.5 FCC-13 — definitive physical identity and registry binding

ART must consume FCC-13 stable identity, projection, generated-form and migration rules.

One canonical physical thing may have multiple presentation products without becoming multiple canonical identities merely because the world model, inventory model, icon or animation representation differs.

## 05.6 Realm/local content canon

Realm documents remain the detailed authority for their own content, ecology, cultures, structures, phenomena and art-handoff constraints.

ART-03 and later production manifests translate those constraints into final art direction without replacing the underlying content definitions.

---

# 06. Relationship to Document Sets 21 and 22

## 06.1 Status of Sets 21 and 22 under ART

Document Sets 21 and 22 remain major design baselines for The Forge and its production model.

ART adopts their useful established concepts unless a later authoritative technical document supersedes implementation details.

Especially retained concepts include:

- editable source versus baked runtime output;
- non-destructive source policy;
- voxel/compound authoring modes;
- world scale and density profiles;
- silhouette-first production;
- palette-role architecture;
- Material DNA and inheritance;
- generated construction shapes;
- named parts, pivots and sockets;
- runtime presentation states;
- animation/effect/audio sockets and markers;
- variants and overrides;
- asset lifecycle/status;
- reference boards;
- golden assets/templates;
- family-based production;
- in-world visual QA;
- migration records;
- source provenance;
- validation and test laboratories.

## 06.2 What ART adds

Sets 21/22 are not sufficient as the final art authority because they leave many stylistically valid outcomes open.

ART adds:

- final Leyforge style decisions;
- final presentation-family rules;
- final realm/cultural art grammar;
- final animation style principles;
- final VFX language;
- final sonic language;
- final icon/UI presentation language;
- an explicit Codex asset-generation procedure;
- cross-domain golden references;
- production certification criteria.

## 06.3 Technical details remain subject to later engineering canon

Where Sets 21/22 make engine-specific technical suggestions that conflict with later accepted FORGE-ENG/LFE/ADR decisions, the later engineering authority controls implementation.

The ART requirement being implemented remains intact unless separately amended.

---

# 07. Relationship to ENG-GOV and B-OPS

## 07.1 Engineering governance remains engineering authority

ART does not create a competing engineering constitution.

All code, tooling, schemas, bake systems, validators, importers/exporters and CI mechanisms remain subject to ENG-GOV and accepted architecture decisions.

## 07.2 Agent work remains governed

Codex/agents performing art-production work through code or Forge automation remain subject to the existing coding-agent bootstrap and task-contract rules.

ART-09 will define the **art-specific execution procedure**, but it does not waive Branch B requirements.

## 07.3 No duplicate record system

ART should not create a parallel ADR/waiver/work-log bureaucracy where Branch B already provides a suitable governed record.

Art direction itself is versioned through ART documents and their controlled amendments.

Engineering implementation decisions use the existing ADR/governance system.

Production work and discoveries are logged through the Project Brain/work-log system.

---

# 08. Relationship to the Project Brain

The Project Brain must make the ART corpus easy to discover without becoming a competing art authority.

The Brain should eventually expose an Art Production hub containing, at minimum:

```text
Art Production
├── ART Corpus Index
├── Current Master Style
├── Material / Surface Library
├── Realm & Culture Art Direction
├── Golden References
├── Asset Family Status
├── Pending Art Decisions
├── Visual / Audio QA Failures
├── Asset Migration Status
├── Recent Production Work
├── Art/Forge Skills & Procedures
└── Source Authority Links
```

The Brain may cache summaries and status.

If a Brain summary conflicts with the owning ART/FCC/ENG-GOV source, the owning source wins.

Reusable production discoveries—such as a better reliable method for generating a certain voxel curve, preserving pixel alignment, baking an animation family, capturing icons or validating socket alignment—should be promoted into Skills/Procedures/Shortcuts when they are genuinely reusable.

---

# 09. Core Art Production Laws

The following laws govern all ART documents and downstream production.

## ART-C01 — Semantic truth before style

No aesthetic choice may silently rewrite canonical identity or gameplay meaning.

## ART-C02 — Leyforge must have one recognisable visual family

Realm, culture, magic and material differences may be strong, but all official assets must still read as belonging to the same game rather than unrelated asset packs.

## ART-C03 — Silhouette before micro-detail

A major asset class must remain readable by shape, proportion and major value grouping before texture noise or decorative detail is added.

## ART-C04 — Material inheritance must be visible where useful

Derived forms of the same material should remain recognisably related unless a documented process/state legitimately changes their presentation.

## ART-C05 — Form does not invent matter

A stair, beam, plate, wire, blade or gear may alter silhouette and construction but does not become unrelated visual matter merely because the form changed.

## ART-C06 — State overlays preserve base identity when restoration/history matters

Damage, occupation, dirt, wetness, heat, frost, magical charge, corruption and restoration should modify the base asset without unnecessarily destroying recognition of what the object originally is.

## ART-C07 — Critical meaning cannot depend on colour alone

Where state recognition affects safety, crafting, law, navigation, portals, hazards, corruption, accessibility or gameplay comprehension, redundant cues must exist.

## ART-C08 — Function before ornament

Functional assets must visually communicate important interaction, direction, connection, opening, motion, input/output or danger before decorative embellishment.

## ART-C09 — Motion before ornament for animated entities

A character or creature with excellent surface detail but weak silhouette, rigging or movement is not production-ready.

## ART-C10 — Context before approval

Final approval requires in-context viewing/listening at intended gameplay distance, lighting, motion and density, not only a clean editor turntable.

## ART-C11 — Family before one-off rescue

When an asset belongs to a reusable material, culture, machine, architecture, animation or VFX family, production should solve the family rule before creating numerous isolated exceptions.

## ART-C12 — Controlled variation, not random inconsistency

Procedural or agent-generated variation must operate within explicit variant dimensions and bounded art rules.

## ART-C13 — Reuse before duplication

Shared materials, motifs, animation libraries, VFX profiles, audio families and icon grammar should be reused when meaning supports reuse.

## ART-C14 — Specificity where canon requires specificity

Reuse must stop where it would collapse an identity that canon requires to remain distinct.

## ART-C15 — Source assets are editable authority; baked products are replaceable projections

Runtime assets may be regenerated. Production must retain authoritative editable sources and provenance.

## ART-C16 — Golden references calibrate; they do not become universal clones

Golden assets establish quality/style boundaries. They are not templates that force every realm, culture or creature to share identical ornament or silhouette.

## ART-C17 — Low-end/accessibility modes preserve meaning

Reduced effects, simplified geometry, lower texture/detail profiles, reduced flash and reduced motion may change presentation technique but must retain the semantic cues needed for play.

## ART-C18 — Performance is part of production quality

An asset that only looks correct when violating approved runtime budgets is not production-ready.

## ART-C19 — Historical placeholders are not style authority

Prototype visuals may be useful migration references but are not final simply because they already exist.

## ART-C20 — AI may infer presentation, never hidden canon

Codex/agents may make bounded artistic choices within the ART rules. They must not invent content facts, powers, relationships, species, materials or destinations to make an asset easier to design.

## ART-C21 — Uncertainty must be classified

An agent encountering uncertainty must classify it as:

- art choice within authority;
- technical implementation choice;
- missing canon;
- conflicting authority;
- missing Forge capability;
- missing validation evidence.

The response depends on classification; guessing is not a universal fallback.

## ART-C22 — Every final asset has traceable authority

A production-ready asset must be traceable to canonical identity and the applicable ART rules/golden references.

## ART-C23 — Every final asset has traceable production state

The project must be able to determine whether an asset is draft, review-ready, approved, superseded, deprecated or migrated.

## ART-C24 — Art changes are versioned changes

A large art-direction shift is not silently propagated through generated assets. It is versioned, documented and deliberately migrated.

---

# 10. Asset Resolution Doctrine

ART adopts the following conceptual presentation equation from the semantic handoff:

```text
Canonical Identity
+ Physical Form
+ Material / Composition
+ Condition / State
+ Relevant Provenance
+ Relevant Quality / Grade
+ Culture / Realm / Context Overlay
+ Equipment / Attachment / Variant Layer
+ Accessibility / Performance Presentation Profile
= Resolved Player-Facing Presentation
```

Not every factor is visible on every asset.

The production rule is:

> A dimension becomes presentation-relevant when the player, simulation, authoring workflow or content identity needs that distinction to be understood.

Examples:

- ordinary Oak Planks and an Oak Stair should inherit the same oak family language;
- a damaged oak door should still read as the same door beneath damage;
- a culturally styled iron gate may alter construction and ornament without making the iron a new material;
- a Void-corrupted structure should remain identifiable as the underlying structure where cleansing/restoration matters;
- a quality difference does not automatically become a universal rarity-colour ladder;
- a portal state may require geometry, symbol, animation and/or audio change in addition to colour.

---

# 11. Production Asset Package Contract

A final production asset is more than a model file.

Depending on asset class, the complete source package may include:

- canonical/stable identity reference;
- editable model/voxel source;
- material and Material DNA bindings;
- palette roles;
- texture/surface source;
- named parts;
- pivots;
- sockets;
- collision/interaction contract references;
- state variants/overlays;
- animation clips or motion profiles;
- VFX bindings;
- light/emission bindings;
- audio cue/profile bindings;
- held/world/equipped/inventory presentation profiles;
- icon/thumbnail/Codex capture product;
- LOD/scalability variants where required;
- accessibility presentation alternatives where required;
- authored variant dimensions;
- migration/replacement metadata;
- source provenance;
- validation evidence;
- approval state.

The exact schema is a Forge/engineering decision. The conceptual completeness requirement belongs to ART.

---

# 12. Official ART Corpus Map

ART-00 defines the intended initial global corpus as **ART-00 through ART-10**.

## ART-00 — Art Production Constitution & Authority Map

Owns:

- corpus purpose;
- authority chain;
- scope and boundaries;
- production laws;
- relationship to FCC/Forge/ENG-GOV/Brain;
- corpus map;
- final gate model.

## ART-01 — Master Leyforge Visual Language & Style Bible

Owns:

- overall recognisable Leyforge look;
- stylisation level;
- voxel/pixel language;
- shape language;
- proportions;
- detail density;
- silhouette hierarchy;
- value/readability rules;
- visual restraint/exaggeration;
- composition principles;
- ordinary-versus-magical presentation hierarchy.

## ART-02 — Materials, Colour, Texture, Surface & Shader Art Standard

Owns final art rules for:

- colour-role system;
- palette families;
- Material DNA visual expression;
- material inheritance;
- texture/pixel language;
- metal, stone, wood, glass, crystal, fibre, organic and fluid families;
- wear/weather/damage/state overlays;
- transparency/emission art direction;
- shader-facing visual requirements;
- material accessibility/readability.

## ART-03 — World, Realm, Biome, Architecture & Culture Art Direction

Owns:

- shared environmental composition language;
- current realm visual identities;
- biome grammar;
- terrain/geology/flora presentation;
- atmosphere/lighting direction;
- settlement/architecture language;
- culture/faction visual overlays;
- dungeon/site/environmental storytelling language;
- realm-specific boundaries.

This document may absorb the current need for realm-specific art-direction summaries rather than requiring fourteen separate Realm K/L documents immediately. If later production scale requires dedicated realm K/L volumes, they remain subordinate to ART-03 and the owning FCC realm documents.

## ART-04 — Blocks, Items, Machines, Structures, Equipment & Vessel Modelling Standard

Owns art-facing modelling rules for:

- blocks and generated forms;
- unique blocks;
- items/resources;
- tools/weapons/armour;
- props/furniture;
- machines/logistics;
- magic infrastructure;
- structures/blueprints;
- vessels;
- state geometry;
- first/third-person/world/inventory representation;
- art-facing pivot/socket/scale conventions.

## ART-05 — Characters, Creatures, Rigging & Animation Style Handoff

Owns:

- humanoid visual language;
- creature/boss presentation;
- anatomy interpretation within canon;
- clothing/equipment styling;
- animation personality;
- locomotion weight;
- work/combat/casting/interaction motion;
- facial/expression presentation;
- art-facing rig/socket expectations;
- first-person/third-person motion coherence.

## ART-06 — VFX, Lighting, Weather, Magic & Environmental Effects Bible

Owns:

- magic-family VFX identities;
- elemental/impact language;
- portals;
- wards/runes/mana;
- machine effects;
- weather;
- environmental particles;
- damage/corruption/restoration effects;
- light/emission visual language;
- effect intensity hierarchy;
- reduced-flash/reduced-motion alternatives.

## ART-07 — Audio, Music & Sonic Identity Bible

Owns:

- sonic style;
- material interactions;
- movement/footsteps;
- tools/weapons;
- machines/automation;
- magic;
- portals/realms;
- creatures/characters;
- ambience;
- UI sounds;
- repetition/variation rules;
- adaptive music principles;
- accessibility and information-bearing audio.

## ART-08 — UI, Icons, Cartography, Codex & 2D Presentation Standard

Owns:

- UI art skin;
- icon grammar;
- inventory and equipment imagery;
- spell/ability/status symbols;
- map/cartography presentation;
- magical/upgraded cartography visual principles;
- Codex/encyclopaedia images;
- portraits/thumbnails;
- Forge preview/capture art rules;
- non-colour redundancy.

## ART-09 — Codex / The Forge Asset Production Execution Contract

Owns the repeatable agent procedure:

```text
TASK
→ AUTHORITY LOOKUP
→ CANONICAL IDENTITY RESOLUTION
→ ART RULE RESOLUTION
→ GOLDEN REFERENCE SELECTION
→ ASSET FAMILY / INHERITANCE RESOLUTION
→ FORGE SOURCE AUTHORING
→ TEXTURE / MATERIAL AUTHORING
→ RIG / ANIMATION / VFX / AUDIO AS APPLICABLE
→ ICON / THUMBNAIL PRODUCTS
→ BAKE / EXPORT
→ REGISTRY / MANIFEST BINDING
→ AUTOMATED VALIDATION
→ IN-CONTEXT REVIEW
→ WORK LOG / DISCOVERY PROMOTION
→ APPROVAL OR REVISION
```

ART-09 also owns agent inference limits, escalation rules and production reporting.

## ART-10 — Golden References, Visual/Audio QA & Production Certification

Owns:

- golden asset/reference library;
- reference-board requirements;
- canonical comparison scenes;
- silhouette tests;
- material-family tests;
- animation/motion review;
- VFX/audio review;
- icon/UI review;
- accessibility review;
- low-end/scalability review;
- family-completeness checks;
- final production certification;
- regression expectations when art direction changes.

---

# 13. Corpus Dependency Order

Recommended creation order:

```text
ART-00
  ↓
ART-01
  ↓
ART-02 ─────┐
ART-03 ─────┤
            ↓
ART-04
ART-05
ART-06
ART-07
ART-08
  ↓
ART-09
  ↓
ART-10
```

Rationale:

1. ART-00 establishes authority.
2. ART-01 defines the common visual language all specialist documents inherit.
3. ART-02 and ART-03 establish materials and world/culture presentation foundations.
4. ART-04–08 specialise production domains.
5. ART-09 teaches Codex/The Forge how to execute the now-complete rules.
6. ART-10 certifies the production pipeline and golden references.

The specialist documents may be drafted iteratively and reconciled rather than treated as completely isolated silos.

---

# 14. Art Decision Classes

Every unresolved production question should be classified before it is answered.

## Class A — Canon-owned meaning

Examples:

- What species is this?
- Is this material ordinary Iron or Soul Silver?
- Is this state corruption or native environmental stress?
- Which realm owns this portal?

**Owner:** FCC/content canon.  
**ART action:** consume, do not invent.

## Class B — Art-direction decision

Examples:

- How angular is Leyforge ironwork?
- How much value contrast does mana crystal use?
- What silhouette language distinguishes Verdant architecture from Ashen architecture?
- How exaggerated is a mining swing?

**Owner:** ART.

## Class C — Technical implementation decision

Examples:

- Which Godot resource stores an effect profile?
- How are texture atlases baked?
- Which animation runtime node is used?
- How are audio variants streamed?

**Owner:** FORGE-ENG/LFE/ENG-GOV/ADR.

## Class D — Production execution choice

Examples:

- Which approved oak reference is the closest starting point?
- Which bounded scratch pattern from the iron library is selected?
- Which approved idle variant is assigned to this NPC?

**Owner:** agent/artist within ART rules.

## Class E — Validation/evidence question

Examples:

- Is the effect readable at 30 m?
- Does reduced-flash mode still communicate portal danger?
- Does the tool align with all compatible hand sockets?
- Does the family remain coherent under low-detail profile?

**Owner:** validation/testing using ART-10 and engineering gates.

---

# 15. Agent/Codex Authority Boundary

Until ART-09 adds detailed procedure, the following baseline applies.

## 15.1 Codex may

Codex/agents may:

- inspect canonical documents and registries;
- resolve applicable ART rules;
- reuse approved templates and golden references;
- create bounded stylistic variants;
- author/edit assets in The Forge;
- generate textures, models, animation, VFX, audio configuration and icon products where tooling permits;
- run automated validators;
- compare outputs against golden references;
- propose art improvements;
- record reusable procedures and discovered shortcuts;
- report missing capabilities or contradictions.

## 15.2 Codex may not

Codex/agents may not silently:

- invent a new canonical material/species/faction/realm/portal;
- change stable identity because the asset is inconvenient;
- use a historical placeholder palette as final authority;
- convert a state into a separate canonical object without upstream authority;
- delete a semantic distinction to reduce asset count;
- claim visual/audio approval that did not occur;
- claim validation that was not run;
- bypass required migration or registry rules;
- create uncontrolled random variants outside defined dimensions;
- change gameplay contracts through presentation authoring.

## 15.3 Bounded autonomous art decisions

The intended production model is not “ask the owner about every pixel.”

Once ART-01–08 and golden references are locked, Codex should autonomously make ordinary lower-level presentation decisions within the authorised style envelope.

Owner escalation should be reserved for:

- new art-direction precedent;
- ambiguous canon;
- conflict between authoritative rules;
- major golden-reference change;
- a choice that would substantially redefine a realm/culture/material/magic family;
- unresolved technical limitation that would force visible compromise;
- acceptance of a deliberate exception.

---

# 16. Golden Reference Doctrine

ART adopts the golden-asset/template concepts already anticipated by Sets 21 and 22 and makes them a formal project mechanism.

A golden reference is an approved calibration asset or scene that demonstrates one or more production rules exceptionally clearly.

The first golden library should eventually include representatives for:

- ordinary terrain material;
- wood family and generated forms;
- stone family and generated forms;
- metal family and derived item/tool forms;
- glass/transparency;
- fluid;
- magical crystal;
- functional station;
- mechanical machine;
- magical machine;
- storage/prop;
- humanoid base;
- cultural humanoid variation;
- ordinary animal;
- monster;
- boss-scale creature;
- architecture kit;
- settlement scene;
- dungeon/site scene;
- portal family/state;
- spell/VFX family;
- damage/corruption/restoration sequence;
- audio interaction family;
- inventory icon;
- map/cartography example.

Golden references are versioned. A major replacement may trigger migration/review of dependent assets.

---

# 17. Realm and Culture Art Direction Strategy

FCC-14B permits realm-specific visual identity/art-manifest work.

ART-00 chooses a **consolidated-first strategy**:

1. ART-01 establishes global Leyforge language.
2. ART-02 establishes global material/surface language.
3. ART-03 establishes current realm, biome, architecture and culture art direction in one maintainable global authority.
4. Dedicated realm K/L documents are created later only where production complexity justifies them.

This avoids immediately creating fourteen additional documents while preserving the FCC-14B extension model.

If a realm-specific K/L document is later created:

- it remains subordinate to the owning FCC realm package;
- it remains subordinate to ART-01/02 global style law;
- it may specialise ART-03 for that realm;
- it must not create new content canon;
- it must link, not duplicate, universal material rules.

---

# 18. Historical POC and Migration Treatment

The existing POC asset set is valuable as:

- functional-contract evidence;
- collision/socket/pivot evidence;
- first/third-person composition evidence;
- gameplay readability evidence;
- migration source inventory;
- regression fixture material;
- proof that certain production concepts already work.

It is not automatically final art.

Current POC low-poly models were intentionally created to establish identity, animation hooks, proportions and readability without locking the final art style.

Therefore ART production should classify POC assets into categories such as:

- retain concept, rebuild presentation;
- retain geometry contract, restyle surface;
- retain source as golden functional fixture only;
- migrate to generated family;
- replace with authored final asset;
- deprecate/remove;
- preserve solely as compatibility/test fixture.

ART-10 and the eventual production migration pass will formalise the exact certification workflow.

---

# 19. Art Quality Is Multi-Dimensional

No single “looks good” score is sufficient.

A production asset should eventually be evaluated across dimensions including:

- canonical correctness;
- silhouette/readability;
- material correctness;
- style-family coherence;
- state readability;
- functional readability;
- scale/proportion;
- motion quality where applicable;
- VFX/light coherence where applicable;
- audio coherence where applicable;
- icon/UI coherence where applicable;
- accessibility;
- scalability/LOD;
- technical validity;
- provenance/registry integrity;
- migration compatibility;
- in-context quality.

An asset may be excellent in one dimension and still fail production certification overall.

---

# 20. Scalability and Accessibility Law

Leyforge's art direction must be designed for scalable presentation from the start rather than retrofitted after asset production.

The intended rule is:

> **Scale visual richness; do not scale away game truth.**

Examples of legitimate scaling include:

- lower particle counts;
- shorter effect trails;
- simplified secondary geometry;
- fewer animation secondary-motion layers;
- reduced texture/detail profile;
- simplified shadows/lights;
- cheaper distant material treatment;
- lower-density ambient audio layers.

Examples of illegitimate scaling include:

- removing the only cue that a portal is unsafe;
- making Void corruption indistinguishable from ordinary damage;
- removing the only direction indicator on a logistics device;
- making two exact required materials identical where selection matters;
- disabling necessary state feedback in reduced-effects mode.

ART-06, ART-08 and ART-10 must explicitly test reduced-motion, reduced-flash and non-colour communication where applicable.

---

# 21. Family Production Rule

Mass content production must proceed through families wherever possible.

For a material family, the preferred production order is:

```text
MATERIAL IDENTITY
→ MATERIAL DNA / PALETTE / SURFACE RULE
→ GOLDEN BASE FORM
→ GENERATED STANDARD FORMS
→ SPECIALIST AUTHORED FORMS
→ ITEMS / COMPONENTS
→ STATE OVERLAYS
→ ICON / THUMBNAIL PRODUCTS
→ IN-CONTEXT FAMILY REVIEW
```

For a creature/entity family:

```text
BODY-PLAN / CANON IDENTITY
→ SILHOUETTE / PROPORTION
→ MATERIAL / SURFACE
→ RIG / SOCKETS
→ LOCOMOTION BASE
→ BEHAVIOUR MOTIONS
→ EQUIPMENT / VARIANTS
→ VFX / AUDIO AS APPLICABLE
→ ICON / PORTRAIT
→ IN-CONTEXT REVIEW
```

For architecture/culture:

```text
CULTURAL / FUNCTIONAL CANON
→ SHAPE LANGUAGE
→ MATERIAL ROLE PALETTE
→ MODULAR KIT
→ GOLDEN BUILDING
→ STRUCTURE FAMILY
→ STATE / DAMAGE / OCCUPATION VARIANTS
→ SETTLEMENT CONTEXT REVIEW
```

This rule reduces visual drift and makes Codex automation substantially safer.

---

# 22. Change Control

## 22.1 Small production choices

Routine choices already permitted by current ART rules do not require a new authority document.

They should still be captured in normal production history where useful.

## 22.2 New precedent

A new reusable art precedent should be promoted into:

- the relevant ART document;
- golden-reference library;
- Material DNA/style library;
- or Project Brain skill/procedure,

rather than remaining an undocumented one-off.

## 22.3 Major art-direction change

A major art-direction change requires:

1. explicit proposal;
2. affected ART authority identification;
3. impact analysis on golden references and asset families;
4. owner approval where required;
5. versioned ART update;
6. migration plan for affected assets;
7. regression review.

## 22.4 Canon change discovered during art production

If production reveals a real canon problem:

1. stop the affected decision;
2. record the ambiguity/conflict;
3. route to the owning FCC/content authority;
4. resume after the semantic decision is resolved;
5. update ART only if presentation rules are consequently affected.

---

# 23. Validation Philosophy

ART validation combines automation and judgement.

## 23.1 Automatable checks

Potential automatable checks include:

- missing stable identity/reference;
- missing required model representations;
- invalid material-family binding;
- missing pivots/sockets;
- orientation mismatch;
- family-form incompleteness;
- disallowed palette/material role;
- missing state representation;
- icon capture missing;
- invalid output dimensions;
- LOD product missing;
- unbounded variant settings;
- missing accessibility alternative;
- missing provenance;
- stale golden-reference dependency;
- bake mismatch;
- deterministic-generation drift.

## 23.2 Judgement checks

Human/agent visual or listening review remains required for areas such as:

- silhouette quality;
- perceived weight;
- visual hierarchy;
- excessive noise;
- cultural coherence;
- emotional tone;
- motion feel;
- magic identity;
- audio fatigue;
- atmosphere;
- overall “belongs in Leyforge” coherence.

## 23.3 Real-context acceptance

An isolated editor preview cannot be the only final proof.

Representative assets must be reviewed in relevant real contexts such as:

- daylight and darkness;
- indoor/outdoor;
- combat density;
- settlement density;
- biome/realm lighting;
- first-person and third-person;
- inventory/UI scale;
- normal and low-performance profiles;
- accessibility modes.

---

# 24. Completion and Lock Model

ART-00 itself establishes the corpus but does not claim the remaining ART documents are already solved.

The global art-production programme reaches **ART PRODUCTION HANDOFF READY** only when:

- ART-00 through ART-10 are complete and reconciled;
- all current FCC-14B semantic art obligations have a downstream rule or explicit accepted disposition;
- the global visual language is locked enough for repeatable production;
- materials and realm/culture language are defined;
- models/entities/VFX/audio/UI have domain rules;
- Codex execution procedure is complete;
- initial golden references exist;
- representative end-to-end Forge asset production has been demonstrated;
- validation can catch major classes of drift;
- no unresolved blocker would force Codex to guess high-level art direction during mass production.

This gate does **not** require every final game asset to already exist.

It requires the production system to be sufficiently defined that final assets can be created consistently.

---

# 25. Pre-Rebuild Relationship

The ART corpus is a **pre-production / pre-mass-asset-production requirement**.

It does not necessarily block every line of clean-rebuild foundation code.

However, before Codex is relied upon to mass-create or replace final presentation assets, the relevant ART authority must exist.

At minimum, mass visual production should not begin before:

- ART-00;
- ART-01;
- ART-02;
- applicable ART-03 rules;
- applicable specialist ART document;
- ART-09 baseline procedure;
- ART-10 initial golden/validation framework.

This allows engine/Brain/governance foundation work to proceed while preventing premature bulk art generation from becoming another migration problem.

---

# 26. Initial Source Crosswalk

| Source family | ART use | Authority treatment |
|---|---|---|
| FCC-01/02/03/04/05/06/08 | realm/world content, ecology, culture, structures, phenomena | Upstream content authority |
| FCC-12 | material/form/state/provenance/provider semantics | Upstream global material authority |
| FCC-13 | physical identity, stable IDs, generated forms, projections, migration | Upstream registry/identity authority |
| FCC-14A | project-wide semantic invariants | Upstream certification authority |
| FCC-14B | semantic visual-distinction obligations and open final-art decisions | **Direct parent of ART** |
| FCC-14C | Forge/technical/validation/migration obligations | Parallel implementation-handoff parent |
| FCC-14D | final FCC package lock and downstream routing | Upstream final certification |
| Set 21A–G | Voxel Asset Forge concepts, material DNA, animation/effects, overrides, workflow, migration | Major Forge/art production baseline |
| Set 22A–L | entity/creature/rig/animation/blueprint/tooling/production concepts | Major entity/blueprint production baseline |
| POC Manual Testing Guide | functional and visual-contract evidence; migration fixtures | Historical/current implementation evidence, not final art authority |
| VoxelRegistry / historical registries | identity/migration evidence depending current binding | Prototype values are not final palette/style authority |
| ENG-GOV / B-OPS | engineering law, coding-agent rules, work/validation governance | Engineering authority |
| Project Brain | navigation, status, work logs, reusable knowledge | Operational knowledge layer |
| FORGE-ENG / LFE | future/current technical implementation architecture | Downstream engineering authority |

---

# 27. ART-00 Acceptance Checklist

ART-00 is ready for owner lock when the following are accepted:

- [x] ART is defined as the missing final presentation/production authority layer.
- [x] FCC/content canon remains upstream and cannot be silently rewritten by art.
- [x] FCC-14B is recognised as the direct semantic parent of ART.
- [x] FCC-14C Forge/validation requirements remain intact.
- [x] Sets 21/22 are adopted as major capability/production baselines rather than discarded.
- [x] ENG-GOV remains engineering authority.
- [x] Project Brain remains navigation/status/learning rather than art authority.
- [x] historical POC/prototype values are explicitly prevented from becoming accidental final style authority.
- [x] ART-00 through ART-10 initial corpus is defined.
- [x] realm K/L documents remain optional specialist expansions rather than mandatory immediate document explosion.
- [x] Codex autonomous-production boundary is defined at baseline level.
- [x] golden-reference mechanism is made formal.
- [x] family-based production is required where appropriate.
- [x] scalability/accessibility preserve semantic truth.
- [x] final art production requires traceable source/provenance and validation.
- [x] mass final-asset production is prevented from beginning without sufficient ART guidance.

---

# 28. ART-00 Lock Statement

Accepted by the project owner through continuation approval on 4 September 2026. The following is the ART corpus foundation:

> **ART-00 — LEYFORGE ART PRODUCTION CONSTITUTION & AUTHORITY MAP — LOCKED v0.1**
>
> Leyforge final presentation is governed by a dedicated ART production corpus downstream of locked content semantics and upstream of production asset generation. FCC defines what content means; ART defines the authorised presentation language; The Forge and engineering implement that language; Codex/agents may autonomously produce assets only inside the resulting authority envelope. Historical prototype visuals remain evidence rather than final style authority. ART-00 through ART-10 form the initial global art-production corpus, with specialist realm documents added only where later production complexity requires them.

---

# 29. Next Document

Upon ART-00 approval, proceed to:

> **ART-01 — Master Leyforge Visual Language & Style Bible**

ART-01 should resolve the highest-leverage open presentation questions first:

- what makes a screenshot immediately recognisable as Leyforge;
- voxel/pixel relationship;
- stylisation versus realism;
- shape language;
- silhouette and proportion rules;
- detail-density hierarchy;
- value and colour-role philosophy;
- ordinary versus magical visual hierarchy;
- how cosy, dangerous, ancient, whimsical, industrial, civilisational and high-fantasy tones coexist;
- how realm diversity remains strong without looking like unrelated games;
- how those rules survive first-person, distance, low-end and accessibility profiles.

ART-01 becomes the common visual language inherited by every later specialist ART document.

---

# 30. Principal Source Basis

This document was drafted against the current Leyforge project authority state and specifically consumes the following source families:

- `FCC-14A_Final_Cross-Realm_Certification_and_Global_Invariant_Register_v0_1.md`
- `FCC-14B_Semantic_Art-Handoff_and_Visual_Distinction_Manifest_v0_1.md`
- `FCC-14C_Forge_Technical_Validation_and_Migration_Handoff_Requirements_v0_1.md`
- `FCC-14D_Final_Hold_Amendment_Register_Completeness_Audit_Package_Manifest_and_Cross-Realm_Certification_Lock_v0_1.md`
- locked FCC-12 and FCC-13 authority as routed through FCC-14;
- current realm FCC art-handoff semantics as routed through FCC-14;
- Document Set 21A–G — Voxel Asset Forge;
- Document Set 22A–L — Forge Entity and Blueprint Expansion;
- Branch B ENG-GOV/B-OPS authority model;
- current Leyforge POC Manual Testing Guide as implementation/migration evidence.

Where this ART-00 draft is less detailed than an owning upstream source, the owning source remains authoritative.

---

**End of ART-00 v0.1 — Proposed Art Production Governance Baseline**
