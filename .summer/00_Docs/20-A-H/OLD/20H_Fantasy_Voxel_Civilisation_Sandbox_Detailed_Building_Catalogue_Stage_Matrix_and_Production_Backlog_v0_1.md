**Fantasy Voxel Civilisation Sandbox**

**20H - Detailed Building Catalogue, Settlement Stage Matrix and Production Backlog**

**Version 0.1 - Numbered Universal Catalogue Draft**

*A controlled master register of 120 universal building and settlement-project definitions, mapped across Camp to Magical Metropolis, the seven-needs model, companion-document ownership, player blueprints, NPC planning, and production milestones.*

| **Document Role**           | Numbered cross-document catalogue, stage matrix, implementation tracker and scope-control register for Document Suite 20.                                                              |
|-----------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Universal Catalogue Cap** | 120 approved universal functional definitions in Version 0.1. Culture palettes, ordinary size variants, damage states and decorative alternatives do not create new universal entries. |
| **Main Needs**              | Housing, Provisions, Health, Work, Safety, Infrastructure and Morale.                                                                                                                  |
| **POC Lock**                | 30 definitions are marked POC Required and prove Camp -\> Hamlet -\> Village.                                                                                                          |
| **Companion Ownership**     | 20A-20F own detailed functional entries, 20G owns culture/faction/biome/realm variations, and 20H owns numbering, stage mapping and production state.                                  |
| **Data Direction**          | Stable IDs and status fields should later round-trip to Godot Resources, JSON/CSV or spreadsheet data without changing the readable design rules.                                      |

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr class="header">
<th><p><strong>Locked Catalogue Rule</strong></p>
<p>A new registry entry is justified only when it creates a distinct function, capacity, planner behaviour, progression gate, network role, risk model or settlement consequence. A different roof, material, culture palette, room arrangement or decorative style is a blueprint variation, not a new universal building definition.</p></th>
</tr>
</thead>
<tbody>
</tbody>
</table>

# Document Purpose

Document 20 established the shared rules for buildings, facilities and settlement projects. This companion file converts the earlier building brainstorm into a stable, deduplicated and numbered universal catalogue. It is the bridge between design-bible prose and the future machine-readable registry used by Godot, settlement AI, blueprint validation, construction projects, UI, saves and content production.

The catalogue deliberately stops at 120 universal definitions for Version 0.1. This is large enough to cover the full civilisation fantasy while remaining small enough to review, implement and balance. Hundreds of final voxel blueprints can still exist because each definition may accept several footprints, construction styles, culture kits, terrain adaptations, mixed-use arrangements and player-created alternatives.

# Design Sources and Dependencies

| **Source**                                                 | **20H Dependency**                                                                                                                 |
|------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------|
| 07 - NPC Village System                                    | Living residents, jobs, needs, warehouses, staged construction, autonomous growth and near/far simulation.                         |
| 12 - Structures                                            | Blueprint volumes, markers, material palettes, placement rules, dynamic states, repair, restoration and world-state evidence.      |
| 19 - Settlement Growth and Player Voxel Blueprint System   | In-world and main-menu blueprint creation, player town styles, validation, construction stages, districts and settlement planning. |
| 20 - Buildings, Facilities and Settlement Project Registry | Seven needs, shared registry fields, companion split, project selection, stage rules and anti-bloat principles.                    |

# Static Table of Contents

- 1\. Locked Catalogue Identity

- 2\. Scope Control and Universal Catalogue Cap

- 3\. Registry Units, Stable IDs and Ownership

- 4\. Status Model and Production State

- 5\. Catalogue Summary and Counts

- 6\. Temporary and Residential

- 7\. Farming, Food and Livestock

- 8\. Health, Welfare, Culture and Hospitality

- 9\. Extraction and Raw Processing

- 10\. Crafting and Artisan Production

- 11\. Trade, Education and Professional Services

- 12\. Governance, Justice and Administration

- 13\. Safety, Defence and Emergency

- 14\. Storage, Roads, Transport and Utilities

- 15\. Magic, Ritual and Dimensional Systems

- 16\. Automation, Power and Advanced Industry

- 17\. Districts, Complexes, Megaprojects and Wonders

- 18\. Settlement Stage Matrix

- 19\. Seven-Needs Coverage Matrix

- 20\. Upgrade Families and Branching Rules

- 21\. Required, Optional and Conditional Project Pools

- 22\. POC Thirty-Building Production Roster

- 23\. Production Waves and Milestones

- 24\. Blueprint Coverage and Asset Targets

- 25\. Data, Validation and Implementation Backlog

- 26\. Change Control and Catalogue Governance

- 27\. Recommended Next Companion Document

- Appendix A. Status and Field Template

- Appendix B. Stage and Need Counts

- Appendix C. Consolidated and Deferred Ideas

# 1. Locked Catalogue Identity

20H is the living master register for universal settlement content. It assigns stable IDs, records the earliest settlement stage, identifies the primary and secondary need contribution, names the autonomous-planner class, records companion-document ownership and tracks production scope. It does not replace the detailed entry documents or the actual voxel blueprint library.

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr class="header">
<th><p><strong>Identity Test</strong></p>
<p>Every catalogue row must answer: what distinct settlement capability does this definition provide, what need or system does it influence, when can it appear, how does the planner use it, and why can it not be represented as a variant of an existing definition?</p></th>
</tr>
</thead>
<tbody>
</tbody>
</table>

# 2. Scope Control and Universal Catalogue Cap

- Version 0.1 contains exactly 120 universal functional definitions.

- The 30 POC Required definitions are a protected implementation subset, not an additional list.

- Culture, faction, biome and realm architecture belongs to 20G unless it introduces a genuinely unique function.

- Small, medium and large forms remain one definition when their mechanics differ only by capacity or footprint.

- Upgrade tiers receive separate definitions only when they introduce a new service model, network role, planner behaviour or stage expectation.

- Damage, ruin, corruption, abandonment, repair and restoration are runtime states, not new universal entries.

- Player-created blueprints can satisfy an existing definition after validation and do not expand the universal catalogue.

- Mixed-use blueprints may satisfy two or more compatible definitions, but each function retains its own registry identity.

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr class="header">
<th><p><strong>Change Threshold</strong></p>
<p>Adding entry 121 requires a written merge check against all existing definitions, a reason it cannot be a branch or variant, companion ownership, stage placement, need contribution and an explicit decision to expand or replace the 120-entry cap.</p></th>
</tr>
</thead>
<tbody>
</tbody>
</table>

# 3. Registry Units, Stable IDs and Ownership

| **Registry Unit**   | **Purpose**                                                                                | **Example**                            |
|---------------------|--------------------------------------------------------------------------------------------|----------------------------------------|
| Building definition | A functional occupied, service, production, storage or utility structure.                  | building.crafting.village_blacksmith   |
| Project definition  | A modular network or construction project that may not be an occupied building.            | project.defence.palisade_segment       |
| Plan definition     | A cluster, district, campus or multi-project layout.                                       | plan.district.residential              |
| Blueprint asset     | A validated voxel layout satisfying one or more definitions.                               | blueprint.human_forest.small_cottage_a |
| Culture/style kit   | Material tokens, shapes, decorations and preferences applied to universal definitions.     | culture_kit.forest_human               |
| Runtime record      | Save-state instance: condition, staffing, inputs, outputs, ownership and project progress. | structure_instance:\<ULID\>            |

ID namespaces are functional rather than visual. A player-designed dwarven cottage and an NPC-designed forest cottage can both validate against building.residential.small_cottage while retaining separate blueprint IDs, creators, palettes and layouts.

# 4. Status Model and Production State

| **Field**             | **Allowed Values**                                           | **Meaning**                                                     |
|-----------------------|--------------------------------------------------------------|-----------------------------------------------------------------|
| Scope status          | POC Required, Alpha, Beta, Final, Deferred                   | When the functional definition is expected to enter production. |
| Design status         | Idea, Draft, Reviewed, Approved, Locked                      | Human design maturity.                                          |
| Data status           | None, Schema, Entry, Validated, Imported                     | Machine-readable registry maturity.                             |
| Blueprint status      | None, Blockout, Staged, Validated, Variant Complete          | Voxel asset maturity.                                           |
| Implementation status | Not Started, Runtime Stub, Functional, Integrated, Shippable | Godot gameplay maturity.                                        |
| Balance status        | Uncosted, Draft Values, Playtested, Tuned                    | Resources, capacities, labour and pacing maturity.              |
| Culture coverage      | Universal Only, Palette Ready, Signature Variants, Complete  | Variation coverage without duplicating function IDs.            |

# 5. Catalogue Summary and Counts

| **Universal definitions** | 120 |
|---------------------------|-----|
| **POC Required**          | 30  |
| **Alpha**                 | 35  |
| **Beta**                  | 49  |
| **Final**                 | 6   |
| **Building definitions**  | 103 |
| **Project definitions**   | 10  |
| **Plan definitions**      | 7   |

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr class="header">
<th><p><strong>Interpretation</strong></p>
<p>The catalogue is a functional ceiling, not an asset ceiling. The final game may contain hundreds or thousands of blueprint files because variants, culture kits, player designs, upgrades, damage masks and terrain adaptations reuse these universal definitions.</p></th>
</tr>
</thead>
<tbody>
</tbody>
</table>

# 6. Temporary and Residential

