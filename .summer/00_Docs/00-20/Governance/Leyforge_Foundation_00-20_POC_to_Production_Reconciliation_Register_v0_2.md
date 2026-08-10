# Leyforge Foundation Documents 00-20

## POC-to-Production Preservation, Supersession and Reconciliation Register

**Version:** 0.2 - Pre-Rewrite Control Register + Block/Item Identity Amendment  
**Date:** 8 August 2026  
**Scope:** Foundation Documents 00-20  
**Purpose:** Prevent accidental feature loss while reconciling the original foundation documents with the post-POC production architecture and Document Sets 19-30.  
**Project Lead and Final Authority:** Ash

> **Governing Preservation Rule**
>
> **Retire the POC scenario, never automatically retire a gameplay capability merely because the POC used it.**
>
> A named POC identity, coordinate, guaranteed relationship, scripted sequence or demonstration-only implementation may be archived. The reusable mechanic, content family, data contract, systemic consequence or player capability behind it remains unless a later approved owner explicitly replaces or rejects it.

---

# 1. Why This Register Exists

Foundation Documents 00-20 were written across several stages of Leyforge's development. Many contain strong final-game systems, but they also contain:

- Forest Hamlet proof-of-concept identities and fixed arrangements;
- early registry catalogues that are now superseded by production-governance families;
- Unreal Engine implementation assumptions that are no longer current;
- examples that later became specialised systems in Document Sets 21-30;
- duplicated responsibilities that must now consume specialist interfaces instead of owning the same truth twice.

Document Set 24 formally retired fixed POC world content from production while preserving reusable mechanics. Document Set 25 then defined the production-governance and replacement programme. Document Set 26 added maritime systems and a downstream amendment map. Final reconciled Document Sets 27-30 add economy, social, biological and movement ownership contracts.

This register is therefore the mandatory guardrail for rewriting Documents 00-20.

No foundation rewrite may delete a mechanic solely because it appears in a POC section.

---

# 2. Source Authority Used for This Reconciliation

The rewrite pass uses the following authority order when sources conflict.

| Priority | Source | Reconciliation Role |
|---:|---|---|
| 1 | Explicit approved project direction | Highest authority. |
| 2 | Document Sets 27-30 Cross-Set Interface Register v1.1 Final Reconciled | Final ownership contract between economy, social, biology and movement. |
| 3 | Document Sets 27-30 Final Reconciliation Report v1.1 | Records resolved collisions and adoption rules. |
| 4 | Specialist Sets 26-30 | Own their gameplay domains and expose interfaces to foundation documents. |
| 5 | Document Set 25 | Production governance, registry kernel, capability/package model, POC retirement, validation and replacement programme. |
| 6 | Document Set 24 | World Content Atlas, post-POC world/content relationships, production world identity and reusable content foundations. |
| 7 | Document Sets 21-23 | Asset Forge, Entity/Blueprint Forge and Presentation Forge authoring/presentation authority. |
| 8 | Documents 19-20 and 20A-20H | Settlement growth, player blueprints, seven needs and universal building/service contracts. |
| 9 | Revised 07-09 v0.2 | Newer pre-production revisions for NPC villages, automation and magic. |
| 10 | Original 00-18 v0.1 | Preserve valid intent and reusable system rules; POC/fixed/Unreal-specific sections are legacy where superseded. |
| 11 | Document 99 POC Manual Testing Guide | Historical implementation/regression evidence only; never production design authority. |

## 2.1 Non-Supersession Rule

A later specialist document does not erase an earlier gameplay idea merely by being newer. It supersedes the earlier source only for the rules it explicitly owns.

Examples:

- Set 29 owns biological Health, Stamina, Fatigue, hunger/hydration/nutrition, temperature, injury, disease and treatment formulas. Document 02 may still own progression rewards related to survival skill, but it must consume Set 29 state instead of recalculating biology.
- Set 30 owns movement execution and route accessibility. Document 07 still owns an NPC's schedule and task intent, but it submits movement intent instead of moving the NPC itself.
- Set 27 owns price formation, wages, economic contracts and public finance. Document 07 still owns the persistent person and job identity; Document 20 still owns the building/service capability.
- Set 28 owns dialogue, beliefs, rumours, social memory, trust/loyalty and companion agreements. Document 15 still owns quest objective progression.

---

# 3. Reconciliation Classifications

Every old rule encountered during rewrite must be assigned one of these treatments.

| Code | Classification | Required Treatment |
|---|---|---|
| **PRESERVE-SYSTEM** | Final-game gameplay capability | Retain and modernise. Remove POC-only assumptions around it. |
| **PRESERVE-CONTENT** | Reusable block/item/structure/creature/resource/content family | Retain as generic/registry content if still admitted by current production catalogues. Do not guarantee seed placement. |
| **GENERALISE** | Useful mechanic expressed through a fixed POC example | Rewrite as seed/context-driven behaviour. Preserve cause/effect. |
| **INTERFACE** | Rule now owned by a later specialist set | Remove duplicate formulas/state. Retain the dependency and consume typed interfaces. |
| **ARCHIVE-POC** | Named/fixed/scripted POC identity or arrangement | Move to Archived Validation / regression material. Exclude from normal production generation. |
| **SUPERSEDE-TECH** | Obsolete engine/implementation technique | Replace with current Godot/Summer architecture while preserving engine-agnostic requirements. |
| **REJECTED** | Explicitly superseded/rejected design | Remove from active production and record the successor/decision. |
| **PENDING** | Cannot be safely resolved from current approved sources | Keep non-destructively and flag for approval; do not silently choose. |

---

# 4. The POC Preservation Doctrine

## 4.1 What Is Archived

The following are **Archived Validation**, not normal production content:

- Forest Hamlet as a guaranteed/named production settlement;
- Hearthplain/controlled POC valley identities and coordinates;
- named POC residents and fixed household/job roster;
- Forest Hamlet Council, Briarhook Clan and Regional March POC political identities;
- fixed watchtower project as the mandatory tutorial/production sequence;
- scripted goblin raid chronology, fixed raid day, fixed raid captain and demonstration-only outcomes;
- guaranteed cave, mana pocket, rune clearing/ruin, goblin camp, bridge/crossing and raid approach arrangement;
- fixed first portal, fixed portal destination or guaranteed first realm;
- POC-only loot/rewards, coordinates, distances, spawn timings and demonstration-specific implementation constants;
- any production fallback that recreates the fixed POC layout when a seed fails.

## 4.2 What Must Survive

The following capabilities **must not be deleted merely because the POC demonstrated them**:

- named persistent NPCs, households, jobs, schedules, inventories, memory and migration;
- settlement warehouses and authoritative inventory transactions;
- request boards and real settlement demand;
- staged NPC construction using reserved real materials;
- watchtowers as a generic defence/observation/signalling structure family;
- warehouses, roads, bridges, ruins, camps, shrines, mines and rune/magic sites as generic structure families;
- raids, warnings, preparation, evacuation, defence, casualties, occupation, damage, repair and aftermath;
- hostile camps/nests/spawn-source mechanics where retained by current creature/world systems;
- basic and advanced automation, physical logistics, buffers, power/mana networks and settlement deliveries;
- practical magic, mana resources, runes, wards, portals, rituals, magical infrastructure and discovery;
- caves, ruins, dungeons, resource sites and mana-rich locations as procedural/generated families;
- goblins/raider-style hostile factions only if represented by current Atlas/production families; the old Briarhook POC identity itself is archived;
- resource-conserving processing chains and visible cause/effect;
- preparation changing raid/threat outcomes without guaranteeing victory;
- persistent world-state evidence, history and save/load continuity;
- adaptive UI, accessibility, controller support and readable system causality;
- simulation LOD that preserves identity, quantities, ownership and consequences;
- seed-driven world discovery and multiple valid player starts;
- the ability to build/operate cottages, watchtowers, warehouses, workshops, farms, wards and other valid building families outside any POC script.

## 4.3 POC Example Conversion Rule

When an old document says:

> "The player delivers iron to Forest Hamlet so builders construct the watchtower before the goblin raid."

The production rewrite should preserve the mechanic as something like:

> "A settlement may select or accept a defence project when its Safety demand, local threat knowledge, culture, resources, terrain and project policy justify it. Authorised stock is reserved, workers construct the project through visible stages, and the completed defence changes warning, refuge or combat outcomes."

The **scenario wrapper is archived**; the **cause-and-effect system survives**.

---

# 5. Final Cross-System Ownership Locks That Foundation Documents Must Respect

## 5.1 Set 27 - Economy

Set 27 owns:

- prices and price formation;
- currency and barter valuation;
- markets, merchant stock/economic demand;
- wages, business/enterprise economics and economic household accounting;
- economic contracts, orders, services, breach and economic remedies;
- credit, debt, banking, insurance and financial risk;
- taxation, tariffs, treasuries and public finance;
- trade-route economics and shipment commercial meaning;
- monopolies, embargoes, smuggling, black markets and economic conflict.

Foundation documents may expose inventory, jobs, routes, buildings, quests, permissions and physical outcomes to Set 27, but they must not duplicate Set 27's economic truth.

## 5.2 Set 28 - Dialogue and Social Systems

Set 28 owns:

- dialogue runtime and semantic conversation state;
- beliefs, rumours, truth/lie provenance and information spread;
- social relationships, trust, loyalty, affection, rivalry and social memory interpretation;
- persuasion, negotiation, intimidation and etiquette resolution;
- companions/followers/hirelings/temporary allies as social agreements;
- social assignments, delegation intent and off-screen social resolution;
- authored/procedural/AI-assisted dialogue governance;
- speech/social presentation metadata, while Presentation Forge renders audio/visual output.

Document 07 remains owner of the persistent person, household, job and schedule. Document 13 remains owner of culture/faction/political world state. Document 15 remains quest/event owner.

## 5.3 Set 29 - Survival, Health and Biology

Set 29 owns:

- biological Health state and natural recovery;
- Stamina, exertion and Fatigue biology;
- hunger, hydration and nutrition;
- temperature, wetness, sleep/rest and environmental exposure;
- wounds, bleeding, pain and functional impairment;
- disease, infection, poison/toxin and biological hazards;
- medicine, first aid, healing, treatment and rehabilitation;
- biological profiles and biological modifiers;
- biological simulation LOD and biological view models.

Document 16 owns combat damage generation, combat/downed/death rules and combat execution. Document 11 provides environmental exposure facts. Document 20 provides facilities/capacity. Set 29 resolves biological consequences.

## 5.4 Set 30 - Movement, Traversal and Transportation

Set 30 owns:

- terrestrial movement execution and movement states;
- climbing, vaulting, mantling, ladders, ropes and grappling;
- falling, gliding and aerial traversal;
- mounts/riding;
- handcarts, wagons, carriages and caravans as movement execution;
- rails, minecarts, elevators and powered land transportation;
- physical routes, terrain accessibility, travel time and long-distance movement execution;
- NPC navigation, local path execution, formations and movement LOD;
- universal movement facade and movement evidence.

Set 26 retains detailed aquatic locomotion/water ownership through the final reconciled boundary. Set 30 exposes the universal movement facade without duplicating Set 26 swimming physics.

## 5.5 Shared Technical Envelope

World time, global presence state and cross-set evidence/idempotency are shared technical contracts. Foundation Documents 07, 15, 18 and all persistent systems must use one authoritative world timeline and stable evidence references rather than inventing parallel clocks or duplicate consequences.

---

# 6. Foundation Document Treatment Matrix 00-20

