# LEYFORGE

## 00 - Master Game Design Bible

### Production Vision, Identity and Foundation

**Version 1.0 - Reconciled Production Foundation Draft**  
**Date:** 8 August 2026  
**Supersedes:** `00_Fantasy_Voxel_Civilisation_Sandbox_Master_Game_Design_Bible_v0_1.md` for active production direction  
**Project Lead and Final Authority:** Ash

A production-scale master vision for a seed-generated fantasy voxel survival civilisation sandbox where physical survival, living societies, automation, practical magic, exploration, combat, social relationships, trade, transport, maritime life, realms and persistent world history form one interconnected game.

> **Master Vision Statement**
>
> **Leyforge is a sandbox-first fantasy voxel world in which the player can survive, gather, craft, build, automate, study magic, travel, trade, form relationships, explore land and sea, found or reshape settlements, enter other realms and change persistent living civilisations. The world is generated from a seed and authored content relationships rather than a fixed scenario. Resources, people, routes, structures, markets, ecology, threats and history continue to matter beyond the player's inventory, and the player's actions leave visible, social, economic, political and environmental consequences.**

> **Governing Design Rule**
>
> Whenever a later system is unclear, it should be checked against this document **and the specialist document that owns that gameplay truth**. The Master Game Design Bible defines the fantasy, player experience and cross-system promises. It does not override a later specialist owner's formulas, runtime state or data contracts.

---

# Document Purpose

This document is the production master vision bible for Leyforge. Version 1.0 reconciles the original vision with the systems, world-content architecture and ownership contracts established through Document Sets 19-30.

The original v0.1 document successfully established the four-pillar identity, sandbox freedom, living civilisations, practical magic, automation, settlement growth, dimensions, player morality and multiplayer intent. Those principles remain central. What has changed is the maturity of the project:

- the proof-of-concept has completed its purpose and is now **Archived Validation** rather than production world content;
- normal worlds are fully seed-generated from reusable content families, relationships, constraints, histories and enabled content packs;
- the original generic registry concepts have been expanded into production-governed stable-ID, capability, package, provenance, migration and validation contracts;
- the Forge has become a unified voxel-authoring environment for assets, entities, structures and presentation;
- oceans, vessels, ports, maritime civilisation and naval systems are now a dedicated expansion of the base fantasy;
- economy, dialogue/social systems, biological survival and movement/transport now have dedicated specialist owners;
- Godot with Summer Engine is the current implementation direction;
- one gameplay truth must have one owner, with other systems consuming typed interfaces rather than duplicating the same rule.

This document therefore no longer describes later systems as hypothetical future documents. It defines how the approved systems fit together into one game and provides the vision-level constraints the revised Foundation Documents 01-20 must follow.

It is **not** a detailed balancing document, registry catalogue, technical implementation plan, production schedule or complete content list. Specific mechanics remain owned by their specialist documents.

---

# Production Status and Authority

| Field | Current Production Direction |
| --- | --- |
| **Game Identity** | Fantasy voxel survival sandbox + civilisation sandbox + automation/factory + fantasy RPG. |
| **World Identity** | Fully seed-generated, relationship-driven worlds assembled from authored content families and persistent runtime consequences. |
| **Core Production Identity** | The smallest dependency-complete production slice must prove the identity of the final game, not recreate a tutorial valley. The accepted internal planning model is the **Living Frontier Network**, a non-canonical label for a generated network of regions, settlements, routes, ecologies, sites and realm links. |
| **POC Status** | Forest Hamlet and the fixed POC arrangement are Archived Validation only. Reusable mechanics demonstrated by the POC remain valid unless explicitly superseded. |
| **Engine Direction** | Godot is the runtime/editor host. Summer Engine is the AI-native development environment and may assist bounded authoring and implementation under reviewable controls. |
| **Forge Direction** | Unified Leyforge Forge with Asset Forge, Entity Forge, Blueprint Forge and Presentation Forge specialist workspaces. |
| **Authority Direction** | One gameplay rule has one owner. Consumers use typed interfaces, evidence and immutable definitions rather than recreating another owner's logic. |
| **Persistence Direction** | World edits, people, inventories, structures, relationships, economies, journeys, events, damage and history persist where their owning systems require them to. |
| **Simulation Direction** | Nearby play is physically represented; distant simulation uses bounded summaries that preserve authoritative quantities, identities, ownership and consequences. |
| **Multiplayer Direction** | Solo must remain a complete experience. Co-op, LAN and split-screen remain final architectural intentions; public multiplayer release timing is governed separately by production classification. |
| **Accessibility Direction** | Accessibility, equivalent feedback, configurable guidance and world/player settings are foundation requirements, not late polish. |
| **Production Scope Direction** | Documented breadth is not a shipping promise. Content is admitted through Core Production, Early Access, Full Release, Later Expansion, Tooling Research or Archived Validation classifications. |

---

# Source and Supersession Hierarchy

When this document and an older source appear to conflict, use the following production interpretation:

1. explicit approved project direction and later approved amendments;
2. the final Document Sets 27-30 Cross-Set Interface Register v1.1 and Final Reconciliation Report v1.1 for their shared domains;
3. specialist Document Sets 26-30 for maritime, economy, social, biological and movement gameplay;
4. Document Set 25 for production governance, canonical registry kernel, capabilities, packages, validation and POC retirement;
5. Document Set 24 for world-content topology, procedural relationships, Atlas content and generated-world rules;
6. Document Sets 21-23 for Forge asset, entity, blueprint and presentation authoring;
7. Documents 19-20 and 20A-20H for settlement planning, player blueprints, buildings, facilities, services and the seven-needs model;
8. revised specialist Foundation Documents as they are approved;
9. original Foundation Documents for reusable intent not superseded by later owners;
10. Document 99 and fixed POC material as historical implementation/regression evidence only.

> **Non-Supersession Rule**
>
> Newer does not automatically mean broader authority. A specialist source supersedes an earlier rule only inside the domain it actually owns. For example, Set 29 owns biological Stamina and Fatigue state, while Set 30 owns movement execution. Document 02 may still own progression perks that interact with both, but it may not duplicate their formulas.

---

# Static Table of Contents

1. Locked Production Vision
2. Core Identity and the Four Gameplay Pillars
3. System Interconnection and Physical Truth
4. What Leyforge Is Not
5. Player Fantasy and Role Freedom
6. World Tone and Atmosphere
7. Visual Identity and Voxel Readability
8. Seed-Generated World and Atlas Philosophy
9. Living Civilisations and Persistent People
10. Settlement Growth, Buildings and Player Construction
11. Automation, Logistics and Civilisation-Scale Production
12. Magic as Personal Power and Civilisation Infrastructure
13. Progression Philosophy and Capability Growth
14. Economy, Trade and Material Value
15. Dialogue, Relationships, Companions and Social Consequence
16. Survival, Health and Biological Pressure
17. Movement, Traversal and Transportation
18. Oceans, Maritime Civilisation and Vessels
19. Ecology, Creatures, Monsters and Major Threats
20. Combat, Defence, Conflict and Aftermath
21. Peoples, Cultures, Factions, Governments and Law
22. Dimensions, Realms and Inter-Realm Play
23. Story, Quests, Events, History and World Memory
24. Morality, Crime, Conquest and Player Freedom
25. Death, Failure and Recovery Philosophy
26. Multiplayer and Shared-World Intent
27. UI/UX, Accessibility, Guidance and Player Trust
28. Unified Forge and Content-Creation Vision
29. Performance, Simulation Scale and Hardware Accessibility
30. Production Scope, Packages and Release Tiers
31. Proof-of-Concept Retirement and Preservation Doctrine
32. Source-of-Truth and Interface Design Rules
33. Core Production Identity Proof
34. Master Design Rules for All Later Documents
35. Foundation Document Ownership and Integration Map
36. Production Revision Requirements for Documents 01-20
37. Closing Direction

---

# 1. Locked Production Vision

Leyforge is a high-fidelity but readable fantasy voxel sandbox built around **persistent cause and effect**. The player physically changes a world made of blocks, structures, items, machines, creatures, people and routes. Those changes then matter to civilisations, economies, relationships, ecology, threats, travel and history.

The world should support both small-scale tactile play and civilisation-scale consequence:

- chop a tree because shelter is needed now;
- build a workshop because a settlement lacks a service;
- automate a production chain because local demand has outgrown hand labour;
- open a road because trade and travel are blocked;
- use magic to solve a problem that is still grounded in physical resources and world rules;
- negotiate because fighting is not always the best answer;
- establish a harbour because the sea has become part of the regional economy;
- enter a realm because knowledge, culture, resources, history or danger have made that route meaningful;
- return to find that the world remembers what happened.

The central fantasy is **escalation without abandoning physical grounding**. The player can begin as an empty-handed survivor and eventually become a master builder, mage-engineer, industrialist, settlement founder, merchant, diplomat, captain, conqueror, explorer or world-shaper, but wood, food, roads, people, repairs, access, trust and logistics remain meaningful even after advanced systems appear.

## 1.1 The Core Hook

> **Your production, magic, relationships and choices do not stop at your inventory. They feed people, grow settlements, change markets, move goods, open routes, alter stories and reshape the living world.**

