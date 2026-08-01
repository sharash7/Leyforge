**Fantasy Voxel Civilisation Sandbox**

**20B - Work, Extraction, Crafting, Trade and Education**

**Version 0.1 - Detailed Building Family and Production Registry Draft**

*A controlled registry for resource jobs, workshops, artisan production, commerce, education, knowledge and professional organisations, using real inputs and outputs without turning every villager into a manually scheduled worker.*

| **Field**                  | **Locked Direction**                                                                                                                                                                                                      |
|----------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Document Scope             | Detailed rules and registry entries for catalogue definitions 31-38, 41-47, 51-58 and 60 from Document 20H, plus cross-document production and service dependencies.                                                      |
| Needs Lock                 | Housing, Provisions, Health, Work, Safety, Infrastructure and Morale remain the only main settlement needs. Education, commerce, skill, productivity and wealth do not become new top-level need meters.                  |
| Primary Focus              | Resource extraction, raw processing, artisan workshops, local and regional trade, schools, apprenticeships, knowledge stores, guilds and professional services.                                                           |
| Resource Rule              | Buildings conserve actual resources. Extraction binds to real world deposits; production consumes inputs and creates outputs and by-products; trade moves owned stock rather than generating infinite merchant inventory. |
| Player Blueprint Direction | Eligible player-made blueprints may replace developer layouts after workstations, buffers, hazards, access, route sockets and capacity rules validate.                                                                    |
| NPC Growth Direction       | Settlements select projects from required, optional and conditional pools using work shortages, resource opportunity, production bottlenecks, trade routes, specialist succession, terrain, safety and cost.              |
| Simulation Direction       | Nearby workers act visibly; distant settlements process bounded production, training and trade summaries while preserving stock, staffing, condition and history.                                                         |
| POC Direction              | Prove lumber and mining access, carpenter, mason and blacksmith production, market and trading-post exchange, and a small school supporting the Camp-to-Village loop.                                                     |
| Balance Direction          | Use readable service states and draft capacity bands. Exact block costs come from approved voxel blueprints; exact throughput, wages and prices remain balance drafts.                                                    |

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr class="header">
<th><p><strong>Locked Scope Rule</strong></p>
<p>Work is one main need, not a bundle of separate job bars. Employment, staffing, tools, skill, training, inputs, outputs, trade access and specialist coverage are causes and sub-calculations under Work, Infrastructure, Provisions, Safety and Morale.</p></th>
</tr>
</thead>
<tbody>
</tbody>
</table>

# Document Purpose

Document 20B turns the work and knowledge portion of the universal catalogue into implementable building-family rules. It defines how settlements gather real resources, process them through physical workplaces, move goods through trade, teach new workers and preserve knowledge while keeping the player focused on shortages, bottlenecks, opportunities and projects rather than daily shift scheduling.

The document deliberately separates functional definitions from exact voxel layouts. Document 19 and the player blueprint tools decide building shape and construction stages; 20B decides what must exist for a lumber camp, mine, smithy, market, school or guild to function inside the settlement simulation.

# Design Sources and Dependencies

| **Source**                                               | **20B Dependency**                                                                                                                        |
|----------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------|
| 03 - Blocks Registry                                     | Workstations, storage, shape pieces, hazards, damage states, access, material families and placed functional blocks.                      |
| 04 - Items Registry                                      | Tools, raw resources, refined materials, trade goods, knowledge items, quality, durability and ownership.                                 |
| 05 - Crafting and Recipe Registry                        | Station recipes, by-products, batch production, project recipes, NPC crafting, recipe unlocks and real input and output transactions.     |
| 06 - Resource Progression                                | Deposits, material tiers, extraction consequences, old-material uses, fuel, grades, purity and village demand.                            |
| 07 - NPC Village System                                  | Jobs, skills, tools, schedules, inventories, warehouses, requests, trade, specialists, training and simulation LOD.                       |
| 08 - Automation System                                   | Machine connections, throughput, buffers, power, logistics and later automated branches owned by 20E.                                     |
| 12 - Structures                                          | Blueprint volumes, markers, terrain rules, ownership, damage, restoration and structure state.                                            |
| 19 - Settlement Growth and Player Voxel Blueprint System | Shared player editors, validation, material tokens, construction stages, project records, parcels and planner scoring.                    |
| 20 / 20H                                                 | Seven-needs lock, stable IDs, catalogue ownership, stage mapping, project class, scope and POC roster.                                    |
| 20A / 20C / 20D / 20E / 20F / 20G                        | Food and households; safety and law; storage, logistics and utilities; advanced industry and magic; campuses; culture and realm variants. |

# Static Table of Contents

- 1\. Locked 20B Identity

- 2\. Scope Boundaries and Anti-Micromanagement Rules

- 3\. Seven-Needs Integration

- 4\. Shared Work, Capacity and Service Model

- 5\. Runtime, Production and Activation States

- 6\. Jobs, Staffing, Skills, Tools and Succession

- 7\. Extraction and Raw-Processing Rules

- 8\. Crafting and Artisan-Production Rules

- 9\. Trade, Contracts and Commerce Rules

- 10\. Education, Knowledge, Apprenticeship and Guild Rules

- 11\. Resource Conservation, Buffers, Quality and By-products

- 12\. NPC Planner and Project Selection

- 13\. Player Blueprint Validation

- 14\. Construction, Repair, Upgrades and Conversion

- 15\. Settlement-Stage Expectations

- 16\. Detailed Registry Summary

- 17\. Extraction and Raw-Processing Entries

- 18\. Crafting and Artisan Entries

- 19\. Trade and Professional-Service Entries

- 20\. Education and Knowledge Entries

- 21\. POC Implementation Scope

- 22\. Balancing and Simulation LOD

- 23\. Open Questions for Later Balancing

- Appendix A. 20B Data Field Template

- Appendix B. Production and Knowledge Chain Matrix

- Appendix C. POC Acceptance Checklist

- Appendix D. Cross-System Dependency Matrix

# 1. Locked 20B Identity

Document 20B is the productive labour, commerce and knowledge layer of the building registry. Its facilities convert geography, resources, people, tools and learned methods into useful settlement capability. A productive settlement is not one with many decorative workshops; it is one whose workers can safely reach functioning job sites, obtain tools and inputs, complete real recipes or services, move outputs and train replacements.

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr class="header">
<th><p><strong>Locked Rule</strong></p>
<p>A 20B building must expose a measurable job, production, trade, training, knowledge or professional service. It cannot generate goods, skilled workers, contracts or research simply because the finished structure exists.</p></th>
</tr>
</thead>
<tbody>
</tbody>
</table>

| **Identity Layer**       | **Design Meaning**                                                                | **Player-Facing Result**                                                               |
|--------------------------|-----------------------------------------------------------------------------------|----------------------------------------------------------------------------------------|
| Real Workplaces          | Jobs require valid sites, tools, access, workers, inputs, outputs and safety.     | A blacksmith without fuel or metal visibly pauses instead of producing abstract goods. |
| Physical Resource Chains | Extraction binds to real trees, deposits and terrain; processing conserves items. | Mines, sawmills and workshops visibly feed construction, trade and defence.            |
| Economic Connection      | Markets and trading posts move owned stock through permissions and routes.        | Shortages can be solved through production, trade, automation or player delivery.      |
| Knowledge and Succession | Schools, apprenticeships, libraries and guilds create specialist continuity.      | Village growth does not depend forever on one irreplaceable NPC.                       |
| Player Expression        | Approved player blueprints satisfy the same workstation and route profiles.       | Custom towns can have unique workshops and markets without breaking simulation.        |
| Scalable Simulation      | Detailed local work and abstract distant summaries preserve the same state.       | Large cities remain feasible while resources and outcomes stay trustworthy.            |

# 2. Scope Boundaries and Anti-Micromanagement Rules

| **Included in 20B**                                                                                                   | **Handled as a sub-calculation or linked system**                                                                                   | **Explicitly not routine player work**                                                                                   |
|-----------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------|
| Extraction sites, raw processing, artisan workshops, markets, trading posts, schools, libraries and guilds.           | Exact item recipes in 05; storage and hauling networks in 20D; advanced machines, industry and magical production in 20E.           | Assigning every worker each morning, carrying each input stack, approving each recipe cycle or setting every shop price. |
| Staffing, job suitability, tool access, skill, training slots, production status and service capacity.                | Personal traits, relationships and detailed schedules in 07; wages, taxes and advanced finance in later economy or governance work. | Separate top-level bars for Employment, Education, Productivity, Wealth, Trade, Skill, Tool Access or Research.          |
| Resource-zone binding, depletion and renewal, production inputs and outputs, by-products, hazards and blocked states. | World generation owns deposits; item and recipe registries own immutable definitions; warehouses own actual stock.                  | Free background production from unbound buildings or infinite merchant inventories.                                      |
| Player-blueprint validation for workstations, routes, buffers, safety, public access and training capacity.           | Visual style, materials and culture packs in 19 and 20G.                                                                            | Forcing every custom workshop to copy a developer floor plan.                                                            |

- NPC planners manage ordinary staffing and task assignment according to priorities, skills and available work.

- The player may set high-level policies, project priorities, permissions, contracts and protected resource zones.

- Buildings show clear blockers such as No Worker, No Tool, No Input, Output Full, Unsafe, Route Blocked or No Power.

- Production can be inspected deeply, but the normal village overview summarises Work as Thriving, Stable, Strained, Critical or Collapsed with causes and trends.

- Trade, training and research are opportunities and progression systems, not daily survival meters that every settlement must maximise.

# 3. Seven-Needs Integration

| **Need**       | **20B Contribution**                                                                                                         | **Important Causes or Drill-Down**                                                                       |
|----------------|------------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------|
| Housing        | Indirect through mixed-use shop-houses, worker travel and specialist attraction; housing capacity remains owned by 20A.      | Workers without suitable homes may travel farther, migrate or lose morale; workshops do not invent beds. |
| Provisions     | Fuel yards, markets and trade routes support food, fuel and clothing supply; some workshops create containers or clothing.   | Fuel stock, clothing basics, trade relief, farm tools and preservation containers.                       |
| Health         | Safe workplaces, clean production, controlled dust, odour and waste, and access to treatment reduce injury and disease risk. | Heat, blades, collapse, dust, tannery wastewater, mine incidents, overwork and contaminated goods.       |
| Work           | Primary need: suitable jobs, functioning sites, staff, tools, inputs, training and productive use of labour.                 | Open jobs, unemployment, specialist gaps, paused workplaces, apprenticeship capacity and travel time.    |
| Safety         | Mine supports, forge firebreaks, market crowd flow, route security and hazardous-industry separation.                        | Accidents, fire, collapse, theft, hostile routes, unsafe tools and missing guards.                       |
| Infrastructure | Roads, storage, loading, utilities, power, waste handling and network connections determine throughput.                      | Blocked outputs, no delivery route, no water or power, insufficient storage and maintenance backlog.     |
| Morale         | Meaningful work, fair access, markets, education, professional identity and successful production can improve stability.     | Unemployment, exploitation, dangerous work, guild conflict, school access and cultural trade.            |

# 4. Shared Work, Capacity and Service Model

A building is operational only when its minimum functional contract passes. The UI should show the single most useful blocker first, then allow deeper inspection of staffing, tools, inputs, outputs, safety and routes.