| Doc | Current Foundation State | Reconciliation Treatment | Resulting Target |
|---|---|---|---|
| **00** | v0.1, strong vision with active POC framing | Major revision | **v1.0 Production Master Game Design Bible** |
| **01** | v0.1, flexible loop but POC demonstration sections | Major revision | **v1.0 Production Core Gameplay Loop** |
| **02** | v0.1, progression owns some now-specialist survival/movement detail | Major revision | **v1.0 Player Progression and Capability System** |
| **03** | v0.1 POC-era block catalogue | **Complete replacement** | **v1.0 Canonical Blocks Registry Framework + production families** |
| **04** | v0.1 POC-era item catalogue | **Complete replacement** | **v1.0 Canonical Items Registry Framework + production families** |
| **05** | v0.1 POC-era recipe catalogue | **Complete replacement** | **v1.0 Canonical Crafting/Recipe/Transaction Registry** |
| **06** | v0.1 universal ladder emphasis | **Complete replacement** | **v1.0 Resource, Material Ecology and Capability Progression** |
| **07** | v0.2 newer settlement/NPC revision, still POC test block | Major revision | **v1.0 Persistent People and NPC Civilisation Runtime** |
| **08** | v0.2 newer automation revision, still fixed technical POC chain | Major revision | **v1.0 Automation, Logistics, Power and Control System** |
| **09** | v0.2 newer magic revision, still fixed technical POC sequence | Major revision | **v1.0 Magic, Mana and Civilisation Magic System** |
| **10** | v0.1 POC creature roster mixed with final ecology | Major revision | **v1.0 Creature, Ecology, Threat and Monster System** |
| **11** | v0.1 controlled-valley assumptions | **Complete replacement** | **v1.0 Production World Generation, Regions and Biomes** |
| **12** | v0.1 fixed POC structures mixed with reusable structure runtime | Major revision | **v1.0 Structures, Sites and Persistent World Infrastructure** |
| **13** | v0.1 with POC cultures/factions | Major revision | **v1.0 Peoples, Cultures, Factions, Governments and Identity Layers** |
| **14** | v0.1 realm framework + teaser assumptions | Major revision | **v1.0 Dimensions, Realms and Inter-Realm Systems** |
| **15** | v0.1 fixed Forest Hamlet arc mixed with strong generic quest/event system | Major revision | **v1.0 Quest, Event, History and World-Consequence System** |
| **16** | v0.1 strong combat with POC raid and pre-Set29/30 ownership | Major revision | **v1.0 Combat, Gear, Defence and Conflict System** |
| **17** | v0.1 strong UI foundation but missing post-24/25/26-30 views | Major revision | **v1.0 UI/UX, Accessibility and Player Information Architecture** |
| **18** | v0.1 Unreal/POC technical plan | **Complete replacement** | **v1.0 Godot/Summer Engine Production Technical Architecture** |
| **19** | v0.1 Godot-era settlement/blueprint system with POC scenario | Major revision | **v1.0 Settlement Growth, District Planning and Player Blueprint System** |
| **20** | v0.2 Forge/Godot-aware building framework with POC milestone labels | Major reconciliation | **v1.0 Buildings, Facilities, Services and Settlement Projects** |

---

# 7. Detailed Required Reconciliation by Foundation Document

## 7.1 Document 00 - Master Game Design Bible

### Preserve

- four-pillar identity: survival sandbox + civilisation sandbox + automation/factory + fantasy RPG;
- sandbox-first player freedom;
- living-world promise;
- magic and production changing civilisation/world state;
- multiple player fantasies, including peaceful, heroic, neutral, exploitative and conqueror paths;
- voxel-first readability and building freedom;
- multiplayer/split-screen as intended architectural requirements unless later project direction changes them.

### Remove/Archive

- active POC target as a design destination;
- Forest Hamlet/fixed-valley assumptions;
- wording that implies later detailed documents are still future/undefined.

### Add/Integrate

- seed-generated Living Frontier production identity from 24/25;
- capability/package governance and production tiers;
- Unified Forge split: Asset, Entity/Blueprint and Presentation;
- maritime/ocean/vessel fantasy from Set 26;
- economy as living civilisation infrastructure from Set 27;
- dialogue/social/companion depth from Set 28;
- biological survival/health from Set 29;
- traversal/transport as a first-class world system from Set 30;
- current Godot + Summer Engine development direction without making the design bible an engineering document;
- explicit one-owner/typed-interface rule.

## 7.2 Document 01 - Core Gameplay Loop

### Preserve

- **Explore -> gather -> craft -> build -> interact -> automate -> defend -> upgrade -> expand** as a broad flexible loop;
- seed-adaptive starts;
- optional guidance;
- no mandatory ending;
- multiple valid playstyles.

### Generalise

- any fixed village/watchtower/goblin demonstration chain;
- tutorial assumptions that require one specific settlement/resource/ruin.

### Add

- maritime loops: sail, dive, fish, salvage, trade, rescue, repair, voyage;
- economy loops: trade, contracts, enterprise, shipment, public works and economic consequences;
- social loops: conversation, rumours, relationships, companions, delegation;
- biological loops: preparation, nutrition/exposure/recovery/treatment as configurable survival depth;
- movement loops: traversal, mounts, transport, route planning, physical accessibility;
- generated histories, ecological pressure, site state and realm routes from the Atlas.

## 7.3 Document 02 - Player Progression

### Preserve

- classless/hybrid progression;
- overall level as broad reward rather than universal gate;
- use-based skills and perk trees;
- knowledge/research/discovery progression;
- eventual broad mastery without permanent class lock;
- progression through civilisations, reputation, exploration, magic and automation.

### Interface Corrections

- Set 29 owns biological Health/Stamina/Fatigue and survival formulas; Document 02 owns progression that may modify/unlock interactions with them.
- Set 30 owns movement physics/execution; Document 02 owns movement-related skill/perk progression and capability unlocks, not transforms or stamina formulas.
- Set 27 owns economic calculations; Document 02 may own trading/leadership/economic progression benefits but consumes Set 27 outcomes.
- Set 28 owns social resolution; Document 02 may unlock social perks/knowledge but not calculate persuasion/trust.

### Add

- capability bands CAP-00 to CAP-10 and substitute/fallback philosophy from Set 25;
- aquatic survival, diving, shipwright, sailing/navigation, fishing/ecology, maritime trade, crew leadership and damage-control paths;
- social, companion and delegation progression hooks;
- biological resilience/knowledge progression only as modifiers/interfaces, never duplicate biology;
- movement/traversal progression hooks;
- production-stage/settlement terminology aligned with Documents 19/20 and Set 25.

## 7.4 Document 03 - Blocks Registry - COMPLETE REPLACEMENT

### Preserve

- block/item separation;
- voxel-first physical truth;
- stable IDs and data-driven inheritance;
- shapes, states, mining, damage/repair, functional blocks, automation/magic blocks and realm families;
- older materials retaining usefulness where current production contracts support them.

### Replace

- v0.1 80-120-entry POC-target catalogue as canonical scope;
- POC Required/Alpha planning columns as gameplay fields;
- old Unreal asset paths and generated registry assumptions;
- simple universal tier assumptions where Set 25 capability/provenance rules supersede them.

### Intake

- Set 25H's production block-family contracts;
- Set 25 registry kernel/schema/provenance/pack rules;
- maritime structural, dock, port, pump, vessel and suitability facets from Set 26;
- movement-facing surface/route facets from Set 30;
- biological/environmental interaction facets only where the block exposes environment facts to Set 29;
- Presentation Forge event/material/surface hooks without making presentation the gameplay owner.

## 7.5 Document 04 - Items Registry - COMPLETE REPLACEMENT

### Preserve

- separate item identity from blocks;
- inventory, stack/instance state, durability, quality, equipment, consumables, magic components, machine parts, knowledge items and provenance;
- real ownership and authoritative transactions.

### Replace

- old fixed POC item roster as canonical scope;
- static price/value ownership: Set 27 owns economic valuation/price formation;
- survival/body formulas: Set 29 owns biological effects;
- movement physics embedded in equipment: Set 30 consumes item capability facets.

