**Fantasy Voxel Civilisation Sandbox**

**20G - Culture, Faction, Biome and Realm Building Packs**

**Version 0.1 - Cultural Architecture, Adaptation and Signature Content Registry Draft**

*A controlled content-pack system for cultural identity, faction ownership, government and faith overlays, biome adaptation, realm construction, hybrid settlements, player-authored styles and signature structures - creating highly differentiated civilisations without duplicating the universal building registry.*

| **Field** | **Locked Direction** |
|---|---|
| Document Scope | Defines culture building packs, regional/subculture variants, faction and occupation overlays, government/faith modules, biome adaptation packs, realm building packs, hybrid/emergent culture composition, signature structures, pack manifests, validation, production targets and initial sample pack registry. |
| Identity Lock | Ancestry, culture, faction, settlement, government, religion and realm identity remain separate linked layers. No ancestry automatically receives one architecture, morality, government, technology or settlement style. |
| Universal Registry Rule | Documents 20A-20F own universal building functions. 20G selects blueprints, palettes, layouts, functional equivalents, project preferences and signature additions without copying every universal entry into a culture-specific duplicate. |
| Seven-Needs Lock | Housing, Provisions, Health, Work, Safety, Infrastructure and Morale remain the only main needs. Cultural belonging, heritage, adaptation, faith, faction control, realm stability and identity are modifiers, services, requirements and story layers. |
| Composition Direction | Resolve content through layered composition: universal definition -> blueprint archetype -> culture -> regional/subculture -> biome -> faction/government/faith -> realm -> history/state -> approved player style. |
| Player Blueprint Direction | Players can create culture-neutral styles, custom town packs, hybrid culture packs and pack-compatible blueprints in the main-menu workshop or in-world. Functional validation and server/content permissions remain authoritative. |
| POC Direction | Prove a culture-neutral forest foundation kit, Riverward Frontier Folk pack, Briarhook Raider overlay, Temperate Forest/River adaptation and a light Regional March overlay. Full culture production follows the universal POC. |
| Realm Direction | Major realms receive construction rules, arrival/outpost content, native settlement profiles, portal dependencies, local material tokens and signature structures; realms are not recoloured biome packs. |
| Mod/Content Direction | Packs use stable namespaces, manifests, versions, dependencies, compatibility ranges, priorities, localisation keys and content hashes. Data packs precede executable mod scripting. |
| Balance Direction | Cultural and realm differences should be visible and meaningful, but no pack is simply better. Benefits carry costs, requirements, laws, maintenance, terrain dependence or political consequences. |

| **Locked Scope Rule** |
|---|
| **Culture packs create identity and valid alternatives, not an ancestry stereotype or a second universal registry.** A culture can contain many ancestries, one ancestry can belong to many cultures, factions can cross cultures, and mixed settlements can create new hybrid architecture through history and player action. |

# Document Purpose

Document 20G defines how the universal buildings and settlement plans from Documents 20A-20F become recognisable cultures, political territories, climate-adapted settlements and realm civilisations. It establishes the data layers and production rules that let one functional cottage, warehouse, blacksmith, road or district family support many silhouettes, layouts, materials, laws, utilities, signature modules and player-designed alternatives.

The document also protects the project from uncontrolled content duplication. A forest culture, desert culture, goblin commune, dwarf-associated hold, faction outpost or fae realm does not need a separate hard-coded copy of every building. Packs override approved fields, select compatible blueprints, supply material/style tokens, add bounded signature definitions and register functional replacements where a society genuinely solves the same problem differently.

# Design Sources and Dependencies

| **Source** | **20G Dependency** |
|---|---|
| 03-06 - Blocks, Items, Recipes and Resources | Material families, construction tokens, cultural goods, recipe substitutions, exact costs, realm resources and strategic inputs. |
| 07 - NPC Village System | Named residents, households, laws, jobs, warehouses, projects, migration, mixed populations, reputation and simulation LOD. |
| 08-09 - Automation and Magic | Cultural technology acceptance, labour politics, rune styles, faith practices, wards, portals, realm adaptation and risk. |
| 10 - Creatures and Monsters | Intelligent faction camps, livestock/ecology adaptation, realm creatures and non-inherent hostility. |
| 11 - Biomes and World Generation | Climate, terrain, water, resources, village suitability, material variation, dynamic biome states and structure placement. |
| 12 - Structures | Blueprints, palettes, faction/culture ownership, biome rules, damage, occupation, restoration and structure readability. |
| 13 - Races, Peoples, Cultures and Factions | Separate identity layers; culture architecture, materials, government, faith, economy, labour, territory, occupation, diaspora and hybridisation. |
| 14 - Dimensions | Realm physical laws, portals, native societies, outposts, local resources, automation adaptation, trade, migration and world-state outcomes. |
| 17 - UI/UX | Culture/faction/realm presentation, knowledge-aware labels, map layers, accessibility-safe motifs and pack selection/validation. |
| 18 - Technical Implementation | Stable IDs, content-pack manifests, validated registries, localisation, save migration, deterministic variation and safe mod boundaries. |
| 19 - Settlement Growth and Player Blueprint System | Material tokens, palettes, style kits, dual creator modes, player town packs, culture acceptance and settlement planning. |
| 20 / 20H | Universal building ownership, seven needs, pack boundaries, POC roster, production waves and anti-bloat rules. |
| 20A-20F | Universal functions and plans that packs select, adapt or replace. |

