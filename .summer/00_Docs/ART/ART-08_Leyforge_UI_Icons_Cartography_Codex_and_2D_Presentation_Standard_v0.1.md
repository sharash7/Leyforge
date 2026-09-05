# Leyforge Art Production Corpus

## ART-08 — UI, Icons, Cartography, Codex & 2D Presentation Standard

**Document ID:** ART-08  
**Title:** Leyforge UI, Icons, Cartography, Codex & 2D Presentation Standard  
**Version:** v0.1  
**Date:** 4 September 2026  
**Status:** **LOCKED ART-PRODUCTION BASELINE — OWNER ACCEPTED 4 SEPTEMBER 2026**  
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
**Primary upstream interface authority:** Document 17 v1.0 — UI, UX, Accessibility, Menus, HUD, World Configuration and Player-Trust System  
**Forge workflow parents:** Documents 21E and 22J — Forge UI/UX and creator workflows  
**Primary semantic suppliers:** canonical registries; FCC content canon; Documents 03–16, 19–20; Sets 24–30; current PRD/FCC authorities; applicable specialist systems  
**Primary downstream consumers:** ART-09, ART-10, Codex/coding agents, The Forge, runtime UI implementation, icon capture/generation, cartography presentation, knowledge/Codex presentation, accessibility QA, localisation QA, Project Brain  

---

# 00. Executive 2D Presentation Statement

Leyforge's interface should feel like a **clear window into a living voxel world, not a decorative fantasy dashboard laid over it**.

The core promise is:

> **World truth first, player knowledge second, interface interpretation third, ornament last.**

The visual promise is:

> **Every screen should remain recognisably Leyforge through material, geometry, icon language and restrained cultural/realm accents while retaining modern clarity, fast scanning and accessibility.**

The cartography promise is:

> **Maps reveal what the player or civilisation has actually learned. Better cartography improves interpretation, dimensionality, confidence and usefulness; it does not grant omniscience.**

The Codex promise is:

> **Knowledge presentation distinguishes observation, verified fact, cultural belief, inference, uncertainty and unknown information instead of flattening them into one encyclopaedia truth dump.**

The production promise is:

> **Codex should be able to receive a canonical UI state, item, block, spell, creature, map layer, settlement function, realm, tutorial concept or knowledge record; resolve the correct semantic source; generate the required icon, panel treatment, diagram, map symbol, 2D illustration or capture product; validate readability, knowledge filtering, localisation, accessibility and state coverage; and package it through The Forge without inventing gameplay truth.**

ART-08 owns the **artistic presentation language** of player-facing and Forge-facing 2D assets. It does not replace Document 17's interaction architecture, view models, validated commands, gameplay systems, accessibility semantics, localisation systems or engineering implementation.

---

# 01. Authority and Scope

## 01.1 ART-08 owns

ART-08 owns final art-production rules for:

- global UI visual language;
- panel, frame, separator, tab and control treatment;
- HUD visual composition and art treatment;
- iconography and pictogram grammar;
- inventory/item/block projection imagery;
- skill, spell, status, effect and condition icons;
- crafting and recipe visual presentation;
- settlement, project, economy, automation, magic and realm interface art;
- menu, pause, settings, world-library and world-creation visual treatment;
- map and cartography art direction;
- ordinary, surveyed and magical/advanced cartographic presentation;
- terrain, route, political, ecological, trade, maritime and realm-map layer visuals;
- Codex, journal, chronicle, research and knowledge presentation art;
- diagrams, schematics and explanatory 2D graphics;
- portraits and entity presentation captures;
- notifications, warnings and semantic status tokens;
- cursor, focus, selection and interaction-state visuals;
- 2D cultural and realm accents;
- image/capture composition for thumbnails and previews;
- 2D motion/transition direction in coordination with ART-06;
- UI sonic pairing requirements in coordination with ART-07;
- accessibility-safe 2D presentation requirements;
- Codex/agent production procedure for 2D/UI assets;
- ART-08 golden-reference candidates and QA criteria.

## 01.2 ART-08 does not own

ART-08 does not own:

- authoritative gameplay values;
- whether an action is allowed;
- inventory, crafting, settlement, combat, economy, magic or world simulation truth;
- view-model schemas or command validation;
- world-generation semantics;
- map discovery mechanics or exact surveying mechanics;
- quest logic or narrative canon;
- localisation content;
- screen-reader implementation;
- input mapping semantics;
- engine/widget implementation;
- asset-budget numbers owned by engineering/governance;
- Forge editor workflow semantics already owned by 21E/22J;
- stable gameplay identity or registry ownership.

## 01.3 Conflict rule

If visual attractiveness conflicts with:

1. authoritative state;
2. player knowledge;
3. readability;
4. accessibility;
5. localisation;
6. input/focus clarity;
7. performance;

then attractiveness yields.

---

# 02. Core UI Identity

Leyforge UI should combine:

- contemporary information clarity;
- crafted-world tactility;
- restrained parchment, timber, stone, metal and rune influence;
- sharp voxel/pixel-aware geometry;
- generous visual rest;
- explicit hierarchy;
- contextual rather than constant ornament;
- realm/cultural accents where semantically appropriate.