Temporary structures establish the first settlement centre and transition into permanent housing. Residential visual styles, room arrangements and climate adaptations remain blueprint variations unless their function changes.

| **\#** | **Stable ID**                               | **Definition**            | **Min Stage** | **Primary**    | **Secondary**          | **Planner** | **Scope**    | **Owner** |
|--------|---------------------------------------------|---------------------------|---------------|----------------|------------------------|-------------|--------------|-----------|
| 1      | building.temporary.campfire_site            | Campfire Site             | Camp          | Morale         | Provisions, Safety     | Required    | POC Required | 20A       |
| 2      | building.residential.small_tent             | Small Tent                | Camp          | Housing        | Safety                 | Required    | POC Required | 20A       |
| 3      | building.infrastructure.builder_supply_yard | Builder Supply Yard       | Camp          | Infrastructure | Work                   | Required    | POC Required | 20D       |
| 4      | building.residential.worker_refugee_shelter | Worker or Refugee Shelter | Camp          | Housing        | Health, Morale         | Conditional | Alpha        | 20A       |
| 5      | building.residential.primitive_hut          | Primitive Hut             | Hamlet        | Housing        | Safety                 | Required    | POC Required | 20A       |
| 6      | building.residential.small_cottage          | Small Cottage             | Hamlet        | Housing        | Morale                 | Required    | POC Required | 20A       |
| 7      | building.residential.farmhouse              | Farmhouse                 | Hamlet        | Housing        | Work, Provisions       | Optional    | POC Required | 20A       |
| 8      | building.residential.communal_longhouse     | Communal Longhouse        | Hamlet        | Housing        | Morale, Provisions     | Optional    | Alpha        | 20A       |
| 9      | building.residential.townhouse_shop_house   | Townhouse or Shop-House   | Town          | Housing        | Work, Infrastructure   | Optional    | Beta         | 20A       |
| 10     | building.residential.apartment_house        | Apartment House           | City          | Housing        | Infrastructure, Morale | Optional    | Beta         | 20A       |

| **\#** | **Definition**            | **Functional Distinction**                                                |
|--------|---------------------------|---------------------------------------------------------------------------|
| 1      | Campfire Site             | Temporary gathering, warmth, basic cooking and settlement-centre marker.  |
| 2      | Small Tent                | Temporary shelter for one small household or worker group.                |
| 3      | Builder Supply Yard       | Construction stock, scaffolding, tool access and project staging.         |
| 4      | Worker or Refugee Shelter | Rapid shared housing for labour surges, disasters, refugees or migration. |
| 5      | Primitive Hut             | First permanent low-cost household shelter.                               |
| 6      | Small Cottage             | Validated household home and primary player-blueprint test family.        |
| 7      | Farmhouse                 | Household residence with farming storage and job access.                  |
| 8      | Communal Longhouse        | High-efficiency shared housing suited to early growth or some cultures.   |
| 9      | Townhouse or Shop-House   | Dense street housing with compatible ground-floor work or trade use.      |
| 10     | Apartment House           | High-density urban housing requiring mature services and road access.     |

# 7. Farming, Food and Livestock

This category covers settlement-scale food production, processing, reserve stability and animal support without creating a separate need bar for every food type.

| **\#** | **Stable ID**                         | **Definition**             | **Min Stage** | **Primary** | **Secondary**              | **Planner** | **Scope**    | **Owner** |
|--------|---------------------------------------|----------------------------|---------------|-------------|----------------------------|-------------|--------------|-----------|
| 11     | building.food.basic_farm_plot         | Basic Farm Plot            | Hamlet        | Provisions  | Work                       | Required    | POC Required | 20A       |
| 12     | building.food.irrigated_terraced_farm | Irrigated or Terraced Farm | Village       | Provisions  | Infrastructure, Work       | Optional    | Alpha        | 20A       |
| 13     | building.food.barn                    | Barn                       | Hamlet        | Provisions  | Infrastructure, Work       | Optional    | POC Required | 20A       |
| 14     | building.food.granary                 | Granary                    | Village       | Provisions  | Infrastructure, Safety     | Required    | POC Required | 20A       |
| 15     | building.food.communal_kitchen        | Communal Kitchen           | Hamlet        | Provisions  | Morale, Health             | Required    | POC Required | 20A       |
| 16     | building.food.grain_millhouse         | Grain Millhouse            | Village       | Provisions  | Work, Infrastructure       | Optional    | Alpha        | 20A       |
| 17     | building.food.bakery_food_workshop    | Bakery or Food Workshop    | Village       | Provisions  | Work, Morale               | Optional    | Alpha        | 20A       |
| 18     | building.food.preserving_house        | Preserving House           | Town          | Provisions  | Health, Work               | Optional    | Beta         | 20A       |
| 19     | building.livestock.stable_paddock     | Stable and Paddock         | Hamlet        | Work        | Provisions, Infrastructure | Optional    | Alpha        | 20A       |
| 20     | building.food.fishery_fishing_dock    | Fishery or Fishing Dock    | Hamlet        | Provisions  | Work, Infrastructure       | Conditional | Alpha        | 20A       |

| **\#** | **Definition**             | **Functional Distinction**                                                |
|--------|----------------------------|---------------------------------------------------------------------------|
| 11     | Basic Farm Plot            | Core crop production parcel with seasonal and soil rules.                 |
| 12     | Irrigated or Terraced Farm | Higher-yield farm form for water systems, slopes or dense land use.       |
| 13     | Barn                       | Animal feed, harvest storage, tools and farm support.                     |
| 14     | Granary                    | Protected staple-food reserve with spoilage and emergency-stock benefits. |
| 15     | Communal Kitchen           | Batch cooking, shared meals and early preservation support.               |
| 16     | Grain Millhouse            | Processes grain through wind, water, animal or mechanical power variants. |
| 17     | Bakery or Food Workshop    | Converts staples into durable and valuable prepared foods.                |
| 18     | Preserving House           | Smoking, salting, drying, fermenting and cold-storage preparation.        |
| 19     | Stable and Paddock         | Houses mounts, draft animals or livestock with feed and job markers.      |
| 20     | Fishery or Fishing Dock    | Water-dependent food job, boat access and local trade support.            |

# 8. Health, Welfare, Culture and Hospitality

Health and morale services are intentionally consolidated. Culture-specific worship, recreation and hospitality use universal functional slots with 20G style and belief rules.

| **\#** | **Stable ID**                                 | **Definition**                  | **Min Stage** | **Primary** | **Secondary**          | **Planner** | **Scope**    | **Owner** |
|--------|-----------------------------------------------|---------------------------------|---------------|-------------|------------------------|-------------|--------------|-----------|
| 21     | building.health.healer_hut                    | Healer Hut                      | Village       | Health      | Morale                 | Required    | POC Required | 20A       |
| 22     | building.health.clinic_infirmary              | Clinic or Infirmary             | Town          | Health      | Infrastructure, Safety | Optional    | Beta         | 20A       |
| 23     | building.health.hospital_complex              | Hospital Complex                | City          | Health      | Infrastructure, Work   | Optional    | Beta         | 20F       |
| 24     | building.welfare.quarantine_emergency_shelter | Quarantine or Emergency Shelter | Village       | Health      | Safety, Housing        | Conditional | Alpha        | 20A       |
| 25     | building.community.small_shrine_hall          | Small Shrine or Community Hall  | Village       | Morale      | Health, Safety         | Optional    | POC Required | 20A       |
| 26     | building.hospitality.tavern_inn               | Tavern or Inn                   | Village       | Morale      | Provisions, Work       | Optional    | Alpha        | 20A       |
| 27     | building.community.bathhouse_laundry          | Bathhouse and Laundry           | Town          | Health      | Infrastructure, Morale | Optional    | Beta         | 20A       |
| 28     | building.community.festival_grounds           | Festival or Community Grounds   | Village       | Morale      | Work                   | Optional    | Alpha        | 20A       |
| 29     | building.community.memorial_cemetery          | Memorial and Cemetery           | Village       | Morale      | Health, Infrastructure | Conditional | Alpha        | 20A       |
| 30     | building.community.cultural_hall_theatre      | Cultural Hall or Theatre        | Town          | Morale      | Work, Infrastructure   | Optional    | Beta         | 20A       |

| **\#** | **Definition**                  | **Functional Distinction**                                               |
|--------|---------------------------------|--------------------------------------------------------------------------|
| 21     | Healer Hut                      | Basic treatment, medicine storage and recovery service.                  |
| 22     | Clinic or Infirmary             | Expanded treatment capacity, beds, staff and emergency response.         |
| 23     | Hospital Complex                | City-scale care, surgery, wards, specialist staff and disaster capacity. |
| 24     | Quarantine or Emergency Shelter | Temporary isolation, disaster shelter and crisis accommodation.          |
| 25     | Small Shrine or Community Hall  | Culture-neutral slot for worship, assembly, ritual or shared identity.   |
| 26     | Tavern or Inn                   | Meals, lodging, social gathering, rumours and visitor support.           |
| 27     | Bathhouse and Laundry           | Sanitation, recovery and social service where culturally appropriate.    |
| 28     | Festival or Community Grounds   | Flexible site for gatherings, markets, ceremonies and events.            |
| 29     | Memorial and Cemetery           | Burial, remembrance, mourning, history and culture-specific rites.       |
| 30     | Cultural Hall or Theatre        | Performance, arts, public events and cultural progression.               |

# 9. Extraction and Raw Processing