| **Model**            | **Calculation Direction**                                                                                                      | **Player-Facing Example**                                                 |
|----------------------|--------------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------|
| Work coverage        | Suitable active jobs and training slots compared with available working population, specialist requirements and unemployment.  | Work: Strained - 3 open jobs; no blacksmith; 2 workers seeking placement. |
| Production readiness | Valid site + minimum staff + tools + required inputs + output capacity + utilities + safe access.                              | Blacksmith: Paused - fuel empty.                                          |
| Effective throughput | Base recipe or station rate modified by staff count, skill, tools, material quality, power, maintenance, safety and logistics. | Sawmill: 68% output - blade worn; log intake stable.                      |
| Training capacity    | Valid instructor, learner stations, tools and materials, curriculum and attendance.                                            | Trade School: Limited - 6 learners / 10 spaces; no master mason course.   |
| Trade capacity       | Active vendors or contracts, stock, public and loading access, storage, route safety and permissions.                          | Trading Post: 1 of 2 routes active; northern caravan delayed.             |
| Knowledge access     | Stored knowledge, catalogue state, staff, reading or research positions and permissions.                                       | Library: Stable - public collection open; restricted archive locked.      |

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr class="header">
<th><p><strong>Operational Contract</strong></p>
<p>A finished shell does not automatically provide Work. Minimum staff, markers, access, tools, inputs, output space and required utilities must pass. Housing, storage and public space may remain partially usable when a production function is paused, but output is not credited.</p></th>
</tr>
</thead>
<tbody>
</tbody>
</table>

# 5. Runtime, Production and Activation States

| **State**           | **Meaning**                                                                   | **Settlement Effect**                                               |
|---------------------|-------------------------------------------------------------------------------|---------------------------------------------------------------------|
| Planned             | Approved site and blueprint; resources may be reserved.                       | No jobs or output yet; may attract builders and supply requests.    |
| Under Construction  | Visible stages are being supplied and built.                                  | Only explicitly activated partial services count.                   |
| Commissioning       | Shell complete; tools, staff, recipes, routes and safety are being validated. | Jobs may be assigned but normal output is delayed or limited.       |
| Ready               | All minimum requirements pass; waiting for work or inputs.                    | Counts as available Work capacity.                                  |
| Running             | A recipe, extraction task, service, class or trade cycle is active.           | Consumes resources and time and produces output or service.         |
| Waiting Input       | Required material, tool, stock, learner or route is missing.                  | No current output; a clear shortage cause is shown.                 |
| Blocked Output      | Storage or route cannot accept output.                                        | Cycle pauses safely after internal buffer fills.                    |
| Understaffed        | Below target staff but above minimum.                                         | Reduced capacity; planner may recruit, retrain or reassign.         |
| Unsafe              | Hazard, damage, contamination or crowd problem exceeds limits.                | Output suspended; Safety or Health pressure and repair response.    |
| Damaged             | Some functions remain but capacity or quality falls.                          | Partial contribution until repaired.                                |
| Abandoned or Ruined | No maintained use or critical function destroyed.                             | No normal contribution; restoration, salvage or occupation project. |

# 6. Jobs, Staffing, Skills, Tools and Succession

- Each workplace has minimum, target and maximum staffing. Minimum unlocks function; target gives intended output; extra staff only help if marked workstations and logistics support them.

- NPCs choose jobs using settlement need, skill, traits, tools, workplace access, household obligations, danger, culture and player or leader policies.

- The player can set priorities or lock key assignments, but routine reassignment remains automatic.

- Tools are real items with condition. A worker may borrow from workplace stores, carry personal equipment or request replacement.

- Low skill normally means slower work, lower yield, more waste or fewer recipes rather than constant random failure.

- Specialist succession uses apprenticeships, schools, guilds, migration, NPC teaching and player recruitment.

- Overwork, dangerous work, unfair law or forced labour can affect Health, Safety, Morale, reputation and rebellion systems rather than becoming a separate fatigue-management game.

| **Staffing State** | **Rule**                                          | **Planner Response**                                              |
|--------------------|---------------------------------------------------|-------------------------------------------------------------------|
| No eligible worker | Building cannot operate.                          | Recruit, train, reassign, trade for service or postpone project.  |
| Below minimum      | No normal function.                               | Flag critical specialist or labour shortage.                      |
| Minimum met        | Basic function available.                         | Operate at reduced or baseline capacity.                          |
| Target met         | Designed throughput or service.                   | Maintain inputs, tools and succession.                            |
| Above target       | Only useful if extra valid work positions exist.  | Reassign surplus or expand building or shift profile.             |
| Skill gap          | Worker can perform only allowed recipes or tasks. | Train, pair with a master, use simpler work or seek a specialist. |
| Tool gap           | Worker is present but cannot execute task.        | Reserve, craft, repair, buy or deliver the tool.                  |

# 7. Extraction and Raw-Processing Rules

1.  World generation or player surveying identifies a real renewable zone, vein, deposit, quarry face or underground heading.

2.  The settlement planner verifies ownership, danger, route, tool tier, environmental or cultural policy and available workers.

3.  An extraction facility binds to the approved zone and creates job, staging, safety and hauling points.

4.  Workers remove actual blocks and resources or consume bounded deposit state; output enters real inventories.

5.  Raw processing grades, cuts, dries or converts material while preserving inputs, outputs and by-products.

6.  Depletion, regeneration, collapse, pollution, corruption, weather and faction conflict modify future capacity.

| **Extraction Rule**    | **Direction**                                                                                                                    |
|------------------------|----------------------------------------------------------------------------------------------------------------------------------|
| No free output         | A mine, quarry or lumber camp cannot produce if no valid resource zone remains reachable.                                        |
| Node and voxel support | Small visible resources may be mined block-by-block; large deposits may use bounded node totals while preserving world evidence. |
| Protected zones        | Sacred groves, settlement reserves, ownership, ecology and player laws can exclude or limit extraction.                          |
| Sustainable options    | Forestry rotation, replanting, quarry benches, spoil control and mine supports can reduce long-term risk.                        |
| Risk transparency      | Collapse, fire, flooding, hostile caves, dust, noise and magical instability must have readable warnings and responses.          |
| Hauling matters        | Output must reach a staging point, warehouse, processing facility or trade route; blocked hauling pauses or limits production.   |
| Distant simulation     | Far extraction uses bounded daily output and risk summaries based on the same workers, tools, zone state and routes.             |

# 8. Crafting and Artisan-Production Rules

| **Layer**             | **Rule**                                                                                                      | **Examples**                                                        |
|-----------------------|---------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------|
| Recipe authority      | The Recipe Registry owns inputs, outputs, time, by-products and unlocks.                                      | Planks, tools, pottery, clothing, leather and glass.                |
| Building authority    | 20B owns valid station markers, staffing, buffers, utilities, hazards, capacity and planner meaning.          | Forge layout, tannery dirty and clean zones, sawmill safety.        |
| Quality               | Skill, tool or station quality, input grade, specialist support and magic may affect output quality or yield. | Masterwork tool, refined masonry, low-waste cut.                    |
| Batching              | Workplaces may batch compatible recipes when stock, storage and policy allow.                                 | Nails, bricks, planks and clothing bundles.                         |
| By-products           | Waste and secondary outputs remain real, but only important by-products need deep gameplay.                   | Sawdust, slag, ash, waste rock and scraps.                          |
| Orders and priorities | Buildings choose work from settlement orders, projects, stock targets, contracts and player policies.         | Repair tools first, then watchtower fittings, then trade stock.     |
| Specialisation        | A universal definition may use profile modules without becoming dozens of duplicate buildings.                | Tailor versus weaver; glass versus brick; toolsmith versus farrier. |

# 9. Trade, Contracts and Commerce Rules

- Market and trade buildings expose stock and services; they do not create infinite merchant inventories.

- Trade may be donation, sale, purchase, barter, contract, consignment, tax or tribute, or emergency requisition according to ownership and law.

- Local markets exchange settlement and visitor stock. Trading posts require regional routes. Advanced exchanges coordinate contracts and finance rather than directly moving every item.

- Prices may respond to scarcity, culture, reputation, danger, distance, quality and faction access, but the player should see understandable reasons rather than opaque volatility.

- Caravans, carts, ships, rails or portals are route implementations owned across 20D and 20E. 20B defines the commercial service and route requirements.

- Trade failures create shortages, delayed projects, lost opportunity or politics; they should not erase stock without a recorded event.

| **Trade Mode**        | **Ownership or Stock Rule**                                              | **Typical Use**                           |
|-----------------------|--------------------------------------------------------------------------|-------------------------------------------|
| Local sale            | Vendor owns or is authorised to sell physical stock.                     | Market stalls and shops.                  |
| Settlement export     | Warehouse releases approved surplus or contract stock.                   | Trading post and caravans.                |
| Settlement import     | Purchased goods enter controlled storage and ledger.                     | Shortage relief and specialist materials. |
| Project contract      | Goods are reserved for a named construction or service project.          | Stone, tools, ward parts or school books. |
| Consignment           | Owner keeps title until sale; merchant takes a fee or commission.        | Player or artisan goods.                  |
| Emergency requisition | Law or crisis allows protected withdrawal with history and consequences. | Famine, siege, disaster or hospital need. |

# 10. Education, Knowledge, Apprenticeship and Guild Rules

Education supports Work, Morale and progression but does not become an eighth main need. Settlements can survive without every educational tier; higher stages benefit from specialist succession, literacy, research and professional organisation.

| **System**        | **What Is Calculated**                                                                                                     | **What the Player Sees**                                              |
|-------------------|----------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------|
| Basic education   | Teacher, learner capacity, curriculum, materials, attendance and safety.                                                   | Coverage, open seats, missing teacher and current lesson focus.       |
| Apprenticeship    | Master-worker time, learner skill, practice tools and materials, linked workplace and course duration.                     | Apprentice progress, available trades and blockers.                   |
| Knowledge storage | Actual books, records and maps, catalogue, permissions, preservation and staff.                                            | Known collections, damaged or lost records and research access.       |
| Guild service     | Members, profession profile, contracts, standards, training, records and politics.                                         | Available jobs and contracts, reputation and professional benefits.   |
| Research link     | Research facilities and registries own experiments and unlocks; libraries and experts provide prerequisites and modifiers. | What knowledge is available and what still must be discovered.        |
| Succession        | Current specialists, ages or availability, trainees, migration and replacement time.                                       | Critical professions at risk and recommended training or recruitment. |

# 11. Resource Conservation, Buffers, Quality and By-products

| **Component**            | **Rule**                                                                                                                   |
|--------------------------|----------------------------------------------------------------------------------------------------------------------------|
| Input buffer             | Contains actual items or tagged stacks reserved for approved tasks. Empty input means no production.                       |
| Tool and equipment store | Holds tools, safety gear and reusable station components with durability and maintenance.                                  |
| Work-in-progress         | Timed recipe or service record persists through save, load and interruption.                                               |
| Output buffer            | Receives exact outputs and by-products until hauled, sold or consumed.                                                     |
| Quality state            | Stored on outputs only where meaningful; not every common block needs per-item quality.                                    |
| Waste or by-product      | Created according to recipe; useful outputs route to storage, while low-value waste may aggregate by category.             |
| Reservation              | Project, contract or emergency stock cannot be consumed by ordinary production unless policy permits.                      |
| Ownership ledger         | Records village, player, guild, household, faction or merchant ownership and authorised transfer.                          |
| Loss and spoilage        | Only occurs through defined spoilage, theft, fire, damage, waste or event records - never unexplained background deletion. |

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr class="header">
<th><p><strong>Resource Trust Rule</strong></p>
<p>The player should be able to trace where important resources came from, which building consumed them, what was produced, who owns the output and why a cycle stopped. Summary simulation may batch transactions, but it must preserve conservation and history.</p></th>
</tr>
</thead>
<tbody>
</tbody>
</table>