It should **not** become:

- a fake medieval operating system;
- wall-to-wall parchment;
- excessive bevelled fantasy chrome;
- tiny pseudo-runes replacing readable labels;
- neon sci-fi holography by default;
- a mobile-game badge field;
- an RPG rarity-rainbow layer over every object.

---

# 03. World-First Presentation

Normal play prioritises the world.

Persistent HUD art must remain subordinate to:

- terrain;
- entities;
- hazards;
- interactions;
- building;
- combat;
- environmental readability.

Deep information belongs in contextual panels, inspections, maps, books, boards, overlays and dedicated workspaces rather than permanently occupying the screen.

---

# 04. The Three Presentation Depths

ART-08 visually supports Document 17's interface-depth model:

### Glance
Fast state recognition with minimum visual mass.

### Inspect
Immediate cause, identity and actionable detail.

### Analyse
Dense comparison, planning, graphs, overlays and historical context.

The same semantic state should remain visually related across all three depths.

---

# 05. Global Layout Grammar

Preferred hierarchy:

1. current task/context;
2. primary state;
3. actionable control;
4. reason/explanation;
5. secondary detail;
6. provenance/history/advanced data.

Primary information should not be visually buried beneath decoration or secondary statistics.

---

# 06. Panel Construction Language

Panel art may use:

- clean flat body fields;
- subtle inset/extruded voxel-like edges;
- restrained material trims;
- contextual corner or header motifs;
- local iconography;
- bounded translucent overlays where world visibility matters.

Panels must remain readable at low contrast complexity and cannot require texture detail to define their boundaries.

---

# 07. Material Use in UI

UI materials are **representational**, not photorealistic mini-surfaces.

Examples:

- parchment can suggest records/history;
- timber may support village/building contexts;
- metal may support machine/defence contexts;
- carved stone may support ancient/realm content;
- subtle rune geometry may support magic contexts.

Material treatment must never reduce text contrast or make a screen look like a prop photograph.

---

# 08. Shape Language

UI geometry should echo Leyforge's voxel identity through:

- stepped or chamfered corners;
- grid-aware spacing;
- block-derived modules;
- clear orthogonal alignment;
- occasional controlled diagonals for motion/direction.

The interface should not imitate low-resolution pixel art merely because the world is voxel-based.

---

# 09. Semantic Style Tokens

Every shared state token requires a consistent visual family.

Required baseline tokens include:

- success;
- warning;
- critical;
- unavailable;
- unknown;
- selected;
- focused;
- ownership;
- reserved;
- active;
- inactive;
- damaged;
- corrupted;
- protected;
- estimated;
- stale/outdated;
- pending;
- blocked;
- incomplete;
- verified.

No token may rely on colour alone.

---

# 10. Colour Roles

Colour is used as one channel among several.

State must also have at least one of:

- shape;
- icon;
- pattern;
- label;
- placement;
- motion;
- outline;
- fill treatment.

Rarity, craftsmanship quality, physical condition and player knowledge remain separate visual dimensions.

---

# 11. Typography

Typography must prioritise:

- legibility;
- scalable sizes;
- strong hierarchy;
- stable numeral readability;
- localisation tolerance;
- clear distinction between labels, values, warnings and prose.

Decorative type may appear in limited headings, diegetic documents or realm/cultural presentation, but essential information uses highly readable typography.

No essential information is encoded only inside decorative image text.

---

# 12. Text Density

UI copy should reveal detail progressively.

Default surfaces should not expose entire simulation objects at once.

Dense data belongs in:

- expandable sections;
- comparison views;
- advanced tabs;
- hover/focus detail;
- analysis screens;
- Codex/reference pages.

---

# 13. Reflow and Large Text

At increased UI/text scale:

- panels grow/reflow;
- text wraps;
- lists scroll;
- buttons preserve usable targets;
- critical content remains visible;
- layout does not shrink text below the selected size.

ART assets must support flexible rather than fixed-caption compositions.

---

# 14. Safe Areas and Split Layouts

UI art must support:

- standard desktop displays;
- ultrawide where supported;
- reduced safe areas;
- controller focus;
- split-screen ownership zones where multiplayer authority requires them.

Critical warnings may not be pushed outside safe regions by cosmetic HUD customisation.

---

# 15. Focus, Hover and Selection

Focus states require unmistakable non-colour distinction.

A focused control should normally gain some combination of:

- outline;
- bracket;
- inset/raised state;
- pointer marker;
- size/weight change;
- subtle motion;
- label emphasis.

Hover-only information must have keyboard/controller equivalents.

---

# 16. Disabled, Locked and Unavailable States

These states are not interchangeable.

### Disabled
Temporarily not interactive.

### Locked
Not yet accessible by progression/permission/knowledge.

### Unavailable
Cannot currently be fulfilled for a stated reason.

The art treatment must preserve these distinctions and accompany them with reason text where required.

---

# 17. Notifications and Attention Budget

Notifications are tiered by consequence.

Visual priority should scale from:

- ambient acknowledgement;
- routine update;
- actionable notice;
- important warning;
- immediate danger/critical failure.