Extraction definitions represent job sites and resource interfaces. Ore type, tree species, stone family and biome material remain data or palette variations.

| **\#** | **Stable ID**                             | **Definition**                  | **Min Stage** | **Primary** | **Secondary**              | **Planner** | **Scope**    | **Owner** |
|--------|-------------------------------------------|---------------------------------|---------------|-------------|----------------------------|-------------|--------------|-----------|
| 31     | building.extraction.lumber_camp           | Lumber Camp                     | Hamlet        | Work        | Provisions, Infrastructure | Optional    | POC Required | 20B       |
| 32     | building.extraction.sawmill               | Sawmill                         | Village       | Work        | Infrastructure             | Optional    | Alpha        | 20B       |
| 33     | building.extraction.quarry_stone_yard     | Quarry and Stone Yard           | Village       | Work        | Infrastructure             | Conditional | Alpha        | 20B       |
| 34     | building.extraction.clay_sand_works       | Clay or Sand Works              | Hamlet        | Work        | Infrastructure             | Conditional | Alpha        | 20B       |
| 35     | building.extraction.mine_entrance         | Mine Entrance                   | Hamlet        | Work        | Safety, Infrastructure     | Conditional | POC Required | 20B       |
| 36     | building.extraction.deep_mine_complex     | Mine Shaft or Deep Mine Complex | Town          | Work        | Safety, Infrastructure     | Conditional | Beta         | 20B       |
| 37     | building.extraction.ore_sorting_yard      | Ore Sorting Yard                | Village       | Work        | Infrastructure             | Optional    | Alpha        | 20B       |
| 38     | building.extraction.charcoal_fuel_yard    | Charcoal Burner and Fuel Yard   | Hamlet        | Provisions  | Work, Infrastructure       | Optional    | Alpha        | 20B       |
| 39     | building.extraction.mana_crystal_site     | Mana Crystal Mine or Extractor  | Village       | Work        | Safety, Infrastructure     | Conditional | Alpha        | 20E       |
| 40     | building.extraction.automated_mine_quarry | Automated Mine or Quarry Site   | Town          | Work        | Infrastructure, Safety     | Conditional | Beta         | 20E       |

| **\#** | **Definition**                  | **Functional Distinction**                                          |
|--------|---------------------------------|---------------------------------------------------------------------|
| 31     | Lumber Camp                     | Forestry job site, timber staging and sustainable-cutting rules.    |
| 32     | Sawmill                         | Processes logs into planks, beams, sawdust and construction parts.  |
| 33     | Quarry and Stone Yard           | Stone extraction, sorting and construction-material supply.         |
| 34     | Clay or Sand Works              | Local clay, sand, gravel or salt extraction family.                 |
| 35     | Mine Entrance                   | Controlled access to mine jobs, storage and underground routes.     |
| 36     | Mine Shaft or Deep Mine Complex | Deeper extraction, lifts, ventilation, rails and higher risk.       |
| 37     | Ore Sorting Yard                | Grades raw ore, stores output and prepares furnace batches.         |
| 38     | Charcoal Burner and Fuel Yard   | Renewable early fuel and controlled stockpiling.                    |
| 39     | Mana Crystal Mine or Extractor  | Magical resource extraction with purity and instability controls.   |
| 40     | Automated Mine or Quarry Site   | Bulk extraction through machines, logistics and environmental risk. |

# 10. Crafting and Artisan Production

Crafting entries are separated only where production logic, risk, staffing or outputs are meaningfully distinct. Individual trades may later appear as branches or specialist workstation modules.

| **\#** | **Stable ID**                           | **Definition**                 | **Min Stage** | **Primary** | **Secondary**              | **Planner** | **Scope**    | **Owner** |
|--------|-----------------------------------------|--------------------------------|---------------|-------------|----------------------------|-------------|--------------|-----------|
| 41     | building.crafting.carpenter_workshop    | Carpenter Workshop             | Village       | Work        | Infrastructure             | Required    | POC Required | 20B       |
| 42     | building.crafting.mason_yard            | Mason Yard                     | Village       | Work        | Infrastructure             | Required    | POC Required | 20B       |
| 43     | building.crafting.village_blacksmith    | Village Blacksmith             | Village       | Work        | Safety, Infrastructure     | Required    | POC Required | 20B       |
| 44     | building.crafting.pottery_kiln          | Pottery and Kiln               | Village       | Work        | Provisions, Infrastructure | Optional    | Alpha        | 20B       |
| 45     | building.crafting.weaver_tailor         | Weaver and Tailor Workshop     | Village       | Work        | Morale, Provisions         | Optional    | Alpha        | 20B       |
| 46     | building.crafting.tannery_leatherworker | Tannery and Leatherworker      | Village       | Work        | Health, Infrastructure     | Optional    | Alpha        | 20B       |
| 47     | building.crafting.glass_brick_works     | Glassworks or Brickworks       | Town          | Work        | Infrastructure             | Optional    | Beta         | 20B       |
| 48     | building.industry.foundry_steelworks    | Foundry or Steelworks          | Town          | Work        | Infrastructure, Safety     | Optional    | Beta         | 20E       |
| 49     | building.industry.machine_workshop      | Machine Workshop               | Town          | Work        | Infrastructure             | Optional    | Beta         | 20E       |
| 50     | building.magic.rune_forge               | Rune Forge or Enchanted Smithy | Town          | Work        | Safety, Infrastructure     | Conditional | Beta         | 20E       |

| **\#** | **Definition**                 | **Functional Distinction**                                         |
|--------|--------------------------------|--------------------------------------------------------------------|
| 41     | Carpenter Workshop             | Wood components, furniture, repairs and blueprint parts.           |
| 42     | Mason Yard                     | Stone shaping, blocks, roads, walls and repair materials.          |
| 43     | Village Blacksmith             | Tools, fittings, repairs and guard equipment.                      |
| 44     | Pottery and Kiln               | Ceramics, vessels, bricks and heat-treated materials.              |
| 45     | Weaver and Tailor Workshop     | Cloth, clothing, sacks, banners and culture goods.                 |
| 46     | Tannery and Leatherworker      | Leather, armour components, belts and hides with sanitation needs. |
| 47     | Glassworks or Brickworks       | Glass, bricks, tiles and advanced construction materials.          |
| 48     | Foundry or Steelworks          | Bulk metal refinement, alloys and heavy project components.        |
| 49     | Machine Workshop               | Automation parts, repairs, upgrades and machine assembly.          |
| 50     | Rune Forge or Enchanted Smithy | Magical metalwork, runes, conduits and enchanted equipment.        |

# 11. Trade, Education and Professional Services

Trade, education and professional services connect population growth to knowledge, specialisation, commerce, visitors and regional relationships.

| **\#** | **Stable ID**                         | **Definition**                   | **Min Stage** | **Primary**    | **Secondary**          | **Planner** | **Scope**    | **Owner** |
|--------|---------------------------------------|----------------------------------|---------------|----------------|------------------------|-------------|--------------|-----------|
| 51     | building.trade.market_stalls          | Market Stalls                    | Village       | Work           | Morale, Provisions     | Optional    | POC Required | 20B       |
| 52     | building.trade.trading_post           | Trading Post                     | Village       | Infrastructure | Work, Provisions       | Optional    | POC Required | 20B       |
| 53     | building.trade.covered_market_hall    | Covered Market or Market Hall    | Town          | Work           | Infrastructure, Morale | Optional    | Beta         | 20B       |
| 54     | building.trade.caravanserai_coach_inn | Caravanserai or Coach Inn        | Town          | Infrastructure | Morale, Work           | Conditional | Beta         | 20B       |
| 55     | building.trade.merchant_exchange      | Merchant Guild or Trade Exchange | City          | Work           | Infrastructure, Morale | Optional    | Beta         | 20B       |
| 56     | building.education.small_school       | Small School                     | Village       | Work           | Morale                 | Optional    | POC Required | 20B       |
| 57     | building.education.trade_school       | Apprentice or Trade School       | Village       | Work           | Morale                 | Optional    | Alpha        | 20B       |
| 58     | building.education.library_archive    | Library or Archive               | Town          | Morale         | Work, Infrastructure   | Optional    | Beta         | 20B       |
| 59     | building.education.academy_university | Academy or University            | City          | Work           | Morale, Infrastructure | Optional    | Beta         | 20F       |
| 60     | building.professional.guild_hall      | Guild Hall or Professional Lodge | Town          | Work           | Infrastructure, Morale | Optional    | Beta         | 20B       |

| **\#** | **Definition**                   | **Functional Distinction**                                             |
|--------|----------------------------------|------------------------------------------------------------------------|
| 51     | Market Stalls                    | Early local exchange, vendors and rotating market use.                 |
| 52     | Trading Post                     | Imports, exports, contracts, caravans and reputation access.           |
| 53     | Covered Market or Market Hall    | Dense permanent trade, specialist vendors and public commerce.         |
| 54     | Caravanserai or Coach Inn        | Secure caravan lodging, animals, storage and route support.            |
| 55     | Merchant Guild or Trade Exchange | Regional contracts, finance, trade coordination and merchant politics. |
| 56     | Small School                     | Basic learning, children, literacy and apprenticeship support.         |
| 57     | Apprentice or Trade School       | Vocational training and specialist pipeline.                           |
| 58     | Library or Archive               | Books, research, records, recipe knowledge and settlement history.     |
| 59     | Academy or University            | Advanced teaching, research, specialists and cultural prestige.        |
| 60     | Guild Hall or Professional Lodge | Professional organisation, contracts, training and faction identity.   |