# Static Table of Contents

- 1. Locked 20G Identity
- 2. Scope Boundaries and Anti-Stereotype Rules
- 3. Pack Taxonomy and Layered Composition
- 4. Universal Functions, Replacements and Signature Structures
- 5. Material Tokens, Palettes, Silhouette and Detail Grammar
- 6. Layout, Household, Storage, Roads, Defence and Public Space
- 7. Culture, Subculture and Regional Variation
- 8. Faction, Government, Faith, Occupation and Resistance Overlays
- 9. Biome and Dynamic-State Adaptation Packs
- 10. Realm Building Packs and Interdimensional Settlements
- 11. Hybrid, Diaspora and Player-Founded Culture Development
- 12. Pack Resolution, Compatibility, Manifests and Load Order
- 13. NPC Planner, Project Pools and Cultural Acceptance
- 14. Player Blueprint, Town-Pack and Main-Menu Workshop Validation
- 15. Damage, Heritage, Conquest, Restoration and Cultural Change
- 16. Production Targets and Content Budget
- 17. Initial Pack Registry Summary
- 18. POC and Overworld Culture/Faction Pack Profiles
- 19. Additional Culture and Dynamic Overlay Profiles
- 20. Biome Adaptation Pack Profiles
- 21. Realm Building Pack Profiles
- 22. Post-POC Implementation Plan
- 23. Balancing, Representation and Simulation LOD
- 24. Open Questions for Later Lore and Production
- Appendix A. 20G Pack Data Field Template
- Appendix B. Override and Composition Matrix
- Appendix C. POC and Alpha Acceptance Checklist
- Appendix D. Suggested Godot Resources and Runtime Records
- Appendix E. Initial Production Backlog

# 1. Locked 20G Identity

20G is the architectural identity, ownership and environmental adaptation layer of the building suite. It makes settlements readable before the player opens a menu: silhouettes, roofs, roads, storage, banners, lighting, public space, defensive layout, machines, shrines and damage history reveal who built a place, who controls it, where it stands and how it has changed.

| **Locked Rule** |
|---|
| A pack may change approved presentation, materials, layout preferences, project weights, laws, compatible functional equivalents and bounded signature content. It may not invent resources, beds, jobs, safety or service capacity without valid universal definitions, markers, items, workers and networks. |

| **Identity Layer** | **Design Meaning** | **Player-Facing Result** |
|---|---|---|
| Culture | Shared material and social identity: architecture, food, work, public space, rituals, storage and history. | Settlements feel coherent and learnable without ancestry stereotypes. |
| Regional/Subculture | Local climate, history, neighbours, resources and reform alter the parent culture. | Two settlements of one culture can look and behave differently. |
| Faction | Ownership, goals, military/logistics needs, symbols and law overlay compatible culture content. | A merchant league, council, raider clan or occupation visibly changes sites. |
| Government/Faith | Authority, property, assembly, sacred space, charity, burial and forbidden practices add modules. | Civic and religious structures vary without defining all culture. |
| Biome | Climate, terrain, water, hazard and local resources change foundations, roofs, routes and utilities. | Buildings belong to the world and remain functional. |
| Realm | Physical laws, portal dependence, local materials, native politics and ecology reshape construction. | Dimensions feel like complete civilisations, not palette swaps. |
| History/State | Damage, occupation, migration, hybridisation, reform, ruin and restoration leave layered evidence. | The player can read who built, changed and currently controls a place. |
| Player Style | Approved player blueprints and town packs contribute to local identity. | Custom settlements can become culturally recognised rather than remaining disconnected builds. |

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

# 3. Pack Taxonomy and Layered Composition

## 3.1 Pack Types

| **Pack Type** | **Primary Responsibility** | **Examples** |
|---|---|---|
| Foundation kit | Neutral authoring and fallback content. | POC forest kit, creative test kit. |
| Culture pack | Shared materials, silhouettes, layouts, substitutions, signatures and project preferences. | Riverward Frontier, Emberhold. |
| Regional/subculture pack | Local variation over a parent culture. | Northern Riverward, border marcher. |
| Faction overlay | Ownership, symbols, security, logistics, law and faction-specific modules. | Briarhook, merchant league, occupation force. |
| Government module | Civic layout, leadership, property and administrative structures. | Council, monarchy, commune, guild oligarchy. |
| Faith/philosophy module | Sacred/public spaces, rites, burial, charity, taboos and magical tradition. | Hearth and River, ancestor path. |
| Economy/labour module | Signature industries, storage, markets, labour customs and automation attitudes. | Forge commune, caravan network. |
| Biome adaptation | Climate, terrain, water, hazard and local material solutions. | Desert, frost, swamp, underground. |
| Dynamic-state adaptation | Corruption, blessing, disaster, occupation, refugee or recovery state. | Blighted settlement, reconstruction. |
| Realm pack | Physical-law, portal, ecology, local material, native society and settlement adaptation. | Verdant Covenant, World-Engine. |
| Hybrid/emergent pack | Controlled composition from residents, history, laws, player style and repeated use. | Player-founded mixed frontier culture. |
| Heritage/ruin pack | Historical palette, protected remains, restoration and legitimacy. | Ancient road culture, restored portal city. |

