# LEYFORGE

## 17 — UI, UX, Accessibility, Menus, HUD, World Configuration and Player-Trust System

### World-First Interface, Read-Only View Models, Validated Commands, Progressive Disclosure, Main-Menu Architecture, World Creation, Simulation Depth, Performance Profiles, Settings, Accessibility, Knowledge-Aware Presentation and Trustworthy Recovery

**Version 1.0 — Reconciled Production Foundation Draft**  
**Date:** 8 August 2026  
**Production Status:** Active Foundation Reconciliation — Production Authority Draft  
**Supersedes:** `17_Fantasy_Voxel_Civilisation_Sandbox_UI_UX_System_v0_1` for active production direction  
**Primary Vision Authority:** Documents 00–02 v1.0  
**Registry / Physical Identity:** Documents 03–06 v1.0  
**People / Settlement Operation:** Document 07 v1.0  
**Automation:** Document 08 v1.0  
**Magic:** Document 09 v1.0  
**Creatures / Ecology:** Document 10 v1.0  
**World / Biomes / Worldgen:** Document 11 v1.0  
**Structures / Sites / Routes:** Document 12 v1.0  
**Civilisation / Politics / Law:** Document 13 v1.0  
**Realms / Realm Travel:** Document 14 v1.0  
**Quests / Events / Chronicle:** Document 15 v1.0  
**Combat / Guard / Tactical State:** Document 16 v1.0  
**Settlement Planning / Player Blueprints:** Document 19  
**Buildings / Facilities / Projects:** Document 20  
**Forge Authoring and Presentation:** Sets 21–23  
**Production Governance / Validation:** Set 25  
**Maritime UI Contracts:** Set 26O and specialist Set 26 systems  
**Economy View Models:** Set 27J and Set 27 owners  
**Dialogue / Social / Voice / Localisation:** Set 28, especially 28I  
**Biological View Models / Accessibility:** Set 29I  
**Movement / Camera / Route View Models:** Set 30, especially 30B / 30H / 30J  
**Technical Implementation:** Replacement Document 18  
**Engine Direction:** Godot + Summer Engine  
**Project Lead and Final Authority:** Ash

A production-scale player-interface and experience architecture for Leyforge in which deep simulation remains understandable without becoming a wall of permanent meters, hidden formulas, modal dashboards or misleading certainty. The interface reads authoritative world state through typed view models, submits player intent through validated commands, explains important outcomes through stable reason codes and preserves player trust during failure, uncertainty, saves, migrations and configuration changes.

> **UI/UX System Statement**
>
> **The interface is the interpretation and control layer between the player and Leyforge's living world. It may summarise, filter, explain, compare, preview and request actions; it may never become a second simulation that invents gameplay truth because a widget needs a number.**

> **World-First Rule**
>
> **Normal play remains visually open and contextual. Permanent HUD elements are reserved for information that repeatedly matters in the current context. Deeper information appears through inspection, overlays, maps, books, boards, panels, dashboards and expandable detail when the player asks for it.**

> **Read-Only View / Validated Command Rule**
>
> **UI reads immutable or read-only view models derived from authoritative systems. Player actions become commands submitted to the owning system. A button press, slider, animation, progress bar or optimistic preview is never itself a committed gameplay result.**

> **Reason-First Trust Rule**
>
> **When an action fails, becomes unsafe, is unavailable or changes because the world changed, the interface should explain what happened, why it happened when knowable, what remains safe, and what the player can do next. Stable reason codes support localisation, testing, support and diagnostics.**

> **Knowledge Is Not Truth Rule**
>
> **The runtime may know facts the player does not. UI displays only information justified by knowledge, permissions and discovery, with explicit confidence, age and uncertainty where applicable. Unknown is a valid and useful state.**

> **Configuration Separation Rule**
>
> **Simulation Depth, Performance Profile, Difficulty/Consequence and Accessibility are separate control layers. A lower graphics profile does not secretly simplify world truth. A simpler simulation profile is an explicit world rule. Accessibility presentation changes do not falsify authoritative state.**

> **Low-End Scalability Rule**
>
> **Leyforge must provide viable lower-end configurations through bounded simulation, LOD, update budgets, render scaling, presentation reduction and world-profile choices without silently deleting critical identities, ownership, resource conservation, history, quests, structures, settlements or player-created content.**

---

# Document Purpose

Document 17 defines how players:

- start Leyforge;
- choose between game and creation workflows;
- create and manage worlds;
- understand what a world setting changes;
- configure simulation depth;
- target lower-end hardware;
- configure difficulty;
- configure accessibility;
- control camera and inputs;
- understand survival;
- manage inventory;
- craft;
- build;
- automate;
- use magic;
- interact socially;
- inspect politics;
- trade;
- manage settlements;
- navigate;
- sail;
- fight;
- follow quests/events;
- use maps;
- enter realms;
- save/recover;
- play multiplayer/split-screen;
- diagnose failures;
- learn systems;
- customise information density.

The original v0.1 already established a strong UI philosophy:

- world-first presentation;
- adaptive HUD;
- progressive disclosure;
- consistent interaction grammar;
- knowledge-aware information;
- controller support;
- split-screen support;
- accessibility as architecture;
- localisation;
- full remapping;
- contextual tutorials;
- searchable histories;
- plain-language errors;
- recovery-first save UX;
- configurable notifications;
- world creation with modular settings;
- read-only UI over authoritative game systems.

Those foundations remain.

The production reconciliation adds the post-POC system interfaces and turns the old world-creation/settings concept into a full configuration architecture suitable for:

- simple worlds;
- deep simulation worlds;
- low-end machines;
- high-end machines;
- solo play;
- persistent multiplayer;
- split-screen;
- future content packs;
- realm play;
- maritime play;
- advanced economy;
- social simulation;
- biological survival;
- complex movement/transport;
- player and developer Forge workflows.

---

# 1. Locked UI/UX Identity

Document 17 owns the shared presentation and interaction architecture.

It owns:

- main-menu information architecture;
- world-browser UX;
- world-creation UX;
- world-settings UX;
- per-player settings UX;
- performance/scalability settings UX;
- accessibility settings UX;
- controls/remapping UX;
- HUD architecture;
- contextual HUD rules;
- screen/panel architecture;
- menu/focus architecture;
- common widget patterns;
- navigation patterns;
- controller focus;
- keyboard/mouse interaction grammar;
- split-screen UI-root behaviour;
- notification presentation;
- warning priority;
- confirmation/undo patterns;
- tooltip architecture;
- comparison architecture;
- inspect/pin/open-history patterns;
- overlays;
- map presentation framework;
- journal/chronicle presentation framework;
- Codex/help/tutorial presentation;
- read-only view-model envelope;
- command-request envelope at the UI boundary;
- reason-code presentation;
- freshness/confidence presentation;
- permission presentation;
- knowledge filtering presentation;
- accessibility primitives;
- captions/subtitles shared shell;
- screen-reader/narration-ready semantics;
- localisation-ready UI structures;
- safe-area and reflow rules;
- UI history/inbox;
- save/recovery presentation;
- content-pack/mod compatibility presentation;
- player-facing source/provenance inspection where appropriate;
- developer diagnostic UI separation;
- UI telemetry/testing hooks that do not mutate gameplay;
- UI performance budgets;
- UI validation.

---

# 2. Document 17 Does Not Own

Document 17 does not own:

- Health/Stamina/Fatigue/Hunger/Hydration — Set 29;
- Guard/Stability — Document 16;
- prices/contracts/taxes/markets — Set 27;
- Trust/Affection/Loyalty/dialogue outcome — Set 28;
- route accessibility/travel time/arrival — Set 30 / Set 26;
- world generation — Document 11;
- realm route truth — Document 14;
- structure completion — Document 12 / 19 / 20;
- inventory ownership — Documents 03–04;
- crafting transactions — Document 05;
- resource truth — Document 06;
- automation runtime — Document 08;
- magic runtime — Document 09;
- ecology/populations — Document 10;
- political state — Document 13;
- quest/event lifecycle — Document 15;
- combat damage — Document 16;
- vessel physics/flooding — Set 26;
- multiplayer server authority — technical/multiplayer owner;
- Forge gameplay authoring rules — Sets 21–23;
- exact performance implementation — Document 18.

UI may combine several owners into one player-facing panel.

It must preserve provenance.

---

# 3. Core UI Promise

The interface should answer five questions quickly:

1. **What is happening?**
2. **Why is it happening?**
3. **What can I do?**
4. **What is uncertain or unknown?**
5. **What will this action change if I commit it?**

Advanced players may then ask:

6. **Where did this value come from?**
7. **What changed over time?**
8. **Which dependency is blocking this?**
9. **Which system owns the result?**
10. **What setting or permission controls it?**

---

# 4. Interface Depth Model

Use three main depths.

## 4.1 Glance

Immediate decision support.

Examples:

- Health critical;
- interact;
- ammo low;
- gate locked;
- breath low;
- machine blocked;
- route unsafe.

## 4.2 Inspect

Contextual detail.

Examples:

- injury;
- item comparison;
- machine inputs;
- price reason;
- route ETA/confidence;
- vessel breach location.

## 4.3 Analyse

Deep optional detail.

Examples:

- settlement needs;
- production graph;
- economic trends;
- route alternatives;
- faction treaties;
- dependency graph;
- audit/history;
- simulation diagnostics.

Normal play should not require Analyse depth constantly.

---

# 5. Information Ownership

Every significant displayed field should be traceable to:

- owner system;
- source record;
- view-model revision;
- observation time;
- knowledge state;
- permission state.

This traceability can be hidden from ordinary presentation.

---

# 6. View-Model Architecture

A view model is a read-only player-facing projection.

It may aggregate several systems.

It does not become a new gameplay record.

---

# 7. Common View-Model Envelope

```yaml
ui_view_model:
  view_id: <qualified_id>
  subject_refs: []
  viewer_ref: <player_or_client>
  world_ref: <id>
  realm_ref: <id>?

  knowledge:
    state: <known|estimated|rumoured|stale|unknown|hidden>
    confidence_band: <band>?
    as_of_world_time: <time>?
    source_refs: []

  permissions:
    allowed_actions: []
    blocked_actions: []
    authority_ref: <id>?

  presentation:
    summary_tokens: []
    primary_metrics: []
    secondary_metrics: []
    status_tokens: []
    warning_refs: []
    reason_codes: []
    corrective_action_refs: []

  history_refs: []
  source_revision_refs: []
  view_revision: <rev>
```

---

# 8. View Models Are Knowledge-Filtered

A market view may know server-side:

- exact remote stock;
- exact incoming caravan;
- exact seller reserve.

The player's view may show:

- reported stock;
- estimated supply;
- stale price;
- unknown arrival.

No debug leakage.

---

# 9. Freshness

Information may be:

- live;
- recent;
- dated;
- stale;
- historical;
- predicted.

Display age where it matters.

---

# 10. Confidence

Use qualitative confidence by default:

- confirmed;
- high confidence;
- moderate;
- uncertain;
- rumoured;
- unknown.

Exact probabilities are shown only when intentionally available.

---

# 11. Reason Codes

Every important blocked/failed action should return stable reason codes.

The UI converts them to:

- short reason;
- expanded reason;
- corrective suggestions;
- technical detail when authorised.

---

# 12. Reason Example

```text
Cannot commission vessel:
Two below-waterline openings are not watertight.

Fix:
Close or seal the highlighted openings, then validate again.

Code:
VESSEL_COMMISSION_WATERTIGHT_FAILURE
```

The code is not normally the headline.

---

# 13. Corrective Actions

Where possible, an error may expose safe actions:

- open required screen;
- focus object;
- pin resource;
- choose alternate route;
- request permission;
- inspect missing item;
- repair;
- wait.

UI suggestions do not bypass validation.

---

# 14. UI Command Boundary

UI issues intent commands.

Examples:

- transfer item;
- accept contract;
- start project;
- set destination;
- change helm input;
- equip item;
- cast spell;
- accept quest;
- sleep;
- start treatment;
- claim structure.

The owning system validates and commits.

---

# 15. Optimistic Presentation

Safe optimistic response may include:

- button feedback;
- pending spinner;
- local slider preview;
- predicted movement HUD;
- reserved transfer highlight.

Persistent truth appears only after authoritative response.

---

# 16. Pending State

UI distinguishes:

- requested;
- reserved;
- committing;
- committed;
- rejected;
- rolled back.

Never show permanent success before commit.

---

# 17. Player Trust as a System Requirement

Trust is damaged when UI:

- says saved when save failed;
- says delivered when item did not transfer;
- says route is safe when data is stale;
- says building works when service is offline;
- hides a destructive setting consequence;
- silently resets world state;
- consumes resources without showing why;
- shows a fake price unrelated to transaction.

Production validation treats these as UX defects, not cosmetic issues.

---

# 18. Visual Direction

Visual presentation may combine:

- clean modern readability;
- parchment;
- carved timber/stone;
- metal fittings;
- subtle runes;
- cultural motifs;
- realm accents.

Legibility wins over ornament.

---

# 19. Semantic Style Tokens

Common tokens include:

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
- damaged;
- corrupted;
- protected;
- estimated;
- stale.

Never rely on colour alone.

---

# 20. Rarity, Quality, Condition and Knowledge

These are different dimensions.

UI must not use one colour to imply all of them.

Example:

- rarity: unusual provenance;
- quality: craftsmanship;
- condition: physical state;
- knowledge: how well identified.

---

# 21. Cultural and Realm Themes

Cultural/realm accents can modify:

- frames;
- patterns;
- icon motifs;
- typography accents;
- audio.

They cannot reduce readability or hide status.

---

# 22. Iconography

Icons require:

- consistent semantic meaning;
- tooltip/label;
- scalable version;
- high-contrast state;
- non-colour alternative.

---

# 23. Typography

Requirements:

- scalable text;
- reflow;
- line-spacing options;
- readable fonts;
- subtitle-specific controls;
- no tiny essential footnotes;
- no image-only text.

---

# 24. Screen Reflow

Large text must:

- reflow vertically;
- preserve buttons;
- avoid clipping;
- avoid shrinking below requested size.

---

# 25. Main Product Shell

The top-level Leyforge shell separates:

- **Game Runtime**
- **Creation / Forge**
- **World and Content Management**
- **Settings / Accessibility**
- **Help / Support / Credits**

Working branding may present the game runtime and creation suite under separate names without coupling gameplay IDs to branding.

---

# 26. Main-Menu Overhaul

The production main menu should feel like a world library and project hub rather than a list of generic buttons.

Recommended top-level:

- Continue
- Worlds
- New World
- Multiplayer
- Forge
- Content Packs / Mods
- Settings
- Accessibility
- Help
- Credits / Exit

The exact order may adapt to platform.

---

# 27. Continue

Continue shows:

- exact world;
- character;
- location/realm;
- last played;
- save health;
- content-pack status;
- multiplayer availability.

It never hides a compatibility warning.

---

# 28. World Library

Worlds are first-class records.

World Library supports:

- search;
- sort;
- favourites;
- tags;
- local/server filter;
- compatible/incompatible filter;
- backup status;
- duplicate;
- export;
- archive;
- delete with confirmation.

---

# 29. World Card

Recommended fields:

- screenshot;
- world name;
- seed display optional;
- last played;
- playtime;
- active character;
- current settlement/region/realm;
- world profile;
- simulation-depth profile;
- difficulty profile;
- active content packs;
- multiplayer mode;
- backup health;
- version/migration status;
- recent important world event.

---

# 30. World Card Performance Hint

If a world used a more demanding simulation profile than current hardware recommendation, show:

- current target profile;
- estimated risk;
- safe options.

Do not silently downgrade it.

---

# 31. World Detail Screen

Provides:

- save slots/backups;
- world rules;
- simulation settings;
- installed packs;
- player list;
- history summary;
- settlements;
- realm availability;
- compatibility;
- diagnostics/recovery.

---

# 32. Recovery Centre

A dedicated recovery flow handles:

- failed save;
- corrupted save;
- incompatible schema;
- missing pack;
- invalid migration;
- server interruption.

It preserves original data before repair.

---

# 33. Recovery Options

Possible:

- retry load;
- safe mode;
- restore backup;
- disable optional pack after dependency scan;
- run migration;
- open diagnostic report;
- duplicate save before repair;
- cancel.

---

# 34. No Destructive Auto-Fix

Recovery must not silently:

- delete structures;
- remove inventory;
- reset quests;
- regenerate explored world;
- drop unknown components.

---

# 35. New World Philosophy

New World supports:

- quick start;
- guided setup;
- expert configuration.

A first-time player should not need to understand 100 sliders.

An expert should not be locked out of them.

---

# 36. World Creation Flow

Recommended flow:

1. Identity
2. World Generation
3. Experience Preset
4. Simulation Depth
5. Gameplay & Consequence
6. System-Specific Rules
7. Content Packs
8. Multiplayer
9. Accessibility Profile
10. Performance Target
11. Review
12. Generate

---

# 37. Quick Start

Quick Start asks only a few high-value questions:

- intended playstyle;
- simulation depth;
- difficulty;
- multiplayer;
- hardware target.

Everything else uses transparent defaults.

---

# 38. Experience Presets

Possible experience presets:

- Balanced Sandbox
- Cosy Builder
- Explorer
- Civilisation Builder
- Automation Engineer
- Survival Frontier
- Adventurer
- Custom

These are bundles, not hidden difficulties.

---

# 39. Preset Transparency

Selecting a preset shows:

- which settings change;
- why;
- which remain independent.

Player can customise afterward.

---

# 40. Simulation Depth Is Separate

Simulation Depth controls **how richly the living world itself is modelled**.

It is not:

- graphics quality;
- enemy difficulty;
- accessibility;
- render distance.

---

# 41. Simulation Depth Profiles

Recommended names:

- **Simple**
- **Standard**
- **Deep**
- **Full**
- **Custom**

Names may change during user testing.

---

# 42. Simple Simulation

Purpose:

- lower CPU/memory burden;
- easier-to-understand macro world;
- fewer background interactions.

Possible design changes:

- more cohort-level distant NPC simulation;
- fewer independently simulated minor businesses;
- simpler market regionalisation;
- fewer minor factions;
- less frequent minor political events;
- reduced ecology relationship breadth;
- fewer concurrent ambient event chains;
- broader distant biological summaries;
- fewer individually promoted background actors;
- lower background settlement activity density.

Important named/player-relevant identities remain protected.

---

# 43. Standard Simulation

Balanced production default.

Supports:

- persistent settlements;
- regional markets;
- meaningful ecology;
- faction politics;
- biological consequences;
- background events;
- distant travel;
- realm state

at moderate granularity.

---

# 44. Deep Simulation

Increases:

- named/persistent actor coverage;
- household/business detail;
- market locality;
- ecological relationship depth;
- faction decision cadence;
- event interactions;
- settlement autonomy;
- distant route/logistics detail.

---

# 45. Full Simulation

Maximum supported production detail.

May increase:

- individual actor retention;
- settlement count actively scheduled;
- market nodes;
- ecological cohorts;
- concurrent strategic actors;
- event/history detail;
- cross-realm background activity.

UI clearly marks hardware cost.

---

# 46. Custom Simulation

Advanced users can tune domains separately.

Possible domains:

- NPC/household detail;
- settlement autonomy;
- economy detail;
- ecology detail;
- faction/political detail;
- social background detail;
- biological NPC detail;
- automation background detail;
- transport/logistics detail;
- maritime background detail;
- realm background activity;
- event density;
- history retention/detail.

---

# 47. Simulation Depth Changes Gameplay

Because Simulation Depth is an explicit world rule, changing it may alter:

- how many independent causal actors exist;
- how finely systems interact;
- how often minor events occur;
- how much historical detail is retained.

The UI must say this clearly.

---

# 48. Simulation Depth Is Not a Hidden Performance Slider

Do not automatically switch a world from Full to Simple because frame rate drops.

Offer:

- Performance Profile change;
- reduced local presentation;
- lower LOD promotion budget;
- restart recommendation.

Changing Simulation Depth requires explicit player/host approval.

---

# 49. Changing Simulation Depth After Creation

Possible policies:

- safe decrease through deterministic aggregation;
- safe increase where missing detail can be generated from preserved summary/history;
- restricted increase where detail was never stored;
- new-region-only increase;
- restart/new world required for certain settings.

UI explains the migration class.

---

# 50. Simulation Migration Warning

Example:

> **Changing Economy Detail from Simple to Deep**
>
> Existing regional price and stock history is preserved. New individual businesses may be created from current settlement/economic summaries. Earlier unsimulated business-level history cannot be reconstructed.
>
> Create a backup before applying.

---

# 51. Performance Profile Is Separate

Performance Profile controls how expensive the same world is to present and update locally.

It should preserve authoritative world truth where possible.

---

# 52. Performance Presets

Possible:

- Auto
- Low-End
- Balanced
- High
- Ultra
- Custom

---

# 53. Auto Hardware Recommendation

An optional benchmark may recommend:

- render profile;
- LOD presentation;
- simulation update budgets that preserve rules;
- memory target;
- split-screen limits.

Recommendation is not compulsory.

---

# 54. Low-End Performance Profile

May reduce:

- render distance;
- shadow distance;
- shadow quality;
- volumetrics;
- particles;
- water effects;
- animation LOD;
- visible ambient creatures;
- visible crowd density;
- high-detail nearby simulation radius;
- UI animation;
- expensive overlays;
- reflection quality;
- foliage density;
- decorative objects;
- audio emitter density.

It cannot silently:

- remove a settlement;
- refill a deposit;
- change a market result;
- heal a named NPC;
- reset a quest;
- remove a boss;
- change ownership.

---

# 55. Simulation Work Budgets

Performance settings may adjust **when** non-urgent work is processed without changing the rules.

Examples:

- lower background tick budget per frame;
- spread graph rebuilds;
- schedule distant summaries less often while preserving elapsed-time integration;
- cap simultaneous promoted actors;
- use cohort representation earlier.

---

# 56. Deterministic Catch-Up

If a performance profile schedules work less frequently, elapsed-time resolution must still reconcile correctly.

Lower tick frequency cannot mean free resources.

---

# 57. World Size

Worldgen settings may include:

- world/continent scale;
- region count;
- ocean proportion;
- vertical depth;
- realm pack availability.

Exact implementation remains Document 11-owned.

---

# 58. Generation Settings

World creation can expose:

- seed;
- world scale;
- terrain drama;
- biome diversity;
- climate extremes;
- ocean/island prevalence;
- cave density;
- structure/site density;
- settlement density;
- resource abundance bands;
- realm discoverability profile.

UI describes consequences, not raw noise parameters by default.

---

# 59. Expert Worldgen

Advanced panel may expose deeper generation values when stable.

Developer-only raw generator internals remain separate.

---

# 60. Generation-Locked Settings

Some settings are creation-only or new-region-only.

Examples may include:

- seed;
- base topology;
- world scale;
- certain content-pack generation rules.

UI marks:

- Creation Only
- New Regions Only
- Change Anytime
- Migration Required
- Server/Host Only

---

# 61. Difficulty & Consequence

Difficulty controls challenge/severity.

It remains separate from simulation depth.

---

# 62. Difficulty Profiles

Possible:

- Peaceful
- Relaxed
- Standard
- Harsh
- Custom

Named presets may coexist with thematic presets.

---

# 63. Difficulty Domains

Potential:

- combat damage;
- enemy coordination;
- survival drain;
- biological injury severity;
- disease/toxin severity;
- death/downed rules;
- structure damage;
- raid/threat pressure;
- resource scarcity;
- economy pressure;
- event severity;
- magic risk;
- realm hazard;
- recovery generosity;
- guidance.

---

# 64. Accessibility Versus Difficulty

Accessibility can change:

- input burden;
- presentation;
- timing assistance;
- visual effects;
- information clarity.

Mechanical assists may alter gameplay where explicitly allowed.

Accessibility should not be treated as a lesser difficulty or reduce rewards by default.

---

# 65. Gameplay Assistance

Separate assist category may include:

- aim assist;
- lock-on;
- expanded parry windows;
- automatic ledge guard;
- route assistance;
- auto-surface;
- simplified sailing controls;
- construction snapping;
- reduced rapid input;
- auto-run;
- hold/toggle.

---

# 66. Consequence Settings

High-impact world rules should be explicit:

- NPC permanent death;
- player death recovery;
- structure destruction;
- settlement abandonment;
- realm collapse severity;
- global extinction rules;
- irreversible political outcomes;
- offline progression.

---

# 67. Consequence Warning

Example:

> **Permanent Named-NPC Death: Enabled**
>
> Important NPCs may die permanently from valid world events and combat. Quests and relationships adapt instead of respawning them.

---

# 68. Offline Progression

World creation distinguishes:

- local game closed;
- local host running;
- dedicated server running;
- disconnected player.

UI must not imply the world is progressing when it is not.

---

# 69. Local Offline Safety

Application-closed wall time does not automatically advance dangerous biological state unless explicitly designed.

---

# 70. Dedicated Server Progression

Persistent server settings show:

- whether world runs without players;
- whether settlements progress;
- whether events progress;
- offline-player presence policy;
- maximum catch-up/absence rules.

---

# 71. System-Specific World Settings

World creation can expose expandable categories for:

- Survival & Biology
- Combat & Threat
- Civilisation
- Economy
- Social
- Ecology
- Automation
- Magic
- Realms
- Maritime
- Events & History
- Transport
- Building
- Progression

---

# 72. Dependency-Aware Settings

If one setting requires another:

- explain dependency;
- auto-select only with consent;
- show impact.

Example:

“Full regional market simulation requires at least Standard settlement autonomy.”

---

# 73. Invalid Setting Combination

The review screen blocks combinations that would break production guarantees.

Example:

- required realm progression enabled;
- every realm route disabled.

---

# 74. World-Profile Summary

Before generation show a plain-language summary:

- World: Large archipelago
- Simulation: Deep
- Difficulty: Relaxed
- Survival: Moderate
- NPC permanence: On
- Economy: Regional
- Ecology: Deep
- Realms: Standard
- Multiplayer: 4-player host
- Hardware target: Low-End recommended changes pending

---

# 75. Estimated Performance Impact

Show relative bands:

- CPU
- GPU
- Memory
- Storage
- Network

Use:

- Low
- Moderate
- High
- Very High

until measured hardware numbers exist.

---

# 76. Performance Estimate Is Not a Promise

Phrase as:

- Estimated
- Recommended
- Measured on profile X

not guaranteed FPS.

---

# 77. Content Packs During World Creation

Players choose:

- Core;
- installed approved packs;
- optional realm packs;
- Forge content;
- mods.

UI performs dependency validation.

---

# 78. Pack Compatibility

Display:

- required;
- optional;
- missing;
- incompatible;
- update available;
- migration required.

---

# 79. Removing a Pack

Before removal show:

- structures using it;
- items;
- creatures;
- quests;
- realms;
- player builds;
- dependency count.

No silent deletion.

---

# 80. Forge Content Admission

Player-authored content may enter a world only after required validation.

UI displays:

- Valid
- Warning
- Experimental
- Missing Dependency
- Quarantined

---

# 81. Working Product-Shell Separation

The interface may present:

- game/play workflows;
- authoring/Forge workflows

as distinct top-level experiences.

The branding label can change without changing saved gameplay IDs.

---

# 82. Forge Entry

Forge hub may expose:

- Blocks
- Items
- Recipes
- Creatures
- Structures / Blueprints
- Vessels
- Presentation
- Content Packs
- Validation
- Test worlds

according to installed tools.

Document 17 owns shell/navigation only.

---

# 83. Developer Tools Separation

Player Forge and developer diagnostic tools are not the same thing.

Developer-only tools may expose:

- hidden IDs;
- full source provenance;
- simulation truth;
- registry errors;
- server authority;
- raw graphs.

Normal players do not gain hidden knowledge through developer screens.

---

# 84. Core HUD

Default HUD remains minimal.

Typical persistent/contextual elements:

- interaction reticle;
- Health when relevant/configured;
- Stamina when changing/relevant;
- quickbar;
- selected item/tool;
- current interaction;
- major objective;
- critical warnings.

---

# 85. Contextual HUD States

HUD expands for:

- combat;
- injury;
- survival emergency;
- building;
- automation;
- social dialogue;
- trade;
- project management;
- route planning;
- mount;
- vehicle;
- swimming/diving;
- helm/vessel;
- realm transition.

---

# 86. HUD Presets

Possible:

- Minimal
- Contextual
- Detailed
- Builder
- Combat
- Accessibility
- Custom

---

# 87. HUD Customisation

Per-player options:

- scale;
- opacity;
- anchors;
- visibility;
- bar style;
- numbers;
- text;
- reticle;
- tracker;
- minimap;
- status feed;
- notification location;
- captions.

---

# 88. HUD Safety

Custom layout cannot move critical warnings entirely outside safe area.

Allow reset.

---

# 89. Health Presentation

Set 29 owns Health.

UI supports:

- bar;
- number optional;
- condition band;
- vignette optional;
- audio/haptic optional.

---

# 90. Stamina Presentation

Set 29 owns Stamina.

It may:

- appear during exertion;
- fade when full;
- remain persistent if player chooses.

---

# 91. Needs Presentation

Hunger/Hydration/Fatigue need not be permanent bars.

Use:

- contextual state;
- trend;
- warning;
- inspectable status.

---

# 92. Injury Presentation

Set 29I view model provides:

- known injury;
- location;
- severity;
- functional impairment;
- treatment state.

No hidden diagnosis leakage.

---

# 93. Disease / Poison Presentation

Use:

- symptoms;
- suspected category;
- diagnosed identity;
- confidence.

Do not reveal unknown exact toxin automatically.

---

# 94. Guard/Stability

Combat owns Guard/Stability.

UI presents it only when relevant/configured.

---

# 95. Tactical Conditions

Combat tactical conditions use:

- icon;
- text/caption;
- duration/phase where known.

---

# 96. Movement HUD

Set 30 can expose:

- posture;
- movement mode;
- blocked reason;
- climbing state;
- mount/vehicle state;
- route.

Avoid permanent speedometer on foot unless requested.

---

# 97. Camera Settings

Document 17 presents:

- first-person FOV;
- third-person FOV;
- sensitivity;
- invert axes;
- camera bob;
- sprint FOV shift;
- shake;
- hit stop;
- motion blur;
- camera smoothing;
- third-person collision response;
- auto-centre;
- shoulder side.

---

# 98. First / Third Person

Players can switch where gameplay allows.

Both use same authoritative movement.

UI never implies they are different character modes.

---

# 99. Controls

Support:

- keyboard/mouse;
- controller;
- split-screen controllers;
- future compatible devices.

---

# 100. Full Remapping

Every gameplay-critical action should be remappable where platform permits.

---

# 101. Conflict Detection

Binding UI detects:

- duplicate binding;
- inaccessible chord;
- context conflict.

Player can intentionally override with warning.

---

# 102. Hold / Toggle

Independent options may include:

- sprint;
- crouch;
- aim;
- interaction;
- helm focus;
- swim;
- map mode;
- lock-on.

---

# 103. Input Timing

Accessibility may adjust:

- hold duration;
- double-tap window;
- repeated press;
- parry timing where supported;
- interaction timeout.

---

# 104. Controller Focus

Rules:

- predictable order;
- no focus traps;
- restore safe focus after rejection;
- clear focused state;
- analogue scrolling.

---

# 105. Mouse and Controller Parity

No critical action should require mouse hover.

---

# 106. Split-Screen Focus

Each local player owns:

- UI root;
- focus stack;
- cursor;
- controller context;
- accessibility;
- HUD.

One player's menu cannot steal another's gameplay input.

---

# 107. Inventory UX

Inventory displays canonical:

- Items;
- Block Inventory Projections;
- containers;
- ownership.

A recoverable Block is not shown as a fake duplicate Item.

---

# 108. Block Inventory Projection Presentation

UI may visually treat a carried Block like an inventory stack.

Inspection still points to the canonical Block definition.

---

# 109. Inventory Actions

Common:

- inspect;
- equip;
- use;
- split;
- merge;
- transfer;
- pin;
- favourite;
- sort;
- filter;
- drop;
- compare.

---

# 110. Inventory Permissions

If an action is blocked:

- ownership;
- reservation;
- contract;
- quest protection;
- permission

reason appears.

---

# 111. Item Tooltip

May show:

- name;
- type;
- quality;
- condition;
- mass/bulk;
- relevant properties;
- ownership;
- provenance;
- known uses;
- price knowledge;
- enchantment;
- restrictions.

---

# 112. Tooltip Knowledge

Unknown properties remain:

- Unknown
- Unidentified
- Suspected

rather than secretly revealed.

---

# 113. Comparison

Comparison separates:

- combat;
- biological protection;
- movement;
- tool;
- magic;
- quality;
- condition.

Avoid one opaque green-arrow score.

---

# 114. Crafting UX

Document 05 supplies recipe state.

UI shows:

- inputs;
- outputs;
- substitutions;
- station;
- tools;
- environment;
- knowledge;
- reservation;
- batch;
- by-products.

---

# 115. Recipe Failure

Show exact blocker:

- material;
- station;
- power;
- tool;
- knowledge;
- permission;
- capacity.

---

# 116. Substitution UX

Typed substitutions show:

- accepted alternatives;
- differences;
- availability.

Do not imply all wood/material is interchangeable.

---

# 117. Craft Queue

Queue state distinguishes:

- planned;
- reserved;
- running;
- blocked;
- completed.

---

# 118. Building UX

Direct building supports:

- ghost preview;
- snap;
- rotation;
- shape;
- material role;
- validity;
- ownership;
- cost;
- undo.

---

# 119. Placement Reasons

Examples:

- overlaps protected anchor;
- unsupported;
- outside claim;
- route clearance blocked;
- water conflict;
- missing permission.

---

# 120. Blueprint UX

Blueprint screen shows:

- source;
- stages;
- exact resources;
- substitutions;
- labour;
- access;
- dependencies;
- function targets.

---

# 121. Project UX

Documents 19/20 supply:

- stage;
- reservation;
- labour;
- commissioning;
- blockers.

UI does not simulate construction progress itself.

---

# 122. Structure Inspection

May show:

- owner;
- occupier;
- condition;
- services;
- damage;
- history;
- repair;
- route relevance.

Knowledge/permissions apply.

---

# 123. Restoration UX

Show:

- same structure identity;
- damage;
- required work;
- alternative conversion;
- historical significance.

---

# 124. Automation UX

Normal interaction prioritises:

- running/stopped;
- input;
- output;
- power;
- immediate blocker.

---

# 125. Automation Deep Inspection

Optional:

- network graph;
- throughput;
- buffers;
- reservations;
- route;
- priority;
- history.

---

# 126. Machine Reason Example

> Furnace stopped: output storage is full.

Direct actions:

- Open output
- Inspect route
- Add overflow
- Pause machine

---

# 127. Logistics Overlay

Can display:

- item flow;
- blocked node;
- direction;
- throughput band;
- storage;
- reservations.

Patterns/labels supplement colour.

---

# 128. Storage UX

Storage can show:

- capacity;
- reserved stock;
- protected stock;
- ownership;
- filter;
- logistics links.

---

# 129. Magic UX

Document 09 supplies:

- mana;
- spell;
- ritual;
- ward;
- network.

UI progressively reveals magical complexity.

---

# 130. Spell HUD

May show:

- selected spell;
- mana/cost;
- targeting;
- cooldown/condition;
- invalid reason.

---

# 131. Ritual UX

Ritual panels show:

- participants;
- anchors;
- requirements;
- risks;
- stage;
- consequences.

Rare/irreversible rituals require explicit confirmation.

---

# 132. Mana Network Overlay

Shows known:

- source;
- conduit;
- buffer;
- consumer;
- purity/stability;
- fault.

Automation and Magic ownership remain separate.

---

# 133. Progression UX

Document 02 supplies:

- skills;
- perks;
- knowledge;
- research.

UI avoids traditional class-screen implication.

