# FANTASY VOXEL CIVILISATION SANDBOX

## DOCUMENT SET 29

# 29C - Hunger, Thirst, Nutrition and Consumption

*Version 0.1 - Detailed Design Bible, Runtime Rules and Integration Contract Draft*

*A data-driven nourishment system for hunger, satiety, optional hydration, meal quality, rolling nutrition, food and drink consumption, food-safety handoffs, NPC provisioning demand, difficulty profiles, multiplayer authority and bounded living-world simulation.*

---

> **Hunger, Thirst, Nutrition and Consumption Statement**
>
> Leyforge food should be worth growing, cooking, storing, trading, serving and sharing because it supports survival and civilisation, not because the player must repeatedly click a hunger bar every few minutes. Hunger is a slow, readable preparation pressure. Nutrition rewards varied and prepared meals without becoming a micronutrient spreadsheet. Thirst is a fully supported biological system but remains disabled by default in Standard play. Food, drink and water items remain owned by their item and recipe definitions; Set 29 owns what consuming them does to a living body. Severe neglect may eventually become dangerous, but ordinary play must provide generous warning, multiple solutions and enough reserve to build, explore, travel and fight without constant interruption.

| Field | Locked Direction |
| --- | --- |
| Document | 29C in Document Set 29 - Survival, Health & Biological Systems. |
| Governing Contract | The Leyforge Document Sets 27-30 Cross-Set Interface Register v1.0 remains binding. One owner per gameplay system. |
| Set 29 Ownership | Hunger, thirst/hydration biology, nutrition, consumption response, starvation/dehydration biology and nourishment-derived physiological modifiers. |
| Item/Recipe Boundary | Items and Recipes own food/drink definitions, ingredients, crafting, cooking, preservation, spoilage state and inventory transactions. 29C consumes their biological traits. |
| Hunger Default | Enabled in Standard. Baseline full-to-starving reserve is approximately 25 simulation hours before activity/environment modifiers. |
| Thirst Default | Disabled in Standard, Relaxed and Peaceful by default. Harsh enables the full hydration system. Custom worlds may enable it independently. |
| Nutrition Model | Three broad nutritional contribution groups plus variety, evaluated over a rolling 48 simulation-hour window. No vitamin-by-vitamin or calorie-counting UI. |
| Eating Frequency | Standard balance supports roughly two substantial meals per simulation day, with snacks and rations as flexible alternatives rather than a rigid meal schedule. |
| Starvation | Severe hunger first suppresses recovery and performance. Direct Health loss begins only after prolonged maximum hunger and is intentionally slow in Standard. |
| Dehydration | When hydration is enabled, dehydration escalates faster than starvation and strongly affects stamina/recovery before direct Health loss begins. |
| Food Quality | Raw/simple foods may prevent starvation. Prepared and varied meals are better for nutrition, recovery and expedition readiness but are not mandatory every meal. |
| Food Safety | Spoilage/contamination state is supplied by Items/Recipes/world sources. 29C creates ingestion exposure payloads; 29F owns disease/toxin resolution. |
| Inventory Direction | Slot-based inventory remains authoritative. 29C does not add food weight or hidden mass simulation. |
| NPC Direction | Named actors may use detailed nourishment state; distant populations use meal-equivalent demand and nutrition summaries while conserving real stock through external inventory/settlement owners. |
| Economy Boundary | Set 27 owns food prices, scarcity valuation, markets, wages and trade. 29C exposes biological demand and urgency only. |
| Social Boundary | Set 28 owns meal dialogue, care behaviour, companion choices, hospitality reactions and social morale. 29C exposes hunger/nutrition/care state only. |
| Movement Boundary | Set 30 supplies activity/movement intensity. 29C changes physiological demand/modifiers but never defines movement speed or locomotion mechanics. |
| Engine Direction | Godot/Summer Engine, registry-driven definitions, deterministic transactions, explicit authority, simulation LOD and save-safe state. |
| Next Deliverable | 29D - Temperature, Wetness, Shelter, Sleep and Environmental Exposure. |

# Document Purpose

Document 29C defines Leyforge's nourishment layer: how hunger accumulates, how eating restores satiety, how recent diet quality becomes a small long-term nutrition state, how optional thirst and hydration work, how spoiled or unsafe intake hands exposure to Disease/Poison systems, and how those biological states publish modifiers to Health, Stamina, Fatigue, settlements, economy, companions and UI.

Earlier Leyforge documents deliberately established food as an important survival, farming, cooking, trade and settlement loop while leaving exact hunger depth for a later system. Player Progression explicitly retained hunger/food as a default resource while keeping thirst off by default. Items and Recipes already own food items, cooking, preservation and spoilage. Document 20 already treats Provisions as a physical settlement need backed by farms, kitchens, granaries, wells, fisheries and preservation. 29C does not replace those systems. It gives them one biological consumer contract.

This document also closes a production-level ambiguity left by the post-Atlas decision register: the standard player survival configuration now has a concrete hunger model, a supported but default-disabled thirst model, and a small nutrition model suitable for both individual play and civilisation simulation.

The numbers in this document are first-pass balance locks for implementation, automated testing and playtesting. They describe game simulation, not real-world physiology. They may be tuned through canonical data without changing ownership.

# Design Sources, Authority and Treatment

| Source | Relevant Direction | Treatment in 29C |
| --- | --- | --- |
| Cross-Set Interface Register v1.0 | Set 29 owns hunger, thirst and nutrition; Sets 27, 28 and 30 consume/produce interfaces without redefining biology. | Binding ownership contract. |
| 00 - Master Game Design Bible | Survival, farming, cooking, civilisation and configurable cosy-to-harsh play are connected pillars. | Food must create meaningful preparation and civilisation demand without overwhelming sandbox freedom. |
| 01 - Core Gameplay Loop | Survival is one step inside a wider sandbox loop. | Hunger pacing must allow long building/exploration sessions and create goals rather than constant maintenance. |
| 02 - Player Progression | Health, stamina, mana, hunger/food and temperature are core; thirst is not default. Food supports farming, cooking, trade, village needs and buffs. | Preserved. Thirst remains off in Standard. Nourishment can consume perks/modifiers but does not define progression rewards. |
| 04 - Items Registry | Food has item identity, spoilage, stack state, culture/trade role and consumable behaviour. | Item ownership retained; 29C requires biological trait fields and consumes them. |
| 05 - Crafting and Recipe Registry | Cooking and preservation exist; fresh food spoils, cooked food lasts longer, preserved food lasts longest; difficulty may reduce spoilage. | Recipe/spoilage ownership retained. 29C interprets the final consumed serving and safety state. |
| 06 - Resource Progression | Food, water and organics are survival supplies and civilisation resources. | 29C turns those supplies into biological demand without setting their trade value. |
| 16 - Combat, Gear and Defence | Food should not act as a universal instant combat heal; stamina and recovery remain readable. | Eating primarily restores nourishment; explicit food buffs remain data-driven and bounded. |
| 20 - Buildings/Settlement Projects | Provisions include farms, kitchens, granaries, wells, fisheries, preservation and distribution; Health depends on clean water and care. | 29C exposes population demand and biological consequences while Set 20 owns facilities/capacity. |
| 25A - Production Governance | Default hunger, thirst, temperature, sleep, illness and spoilage required later production decisions. | 29C resolves hunger/thirst/nutrition defaults and references Item/Recipe ownership for spoilage. |
| 26E - Swimming/Diving | Aquatic exertion already interacts with stamina/equipment; water contact does not itself define drinking/hydration. | 29C consumes movement/exertion and safe-water source traits where provided; it does not redefine swimming, breath or pressure. |
| 29A | Hunger enabled by default; nutrition should be small and readable; thirst fully supported but off by default. | Direct governing source. |
| 29B | Hunger/nutrition supply stamina-cost, stamina-regen, health-recovery and fatigue-gain modifiers. | 29C produces these modifiers and uses 29B for Health/Stamina/Fatigue outcomes. |

# Static Table of Contents