Automation is not only about throughput. Magic is not only about combat. NPCs are not only quest dispensers. Settlements are not only decorative villages. Trade is not a static shop table. Roads are not scenery. Oceans are not map borders. Realms are not recoloured resource zones.

The player is constantly interacting with systems that have consequences beyond the immediate action.

## 1.2 Sandbox First

The world must remain playable without following one mandatory sequence. The player may choose a goal because of curiosity, survival pressure, settlement need, profit, friendship, threat, exploration, construction ambition, magical research, political conflict or personal creativity.

Guidance may be strong or light depending on settings and player preference, but the game should not become a linear campaign disguised as a sandbox.

---

# 2. Core Identity and the Four Gameplay Pillars

The four gameplay pillars established in the original Master Bible remain locked.

| Pillar | Core Player Experience | How It Connects to the Living World |
| --- | --- | --- |
| **Survival Sandbox** | Gather, mine, farm, craft, build, travel, prepare and physically inhabit a voxel world. | Supplies the physical resources, shelter, health, tools and local decisions that every larger system depends on. |
| **Civilisation Sandbox** | Meet persistent people, help or exploit settlements, found communities, shape services, law, trade, conflict and growth. | Converts resources and infrastructure into population, social, political, cultural and historical consequences. |
| **Automation / Factory** | Build machines, logistics, power, mana infrastructure, processing chains and scalable production. | Supplies settlements, trade, construction, defence, recovery, shipping and large projects rather than serving only personal inventory growth. |
| **Fantasy RPG** | Learn skills, magic and knowledge; explore sites and realms; fight or negotiate with threats; follow stories and develop relationships. | Adds wonder, identity, character growth, danger, culture, discovery and long-term world change. |

These are the **gameplay pillars**, not a list of every major system. Economy, social simulation, health/biology, movement, maritime systems, world generation, UI, the Forge and production governance are cross-cutting foundations that make the four pillars coherent at production scale.

## 2.1 Pillar Balance

No pillar should permanently consume the others.

- Survival should create meaningful preparation without becoming constant meter maintenance.
- Civilisation should create a living world without turning the player into a mandatory city administrator.
- Automation should reduce repetitive labour and increase capability without making exploration, people or magic irrelevant.
- RPG progression should create mastery and discovery without replacing physical resources, player skill or sandbox freedom.

Players can specialise heavily, but the world should reward connections between pillars.

---

# 3. System Interconnection and Physical Truth

Leyforge should be designed as a relationship web rather than a collection of isolated features.

A resource can simultaneously be:

- a building material;
- a tool or equipment input;
- a machine feedstock;
- a settlement need;
- a trade good;
- a medical or biological input;
- a magical catalyst;
- a quest or contract requirement;
- a cultural material;
- a vessel or infrastructure component;
- a realm-access requirement.

A road can simultaneously affect:

- player travel;
- NPC schedules;
- caravans;
- market access;
- settlement growth;
- military response;
- construction logistics;
- event propagation;
- rescue and evacuation.

A person can simultaneously be:

- a persistent NPC identity;
- a household member;
- a worker;
- a friend, rival or companion;
- a contract party;
- a voter, official, criminal, witness or faction member;
- a patient or injured survivor;
- a traveller using movement systems;
- a participant in quests and history.

> **Physical Truth Rule**
>
> When a system claims that goods, labour, travel, construction, damage, treatment or production occurred, the appropriate authoritative owner must be able to explain where the state came from. Summary simulation may aggregate reality; it may not invent impossible outcomes merely because the player was far away.

## 3.1 Abstraction Must Preserve Cause and Effect

Leyforge will use abstraction aggressively for scale, but abstraction must preserve:

- stable identity;
- quantities and ownership;
- reservations and obligations;
- current capability and blockers;
- consequential history;
- route feasibility;
- settlement state;
- biological state where relevant;
- economic commitments;
- relationships and social memory where relevant.

The visual representation may disappear at distance. The world truth may not.

---

# 4. What Leyforge Is Not

Leyforge is not intended to become any one of the following at the expense of its combined identity:

- **Not a Minecraft clone with extra ores and spells.** Voxel freedom is foundational, but the defining identity comes from living systems and persistent consequence.
- **Not a pure factory game.** Throughput matters because production supports people, settlements, trade, defence, magic, shipping and large projects.
- **Not a linear RPG.** Authored stories exist, but they coexist with emergent goals, generated histories and player-created objectives.
- **Not a detached city simulator.** A settlement service must ultimately resolve through real structures, people, resources, routes and state rather than abstract zoning alone.
- **Not an economy spreadsheet.** Prices and finance exist to explain the physical living economy; they do not replace goods, labour, transport or player action.
- **Not a survival-meter maintenance simulator.** Bodies and preparation matter, but healthy ordinary play should be stable and readable.
- **Not a fixed campaign world.** Normal production worlds are seed-generated and may not silently fall back to the retired POC layout.
- **Not procedural content soup.** Randomisation is constrained by ecology, culture, terrain, history, progression, infrastructure and compatibility.
- **Not a presentation-driven logic system.** VFX, sound and UI communicate authoritative gameplay; they do not invent it.
- **Not a promise to ship every documented idea at once.** Production scope is classified, dependency-complete and evidence-driven.

---

# 5. Player Fantasy and Role Freedom

The player should never be forced into one permanent class or identity. One character can pursue many disciplines over time, while specialisation remains useful through skills, perks, knowledge, equipment, relationships and infrastructure.

| Player Fantasy | Experience Supported |
| --- | --- |
| **Lone Survivor** | Begin with almost nothing, gather local materials, create shelter, prepare for hazards and become self-sufficient. |
| **Builder / Architect** | Build freely block-by-block, use modular pieces, create blueprints and redesign settlements or infrastructure. |
| **Settlement Founder / Ruler** | Establish a settlement, attract people, provide services, shape laws and priorities, and grow toward civilisation-scale projects. |
| **Village Helper / Restorer** | Supply, repair, protect, reconnect or rebuild existing communities without needing to govern them. |
| **Automation Architect / Industrialist** | Design efficient resource, power, logistics and production networks that serve personal and civilisation needs. |
| **Mage-Engineer** | Combine spells, runes, mana infrastructure, automation and structures into practical magical technology. |
| **Wandering Adventurer** | Explore ruins, caves, wilderness, dungeons, strange regions and realms while remaining lightly tied to settlement management. |
| **Merchant / Contractor** | Trade, establish production, fulfil contracts, operate routes, respond to scarcity and build regional economic influence. |
| **Diplomat / Social Leader** | Build trust, negotiate, recruit companions, broker agreements, resolve conflicts or manipulate social and political relationships. |
| **Healer / Survival Specialist** | Prepare supplies, treat injuries, support dangerous journeys, improve settlement care and respond to biological crises. |
| **Hunter / Naturalist** | Study ecology, track creatures, fish, tame or manage animals, protect habitats or hunt dangerous threats. |
| **Caravan Master / Transport Planner** | Use roads, mounts, carts, wagons, rails and logistics networks to move people and goods through a physical world. |
| **Shipwright / Captain** | Build and commission vessels, navigate coasts and open water, manage voyages, cargo, crews, repair and maritime risk. |
| **Explorer / Cartographer** | Discover routes, regions, oceans, underground systems, skylands, ruins and realm links and turn knowledge into capability. |
| **Conqueror / Outlaw / Smuggler** | Seize settlements, raid trade, evade law, support hostile factions, exploit forbidden systems or build fear-based power. |
| **Realm Scholar / World-Shaper** | Restore portals, study world history, connect realms, build major infrastructure and alter civilisation-scale outcomes. |

## 5.1 Role Freedom With Real Consequences

Freedom is not the absence of consequence. The game should allow contradictory identities and difficult choices, but the world must respond through the systems that own those consequences.

A merchant who becomes a smuggler may gain access to illicit markets while losing lawful trust. A ruler who overworks settlements may face declining health, relationships or political resistance. A player who protects a creature population may alter ecology and faction relations. A conqueror may gain control while creating refugees, rebellion and hostile coalitions.

The player chooses a path; the world records what that path costs and changes.

---

# 6. World Tone and Atmosphere

Leyforge retains the layered tone established in the original vision.

| Tone Layer | Where It Appears | Design Purpose |
| --- | --- | --- |
| **Cosy Fantasy** | Homes, farms, workshops, taverns, festivals, friendly settlements, decorating, peaceful travel. | Makes daily life worth protecting and building. |
| **Dangerous Survival** | Harsh weather, caves, expeditions, injuries, wilderness, hostile territories and resource pressure. | Creates stakes and rewards preparation. |
| **High Fantasy Wonder** | Practical magic, ancient sites, realms, great creatures, magical weather and civilisation-scale projects. | Makes discovery and escalation feel extraordinary. |
| **Medieval Civilisation** | Jobs, markets, roads, ports, households, laws, public works, contracts, politics and settlement growth. | Grounds the fantasy in understandable social structures. |
| **Whimsical Magic** | Strange creatures, living environments, unusual machines, rituals and cultural magic. | Keeps the world playful and surprising. |
| **Dark Consequence** | War, conquest, corruption, disease, dangerous magic, failed settlements, destroyed routes and major threats. | Gives choices weight without making every moment grim. |
| **Ancient Mystery** | Ruins, forgotten industries, old portals, lost civilisations, world history and realm evidence. | Gives exploration deeper context. |
| **Maritime Wonder and Risk** | Coasts, islands, reefs, storms, ports, wrecks, deep water, sea creatures and long voyages. | Expands exploration and civilisation into a genuinely different physical domain. |