---

# 134. Skill View

Show:

- current mastery;
- recent use;
- unlocks;
- related systems;
- next opportunities.

---

# 135. Perk View

Supports:

- tree/graph;
- search;
- prerequisites;
- respec;
- preview;
- compare.

---

# 136. Knowledge / Research

Distinguish:

- hinted;
- observed;
- researched;
- mastered.

---

# 137. Social Presentation

Set 28I's conversation presentation is adopted as the specialist contract.

Document 17 provides shared:

- layout;
- focus;
- typography;
- accessibility;
- common buttons;
- history shell.

---

# 138. Conversation Modes

Support:

- context interaction;
- standard conversation;
- negotiation;
- investigation/testimony;
- companion;
- group;
- council/trial/diplomacy;
- ambient bark;
- story focus.

---

# 139. Speaker Identity

Only display known identity.

Possible:

- Unknown Traveller
- Village Guard
- Mara
- Mara — Blacksmith
- Envoy Sereth of the Glass Court

---

# 140. Social Choices

Choice label describes intent, not guaranteed outcome.

---

# 141. Social Requirement Examples

- [15 silver]
- [Requires interpreter]
- [Evidence available]
- [Not authorised]
- [Companion recovering]

---

# 142. Social Probability

Prefer qualitative uncertainty over exact success percentage unless intentionally exposed.

---

# 143. Dialogue Does Not Always Pause

World-critical warnings override decorative dialogue framing.

---

# 144. Dialogue Interruption

Show:

- suspended;
- invalidated;
- resumable;
- timed.

No invisible timeout.

---

# 145. Dialogue Transcript

Searchable history may store:

- important lines;
- agreements;
- evidence;
- summaries.

Ambient chatter is not retained indefinitely by default.

---

# 146. Voice

Set 28I owns voice presentation policy.

Text-first equality remains required.

---

# 147. Subtitles

Controls include:

- size;
- background;
- speaker label;
- direction;
- distance;
- urgency;
- reading speed;
- auto-advance;
- simultaneous lines.

---

# 148. Closed Captions

Support non-speech critical cues:

- alarm;
- creature call;
- knock;
- breach;
- approaching threat;
- machine failure;
- horn.

---

# 149. Economy UI

Set 27J view-model rules are adopted.

Default economy UI answers:

1. What can I buy/sell?
2. What will I pay/receive?
3. Why is this offer different?
4. Can the transaction commit now?

---

# 150. Trade Screen

Shows:

- item/service;
- quantity;
- unit/total;
- payment method;
- price trend;
- reason;
- availability;
- restriction.

---

# 151. Advanced Market

Optional:

- price band;
- supply/demand;
- protected reserve;
- liquidity;
- known arrivals;
- substitutes;
- historical observations;
- freshness;
- regional comparisons.

---

# 152. No Omniscient Market Map

Remote prices require knowledge.

---

# 153. Contract UI

Before acceptance:

- parties;
- authority;
- obligations;
- deadlines;
- payment;
- quality;
- escrow;
- cancellation;
- breach/remedy;
- risks;
- version.

---

# 154. Active Contract

Prioritise:

- next obligation;
- deadline;
- evidence;
- blocker;
- payment state.

---

# 155. Finance UI

Loans show:

- principal;
- total scheduled cost when known;
- due dates;
- rates/fees;
- security;
- default consequence.

No surprise compounding.

---

# 156. Insurance UI

Show:

- covered risk;
- limit;
- deductible;
- exclusions;
- premium;
- claim evidence;
- denial reason.

---

# 157. Treasury UI

Authority-scoped.

Citizens may see:

- applicable tax;
- paid/due;
- receipt.

Managers may see:

- funds;
- commitments;
- revenue;
- budgets;
- payroll;
- reserve;
- debt.

---

# 158. Public-Finance Transparency

Hidden internal state is not revealed without authority.

---

# 159. Route Planning UX

Set 30H supplies:

- routes;
- accessibility;
- ETA;
- confidence;
- blockers.

UI displays decisions, not raw graph internals.

---

# 160. Route Screen

May show:

- fastest;
- safer;
- balanced;
- modes;
- quality;
- ETA;
- confidence;
- blockers;
- weather;
- clearance;
- transfers;
- unknown sections.

---

# 161. Route Preferences

Player may request:

- avoid climbing;
- avoid gliding;
- avoid severe terrain;
- minimise transfers;
- safer route;
- mobility-accessible route;
- avoid hostile territory;
- custom.

Preference does not change physical truth.

---

# 162. Autotravel

Clearly distinguish:

- manual route planning;
- autotravel;
- teleport/fast travel.

Do not label autotravel as instant fast travel.

---

# 163. Map Architecture

Map layers can include:

- terrain;
- settlements;
- roads;
- structures;
- resources;
- ecology;
- politics;
- trade;
- quests;
- realms;
- maritime;
- personal markers.

All filtered by knowledge.

---

# 164. Unknown Map Data

Unknown space can remain:

- blank;
- approximate;
- rumoured;
- outdated.

---

# 165. Map Confidence

Routes/claims/hazards may show confidence and age.

---

# 166. Navigation Markers

Markers should not reveal a moving target's exact location unless known.

---

# 167. Quest Journal

Document 15 supplies:

- state;
- objective;
- evidence;
- reason;
- deadline;
- history.

UI presents.

---

# 168. Quest Entry

Answer:

- what;
- why;
- who;
- where known;
- current stage;
- deadline;
- choices;
- blocked reason;
- consequence.

---

# 169. Event UI

Events use:

- warning;
- severity;
- current phase;
- affected area;
- optional interventions;
- history.

---

# 170. Chronicle

Chronicle is searchable by:

- person;
- settlement;
- faction;
- realm;
- structure;
- date;
- category.

---

# 171. History Knowledge

Objective history and actor-known history are distinct.

Normal player view uses permitted knowledge.

---

# 172. Civilisation UX

Document 13 provides:

- citizenship;
- faction;
- government;
- law;
- territory;
- treaty;
- war.

---

# 173. Identity Separation in UI

Never collapse:

- ancestry;
- culture;
- faction;
- government

into one “Race/Faction” label.

---

# 174. Person Inspect

May show known:

- name;
- role;
- culture;
- citizenship;
- faction;
- relationship;
- current need;
- quest/request;
- known history.

Permissions/knowledge filter.

---

# 175. Political Map

May show:

- recognised borders;
- claims;
- disputes;
- war;
- treaties.

Unknown/disputed claims remain labelled accordingly.

---

# 176. Law UX

Show:

- rule;
- jurisdiction;
- authority;
- effect;
- exemptions;
- known penalty;
- effective date.

---

# 177. Settlement Dashboard

Normal summary focuses on seven needs:

- Housing
- Provisions
- Health
- Work
- Safety
- Infrastructure
- Morale

---

# 178. Settlement Deep View

Optional:

- population;
- facilities;
- projects;
- stock;
- labour;
- economy;
- defence;
- factions;
- routes;
- events.

---

# 179. Need Reason

A low need should explain:

- demand;
- capacity;
- blocker;
- trend;
- related facilities.

---

# 180. No Single Settlement Score

Avoid hiding everything behind “Town Level 73.”

---

# 181. Project Dashboard

Shows:

- stage;
- required;
- reserved;
- delivered;
- labour;
- blockers;
- expected capability.

---

# 182. Realm UI

Document 14 provides:

- realm;
- route;
- anchor;
- law/environment summary;
- safe-return state.

---

# 183. Realm Preparation

Before travel show known:

- atmosphere;
- gravity;
- protection;
- route stability;
- return;
- cargo;
- party;
- permissions;
- known threats.

---

# 184. Realm Unknowns

Spoiler-sensitive information may remain unknown.

Safety-critical known requirement remains visible.

---

# 185. Realm Network

Atlas UI can show:

- realm nodes;
- known routes;
- anchor status;
- ownership;
- confidence;
- return state.

---

# 186. Portal Unsafe Warning

Example:

> Return anchor is unavailable and the destination route is unstable. Travel may leave the party without a normal return path.

---

# 187. Creature / Ecology UX

Document 10/24F supply:

- known family;
- tracks;
- population trend;
- habitat;
- tame state;
- ecology.

---

# 188. Creature Codex

Separates:

- observation;
- research;
- cultural lore;
- mechanics;
- uncertainty.

---

# 189. Taming UX

Show:

- eligibility;
- familiarity;
- training;
- care;
- ownership;
- role.

Recognised persons never use animal-taming UI.

---

# 190. Ecology View

May expose known:

- abundance band;
- trend;
- pressure;
- habitat;
- conservation law;
- harvest.

No hidden exact population by default.

---

# 191. Combat HUD

Contextually displays:

- Health;
- Stamina;
- Guard;
- selected weapon;
- ammo;
- threat;
- objective;
- downed ally;
- tactical condition.

---

# 192. Combat Readability

Important attacks use:

- animation;
- sound;
- optional icon;
- haptic;
- caption

where practical.

---

# 193. Lock-On

Options:

- disabled;
- toggle;
- hold;
- target cycle;
- target priority.

---

# 194. Hit Feedback

Configurable:

- reticle;
- sound;
- haptic;
- hit stop;
- damage numbers.

---

# 195. Damage Numbers

Optional.

Never required to understand danger.

---

# 196. Downed UI

Shows:

- state;
- rescue/stabilisation availability;
- ally direction;
- known timer/window.

Set 29/16 remains truth.

---

# 197. Raid / Defence UX

Preparation uses actual components:

- guards;
- walls;
- ammo;
- medicine;
- wards;
- escape routes;
- repairs.

Avoid one opaque defence score.

---

# 198. Aftermath

May summarise:

- casualties;
- injuries;
- structure damage;
- theft;
- prisoners;
- contribution;
- political/social/economic aftermath;
- repair needs.

---

# 199. Aquatic HUD

Adopt Set 26O:

- breath when relevant;
- low-air escalation;
- depth/pressure;
- temperature;
- current;
- surface direction assist;
- rescue;
- equipment failure.

---

# 200. Aquatic Accessibility

Options may include:

- extended/unlimited breath;
- reduced current force;
- auto-surface;
- simplified vertical controls.

---

# 201. Helm HUD

Baseline:

- heading;
- speed;
- propulsion;
- immediate hazards.

Contextual:

- wind;
- current;
- draft/depth;
- station faults.

Deep:

- route;
- sail/engine;
- stability;
- certification.

---

# 202. Helm Knowledge

Exact wind/current/depth may require instruments/knowledge.

---

# 203. Vessel Integrity

View model may expose:

- breaches;
- fire;
- flooding;
- critical supports;
- inaccessible areas;
- watertight openings.

---

# 204. Vessel Overlays

Required categories:

- structural roles;
- compartments;
- access routes;
- flooding;
- fire/smoke;
- propulsion/control;
- power/mana;
- cargo;
- repair priority.

Use patterns and labels.

---

# 205. Vessel Warning Severity

Distinguish:

- commissioning blocker;
- operational restriction;
- maintenance warning;
- optimisation advice.

---

# 206. Port Call UX

Groups:

- berth;
- customs;
- cargo;
- provisions;
- crew;
- repairs;
- shipyard;
- rescue/medical;
- market/contracts;
- departure readiness.

---

# 207. Port Does Not Teleport Stock

Cargo transfer remains a real transaction.

---

# 208. Cargo UX

Distinguish:

- ownership;
- custody;
- quantity;
- condition;
- provenance;
- destination;
- contract reservation;
- legal status.

---

# 209. Fleet UX

Focuses on:

- mission;
- composition;
- readiness;
- supply;
- route;
- command;
- risk.

No one opaque naval power score.

---

# 210. Naval Combat HUD

Context is objective-driven:

- escape;
- escort;
- protect;
- disable;
- board;
- capture;
- rescue;
- hold passage;
- break blockade;
- defeat.

---

# 211. Maritime Alarms

Critical:

- drowning;
- capsize;
- major breach;
- uncontrollable fire;
- collision.

High:

- steering failure;
- berth revoked;
- severe storm;
- crew emergency.

---

# 212. Maritime Quiet Mode

Routine catches/sales/crew shifts can go to history.

