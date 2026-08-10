# LEYFORGE

## 20G — Culture, Faction, Biome and Realm Building Packs

### Production Reconciliation of Cultural Composition, Pack Resolution, Environmental Adaptation and Realm-Specific Building Expression

**Version 1.0 — Reconciled Production Companion Draft**  
**Date:** 8 August 2026  
**Production Status:** Active Document Set 20 v1.0 Reconciliation  
**Supersedes:** `20G_Fantasy_Voxel_Civilisation_Sandbox_Culture_Faction_Biome_and_Realm_Building_Packs_v0_2` for active production direction  
**Master Authority:** Document 20 v1.0  
**Universal Building / Project / District / Wonder Functions:** Documents 20A–20F v1.0  
**Settlement Planning / Player Plans / Settlement Growth:** Document 19 v1.0  
**Official Blueprint Source:** Document 22I Blueprint Forge  
**Forge Content Authoring:** Document Set 22  
**Canonical Blocks / Items / Recipes / Resources:** Documents 03–06 v1.0  
**People / Households / Jobs / Settlement Population:** Document 07 v1.0  
**Automation / Magic:** Documents 08–09 v1.0  
**Creatures / Ecology / Biomes / World Generation:** Documents 10–11 v1.0  
**Persistent Structures:** Document 12 v1.0  
**Races / Factions / Government / Faith / Territory / Political Authority:** Document 13 v1.0  
**Dimensions / Realm Truth:** Document 14 v1.0  
**Quest / Event / Historical Change:** Document 15 v1.0  
**UI / Player Trust:** Document 17 v1.0  
**Godot + Summer Engine Technical Authority:** Document 18 v1.0  
**Registry / Packs / Lifecycle / Migration / Publication Governance:** Set 25  
**Maritime / Coastal / Vessel / Port Specialist Content:** Set 26  
**Economy / Markets / Businesses / Trade / Public Finance:** Set 27  
**Dialogue / Social Systems / Knowledge / Belief / Culture-in-Use:** Set 28  
**Biological / Survival / Health Constraints:** Set 29  
**Movement / Accessibility / Traversal:** Set 30  
**Project Lead and Final Authority:** Ash

20G remains the **composition layer** that turns universal Leyforge functions into recognisable cultures, factions, regions, biomes and realms without creating duplicate gameplay registries.

> **Identity Separation Rule**
>
> **Ancestry/race, culture, faction, government, faith/philosophy, economy, biome, realm and historical state remain separate linked dimensions. No ancestry is assigned one mandatory architecture, morality, government, religion, technology or settlement style.**

> **Universal Function Rule**
>
> **20A–20F own universal gameplay functions. 20G selects compatible Blueprint Forge sources, material-role sets, layout preferences, modules and explicitly registered functional replacements. A style pack cannot invent beds, jobs, production, defence, trade, power, Health or Infrastructure capacity.**

> **Culture / Social Separation Rule**
>
> **20G owns authored composition packs and deterministic resolution rules. Set 28 owns living individual knowledge, belief, language competence, relationships, willingness and social response. A culture pack may define norms and available expressions; it does not overwrite every person's mind.**

> **Faction / Political Separation Rule**
>
> **Document 13 owns faction identity, government, law, territory, citizenship, faith/political authority and formal political state. 20G may select visual/compositional overlays associated with those records but cannot create legitimacy, law, ownership or diplomacy.**

> **Economy Separation Rule**
>
> **Set 27 owns actual markets, businesses, prices, production economics, trade and public finance. An economy-themed pack may alter approved building-source pools and planning preferences, but cannot create economic output or wealth.**

> **Biome / Realm Separation Rule**
>
> **Document 11 owns biome/world environmental truth and Document 14 owns realm/dimension truth. 20G consumes those records to resolve valid adaptations. A biome or realm pack cannot recolour a building and thereby ignore climate, physical law, hazards, resources or access rules.**

> **Historical State Rule**
>
> **History may influence repaired, occupied, hybridised, ruined, conquered, rebuilt or culturally blended presentation. Document 15/12/13 and other owners commit the underlying events, structure state and political state; 20G resolves the compatible presentation from that truth.**

> **Player Pack Rule**
>
> **Restricted player-created styles and town packs may use the same composition contracts but cannot redefine universal IDs, bypass Set-25 publication/lifecycle governance, execute arbitrary code, invent hidden capacity or override multiplayer/server authority.**

> **POC Retirement Rule**
>
> **The Forest Hamlet / Riverward / Briarhook POC composition stack is Archived Validation only. Riverward, Briarhook or other content may survive independently if retained by the canonical content registries, but no active production architecture depends on the retired POC scenario or its fixed settlement chain.**

> **Canonical Asset Rule**
>
> **Packs reference canonical Blocks, Items, modules and Blueprint Forge sources. They do not clone registries merely to recolour content, and they do not reintroduce duplicate recoverable Block Items forbidden by FR-00-20-006.**

---

# Revision 1.0 Reconciliation Summary

The v0.2 design is fundamentally retained. Its strongest rule remains that pack layers provide **identity, adaptation and bounded alternatives**, not ancestry stereotypes, a second universal registry or hidden free capacity.

Version 1.0 updates the ownership boundaries to the completed post-Atlas architecture:

- **20G** owns pack schema, layered composition, source selection, material roles, approved modules, layout preferences, deterministic resolution and provenance;
- **20A–20F** own universal functions and civilisation-scale plan semantics;
- **22I / Set 22** own official editable Blueprint/Forge source;
- **Set 25** owns lifecycle, publication, dependency, migration and registry governance;
- **Document 13** owns races/factions/government/faith/territory/political state;
- **Document 11** owns biome/environment truth;
- **Document 14** owns realm/dimension truth;
- **Set 27** owns economic state;
- **Set 28** owns living social/knowledge/belief state;
- **Set 29** owns biological constraints/outcomes;
- **Set 30** owns movement/accessibility;
- **Set 26** owns maritime specialist execution;
- **Document 15** owns event/history lifecycle;
- **Document 12** owns persistent physical structures and damage/history.

The complete v0.2 specification is preserved below as the detailed source baseline. Where older wording conflicts with this v1.0 contract, the v1.0 rule governs.

---

# v1.0 Deterministic Composition Contract

The production resolution concept remains:

```text
universal function / plan
→ approved Blueprint Forge source pool
→ culture
→ regional / subculture layer
→ biome / environment adaptation
→ faction / government / faith / economy presentation overlay
→ realm adaptation
→ historical / occupation / damage state
→ approved settlement / player override
→ deterministic age / weathering / cosmetic detail
→ resolved source + provenance
```

This is a **composition pipeline**, not a gameplay-authority pipeline.

Every layer must distinguish:

- presentation;
- source selection;
- compatible module;
- material substitution;
- planner preference;
- actual gameplay replacement.

Only explicitly registered functional replacements may change how a universal capability is fulfilled.

---

# v1.0 Functional Replacement Rule

A functional replacement is allowed only when a society/realm genuinely fulfils a universal capability differently.

It must declare:

- universal function replaced;
- replacement stable ID/source;
- equivalent required service contract;
- changed prerequisites;
- changed hazards/trade-offs;
- planner compatibility;
- accessibility implications;
- construction/material rules;
- external owner interfaces;
- migration/version rules.

A replacement cannot simply claim equivalence because it looks culturally appropriate.

Examples of valid *types* of replacement could include:

- a nonstandard communal housing form satisfying Housing through a registered housing contract;
- a magical transport facility satisfying a route/transport capability through Document-09/30-compatible rules;
- a realm-specific water-equivalent service where Document 14/29 explicitly support that biology/environment.

The replacement must still reconcile to the seven-needs and owner systems.

---

# v1.0 Mixed Settlement and Hybridisation Contract

Mixed settlements are first-class.

A settlement may contain:

- multiple cultures;
- multiple ancestries;
- multiple factions;
- migrants/refugees;
- conquered/occupied districts;
- religious/philosophical minorities;
- foreign merchant quarters;
- hybrid neighbourhoods;
- player-created styles;
- historical layers.

20G must support **parcel/building-level provenance** rather than forcing one settlement-wide skin.

Hybridisation may produce approved new pack combinations over time, but living cultural change is driven by authoritative population/history/social systems rather than 20G randomly rewriting identity.

Set 28 owns individual/social adoption and knowledge.

Document 13 owns political/faction identity.

Document 15 owns historical events.

20G resolves the compatible architectural/content expression.

---

# v1.0 Biome and Realm Adaptation Contract

Biome adaptation may affect approved:

- foundations;
- roofs;
- insulation;
- ventilation;
- drainage;
- stilts;
- snow/wind handling;
- flood adaptation;
- material roles;
- fire resistance;
- local resource substitutions;
- route form;
- settlement density.

The underlying climate/terrain/resource truth remains Document-11-owned.

Realm adaptation may additionally require:

- altered physical-law assumptions;
- local matter;
- portal dependency;
- life-support/warding;
- native hazards;
- realm-specific access;
- special construction;
- native settlement logic.

The underlying realm truth remains Document-14-owned.

A realm pack is therefore not merely a biome palette.

---

# v1.0 Pack Governance Contract

Every production pack must be compatible with Set 25 governance.

A pack should carry or reference:

- stable `pack.*` identity;
- version;
- schema compatibility;
- dependencies;
- optional dependencies;
- conflicts/exclusions where required;
- lifecycle status;
- source content hashes;
- migration aliases;
- deterministic resolution priority;
- publication/permission class;
- provenance;
- validation evidence.

20G does not create a parallel mod lifecycle system.

Executable scripting remains outside 20G's data-only composition contract unless another governed system explicitly owns it.

---

# v1.0 Forge Contract

Official pack authoring consumes Set 22 / Blueprint Forge.

Packs reference approved:

- voxel/structure sources;
- modules;
- sockets;
- material roles;
- semantic zones;
- damage/dynamic states;
- thumbnails/previews;
- source versions.

A pack should not copy an entire building just to change:

- wood species;
- roof material;
- trim;
- banner;
- paint;
- weathering;
- decorative module.

Prefer role substitution and modular composition where the functional source remains compatible.

---

# v1.0 Cross-System Interface Matrix

| Pack Concern | Authoritative Owner | 20G Role |
|---|---|---|
| Universal building/service function | 20A–20F | Select/adapt compatible source; never duplicate function. |
| Blueprint/model/source | 22I / Set 22 | Reference approved editable source and modules. |
| Race/ancestry/faction/government/faith | Document 13 | Consume identity/state for composition. |
| Biome/environment | Document 11 | Consume climate/terrain/resource state. |
| Realm/dimension | Document 14 | Consume realm truth/adaptation requirements. |
| Economy/business/trade | Set 27 | Consume economic context for presentation/planner preferences only. |
| Knowledge/belief/social adoption | Set 28 | Consume living social state; pack supplies available expressions. |
| Biology | Set 29 | Consume biological/environment compatibility requirements. |
| Movement/accessibility | Set 30 / Set 26 | Validate compatible access/traversal interfaces. |
| History/events | Document 15 | Consume event/history state for compatible historical layers. |
| Structure damage/occupation | Document 12 | Resolve appearance from authoritative physical state. |
| Settlement planning | Document 19 | Supply weighted source/layout options, not final planner authority. |
| Lifecycle/publication/migration | Set 25 | Consume governed status/version/dependency rules. |

---

# v1.0 Anti-Stereotype and Anti-Homogenisation Rules

Production packs must not encode:

- ancestry = morality;
- ancestry = one culture;
- culture = one government;
- faith = one faction;
- biome = one culture;
- realm = one civilisation;
- technology = inherent biological trait;
- permanent hostility from ancestry alone.

Variation should exist:

- within a culture;
- between regions;
- between social classes/professions;
- between historical periods;
- across factions;
- across settlements;
- across individual buildings.

Recognisability should come from recurring design grammar, not copy-pasted sameness.

---

# v1.0 Additional Diagnostics

| Code | Severity | Meaning |
|---|---|---|
| `20G-UNIVERSAL-DUPLICATE` | Fatal | Pack created a second universal gameplay definition instead of selecting/replacing through a declared contract. |
| `20G-HIDDEN-CAPACITY` | Fatal | Presentation/module granted unregistered gameplay capacity. |
| `20G-IDENTITY-COLLAPSE` | Fatal | Pack hard-bound ancestry, culture, faction, government, faith, economy, biome or realm as the same identity. |
| `20G-SOCIAL-OWNER-VIOLATION` | Fatal | Pack directly rewrote Set-28 knowledge/belief/willingness/social state. |
| `20G-POLITICS-OWNER-VIOLATION` | Fatal | Pack directly created Document-13 political/legal state. |
| `20G-ECON-OWNER-VIOLATION` | Fatal | Pack directly created Set-27 market/business/wealth state. |
| `20G-BIOME-OWNER-VIOLATION` | Fatal | Pack overrode Document-11 environmental truth. |
| `20G-REALM-OWNER-VIOLATION` | Fatal | Pack overrode Document-14 realm truth. |
| `20G-BIOLOGY-OWNER-VIOLATION` | Fatal | Pack bypassed Set-29 biological/environment constraints. |
| `20G-MOVE-OWNER-VIOLATION` | Fatal | Pack invented traversal/access outside Set 30/26. |
| `20G-PACK-LIFECYCLE-BYPASS` | Fatal | Pack bypassed Set-25 publication/version/migration governance. |
| `20G-SOURCE-DUPLICATION` | Error | Pack cloned a source unnecessarily instead of using roles/modules. |
| `20G-POC-LEAK` | Fatal | Production requires retired Forest-Hamlet/POC composition identity. |
| `20G-BLOCKITEM-DUPLICATE` | Fatal | Pack reintroduced a fake duplicate Item for a recoverable Block. |

---

# v1.0 Production Acceptance Addendum

20G v1.0 is accepted when:

- [x] ancestry, culture, faction, government, faith, economy, biome, realm and history remain separate linked identities;
- [x] universal functions remain owned by 20A–20F;
- [x] packs cannot create hidden gameplay capacity;
- [x] functional replacements require explicit compatibility contracts;
- [x] official sources remain Set-22/Blueprint-Forge-owned;
- [x] Set 25 owns lifecycle/publication/migration governance;
- [x] Document 13 owns faction/political/faith state;
- [x] Document 11 owns biome/environment truth;
- [x] Document 14 owns realm truth;
- [x] Set 27 owns economic state;
- [x] Set 28 owns living social/knowledge/belief state;
- [x] Set 29 owns biological compatibility/outcomes;
- [x] Set 30/26 own traversal/maritime execution;
- [x] mixed and hybrid settlements remain supported;
- [x] packs remain deterministic and provenance-carrying;
- [x] POC composition becomes Archived Validation only;
- [x] canonical Block/Item separation remains enforced.

---

# Retained v0.2 Detailed Specification

The complete v0.2 specification follows as the detailed baseline.

# Fantasy Voxel Civilisation Sandbox
## 20G - Culture, Faction, Biome and Realm Building Packs
### Version 0.2 - Forge-Integrated Cultural Composition, Pack Registry and Production Plan

*A controlled composition system for cultural architecture, faction ownership, government and faith modules, biome adaptation, realm construction, dynamic history, hybrid settlements and restricted player styles—creating recognisable civilisations without duplicating the universal building registry or allowing presentation layers to invent gameplay capacity.*

| **Field** | **Locked Direction** |
|---|---|
| **Document Scope** | Defines pack identities, namespaces, manifests, layered resolution, Blueprint Forge authoring, material roles, blueprint pools, modules, cultural and environmental adaptation, functional replacements, signature content, runtime resolution, validation, migration, production targets and the initial planning registry. |
| **Identity Lock** | Ancestry, culture, settlement, faction, government, faith/philosophy, economy, biome, realm and historical state remain separate linked records. No ancestry automatically receives one architecture, morality, government, technology or settlement style. |
| **Universal Registry Rule** | Documents 20A-20F own universal functions and plans. 20G may select compatible Blueprint Forge sources, material-role sets, layout preferences, approved modules and declared functional replacements; it may not create unregistered beds, jobs, production, safety or infrastructure. |
| **Forge Direction** | Official pack source is authored and previewed through the Unified Forge and Blueprint Forge. Packs reference canonical voxel sources, modules, material roles and semantic contracts rather than containing uncontrolled duplicate structures. |
| **Resolution Direction** | Resolve presentation and allowed composition through: universal definition → Blueprint Forge source → culture → regional/subculture → biome → faction/government/faith/economy → realm → history/state → approved settlement/player override → deterministic age/weathering detail. |
| **Player Authoring Direction** | Document 19 may expose restricted building, style-pack and town-pack creation. Player content uses the same data contracts but cannot modify protected gameplay definitions, execute arbitrary code, bypass server authority or publish without the applicable review/permission class. |
| **POC Direction** | Prove the Forest Hamlet composition stack with a neutral foundation, Riverward culture, Temperate Forest/River adaptation, Briarhook faction overlay and light Regional March authority overlay across representative Technical POC and Raid Extension structures. |
| **Realm Direction** | A major realm pack defines physical-law adaptation, arrival and outpost rules, native settlement profiles, local matter, portal dependencies, hazards, ownership and signature projects. Realm packs are not recoloured biome packs. |
| **Data and Mod Direction** | Packs use stable `pack.*` namespaces, versions, schema compatibility, dependencies, content hashes, lifecycle state, migration aliases, deterministic resolution and safe data-only boundaries. Executable content scripting is outside this document. |
| **Balance Direction** | Differences should be visible and meaningful but not strictly superior. Benefits carry trade-offs, requirements, maintenance, terrain dependence, law, specialist or political consequences. |