- 1. Locked 29C System Identity
- 2. Approved Decision Summary
- 3. Ownership and Non-Ownership Boundary
- 4. Nourishment State Architecture and Semantics
- 5. Biological Time, Update Cadence and Reserve Philosophy
- 6. Hunger and Satiety Model
- 7. Hunger Accumulation and Activity Modifiers
- 8. Hunger Bands, Physiological Effects and Starvation Debt
- 9. Food Consumption Transaction and Atomicity
- 10. Food Biological Trait Interface
- 11. Serving Size, Satiety Classes and Meal Structure
- 12. Nutrition Architecture and Design Scope
- 13. Nutritional Contribution Groups and Rolling Window
- 14. Nutrition Score, Bands and Physiological Effects
- 15. Variety, Repetition and Diminishing Benefit Rules
- 16. Thirst and Hydration System
- 17. Hydration Depletion and Environmental/Activity Modifiers
- 18. Thirst Bands, Dehydration Effects and Critical Dehydration
- 19. Drinking, Water Sources and Potability Handoff
- 20. Spoilage, Contamination and Food-Safety Handoff
- 21. Hunger/Hydration Interaction With Health, Stamina and Fatigue
- 22. Progression, Perks, Magic and Temporary Effects
- 23. NPCs, Companions and Biological Food Demand
- 24. Settlements, Provisions, Logistics and Population Nutrition
- 25. Economy, Trade and Scarcity Integration
- 26. Difficulty Profiles and Custom World Settings
- 27. Simulation LOD, Persistence and Offline Rules
- 28. Multiplayer Authority and Transaction Safety
- 29. UI, Feedback and Accessibility
- 30. Registry Definitions and Runtime Records
- 31. Balance, Anti-Grind and Anti-Exploit Rules
- 32. Validation, Test Cases and Acceptance Criteria
- 33. Cross-Set Interface Amendments
- Appendix A. Reference Balance Tables
- Appendix B. Provisional 29C API Contract
- Appendix C. Runtime Record Templates
- Appendix D. Worked Gameplay Examples
- Appendix E. Migration and Supersession Notes
- Appendix F. Terminology Register

# 1. Locked 29C System Identity

29C is the biological nourishment authority. It owns the actor's hunger, satiety reserve, optional hydration reserve, recent nutrition quality and the physiological consequences of eating or drinking. It does not own the apple, stew, waterskin, kitchen, well, farm, merchant or recipe that supplies nourishment.

> **Locked 29C Rule**
>
> Food must remain useful even when the player is not in danger of starvation. Simple food keeps a body functioning. Good meals improve readiness and recovery. Varied meals build a modest longer-term nutrition benefit. Thirst is opt-in outside Harsh mode. No default player should be forced to monitor hunger, hydration and nutrition as three constantly visible bars.

The system uses reserves and semantic bands rather than a realism simulator. The player should understand outcomes such as "Hungry - stamina recovery reduced" or "Well Nourished - recovery supported" without needing to inspect grams, calories, vitamins or water volume.

# 2. Approved Decision Summary

| Area | Locked 29C Decision |
| --- | --- |
| Hunger representation | Internal `satiety_reserve` runs 100 (full) to 0 (empty). Public `HungerLevel()` reports severity from 0 (not hungry) to 100 (maximum hunger). |
| Standard hunger rate | Baseline Hunger severity increases by 4.0 points per simulation hour, giving approximately 25 hours from fully sated to maximum hunger before modifiers. |
| Meal expectation | Standard balance roughly supports two substantial meals per simulation day, but the player may use snacks, rations, feast meals or irregular schedules. |
| Activity effect | Strenuous activity may increase hunger demand modestly; it may not make a brief sprint consume a meal's worth of reserve. |
| Nutrition complexity | Three broad contribution groups - Energy, Protein and Produce - plus a computed Variety component. No micronutrient tracking. |
| Nutrition horizon | Rolling 48 simulation hours, weighted toward the most recent 24 hours. |
| Nutrition benefits | Small and bounded: mainly Health recovery, Stamina regeneration, Fatigue resistance and workforce capacity modifiers. |
| Repetition | Repeating one food still provides full satiety and its nutrient contribution; only Variety benefit diminishes. |
| Thirst | Full system exists. Disabled by default in Peaceful, Relaxed and Standard; enabled in Harsh. |
| Hydration rate | When enabled, baseline severity increases by 5.0 points per simulation hour (about 20 hours from fully hydrated to maximum thirst) before modifiers. |
| Water safety | Potability/contamination is supplied externally; 29C creates ingestion exposure for 29F rather than inventing diseases. |
| Starvation damage | No Health loss merely for entering Hungry/Severe bands. At maximum hunger, a starvation-debt timer begins; direct Health loss starts only after prolonged debt. |
| Dehydration damage | When thirst is enabled, critical dehydration causes direct Health consequences sooner than starvation, after generous warnings. |
| Combat eating | Food is not a universal instant combat heal. Consumption may restore satiety/hydration during combat only if the item/action owner permits the consume action. |
| Overeating | No routine vomiting/obesity simulation. Excess satiety/hydration above reserve caps is discarded unless a specific consumable owns another effect. |
| NPCs | Same conceptual model, but distant populations use deterministic demand summaries and nutrition bands rather than per-bite simulation. |
| Offline player | Hunger/hydration cannot silently progress while the application is closed unless the player explicitly enables an advanced persistent-survival option later. |

# 3. Ownership and Non-Ownership Boundary

## 3.1 29C Owns

- Hunger severity and satiety reserve.
- Hunger accumulation rate and biological modifiers.
- Starvation debt and starvation biological consequences.
- Hydration reserve and thirst severity when enabled.
- Dehydration debt and dehydration biological consequences.
- Nutrition window, group satisfaction, variety and nutrition score.
- Biological interpretation of a consumed food/drink serving.
- Nourishment-derived Stamina/Health/Fatigue/workforce modifiers.
- Population biological food/hydration demand summaries.
- Consumption-related exposure handoff to 29F.

## 3.2 29C Does Not Own

- Food item IDs, stack sizes, rarity, quality or inventory storage - Items/Set 25 catalogues.
- Cooking, preservation, fermentation, smoking, drying, recipe time or ingredients - Document 05.
- Spoilage progression or freshness-state mutation - Item/Recipe systems.
- Farming, crop growth, livestock or fisheries - their existing system owners.
- Food prices, wages, markets, shortages or merchant stock - Set 27.
- Hospitality dialogue, companion meal choices, relationship reactions or social morale - Set 28.
- Sprinting, climbing, movement speed, swimming locomotion or vehicle travel - Set 30/Set 26 as reconciled.
- Disease identity, infection probability, incubation or symptoms - 29F.
- Poison/toxin lifecycle - 29F.
- Health resource logic and natural Health regeneration - 29B.
- Fatigue and Stamina resource truth - 29B.
- Ambient temperature, weather or shelter - external environment systems/29D.
- Ancestry/species-specific diet compatibility - final biological profile authority in 29H.

## 3.3 Cause, Response and Consequence Pattern

A normal food transaction follows:

1. Item/interaction owner identifies a valid consumable serving and reserves it.
2. 29C reads the serving's biological trait payload and the actor's biological profile.
3. 29C validates edibility, reserve caps and any biological restrictions.
4. Item transaction commits consumption once.
5. 29C applies satiety/hydration/nutrition and creates any exposure payload.
6. 29B/29F consume the resulting modifiers/exposure.
7. UI, Set 27, Set 28 and settlement systems consume published summaries.

No system is allowed to both remove an item and separately apply a duplicate nourishment event without a shared transaction ID.

# 4. Nourishment State Architecture and Semantics

## 4.1 Core Runtime Channels

| Channel | Range | Meaning | Persistence |
| --- | ---: | --- | --- |
| `hunger_severity` | 0..100 | 0 = not hungry, 100 = maximum hunger. | Yes. |
| `satiety_reserve` | 0..100 | Internal inverse reserve used by consumption math. | Can be derived from Hunger; one canonical representation only in implementation. |
| `starvation_debt_hours` | 0+ | Time spent at maximum hunger. | Yes if non-zero. |
| `thirst_enabled` | Boolean/profile state | Distinguishes disabled thirst from fully hydrated. | Derived from world/player profile. |
| `thirst_severity` | 0..100 when enabled | 0 = hydrated, 100 = maximum thirst. | Yes only when enabled. |
| `hydration_reserve` | 0..100 | Internal inverse of thirst severity. | Same canonicalisation rule as hunger. |
| `dehydration_debt_hours` | 0+ | Time spent at maximum thirst. | Yes if non-zero. |
| `nutrition_score` | 0..100 | Rolling diet-quality summary. | Yes/derivable from compact ledger. |
| `nutrition_group_state` | 3 groups | Rolling Energy, Protein, Produce satisfaction. | Compact ledger/summary. |
| `variety_score` | 0..100 | Recent food-family diversity. | Derivable from ledger. |
| `last_consumption_time` | World time | Explainability and LOD. | Yes for important actors. |
| `recent_food_ledger` | Bounded entries | Recent serving contributions for nutrition. | Compact/bounded. |