Routine systems must not continually steal focus from play.

---

# 18. Critical Warning Language

Critical warnings require:

- distinct shape/placement;
- concise action-oriented text;
- icon or pictogram;
- non-colour separation;
- appropriate motion without harmful flashing;
- paired audio/haptic channel where supported.

Warnings should say what happened and what the player can do, not only display an alarm symbol.

---

# 19. HUD Identity

The default HUD remains **minimal and contextual**.

Persistent presentation should use compact, familiar shapes and leave the centre/world view clear.

The HUD may expand for combat, building, automation, social interaction, trade, route planning, mounts, vehicles, vessels, swimming/diving, survival emergency and realm transition.

---

# 20. Health, Mana, Stamina and Needs

Each major resource/state family should have its own readable visual identity.

Repeated use of identical horizontal bars is discouraged when a clearer differentiated form exists.

However, stylisation cannot obscure exact state where the gameplay requires precision.

Numerical display remains configurable where Document 17 permits it.

---

# 21. Quickbar and Action Slots

Quickbar presentation must preserve:

- slot ownership;
- selected state;
- item/skill identity;
- stack/charge state;
- durability/cooldown where relevant;
- unavailable/blocked state;
- input binding.

Item and skill bars may share screen position when runtime UX specifies it, but their category state must remain immediately obvious.

---

# 22. Reticle and Interaction Feedback

The reticle is functional art.

It may indicate:

- valid target;
- invalid target;
- mining/interaction progress;
- range;
- combat context;
- placement context.

It must remain small enough not to obscure the target and cannot become the only source of interaction reason information.

---

# 23. Inventory Grid Language

Inventory art prioritises:

- item silhouette;
- stack readability;
- condition/durability;
- ownership/reservation;
- selected/focused state;
- category filtering;
- clear empty slots.

Background slot ornament remains low contrast so the asset image dominates.

---

# 24. Canonical Projection Rule

A carried block may look like an inventory item, but ART-08 must not imply a second gameplay identity.

Block inventory projections, held views, dropped views and icons remain presentation products of the canonical object/block identity defined upstream.

---

# 25. Item and Block Icons

Icon priorities are:

1. silhouette;
2. material family;
3. functional cue;
4. state/variant cue;
5. small detail.

Icons should remain identifiable at the smallest supported slot size.

They should normally use Forge-generated canonical capture rather than hand-painted reinterpretation when the 3D form itself is the identity.

---

# 26. Icon Capture Standard

Canonical object captures should standardise:

- camera angle;
- framing;
- scale occupancy;
- neutral/transparent background;
- lighting family;
- shadow/contact treatment;
- state selection;
- cropping margin.

Exceptions require a documented reason.

---

# 27. Pictogram Standard

Semantic pictograms are distinct from object thumbnails.

Pictograms should be:

- simple;
- geometric;
- scalable;
- recognisable without texture;
- meaningful in monochrome;
- consistent in stroke/fill weight.

Examples include health, danger, route, ownership, locked, damaged, fire, flooding, ward, trade and knowledge confidence.

---

# 28. Spell and Ability Icons

Spell/ability icons derive from **behaviour and mechanism**, not only school colour.

An icon should communicate useful distinctions such as:

- projectile vs field;
- protection vs attack;
- movement vs control;
- target/self/area;
- rune/ritual/summon/elemental mechanism.

School/tradition provides a secondary family accent.

---

# 29. Status, Injury and Condition Icons

Status icons require:

- distinct silhouette;
- duration/state support;
- stack/intensity support where semantically real;
- plain-language label;
- high-contrast variant;
- no ambiguous reuse across unrelated conditions.

Biological severity is supplied by the owning system, not inferred by the icon artist.

---

# 30. Recipe and Crafting Presentation

Recipe art should visually separate:

- required input;
- acceptable substitution;
- tool;
- station;
- environment;
- output;
- by-product;
- batch quantity;
- missing/blocked reason.

Material substitutions retain distinct material imagery rather than becoming one generic “wood” or “metal” token.

---

# 31. Comparison Presentation

Comparison views must resist the temptation to reduce complex systems to a single green/red score.

Visual grouping should preserve meaningful domains such as:

- combat;
- protection;
- movement;
- tool capability;
- magic;
- quality;
- condition;
- weight/bulk;
- provenance/knowledge.

---

# 32. Building and Blueprint Presentation

Building UI may use:

- ghost/preview geometry;
- footprint diagrams;
- orientation arrows;
- clearance overlays;
- route/access overlays;
- material counts;
- stage diagrams;
- blocker symbols.

Preview visuals must never imply that a placement is valid before the authoritative survey/validation says so.

---

# 33. Project and Settlement Presentation

Settlement/project screens should read as **living systems**, not spreadsheet skins.

Use:

- building/need/service pictograms;
- spatial diagrams;
- progress/stage hierarchy;
- residents/roles where useful;
- shortages/blockers;
- historical change;
- map linkage.

Avoid one opaque “settlement score”.

---

# 34. Automation and Logistics Presentation

Automation UI requires visual distinction for:

- inputs;
- outputs;
- energy;
- storage;
- throughput;
- direction;
- blockage;
- fault;
- reservation;
- destination.

Network overlays should align semantically with the physical ports and connection language established by ART-04.

---

# 35. Magic Network Presentation

Mana/rune/ward network interfaces should use the ART-06 effect language in simplified 2D form.

Network graphics must communicate:

- source;
- direction/flow where real;
- capacity/state where known;
- fault;
- ward/coverage relationship;
- unknown/estimated data.

Glowing lines alone are insufficient.

---

# 36. Economy and Trade Presentation

Trade/economy UI separates:

- known price;
- estimated price;
- stale price;
- local availability;
- ownership;
- contract state;
- taxes/fees where known;
- provenance where relevant.

ART-08 may visualise uncertainty but cannot turn the world into an omniscient global auction house.

---

# 37. Dialogue and Social Presentation

Dialogue UI prioritises:

- speaker identity;
- readable text/subtitles;
- choice clarity;
- interruption state;
- consequence/reason cues where legitimately known;
- accessibility controls.

Cultural decoration is secondary to speaker and text readability.

ART-08 does not visually mark recognised persons as tamable creatures or generic resources.

---

# 38. Quest, Journal and Chronicle Presentation

These three surfaces are related but visually distinct:

### Quest Journal
What the player is currently trying to accomplish.

### Knowledge/Codex
What the player knows about the world.

### Chronicle
What has happened and how the world has changed.

Their visual treatment should help the player understand the difference between task, knowledge and history.

---

# 39. Codex / Knowledge Architecture

The Codex is not an omniscient wiki.

Entries may contain explicitly separated channels for:

- direct observation;
- verified research;
- discovered mechanics;
- cultural lore;
- historical records;
- hypotheses;
- rumours;
- disputed claims;
- unknown information.

Visual treatment must preserve the epistemic status of each channel.

---

# 40. Codex Entry Composition

A mature entry may contain:

- canonical name known to player;
- image/portrait/capture;
- classification;
- observed traits;
- habitat/location knowledge;
- material/provenance data;
- discovered uses;
- relationships;
- history/lore;
- uncertainty/confidence;
- linked entries;
- map links;
- research progress.

Unknown fields remain unknown rather than silently omitted when the distinction matters.

---

# 41. Creature Codex Presentation

Creature entries must visually distinguish:

- observation;
- tracks/evidence;
- ecology;
- threat knowledge;
- cultural lore;
- research;
- tame/domestication knowledge where applicable;
- uncertainty.

An unobserved stat block is not automatically player-facing truth.

---

# 42. Material, Item and Recipe Knowledge Pages

Material/item pages should cross-link:

- source/provenance;
- derived forms;
- known processing;
- discovered recipes;
- compatible stations/tools;
- material-family identity;
- known locations;
- cultural/historical context where appropriate.

The page must preserve the canonical single-definition/projection model.

---

# 43. Diagram and Schematic Language

Diagrams use a shared visual grammar for:

- direction;
- input/output;
- dependency;
- containment;
- hierarchy;
- flow;
- uncertainty;
- optionality;
- failure/blockage;
- temporal sequence.

A diagram should remain interpretable in monochrome/high-contrast presentation.

---

# 44. Tutorials and Help Graphics

Tutorial images should show the actual current interface/control language rather than stylised fantasy illustrations that may become obsolete.

Where possible, tutorials use:

- live UI compositions;
- canonical asset captures;
- schematic callouts;
- control glyphs drawn from the active input family.

Generated help art must be versioned against the UI it depicts.

---

# 45. Main Menu Art Direction

The main menu should establish Leyforge through **world atmosphere and restrained identity**, not an overloaded button frame.

The shell should clearly separate:

- continuing/playing Ley Realms;
- world management/creation;
- settings/accessibility;
- Forge/developer creation entry where authorised;
- account/multiplayer surfaces where future systems require them.

The menu background may evolve or use world imagery, but text and focus remain reliable across every background state.

---

# 46. World Library Presentation

World cards must visually communicate identity and health without becoming dense technical diagnostics.

Possible visible channels include:

- world name;
- thumbnail/preview;
- last played;
- major profile/preset;
- save health;
- compatibility state;
- realm/world identity;
- selected player-facing metadata.

Recovery or incompatibility must remain visible rather than presenting a broken world as a fresh empty slot.

---

# 47. World-Creation Presentation

World creation uses progressive disclosure:

1. quick/default path;
2. experience preset;
3. simulation depth;
4. performance profile;
5. difficulty/consequence;
6. world-generation options;
7. accessibility;
8. advanced/expert configuration.

Art treatment must keep these categories visually separate so players understand that **simulation depth, graphics/performance, difficulty and accessibility are not the same slider**.

---

# 48. World-Setting Impact Language

Settings with significant consequences require visual treatment for:

- gameplay impact;
- performance impact;
- permanence/migration risk;
- multiplayer authority;
- compatibility;
- recommended range.

Warning art should support explanation, not replace it.

---

# 49. Settings and Accessibility Presentation

Settings screens prioritise:

- category hierarchy;
- clear current value;
- preview where safe;
- reset/default state;
- consequences;
- searchable discoverability where supported.

