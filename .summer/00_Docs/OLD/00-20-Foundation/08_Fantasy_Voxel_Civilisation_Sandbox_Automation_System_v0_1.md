**Fantasy Voxel Civilisation Sandbox**

**08 - Automation System**

*Version 0.1 - Detailed Design Bible Draft*

A database-ready automation system for mechanical machines, magical infrastructure, logistics, power, village supply, NPC labour, golems, risk, UI, simulation LOD, and proof-of-concept factory-to-village progression.

| **Field**             | **Locked Direction**                                                                                                                                                                                                                             |
|-----------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Document Scope        | Full design-bible document covering automation identity, progression, power, transport, storage, machines, village warehouse supply, NPC labour, golems, magic integration, risk, UI, performance, data fields, POC scope, and registry entries. |
| Core Philosophy       | Automation is not only an efficiency layer. It is a civilisation supply system where machines, magic, villages, NPC labour, defence, story, and world consequences connect.                                                                      |
| Progression Direction | Automation begins at Copper tier, starts mechanical, expands into stronger industry, gains magical support, becomes hybrid magitech, then reaches golems, leylines, portal logistics, and civilisation-scale systems.                            |
| POC Direction         | The proof-of-concept proves Miner -\> transport -\> furnace or mana furnace -\> storage -\> village warehouse -\> watchtower project, with the raid outcome changed by preparation.                                                              |
| Data Direction        | Use database/spreadsheet-ready IDs, categories, tiers, tags, component roles, power requirements, throughput values, ports, permissions, simulation rules, and planning status.                                                                  |
| Performance Direction | Use a hybrid simulation model: detailed visible item flow near the player, network summaries and abstract resource ticks at distance.                                                                                                            |

# Document Purpose

This document defines how automation works across the Fantasy Voxel Civilisation Sandbox. It turns the high-level promise of fantasy factories that build civilisations into concrete gameplay rules: how machines are unlocked, how power moves, how items are transported, how warehouses accept supply, how villages consume automated inputs, how NPC labour and golems interact with production, how mana systems expand machinery, how risk and maintenance create consequences, and how the proof-of-concept should prove the core hook.

This document does not replace the Blocks Registry, Items Registry, Crafting and Recipe Registry, Resource Progression document, NPC Village System, Magic System, Economy System, Combat and Defence System, or future Player Settlement System. Instead, it creates the automation-facing rules those systems must support.

| **Numbering Note**                                                                                                                                                                                                                                                                                                       |
|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| This branch uses the title 08 - Automation System because that is the current working document requested for this stage. Earlier planning may have placed automation in a slightly different order. The master index can be cleaned later, but this document should remain the active Automation System source of truth. |

## Design Source

| **Source Document**               | **Relevant Direction**                                                                                                                                                                               | **How This Automation Document Uses It**                                                                                                                      |
|-----------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 00 - Master Game Design Bible     | The core hook is that magic and factories build civilisations, unlock stories, power settlements, and reshape the world.                                                                             | Automation is treated as a civilisation system rather than a pure factory efficiency system.                                                                  |
| 01 - Core Gameplay Loop           | The primary loop includes automate, defend, upgrade, and expand. The POC loop is gather -\> automate -\> supply village -\> village consumes resources -\> village grows -\> threat outcome changes. | The POC chain and player-facing loop are built around resource flow into a village project and changed raid outcome.                                          |
| 02 - Player Progression System    | Progression is multi-track across materials, skills, recipes, magic, automation, villages, reputation, exploration, dimensions, and morality.                                                        | Automation unlocks through Copper, then iron, mana, steel, magitech, golems, leylines, and dimension systems without replacing other progression paths.       |
| 03 - Blocks Registry              | Blocks include machine blocks, logistics blocks, power blocks, magic infrastructure, storage blocks, warehouses, damage states, and data-driven parent definitions.                                  | Automation objects are physical blocks with ports, states, damage, ownership, tags, and machine families.                                                     |
| 04 - Items Registry               | Items include machine parts, magic components, tools, village goods, fuel, repair materials, and block item forms.                                                                                   | Automation is built from visible components such as frames, gears, plates, belts, pipes, coils, batteries, filters, and cores.                                |
| 05 - Crafting and Recipe Registry | Machine and automation recipes use time, throughput, power type, batch size, input/output slots, by-products, and automation compatibility.                                                          | Automation entries reference recipe fields and define how machines process, batch, pause, fail, or output resources.                                          |
| 06 - Resource Progression         | Automation starts at Copper; early automation is mechanical; mana fuels magic machines; leylines are late-game; by-products and consequences exist.                                                  | The automation ladder uses copper mechanisms, iron settlement support, mana infrastructure, steel industry, arcane alloy magitech, and later realm materials. |
| 07 - NPC Village System           | Village warehouses accept automated input after trust/permission; projects reserve resources; the POC village uses a staged watchtower and goblin raid outcome.                                      | Village supply, permissions, ledger tracking, project reserves, NPC labour, repairs, and raid targeting are core automation requirements.                     |

# Static Table of Contents

- 1\. Locked Automation System Identity

- 2\. Player Answer Decision Summary

- 3\. Automation System Architecture

- 4\. Parent Automation Data Model

- 5\. Automation Categories, Families, and Tags

- 6\. Automation Progression Ladder

- 7\. Power and Energy System

- 8\. Transport and Logistics System

- 9\. Storage, Warehouses, and Village Supply

- 10\. Machines and Production

- 11\. Automation Recipes and Machine Assembly

- 12\. NPC Labour, Jobs, and Golems

- 13\. Magic, Mana, and Magitech Automation

- 14\. Risk, Maintenance, and Consequences

- 15\. UI, Feedback, Tutorial, and Overlays

- 16\. Simulation LOD, Performance, and Multiplayer

- 17\. Proof-of-Concept Automation Scope

- 18\. Detailed Automation Registry v0.1

- 19\. Core POC Scenario: Forest Hamlet Supply Chain

- 20\. Balancing Rules

- 21\. Open Questions for Later Documents

- Appendix A. POC Automation Checklist

- Appendix B. Automation Database Field Template

- Appendix C. Cross-System Use Matrix

- Appendix D. Future Automation Family Backlog

- Appendix E. POC Success Criteria

# 1. Locked Automation System Identity

The Automation System is the scaling layer of the game. It lets the player reduce repetitive labour, build supply chains, feed villages, power magical infrastructure, support defence, enable settlement growth, and eventually shape whole regions. It must still feel physical and readable inside a voxel world: machines are blocks, items move through visible paths, power has infrastructure, and villages consume real stored resources.

| **Locked Rule**                                                                                                                                                                                                                |
|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Automation should support the living world rather than replace it. A machine should answer at least one gameplay question: what does it gather, move, transform, power, supply, protect, unlock, risk, or change in the world? |

| **Identity Layer**           | **Design Meaning**                                                                                                           | **Player-Facing Result**                                                                            |
|------------------------------|------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------|
| Scaling Labour               | Machines, logistics, and power reduce repetitive gathering and processing.                                                   | The player can move from hand mining and smelting to settlement-scale supply chains.                |
| Civilisation Supply          | Automated outputs can feed village warehouses, construction projects, guard supplies, food stores, repairs, and trade goods. | Factories visibly grow villages, change raids, stabilise shortages, and unlock new social progress. |
| Physical Infrastructure      | Automation exists as placeable blocks with power, ports, states, damage, ownership, and visual item flow.                    | The world looks like it is being industrialised or magically engineered by the player.              |
| Magic Technology             | Mana, runes, conduits, wards, batteries, mana furnaces, and magitech machines expand automation into fantasy systems.        | Magic becomes practical infrastructure instead of only combat spells.                               |
| NPC Collaboration            | Automation supports NPC jobs, reduces hauling bottlenecks, creates specialist roles, and can work with golems.               | Villages feel more capable without turning NPCs into irrelevant decorations.                        |
| Risk and Consequence         | Overload, raids, sabotage, corruption, waste, pollution, forbidden labour, and faction concern create stakes.                | Automation is powerful but can change the world socially, politically, and environmentally.         |
| Performance-Aware Simulation | Nearby systems show detailed item movement; distant systems simulate through network totals and summaries.                   | The world can be large without requiring impossible performance budgets.                            |

## 1.1 Automation Design Promise

The player should be able to look at a supply line and understand what it is doing: where resources enter, where power comes from, where items are blocked, who owns the output, which village or project is consuming it, and what will happen if it fails. The system can become deep, but the early version must stay readable.

## 1.2 What Automation Is Not

- It is not a pure factory game where efficiency is the only goal.

- It is not a hidden background modifier that produces numbers with no world presence.

- It is not a complete replacement for NPC labour, survival, exploration, magic, or trading.

- It is not a punishment system where machines constantly break for no reason.

- It is not a POC requirement to build every late-game feature such as golems, portals, leylines, or region-scale logistics.

# 2. Player Answer Decision Summary

The following table converts the selected multiple-choice answers into locked automation-system decisions. These decisions should guide the first full draft, the proof-of-concept, and later detailed implementation documents.