# 12. Governance, Justice and Administration

Governance content scales from village permissions to capital authority. It should support multiple political systems without forcing one universal government style.

| **\#** | **Stable ID**                                     | **Definition**                    | **Min Stage** | **Primary**    | **Secondary**          | **Planner** | **Scope**    | **Owner** |
|--------|---------------------------------------------------|-----------------------------------|---------------|----------------|------------------------|-------------|--------------|-----------|
| 61     | building.governance.village_hall                  | Village Hall                      | Village       | Infrastructure | Morale, Work           | Required    | POC Required | 20C       |
| 62     | building.governance.town_hall                     | Town Hall or Council House        | Town          | Infrastructure | Infrastructure, Morale | Upgrade     | Beta         | 20C       |
| 63     | building.governance.city_hall                     | City Hall or Civic Complex        | City          | Infrastructure | Morale, Work           | Upgrade     | Beta         | 20F       |
| 64     | building.governance.records_planning_office       | Records and Planning Office       | Town          | Infrastructure | Work                   | Optional    | Beta         | 20C       |
| 65     | building.justice.courthouse_magistrate            | Courthouse or Magistrate House    | Town          | Safety         | Morale, Infrastructure | Conditional | Beta         | 20C       |
| 66     | building.governance.tax_customs_office            | Tax or Customs Office             | Town          | Infrastructure | Work, Safety           | Conditional | Beta         | 20C       |
| 67     | building.governance.embassy_diplomatic_hall       | Embassy or Diplomatic Hall        | City          | Morale         | Safety, Work           | Conditional | Beta         | 20C       |
| 68     | building.governance.leader_residence              | Governor or Leader Residence      | City          | Morale         | Safety, Infrastructure | Optional    | Beta         | 20C       |
| 69     | building.governance.palace_high_council           | Palace or High Council Complex    | Capital       | Morale         | Safety, Infrastructure | Megaproject | Final        | 20F       |
| 70     | building.governance.blueprint_construction_office | Blueprint and Construction Office | Village       | Infrastructure | Work                   | Optional    | Alpha        | 20C       |

| **\#** | **Definition**                    | **Functional Distinction**                                                      |
|--------|-----------------------------------|---------------------------------------------------------------------------------|
| 61     | Village Hall                      | Requests, permissions, leadership, records and stage administration.            |
| 62     | Town Hall or Council House        | Town planning, services, laws, taxation and district coordination.              |
| 63     | City Hall or Civic Complex        | City administration, districts, major services and regional authority.          |
| 64     | Records and Planning Office       | Maps, census, parcels, blueprint approvals and project scheduling.              |
| 65     | Courthouse or Magistrate House    | Disputes, law, fines, hearings and limited holding capacity.                    |
| 66     | Tax or Customs Office             | Trade controls, tolls, tariffs, tribute and customs inspection.                 |
| 67     | Embassy or Diplomatic Hall        | Faction relations, visitors, treaties and political events.                     |
| 68     | Governor or Leader Residence      | Leadership residence, receptions and authority symbol.                          |
| 69     | Palace or High Council Complex    | Capital leadership, diplomacy, archives and ceremonial authority.               |
| 70     | Blueprint and Construction Office | Player blueprint submission, validation, parcel assignment and project records. |

# 13. Safety, Defence and Emergency

Safety combines detection, patrols, fortification, emergency response and refuge. Defence networks remain modular projects, while occupied military sites remain buildings or complexes.

| **\#** | **Stable ID**                          | **Definition**                     | **Min Stage**     | **Primary** | **Secondary**          | **Planner** | **Scope**    | **Owner** |
|--------|----------------------------------------|------------------------------------|-------------------|-------------|------------------------|-------------|--------------|-----------|
| 71     | building.safety.guard_post             | Guard Post                         | Village           | Safety      | Work                   | Required    | POC Required | 20C       |
| 72     | building.safety.wooden_watchtower      | Wooden Watchtower                  | Village           | Safety      | Infrastructure         | Required    | POC Required | 20C       |
| 73     | project.defence.palisade_segment       | Palisade Segment                   | Village           | Safety      | Infrastructure         | Required    | POC Required | 20C       |
| 74     | building.safety.village_gate           | Village Gate                       | Village           | Safety      | Infrastructure         | Required    | POC Required | 20C       |
| 75     | building.safety.barracks_training_yard | Barracks and Training Yard         | Fortified Village | Safety      | Work, Morale           | Optional    | Alpha        | 20C       |
| 76     | project.defence.stone_wall_gatehouse   | Stone Wall and Gatehouse System    | Town              | Safety      | Infrastructure         | Upgrade     | Beta         | 20C       |
| 77     | building.safety.armoury                | Armoury                            | Fortified Village | Safety      | Infrastructure, Work   | Optional    | Alpha        | 20C       |
| 78     | building.safety.fort_keep              | Fort or Keep                       | Town              | Safety      | Infrastructure, Morale | Conditional | Beta         | 20F       |
| 79     | building.emergency.fire_rescue_station | Fire and Rescue Station            | Town              | Safety      | Health, Infrastructure | Optional    | Beta         | 20C       |
| 80     | building.emergency.refuge_bunker       | Emergency Shelter or Refuge Bunker | Town              | Safety      | Housing, Health        | Conditional | Beta         | 20C       |

| **\#** | **Definition**                     | **Functional Distinction**                                            |
|--------|------------------------------------|-----------------------------------------------------------------------|
| 71     | Guard Post                         | Local patrol, guard assignment and nearby response coverage.          |
| 72     | Wooden Watchtower                  | Detection, warning, guard effectiveness and raid preparation.         |
| 73     | Palisade Segment                   | Modular early perimeter defence with gates and damage states.         |
| 74     | Village Gate                       | Controlled access, patrol point and perimeter connection.             |
| 75     | Barracks and Training Yard         | Guard housing, training, readiness and reserve force.                 |
| 76     | Stone Wall and Gatehouse System    | Durable perimeter, towers, controlled routes and siege resistance.    |
| 77     | Armoury                            | Guard equipment, ammunition, repair reserves and secure issue points. |
| 78     | Fort or Keep                       | Regional command, refuge, military storage and strongpoint.           |
| 79     | Fire and Rescue Station            | Fire response, rescue tools, disaster planning and rapid deployment.  |
| 80     | Emergency Shelter or Refuge Bunker | Protected civilian shelter during raids, storms or magical disasters. |

# 14. Storage, Roads, Transport and Utilities

This category owns the physical movement and service backbone: storage, paths, roads, water, sanitation and transport interfaces. Advanced network machinery can link to 20E.

| **\#** | **Stable ID**                                  | **Definition**                   | **Min Stage** | **Primary**    | **Secondary**            | **Planner** | **Scope**    | **Owner** |
|--------|------------------------------------------------|----------------------------------|---------------|----------------|--------------------------|-------------|--------------|-----------|
| 81     | building.storage.small_storehouse              | Small Storehouse                 | Hamlet        | Infrastructure | Provisions               | Required    | POC Required | 20D       |
| 82     | building.storage.village_warehouse             | Village Warehouse                | Village       | Infrastructure | Provisions, Work, Safety | Required    | POC Required | 20D       |
| 83     | building.storage.specialised_depot             | Specialised Depot or Silo        | Village       | Infrastructure | Provisions, Work         | Optional    | Alpha        | 20D       |
| 84     | building.storage.automated_distribution_centre | Automated Distribution Centre    | City          | Infrastructure | Work, Provisions         | Optional    | Beta         | 20D       |
| 85     | project.transport.dirt_path_junction_set       | Dirt Path and Road Junction Set  | Camp          | Infrastructure | Work, Safety             | Required    | POC Required | 20D       |
| 86     | project.transport.stone_road_bridge_set        | Stone Road and Bridge Set        | Village       | Infrastructure | Safety, Work             | Upgrade     | Alpha        | 20D       |
| 87     | building.transport.dock_harbour                | Dock or Harbour                  | Town          | Infrastructure | Work, Provisions         | Conditional | Beta         | 20D       |
| 88     | building.utility.village_well                  | Village Well or Water Point      | Hamlet        | Provisions     | Health, Infrastructure   | Required    | POC Required | 20D       |
| 89     | project.utility.cistern_aqueduct_pump          | Cistern, Aqueduct or Pump System | Town          | Infrastructure | Provisions, Health       | Conditional | Beta         | 20D       |
| 90     | project.utility.sanitation_waste_system        | Sanitation and Waste Utility     | Town          | Infrastructure | Health, Morale           | Optional    | Beta         | 20D       |

| **\#** | **Definition**                   | **Functional Distinction**                                                 |
|--------|----------------------------------|----------------------------------------------------------------------------|
| 81     | Small Storehouse                 | Basic shared storage, construction stock and household overflow.           |
| 82     | Village Warehouse                | Category storage, project reserves, deliveries and automation permissions. |
| 83     | Specialised Depot or Silo        | Food, fuel, timber, stone, ore, tools or guard-supply specialisation.      |
| 84     | Automated Distribution Centre    | Sorting, network buffers, district supply and automated routing.           |
| 85     | Dirt Path and Road Junction Set  | Basic access, parcel edges, hauling routes and settlement layout.          |
| 86     | Stone Road and Bridge Set        | Durable roads, crossings, drainage and heavier transport.                  |
| 87     | Dock or Harbour                  | Water transport, trade, fishing and regional routes.                       |
| 88     | Village Well or Water Point      | Settlement water access, capacity and reliability.                         |
| 89     | Cistern, Aqueduct or Pump System | Expanded water storage, movement, irrigation and resilience.               |
| 90     | Sanitation and Waste Utility     | Waste, drainage, composting and sanitation service coverage.               |