### Intake

- Set 25I production item families;
- Set 25 provenance/scarcity/quality/condition/significance separation;
- Set 26 shipwright, diving, navigation, fishing, vessel/cargo/salvage/naval families;
- Set 29 treatment/biological capability facets;
- Set 30 movement equipment/vehicle-part facets;
- Set 28 social/knowledge objects without embedding dialogue state;
- Set 27 economic descriptors without embedding dynamic prices.

## 7.6 Document 05 - Crafting and Recipe Registry - COMPLETE REPLACEMENT

### Preserve

- unified transformation registry concept;
- exact inputs/outputs/by-products;
- shaped/shapeless/station/machine/project/magic processes;
- authoritative reservation/transaction logic;
- discovery/research/teaching/faction unlock routes;
- repair, maintenance, cooking and batch processing.

### Replace

- fixed POC watchtower/iron/mana demonstration sequence as progression authority;
- any recipe-owned economic price formula;
- any recipe-owned biological result formula beyond invoking Set 29 treatment/consumption effects;
- old catalogue counts as production truth.

### Intake

- Set 25J 105 chain contracts and substitution/provenance/conservation rules;
- Set 26 vessel construction/refit/repair, shipyard, fishing/preservation and maritime chains;
- Set 29 treatment/medicine/food-effect interface hooks;
- Set 30 movement gear/vehicle component recipes without movement physics.

## 7.7 Document 06 - Resource Progression - COMPLETE REPLACEMENT

### Preserve

- resources have multiple long-term uses;
- old materials stay relevant through construction, repairs, culture, trade, machines, services and recipes;
- resource grades/purity/provenance where current schemas support them;
- resources connect survival, civilisation, automation, magic, trade and realms.

### Replace

- one universal linear ladder as the global progression truth;
- POC-specific iron-watchtower and mana-chain sequencing;
- any assumption that rarity, quality, provenance, scarcity, progression and economic value are one concept.

### Target Model

Use parallel capability pathways based on:

- material properties;
- ecology and renewability;
- culture/knowledge;
- tools and processes;
- provenance and legality;
- settlement/industrial demand;
- magical compatibility;
- realm access;
- trade/import substitutes;
- capability fallbacks.

Add marine biological resources, coastal materials, salvage/provenance and shipbuilding/repair demand from Set 26.

## 7.8 Document 07 - NPC Village System

### Preserve

- persistent named people;
- households, homes, jobs, schedules, inventories and memories;
- authoritative village stock and real consumption;
- seven-needs integration;
- labour, migration, construction participation and simulation LOD;
- persistent injury/death/migration/conquest/recovery consequences.

### Archive/Generalise

- Forest Hamlet roster and fixed jobs;
- fixed watchtower/raid tutorial loop;
- POC political identities.

### Ownership Corrections

- Set 28 owns dialogue, social relationship interpretation, trust/loyalty mechanics and companion agreements; Document 07 owns persistent person/household/job identity and exposes facts.
- Set 27 owns wages, prices, markets and economic contracts; Document 07 owns workers/households and exposes capacity/needs.
- Set 29 owns biological state; Document 07 consumes population-health and care-demand summaries.
- Set 30 owns movement/path execution; Document 07 schedules/tasks submit movement intents.

### Add

- maritime professions, crews, ports, shipbuilding labour and coastal settlement participation from Set 26;
- generated cultures/settlements from 24E/25G;
- final cross-set time/evidence envelopes.

## 7.9 Document 08 - Automation System

### Preserve

- physical, resource-conserving automation;
- typed item/fluid/power/mana/control/freight/portal networks where approved;
- visible local flow and bounded distant summaries;
- work-in-progress persistence;
- output/buffer blocking rather than resource deletion;
- permissioned settlement delivery;
- maintenance/risk with readable causes;
- NPC-supported labour rather than eliminating civilisation simulation.

### Archive/Generalise

- fixed miner -> chute -> furnace -> warehouse -> watchtower chain;
- Forest Hamlet-specific endpoints and project reserve.

### Add/Interfaces

- Set 27 consumes logistics outputs for commercial shipments; automation does not price cargo.
- Set 30 owns movement execution for mobile land transport/dispatch; automation requests transport services.
- Set 26 adds pumps, winches, cranes, vessel networks, port logistics and bounded maritime automation.
- Set 29 owns biological consequences of pollution/toxins/exposure if such systems are enabled.
- Document 20D/20E remain building/public-network owners where defined.

## 7.10 Document 09 - Magic System

### Preserve

- practical magic as infrastructure and personal capability;
- personal mana vs conserved external mana distinction;
- runes, wards, rituals, enchanting, alchemy, summons, portals and cultural interpretation;
- magic discovery through world/NPC/research paths;
- no mandatory separate Divine school; faith/sacred interpretation can layer over schools;
- magic complements tools, labour and automation rather than replacing them.

### Archive/Generalise

- fixed Raw Mana -> Rune -> Ward tutorial sequence as mandatory progression;
- guaranteed POC mage/ruin/ward site.

### Add/Interfaces

- Set 29 owns biological effects of healing, poison cleansing, disease and biomancy consequences; magic invokes typed biological effects.
- Set 30 owns physical movement execution; movement magic provides approved movement providers/modifiers rather than writing transforms directly.
- Set 26 adds breathing/pressure/navigation/weather sensing/propulsion/pump/preservation/rescue maritime applications without requiring a new maritime school.
- Set 28 owns social interpretation/dialogue consequences; Document 09 exposes magical acts/evidence.

## 7.11 Document 10 - Creatures and Monsters

### Preserve

- ecology-driven spawning/habitat;
- readable creature roles, senses, morale, weak points and counterplay;
- nests/camps/territory/pressure;
- taming/mount potential where approved;
- creature interaction with settlements, structures, magic and world state;
- bosses/major threats with preparation and persistent aftermath.

### Archive/Generalise

- fixed POC roster and guaranteed encounter mix;
- Briarhook raid enemies, fixed captain and scenario-only spawn configuration as production identity;
- guaranteed cave/wisp/camp positions.

### Add/Interfaces

- Atlas 24F-24H ecology/threat families;
- Set 26 marine ecology, fishing, sea creatures and marine bosses;
- Set 29 owns executable disease/biology state while Document 10/24F may own host/ecology context;
- Set 30 executes creature movement/navigation using profiles;
- Set 28 may consume creature knowledge/rumours but does not own creature truth.

## 7.12 Document 11 - Biomes and World Generation - COMPLETE REPLACEMENT

### Preserve