| **Q** | **Area**                    | **Locked Decision**                                                                                                                                                    |
|-------|-----------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 1     | Numbering                   | Keep this branch as 08 - Automation System.                                                                                                                            |
| 2     | Core Identity               | Automation is a fantasy civilisation supply system where machines, magic, villages, and story connect.                                                                 |
| 3     | Depth                       | Use Satisfactory-lite depth adapted for voxel survival and villages.                                                                                                   |
| 4     | POC Proof                   | Prove miner -\> transport -\> furnace/mana furnace -\> village warehouse -\> watchtower project.                                                                       |
| 5     | Unlock Timing               | Automation first unlocks after copper mechanisms.                                                                                                                      |
| 6     | Ladder                      | Use manual -\> medieval mechanisms -\> early industry -\> industrial fantasy -\> arcane machinery -\> golems -\> dimensional logistics -\> civilisation-scale systems. |
| 7     | Mechanical Relevance        | Mechanical automation remains useful late-game as cheap, stable, non-magical infrastructure.                                                                           |
| 8     | Copper Identity             | Copper provides early wires, gears, plates, chutes, machine frames, and mechanisms.                                                                                    |
| 9     | Iron Identity               | Iron provides stronger machine heads, rods, plates, nails, settlement support, and watchtower supply.                                                                  |
| 10    | Steel Identity              | Steel provides stronger frames, pressure systems, regional industry, heavy machines, rails, gates, and large projects.                                                 |
| 11    | Mana Crystal Identity       | Mana crystals fuel mana machines, rune systems, wards, mana furnaces, conduits, batteries, and village magic infrastructure.                                           |
| 12    | Arcane Alloy Identity       | Arcane Alloy is the first true magitech material combining metal, mana, and rune processing.                                                                           |
| 13    | Power Requirement           | Machines require power, with simple early options and stronger later systems.                                                                                          |
| 14    | Early Power                 | Use hand crank, fuel, water, and wind as early/mid power options.                                                                                                      |
| 15    | POC Power                   | Use simple mechanical/fuel power plus basic mana fuel where needed.                                                                                                    |
| 16    | Power Transmission          | Different physical transmission types exist by tier: shafts, pipes, wires, conduits, leylines, and portals.                                                            |
| 17    | Power Visibility            | Power systems are visible through shafts, wheels, wires, conduits, pulsing mana, smoke, movement, and sound.                                                           |
| 18    | Overload                    | Overload risk exists especially for unstable magic, void, forbidden, or overpowered systems.                                                                           |
| 19    | Overload Consequence        | Explosions or corruption happen only on risky machines or harsh settings; normal systems warn and shut down first.                                                     |
| 20    | Leylines                    | Leylines exist as late-game static world infrastructure.                                                                                                               |
| 21    | Transport Progression       | Use chutes -\> belts/carts -\> pipes -\> conduits -\> portals/golems.                                                                                                  |
| 22    | POC Transport               | Use basic item chutes in the POC.                                                                                                                                      |
| 23    | Visible Items               | Moving items are visible nearby and simplified or abstracted at distance.                                                                                              |
| 24    | Throughput                  | Represent throughput with readable items-per-minute or items-per-cycle values.                                                                                         |
| 25    | Overflow                    | Use clear overflow rules: stop, overflow, spill, or reroute depending on block/settings.                                                                               |
| 26    | Directionality              | Auto-connect by default, with a wrench for manual rotation and configuration.                                                                                          |
| 27    | Sorting                     | Use tiered sorting: simple filters early, priority/logic/rune sorting later.                                                                                           |
| 28    | Pipes and Conveyors         | Use conveyors for visible bulk movement and pipes for compact routing.                                                                                                 |
| 29    | Carts/Rails                 | Use hand carts, roads, rails, and minecarts scaling by tier.                                                                                                           |
| 30    | Portals                     | Portal item routing exists late-game only.                                                                                                                             |
| 31    | Storage Progression         | Use chests, crates, barrels, silos, armories, magic vaults, and warehouses.                                                                                            |
| 32    | Warehouse Input             | Village warehouses accept automated input after trust/permission is earned.                                                                                            |
| 33    | Ownership                   | Ownership depends on delivery type: donation, sale, contract, project reservation, or personal storage.                                                                |
| 34    | Contribution Tracking       | A warehouse ledger tracks deliveries, project support, and multiplayer contributions.                                                                                  |
| 35    | Project Reservation         | Projects reserve resources with priorities and emergency override rules.                                                                                               |
| 36    | NPC Consumption             | NPCs consume supplies by category: food, tools, fuel, guard supply, magic stock, construction stock, trade goods, and project reserves.                                |
| 37    | Village Export              | Villages export surplus only with permission, trade route, contract, or player-founded settlement settings.                                                            |
| 38    | Growth Impact               | Automated supply strongly affects food stability, construction speed, repairs, guard equipment, workshops, trade, and story unlocks.                                   |
| 39    | Warehouse Categories        | Warehouses track food, construction, fuel, tools, guard supply, magic stock, trade goods, and reserved project stock.                                                  |
| 40    | Player/Village Storage Link | Player storage connects only through donation flags, ownership permissions, contracts, or player-founded settlement rules.                                             |

| **Q** | **Area**                  | **Locked Decision**                                                                                                                             |
|-------|---------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------|
| 41    | Machine Crafting          | Machines are crafted from visible components like frames, gears, plates, belts, pipes, coils, filters, cores, heads, and power parts.           |
| 42    | Recipe Registry Link      | Machine recipes use the same recipe registry with automation-specific fields.                                                                   |
| 43    | Machine Families          | Include mining, farming, processing, transport, storage, power, magic, defence, logic, golems, village industry, and dimensional logistics.     |
| 44    | POC Machine Family        | The POC focuses first on mining/extraction.                                                                                                     |
| 45    | First Chain               | The first chain is iron ore -\> iron ingots/components -\> village watchtower/guard supply.                                                     |
| 46    | Ports/Sides               | Simple machines auto-configure; advanced machines can be side-configured.                                                                       |
| 47    | Batching                  | Batching depends on recipe, upgrade, and machine type.                                                                                          |
| 48    | Upgrades                  | Use speed, efficiency, quality, filter, power, durability, range, safety, and magic upgrades.                                                   |
| 49    | Output Quality            | Station quality, material quality, NPC specialist support, and magic can affect output quality/efficiency.                                      |
| 50    | Blocked Output            | Default behaviour is internal buffer then pause; risky or special machines can differ.                                                          |
| 51    | NPC Replacement           | Automation supports and scales NPC labour rather than fully replacing it.                                                                       |
| 52    | NPC Job Effect            | Automation reduces hauling, supplies inputs, increases output, and creates specialist jobs.                                                     |
| 53    | Connected Jobs            | All relevant jobs connect: miner, farmer, lumberjack, builder, guard, merchant, mage, blacksmith, alchemist, courier, and golemancer.           |
| 54    | Golems                    | Golems exist as late-game programmable/specialised workers.                                                                                     |
| 55    | Golem Control             | Golems use job profiles with priorities, allowed zones, inventories, and task types.                                                            |
| 56    | POC Golems                | No gameplay golems in the POC, but lore/blueprint/future mention is okay.                                                                       |
| 57    | Forbidden Labour          | Later systems include necromantic labour, blood-powered machines, corruption engines, fear economy, and rebellion/faction consequences.         |
| 58    | Magic Connection          | Magic powers, controls, upgrades, protects, stabilises, and unlocks automation systems.                                                         |
| 59    | Rune Automation           | Runes act as machine control, filters, locks, logic, stabilisers, ward links, and recipe unlocks.                                               |
| 60    | Mana Conduits             | Mana conduits move mana/power between machines, wards, batteries, mana furnaces, and magic infrastructure.                                      |
| 61    | Wards                     | Ward systems are village defence/magic infrastructure connected to mana supply.                                                                 |
| 62    | Magic Instability         | Instability risk comes from unstable materials, bad purity, overloads, voidstone, forbidden magic, or harsh settings.                           |
| 63    | Obsolescence              | Magic supports rather than replaces tools, machines, and NPC labour.                                                                            |
| 64    | POC Magic Automation      | POC includes a basic mana miner/mana furnace/ward lantern link kept simple.                                                                     |
| 65    | Routine Damage            | No routine random damage; damage comes from raids, storms, sabotage, overload, fire, corruption, or harsh settings.                             |
| 66    | Repairs                   | Repairs can use wrench, materials, repair stations/projects, and NPC repair labour depending on context.                                        |
| 67    | Environmental Consequence | Consequences can include noise, scars, runoff, instability, corruption, faction concern, and permission issues.                                 |
| 68    | By-products/Waste         | By-products include slag, ash, dust, chips, residue, sawdust, shard fragments, and some waste.                                                  |
| 69    | Moral Consequence         | Strategic control, exploitative labour, necromancy, village theft, cursed machines, and environmental harm can affect reputation and factions.  |
| 70    | Raid Interaction          | Raiders can target exposed infrastructure, warehouses, power, gates, and supply lines, with difficulty scaling.                                 |
| 71    | POC UI                    | POC machine UI shows inventory, power/fuel, input/output, and blocked status.                                                                   |
| 72    | Overlay                   | Inspection overlay shows item flow, power, mana, blockages, warehouse links, and ownership/permission state.                                    |
| 73    | Alerts                    | Use visual/audio/UI alerts for no power, blocked output, missing input, full storage, damaged machine, village shortage, or permission blocked. |
| 74    | Learning                  | Use layered tutorial: village request, NPC teaching, research page, recipe book, machine UI, and optional tips.                                 |
| 75    | Recipe Compatibility      | Recipes show tags such as accepts automation input, outputs to automation, machine process, warehouse compatible, and batch.                    |
| 76    | Simulation Model          | Use hybrid simulation: detailed local visual simulation and chunk/network summary when distant.                                                 |
| 77    | Unloaded Supply           | Distant villages receive automated supply through abstract network totals and event summaries.                                                  |
| 78    | Multiplayer Ownership     | Track ownership/permissions and shared village/project contribution logs from the beginning.                                                    |
| 79    | Data Direction            | Use data-driven machines, recipes, blocks, items, tags, power, throughput, UI fields, and planning status.                                      |
| 80    | v0.1 Registry Size        | Define 20-40 detailed machine/logistics/power/storage entries plus future backlog.                                                              |

# 3. Automation System Architecture

The Automation System should be data-driven from the beginning. The player sees machines, chutes, belts, pipes, power wheels, furnaces, warehouses, mana conduits, and alerts. The game internally tracks linked definitions for machines, ports, power networks, item networks, storage endpoints, village permissions, recipe processes, and runtime state.

| **Layer**                  | **Purpose**                                                                                       | **Examples**                                                                                      |
|----------------------------|---------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------|
| Base Automation Definition | Parent data shared by all automation blocks and objects.                                          | ID, display name, category, tier, tags, placement rules, ports, owner, scope.                     |
| Machine Definition         | Defines transformation behaviour, recipe compatibility, power needs, and output logic.            | Basic Miner, Stone Furnace, Mana Furnace, Crusher, Arcane Assembler.                              |
| Transport Network          | Moves items between machines, storage, and warehouses.                                            | Chutes, belts, pipes, carts, rails, conduits, portal relays.                                      |
| Power Network              | Provides and transmits power or mana to consumers.                                                | Hand crank, water wheel, windmill, steam engine, mana battery, leyline tap.                       |
| Storage Endpoint           | Stores inputs, outputs, buffers, overflow, project reserves, and permissions.                     | Chest, crate, barrel, silo, armory, warehouse, magic vault.                                       |
| Village Integration Layer  | Connects automation to village ownership, trust, warehouse intake, ledgers, and project reserves. | Warehouse input hatch, delivery contract, project reservation, contribution ledger.               |
| Runtime State              | Mutable save-game state for active machines and networks.                                         | Fuel remaining, power level, blocked output, internal buffer, damage, corruption, current recipe. |
| Simulation LOD             | Determines whether item flow is rendered, ticked, abstracted, or summarised.                      | Local visible items, chunk network totals, distant daily supply summaries.                        |
| Planning Metadata          | Documentation-only scope and readiness markers.                                                   | POC Required, Alpha, Beta, Final Game, Placeholder, Deferred.                                     |