# 15. Magic, Ritual and Dimensional Systems

Magic buildings treat mana, runes, wards, healing, rituals, leylines, portals and realm hazards as physical settlement infrastructure.

| **\#** | **Stable ID**                                   | **Definition**                                | **Min Stage** | **Primary**    | **Secondary**                  | **Planner** | **Scope**    | **Owner** |
|--------|-------------------------------------------------|-----------------------------------------------|---------------|----------------|--------------------------------|-------------|--------------|-----------|
| 91     | building.magic.mage_hut_rune_workshop           | Mage Hut or Rune Workshop                     | Village       | Work           | Safety, Infrastructure, Morale | Conditional | POC Required | 20E       |
| 92     | building.magic.alchemy_laboratory               | Alchemy Laboratory                            | Village       | Work           | Health, Safety                 | Conditional | Alpha        | 20E       |
| 93     | project.magic.ward_stone_relay                  | Ward Stone or Defence Relay                   | Village       | Safety         | Infrastructure                 | Conditional | Alpha        | 20E       |
| 94     | building.magic.mana_store_battery               | Mana Store or Battery House                   | Village       | Infrastructure | Safety, Work                   | Conditional | Alpha        | 20E       |
| 95     | building.magic.ritual_circle_hall               | Ritual Circle or Hall                         | Town          | Morale         | Safety, Work                   | Conditional | Beta         | 20E       |
| 96     | building.magic.magic_academy_tower              | Magic Academy or Research Tower               | City          | Work           | Morale, Infrastructure         | Conditional | Beta         | 20E       |
| 97     | building.magic.healing_cleansing_shrine         | Healing or Cleansing Shrine                   | Town          | Health         | Morale, Safety                 | Conditional | Beta         | 20E       |
| 98     | building.magic.leyline_observatory_relay        | Leyline Observatory or Relay                  | City          | Infrastructure | Work, Safety                   | Conditional | Beta         | 20E       |
| 99     | building.magic.portal_station_sanctum           | Portal Station or Sanctum                     | City          | Infrastructure | Safety, Work                   | Conditional | Beta         | 20E       |
| 100    | building.magic.dimensional_research_containment | Dimensional Research and Containment Facility | Capital       | Safety         | Work, Infrastructure           | Conditional | Final        | 20E       |

| **\#** | **Definition**                                | **Functional Distinction**                                               |
|--------|-----------------------------------------------|--------------------------------------------------------------------------|
| 91     | Mage Hut or Rune Workshop                     | Teaching, basic runes, mana services and ward support.                   |
| 92     | Alchemy Laboratory                            | Potions, catalysts, medicines, reagents and controlled risks.            |
| 93     | Ward Stone or Defence Relay                   | Local ward coverage, warning and protective infrastructure.              |
| 94     | Mana Store or Battery House                   | Safe mana storage, distribution and emergency reserve.                   |
| 95     | Ritual Circle or Hall                         | Community rituals, major spells, events and culture-specific ceremonies. |
| 96     | Magic Academy or Research Tower               | Advanced teaching, spell research and magical specialists.               |
| 97     | Healing or Cleansing Shrine                   | Healing support, corruption cleansing and magical recovery.              |
| 98     | Leyline Observatory or Relay                  | Maps mana flows, stabilises networks and unlocks regional systems.       |
| 99     | Portal Station or Sanctum                     | Controlled portal travel, permissions, power and route anchoring.        |
| 100    | Dimensional Research and Containment Facility | Realm studies, hazardous materials, containment and portal safety.       |

# 16. Automation, Power and Advanced Industry

Automation and power entries scale manual mechanisms into regional industry while supporting rather than deleting NPC labour and visible resource flow.

| **\#** | **Stable ID**                                    | **Definition**                      | **Min Stage** | **Primary**    | **Secondary**          | **Planner** | **Scope** | **Owner** |
|--------|--------------------------------------------------|-------------------------------------|---------------|----------------|------------------------|-------------|-----------|-----------|
| 101    | building.automation.hand_crank_workshop          | Hand-Crank or Mechanical Workshop   | Village       | Work           | Infrastructure         | Optional    | Alpha     | 20E       |
| 102    | building.power.waterwind_power_house             | Waterwheel or Wind Power House      | Village       | Infrastructure | Work                   | Conditional | Alpha     | 20E       |
| 103    | building.industry.furnace_mana_furnace           | Furnace or Mana Furnace Facility    | Village       | Work           | Infrastructure, Safety | Conditional | Alpha     | 20E       |
| 104    | building.automation.mechanical_processing_mill   | Mechanical Processing Mill          | Village       | Work           | Infrastructure         | Optional    | Alpha     | 20E       |
| 105    | building.logistics.conveyor_cart_hub             | Conveyor or Cart Logistics Hub      | Town          | Infrastructure | Work                   | Optional    | Beta      | 20E       |
| 106    | building.power.steam_generator_plant             | Steam or Generator Plant            | Town          | Infrastructure | Safety, Work           | Optional    | Beta      | 20E       |
| 107    | building.automation.automated_farm_greenhouse    | Automated Farm or Greenhouse        | Town          | Provisions     | Infrastructure, Work   | Optional    | Beta      | 20E       |
| 108    | building.industry.automated_factory_assembly     | Automated Factory or Assembly Hall  | City          | Work           | Infrastructure, Safety | Optional    | Beta      | 20E       |
| 109    | building.automation.golem_workshop_labour_centre | Golem Workshop or Labour Centre     | City          | Work           | Infrastructure, Safety | Conditional | Beta      | 20E       |
| 110    | building.power.regional_grid_control             | Regional Power or Mana Grid Control | Capital       | Infrastructure | Safety, Work           | Megaproject | Final     | 20E       |

| **\#** | **Definition**                      | **Functional Distinction**                                            |
|--------|-------------------------------------|-----------------------------------------------------------------------|
| 101    | Hand-Crank or Mechanical Workshop   | Entry-level mechanisms, manual power and machine maintenance.         |
| 102    | Waterwheel or Wind Power House      | Renewable mechanical power based on terrain and climate.              |
| 103    | Furnace or Mana Furnace Facility    | Ore processing and first mechanical or magical production chain.      |
| 104    | Mechanical Processing Mill          | Powered crushing, sawing, milling or simple production modules.       |
| 105    | Conveyor or Cart Logistics Hub      | Network sorting, carts, belts, chutes and transfer points.            |
| 106    | Steam or Generator Plant            | Higher-output power, fuel systems and maintenance burden.             |
| 107    | Automated Farm or Greenhouse        | Scaled crop production using machines, water or magic support.        |
| 108    | Automated Factory or Assembly Hall  | Bulk components, machines, logistics and advanced production.         |
| 109    | Golem Workshop or Labour Centre     | Constructed workers, charging, task profiles and governance risks.    |
| 110    | Regional Power or Mana Grid Control | Coordinates high-capacity energy, priorities and regional resilience. |

# 17. Districts, Complexes, Megaprojects and Wonders

Plans and megaprojects coordinate several building definitions. They do not replace individual entries; they define placement, sequencing, shared networks and civilisation-scale outcomes.

| **\#** | **Stable ID**                                        | **Definition**                          | **Min Stage**      | **Primary**    | **Secondary**                 | **Planner** | **Scope** | **Owner** |
|--------|------------------------------------------------------|-----------------------------------------|--------------------|----------------|-------------------------------|-------------|-----------|-----------|
| 111    | plan.cluster.farmstead                               | Farmstead Cluster                       | Village            | Provisions     | Housing, Work, Infrastructure | District    | Alpha     | 20F       |
| 112    | plan.cluster.market_civic_centre                     | Market Square and Civic Centre          | Village            | Morale         | Work, Infrastructure          | District    | Alpha     | 20F       |
| 113    | plan.district.artisan_industrial                     | Artisan or Industrial District Template | Town               | Work           | Infrastructure, Safety        | District    | Beta      | 20F       |
| 114    | plan.district.residential                            | Residential District Template           | Town               | Housing        | Infrastructure, Morale        | District    | Beta      | 20F       |
| 115    | plan.complex.citadel_fortified_perimeter             | Citadel and Fortified Perimeter Complex | City               | Safety         | Infrastructure, Morale        | District    | Beta      | 20F       |
| 116    | plan.campus.hospital_university                      | Hospital or University Campus           | City               | Health         | Work, Infrastructure, Morale  | District    | Beta      | 20F       |
| 117    | plan.nexus.regional_logistics_transit                | Regional Logistics and Transit Nexus    | City               | Infrastructure | Work, Provisions              | District    | Beta      | 20F       |
| 118    | project.megaproject.city_ward_portal_nexus           | City-Wide Ward Core or Portal Nexus     | Capital            | Safety         | Infrastructure, Work          | Megaproject | Final     | 20F       |
| 119    | project.megaproject.floating_district_anchor_skyport | Floating District Anchor or Skyport     | Magical Metropolis | Infrastructure | Safety, Work, Housing         | Megaproject | Final     | 20F       |
| 120    | project.wonder.culture_wonder_leyline_crown          | Culture Wonder or Leyline Crown         | Capital            | Morale         | Infrastructure, Safety, Work  | Megaproject | Final     | 20F       |