## 3.2 Composition Order

1. Universal building or plan definition.
2. Compatible blueprint archetype and size.
3. Primary culture pack.
4. Regional/subculture variation.
5. Biome and climate adaptation.
6. Faction ownership and government/faith/economy modules.
7. Realm adaptation where applicable.
8. Settlement history, occupation, damage, corruption and restoration.
9. Approved player style or settlement-specific authored variation.
10. Deterministic seed/age/weather material variation.

## 3.3 Conflict Resolution

- Safety and functional validation override appearance.

- Realm physical-law requirements override ordinary biome defaults.

- Explicit settlement law/ownership overrides generic culture preference.

- A specific blueprint override outranks family-level palette defaults.

- Dynamic damage/occupation states layer over intact style without destroying origin history.

- Player overrides are accepted only for fields the pack exposes.

- Conflicts produce readable validation reasons and fallback options rather than silent random selection.

# 4. Universal Functions, Replacements and Signature Structures

## 4.1 Adaptation vs Replacement

An adaptation keeps the same universal family and changes its blueprint, materials or modules. A replacement provides the same capability through a culturally distinct building/service profile.

Examples:

- Cottage -> stilt cottage: adaptation.
- Village well -> public spring-house: validated replacement.
- Town hall -> clan moot hall: validated government replacement.
- Road -> canal route: replacement only when route and access contracts are satisfied.
- Shrine -> community hall: not an automatic replacement unless the required Morale/culture services are defined.

## 4.2 Replacement Contract

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

## 4.3 Signature Structures

Signature content should:

- Express history, government, faith, economy, magic, realm relationship or a culture-defining problem.

- Add a meaningful service, project, ritual, trade, story or world-state role.

- Reuse universal systems whenever possible.

- Avoid becoming mandatory for every settlement of that culture.

- Have clear earliest stage and rarity.

- Support damaged, occupied, restored and player-adapted forms.

- Remain bounded in production and performance.

# 5. Material Tokens, Palettes, Silhouette and Detail Grammar

## 5.1 Core Token Families

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

## 5.2 Visual Grammar Fields

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

## 5.3 Material Substitution

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

# 6. Layout, Household, Storage, Roads, Defence and Public Space

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

# 7. Culture, Subculture and Regional Variation

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

# 8. Faction, Government, Faith, Occupation and Resistance Overlays

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

# 9. Biome and Dynamic-State Adaptation Packs

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

# 10. Realm Building Packs and Interdimensional Settlements

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

# 11. Hybrid, Diaspora and Player-Founded Culture Development

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

# 12. Pack Resolution, Compatibility, Manifests and Load Order

Every pack manifest includes:

- pack_id and namespace.
- display/localisation keys.
- pack_type.
- version and schema_version.
- dependencies and optional integrations.
- compatible game/content versions.
- parent packs.
- priority and conflict policy.
- universal families touched.
- blueprint and palette references.
- override permissions.
- signature definitions.
- material/recipe dependencies.
- biome/realm/faction/culture tags.
- localisation and icon assets.
- content hash.
- migration aliases.
- server/mod permission class.
- testing and planning status.

Pack loading validates references before a world opens. Missing optional packs use explicit fallbacks; missing required packs block or migrate the affected content safely.

# 13. NPC Planner, Project Pools and Cultural Acceptance

Planner filtering uses:

- universal need/capability.
- culture and regional pack.
- faction/government/faith law.
- biome and realm.
- local materials and trade.
- stage and knowledge.
- resident accessibility.
- ownership and protected sites.
- threats and economy.
- existing style coherence.
- player proposal and reputation.
- heritage and demolition impact.
- maintenance and specialist availability.

Cultural acceptance can be:

- native/preferred.
- common.
- acceptable.
- foreign but permitted.
- restricted.
- sacred/protected.
- forbidden by current law.
- contested.
- occupation-imposed.
- emerging hybrid.
- player-private only.

# 14. Player Blueprint, Town-Pack and Main-Menu Workshop Validation

Players may author:

- one building compatible with existing packs.
- a palette/style kit.
- a building-family blueprint set.
- a road/furniture/decoration kit.
- a cluster or district style.
- a complete player-town pack.
- a hybrid/emergent culture proposal.
- realm-adapted outpost pack.
- signature structure proposal where world/server rules allow.

Validation checks function, resources, markers, access, performance, protected motifs, pack dependencies, localisation, versioning and authority. Publishing/sharing moderation is deferred to platform and community policy.

# 15. Damage, Heritage, Conquest, Restoration and Cultural Change

A structure runtime record preserves:

- origin culture and builder.
- later owners/factions.
- applied biome/realm adaptations.
- occupation overlays.
- damage and repair history.
- restored or converted state.
- current active style.
- protected heritage tokens.
- player modifications.
- accepted hybrid identity.
- relevant historical events.

Restoration can choose preservation, faithful reconstruction, adaptive reuse, occupier removal, hybrid renewal or deliberate ruin memorialisation.

# 16. Production Targets and Content Budget