| **Important Data Rule**                                                                                                                                                                                                                                    |
|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| POC status, Alpha/Beta/Final status, placeholder status, and balance-draft notes are planning columns. They should not become hard gameplay properties inherited by automation objects. Shipped gameplay data should remain clean, moddable, and reusable. |

# 4. Parent Automation Data Model

| **Parent Class / Data Layer** | **Inherits / Controls**                                                                                                  | **Example Children**                                                    |
|-------------------------------|--------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------|
| BaseAutomationObject          | Core identity, category, tier, tags, owner, placement, rotation, inspection text, planning metadata.                     | All machines, logistics blocks, power blocks, and automation endpoints. |
| MachineBlock                  | Input slots, output slots, power consumption, active recipe, buffers, blocked state, upgrade sockets, maintenance state. | Basic Miner, Crusher, Sawmill, Mana Furnace, Arcane Assembler.          |
| PowerGeneratorBlock           | Power type, output amount, fuel or environmental dependency, transmission compatibility, failure rules.                  | Hand Crank, Water Wheel, Windmill, Steam Engine, Mana Battery.          |
| PowerTransmitterBlock         | Connection rules, range, loss, network ID, visible state, overload threshold.                                            | Wooden Shaft, Copper Wire, Pressure Pipe, Mana Conduit, Leyline Relay.  |
| TransportBlock                | Item direction, throughput, filters, overflow behaviour, visibility rules, auto-connect, wrench configuration.           | Wooden Chute, Conveyor Belt, Item Pipe, Splitter, Merger.               |
| StorageEndpointBlock          | Capacity, categories, import/export flags, ownership, allowed networks, full/empty states.                               | Chest, Crate, Barrel, Silo, Warehouse Intake, Magic Vault.              |
| SorterLogicBlock              | Filter rules, priority, whitelist/blacklist, rune logic, locking, recipe tags.                                           | Filter Gate, Priority Splitter, Rune Sorter, Locked Warehouse Gate.     |
| MagicAutomationBlock          | Mana storage/flow, rune slots, ward link, instability, purity, corruption checks, glow states.                           | Mana Conduit, Mana Battery, Ward Lantern Link, Mana Furnace.            |
| VillageAutomationEndpoint     | Trust requirement, contract type, ownership transfer, ledger logging, project reservation, export rules.                 | Village Warehouse Input Hatch, Project Supply Crate, Trade Route Dock.  |
| GolemWorkerProfile            | Owner, command profile, allowed jobs, permitted zones, inventory, charge/fuel, ethics/faction reactions.                 | Hauling Golem, Builder Golem, Miner Golem, Guard Golem.                 |

## 4.1 Example Parent Inheritance

| **Example**                   | **Inheritance Chain**                                                                                       | **What It Gains Automatically**                                                                                  |
|-------------------------------|-------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------|
| Wooden Chute                  | BaseAutomationObject -\> TransportBlock -\> GravityTransport -\> WoodFamily -\> ChuteVariant                | Direction, item movement, simple overflow, auto-connect, wrench rotation, wood material traits, early tier tags. |
| Basic Mechanical Miner        | BaseAutomationObject -\> MachineBlock -\> ExtractorMachine -\> CopperTierMachine -\> MinerVariant           | Power use, mining head slot, deposit link, output buffer, blocked output rule, machine recipe tags.              |
| Village Warehouse Input Hatch | BaseAutomationObject -\> StorageEndpointBlock -\> VillageAutomationEndpoint -\> WarehouseInputVariant       | Import permissions, donation/contract modes, ledger logging, project reserve routing, ownership transfer.        |
| Mana Furnace                  | BaseAutomationObject -\> MachineBlock -\> MagicAutomationBlock -\> ProcessingMachine -\> ManaFurnaceVariant | Fuel/mana use, recipe processing, rune slot, overload warning, glow state, magic tags, instability checks.       |
| Hauling Golem                 | BaseAutomationObject -\> GolemWorkerProfile -\> WorkerAutomation -\> HaulingVariant                         | Owner, task profile, zone permissions, inventory, charging need, NPC/faction reaction hooks.                     |

# 5. Automation Categories, Families, and Tags

Every automation entry should have a primary category, optional subcategory, material family, power type, transport type, tags, tier, and planning status. Categories help players and designers browse the system. Tags help recipes, NPCs, villages, UI filters, storage rules, machine routing, and save data.

| **Top-Level Category**  | **Purpose**                                                                        | **Examples**                                                                          |
|-------------------------|------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------|
| Extraction Machines     | Gather resources from deposits, nodes, farms, trees, fluids, or special sources.   | Basic Miner, Deep Drill, Tree Harvester, Pump, Crystal Extractor.                     |
| Processing Machines     | Transform raw inputs into refined outputs, parts, by-products, or higher yields.   | Furnace, Mana Furnace, Crusher, Sawmill, Forge Press, Refinery.                       |
| Transport and Logistics | Move items between machines, storage, and settlements.                             | Chutes, conveyors, pipes, carts, rails, splitters, mergers, conduits.                 |
| Storage and Buffers     | Hold items, sort categories, provide overflow, and reserve resources.              | Chest, crate, barrel, silo, buffer, warehouse, magic vault.                           |
| Power Generation        | Create mechanical, fuel, steam, mana, leyline, or dimensional power.               | Hand crank, water wheel, windmill, steam engine, mana battery, leyline tap.           |
| Power Transmission      | Move power or mana between generators and machines.                                | Shaft, gearbox, copper wire, pressure pipe, mana conduit, leyline relay.              |
| Logic and Control       | Filter, lock, prioritise, route, stabilise, or automate decisions.                 | Filter gate, priority splitter, rune control plate, machine controller.               |
| Village Industry        | Connect automation to warehouses, projects, NPC jobs, trade, and supply contracts. | Warehouse intake, project crate, trade dock, delivery ledger, guard supply locker.    |
| Magic Infrastructure    | Use mana and runes to power, protect, stabilise, upgrade, or unlock machines.      | Mana conduit, ward lantern, rune stabiliser, arcane battery, ritual machine core.     |
| Defence Automation      | Protect settlements, routes, and factories.                                        | Alarm bell link, guard supply feed, ward tower, trap trigger, automated turret later. |
| Golems and Labour       | Specialised constructed workers using job profiles and permissions.                | Hauling golem, builder golem, miner golem, guard golem.                               |
| Dimensional Logistics   | Late-game region-scale and realm-scale item or power movement.                     | Portal relay, void storage, leyline switch, realm gate supply anchor.                 |

| **Tag Type** | **Example Tags**                                                                                                    | **Used By**                                                    |
|--------------|---------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------|
| Progression  | manual, wood-tier, stone-tier, copper-tier, iron-tier, steel-tier, mana-tier, arcane-alloy-tier, dimension, endgame | Recipe book, unlocks, tooltips, balance views.                 |
| Power        | none, hand, fuel, mechanical, water, wind, steam, mana, rune, leyline, portal                                       | Machine UI, power networks, recipes, performance summaries.    |
| Transport    | chute, belt, pipe, cart, rail, conduit, portal, golem, visible-item-flow, abstractable                              | Logistics simulation, routing, overlays.                       |
| Storage      | buffer, chest, crate, barrel, silo, warehouse, armory, magic-vault, import, export, reserve                         | Storage UI, NPC warehouses, project rules.                     |
| Village      | village-use, warehouse-compatible, permission-required, project-supply, trade-route, guard-supply, donation         | Village simulation, requests, permissions, ledgers.            |
| Risk         | safe, overload, unstable, corrupting, explosive, forbidden, sabotage-target, raid-target, fire-risk                 | Warnings, difficulty settings, faction reactions, maintenance. |
| Recipe       | machine-process, accepts-automation-input, outputs-to-automation, batch, by-product, quality-modified               | Recipe registry, machines, tooltips.                           |
| UI           | inspectable, shows-flow, shows-power, warning-state, tutorial, overlay-visible                                      | UI, overlays, accessibility, tutorials.                        |

# 6. Automation Progression Ladder

Automation should escalate from simple survival support into civilisation-scale infrastructure without making earlier systems useless. The ladder should be readable enough for new players and deep enough to support long-term factories, villages, magic, golems, and dimensions.

| **Band**                     | **Core Unlocks**                                                                               | **Main Purpose**                                                    | **Village Connection**                                                              |
|------------------------------|------------------------------------------------------------------------------------------------|---------------------------------------------------------------------|-------------------------------------------------------------------------------------|
| Manual Survival              | Hand tools, workbench, furnace, chests, manual hauling.                                        | Establish survival, gathering, crafting, and basic storage.         | Player directly delivers resources and learns village needs.                        |
| Medieval Mechanisms          | Hand crank, wooden chutes, simple hoppers, water wheel, windmill, copper gears.                | Reduce early labour and introduce movement/power.                   | Supply small warehouses, mills, farms, and basic construction stock.                |
| Early Industry               | Basic miner, belts, simple sorters, better furnaces, sawmill, minecarts, iron machine heads.   | Scale ore, wood, and construction materials.                        | Support watchtowers, walls, guard supplies, repairs, and workshops.                 |
| Industrial Fantasy           | Steel frames, pressure systems, rails, heavy gates, steam, larger miners, regional warehouses. | Enable regional production and large projects.                      | Support towns, trade routes, military supply, and large construction.               |
| Arcane Machinery             | Mana furnaces, mana batteries, conduits, rune controls, wards, arcane alloy frames.            | Merge magic and machine infrastructure.                             | Power wards, mage buildings, magical farms, and story-gated village upgrades.       |
| Golems and Specialist Labour | Hauling, builder, miner, and guard golems using job profiles and zones.                        | Add programmable/specialised labour without removing NPC relevance. | Support dangerous worksites, remote logistics, repairs, and late settlement growth. |
| Dimensional Logistics        | Portal item routing, void storage, leyline relays, realm fuels.                                | Move resources at long distance and across realms.                  | Support capitals, realm projects, floating cities, and major faction arcs.          |
| Civilisation-Scale Systems   | Region grids, leyline networks, automated trade, settlement districts, wonders.                | Make the player a world-shaper.                                     | Supply cities, capitals, wars, diplomacy, dimensions, and endgame projects.         |

## 6.1 Material Roles