Accessibility settings should not be visually isolated as an afterthought; they are a first-class part of the product shell.

---

# 50. Cartography Core Principle

Leyforge cartography is a **knowledge representation system**, not merely a camera looking down at the terrain.

Map art must reflect:

- what is known;
- how it became known;
- how current it is;
- how precise it is;
- whose information it is;
- what remains uncertain.

---

# 51. Cartographic Progression

ART-08 establishes a three-tier presentation direction:

### Tier I — Field / Ordinary Map
A practical 2D map assembled from exploration, landmarks, routes, notes and basic cartographic knowledge.

### Tier II — Surveyed / Civilisational Cartography
Higher-confidence terrain, elevation, routes, infrastructure, coastlines, districts, political/trade/ecological layers and specialist annotations where knowledge and tools justify them.

### Tier III — Magical Relief / Volumetric Cartography
A high-tier cartographic presentation capable of showing stylised relief, vertical relationships and selected 3D/volumetric information derived from known/surveyed/magically sensed data.

This progression is a **presentation architecture**. The gameplay authority decides how the player unlocks, crafts, surveys, powers or learns each capability.

---

# 52. Ordinary Map Visual Language

The ordinary map should feel authored and useful rather than like a perfect satellite image.

It may use:

- simplified terrain fields;
- contour hints;
- hand/cartographer-like route strokes;
- landmark symbols;
- settlement marks;
- labelled regions;
- personal notes/pins;
- fog/blank/uncertain regions.

Its imperfections are epistemic, not random decorative distortion.

---

# 53. Surveyed Map Visual Language

Surveyed cartography can become more geometric and precise through:

- contour/elevation systems;
- measured route geometry;
- coastline precision;
- known infrastructure;
- district boundaries;
- depth/nautical information;
- measured hazards;
- dated observations;
- confidence layers.

Precision is earned by knowledge/tooling, not granted by UI quality settings.

---

# 54. Magical 3D / Relief Map Direction

Leyforge may support advanced cartography that visually reconstructs known space as a **stylised miniature relief or volumetric map**.

The intended identity is closer to a crafted magical model/terrain projection than a modern GIS globe.

It may show, when legitimately known:

- terrain relief;
- mountains/valleys;
- settlement massing;
- routes;
- coastlines;
- underground connections;
- realm/portal relationships;
- magical fields or ley features;
- selected vertical structures;
- maritime depth bands;
- tracked objectives/pins.

It must **not** reveal undiscovered caves, hidden enemies, secret resources, exact moving targets, political information, hazards or structures merely because a 3D renderer could display them.

---

# 55. Volumetric Map Interaction Art

Where a 3D map is used, presentation should support:

- rotate;
- tilt;
- zoom;
- layer filtering;
- vertical slicing where authorised;
- focus on selected landmark/route;
- pin/annotation placement;
- readable labels that recompose with camera angle;
- reset-to-orientation control.

ART-08 owns the visual interaction language; runtime controls remain under UI/engineering authority.

---

# 56. 3D Map Accessibility Fallback

Every critical function available through magical/volumetric cartography requires an equivalent readable 2D/list/route representation.

A player must not need spatial rotation skill, stereoscopic depth perception or complex 3D manipulation to access essential map information.

---

# 57. Map Layer Grammar

Supported map-layer visual families include:

- terrain;
- elevation;
- settlements;
- roads/routes;
- structures/sites;
- resources;
- ecology;
- politics/claims;
- trade/economy;
- quests;
- realm network;
- maritime;
- personal markers;
- hazard/environment;
- magical/ley information where known.

Each layer needs a distinct symbol/pattern grammar and a clear legend.

---

# 58. Unknown, Rumoured, Approximate and Stale Map Data

These states require distinct presentation.

### Unknown
No reliable player knowledge.

### Rumoured
A claim exists without verified position/state.

### Approximate
Location/state is known within a bounded uncertainty.

### Stale
Previously known information may no longer reflect the world.

Do not collapse all four into generic fog-of-war.

---

# 59. Map Confidence and Age

Where the simulation supplies confidence/age, ART-08 may encode it through:

- edge certainty;
- line solidity;
- fill pattern;
- annotation;
- timestamp/age label;
- confidence glyph.

Colour alone is insufficient.

---

# 60. Navigation Markers

Navigation symbols must distinguish:

- player;
- party member;
- known settlement;
- landmark;
- tracked objective;
- custom pin;
- route waypoint;
- hazard;
- vehicle/vessel;
- portal/realm anchor where known.

Markers cannot imply exact real-time tracking unless the owning system actually provides it.

---

# 61. Route Presentation

Routes should visually communicate where relevant:

- known path;
- estimated path;
- travel mode;
- accessibility/mobility suitability;
- hazards;
- confidence;
- blocked segment;
- cost/time estimate;
- realm/maritime transition.

Autotravel is never visually presented as teleportation unless it truly is fast travel.

---

# 62. Political Map Presentation

Political layers should distinguish:

- recognised control;
- disputed control;
- influence;
- treaty/access conditions;
- unknown claims;
- outdated claims.