## 4.2 Public API Semantics

`HungerLevel()` returns hunger severity, not fullness. This avoids the ambiguous result where "HungerLevel 100" could mean either very hungry or very full.

`ThirstLevel()` returns a structure containing at minimum:

- `enabled`;
- `severity` when enabled;
- semantic band;
- trend;
- principal cause labels.

When thirst is disabled, the API must return `enabled=false`. It must not return a fake severity of zero that consumers might mistake for an active fully hydrated state.

## 4.3 No Hidden Duplicate Bars

The implementation may store satiety or hydration reserve internally, but only one authoritative number per concept exists. The UI may present a hunger icon, fullness phrasing or semantic band, but it may not create a second independent state.

# 5. Biological Time, Update Cadence and Reserve Philosophy

Nourishment uses authoritative **simulation time**, not render frames and not raw wall-clock seconds.

## 5.1 Update Cadence

For the active player, hunger/hydration may be integrated continuously or in small scheduled steps, but results must be deterministic within accepted tolerance. For NPCs, 1-5 simulation-minute scheduled updates are sufficient. Distant cohorts may resolve whole meal windows at once.

## 5.2 Reserve Philosophy

The reserve exists to create planning, not punishment:

- ordinary building sessions should not require repeated eating interruptions;
- a player leaving for a long dungeon should pack food;
- settlements need functioning food production and storage;
- cooked/preserved foods should be convenient and valuable;
- missed meals should create gradual impairment before danger;
- emergency food should remain useful even if nutritionally poor.

## 5.3 World-Time Changes

If a world supports accelerated time, sleep skipping or server time scaling, nourishment uses the same authoritative simulation duration. Time-skip systems must request a biological forecast before advancing so the player is warned if the skip would cross a severe hunger/hydration threshold.

# 6. Hunger and Satiety Model

## 6.1 Hunger Bands

| Band | Hunger Severity | Player Meaning |
| --- | ---: | --- |
| Sated | 0-20 | Recently fed; no need to eat. |
| Comfortable | 21-40 | Normal reserve; food optional. |
| Hungry | 41-60 | Food is becoming useful; mild warning. |
| Very Hungry | 61-80 | Readable performance/recovery pressure. |
| Severe Hunger | 81-99 | Strong preparation warning; recovery notably impaired. |
| Starving | 100 | Reserve exhausted; starvation debt begins. |

A player does not need to keep Hunger at zero. The normal stable range is broad. Eating while Comfortable is valid before an expedition, but the system should not teach obsessive topping-off.

## 6.2 Standard Baseline

Standard baseline:

`BaseHungerGain = 4.0 severity points per simulation hour`

At baseline this gives roughly 25 hours from fully Sated to Starving.

This value is intentionally a gameplay abstraction. It is tuned so that the player can generally eat a meaningful meal once or twice during a normal simulation day rather than servicing hunger every few minutes.

## 6.3 Starting New Characters

New characters normally start within `Sated` or low `Comfortable`, not at maximum reserve unless the world-start fiction provides a recent meal. World-start templates may select a starting band but should not create an immediate starvation problem unless the scenario explicitly intends harsh survival.

# 7. Hunger Accumulation and Activity Modifiers

## 7.1 Hunger Gain Formula

Reference composition:

`HungerGain = BaseRate * DifficultyRate * ActivityDemand * ThermalDemand * ConditionDemand * ProfileDemand`

All multipliers are bounded before application.

## 7.2 Activity Demand

Set 30/combat supplies activity intensity; 29C interprets it biologically.

| Activity | Reference Hunger-Demand Multiplier |
| --- | ---: |
| Resting / idle | 0.85 |
| Normal walking / routine work | 1.00 |
| Sustained manual work | 1.10 |
| Strenuous movement/combat | 1.20 |
| Extreme prolonged exertion | 1.30 cap from activity alone |

A ten-second sprint therefore has a negligible effect on the meal reserve. Long expeditions and repeated strenuous work matter over time.

## 7.3 Thermal and Condition Demand

29D may supply a `metabolic_demand_mult` for sustained cold/heat exposure. 29F/29E may supply disease/injury demand where justified. Common combined biological demand is bounded to **1.50x Standard baseline** unless a special authored condition explicitly owns a stronger effect.

## 7.4 No Action-Specific Hunger Costs

Movement/combat must not directly subtract arbitrary Hunger points per jump, sword swing or climb. Those systems provide activity intensity; 29C integrates demand over simulation time. This prevents duplicate charging and makes tuning understandable.

# 8. Hunger Bands, Physiological Effects and Starvation Debt

## 8.1 Standard Modifier Table

| Hunger Band | Stamina Regen | Stamina Cost | Health Recovery | Fatigue Gain | Work Capacity |
| --- | ---: | ---: | ---: | ---: | ---: |
| Sated | 1.05x | 1.00x | 1.05x | 0.98x | 1.00x |
| Comfortable | 1.00x | 1.00x | 1.00x | 1.00x | 1.00x |
| Hungry | 0.95x | 1.00x | 0.95x | 1.03x | 0.97x |
| Very Hungry | 0.85x | 1.05x | 0.75x | 1.15x | 0.90x |
| Severe Hunger | 0.70x | 1.10x | 0.25x | 1.30x | 0.75x |
| Starving | 0.55x | 1.20x | 0.00x | 1.50x | 0.50x |

These values are inputs to 29B and workforce consumers, not independent movement/combat rules.

## 8.2 Starvation Debt

At Hunger 100, `starvation_debt_hours` accumulates.

Standard first-pass:

- 0-6 hours at maximum hunger: no direct Health loss; severe performance/recovery penalties already apply.
- >6 to 24 hours: 0.5% Max Health biological loss per simulation hour.
- >24 hours: 1.0% Max Health biological loss per simulation hour.

The damage is submitted through 29B's internal biological Health transaction with a stable starvation cause ID. It is not combat damage and does not create an Injury by itself.

## 8.3 Recovery From Starvation

Eating immediately reduces Hunger according to the serving, but starvation debt does not need to vanish instantly. Standard rule:

- once Hunger drops below Severe, starvation Health loss stops;
- starvation debt decays at 2 hours per nourished simulation hour while Hunger remains below 60;
- debt never creates hidden penalties once direct starvation is stopped; it exists primarily to prevent rapid "one berry every six hours" exploit cycling.

## 8.4 Peaceful and Relaxed Safety

Peaceful: no starvation Health damage and no severe performance penalty by default.

Relaxed: starvation Health damage off by default; Hunger can reduce recovery/stamina modestly.

# 9. Food Consumption Transaction and Atomicity

Consumption changes inventory and biology, so it must be transactional.

## 9.1 Required Flow

1. Consumer requests `ConsumeServing` with actor ID, item instance/stack ID, serving count and transaction ID.
2. Item service validates ownership, quantity and current item state, then reserves the serving.
3. 29C resolves actor diet compatibility and reads the food biological payload.
4. If consumption is invalid, reservation is released and no biological state changes.
5. If valid, inventory consumption and biological application commit under the same transaction/evidence chain.
6. 29C applies satiety/hydration/nutrition and forwards any food-safety exposure.
7. Event `ServingConsumed` publishes reason-labelled results.

## 9.2 Duplicate Protection

A repeated transaction ID returns the prior result and may not consume a second item or apply a second nourishment payload.

## 9.3 Partial and Multi-Serving Items

Items may expose one or more servings. The Item system owns the remaining-serving state. 29C consumes one serving payload at a time unless the item definition explicitly declares atomic full consumption.

## 9.4 Consumption While Full

Consumption is permitted when Hunger is low if the action owner permits it. Satiety above the cap is discarded rather than creating an overfull meter. Explicit medicine, potion, feast or magical effects may still apply according to their owning definitions.

The UI should warn when most nourishment would be wasted, but it should not hard-block roleplay, feasts, quest meals or social eating.

# 10. Food Biological Trait Interface

29C requires food/drink definitions to expose biological traits without taking ownership of the item definition.

## 10.1 Required Trait Payload