| **Material / Resource** | **Automation Identity**                                                | **Long-Term Use**                                                                           |
|-------------------------|------------------------------------------------------------------------|---------------------------------------------------------------------------------------------|
| Wood                    | Chutes, shafts, basic frames, carts, crates, windmill blades.          | Cheap, repairable, village-friendly, early and decorative infrastructure.                   |
| Stone                   | Foundations, furnaces, weights, supports, pressure blocks.             | Stable, fire-resistant, common construction and machine base material.                      |
| Copper                  | Gears, wires, plates, chutes, early machine frames, basic mechanisms.  | Early automation backbone and repair material that stays useful in wiring and simple parts. |
| Iron                    | Machine heads, rods, plates, nails, reinforced parts, guard supply.    | Core settlement support and first serious extraction/processing tier.                       |
| Steel                   | Heavy frames, rails, pressure systems, large gates, regional industry. | Large projects, durable machinery, strong logistics, military/industrial backbone.          |
| Mana Crystal            | Fuel for mana machines, conduits, batteries, wards, rune systems.      | Magic infrastructure and village ward supply forever.                                       |
| Arcane Alloy            | First true magitech frame/core material.                               | Hybrid machines, advanced conduits, rune-controlled factories, magical stabilisation.       |
| Mythril                 | Lightweight magical precision material.                                | High-tier conduits, precision machines, mobile gear, efficient magical parts.               |
| Voidstone               | Dangerous dimensional storage/portal/unstable machine material.        | High-risk high-power systems, portal logistics, forbidden or unstable automation.           |
| Celestial Metal         | Endgame civilisation-scale machine and structure material.             | Floating cities, realm-scale machines, wonders, major artifacts.                            |

# 7. Power and Energy System

Machines require power, but power should not overwhelm the early game. Early power is simple and visible. Later power becomes a progression system involving stronger infrastructure, magical networks, leylines, and risk management.

| **Power Type**       | **Tier**            | **Examples**                                         | **Design Role**                                                                            |
|----------------------|---------------------|------------------------------------------------------|--------------------------------------------------------------------------------------------|
| Manual / Hand        | Primitive / Copper  | Hand crank, pedal press, manual lever.               | Introduces power without fuel complexity; useful for tiny machines or emergency operation. |
| Fuel                 | Wood / Stone / Iron | Charcoal, coal, furnace fuel, boiler fuel.           | Simple, readable, reliable power for furnaces, smelters, and early processing.             |
| Mechanical           | Copper / Iron       | Shafts, gearboxes, water wheel, windmill.            | Visible medieval automation; cheap, stable, distance-limited.                              |
| Water / Wind         | Copper / Iron       | Water wheel, windmill rotor, millstone, pumps.       | Location-based power that encourages base planning.                                        |
| Steam / Pressure     | Steel               | Boiler, pressure pipe, steam engine, heavy press.    | Regional industry, higher throughput, pressure risk.                                       |
| Mana                 | Mana Crystal        | Mana battery, mana furnace, mana conduit, ward link. | Magical infrastructure, wards, rune machines, special processing.                          |
| Rune / Arcane        | Arcane Alloy        | Rune controller, stabiliser, arcane assembler.       | Control, logic, stabilisation, machine upgrades, recipe unlocks.                           |
| Leyline              | Late Game           | Leyline tap, relay, anchor, grid node.               | Static world infrastructure requiring strategic placement.                                 |
| Dimensional / Portal | Endgame             | Portal relay, void cell, realm battery.              | Powerful and risky realm-scale systems.                                                    |

## 7.1 Power Visibility and Feedback

- Shafts should visibly rotate when powered.

- Water wheels and windmills should show motion tied to available power.

- Fuel systems should show fire, smoke, heat, ash, or fuel meters.

- Mana systems should pulse, glow, hum, or show rune activity when active.

- Overloaded systems should warn before serious damage unless they are inherently unstable or difficulty settings are harsh.

- Machines should clearly show no power, low power, overloaded, blocked, damaged, and active states.

## 7.2 Overload Rules

| **State**               | **Default Behaviour**                           | **High-Risk / Harsh Behaviour**                                            |
|-------------------------|-------------------------------------------------|----------------------------------------------------------------------------|
| Underpowered            | Machine slows or pauses.                        | Same, plus possible efficiency loss or failed recipe if risky.             |
| No Power                | Machine pauses and shows warning.               | Same.                                                                      |
| Mild Overload           | Warning, reduced efficiency, possible shutdown. | Damage chance if ignored.                                                  |
| Severe Overload         | Shutdown and minor damage.                      | Explosion, fire, corruption, or resource loss depending on system.         |
| Unstable Magic          | Warning, mana waste, corruption meter increase. | Corruption, cursed output, ward failure, or hostile event.                 |
| Void/Forbidden Overload | Only possible after risky unlocks.              | Explosive, corrupting, faction-triggering, or story-altering consequences. |

# 8. Transport and Logistics System

Transport should start simple and physical, then scale into more compact, configurable, magical, and region-scale systems. The POC should use basic chutes because they are readable, cheap, and easy to understand.

| **Transport Tier**  | **Blocks / Systems**                                  | **Strengths**                                           | **Limits**                                                            |
|---------------------|-------------------------------------------------------|---------------------------------------------------------|-----------------------------------------------------------------------|
| Manual Carrying     | Player inventory, baskets, carts, NPC hauling.        | Readable, personal, early survival friendly.            | Low capacity, labour intensive.                                       |
| Wooden Chutes       | Chute, hopper, chute outlet, simple gravity routing.  | POC-friendly, visible, cheap, low-tech.                 | Limited routing, direction/height constraints, simple overflow.       |
| Belts and Carts     | Conveyor belts, hand carts, cart stops, roads.        | Visible bulk movement, good for factories and villages. | Needs space, power or paths, exposed to raids.                        |
| Pipes               | Item pipes, junctions, pipe filters, compact routing. | Compact, better for walls/floors, cleaner bases.        | Less visually readable unless overlays help.                          |
| Rails and Minecarts | Rails, minecart loaders, stations, depots.            | Bulk regional logistics, mines to towns.                | Infrastructure investment and defence requirement.                    |
| Mana Conduits       | Mana conduits and later item/mana hybrid conduits.    | Magic power flow and special routing.                   | Requires mana, runes, stability, and knowledge.                       |
| Golem Logistics     | Hauling golems with job profiles.                     | Flexible pickup/delivery and construction support.      | Requires late-game setup, command profiles, charge/fuel, zones.       |
| Portal Logistics    | Portal relays, destination anchors, void storage.     | Long-distance, realm-scale item movement.               | Late-game, high cost, risk, permission, and world-state consequences. |

## 8.1 Item Visibility and Simulation

| **Distance / Context**  | **Simulation Mode**                                                              | **Player-Facing Result**                                                  |
|-------------------------|----------------------------------------------------------------------------------|---------------------------------------------------------------------------|
| Near Player             | Individual visible items move on chutes, belts, pipes with local tick detail.    | The player can see and diagnose item flow.                                |
| Nearby but Offscreen    | Items are still simulated, but visuals can be skipped.                           | Machines continue working without visual cost.                            |
| Distant Chunk           | Network summary tracks input/output rates, buffers, power, and failures.         | Factories continue through abstract totals.                               |
| Unloaded Village        | Daily or periodic supply summaries update warehouse/project state.               | Villages receive supply without simulating every item.                    |
| Multiplayer Active Area | Detailed simulation runs around active players and merges network totals safely. | Shared factories remain understandable without duplicate item simulation. |

## 8.2 Overflow and Blocked Outputs

- Default machine behaviour: output enters internal buffer, then machine pauses when full.

- Default transport behaviour: items stop when blocked rather than being deleted.

- Overflow storage can receive excess if configured by player.

- Spilling items onto the ground should be an explicit or high-risk behaviour, not the default.

- Dangerous machines may spill, vent, explode, corrupt, or damage surroundings if ignored under harsh settings.

# 9. Storage, Warehouses, and Village Supply

Storage is the bridge between automation and civilisation. A factory output only matters to a settlement if the village can legally receive it, track it, reserve it, consume it, and show the player what changed. The warehouse system must therefore include physical storage, ownership, project reserves, and readable UI summaries.

| **Storage Type**      | **Use**                                           | **Automation Role**                             | **Village Role**                                                 |
|-----------------------|---------------------------------------------------|-------------------------------------------------|------------------------------------------------------------------|
| Chest                 | Early personal storage.                           | Basic input/output with simple ports.           | Player-owned unless donated or settlement rules allow.           |
| Crate                 | Construction and machine parts.                   | Good for bulk outputs and construction staging. | Common construction stock container.                             |
| Barrel                | Food, liquids, alchemy, fuel depending on type.   | Bulk storage for certain categories.            | Food stores, brewery, fuel, medicine, or trade goods.            |
| Silo                  | High-capacity grain/ore/loose material storage.   | Bulk input/output endpoint.                     | Large village food or ore stock.                                 |
| Armory / Guard Locker | Weapons, armour, arrows, shields, guard supply.   | Can receive crafted gear and ammo.              | Improves defence and raid outcomes.                              |
| Village Warehouse     | Settlement-level storage and project reserve hub. | Accepts automation after trust/permission.      | Tracks supply, shortages, projects, ownership, and ledger.       |
| Magic Vault           | Mana, runes, ward cores, unstable materials.      | Accepts mana resources and magical parts.       | Supports mages, wards, temples, rituals, and corruption control. |
| Project Supply Crate  | Temporary staged project stock.                   | Can be fed from warehouse or network.           | Builders withdraw reserved resources to construct stages.        |

## 9.1 Warehouse Ownership Modes

| **Mode**               | **Who Owns Items?**                                          | **Use Case**                                              | **Reputation / Ledger Effect**                                           |
|------------------------|--------------------------------------------------------------|-----------------------------------------------------------|--------------------------------------------------------------------------|
| Donation               | Village owns items when accepted.                            | Player helps village freely.                              | Positive reputation and contribution logged.                             |
| Sale                   | Village owns items after trade payment.                      | Automated trade or contract sale.                         | Payment/trade value logged; reputation may improve slightly.             |
| Contract Delivery      | Ownership transfers when contract conditions are met.        | Supply wood, iron, food, mana, guard gear.                | Contract progress, payment, reputation, and project contribution logged. |
| Project Reservation    | Village/project owns reserved items until used or cancelled. | Watchtower, wall, gate, repairs, shrine.                  | Project contribution recorded and protected from daily consumption.      |
| Personal Storage       | Player retains ownership.                                    | Trusted storage inside settlement or player-founded town. | No NPC consumption unless flags permit.                                  |
| Tribute / Fear Economy | Conqueror or tyrant path takes or demands supplies.          | Exploitative automation or tribute networks.              | Fear increases; rebellion and faction consequences possible.             |

## 9.2 Warehouse Categories