> **Tone Rule**
>
> Leyforge should feel warm when the player creates, alive when people interact, dangerous when the player overextends, wondrous when the world reveals something new, and consequential when civilisations or environments are changed.

---

# 7. Visual Identity and Voxel Readability

The game uses a **stylised high-fidelity voxel fantasy** direction. Voxel structure must remain readable and editable while models, animation, lighting, sound and effects provide richer presentation.

## 7.1 Visual Principles

- Terrain and construction remain immediately legible as voxel space.
- The one-metre world block remains a key spatial language, while smaller authored voxel forms may be used for detailed assets and effects.
- Base material art retains the established 32x32 pixel-texture language and supports systematic variation through material, biome, culture, rarity, state, age, damage, magic and environment where their owning systems allow it.
- Blocks, items, machines, entities and structures may use more detailed voxel-built source models than a simple cube.
- Player characters, NPCs, creatures, monsters and bosses remain voxel-authored rather than switching to an unrelated smooth-sculpted art style.
- Visual state should reveal important gameplay state: active, damaged, wet, frozen, corrupted, powered, blocked, overheated, warded, occupied and other valid states should be readable where appropriate.
- Lighting and ambience carry mood but may not obscure essential gameplay information.
- Magic should be visually understandable through origin, direction, state, scale and consequence.

## 7.2 VFX and Audio Identity

Presentation Forge establishes a shared sensory layer:

- authored VFX source geometry uses genuine three-dimensional voxel forms such as cubes, cuboids, shards, clusters, paths and surface cells;
- audio is tactile, layered, spatially readable and context-sensitive rather than forced into one retro style;
- presentation attaches through semantic anchors, sockets, regions, paths, masks and runtime contact points;
- material response should let one event family adapt appropriately to wood, stone, metal, crystal, wet surfaces, caves and other contexts;
- critical information must remain understandable with reduced motion, reduced flash, colour-independent presentation or muted/reduced sensory channels.

> **Presentation Truth Rule**
>
> Gameplay and simulation systems own what happened. Presentation communicates it.

## 7.3 Style Boundary

Leyforge should look richer than a basic block sandbox without chasing realism that makes voxel construction unreadable, asset production unsustainable or visual systems inconsistent.

---

# 8. Seed-Generated World and Atlas Philosophy

Normal production worlds are built from deterministic seed-derived relationships, not a fixed authored opening region.

The World Content Atlas is the relationship and procedural-content authority for how authored families are selected, placed, combined, transformed and remembered.

## 8.1 World Generation Promise

A seed may determine or influence:

- world topology and regions;
- climates and biome transitions;
- oceans, coasts, islands, underground layers and special environments;
- cultures, settlements, factions and territorial relationships;
- roads, trails, rivers, harbours and other routes;
- resource families and deposits;
- ecology, migration and threat pressure;
- structures, ruins, dungeons, lairs and wonders;
- boss or major-threat suitability;
- generated history, ownership and current world states;
- realm networks, portal opportunities and inter-realm relationships.

Randomness must be constrained by **compatibility and explanation**. A culture belongs somewhere for a reason. A dungeon has an origin. A creature fits an ecology. A trade route connects meaningful endpoints. A boss affects territory. A realm has complete world rules.

## 8.2 No Fixed Production Tutorial World

A production seed must not require:

- Forest Hamlet;
- Hearthplain or the controlled valley;
- a guaranteed watchtower site;
- a guaranteed goblin camp;
- a fixed cave/ruin/mana-pocket relationship;
- a fixed first village, mage, ruin or portal;
- a fixed first realm destination;
- a hidden fallback that reconstructs the POC when world generation cannot satisfy a constraint.

The player may begin near civilisation, far from it, or in a wilderness-focused start depending on the world profile and seed. Core capability must remain reachable through multiple provider families, substitutes or controlled generation failure rather than named-content guarantees.

## 8.3 Generated History

World generation does not stop at terrain. Regions, settlements, structures, factions and sites may carry seed-derived history and current state. Ruins can have causes. Roads can reflect former trade. Factions can inherit disputes. Structures can be occupied, abandoned, restored or repurposed.

This history becomes input to exploration, rumours, quests, markets, settlement behaviour and future events.

---

# 9. Living Civilisations and Persistent People

Living civilisations remain one of Leyforge's defining systems.

NPCs should feel like persistent people rather than replaceable service terminals. Their detailed ownership is distributed deliberately:

- Document 07 owns persistent person, household, job, schedule, inventory and settlement-operation truth;
- Set 28 owns dialogue, beliefs, rumours, social memory interpretation, relationships, trust, loyalty, negotiation and companion agreements;
- Set 27 owns wages, prices, contracts, businesses and economic household state;
- Set 29 owns biological health, survival and treatment state;
- Set 30 owns terrestrial movement and navigation execution;
- Documents 13 and 24 own culture, faction, government and generated-world identity context;
- Document 15 owns quest and event lifecycle.

## 9.1 Persistent-Person Promise

Important NPCs should be able to possess, where relevant:

- stable identity and name;
- culture, faction and settlement context;
- household and relationships;
- occupation and skills;
- home, bed and workplace;
- schedule and current task intent;
- personal and carried inventory;
- memories and social history;
- biological state;
- legal/economic obligations;
- travel state;
- quest/event participation;
- death, migration or replacement history where world settings allow it.

Distant simulation may summarise their activity, but it must preserve consequential identity.

## 9.2 NPCs Should Do Real Work

A job should correspond to actual world capability. Farmers produce food. Builders consume stock and construct projects. Guards use equipment and patrol. Merchants operate within real economic stock and terms. Healers interact with biological needs. Haulers move goods. Captains and crews operate maritime systems. Social roles create real interactions rather than decorative labels.

## 9.3 Social Life Is Part of Civilisation

People may form friendship, rivalry, family, romance, alliances and resentments; exchange rumours and knowledge; remember player actions; become companions or enemies; negotiate; witness crimes; participate in public or private events.

Households and populations may also change through migration, recruitment, family formation, birth/ageing and death where the owning systems and world settings support those processes. Representation may be simplified at distance, but important identity and consequences remain persistent.

These systems should create emotional attachment without requiring every ordinary resident to have a bespoke authored novel.

---

# 10. Settlement Growth, Buildings and Player Construction

Settlements are dynamic physical networks of people, parcels, roads, buildings, services, projects, utilities, storage, defences and culture.

## 10.1 Seven Main Settlement Needs

The only seven top-level settlement needs are:

1. **Housing**
2. **Provisions**
3. **Health**
4. **Work**
5. **Safety**
6. **Infrastructure**
7. **Morale**

All other values are capacities, causes, services, risks, policies or progression systems beneath these needs.

## 10.2 Settlement Growth Ladder

The current production settlement ladder is:

**Camp -> Hamlet -> Village -> Fortified Village -> Town -> City -> Capital -> Magical Metropolis**

This ladder describes capability and growth, not one mandatory visual layout. Settlements grow through projects, people, routes, terrain, culture, services and world conditions rather than replacing themselves with one fixed city template.

## 10.3 Independent Growth and Player Influence

Settlements may progress without the player, but growth is constrained by real conditions such as:

- available resources and production;
- population and specialists;
- housing and services;
- route access;
- safety and threat pressure;
- economic opportunity;
- health and provisions;
- cultural priorities;
- knowledge and technology;
- events, damage and history.

The player can accelerate, redirect, exploit, protect or obstruct growth by supplying resources, building, automating, opening routes, trading, recruiting specialists, using magic, creating blueprints, defending, negotiating or conquering.

## 10.4 Buildings Are Functional Civilisation Systems

A building does not provide a service merely because it resembles one. Function resolves through the appropriate semantic and runtime contracts: valid structure, markers, access, people, resources, equipment, networks, permissions, condition and operational state.

A cottage, market, clinic, watchtower, warehouse, port, workshop, ward, road or wonder may have many visual/cultural blueprints while retaining a stable functional identity.

## 10.5 Player Construction Modes

Leyforge supports multiple construction approaches:

- direct block-by-block building;
- modular voxel construction pieces;
- in-world blueprint design and placement;
- main-menu Blueprint Workshop design;
- NPC-assisted staged construction using real materials;
- settlement-selected projects;
- official Blueprint Forge source for developer-authored structures.

Player creativity and simulation must coexist. Drafting may be free, but survival-world construction consumes real resources and respects terrain, permissions and capability.

## 10.6 Settlement Decline, Occupation and Restoration

Civilisations must be capable of losing ground as well as growing. Depending on world settings, event severity and player action, settlements may become damaged, partially non-functional, occupied, conquered, abandoned, ruined, corrupted or otherwise transformed. Recovery may involve repair, relief, liberation, cleansing, reconstruction, migration, political change or an entirely new use for the site.