| Field | Meaning |
| --- | --- |
| `serving_units` | Number of consumable servings represented by the current item state. |
| `satiety_points` | Hunger severity reduction for one serving before actor/profile modifiers. |
| `hydration_points` | Thirst severity reduction if hydration is enabled; may still support other drink effects when disabled. |
| `nutrition_energy_units` | Broad energy-group contribution. |
| `nutrition_protein_units` | Broad protein/body-building contribution. |
| `nutrition_produce_units` | Broad produce/micronutrient contribution. |
| `food_family_tags` | Stable families used for variety calculation, e.g. bread, root, fruit, meat, fish, fungus, stew. |
| `diet_tags` | Plant, meat, fish, fungus, dairy-like, magical, mineral, etc. Used by 29H compatibility. |
| `safety_profile_id` | Reference to ingestion-safety interpretation; specific disease/toxin remains 29F-owned. |
| `consumption_context_tags` | Hot meal, cold drink, preserved ration, raw, cooked, medicinal, ritual, alcoholic if ever admitted, etc. |
| `biological_effect_refs` | Optional explicit effects owned by other systems. |

## 10.2 What the Trait Payload Does Not Contain

The payload does not own:

- market price;
- recipe ingredients;
- spoilage timer progression;
- culture preference;
- social prestige;
- farming yield;
- disease identity;
- magic-school rules.

Those remain external and may be referenced by stable ID.

# 11. Serving Size, Satiety Classes and Meal Structure

Food definitions may use exact satiety points, but designers need readable classes.

| Serving Class | Reference Satiety Reduction | Typical Role |
| --- | ---: | --- |
| Taste / tiny | 1-7 | Ingredients, samples, small sweets. |
| Snack | 8-15 | Fruit, small pastry, handful food. |
| Light food | 16-25 | Simple ration component, bread, small cooked item. |
| Meal | 26-40 | Normal prepared dish or substantial serving. |
| Hearty meal | 41-55 | Large stew/roast/platter serving. |
| Feast serving | 56-70 | Exceptional event food; excess is commonly wasted if already fed. |

A typical Standard player at Hunger 50 can eat a normal Meal (around 35 points) and return to Sated/Comfortable without needing multiple menu actions.

## 11.1 Prepared Food Value

Prepared meals should commonly gain value through some combination of:

- higher satiety per inventory slot;
- multiple nutrition-group contributions;
- safer consumption;
- improved preservation from recipe state;
- explicit buffs from the food definition;
- culture/social/economy value owned elsewhere.

Raw foods remain viable emergency sustenance.

## 11.2 No Mandatory Breakfast/Lunch/Dinner Schedule

The simulation does not enforce named meal times on the player. NPC schedule owners may create breakfast/supper routines for social/world flavour, but 29C cares only about biological demand and recent consumption.

# 12. Nutrition Architecture and Design Scope

Nutrition exists to make varied cooking meaningful over a longer horizon than Hunger.

> **Locked Nutrition Rule**
>
> Nutrition may reward a good diet and gently penalise sustained poor diet, but it must not require the player to count nutrients, optimise every meal or carry a spreadsheet of ingredients.

## 12.1 What Nutrition Is

Nutrition is a rolling quality state based on broad food contributions across recent simulation time.

It affects:

- natural Health recovery support;
- Stamina regeneration support;
- Fatigue accumulation/resistance;
- longer-term workforce capacity;
- disease-resilience input to 29F where applicable.

## 12.2 What Nutrition Is Not

Nutrition is not:

- a second Hunger bar;
- a calorie counter;
- individual vitamins/minerals;
- body weight change;
- permanent stat growth;
- a requirement to eat every food category every day;
- a social morale system.

# 13. Nutritional Contribution Groups and Rolling Window

## 13.1 Broad Groups

29C uses three broad biological groups:

1. **Energy** - staples, fats, dense roots, grains, sugars and equivalents that support sustained fuel.
2. **Protein** - meat, fish, eggs, legumes, fungi, magical equivalents and other body-building sources.
3. **Produce** - fruits, vegetables, herbs, greens and equivalents representing broad micronutrient/fibre variety.

These are gameplay abstractions. Ancestry-specific biological profiles may weight or substitute groups in 29H.

## 13.2 Unit Scale

Each serving may contribute 0-3 units per group. It does not expose grams.

Reference examples only:

- plain bread: Energy 2, Protein 0, Produce 0;
- cooked meat: Energy 1, Protein 3, Produce 0;
- berries: Energy 1, Protein 0, Produce 2;
- balanced stew: Energy 2, Protein 2, Produce 2.

Actual food entries remain in canonical item/recipe data.

## 13.3 Rolling Window

Nutrition evaluates the last **48 simulation hours**:

- servings from the most recent 24 hours have full weight;
- servings 24-48 hours old have 0.5 weight;
- older servings no longer contribute.

This makes nutrition slow enough that one poor meal does not matter and one excellent meal does not instantly erase multiple days of deprivation.

## 13.4 Standard Group Targets

Reference target over the weighted window for a baseline adult profile:

- Energy: 6 weighted units;
- Protein: 4 weighted units;
- Produce: 4 weighted units.

29H may change targets for biological profiles. 29C owns the scoring logic, not species-specific target selection.

# 14. Nutrition Score, Bands and Physiological Effects

## 14.1 Score Composition

Reference:

`NutritionScore = 0.30*EnergySatisfaction + 0.30*ProteinSatisfaction + 0.30*ProduceSatisfaction + 0.10*VarietyScore`

Each group satisfaction is clamped 0..100 relative to the actor's target. Excess in one group does not replace another group.

## 14.2 Nutrition Bands

| Band | Score | Health Recovery | Stamina Regen | Fatigue Gain | Work Capacity |
| --- | ---: | ---: | ---: | ---: | ---: |
| Excellent | 80-100 | 1.05x | 1.05x | 0.95x | 1.02x |
| Good | 60-79 | 1.02x | 1.02x | 0.98x | 1.01x |
| Adequate | 40-59 | 1.00x | 1.00x | 1.00x | 1.00x |
| Poor | 20-39 | 0.90x | 0.92x | 1.08x | 0.92x |
| Depleted | 0-19 | 0.75x | 0.80x | 1.20x | 0.85x |

Nutrition does not directly drain Health in Standard. Severe long-term poor nutrition may raise biological vulnerability through 29F/29H, but 29C does not create specific deficiency diseases in Core Production.

## 14.3 Grace Period

New characters and newly promoted NPCs receive a neutral/adequate nutrition state until enough consumption history exists. The system must not assume a character is malnourished merely because their recent-food ledger is empty after load or migration.

# 15. Variety, Repetition and Diminishing Benefit Rules

Variety exists to reward cooking breadth without making repeated staples invalid.

## 15.1 Food Family Tracking

Nutrition tracks distinct `food_family_tags` consumed during the rolling window. The first four distinct families provide most of the Variety score. Additional families provide small diminishing benefit up to a cap.

Reference:

- 1 family: 20 Variety;
- 2 families: 45;
- 3 families: 70;
- 4 families: 90;
- 5+ families: 100.

## 15.2 Repeated Food Rule

Repeated consumption of the same family:

- always provides full satiety;
- always provides its declared Energy/Protein/Produce units;
- does not repeatedly increase Variety beyond its family contribution;
- does not create an arbitrary "food boredom" biological penalty.

Social enjoyment or culture preference belongs to Set 28/settlement morale systems.

## 15.3 No Universal Best Meal

A single high-tier meal may be excellent, but repeated use should not automatically satisfy every nutritional target unless its item definition genuinely provides the relevant groups. Even then, food variety may still provide a small advantage.

# 16. Thirst and Hydration System

Thirst is complete but profile-gated.

## 16.1 Default States

| Profile | Player Thirst |
| --- | --- |
| Peaceful | Off |
| Relaxed | Off |
| Standard | Off |
| Harsh | On |
| Custom | User controlled |

NPC settlements still require water for Provisions, sanitation, farming, industry and healthcare through their existing systems even when the local player's thirst system is disabled.

## 16.2 Disabled-State Rule

When thirst is off:

- `ThirstLevel().enabled=false`;
- no hydration reserve drains;
- dehydration penalties cannot occur;
- drink items still work for explicit buffs, medicines, temperature effects, culture/social interactions or quest requirements;
- world water infrastructure remains meaningful to settlements and recipes;
- a hot biome or quest may not silently turn on the entire thirst system unless the world/player profile explicitly allows contextual thirst activation.

## 16.3 Hydration State When Enabled

Hydration uses the same inverse structure as Hunger:

- `hydration_reserve=100` means fully hydrated;
- `thirst_severity=0` means no thirst;
- `hydration_reserve=0` / `thirst_severity=100` means critical dehydration reserve exhausted.

# 17. Hydration Depletion and Environmental/Activity Modifiers

## 17.1 Baseline Rate

When enabled:

`BaseThirstGain = 5.0 severity points per simulation hour`

This gives about 20 hours from fully hydrated to maximum thirst before modifiers.

Harsh profile may use 5.5; Custom may tune independently.

## 17.2 Hydration Demand Formula