| **Category**           | **Examples**                                      | **Consumption / Reservation Rules**                                      |
|------------------------|---------------------------------------------------|--------------------------------------------------------------------------|
| Food                   | Grain, bread, stew, preserved food.               | Consumed by NPCs over time; can be reserved for famine or guards.        |
| Construction Stock     | Logs, planks, stone, bricks, nails, beams.        | Consumed by active projects and repairs.                                 |
| Fuel                   | Charcoal, coal, wood fuel, mana fuel.             | Consumed by workshops, heating, furnaces, and machines if permitted.     |
| Tools                  | Axes, pickaxes, hammers, sickles, repair tools.   | Assigned to jobs and replaced when broken.                               |
| Guard Supply           | Weapons, armour, shields, arrows, bandages.       | Improves defence score, tower readiness, and raid survival.              |
| Magic Stock            | Mana crystals, runes, ward cores, catalysts.      | Used by mages, wards, mana lights, rituals, and magic machines.          |
| Trade Goods            | Culture goods, surplus parts, valuable materials. | Exported only by permission, contract, trade route, or settlement rules. |
| Reserved Project Stock | Watchtower parts, palisade kit, gate hardware.    | Protected from normal consumption except emergency override rules.       |

# 10. Machines and Production

Machines should be built from visible components and should clearly communicate inputs, outputs, power, blocked state, upgrades, risk, and ownership. Simple machines can auto-configure; advanced machines should support side configuration and upgrades.

| **Machine Family**  | **Examples**                                                     | **Core Role**                                                 | **POC / Later**                                       |
|---------------------|------------------------------------------------------------------|---------------------------------------------------------------|-------------------------------------------------------|
| Mining / Extraction | Basic Miner, Deep Drill, Crystal Extractor, Pump.                | Extract resources from deposits or nodes.                     | POC focus begins here.                                |
| Wood / Farming      | Sawmill, irrigation pump, mill, crop processor, auto planter.    | Scale wood, food, fibre, and village supply.                  | Alpha and later, with some simple POC hooks optional. |
| Processing          | Furnace, mana furnace, crusher, forge press, refinery.           | Transform raw resources into refined outputs and by-products. | Furnace/mana furnace in POC; crusher/sawmill later.   |
| Transport           | Chutes, belts, pipes, carts, rails, splitters.                   | Move items and connect chains.                                | Basic chutes in POC.                                  |
| Storage             | Chest, crate, silo, warehouse, magic vault.                      | Buffer, reserve, sort, own, and consume items.                | Chest/crate/warehouse input in POC.                   |
| Power               | Hand crank, water wheel, windmill, boiler, mana battery.         | Generate and move power or mana.                              | Simple mechanical/fuel/mana in POC.                   |
| Magic               | Mana conduit, ward link, rune controller, arcane assembler.      | Power, stabilise, protect, and unlock magitech.               | Simple mana furnace/ward link in POC.                 |
| Defence             | Alarm link, trap trigger, ward tower, guard supply feed.         | Protect villages and factories.                               | Watchtower supply outcome in POC.                     |
| Logic               | Filter gate, priority splitter, rune sorter, machine controller. | Route items and automate decisions.                           | Basic filters only if needed.                         |
| Golems              | Hauler, builder, miner, guard golem.                             | Specialised task labour.                                      | Mentioned only in POC; gameplay later.                |
| Dimensional         | Portal relay, void storage, leyline grid.                        | Late-game region/realm logistics.                             | Deferred to future docs.                              |

## 10.1 Machine States

| **State**           | **Meaning**                                             | **Required Feedback**                                                 |
|---------------------|---------------------------------------------------------|-----------------------------------------------------------------------|
| Idle                | No current recipe, input, or task.                      | Neutral animation, tooltip reason.                                    |
| Active              | Machine has power/input and is processing.              | Movement, sound, particles, progress meter.                           |
| No Input            | Required input missing.                                 | UI warning, overlay icon, quiet machine.                              |
| No Power / Fuel     | Power source missing or fuel empty.                     | Power icon, fuel slot alert, stopped animation.                       |
| Blocked Output      | Output buffer or connected storage full.                | Red/orange output icon, visible stopped items, overlay route warning. |
| Full Buffer         | Internal buffer full but not necessarily broken.        | Storage indicator and route suggestion.                               |
| Damaged             | Raid/fire/storm/sabotage/overload damage.               | Cracked model/state, repair prompt, performance loss.                 |
| Overloaded          | Power or mana exceeds safe limits.                      | Warning pulse, sound, shutdown timer or danger state.                 |
| Unstable/Corrupting | Magic, void, forbidden, or impure resource risk.        | Rune flicker, corruption meter, warning tooltip.                      |
| Permission Blocked  | Network cannot insert/export due to ownership or trust. | Lock icon, warehouse permission text.                                 |

## 10.2 Upgrade Types

- Speed upgrades increase throughput but may increase power use or heat.

- Efficiency upgrades reduce fuel, mana, or input waste.

- Quality upgrades improve output quality, purity, or by-product chance.

- Filter upgrades allow selective input/output and priority routing.

- Power upgrades increase accepted power type, range, or stability.

- Durability upgrades reduce damage and maintenance risk.

- Range upgrades affect extraction area or logistics interaction.

- Safety upgrades reduce overload, pressure, fire, corruption, or explosion risk.

- Magic upgrades add rune slots, ward links, mana storage, or stabilisation.

# 11. Automation Recipes and Machine Assembly

Automation recipes should live in the same recipe registry as other crafting, but with additional automation fields. This keeps recipe search, balancing, unlocks, NPC use, and machine routing consistent across the whole game.

| **Recipe Type**             | **Example**                                       | **Automation-Specific Fields**                                                                               |
|-----------------------------|---------------------------------------------------|--------------------------------------------------------------------------------------------------------------|
| Machine Assembly Recipe     | Craft Basic Mechanical Miner.                     | Component roles, station, tier, power branch, machine category, unlock, scope.                               |
| Automation Process Recipe   | Iron ore -\> iron ingot in furnace/mana furnace.  | Craft time, throughput, power type, batch size, input slots, output slots, by-products, blocked-output rule. |
| Transport Recipe            | Craft Wooden Chute or Conveyor Belt.              | Placement direction, throughput, connection rules, material family, wrench configuration.                    |
| Power Recipe                | Craft Water Wheel or Mana Battery.                | Power type, output, fuel/environment requirement, transmission compatibility.                                |
| Warehouse Recipe / Endpoint | Build Village Warehouse Input Hatch.              | Permission requirement, ownership mode, ledger mode, allowed categories.                                     |
| Project Supply Recipe       | Watchtower supply crate or stage requirement.     | Project stage, reserved resources, NPC job roles, build time, consequences.                                  |
| Magic Automation Recipe     | Craft Mana Conduit, Ward Core, Rune Controller.   | Mana charge, rune requirement, purity, instability, corruption risk, ward link.                              |
| Forbidden Automation Recipe | Blood-powered machine or necromantic labour core. | Moral tag, faction reaction, corruption risk, legality, rebellion hooks.                                     |

## 11.1 Standard Machine Assembly Components

| **Component Role** | **Early Examples**                            | **Advanced / Magical Examples**                       |
|--------------------|-----------------------------------------------|-------------------------------------------------------|
| Frame              | Wooden frame, copper frame, iron frame.       | Steel frame, arcane alloy frame, mythril frame.       |
| Motion             | Wooden shaft, copper gear, crank.             | Gearbox, flywheel, rune motor, arcane rotor.          |
| Transport          | Chute segment, belt strip, pipe segment.      | Priority sorter, conduit ring, portal relay glyph.    |
| Processing Head    | Stone grinder, copper drill, iron miner head. | Steel drill, crystal extractor, void bore.            |
| Power Part         | Fuel grate, water wheel axle, windmill shaft. | Boiler, mana coil, battery core, leyline tap.         |
| Control Part       | Lever, filter screen, copper switch.          | Rune control plate, logic glyph, arcane regulator.    |
| Magic Part         | Mana shard, basic rune, ward core.            | Mana coil, stabiliser, arcane core, void seal.        |
| Safety Part        | Reinforced casing, vent, shutoff valve.       | Pressure regulator, ward stabiliser, corruption seal. |

# 12. NPC Labour, Jobs, and Golems

Automation should support and scale NPC labour, not delete the reason villages exist. Machines reduce hauling, stabilise supplies, and create specialist work. NPCs still build, repair, trade, guard, teach, manage warehouses, maintain wards, and react socially to the player.

| **NPC Job** | **Automation Connection**                                                       | **Player-Facing Result**                                                 |
|-------------|---------------------------------------------------------------------------------|--------------------------------------------------------------------------|
| Miner       | Uses mined deposits, benefits from drill supply, can maintain local mine sites. | Mines become safer and more productive when automated.                   |
| Lumberjack  | Supplies sawmill, tree farm, wood chutes, construction stock.                   | Villages can support building projects with less manual wood delivery.   |
| Farmer      | Uses irrigation, mills, grain silos, food storage, crop processors.             | Food stability improves and famine risk drops.                           |
| Builder     | Consumes project reserves, uses supply crates, repairs damaged blocks.          | Automated construction supply speeds visible village growth.             |
| Guard       | Receives weapons, armour, arrows, bandages, ward support.                       | Raid outcomes change based on automated guard supply.                    |
| Merchant    | Uses surplus export rules, contracts, trade docks, ledgers.                     | Factories can become trade engines, not just storage piles.              |
| Mage        | Maintains wards, teaches rune recipes, consumes mana stock.                     | Mana supply affects village magic, protection, and story unlocks.        |
| Blacksmith  | Consumes ingots, fuel, parts; improves gear and machine repairs.                | Industrial villages produce better tools, guard gear, and components.    |
| Alchemist   | Consumes herbs, residue, monster drops, mana dust.                              | By-products and rare drops feed medicines, catalysts, and risky recipes. |
| Courier     | Moves goods between warehouses, trade routes, and remote sites.                 | Settlements feel connected and logistics become social.                  |
| Golemancer  | Creates/maintains golems and ethical/societal automation questions.             | Late-game labour changes can produce culture and faction consequences.   |

## 12.1 Golem Design Rules

- Golems are late-game specialised workers, not POC core gameplay.

- Golem control should use job profiles, priorities, allowed zones, inventories, task types, fuel/charge, and ownership permissions.

- Golems should be useful but not smarter than core NPCs in all situations.

- Villages and factions should react differently to golem labour depending on culture, law, religion, fear, and scarcity.

- Forbidden labour paths can include necromantic workers, blood-powered constructs, corruption engines, or fear-based economies with consequences.

# 13. Magic, Mana, and Magitech Automation

Magic should power, control, upgrade, protect, stabilise, and unlock automation. It should not make mechanical machines obsolete. Instead, magic creates new branches: mana furnaces, rune logic, ward networks, arcane batteries, magitech machines, and realm-scale infrastructure.