| **Content Level** | **Suggested Target** | **Purpose** |
|---|---|---|
| POC | 1 neutral foundation, 1 culture pack, 1 hostile faction overlay, 1 biome adaptation, 1 light regional overlay. | Prove composition and readability without delaying core systems. |
| Early Alpha | 3-5 culture packs, 4-6 biome adaptations, 3-5 faction/government overlays. | Prove differentiated villages and mixed populations. |
| Realm Alpha | Verdant Covenant realm pack plus arrival/outpost/portal content. | Prove realm-specific construction and politics. |
| Beta | 8-12 culture families, 8-10 biome/dynamic packs, major faction overlays and hybrid composer. | Support broad world diversity. |
| Full Game | Curated pack library tied to regions, cultures, factions and realms; controlled expansion through data packs. | Long-term replayability without unbounded duplication. |

A major culture should not automatically require 120 new blueprints. A first production pack can target 12-20 high-value official blueprints, palette coverage for universal families, 3-8 signature structures and several district preferences.

# 17. Initial Pack Registry Summary

| **Pack ID** | **Name** | **Type** | **Scope** | **Status** |
|---|---|---|---|---|
| pack.foundation.forest_neutral_poc | Culture-Neutral Forest Settlement Foundation Kit | Foundation / POC authoring kit | Camp -> Village; POC Required | POC Required |
| pack.culture.riverward_frontier | Riverward Frontier Folk Building Pack | Culture pack | Camp -> Town; POC Required / Alpha expansion | POC Required |
| pack.faction.briarhook_raiders | Briarhook Raider Clan Structure Overlay | Faction overlay | Camp / raider outpost; POC Required | POC Required |
| pack.faction.regional_march_authority | Regional March Authority Civic and Road Overlay | Faction/government overlay | Village -> Capital; POC Reference / Alpha | POC Reference |
| pack.biome.temperate_forest_river | Temperate Forest and River Biome Adaptation Pack | Biome adaptation | Overworld natural biome; POC Required | POC Required |
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

# 18. POC and Overworld Culture/Faction Pack Profiles

### Culture-Neutral Forest Settlement Foundation Kit

`pack.foundation.forest_neutral_poc`

| **Field** | **Pack Direction** |
|---|---|
| **Pack type and scope** | Foundation / POC authoring kit - Camp -> Village; POC Required |
| **Identity** | A restrained temperate-forest kit used to prove universal buildings, material tokens, terrain adaptation and NPC construction before strong culture-specific content is added. |
| **Visual and material layers** | Oak/softwood structural tokens, fieldstone foundations, thatch or timber-shingle roofs, dirt paths, simple timber furniture, neutral signs, warm lanterns, modular fences, scaffolds and repair states. |
| **Functional/project direction** | Supplies official POC blueprints for the protected thirty-building roster without claiming that every culture builds the same way. |
| **Universal replacements or adaptations** | No functional replacements. It selects simple universal blueprint archetypes and provides fallback material substitutions when local resources vary. |
| **Signature content** | Forest campfire circle, builder yard, compact storehouse, timber watchtower and river-crossing details used only as POC examples. |
| **Settlement layout grammar** | Loose village centre, farms and resource sites connected by organic paths; structures orient toward terrain, roads, water and shared storage rather than a strict grid. |
| **Material families** | any_local_log, any_local_plank, fieldstone, thatch, clay brick, simple iron fittings, glass where unlocked. |
| **Critical rules and consequences** | Must remain low-cost, readable and easy to recolour. It cannot become the permanent default for all cultures. |
| **NPC planner priorities** | Used when no authored culture pack is available, in creative testing, or for the POC Forest Hamlet seed. |
| **Player blueprint/town-pack support** | Players may copy, edit, replace and export every foundation blueprint. Validation is functional rather than stylistic. |
| **Planning status** | POC Required |

### Riverward Frontier Folk Building Pack

`pack.culture.riverward_frontier`

| **Field** | **Pack Direction** |
|---|---|
| **Pack type and scope** | Culture pack - Camp -> Town; POC Required / Alpha expansion |
| **Identity** | A mixed frontier culture shaped by river farming, timber work, communal storage, practical rune magic, seasonal floods and defensive cooperation. |
| **Visual and material layers** | Raised fieldstone footings, heavy timber frames, steep weatherproof roofs, river-blue and hearth-amber textiles, carved current motifs, communal stores, visible repair timber and practical ward marks. |
| **Functional/project direction** | Prefers shared warehouses, farmstead clusters, flood-safe paths, watchtowers, community halls, small shrines, carpenter/mason work and practical mage huts. |
| **Universal replacements or adaptations** | Village Well may become a covered spring-house or pump shelter; Small Shrine may become a Hearth and River Hall; generic watchtower uses a riverward signal-and-ward variant. |
| **Signature content** | Riverward Long Store, Floodgate Granary, Hearth-and-River Hall, Fordwatch Tower, Seasonal Ferry Shelter and later March Bridgehouse. |
| **Settlement layout grammar** | Linear or crescent settlements following river terraces and roads, with farms on safer flats, stores above flood level and defence watching crossings. |
| **Material families** | local timber, river stone, clay brick, reed/thatch, iron straps, blue ceramic, woven river fibre and modest mana crystal/rune components. |
| **Critical rules and consequences** | Communal storage and public access are culturally preferred, but private households and player property remain supported. Architecture must work for mixed ancestries. |
| **NPC planner priorities** | Scores water access, flood risk, communal capacity, bridge/ford control, food storage and practical defence highly. |
| **Player blueprint/town-pack support** | Approved player blueprints may join the culture library when they use compatible functional markers and at least a selected Riverward style token set. |
| **Planning status** | POC Required |