# 12. NPC Planner and Project Selection

7.  Measure Work coverage, resource opportunity, current shortages, production bottlenecks, repair demand, trade routes and specialist succession.

8.  Filter eligible definitions by stage, terrain, deposit or resource access, ownership, law, culture, research, safety and available sites.

9.  Score candidate projects by urgency, output value, resource cost, staffing feasibility, route burden, existing redundancy, risk and player policy.

10. Select a blueprint from developer, settlement or approved player libraries that satisfies the functional definition and style policy.

11. Reserve the site and construction stock; assign builders and required specialist participation.

12. Commission the completed building by validating workers, tools, inputs, outputs, routes, utilities and safety.

13. Re-evaluate production and training priorities after the new capacity changes settlement state.

| **Planner Trigger**     | **Typical 20B Response**                                                           |
|-------------------------|------------------------------------------------------------------------------------|
| Construction bottleneck | Carpenter, mason, sawmill, quarry, market import or better hauling.                |
| Tool shortage           | Blacksmith, trade contract, repair order or specialist recruitment.                |
| Unemployment            | Open eligible workplaces, expand production, create public projects or training.   |
| Specialist gap          | School, trade school, guild training, recruitment contract or visiting teacher.    |
| Resource opportunity    | Conditional extraction site and route if risk and cost are acceptable.             |
| Persistent surplus      | Market, trading post, preserving or processing link, or export contract.           |
| Persistent shortage     | Increase local production, import, substitute material or reduce project priority. |
| Unsafe industry         | Repair, relocate, add utilities or safety, pause work or replace blueprint.        |

# 13. Player Blueprint Validation

| **Profile**           | **Minimum Validation**                                                                                                                                               |
|-----------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Extraction site       | Valid resource-zone binding, work boundary, staging, tool access, safe route, delivery socket and hazard controls.                                                   |
| Workshop              | Supported workstation markers, worker route, input and output buffers, tool store, required utilities, fire, chemical or mechanical clearance and public separation. |
| Market                | Reachable vendor and customer markers, stock access, public circulation, loading or service route, exits, ownership and theft controls.                              |
| School or training    | Instructor and learner markers, curriculum or tool storage, safe access, light or heat and profile-specific practice area.                                           |
| Library or archive    | Knowledge storage, access permissions, reading or research positions and fire, moisture or security protection.                                                      |
| Guild or professional | Selected profession profile, member and contract service, records and connection to real workers or workplaces.                                                      |

- A blueprint can be saved while incomplete or invalid, but NPC planners cannot use it until blocking errors are resolved.

- Capacity comes from valid markers and routes, not floor area or decoration alone.

- Mixed-use buildings must keep hazardous production separate from housing, public trade or classrooms unless the selected profile explicitly permits a safe shared layout.

- The in-world designer can test live deposits, roads, warehouses, utilities and ownership; the main-menu Workshop uses simulated profiles and later revalidates against the chosen site.

- Player blueprints may exceed minimum quality, capacity or aesthetics, but they cannot bypass progression, resource, route, safety or culture-law requirements.

# 14. Construction, Repair, Upgrades and Conversion

| **Project Layer**        | **Direction**                                                                                                                                     |
|--------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------|
| Construction costs       | Generated from blueprint blocks and material tokens plus functional equipment, tools, scaffolding and project-specific components.                |
| Commissioning costs      | May require tools, station components, books, sample stock, permits, specialist inspection or route activation after shell completion.            |
| Routine maintenance      | Tool wear, blades, forge lining, roof and structure, lubrication, cleaning, waste handling and record upkeep.                                     |
| Damage and repair        | Local damage masks can disable only affected functions; fire, flood, collapse, contamination and theft produce explicit repair or recovery tasks. |
| Capacity upgrade         | Adds valid workstations, buffers, training seats, loading bays or route slots without necessarily replacing the whole building.                   |
| Technology upgrade       | Adds power, machines, mana, safety or automation modules through 20E while preserving the base definition where possible.                         |
| Specialisation           | Converts a generic facility into a profile branch such as farrier, armourer, glassworks, archive or professional guild.                           |
| Relocation or conversion | A valid abandoned or obsolete building may be converted when shell, parcel, hazards and markers support the new definition.                       |

# 15. Settlement-Stage Expectations

| **Stage**          | **20B Minimum Expectations**                                                                                                             | **Typical Optional or Conditional Growth**                                                             |
|--------------------|------------------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------|
| Camp               | No permanent 20B building required; gathering and barter may be temporary tasks.                                                         | Expedition work point or temporary resource cache through other documents.                             |
| Hamlet             | At least one viable livelihood or external supply path; conditional lumber, clay or sand, fuel or mine access where resources exist.     | Lumber camp, mine entrance, clay works and charcoal yard.                                              |
| Village            | Reliable building-component and tool capability or equivalent trade: carpenter, mason and blacksmith are standard teaching-path anchors. | Sawmill, ore sorting, pottery, textiles, leather, markets, trading post, school and trade school.      |
| Fortified Village  | Repair and defence supply resilience, protected trade stock, specialist succession and safe extraction routes.                           | Expanded workshops, guarded market, additional training and reserve contracts.                         |
| Town               | Specialised production, permanent market service, deeper extraction, vocational training and knowledge storage.                          | Deep mine, market hall, caravanserai, glass or brick works, library and guild hall.                    |
| City               | Regional commerce, professional coordination, advanced education and linked industrial systems.                                          | Merchant exchange, specialist guilds and Academy or University owned by 20F.                           |
| Capital            | Culture or faction knowledge, national trade coordination, elite professions and strategic resource institutions.                        | Grand exchanges, archives, colleges and signature guilds through 20F or 20G.                           |
| Magical Metropolis | Cross-realm labour, knowledge and commerce integrated with portal, golem, mana and dimensional systems.                                  | Interrealm exchange, living libraries, magical craft orders and realm schools through 20E, 20F or 20G. |

# 16. Detailed Registry Summary

| **No.** | **Stable ID**                           | **Definition**                   | **Earliest Stage** | **Primary Need** | **Class**   | **Status**   |
|---------|-----------------------------------------|----------------------------------|--------------------|------------------|-------------|--------------|
| 31      | building.extraction.lumber_camp         | Lumber Camp                      | Hamlet             | Work             | Optional    | POC Required |
| 32      | building.extraction.sawmill             | Sawmill                          | Village            | Work             | Optional    | Alpha        |
| 33      | building.extraction.quarry_stone_yard   | Quarry and Stone Yard            | Village            | Work             | Conditional | Alpha        |
| 34      | building.extraction.clay_sand_works     | Clay or Sand Works               | Hamlet             | Work             | Conditional | Alpha        |
| 35      | building.extraction.mine_entrance       | Mine Entrance                    | Hamlet             | Work             | Conditional | POC Required |
| 36      | building.extraction.deep_mine_complex   | Mine Shaft or Deep Mine Complex  | Town               | Work             | Conditional | Beta         |
| 37      | building.extraction.ore_sorting_yard    | Ore Sorting Yard                 | Village            | Work             | Optional    | Alpha        |
| 38      | building.extraction.charcoal_fuel_yard  | Charcoal Burner and Fuel Yard    | Hamlet             | Provisions       | Optional    | Alpha        |
| 41      | building.crafting.carpenter_workshop    | Carpenter Workshop               | Village            | Work             | Required    | POC Required |
| 42      | building.crafting.mason_yard            | Mason Yard                       | Village            | Work             | Required    | POC Required |
| 43      | building.crafting.village_blacksmith    | Village Blacksmith               | Village            | Work             | Required    | POC Required |
| 44      | building.crafting.pottery_kiln          | Pottery and Kiln                 | Village            | Work             | Optional    | Alpha        |
| 45      | building.crafting.weaver_tailor         | Weaver and Tailor Workshop       | Village            | Work             | Optional    | Alpha        |
| 46      | building.crafting.tannery_leatherworker | Tannery and Leatherworker        | Village            | Work             | Optional    | Alpha        |
| 47      | building.crafting.glass_brick_works     | Glassworks or Brickworks         | Town               | Work             | Optional    | Beta         |
| 51      | building.trade.market_stalls            | Market Stalls                    | Village            | Work             | Optional    | POC Required |
| 52      | building.trade.trading_post             | Trading Post                     | Village            | Infrastructure   | Optional    | POC Required |
| 53      | building.trade.covered_market_hall      | Covered Market or Market Hall    | Town               | Work             | Optional    | Beta         |
| 54      | building.trade.caravanserai_coach_inn   | Caravanserai or Coach Inn        | Town               | Infrastructure   | Conditional | Beta         |
| 55      | building.trade.merchant_exchange        | Merchant Guild or Trade Exchange | City               | Work             | Optional    | Beta         |
| 56      | building.education.small_school         | Small School                     | Village            | Work             | Optional    | POC Required |
| 57      | building.education.trade_school         | Apprentice or Trade School       | Village            | Work             | Optional    | Alpha        |
| 58      | building.education.library_archive      | Library or Archive               | Town               | Morale           | Optional    | Beta         |
| 60      | building.professional.guild_hall        | Guild Hall or Professional Lodge | Town               | Work             | Optional    | Beta         |

Catalogue numbers 39-40 and 48-50 are owned by 20E because they are magical, automated or industrial systems. Catalogue number 59 is owned by 20F because an Academy or University is a campus-scale complex. Their dependencies remain referenced here.

# 17. Extraction and Raw-Processing Entries

### 31. Lumber Camp

building.extraction.lumber_camp

| **Catalogue role**                      | Extraction / Forestry \| Hamlet \| Parcel \| Optional \| POC Required                                                                                                                                 |
|-----------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Work \| Secondary: Provisions, Infrastructure                                                                                                                                                |
| **Purpose**                             | Creates a controlled forestry job site with tool access, log staging and cutting-zone rules instead of letting a decorative woodpile generate timber.                                                 |
| **Capacity / service**                  | Draft small-team capacity: 1-4 foresters or lumberjacks, one active cutting zone and a limited log staging area. Output depends on reachable trees, regrowth policy, tools and hauling.               |
| **Jobs and users**                      | Forester, lumberjack, hauler and optional surveyor or nature specialist.                                                                                                                              |
| **Inputs**                              | Axes and saws, tool repairs, food for remote crews, optional seedlings, carts and safety equipment.                                                                                                   |
| **Outputs / services**                  | Logs, sticks, bark, sap, firewood and forestry information; may also reserve seed stock or mark protected trees.                                                                                      |
| **Required blueprint markers**          | Job board, tool store, log staging, worker shelter, delivery socket, cutting-zone anchor and safe route to the forest.                                                                                |
| **Placement and utilities**             | Forest edge or managed woodland with road/path access; must bind to an allowed forestry zone and respect protected, sacred or exhausted areas.                                                        |
| **Construction profile**                | 4 stages: clear and mark site; tool/supply shelter; log staging; activation and cutting-zone approval.                                                                                                |
| **Upgrade and branch links**            | Sawmill link, forester lodge, managed plantation, cart loading yard or magical living-wood branch through 20G/20E.                                                                                    |
| **Planner triggers and failure states** | Selected when timber demand exceeds imports or casual gathering. Output falls when the zone is depleted, unsafe, inaccessible, overprotected or lacks tools/hauling.                                  |
| **Player-blueprint validation**         | Must include a real zone anchor, safe storage and delivery route. Decorative trees or logs do not create resources; player designs cannot claim forestry output without valid nearby resource access. |
| **Culture and style variation**         | Open timber camp, woodland lodge, cliff rope-yard, underground fungal wood works, living-tree stewardship site or nomadic cutting camp.                                                               |