`ThirstGain = BaseRate * DifficultyRate * ActivityDemand * ThermalDemand * ConditionDemand * ProfileDemand`

Reference activity multipliers:

| Activity | Hydration Demand |
| --- | ---: |
| Resting | 0.90x |
| Normal activity | 1.00x |
| Sustained manual work | 1.15x |
| Strenuous activity | 1.35x |
| Extreme prolonged exertion | 1.50x activity cap |

29D supplies heat/cold exposure demand. Hot conditions may increase hydration demand substantially; common combined activity + environment demand is bounded to **2.25x** unless a special biological hazard explicitly owns a stronger effect.

## 17.3 Swimming Is Not Drinking

Entering water never restores Hydration automatically. Swimming/diving movement state may affect demand, but drinking requires a valid consumable/source interaction and potability payload.

# 18. Thirst Bands, Dehydration Effects and Critical Dehydration

## 18.1 Hydration Bands

| Band | Thirst Severity | Meaning |
| --- | ---: | --- |
| Hydrated | 0-20 | Stable reserve. |
| Dry | 21-40 | Mild awareness only. |
| Thirsty | 41-60 | Drink planning useful. |
| Dehydrated | 61-80 | Noticeable stamina/recovery effects. |
| Severe Dehydration | 81-99 | Strong warning and functional pressure. |
| Critical Dehydration | 100 | Reserve exhausted; dehydration debt begins. |

## 18.2 Standard-When-Enabled Modifier Table

| Thirst Band | Stamina Regen | Stamina Cost | Health Recovery | Fatigue Gain | Work Capacity |
| --- | ---: | ---: | ---: | ---: | ---: |
| Hydrated | 1.03x | 1.00x | 1.00x | 0.98x | 1.00x |
| Dry | 1.00x | 1.00x | 1.00x | 1.00x | 1.00x |
| Thirsty | 0.95x | 1.00x | 0.95x | 1.05x | 0.97x |
| Dehydrated | 0.85x | 1.08x | 0.75x | 1.15x | 0.88x |
| Severe Dehydration | 0.70x | 1.15x | 0.35x | 1.35x | 0.70x |
| Critical Dehydration | 0.55x | 1.25x | 0.00x | 1.50x | 0.50x |

## 18.3 Dehydration Debt and Health Loss

At Thirst 100, debt begins.

Reference when enabled:

- first 2 hours: no direct Health loss; critical penalties/warnings apply;
- >2 to 8 hours: 1.0% Max Health biological loss per simulation hour;
- >8 hours: 2.0% Max Health per simulation hour.

This remains less important than warning and prevention. The player should have ample time to react, and direct damage is not applied while the thirst system is disabled.

## 18.4 Debt Recovery

Once Thirst drops below 80, direct dehydration Health loss stops. Debt decays at 3 hours per adequately hydrated simulation hour while Thirst remains below 40.

# 19. Drinking, Water Sources and Potability Handoff

## 19.1 Drink Serving Classes

| Drink Class | Reference Hydration Reduction |
| --- | ---: |
| Sip / tiny | 5-12 |
| Small drink | 13-25 |
| Normal drink | 26-40 |
| Large drink | 41-60 |
| Major refill | 61-80 |

Exact values belong to the item/source biological trait payload.

## 19.2 Water Source Interaction

A world water source may expose a `DrinkSourcePayload` containing:

- source ID/location;
- available serving/flow permission;
- potability/safety grade;
- temperature context if relevant;
- contamination/toxin tags;
- ownership/permission result supplied externally;
- stable transaction/evidence ID.

29C interprets the consumption. It does not own whether the well is public, whether the player stole water or whether a river block exists.

## 19.3 Potability Grades

Recommended semantic grades:

- **Safe** - no special ingestion exposure beyond item-specific effects.
- **Uncertain** - may carry pathogen/toxin exposure depending on 29F resolution.
- **Contaminated** - significant ingestion exposure supplied to 29F.
- **Toxic/Unsafe** - strong toxin/pathogen payload; UI must warn when the actor has the knowledge to recognise it.

Boiling, filtering, purification and preservation transformations belong to Recipe/Item systems. Their outputs should resolve to a new safety profile rather than having 29C secretly purify the water.

# 20. Spoilage, Contamination and Food-Safety Handoff

29C does not run the spoilage clock. It consumes the item's current freshness/safety state at the moment of consumption.

## 20.1 Freshness State Inputs

The Item/Recipe owner may expose semantic states such as:

- fresh;
- aging;
- stale;
- spoiled;
- rotten;
- preserved;
- magically stabilised;
- contaminated.

29C must not assume every stale food is dangerous or every preserved item is perfectly safe. The item's `safety_profile_id` is authoritative.

## 20.2 Ingestion Exposure Flow

1. Serving is consumed.
2. 29C creates `IngestionExposure` from the item's safety profile, freshness state, actor diet profile and serving count.
3. 29F resolves disease/toxin exposure and subsequent biology.
4. 29C does not create a parallel "food poisoning" debuff.

## 20.3 Known and Unknown Risk

UI presentation is knowledge-sensitive. A visibly rotten meal can warn directly. An apparently clean but contaminated water source may show no exact risk until the player has relevant knowledge, testing or NPC information. The biological outcome remains authoritative regardless of what the player knows.

# 21. Hunger/Hydration Interaction With Health, Stamina and Fatigue

29C publishes modifier bundles; 29B owns final resource math.

## 21.1 Nourishment Modifier Bundle

Provisional output:

- `stamina_regen_mult`;
- `stamina_cost_mult`;
- `health_recovery_mult`;
- `fatigue_gain_mult`;
- `work_capacity_mult`;
- `disease_resilience_mult` (input only; 29F owns disease outcome);
- reason labels and contributing bands.

## 21.2 Composition

Hunger, Hydration and Nutrition modifiers multiply into 29B's bounded composition pipeline. Their combined ordinary contribution should be clamped so that being hungry, poorly nourished and thirsty does not create mathematically absurd zero/ten-times outcomes before injuries, disease and temperature are considered.

Recommended combined nourishment clamp for ordinary non-critical modifiers:

- minimum Stamina regeneration contribution: 0.40x;
- maximum nourishment-only Stamina regeneration contribution: 1.12x;
- maximum nourishment-only Stamina cost increase: 1.35x;
- minimum Health natural-recovery contribution: 0.00x at critical states;
- maximum nourishment-only Health-recovery contribution: 1.12x;
- maximum nourishment-only Fatigue gain: 1.75x.

Critical starvation/dehydration Health loss is separate from these modifier clamps.

# 22. Progression, Perks, Magic and Temporary Effects

## 22.1 Progression Boundary

Document 02 may grant modifiers such as:

- slower hunger gain;
- slower thirst gain when enabled;
- better satiety from prepared food;
- improved nutrition retention;
- safer foraging knowledge;
- improved expedition-ration efficiency.

29C consumes approved modifiers but does not decide skill XP, perk trees or unlock conditions.

## 22.2 Bounded Efficiency

Normal progression should not reduce hunger/thirst demand to zero. Recommended common lower bound:

- hunger rate cannot fall below 0.60x profile baseline from ordinary perks/equipment;
- hydration rate cannot fall below 0.60x when enabled;
- extraordinary magical/realm effects may exceed this only through explicit authored rules.

## 22.3 Magic

Magic may:

- conjure food/drink;
- preserve food;
- purify water;
- reduce metabolic demand;
- create nourishment directly;
- suppress symptoms temporarily.

But any effect that claims biological nourishment must send a valid nourishment payload to 29C. A visual feast does not fill Hunger unless the magic definition says so. Set 29 does not decide spell cost, school, research or rarity.

## 22.4 No Free-Economy Assumption

If magic creates unlimited food, Set 27 and settlement systems may react economically, but 29C does not nerf biological nourishment merely to protect prices. The owning magic/economy design must explicitly balance creation cost and availability.

# 23. NPCs, Companions and Biological Food Demand

## 23.1 Named NPCs

Named NPCs may retain:

- Hunger band/reserve;
- nutrition band/compact ledger;
- Hydration state when the world/profile uses it for NPC biology;
- meal history relevant to quests/relationships;
- disease/toxin exposure from consumed goods.

They do not need full per-frame digestion.

## 23.2 Companion Care

Set 28 consumes:

- `HungerLevel()`;
- `NutritionStatus()`;
- `ThirstLevel()`;
- `FoodCareNeed()`;
- `FoodPreferenceEligibility()` where biological compatibility matters.