### Briarhook Raider Clan Structure Overlay

`pack.faction.briarhook_raiders`

| **Field** | **Pack Direction** |
|---|---|
| **Pack type and scope** | Faction overlay - Camp / raider outpost; POC Required |
| **Identity** | A specific goblin raider clan driven by scarcity, status, stolen supply and local grievance; it is not a universal goblin culture. |
| **Visual and material layers** | Salvaged timber and scrap, hooked thorn motifs, mismatched banners, stolen crates, smoke, rope bridges, concealed exits, traps, lookout perches and visibly repurposed foreign materials. |
| **Functional/project direction** | Adds raid staging, stolen-goods storage, patrol routes, surrender points, prisoner/negotiation space, escape paths and leader status markers to compatible camp and outpost blueprints. |
| **Universal replacements or adaptations** | Neutral camp store becomes a guarded loot cage; meeting shelter becomes a raid planning canopy; watch platform becomes a hooked lookout; paths may use crawl gaps and ambush sockets. |
| **Signature content** | Hookpost Lookout, Stolen Stores Pen, Captain's Scrap Hall, Thorn Gate, Hidden Ravine Exit and Signal-Smoke Rack. |
| **Settlement layout grammar** | Defensible irregular camp near raid approaches, caves or forest edges, with layered escape routes and no assumption of permanent urban growth. |
| **Material families** | stolen local materials, scrap metal, hide, rope, thorn blocks, crude clay, faction banners and recovered machine/magic pieces. |
| **Critical rules and consequences** | Hostility, ownership and crime come from faction state. Goblin ancestry does not automatically receive this overlay. |
| **NPC planner priorities** | Faction AI prioritises concealment, stolen-stock capacity, raid route, escape, morale and leader defence over comfort or civic services. |
| **Player blueprint/town-pack support** | Captured structures may be dismantled, cleansed, negotiated over or converted. Player use requires ownership transfer and trap validation. |
| **Planning status** | POC Required |

### Regional March Authority Civic and Road Overlay

`pack.faction.regional_march_authority`

| **Field** | **Pack Direction** |
|---|---|
| **Pack type and scope** | Faction/government overlay - Village -> Capital; POC Reference / Alpha |
| **Identity** | A larger frontier authority visible through road markers, tax seals, guard posts, bridge control and administrative obligations without defining all local culture. |
| **Visual and material layers** | Standardised road stones, official signposts, boundary posts, inspection seals, guard colours, document boards, bridge plaques and fortified customs details. |
| **Functional/project direction** | Adds toll/customs, tax record, patrol, messenger, road ownership, regional defence and permit markers to universal buildings. |
| **Universal replacements or adaptations** | Village Hall can gain a March Clerk Annex; bridgehouse can gain toll/customs service; gate may use official inspection lanes; warehouse may reserve levy stock. |
| **Signature content** | March Roadhouse, Bridge Clerk Office, Border Beacon, Levy Store and Regional Muster Yard. |
| **Settlement layout grammar** | Follows strategic roads, borders and crossings rather than replacing local settlement layout. |
| **Material families** | Durable local stone, standard iron fittings, official banners, stamped timber signs and archive materials. |
| **Critical rules and consequences** | Overlay can coexist with Riverward or other cultures. Occupation, reform or independence can remove or alter it while leaving physical evidence. |
| **NPC planner priorities** | Regional faction prefers roads, signals, forts, customs and reserve stores according to threat and tax/trade policy. |
| **Player blueprint/town-pack support** | Player settlements may negotiate charters, accept road funding, reject authority or capture facilities with reputation and legal consequences. |
| **Planning status** | POC Reference |

### Temperate Forest and River Biome Adaptation Pack

`pack.biome.temperate_forest_river`

| **Field** | **Pack Direction** |
|---|---|
| **Pack type and scope** | Biome adaptation - Overworld natural biome; POC Required |
| **Identity** | Adapts universal and cultural buildings to wooded river valleys with rain, soil moisture, seasonal flooding, tree roots and readily available timber/stone. |
| **Visual and material layers** | Raised foundations, drainage ditches, moss/weathering variants, steep roofs, boardwalks, river landings, retaining walls and tree-preserving parcel rules. |
| **Functional/project direction** | Adjusts foundation, roof, water, road, bridge, fire and storage validation without adding culture identity by itself. |
| **Universal replacements or adaptations** | Dirt path may become boardwalk in wet ground; cellar may be raised or waterproofed; well may use springhouse; farm plots use terrace or floodplain variants. |
| **Signature content** | No culture signature structures. Biome-only landmarks include flood markers, timber culverts and riverbank retaining kits. |
| **Settlement layout grammar** | Follows contour, river terraces and tree clearings; avoids needless forest removal and preserves route drainage. |
| **Material families** | local wood families, fieldstone, clay, reeds, bark, moss variants and weather-resistant fittings. |
| **Critical rules and consequences** | Biome adaptations never grant culture membership, laws or faction ownership. |
| **NPC planner priorities** | Scores flood level, river access, drainage, firebreaks, root conflict, bridge need and wet-season travel. |
| **Player blueprint/town-pack support** | In-world validator offers automatic stilts, retaining walls, drainage or boardwalk suggestions. |
| **Planning status** | POC Required |