### 32. Sawmill

building.extraction.sawmill

| **Catalogue role**                      | Extraction / Raw Processing \| Village \| Medium \| Optional \| Alpha                                                                                                     |
|-----------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Work \| Secondary: Infrastructure                                                                                                                                |
| **Purpose**                             | Processes logs into consistent planks, beams, boards and by-products with better yield and throughput than hand crafting.                                                 |
| **Capacity / service**                  | One or more saw stations with draft village throughput based on staff, power method and input/output buffers. It improves conversion efficiency but never creates timber. |
| **Jobs and users**                      | Sawyer, carpenter, mechanic, hauler and maintenance worker.                                                                                                               |
| **Inputs**                              | Logs, blades, lubricant or maintenance parts, mechanical/fuel/water power where required and recipe knowledge.                                                            |
| **Outputs / services**                  | Planks, beams, boards, shafts, sawdust, bark waste and construction components.                                                                                           |
| **Required blueprint markers**          | Log intake, saw workstation, safety clearance, operator point, output racks, by-product bin, power socket and delivery route.                                             |
| **Placement and utilities**             | Near timber storage and road/water power access; requires noise, blade and fire separation from dense housing.                                                            |
| **Construction profile**                | 6 stages: foundation; frame; intake/storage; saw mechanism; power and safety; commissioning. Manual or water-powered variants may merge stages.                           |
| **Upgrade and branch links**            | Powered sawmill, carpenter complex, automated lumber plant through 20E or culture-specific precision mill.                                                                |
| **Planner triggers and failure states** | Selected when building demand, timber waste or carpenter bottlenecks justify it. Pauses with no logs, dull/broken blades, blocked output, lost power or unsafe machinery. |
| **Player-blueprint validation**         | Must resolve a supported saw process, operator access, guarded blade zone and separated input/output. A static saw prop cannot provide processing bonuses.                |
| **Culture and style variation**         | Waterwheel mill, hand-frame saw house, dwarven gear saw, fae shaping grove, desert wind saw or mana-guided precision mill.                                                |

### 33. Quarry and Stone Yard

building.extraction.quarry_stone_yard

| **Catalogue role**                      | Extraction / Stone \| Village \| Large Parcel \| Conditional \| Alpha                                                                                                              |
|-----------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Work \| Secondary: Infrastructure                                                                                                                                         |
| **Purpose**                             | Combines a controlled stone extraction face with staging, sorting and basic stone supply for roads, walls and building projects.                                                   |
| **Capacity / service**                  | Draft 2-8 workers across one bound quarry zone; output depends on exposed stone, tool tier, safe benches, hauling and local geology.                                               |
| **Jobs and users**                      | Quarry worker, miner, stone sorter, mason, hauler and surveyor.                                                                                                                    |
| **Inputs**                              | Picks, hammers, wedges, supports, carts, repair supplies and optional blasting or magic permits at later tiers.                                                                    |
| **Outputs / services**                  | Rough stone, rubble, gravel, selected blocks, decorative stone and quarry by-products.                                                                                             |
| **Required blueprint markers**          | Quarry-zone anchor, safe work benches, tool store, stone piles, spoil zone, loading socket, warning boundary and emergency route.                                                  |
| **Placement and utilities**             | Valid rock face or shallow deposit with slope and collapse checks; should avoid undermining roads, homes, sacred ground or waterworks.                                             |
| **Construction profile**                | 5-7 stages: survey and boundary; access ramp; work face; storage/spoil; loading; safety inspection; optional crane.                                                                |
| **Upgrade and branch links**            | Deep quarry, stone-cutting complex, automated quarry through 20E or culture-specific underground hall.                                                                             |
| **Planner triggers and failure states** | Eligible only where usable stone exists. Selected for sustained construction demand; output falls with exhausted faces, unsafe slopes, tool shortage, blocked hauling or flooding. |
| **Player-blueprint validation**         | A player blueprint must bind to real stone terrain, define safe extraction and spoil areas, and preserve reachable work paths. It cannot mine arbitrary protected blocks.          |
| **Culture and style variation**         | Open pit, stepped cliff quarry, underground chamber, river-stone works, crystal-cut yard or giant-carved stone face.                                                               |

### 34. Clay or Sand Works

building.extraction.clay_sand_works

| **Catalogue role**                      | Extraction / Earth Materials \| Hamlet \| Parcel \| Conditional \| Alpha                                                                                         |
|-----------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Work \| Secondary: Infrastructure                                                                                                                       |
| **Purpose**                             | Provides a flexible earth-material extraction family for clay, sand, gravel, salt or similar local deposits without duplicating one building for every material. |
| **Capacity / service**                  | Small crew and one bound deposit zone; yield and hazards use the selected resource profile.                                                                      |
| **Jobs and users**                      | Digger, washer, sorter, hauler and optional potter or mason.                                                                                                     |
| **Inputs**                              | Shovels, baskets/carts, water for washing where used, supports, drying space and maintenance.                                                                    |
| **Outputs / services**                  | Clay, sand, gravel, salt or related raw material plus rejects and washed grades.                                                                                 |
| **Required blueprint markers**          | Deposit anchor, excavation zone, sorting/washing point, drying or stock piles, tool store and loading path.                                                      |
| **Placement and utilities**             | Only eligible on a valid deposit with erosion, flood, collapse and protected-water checks.                                                                       |
| **Construction profile**                | 4-6 stages depending on material: survey; access; extraction area; processing/staging; drainage; inspection.                                                     |
| **Upgrade and branch links**            | Pottery/kiln supply chain, brickworks, glassworks, salt house or automated earthworks through 20E.                                                               |
| **Planner triggers and failure states** | Selected when local material demand and deposit quality justify operation. Flooding, contamination, depleted layers, unstable walls or no hauling can pause it.  |
| **Player-blueprint validation**         | Must use a supported resource profile and real deposit. Visual sand or clay decoration alone does not create output.                                             |
| **Culture and style variation**         | River clay pit, dune works, salt pan, cavern silt basin, volcanic ash yard or magically separated earthworks.                                                    |

### 35. Mine Entrance

building.extraction.mine_entrance

| **Catalogue role**                      | Extraction / Mining \| Hamlet \| Medium \| Conditional \| POC Required                                                                                                           |
|-----------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Work \| Secondary: Safety, Infrastructure                                                                                                                               |
| **Purpose**                             | Creates controlled access, staffing, storage and safety for an underground mine network while leaving the actual ore inside the voxel world.                                     |
| **Capacity / service**                  | Draft 1-6 miners using one connected mine zone; capacity depends on reachable headings, ventilation, support, tool tier, light and hauling.                                      |
| **Jobs and users**                      | Miner, foreman, surveyor, support worker, hauler and guard where threats exist.                                                                                                  |
| **Inputs**                              | Picks, lights, supports, carts, food, repair materials and optional pumps or ventilation.                                                                                        |
| **Outputs / services**                  | Mined stone, ore, gems, clues, cave resources and underground route access.                                                                                                      |
| **Required blueprint markers**          | Portal/entrance anchor, job board, tool store, ore staging, support inspection, ventilation/light, delivery socket and emergency muster point.                                   |
| **Placement and utilities**             | At a valid cave, shaft or carved route with stable terrain, surface access and no ownership conflict.                                                                            |
| **Construction profile**                | 6 stages: survey; portal supports; access tunnel; storage/tool area; lighting/safety; commissioning and mine-zone binding.                                                       |
| **Upgrade and branch links**            | Deep mine complex, minecart depot, ore sorting yard, automated mine through 20E or culture-specific hold entrance.                                                               |
| **Planner triggers and failure states** | Only eligible with useful underground resources or strategic access. Can pause after collapse, flooding, gas, hostile occupation, missing supports, no tools or blocked hauling. |
| **Player-blueprint validation**         | Must connect to a real mine volume and safe reachable route. Decorative tunnel mouths do not generate ore or teleport miners to abstract resources nearby.                       |
| **Culture and style variation**         | Timber portal, stone adit, dwarven gate, desert sink mine, fae root tunnel, ice shaft or rune-stabilised crystal entrance.                                                       |

### 36. Mine Shaft or Deep Mine Complex

building.extraction.deep_mine_complex

| **Catalogue role**                      | Extraction / Advanced Mining \| Town \| Large Complex \| Conditional \| Beta                                                                                                            |
|-----------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Work \| Secondary: Safety, Infrastructure                                                                                                                                      |
| **Purpose**                             | Supports deeper extraction through lifts, ventilation, pumps, rails, support crews and specialised safety systems.                                                                      |
| **Capacity / service**                  | Multiple crews, levels and resource headings; throughput is limited by lift/rail capacity, ventilation, power, maintenance and danger.                                                  |
| **Jobs and users**                      | Mine foreman, miners, engineers, pump workers, rail operators, surveyors, rescuers and guards.                                                                                          |
| **Inputs**                              | Heavy supports, rails/carts, power, fuel, tools, spare parts, pumps, lights and safety supplies.                                                                                        |
| **Outputs / services**                  | Large volumes of ore and stone, rare deep resources, survey data and strategic underground access.                                                                                      |
| **Required blueprint markers**          | Shaft/lift, level sockets, ventilation network, pump/drainage, ore loading, maintenance bay, rescue station, tool stores and restricted zones.                                          |
| **Placement and utilities**             | Valid deep resource body and geologically stable shaft location with strong road/logistics access and risk permissions.                                                                 |
| **Construction profile**                | 8-12 stages built as subprojects: shaft collar; lift; ventilation; first level; loading; pumps; safety; expansion levels.                                                               |
| **Upgrade and branch links**            | Automated deep mine, underground industrial district, dimensional bore or culture-specific mountain hold through 20E/20F/20G.                                                           |
| **Planner triggers and failure states** | Selected when shallow sources cannot meet demand and technology, specialists, capital and safety capacity exist. Major incidents can close levels without destroying the whole complex. |
| **Player-blueprint validation**         | Player plans must prove shaft clearance, emergency egress, ventilation/pump coverage and loading logistics. Deep output requires actual generated resource access.                      |
| **Culture and style variation**         | Timber shaft, steel headframe, dwarven lift hall, golem-mined cavern, leyline bore or void-shielded deep works.                                                                         |

### 37. Ore Sorting Yard

building.extraction.ore_sorting_yard