- deterministic seed generation;
- regions/biomes/caves/rivers/resources/structures/roads/leylines/dynamic state;
- readable environmental clues;
- save-safe explored-world stability;
- performance/LOD-aware generation.

### Remove

- controlled POC valley and guaranteed named sites;
- fallback to historical layout;
- fixed starter village/cave/mana/ruin/camp relationships.

### New Production Contract

- named sub-seeds and deterministic lineage;
- relationship-driven topology graph;
- suitability/exclusion rules;
- capability guarantees and substitute/fallback paths;
- bounded deterministic repair or controlled generation failure;
- generated regions, cultures, settlements, ecology, history, sites and realm links;
- oceans/coasts/islands/bathymetry/currents/tides/storm relationships from Set 26;
- movement-facing terrain/environment snapshots to Set 30;
- environmental exposure snapshots to Set 29, never direct mutation of biological state;
- no active POC IDs in production manifests.

## 7.13 Document 12 - Structures

### Preserve

- structure definition vs blueprint source vs runtime instance separation;
- dynamic states: damage, occupation, abandonment, restoration, corruption, activation, ownership;
- routes/access/markers/sockets;
- structures as functional exploration/world-state anchors;
- construction/repair/claim/restoration consequences.

### Archive/Generalise

- fixed POC arrangement and guaranteed sites;
- named Forest Hamlet watchtower/warehouse/bridge/ruin/camp as production instances.

### Preserve as Generic Families

Watchtowers, warehouses, roads, bridges, ruins, camps, shrines, mines, dungeons, ports and other approved families remain legitimate production content.

### Add

- Atlas 24I grammars and infrastructure relationships;
- Set 26 ports, harbours, wrecks, lighthouses, docks, shipyards, coastal defence and submerged structures;
- Set 30 movement anchors, routes, doors, loading points and navigation revisions;
- Set 29 shelter/exposure interfaces;
- Blueprint Forge ownership for editable structure source.

## 7.14 Document 13 - Races, Peoples, Cultures and Factions

### Preserve

- strict separation of ancestry/people, culture, language, religion/philosophy, citizenship, faction, government/law, territory and history;
- no ancestry inherently good/evil/civilised/primitive/magical/industrial/peaceful/hostile;
- culture changes and factions may cross identity groups;
- diplomacy, laws, technology and cultural practices as independent layers.

### Archive

- Riverward Frontier Folk/Briarhook/Regional March POC assumptions unless independently reintroduced through Atlas under new production definitions;
- fixed starter culture/faction relationships.

### Add/Interfaces

- Atlas 24E reusable peoples/culture/faction packages;
- Set 27 economic institutions consume culture/law/faction facts but own economy;
- Set 28 social systems consume culture/language/law/political authority but own social resolution;
- Set 26 maritime traditions/fleets/ports/navigation practices;
- Set 29 biological profiles must not become ancestry stereotypes;
- Set 30 mobility/access can vary by body/equipment/environment through typed profiles, not racial hardcoding.

## 7.15 Document 14 - Dimensions

### Preserve

- realms as persistent alternate worlds rather than loot rooms;
- portal anchors/addressing/stability/ownership/hazards;
- unique ecology/resources/societies while preserving Overworld relevance;
- realm settlements use the same seven needs adapted to environment;
- cross-realm consequences and logistics.

### Archive/Generalise

- fixed first portal/destination and POC portal teaser as production route;
- guaranteed realm ordering.

### Add

- Atlas 24D realm topology and packages;
- Set 25 production classification, including full/conditional/teaser realm treatments;
- Set 26 maritime/pressure/water adaptations and approved cross-realm vessels/logistics;
- Set 27 cross-realm commerce interfaces;
- Set 28 realm knowledge/rumour/social interpretation;
- Set 29 realm biological exposure;
- Set 30 realm movement/accessibility providers.

## 7.16 Document 15 - Quest and Event System

### Preserve

- authored + simulation-driven quests/events;
- multiple solution methods;
- failure as changed world state rather than mandatory reload;
- world events progressing with/without player;
- persistent evidence/aftermath;
- real inventory/project/settlement state as objective truth;
- optional sandbox guidance rather than mandatory campaign.

### Archive/Generalise

- Forest Hamlet Watchtower Arc as production mainline;
- fixed goblin raid/mana discovery chronology and named participants.

### Add/Interfaces

- Atlas 24K generated histories/arcs/events;
- Set 27 economic contracts remain economic truth; quests may present/track them;
- Set 28 dialogue/social outcomes provide evidence; quests decide objective progression;
- Set 29 illness/injury/treatment quests consume biological events rather than duplicating illness state;
- Set 30 journey/arrival/movement evidence drives travel objectives;
- Set 26 maritime voyages, rescue, shipbuilding, port crises, storms, piracy, trade, wreck and marine events.

## 7.17 Document 16 - Combat, Gear and Defence

### Preserve

- deep but readable action-survival combat;
- melee/ranged/magic/stealth/support/command/escape/surrender/capture options;
- gear durability/repair/material identity;
- guards, fortifications, raids, siege and preparation;
- persistent injuries/casualties/damage/aftermath;
- accessibility and difficulty scaling.

### Archive/Generalise

- fixed Forest Hamlet raid as production encounter;
- POC goblin roster/captain and fixed outcome table as canonical threat model.

### Ownership Corrections

- Set 29 owns biological Health/injury/bleeding/poison/treatment state. Document 16 owns attack/damage generation, combat execution, downed/death rules and requests biological resolution.
- Set 30 owns movement execution, impulses/locks and movement states; combat requests/consumes them.
- Set 28 owns intimidation/social surrender willingness where social resolution is required; combat owns physical execution.

### Add

- underwater modifiers, vessel weapons, boarding, flooding/fire, damage control and naval/coastal conflict from Set 26;
- Atlas production creature/boss/threat families;
- economic/legal aftermath interfaces where relevant without duplicating Set 27 or governance systems.

## 7.18 Document 17 - UI/UX System

### Preserve

- world-first minimal/contextual UI;
- progressive disclosure;
- consistent interaction grammar;
- knowledge-aware presentation;
- controller, split-screen, accessibility, localisation and remapping foundations;
- UI consumes authoritative view models and sends validated commands; it never invents gameplay truth.

### Archive/Generalise

- Forest Hamlet-specific POC screen flow as production onboarding requirement.

### Add