# 19. Additional Culture and Dynamic Overlay Profiles

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
| **Player blueprint/town-pack support** | Custom holds may be hand-carved or blueprint-built; validator supports embedded terrain volumes and protected structural voids. |
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
| **Player blueprint/town-pack support** | Blueprint editor marks living components and consent/maintenance contracts; players can design forms but cannot bypass protected-material rules. |
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
| **Player blueprint/town-pack support** | Custom compact buildings validate multiple functions and shared access without double-counting rooms or storage. |
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
| **Player blueprint/town-pack support** | Plans can include mobile blueprint modules that pack, relocate or convert into permanent structures. |
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
| **Player blueprint/town-pack support** | Editor supports submerged volumes, waterline markers, buoyancy/foundation policies and dual-route validation. |
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
| **Player blueprint/town-pack support** | Blueprint validation distinguishes furniture/servicing machines from resident rest and identity markers. |
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
| **Player blueprint/town-pack support** | Player-founded settlements may nominate names, motifs and public styles while NPC approval and history shape final adoption. |
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
| **Player blueprint/town-pack support** | Players may impose, support, resist or remove overlays with durable world-state consequences. |
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
| **Player blueprint/town-pack support** | May provide land and blueprints, but forced assimilation or relocation causes consequences. |
| **Planning status** | System / Beta |

# 20. Biome Adaptation Pack Profiles

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
| **Player blueprint/town-pack support** | Validator shows heat exposure, shade and water blockers and offers compatible foundation/roof conversions. |
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
| **Player blueprint/town-pack support** | Validator simulates roof load/clearance and identifies unheated critical spaces. |
| **Planning status** | Alpha |

### Swamp and Wetland Building Adaptation Pack

`pack.biome.swamp_wetland`

| **Field** | **Pack Direction** |
|---|---|
| **Pack type and scope** | Biome adaptation - Overworld natural biome; Alpha |
| **Identity** | Adapts settlement construction to saturated ground, flood cycles, insects, rot, navigable channels and limited dry land. |
| **Visual and material layers** | Stilts, boardwalks, floating sections, rot-resistant material tokens, screened openings, elevated stores, drainage and mooring sockets. |
| **Functional/project direction** | Changes foundations, sanitation, clean water, routes, livestock, storage and fire/evacuation. |
| **Universal replacements or adaptations** | Road becomes boardwalk/canal; well becomes protected rain/spring intake; farmstead becomes raised garden/aquaculture; cemetery uses culture-safe dry or water rites. |
| **Signature content** | Biome-only pile foundation, boardwalk junction, floating service deck and reed filter modules. |
| **Settlement layout grammar** | Linear and clustered along stable ground and waterways, with redundant high routes. |
| **Material families** | treated timber, reeds, fibre, stone piles, clay, rope, shell/lime and water-safe metal. |
| **Critical rules and consequences** | Wetland is not automatically primitive or dangerous; advanced cities may use canals, pumps and floating districts. |
| **NPC planner priorities** | Scores ground stability, clean water, flood, rot, insects, fire separation and boat access. |
| **Player blueprint/town-pack support** | Editor previews water levels and foundation options. |
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
| **Player blueprint/town-pack support** | Validator supports terrain-carve masks and protected load-bearing cells. |
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
| **Player blueprint/town-pack support** | Validator previews tidal/flood bands and berth/shore stability. |
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
| **Player blueprint/town-pack support** | Validator shows interference and required grounding/ward markers. |
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
| **Player blueprint/town-pack support** | Validator clearly labels contamination and prevents clean capacity from double-counting unsafe spaces. |
| **Planning status** | Beta |

# 21. Realm Building Pack Profiles

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
| **Player blueprint/town-pack support** | Player plans require realm adaptation and local permission; imported blueprints can be translated rather than copied unchanged. |
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
| **Player blueprint/town-pack support** | Editor exposes dual-state geometry and memory-anchor validation. |
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
| **Player blueprint/town-pack support** | Validator shows supported mass, route redundancy, berth approach and emergency descent. |
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
| **Player blueprint/town-pack support** | Validator checks compartment integrity and emergency isolation. |
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
| **Player blueprint/town-pack support** | Blueprints must integrate with ancient sockets through adapters rather than overwriting protected core systems. |
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
| **Player blueprint/town-pack support** | Validator checks thermal envelope and safe shutdown. |
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
| **Player blueprint/town-pack support** | Validator requires anchors, tethers, redundancy and hard size limits. |
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
| **Player blueprint/town-pack support** | Main-menu blueprint workshop can author pocket layouts after late-game unlock, with strict validation and server limits. |
| **Planning status** | Late Utility |

# 22. Post-POC Implementation Plan