| **Magic Automation Element** | **Role**                                                                 | **Risk / Limit**                                                           |
|------------------------------|--------------------------------------------------------------------------|----------------------------------------------------------------------------|
| Mana Crystal Fuel            | Powers mana furnaces, batteries, wards, conduits, and rituals.           | Purity affects yield, stability, and corruption risk.                      |
| Mana Furnace                 | Magical processing with improved or unique outputs.                      | May require mana fuel, rune knowledge, and safety rules.                   |
| Mana Conduit                 | Moves mana between batteries, machines, wards, and magic infrastructure. | Overload or instability can interrupt wards or corrupt outputs.            |
| Rune Control Plate           | Controls filters, locks, logic, stabilisers, and machine behaviours.     | Requires discovered knowledge and rune crafting.                           |
| Ward Lantern Link            | Connects mana supply to village ward/defence infrastructure.             | Weak supply reduces protection and can affect raid outcomes.               |
| Mana Battery                 | Stores mana for machines, wards, and emergency supply.                   | Bad purity or overload can waste mana or cause instability.                |
| Arcane Alloy Frame           | First true magitech machine material.                                    | More expensive and gated by metal, mana, and rune processing.              |
| Void / Forbidden Core        | High-risk dimensional or dark automation.                                | Can trigger corruption, faction concern, explosion, or moral consequences. |

## 13.1 POC Magic Automation

- Mana crystals can be gathered and refined into mana shards or mana dust.

- A basic rune can unlock the first mana-machine interaction.

- A mana furnace can process iron more efficiently, faster, or with special by-products as a POC demonstration.

- A ward lantern link can show that village defence can depend on magical infrastructure.

- A basic mana miner may exist only if it does not overload the POC; otherwise the mechanical miner remains the core extraction machine and the mana furnace/ward link proves the magic branch.

# 14. Risk, Maintenance, and Consequences

Automation should create stakes without becoming annoying. Machines should not randomly break constantly. Damage and failure should usually come from readable causes: raids, storms, sabotage, overload, fire, corruption, poor setup, risky resources, or harsh world settings.

| **Risk Source**      | **Default Behaviour**                                                  | **Possible Consequence**                                              |
|----------------------|------------------------------------------------------------------------|-----------------------------------------------------------------------|
| Blocked Output       | Machine pauses after buffer fills.                                     | Production stops; village shortage if ignored.                        |
| No Power / Fuel      | Machine pauses and warns.                                              | Supply chain stops until refuelled or reconnected.                    |
| Raid Damage          | Raiders can target exposed infrastructure.                             | Broken chutes, stolen warehouse goods, damaged power, lower defence.  |
| Fire / Storm         | Weather or accidents can damage vulnerable machines.                   | Repair project, lost fuel, broken wooden transport.                   |
| Sabotage             | Hostile factions can attack key nodes later.                           | Hidden damage, corrupted output, stolen parts, fear or faction event. |
| Mechanical Overload  | Warning -\> shutdown -\> minor damage.                                 | Repair cost, delay, possible explosion on harsh settings.             |
| Mana Instability     | Warning, mana loss, unstable output.                                   | Corruption, ward failure, damaged conduits, cursed by-product.        |
| Environmental Impact | Scalable noise, scars, runoff, pollution, corruption, faction concern. | Trade penalties, protests, monsters, biome damage, law restrictions.  |
| Forbidden Labour     | Moral/faction reaction and hidden instability.                         | Fear economy, rebellion, faction hostility, dark story path.          |

## 14.1 Repair and Maintenance Sources

| **Repair Method**      | **Use**                                                                     | **Notes**                                                                 |
|------------------------|-----------------------------------------------------------------------------|---------------------------------------------------------------------------|
| Wrench Repair          | Quickly restores light machine damage.                                      | Consumes durability or small materials depending on settings.             |
| Material Repair        | Consumes frames, gears, plates, pipes, runes, or seals.                     | Default meaningful repair path.                                           |
| Repair Station         | Repairs damaged machines or components more efficiently.                    | Useful for player bases and workshops.                                    |
| Village Repair Project | NPC builders repair damaged structures/machines from warehouse supplies.    | Can require approval or priorities in trusted/player-founded settlements. |
| NPC Specialist Repair  | Blacksmiths, engineers, mages, and golemancers repair specialised machines. | Skill can affect cost, speed, and quality.                                |
| Magical Cleansing      | Removes corruption or instability from mana/void machines.                  | Requires mage, ward, ritual, or special components.                       |

# 15. UI, Feedback, Tutorial, and Overlays

Automation can become complex, so feedback must be strong from the beginning. The POC should include enough UI to understand why a machine is working or not working without relying on debug text.

| **UI / Feedback Element** | **POC Requirement**                                                                          | **Full Game Expansion**                                                                  |
|---------------------------|----------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------|
| Machine UI                | Inventory, power/fuel, input/output, current recipe, blocked status.                         | Upgrades, network stats, filters, quality, maintenance history.                          |
| Inspection Overlay        | Show item flow, power, mana, blockages, warehouse links, ownership/permission.               | Network throughput, heat/pressure, corruption, raid vulnerability, optimisation hints.   |
| Alerts                    | No power, missing input, blocked output, full storage, permission blocked, village shortage. | Priority alerts, notification settings, map markers, NPC warnings.                       |
| Recipe Tags               | Show automation input/output, machine process, warehouse-compatible, batch.                  | Advanced substitutions, quality, by-products, risk warnings, NPC use.                    |
| Warehouse UI              | Show categories, project reserves, ownership mode, delivery ledger.                          | Permissions, contracts, export rules, shortage forecast, multiplayer contributions.      |
| Tutorial Path             | Village request, NPC teaching, recipe book, machine UI, optional tips.                       | Research pages, ruin notes, skill tutorials, challenge scenarios.                        |
| Visual States             | Active/idle/blocked/damaged/no power for POC machines.                                       | Material variation, rarity styling, weathering, corruption, culture style, magic charge. |

## 15.1 Learning Flow

1.  The village requests iron supply for a watchtower or guard readiness.

2.  The player learns copper mechanisms from crafting, an NPC, or a recipe hint.

3.  The player crafts a wooden chute and basic miner or receives the first blueprint from a village engineer/mage.

4.  The machine UI shows input, output, power, and blocked state.

5.  The warehouse UI explains why the village cannot accept automated input until trust/permission is earned.

6.  After permission, the ledger shows delivered iron and reserves it for the watchtower project.

7.  The raid validates the system by changing survival, damage, guard effectiveness, and reputation.

# 16. Simulation LOD, Performance, and Multiplayer

Automation must be designed for a large voxel world. The system should never require every item in every machine to be physically simulated forever. The player needs believable results and readable feedback, not expensive hidden item physics across the whole map.

| **Simulation Level**           | **When Used**                                 | **What Runs**                                                                      | **What the Player Sees**                   |
|--------------------------------|-----------------------------------------------|------------------------------------------------------------------------------------|--------------------------------------------|
| Full Local Detail              | Near active player and visible factory area.  | Item movement, machine ticks, power, particles, sound, block states.               | Visible items and working machines.        |
| Local Abstract                 | Nearby but not visible or high-load areas.    | Recipe ticks, network totals, buffers, failures, no item rendering.                | Accurate output when inspected.            |
| Chunk Summary                  | Distant loaded chunks.                        | Rates, resources, power status, simple event checks.                               | Summary on map or return.                  |
| Unloaded Village Summary       | Distant villages and connected supply chains. | Periodic supply totals, warehouse stock, project progress, shortages, event rolls. | Village state updates and event summaries. |
| Offline / Multiplayer Catch-Up | Server or shared world after absence.         | Time-delta rules with caps, risk rolls, storage limits, project progress.          | Clear summary of what changed.             |

## 16.1 Multiplayer Rules

- Ownership and permissions should exist from the beginning, even if the POC has simple rules.

- Village/project contribution logs should track player deliveries and automated supply ownership.

- Machine ownership should support personal, shared settlement, village, faction, and server/admin contexts.

- Permission rules should apply to warehouse input, export, machine interaction, taking outputs, changing filters, and dismantling machines.

- Shared automation should avoid griefing through lockable ports, contracts, access roles, and event logs.

# 17. Proof-of-Concept Automation Scope

The POC should prove the core identity with one small but complete chain: gather or extract resources, move them through a basic transport system, process them, supply a village warehouse, reserve project resources, build a watchtower, and change the raid outcome. Everything else is future-facing unless it directly supports this loop.

| **POC Feature**            | **Required Scope**                                                           | **Deferred / Future Scope**                                               |
|----------------------------|------------------------------------------------------------------------------|---------------------------------------------------------------------------|
| Basic Miner                | Extracts iron ore from a nearby deposit or node; requires simple power/fuel. | Deep drills, multiple ores, quarry systems, geology simulation.           |
| Wooden Chute               | Moves items from miner/furnace/storage in one readable route.                | Belts, pipes, advanced sorting, carts, rails.                             |
| Furnace / Mana Furnace     | Processes iron ore into iron ingots; mana furnace demonstrates magic branch. | Crushers, sawmills, forge presses, refineries, full magitech chains.      |
| Power                      | Simple mechanical/fuel power plus mana fuel where needed.                    | Steam, pressure, leylines, portal power, complex grids.                   |
| Storage                    | Chest/crate plus warehouse input hatch.                                      | Silos, armories, magic vaults, region warehouses.                         |
| Warehouse Permission       | Village accepts automation only after trust/permission.                      | Contracts, export taxes, law, trade route permissions, conqueror tribute. |
| Ledger and Project Reserve | Tracks delivered iron and reserves it for the watchtower.                    | Multiplayer audit, long-term economy, detailed accounting.                |
| NPC Builders               | Use reserved resources to build staged watchtower.                           | Full city projects, districts, megaprojects, floating cities.             |
| Raid Outcome               | Watchtower/supplies improve guard effectiveness and reduce damage.           | Full war, sieges, sabotage, faction raids, disasters.                     |
| UI                         | Machine UI, warehouse UI, project progress, basic alerts.                    | Full analytics dashboard, optimisation tools, automation planner.         |
| Golems                     | Mentioned as future blueprint/lore only.                                     | Playable hauling/building/guard/miner golems.                             |
| Portals/Leylines           | Teaser/lore only if desired.                                                 | Late-game logistics and power networks.                                   |

## 17.1 Minimum POC Chain

8.  Player discovers or earns the copper mechanism recipe path.

9.  Player crafts basic machine components: copper gear, machine frame, chute, and miner head.

10. Player places a basic mechanical miner beside an iron deposit or resource node.

11. Player powers the miner using a simple crank, fuel, or water/wind setup depending on implementation simplicity.

12. Wooden chutes move raw iron ore to a furnace or mana furnace.

13. The furnace creates iron ingots and optional ash/slag by-products if enabled.

14. Output moves to a crate or directly to a village warehouse input hatch.