- registry/dependency/provenance/world inspectors where player/developer appropriate;
- seed/world-profile/settings UI;
- economy view models from Set 27;
- dialogue/social/companion/rumour interfaces from Set 28;
- biological status/view-model and accessibility requirements from Set 29;
- movement/traversal/transport route/reason view models from Set 30;
- maritime helm/vessel/port/cargo/fleet/combat/ecology UI from Set 26;
- Presentation Forge critical cue/equivalent-channel contracts;
- comprehensive world-creation simulation complexity and low-end scalability settings.

## 7.19 Document 18 - Technical Implementation Plan - COMPLETE REPLACEMENT

### Retain Engine-Agnostic Principles

- stable namespace IDs;
- validated registries and generated runtime data;
- deterministic seed generation and seed-plus-delta persistence;
- authoritative state/transactions;
- simulation LOD with identity/conservation;
- save versioning, migration, recovery and diagnostics;
- multiplayer-ready authority boundaries;
- performance budgets, profiling, CI, testing and release gates;
- mod/content-pack boundaries.

### Remove/Supersede

- Unreal Engine 5 as engine direction;
- C++/Blueprint module plan;
- Unreal-specific asset paths, World Partition assumptions and POC milestone architecture;
- fixed Forest Hamlet technical acceptance as production architecture.

### New Mandatory Inputs

- actual read-only audit of current Godot/Summer repository before exact module/path claims;
- Set 25 registry kernel, schemas, packs, migration and validation;
- Forge 21-23 Godot authoring/runtime contracts;
- Set 26 water/vessel/moving-frame/network/save/performance requirements;
- Set 27 economy authority, transaction/evidence/LOD requirements;
- Set 28 social persistence/revision/multiplayer requirements;
- Set 29 biological services/scheduler/persistence/networking requirements;
- Set 30 movement services/navigation/prediction/persistence requirements;
- final v1.1 cross-set time/presence/evidence envelopes.

## 7.20 Document 19 - Settlement Growth, District Planning and Player Blueprints

### Preserve

- dual player blueprint creation modes;
- settlement growth orchestration, parcels, roads, districts and project pools;
- exact material calculation and staged construction;
- NPC builder labour and authoritative reservations;
- player-founded settlements and existing-town proposals;
- culture palettes/style kits;
- damage/repair/upgrade and simulation LOD.

### Archive/Generalise

- Forest Hamlet watchtower + player cottage as production-mandatory scenario;
- fixed starter settlement growth path tied to POC identities.

### Add

- Set 25 production stage/package naming and POC archive separation;
- Set 26 vessel blueprint/Workshop links, waterfront planning, docks/ports/shipyards and water-site validation;
- Set 27 contract/finance interfaces for commissioned projects without making Document 19 economic owner;
- Set 28 social consent/assignment interfaces for occupants/workers without owning social truth;
- Set 29 shelter/health/care requirements as service demand inputs;
- Set 30 movement anchors, routes, doors, loading points and navigation revisions;
- maintain 26I as Vessel Forge specialist and 22I as Blueprint Forge official-authoring specialist.

## 7.21 Document 20 - Buildings, Facilities, Construction and Settlement Projects

### Preserve

- **exactly seven main settlement needs:** Housing, Provisions, Health, Work, Safety, Infrastructure and Morale;
- universal function separate from blueprint source, construction project and runtime structure instance;
- functional activation contracts;
- real resource/labour/network/permission requirements;
- culture/biome/realm variants through packs rather than duplicate functions;
- nearby physical and distant deterministic simulation;
- building/service capability is not created by appearance alone.

### Reconcile

- remove "POC Required"/Forest Hamlet milestone wording from active production status;
- keep valid buildings such as watchtowers, warehouses, roads, wells, clinics, workshops and markets as generic universal definitions where current catalogue supports them;
- move technical POC groupings into Archived Validation/test provenance.

### Add

- Set 26 universal maritime services: ports, harbours, shipyards, lighthouses, fisheries, rescue, customs and maritime support where approved;
- Set 27 economy consumes building capacity/stock/labour but owns markets/contracts/finance/taxes; 20C governance/law remains court/justice facility owner;
- Set 28 consumes spaces/people/authority references but owns dialogue/social meaning;
- Set 29 population-health/medical-demand and treatment-capacity interfaces;
- Set 30 movement anchors/routes/doors/loading points/accessibility/navigation revisions;
- Presentation Forge semantic event/anchor obligations where required, without presentation owning building function.

---

# 8. Cross-Foundation POC Feature Preservation Matrix

| Old POC Element | Production Treatment | What Survives |
|---|---|---|
| Forest Hamlet | ARCHIVE-POC | Generated settlements, persistent residents, seven needs, projects, warehouses, defence, history. |
| Named POC villagers | ARCHIVE-POC | Persistent named NPC identity, households, jobs, schedules, relationships and memory. |
| Forest Hamlet Council | ARCHIVE-POC | Councils/governments as generic political/settlement structures. |
| Briarhook Clan | ARCHIVE-POC | Raider/hostile factions as generated faction families; no ancestry-based hostility. |
| Regional March Authority | ARCHIVE-POC | Regional authorities/governments as generated identities. |
| Fixed valley | ARCHIVE-POC | Seed-generated regions/topology/biomes with capability guarantees and repair. |
| Guaranteed cave | ARCHIVE-POC | Cave/dungeon/site grammar and procedural underground access. |
| Fixed mana pocket | ARCHIVE-POC | Mana-rich resource/site families selected by world rules. |
| Fixed rune ruin | ARCHIVE-POC | Rune/magic ruins and discovery sites as generated structures. |
| Fixed goblin camp | ARCHIVE-POC | Hostile camps/nests/territory/pressure systems. |
| Fixed watchtower project | ARCHIVE-POC + PRESERVE-CONTENT | Watchtower universal structure family; defence projects driven by need/context. |
| Fixed warehouse delivery | ARCHIVE-POC + PRESERVE-SYSTEM | Authoritative warehouse transactions, permissions, reservations and deliveries. |
| Scripted goblin raid | ARCHIVE-POC + PRESERVE-SYSTEM | Generic raids/threat events, warning, preparation, multiple outcomes and aftermath. |
| Raid captain | ARCHIVE-POC | Elite/leader threat roles from current creature/faction registries. |
| Day-4 raid timing | ARCHIVE-POC | Event timing/pressure driven by simulation and settings. |
| Watchtower improves raid outcome | GENERALISE | Defensive services alter warning/refuge/response/line-of-sight/outcomes without guaranteeing victory. |
| Basic mechanical miner chain | GENERALISE | Resource-conserving automation, extraction, logistics, processing, buffers and settlement supply. |
| Chutes/crates/furnace routing | PRESERVE-CONTENT/SYSTEM | Typed logistics/storage/processing families where admitted to production registries. |
| Raw Mana Crystal -> Shard -> Dust | PENDING REGISTRY ADMISSION | Mana material transformation concept may survive, but exact starter chain is not mandatory unless v1.0 registries admit it. |
| Basic Rune / Ward Anchor | PRESERVE-CONTENT if admitted | Runes/wards remain core magic concepts; specific IDs/recipes require production-registry confirmation. |
| Stone Sense / Spark Bolt | PENDING CONTENT ADMISSION | Personal spell examples remain only if current magic/content registries promote them; magic capability itself survives. |
| Fixed first portal teaser | ARCHIVE-POC | Portal/realm access, stability, ownership, hazards, safe return and generated route families. |
| Fixed POC tutorial chain | ARCHIVE-POC | Optional onboarding/guidance generated from authoritative capability gaps and world context. |
| POC save fixtures | ARCHIVED VALIDATION | Retain explicitly namespaced regression fixtures; never normal world generation. |