## 22.1 POC Composition Test

The first test should resolve one universal Small Cottage, Storehouse, Watchtower, Village Hall and Mage Hut through:

1. Culture-neutral forest foundation.
2. Temperate Forest/River biome adaptation.
3. Riverward culture pack.
4. Forest Hamlet Council ownership.
5. Optional Regional March road/sign overlay.
6. Current weather/age/damage state.
7. One approved player blueprint substitution.

The POC must demonstrate that:

- the universal functional record remains unchanged;
- culture and biome select materials, shapes and layout;
- faction ownership changes banners, access and project authority;
- exact resource costs resolve from local material substitutions;
- player custom blueprints validate against the same function;
- save/load preserves origin, active layers and history;
- Briarhook structures use a faction overlay rather than a goblin ancestry rule.

## 22.2 Early Alpha Pack Production Order

1. Finish the neutral POC foundation and Riverward pack.
2. Create the first material-token and pack-resolver debug tools.
3. Add Emberhold, Goblin Tinker and one contrasting surface culture.
4. Add dryland, frost, wetland and mountain adaptations.
5. Prove mixed-culture settlement composition.
6. Add government and faith modules.
7. Test occupation, liberation and restoration.
8. Build culture-pack production templates and automated validation.
9. Select official launch/alpha culture roster only after art and simulation budgets are measured.
10. Begin Verdant Covenant realm pack after functional portal/realm prototype gates are met.

## 22.3 Verdant Covenant Realm Slice

The first realm building slice should include:

- Arrival Covenant Sanctuary.
- one native dwelling family;
- one native store/market family;
- one living-resource worksite;
- one promise-law civic structure;
- nature-compatible automation adapter;
- local road/path and foundation kit;
- portal customs and emergency-return modules;
- one restoration project;
- one player-designed realm outpost test.

## 22.4 Explicit Deferrals

- Full final culture roster.
- Complete lore and naming pass.
- Every culture's city/capital architecture.
- Every faction base family.
- Full faith/religion structure library.
- Public online pack marketplace.
- Executable mod scripts.
- Automated generative art production without review.
- Fully simulated cultural diffusion at global scale.
- All major realms.
- Player-created world-scale wonders in public multiplayer.

# 23. Balancing, Representation and Simulation LOD

## 23.1 Balancing Rules

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

## 23.2 Representation Rules

- Do not map real-world peoples directly into caricatured fantasy cultures.

- Avoid treating one government, faith, class, profession or moral tendency as biologically inherited.

- Intelligent hostile factions need motives, leadership, resources, surrender/reform possibilities and broader non-hostile cultural context.

- Coercive labour, occupation, slavery, necromantic labour and cultural suppression are serious systems with victims, resistance and consequences.

- Sacred architecture and cultural symbols require context and in-world ownership rather than existing only as loot decoration.

- Cultural change can be voluntary, contested, imposed, revived or hybridised and should be recorded.

## 23.3 Simulation LOD

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

# 24. Open Questions for Later Lore and Production

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

# Appendix A. 20G Pack Data Field Template

| **Field Group** | **Required Fields** |
|---|---|
| Identity | pack_id; display/localisation keys; pack_type; parent_pack_ids; culture/faction/biome/realm links; status. |
| Manifest | version; schema; dependencies; optional integrations; compatibility; priority; conflict policy; content hash. |
| Universal coverage | universal_family_tags; selected blueprint pools; size/stage support; fallback kit. |
| Overrides | allowed fields; material tokens; palette; silhouette; layout weights; marker modules; substitutions. |
| Replacements | capability tags; replacement definition IDs; capacities; markers; jobs; utilities; validation profile. |
| Signatures | signature structure/project IDs; stage; rarity; prerequisites; story/faction/realm gates. |
| Planner | preferred projects; avoided projects; terrain/route priorities; public/private norms; law filters. |
| Materials | priority families; local/import substitutions; sacred/prohibited; weathering; repair rules. |
| Layout | density; parcel roles; centres; roads; storage; household; public space; defence; verticality. |
| Identity modules | government; faith/philosophy; economy/labour; language/signage; festival; memorial. |
| Environment | biome/realm rules; climate; foundations; water; hazards; power/mana; portal dependency. |
| Dynamic state | occupation; diaspora; hybridisation; reform; damage; ruin; restoration; corruption/cleansing. |
| Player authoring | exposed tokens; blueprint permissions; town-pack rules; cultural acceptance; publishing class. |
| UI/accessibility | icons; map motifs; colour-independent cues; scripts; tooltips; knowledge visibility. |
| Runtime/LOD | active layers; resolved cache; far summary; history; migration/version aliases; save recovery. |

# Appendix B. Override and Composition Matrix