| **\#** | **Definition**                          | **Functional Distinction**                                                     |
|--------|-----------------------------------------|--------------------------------------------------------------------------------|
| 111    | Farmstead Cluster                       | Farmhouse, fields, barn, storage and access arranged as one validated cluster. |
| 112    | Market Square and Civic Centre          | Market, hall, notice board, roads and public-space layout.                     |
| 113    | Artisan or Industrial District Template | Production parcels, logistics, buffers, roads and worker access.               |
| 114    | Residential District Template           | Mixed housing, services, paths, public space and expansion parcels.            |
| 115    | Citadel and Fortified Perimeter Complex | Layered walls, gates, command, refuge and strategic storage.                   |
| 116    | Hospital or University Campus           | Multi-building specialist service with shared grounds and utilities.           |
| 117    | Regional Logistics and Transit Nexus    | Road, rail, harbour, portal or freight systems connected by one hub.           |
| 118    | City-Wide Ward Core or Portal Nexus     | City-scale protection or travel network requiring staged subprojects.          |
| 119    | Floating District Anchor or Skyport     | Supports elevated districts, air routes and magical structural systems.        |
| 120    | Culture Wonder or Leyline Crown         | Culture-defining civilisation project with regional or world-state effects.    |

# 18. Settlement Stage Matrix

Settlement stages are capability expectations rather than mandatory visual templates. A culture may satisfy a capability through a different structure, shared facility, mixed-use blueprint, district service or magical equivalent. Advancement checks the required capacities and world conditions, not a single fixed list of building names.

| **Stage**          | **Capability Expectation**                                                                          | **Typical Required Proof**                                                          | **Optional / Conditional Pool**                                                       | **Scope Guard**                                                                    |
|--------------------|-----------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------|------------------------------------------------------------------------------------|
| Camp               | Temporary shelter, gathering point, build supply and basic access.                                  | Campfire Site; Small Tent; Builder Supply Yard; Dirt Path set.                      | Worker/refugee shelter.                                                               | No penalty for missing permanent civic or utility services.                        |
| Hamlet             | Permanent homes, basic food, water, storage and first local jobs.                                   | Primitive Hut or Cottage; Farm Plot; Small Storehouse; Village Well.                | Farmhouse, Longhouse, Barn, Communal Kitchen, Lumber Camp, Mine Entrance.             | Can remain compact and informal.                                                   |
| Village            | Shared reserves, governance, specialist work, trade, health, learning and basic defence.            | Warehouse; Granary; Village Hall; core work sites; guard coverage.                  | Market, Trading Post, Healer, School, Shrine/Hall, Mage Hut, Palisade, Watchtower.    | This is the main POC completion stage.                                             |
| Fortified Village  | Defence redundancy, emergency capacity, guard supply and reliable reserves.                         | At least one functioning perimeter strategy and guard readiness.                    | Barracks, Armoury, Quarantine Shelter, Ward relay, specialised depots.                | Fortification can be walls, terrain, wards or culture-specific equivalents.        |
| Town               | Specialised production, civic administration, utilities, formal trade and early districts.          | Town governance, durable routes, health service and service coverage.               | Foundry, clinic, market hall, guilds, sanitation, aqueduct, power and district plans. | Town status should not require every optional industry.                            |
| City               | Dense districts, regional services, advanced logistics, major education/health and layered defence. | City administration plus multiple connected districts and resilient infrastructure. | Hospital, University, transit nexus, factory, magic academy, citadel, portal station. | Large population creates demand and maintenance, not only bonuses.                 |
| Capital            | Regional authority, grand civic systems, high-capacity networks and megaproject governance.         | Capital leadership and at least one regional-scale infrastructure system.           | Palace, dimensional facility, ward/portal nexus, regional grid control, wonder.       | Political role may come from faction recognition rather than raw population alone. |
| Magical Metropolis | World-shaping infrastructure, vertical/floating growth, realm logistics and culture wonders.        | Stable endgame networks and a completed civilisation-scale project.                 | Floating district, skyport, Leyline Crown, portal networks and unique wonders.        | This is an endgame sandbox state, not a mandatory ending.                          |

## 18.1 Catalogue Availability by Earliest Stage

| **Earliest Stage** | **Definitions Introduced** | **Cumulative Definitions** | **Design Meaning**                                    |
|--------------------|----------------------------|----------------------------|-------------------------------------------------------|
| Camp               | 5                          | 5                          | First survival settlement and construction setup.     |
| Hamlet             | 15                         | 20                         | Permanent homes, food, water and basic work.          |
| Village            | 43                         | 63                         | Full connected civilisation loop.                     |
| Fortified Village  | 2                          | 65                         | Defence resilience and emergency preparation.         |
| Town               | 33                         | 98                         | Specialised production, administration and utilities. |
| City               | 16                         | 114                        | District-scale urban services and advanced networks.  |
| Capital            | 5                          | 119                        | Regional authority and megaproject systems.           |
| Magical Metropolis | 1                          | 120                        | World-shaping endgame civilisation.                   |

# 19. Seven-Needs Coverage Matrix

The primary need identifies the building’s direct capacity or core service. Secondary needs are meaningful supporting effects, not extra bars. Buildings may also create demand: housing increases provisions and infrastructure demand; industry increases safety and utility demand; prestige buildings increase maintenance and staffing demand.

| **Need**       | **Primary Definitions** | **Direct Calculation**                                                            | **Representative Contributors**                                                    | **Common Demand Created**          |
|----------------|-------------------------|-----------------------------------------------------------------------------------|------------------------------------------------------------------------------------|------------------------------------|
| Housing        | 9                       | Suitable beds, household assignment, climate protection and spare capacity.       | Homes, shelters, longhouses, townhouses, apartments and mixed-use residences.      | Provisions, Infrastructure, Safety |
| Provisions     | 13                      | Food, water, fuel, clothing basics and reserve resilience.                        | Farms, granaries, kitchens, wells, fisheries, mills and preserving houses.         | Work, Storage, Transport           |
| Health         | 7                       | Treatment, recovery, sanitation, outbreak response and cleansing.                 | Healer huts, clinics, hospitals, quarantine, water and sanitation projects.        | Medicine, Staff, Utilities         |
| Work           | 36                      | Jobs, tools, work sites, specialists, training and production access.             | Extraction, workshops, trade, schools, industry, magic and automation.             | Tools, Inputs, Power, Safety       |
| Safety         | 15                      | Threat detection, guards, equipment, fortification, emergency response and wards. | Guard sites, towers, walls, gates, armouries, refuges, wards and citadels.         | Staff, Equipment, Maintenance      |
| Infrastructure | 27                      | Storage, roads, logistics, utilities, governance, networks and maintenance.       | Warehouses, roads, halls, water systems, transport, power and distribution.        | Labour, Repairs, Energy            |
| Morale         | 13                      | Community, culture, identity, social life, remembrance and confidence.            | Shrines/halls, inns, festival grounds, cultural buildings, governance and wonders. | Space, Staff, Culture Goods        |

# 20. Upgrade Families and Branching Rules

Upgrade families communicate progression without forcing every settlement to demolish its previous buildings. A project may expand, renovate, convert, attach a module, replace a site, or add a parallel specialist branch. Existing lower-tier structures remain useful where their capacity and maintenance suit local demand.

| **Family**          | **Core Progression**                                                                         | **Branch Rule**                                                                                                  |
|---------------------|----------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------|
| Housing             | Tent -\> Hut -\> Cottage -\> Townhouse -\> Apartment                                         | Longhouse, shop-house, climate-adapted, noble or culture-specific branches.                                      |
| Food production     | Farm Plot -\> Irrigated/Terraced Farm -\> Automated Farm                                     | Orchard, greenhouse, fishery and livestock specialisations.                                                      |
| Food reserves       | Small Storehouse -\> Granary/Specialised Depot -\> Warehouse -\> Distribution Centre         | Food, fuel, construction, trade, guard and magical storage branches.                                             |
| Metalwork           | Village Blacksmith -\> Foundry/Steelworks -\> Machine Workshop or Rune Forge                 | Weaponsmith, armourer and toolsmith are modules or specialist branches unless mechanics demand separate entries. |
| Health              | Healer Hut -\> Clinic/Infirmary -\> Hospital Complex                                         | Quarantine, cleansing, hospice and field-care branches.                                                          |
| Education           | Small School -\> Trade School/Library -\> Academy/University                                 | Magic, engineering, military and culture-specific specialisations.                                               |
| Governance          | Village Hall -\> Town Hall -\> City Hall -\> Palace/High Council                             | Council, ruler, communal, guild or faction government styles.                                                    |
| Defence             | Guard Post/Watchtower -\> Palisade/Gate -\> Barracks/Armoury -\> Stone Wall/Keep -\> Citadel | Ward, terrain, naval, underground and magical perimeter equivalents.                                             |
| Transport           | Dirt Path -\> Stone Road/Bridge -\> Logistics Hub -\> Regional Transit Nexus                 | Dock, rail, lift, airship and portal branches.                                                                   |
| Magic               | Mage Hut -\> Ritual/Healing/Mana sites -\> Academy/Leyline/Portal facilities -\> City Nexus  | School, culture, faction and forbidden branches.                                                                 |
| Power               | Hand-Crank -\> Water/Wind -\> Steam/Generator -\> Regional Grid Control                      | Mechanical, fuel, mana, leyline and hybrid magitech branches.                                                    |
| Settlement planning | Building cluster -\> District template -\> Civic/Defence campus -\> Megaproject              | Player-made plans can replace default layouts after validation.                                                  |