---

# 9. Later Document Set Intake Matrix

| Later Set | Foundation Documents Most Affected | Mandatory Reconciliation Theme |
|---|---|---|
| **19** | 07, 11-12, 17-20 | Settlement orchestration, parcels, districts, player blueprints, NPC construction. |
| **20/20A-H** | 07-09, 11-17, 19-20 | Seven needs, universal building/service contracts, construction/runtime separation. |
| **21** | 03-06, 08-09, 12, 16-18, 20 | Voxel Asset Forge source/runtime separation, material/visual authoring, migration. |
| **22** | 07, 10, 12-13, 16-20 | Entity/rig/animation ownership, Blueprint Forge, semantic structure source. |
| **23** | 03-18, 20 | Presentation events, spatial anchors, voxel VFX, audio, accessibility equivalents, bounded runtime. |
| **24** | 00-17 | Post-POC world/content canon; seed-generated Atlas families; removes fixed POC production identities. |
| **25** | 00-18 and governance of 19-20 integration | Production registry kernel, capabilities, packs, provenance, lifecycle, POC retirement, replacement programme. |
| **26** | 00-20 | Oceans, water, swimming/diving, vessels, shipbuilding, ports, maritime civilisation, naval combat, marine ecology. |
| **27** | 00-09, 12-17, 19-20 | Economy, prices, markets, wages, contracts, finance, taxes, trade economics. |
| **28** | 00-02, 07, 13, 15-18, 19-20 | Dialogue, information, relationships, social resolution, companions, delegation. |
| **29** | 00-02, 04-05, 07, 09-11, 15-18, 20 | Health/survival biology, exposure, injury/disease/treatment, biological view models. |
| **30** | 00-20 | Canonical movement/traversal/transport, route accessibility, NPC path execution, movement evidence. |

---

# 10. Foundation Header Contract for All v1.0 Rewrites

Every rewritten foundation document should begin with a compact governance header containing at least:

| Field | Purpose |
|---|---|
| **Production Status** | Current authority/lifecycle state. |
| **Supersedes** | Exact prior document/version. |
| **System Ownership** | What this document owns. |
| **Consumes Interfaces From** | Later specialist systems it references without duplicating. |
| **Does Not Own** | Explicit adjacent boundaries. |
| **POC Treatment** | What was archived/generalised/preserved. |
| **Production Sources** | Approved later documents that materially amend this foundation. |
| **Engine Direction** | Godot/Summer where technically relevant. |
| **Migration/Compatibility** | Required when IDs, schemas, saves or old content are affected. |

Each document must include a **Supersession and Preservation Notes** section near the end recording exactly what changed from the old source.

---

# 11. Reconciliation Validation Rules

A foundation v1.0 rewrite fails review if any of the following occur:

1. A reusable mechanic disappears only because it was demonstrated in the POC.
2. A retired Forest Hamlet identity remains required by normal production generation.
3. A foundation document duplicates a formula/state owned by Sets 27-30.
4. A foundation document treats an Asset/Entity/Blueprint/Presentation asset as gameplay truth.
5. Document 18 reintroduces Unreal-specific architecture as current direction.
6. Documents 03-06 retain old POC catalogues as the canonical production registries instead of consuming Set 25 contracts.
7. Document 11 guarantees fixed starter geography instead of capability/relationship-based generation.
8. A watchtower, warehouse, road, camp, ruin, ward or similar generic family is deleted simply because it appeared in the POC.
9. Production worlds can fall back to the old POC valley when generation fails.
10. POC IDs/assets/scenes can enter a normal production pack without an explicit archived-validation profile.
11. UI writes gameplay truth directly instead of issuing validated commands/consuming view models.
12. LOD creates or destroys important resources, money, health state, movement outcomes, NPC identity or project history.
13. A social/economic/biological/movement consumer recreates the owner's internal formula instead of using the interface.
14. A rewrite silently changes a stable ID or save meaning without alias/migration/tombstone treatment.
15. The resulting document claims implementation completion where only design/specification exists.

---

# 12. Recommended Rewrite Order

To minimise circular edits, use this order:

1. **00** - production vision and authority frame.
2. **01** - player-facing game loop.
3. **02** - progression/capability frame.
4. **18** - Godot/Summer technical architecture **after a repository audit**, if the repository is available; otherwise draft only the design-level technical contract and leave exact paths/budgets pending.
5. **03-06** - replacement physical registries and transformation/resource model.
6. **11** - replacement world generation.
7. **07-10** - NPC, automation, magic, creatures.
8. **12-14** - structures, identities/cultures/factions, dimensions.
9. **15-17** - quests/events, combat, UI/UX.
10. **19-20** - settlement/blueprint and building/service reconciliation after all consumed interfaces are stable.
11. Run one final **00-20 cross-reference and ownership audit**.
12. Package the approved v1.0 foundation documents as individual files inside a single ZIP.

### 12.1 Practical Documentation Order Adjustment

If the current Godot repository is not available for inspection, Document 18 should be placed after Documents 00-17/19-20 in the writing sequence, while its required interface list remains frozen by this register. This avoids inventing exact implementation facts.

---

# 13. Source Recovery Status Before Rewriting

| Document Range | Current Recovery State |
|---|---|
| 00-06 | Exact Markdown currently mounted. |
| 07 | Newer v0.2 source located in File Library. |
| 08 | Newer v0.2 source located in File Library. |
| 09 | Newer v0.2 source located in File Library. |
| 10-14 | Original v0.1 copies are recoverable from File Library; no newer approved production rewrite has yet replaced them. |
| 15-20 | Exact current Markdown mounted; Document 20 is v0.2. |
| 20A-20H | Complete v0.2 package mounted in Document Set 20 ZIP. |
| 21-22 | Complete source packages mounted. |
| 23 | Presentation Forge 23A-23J exists in File Library; current 7z package is retained as source archive. |
| 24-26 | Complete source packages mounted. |
| 27-30 | Final reconciled v1.1 outer package mounted, including final v0.2 J documents and cross-set contracts. |