| **Layer** | **May Change** | **May Not Bypass** |
|---|---|---|
| Culture | Palette, blueprint pool, layout preference, public/private norms, signature projects. | Universal functional markers, exact resources, accessibility and safety. |
| Regional/Subculture | Local materials, roof/foundation, economy, motifs, selected signatures. | Parent identity without an explicit cultural split. |
| Faction | Ownership, banners, guards, permissions, faction modules, project priorities. | Ancestry/culture identity or private ownership without lawful/conquest state. |
| Government | Civic forms, approval, property, assembly, records and law modules. | Seven needs or building capacity. |
| Faith/Philosophy | Sacred spaces, rites, burial, charity, taboos and magic modules. | Culture-wide belief or NPC personal belief. |
| Biome | Foundation, climate, water, roads, hazards, local materials. | Culture, government, faction or morality. |
| Realm | Physical laws, portal, survival, local matter, native settlement rules. | Resource conservation, ownership, politics and safe validation. |
| Occupation/State | Symbols, checkpoints, requisition, damage, temporary conversion. | Origin history or automatic assimilation. |
| Player Style | Exposed materials, blueprint, decoration, selected layout and town pack. | Server authority, protected content, functionality and performance limits. |

# Appendix C. POC and Alpha Acceptance Checklist

- [ ] One universal building resolves through culture, biome, faction and state layers.
- [ ] Ancestry is not used as the architecture lookup key.
- [ ] Riverward pack supports a non-human household without invalid geometry.
- [ ] Briarhook overlay applies only to the faction.
- [ ] Culture-neutral fallback works when a pack is missing.
- [ ] Material substitution produces exact resource costs.
- [ ] Biome adaptation changes foundations/roof/routes without changing culture.
- [ ] Faction ownership changes permissions and banners without duplicating building capacity.
- [ ] Player blueprint replaces one official Riverward blueprint.
- [ ] Main-menu style kit imports into an existing settlement proposal.
- [ ] Pack conflicts produce readable validation errors.
- [ ] Save/load preserves origin and active layers.
- [ ] Damage and occupation do not erase cultural history.
- [ ] Distant settlement retains culture/faction/biome/realm IDs and planner weights.
- [ ] Hybrid settlement uses a coherent token subset rather than random palette blending.
- [ ] Realm pack cannot activate before its dependency manifest is available.
- [ ] Missing optional content falls back safely.
- [ ] Stable IDs and aliases survive a migration fixture.
- [ ] Accessibility cues remain usable without colour.
- [ ] Pack asset and blueprint counts remain within the agreed budget.

# Appendix D. Suggested Godot Resources and Runtime Records

| **Godot Resource / Record** | **Purpose** |
|---|---|
| BuildingPackManifest.gd | Namespace, version, dependencies, compatibility, load order, hashes and content list. |
| CultureBuildingPackDefinition.gd | Culture style, blueprint pools, substitutions, signatures, layout and planner preferences. |
| RegionalCultureVariantDefinition.gd | Parent overrides for climate, history, neighbours, economy and local style. |
| FactionStructureOverlayDefinition.gd | Ownership, symbols, security, project modules, permissions and occupation behaviour. |
| GovernmentBuildingModuleDefinition.gd | Civic forms, approval, property, records and authority structures. |
| FaithBuildingModuleDefinition.gd | Sacred spaces, rites, burial, charity, taboo and magic modules. |
| BiomeBuildingAdaptationDefinition.gd | Foundation, climate, water, routes, hazards and material adaptation. |
| RealmBuildingPackDefinition.gd | Realm rules, arrival/outpost content, local matter, portal and settlement adaptation. |
| FunctionalReplacementDefinition.gd | Universal capability contract, replacement markers, capacities and validation. |
| StyleTokenProfile.gd | Material, silhouette, trim, lighting, furniture, signage and damage tokens. |
| PackCompositionRule.gd | Layer priority, conflict policy, allowed fields and fallback. |
| HybridCultureComposer.gd | Event/history-based coherent composition and emergent pack records. |
| RuntimeStructureIdentityRecord.gd | Origin culture, active overlays, owner, biome/realm, history and player modifications. |
| BuildingPackResolver.gd | Deterministic composition and cached resolved blueprint/material profiles. |
| PackValidationService.gd | Dependency, reference, function, performance, localisation and content-policy checks. |
| CulturePackViewModel.gd | Player-facing style, compatibility, missing dependencies, protected rules and preview. |

# Appendix E. Initial Production Backlog

## POC Required

- Culture-neutral Forest Settlement Foundation Kit.
- Riverward Frontier Folk palette and five key blueprint variants.
- Temperate Forest/River adaptation.
- Briarhook camp/overlay set.
- Regional March signs/road ownership reference.
- Pack resolver, manifest, fallback and debug overlay.
- One player style-kit import/export test.

## Early Alpha

- Emberhold Rune-Hold pack.
- Goblin Tinker Commune pack.
- One pastoral/mobile culture.
- One aquatic or wetland culture.
- Dryland, frost, swamp and mountain adaptation packs.
- Council, monarchy/charter, guild and faith modules.
- Occupation and diaspora overlays.
- Hybrid culture composer.
- Pack migration and missing-dependency recovery.

## Realm Alpha

- Verdant Covenant realm pack.
- Arrival sanctuary and portal customs kit.
- Living material/foundation rules.
- Nature-compatible automation adapter.
- One native settlement mini-pack.
- One restoration project.
- One player realm-outpost test.

## Beta / Final

- Additional major culture families.
- Full regional/subculture coverage.
- Aetheric Reach, Ancestral Veil, Impossible Deep and World-Engine packs.
- Culture wonders and realm signature projects.
- Public content-pack workflow subject to platform/moderation decisions.