A destroyed or abandoned settlement should not simply disappear from history. Ruins, memorials, changed ownership, displaced people, altered routes and reconstruction opportunities can remain as world evidence.

## 10.7 Growth Can Unlock Story Without Requiring One Fixed Arc

Settlement development can reveal deeper local and cultural stories through specialists, archives, institutions, rituals, political capacity, restored sites, trade connections and realm knowledge. The original idea that civilisation growth unlocks narrative depth is preserved, but production does not require every ancestry or settlement to follow one mandatory race-specific story sequence.

---

# 11. Automation, Logistics and Civilisation-Scale Production

Automation is a core pillar because it changes the scale of what the player can support.

It should progress from manual work and simple mechanisms into industry, magical infrastructure and civilisation-scale systems without reducing every path to one fixed technology ladder.

## 11.1 Automation Promise

Automation should:

- reduce repetitive labour;
- transform and move physical resources;
- remain inspectable and understandable;
- consume valid power, mana, fuel, labour or process inputs where required;
- respect input, output and storage capacity;
- preserve resources through authoritative transactions;
- feed player storage, settlements, contracts, construction, trade, defence, medicine, ports and other valid endpoints;
- operate locally with visible motion while using bounded summaries at distance.

> **Automation Design Rule**
>
> A major automation system should answer both **what capability it gives the player** and **what living-world system it can support**.

## 11.2 Automation Does Not Create Abstract Wealth

A machine cannot create economic value by pretending output exists. Set 08 creates/transforms/moves physical production according to automation rules; Set 27 may then value that production economically.

Likewise, automation may supply a settlement warehouse, but the settlement still decides what the stock can satisfy through its own systems.

## 11.3 Multiple Power and Technology Paths

Mundane mechanical systems, water, wind, fuel, advanced industry, mana, runes, golems and later realm-linked infrastructure may all contribute to automation. No one path should erase useful earlier materials or cultural alternatives.

---

# 12. Magic as Personal Power and Civilisation Infrastructure

Magic is a world system rather than a combat-only spell list.

It can affect:

- combat and defence;
- mining and gathering;
- farming and ecology;
- crafting and refinement;
- healing and cleansing through appropriate biological interfaces;
- movement and travel through movement-owned execution;
- automation and control;
- wards and settlement safety;
- structures and construction;
- research and knowledge;
- portals and realms;
- culture, law and social reaction;
- dangerous or forbidden practices.

## 12.1 Practical Magic Rule

Magic should solve meaningful problems while remaining grounded in resources, knowledge, risk, preparation, infrastructure or other valid costs.

Personal mana and large-scale infrastructure must not be treated as the same unlimited resource. Settlement-scale magic requires appropriate world and system support.

## 12.2 Mundane Systems Remain Valid

Magic may provide alternatives, accelerators or specialised capability, but it should not automatically invalidate tools, roads, machines, medicine, people or ordinary construction.

## 12.3 Culture and Realm Integration

Magic can vary by culture, faction, place, ecology, history and realm. Discovery may come through teachers, research, ruins, experimentation, rare resources, recovered technologies or cultural traditions rather than one guaranteed tutorial mage.

---

# 13. Progression Philosophy and Capability Growth

Leyforge uses multi-track progression. Player capability grows through overlapping systems rather than one universal level gate.

Progression may include:

- tool and material capability;
- overall player level;
- use-based skills;
- perk trees;
- knowledge and research;
- recipes and processes;
- magic mastery;
- automation capability;
- economic access and professional skill;
- social and leadership capability;
- movement/traversal capability;
- biological knowledge and preparation;
- settlement influence and reputation;
- faction relationships;
- exploration and site knowledge;
- realm access.

## 13.1 Classless Direction

Players begin without a permanent class lock and may eventually learn broadly across the game. Specialisation should create identity and efficiency, not irreversible exclusion from the sandbox.

## 13.2 Capability Graph, Not One Ore Ladder

The old simple material ladder remains useful as an early readability concept but is no longer the universal progression truth.

Production progression is capability-based. The current Core capability proof graph uses CAP-00 through CAP-10:

| Capability | Production Meaning |
| --- | --- |
| **CAP-00** | Safe Spawn and Local Survival |
| **CAP-01** | Primitive Tools and Shelter |
| **CAP-02** | Provisions and Settlement Contact |
| **CAP-03** | Copper Mechanisms or capability-equivalent provider |
| **CAP-04** | Iron Structural Support or capability-equivalent provider |
| **CAP-05** | Practical Mana |
| **CAP-06** | Regional Trade and Civilisation |
| **CAP-07** | Regional Adventure |
| **CAP-08** | Automation-to-Civilisation |
| **CAP-09** | Realm Discovery and Safe Return |
| **CAP-10** | Resolution of the selected complete Core realm package |

The important design lesson is not that every game must follow those steps in one order. It is that major capability should have **multiple valid providers, substitutions or controlled fallbacks** so seed variation does not create dead progression.

## 13.3 Earlier Materials Stay Useful

Wood, stone, copper, iron and other early materials should remain relevant through construction, repairs, culture, components, maintenance, trade, fallback processes and infrastructure. Later materials should introduce new properties and capabilities rather than simply replacing old numbers.

---

# 14. Economy, Trade and Material Value

The economy emerges from the living physical world.

Goods have value because people, workshops, settlements, armies, mages, travellers and industries actually use them. Markets respond to production, stock, consumption, access, risk, law, culture, information, timing and alternatives.

## 14.1 Physical Economy Rule

- Merchants cannot sell unlimited invisible stock.
- Settlements cannot fund projects from nonexistent wealth.
- A caravan cannot complete a journey without valid transport and route execution.
- Distant simulation cannot mint or delete wealth because the player is absent.
- Buildings may enable economic services but do not generate abstract money just by existing.

## 14.2 Local and Regional Markets

Leyforge does not use one universal static price table as the complete economy. Prices can differ across settlements and regions based on the authoritative factors owned by Set 27.

The player should be able to understand the broad reason for a shortage, opportunity, contract failure or changing market without needing to study a spreadsheet.

## 14.3 Player Economic Roles

Players may:

- trade casually;
- establish production and supply contracts;
- operate businesses;
- employ labour;
- move cargo;
- finance projects;
- interact with taxes, tariffs or public budgets where enabled;
- smuggle or participate in black markets;
- exploit or break monopolies;
- build regional economic power.

Players who do not want deep economic play should still receive understandable prices, availability and consequences.

---

# 15. Dialogue, Relationships, Companions and Social Consequence

Persistent people should be understandable as people.

Conversation and social systems include:

- contextual dialogue;
- beliefs, knowledge, rumours, truth and misinformation;
- friendship, trust, loyalty, affection, rivalry and fear;
- etiquette and cultural context;
- persuasion, negotiation and intimidation;
- recruitment and companion agreements;
- followers, hirelings and temporary allies;
- delegation and off-screen social assignments;
- social memory and relationship consequences.

## 15.1 Social Truth Must Be Grounded

Set 28 resolves social meaning from authoritative world evidence. It may not invent nonexistent stock, prices, injuries, routes, quest completion or political authority.

A person can believe something false. The world state itself remains owned elsewhere.

## 15.2 Companion Fantasy

Companions should be relationships and agreements, not inventory pets. Their loyalty, willingness and social state matter. Physical movement and combat remain governed by the systems that own those actions.

## 15.3 Social Scale

Important named characters may receive richer authored memories and dialogue. Ordinary residents should remain believable through systemic personality, relationships, schedules and shared content families without requiring bespoke dialogue trees for everyone.

---

# 16. Survival, Health and Biological Pressure

Survival remains a core pillar, now backed by a dedicated biological system.

Leyforge survival should make bodies, food, shelter, medicine, climate, rest and care meaningful **without becoming a chore engine**.

## 16.1 Survival Promise

Preparation should matter when choosing to:

- enter severe cold or heat;
- travel while injured or exhausted;
- cross long distances;
- explore toxic, diseased or corrupted areas;
- dive or undertake maritime expeditions;
- sustain a settlement through shortages or outbreaks;
- prepare guards or companions for dangerous work.

Healthy, well-provisioned ordinary play should not require constant emergency management.

## 16.2 Configurable Severity

The biological system supports a range of world presets including Peaceful, Relaxed, Standard, Harsh and Custom. Difficulty changes severity and pressure without changing system ownership or erasing the usefulness of food, shelter, medicine and care.

## 16.3 Civilisation Connection

Biological state creates real reasons for:

- farming and food storage;
- cooking and preservation;
- medicine and first aid;
- clean water and sanitation systems where applicable;
- healers, clinics and hospitals;
- shelter and heating/cooling infrastructure;
- rescue systems;
- labour recovery and work-capacity planning;
- relief supply, trade and public policy.

## 16.4 Ownership Boundary

Set 29 owns biological Health, Stamina, Fatigue, hunger/hydration/nutrition, exposure, injury, disease, toxin and treatment state. Combat owns damage generation and death/downing resolution. Movement consumes biological modifiers rather than calculating biology itself.

---

# 17. Movement, Traversal and Transportation

Movement is the physical language through which the player reads and inhabits the world.

Walking through a village, climbing a ruin, riding across a forest, hauling ore by wagon, crossing a damaged bridge, taking a lift, travelling with a caravan or following a mountain road should all feel like parts of one coherent physical system.