> **Locked Scope Rule**
>
> **Pack layers create identity, valid adaptation and bounded alternatives—not ancestry stereotypes, a second universal registry or hidden free capacity.** A culture can contain many ancestries, one ancestry can participate in many cultures, factions can cross cultures, and mixed settlements can develop new forms through history and player action.

# Document Purpose

Document 20G defines how universal buildings, facilities, network projects, districts and civilisation-scale plans become recognisable places with cultural identity, political ownership, environmental adaptation and persistent history. It supplies the composition rules that allow one cottage, warehouse, blacksmith, road, watchtower, district or wonder definition to support many official voxel sources and many resolved presentations while retaining one trustworthy functional contract.

Version 0.2 integrates the earlier pack design with the Unified Forge. Blueprint Forge now owns official editable voxel and semantic source. Document 20G owns how approved packs select, resolve, adapt and combine those sources. The runtime receives deterministic resolved products, provenance and compatibility data; it does not infer culture from ancestry or grant service from decorative appearance.

The document also protects production scope. A Riverward village, Emberhold enclave, Briarhook outpost, wetland settlement or Verdant Covenant realm city does not need a hard-coded copy of all 120 universal definitions. Packs resolve material roles, choose compatible source pools, attach approved modules, alter planner preferences and add limited signature content. Full replacement is used only where a society or realm genuinely fulfils a universal capability through a different contract.

# Design Sources and Dependencies

| **Source** | **20G Dependency** |
|---|---|
| **03-06 - Blocks, Items, Recipes and Resources** | Material families, physical properties, cultural goods, construction roles, substitutions, exact costs, realm resources and strategic inputs. |
| **07 - NPC Village System** | Named residents, households, ownership, laws, jobs, projects, migration, mixed populations, reputation, culture memory and simulation LOD. |
| **08-09 - Automation and Magic** | Cultural technology acceptance, labour politics, rune styles, faith practices, wards, portals, realm adaptation and risk. |
| **10 - Creatures and Monsters** | Intelligent faction camps, animal accessibility, ecology adaptation, realm creatures and non-inherent hostility. |
| **11 - Biomes and World Generation** | Climate, terrain, water, resources, settlement suitability, dynamic biome states and world-placement constraints. |
| **12 - Structures** | Structure identity, dynamic states, damage, occupation, restoration, world evidence and placement. |
| **13 - Races, Peoples, Cultures and Factions** | Separate ancestry, culture, faction, government, faith, economy, territory, occupation, diaspora and hybridisation records. |
| **14 - Dimensions** | Realm physical laws, portals, native societies, outposts, local resources, trade, migration and world-state outcomes. |
| **17 - UI/UX** | Culture/faction/realm presentation, knowledge-aware labels, previews, accessibility-safe motifs, content warnings and resolution diagnostics. |
| **19 - Settlement Growth and Restricted Player Blueprint System** | In-world and restricted main-menu creators, player styles, town-pack proposals, cultural acceptance and settlement planning. |
| **20 / 20A-20F / 20H** | Universal functions, seven needs, semantic contracts, pack boundaries, the 120-definition catalogue, milestone groups and production status. |
| **21D - Asset Overrides, Variants and Registry Integration** | Non-destructive variants, override provenance, conflict resolution, registry safety and package boundaries. |
| **22I - Blueprint Forge** | Official building/structure source authoring, material roles, semantic layers, nested modules, inheritance, stages, states and previews. |
| **22J - Unified Forge UI/UX** | Manifest, dependency graph, pack browser, preview matrix, revision comparison, validation and package workflows. |
| **22K - Forge Technical Implementation** | Godot Resources, canonical source/runtime separation, deterministic bake, cache, migration, multiplayer compatibility and CI. |
| **22L - Visual Production and Migration** | Production sequencing, migration of legacy blueprints, pack coverage and visual acceptance. |

# Static Table of Contents

1. Locked 20G Identity  
2. Scope Boundaries and Anti-Stereotype Rules  
3. Source-of-Truth, Identity and Forge Boundaries  
4. Pack Taxonomy, Canonical Namespaces and Lifecycle  
5. Composition Order, Precedence and Conflict Resolution  
6. Blueprint Forge Pack Authoring Workflow  
7. Universal Functions, Adaptations, Replacements and Signature Structures  
8. Material Roles, Palettes, Silhouette and Detail Grammar  
9. Blueprint Pools, Modules, Inheritance and Controlled Variation  
10. Layout, Household, Storage, Roads, Defence and Public Space  
11. Culture, Subculture and Regional Variation  
12. Faction, Government, Faith, Economy, Occupation and Resistance Overlays  
13. Biome and Dynamic-State Adaptation Packs  
14. Realm Building Packs and Interdimensional Settlements  
15. Hybrid, Diaspora and Player-Founded Culture Development  
16. Manifests, Dependencies, Compatibility, Versioning and Load Order  
17. Deterministic Resolution, Runtime Bake, Cache and Fallback  
18. NPC Planner, Project Pools and Cultural Acceptance  
19. Restricted Player Blueprint, Style-Pack and Town-Pack Validation  
20. Damage, Heritage, Conquest, Restoration and Cultural Change  
21. Accessibility, Localisation, Representation and Knowledge Visibility  
22. Multiplayer, Server Content, Security and Future Mod Boundaries  
23. Production Targets, Coverage and Content Budget  
24. Initial Pack Registry Summary  
25. POC and Overworld Culture/Faction Pack Profiles  
26. Additional Culture and Dynamic Overlay Profiles  
27. Biome Adaptation Pack Profiles  
28. Realm Building Pack Profiles  
29. Staged Implementation and Migration Plan  
30. Balancing, Performance and Simulation LOD  
31. Open Questions for Later Lore and Production  
- Appendix A. Pack Definition Field Template  
- Appendix B. Resolved Pack Stack and Blueprint Binding Template  
- Appendix C. Override and Composition Authority Matrix  
- Appendix D. Validation and Diagnostic Catalogue  
- Appendix E. Suggested Godot Resources and Services  
- Appendix F. POC and Alpha Acceptance Checklist  
Appendix G. Initial Production Backlog

# 1. Locked 20G Identity

20G is the architectural identity, ownership, adaptation and historical-composition layer of the settlement suite. It makes settlements readable before the player opens a menu: silhouette, roof form, road treatment, storage practice, public space, defensive posture, signs, banners, machinery, magic, repair language and layered damage reveal who built a place, who controls it, where it stands and how it has changed.

> **Locked Rule**
>
> A pack may change approved presentation, materials, source selection, module selection, layout preferences, planner weights, access/law overlays, compatible functional equivalents and bounded signature content. It may not invent resources, beds, jobs, safety, production, infrastructure or settlement-service capacity without an approved universal definition or module contract.

| **Identity Layer** | **Design Meaning** | **Player-Facing Result** |
|---|---|---|
| **Origin culture** | Shared material and social identity expressed through architecture, work, storage, public space, ritual and history. | A structure retains who built it even after conquest or repair. |
| **Regional/subculture** | Climate, neighbours, local resources, reform and historical experience alter a parent culture. | Two settlements of one culture can look and operate differently. |
| **Faction** | Current ownership, goals, military/logistics needs, symbols and permissions overlay compatible culture content. | Merchant, council, raider, royal or occupation control is visible without erasing origin. |
| **Government/faith/economy** | Authority, property, assembly, sacred practice, labour and trade add compatible modules and preferences. | Civic and religious form can vary inside one culture. |
| **Biome** | Climate, terrain, water, hazard and available matter alter foundations, roofs, routes and utilities. | Buildings belong to their world while retaining culture. |
| **Realm** | Physical laws, portal dependency, local matter, native politics and ecology reshape valid construction. | Dimensions become complete societies rather than palette swaps. |
| **History/state** | Damage, occupation, migration, reform, corruption, ruin and restoration layer over origin. | The player can read change over time. |
| **Approved settlement/player style** | Bounded local or player-authored choices applied through exposed pack fields. | Custom settlements can develop coherent identity without bypassing rules. |
| **Deterministic detail** | Seeded age, wear, clutter and weathering variation. | Repetition is reduced while saves and multiplayer remain stable. |

# 2. Scope Boundaries and Anti-Stereotype Rules

- Architecture follows culture, environment, economy, government, faith, technology and history - not ancestry alone.

- A culture pack can include many ancestries and accessibility profiles. Door size, furniture, routes and work markers must support actual residents.

- A faction overlay does not rewrite the underlying culture unless assimilation, occupation, migration or long-term reform creates a documented transition.

- A biome pack provides functional adaptation, not social identity.

- A realm pack is broader than a biome pack. It can alter physical laws, portals, local society, automation, survival and politics.

- Visual style cannot grant hidden service capacity.

- Signature structures should normally number three to eight for a major culture, fewer for a regional variant, and only enough for a faction to express its purpose.

- Cultural differences may create advantages in familiar environments or practices, but costs and dependencies prevent one pack from becoming universally optimal.

- Faith modules can cross cultures and factions. One culture can support several faiths or secular philosophies.

- Mixed and diaspora settlements preserve minority spaces and can create new shared forms; they are not forced into one dominant palette.

- Hostile camps are faction content. No intelligent ancestry receives an automatic hostile-building pack.

- Players can use any unlocked style in their own builds, subject to knowledge, materials, permissions and protected cultural/realm rules.

- Cultural appropriation, sacred sites and restricted motifs may have in-world law/reputation consequences, but the creative system should clearly explain rules rather than unexpectedly punish experimentation.

# 3. Source-of-Truth, Identity and Forge Boundaries

## 3.1 Authoritative Layer Separation

| **Layer** | **Authority** | **Example** |
|---|---|---|
| Universal capability | Documents 20A-20F and catalogue 20H | `building.residential.small_cottage` |
| Official editable structure | Blueprint Forge source package | `blueprint.leyforge.riverward.small_cottage_a` |
| Reusable detail or functional module | Forge module registry | `module.roof.steep_timber_a`; `module.service.public_springhouse` |
| Pack definition | 20G pack registry | `pack.culture.riverward_frontier` |
| Resolved presentation | Deterministic resolver/bake product | Riverward + forest/river + March overlay + repaired state |
| Construction project | Runtime settlement project record | A named cottage build at a reserved parcel |
| Structure instance | Persistent world record | Origin culture, owner, active pack stack, stage, damage and history |
| Restricted player source | Document 19 creator library | Approved player cottage or settlement style pack |

A universal definition must not reference one culture-specific source as though it were the function itself. A Blueprint Forge source must not silently change need contribution. A pack must not duplicate a universal definition just to change appearance. A runtime instance must preserve both **origin identity** and **current active overlays**.

## 3.2 Identity Is Not One Lookup Key

A settlement does not resolve architecture from ancestry. Relevant records may include:

- Structure origin culture and original builder.
- Current settlement culture or mixed-cultural composition.
- Resident accessibility and body-scale profiles.
- Current faction ownership and law.
- Regional/subculture history.
- Biome and local material availability.
- Realm and physical-law requirements.
- Government, faith and economy modules.
- Occupation, damage, corruption, repair and restoration history.
- Approved settlement or player style overrides.

One ancestry may use several cultures. One culture may include several ancestries. Structures serving quadrupeds, constructs, small humanoids, large humanoids or mixed residents must resolve compatible access, furniture and work modules through declared Entity Forge and semantic-marker profiles rather than stereotypes.

## 3.3 Forge Responsibility

Blueprint Forge authors:

- Canonical voxel composition and Forge asset placements.
- Stable internal element IDs.
- Material roles and default role constraints.
- Semantic markers, zones, sockets and network layers.
- Nested modules and exposed parameters.
- Construction stages and partial-function deltas.
- Upgrade, damage, occupation, corruption and restoration deltas.
- Terrain/world-placement profiles.
- Preview/capture profiles, lifecycle and dependencies.

20G authors:

- Which sources and modules a pack may select.
- How material roles resolve.
- Which layout and project preferences apply.
- Which universal replacements are valid.
- Which signature content belongs to the pack.
- Which fields each layer may override.
- Composition precedence, conflicts, fallback and migration.
- Planner, UI and production metadata.

## 3.4 Restricted Player-Creator Boundary

Document 19 may expose a safe subset of the same source contracts. Restricted player tools can author buildings, exposed style values and approved town packs, but cannot:

- Alter universal IDs or need formulas.
- Replace protected semantic marker definitions.
- Introduce arbitrary executable scripts.
- Override server-disabled packs or protected realm rules.
- Remove required accessibility, structural, fire, pressure, water, corruption or containment constraints.
- Publish official culture claims without the applicable approval workflow.

# 4. Pack Taxonomy, Canonical Namespaces and Lifecycle

## 4.1 Canonical Namespace Families

| **Namespace** | **Responsibility** | **Example** |
|---|---|---|
| `pack.foundation.*` | Neutral fallback, authoring and technical-test coverage. | `pack.foundation.forest_neutral_poc` |
| `pack.culture.*` | Shared cultural identity and architecture. | `pack.culture.riverward_frontier` |
| `pack.region.*` | Regional or subculture variation over a parent. | `pack.region.riverward_northern_march` |
| `pack.faction.*` | Ownership, goals, military/logistics and faction symbols. | `pack.faction.briarhook_raiders` |
| `pack.government.*` | Authority, property, civic form and approval. | `pack.government.council_moot` |
| `pack.faith.*` | Sacred spaces, rites, charity, burial and taboo. | `pack.faith.hearth_and_river` |
| `pack.economy.*` | Labour, market, guild, storage and production preferences. | `pack.economy.frontier_communal_store` |
| `pack.biome.*` | Climate, terrain, water and environmental adaptation. | `pack.biome.temperate_forest_river` |
| `pack.realm.*` | Realm physical law, matter, portals, native settlement and hazards. | `pack.realm.verdant_covenant` |
| `pack.overlay.*` | Dynamic occupation, diaspora, corruption, reform or recovery. | `pack.overlay.occupation_and_conquest` |
| `pack.hybrid.*` | Coherent emergent/hybrid composition templates. | `pack.hybrid.mixed_frontier` |
| `pack.player_style.*` | Restricted player-authored style/settlement packs. | `pack.player_style.<creator>.<name>` |

Legacy `culture_kit.*` and `style_kit.*` identifiers migrate through aliases and must not be emitted by new content.

## 4.2 Pack Types

| **Pack Type** | **Primary Responsibility** | **Typical Content** |
|---|---|---|
| Foundation | Safe fallback and technical proof. | Neutral role sets, source pools, test fixtures. |
| Culture | Shared identity, preferred sources, material grammar and signatures. | Homes, public space, storage, work, civic and ritual patterns. |
| Region/Subculture | Localised variation over a parent culture. | Roof/foundation adaptation, economy, neighbours, local motifs. |
| Faction | Current ownership and operational overlay. | Banners, checkpoints, guard modules, reserves, command spaces. |
| Government | Authority and civic form. | Assembly, permit, record, property and succession modules. |
| Faith/Philosophy | Sacred or philosophical practice. | Ritual, burial, charity, taboo and festival modules. |
| Economy/Labour | Production and ownership customs. | Guild halls, communal stores, caravan modules, automation attitudes. |
| Biome | Environmental adaptation. | Foundation, roof, water, road, hazard and material constraints. |
| Realm | Physical-law and interdimensional adaptation. | Arrival, portal, survival, native material and settlement rules. |
| Dynamic overlay | Temporary or persistent historical state. | Occupation, diaspora, corruption, reconstruction, industrialisation. |
| Hybrid/Emergent | Controlled composition from long-term settlement history. | Combined role sets, accepted motifs, new local signatures. |
| Player style/town pack | Restricted creator content. | Exposed role maps, source pools, decoration and planning preferences. |

## 4.3 Pack Lifecycle