| **Catalogue role**                      | Extraction / Raw Processing \| Village \| Parcel \| Optional \| Alpha                                                                                  |
|-----------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Work \| Secondary: Infrastructure                                                                                                             |
| **Purpose**                             | Grades, separates, stores and prepares raw ore batches before smelting, trade or specialist processing.                                                |
| **Capacity / service**                  | One or more sorting tables and stock bays; improves batch consistency and can recover minor by-products based on skill and tools.                      |
| **Jobs and users**                      | Ore sorter, assayer, miner, hauler and optional merchant or smith.                                                                                     |
| **Inputs**                              | Raw ore, sample tools, hammers/screens, containers, labels and optional water or mechanical separation.                                                |
| **Outputs / services**                  | Graded ore batches, waste rock, concentrates, trade samples and processing records.                                                                    |
| **Required blueprint markers**          | Raw intake, sorting/assay workstation, grade bins, waste pile, secure valuable stock, output/loading socket and records point.                         |
| **Placement and utilities**             | Between mine transport and furnace/warehouse routes; requires dust, runoff and theft controls.                                                         |
| **Construction profile**                | 4-6 stages: level yard; stock bays; sorting stations; secure storage; drainage/dust; activation.                                                       |
| **Upgrade and branch links**            | Crusher/concentrator through 20E, assay office, rail loading yard or magical purity laboratory.                                                        |
| **Planner triggers and failure states** | Selected when ore volume, grade variation, smelter efficiency or trade value justify it. Blocked bins, absent sorters or contamination reduce benefit. |
| **Player-blueprint validation**         | Must expose distinct intake, processing and grade outputs; a single generic stockpile cannot claim sorting efficiency.                                 |
| **Culture and style variation**         | Hand-picking yard, water sluice, dwarven assay court, crystal resonance sorter or goblin scrap grading yard.                                           |

### 38. Charcoal Burner and Fuel Yard

building.extraction.charcoal_fuel_yard

| **Catalogue role**                      | Extraction / Fuel \| Hamlet \| Parcel \| Optional \| Alpha                                                                                         |
|-----------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Provisions \| Secondary: Work, Infrastructure                                                                                             |
| **Purpose**                             | Converts wood or approved biomass into reliable early fuel and stores it safely for homes, kitchens, kilns and smithies.                           |
| **Capacity / service**                  | Small batch kilns or clamps plus protected fuel storage; throughput depends on wood supply, burn time, staff and fire safety.                      |
| **Jobs and users**                      | Charcoal burner, fuel keeper, forester and hauler.                                                                                                 |
| **Inputs**                              | Logs or biomass, ignition fuel, soil/clay cover or kiln parts, water/fire tools and containers.                                                    |
| **Outputs / services**                  | Charcoal, ash, heat by-products, fuel stock and possible wood vinegar/tar at advanced variants.                                                    |
| **Required blueprint markers**          | Kiln/clamp, safe burn zone, raw wood stack, finished fuel store, ash/by-product area, firebreak, water point and delivery socket.                  |
| **Placement and utilities**             | Downwind or edge parcel away from dense housing, with road access and strong fire separation.                                                      |
| **Construction profile**                | 4-6 stages: clear/firebreak; raw store; kiln/clamp; finished store; safety equipment; activation.                                                  |
| **Upgrade and branch links**            | Fuel depot through 20D, coke/industrial fuel plant through 20E, alchemical charcoal works or culture-specific kiln.                                |
| **Planner triggers and failure states** | Selected when fuel demand, winter risk or smithing grows. Fire, rain, wood shortage, blocked storage or unattended burns can interrupt production. |
| **Player-blueprint validation**         | Must include supported conversion process, firebreak and segregated raw/finished stock. A decorative kiln does not produce fuel.                   |
| **Culture and style variation**         | Earth mound, brick retort, forest charcoal camp, underground smokeless kiln, volcanic burner or rune-sealed clean kiln.                            |

# 18. Crafting and Artisan Entries

### 41. Carpenter Workshop

building.crafting.carpenter_workshop

| **Catalogue role**                      | Crafting / Woodwork \| Village \| Medium \| Required \| POC Required                                                                                                                |
|-----------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Work \| Secondary: Infrastructure                                                                                                                                          |
| **Purpose**                             | Produces wooden building components, furniture, repairs and blueprint parts from processed timber.                                                                                  |
| **Capacity / service**                  | Draft 1-3 carpenters, one main bench and limited assembly space; throughput scales with tools, skill, sawmill support and stock.                                                    |
| **Jobs and users**                      | Carpenter, joiner, furniture maker, apprentice and hauler.                                                                                                                          |
| **Inputs**                              | Planks, beams, boards, nails or fasteners, glue or resin, tools, recipes and optional power.                                                                                        |
| **Outputs / services**                  | Construction components, doors and windows, furniture, handles, crates, repairs and project bundles.                                                                                |
| **Required blueprint markers**          | Carpentry bench, cutting and assembly area, tool rack, material intake, output racks, safe circulation and delivery socket.                                                         |
| **Placement and utilities**             | Accessible workshop parcel near timber storage and builder supply routes; fire and saw safety required.                                                                             |
| **Construction profile**                | 6 stages: foundation; shell; material store; benches and tools; output and loading; inspection. Basic repair work may activate before full furnishing.                              |
| **Upgrade and branch links**            | Joinery shop, furniture guild, sawmill complex, machine-assisted woodworks or living-wood workshop through 20E or 20G.                                                              |
| **Planner triggers and failure states** | Required by Village stage or an equivalent building-component provider. Pauses with no timber, missing tools, blocked output, no carpenter or unsafe machinery.                     |
| **Player-blueprint validation**         | Must provide a valid workbench, safe material flow and input or output capacity. Player designs may combine with housing or a shopfront only when hazards and routes are separated. |
| **Culture and style variation**         | Open timber yard, guild joinery, dwarven precision shop, fae living-wood studio, ship carpenter or clockwork woodworks.                                                             |

### 42. Mason Yard

building.crafting.mason_yard

| **Catalogue role**                      | Crafting / Stonework \| Village \| Parcel \| Required \| POC Required                                                                                   |
|-----------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Work \| Secondary: Infrastructure                                                                                                              |
| **Purpose**                             | Shapes stone into construction blocks, road pieces, walls, monuments and repair materials.                                                              |
| **Capacity / service**                  | Draft 1-4 masons with several cutting or carving stations and heavy stock bays; output depends on stone supply, tools and hauling.                      |
| **Jobs and users**                      | Mason, stonecutter, sculptor, apprentice and hauler.                                                                                                    |
| **Inputs**                              | Rough stone, mortar or binder ingredients, chisels, hammers, saws, water and templates.                                                                 |
| **Outputs / services**                  | Cut stone, bricks, slabs, stairs, road pieces, wall components, carved blocks and rubble or by-products.                                                |
| **Required blueprint markers**          | Stone intake, cutting benches, heavy stock bays, template point, output loading, dust or water control and safe crane or lift area where used.          |
| **Placement and utilities**             | Edge artisan or industrial parcel with heavy-cart access, noise or dust separation and stable ground.                                                   |
| **Construction profile**                | 5-7 stages: level yard; stock bays; shelter; workstations; water or dust control; loading; inspection.                                                  |
| **Upgrade and branch links**            | Stoneworks, sculpture atelier, roadworks depot, mechanised cutter through 20E or monumental works through 20F.                                          |
| **Planner triggers and failure states** | Required for sustained stone construction or equivalent imported supply. Pauses with no stone, broken tools, blocked heavy access or unsafe stockpiles. |
| **Player-blueprint validation**         | Must provide heavy-material circulation, safe work clearances and true input or output staging; decorative stone piles do not create masonry capacity.  |
| **Culture and style variation**         | Open yard, covered carving hall, dwarven stone hall, desert adobe and stone court, giant-scale cutter or rune-guided sculpting yard.                    |

### 43. Village Blacksmith

building.crafting.village_blacksmith

| **Catalogue role**                      | Crafting / Metalwork \| Village \| Medium \| Required \| POC Required                                                                                        |
|-----------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Work \| Secondary: Safety, Infrastructure                                                                                                           |
| **Purpose**                             | Provides tools, fittings, repairs and basic guard equipment, making metal progression and village maintenance visible.                                       |
| **Capacity / service**                  | Draft 1-2 smiths plus an apprentice, with one forge and anvil line; output depends on fuel, ingots, tools, recipes, ventilation and skill.                   |
| **Jobs and users**                      | Blacksmith, toolsmith, farrier, apprentice, hauler and optional guard quartermaster.                                                                         |
| **Inputs**                              | Fuel, ingots or metal stock, flux, water, tools, repair parts and known recipes.                                                                             |
| **Outputs / services**                  | Tools, nails and fittings, repair services, simple weapons and armour, horseshoes and construction components.                                               |
| **Required blueprint markers**          | Forge, anvil, quench, fuel store, metal intake, tool rack, output rack, chimney or ventilation, firebreak and service counter.                               |
| **Placement and utilities**             | Road-accessible artisan edge with fire separation, water and nearby fuel or metal logistics.                                                                 |
| **Construction profile**                | 7 stages: foundation; heat-safe shell; chimney; forge; anvil and quench; stores and output; inspection and activation.                                       |
| **Upgrade and branch links**            | Town forge, armourer or weaponsmith specialisation, foundry link through 20E or rune forge branch through 20E.                                               |
| **Planner triggers and failure states** | Required by Village stage unless trade reliably supplies tools and repairs. Pauses without a smith, fuel, metal, tools, safe ventilation or output capacity. |
| **Player-blueprint validation**         | Must include a heat-safe work triangle, ventilation, quench and protected stores. A decorative forge cannot produce metal goods or count as a smithy.        |
| **Culture and style variation**         | Open village smithy, dwarven forge hall, nomad wagon forge, volcanic forge, fae cold-forge or water-powered hammer shop.                                     |

### 44. Pottery and Kiln

building.crafting.pottery_kiln

| **Catalogue role**                      | Crafting / Ceramics \| Village \| Small-Medium \| Optional \| Alpha                                                                                           |
|-----------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Work \| Secondary: Provisions, Infrastructure                                                                                                        |
| **Purpose**                             | Turns clay and similar earth materials into vessels, tiles, bricks, storage goods and culture products.                                                       |
| **Capacity / service**                  | One kiln and several preparation stations; batch output depends on clay, fuel, drying time, skill and firing control.                                         |
| **Jobs and users**                      | Potter, kiln worker, brickmaker, decorator and apprentice.                                                                                                    |
| **Inputs**                              | Clay, temper, water, fuel, glazes or pigments, moulds and recipes.                                                                                            |
| **Outputs / services**                  | Pots, jars, pipes, tiles, bricks, crucibles, storage containers and ceramic trade goods.                                                                      |
| **Required blueprint markers**          | Clay intake, mixing and forming bench, drying racks, kiln, fuel store, cooling and output, water and fire clearance.                                          |
| **Placement and utilities**             | Near clay supply and water, with smoke or fire separation and road access for fragile goods.                                                                  |
| **Construction profile**                | 5-7 stages: yard or foundation; preparation; drying; kiln and chimney; stores; firing inspection.                                                             |
| **Upgrade and branch links**            | Brickworks, glass and ceramic complex, porcelain studio, magical kiln or industrial materials plant through 20E.                                              |
| **Planner triggers and failure states** | Selected when storage containers, tiles, brick demand or cultural trade justify it. Firing can fail with wet wares, wrong fuel, poor skill or a damaged kiln. |
| **Player-blueprint validation**         | Must include a valid kiln cycle and drying or handling path; decorative pots do not create production.                                                        |
| **Culture and style variation**         | Open pottery court, cliff kiln, subterranean ceramic hall, sun-fired adobe works, dragon-heat kiln or rune-temperature kiln.                                  |