## 17.1 Movement Promise

Movement should be:

- responsive at the controls;
- predictable from terrain and infrastructure;
- honest about clearance, slope, access and hazards;
- scalable from local physical motion to distant route simulation;
- readable when movement fails;
- shared across player, NPC, mount and vehicle concepts without pretending they all move identically.

## 17.2 Infrastructure Must Matter

Roads, bridges, ladders, gates, tunnels, rails, lifts and other route infrastructure are physical assets owned by structure/building systems. Set 30 interprets whether a particular mover can actually use them.

A road should be valuable because it changes real movement and therefore affects work, trade, rescue, war, settlement access and travel.

## 17.3 Travel Abstraction Is Not Teleportation

Distant travel may be simulated at lower fidelity, but it must remain an abstraction of a valid route, capacity and journey. A distant wagon cannot cross a route that would be physically impossible when locally simulated.

---

# 18. Oceans, Maritime Civilisation and Vessels

Oceans are part of the world rather than decorative borders.

Document Set 26 extends Leyforge into:

- ocean and coast generation;
- islands and underwater spaces;
- waves, tides, currents, storms and marine climate;
- swimming and diving;
- voxel vessel architecture;
- buoyancy, propulsion, steering and navigation;
- shipwright construction, repair, refitting and salvage;
- ports, harbours and shipyards;
- crews and maritime settlements;
- trade fleets, convoys, piracy, navies and blockades;
- naval combat, boarding, fire, flooding and sinking;
- fishing and marine ecology;
- wrecks, underwater dungeons, sea creatures and major marine threats.

## 18.1 Maritime Role Freedom

A player may use maritime systems lightly to cross a river or reach an island, or deeply as a shipwright, captain, merchant, explorer, fisher, pirate, naval defender, mage-engineer or mobile-base builder.

The base game fantasy must not assume every player becomes a naval commander.

## 18.2 Vessels Remain Physical Constructions

Vessels are not menu-only fast-travel objects. They are built, commissioned, supplied, crewed, damaged, repaired, navigated and persisted through the appropriate specialist systems.

Their economics belong to Set 27, their social crew relationships to Set 28, biological consequences to Set 29 where applicable, terrestrial route integration to Set 30 and detailed aquatic/vessel movement to Set 26.

---

# 19. Ecology, Creatures, Monsters and Major Threats

Creatures are part of ecology and world pressure rather than filler enemies.

A creature family should have reasons to exist in its environment: habitat, food, behaviour, relationships, resources, threats, interactions and possible world-state effects.

## 19.1 Creature Roles

The game may include:

- ambient wildlife;
- prey and forage-linked species;
- livestock and domestic animals;
- work animals and mounts;
- predators and scavengers;
- pests;
- magical beings;
- constructs and undead where supported;
- faction-linked hostile groups;
- dungeon/lair inhabitants;
- regional threats;
- bosses, titans, siege threats and realm guardians.

## 19.2 Threats Need Context

A threat should not exist only to spawn and attack. It can influence:

- routes;
- ecology;
- settlement safety;
- market access;
- migration;
- faction behaviour;
- resource availability;
- quests and rumours;
- preparation;
- post-conflict aftermath.

## 19.3 Multiple Resolutions

Where fiction and mechanics support it, dangerous creatures or major threats may be killed, driven away, avoided, trapped, cleansed, studied, bargained with, relocated, restored or otherwise resolved through more than one outcome.

---

# 20. Combat, Defence, Conflict and Aftermath

Combat is a deep action-survival system, but it is one response to conflict rather than the only legitimate solution.

## 20.1 Combat Identity

Combat should combine:

- player skill;
- readable telegraphs;
- weapons, armour and equipment;
- stamina and biological condition through Set 29;
- terrain and movement through Set 30;
- magic;
- allies and guards;
- preparation;
- fortifications and infrastructure;
- supplies and medicine;
- knowledge of enemies;
- difficulty/accessibility settings.

Combat should not reduce to trading health bars until one side runs out.

## 20.2 Defence Is Preparation

Settlement defence may be improved through:

- watchtowers and observation structures;
- walls, gates and refuge;
- guards and equipment;
- lighting and visibility;
- wards and magical protection;
- traps and controlled terrain;
- food, medicine and repair stock;
- scouting and warning;
- diplomacy, tribute or alliances;
- disrupting hostile camps or supply;
- evacuation and emergency plans.

The exact POC watchtower/raid sequence is retired. The generic cause-and-effect remains protected.

## 20.3 Persistent Aftermath

Conflict may leave:

- injuries or death;
- damaged structures;
- lost goods;
- refugees;
- occupation;
- altered reputation and trust;
- economic disruption;
- repair projects;
- revenge or reconciliation opportunities;
- memorials and history.

The world should not reset as if the conflict never happened.

## 20.4 Danger and World-Risk Settings

Threat pressure is configurable independently from the biological survival profile. Peaceful or relaxed worlds may greatly reduce destructive raids, hostile pressure, permanent settlement loss or severe NPC consequences while retaining building, ecology, exploration, trade, magic and civilisation growth. Harsher worlds may increase raids, siege pressure, resource disruption, faction conflict, injury/death risk and long recovery chains.

Difficulty should change pressure and consequence while keeping the same underlying world systems coherent and understandable.

---

# 21. Peoples, Cultures, Factions, Governments and Law

Leyforge separates identity layers that are often incorrectly collapsed into one fantasy-race field.

Relevant layers include:

- ancestry/people;
- lineage and individual identity;
- culture;
- language;
- religion/philosophy/spiritual tradition;
- settlement and citizenship;
- faction;
- government;
- law;
- territory;
- treaties and diplomacy;
- generated and authored history.

## 21.1 Representation Rule

No ancestry is inherently good, evil, civilised, primitive, magical, industrial, peaceful or hostile by biological destiny.

Culture, faction, government and circumstances create behaviour and conflict. A hostile group is hostile because of its goals, history, leadership, relationships or current situation, not because every member of an ancestry is coded as morally identical.

The production Atlas may include both familiar fantasy ancestry/personhood families and original Leyforge peoples. Familiarity is allowed to help readability, but no ancestry is only a cosmetic skin: each can participate in multiple cultures, professions, governments, settlement forms, realms and moral or political positions.

## 21.2 Culture Must Affect the World

Cultures can differ through:

- architecture and materials;
- settlement forms;
- jobs and specialists;
- law and etiquette;
- trade and goods;
- food and clothing;
- magical traditions;
- social practices;
- military organisation;
- transport and maritime preferences;
- stories and historical memory.

These differences should be systemic enough to matter without reducing cultures to stereotype bonuses.

---

# 22. Dimensions, Realms and Inter-Realm Play

Realms are persistent alternate worlds or world-spaces with their own identity. They are not loot rooms with a new colour palette.

## 22.1 Complete Realm Rule

A major playable realm should have enough of the following to function as a world:

- topology and environment;
- survival conditions;
- biomes;
- resources;
- ecology;
- societies or meaningful inhabitants where appropriate;
- structures and infrastructure;
- sites and dungeons;
- major threats/guardians;
- history and current state;
- routes, portals and safe-return logic;
- player-facing consequences that matter after returning to the Overworld.

A realm should not be classified as complete if it only contains one biome, one resource and one boss.

## 22.2 Realm and People Relationship

The original early concept of giving each race one biologically exclusive dedicated dimension is superseded. A culture, people, faction, faith or historical community may have a powerful relationship with a realm, but major realms are not automatically owned by or restricted to one ancestry. Migration, citizenship, colonisation, trade, conquest, diaspora, spirits, artificial beings and mixed communities may all create cross-realm populations and claims.

This preserves the valuable idea that realms can be deeply personal to civilisations while avoiding a rigid one-race-one-dimension world model.

## 22.3 Realm Access

Realm access may require combinations of:

- knowledge;
- resources;
- rituals;
- constructed portals;
- repaired ancient infrastructure;
- relationships or faction access;
- settlement capability;
- exploration discoveries;
- boss/site outcomes.

No production world requires one fixed first portal or first realm route.

## 22.4 Cross-Realm Consequence

Realm materials, knowledge, allies, magic, structures, trade, ecology or political outcomes should affect the wider game rather than existing in an isolated progression lane.

---

# 23. Story, Quests, Events, History and World Memory

Story emerges from authored narrative, systemic conditions and player-created history.

## 23.1 Story Layers

| Story Layer | Role |
| --- | --- |
| **Sandbox Story** | The player's own construction, exploration, relationships, trade, conflict and settlement choices. |
| **Generated World History** | Seed-derived past events, ownership, ruins, routes, disputes, collapsed settlements and persistent evidence. |
| **Environmental Lore** | Structures, books, artefacts, ruins, machines, ecology and places that reveal history. |
| **Personal NPC Stories** | Relationships, households, ambitions, injuries, disputes, work, migration and social memory. |
| **Settlement Stories** | Projects, shortages, celebrations, disasters, politics, growth, recovery and decline. |
| **Culture/Faction Arcs** | Diplomacy, conflict, reform, law, territory, trade and historical claims. |
| **Realm Stories** | Societies, ecology, ancient events, guardians, routes and cross-realm consequences. |
| **Optional Main Mystery** | A broader world-spanning narrative that can be pursued without ending the sandbox. |