| **Lifecycle** | **Meaning** |
|---|---|
| Concept | Working idea; no canon or production commitment. |
| Draft | Manifest and identity fields exist; dependencies may be incomplete. |
| Review | Representation, function, Forge compatibility and scope are under review. |
| Approved | May enter official production and source assignment. |
| Locked | Stable identity/namespace and compatibility contract; changes require migration. |
| Deprecated | Kept for migration or legacy saves; no new production. |
| Retired/Tombstoned | Cannot be selected, but its ID remains reserved. |

Pack lifecycle is separate from source coverage. An approved culture pack may still have only five production-ready blueprints. Source coverage uses Blockout, Material Roles Ready, Source Pool Ready, Preview Matrix Passed, Runtime Baked, Gameplay Integrated and Shippable statuses.

## 4.4 Working-Concept Status

The initial named cultures and realms in Sections 24-28 are **planning concepts** unless separately locked by the lore documents. Their inclusion protects technical and production requirements; it does not automatically make every name, ancestry association, belief, government or realm detail final canon.

# 5. Composition Order, Precedence and Conflict Resolution

## 5.1 Canonical Resolution Order

1. Universal definition requirements and validator profile.
2. Blueprint-authored defaults and exposed parameters.
3. Primary culture pack.
4. Regional or subculture variation.
5. Biome and climate adaptation.
6. Faction, government, faith or economy overlays.
7. Realm adaptation and physical-law requirements.
8. History, occupation, corruption, damage, repair or restoration state.
9. Approved settlement or restricted player-style override.
10. Deterministic age, weathering, clutter and decorative seed.

## 5.2 Authority Rules

- Universal function and safety constraints always win.
- Realm physical-law requirements override ordinary biome defaults but do not erase culture or ownership.
- Biome layers adapt function and materials; they do not assign morality, government or culture.
- Faction and occupation layers may change access, symbols and operational modules; they do not erase origin history.
- Explicit source-level locks outrank broad pack preferences.
- Restricted player overrides apply only to fields exposed by every higher-priority contract.
- Dynamic damage/repair state targets stable internal element IDs and must not regenerate unrelated structure sections.

## 5.3 Conflict Outcomes

| **Conflict** | **Required Outcome** |
|---|---|
| Two layers select different material for one role | Choose the highest-authority valid candidate; show provenance and rejected constraints. |
| Culture preference violates biome/realm safety | Select a culture-compatible safe substitute or block construction with an exact diagnostic. |
| Faction module conflicts with public access | Apply law/ownership rules and expose alternative public route or fail validation. |
| Player style hides a required marker/module | Reject the override; preserve the last valid source. |
| Required pack dependency is missing | Use declared legacy/foundation fallback only when compatibility policy allows; otherwise block activation. |
| Multiple compatible decorative modules compete | Resolve deterministic weighted choice using stable seed. |
| One module adds a second function | Require a registered module/function contract and capacity-allocation rule; never infer from appearance. |

## 5.4 Provenance

Every resolved field should be inspectable as:

```text
resolved value
← player/settlement override (optional)
← history/state layer
← realm layer
← faction/government/faith/economy layer
← biome layer
← regional layer
← culture layer
← Blueprint Forge default
← universal requirement
```

The Forge and debug UI must show where a result came from, what was overridden and why a candidate was rejected.

# 6. Blueprint Forge Pack Authoring Workflow

## 6.1 Authoring Units

A pack is not merely a folder of textures. An official pack may contain or reference:

- Manifest, lifecycle, dependencies and compatibility policy.
- Material-role sets and physical-property constraints.
- Compatible blueprint source pools by universal family, stage and footprint.
- Nested module pools and exposed parameters.
- Layout, parcel and planner preference profiles.
- Functional replacement contracts.
- Signature building, project or plan definitions.
- Government, faith, economy or faction modules.
- Biome/realm adaptation profiles.
- Preview matrices, capture profiles and regression fixtures.
- Localisation keys, icons, map motifs and accessibility metadata.
- Migration aliases and deprecated-field mappings.

## 6.2 Pack Workspace

The Unified Forge should expose a Pack Workspace with:

1. Manifest and identity panel.
2. Universal coverage browser.
3. Blueprint pool and module assignment.
4. Material-role editor with property validation.
5. Layer precedence and exposed-field controls.
6. Planner/layout preference editor.
7. Preview Matrix.
8. Dependency graph and conflict inspector.
9. Validation and diagnostic panel.
10. Icon/capture studio.
11. Revision comparison and lifecycle approval.
12. Package builder and migration report.

## 6.3 Preview Matrix

A pack must be previewable across representative combinations rather than one ideal screenshot.

| **Axis** | **Minimum Preview Set** |
|---|---|
| Universal family | Home, worksite, storage, civic, defence, route/utility and one large plan where relevant. |
| Footprint/stage | Small and medium; Camp/Hamlet/Village; later pack-specific stages. |
| Biome | Preferred biome, one neutral biome and one challenging biome. |
| State | Complete, under construction, damaged, repaired and occupied/corrupted where supported. |
| Time/weather | Day, night and one relevant weather condition. |
| Residents | At least one mixed body-scale/accessibility test for public or residential packs. |
| Performance | Near view, distant LOD and dense-settlement batch. |
| Missing dependency | Required failure and optional-fallback test. |

## 6.4 Promotion Gate

A pack cannot become Approved or Locked until:

- Required references resolve.
- Universal coverage claims are accurate.
- Material substitutions pass physical constraints.
- Preview Matrix blockers are cleared.
- No ancestry-only lookup or hostile-by-ancestry rule exists.
- Icons and localisation keys exist for player-visible content.
- Runtime bake is deterministic.
- Save/migration fixture loads.
- Multiplayer content hash is stable.
- Human review confirms representation, readability and scope.

# 7. Universal Functions, Adaptations, Replacements and Signature Structures

## 7.1 Adaptation vs Replacement

An adaptation keeps the same universal family and changes its blueprint, materials or modules. A replacement provides the same capability through a culturally distinct building/service profile.

Examples:

- Cottage -> stilt cottage: adaptation.
- Village well -> public spring-house: validated replacement.
- Town hall -> clan moot hall: validated government replacement.
- Road -> canal route: replacement only when route and access contracts are satisfied.
- Shrine -> community hall: not an automatic replacement unless the required Morale/culture services are defined.

## 7.2 Replacement Contract

Every replacement declares:

- Universal capability tags satisfied.
- Capacities and limits.
- Required markers and jobs.
- Inputs, outputs and utilities.
- Access and ownership.
- Upgrade/repair behaviour.
- Planner conditions.
- Biome/realm restrictions.
- Whether one structure satisfies multiple roles and how capacity is divided.
- Player-blueprint validation profile.

## 7.3 Signature Structures

Signature content should:

- Express history, government, faith, economy, magic, realm relationship or a culture-defining problem.

- Add a meaningful service, project, ritual, trade, story or world-state role.

- Reuse universal systems whenever possible.

- Avoid becoming mandatory for every settlement of that culture.

- Have clear earliest stage and rarity.

- Support damaged, occupied, restored and player-adapted forms.

- Remain bounded in production and performance.

# 8. Material Roles, Palettes, Silhouette and Detail Grammar

## 8.1 Core Token Families

- foundation_primary / foundation_wet / foundation_heat / foundation_magic
- wall_primary / wall_secondary / insulation / living_wall
- structural_beam / pillar / brace / cable / root_anchor
- floor_public / floor_private / floor_industrial / floor_wet
- roof_primary / roof_heavy / roof_living / roof_flat / roof_steep
- opening_public / opening_private / shutter / pressure_door / water_gate
- trim_civic / trim_household / trim_sacred / trim_faction
- road_local / road_freight / path_sacred / route_water / route_vertical
- storage_food / storage_bulk / storage_secure / storage_magic
- defence_wall / defence_gate / signal / refuge
- magic_conduit / ward_anchor / ritual_surface / portal_frame
- automation_frame / power_link / maintenance_surface
- furniture_household / furniture_public / furniture_work
- light_basic / light_civic / light_magic / wayfinding
- banner / sign / script / heraldry / occupation_mark
- planting / garden / memorial / festival_slot
- damage_patch / repair_scaffold / heritage_preserve / corruption_seal

## 8.2 Visual Grammar Fields

- dominant silhouette.
- roof pitch and edge language.
- structural rhythm.
- typical height and density.
- entrance hierarchy.
- window/opening ratios.
- colour/tint groups.
- material weathering.
- visible storage customs.
- lighting and night identity.
- signage/script placement.
- banners and territorial cues.
- public vs private ornament.
- machinery/magic visibility.
- repair and age language.
- forbidden or sacred motifs.

## 8.3 Material Substitution

Packs use tags and priorities rather than fixed materials where practical. Substitution can consider:

- local availability.
- structural class.
- climate.
- culture preference.
- quality.
- sacred/prohibited status.
- trade access.
- realm stability.
- player-selected palette.
- repair compatibility.

A substitution cannot lower required structural, fire, pressure, water, corruption or portal safety below the validated profile.

# 9. Blueprint Pools, Modules, Inheritance and Controlled Variation

## 9.1 Blueprint Pools

A pack should select from compatible source pools rather than force one source per definition. Pool filters can include:

- Universal definition/family tags.
- Settlement stage and density.
- Footprint and terrain class.
- Required resident/body-scale profile.
- Biome and realm compatibility.
- Government, faction or faith permissions.
- Available material roles and local resources.
- Construction technology and knowledge.
- Mixed-use or public/private access.
- Performance tier and world-generation suitability.

The resolver chooses deterministically from the valid pool. Selection seed should include world seed, settlement ID, parcel ID and stable pack stack—not runtime frame order.

## 9.2 Nested Modules

Packs may add or substitute modules such as:

- Roof and foundation families.
- Porches, balconies, courtyards and awnings.
- Storage annexes and loading platforms.
- Government, faith or faction rooms.
- Ward, signal, lighting or climate modules.
- Accessibility ramps, large entrances or aquatic access.
- Defensive hoardings, checkpoints and patrol platforms.
- Biome drainage, snow vestibule, pressure lock or storm brace.
- Occupation banners, repair scaffolds or heritage protection.

A module that changes function must reference an approved semantic contract and capacity rule. Purely decorative modules cannot create inventory, service or planner capability.

## 9.3 Inheritance and Deltas

Official source coverage should use inheritance where practical:

- Base universal/source archetype.
- Culture child source.
- Regional material/layout delta.
- Biome adaptation delta.
- Faction/government/faith module set.
- Construction-stage delta.
- Damage/repair/occupation delta.
- Restricted player-compatible child.

Inheritance must preserve stable internal element IDs for unchanged content. Circular dependencies are rejected. A child source may replace a module only through an exposed connector or migration rule.

## 9.4 Variation Budget

Variation is layered:

1. Curated blueprint/source alternatives for silhouette and layout.
2. Pack material-role resolution.
3. Optional module combinations.
4. Deterministic age, wear and clutter.
5. Runtime state such as damage, season or occupation.

Random block-by-block decoration is not a substitute for coherent architecture. High-value structures receive curated alternatives; lower-frequency content may rely more heavily on roles, modules and deterministic detail.

# 10. Layout, Household, Storage, Roads, Defence and Public Space

Culture packs may influence:

- household size and privacy compatibility.
- communal vs private cooking/storage.
- shop-house and mixed-use preference.
- street frontage and courtyard use.
- settlement centre type.
- ritual/public-space requirements.
- road hierarchy and transport mode.
- defence posture and gate symbolism.
- market frequency and temporary space.
- treatment of animals, machines and golems.
- water access customs.
- sanitation placement.
- burial/memorial practice.
- education and apprenticeship location.
- visitor hospitality.
- seasonal/mobile construction.
- vertical, underground, floating or aquatic layout.
- heritage and protected-site rules.

These preferences change planner scores and compatible blueprint pools, not direct need values.

# 11. Culture, Subculture and Regional Variation

A culture pack stores a stable shared identity, while regional variants can override:

- available material priority.
- roof/foundation adaptation.
- local economy and exports.
- neighbouring influence.
- government and faith prevalence.
- threat response.
- signature structures.
- language/signage.
- automation/magic adoption.
- density and road form.
- festivals and temporary structures.
- historic damage and migration.

A regional pack should generally override 10-30 percent of a parent culture rather than duplicating it.

# 12. Faction, Government, Faith, Economy, Occupation and Resistance Overlays

Faction overlays can add:

- banners, uniforms and signs.
- controlled access.
- guard/patrol markers.
- storage reservations.
- customs/tax points.
- command spaces.
- faction-specific workshop or ritual modules.
- propaganda, memorial or resistance marks.
- temporary fortification.
- project priorities.
- law and permission changes.

Government and faith modules remain composable. A Riverward settlement could be a council village, monastic estate, royal charter town or occupied march post while retaining Riverward culture.

# 13. Biome and Dynamic-State Adaptation Packs

Biome adaptations modify:

- foundations and terrain work.
- roof, drainage and weather.
- heating/cooling and insulation.
- water collection and sanitation.
- road/bridge/transport form.
- food and storage.
- fire, flood, storm and hazard.
- local material substitutions.
- farm/livestock suitability.
- maintenance and weathering.
- visibility/wayfinding.
- biome restoration and environmental impact.

Dynamic state packs such as corruption, blessing, war damage, refugee influx or industrialisation can be added and later removed or transformed while preserving history.

# 14. Realm Building Packs and Interdimensional Settlements

Every major realm pack should define:

- physical laws affecting building.
- arrival sanctuary and portal complex.
- local foundation and shelter rules.
- local common construction matter.
- strategic, magical and hazardous materials.
- native settlement families.
- outpost dependency and imported supplies.
- local food/water/air/rest requirements.
- automation/power adaptation.
- transport and mapping.
- native ownership and sacred/protected sites.
- interdimensional trade/customs/quarantine.
- signature structures and restoration projects.
- damage, instability and emergency return.
- Overworld adaptation modules for exported realm materials.

Realm settlements use the same seven needs, but calculations and valid solutions adapt to realm rules.

# 15. Hybrid, Diaspora and Player-Founded Culture Development

Emergent settlement culture is influenced by:

- resident cultures and household continuity.
- who holds authority and property.
- architecture actually built and used.
- economy and labour.
- accepted faiths/philosophies.
- languages and signs.
- festivals and memorials.
- player laws and choices.
- major threats, victories and disasters.
- migration, intermarriage and generations.
- realm contact and imported materials.
- occupation and liberation.
- repeated player-blueprint adoption.

The system should record cultural change as history. It should not instantly recalculate identity from population percentages.

# 16. Manifests, Dependencies, Compatibility, Versioning and Load Order

## 16.1 Required Manifest Fields

Every pack manifest records:

- Stable `pack_id`, namespace, display/localisation keys and pack type.
- Version, schema version and lifecycle.
- Parent packs and composition role.
- Required dependencies and optional integrations.
- Compatible game/content versions.
- Universal families and sources touched.
- Blueprint, module, role-set, icon and localisation references.
- Allowed override fields and exposed player fields.
- Priority, conflict policy and fallback.
- Content hash and dependency compatibility tokens.
- Migration aliases and deprecated references.
- Server permission and publishing class.
- Test fixtures and last approved Forge/bake versions.

## 16.2 Dependency Types

| **Dependency** | **Behaviour** |
|---|---|
| Required hard dependency | Missing content blocks pack approval and normal runtime use. |
| Optional integration | Missing content disables only the integration branch. |
| Parent pack | Supplies inherited fields; cycles are forbidden. |
| Compatible replacement | May fulfil a declared capability or source family. |
| Asset/module dependency | Triggers targeted validation and rebake when changed. |
| Realm/biome dependency | Activates only under matching environment and compatibility. |
| Player/server dependency | Requires server permission, ownership or content handshake. |

## 16.3 Load and Resolution Policy

Load order is not an unrestricted “last file wins” system. Resolution is by typed layer, explicit priority and field-level authority. Two culture packs cannot both be primary unless the settlement uses a declared hybrid composer. Two faction overlays may coexist only when their fields and ownership scopes do not conflict. Dynamic overlays are ordered by state authority and timestamp where relevant.

## 16.4 Versioning and Migration

- IDs are migrated, never reused for unrelated content.
- Changed field semantics require schema migration.
- Changed source compatibility requires a source/instance migration profile.
- Legacy `culture_kit.*` and `style_kit.*` IDs remain aliases or tombstones.
- Pack removal must not erase origin history from existing structures.
- Approved official pack updates provide deterministic migration and regression fixtures.
- Player/mod pack updates may require opt-in world migration or retaining the previous package.

# 17. Deterministic Resolution, Runtime Bake, Cache and Fallback

## 17.1 Resolver Input

```text
universal definition ID
Blueprint Forge source ID or source pool
origin culture and regional IDs
biome and realm IDs
faction/government/faith/economy IDs
history/state overlay IDs
settlement/player style ID (optional)
world/settlement/parcel deterministic seeds
content compatibility tokens
```