15. After trust/permission, the warehouse accepts the delivery and logs ownership mode.

16. The watchtower project reserves the iron and construction stock.

17. NPC builders construct the watchtower in visible stages.

18. A goblin raid occurs; the completed watchtower improves defence, reduces damage, and increases reputation.

# 18. Detailed Automation Registry v0.1

This registry defines a first useful automation catalogue. POC Required entries should be prioritised for implementation. Alpha and Final Game entries are included so the system architecture does not paint the project into a corner.

| **ID**                                     | **Name**                      | **Type**              | **Tier**           | **Function**                                                            | **Scope**    |
|--------------------------------------------|-------------------------------|-----------------------|--------------------|-------------------------------------------------------------------------|--------------|
| automation.tool.wrench                     | Wrench                        | Tool                  | Copper             | Rotate/configure machines, ports, chutes, and repairs.                  | POC Required |
| automation.part.machine_frame_wood         | Wooden Machine Frame          | Component             | Wood               | Basic frame for early simple machines.                                  | POC Required |
| automation.part.machine_frame_copper       | Copper Machine Frame          | Component             | Copper             | Frame for first powered machines.                                       | POC Required |
| automation.part.copper_gear                | Copper Gear                   | Component             | Copper             | Early motion component for crank, miner, and gearbox.                   | POC Required |
| automation.part.iron_miner_head            | Iron Miner Head               | Component             | Iron               | Durable mining head for extracting iron from resource nodes.            | POC Required |
| automation.power.hand_crank                | Hand Crank                    | Power Generator       | Copper             | Simple manual power for testing and tiny machines.                      | POC Required |
| automation.power.water_wheel               | Water Wheel                   | Power Generator       | Copper/Iron        | Early renewable mechanical power near flowing water.                    | Alpha        |
| automation.power.windmill_rotor            | Windmill Rotor                | Power Generator       | Copper/Iron        | Renewable mechanical power based on placement/wind rules.               | Alpha        |
| automation.power.wooden_shaft              | Wooden Shaft                  | Power Transmission    | Wood/Copper        | Transmits simple mechanical rotation over short distance.               | POC Optional |
| automation.power.copper_gearbox            | Copper Gearbox                | Power Transmission    | Copper             | Redirects/splits mechanical power.                                      | Alpha        |
| automation.machine.basic_miner             | Basic Mechanical Miner        | Extraction Machine    | Copper/Iron        | Extracts ore from an automation deposit or node.                        | POC Required |
| automation.machine.deposit_marker          | Resource Node Marker          | World/Automation Link | Copper             | Marks a valid large deposit for machine extraction.                     | POC Required |
| automation.transport.wooden_chute          | Wooden Chute                  | Transport             | Wood/Copper        | Gravity/simple item movement for the POC chain.                         | POC Required |
| automation.transport.chute_inlet           | Chute Inlet                   | Transport             | Wood/Copper        | Accepts items from machines/storage into chute network.                 | POC Required |
| automation.transport.chute_outlet          | Chute Outlet                  | Transport             | Wood/Copper        | Outputs items into machines/storage/warehouse endpoints.                | POC Required |
| automation.transport.basic_splitter        | Basic Splitter                | Transport/Logic       | Copper             | Splits item flow evenly or by simple direction.                         | Alpha        |
| automation.transport.basic_filter_gate     | Basic Filter Gate             | Transport/Logic       | Copper             | Allows simple whitelist/blacklist item routing.                         | Alpha        |
| automation.storage.wooden_crate            | Wooden Crate                  | Storage               | Wood               | Bulk construction/material storage and machine buffer.                  | POC Required |
| automation.storage.output_buffer           | Output Buffer                 | Storage               | Copper             | Stores machine output before transport; pauses machine if full.         | POC Required |
| automation.village.warehouse_input_hatch   | Village Warehouse Input Hatch | Village Endpoint      | Iron/Copper        | Allows automated input after village trust/permission.                  | POC Required |
| automation.village.delivery_ledger         | Warehouse Delivery Ledger     | Village UI/Data       | Paper/Copper       | Tracks donations, sales, contracts, project support, and contributions. | POC Required |
| automation.village.project_supply_crate    | Project Supply Crate          | Village Project       | Wood/Iron          | Holds reserved resources for construction stages.                       | POC Required |
| automation.machine.stone_furnace_auto_port | Furnace Auto Port             | Machine Add-on        | Copper             | Lets a furnace accept inputs/output through automation.                 | POC Required |
| automation.machine.mana_furnace            | Mana Furnace                  | Magic Processing      | Mana/Copper/Iron   | Processes resources with mana fuel and early magic automation.          | POC Required |
| automation.magic.mana_battery_basic        | Basic Mana Battery            | Magic Power Storage   | Mana/Copper        | Stores mana for mana furnace, ward links, and future conduits.          | POC Optional |
| automation.magic.mana_conduit_basic        | Basic Mana Conduit            | Magic Transmission    | Mana/Copper        | Moves mana between battery, furnace, and ward infrastructure.           | POC Optional |
| automation.magic.ward_lantern_link         | Ward Lantern Link             | Village Defence Magic | Mana/Iron          | Links mana supply to simple village ward/defence feedback.              | POC Optional |
| automation.logic.rune_control_plate        | Rune Control Plate            | Logic/Magic           | Mana/Arcane        | Rune-based filters, locks, machine behaviours, stabilisers.             | Alpha        |
| automation.transport.conveyor_belt         | Conveyor Belt                 | Transport             | Iron/Rubber-like   | Visible bulk movement with higher throughput than chutes.               | Alpha        |
| automation.transport.belt_splitter         | Belt Splitter                 | Transport/Logic       | Iron               | Splits belt flow with player configuration.                             | Alpha        |
| automation.transport.item_pipe             | Item Pipe                     | Transport             | Iron/Steel         | Compact routing through walls/floors.                                   | Alpha        |
| automation.transport.pipe_junction         | Pipe Junction                 | Transport/Logic       | Iron/Steel         | Configurable pipe routing and merging.                                  | Alpha        |
| automation.transport.minecart_loader       | Minecart Loader               | Bulk Logistics        | Iron/Steel         | Loads bulk items into carts for regional mines.                         | Alpha        |
| automation.transport.rail_track            | Rail Track                    | Bulk Logistics        | Iron/Steel         | Moves minecarts between mine, base, and village.                        | Alpha        |
| automation.machine.crusher                 | Crusher                       | Processing            | Iron/Steel         | Crushes ore for improved yield and by-products.                         | Alpha        |
| automation.machine.sawmill                 | Sawmill                       | Processing            | Iron               | Improves wood conversion and construction stock efficiency.             | Alpha        |
| automation.machine.farm_irrigation_pump    | Irrigation Pump               | Farming Automation    | Copper/Iron        | Moves water to fields and improves village food stability.              | Alpha        |
| automation.power.steam_engine              | Steam Engine                  | Power Generator       | Steel              | High-output industrial fantasy power with pressure risk.                | Beta         |
| automation.power.pressure_pipe             | Pressure Pipe                 | Power/Fluid           | Steel              | Transmits steam/pressure to heavy machines.                             | Beta         |
| automation.magic.arcane_assembler          | Arcane Assembler              | Magitech Production   | Arcane Alloy       | Automated magical machine assembly and rune processing.                 | Beta         |
| automation.golem.hauling_golem             | Hauling Golem                 | Golem Labour          | Arcane Alloy       | Carries items between defined zones and storage endpoints.              | Beta         |
| automation.golem.builder_golem             | Builder Golem                 | Golem Labour          | Arcane Alloy/Steel | Assists construction and repair in assigned zones.                      | Final Game   |
| automation.logic.priority_rune_sorter      | Priority Rune Sorter          | Logic/Magic           | Arcane Alloy       | Routes items by priority, ownership, recipe tags, or project need.      | Final Game   |
| automation.power.leyline_tap               | Leyline Tap                   | Power Generator       | Late Game          | Draws static world leyline energy with placement constraints.           | Final Game   |
| automation.transport.portal_relay          | Portal Relay                  | Dimensional Logistics | Voidstone          | Late-game long-distance item routing.                                   | Final Game   |
| automation.storage.void_vault              | Void Vault                    | Dimensional Storage   | Voidstone          | High-capacity risky storage with stabilisation requirements.            | Final Game   |

# 19. Core POC Scenario: Forest Hamlet Supply Chain

This scenario is the practical automation test. It should be playable as a short vertical slice where the player feels the difference between manual survival, basic automation, NPC village supply, and changed raid outcome.

| **Stage**                | **Player Action**                                                                 | **System Response**                                                                 | **Success Signal**                                        |
|--------------------------|-----------------------------------------------------------------------------------|-------------------------------------------------------------------------------------|-----------------------------------------------------------|
| 1\. Village Need         | Player discovers a forest hamlet with a watchtower project and weak raid defence. | Request board and elder show needed wood, stone, iron, and optional mana support.   | Player has a clear reason to automate.                    |
| 2\. Copper Mechanisms    | Player gathers copper and crafts gears, frame, chute, and wrench.                 | Recipe book unlocks basic miner and chute chain.                                    | Automation branch becomes available after copper.         |
| 3\. Iron Deposit         | Player finds a nearby iron deposit or resource node.                              | Deposit marker confirms a valid machine extraction point.                           | The miner has a target.                                   |
| 4\. Basic Miner          | Player places and powers a basic mechanical miner.                                | Miner produces raw iron ore into its output buffer.                                 | Player sees visible output and machine state.             |
| 5\. Chute Transport      | Player places wooden chutes to move ore.                                          | Ore visibly moves nearby and enters furnace/input storage.                          | Transport works without hidden magic.                     |
| 6\. Processing           | Furnace or mana furnace converts ore into ingots.                                 | Output buffer fills; no power/blocked states are readable.                          | Iron ingots are produced automatically.                   |
| 7\. Warehouse Permission | Player earns permission to feed warehouse.                                        | Warehouse input hatch accepts delivery in donation/contract/project mode.           | Ledger records supply and ownership.                      |
| 8\. Project Reservation  | Watchtower project reserves required resources.                                   | NPC builders begin staged construction using stored stock.                          | Village consumes real resources visibly.                  |
| 9\. Defence Upgrade      | Watchtower reaches completion before raid.                                        | Guards use tower, guard supply, and optional ward support.                          | Raid difficulty/outcome changes.                          |
| 10\. Raid Validation     | Goblins attack the village.                                                       | Village damage, guard survival, NPC reaction, and reputation depend on preparation. | The player understands that automation changed the world. |

## 19.1 POC Win Conditions

- The player can build a functional ore-to-ingot automation chain without debug tools.