## 23.2 Quest Rule

A quest should represent a meaningful need, opportunity, relationship, discovery, conflict, project or world change. It should not exist only because a quest list needs filler.

Generated quests must reference real people, places, resources, structures, relationships and world state rather than inventing nonexistent targets.

## 23.3 Event Rule

Events may occur at personal, settlement, regional, faction, world or realm scale. The world may continue when the player is absent, but major events must remain fair, configurable, understandable and persistent.

## 23.4 Failure Creates History

Failure should often create altered world state and new possibilities rather than simply asking the player to reload. A lost battle, failed contract, damaged settlement, missed rescue or broken alliance may become part of future content.

---

# 24. Morality, Crime, Conquest and Player Freedom

Leyforge should not reduce morality to one global good/evil meter.

The world responds through:

- personal trust and relationships;
- settlement reputation and fear;
- faction standing;
- law, witnesses and crime consequences;
- market access and economic sanctions;
- contracts and obligations;
- political hostility or alliance;
- companion willingness;
- cultural reaction;
- environmental or magical consequences;
- refugees, occupation and resistance;
- story availability and world-state change.

## 24.1 Evil and Exploitative Play Must Be Systemic

If the player can conquer, exploit, smuggle, pirate, use forbidden magic or support hostile factions, those paths need real mechanics and consequences rather than merely deleting normal content.

Powerful destructive choices may open alternate opportunities while creating risk, opposition and persistent cost.

## 24.2 No Fake Freedom

A civilisation should not praise the player after they destroy its homes because the reputation table forgot what happened. A companion should not ignore repeated betrayal because the quest advanced. A market should not ignore a blockade. A settlement should not recover from destruction without time, resources or intervention.

The world must connect player freedom to world memory.

---

# 25. Death, Failure and Recovery Philosophy

Death and failure should create consequence without routinely destroying long-term progression.

The original direction of recoverable inventory/tombstone-style loss remains a valid foundation unless later revised by the Player Progression, Combat and world-settings documents.

At the master-vision level:

- ordinary death should not normally erase permanent skills or broad character progression;
- carried resources may be placed at risk according to world settings;
- recovery should be understandable and usually fair;
- difficulty may offer stronger or weaker consequences;
- Hardcore-style rules may exist as optional settings;
- combat/downed/death execution belongs to Document 16;
- biological Health and recovery belong to Set 29;
- progression loss/reward rules belong to Document 02;
- UI and recovery guidance belong to Document 17.

World failures beyond player death should also favour persistent consequence over invisible reset where practical.

---

# 26. Multiplayer and Shared-World Intent

Solo play remains a complete first-class experience. The architecture must also preserve the intended ability to support shared worlds.

Final-game intentions continue to include:

- online co-op;
- LAN play;
- split-screen/local multiplayer;
- potential server-hosted worlds where later production decisions support them.

Production classification may defer when a specific multiplayer mode becomes publicly playable, but system ownership, permissions, authority and persistence should not be designed in a way that makes future shared-world support impossible.

## 26.1 Shared-World Design Principles

Multiplayer-sensitive systems include:

- inventory and ownership;
- buildings and blueprints;
- settlement influence;
- reputation and social relationships;
- contracts and money;
- companions;
- quests/events and contribution;
- combat and damage;
- movement and vehicles;
- ships and crews;
- world time;
- distant simulation;
- UI per local player;
- save/reconnection state.

A multiplayer client or UI should request validated changes rather than becoming a second source of persistent truth.

---

# 27. UI/UX, Accessibility, Guidance and Player Trust

The interface is the player's interpretation and control layer for a deep systemic world.

## 27.1 World-First UI

Normal play should prioritise the world. Detailed information appears contextually through:

- inspection;
- tooltips;
- inventory and crafting screens;
- machine and network panels;
- settlement views;
- dialogue;
- maps and route views;
- journals and Codex;
- building/blueprint tools;
- health and condition feedback;
- market/contract screens;
- companion and social views;
- ship/navigation interfaces;
- development-only diagnostics where appropriate.

The player should not need a permanent strategy-dashboard overlay to understand the game.

## 27.2 Progressive Disclosure

New players should be able to act with summaries and reasons. Expert players should be able to drill into deeper detail.

Important failure must explain its cause:

- not enough stock;
- route blocked;
- building inactive;
- worker unavailable;
- biological condition limiting capability;
- insufficient permission;
- contract terms invalid;
- power or mana unavailable;
- movement clearance failed.

## 27.3 Accessibility Is Architecture

Critical information should use more than one channel where practical. Support includes:

- scalable text/UI;
- captions;
- colour-independent cues;
- reduced motion;
- reduced flashes;
- controller support and remapping;
- aim/timing assistance where relevant;
- equivalent visual/audio/directional feedback;
- configurable HUD and notification density;
- survival/difficulty settings that alter pressure without hiding system ownership.

## 27.4 Main Menu and World Creation

World creation is a first-class configuration surface. It should expose meaningful choices without requiring technical knowledge, including difficulty, guidance and simulation/performance-related options owned by the appropriate later documents.

The exact final menu architecture belongs to Document 17 and later settings work.

---

# 28. Unified Forge and Content-Creation Vision

The Forge is Leyforge's controlled content-authoring environment. It is not the gameplay simulation itself.

## 28.1 Unified Forge Structure

The approved architecture contains:

### Asset Forge
Creates and edits:

- blocks and surfaces;
- items and equipment;
- props and machines;
- materials and palettes;
- visual states and source assets.

### Entity Forge
Creates and edits:

- player/NPC bodies;
- creatures, monsters and bosses;
- body plans;
- rigs and joints;
- animation and attachment data;
- equipment appearance and variants.

### Blueprint Forge
Creates and edits:

- buildings and structures;
- semantic rooms/markers;
- construction stages;
- networks and routes;
- worldgen structure source;
- damage/restoration states;
- culture and environment variants.

### Presentation Forge
Creates and edits:

- voxel VFX;
- sound events;
- spatial attachments;
- ambience;
- material response;
- presentation profiles;
- accessibility-equivalent cues.

## 28.2 Forge Boundary

> **Forge Rule**
>
> The Forge may author how something looks, is spatially assembled, is animated, is presented or is semantically marked, but it may not silently redefine the gameplay owner of that object.

A furnace can be visually redesigned without changing its recipe truth. A creature can be re-rigged without rewriting its AI. A building blueprint can change architecture without inventing Housing capacity unless it satisfies the building/service contract.

## 28.3 Editable Source and Runtime Products

Voxel authoring source remains editable. Runtime meshes, caches, collision products, icons, animation data and presentation bakes are derived products that may be regenerated.

## 28.4 Player Blueprint Tools Are Distinct

The developer Forge and the shipped player-facing Blueprint Workshop share compatible foundations but not unrestricted authority. Players can design and submit/build valid content without gaining developer registry, migration or source-of-truth control.

## 28.5 Summer Engine Assistance

Summer Engine may assist with modelling suggestions, repetitive authoring, code generation, validation preparation, migration candidates and other bounded development work. Generated work remains reviewable, provenance-aware and subject to deterministic validation and human approval.

The current approved Forge direction does **not** require the shipped game to depend on an external AI service.

---

# 29. Performance, Simulation Scale and Hardware Accessibility

Leyforge's world is intentionally larger and more systemic than can be simulated at maximum detail everywhere.

Scalability is therefore part of design rather than a late optimisation task.

## 29.1 Simulation LOD

Different distance/relevance bands may use:

- full interactive actors and physical objects near players;
- reduced local simulation at medium range;
- settlement, route, ecology, economy, biological and event summaries at distance;
- deferred presentation where gameplay truth remains intact.

Promotion and demotion between fidelity levels must preserve authoritative state.

## 29.2 Quality Profiles Must Not Change Truth

Performance/quality settings may change:

- visual distance;
- actor representation;
- VFX/audio density;
- decorative animation;
- update frequency within approved bounds;
- background detail;
- local simulation budgets.

They should not silently change:

- whether goods existed;
- whether a contract was fulfilled;
- who owns an item;
- whether an NPC survived;
- whether a route was physically blocked;
- whether a settlement project consumed resources;
- whether a player action had a persistent consequence.

## 29.3 Lower-End Hardware Direction

World and simulation settings should allow players with lower-end hardware to reduce representation cost and selected simulation breadth where compatible with the owning systems. The goal is to preserve the same game identity at different fidelity levels rather than maintain one uncompromising hardware target.

Exact budgets and presets belong to the rewritten Document 18 and Document 17 settings architecture.

---

# 30. Production Scope, Packages and Release Tiers

The Master Bible describes the intended game. It does not mean every documented feature ships in the first production milestone.

## 30.1 Production Tiers

Approved production classification uses:

1. **Core Production** - smallest complete content set required to prove the final game identity.
2. **Early Access** - breadth/depth added after Core stability.
3. **Full Release** - intended commercial breadth that is not required for first complete identity proof.
4. **Later Expansion** - large new themed systems, realms, cultures, threats or content packs built on stable extension points.
5. **Tooling Research** - content dependent on unproven physics, rendering, AI, networking, authoring or simulation scale.
6. **Archived Validation** - retired POC material, historical experiments and regression fixtures.