## 17.2 Resolved Output

A resolved structure presentation should contain:

- Selected source blueprint and revision token.
- Resolved material-role map.
- Selected modules and parameters.
- Construction-stage and state-delta bindings.
- Accessibility/body-scale compatibility result.
- Icon/capture profile.
- Provenance for every overridden field.
- Dependency/content hash.
- Deterministic selection seed.
- Validation diagnostics and fallback decisions.
- Runtime compatibility token used by the placed structure instance.

## 17.3 Bake and Cache

Common official combinations can be pre-baked. Rare combinations resolve on demand and enter a content-addressed cache. Cache keys include source revision, pack versions, material-role map, modules, state profile, target runtime tier and bake-tool version. A changed texture, block, module or pack invalidates only dependent products.

## 17.4 Save Compatibility

A structure instance stores origin and active pack IDs plus a compatibility token and persistent element/state deltas. It should not rely only on the current settlement pack. When an approved pack changes:

1. Resolve migration aliases.
2. Compare compatibility token.
3. Rebase persistent deltas onto the new source when safe.
4. Preserve last approved resolved snapshot or declared fallback when required content is missing.
5. Report unresolved conflicts rather than silently deleting player work.

## 17.5 Fallback Order

1. Exact required official pack/source.
2. Declared compatible parent or replacement.
3. Pack-specific legacy fallback.
4. Culture-neutral foundation compatible with the universal definition.
5. Safe placeholder only for editor recovery—not normal gameplay approval.

Fallback never grants unvalidated function. Missing required physical or semantic content leaves the structure disabled or blocks construction with an exact diagnostic.

# 18. NPC Planner, Project Pools and Cultural Acceptance

The settlement planner uses 20G to filter and weight valid projects; it does not invent buildings from culture labels.

## 18.1 Planner Inputs

- Universal need/capability demand.
- Resident cultures and settlement history.
- Current faction, government, faith and economy policy.
- Biome, realm, terrain and available materials.
- Approved source coverage and construction knowledge.
- Accessibility and household compatibility.
- Ownership, protected sites and heritage law.
- Existing style coherence and local repair practice.
- Threat, trade, migration and story state.
- Player proposal, reputation and authority.
- Maintenance, specialist and logistics burden.

## 18.2 Cultural Acceptance States

| **State** | **Meaning** |
|---|---|
| Native/preferred | Strong planner and social fit. |
| Common | Normal accepted content. |
| Acceptable | Functionally/culturally permitted with no special support. |
| Foreign but permitted | Allowed; may need imported material, knowledge or permission. |
| Restricted | Requires authority, law, faction or protected-content permission. |
| Sacred/protected | May be built/restored only under declared cultural or legal rules. |
| Forbidden | Current law or realm contract blocks it. |
| Contested | Residents or factions disagree; creates politics/events. |
| Occupation-imposed | Operational under external authority; origin and resistance remain recorded. |
| Emerging hybrid | Repeated local use is forming a new coherent pattern. |
| Player-private | Allowed on private land but not eligible for public/NPC project pools. |

## 18.3 Project Selection

A pack can alter project weights, source pools and layout preference but cannot change the universal required/optional/conditional class without an explicit gameplay rule. A Riverward culture may prefer shared stores and flood-safe paths; a mobile pastoral culture may prefer herdstead clusters and seasonal structures. Both still satisfy the same seven needs through real buildings and resources.

## 18.4 Mixed Settlements

Mixed settlements should not be flattened into one dominant palette. The planner may create:

- Structures retaining individual origin cultures.
- Shared public buildings using negotiated or hybrid modules.
- Minority or diaspora spaces.
- Faction-owned structures overlaying local culture.
- New hybrid patterns after sustained social and architectural history.

# 19. Restricted Player Blueprint, Style-Pack and Town-Pack Validation

## 19.1 Allowed Creator Products

Subject to world/server permissions, Document 19 may allow players to author:

- A building compatible with an existing pack.
- A palette/material-role set using exposed roles.
- A style pack for selected families.
- A road, furniture, sign or decoration module set.
- A cluster or district style.
- A complete player-town pack.
- A realm-adapted outpost pack.
- A hybrid/emergent culture proposal.

## 19.2 Validation Layers

| **Layer** | **Blocking Checks** |
|---|---|
| Identity and namespace | Valid creator namespace, version, ownership and permission class. |
| Function | Universal validator, markers, zones, sockets, networks and capacity allocation remain valid. |
| Materials | Every role resolves to permitted blocks/components with required properties and exact costs. |
| Dependencies | Required sources/modules/packs exist and no cycles occur. |
| Accessibility | Entrances, routes, furniture and work positions support declared resident profiles. |
| Culture/representation | Protected/sacred motifs, claims and content rules are respected. |
| Performance | Bounds, voxel count, modules, materials, state deltas and capture budgets pass. |
| Safety/security | No executable code, unsafe path reference, hidden forbidden content or server bypass. |
| Localisation/UI | Player-visible names, icons, warnings and colour-independent cues exist. |
| Migration | Stable IDs, aliases, hashes and save/reload fixture pass. |

## 19.3 Public Versus Private Use

A source may be valid for private player construction but not eligible for NPC/public project pools. Public eligibility can require cultural acceptance, government approval, service access, stronger performance budgets, moderation and long-term migration support.

## 19.4 Promotion to Official Content

Player content becomes official only through explicit review and namespace transfer. Promotion preserves creator attribution where policy allows, records a migration path and reruns full Forge, representation, regression and multiplayer compatibility gates.

# 20. Damage, Heritage, Conquest, Restoration and Cultural Change

A structure runtime record preserves:

- Origin culture and builder.
- Blueprint source and resolved pack stack at construction.
- Later owners, factions and governments.
- Applied biome and realm adaptations.
- Occupation, diaspora and reform overlays.
- Damage, repair, corruption, cleansing and restoration history.
- Protected heritage elements.
- Current active presentation and permitted player modifications.
- Accepted hybrid identity and relevant events.

## 20.1 Damage and Repair

Damage state layers over origin and should expose culture-appropriate repair material and technique. Emergency patching may use foreign or neutral materials while preserving a later restoration option. Repair never rewrites who originally built the structure.

## 20.2 Conquest and Occupation

Occupation may add banners, checkpoints, requisition storage, command modules, law signs and temporary fortification. It may alter ownership and access but cannot instantly assimilate residents or replace every cultural source. Long occupation can create reform or hybridisation only through recorded history.

## 20.3 Heritage

Heritage rules can mark specific elements, modules or sites as protected. Demolition, relocation, salvage or adaptation may require authority, consultation or reputation. The game should clearly show restrictions before construction begins.

## 20.4 Restoration Choices

- Faithful reconstruction.
- Practical repair preserving visible history.
- Adaptive reuse.
- Removal of occupation layers.
- Hybrid renewal.
- Cleansing or stabilisation.
- Deliberate ruin/memorial preservation.

Each option retains provenance and may affect culture, faction, Morale, legitimacy, quests and material demand.

# 21. Accessibility, Localisation, Representation and Knowledge Visibility

## 21.1 Accessibility

Packs must not rely on colour alone. Identity should combine silhouette, material pattern, signage shape, lighting rhythm, motifs and spatial organisation. Public buildings must support declared resident/body-scale profiles through validated entrances, routes, interaction heights and evacuation paths.

## 21.2 Localisation

Pack IDs remain stable and language-neutral. Player-visible text uses localisation keys for:

- Pack and structure names.
- Material-role descriptions.
- Culture/faction/realm tooltips.
- Laws, protected motifs and acceptance states.
- Diagnostics and missing dependencies.
- Historical provenance and restoration choices.

Scripts, signs and heraldry are content assets; readable UI equivalents remain available.

## 21.3 Representation Rules

- No intelligent ancestry is inherently hostile, primitive, industrial, magical, nomadic or urban.
- Cultural identity can be diverse, contested and internally varied.
- Mobile, pastoral, aquatic, subterranean and constructed societies are not treated as lower stages.
- Faith and government are composable and may vary within a culture.
- Living, spiritual or constructed materials that are persons or habitats require explicit ownership/consent rules.
- Hostile camps belong to factions and events, not ancestry categories.
- Candidate lore is labelled as such until approved.

## 21.4 Knowledge Visibility

The player may initially see a structure as “foreign hall” or “unknown warded store.” Names, motifs, protected rules and functions become more precise through observation, dialogue, books, faction knowledge, exploration or creative permissions. Lack of knowledge should hide labels, not silently invalidate interaction.

# 22. Multiplayer, Server Content, Security and Future Mod Boundaries

## 22.1 Content Handshake

Multiplayer clients must agree on gameplay-critical pack manifests, universal contracts, source compatibility tokens and content hashes. Cosmetic-only differences are allowed only when they cannot change collision, navigation, markers, concealment, readability or competitive information.

## 22.2 Server Authority

Servers can permit, restrict or lock:

- Official pack availability.
- Player style and town packs.
- Public/NPC project eligibility.
- Protected cultural/realm content.
- Download and migration policy.
- Moderation and symbol rules.
- Maximum pack/source/performance budgets.

Existing world structures retain migration-safe records even if a server disables new use of a pack.

## 22.3 Data-Only Security Boundary

20G packs contain declarative data and references. They do not execute arbitrary runtime code. Future scripted mods require a separate security model, permission system and sandbox and must not be smuggled into pack expressions, localisation or source metadata.

## 22.4 Ownership and Distribution

Player and external packs record creator, licence/distribution class, dependency rights and attribution. Official packaging should avoid embedding unlicensed dependencies. Removed or unavailable external packs use declared migration/fallback policy and preserve world history.

# 23. Production Targets, Coverage and Content Budget

| **Content Level** | **Suggested Target** | **Purpose** |
|---|---|---|
| POC | 1 neutral foundation, 1 culture pack, 1 hostile faction overlay, 1 biome adaptation, 1 light regional overlay. | Prove composition and readability without delaying core systems. |
| Early Alpha | 3-5 culture packs, 4-6 biome adaptations, 3-5 faction/government overlays. | Prove differentiated villages and mixed populations. |
| Realm Alpha | Verdant Covenant realm pack plus arrival/outpost/portal content. | Prove realm-specific construction and politics. |
| Beta | 8-12 culture families, 8-10 biome/dynamic packs, major faction overlays and hybrid composer. | Support broad world diversity. |
| Full Game | Curated pack library tied to regions, cultures, factions and realms; controlled expansion through data packs. | Long-term replayability without unbounded duplication. |

A major culture should not automatically require 120 new blueprints. A first production pack can target 12-20 high-value official blueprints, palette coverage for universal families, 3-8 signature structures and several district preferences.

> **Planning-Concept Note**
>
> The registry below is a technical and production planning set. Riverward, Briarhook and the Forest Hamlet foundation are current slice identities; all other culture, faction and realm names remain candidate concepts until the lore and faction documents explicitly approve them. Their mechanics and content requirements may survive even if names or presentation change.

# 24. Initial Pack Registry Summary

| **Pack ID** | **Name** | **Type** | **Scope** | **Status** |
|---|---|---|---|---|
| pack.foundation.forest_neutral_poc | Culture-Neutral Forest Settlement Foundation Kit | Foundation / POC authoring kit | Camp -> Village; Technical POC / Extended Slice | Technical POC |
| pack.culture.riverward_frontier | Riverward Frontier Folk Building Pack | Culture pack | Camp -> Town; Technical POC / Extended Slice; Alpha expansion | Technical POC |
| pack.faction.briarhook_raiders | Briarhook Raider Clan Structure Overlay | Faction overlay | Camp / raider outpost; Raid Extension | Raid Extension |
| pack.faction.regional_march_authority | Regional March Authority Civic and Road Overlay | Faction/government overlay | Village -> Capital; Raid Reference / Alpha | Raid Reference |
| pack.biome.temperate_forest_river | Temperate Forest and River Biome Adaptation Pack | Biome adaptation | Overworld natural biome; Technical POC / Extended Slice | Technical POC |
| pack.culture.emberhold_rune_holds | Emberhold Rune-Hold Building Pack | Culture pack | Hamlet -> Capital; Alpha candidate | Alpha Candidate |
| pack.culture.moonroot_courts | Moonroot Court Building Pack | Culture pack | Hamlet -> Magical Metropolis; Beta candidate | Beta Candidate |
| pack.culture.goblin_tinker_communes | Goblin Tinker Commune Building Pack | Culture pack | Camp -> City; Alpha/Beta candidate | Alpha/Beta Candidate |
| pack.culture.orcish_pastoral_confederacy | Orcish Pastoral Confederacy Building Pack | Culture pack | Camp -> Capital; Alpha/Beta candidate | Alpha/Beta Candidate |
| pack.culture.aquatic_river_clans | Aquatic River-Clan Building Pack | Culture pack | Hamlet -> City; Beta candidate | Beta Candidate |
| pack.culture.awakened_construct_civic | Awakened Construct Civic Building Pack | Culture/personhood pack | Outpost -> City; Final candidate | Final Candidate |
| pack.hybrid.mixed_frontier | Mixed Frontier Hybrid Culture Composer | Emergent/hybrid culture template | Hamlet -> Capital; System pack | System / Beta |
| pack.overlay.occupation_and_conquest | Occupation and Conquest Structure Overlay | Dynamic faction-state overlay | Any settlement stage; System pack | System / Beta |
| pack.overlay.refugee_diaspora | Refugee and Diaspora Settlement Overlay | Migration/history overlay | Camp -> City; System pack | System / Beta |
| pack.biome.dryland_desert | Dryland and Desert Building Adaptation Pack | Biome adaptation | Overworld natural biome; Alpha | Alpha |
| pack.biome.frost_tundra | Frost, Snowfield and Tundra Building Adaptation Pack | Biome adaptation | Overworld natural biome; Alpha | Alpha |
| pack.biome.swamp_wetland | Swamp and Wetland Building Adaptation Pack | Biome adaptation | Overworld natural biome; Alpha | Alpha |
| pack.biome.mountain_underground | Mountain and Underground Building Adaptation Pack | Biome adaptation | Overworld/cave biome; Alpha | Alpha |
| pack.biome.coast_island | Coast and Island Building Adaptation Pack | Biome adaptation | Overworld natural biome; Alpha/Beta | Alpha/Beta |
| pack.biome.leyline_magical | Leyline and High-Mana Biome Adaptation Pack | Magical biome adaptation | Overworld/realm magical biome; Beta | Beta |
| pack.biome.corrupted_blighted | Corrupted and Blighted Settlement Adaptation Pack | Dynamic biome/state adaptation | Any stage; Beta | Beta |
| pack.realm.verdant_covenant | Verdant Covenant Realm Building Pack | Major realm pack | First realm candidate; Alpha | Alpha Candidate |
| pack.realm.ancestral_veil | Ancestral Veil Realm Building Pack | Major spirit-realm pack | Future major | Future Major |
| pack.realm.aetheric_reach | Aetheric Reach Realm Building Pack | Major sky-realm pack | Future major | Future Major |
| pack.realm.impossible_deep | Impossible Deep Realm Building Pack | Major deep/pressure-realm pack | Future major | Future Major |
| pack.realm.world_engine | World-Engine Realm Building Pack | Artificial major-realm pack | Late game | Late Game |
| pack.realm.ashen_lower | Ashen Lower Realms Building Pack | Infernal/heat realm-cluster pack | Late game | Late Game |
| pack.realm.void_between | Void Between Building Pack | Interstitial realm pack | Late/endgame | Late/Endgame |
| pack.realm.created_pocket_template | Created Pocket Realm Building Template | Pocket-realm family pack | Late utility | Late Utility |

> **Profile Interpretation Rule**
>
> Each profile describes identity, source selection, material roles, planner preference, adaptation and signature content. It does not imply that every listed signature is committed to final production or that the pack remakes every universal definition. Official source coverage is tracked separately in Blueprint Forge and 20H.

# 25. POC and Overworld Culture/Faction Pack Profiles

### Culture-Neutral Forest Settlement Foundation Kit

`pack.foundation.forest_neutral_poc`