Set 28 decides whether a companion asks for food, shares supplies, refuses unsafe food, cooks, reminds the player or reacts socially.

## 23.3 Population Demand Profile

29C exposes a biological demand profile rather than an economic demand.

Baseline adult aggregate reference:

- `meal_equivalent_per_day = 2.0`;
- `nutrition_group_targets` matching the actor profile;
- `drink_equivalent_per_day = 0` when thirst is disabled for the relevant population simulation, otherwise a profile-defined amount;
- priority increases as population Hunger/Nutrition state worsens.

The exact item quantities used to satisfy a meal equivalent are resolved by settlement inventory/food-service logic through item traits.

# 24. Settlements, Provisions, Logistics and Population Nutrition

Set 20's Provisions system already owns food/water facilities and settlement service capacity. 29C supplies the biological demand those facilities attempt to satisfy.

## 24.1 Distant Settlement Meal Resolution

A distant settlement step may:

1. request population meal-equivalent demand from 29C;
2. identify valid food stock through settlement/logistics owners;
3. reserve/consume real items using authoritative inventory transactions;
4. calculate supplied satiety and nutrition group units from the consumed stock;
5. send aggregate nourishment result back to 29C;
6. update population hunger/nutrition bands and at-risk counts.

No abstract "food points" may appear from nowhere. Aggregation changes simulation granularity, not conservation.

## 24.2 Provisions Shortage Outcomes

29C may publish:

- population hunger distribution;
- nutrition quality trend;
- starvation-risk count;
- hydration-risk count if enabled;
- meal demand and urgency;
- biological workforce modifier.

Settlement/Quest/Event/Economy systems decide rationing policy, requests, unrest, migration, prices, emergency aid and political consequences.

## 24.3 Kitchens and Dining Facilities

A kitchen or dining hall does not directly improve nutrition because it exists. It must process or serve actual food through validated recipes/services. Set 20 owns facility activation; 29C reads the final servings supplied.

# 25. Economy, Trade and Scarcity Integration

Set 27 may consume the following from 29C:

- `FoodDemandProfile()`;
- `FoodDemandUrgency()`;
- population meal-equivalent demand;
- nutrition-group shortage profile;
- Hydration demand when enabled;
- biological productivity loss from shortage;
- starvation/dehydration risk counts.

Set 27 determines:

- price;
- market scarcity;
- merchant stocking;
- wages;
- route profit;
- ration price;
- tariffs;
- public subsidy;
- famine-market behaviour.

> **Economy Boundary Rule**
>
> A food shortage may make people hungry because food is not physically supplied. It does not make them hungry because Set 27 says the price is high. Price can affect access through external purchasing/stock rules, but biological state changes only through actual nourishment outcomes.

# 26. Difficulty Profiles and Custom World Settings

## 26.1 Reference Profiles

| Setting | Peaceful | Relaxed | Standard | Harsh |
| --- | --- | --- | --- | --- |
| Hunger | Benefit-focused / very slow | On, slow | On | On, stronger |
| Hunger rate | 0.35x | 0.55x | 1.00x | 1.35x |
| Hunger penalties | None/minimal | Reduced | Full Standard | Stronger |
| Starvation Health loss | Off | Off | On after long delay | On after shorter delay |
| Nutrition | Benefits only | Simplified | Full small model | Full |
| Nutrition penalties | Off | Mild | Standard | Stronger |
| Thirst | Off | Off | Off | On |
| Thirst rate when enabled | 0.60x | 0.75x | 1.00x | 1.10x |
| Dehydration Health loss | Off unless custom | Reduced/custom | Only if thirst custom-enabled | On |
| Contaminated-food consequences | Reduced | Reduced | Standard | Standard/strong |
| NPC provisions | Still meaningful | Meaningful | Full | Full/stronger |

## 26.2 Peaceful Benefit-Only Rule

Peaceful does not delete food content. Eating may still grant:

- satiety flavour/state;
- meal buffs;
- nutrition benefits;
- cultural/social value;
- settlement provisions demand;
- cooking progression;
- trade value.

But the local player's neglect does not create punitive starvation by default.

## 26.3 Custom Controls

Expose at minimum:

- player hunger enabled;
- hunger-rate scalar;
- hunger performance penalties;
- starvation Health damage;
- nutrition mode: Off / Benefits Only / Simplified / Full;
- nutrition penalty strength;
- thirst enabled;
- hydration-rate scalar;
- dehydration Health damage;
- NPC nourishment simulation severity;
- contaminated-food/water severity handoff;
- offline nourishment progression (default Off and may remain Deferred until safe).

Spoilage speed belongs to Item/Recipe settings, though the same world preset may configure it through that owner.

# 27. Simulation LOD, Persistence and Offline Rules

## 27.1 Active Player

Track exact hunger/hydration/nutrition state and consumption transactions.

## 27.2 Nearby Named NPCs

Track current bands and scheduled nourishment updates. Physical eating animations are presentation, not a requirement for biological correctness.

## 27.3 Distant Named NPCs

Resolve meals in scheduled windows using saved demand, available provisions and deterministic allocation. Preserve meaningful severe states and individual quest/story relevance.

## 27.4 Routine Population Cohorts

Store summaries such as:

- population count;
- average Hunger band;
- at-risk count;
- weighted nutrition score/band;
- meal demand due next window;
- hydration risk if enabled;
- last resolution time.

Do not store every meal event for hundreds of abstract citizens.

## 27.5 Offline Player Safety

Default: application-closed wall time does not advance player Hunger, Hydration or Nutrition. World/server simulation may continue only when an authoritative server/world remains active.

On reconnect, the server-authoritative player state is used. No client estimates are allowed to create extra hunger or restore food.

# 28. Multiplayer Authority and Transaction Safety

## 28.1 Authority

The authoritative host/server owns:

- hunger/hydration state;
- nourishment transaction commit;
- nutrition ledger/summary;
- starvation/dehydration debt;
- food-safety exposure creation.

Clients may predict UI animation but not consume authoritative food or modify biological state independently.

## 28.2 Shared Containers and Double Consumption

When two players attempt to consume the final serving from shared storage:

- the inventory owner reserves/commits exactly one valid transaction;
- the losing request receives a clean failure;
- 29C applies nourishment only to the committed transaction.

## 28.3 Split-Screen

Each local player has independent biological state and contextual UI. Shared-screen presentation must not merge hunger warnings into one ambiguous indicator.

# 29. UI, Feedback and Accessibility

29C follows Document 17's world-first, progressive-disclosure approach.

## 29.1 Hunger Presentation

Do not require an always-visible numeric Hunger bar in Standard. Preferred behaviour:

- hidden/minimal while Sated or Comfortable;
- contextual indicator when Hungry;
- stronger multi-channel warning at Very Hungry/Severe;
- persistent critical warning at Starving.

Detailed inspection may show percentage, trend and estimated reserve duration if the player enables advanced information.

## 29.2 Nutrition Presentation

Nutrition is normally a semantic status such as:

- Well Nourished;
- Good Diet;
- Adequate;
- Poor Diet;
- Nutritionally Depleted.

The UI can explain missing broad groups without showing microscopic nutrition math:

> Diet quality: Poor - little Produce in the last two days.

## 29.3 Food Tooltip Requirements

Food tooltips may expose readable biological traits:

- Satiety: Snack / Light / Meal / Hearty;
- Nutrition: Energy + Protein + Produce tags;
- Hydration: None / Small / Moderate / Large when relevant;
- Safety/freshness state if known;
- explicit biological buffs/effects.

Exact numeric values are optional under detailed-information settings.

## 29.4 Accessibility

- Never rely on colour alone for Hunger/Thirst severity.
- Support text labels and icon shapes.
- Allow survival notification frequency reduction.
- Avoid heartbeat/panting loops that cannot be reduced.
- Allow thirst to remain disabled independently of difficulty.
- Critical warnings use visual + audio/caption channels where practical.
- Food safety uncertainty should have text equivalents for sensory cues.

# 30. Registry Definitions and Runtime Records

Final canonical schemas belong to 29J/Set 25, but 29C requires the following families.

## 30.1 `NourishmentProfile`

Suggested fields:

- `qualified_id`;
- `revision`;
- `base_hunger_gain_per_hour`;
- `base_thirst_gain_per_hour`;
- `starvation_damage_delay_hours`;
- `dehydration_damage_delay_hours`;
- band thresholds;
- modifier tables;
- nutrition window length;
- nutrition group targets;
- variety thresholds;
- multiplier clamps;
- difficulty overrides;
- validation status.

## 30.2 `FoodBiologicalTraits`

Reference fields from Section 10 plus:

- source item/serving ID;
- profile compatibility tags;
- heat/cold ingestion tag if used by 29D;
- freshness/safety source refs;
- explicit effect refs;
- UI descriptor keys.

## 30.3 `NourishmentState`

Suggested runtime fields:

- actor ID;
- hunger severity;
- starvation debt;
- thirst enabled;
- thirst severity;
- dehydration debt;
- nutrition score;
- group satisfaction summary;
- recent bounded ledger or compact equivalent;
- last update world time;
- last serving transaction ID;
- current modifier bundle hash/revision;
- migration version.

# 31. Balance, Anti-Grind and Anti-Exploit Rules

## 31.1 No Hunger Spam

Standard must permit sustained building/exploration without frequent interruption. If playtests show the player commonly eats more than 2-3 substantial times per simulation day without special exertion, baseline tuning should be reviewed.

## 31.2 No Food-as-Potion Default

Satiety is not direct Health. A meal may improve future recovery, but ordinary food should not instantly erase combat damage unless an explicit item effect owns that behaviour.

## 31.3 No One-Berry Starvation Reset

Starvation debt decay prevents tiny repeated snacks from immediately clearing prolonged starvation consequences. Small food is still useful; it just does not erase history instantly.

## 31.4 No Nutrition Punishment for Repetition Alone

A simple staple remains biologically useful. Repetition only limits Variety benefit; it does not secretly reduce satiety or declared nutrient units.

## 31.5 No Mandatory Thirst Creep

Content cannot silently turn the default Standard profile into a hydration-survival game. Contextual hazards may apply other biological effects through their owners, but full thirst requires an enabled profile.

## 31.6 No Unsafe Water Exploit From Disable State

Turning thirst off does not make toxic water safe if the player chooses to drink it for another reason. Ingestion safety is still resolved when consumption occurs.

## 31.7 No Free Food Duplication

Nourishment applies only after a successful authoritative consumption/serving transaction. UI preview, animation, crafting completion or dropped-item pickup cannot independently apply satiety.

## 31.8 No Population Food From Abstract Money

A settlement cannot satisfy biological nourishment solely by subtracting currency. Trade may obtain actual food through Set 27/logistics, after which the food must enter valid stock/service flow.

# 32. Validation, Test Cases and Acceptance Criteria

## 32.1 Data Validation

Reject or warn on:

- negative satiety/hydration points unless explicitly modelled as a harmful effect;
- food traits with unknown nutrition group fields;
- safety profile references that do not resolve;
- duplicate family tags caused by aliases;
- Hunger/Thirst band gaps/overlap;
- starvation/dehydration direct-damage thresholds <= warning thresholds without approved override;
- normal profile with Thirst enabled when the locked Standard preset says Off;
- nutrition group target zero where a scoring weight expects a group;
- unbounded multiplier values;
- servings that consume inventory but have no transaction/evidence ID;
- population demand profiles without biological-profile ownership.

## 32.2 Required Gameplay Tests

1. Fully Sated Standard player reaches Starving in approximately 25 simulation hours at baseline.
2. Ordinary walking does not materially accelerate Hunger beyond normal activity.
3. Long strenuous activity raises Hunger slowly, not per action spam.
4. A Meal reduces Hunger once and consumes exactly one serving.
5. Duplicate transaction retry does not duplicate satiety or remove a second item.
6. Repeated bread prevents starvation but gives lower Variety than a mixed diet.
7. Balanced stew contributes to multiple nutrition groups.
8. One good meal does not instantly clear a multi-day poor Nutrition state.
9. New/migrated player receives a neutral Nutrition grace state.
10. Standard profile returns Thirst disabled and no hydration drain.
11. Harsh profile enables Hydration and reaches critical range on the expected timescale.
12. Heat/exertion increases hydration demand but respects the combined cap.
13. Swimming does not hydrate the player.
14. Drinking safe water reduces Thirst exactly once.
15. Drinking contaminated water creates one 29F ingestion exposure without inventing a separate 29C disease.
16. Starvation direct Health loss starts only after configured debt delay.
17. Eating below the Severe threshold stops starvation Health loss.
18. Peaceful profile never kills the player through hunger by default.
19. Distant settlement nourishment conserves actual food stock.
20. Two clients competing for one food serving cannot both receive nourishment.
21. Closing the application overnight does not starve the player in default offline rules.
22. UI can explain Hunger/Nutrition causes without numeric-only presentation.

## 32.3 29C Acceptance Criteria

29C is accepted when:

- Hunger has one unambiguous API semantic and a playable Standard cadence.
- Thirst is fully specified while remaining off by default in Standard.
- Nutrition is meaningful but small, readable and bounded.
- Food/Recipe ownership is preserved.
- Starvation/dehydration escalation is gradual and difficulty-aware.
- Consumption is transaction-safe.
- Food/water safety hands cleanly to 29F.
- 29B receives complete nourishment modifiers without duplicating Hunger logic.
- Set 27 receives biological demand without economy duplication.
- Set 28 receives care/need state without dialogue duplication.
- Set 30 supplies activity state without Hunger redefining movement.
- Named and distant NPCs can share the same biological logic at different simulation detail.
- Cross-set amendments are recorded for final integration.

# 33. Cross-Set Interface Amendments

These amendments add required interfaces only. They do not transfer ownership.

## AM-29-003 Refinement - Economy Food Demand Interface

**Set 29 -> Set 27**

29C refines the earlier demand contract with:

- `FoodDemandProfile(actor_or_population)`;
- `FoodDemandUrgency()`;
- `NutritionShortageProfile()`;
- `HydrationDemandProfile()` when enabled;
- `PopulationStarvationRisk()`;
- `NourishmentWorkforceModifier()`.

Set 27 converts these signals into market demand, price, trade and public-finance outcomes.

## AM-29-012 - Food Biological Trait Interface

**Items/Recipes/Set 25 schema -> Set 29**

Food and drink definitions require a stable biological trait payload containing satiety, hydration, broad nutrition groups, family tags, diet tags, servings and safety profile references.

This does not transfer food/item ownership to Set 29.

## AM-29-013 - Atomic Consumption Transaction Interface

**Item/Inventory owner <-> Set 29**

Required transaction fields:

- transaction ID;
- actor ID;
- item/stack/source ID;
- serving count;
- reserve/commit/cancel result;
- biological payload revision;
- authoritative timestamp.

One committed inventory consumption maps to one biological application.

## AM-29-014 - Social Nourishment/Care Interface

**Set 29 -> Set 28**

Expose:

- `FoodCareNeed()`;
- `HungerBand()`;
- `NutritionStatus()`;
- `ThirstStatus()`;
- diet/edibility eligibility result where relevant.

Set 28 owns dialogue, sharing decisions, hospitality, companion behaviour and social reaction.

## AM-29-015 - Activity Demand Interface Refinement

**Set 30 / Combat -> Set 29**

Existing activity intensity should also expose a bounded metabolic demand context usable by Hunger/Hydration accumulation. Set 29 owns the final biological demand calculation.

Set 30 does not subtract Hunger or Thirst directly.

## AM-29-016 - Environmental Hydration/Metabolic Demand Interface

**29D / environmental owners -> 29C**

Provide:

- `metabolic_demand_mult`;
- `hydration_demand_mult`;
- stable reason tags (heat, cold, exposure, magical environment).

29C applies those modifiers to nourishment reserves. Ambient environment remains externally owned.

## AM-29-017 - Ingestion Exposure Handoff

**29C -> 29F**

`IngestionExposure` should include:

- source consumable/source ID;
- serving count;
- safety profile;
- freshness/contamination state reference;
- actor biological profile reference;
- pathogen/toxin exposure tags and magnitude supplied by source data;
- transaction ID/time.

29F owns whether infection/poisoning occurs and all subsequent lifecycle.

## AM-29-018 - Population Provisions Satisfaction Interface

**Settlement/Inventory owners <-> Set 29**

Settlement systems request biological meal demand; external stock/services consume real items and return a `PopulationNourishmentResult` containing supplied satiety, nutrition group coverage and affected population. 29C updates population biological state.

## Amendment Status Table

| Amendment | Status | Ownership Transfer? | Final Review |
| --- | --- | --- | --- |
| AM-29-003 Refinement | Proposed/required | No | Final 27-30 reconciliation |
| AM-29-012 | Proposed/required | No | 29J + Item/Recipe schema revision |
| AM-29-013 | Proposed/required | No | 29J + inventory technical owner |
| AM-29-014 | Proposed/required | No | Set 28 integration |
| AM-29-015 | Proposed/required | No | Set 30 integration |
| AM-29-016 | Proposed/required | No | 29D/environment integration |
| AM-29-017 | Internal Set 29 required | No | 29F/29J |
| AM-29-018 | Proposed/required | No | Settlement/29J integration |