## 30.2 Complete Packages, Not Attractive Lists

A system/content family enters production when its package has the required:

- stable identity;
- owner;
- dependencies;
- physical inputs and outputs;
- capabilities and fallbacks;
- content relationships;
- presentation requirements;
- simulation behaviour;
- save/migration treatment;
- validation evidence.

An impressive isolated idea that lacks these foundations belongs in a later tier until complete.

## 30.3 Core Production Is Not the POC

Core Production must prove the final game's identity in a genuinely generated world. It is not a more polished version of Forest Hamlet.

---

# 31. Proof-of-Concept Retirement and Preservation Doctrine

The POC has completed its purpose: it proved that many of Leyforge's interconnected systems could work together. It is no longer the production-world template.

## 31.1 Archived POC Identities

The following are not required normal production content:

- Forest Hamlet as a guaranteed settlement;
- Hearthplain / the controlled POC valley;
- fixed named POC villagers and their exact roster;
- fixed Forest Hamlet Council / Briarhook / Regional March POC identities where they were demonstration-specific;
- guaranteed watchtower tutorial project;
- fixed raid day or scripted goblin raid sequence;
- guaranteed goblin camp, cave, mana pocket, rune ruin, bridge/crossing or raid approach arrangement;
- fixed first portal and fixed portal destination;
- exact POC coordinates, distances, timings and demonstration constants;
- world-generation fallback that recreates those arrangements.

## 31.2 Protected Capabilities

The following are **not removed** merely because the POC used them:

- named persistent NPCs;
- households, jobs, schedules, inventories and migration;
- settlement warehouses;
- request boards and real demand;
- staged NPC construction;
- watchtowers as generic defence/observation structures;
- roads, bridges, camps, ruins, mines, shrines and magic sites as generic families;
- raids, warning, preparation, evacuation, damage, casualty, repair and aftermath;
- hostile source camps/nests where supported by current ecology/threat systems;
- automation, buffers, logistics, power and mana networks;
- practical magic, runes, wards, rituals and portals;
- caves, dungeons and resource sites;
- physical resource-conserving production chains;
- preparation changing threat outcomes;
- persistent world history;
- accessibility and readable system causality;
- simulation LOD;
- fully seed-driven discovery;
- cottages, warehouses, workshops, farms, watchtowers, wards and other valid building families.

## 31.3 Conversion Rule

POC scenario wording should be converted into reusable conditions.

**Legacy example:**

> The player supplies Forest Hamlet with iron so its builder completes the watchtower before the goblin raid.

**Production interpretation:**

> A settlement may select, propose or accept a defence project when Safety demand, known threat, culture, policy, terrain and available capability justify it. Authorised resources are reserved and consumed through construction stages. Completed defence changes warning, refuge or conflict outcomes. The settlement, project, threat and timing are seed/context-driven rather than guaranteed.

That conversion preserves the feature while removing the demonstration wrapper.

---

# 32. Source-of-Truth and Interface Design Rules

The project has reached a scale where ownership is a design requirement.

> **One Gameplay Rule, One Owner**
>
> Other systems consume typed, versioned interfaces and evidence. They do not recreate the owner's formula because they need the result.

## 32.1 Final 27-30 Ownership Locks

| Gameplay Truth | Owner |
| --- | --- |
| Prices, currency, markets, wages, economic contracts, finance, taxes, trade-route economics | **Set 27** |
| Dialogue, beliefs, rumours, social memory, trust, loyalty, willingness, companion agreements, social assignment intent | **Set 28** |
| Biological Health, Stamina, Fatigue, hunger/hydration/nutrition, temperature/wetness/sleep, injuries, disease, toxins, treatment | **Set 29** |
| Ground/air/traversal movement, mounts, land vehicles, physical routes, travel time, local path execution and movement LOD | **Set 30** |
| Detailed water/fluid identity and aquatic locomotion | **Set 26B-26E** through the reconciled boundary |
| Physical roads, bridges and functional buildings | **Document 20 / structure owners** |
| World time and global presence trigger | **Technical/world authority** |

## 32.2 Interface Principles

Cross-system interfaces should preserve:

- typed snapshots rather than raw mutable internals;
- source revision and authoritative world time where staleness matters;
- idempotent evidence/transaction IDs for persistent consequences;
- side-effect-free queries unless explicitly commands;
- separation of permission from physical feasibility;
- separation of intent from execution;
- separation of biological cause from movement consequence;
- separation of economic value from physical capacity;
- separation of actor belief from objective world truth;
- consistent behaviour across local and distant simulation.

## 32.3 Immutable Definition vs Mutable Instance

Definitions describe what a thing **can be**. Runtime records describe what a particular thing **currently is**.

This distinction applies to blocks, items, people, buildings, machines, creatures, structures, vessels, quests, markets, relationships, injuries and world sites.

The project must avoid copying one runtime instance's current state back into a shared definition.

---

# 33. Core Production Identity Proof

The first complete production milestone should prove the final game identity without implementing the entire documented universe.

A valid Core Production experience should demonstrate that:

- a new seed can begin safely without requiring a named village;
- the player can gather, craft, build and survive through local capability providers;
- multiple regions/biomes create meaningful world variation;
- multiple societies can exist and behave differently;
- physical resources feed real civilisation systems;
- automation can supply settlement, trade, defence or recovery outcomes;
- practical magic affects everyday world systems;
- ecological pressure and threats create understandable preparation and consequences;
- adventure sites have origin, inhabitants, rewards and aftermath;
- markets and routes respond to the physical world;
- persistent people can remember and socially react;
- biological condition matters in meaningful contexts without dominating normal play;
- movement and infrastructure create real accessibility and travel differences;
- at least one complete realm can be entered and safely exited through non-fixed capability paths;
- the world records persistent history;
- saves, migration, LOD, accessibility, validation and performance are treated as production requirements.

Maritime systems are a separately approved expansion programme with base-game compatibility boundaries; their individual shipping tier is governed by Set 25 classification and Set 26 technical readiness rather than assumed by this Master Bible.

---

# 34. Master Design Rules for All Later Documents

The following rules are binding vision-level constraints for the revised Foundation Documents and later specialist sets.

1. **Sandbox first.** Guidance and story support player choice rather than replacing it.
2. **Four pillars remain connected.** Survival, civilisation, automation and fantasy RPG play must feed each other.
3. **The world is seed-generated.** Production cannot depend on fixed POC identities or coordinates.
4. **Relationships matter more than content counts.** A biome, creature, structure or realm is incomplete if it has no meaningful connections.
5. **Physical resources are real.** Construction, production, trade and settlement supply conserve authoritative stock.
6. **Living people are persistent.** Important NPC identities, relationships and consequences survive representation changes.
7. **Settlements use the seven-needs model.** New top-level settlement meters require explicit approval rather than accidental proliferation.
8. **Buildings need functional contracts.** Appearance does not create service capacity.
9. **Automation serves the world.** It must connect to meaningful player/civilisation outcomes.
10. **Magic is practical.** It supports infrastructure, exploration, survival and civilisation as well as combat.
11. **Progression is multi-track and capability-based.** No one ore ladder or player level owns all progress.
12. **Economy derives from the physical world.** Abstract money cannot bypass real goods, labour and transport.
13. **Social systems remember.** Relationships, knowledge and negotiation must be grounded in world evidence.
14. **Survival creates decisions, not chores.** Normal healthy play should be stable; harsh pressure is configurable.
15. **Movement is honest about the world.** Terrain, routes, infrastructure and capacity matter locally and at distance.
16. **Oceans are real world space.** Maritime systems extend the same persistence, economy, ecology and construction philosophy onto water.
17. **Threats have causes and aftermath.** Combat and raids should leave persistent consequences.
18. **Culture is layered, not biological morality.** Ancestry, culture, faction, law and politics remain distinct.
19. **Major realms are complete worlds.** They need ecology, society/context, resources, sites, routes and consequence.
20. **Failure can create history.** The game should prefer persistent altered state over invisible reset where practical.
21. **Player morality is systemic.** Trust, law, economy, politics, relationships and world state express consequence.
22. **Accessibility is foundational.** Critical information survives reasonable sensory and control adaptations.
23. **Quality settings may reduce representation, not truth.** Performance abstraction may not invent or erase authoritative outcomes.
24. **Forge source is not gameplay truth.** Authoring and presentation consume declared gameplay contracts.
25. **One gameplay rule has one owner.** Consumers use interfaces rather than duplicate formulas.
26. **Stable identity survives revision.** IDs, aliases, migration and provenance are production requirements.
27. **Content is admitted as complete packages.** Planning breadth is not a shipping commitment.
28. **POC scenario content is archived; POC-proven capabilities are preserved unless explicitly superseded.**
29. **Summer Engine assists development under human authority.** Generated work is reviewed and validated.
30. **The world should visibly remember meaningful action.** If a system claims consequence, the player should eventually be able to perceive or inspect it.

---

# 35. Foundation Document Ownership and Integration Map

This Master Bible defines the project-level fantasy and intent. Detailed ownership lives below it.