| **Field** | **Pack Direction** |
|---|---|
| **Pack type and scope** | Foundation / POC authoring kit - Camp -> Village; Technical POC |
| **Identity** | A restrained temperate-forest kit used to prove universal buildings, material roles, terrain adaptation and NPC construction before strong culture-specific content is added. |
| **Visual and material layers** | Oak/softwood structural tokens, fieldstone foundations, thatch or timber-shingle roofs, dirt paths, simple timber furniture, neutral signs, warm lanterns, modular fences, scaffolds and repair states. |
| **Functional/project direction** | Supplies official POC blueprints for the protected Forest Hamlet roster across the Core, Raid and Extended delivery groups without claiming that every culture builds the same way. |
| **Universal replacements or adaptations** | No functional replacements. It selects simple universal blueprint archetypes and provides fallback material substitutions when local resources vary. |
| **Signature content** | Forest campfire circle, builder yard, compact storehouse, timber watchtower and river-crossing details used only as POC examples. |
| **Settlement layout grammar** | Loose village centre, farms and resource sites connected by organic paths; structures orient toward terrain, roads, water and shared storage rather than a strict grid. |
| **Material families** | any_local_log, any_local_plank, fieldstone, thatch, clay brick, simple iron fittings, glass where unlocked. |
| **Critical rules and consequences** | Must remain low-cost, readable and easy to recolour. It cannot become the permanent default for all cultures. |
| **NPC planner priorities** | Used when no authored culture pack is available, in creative testing, or for the POC Forest Hamlet seed. |
| **Restricted player-source support** | Players may copy, edit, replace and export every foundation blueprint. Validation is functional rather than stylistic. |
| **Planning status** | Technical POC |

### Riverward Frontier Folk Building Pack

`pack.culture.riverward_frontier`

| **Field** | **Pack Direction** |
|---|---|
| **Pack type and scope** | Culture pack - Camp -> Town; Technical POC / Extended Slice; Alpha expansion |
| **Identity** | A mixed frontier culture shaped by river farming, timber work, communal storage, practical rune magic, seasonal floods and defensive cooperation. |
| **Visual and material layers** | Raised fieldstone footings, heavy timber frames, steep weatherproof roofs, river-blue and hearth-amber textiles, carved current motifs, communal stores, visible repair timber and practical ward marks. |
| **Functional/project direction** | Prefers shared warehouses, farmstead clusters, flood-safe paths, watchtowers, community halls, small shrines, carpenter/mason work and practical mage huts. |
| **Universal replacements or adaptations** | Village Well may become a covered spring-house or pump shelter; Small Shrine may become a Hearth and River Hall; generic watchtower uses a riverward signal-and-ward variant. |
| **Signature content** | Riverward Long Store, Floodgate Granary, Hearth-and-River Hall, Fordwatch Tower, Seasonal Ferry Shelter and later March Bridgehouse. |
| **Settlement layout grammar** | Linear or crescent settlements following river terraces and roads, with farms on safer flats, stores above flood level and defence watching crossings. |
| **Material families** | local timber, river stone, clay brick, reed/thatch, iron straps, blue ceramic, woven river fibre and modest mana crystal/rune components. |
| **Critical rules and consequences** | Communal storage and public access are culturally preferred, but private households and player property remain supported. Architecture must work for mixed ancestries. |
| **NPC planner priorities** | Scores water access, flood risk, communal capacity, bridge/ford control, food storage and practical defence highly. |
| **Restricted player-source support** | Approved player blueprints may join the culture library when they use compatible functional markers and at least a selected Riverward style token set. |
| **Planning status** | Technical POC |

### Briarhook Raider Clan Structure Overlay

`pack.faction.briarhook_raiders`

| **Field** | **Pack Direction** |
|---|---|
| **Pack type and scope** | Faction overlay - Camp / raider outpost; Technical POC |
| **Identity** | A specific goblin raider clan driven by scarcity, status, stolen supply and local grievance; it is not a universal goblin culture. |
| **Visual and material layers** | Salvaged timber and scrap, hooked thorn motifs, mismatched banners, stolen crates, smoke, rope bridges, concealed exits, traps, lookout perches and visibly repurposed foreign materials. |
| **Functional/project direction** | Adds raid staging, stolen-goods storage, patrol routes, surrender points, prisoner/negotiation space, escape paths and leader status markers to compatible camp and outpost blueprints. |
| **Universal replacements or adaptations** | Neutral camp store becomes a guarded loot cage; meeting shelter becomes a raid planning canopy; watch platform becomes a hooked lookout; paths may use crawl gaps and ambush sockets. |
| **Signature content** | Hookpost Lookout, Stolen Stores Pen, Captain's Scrap Hall, Thorn Gate, Hidden Ravine Exit and Signal-Smoke Rack. |
| **Settlement layout grammar** | Defensible irregular camp near raid approaches, caves or forest edges, with layered escape routes and no assumption of permanent urban growth. |
| **Material families** | stolen local materials, scrap metal, hide, rope, thorn blocks, crude clay, faction banners and recovered machine/magic pieces. |
| **Critical rules and consequences** | Hostility, ownership and crime come from faction state. Goblin ancestry does not automatically receive this overlay. |
| **NPC planner priorities** | Faction AI prioritises concealment, stolen-stock capacity, raid route, escape, morale and leader defence over comfort or civic services. |
| **Restricted player-source support** | Captured structures may be dismantled, cleansed, negotiated over or converted. Player use requires ownership transfer and trap validation. |
| **Planning status** | Raid Extension |

### Regional March Authority Civic and Road Overlay

`pack.faction.regional_march_authority`

| **Field** | **Pack Direction** |
|---|---|
| **Pack type and scope** | Faction/government overlay - Village -> Capital; Raid Reference / Alpha |
| **Identity** | A larger frontier authority visible through road markers, tax seals, guard posts, bridge control and administrative obligations without defining all local culture. |
| **Visual and material layers** | Standardised road stones, official signposts, boundary posts, inspection seals, guard colours, document boards, bridge plaques and fortified customs details. |
| **Functional/project direction** | Adds toll/customs, tax record, patrol, messenger, road ownership, regional defence and permit markers to universal buildings. |
| **Universal replacements or adaptations** | Village Hall can gain a March Clerk Annex; bridgehouse can gain toll/customs service; gate may use official inspection lanes; warehouse may reserve levy stock. |
| **Signature content** | March Roadhouse, Bridge Clerk Office, Border Beacon, Levy Store and Regional Muster Yard. |
| **Settlement layout grammar** | Follows strategic roads, borders and crossings rather than replacing local settlement layout. |
| **Material families** | Durable local stone, standard iron fittings, official banners, stamped timber signs and archive materials. |
| **Critical rules and consequences** | Overlay can coexist with Riverward or other cultures. Occupation, reform or independence can remove or alter it while leaving physical evidence. |
| **NPC planner priorities** | Regional faction prefers roads, signals, forts, customs and reserve stores according to threat and tax/trade policy. |
| **Restricted player-source support** | Player settlements may negotiate charters, accept road funding, reject authority or capture facilities with reputation and legal consequences. |
| **Planning status** | Raid Reference |

### Temperate Forest and River Biome Adaptation Pack

`pack.biome.temperate_forest_river`

| **Field** | **Pack Direction** |
|---|---|
| **Pack type and scope** | Biome adaptation - Overworld natural biome; Technical POC |
| **Identity** | Adapts universal and cultural buildings to wooded river valleys with rain, soil moisture, seasonal flooding, tree roots and readily available timber/stone. |
| **Visual and material layers** | Raised foundations, drainage ditches, moss/weathering variants, steep roofs, boardwalks, river landings, retaining walls and tree-preserving parcel rules. |
| **Functional/project direction** | Adjusts foundation, roof, water, road, bridge, fire and storage validation without adding culture identity by itself. |
| **Universal replacements or adaptations** | Dirt path may become boardwalk in wet ground; cellar may be raised or waterproofed; well may use springhouse; farm plots use terrace or floodplain variants. |
| **Signature content** | No culture signature structures. Biome-only landmarks include flood markers, timber culverts and riverbank retaining kits. |
| **Settlement layout grammar** | Follows contour, river terraces and tree clearings; avoids needless forest removal and preserves route drainage. |
| **Material families** | local wood families, fieldstone, clay, reeds, bark, moss variants and weather-resistant fittings. |
| **Critical rules and consequences** | Biome adaptations never grant culture membership, laws or faction ownership. |
| **NPC planner priorities** | Scores flood level, river access, drainage, firebreaks, root conflict, bridge need and wet-season travel. |
| **Restricted player-source support** | In-world validator offers automatic stilts, retaining walls, drainage or boardwalk suggestions. |
| **Planning status** | Technical POC |

# 26. Additional Culture and Dynamic Overlay Profiles

### Emberhold Rune-Hold Building Pack

`pack.culture.emberhold_rune_holds`

| **Field** | **Pack Direction** |
|---|---|
| **Pack type and scope** | Culture pack - Hamlet -> Capital; Alpha candidate |
| **Identity** | A dwarven-associated but multi-ancestry hold culture built around stone craft, ancestor records, forge communes, deep roads and durable rune infrastructure. |
| **Visual and material layers** | Massive stone silhouettes, carved structural ribs, vaulted halls, narrow exterior openings, layered interior courts, hold-runes, heat channels, rail/cart sockets and highly visible maintenance access. |
| **Functional/project direction** | Prefers underground residences, communal halls, deep warehouses, forge districts, ancestor archives, pressure-safe utilities, gate-forts and rune relays. |
| **Universal replacements or adaptations** | Farmstead can become fungus terrace or cavern livestock court; well becomes cistern or deep pump; watchtower becomes gate-watch or shaft beacon; cemetery becomes ancestor archive/crypt according to belief. |
| **Signature content** | Holdgate, Ancestor Ledger Hall, Resonance Forge, Deep Cistern, Ventilation Spire, Cart Exchange and Mountain Crown Citadel. |
| **Settlement layout grammar** | Vertical cavern districts around shafts, halls and freight routes with strong separation of smoke, water, public and restricted depths. |
| **Material families** | dressed stone, deepstone, basalt, metal beams, glass/crystal light, rune plates, heat-resistant brick and local surface materials where used. |
| **Critical rules and consequences** | Dwarf ancestry is not required. Surface Emberhold enclaves use the same social/material identity with adapted forms. |
| **NPC planner priorities** | Prioritises durability, archives, fire/ventilation, freight, redundancy and long-term repair over rapid cheap expansion. |
| **Restricted player-source support** | Custom holds may be hand-carved or blueprint-built; validator supports embedded terrain volumes and protected structural voids. |
| **Planning status** | Alpha Candidate |

### Moonroot Court Building Pack

`pack.culture.moonroot_courts`

| **Field** | **Pack Direction** |
|---|---|
| **Pack type and scope** | Culture pack - Hamlet -> Magical Metropolis; Beta candidate |
| **Identity** | A fae-linked culture of living architecture, negotiated growth, moonlit public courts, memory gardens and seasonal civic change. |
| **Visual and material layers** | Living wood, root arches, translucent leaf/glamour surfaces, curved silhouettes, moon pools, suspended walkways, seasonal ornament slots and softly pulsing mana lines. |
| **Functional/project direction** | Prefers grove housing, living storehouses, open courts, ritual gardens, nature-compatible workshops, warded paths and seasonal market/festival spaces. |
| **Universal replacements or adaptations** | Warehouse may be a living hollow with negotiated storage; walls may become thorn/ward hedges; roads may use root paths; university may become a memory grove; palace may become a seasonal court. |
| **Signature content** | Moonroot Court, Oathbough Hall, Memory Orchard, Living Archive, Seasonal Gate, Dreaming Bridge and Crowned World-Tree Sanctuary. |
| **Settlement layout grammar** | Organic ring, spiral and canopy plans that preserve living terrain and allow seasonal expansion/contraction. |
| **Material families** | living wood, fae seed, glamour crystal, seasonal resin, woven vine, moonstone and imported mundane materials where consent/adaptation allows. |
| **Critical rules and consequences** | Living materials can be persons, habitats or sacred assets; harvesting and modification require culture/law/realm permissions. |
| **NPC planner priorities** | Scores living-terrain health, promise law, seasonal access, ritual space, canopy routes and anti-blight resilience. |
| **Restricted player-source support** | Blueprint Forge and the Document 19 restricted player creator marks living components and consent/maintenance contracts; players can design forms but cannot bypass protected-material rules. |
| **Planning status** | Beta Candidate |

### Goblin Tinker Commune Building Pack

`pack.culture.goblin_tinker_communes`

| **Field** | **Pack Direction** |
|---|---|
| **Pack type and scope** | Culture pack - Camp -> City; Alpha/Beta candidate |
| **Identity** | A non-raider goblin cultural family focused on compact mixed-use construction, salvage engineering, communal workshops, dense storage and rapid repair. |
| **Visual and material layers** | Compact modules, stacked floors, colourful salvage panels, pipe/chute-ready walls, folding furniture, rooftop gardens, visible labels and repair patches. |
| **Functional/project direction** | Prefers shop-houses, communal kitchens, tinker yards, sorting depots, compact schools, market alleys, shared machine rooms and escape/fire routes. |
| **Universal replacements or adaptations** | Blacksmith may become multi-trade tinker forge; warehouse becomes labelled vertical store; village hall may be a rotating assembly workshop; roads favour narrow foot/service networks with cart bypasses. |
| **Signature content** | Tinker Commons, Hundred-Drawer Store, Patchwork Assembly Hall, Rooftop Farmstack, Salvage Exchange and Bellows School. |
| **Settlement layout grammar** | Dense mixed-use clusters with clear maintenance access, vertical routes and fire separation despite irregular appearance. |
| **Material families** | salvaged wood/metal, clay brick, glass scraps, coloured cloth, copper mechanisms and any locally repairable components. |
| **Critical rules and consequences** | Salvage aesthetics must not imply poverty or criminality. This pack is independent of Briarhook faction hostility. |
| **NPC planner priorities** | Prioritises reuse, compact land, workshop access, storage labelling, fire safety, apprenticeships and short haul routes. |
| **Restricted player-source support** | Custom compact buildings validate multiple functions and shared access without double-counting rooms or storage. |
| **Planning status** | Alpha/Beta Candidate |

### Orcish Pastoral Confederacy Building Pack

`pack.culture.orcish_pastoral_confederacy`

| **Field** | **Pack Direction** |
|---|---|
| **Pack type and scope** | Culture pack - Camp -> Capital; Alpha/Beta candidate |
| **Identity** | A mobile-to-settled confederacy culture shaped by herds, seasonal routes, large communal halls, open councils and rapidly deployable defence. |
| **Visual and material layers** | Broad timber or hide roofs, windbreak walls, heavy posts, mobile annexes, herd symbols, open fire courts, banner lines and large-access gates. |
| **Functional/project direction** | Prefers caravan camps, communal longhouses, livestock yards, smokehouses, council rings, route shrines, mobile workshops and muster fields. |
| **Universal replacements or adaptations** | Farmstead becomes herdstead/range cluster; market becomes seasonal exchange; palace becomes confederacy moot; walls may be earthwork and wagon-ring systems. |
| **Signature content** | Great Herd Hall, Seasonal Moot, Banner Roadhouse, Mobile Forge Train, Ancestral Range Shrine and Confederacy Muster Ground. |
| **Settlement layout grammar** | Dispersed or seasonal clusters around pasture/water with a strong central gathering space and wide animal/freight routes. |
| **Material families** | timber, hide, felt/cloth, earth, stone, horn/bone decoration, metal fittings and region-specific pasture resources. |
| **Critical rules and consequences** | Orc ancestry does not prescribe this culture, and pastoral society is not treated as technologically inferior. |
| **NPC planner priorities** | Scores pasture, water, migration route, animal capacity, seasonal storage, council space and border safety. |
| **Restricted player-source support** | Plans can include mobile blueprint modules that pack, relocate or convert into permanent structures. |
| **Planning status** | Alpha/Beta Candidate |

### Aquatic River-Clan Building Pack

`pack.culture.aquatic_river_clans`

| **Field** | **Pack Direction** |
|---|---|
| **Pack type and scope** | Culture pack - Hamlet -> City; Beta candidate |
| **Identity** | A river and wetland culture supporting aquatic, amphibious and mixed residents through dual water/land circulation, fishing, flood adaptation and current-based trade. |
| **Visual and material layers** | Stilts, floating platforms, submerged rooms, reed roofs, water gates, rope/wood bridges, current markers, wet storage and luminous water-safe signs. |
| **Functional/project direction** | Prefers fishing docks, floating homes, hatcheries, water markets, ferry halls, reed workshops, flood refuges and river shrines. |
| **Universal replacements or adaptations** | Road network includes water lanes; village square can be a floating market; well becomes protected intake; warehouse uses dry/wet zones; gate becomes boom/barrier and customs dock. |
| **Signature content** | Current Hall, Reedspire Market, Two-Water Warehouse, Floodsong Shrine, Clan Hatchery and River-Crown Harbour. |
| **Settlement layout grammar** | Linear and branching water networks with accessible dry routes for non-aquatic residents and emergency high-ground connections. |
| **Material families** | reeds, treated timber, river stone, shell/lime, woven fibre, glass, water-safe metal and bioluminescent/mana materials. |
| **Critical rules and consequences** | Mixed settlements must provide both water and dry accessibility; aquatic architecture does not assume all residents breathe water. |
| **NPC planner priorities** | Scores current, depth, flood, clean water, docks, hatchery safety, wet/dry logistics and evacuation. |
| **Restricted player-source support** | Editor supports submerged volumes, waterline markers, buoyancy/foundation policies and dual-route validation. |
| **Planning status** | Beta Candidate |