### 45. Weaver and Tailor Workshop

building.crafting.weaver_tailor

| **Catalogue role**                      | Crafting / Textiles \| Village \| Medium \| Optional \| Alpha                                                                                                            |
|-----------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Work \| Secondary: Morale, Provisions                                                                                                                           |
| **Purpose**                             | Processes fibre and cloth into clothing, sacks, bedding, banners, sails and cultural textiles.                                                                           |
| **Capacity / service**                  | Draft 1-4 workers across spinning, weaving and sewing stations; modules may specialise while sharing one functional definition.                                          |
| **Jobs and users**                      | Spinner, weaver, tailor, dyer, embroiderer and apprentice.                                                                                                               |
| **Inputs**                              | Fibre, yarn, cloth, leather trims, dyes, needles, loom parts and patterns.                                                                                               |
| **Outputs / services**                  | Clothing basics, sacks, bedding, banners, uniforms, trade textiles and repair services.                                                                                  |
| **Required blueprint markers**          | Fibre intake, spinning, weaving or sewing stations, dye and clean area if used, pattern storage, finished-goods racks and public or service access.                      |
| **Placement and utilities**             | Artisan or residential-compatible parcel; dyeing requires water, drainage and clean or dirty separation.                                                                 |
| **Construction profile**                | 5-7 stages depending on modules; basic sewing may activate before loom or dye additions.                                                                                 |
| **Upgrade and branch links**            | Textile mill through 20E, fashion house, banner guild, sail loft or magical thread workshop.                                                                             |
| **Planner triggers and failure states** | Selected for clothing resilience, sacks and logistics, morale or culture goods, uniforms or trade. Pauses with missing fibre, tools, patterns, staff or blocked outputs. |
| **Player-blueprint validation**         | Capacity derives from actual supported stations. Player mixed-use designs must separate dyes, public shop and living routes where needed.                                |
| **Culture and style variation**         | Longhouse loom room, guild tailor, desert dye court, spider-silk atelier, living-fibre studio or rune-embroidered workshop.                                              |

### 46. Tannery and Leatherworker

building.crafting.tannery_leatherworker

| **Catalogue role**                      | Crafting / Leather \| Village \| Medium \| Optional \| Alpha                                                                                              |
|-----------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Work \| Secondary: Health, Infrastructure                                                                                                        |
| **Purpose**                             | Processes hides into leather and finished goods while explicitly managing odour, wastewater and contamination risk.                                       |
| **Capacity / service**                  | Draft 1-4 workers with dirty tanning and cleaner finishing zones; batch output depends on hides, reagents, water and time.                                |
| **Jobs and users**                      | Tanner, leatherworker, saddler, armour crafter, cleaner and apprentice.                                                                                   |
| **Inputs**                              | Hides, water, lime, tannin, salt or culture alternatives, fuel, tools and patterns.                                                                       |
| **Outputs / services**                  | Leather, straps, belts, bags, armour pieces, saddles, boots, machine belts and by-products.                                                               |
| **Required blueprint markers**          | Dirty intake, soaking and tanning vats, drying, clean finishing bench, waste and drainage, output store, ventilation and delivery route.                  |
| **Placement and utilities**             | Downstream or edge industrial parcel with drainage, odour separation, water and safe waste handling.                                                      |
| **Construction profile**                | 6-8 stages: drainage; shell; dirty vats; drying; clean workshop; stores; safety and sanitation inspection.                                                |
| **Upgrade and branch links**            | Leather guild, saddlery, armour workshop, chemical tannery through 20E or magical hide treatment.                                                         |
| **Planner triggers and failure states** | Selected when hides and leather demand justify cost. Health penalties can arise from failed drainage, contamination, overcrowded vats or poor separation. |
| **Player-blueprint validation**         | Must prove dirty-to-clean flow, water and waste treatment; a generic crafting table cannot claim tanning capacity.                                        |
| **Culture and style variation**         | Bark tannery, desert salt yard, underground fungal tannery, alchemical hideworks, beast-clan leather lodge or rune-cleansing tannery.                     |

### 47. Glassworks or Brickworks

building.crafting.glass_brick_works

| **Catalogue role**                      | Crafting / Construction Materials \| Town \| Large \| Optional \| Beta                                                                                                                               |
|-----------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Work \| Secondary: Infrastructure                                                                                                                                                           |
| **Purpose**                             | Produces high-heat construction materials such as glass, bricks, tiles and specialised blocks through one profile-selected facility family.                                                          |
| **Capacity / service**                  | Town-scale batch furnaces and forming lines; the selected profile controls inputs, temperature, hazards, outputs and required skill.                                                                 |
| **Jobs and users**                      | Glassblower, brickmaker, furnace worker, kiln specialist, quality inspector and hauler.                                                                                                              |
| **Inputs**                              | Sand or clay, fuel or power, flux and additives, moulds, water, tools and recipes.                                                                                                                   |
| **Outputs / services**                  | Glass panes, bottles, lenses, bricks, tiles, glazed blocks and trade goods.                                                                                                                          |
| **Required blueprint markers**          | Material intake, furnace or kiln, hot work zone, forming or moulding, cooling or annealing, fuel or power, output storage, ventilation and fire safety.                                              |
| **Placement and utilities**             | Industrial edge with heavy logistics, high-heat separation, water and emissions or waste controls.                                                                                                   |
| **Construction profile**                | 7-9 stages; furnace commissioning and safety inspection precede production.                                                                                                                          |
| **Upgrade and branch links**            | Industrial materials plant through 20E, crystal glassworks, enchanted lensworks or regional brick complex.                                                                                           |
| **Planner triggers and failure states** | Selected when urban construction, windows, laboratories, bottles or trade justify it. Can be disabled by fuel shortage, a damaged furnace, unsafe heat, no specialist or blocked cooling and output. |
| **Player-blueprint validation**         | Player blueprint must select a supported production profile and include the complete heat and handling path; one structure may contain both only if capacity and safety are validated separately.    |
| **Culture and style variation**         | Roman-style glasshouse, desert sun glassworks, dwarven furnace hall, volcanic brickworks, crystal blower or mana-flame kiln.                                                                         |

# 19. Trade and Professional-Service Entries

### 51. Market Stalls

building.trade.market_stalls

| **Catalogue role**                      | Trade / Local Market \| Village \| Cluster \| Optional \| POC Required                                                                                                          |
|-----------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Work \| Secondary: Morale, Provisions                                                                                                                                  |
| **Purpose**                             | Creates flexible vendor slots for local exchange, rotating markets and temporary commerce without inventing infinite stock.                                                     |
| **Capacity / service**                  | Draft 2-8 vendor slots plus public circulation; active capacity depends on assigned merchants, stock, schedule and accessible storage.                                          |
| **Jobs and users**                      | Vendor, merchant, farmer or crafter sellers, market keeper, guard and hauler during market periods.                                                                             |
| **Inputs**                              | Actual sale stock, stall fees or permissions, containers, signage and optional event supplies.                                                                                  |
| **Outputs / services**                  | Local trade access, price discovery, item exchange, temporary jobs, social activity and request generation.                                                                     |
| **Required blueprint markers**          | Vendor slots, counters or display, customer standing, market storage and drop-off, road or public-space sockets, signage and emergency circulation.                             |
| **Placement and utilities**             | Village centre, square or festival ground with foot traffic and no blocked road access.                                                                                         |
| **Construction profile**                | 3 stages: public-space preparation; stall frames and counters; permissions and market activation. Individual stalls can be added modularly.                                     |
| **Upgrade and branch links**            | Covered market hall, specialised market district, auction square or culture-specific bazaar.                                                                                    |
| **Planner triggers and failure states** | Selected when local surplus, shortages, population or visitor demand justify trade. Empty stalls provide no stock; theft, weather, blocked routes or no vendors reduce service. |
| **Player-blueprint validation**         | Vendor capacity comes from reachable marked stalls and real stock access. Decorative kiosks cannot create merchants or goods.                                                   |
| **Culture and style variation**         | Open weekly market, covered bazaar, floating stalls, underground trade court, fae barter circle or caravan pop-up market.                                                       |

### 52. Trading Post

building.trade.trading_post

| **Catalogue role**                      | Trade / Regional Exchange \| Village \| Medium \| Optional \| POC Required                                                                                                  |
|-----------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Infrastructure \| Secondary: Work, Provisions                                                                                                                      |
| **Purpose**                             | Handles imports, exports, contracts, caravan loading and reputation-based regional trade between the settlement and outside partners.                                       |
| **Capacity / service**                  | Draft one trade counter, contract board, secure stock room and loading bay; route slots determine simultaneous trade links.                                                 |
| **Jobs and users**                      | Merchant, trade clerk, quartermaster, hauler, guard and interpreter where relevant.                                                                                         |
| **Inputs**                              | Actual export stock, currency or barter goods, contracts, route access, storage space and permissions.                                                                      |
| **Outputs / services**                  | Imports, sales revenue, contracts, trade reputation, caravan visits, price information and shortage relief.                                                                 |
| **Required blueprint markers**          | Public counter, contract or request board, secure trade store, loading and unloading socket, ledger, merchant work point, road or caravan connection and guard point.       |
| **Placement and utilities**             | Settlement edge or main road with strong warehouse access, turning and loading space and controlled public entry.                                                           |
| **Construction profile**                | 6 stages: foundation; shell; counter and office; secure store; loading bay; ledger and route activation.                                                                    |
| **Upgrade and branch links**            | Covered market, caravanserai, merchant exchange, customs facility through 20C or 20D, or portal trade station through 20E.                                                  |
| **Planner triggers and failure states** | Selected when a viable route, surplus, shortage or diplomatic opportunity exists. Pauses when routes are unsafe, stock unavailable, permissions revoked or storage blocked. |
| **Player-blueprint validation**         | Must connect to a real road or route and physical stock. Player designs cannot create off-map trade without an approved route profile and ownership controls.               |
| **Culture and style variation**         | Frontier post, caravan lodge, river trade house, subterranean trade gate, fae exchange grove or dimensional embassy market.                                                 |

### 53. Covered Market or Market Hall

building.trade.covered_market_hall

| **Catalogue role**                      | Trade / Urban Market \| Town \| Large \| Optional \| Beta                                                                                                                            |
|-----------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Work \| Secondary: Infrastructure, Morale                                                                                                                                   |
| **Purpose**                             | Provides dense permanent commerce, specialist vendors, protected public circulation and market administration at town scale.                                                         |
| **Capacity / service**                  | Multiple permanent and rotating vendor bays, central storage links and large visitor throughput; exact capacity comes from validated stalls and routes.                              |
| **Jobs and users**                      | Market master, merchants, vendors, porters, clerks, cleaners and guards.                                                                                                             |
| **Inputs**                              | Vendor stock, leases or fees, utilities, cleaning, security, storage and logistics.                                                                                                  |
| **Outputs / services**                  | Specialist trade, market taxes or fees, visitor attraction, price visibility, contracts and urban morale.                                                                            |
| **Required blueprint markers**          | Vendor bays, public aisles, loading or service route, storage sockets, market office, sanitation, exits, signage and optional auction or event space.                                |
| **Placement and utilities**             | High-centrality town parcel or market district with road, transit, warehouse and emergency access.                                                                                   |
| **Construction profile**                | 7-9 stages; the public shell and some stalls can open before full specialist wings.                                                                                                  |
| **Upgrade and branch links**            | Grand market, trade district, auction house, regional exchange or culture-specific bazaar complex through 20F or 20G.                                                                |
| **Planner triggers and failure states** | Selected when stall congestion, trade volume and town population justify a permanent hall. Service degrades with empty vendors, poor logistics, crime, sanitation or blocked access. |
| **Player-blueprint validation**         | Must meet crowd-flow, loading, vendor and storage requirements. Empty decorative arcades do not provide market capacity.                                                             |
| **Culture and style variation**         | Timber market hall, stone bazaar, canal market, underground trade cavern, living canopy market or portal-linked exchange.                                                            |