- The player can diagnose at least one blocked output, no power, or permission problem through UI/visual feedback.

- The village warehouse accepts automated input only after trust/permission is earned.

- The watchtower project reserves exact resources and visibly progresses through stages.

- The goblin raid outcome changes when the watchtower and/or guard supply is completed.

- The POC demonstrates mechanical automation and a small magic branch without needing full late-game systems.

# 20. Balancing Rules

- Early automation should reduce labour, not instantly remove survival gameplay.

- Copper machines should feel valuable but slightly limited so iron, steel, and mana progression matter.

- Older materials must stay useful through repairs, cheap infrastructure, village needs, culture variants, and low-risk mechanical systems.

- Throughput should be readable before it is perfectly balanced; use first-pass values marked as balance draft.

- The first POC chain should prioritise clear cause-and-effect over production complexity.

- Village-scale projects should require enough material to make automation useful, but not so much that the POC becomes grindy.

- Risk should be predictable and tied to causes: overload, corruption, forbidden inputs, raids, sabotage, fire, storms, or harsh difficulty.

- Magic should enhance automation through fuel, control, protection, and unique processes, not replace mechanical machines outright.

- Simulation should degrade gracefully with distance: visual detail near the player, abstract totals at distance.

- Difficulty/world settings should control destructive raids, overload severity, spoilage, failure risk, and environmental consequences.

# 21. Open Questions for Later Documents

| **Topic**         | **Question**                                                                                                     | **Suggested Later Document**          |
|-------------------|------------------------------------------------------------------------------------------------------------------|---------------------------------------|
| Magic System      | Which rune schools control filters, wards, power stabilisation, machine logic, and corruption cleansing?         | 09 - Magic System                     |
| Economy           | How exactly are automated sales priced, taxed, reserved, or restricted by faction law?                           | Economy, Trade, and Reputation        |
| Combat / Defence  | How do raiders choose machine targets, warehouse targets, gates, or power nodes?                                 | Combat, Gear, and Defence             |
| Player Settlement | How much direct control does the player get over town-owned automation, laws, worker permissions, and districts? | Player Settlement and Building System |
| World Generation  | How are large automation deposits distributed separately from hand-mineable veins?                               | Biomes and World Generation           |
| Dimensions        | Which realm materials power portal logistics, void storage, dream automation, and celestial machines?            | Dimensions and Realms                 |
| Modding / Data    | What final JSON/spreadsheet schema should machine definitions, ports, recipes, networks, and runtime states use? | Technical Implementation Plan         |
| Accessibility     | How should colourblind-friendly overlays, audio cues, and simplified automation views work?                      | UI/UX and Accessibility               |

# Appendix A. POC Automation Checklist

| **Area**         | **Checklist Item**                                                   | **Status**   |
|------------------|----------------------------------------------------------------------|--------------|
| World            | One iron deposit/resource node exists near POC village or cave.      | POC Required |
| Crafting         | Copper gear, machine frame, miner head, chute, wrench recipes exist. | POC Required |
| Machine          | Basic mechanical miner can extract raw iron ore.                     | POC Required |
| Power            | Simple power/fuel model exists and is visible in machine UI.         | POC Required |
| Transport        | Wooden chute moves items from miner to furnace/storage.              | POC Required |
| Processing       | Furnace or mana furnace processes raw iron into ingots.              | POC Required |
| Storage          | Crate/output buffer prevents items from deleting when blocked.       | POC Required |
| Village          | Warehouse input hatch accepts automated delivery after permission.   | POC Required |
| Ledger           | Warehouse logs donation/contract/project contribution.               | POC Required |
| Project          | Watchtower reserves resources and progresses through stages.         | POC Required |
| NPCs             | Builder NPCs use project reserves to construct visible stages.       | POC Required |
| Raid             | Goblin raid outcome changes based on watchtower/guard supply.        | POC Required |
| UI               | Machine UI shows input, output, power/fuel, and blocked status.      | POC Required |
| Overlay          | Inspection overlay shows flow/power/permission at basic level.       | POC Target   |
| Magic            | Mana furnace/ward lantern link proves magic automation branch.       | POC Optional |
| Golems           | Only lore/blueprint/future mention.                                  | Deferred     |
| Portals/Leylines | No gameplay implementation in POC.                                   | Deferred     |

# Appendix B. Automation Database Field Template

| **Field**               | **Purpose**                                                                               | **Required?**                   |
|-------------------------|-------------------------------------------------------------------------------------------|---------------------------------|
| automation_id           | Unique internal ID such as automation.machine.basic_miner.                                | Required                        |
| display_name            | Player-facing name.                                                                       | Required                        |
| category                | Machine, transport, storage, power, magic, village endpoint, logic, golem, dimensional.   | Required                        |
| subcategory             | Extractor, furnace, chute, warehouse input, mana conduit, etc.                            | Required                        |
| tier                    | Wood, stone, copper, iron, steel, mana, arcane alloy, mythril, voidstone, celestial, etc. | Required                        |
| material_family         | Primary material family used for repair, visuals, and recipe substitution.                | Required                        |
| power_type_required     | None, hand, fuel, mechanical, water, wind, steam, mana, rune, leyline, portal.            | Conditional                     |
| power_input_rate        | Balance-draft amount required per cycle.                                                  | Conditional                     |
| power_output_rate       | For generators/transmitters.                                                              | Conditional                     |
| throughput              | Items per minute/cycle or process rate.                                                   | Conditional                     |
| input_slots             | Number and type of allowed inputs.                                                        | Conditional                     |
| output_slots            | Number and type of outputs/buffers.                                                       | Conditional                     |
| port_rules              | Auto-configure, directional, wrench-configured, side-specific, locked.                    | Required for machines/transport |
| overflow_rule           | Pause, buffer, reroute, spill, reject, hazard.                                            | Required                        |
| recipe_refs             | Recipe IDs this machine crafts/processes or requires to build.                            | Required                        |
| upgrade_slots           | Speed, efficiency, safety, magic, filter, range, durability, quality.                     | Optional                        |
| village_permission_rule | None, trust, contract, donation, player settlement, faction law.                          | Conditional                     |
| ownership_mode          | Player, village, shared, contract, faction, conquered, personal storage.                  | Required if interactive         |
| risk_tags               | Overload, fire, corrupting, unstable, forbidden, raid-target, sabotage-target.            | Optional                        |
| ui_fields               | Machine UI fields, overlay fields, alert types.                                           | Required                        |
| simulation_lod_rules    | Local visual, local abstract, chunk summary, unloaded summary.                            | Required                        |
| scope                   | POC Required, POC Optional, Alpha, Beta, Final Game, Placeholder, Deferred.               | Planning only                   |
| balance_notes           | Draft balancing notes not used as shipped gameplay data.                                  | Planning only                   |

# Appendix C. Cross-System Use Matrix

| **Connected System**     | **Automation Requirement**                                                                                                  |
|--------------------------|-----------------------------------------------------------------------------------------------------------------------------|
| Blocks Registry          | Automation objects are blocks with states, ports, damage, placement, rotation, material families, and item forms.           |
| Items Registry           | Machine parts, fuel, magic components, tools, storage items, and output goods define automation inputs/outputs.             |
| Recipe Registry          | Machine assembly and process recipes define station, inputs, outputs, power, throughput, by-products, and unlocks.          |
| Resource Progression     | Copper starts automation; iron supports settlement supply; mana powers magic machines; steel and arcane alloy expand scale. |
| NPC Village System       | Warehouses accept automated input after trust; projects reserve supplies; NPCs consume real resources and react to supply.  |
| Magic System             | Mana, runes, wards, conduits, batteries, instability, and corruption become automation branches.                            |
| Economy System           | Supply/demand, trade routes, contracts, exports, taxation, scarcity, and culture preference depend on automated output.     |
| Combat / Defence         | Raids target infrastructure; guard supply, watchtowers, wards, traps, and repairs alter outcomes.                           |
| World Generation         | Large automation deposits, water/wind sites, leylines, and village locations shape factory planning.                        |
| Dimensions               | Realm resources enable portal logistics, void storage, high-risk power, and civilisation-scale machines.                    |
| UI/UX                    | Machine UIs, overlays, alerts, recipe tags, warehouse ledgers, and tutorial paths teach the system.                         |
| Technical Implementation | Data-driven IDs, tags, LOD, chunk summaries, ownership, networks, and runtime state support performance and modding.        |

# Appendix D. Future Automation Family Backlog

| **Future Family**          | **Examples / Notes**                                                                                        |
|----------------------------|-------------------------------------------------------------------------------------------------------------|
| Advanced Extraction        | Deep drills, quarry systems, crystal extractors, tree harvesters, fluid pumps, monster essence collectors.  |
| Advanced Processing        | Crushers, washeries, forge presses, refineries, alchemy processors, quality sorters, arcane assemblers.     |
| Farming Automation         | Irrigation, mills, crop processors, greenhouses, magical crop boosters, seed sorters, livestock support.    |
| Village Industry           | Automated bakeries, smithies, lumberyards, guard supply lines, medicine labs, trade docks, caravan loaders. |
| Defence Automation         | Alarm networks, trap routing, ward towers, siege engines, guard equipment feeds, repair drones/golems.      |
| Golems                     | Hauling, builder, miner, guard, repair, courier, and specialist golems with cultural/faction reactions.     |
| Forbidden Automation       | Necromantic labour, blood engines, cursed factories, corruption condensers, fear economy tools.             |
| Dimensional Logistics      | Portal relays, realm anchors, void vaults, dream routes, celestial lifts, infernal engines.                 |
| Civilisation-Scale Systems | Region grids, settlement district logistics, taxation, law permissions, trade automation, wonder projects.  |

# Appendix E. POC Success Criteria

| **Criterion**           | **Success Test**                                                                                                                   |
|-------------------------|------------------------------------------------------------------------------------------------------------------------------------|
| Readable Chain          | A new player can trace ore from deposit to miner to chute to furnace to warehouse without debug tools.                             |
| Real Village Use        | The village warehouse consumes/logs/reserves real resources rather than using fake quest counters.                                 |
| Trust Gate Works        | Automated village input is blocked until trust/permission is earned, then clearly accepted.                                        |
| Machine Feedback Works  | At least no power, blocked output, missing input, and full storage are understandable through UI/visual state.                     |
| Project Changes World   | The watchtower visibly builds in stages using stored resources.                                                                    |
| Raid Outcome Changes    | The goblin raid has a better outcome if the automation-fed project is completed or supplied.                                       |
| Performance Path Exists | The system can switch from local visible items to abstract summary without changing final resource totals wildly.                  |
| Future-Proof Data       | Machines, recipes, storage, ownership, power, throughput, and scope are represented by data fields rather than hardcoded one-offs. |