### Awakened Construct Civic Building Pack

`pack.culture.awakened_construct_civic`

| **Field** | **Pack Direction** |
|---|---|
| **Pack type and scope** | Culture/personhood pack - Outpost -> City; Final candidate |
| **Identity** | A civic culture of self-aware created beings negotiating personhood, maintenance, memory continuity, power access and coexistence with organic residents. |
| **Visual and material layers** | Modular stone/metal frames, accessible maintenance panels, memory plaques, charging alcoves, broad load-rated floors, interchangeable wall modules and low-glare signal lighting. |
| **Functional/project direction** | Prefers charging halls, repair clinics, memory archives, assembly forums, component exchanges, rights offices and mixed organic/construct utilities. |
| **Universal replacements or adaptations** | Housing uses rest/charging and privacy profiles rather than beds alone; hospital gains repair and memory-care wings; cemetery may include memory vaults; school supports firmware/skill instruction without treating persons as machines. |
| **Signature content** | Continuity Archive, Free Assembly Hall, Civic Charging Garden, Memory Court, Component Commons and Liberation Monument. |
| **Settlement layout grammar** | Highly accessible, modular and repairable districts with public proof of ownership and emergency power redundancy. |
| **Material families** | metal/stone frames, ceramic insulation, crystal memory media, glass, local decorative panels and reclaimed creator-era components. |
| **Critical rules and consequences** | Construct people are persons. Labour ownership, reset, dismantling and memory alteration are governed by serious laws and consent. |
| **NPC planner priorities** | Prioritises power redundancy, maintenance, legal services, memory security, load capacity and mixed-population access. |
| **Restricted player-source support** | Blueprint validation distinguishes furniture/servicing machines from resident rest and identity markers. |
| **Planning status** | Final Candidate |

### Mixed Frontier Hybrid Culture Composer

`pack.hybrid.mixed_frontier`

| **Field** | **Pack Direction** |
|---|---|
| **Pack type and scope** | Emergent/hybrid culture template - Hamlet -> Capital; System pack |
| **Identity** | A rule-driven pack for settlements whose identity emerges from several populations, player architecture, local history, economy, laws, festivals and realm contact. |
| **Visual and material layers** | Selects a small coherent token vocabulary from contributors, creates shared signage and public motifs, preserves minority/private spaces and records hybridisation history. |
| **Functional/project direction** | Combines approved substitutions and signature modules without randomly blending every style into visual noise. |
| **Universal replacements or adaptations** | Can create new shared forms after repeated use, such as riverward-goblin shop houses, dwarf-frontier storehouses or fae-human market gardens. |
| **Signature content** | Emergent signature structures are generated from settlement history milestones and then saved as authored stable entries for that world. |
| **Settlement layout grammar** | Reflects actual households, roads, work and governance rather than ancestry percentages alone. |
| **Material families** | Local availability plus culturally meaningful imports; substitutions respect sacred/prohibited materials. |
| **Critical rules and consequences** | Hybrid culture is not a 50/50 palette average. Power, migration, law, consent, occupation and generational change affect adoption. |
| **NPC planner priorities** | Tracks accepted, contested and protected style/function modules and gradually updates project preferences. |
| **Restricted player-source support** | Player-founded settlements may nominate names, motifs and public styles while NPC approval and history shape final adoption. |
| **Planning status** | System / Beta |

### Occupation and Conquest Structure Overlay

`pack.overlay.occupation_and_conquest`

| **Field** | **Pack Direction** |
|---|---|
| **Pack type and scope** | Dynamic faction-state overlay - Any settlement stage; System pack |
| **Identity** | Represents changing authority through banners, checkpoints, requisition stores, altered law, restricted routes, resistance evidence and repurposed civic/defence buildings. |
| **Visual and material layers** | Occupier symbols, guarded access, notices, barricades, seized stores, temporary offices, patrol posts, hidden resistance marks and damaged/removed local motifs. |
| **Functional/project direction** | Changes ownership, permissions, taxation, patrol, storage priority and project pools while preserving underlying culture and private property records where applicable. |
| **Universal replacements or adaptations** | Village hall may gain occupation office; warehouse may reserve tribute; gate may become checkpoint; shrine may be protected, suppressed, shared or contested according to policy. |
| **Signature content** | Occupation Headquarters, Requisition Depot, Checkpoint, Resistance Safehouse and Liberation Memorial are conditional faction structures. |
| **Settlement layout grammar** | Strategic roads, stores and civic centres receive overlays; ordinary homes are not automatically rebuilt in the occupier style. |
| **Material families** | Temporary barriers, occupier banners, requisition crates and local reused construction. |
| **Critical rules and consequences** | Conquest is never a free palette change. Resistance, legality, fear, collaboration, migration and restoration remain simulated. |
| **NPC planner priorities** | Occupation AI prioritises control; local/resistance planners prioritise survival, hidden routes, cultural preservation or liberation. |
| **Restricted player-source support** | Players may impose, support, resist or remove overlays with durable world-state consequences. |
| **Planning status** | System / Beta |

### Refugee and Diaspora Settlement Overlay

`pack.overlay.refugee_diaspora`

| **Field** | **Pack Direction** |
|---|---|
| **Pack type and scope** | Migration/history overlay - Camp -> City; System pack |
| **Identity** | Supports displaced populations preserving identity while adapting to host law, resources, space and safety. |
| **Visual and material layers** | Temporary shelters, portable shrines, shared kitchens, translated signs, memory walls, compact workshops and gradually permanent hybrid additions. |
| **Functional/project direction** | Adds emergency housing, relief distribution, community representation, cultural practice, skills and return/resettlement projects. |
| **Universal replacements or adaptations** | Temporary camp may become recognised quarter; community hall may serve language/religious/civic roles; host buildings may gain compatible household and accessibility modules. |
| **Signature content** | Memory Hall, Diaspora Market, Return Archive, Shared Kitchen and Refugee Council Shelter. |
| **Settlement layout grammar** | Starts near safe services and routes, then expands or disperses according to law, jobs, family and player decisions. |
| **Material families** | Portable/reused materials initially, then host/local materials combined with preserved motifs and valued imports. |
| **Critical rules and consequences** | Displaced people are not a generic labour/resource bonus. Consent, family, status, discrimination and political consequences matter. |
| **NPC planner priorities** | Scores emergency safety, provisions, housing, health, representation, work and cultural continuity. |
| **Restricted player-source support** | May provide land and blueprints, but forced assimilation or relocation causes consequences. |
| **Planning status** | System / Beta |

# 27. Biome Adaptation Pack Profiles

### Dryland and Desert Building Adaptation Pack

`pack.biome.dryland_desert`

| **Field** | **Pack Direction** |
|---|---|
| **Pack type and scope** | Biome adaptation - Overworld natural biome; Alpha |
| **Identity** | Adapts settlements to heat, aridity, wind, sand, scarce water and large daily temperature changes. |
| **Visual and material layers** | Thick shaded walls, courtyards, light-coloured materials, small openings, wind towers, cisterns, covered markets, flat/low roofs where climate permits and sand-resistant routes. |
| **Functional/project direction** | Changes cooling, water storage, shade, food preservation, fire, dust and route requirements. |
| **Universal replacements or adaptations** | Well may become qanat/cistern; road may use stone markers or raised causeway; farmstead requires irrigation/oasis/greenhouse; warehouse uses cool sealed stores. |
| **Signature content** | Biome only: wind tower, shade arcade, sand fence and cistern court modules. |
| **Settlement layout grammar** | Compact shaded clusters around water and trade routes; expansion follows defensible water capacity. |
| **Material families** | adobe/clay, sandstone, lime plaster, timber spars, woven shade, ceramic, glass and imported structural wood/metal. |
| **Critical rules and consequences** | Does not imply one desert culture. Several cultures can use distinct dryland styles. |
| **NPC planner priorities** | Scores water resilience, shade, travel, dust, cooling, flood channels and solar/wind opportunities. |
| **Restricted player-source support** | Validator shows heat exposure, shade and water blockers and offers compatible foundation/roof conversions. |
| **Planning status** | Alpha |

### Frost, Snowfield and Tundra Building Adaptation Pack

`pack.biome.frost_tundra`

| **Field** | **Pack Direction** |
|---|---|
| **Pack type and scope** | Biome adaptation - Overworld natural biome; Alpha |
| **Identity** | Adapts structures to cold, snow load, ice, wind, frozen ground and short growing seasons. |
| **Visual and material layers** | Steep roofs, insulated walls, compact entrances, windbreaks, raised or deep foundations, heat rooms, snow markers and covered routes. |
| **Functional/project direction** | Changes heating/fuel, roof load, storage, water access, agriculture, emergency shelter and road clearing. |
| **Universal replacements or adaptations** | Well may need heated pump or melt store; road may use snow poles/covered passage; farmstead uses greenhouse, herds or preserved stores. |
| **Signature content** | Biome-only snow gallery, wind wall, heat vestibule and meltwater module. |
| **Settlement layout grammar** | Compact clusters sheltered by terrain, with short routes between essentials and protected fuel stores. |
| **Material families** | stone, heavy timber, turf, ice/glass where appropriate, insulated fibre, metal and magical heating components. |
| **Critical rules and consequences** | Cold cultures may choose different architecture; adaptation only provides functional requirements. |
| **NPC planner priorities** | Scores fuel days, snow load, wind exposure, water freeze, route clearing and emergency refuge. |
| **Restricted player-source support** | Validator simulates roof load/clearance and identifies unheated critical spaces. |
| **Planning status** | Alpha |

### Swamp and Wetland Building Adaptation Pack

`pack.biome.swamp_wetland`

| **Field** | **Pack Direction** |
|---|---|
| **Pack type and scope** | Biome adaptation - Overworld natural biome; Alpha |
| **Identity** | Adapts settlement construction to saturated ground, flood cycles, insects, rot, navigable channels and limited dry land. |
| **Visual and material layers** | Stilts, boardwalks, floating sections, rot-resistant material roles, screened openings, elevated stores, drainage and mooring sockets. |
| **Functional/project direction** | Changes foundations, sanitation, clean water, routes, livestock, storage and fire/evacuation. |
| **Universal replacements or adaptations** | Road becomes boardwalk/canal; well becomes protected rain/spring intake; farmstead becomes raised garden/aquaculture; cemetery uses culture-safe dry or water rites. |
| **Signature content** | Biome-only pile foundation, boardwalk junction, floating service deck and reed filter modules. |
| **Settlement layout grammar** | Linear and clustered along stable ground and waterways, with redundant high routes. |
| **Material families** | treated timber, reeds, fibre, stone piles, clay, rope, shell/lime and water-safe metal. |
| **Critical rules and consequences** | Wetland is not automatically primitive or dangerous; advanced cities may use canals, pumps and floating districts. |
| **NPC planner priorities** | Scores ground stability, clean water, flood, rot, insects, fire separation and boat access. |
| **Restricted player-source support** | Editor previews water levels and foundation options. |
| **Planning status** | Alpha |

### Mountain and Underground Building Adaptation Pack

`pack.biome.mountain_underground`

| **Field** | **Pack Direction** |
|---|---|
| **Pack type and scope** | Biome adaptation - Overworld/cave biome; Alpha |
| **Identity** | Adapts structures to slopes, cliffs, caves, limited sunlight, rock stability, ventilation and vertical logistics. |
| **Visual and material layers** | Terraces, retaining walls, carved volumes, bridge galleries, shafts, light wells, ventilation, rock supports and cliff anchors. |
| **Functional/project direction** | Changes parcel volume, terrain excavation, collapse risk, routes, agriculture, water, smoke and emergency exits. |
| **Universal replacements or adaptations** | Road becomes stair/switchback/tunnel; watchtower becomes shaft beacon; farmstead becomes terrace or cavern farm; warehouse can embed into cool rock. |
| **Signature content** | Biome-only retaining-wall, tunnel gate, cliff lift and ventilation-spire modules. |
| **Settlement layout grammar** | Vertical districts around halls, shelves, shafts and bridges rather than flat streets. |
| **Material families** | local stone, timber/metal supports, glass/crystal light, mortar and climate-specific insulation. |
| **Critical rules and consequences** | Underground does not imply dwarven culture; any culture may adapt with different spatial traditions. |
| **NPC planner priorities** | Scores rock stability, ventilation, evacuation, light, freight gradient and water drainage. |
| **Restricted player-source support** | Validator supports terrain-carve masks and protected load-bearing cells. |
| **Planning status** | Alpha |

### Coast and Island Building Adaptation Pack

`pack.biome.coast_island`

| **Field** | **Pack Direction** |
|---|---|
| **Pack type and scope** | Biome adaptation - Overworld natural biome; Alpha/Beta |
| **Identity** | Adapts settlements to salt, storms, tides, erosion, fishing, harbours and limited land. |
| **Visual and material layers** | Storm bracing, raised floors, seawalls, drainage, salt-resistant materials, docks, rope/anchor details and compact storage. |
| **Functional/project direction** | Changes harbour, freshwater, food, route, evacuation, corrosion, storm and trade requirements. |
| **Universal replacements or adaptations** | Road may become quay/bridge; warehouse uses salt/dry separation; well may require rain/cistern; defence includes harbour approach. |
| **Signature content** | Biome-only storm shutter, tide marker, quay wall and lighthouse socket modules. |
| **Settlement layout grammar** | Dense shore or terraced island clusters connected to inland refuge/high ground. |
| **Material families** | stone, treated timber, rope, shell/lime, tile, copper/bronze and imported resources. |
| **Critical rules and consequences** | Coastal culture identity is layered separately; this pack only solves environmental function. |
| **NPC planner priorities** | Scores harbour value, fresh water, storm refuge, erosion, salt damage and evacuation. |
| **Restricted player-source support** | Validator previews tidal/flood bands and berth/shore stability. |
| **Planning status** | Alpha/Beta |

### Leyline and High-Mana Biome Adaptation Pack

`pack.biome.leyline_magical`

| **Field** | **Pack Direction** |
|---|---|
| **Pack type and scope** | Magical biome adaptation - Overworld/realm magical biome; Beta |
| **Identity** | Adapts buildings and networks to high ambient mana, magical weather, crystal growth, spirit activity and unstable resonance. |
| **Visual and material layers** | Grounding runes, mana bleed vents, crystal-safe foundations, ward sockets, low-interference routes, glow states and isolation boundaries. |
| **Functional/project direction** | Changes machine stability, ward capacity, research, portal risk, resident safety and magical resource handling. |
| **Universal replacements or adaptations** | Power/mana buildings may gain ambient collection; ordinary stores need sealed magic zones; roads may use ward markers; farms may use mana-sensitive crop profiles. |
| **Signature content** | Biome-only grounding ring, resonance break, crystal culvert and spirit-way marker. |
| **Settlement layout grammar** | Avoids destructive leyline obstruction and reserves ritual/anchor sites. |
| **Material families** | mundane grounding materials, mana crystal, silver/copper, rune stone, stabilisers and culture-specific magical construction. |
| **Critical rules and consequences** | Ambient mana is not free unlimited power. Collection and interference are bounded. |
| **NPC planner priorities** | Scores resonance, corruption risk, spirit routes, protected sites and grid compatibility. |
| **Restricted player-source support** | Validator shows interference and required grounding/ward markers. |
| **Planning status** | Beta |

### Corrupted and Blighted Settlement Adaptation Pack

`pack.biome.corrupted_blighted`

| **Field** | **Pack Direction** |
|---|---|
| **Pack type and scope** | Dynamic biome/state adaptation - Any stage; Beta |
| **Identity** | Supports survival, containment, cleansing, quarantine and restoration in land altered by corruption, curse or hostile magical ecology. |
| **Visual and material layers** | Sealed thresholds, cleansing channels, warded foundations, quarantine zones, sacrificial outer surfaces, corruption monitoring and visibly repaired/cleansed states. |
| **Functional/project direction** | Changes health, safety, water, agriculture, waste, materials, routes and resident migration. |
| **Universal replacements or adaptations** | Farmstead may become cleansed greenhouse; well requires purification; wall may become ward perimeter; hospital gains contamination intake; storage separates tainted goods. |
| **Signature content** | Biome/state modules: cleansing gate, ward trench, quarantine shelter, tainted-store lock and restoration garden. |
| **Settlement layout grammar** | Layered safe core, buffer and contaminated work zones with controlled routes. |
| **Material families** | clean stone/metal, silver, rune blocks, replaceable timber, filters, ritual materials and local cleansed resources. |
| **Critical rules and consequences** | Corruption adaptation does not normalise exploitation of unsafe populations. Long-term goal can be containment, coexistence or cleansing depending on world choice. |
| **NPC planner priorities** | Scores spread, source, exposure, clean routes, purification capacity and evacuation. |
| **Restricted player-source support** | Validator clearly labels contamination and prevents clean capacity from double-counting unsafe spaces. |
| **Planning status** | Beta |