### 54. Caravanserai or Coach Inn

building.trade.caravanserai_coach_inn

| **Catalogue role**                      | Trade / Route Support \| Town \| Large Complex \| Conditional \| Beta                                                                          |
|-----------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Infrastructure \| Secondary: Morale, Work                                                                                             |
| **Purpose**                             | Supports long-distance caravans, coaches or pack animals through secure lodging, yards, storage, repairs and route information.                |
| **Capacity / service**                  | One or more caravan groups based on yard, guest beds, animal stalls and loading bays; not required for settlements without overland trade.     |
| **Jobs and users**                      | Innkeeper, stablehand, caravan master, cook, guard, mechanic or cartwright and clerk.                                                          |
| **Inputs**                              | Food, feed, water, bedding, repair parts, fuel, guest supplies and secure storage.                                                             |
| **Outputs / services**                  | Safer trade routes, visitor lodging, animal support, caravan turnaround, rumours, contracts and regional commerce.                             |
| **Required blueprint markers**          | Controlled gate, caravan yard, loading bays, animal stalls, guest beds, kitchen or service, secure store, repair point and road route sockets. |
| **Placement and utilities**             | Town edge or major junction with turning space, warehouse access, water and security.                                                          |
| **Construction profile**                | 8-10 stages often split into yard and gate, stable, inn, storage and repair subprojects.                                                       |
| **Upgrade and branch links**            | Regional caravan hub, freight depot through 20D, merchant enclave or portal logistics centre through 20E.                                      |
| **Planner triggers and failure states** | Eligible only on active caravan or coach routes. Demand falls if routes shift; raids, disease, feed shortages or no secure storage reduce use. |
| **Player-blueprint validation**         | Must prove large-vehicle or animal access, guest and cargo separation, secure circulation and route connection.                                |
| **Culture and style variation**         | Walled desert caravanserai, forest coaching inn, mountain mule lodge, river barge rest, air-caravan dock or realm-traveller court.             |

### 55. Merchant Guild or Trade Exchange

building.trade.merchant_exchange

| **Catalogue role**                      | Trade / Finance and Coordination \| City \| Large \| Optional \| Beta                                                                                                            |
|-----------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Work \| Secondary: Infrastructure, Morale                                                                                                                               |
| **Purpose**                             | Coordinates regional contracts, merchant membership, trade information, finance, dispute handling and large-volume exchange.                                                     |
| **Capacity / service**                  | City-level clerks, meeting rooms, contract desks and secure records; affects the number and quality of trade contracts rather than directly producing goods.                     |
| **Jobs and users**                      | Guild master, merchant, broker, clerk, accountant, appraiser, translator and guard.                                                                                              |
| **Inputs**                              | Records, fees, currency or credit backing, market data, secure communications and member stock guarantees.                                                                       |
| **Outputs / services**                  | Advanced contracts, trade coordination, financing, reputation, price intelligence, merchant politics and regional influence.                                                     |
| **Required blueprint markers**          | Public exchange floor, contract desks, meeting rooms, secure archive or ledger, treasury or deposit point, communications and guarded access.                                    |
| **Placement and utilities**             | Central commercial district near market, bank or treasury, administration and regional transport.                                                                                |
| **Construction profile**                | 8-10 stages with secure records and authority commissioning before advanced contracts unlock.                                                                                    |
| **Upgrade and branch links**            | Grand exchange, national trade ministry, interrealm commerce council or culture and faction merchant palace through 20F or 20G.                                                  |
| **Planner triggers and failure states** | Selected when city trade volume, routes and merchant population justify coordination. Corruption, insolvency, war or broken communications can reduce trust and contract access. |
| **Player-blueprint validation**         | Must include secure records and contract service; decorative grand halls do not generate finance or regional trade capacity.                                                     |
| **Culture and style variation**         | Guild exchange, counting house, clan merchant council, floating auction hall, subterranean gem exchange or portal trade senate.                                                  |

### 60. Guild Hall or Professional Lodge

building.professional.guild_hall

| **Catalogue role**                      | Professional / Organisation \| Town \| Medium-Large \| Optional \| Beta                                                                                                                      |
|-----------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Work \| Secondary: Infrastructure, Morale                                                                                                                                           |
| **Purpose**                             | Organises a recognised profession through contracts, training, standards, membership, representation and specialist identity.                                                                |
| **Capacity / service**                  | One profession or compatible group profile with meeting, office, training and contract capacity; it coordinates rather than replaces actual workplaces.                                      |
| **Jobs and users**                      | Guild master, clerk, trainer, inspectors, members and contract officer.                                                                                                                      |
| **Inputs**                              | Membership fees or support, records, tools and materials for training, meeting supplies and linked profession data.                                                                          |
| **Outputs / services**                  | Professional contracts, training, quality standards, specialist recruitment, dispute support, reputation and culture or faction identity.                                                    |
| **Required blueprint markers**          | Guild office, contract board, meeting hall, records, training or demonstration point, secure member storage and public entrance.                                                             |
| **Placement and utilities**             | Near the relevant district or civic centre with access to member workplaces and market or governance routes.                                                                                 |
| **Construction profile**                | 6-8 stages; a basic contract office can activate before the ceremonial hall or expanded training rooms.                                                                                      |
| **Upgrade and branch links**            | Grand guild, professional college, faction order, regional standards office or specialist headquarters through 20F or 20G.                                                                   |
| **Planner triggers and failure states** | Selected when enough workers and contracts exist to justify organisation. Empty membership or no linked profession provides little benefit; political conflict can split or suppress guilds. |
| **Player-blueprint validation**         | Must select a recognised profession profile and connect to real workers or workplaces; a generic meeting room cannot grant all guild benefits at once.                                       |
| **Culture and style variation**         | Craft guild hall, clan lodge, merchant fraternity, ranger lodge, mage order, underground union hall or floating professional conclave.                                                       |

# 20. Education and Knowledge Entries

### 56. Small School

building.education.small_school

| **Catalogue role**                      | Education / Basic Learning \| Village \| Small \| Optional \| POC Required                                                                                                                               |
|-----------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Work \| Secondary: Morale                                                                                                                                                                       |
| **Purpose**                             | Provides basic literacy, numeracy, settlement knowledge and supervised learning for children or adults without creating a separate Education need bar.                                                   |
| **Capacity / service**                  | Draft one teacher and 6-20 learners based on classroom markers; attendance uses schedules and household or work rules.                                                                                   |
| **Jobs and users**                      | Teacher, scribe, elder, visiting specialist and optional assistant.                                                                                                                                      |
| **Inputs**                              | Teaching materials, books or slates, fuel or light, maintenance and curriculum or knowledge access.                                                                                                      |
| **Outputs / services**                  | Basic education coverage, literacy, improved apprenticeship readiness, record use, morale and limited knowledge unlocks.                                                                                 |
| **Required blueprint markers**          | Teaching point, learner seating, storage, board or library point, safe exits, light or heat and optional outdoor lesson space.                                                                           |
| **Placement and utilities**             | Accessible residential or civic area with safe routes and manageable noise.                                                                                                                              |
| **Construction profile**                | 5 stages: foundation; shell; classroom; teaching and storage furnishings; staffing and curriculum activation.                                                                                            |
| **Upgrade and branch links**            | Trade school, library or archive, academy campus through 20F or culture-specific learning house.                                                                                                         |
| **Planner triggers and failure states** | Selected when population, children, literacy needs, specialist succession or culture priorities justify it. No teacher or materials means no active service, though the room can host community lessons. |
| **Player-blueprint validation**         | Capacity comes from reachable teaching and learner markers. Player designs may be a schoolhouse, tutor lodge or outdoor learning grove if the profile is satisfied.                                      |
| **Culture and style variation**         | One-room school, clan teaching hall, monastery class, apprenticeship courtyard, oral-tradition fire circle or rune-learning chamber.                                                                     |

### 57. Apprentice or Trade School

building.education.trade_school

| **Catalogue role**                      | Education / Vocational Training \| Village \| Medium \| Optional \| Alpha                                                                                                      |
|-----------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Work \| Secondary: Morale                                                                                                                                             |
| **Purpose**                             | Trains apprentices and converts experienced workers into a sustainable specialist pipeline for settlement jobs.                                                                |
| **Capacity / service**                  | One or more training bays and draft 4-16 learners; capacity and available courses depend on instructors, linked workshops, tools and curriculum.                               |
| **Jobs and users**                      | Master craftsperson, instructor, apprentice coordinator, scribe and visiting specialist.                                                                                       |
| **Inputs**                              | Training tools, practice materials, books or patterns, instructor time, linked workplace access and maintenance.                                                               |
| **Outputs / services**                  | Apprentices, skill progression, replacement specialists, reduced hiring dependency and unlocked vocational recipes.                                                            |
| **Required blueprint markers**          | Instruction point, learner stations, practice work areas, tool and material store, records, safety zones and optional sockets to partner workshops.                            |
| **Placement and utilities**             | Near the artisan district and participating workshops with safe learner routes.                                                                                                |
| **Construction profile**                | 6-8 stages; classroom service may activate before all specialist training bays.                                                                                                |
| **Upgrade and branch links**            | Guild academy, engineering school, military school through 20C, magical academy through 20E or 20F, or university through 20F.                                                 |
| **Planner triggers and failure states** | Selected when missing specialists, an aging workforce, unemployment or growth creates succession demand. Training slows without masters, tools, practice stock or linked jobs. |
| **Player-blueprint validation**         | Must specify supported training profiles and safe learner workstations; seating alone does not generate skilled workers.                                                       |
| **Culture and style variation**         | Apprentice guild, master-and-student yard, clan craft school, mobile caravan school, memory-teaching hall or golem-assisted training lab.                                      |

### 58. Library or Archive

building.education.library_archive