Political identity cannot be reduced to colouring every tile with faction paint if boundaries are fuzzy or contested in the simulation.

---

# 63. Ecology and Resource Map Presentation

Ecology/resource maps may show:

- known habitat;
- observed abundance/trend;
- tracks/evidence;
- surveyed deposit zones;
- confidence;
- age.

They do not expose exact spawn tables or hidden resource nodes without authorised knowledge.

---

# 64. Maritime Cartography

Maritime maps may support:

- coastlines;
- ports;
- reefs/shoals;
- depth bands;
- currents;
- wind knowledge;
- hazards;
- routes;
- discovered islands;
- anchorages;
- realm/portal maritime links.

Nautical precision scales with instruments, surveying and knowledge supplied upstream.

---

# 65. Realm Network Presentation

Realm cartography uses a network/relationship presentation rather than pretending all realms occupy one ordinary geographic plane.

It may show:

- known realm nodes;
- discovered routes;
- anchors;
- stability;
- ownership/access;
- known return path;
- confidence;
- route state.

Each realm remains visually identifiable through ART-03 accents without sacrificing network readability.

---

# 66. Cultural and Realm UI Accents

Culture/realm may influence:

- frame motifs;
- patterns;
- icon decoration;
- map ornament;
- dividers;
- limited typography accents;
- material cues;
- animation/audio accents.

It may **not** alter the meaning of global semantic symbols, reduce contrast, or make equivalent controls behave/look unrelated across cultures.

---

# 67. Portraits and Entity Presentation

Portraits should derive from canonical entity assets where possible.

Presentation may use:

- head/shoulder capture;
- full-body dossier capture;
- silhouette icon;
- faction/culture frame accent;
- state overlays.

Portrait generation must preserve ancestry/person identity and cannot invent clothing, rank, scars or affiliations not supplied by authoritative state.

---

# 68. World and Asset Thumbnails

Thumbnails must be generated from canonical content using standard capture contracts.

Types include:

- world-card capture;
- structure preview;
- blueprint preview;
- entity portrait;
- block/item thumbnail;
- biome/realm reference;
- Forge asset browser preview.

Thumbnail composition is not evidence of gameplay state unless explicitly linked to a live capture.

---

# 69. Forge UI Relationship

ART-08 defines the **visual language** shared by The Forge, but 21E/22J remain authority for creator workflow and editor information architecture.

Forge presentation should prioritise:

- clarity;
- provenance;
- validation;
- editable-vs-inherited state;
- selected object/context;
- preview modes;
- diagnostics.

Developer-facing density may exceed player-facing density, but semantic tokens should remain related.

---

# 70. 2D Motion and Transition Language

UI motion should communicate:

- opening/closing;
- hierarchy change;
- selection;
- focus;
- success/failure;
- reordering;
- map zoom/layer transition;
- state change.

Motion is short, purposeful and interruptible.

Reduced-motion mode substitutes fades, snaps or other low-motion transitions while preserving state clarity.

---

# 71. 2D VFX Use

Particles/glows in UI are reserved for meaningful emphasis such as:

- magic activation;
- rare milestone;
- major success;
- realm transition;
- critical warning;
- newly discovered knowledge.

Routine clicks, every rarity tier and every list update do not require particle effects.

---

# 72. UI Audio Coordination

ART-07 owns sonic identity; ART-08 defines where visual state needs paired sound.

Important pairings include:

- focus/confirm/back;
- warning/critical;
- invalid action;
- inventory transfer;
- crafting completion;
- map pin/route confirmation;
- Codex discovery;
- world save/recovery status.

No UI action may depend on audio alone.

---

# 73. Localisation-Safe Art

2D assets should avoid baked text whenever the text is expected to localise.

Layouts must tolerate:

- longer labels;
- different word order;
- non-Latin scripts;
- different numeral formats;
- right-to-left support where required by product localisation scope.

Icons may support text but never substitute for localised labels where meaning is not universal.

---

# 74. Accessibility Art Requirements

Every production UI family must be checked for:

- text scaling;
- contrast;
- non-colour state distinction;
- reduced motion;
- reduced flash;
- readable focus;
- controller/keyboard navigation visibility;
- captions/subtitles where applicable;
- screen-reader-compatible semantic structure at implementation level;
- alternate 2D representation for essential 3D cartographic information.

---

# 75. Performance and Low-End UI Rules

Lower presentation profiles may simplify:

- blur;
- transparency;
- background animation;
- map relief detail;
- animated thumbnails;
- decorative VFX;
- live 3D previews.

They may not remove:

- critical status;
- focus;
- labels;
- reasons;
- map knowledge distinctions;
- interaction validity;
- accessibility cues.

---

# 76. Codex / Agent UI-Asset Production Sequence

For a UI/2D task, Codex should execute in this order:

1. identify the target surface and authoritative owner;
2. identify the player/developer audience;
3. retrieve the view-model/state semantics;
4. identify knowledge/permission filtering;
5. determine Glance, Inspect or Analyse depth;
6. inherit ART-01 global style;
7. inherit ART-02 material/palette rules where relevant;
8. inherit ART-03 realm/culture accents where relevant;
9. inherit ART-04 canonical model/capture source where relevant;
10. inherit ART-05 entity/portrait source where relevant;
11. inherit ART-06 effect language where relevant;
12. inherit ART-07 sonic pairing where relevant;
13. select semantic tokens;
14. define hierarchy/layout;
15. choose icon/pictogram/capture/diagram mode;
16. build non-colour state distinctions;
17. support focus/selection/disabled/locked/pending/error states;
18. support localisation/reflow;
19. support accessibility variants;
20. support low-end presentation variants;
21. validate knowledge leakage;
22. validate authoritative-state fidelity;
23. validate icon/silhouette readability at target size;
24. validate keyboard/controller focus visibility;
25. validate map confidence/unknown/stale treatment if applicable;
26. validate no baked localisable text in reusable art;
27. register/export source and runtime products through the Forge pipeline;
28. capture required golden/reference comparisons;
29. record provenance and deviations;
30. stop and escalate unresolved semantic conflicts rather than inventing truth.

---

# 77. STOP AND ESCALATE Conditions

Codex must stop and raise a production/governance issue when:

- the authoritative UI state is unknown or contradictory;
- the requested icon requires inventing a new gameplay category;
- the screen would reveal knowledge the player should not possess;
- a map request implies data with no authoritative knowledge source;
- a cultural/realm motif has no canonical basis and would become stereotype/invention;
- rarity/quality/condition/knowledge are being conflated;
- the design requires colour as the sole critical cue;
- the 3D map would expose hidden or unsurveyed information;
- a portrait would require inventing appearance/state;
- a diagram requires mechanics not yet defined;
- localisation cannot fit without changing information architecture;
- accessibility would remove a required semantic distinction;
- the requested visual conflicts with ART-01–07;
- a player-facing screen is being asked to surface developer-only stable IDs/debug truth without explicit dev mode authority.

---

# 78. ART-08 Golden Reference Programme

ART-10 should eventually certify at least the following ART-08 references:

1. minimal exploration HUD;
2. combat-expanded HUD;
3. accessibility/high-contrast HUD;
4. inventory with mixed blocks/items/equipment;
5. item comparison/tooltip state;
6. crafting recipe with substitution and blocker states;
7. building survey/placement screen;
8. automation network inspection;
9. magic/mana network inspection;
10. settlement dashboard;
11. main menu/product shell;
12. world library with healthy/damaged/incompatible worlds;
13. world creation — simple/default path;
14. world creation — advanced/full configuration;
15. settings/accessibility screen at large text scale;
16. ordinary field map;
17. surveyed cartographic map;
18. magical relief/3D map;
19. 3D-map accessible 2D equivalent;
20. political map with disputed/uncertain control;
21. ecology/resource map with confidence/age;
22. maritime chart;
23. realm-network map;
24. quest journal;
25. Codex creature entry with mixed knowledge certainty;
26. material/item/recipe knowledge entry;
27. chronicle/history page;
28. critical notification/warning family;
29. complete semantic icon/pictogram sheet;
30. Forge asset-browser/editor visual language reference.

---

# 79. ART-08 QA Checklist

A UI/2D asset family is not production-ready until reviewers can answer yes to the applicable questions:

- Is authoritative truth preserved?
- Is player knowledge preserved?
- Is the hierarchy obvious within a few seconds?
- Is the interface recognisably Leyforge without excessive decoration?
- Are global semantic tokens used consistently?
- Does it work without colour?
- Does it work at increased text/UI scale?
- Are focus and selection obvious?
- Are disabled, locked and unavailable distinct?
- Are icons readable at minimum target size?
- Are object thumbnails faithful to canonical assets?
- Are cultural/realm accents subordinate to clarity?
- Does the screen avoid developer leakage?
- Does the map distinguish unknown, rumoured, approximate and stale data?
- Does advanced/3D cartography avoid omniscience?
- Is an accessible equivalent available for essential 3D-map functions?
- Are localisation and reflow safe?
- Are critical states paired with non-audio/non-motion cues?
- Does low-end presentation retain required meaning?
- Is provenance recorded?

---

# 80. Lock-Candidate Decisions

The following decisions are proposed for owner lock with ART-08 v0.1:

**ART08-D01** — Leyforge UI is world-first: interface art supports the world rather than permanently dominating it.  
**ART08-D02** — Final UI identity combines modern clarity with restrained crafted-world, voxel-aware and contextual fantasy motifs.  
**ART08-D03** — Legibility, authoritative state, player knowledge, accessibility and localisation outrank ornament.  
**ART08-D04** — Glance, Inspect and Analyse are the three presentation-depth families.  
**ART08-D05** — Semantic states use shared global token families and never depend on colour alone.  
**ART08-D06** — Rarity, quality, condition and knowledge remain separate visual dimensions.  
**ART08-D07** — Essential UI text uses highly readable scalable typography; decorative type remains secondary.  
**ART08-D08** — Layouts must reflow for increased text/UI scale rather than shrinking requested text.  
**ART08-D09** — Focus, selection, disabled, locked and unavailable receive distinct non-colour visual treatments.  
**ART08-D10** — Notification prominence scales with consequence and respects an attention budget.  
**ART08-D11** — The default HUD remains minimal/contextual and expands by gameplay context.  
**ART08-D12** — Canonical object identity is preserved across inventory, held, dropped, placed and icon projections.  
**ART08-D13** — Object thumbnails prioritise silhouette, material, function and state, and prefer canonical Forge captures where appropriate.  
**ART08-D14** — Semantic pictograms remain simple, scalable and meaningful in monochrome.  
**ART08-D15** — Spell/ability icons communicate behaviour/mechanism before school colour.  
**ART08-D16** — Comparison UI does not collapse multidimensional systems into one opaque green/red score.  
**ART08-D17** — Building previews never imply authoritative placement validity before validation.  
**ART08-D18** — Settlement/project UI avoids a single opaque settlement score.  
**ART08-D19** — Automation/magic network graphics correspond to real ports, flow/state and known data.  
**ART08-D20** — The Codex is knowledge-filtered and separates observation, verified research, cultural lore, inference, rumour, dispute and unknown state.  
**ART08-D21** — Quest Journal, Codex/Knowledge and Chronicle/History remain visually and conceptually distinct.  
**ART08-D22** — Tutorials use current interface/canonical captures and are versioned against the UI they depict.  
**ART08-D23** — Main-menu art establishes Leyforge atmosphere while preserving reliable text/focus under every background.  
**ART08-D24** — World creation visually separates simulation depth, performance, difficulty/consequence, worldgen and accessibility.  
**ART08-D25** — Accessibility is a first-class product-shell category rather than hidden polish.  
**ART08-D26** — Cartography represents player/civilisation knowledge rather than unrestricted runtime truth.  
**ART08-D27** — Cartographic presentation supports Field/Ordinary, Surveyed/Civilisational and Magical Relief/Volumetric tiers.  
**ART08-D28** — Better cartographic tiers improve precision, dimensionality and presentation but do not grant omniscience.  
**ART08-D29** — The magical/advanced map may present known terrain and selected world information as stylised relief/3D/volumetric cartography.  
**ART08-D30** — Advanced/3D maps may never reveal undiscovered/unauthorised caves, enemies, resources, secrets, structures, politics or moving targets.  
**ART08-D31** — Essential 3D-map information always has an accessible 2D/list/route equivalent.  
**ART08-D32** — Map layers have explicit icon/pattern families and legends.  
**ART08-D33** — Unknown, rumoured, approximate and stale map knowledge remain visually distinct.  
**ART08-D34** — Confidence/age uses more than colour.  
**ART08-D35** — Political maps preserve disputed/fuzzy control where supplied rather than forcing crisp territorial paint.  
**ART08-D36** — Ecology/resource maps show only authorised observed/surveyed knowledge, not hidden spawn/deposit truth.  
**ART08-D37** — Maritime map precision scales with legitimate survey/instrument knowledge.  
**ART08-D38** — Realm cartography uses a network/relationship representation instead of forcing all realms onto one ordinary geographic plane.  
**ART08-D39** — Cultural/realm UI theming may accent presentation but cannot redefine global semantics or reduce readability.  
**ART08-D40** — Portraits and thumbnails derive from canonical assets/state and may not invent appearance, affiliation or damage.  
**ART08-D41** — Forge editor presentation inherits ART-08 visual language while 21E/22J retain workflow authority.  
**ART08-D42** — UI motion is short, purposeful, interruptible and has reduced-motion equivalents.  
**ART08-D43** — Reusable UI art avoids baked localisable text.  
**ART08-D44** — Low-end profiles may reduce decorative complexity but never remove required semantic information.  
**ART08-D45** — Codex follows the ART-08 production sequence and escalates missing semantics instead of inventing UI truth.  
**ART08-D46** — ART-10 will certify a dedicated UI/icon/cartography/Codex golden-reference suite before mass asset production.  

---

# 81. Downstream Handoff to ART-09

ART-08 completes the final major domain-specific art bible before the explicit Codex/The Forge execution contract.

ART-09 must convert ART-01 through ART-08 into one operational production workflow covering:

- authority lookup;
- asset/task classification;
- source gathering;
- inherited ART rule resolution;
- Forge authoring;
- model/material/animation/VFX/audio/UI product generation;
- variant handling;
- provenance;
- validation;
- approval/escalation;
- bake/export;
- registry integration;
- work logging;
- reproducibility;
- golden-reference comparison.

ART-09 must not weaken the STOP AND ESCALATE rules established by ART-01 through ART-08.

---

# 82. Final ART-08 Production Principle

> **Leyforge's interface should make a deep world understandable without making it feel like a database. Its icons should communicate before they decorate. Its maps should become more powerful as knowledge and civilisation advance without ever becoming omniscient. Its Codex should preserve uncertainty rather than pretending the player knows what the engine knows. And every 2D asset should be reproducible by Codex from canonical sources rather than artistically reinvented one screen at a time.**

---

## End of ART-08 v0.1

**Status:** PROPOSED ART-PRODUCTION BASELINE — OWNER LOCK PENDING  
**Next document:** ART-09 — Codex / The Forge Asset Production Execution Contract