# 28. Realm Building Pack Profiles

### Verdant Covenant Realm Building Pack

`pack.realm.verdant_covenant`

| **Field** | **Pack Direction** |
|---|---|
| **Pack type and scope** | Major realm pack - First realm candidate; Alpha |
| **Identity** | A living fae realm where seasons, names, promises, emotion and hospitality can become physical law. |
| **Visual and material layers** | Living wood, covenant markers, seasonal material states, negotiated doors, growth scaffolds, oath-thread details, neutral sanctuary symbols and anti-blight systems. |
| **Functional/project direction** | Defines arrival sanctuary, living settlements, nature-compatible automation, promise-law civic buildings, seasonal courts, realm farms, portal customs and restoration sites. |
| **Universal replacements or adaptations** | Mundane foundations may use living-root consent anchors; warehouse can use covenant-bound storage; gate becomes recognised threshold; council buildings support promise records and seasonal authority. |
| **Signature content** | Arrival Covenant Sanctuary, Neutral Embassy Grove, Oathbough Hall, Seasonal Court, Living Conduit Garden, Promise Archive and Crowned World-Tree project. |
| **Settlement layout grammar** | Organic routes and seasonal boundaries; territories may open/close according to recognised promises and court politics. |
| **Material families** | living wood, fae seed, seasonal resin, oath-thread, glamour crystal, covenant heart and imported grounding materials. |
| **Critical rules and consequences** | Native ownership, consent and treaty are central. Extraction and construction can cause political/ecological consequences. |
| **NPC planner priorities** | Realm/native planners score promise law, living ecology, seasonal change, court territory, portal security and anti-blight. |
| **Restricted player-source support** | Player plans require realm adaptation and local permission; imported blueprints can be translated rather than copied unchanged. |
| **Planning status** | Alpha Candidate |

### Ancestral Veil Realm Building Pack

`pack.realm.ancestral_veil`

| **Field** | **Pack Direction** |
|---|---|
| **Pack type and scope** | Major spirit-realm pack - Future major |
| **Identity** | A spirit layer shaped by memory, ancestors, identity continuity, cleansing and diplomacy with the dead. |
| **Visual and material layers** | Memory stone, translucent partitions, name plaques, quiet thresholds, spirit lamps, remembrance routes and dual material/spirit states. |
| **Functional/project direction** | Defines arrival shrine, ancestor embassy, memory archive, spirit dwelling, cleansing house, oath guardians, death-recovery infrastructure and respectful trade. |
| **Universal replacements or adaptations** | Housing may serve living, spirit or mixed occupants; cemetery and archive merge in some cultures; roads can require memory anchors; hospital gains soul-recovery services. |
| **Signature content** | Namebridge Sanctuary, Hall of Remembered Doors, Ancestral Embassy, Memory Well, Quiet Market and Veil-Lantern Network. |
| **Settlement layout grammar** | Routes follow memory, lineage and recognised names rather than only physical distance. |
| **Material families** | spirit clay, soul silver, memory glass, ancestral essence, mundane anchors and culture-specific memorial materials. |
| **Critical rules and consequences** | Spirits are not generic resources. Consent, identity, mourning and soul ethics govern use. |
| **NPC planner priorities** | Scores memory stability, named anchors, respectful separation, living support and realm interference. |
| **Restricted player-source support** | Editor exposes dual-state geometry and memory-anchor validation. |
| **Planning status** | Future Major |

### Aetheric Reach Realm Building Pack

`pack.realm.aetheric_reach`

| **Field** | **Pack Direction** |
|---|---|
| **Pack type and scope** | Major sky-realm pack - Future major |
| **Identity** | A vertical sky realm of floating land, storm power, vessels, gases and current-based navigation. |
| **Visual and material layers** | Lightweight frames, anchor cables, buoyancy chambers, wind fins, storm grounding, broad landing platforms and visible load/redundancy indicators. |
| **Functional/project direction** | Defines arrival platform, sky settlements, storm collectors, airship docks, gas stores, vertical farms, current beacons and floating defence. |
| **Universal replacements or adaptations** | Roads become lifts/bridges/air routes; well becomes condenser; warehouse requires load and tie-down rules; walls become wind/ward barriers. |
| **Signature content** | Stormharbour, Current Beacon, Cloudstone Foundry, Sky Orchard, Anchor Council and Tempest Crown. |
| **Settlement layout grammar** | Multi-level islands and platforms connected by safe routes with strict evacuation and load budgets. |
| **Material families** | cloudstone, storm metal, sky membrane, light alloys, crystal, cable and imported ballast. |
| **Critical rules and consequences** | Floating capacity and weather are real constraints; decorative levitation grants no service. |
| **NPC planner priorities** | Scores anchor strength, wind/current, load, storm refuge, rescue and vertical logistics. |
| **Restricted player-source support** | Validator shows supported mass, route redundancy, berth approach and emergency descent. |
| **Planning status** | Future Major |

### Impossible Deep Realm Building Pack

`pack.realm.impossible_deep`

| **Field** | **Pack Direction** |
|---|---|
| **Pack type and scope** | Major deep/pressure-realm pack - Future major |
| **Identity** | A deep world of immense pressure, darkness, seismic change, forge materials and ancient below-world cultures. |
| **Visual and material layers** | Pressure arches, sealed doors, braced tunnels, resonance sensors, thermal channels, luminous wayfinding and compartmented refuges. |
| **Functional/project direction** | Defines pressure-safe arrival, deep settlements, forge complexes, seismic observatories, sealed farms, lift networks and breach response. |
| **Universal replacements or adaptations** | Open streets become pressure corridors; wells become sealed reservoirs; warehouse uses compartmented pressure locks; watchtowers become resonance/listening stations. |
| **Signature content** | Pressure Sanctuary, Deep Forge, Seismic Choir, Abyss Lift, Luminous Market and Worldroot Bastion. |
| **Settlement layout grammar** | Compartmented vertical/deep networks with redundant seals and refuge chambers. |
| **Material families** | deep ember, pressure stone, worldroot supports, soul silver, heat ceramics and imported flexible seals. |
| **Critical rules and consequences** | Pressure and collapse are readable bounded systems, not random instant death. |
| **NPC planner priorities** | Scores pressure class, seals, heat, seismic route, refuge and portal dependency. |
| **Restricted player-source support** | Validator checks compartment integrity and emergency isolation. |
| **Planning status** | Future Major |

### World-Engine Realm Building Pack

`pack.realm.world_engine`

| **Field** | **Pack Direction** |
|---|---|
| **Pack type and scope** | Artificial major-realm pack - Late game |
| **Identity** | An ancient artificial realm of machine factions, repair corridors, world-scale systems and contested control authority. |
| **Visual and material layers** | Modular machine architecture, numbered sectors, service conduits, mechanical doors, diagnostic lights, ancient materials and patched faction overlays. |
| **Functional/project direction** | Defines maintenance settlements, machine-civilisation housing, control rooms, repair docks, power sectors, archive minds, portal routing and world-engine restoration. |
| **Universal replacements or adaptations** | Roads become maintenance corridors; civic hall becomes consensus/control chamber; farms may be hydroponic/fabricated; shrines can be protocol/memory sanctums. |
| **Signature content** | Bootstrap Sanctuary, Sector Commons, Archive Core, World-Forge, Routing Cathedral, Free Construct Assembly and Engine Heart project. |
| **Settlement layout grammar** | Hierarchical sectors and loops with maintenance access, shutdown boundaries and rediscovered routes. |
| **Material families** | world-engine alloy, ancient ceramic, conduit glass, machine cores, reclaimed panels and imported biological habitat materials. |
| **Critical rules and consequences** | Machine factions and awakened constructs have personhood/politics; control access is not automatic ownership. |
| **NPC planner priorities** | Scores power, maintenance, permissions, sector stability, construct rights and portal control. |
| **Restricted player-source support** | Blueprints must integrate with ancient sockets through adapters rather than overwriting protected core systems. |
| **Planning status** | Late Game |

### Ashen Lower Realms Building Pack

`pack.realm.ashen_lower`

| **Field** | **Pack Direction** |
|---|---|
| **Pack type and scope** | Infernal/heat realm-cluster pack - Late game |
| **Identity** | A cluster of heat-dominated realms with contract politics, dangerous fuels, ash ecology and industrial opportunity. |
| **Visual and material layers** | Heat shields, ash seals, lava/ember channels, contract plaques, cooling refuges, filtered vents and fireproof freight routes. |
| **Functional/project direction** | Defines arrival cooling station, ash settlements, contract halls, deep forges, ember farms, fuel depots, caravan gates and heat defence. |
| **Universal replacements or adaptations** | Water systems require cooling/condensation; farmstead uses heat crops/greenhouses; hospital handles burns/toxicity; portal complex requires thermal containment. |
| **Signature content** | Cinder Embassy, Contract Forge, Ember Reservoir, Ash Market, Cooling Monastery and Furnace-Crown works. |
| **Settlement layout grammar** | Safe cooled nodes connected through protected routes across hazardous terrain. |
| **Material families** | ash brick, infernal alloy, deep ember, heat glass, basalt, cooling crystal and imported water/organic materials. |
| **Critical rules and consequences** | Infernal peoples/factions are not inherently evil. Contract law, labour and extraction politics vary. |
| **NPC planner priorities** | Scores heat, cooling, air, fuel hazard, contract territory, water dependency and evacuation. |
| **Restricted player-source support** | Validator checks thermal envelope and safe shutdown. |
| **Planning status** | Late Game |

### Void Between Building Pack

`pack.realm.void_between`

| **Field** | **Pack Direction** |
|---|---|
| **Pack type and scope** | Interstitial realm pack - Late/endgame |
| **Identity** | An unstable spatial interstitial used for voidstone, portal routing and existential threats, with very limited permanent settlement. |
| **Visual and material layers** | Reality anchors, sealed geometry, orientation lights, tether lines, spatial locks, sacrificial outer shells and emergency return beacons. |
| **Functional/project direction** | Defines expedition anchors, routing stations, void extraction, quarantine, spatial research and short-lived protected habitats. |
| **Universal replacements or adaptations** | Normal roads become tethered paths; walls require anchor fields; storage uses spatial locks; housing is refuge-grade rather than ordinary settlement. |
| **Signature content** | Void Anchorage, Tether Station, Spatial Observatory, Anchor Vault, Emergency Return Shrine and Interstitial Routing Engine. |
| **Settlement layout grammar** | Small redundant islands of stable space, never assumed to support broad ordinary civilisation. |
| **Material families** | voidstone, anchor hearts, silver, stabiliser crystal, world-engine alloy and imported life-support materials. |
| **Critical rules and consequences** | Void infrastructure is high-risk and expensive. It cannot become effortless fast travel or infinite storage. |
| **NPC planner priorities** | Scores stability, return route, containment, exposure and strategic necessity. |
| **Restricted player-source support** | Validator requires anchors, tethers, redundancy and hard size limits. |
| **Planning status** | Late/Endgame |

### Created Pocket Realm Building Template

`pack.realm.created_pocket_template`

| **Field** | **Pack Direction** |
|---|---|
| **Pack type and scope** | Pocket-realm family pack - Late utility |
| **Identity** | A configurable framework for artificial farms, vaults, trials, prisons, laboratories, sanctuaries or personal spaces without treating pockets as consequence-free infinite land. |
| **Visual and material layers** | Boundary shell, anchor/control, access gate, environmental rules, utility spine, emergency return, ownership seals and expansion limits. |
| **Functional/project direction** | Defines a small authored/procedural interior world with explicit capacity, rules, upkeep and failure. |
| **Universal replacements or adaptations** | Universal buildings may be imported if the pocket's gravity, atmosphere, light, time, soil and matter rules support them. |
| **Signature content** | No single visual signature; creators select an approved purpose profile and style pack. |
| **Settlement layout grammar** | Bounded space with clear topology and protected control region. |
| **Material families** | Anchor heart, realm catalyst, structural shell, local-generated matter profile and imported fixtures. |
| **Critical rules and consequences** | Pocket size, production, time and storage are capped. Prisons and sentient occupants require law/consent systems. |
| **NPC planner priorities** | Scores purpose, stability, cost, access, security and dependency. |
| **Restricted player-source support** | Main-menu blueprint workshop can author pocket layouts after late-game unlock, with strict validation and server limits. |
| **Planning status** | Late Utility |

# 29. Staged Implementation and Migration Plan

## 29.1 Stage 0 - Registry and Namespace Alignment

- Implement canonical `pack.*` families and migration aliases.
- Create pack manifest, lifecycle and dependency schemas.
- Add pack/source references to the 20H production tracker.
- Define field-level override authority and conflict diagnostics.
- Create a culture-neutral foundation fallback.

**Exit gate:** manifests load deterministically; legacy `culture_kit.*` and `style_kit.*` fixtures migrate without ID loss.

## 29.2 Stage 1 - Material Roles and Resolver Proof

- Resolve material roles against block/item registries and physical constraints.
- Implement provenance, rejected-candidate diagnostics and deterministic seeds.
- Build the Foundation + Riverward + Temperate Forest/River stack.
- Test representative Core Infrastructure sources: Small Cottage, Basic Farm Plot, Carpenter Workshop, Village Warehouse, Dirt Path/Junction and Wooden Watchtower.

**Exit gate:** two different valid source/material resolutions produce exact construction costs and stable runtime hashes.

## 29.3 Stage 2 - Faction and Raid Extension

- Add Briarhook faction overlay and Regional March reference overlay.
- Prove banners, ownership, access, patrol, stolen-store and command modules.
- Resolve Village Hall, Guard Post, Palisade Segment and Village Gate through culture/biome/faction layers.
- Preserve origin after capture, damage and repair.

**Exit gate:** the raid scenario changes visually and mechanically through real resolved structures without ancestry-based hostility.

## 29.4 Stage 3 - Extended Forest Hamlet Coverage

- Resolve the complete protected 30-definition Forest Hamlet roster through the neutral/Riverward/forest stack.
- Produce source pools for high-frequency homes, work sites, storage, civic and community families.
- Add icons, night/weather previews and critical damage states.
- Validate one restricted player cottage and one public/work source.

**Exit gate:** all 30 definitions have a valid pack resolution, exact resource output, saved provenance and migration fixture.

## 29.5 Stage 4 - Early Alpha Diversity

- Produce two additional culture packs with clearly different spatial grammar.
- Add dryland, frost, swamp and mountain/underground biome packs.
- Add government, faith, occupation and diaspora overlays.
- Implement Preview Matrix batching and package diff review.
- Test mixed settlements and minority spaces.

**Exit gate:** three cultures can coexist in one settlement without random palette blending or capacity duplication.

## 29.6 Stage 5 - Hybrid Composer and Realm Alpha

- Implement event/history-based hybrid culture composition.
- Produce Verdant Covenant arrival, outpost and native settlement slice.
- Test realm physical-law constraints, portal dependency, local material roles and native ownership.
- Add missing-pack, rollback and multiplayer handshake tests.

**Exit gate:** realm and hybrid layers resolve deterministically and survive save migration.

## 29.7 Stage 6 - Production Hardening

- Add dependency invalidation, bake cache, CI and content hashes.
- Enforce performance, localisation, representation and accessibility gates.
- Add package signing/distribution metadata where required.
- Expand high-value source pools and critical state variants.
- Review candidate culture/realm names against final lore.

**Exit gate:** approved packs are shippable, auditable, migration-safe and content-budgeted.

## 29.8 Explicit Deferrals

- Arbitrary executable mod scripting.
- Public marketplace and moderation implementation.
- Automatic generative promotion without human review.
- Full procedural culture generation from unrestricted traits.
- Remaking all 120 universal definitions for every culture.
- Final canon approval of every candidate culture/realm profile.

# 30. Balancing, Performance and Simulation LOD

## 30.1 Balancing Rules

- No pack grants capacity without valid lower-level systems.

- Environmental familiarity can reduce costs or maintenance, but unfamiliar cultures can adapt through knowledge, trade and specialist work.

- A culture pack normally defines preferences and alternatives, not hard prohibitions.

- Signature buildings provide focused value and story rather than universal superiority.

- Expensive imported style materials should not block functional repairs; emergency substitutions remain possible with visual/history consequences.

- Mixed settlements should not be penalised merely for diversity. Conflicts arise from laws, resources, prejudice, politics, incompatible requirements or events - not a generic diversity penalty.

- Faction overlays can create strong strategic benefits but also maintenance, political and reputation costs.