# Appendix A. Reference Balance Tables

## A.1 Hunger Reference

| Metric | Standard Reference |
| --- | ---: |
| Base hunger gain | 4.0 severity/hour |
| Full reserve to Starving | 25 simulation hours |
| Hungry threshold | 41 |
| Very Hungry threshold | 61 |
| Severe threshold | 81 |
| Starvation Health-loss delay | 6 hours at Hunger 100 |
| Late starvation escalation | after 24 debt hours |
| Activity multiplier cap | 1.30x |
| Common combined demand cap | 1.50x |

## A.2 Nutrition Reference

| Metric | Standard Reference |
| --- | ---: |
| Window | 48 simulation hours |
| Recent 0-24h weight | 1.0 |
| Older 24-48h weight | 0.5 |
| Energy target | 6 weighted units |
| Protein target | 4 weighted units |
| Produce target | 4 weighted units |
| Variety families for near-full score | 4 |
| Positive physiological cap | Approximately +5% per individual output before global clamp |

## A.3 Hydration Reference (When Enabled)

| Metric | Reference |
| --- | ---: |
| Base thirst gain | 5.0 severity/hour |
| Full reserve to Critical | 20 simulation hours |
| Dehydrated threshold | 61 |
| Severe threshold | 81 |
| Direct Health-loss delay | 2 hours at Thirst 100 |
| Activity demand cap | 1.50x |
| Common activity + environment cap | 2.25x |

# Appendix B. Provisional 29C API Contract

## B.1 Queries

- `HungerLevel(actor_id) -> {severity, band, trend, starvation_debt}`
- `SatietyReserve(actor_id) -> float`
- `NutritionStatus(actor_id) -> {score, band, group_summary, variety}`
- `ThirstLevel(actor_id) -> {enabled, severity?, band?, trend?}`
- `FoodDemandProfile(actor_or_population_id)`
- `FoodDemandUrgency(actor_or_population_id)`
- `NutritionShortageProfile(population_id)`
- `FoodCareNeed(actor_id)`
- `NourishmentModifierBundle(actor_id)`

## B.2 Commands / Transactions

- `ApplyConsumedServing(transaction_id, actor_id, biological_payload)`
- `ApplyPopulationNourishment(result_id, population_id, nourishment_result)`
- `SetNourishmentProfile(actor_id, profile_id)`
- `ApplyTimeAdvance(actor_id, simulation_delta)`

## B.3 Events

- `HungerBandChanged`
- `StarvationStarted`
- `StarvationDamageStarted`
- `ServingConsumed`
- `NutritionBandChanged`
- `ThirstBandChanged`
- `CriticalDehydrationStarted`
- `IngestionExposureCreated`
- `PopulationProvisionsRiskChanged`

# Appendix C. Runtime Record Templates

## C.1 Nourishment State Example

```text
NourishmentState
  actor_id
  profile_id
  hunger_severity
  starvation_debt_hours
  thirst_enabled
  thirst_severity
  dehydration_debt_hours
  nutrition_score
  energy_satisfaction
  protein_satisfaction
  produce_satisfaction
  variety_score
  recent_food_ledger_compact
  last_consumption_time
  last_update_time
  last_transaction_id
  schema_version
```

## C.2 Food Biological Payload Example

```text
FoodBiologicalTraits
  source_definition_id
  serving_units
  satiety_points
  hydration_points
  nutrition_energy_units
  nutrition_protein_units
  nutrition_produce_units
  food_family_tags[]
  diet_tags[]
  safety_profile_id
  consumption_context_tags[]
  biological_effect_refs[]
  revision
```

## C.3 Population Nourishment Result Example

```text
PopulationNourishmentResult
  result_id
  settlement_id
  population_profile_counts[]
  meal_equivalents_requested
  meal_equivalents_supplied
  energy_units_supplied
  protein_units_supplied
  produce_units_supplied
  unique_food_families_supplied
  affected_population_count
  inventory_transaction_refs[]
  simulation_window
```

# Appendix D. Worked Gameplay Examples

## D.1 Builder's Day

A Standard player begins Sated, spends most of the day placing blocks and moving around a settlement, and reaches Hungry late in the day. A normal cooked meal restores enough satiety to remain Comfortable into the next morning. The player did not need to stop construction several times just to eat.

## D.2 Long Mining Expedition

A player enters a cave at Hunger 25. Several hours of walking, mining and occasional combat slowly raise Hunger. A preserved ration reduces Hunger and provides Energy + Protein but little Produce. It works well as expedition food; if the player lives on it for two days, nutrition remains acceptable but not Excellent.

## D.3 Bread-Only Survival

A stranded player eats only bread. Satiety remains healthy and starvation never begins. Energy nutrition is satisfied, but Protein/Produce and Variety lag. Over time the Nutrition status becomes Poor, causing modest recovery/fatigue penalties. The system does not declare the bread worthless or immediately inflict a disease.

## D.4 Harsh Desert Travel

Harsh mode enables Thirst. Set 30 supplies strenuous travel state and 29D supplies strong heat demand. Hydration drains faster, the player sees Thirsty and Dehydrated warnings, and drinking from a carried safe source restores the reserve. Hunger is also rising, but less dramatically than hydration.

## D.5 Unsafe River Water

The player drinks directly from an `Uncertain` river source. 29C restores Hydration because the water physically supplies it, then creates one ingestion exposure using the source safety profile. 29F later resolves whether any disease develops. 29C does not apply a generic food-poisoning timer.

## D.6 Settlement Shortage

A town's farm output fails after a world event. 29C reports increasing population meal demand and a nutrition shortage. Set 27 raises market scarcity/prices according to its own rules; Set 20/settlement systems ration physical stock; Quest/Event may create relief work. 29C only changes biological state according to meals actually supplied.

# Appendix E. Migration and Supersession Notes

1. Earlier Player Progression references to hunger remain valid in principle but exact hunger timing/modifiers are superseded by 29C.
2. Earlier "No thirst by default" direction is retained and now has explicit `enabled=false` semantics.
3. Any POC food implementation that directly heals Health because it is food must be reviewed; explicit consumable healing may remain only where owned by the item/effect definition.
4. Existing Item/Recipe spoilage rules remain authoritative for freshness-state mutation. 29C only consumes their current state.
5. Existing settlement Provisions rules remain authoritative for facilities and resource conservation; 29C supplies biological demand/state.
6. Any existing code that subtracts Hunger per movement action should migrate to activity-intensity/time integration.
7. Existing saves without nutrition history migrate to `Adequate` grace state and an empty bounded ledger with a grace-expiry time, not to Depleted.
8. Existing saves without Hydration state remain `thirst_enabled=false` under Standard unless their world profile explicitly enables thirst.
9. All new food trait IDs and state records must follow Set 25 canonical ID/schema/migration rules.

# Appendix F. Terminology Register

| Term | Locked Meaning |
| --- | --- |
| Hunger Severity | Public 0-100 need level; 0 not hungry, 100 maximum hunger. |
| Satiety Reserve | Internal inverse reserve; implementation should store either canonical Hunger or Satiety, not two independently mutable values. |
| Starvation Debt | Time spent at maximum Hunger used for delayed severe consequences. |
| Nutrition Score | Rolling 0-100 diet-quality summary across broad groups and variety. |
| Energy Group | Broad staple/fuel contribution; not player-visible calories. |
| Protein Group | Broad body-building food contribution. |
| Produce Group | Broad fruit/vegetable/herb equivalent contribution. |
| Variety | Recent diversity of food families; small part of Nutrition Score. |
| Thirst Severity | Public hydration need when enabled; 0 hydrated, 100 critical. |
| Hydration Reserve | Internal inverse of Thirst severity. |
| Dehydration Debt | Time at maximum Thirst used for delayed direct Health consequences. |
| Serving | Biological consumption unit exposed by an item/source. |
| Meal Equivalent | Population-simulation demand unit, resolved into real food stock by external systems. |
| Potability | Semantic safety of a drink source; disease/toxin resolution remains 29F-owned. |
| Ingestion Exposure | Handoff payload from consumption to 29F for disease/toxin resolution. |
| Biological Trait Payload | Item/Recipe-owned data describing what a consumed serving supplies to Set 29. |
| Benefit-Only | Survival mode where food/nutrition content remains useful but neglect does not apply punitive player consequences. |