| **Catalogue role**                      | Education / Knowledge \| Town \| Large \| Optional \| Beta                                                                                                             |
|-----------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Morale \| Secondary: Work, Infrastructure                                                                                                                     |
| **Purpose**                             | Stores books, maps, records, recipes, settlement history and research references as physical knowledge rather than a passive global unlock list.                       |
| **Capacity / service**                  | Collection capacity, reading or research seats and secure archive sections; service depends on staff, preserved records, access and relevant knowledge items.          |
| **Jobs and users**                      | Librarian, archivist, scribe, historian, researcher, cartographer and guard for restricted collections.                                                                |
| **Inputs**                              | Books, maps, records, ink and paper, maintenance, climate or fire protection and cataloguing labour.                                                                   |
| **Outputs / services**                  | Knowledge access, recipe and research support, historical continuity, map information, education service and story progression.                                        |
| **Required blueprint markers**          | Public stacks, reading or research points, catalogue desk, secure archive, map or record storage, fire and climate protection and accessibility.                       |
| **Placement and utilities**             | Civic or education district with a safe, dry, low-risk environment and strong fire or security protection.                                                             |
| **Construction profile**                | 7-9 stages; public reading service can open before the secure archive or specialist wings.                                                                             |
| **Upgrade and branch links**            | Grand library, university library, restricted archive, magical memory hall through 20E or capital knowledge complex through 20F.                                       |
| **Planner triggers and failure states** | Selected when knowledge stock, research, literacy and town governance justify it. Fire, moisture, theft, corruption or absent staff can damage access and collections. |
| **Player-blueprint validation**         | Must store actual knowledge records or items and provide controlled access; decorative shelves alone do not unlock recipes.                                            |
| **Culture and style variation**         | Scriptorium, oral-history hall, crystal memory archive, living library, stone rune archive, dream library or subterranean map vault.                                   |

# 21. POC Implementation Scope

The 20B POC roster contains eight definitions. They prove a complete but small resource-to-work-to-trade-to-training loop rather than eight isolated buildings.

| **No.** | **POC Definition** | **Minimum Proof**                                                                                |
|---------|--------------------|--------------------------------------------------------------------------------------------------|
| 31      | Lumber Camp        | Binds to a real forestry zone; workers cut and stage actual logs.                                |
| 35      | Mine Entrance      | Connects to a safe mine route; miners return real stone or ore to staging.                       |
| 41      | Carpenter Workshop | Consumes timber components and produces project parts or repairs.                                |
| 42      | Mason Yard         | Consumes rough stone and produces shaped construction stock.                                     |
| 43      | Village Blacksmith | Consumes fuel and metal; produces or repairs tools and guard supply.                             |
| 51      | Market Stalls      | Assigned vendors sell actual local stock through public stalls.                                  |
| 52      | Trading Post       | Imports and exports physical stock through one approved route and ledger.                        |
| 56      | Small School       | Teacher and learners use a validated classroom; basic education and apprentice readiness update. |

14. Player or NPC gathers initial timber and ore or stone manually.

15. The village establishes Lumber Camp and Mine Entrance project sites.

16. Outputs enter staging and then the Village Warehouse through 20D hauling.

17. Carpenter, Mason and Blacksmith consume exact stock to produce building components, repairs and guard tools.

18. Market Stalls expose local surplus; the Trading Post exchanges approved exports for shortages.

19. The Small School provides basic learning and prepares a future apprentice pipeline.

20. The settlement Work overview shows functioning sites, blockers, open jobs, specialist gaps and trends.

21. All state survives save and load and distant simulation without duplicating or losing important resources.

# 22. Balancing and Simulation LOD

| **Range or Frequency** | **Simulation Direction**                                                                                                       |
|------------------------|--------------------------------------------------------------------------------------------------------------------------------|
| Immediate local        | Worker movement, animation, workstation use, visible item carrying, hazards and interaction.                                   |
| Local slow tick        | Job selection, tool checks, input and output reservations, production progress, class attendance and market schedules.         |
| Settlement summary     | Hourly or daily Work state, bottlenecks, stock targets, trade arrivals, training progress and maintenance.                     |
| Distant settlement     | Bounded daily extraction, production, trade and training transactions using persistent workers, tools, routes, stock and risk. |
| Regional event         | Caravan loss, mine incident, guild dispute, discovery, market boom, teacher migration or route closure as recorded events.     |

| **Balance Rule**                                | **Direction**                                                                                                           |
|-------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------|
| No mandatory optimisation                       | A settlement can remain modest and functional without every workshop or maximum throughput.                             |
| Multiple solutions                              | Shortages may be solved by local production, trade, player delivery, substitution, automation, magic or reduced demand. |
| Old materials stay useful                       | Wood, stone, clay, leather, cloth and basic metals remain important for repairs, projects, tools and culture goods.     |
| Specialists matter but do not hard-lock forever | Training, migration, visiting workers, trade services and player actions provide recovery paths.                        |
| Danger creates response, not random punishment  | Hazards are signalled and linked to safety design, maintenance, laws and worker skill.                                  |
| Throughput is readable                          | Use items per cycle or day and clear buffers rather than hidden production multipliers.                                 |
| Distant abstraction conserves state             | Summary ticks cannot create more output than workers, zones, inputs and routes allow.                                   |

# 23. Open Questions for Later Balancing

- Final worker-to-building capacity bands and how shifts are represented at Town and City scale.

- Exact resource regeneration, depletion and environmental-consequence settings for forestry, quarries and mines.

- Whether wages and private-business ownership are universal, culture-specific, optional or deferred to a dedicated economy document.

- How much price simulation is shown to players and how frequently markets update.

- Final apprenticeship duration, instructor load and age or world-setting rules for children and adult learners.

- How many quality tiers common construction outputs should use without bloating inventories.

- How guild politics, labour conflict, monopolies and criminal trade integrate with later governance and faction systems.

- Which production chains belong in the initial Godot POC versus later Alpha content.

# Appendix A. 20B Data Field Template

| **Field Group**   | **Recommended Fields**                                                                                                             |
|-------------------|------------------------------------------------------------------------------------------------------------------------------------|
| Identity          | building_id, family_id, display_name_key, category, subtype_profile, catalogue_number, owner_document, tags.                       |
| Stage and planner | minimum_stage, project_class, planner_tags, conditions, opportunity_tags, shortage_tags, redundancy_group, priority_bias.          |
| Needs             | primary_need, secondary_needs, work_capacity, infrastructure_dependency, safety and health modifiers, morale modifiers.            |
| Jobs              | job_profiles, minimum_staff, target_staff, maximum_staff, skill_tags, instructor profiles, learner_slots, succession_role.         |
| Workstations      | required_marker_types, station_profile_ids, tool_tags, tool_slots, utility_requirements, safety_clearances.                        |
| Resources         | resource_zone_profile, input_tags, input_buffer, output_ids or tags, output_buffer, by_products, waste_profile, quality_rules.     |
| Production        | recipe_categories, batch_policy, cycle_timing, throughput_band, maintenance, failure_states, pause_rules, order_priorities.        |
| Trade             | vendor_slots, route_slots, stock_ownership_modes, contract_capacity, loading_sockets, price_modifiers, permissions.                |
| Knowledge         | curriculum_ids, knowledge_collections, teacher_requirements, training_profiles, access_permissions, research_modifiers.            |
| Blueprint         | size_class, terrain_rules, required_rooms or markers, route_sockets, public and service separation, hazard_zones, upgrade_sockets. |
| Runtime           | condition, staffing, active_task, work_in_progress, buffers, tools, maintenance, safety, ownership, last_transaction, history.     |
| Production status | scope_status, design_status, data_status, blueprint_status, implementation_status, balance_status, culture_coverage.               |

# Appendix B. Production and Knowledge Chain Matrix

| **Source or Input**   | **20B Facility**                              | **Output or Service**                         | **Primary Destination**                       |
|-----------------------|-----------------------------------------------|-----------------------------------------------|-----------------------------------------------|
| Trees and logs        | Lumber Camp -\> Sawmill                       | Logs -\> planks, beams and sawdust            | Carpenter, projects, warehouse and trade.     |
| Stone face            | Quarry -\> Mason Yard                         | Rough stone -\> shaped blocks and road pieces | Buildings, roads, walls and repairs.          |
| Clay or sand          | Clay or Sand Works -\> Pottery or Glass-Brick | Clay or sand -\> vessels, bricks and glass    | Storage, construction, food, magic and trade. |
| Mine headings         | Mine Entrance -\> Ore Sorting                 | Ore and stone -\> graded batches              | Blacksmith, furnaces, trade and 20E industry. |
| Wood biomass          | Charcoal Yard                                 | Wood -\> charcoal and ash                     | Homes, kitchens, kilns, smithy and trade.     |
| Fibre or cloth        | Weaver and Tailor                             | Textiles -\> clothing, sacks and banners      | Provisions, logistics, morale and trade.      |
| Hides                 | Tannery and Leatherworker                     | Hides -\> leather goods                       | Tools, armour, belts, bags and trade.         |
| Local surplus         | Market Stalls                                 | Physical stock -\> local exchange             | Households, visitors and artisans.            |
| Regional route        | Trading Post or Caravanserai                  | Imports, exports and contracts                | Warehouse, projects and specialists.          |
| Teacher and materials | Small School or Trade School                  | Education and apprentices                     | Workforce and succession.                     |
| Books and records     | Library or Archive                            | Knowledge access and history                  | Research, recipes, governance and story.      |
| Profession members    | Guild Hall                                    | Contracts, standards and training             | Workplaces, trade and reputation.             |

# Appendix C. POC Acceptance Checklist

- Eight POC definitions have stable data records and at least one validated voxel blueprint or cluster layout.

- Lumber Camp and Mine Entrance bind to real world resource zones and cannot output when those zones are unavailable.

- Carpenter, Mason and Blacksmith require actual workers, tools, inputs, output capacity and safe access.

- Production transactions conserve items across work-in-progress, outputs, by-products, save and load and distant simulation.

- Market Stalls and Trading Post expose real stock and ownership; no infinite merchant inventory is used.

- Small School validates teacher and learner markers and updates basic education or apprentice readiness through scheduled or summary use.

- Settlement Work overview shows state, trend, top blockers and suggested responses without adding new need bars.

- Player-made alternative blueprints can be created in both editing modes and accepted after the same functional validation.

- NPC planners can select, reserve, build, commission, staff, pause, repair and resume the facilities.

- The integrated chain can contribute real materials to the watchtower and village-growth scenario.

# Appendix D. Cross-System Dependency Matrix

| **System**                | **20B Sends**                                                                        | **20B Receives**                                                                     |
|---------------------------|--------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------|
| NPC Village               | Jobs, workplace capacity, training, trade service, blockers and events.              | Workers, skills, schedules, priorities, reputation, laws and settlement needs.       |
| Items and Recipes         | Station context, buffers, workers, tools, quality modifiers and orders.              | Item definitions, recipes, inputs, outputs, by-products, unlocks and durability.     |
| Resources and Worldgen    | Bound extraction activity, depletion, risk and surface evidence.                     | Deposits, tree zones, geology, grades, regeneration, terrain and ownership.          |
| Storage and Logistics 20D | Input and output reservations, loading requests, market deliveries and route demand. | Warehouses, roads, carts, storage categories, permissions and blocked routes.        |
| Safety and Governance 20C | Hazards, crowd pressure, theft opportunity, work disputes and emergency needs.       | Guards, laws, permits, fire response, inspections and restricted access.             |
| Automation and Magic 20E  | Base facilities, resource demand and upgrade sockets.                                | Power, machines, mana, automated inputs and outputs, advanced industry and safety.   |
| Districts 20F             | Parcel requirements, service radius, workforce and traffic demand.                   | Campus and district plans, city-scale complexes and academy or university ownership. |
| Culture and Factions 20G  | Universal function profiles and allowed substitution points.                         | Style kits, preferred trades, unique recipes, signature guilds and laws.             |
| UI, Saves and Godot       | Operational states, causes, transactions, history and stable IDs.                    | Commands, validated persistence, view models, imports and migration support.         |