| Document / Set | Production Responsibility |
| --- | --- |
| **00** | Master vision, identity, player fantasy, cross-system promises and design axioms. |
| **01** | Production core gameplay loop, play rhythms and cross-system player flow. |
| **02** | Player progression, skills, perks, knowledge and capability unlocks. |
| **03** | Canonical Blocks Registry framework and production block families. |
| **04** | Canonical Items Registry framework and production item families. |
| **05** | Crafting, recipe, transformation and authoritative transaction registry. |
| **06** | Resource/material ecology and capability progression. |
| **07** | Persistent people and NPC civilisation runtime. |
| **08** | Automation, logistics, power and control. |
| **09** | Magic, mana and civilisation magic. |
| **10** | Creature, ecology, threat and monster gameplay. |
| **11** | Production world generation, regions and biomes. |
| **12** | Structures, sites and persistent world infrastructure. |
| **13** | Peoples, cultures, factions, governments and identity layers. |
| **14** | Dimensions, realms and inter-realm systems. |
| **15** | Quests, events, history and world consequence. |
| **16** | Combat, gear, defence and conflict. |
| **17** | UI/UX, accessibility and player information architecture. |
| **18** | Godot/Summer Engine production technical architecture. |
| **19** | Settlement growth, district planning and player blueprint systems. |
| **20 + 20A-20H** | Buildings, facilities, services, construction projects, seven-needs integration and universal building catalogue. |
| **21** | Voxel Asset Forge. |
| **22** | Entity Forge, Blueprint Forge and unified Forge expansion. |
| **23** | Presentation Forge, voxel VFX, audio and shared sensory presentation. |
| **24** | World Content Atlas and seed-derived content relationship authority. |
| **25** | Post-Atlas production governance, registry kernel, capabilities, packages, validation, scope and production admission. |
| **26** | Oceans, maritime civilisation, vessels and naval systems. |
| **27** | Economy, markets, contracts, trade and public finance. |
| **28** | Dialogue, social systems, relationships, companions and delegation. |
| **29** | Survival, health and biological systems. |
| **30** | Movement, traversal and transportation. |

This map is a design-level guide. Field-level ownership and cross-set interfaces remain governed by the detailed owning documents.

---

# 36. Production Revision Requirements for Documents 01-20

Approval of Document 00 v1.0 means revised Foundation Documents must consume this production vision.

## 36.1 Documents 01-02

Must remove active POC framing, retain sandbox freedom and multi-track progression, integrate the post-Atlas world model and consume specialist economy/social/biology/movement boundaries.

## 36.2 Documents 03-06

Must be replaced as production registries/frameworks using Set 25's stable-ID, family, capability, provenance, substitution and package contracts. Old POC catalogue sizes and fixed progression chains are not production authority.

## 36.3 Documents 07-10

Must preserve their strong system identities while removing fixed Forest Hamlet demonstration chains and consuming Set 27-30 specialist outputs rather than duplicating them.

## 36.4 Document 11

Must be completely replaced with the production seed-generated Atlas/worldgen architecture. No controlled-valley production fallback is allowed.

## 36.5 Documents 12-17

Must retain structure, culture, realm, quest, combat and UI depth while removing fixed POC scenarios and integrating Atlas, Forge, maritime and Sets 27-30 ownership.

## 36.6 Document 18

Must be completely replaced with the current Godot/Summer Engine architecture. Engine-neutral principles from v0.1 may survive; Unreal-specific production direction does not.

## 36.7 Documents 19-20

Must be reconciled rather than discarded. Their Godot/Forge-era settlement and building foundations remain valuable, but POC milestone wording must be converted into generic production capability and Archived Validation references.

---

# 37. Closing Direction

Leyforge began with a focused proof: could voxel survival, real resources, NPC settlements, automation, practical magic, construction, combat and persistent consequence work together?

That proof has served its purpose.

The production game is now broader and more coherent. Its world is not a fixed valley but a seed-generated network of regions, cultures, ecologies, routes, structures, histories and realms. Its settlements are not scripted quest hubs but physical communities with people, needs, economies, relationships, health, movement and memory. Its factories and magic do not terminate at player power; they change civilisation. Its roads, ships and portals do not exist only for travel; they connect economies, people, risk and story. Its enemies do not exist only as health bars; they occupy ecologies, territories and histories. Its Forge does not replace gameplay truth; it gives the project the tools to author a vast voxel world without losing stable identity or source control.

The defining promise remains the same as the strongest idea in the original Master Bible, but it is now expressed at production scale:

> **Build a world where the player's survival, creativity, production, magic, relationships, travel and choices become part of civilisation and history — and where the world can answer back.**

---

# Appendix A. Reconciliation Summary From v0.1

| Original v0.1 Direction | v1.0 Treatment |
| --- | --- |
| Four-pillar identity | **Preserved and strengthened.** |
| Sandbox-first freedom | **Preserved.** |
| Living NPC villages | **Preserved; expanded through Documents 07, 19-20, Sets 27-30.** |
| Village growth | **Preserved; aligned to current Camp -> Magical Metropolis ladder and seven-needs model.** |
| Automation | **Preserved; fixed POC chain removed and physical/resource-conserving contracts emphasised.** |
| Practical magic | **Preserved; fixed tutorial path removed.** |
| Material progression | **Generalised from one global ladder into capability/fallback pathways.** |
| Races and cultures | **Preserved; layered identity and non-biological-morality rule strengthened.** |
| Dimensions | **Preserved; upgraded to complete persistent realm packages.** |
| Story | **Preserved; expanded with generated history, systemic quests/events and social memory.** |
| Morality freedom | **Preserved; expanded through social, economic, legal and political consequence.** |
| Multiplayer intent | **Preserved as architecture/final intent; shipping milestone remains production-classified.** |
| POC target | **Retired from active design; archived as validation.** |
| Forest Hamlet scenario | **Archived. Reusable mechanics remain protected.** |
| Unreal-era future technical assumptions | **Superseded by Godot/Summer Engine direction.** |
| Future-document roadmap | **Replaced by active 00-30 ownership/integration map.** |

---

# Appendix B. POC-to-Production Preservation Quick Test

Before removing any rule from an older Foundation Document, ask:

1. Is this only a named POC person, place, coordinate, fixed sequence or demonstration constant?
2. Is there a generic gameplay capability underneath it?
3. Does a later specialist document own that capability?
4. Has that later owner explicitly rejected it, or merely generalised it?
5. Does the feature appear in a current registry, Atlas family, building catalogue, capability graph or specialist contract?
6. Would removing it create a missing player capability or break a cross-system promise?

If the answer indicates a reusable system or content family survives, **generalise or interface it; do not delete it with the POC wrapper**.

---

# Appendix C. Core Production Capability Proof Graph

The current production-governance proof graph is retained here as a vision-level cross-reference, not as a forced linear quest chain:

```text
CAP-00 Safe Spawn and Local Survival
        -> CAP-01 Primitive Tools and Shelter
        -> {CAP-02 Provisions and Settlement Contact,
            CAP-03 Copper Mechanisms}
        -> {CAP-04 Iron Structural Support,
            CAP-05 Practical Mana,
            CAP-06 Regional Trade and Civilisation}
        -> {CAP-07 Regional Adventure,
            CAP-08 Automation-to-Civilisation}
        -> CAP-09 Realm Discovery and Safe Return
        -> CAP-10 Complete Core Realm Resolution
```

Each supported world profile must provide valid provider families, substitutes, alternate routes or controlled failure behaviour. The graph proves capability reachability, not one canonical story order.

---

# Appendix D. Production-Tier Terminology

| Tier | Master-Bible Meaning |
| --- | --- |
| **Core Production** | Required to prove the complete final-game identity in the first production milestone. |
| **Early Access** | Adds substantial breadth/depth after Core stability. |
| **Full Release** | Part of intended release breadth but not required for first complete identity proof. |
| **Later Expansion** | Large themed additions built on stable extension points. |
| **Tooling Research** | Requires unresolved technical or authoring research before production admission. |
| **Archived Validation** | Historical POC/experiment/regression material excluded from normal production content. |

---

# Appendix E. Document 00 v1.0 Acceptance Checklist

Document 00 v1.0 is ready to govern the next Foundation rewrite only if all of the following are true:

- [x] Four original gameplay pillars are preserved.
- [x] Sandbox-first role freedom is preserved.
- [x] Forest Hamlet/fixed POC world content is not active production direction.
- [x] Reusable POC-proven mechanics are explicitly protected.
- [x] Seed-generated Atlas/world-history direction is integrated.
- [x] Seven settlement needs and current settlement growth philosophy are integrated.
- [x] Unified Forge architecture is represented without transferring gameplay ownership.
- [x] Maritime systems are represented as a first-class approved expansion without forcing all players into naval play.
- [x] Economy, social, biological and movement specialist ownership is represented.
- [x] Cross-set one-owner/interface rule is explicit.
- [x] Godot/Summer Engine direction supersedes Unreal-specific production direction.
- [x] Accessibility, simulation LOD, persistence and lower-hardware scalability are foundation requirements.
- [x] Production tiers distinguish game vision from first-milestone shipping scope.
- [x] The document provides clear revision requirements for Documents 01-20.

---

**End of Document 00 - Master Game Design Bible v1.0**