- Realm packs retain Overworld materials and systems where practical; new realm materials expand rather than replace the economy.

- Pack complexity is limited by blueprint, texture, material, memory, validation and localisation budgets.

- Similar packs should share parents and modules rather than copy data.

## 30.2 Representation Rules

- Do not map real-world peoples directly into caricatured fantasy cultures.

- Avoid treating one government, faith, class, profession or moral tendency as biologically inherited.

- Intelligent hostile factions need motives, leadership, resources, surrender/reform possibilities and broader non-hostile cultural context.

- Coercive labour, occupation, slavery, necromantic labour and cultural suppression are serious systems with victims, resistance and consequences.

- Sacred architecture and cultural symbols require context and in-world ownership rather than existing only as loot decoration.

- Cultural change can be voluntary, contested, imposed, revived or hybridised and should be recorded.

## 30.3 Simulation LOD

### Near

- Actual blueprints, materials, banners, signs, routes, furniture and functional markers.
- NPC cultural schedules, public use, faction guards and rituals where relevant.
- Visible construction and repair with culture-specific stages.
- Player edits and local pack revalidation.

### Medium

- Simplified presentation variants.
- Important culture/faction jobs and events preserved.
- Project selection uses active pack preferences.
- Reduced decoration and animation detail.

### Far or Unloaded

- Settlement stores culture, subculture, faction, government, faith, biome, realm and history IDs.
- Pack resolver produces bounded planner weights and capacities from real buildings.
- Cultural evolution runs on event/multi-day summaries, not per-block scans.
- Occupation, migration, reform and hybridisation create persistent records.
- Returning players see deterministic material/style/state reconstruction.

# 31. Open Questions for Later Lore and Production

1. Final named culture roster and regional map.
2. Which cultures are playable origins at first release.
3. Exact signature-building count per culture.
4. How players learn protected motifs and sacred construction rules.
5. Whether culture style knowledge is unlocked by observation, teaching, reputation, books or creative mode.
6. How much foreign architecture affects settlement Morale.
7. How public approval of player town packs works under different governments.
8. How cultural heritage protection interacts with free block breaking.
9. Exact rules for emergent culture naming and localisation.
10. Whether a hybrid culture can become a reusable pack outside its original world.
11. How material scarcity changes a culture's style over generations.
12. How automated blueprint generation is reviewed and promoted.
13. How faction/culture packs interact with dedicated economy and religion documents.
14. How many overlapping overlays are safe for performance and readability.
15. How visual conflict resolution is shown in the editor.
16. Which culture packs receive custom props, meshes and animations versus voxel-only content.
17. How much architecture changes under long occupation.
18. How ruins preserve multiple historical layers.
19. How realm-native cultures interpret Overworld building imports.
20. Which realm pack becomes the first playable expansion after the POC.
21. How culture packs are packaged, downloaded and versioned in multiplayer.
22. Whether server owners can restrict cultural content without breaking saves.
23. Exact moderation policy for offensive player-created symbols and packs.
24. How to preserve accessibility when scripts, colour and banners vary.
25. Final texture/material budgets per pack.

# Appendix A. Pack Definition Field Template

| **Field Group** | **Required Fields** |
|---|---|
| Identity | `pack_id`; display/localisation keys; pack type; parent IDs; origin links; lifecycle; canon/planning status. |
| Manifest | Version; schema; dependencies; optional integrations; compatibility; priority; conflict policy; content hash. |
| Universal coverage | Universal family tags; stages; footprints; selected source pools; fallback foundation. |
| Overrides | Allowed fields; role sets; palette; silhouette; layout weights; exposed parameters; module pools. |
| Replacements | Capability tags; replacement contract IDs; capacities; markers; jobs; utilities; validator profile. |
| Signatures | Signature definition/source IDs; stage; rarity; prerequisites; story/faction/realm gates. |
| Planner | Preferred/avoided projects; terrain/route priorities; public/private norms; cultural acceptance and law filters. |
| Materials | Priority families; local/import substitutions; physical constraints; sacred/prohibited; weathering and repair. |
| Layout | Density; parcels; centres; routes; storage; household; public space; defence; verticality and accessibility. |
| Identity modules | Government; faith/philosophy; economy/labour; language/signage; festival; memorial. |
| Environment | Biome/realm rules; climate; foundations; water; hazards; power/mana; portal dependency. |
| Dynamic state | Occupation; diaspora; hybridisation; reform; damage; ruin; restoration; corruption/cleansing. |
| Player authoring | Exposed roles/fields; private/public eligibility; protected rules; publishing/server class. |
| UI/accessibility | Icons; map motifs; colour-independent cues; scripts; tooltips; knowledge visibility; warnings. |
| Runtime/LOD | Resolver profile; cache class; compatibility token; far summary; history; aliases; recovery. |
| Production | Coverage status; Preview Matrix; capture status; bake status; gameplay status; test fixtures; owner. |

# Appendix B. Resolved Pack Stack and Blueprint Binding Template

```text
structure_instance_id
universal_definition_id
source_blueprint_id
source_revision_token
origin_culture_pack_id
regional_pack_ids[]
biome_pack_id
faction_pack_ids[]
government_pack_id
faith_pack_ids[]
economy_pack_ids[]
realm_pack_id
history_state_overlay_ids[]
settlement_or_player_style_pack_id
resolved_material_role_map
resolved_module_instances
resolved_accessibility_profile
construction_and_state_profile_ids
resolver_seed
pack_stack_content_hash
runtime_compatibility_token
provenance_map
persistent_element_deltas
migration_history
```

# Appendix C. Override and Composition Authority Matrix

| **Layer** | **May Change** | **May Not Bypass** |
|---|---|---|
| Culture | Source pools, material grammar, layout preference, public/private norms, signatures. | Universal function, exact resources, accessibility, safety or ownership. |
| Region/Subculture | Local materials, roof/foundation, economy, motifs, selected signatures. | Parent identity without a declared split/history. |
| Faction | Owner symbols, guards, permissions, faction modules, project priorities. | Origin culture, ancestry identity or private ownership without law/conquest. |
| Government | Civic forms, approval, property, assembly, records and authority modules. | Seven needs or building capacity. |
| Faith/Philosophy | Sacred spaces, rites, burial, charity, taboo and magic modules. | Culture-wide belief or individual NPC belief. |
| Economy/Labour | Storage, market, guild, production and automation preference. | Resource conservation or worker rights/law records. |
| Biome | Foundation, climate, water, roads, hazards and local materials. | Culture, government, faction or morality. |
| Realm | Physical law, portal, survival, local matter and native settlement adaptation. | Resource conservation, ownership, politics and validated function. |
| History/Occupation | Symbols, checkpoints, damage, temporary conversion, repair and restoration. | Origin history or automatic assimilation. |
| Player Style | Exposed roles, decoration, selected sources and bounded layout preferences. | Server authority, protected content, function, safety and performance. |

# Appendix D. Validation and Diagnostic Catalogue

| **Code** | **Severity** | **Meaning / Required Response** |
|---|---|---|
| `PACK_ID_INVALID` | Error | Namespace or ID format is invalid. |
| `PACK_DEPENDENCY_MISSING` | Error | Required parent/source/module/registry dependency is unavailable. |
| `PACK_DEPENDENCY_CYCLE` | Error | Parent or module graph contains a cycle. |
| `PACK_LAYER_CONFLICT` | Error | Two active layers attempt incompatible authoritative changes. |
| `PACK_OVERRIDE_NOT_EXPOSED` | Error | Pack/player source changes a protected field. |
| `PACK_FUNCTION_UNREGISTERED` | Error | Replacement or module claims an unregistered capability. |
| `PACK_ROLE_UNRESOLVED` | Error | Required material role has no valid candidate. |
| `PACK_ROLE_PROPERTY_FAIL` | Error | Resolved material violates structural/fire/water/realm constraints. |
| `PACK_SOURCE_INCOMPATIBLE` | Error | Blueprint source does not satisfy universal or environmental profile. |
| `PACK_ACCESSIBILITY_FAIL` | Error | Declared resident/body-scale profile cannot use required routes/markers. |
| `PACK_REALM_CONTRACT_FAIL` | Error | Source cannot operate under active realm physical laws. |
| `PACK_PROVENANCE_MISSING` | Error | Resolved field has no traceable source layer. |
| `PACK_HASH_MISMATCH` | Error | Runtime/client package differs from authoritative content hash. |
| `PACK_MIGRATION_REQUIRED` | Error | Save/source compatibility token requires an unapplied migration. |
| `PACK_FALLBACK_USED` | Warning | Declared fallback replaced optional or legacy content. |
| `PACK_CULTURE_ANCESTRY_COUPLED` | Error | Architecture or hostility is keyed directly to ancestry. |
| `PACK_REPRESENTATION_REVIEW` | Warning | Candidate content requires human representation/lore review. |
| `PACK_ICON_MISSING` | Warning | Player-visible pack/content has no capture/icon. |
| `PACK_LOCALISATION_MISSING` | Warning | Player-visible key lacks required localisation entry. |
| `PACK_PERFORMANCE_BUDGET` | Error/Warning | Source/module/state combination exceeds active tier budget. |
| `PACK_PREVIEW_MATRIX_INCOMPLETE` | Warning | Required production preview/test combination is missing. |
| `PACK_PLAYER_PUBLIC_INELIGIBLE` | Info | Valid private content is not approved for NPC/public project pools. |

# Appendix E. Suggested Godot Resources and Services

| **Godot Resource / Service** | **Purpose** |
|---|---|
| `BuildingPackManifest.gd` | Namespace, version, dependencies, compatibility, lifecycle, hashes and content list. |
| `CultureBuildingPackDefinition.gd` | Culture identity, source pools, role sets, signatures, layout and planner preferences. |
| `RegionalCultureVariantDefinition.gd` | Parent overrides for climate, history, neighbours, economy and local style. |
| `FactionStructureOverlayDefinition.gd` | Ownership, symbols, security, permissions, modules and occupation behaviour. |
| `GovernmentBuildingModuleDefinition.gd` | Civic forms, approval, property, records and authority modules. |
| `FaithBuildingModuleDefinition.gd` | Sacred spaces, rites, burial, charity, taboo and magic modules. |
| `EconomyBuildingModuleDefinition.gd` | Labour, guild, market, storage and production preferences. |
| `BiomeBuildingAdaptationDefinition.gd` | Foundation, climate, water, routes, hazards and material adaptation. |
| `RealmBuildingPackDefinition.gd` | Realm rules, arrival/outpost content, local matter, portals and native settlement adaptation. |
| `DynamicStructureOverlayDefinition.gd` | Occupation, diaspora, corruption, repair, recovery and reform layers. |
| `FunctionalReplacementDefinition.gd` | Universal capability contract, markers, capacities, utilities and validation. |
| `MaterialRoleSet.gd` | Role candidates, priorities, physical constraints, costs and fallback. |
| `BlueprintPoolDefinition.gd` | Compatible source IDs, weights, filters and deterministic selection. |
| `PackCompositionRule.gd` | Layer priority, allowed fields, conflict policy and fallback. |
| `HybridCultureComposer.gd` | Event/history-based coherent composition and emergent pack records. |
| `ResolvedStructurePresentation.gd` | Selected source, role map, modules, provenance, hash and compatibility token. |
| `RuntimeStructureIdentityRecord.gd` | Origin culture, active overlays, owner, realm/biome, history and player modifications. |
| `BuildingPackResolver.gd` | Deterministic composition and resolved-product caching. |
| `PackBakeService.gd` | Pre-bake common pack/source combinations and manage content-addressed products. |
| `PackValidationService.gd` | Dependencies, overrides, function, accessibility, performance, localisation and representation checks. |
| `PackMigrationService.gd` | Aliases, schema upgrades, source rebasing and save recovery. |
| `PackPreviewMatrixService.gd` | Batch preview/test combinations inside the Unified Forge. |
| `PackContentHandshake.gd` | Multiplayer manifest/hash compatibility and server permissions. |
| `CulturePackViewModel.gd` | UI presentation, compatibility, protected rules, provenance and diagnostics. |

# Appendix F. POC and Alpha Acceptance Checklist

- [ ] Canonical `pack.*` namespaces validate; legacy aliases migrate.
- [ ] One universal building resolves through culture, biome, faction and state layers.
- [ ] Ancestry is not used as the architecture or hostility lookup key.
- [ ] Riverward sources support mixed resident/body-scale profiles where declared.
- [ ] Briarhook overlay applies to the faction only.
- [ ] Culture-neutral foundation fallback works when optional content is missing.
- [ ] Material-role resolution produces exact construction costs and passes physical constraints.
- [ ] Biome adaptation changes foundation/roof/routes without changing culture.
- [ ] Faction ownership changes permissions/symbols without duplicating building capacity.
- [ ] Raid Extension structures resolve through Riverward/forest/March and Briarhook stacks.
- [ ] Damage and occupation preserve origin history and stable internal element IDs.
- [ ] One restricted player cottage validates and saves as private/public-eligible according to policy.
- [ ] Pack conflicts produce readable diagnostics and provenance.
- [ ] Save/load preserves origin, active layers, hash and compatibility token.
- [ ] Distant settlement retains pack IDs, planner weights and history.
- [ ] Hybrid settlement uses coherent accepted roles rather than random palette blending.
- [ ] Realm pack cannot activate without physical-law and dependency validation.
- [ ] Missing required content blocks safely; optional content falls back safely.
- [ ] Stable IDs and aliases survive migration and rollback fixtures.
- [ ] Accessibility cues remain usable without colour.
- [ ] Localisation and icons exist for player-visible POC packs.
- [ ] Multiplayer content handshake rejects gameplay-critical hash mismatch.
- [ ] Pack and source counts remain within agreed budgets.
- [ ] Human review approves representation and candidate-lore labels.

# Appendix G. Initial Production Backlog

## G.1 Technical POC Core

- Pack manifest, lifecycle, namespace and alias validators.
- Culture-neutral Forest Settlement Foundation Pack.
- Riverward Frontier material-role set and representative source pools.
- Temperate Forest/River biome adaptation.
- Resolver provenance, deterministic seed, cache and fallback.
- Representative source tests: Small Cottage, Basic Farm Plot, Carpenter Workshop, Village Warehouse, Dirt Path/Junction, Village Well and Wooden Watchtower.
- Day/night, construction, damage/repair and missing-dependency preview fixtures.
- One restricted player cottage style/source test.

## G.2 Raid Extension

- Briarhook Raider faction overlay.
- Regional March authority reference overlay.
- Village Hall, Guard Post, Palisade Segment and Village Gate resolution.
- Ownership, guard, patrol, access, stolen-store, banner and capture modules.
- Raid-state, occupation and restoration provenance tests.

## G.3 Extended Forest Hamlet

- Complete 30-definition neutral/Riverward/forest coverage.
- High-frequency home, work, storage, civic and public source alternatives.
- Critical state variants and icon/capture coverage.
- Pack migration, save regression and multiplayer handshake.
- One public/work restricted player source and one town-style proposal.

## G.4 Early Alpha

- Emberhold Rune-Hold production pack.
- Goblin Tinker Commune production pack.
- One pastoral/mobile culture and one aquatic/wetland culture.
- Dryland, frost, swamp and mountain/underground biome packs.
- Council, charter/monarchy, guild/economy and faith modules.
- Occupation, diaspora and reconstruction overlays.
- Mixed-settlement and minority-space planner tests.

## G.5 Realm Alpha

- Verdant Covenant realm pack.
- Arrival sanctuary, portal customs and native outpost content.
- Living material/consent rules and nature-compatible automation adapter.
- One restoration project and one player realm-outpost test.
- Realm physical-law, missing-dependency and migration fixtures.

## G.6 Beta and Final

- Additional approved culture families and regional variations.
- Hybrid culture composer and world-history evolution.
- Aetheric Reach, Ancestral Veil, Impossible Deep and World-Engine production packs.
- Culture wonders and realm signature megaprojects.
- Public distribution/moderation workflow subject to separate platform policy.

# v1.0 Completion Statement

**20G v1.0 preserves Leyforge's cultural variety without allowing culture packs to become hidden gameplay registries.**

A culture can influence **how a home is built** without creating Housing from decoration.

A faction can influence **banners, guarded modules and preferred layouts** without creating political authority.

A faith can influence **shrines, ritual spaces and architectural grammar** without overwriting every individual's beliefs.

A biome can require **real environmental adaptations** without becoming a civilisation.

A realm can fundamentally change **valid construction assumptions** without being reduced to a colour palette.

A mixed settlement can contain **several architectural and cultural histories at once**.

And player-created styles can participate in the same system without bypassing universal functions, source governance or multiplayer authority.

**Next and final Document Set 20 reconciliation: 20H — Final Catalogue, Stage Matrix and Production Backlog.**