Critical alarms remain.

---

# 213. Notification Architecture

Priorities:

- Critical
- Urgent
- Important
- Routine
- Informational

---

# 214. Critical Notifications

Examples:

- save failure;
- imminent death;
- portal return failure;
- drowning;
- capsize;
- catastrophic ritual;
- severe permission conflict.

Immediate multi-channel.

---

# 215. Urgent Notifications

Examples:

- raid;
- ally downed;
- severe storm;
- civilian danger;
- hazardous machine failure;
- uncontrolled flooding.

---

# 216. Important Notifications

Examples:

- project stage;
- quest outcome;
- shortage;
- contract deadline;
- major unlock.

---

# 217. Routine Notifications

Examples:

- item pickup;
- normal production;
- minor delivery;
- repeated skill XP.

Group them.

---

# 218. Informational

Examples:

- lore;
- optional hint;
- background simulation.

History-first.

---

# 219. Notification Throttling

Repeated equivalent alerts aggregate.

Example:

`+1 Iron Ore` repeated 30 times
→ `Iron Ore +30`

---

# 220. Quiet Modes

Players can suppress:

- routine banners;
- ambient speech;
- minor economic changes;
- production notices.

Critical safety is preserved.

---

# 221. Do Not Disturb

Optional temporary mode while:

- building;
- dialogue;
- photo mode;
- Forge.

Critical alerts can still break through.

---

# 222. Notification History

Search/filter by:

- system;
- priority;
- subject;
- time;
- unresolved.

---

# 223. Errors

Good error format:

**What happened**  
**Why**  
**What is safe**  
**What next**

---

# 224. Save Failure Example

> Autosave failed. Your current session is still active and the previous save was not overwritten.
>
> Try Manual Save, check storage, or open Recovery Details.

---

# 225. Permission Failure Example

> You cannot open this warehouse for withdrawal. You have view permission only.
>
> Request access or use your assigned storage.

---

# 226. Transaction Failure

Explain whether:

- nothing changed;
- reservation was released;
- partial outcome committed.

---

# 227. Confirmations

Use confirmation for:

- irreversible world setting;
- destroy unique item;
- dismantle important machine;
- abandon high-consequence quest;
- rare-resource ritual;
- declare war;
- delete world;
- remove content pack;
- overwrite backup.

---

# 228. Hold Confirm

Optional for dangerous actions.

Adjustable duration.

---

# 229. Undo

Prefer undo for reversible:

- layout;
- sorting;
- pin;
- temporary placement preview;
- filter;
- safe transfer if transaction supports reversal.

---

# 230. History / Audit

Player-facing audit may show:

- transfer;
- contract;
- project;
- ownership;
- tax;
- vessel;
- setting changes

where relevant.

---

# 231. Provenance Inspection

Advanced player tools may show:

- source;
- maker;
- location;
- owner;
- chain of custody;
- history

when gameplay knowledge permits.

---

# 232. Developer Provenance

Developer mode can show:

- stable IDs;
- owner system;
- source pack;
- registry definition;
- revision;
- reason codes;
- dependency graph.

Separate from normal player knowledge.

---

# 233. Tutorials

Tutorial modes:

- Off
- Minimal
- Contextual
- Guided
- Full
- Custom

---

# 234. Tutorial Principles

Tutorials are:

- optional;
- replayable;
- contextual;
- system-specific;
- not fixed to one world.

---

# 235. Tutorial Channels

- context hint;
- optional objective;
- NPC teaching;
- world example;
- practice;
- Codex;
- resettable hint.

---

# 236. No Fixed Forest Hamlet Tutorial

Normal onboarding must not require:

- Forest Hamlet;
- named villagers;
- watchtower;
- fixed goblin raid;
- fixed mana ruin.

---

# 237. Contextual Replacement

Tutorial binds to valid generated context.

If unavailable:

- alternate provider;
- practice;
- Codex;
- skip.

---

# 238. Codex

Links:

- Blocks;
- Items;
- Recipes;
- Resources;
- Creatures;
- Biomes;
- Structures;
- Cultures;
- Factions;
- Governments;
- Realms;
- Quests;
- Combat;
- Laws;
- Systems;
- History;
- Tutorials.

---

# 239. Codex Knowledge

Entries may be:

- undiscovered;
- hinted;
- known;
- studied;
- mastered.

---

# 240. Practical vs Lore

Separate tabs/sections for:

- mechanics/practical;
- lore/history.

---

# 241. Search

Global search can find known:

- Codex;
- inventory;
- recipes;
- maps;
- quests;
- people;
- structures;
- settings.

---

# 242. Accessibility Foundation

Accessibility is architecture.

It applies:

- before gameplay;
- during gameplay;
- in Forge;
- split-screen;
- multiplayer;
- menus.

---

# 243. Accessibility Quick Setup

Available from:

- first boot;
- main menu;
- pause;
- world creation.

---

# 244. Vision

Support:

- UI/text scale;
- contrast;
- custom colours;
- patterns;
- labels;
- target outlines;
- reticle controls;
- high-contrast overlays;
- large cursors.

---

# 245. Hearing

Support:

- subtitles;
- closed captions;
- speaker identity;
- direction/distance;
- visual alerts;
- haptic alternatives;
- category volumes.

---

# 246. Motor

Support:

- full remapping;
- hold/toggle;
- adjustable holds;
- timing assistance;
- aim assistance;
- simplified input;
- no mandatory rapid tapping;
- one-hand profiles where practical.

---

# 247. Cognitive

Support:

- progressive disclosure;
- plain language;
- grouped alerts;
- presets;
- favourites;
- search;
- reduced notification mode;
- replay tutorials;
- reason-first explanations.

---

# 248. Motion / Photosensitivity

Independent controls for:

- camera shake;
- bob;
- FOV shift;
- motion blur;
- depth of field;
- hit stop;
- flashes;
- chromatic effects;
- particles;
- animated backgrounds;
- vibration.

---

# 249. Screen Reader / Narration

Expose:

- labels;
- roles;
- values;
- state;
- focus order;
- control names;
- errors;
- dynamic changes.

---

# 250. Accessible Equivalent Channels

Every critical cue should have at least two viable channels where practical.

Examples:

- colour + icon/text;
- sound + caption;
- vibration + visual;
- motion + UI warning.

---

# 251. Presentation Forge Boundary

Presentation assets can be reduced/substituted by accessibility/performance settings without suppressing the underlying gameplay event.

---

# 252. Mechanical Assists

Some accessibility choices are mechanical.

Examples:

- unlimited breath;
- reduced current;
- timing extension.

They are authoritative rule modifiers, not fake HUD values.

---

# 253. Shared-World Assist Policy

Multiplayer host/server defines whether mechanical assists are:

- per-player;
- globally enabled;
- restricted.

Presentation accessibility remains per-player.

---

# 254. Accessibility and Rewards

Accessibility assists do not reduce progression rewards by default.

---

# 255. Content Warnings

Spoiler-safe categories may include:

- death;
- injury;
- disease;
- imprisonment;
- conquest;
- corruption;
- family loss;
- settlement destruction;
- discrimination;
- severe disaster.

---

# 256. Content Intensity

Where possible, allow:

- presentation reduction;
- event suppression by world profile;
- severity adjustment.

Do not pretend consequences occurred differently if only presentation was changed.

---

# 257. Settings Architecture

Settings are divided by ownership and persistence.

---

# 258. Settings Layers

1. **Device / Performance**
2. **Player Profile**
3. **Accessibility**
4. **Controls**
5. **Interface / HUD**
6. **Audio / Haptics**
7. **Gameplay Assistance**
8. **World Rules**
9. **Simulation Depth**
10. **Multiplayer / Server**
11. **Content Packs**
12. **Developer / Debug**

---

# 259. Device Settings

Local-device only:

- resolution;
- display mode;
- rendering;
- shadows;
- particles;
- audio device;
- local UI scale;
- performance profile.

Never synchronised as world rules.

---

# 260. Player Profile Settings

Examples:

- language;
- HUD;
- subtitles;
- controls;
- camera;
- accessibility presentation;
- notification preferences.

---

# 261. World Rules

Authoritative world settings:

- simulation depth;
- difficulty/consequence;
- survival rules;
- NPC permanence;
- event pressure;
- economy mode;
- realm rules;
- multiplayer policies.

---

# 262. Host / Admin Settings

Multiplayer permissions may include:

- PvP;
- world-setting changes;
- player roles;
- building rights;
- content packs;
- backups;
- moderation;
- simulation changes.

---

# 263. Settings Search

Search can find:

- “camera shake”
- “hunger”
- “NPC death”
- “economy simulation”
- “split-screen”

and jump to correct category.

---

# 264. Settings Presets

Presets can bundle settings.

UI always allows inspection.

---

# 265. Settings Change Impact

Each setting carries metadata:

- scope;
- authority;
- change timing;
- restart requirement;
- migration requirement;
- world-history impact;
- performance impact.

---

# 266. Setting Metadata Template

```yaml
setting_definition:
  setting_id: leyforge.ui.setting.<path>
  scope: <device|player|world|server>
  owner_system_ref: <id>
  value_type: <type>
  default: <value>
  allowed_values: []
  change_class: <anytime|reload|restart|migration|creation_only|new_regions>
  authority_class: <local_player|host|admin>
  performance_impact_band: <band>
  simulation_impact_band: <band>
  accessibility_tags: []
  warning_profile_ref: <id>?
  localisation_refs: []
```

---

# 267. Changed-Settings Review

Before leaving settings, optionally show:

- applied;
- pending restart;
- world-impact changes;
- reverted.

---

# 268. Reset Behaviour

Allow reset:

- category;
- current tab;
- all player settings;
- graphics.

World-rule reset requires explicit confirmation.

---

# 269. Graphics and Performance

Potential categories:

- resolution scale;
- shadows;
- lighting;
- reflections;
- water;
- volumetrics;
- particles;
- foliage;
- animation LOD;
- render distance;
- UI effects;
- frame cap;
- VSync.

Exact renderer options depend on implementation.

---

# 270. Dynamic Scaling

Optional dynamic performance systems may adapt:

- resolution;
- effects;
- presentation density.

They must not change authoritative gameplay.

---

# 271. Simulation Diagnostics for Players

Optional advanced page may show:

- current Simulation Depth;
- current performance profile;
- background backlog;
- active actor count band;
- world-save health;
- content compatibility.

Avoid exposing hidden gameplay info.

---

# 272. Hardware Warning

If sustained load exceeds target:

> Performance is below the selected target.
>
> Recommended: reduce Shadows, Water Effects and Local Actor Presentation.
>
> Your world simulation settings will not be changed automatically.

---

# 273. Simulation Warning

If player intentionally changes simulation:

> This changes world simulation behaviour, not graphics.

---

# 274. Low-End World Wizard

Optional shortcut:

**Optimise New World for Lower-End Hardware**

It may recommend:

- Small/Medium world;
- Simple/Standard simulation;
- lower settlement density;
- lower concurrent background event density;
- conservative realm activation;
- lower presentation profile.

All changes are visible before confirmation.

---

# 275. Low-End Existing World

Offer safe-first steps:

1. reduce presentation;
2. reduce local promotion budgets;
3. reduce LOD presentation;
4. only then offer explicit simulation-depth migration.

---

# 276. CPU / GPU / Memory Explanations

Use plain language.

Example:

**NPC Simulation — CPU**

“Higher values keep more distant people and households independently scheduled.”

---

# 277. Storage Estimate

World creation may show estimated:

- initial size;
- expected growth band;
- backups.

No exact promise before measured implementation.

---

# 278. Save Management

Pause/menu supports:

- manual save;
- save status;
- backup;
- world exit;
- recovery.

---

# 279. Autosave

Subtle indicator.

Never show success until commit.

---

# 280. Unsafe Exit

If save pending:

- show state;
- allow wait;
- cancel exit;
- force exit with warning.

---

# 281. Backup Health

World card can show:

- healthy;
- old;
- unavailable;
- failed.

---

# 282. Save Migration

Before migration:

- backup;
- summary;
- pack changes;
- estimated impact;
- rollback option where available.

---