# 21. Required, Optional and Conditional Project Pools

| **Planner Class** | **Use**                                                                             | **Selection Rule**                                                                                                | **Examples**                                                         |
|-------------------|-------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------|
| Required          | Minimum capability proof for a stage or crisis.                                     | Selected when the settlement lacks a stage-critical capacity; equivalent definitions may satisfy the requirement. | Housing, food, water, storage, access, governance, core safety.      |
| Optional          | Normal identity, efficiency, comfort or specialisation.                             | Scored by shortages, population, culture, resources, terrain, trade and player priorities.                        | Inn, mill, market, guild, festival grounds, specialist workshop.     |
| Conditional       | Requires geography, danger, story, faction, magic, research or resource conditions. | Only enters the pool when all explicit conditions are true.                                                       | Fishery, quarry, mana mine, ward, portal, embassy, quarantine.       |
| Upgrade           | Improves or converts an existing capability.                                        | Selected when demand, capacity, condition and resources justify the change.                                       | Stone roads, town hall, wall/gatehouse, clinic, distribution centre. |
| District          | Coordinates parcels, roads, utilities and several definitions.                      | Selected after density or scale requires a planned service area.                                                  | Residential district, industrial district, campus, transit nexus.    |
| Megaproject       | Civilisation-scale staged work with regional consequences.                          | Requires governance, specialists, supply chains, subprojects and major progression gates.                         | City ward core, floating district, Leyline Crown.                    |

# 22. POC Thirty-Building Production Roster

These 30 definitions form the protected first playable settlement library. The POC does not require 30 unique architectural styles. It requires one validated culture-neutral forest kit, real construction stages, exact resources, functional markers, NPC use and player-blueprint compatibility.

| **\#** | **Definition**                  | **Size** | **Stages** | **Minimum Validation Focus**                  | **POC Proof**               | **Owner** |
|--------|---------------------------------|----------|------------|-----------------------------------------------|-----------------------------|-----------|
| 1      | Campfire Site                   | Micro    | 2          | Gathering, heat/cook, settlement centre       | Camp hub                    | 20A       |
| 2      | Small Tent                      | Small    | 3          | Entrance, sleep spots, weather cover          | Temporary housing           | 20A       |
| 3      | Builder Supply Yard             | Small    | 3          | Supply crate, scaffold, tools, project marker | Construction staging        | 20D       |
| 5      | Primitive Hut                   | Small    | 4          | Door, bed, light, protected interior          | First permanent home        | 20A       |
| 6      | Small Cottage                   | Small    | 5          | Household beds, storage, heat/light           | Player blueprint validation | 20A       |
| 7      | Farmhouse                       | Medium   | 6          | Home, farm storage, work point                | Mixed-use test              | 20A       |
| 11     | Basic Farm Plot                 | Parcel   | 3          | Crop rows, access, tool point                 | Food production             | 20A       |
| 13     | Barn                            | Medium   | 5          | Feed/storage, animal access                   | Farm support                | 20A       |
| 14     | Granary                         | Small    | 5          | Protected food storage, ledger                | Reserve stability           | 20A       |
| 15     | Communal Kitchen                | Small    | 5          | Cook station, food input/output, tables       | Batch meals                 | 20A       |
| 21     | Healer Hut                      | Small    | 5          | Treatment, medicine, recovery bed             | Health service              | 20A       |
| 25     | Small Shrine or Community Hall  | Small    | 5          | Assembly/ritual point, seating, culture slot  | Morale and culture          | 20A       |
| 31     | Lumber Camp                     | Parcel   | 4          | Job marker, log staging, tool store           | Wood supply                 | 20B       |
| 35     | Mine Entrance                   | Medium   | 6          | Safe entrance, job marker, storage            | Mining access               | 20B       |
| 41     | Carpenter Workshop              | Medium   | 6          | Bench, tools, inputs/outputs                  | Building components         | 20B       |
| 42     | Mason Yard                      | Parcel   | 5          | Stone staging, work marker, outputs           | Stone components            | 20B       |
| 43     | Village Blacksmith              | Medium   | 7          | Forge, anvil, heat safety, stores             | Tools and guard supply      | 20B       |
| 51     | Market Stalls                   | Cluster  | 3          | Vendor slots, access, public space            | Basic trade                 | 20B       |
| 52     | Trading Post                    | Medium   | 6          | Counter, contract board, storage, loading     | Regional trade              | 20B       |
| 56     | Small School                    | Small    | 5          | Teaching point, seating, storage              | Education                   | 20B       |
| 61     | Village Hall                    | Medium   | 6          | Council, request board, records               | Governance                  | 20C       |
| 71     | Guard Post                      | Small    | 5          | Guard station, equipment, patrol link         | Local safety                | 20C       |
| 72     | Wooden Watchtower               | Medium   | 7          | Lookout, safe access, signal, coverage        | Raid scenario               | 20C       |
| 73     | Palisade Segment                | Network  | 4          | Segment sockets, collision, repair points     | Perimeter                   | 20C       |
| 74     | Village Gate                    | Medium   | 6          | Gate, guard point, road sockets               | Controlled access           | 20C       |
| 81     | Small Storehouse                | Small    | 5          | Storage markers, access, categories           | Basic shared storage        | 20D       |
| 82     | Village Warehouse               | Large    | 7          | Categories, ledger, reserves, loading         | Village economy             | 20D       |
| 85     | Dirt Path and Road Junction Set | Network  | 2          | Path nodes, junctions, parcel sockets         | Access and planning         | 20D       |
| 88     | Village Well or Water Point     | Micro    | 4          | Water point, capacity, safe access            | Water access                | 20D       |
| 91     | Mage Hut or Rune Workshop       | Small    | 6          | Rune table, mana store, safe zone, teaching   | Practical magic             | 20E       |

## 22.1 POC Acceptance Lock

- Every entry has a stable data record and at least one validated voxel blueprint or network piece.

- Every occupied building exposes reachable entrances, work/service markers and any required beds or storage.

- Every project consumes exact reserved resources across visible stages.

- NPC builders can claim tasks, collect supplies, reach work positions and complete stages.

- The player can design at least a cottage and one compatible public/work building in both in-world and main-menu blueprint modes.

- The settlement planner can move from Camp to Hamlet to Village without a hard-coded single layout.

- The warehouse, watchtower, magic workshop and road network connect the automation, village, defence and blueprint loops.

- Damage, repair, save/load and distant simulation preserve completed project state.

# 23. Production Waves and Milestones

| **Wave**                     | **Catalogue Target**                 | **Primary Deliverables**                                                                              | **Exit Gate**                                             | **Scope**                                               |
|------------------------------|--------------------------------------|-------------------------------------------------------------------------------------------------------|-----------------------------------------------------------|---------------------------------------------------------|
| Wave 0 - Registry Foundation | Before content                       | Schemas, IDs, validators, project stages, marker library, palette tokens and status tracker.          | Round-trip data and validation tests pass.                | No building production should scale before this passes. |
| Wave 1 - POC Core            | 30 definitions                       | One forest-neutral kit; Camp -\> Village; watchtower raid; player blueprint test.                     | Complete connected cause-and-effect loop.                 | POC Required                                            |
| Wave 2 - Early Alpha         | +20 definitions / 50 cumulative      | Broader Hamlet/Village services, conditional terrain industries, reserves and early magic/automation. | Multiple autonomous village paths work.                   | Alpha                                                   |
| Wave 3 - Fortified and Town  | +25 / 75 cumulative                  | Defence redundancy, administration, utilities, specialists, district foundations and power.           | Town planning and defence scale without hard-coding.      | Alpha/Beta                                              |
| Wave 4 - Town and City       | +25 / 100 cumulative                 | Dense housing, hospital, university, factories, transit, city governance and advanced magic.          | District services and simulation LOD remain performant.   | Beta                                                    |
| Wave 5 - Capital and Endgame | +20 / 120 cumulative                 | Regional networks, megaprojects, realm systems, floating districts and wonders.                       | Megaprojects work as staged subprojects.                  | Final                                                   |
| Wave 6 - Culture Expansion   | No universal-cap increase by default | 20G palettes, signature replacements, unique blueprints and realm adaptations.                        | Cultures feel distinct without duplicating function data. | Post-universal                                          |

# 24. Blueprint Coverage and Asset Targets

Blueprint counts are planning estimates, not hard promises. Procedural or parametric generation may reduce manual asset work. Player-created blueprints can expand variety, but shipped settlements still require curated defaults and validation test assets.

| **Milestone**          | **Functional Coverage**    | **Estimated Curated Assets**                         | **Variation Strategy**                                                    |
|------------------------|----------------------------|------------------------------------------------------|---------------------------------------------------------------------------|
| POC                    | 30 definitions             | 30 functional base assets + modular road/wall pieces | One culture-neutral forest kit; damage blockouts for critical structures. |
| Early Alpha            | 50 definitions             | 65-80 curated blueprints                             | Key homes, farms, workshops and roads receive 2-3 layout variants.        |
| Fortified/Town Alpha   | 75 definitions             | 110-140 curated blueprints                           | Defence, utilities, mixed-use, district parcels and terrain adaptations.  |
| City Beta              | 100 definitions            | 170-220 curated blueprints                           | Dense forms, campuses, transit, factories and advanced magic.             |
| Universal Complete     | 120 definitions            | 220-300 curated blueprints                           | Capital, endgame and megaproject sub-blueprints.                          |
| Per major culture pack | Uses universal definitions | Palette/style coverage + 15-25 signature blueprints  | Do not remake all 120 unless the culture truly requires it.               |