No rewritten Document 07-14 should be finalised from summaries if the exact source can be recovered. Exact source recovery is part of the rewrite task, not optional cleanup.

---

# 14. Change-Control Record Required Per Rewritten Document

Every v1.0 rewrite must carry a short ledger using this format:

```text
Foundation Reconciliation Record
- previous_source:
- new_version:
- preserved_systems[]:
- preserved_content_families[]:
- poc_archived[]:
- generalised_examples[]:
- specialist_interfaces_added[]:
- duplicate_authority_removed[]:
- technical_supersessions[]:
- registry_or_id_migrations[]:
- open_questions[]:
- validation_status:
- approval_status:
```

This lets future AI/developers distinguish deliberate removals from accidental omissions.

---

# 15. Foundation Reconciliation Definition of Done

The 00-20 foundation reconciliation is complete only when:

- all 21 foundation documents have an approved v1.0 revision/replacement;
- no active foundation instruction depends on Forest Hamlet or another retired POC identity;
- the POC survives in an explicit Archived Validation/test package;
- generic POC-demonstrated mechanics have been preserved or deliberately rejected with evidence;
- Documents 03-06 match the Set 25 production registry/capability model;
- Document 11 matches the post-Atlas deterministic seed/relationship/repair model;
- Document 18 is fully Godot/Summer aligned and grounded in actual implementation evidence where it claims implementation specifics;
- Documents 19-20 consume the final economy/social/biology/movement contracts;
- Sets 26-30 are represented through interfaces without duplicating their specialist rules;
- all cross-document links and ownership statements resolve;
- POC leakage checks find no retired identities in normal production scope;
- migration/tombstone/alias treatment exists for any stable identity being retired or renamed;
- the complete approved set is packaged as individual Markdown documents in one Foundation ZIP.

---

# Appendix A. Hard Preservation Locks

The following design promises may not be removed during reconciliation without explicit new approval:

- voxel sandbox freedom and physical world editing;
- living NPC civilisations with persistent people and consequences;
- settlement growth and the seven-needs model;
- exact real resource consumption for meaningful construction/production;
- player and NPC building/construction;
- automation and logistics that can support civilisation;
- practical magic as both personal power and infrastructure;
- authored + systemic quests/events with persistent aftermath;
- classless/multi-track progression and multiple viable playstyles;
- procedural/seed-generated production worlds;
- dynamic cultures/factions/settlements rather than one fixed tutorial civilisation;
- structures that can be damaged, occupied, repaired, restored or repurposed;
- multiple dimensions/realms with persistent consequences;
- combat, defence and raids where preparation matters;
- maritime/ocean/vessel systems admitted through Set 26;
- economy admitted through Set 27;
- dialogue/social/companion systems admitted through Set 28;
- biological survival/health admitted through Set 29;
- movement/traversal/transport admitted through Set 30;
- world-first accessible UI with controller/split-screen foundations;
- scalable simulation LOD that preserves authoritative truth;
- Godot + Summer Engine as the current development direction;
- stable registries, source/runtime separation, save migration, validation and production evidence.

---

# Appendix B. POC Archive Naming Recommendation

Use a clearly non-shipping namespace, for example:

```text
archive.poc.forest_hamlet.*
archive.poc.valley.*
archive.poc.npc.*
archive.poc.quest.*
archive.poc.event.*
archive.poc.structure.*
archive.poc.worldgen.*
archive.poc.test_fixture.*
```

Old IDs should map to archived tombstones/aliases where required for historical saves or tests. Production content must not resolve these aliases as selectable generation families.

---

# Appendix C. Reconciliation Decision

**Decision FR-00-20-001**  
The Foundation Documents 00-20 will be rewritten/replaced under this register before being compacted into the permanent Foundation source ZIP.

**Decision FR-00-20-002**  
POC retirement means removal of fixed demonstration identities and arrangements from production, not automatic deletion of the mechanics/content families used to demonstrate them.

**Decision FR-00-20-003**  
Later specialist systems remain the owner of their gameplay truth. Foundation documents describe their role in the whole game and consume their interfaces rather than re-implementing them.

**Decision FR-00-20-004**  
The old foundation files remain preserved until every replacement is reviewed and the final v1.0 package passes a cross-document preservation/supersession audit.

**Decision FR-00-20-005**  
Document 99 remains a historical/regression testing source. It is not used to reintroduce POC geography or chronology into production design.

**Decision FR-00-20-006 - Single Canonical Block/Item Identity Rule**  
A placeable block that, when recovered, broken, dismantled or picked up, is intended to remain that same block must have **one canonical Block definition only**. It must not also be authored as a duplicate canonical Item definition. Inventory, hotbar, storage, trading and recipe systems may expose a **generated block inventory projection/reference** derived from the Block definition, but that projection is not an independently editable Item Registry entry and may not own duplicated block fields.

A distinct Item definition is created only when the world block produces or transforms into a genuinely different carried object or resource, when harvesting yields separate components/by-products, or when a special packed/portable state has materially different state, behaviour, ownership or save requirements that cannot be represented safely by a generated block reference.

Examples:

- Oak Planks block -> recovered Oak Planks block: one Block definition; generated inventory projection only.
- Stone Brick block -> recovered Stone Brick block: one Block definition; generated inventory projection only.
- Iron Ore block -> Raw Iron Ore item: separate Block and Item definitions because the drop is a different object.
- Crop block -> harvested Grain/Seed items: separate items because harvesting transforms the world state into different carried outputs.
- Functional machine block -> same machine when moved: prefer the Block identity plus a generated/packed-state carrier referencing that block; create a special Item definition only if portable-state behaviour or persistence genuinely requires a distinct contract.

This decision tightens the older Document 04/25I 'block item form' model. For Documents 03-04 v1.0, the term **block item form** is replaced by **block inventory projection** unless a true distinct Item definition is required. This preserves Document 25B's one-owner/no-editable-mirror rule and prevents duplicate registry identities. A narrow Set 25 amendment must be recorded during final reconciliation so 25H/25I terminology and replacement gates match this rule.

---

**End of Leyforge Foundation Documents 00-20 POC-to-Production Preservation, Supersession and Reconciliation Register v0.2**