# 283. Loading Screen

May show:

- art;
- lore;
- tips;
- objectives;
- recent world changes.

Must expose errors.

---

# 284. Loading Progress

Use meaningful stages where possible:

- validating world;
- loading registries;
- migrating;
- loading region;
- restoring actors;
- preparing UI.

---

# 285. No Fake Progress Bar

Avoid arbitrary looping percentages.

---

# 286. Multiplayer Hub

Supports:

- host world;
- join;
- LAN;
- server list/direct connect where supported;
- split-screen;
- permissions;
- compatibility.

Detailed multiplayer production rules remain specialist-owned.

---

# 287. Server Card

May show:

- world name;
- ping;
- player count;
- version;
- packs;
- simulation profile;
- difficulty;
- PvP;
- persistence;
- access requirement.

---

# 288. Join Compatibility

Before joining, validate:

- version;
- content;
- mods;
- profile compatibility;
- permissions.

---

# 289. Multiplayer UI

Adds:

- party;
- players;
- pings;
- communication;
- authority;
- contribution;
- permissions;
- shared objectives;
- disconnect status.

---

# 290. Party Status

Configurable:

- Health;
- downed;
- distance;
- realm;
- major condition;
- objective.

Knowledge/privacy rules apply.

---

# 291. Pings

Possible:

- danger;
- resource;
- destination;
- help;
- build;
- machine;
- NPC;
- project;
- portal;
- custom.

---

# 292. Communication

Potential:

- local;
- party;
- settlement;
- faction;
- direct;
- server;
- system.

---

# 293. Voice / Safety

Support:

- mute;
- volume;
- block;
- reporting;
- channel;
- captions where supported.

---

# 294. Shared Objective Authority

UI must show who can:

- accept;
- choose branch;
- spend shared stock;
- sign contract;
- command party;
- change world setting.

---

# 295. Split-Screen

Foundation requirement.

Each player gets:

- independent HUD;
- independent menus;
- independent map;
- independent accessibility;
- independent focus;
- independent scale.

---

# 296. Split-Screen Heavy Screens

Large dashboards may:

- simplify;
- expand into pause-shared view by consent;
- use tabs.

Critical information remains available.

---

# 297. Split-Screen Performance

Performance profile may reduce decorative density.

It cannot change shared simulation outcome.

---

# 298. Offline Change Summary

When returning to a persistent world/server, show relevant:

- projects;
- production;
- attacks;
- shortages;
- diplomacy;
- contracts;
- migrations;
- realm changes.

Filtered by player relevance/knowledge.

---

# 299. No Overwhelming Return Screen

Start with summary.

Allow drill-down.

---

# 300. Privacy

Player-facing UI should not expose:

- private NPC ledgers;
- hidden disease;
- secret faction memberships;
- other players' private settings/history

without valid permission.

---

# 301. Localisation Architecture

All user-facing text uses localisation keys/structured variables.

---

# 302. Structured Parameters

Do not concatenate grammar-sensitive sentences from arbitrary fragments when avoidable.

---

# 303. Canonical Terminology

Maintain term base for:

- Blocks;
- Items;
- resources;
- systems;
- cultures;
- realms;
- mechanics.

---

# 304. Generated Names

Generated names remain stored identities and localise supporting titles/grammar separately.

---

# 305. Right-to-Left / Expansion

Layouts must tolerate:

- longer translations;
- RTL where supported;
- wider/narrower glyphs;
- grammatical variation.

---

# 306. Icons and Text

Never assume icon-only translation.

---

# 307. Voice Localisation

Voice is enhancement.

Text/subtitle experience remains complete.

---

# 308. Screen Reader

Dynamic list changes announce:

- added;
- removed;
- updated;
- error.

Avoid overwhelming announcement spam.

---

# 309. UI Performance

UI should not:

- rebuild large lists every frame;
- query entire world every frame;
- render thousands of hidden rows;
- run gameplay simulation.

---

# 310. Virtualised Lists

Use for:

- inventory;
- Codex;
- market;
- logs;
- worlds;
- content packs;
- histories.

---

# 311. View-Model Update Cadence

Update on:

- state change;
- meaningful cadence;
- user inspection.

Not every frame for unchanged dashboards.

---

# 312. UI Animation Budget

Low-end/accessibility settings can reduce:

- fades;
- blur;
- animated backgrounds;
- particle UI;
- transitions.

---

# 313. Overlay Performance

Overlays use:

- relevance;
- culling;
- bounded labels;
- aggregation.

---

# 314. Map Performance

Map uses:

- chunked layers;
- LOD;
- cached geometry;
- knowledge-filtered datasets.

---

# 315. Developer UI

Developer mode may include:

- registry browser;
- dependency graph;
- provenance viewer;
- reason-code inspector;
- worldgen inspector;
- entity inspector;
- LOD inspector;
- network authority inspector;
- save/migration inspector;
- performance dashboard.

---

# 316. Developer UI Is Not Player Power

Developer commands are permission-gated and clearly marked.

---

# 317. Player Inspector

Safe player-facing inspection may show:

- known dependencies;
- cause;
- history;
- ownership;
- status.

---

# 318. World Inspector

Advanced player/host world settings page may show:

- world profile;
- simulation depth;
- enabled systems;
- content packs;
- server rules;
- change history.

---

# 319. Dependency Viewer

Useful for:

- building;
- automation;
- portal;
- vessel;
- project;
- content packs.

It explains blockers without revealing forbidden information.

---

# 320. Command Preview

Before significant action show:

- resource cost;
- ownership change;
- affected object;
- dependency;
- irreversible flag.

---

# 321. Destructive Action Confirmation

Examples:

- dismantle machine with inventory;
- destroy unique structure;
- delete world;
- remove pack;
- abandon settlement.

---

# 322. Audit History

Important host/admin actions logged:

- world-setting change;
- player permission change;
- content pack change;
- restore backup;
- major ownership transfer.

---

# 323. UI Security

Clients cannot mutate state by:

- editing local view model;
- modifying displayed value;
- sending unchecked command;
- reopening stale screen.

---

# 324. Stale Command

If world changed since screen opened:

- reject;
- refresh;
- preserve user intent if safely retryable.

---

# 325. Stale Trade Example

> Offer changed because stock was purchased by another customer.
>
> Refreshing current offer.

---

# 326. Stale Construction Example

> Placement is no longer valid because another structure now occupies the space.

---

# 327. UI Save-State Scope

Persist:

- HUD layout;
- pinned objectives;
- filters;
- favourites;
- map markers;
- per-player settings;
- tutorial state;
- accessibility.

Do not persist transient modal state unnecessarily.

---

# 328. World-Setting History

World settings that affect simulation maintain:

- who changed;
- old;
- new;
- time;
- migration/result.

---

# 329. Accessibility History

Private per-player accessibility settings do not need shared audit unless relevant to server mechanical-assist policy.

---

# 330. UI Reason-Code Families

Recommended families:

- `UI_INPUT_*`
- `UI_PERMISSION_*`
- `UI_KNOWLEDGE_*`
- `UI_TRANSACTION_*`
- `UI_SAVE_*`
- `UI_WORLD_*`
- `UI_SIM_*`
- `UI_PACK_*`
- `UI_NETWORK_*`
- `UI_ACCESS_*`
- `UI_VIEWMODEL_*`

Specialist codes remain specialist-owned.

---

# 331. UI Diagnostics

Examples:

| Code | Meaning |
|---|---|
| `UI-VIEW-001` | View model source missing. |
| `UI-VIEW-002` | View model revision stale/incompatible. |
| `UI-KNOW-001` | Hidden knowledge exposed. |
| `UI-REASON-001` | Critical failure has no mapped explanation. |
| `UI-CMD-001` | Command lacks authoritative owner. |
| `UI-CMD-002` | Stale command rejected without refresh path. |
| `UI-SAVE-001` | Save UI reported false success. |
| `UI-WORLD-001` | World-setting impact metadata missing. |
| `UI-SIM-001` | Simulation setting confused with performance setting. |
| `UI-PERF-001` | Performance option changes gameplay truth without declaration. |
| `UI-ACC-001` | Critical cue lacks equivalent accessible channel. |
| `UI-FOCUS-001` | Controller focus trap. |
| `UI-SPLIT-001` | Local player UI stole another player's input. |
| `UI-LOC-001` | Dynamic text not localisation safe. |
| `UI-POC-001` | Production screen requires retired POC identity. |

---

# 332. Screen Registry Philosophy

The screen registry defines presentation contracts.

It does not own gameplay data.

---

# 333. Core Shell Screens

- Main Hub
- Continue
- World Library
- World Details
- New World
- Multiplayer
- Forge Hub
- Content Packs
- Settings
- Accessibility
- Help
- Recovery Centre
- Credits

---

# 334. In-Game Core Screens

- Pause
- Inventory
- Equipment
- Crafting
- Recipe Book
- Map / Atlas
- Journal
- Chronicle
- Codex
- Character / Progression
- Status / Biology
- Settlement
- Structure / Project
- Automation
- Magic
- Social / Faction
- Economy / Trade
- Contracts
- Route Planner
- Realm Atlas

---

# 335. Specialist Screens

- Blueprint Designer
- Vessel Builder / Commissioning
- Helm / Chart
- Vessel Integrity
- Port Call
- Fleet
- Treasury
- Enterprise
- Companion
- Council / Diplomacy
- Medical Treatment
- Ecology
- World Settings
- Server Admin

---

# 336. Screen Definition Template

```yaml
ui_screen_definition:
  screen_id: leyforge.ui.screen.<path>
  parent_screen_ref: <id>?
  modality: <world_overlay|panel|full_screen>
  pause_policy: <policy>
  view_model_refs: []
  command_refs: []
  knowledge_policy_ref: <id>
  permission_policy_ref: <id>
  focus_graph_ref: <id>
  accessibility_contract_ref: <id>
  split_screen_profile_ref: <id>
  performance_profile_ref: <id>
  localisation_refs: []
  history_behavior_ref: <id>
```

---

# 337. Widget Definition

```yaml
ui_widget_definition:
  widget_id: leyforge.ui.widget.<path>
  semantic_role: <role>
  value_source_ref: <view_model_field>
  states: []
  input_actions: []
  accessibility_label_ref: <id>
  narration_behavior_ref: <id>
  non_colour_cues: []
  responsive_rules: []
```

---

# 338. Interaction Grammar

Shared verbs:

- inspect;
- compare;
- pin;
- transfer;
- assign;
- configure;
- confirm;
- cancel;
- undo;
- open history;
- focus cause;
- navigate;
- filter;
- search.

---

# 339. Inspect

Opens detailed information without committing action.

---

# 340. Compare

Uses comparable domains, not universal score.

---

# 341. Pin

Pins:

- recipe;
- objective;
- route;
- resource;
- project;
- person;
- structure.

---

# 342. Assign

Used for:

- worker;
- companion;
- station;
- crew;
- route;
- project.

Authority owner validates.

---

# 343. Configure

Used for:

- machine;
- world;
- HUD;
- controls;
- permission.

---

# 344. Confirm

Reserved for commits requiring explicit final action.

---

# 345. Cancel

Must remain available during non-committed preview.

---

# 346. Open History

Provides cause/evidence trail where allowed.

---

# 347. Focus Cause

Can:

- highlight world object;
- open map;
- open dependency;
- open inventory.

---

# 348. Modal Policy

Avoid unnecessary modal interruption.

Use full-screen when:

- complex planning;
- settings;
- world creation;
- deep Forge.

---

# 349. Pause Policy

Screens declare whether:

- solo world pauses;
- multiplayer never pauses;
- partial slowdown;
- host policy.

UI must show if world remains active.

---

# 350. World-Continuous Menus

If world continues:

- danger warnings remain;
- critical events visible;
- player can close quickly.

---

# 351. Settings While World Runs

Changing:

- graphics;
- UI;
- controls

may apply live.

World-rule changes follow authority/migration policy.

---

# 352. Photo / Cinematic Modes

If implemented, presentation mode must not hide critical multiplayer danger unless player explicitly accepts risk.

---

# 353. Notification to Action

Alerts can offer:

- open;
- track;
- dismiss;
- mute category;
- snooze.

---

# 354. Snooze

Critical safety warnings cannot be snoozed indefinitely.

---

# 355. Notification Ownership

The source system supplies:

- severity;
- event;
- reason.

Document 17 decides presentation priority within locked rules.

---

# 356. Attention Budget

Simultaneous systems compete for attention.

Priority order generally:

1. immediate safety;
2. irreversible transaction failure;
3. active social/interaction;
4. objective change;
5. management;
6. routine.

---

# 357. Accessibility Can Override Presentation Priority

Example:

Critical audio alarm also receives visual/caption.

---

# 358. POC Retirement

The fixed Forest Hamlet UI flow is Archived Validation only.

---

# 359. POC Archived Production Dependencies

Archive:

- fixed Forest Hamlet main world card;
- fixed named NPC dialogue screen;
- fixed Watchtower tracker;
- fixed warehouse tutorial;
- fixed Day-4 raid warning;
- fixed mana-pocket tutorial;
- fixed portal teaser;
- fixed POC screen chronology.

---

# 360. POC Preserved Capabilities

Preserve:

- HUD;
- inventory;
- crafting;
- dialogue;
- request board;
- warehouse;
- construction progress;
- machine UI;
- mana/ward feedback;
- raid warning;
- reputation/social feedback;
- aftermath;
- settings;
- accessibility;
- controller;
- save/load.

---

# 361. POC Regression Flow

The archived fixture can still validate:

**HUD**  
→ **Inventory/Crafting**  
→ **Dialogue/Request**  
→ **Warehouse**  
→ **Project**  
→ **Automation/Magic**  
→ **Threat Warning**  
→ **Combat**  
→ **Aftermath**  
→ **Save/Reload**

---

# 362. Production Onboarding

Normal world onboarding binds the same capabilities to generated context.

---

# 363. UI POC Leakage Scan

Production validation fails on hard dependency to:

- Forest Hamlet;
- named POC resident;
- Watchtower quest;
- fixed Goblin raid;
- fixed mana ruin;
- fixed portal.

---

# 364. Main-Menu Testing

Required:

- first boot;
- controller-only;
- keyboard-only;
- large text;
- screen reader;
- missing pack;
- corrupt save;
- many worlds;
- no worlds;
- multiplayer;
- split-screen.

---

# 365. World-Creation Testing

Test:

- Quick Start;
- Simple simulation;
- Full simulation;
- Low-End profile;
- invalid combination;
- pack dependency;
- creation-only settings;
- review summary;
- seed regeneration.

---

# 366. Simulation-Depth Testing

Verify:

- profile changes are explicit;
- performance profile never silently changes simulation profile;
- migrations preserve protected identities;
- summaries conserve state;
- UI correctly reports lost/reconstructed detail limitations.

---

# 367. Low-End Testing

Representative lower-bound hardware must prove:

- playable menu responsiveness;
- readable HUD;
- no missing critical warnings;
- bounded UI memory;
- no hidden gameplay-state deletion.

---

# 368. HUD Testing

Test:

- normal;
- combat;
- building;
- injury;
- underwater;
- helm;
- split-screen;
- large text.

---

# 369. Knowledge Leakage Testing

Create hidden:

- disease;
- faction;
- market;
- route;
- realm.

Verify UI does not reveal it.

---

# 370. Reason-Code Testing

Every critical failure has:

- stable code;
- human text;
- next action.

---

# 371. Accessibility Testing

Manual tests include:

- no colour;
- no audio;
- reduced motion;
- one-hand input;
- large text;
- screen reader;
- slower reading;
- controller.

---

# 372. Split-Screen Testing

Two players:

- open independent screens;
- receive separate alerts;
- control vessel stations;
- use different accessibility settings.

---

# 373. Economy UI Testing

Verify:

- price freshness;
- reason;
- protected stock;
- contract terms;
- no omniscient data.

---

# 374. Social UI Testing

Verify:

- unknown speaker;
- hidden choice;
- timeout;
- interruption;
- transcript;
- language.

---

# 375. Biology UI Testing

Verify:

- contextual needs;
- critical alerts;
- unknown diagnosis;
- treatment reason.

---

# 376. Movement UI Testing

Verify:

- blocked reason;
- route confidence;
- accessibility preferences;
- autotravel distinction.

---

# 377. Maritime UI Testing

Verify:

- breath;
- helm;
- breach;
- flooding;
- port;
- cargo;
- alarms;
- reduced roll/distortion.

---

# 378. Realm UI Testing

Verify:

- safe-return warning;
- unknown destination;
- preparation;
- knowledge filtering.

---

# 379. Save / Recovery Testing

Force:

- disk full;
- failed migration;
- missing mod;
- server interruption.

Verify no false success.

---

# 380. UI Performance Testing

Measure:

- world library with many worlds;
- large inventory;
- large market;
- long Chronicle;
- map;
- split-screen.

---

# 381. Localisation Testing

Use:

- text expansion;
- long names;
- RTL candidate;
- complex plural;
- missing key.

---

# 382. Focus Testing

Every screen can be completed without mouse.

---

# 383. Screen-Reader Testing

All critical controls expose:

- role;
- name;
- value;
- state.

---

# 384. UI Production Gate

A gameplay feature is not production-ready until it has:

- view model;
- command path;
- reason codes;
- accessibility;
- localisation;
- multiplayer scope where relevant;
- testing.

---

# 385. System-Specific UI Contract Gate

Each specialist system supplies:

- player-visible snapshot;
- actions;
- blocked reasons;
- knowledge rules;
- history hooks;
- critical alerts.

---

# 386. Document 18 Handoff

Document 18 must implement the UI architecture in Godot/Summer without inventing ownership.

Required technical concepts include:

- UI shell;
- view-model adapters;
- command dispatcher;
- reason-code/localisation service;
- notification router;
- focus manager;
- split-screen UI roots;
- settings registry;
- world-profile service;
- accessibility service;
- save/recovery shell;
- UI debug inspector.

Exact project paths require repository audit.

---

# 387. Settings Registry

World/player/device settings should be data-driven.

---

# 388. Settings Validation

Build/test validation checks:

- owner;
- default;
- valid range;
- scope;
- authority;
- persistence;
- localisation;
- impact classification.

---

# 389. Settings Migration

Renamed/removed settings preserve:

- old value;
- migration;
- compatibility warning.

---

# 390. World Profile Record

```yaml
world_profile:
  world_ref: <id>
  generation_profile_ref: <id>
  simulation_depth_profile_ref: <id>
  difficulty_profile_ref: <id>
  consequence_profile_ref: <id>
  enabled_system_profile_refs: []
  content_pack_refs: []
  multiplayer_policy_ref: <id>?
  world_setting_overrides: {}
  created_world_version: <version>
  profile_revision: <rev>
```

---

# 391. Device Performance Profile

```yaml
device_performance_profile:
  device_profile_id: <local_id>
  preset: low_end
  render_settings: {}
  presentation_density: {}
  local_lod_budgets: {}
  dynamic_scaling_rules: {}
  benchmark_metadata_ref: <id>?
```

This record is not authoritative world state.

---

# 392. Accessibility Profile

```yaml
accessibility_profile:
  player_profile_ref: <id>
  visual: {}
  hearing: {}
  motor: {}
  cognitive: {}
  motion: {}
  narration: {}
  mechanical_assist_refs: []
  world_policy_compatibility_ref: <id>?
```

---

# 393. HUD Layout Profile

```yaml
hud_layout_profile:
  profile_id: <id>
  preset: contextual
  widget_layout: []
  scale: <value>
  opacity: <value>
  visibility_rules: []
  safe_area: <value>
```

---

# 394. Notification Preference Profile

```yaml
notification_preferences:
  critical: always
  urgent: banner
  important: grouped
  routine: history
  informational: history
  quiet_mode: false
  category_overrides: {}
```

---

# 395. UI Source Trace

Optional developer record:

```yaml
ui_source_trace:
  view_id: <id>
  field_ref: <field>
  authoritative_owner_ref: <system>
  source_record_refs: []
  knowledge_filter_ref: <id>
  reason_code_refs: []
  source_revisions: []
```

---

# 396. Player-Facing World Setting Categories

## World Generation
- seed;
- scale;
- terrain;
- biome;
- ocean;
- structures;
- settlements.

## Simulation
- NPCs;
- settlements;
- economy;
- ecology;
- politics;
- events;
- realms;
- logistics.

## Gameplay
- survival;
- combat;
- progression;
- building;
- automation;
- magic.

## Consequences
- death;
- destruction;
- permanence;
- extinction;
- offline progression.

---

# 397. Simulation Category — NPCs

Possible custom controls:

- named actor retention;
- household detail;
- schedule detail;
- distant cohort threshold;
- background settlement activity.

---

# 398. Simulation Category — Economy

Possible:

- simple local trade;
- regional markets;
- business simulation;
- finance depth;
- trade-route activity.

Set 27 owns actual semantics.

---

# 399. Simulation Category — Ecology

Possible:

- population detail;
- predator/prey graph depth;
- migration frequency;
- invasive dynamics;
- conservation pressure.

---

# 400. Simulation Category — Politics

Possible:

- faction count;
- strategic cadence;
- elections;
- treaties;
- regional conflict;
- migration/diaspora activity.

---

# 401. Simulation Category — Events

Possible:

- minor event density;
- regional event density;
- cascade depth;
- history detail.

---

# 402. Simulation Category — Biology

Possible:

- background cohort detail;
- named-NPC disease/injury detail;
- population disease simulation.

Player biology remains authoritative regardless of profile unless difficulty explicitly changes rules.

---

# 403. Simulation Category — Automation

Possible:

- distant factory scheduling;
- network detail;
- active industrial regions.

Conservation remains mandatory.

---

# 404. Simulation Category — Transport

Possible:

- distant caravan/voyage detail;
- traffic/congestion depth;
- route service schedules.

---

# 405. Simulation Category — Realms

Possible:

- dormant realm cadence;
- cross-realm background activity;
- realm migration/trade detail.

---

# 406. Simple Mode Safeguards

Even Simple must preserve:

- stable IDs;
- ownership;
- stock/resource conservation;
- named people;
- player relations;
- structures;
- quests/contracts;
- important injuries;
- realm routes;
- major events;
- history.

---

# 407. Full Mode Safeguards

Full mode must remain bounded.

No requirement for:

- every citizen as active Node;
- every fish individually simulated;
- every coin physically networked;
- every market tick every frame.

Full means richer causal granularity, not deliberately unbounded code.

---

# 408. Simulation Depth UX Language

Avoid:

- “bad/simple AI”
- “realistic mode”

Prefer:

- how much background detail is simulated;
- how many independent actors are retained;
- how frequently distant systems resolve;
- which systems use cohorts vs individuals.

---

# 409. Performance UX Language

Explain which hardware component is affected:

- CPU;
- GPU;
- memory;
- storage.

---

# 410. Difficulty UX Language

Explain actual consequence:

- “Injuries are more likely from severe trauma.”
- “Hostile events occur more often.”

Not “Hard = 2× everything.”

---

# 411. Accessibility UX Language

Describe function, not diagnosis.

Examples:

- Reduce Camera Motion
- Extend Timed Choices
- Simplify Repeated Inputs
- Always Show Critical Captions

---

# 412. World-Rule Change Authority

Single-player:

- local player has authority.

Multiplayer:

- host/admin policy.

UI exposes authority clearly.

---

# 413. Vote / Consensus Settings

If future multiplayer supports votes for world changes, UI can present them.

The authority owner defines the rule.

---

# 414. World Setting Change Notification

Affected players receive:

- what changed;
- who changed it;
- when;
- impact.

---

# 415. Irreversible World Change

Require:

- exact explanation;
- backup recommendation;
- hold/confirm;
- audit record.

---

# 416. Mod / Content Safety

Content UI distinguishes:

- gameplay content;
- presentation-only;
- authoring tools;
- developer tools.

---

# 417. Safe Mode

Safe Mode may:

- disable optional presentation;
- disable non-required mods;
- preserve authoritative save;
- allow export/repair.

---

# 418. Missing Definition UI

Show:

- missing content ID;
- affected world objects;
- fallback/quarantine;
- pack needed.

Do not render missing content as silently deleted.

---

# 419. Missing Block / Item Projection

Use explicit placeholder.

No fake replacement identity.

---

# 420. Migration Report

After world migration, show:

- success;
- warnings;
- converted records;
- quarantined content;
- backup reference.

---

# 421. Player-Trust Success Criteria

A player should be able to determine:

- why an action failed;
- whether resources were consumed;
- whether the game saved;
- whether information is uncertain;
- whether a setting changes gameplay or performance;
- whether an action is irreversible;
- whether a route is physically possible;
- whether a contract is binding;
- whether a world will continue offline;
- whether a content pack is required.

---

# 422. Main-Menu Success Criteria

Main menu proves:

- world management is visible;
- recovery is visible;
- settings/accessibility accessible before loading;
- Forge is distinct from play;
- version/pack mismatch is visible;
- Continue is safe.

---

# 423. World-Creation Success Criteria

World creation proves:

- presets are transparent;
- Simple/Standard/Deep/Full simulation differences are understandable;
- hardware recommendation is separate;
- creation-only settings are labelled;
- world consequences are summarised;
- invalid configurations blocked;
- player can return/edit categories.

---

# 424. Low-End Success Criteria

A low-end player can:

- choose an appropriate new-world profile;
- reduce presentation without changing world truth;
- understand simulation-cost settings;
- get warnings before explicit simulation simplification;
- use all critical UI/accessibility features.

---

# 425. Accessibility Success Criteria

Critical actions remain understandable with:

- colour removed;
- audio muted;
- motion reduced;
- large text;
- controller-only;
- alternative timing/input settings.

---

# 426. Specialist Integration Acceptance

Set 27:
- economy view models and reasons visible.

Set 28:
- social choices, knowledge, subtitles and interruptions correct.

Set 29:
- biological alerts contextual and knowledge-aware.

Set 30:
- movement/camera/route reasons correct.

Set 26:
- aquatic/helm/vessel/port/cargo/fleet UI works.

---

# 427. Main-Document Reconciliation Requirements

| Document | Follow-On Requirement |
|---|---|
| 18 — Technical Plan | Implement settings/view-model/command/accessibility/UI-root architecture after read-only Godot/Summer repository audit. |
| 19 — Settlement | Consume Document-17 project/blueprint interaction grammar; expose authoritative project view models. |
| 20 — Buildings | Expose service activation, need reason and facility state through shared view-model/reason architecture. |
| Future Multiplayer Set | Use Document-17 split-screen/session/authority presentation as shell; final multiplayer rule ownership may supersede placeholders. |
| Future Main-Menu / Settings Expansion | May extend the shell but must preserve Simulation vs Performance vs Difficulty vs Accessibility separation. |

---

# 428. Production Acceptance Criteria

Document 17 v1.0 is accepted when:

- [x] world-first/minimal-contextual philosophy is preserved;
- [x] progressive disclosure is preserved;
- [x] knowledge-aware presentation is preserved;
- [x] UI consumes read-only view models;
- [x] UI sends validated commands;
- [x] reason-first failure presentation is mandatory;
- [x] provenance/freshness/confidence can be represented;
- [x] main menu is upgraded into a world/content hub;
- [x] world library exposes compatibility/recovery;
- [x] world creation supports fast presets and advanced configuration;
- [x] Simulation Depth is distinct from Performance Profile;
- [x] Difficulty/Consequence is distinct from Simulation Depth;
- [x] Accessibility is distinct from difficulty;
- [x] Simple/Standard/Deep/Full simulation profiles are supported conceptually;
- [x] lower-end hardware receives explicit scalable options;
- [x] performance settings cannot silently change gameplay truth;
- [x] simulation-depth changes require explicit world-rule handling;
- [x] world-setting change classes and migration warnings exist;
- [x] content-pack dependencies/removal are visible;
- [x] Block Inventory Projections do not appear as duplicate canonical Items;
- [x] economy UI consumes Set 27J;
- [x] social/voice/subtitle UI consumes Set 28I;
- [x] biological UI consumes Set 29I;
- [x] movement/camera/route UI consumes Set 30;
- [x] maritime UI consumes Set 26O;
- [x] realm preparation/safe return is visible;
- [x] settlement/project/automation/magic/combat systems have contextual UI;
- [x] critical cues have accessible equivalent channels;
- [x] split-screen has independent UI/focus/accessibility;
- [x] localisation and screen-reader semantics are architectural;
- [x] save/recovery UI never reports false success;
- [x] developer diagnostics are separate from normal player knowledge;
- [x] POC Forest Hamlet screen chronology is archive-only;
- [x] Godot/Summer implementation direction is current.

---

# Appendix A — Configuration Layer Matrix

| Layer | Changes World Truth? | Per Player? | Hardware-Specific? |
|---|---:|---:|---:|
| Simulation Depth | **Yes, explicitly** | Usually World | No |
| Difficulty / Consequence | **Yes** | World or policy-dependent | No |
| Mechanical Accessibility Assist | Sometimes | Player or World Policy | No |
| Presentation Accessibility | No | **Yes** | No |
| Performance / Graphics | No by default | Device | **Yes** |
| HUD / Interface | No | **Yes** | Device/Profile |
| Controls | No | **Yes** | Device |
| Content Packs | Yes | World/Server | No |
| Multiplayer Rules | Yes | World/Server | No |

---

# Appendix B — World Creation Review Template

```yaml
new_world_review:
  name: <name>
  seed: <seed_or_random>
  generation:
    size: <value>
    terrain_profile: <id>
    ocean_profile: <id>
    biome_profile: <id>
  simulation:
    profile: deep
    overrides: {}
  difficulty:
    profile: relaxed
    overrides: {}
  consequence:
    npc_permadeath: true
    structure_destruction: true
  content:
    packs: []
  multiplayer:
    mode: solo
  accessibility:
    profile_ref: <player_profile>
  performance:
    recommended_device_profile: low_end
  warnings:
    - <warning>
```

---

# Appendix C — Simulation Profile Comparison

| Domain | Simple | Standard | Deep | Full |
|---|---|---|---|---|
| Distant People | Cohort-heavy | Mixed | More individuals | Maximum bounded retention |
| Households | Summary | Standard | Detailed | High detail |
| Economy | Regional/simple | Regional | Local/regional businesses | Maximum bounded causal detail |
| Ecology | Reduced graph | Standard | Rich graph | Maximum bounded graph |
| Politics | Fewer minor actors | Standard | More factions/events | Maximum bounded strategic detail |
| Events | Lower minor density | Standard | Higher interactions | Highest bounded density |
| History | Compact | Standard | More retained | Highest configured retention |
| Realms | Lower background cadence | Standard | More active | Highest bounded background activity |

Exact behaviour remains specialist-owned and requires balancing/testing.

---

# Appendix D — World-Setting Change Classes

| Class | Meaning |
|---|---|
| Anytime | Safe immediate change. |
| Reload | Applies on world reload. |
| Restart | Requires application restart. |
| Migration | Persistent records must transform. |
| New Regions Only | Existing generated content unchanged. |
| Creation Only | Requires new world. |
| Server Authority | Requires host/admin. |

---

# Appendix E — Critical Cue Contract

```yaml
critical_cue_contract:
  cue_id: <id>
  gameplay_event_ref: <id>
  priority: critical
  minimum_channels: 2
  supported_channels:
    - visual_icon
    - text_caption
    - audio
    - haptic
  suppressible: false
  reduced_motion_variant_ref: <id>
  high_contrast_variant_ref: <id>
```

---

# Appendix F — Economy View-Model Example

```yaml
trade_view_model:
  subject_refs:
    - merchant:<id>
    - market:<id>
  knowledge_state: recent
  as_of_time: <time>
  confidence_band: high
  offer_rows: []
  reason_codes: []
  allowed_actions:
    - buy
    - sell
    - barter
  blocked_actions: []
  history_refs: []
```

---

# Appendix G — Route View-Model Example

```yaml
route_plan_view_model:
  origin_ref: <id>
  destination_ref: <id>
  mover_ref: <id>
  candidate_routes:
    - route_ref: <id>
      estimated_time_band: <value>
      confidence: <band>
      accessibility: accessible_with_penalty
      blockers: []
      warnings: []
  knowledge_time: <time>
```

---

# Appendix H — Biological Status View Example

```yaml
biological_status_view_model:
  actor_ref: <id>
  health_band: injured
  stamina_band: normal
  visible_needs:
    - hydration
  known_conditions:
    - condition_ref: <id>
      knowledge_state: suspected
      severity_band: moderate
  critical_alerts: []
  treatment_actions: []
```

---

# Appendix I — Maritime View-Model Family

Required Set-26 integrations include:

```text
AquaticStatusVM
HelmStatusVM
VesselIntegrityVM
CommissioningVM
PortCallVM
VoyagePlanVM
FleetVM
CombatVM
EcologyVM
```

Document 17 supplies shared presentation infrastructure.

---

# Appendix J — POC UI Preservation Matrix

| POC UI | Production Treatment |
|---|---|
| Basic HUD | Preserve |
| Inventory | Preserve and update canonical Block/Item identity |
| Crafting | Preserve |
| NPC dialogue | Preserve; Set 28 runtime |
| Request Board | Preserve generic opportunity projection |
| Warehouse | Preserve |
| Watchtower Project | Preserve generic project UI; fixed POC target archived |
| Machine panel | Preserve |
| Mana/Ward | Preserve |
| Raid warning | Preserve generic threat/event alert |
| Reputation | Replace with Set 28 social + Document 13 political views |
| Fixed Forest Hamlet sequence | Archive |
| Settings basics | Expand to full production configuration |
| Accessibility basics | Expand to production architecture |

---

# Appendix K — Definition of Done for Implemented UI Foundation

The UI is not complete because menus exist and the HUD has bars.

Production proof requires:

- first boot accessibility works;
- main menu can recover a broken world safely;
- world cards expose version/pack/save status;
- world creation clearly separates simulation, performance and difficulty;
- lower-end hardware has a supported path;
- performance profile never silently changes authoritative simulation;
- world settings expose change/migration class;
- read-only view models are used for specialist systems;
- blocked actions have reason codes;
- critical cues have multiple channels;
- inventory distinguishes canonical Items and Block Inventory Projections without duplicate identity;
- economy data exposes freshness/confidence;
- dialogue never reveals unknown identity/choices;
- biology never reveals undiscovered diagnosis;
- route UI exposes uncertainty and mover compatibility;
- realm UI exposes safe-return state;
- maritime UI supports breath, helm, damage, ports and cargo;
- split-screen players retain independent focus/accessibility;
- controller can complete every core flow;
- large text reflows;
- screen reader semantics exist;
- localisation does not break layout;
- save failure never reports success;
- content-pack removal cannot silently delete world state;
- developer inspectors remain permission-separated;
- archived POC UI fixture still passes regression;
- normal production does not require the Forest Hamlet screen sequence.

---

# Completion Statement

**Document 17 v1.0 reconciles Leyforge's original UI/UX design with the post-POC simulation architecture, Sets 26–30, the canonical registries and the requirement for a genuinely scalable world-creation and settings experience.**

The original philosophy survives:

**World first. Detail on demand. Clear controls. Accessible presentation. Explainable failure.**

The production architecture now makes that philosophy enforceable.

**Gameplay systems own truth.**  
**View models expose permitted truth.**  
**Document 17 presents it.**  
**Commands request changes.**  
**Owners validate and commit.**  
**Reason codes explain the result.**

And world configuration is finally separated into four concepts that must never be confused:

**Simulation Depth — how much living-world causality is modelled.**  
**Performance Profile — how the same world is made affordable on this device.**  
**Difficulty & Consequence — how harsh the rules are.**  
**Accessibility — how the player receives and controls the experience.**

That separation lets Leyforge support both ambitious high-detail worlds and lower-end machines without turning “Low Graphics” into a hidden different game.

**Next foundation reconciliation dependency: Document 18 — Godot + Summer Engine Technical Implementation Plan v1.0 — COMPLETE REPLACEMENT.**