# 25. Data, Validation and Implementation Backlog

| **Backlog Item**             | **Definition of Work**                                                                                      | **Target** |
|------------------------------|-------------------------------------------------------------------------------------------------------------|------------|
| Registry importer            | Load stable building/project/plan definitions into Godot Resources with schema versioning.                  | Wave 0     |
| Blueprint validator          | Check footprint bounds, markers, navigation, access, utilities, safety and construction-stage completeness. | Wave 0     |
| Material-token resolver      | Resolve foundation, wall, roof, trim, utility and culture tokens into valid blocks/items.                   | Wave 0     |
| Project resource compiler    | Count voxel stages and add non-block components, labour, waste and furnishing costs.                        | Wave 0     |
| Construction task generator  | Create reachable block-placement batches, scaffolding and builder claims.                                   | Wave 1     |
| Building runtime state       | Condition, staffing, inputs, outputs, storage, utilities, maintenance and activation.                       | Wave 1     |
| Settlement need aggregator   | Convert building capacities and demand into the seven visible needs and drill-down causes.                  | Wave 1     |
| Autonomous project planner   | Score required, optional, conditional, upgrade, district and megaproject candidates.                        | Wave 1-2   |
| Parcel and terrain solver    | Select sites, adapt foundations, connect roads and preserve future expansion.                               | Wave 1-2   |
| Player blueprint library     | In-world and main-menu creation, save, tag, test, submit and reuse flows.                                   | Wave 1-2   |
| Upgrade/conversion system    | Expand, renovate, attach, convert or replace structures without deleting history.                           | Wave 2-3   |
| District planner             | Coordinate service coverage, density, road hierarchy, utilities and project groups.                         | Wave 3-4   |
| Simulation LOD               | Promote/demote structures and projects between visible voxel work and abstract summaries.                   | Wave 1-4   |
| Culture-kit pipeline         | Apply palettes, modules, preferences, signatures and forbidden replacements from 20G.                       | Wave 3+    |
| Mod and migration validation | Protect stable IDs, saves, imported packs and blueprint compatibility.                                      | Beta       |

# 26. Change Control and Catalogue Governance

1.  Search the catalogue for an existing functional equivalent or upgrade branch.

2.  Determine whether the idea is only a style, material, size, room, damage or culture variant.

3.  Identify the distinct need capacity, service, production chain, planner behaviour, network role or progression gate.

4.  Assign companion ownership and confirm that another registry does not own the concept.

5.  Provide a stable ID, earliest stage, primary need, secondary effects, planner class and status.

6.  Decide whether the new idea replaces, merges with or expands the 120-entry universal catalogue.

7.  Update 20H first, then the detailed companion file, structured data and blueprint backlog.

8.  Run save migration and content validation whenever a shipped stable ID changes.

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr class="header">
<th><p><strong>Do Not Renumber</strong></p>
<p>Catalogue numbers are human navigation aids. Stable IDs are the save- and data-facing identity. Once an entry is implemented or referenced externally, do not reuse its ID for a different concept. Retired IDs remain aliases or tombstones for migration.</p></th>
</tr>
</thead>
<tbody>
</tbody>
</table>

# 27. Recommended Next Companion Document

The next drafting file should be 20A - Housing, Provisions, Health and Community. It contains the highest concentration of POC Required content and establishes the first full detailed-entry template for homes, farms, food reserves, healthcare, community buildings and hospitality. Once 20A is stable, 20B can detail extraction, workshops, trade and education using the same entry format.

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr class="header">
<th><p><strong>Recommended Immediate Sequence</strong></p>
<p>20A detailed entries -&gt; 20B work and production -&gt; 20C governance and defence -&gt; 20D infrastructure -&gt; 20E magic and automation -&gt; 20F districts and megaprojects -&gt; 20G culture and realm packs.</p></th>
</tr>
</thead>
<tbody>
</tbody>
</table>

# Appendix A. Status and Field Template

| **Field Group**        | **Required Content**                                                                               |
|------------------------|----------------------------------------------------------------------------------------------------|
| Identity               | building_id / project_id / plan_id; family_id; display name; aliases; category; tags.              |
| Stage and planning     | earliest stage; expected stage; planner class; required/optional/conditional rules; maximum count. |
| Needs                  | primary need; secondary needs; direct capacity; service coverage; resilience; demand created.      |
| Population and work    | residents; beds; jobs; specialists; visitors; schedules; tools; staffing rules.                    |
| Resources              | construction stages; material tokens; components; labour; inputs; outputs; storage; maintenance.   |
| Placement and access   | footprint; height; terrain; foundation; roads; paths; loading; emergency access; district tags.    |
| Utilities and networks | water; drainage; fuel; mechanical power; electricity; mana; wards; logistics; portal links.        |
| Blueprint validation   | rooms; markers; sockets; navigation; safety; capacity bounds; culture compatibility.               |
| Runtime                | planned; building; active; paused; damaged; ruined; abandoned; repaired; converted; ownership.     |
| Production tracking    | scope, design, data, blueprint, implementation, balance and culture-coverage statuses.             |

# Appendix B. Stage and Need Counts

| **Earliest Stage** | **Count** | **Primary Need** | **Count** |
|--------------------|-----------|------------------|-----------|
| Camp               | 5         | Housing          | 9         |
| Hamlet             | 15        | Provisions       | 13        |
| Village            | 43        | Health           | 7         |
| Fortified Village  | 2         | Work             | 36        |
| Town               | 33        | Safety           | 15        |
| City               | 16        | Infrastructure   | 27        |
| Capital            | 5         | Morale           | 13        |
| Magical Metropolis | 1         |                  |           |

# Appendix C. Consolidated and Deferred Ideas

The earlier brainstorm contained many valid ideas that do not need independent universal definitions. They remain available as modules, blueprint variants, culture signatures, specialist branches or later conditional content.

| **Consolidated Idea Group**    | **Registry Treatment**                                                                                                                                                                                     |
|--------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Residential variations         | Cabins, miner homes, fisher cottages, villas, noble houses, tower homes, houseboats, underground homes and assisted living use residential definitions plus culture, climate, household and service rules. |
| Individual specialist shops    | Butcher, cobbler, fletcher, bowyer, jeweller, engraver and similar trades can use workshop, market or guild modules until their production logic proves distinct enough for a separate entry.              |
| Food-site variations           | Orchards, vineyards, herb gardens, mushroom farms, apiaries, dairies and breweries are farm, food-workshop, preserving or culture variants.                                                                |
| Storage variations             | Timber yards, ore yards, fuel depots, tool stores, armories, cold stores and magical vaults use specialised-depot or warehouse branches.                                                                   |
| Road and bridge variations     | Causeways, stairs, tunnels, suspension bridges, drawbridges and aqueduct bridges are network-piece families inside transport projects.                                                                     |
| Faith and culture architecture | Chapels, temples, monasteries, ancestor halls and spirit houses use community, ritual and culture-pack definitions rather than one universal religion tree.                                                |
| Crime and conquest sites       | Thieves dens, smuggler stores, cult houses, occupation offices and rebellion safehouses are faction/culture/world-state variants unless a distinct gameplay system requires a universal function.          |
| Late transport                 | Rail, mountain lifts, airships, skyports and portal freight are branch assets under logistics, transit nexus, floating district and portal systems.                                                        |
| Forbidden facilities           | Necromantic yards, blood engines, corruption laboratories and forced-labour sites remain conditional 20E/20G branches with explicit morality and faction consequences.                                     |
| Wonders                        | World trees, colossal golem foundries, grand archives, royal mints and culture monuments are signature forms of the universal wonder/megaproject definitions.                                              |

# Appendix D. Deferred Content Review Triggers

| **Idea Type**                   | **Review Trigger**                                                                                                                                 |
|---------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------|
| Specialist production branch    | Promote to a universal entry only when it has a distinct input/output chain, staffing model, risk, planner demand or progression role.             |
| Culture signature               | Keep in 20G unless the same function is required across several cultures and cannot be expressed through an existing universal definition.         |
| Transport or utility branch     | Promote only when it requires its own network simulation, service capacity or settlement-stage expectation.                                        |
| Crime or forbidden facility     | Promote only when it drives a persistent economy, law, morality, faction or production system rather than serving as a visual hideout.             |
| Megaproject or wonder           | Use the existing megaproject definition unless the concept creates a new project structure, regional rule or world-state consequence.              |
| Player-requested blueprint type | First validate it against the closest existing definition; expand the catalogue only when validation cannot describe the intended function safely. |

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr class="header">
<th><p><strong>Version 0.1 Lock Summary</strong></p>
<p>120 universal definitions, 30 POC Required entries, seven main settlement needs, player-created blueprint compatibility, and a staged production path from Camp to Magical Metropolis. The next detailed drafting target is Document 20A.</p></th>
</tr>
</thead>
<tbody>
</tbody>
</table>
