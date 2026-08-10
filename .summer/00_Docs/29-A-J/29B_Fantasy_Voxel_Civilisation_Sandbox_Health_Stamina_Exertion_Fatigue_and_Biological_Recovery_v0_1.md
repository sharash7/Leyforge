# FANTASY VOXEL CIVILISATION SANDBOX

## DOCUMENT SET 29

# 29B - Health, Stamina, Exertion, Fatigue and Biological Recovery

**Version 0.1 - Detailed Design Bible, Runtime Rules and Integration Contract Draft**

*A data-driven biological-resource system for universal health state, stamina transactions, exertion response, long-term fatigue, natural recovery, treatment handoffs, multiplayer authority and bounded living-world simulation.*

| Field | Locked Direction |
| --- | --- |
| Document Role | 29B is the Set 29 specialist authority for universal biological Health state, Stamina regeneration and transaction rules, short-term exertion response, long-term Fatigue state and generic biological recovery. |
| Governing Contract | The Leyforge Document Sets 27-30 Cross-Set Interface Register v1.0 and Document 29A govern ownership. 29B consumes movement, combat, economy and social interfaces rather than redefining them. |
| Health Direction | Use a 100-point human-readable reference scale while supporting profile-specific and progression-modified maxima. Health is broad biological survivability; injuries remain separate persistent conditions. |
| Combat Boundary | Document 16 resolves attacks, mitigation and final damage packets. 29B applies resolved biological health loss and publishes biological state. Death/downed resolution remains external. |
| Stamina Direction | Stamina is a short-horizon physical resource. Action owners define base action costs; 29B applies biological modifiers, performs the authoritative stamina transaction and owns regeneration. |
| Exertion Direction | Exertion is a short-lived physiological load derived from current activity and recent stamina use. It is not a second spendable bar and is normally surfaced through animation/audio/context rather than a permanent HUD meter. |
| Fatigue Direction | Fatigue is a slow 0-100 long-horizon strain state distinct from Stamina and distinct from Sleep Pressure. It accumulates through sustained strain and repeated depletion; 29D's sleep/rest system is the primary recovery source. |
| Recovery Direction | No fast universal combat regeneration. Natural health recovery requires safety and biological eligibility, is slow by default, and never cures injuries, disease or poison by itself. |
| Difficulty Direction | Peaceful, Relaxed, Standard, Harsh and Custom use the same system with different rates, delays and caps. Standard remains meaningful but forgiving. |
| POC Compatibility | Preserve the existing 100 Health / 100 Stamina reference scale for migration and prototype comparability while replacing old implicit recovery assumptions with explicit Set 29 rules. |
| Data Direction | All values are registry/profile driven. Percent-of-maximum rates are preferred so progression and biological profiles do not require duplicated formulas. |

# Document Purpose

Document 29B defines the universal short- and medium-term biological resources that determine whether a character can keep functioning after strain or damage. It turns the ownership boundaries established in 29A into concrete rules for Health, Stamina, Exertion, Fatigue and generic biological recovery.

The document intentionally separates **what an external action costs or causes** from **how the body responds**. A sprint, climb, shield impact, melee attack or swimming action is owned by its gameplay system. That owner supplies an action and base exertion cost. Set 29 applies the actor's current biological modifiers and performs the stamina transaction once. Likewise, Combat resolves a final damage packet; Set 29 applies the resulting biological health change without recalculating weapons, armour, blocking or critical hits.

Health is not a substitute for injuries. A character can have high Health and a persistent arm injury, or low Health with no lasting wound after a magical blast. Stamina is not Fatigue. Stamina recovers over seconds; Fatigue represents cumulative strain over hours of simulated activity and is primarily reduced by adequate rest and sleep through 29D. Exertion sits between them as a short-lived measure of how hard the body is currently working.

> **Locked 29B Rule**
>
> Immediate action cost, short-term exertion, long-term fatigue, biological health and persistent injuries must remain distinct states. They may influence one another, but they may not be collapsed into one universal "energy" or "damage" meter.

# Design Sources, Authority and Treatment

| Source | Relevant Direction | 29B Treatment |
| --- | --- | --- |
| 00 - Master Game Design Bible | Leyforge balances survival, civilisation, automation and fantasy RPG play with configurable cosy-to-harsh difficulty. | Health and stamina support all playstyles without making basic existence a chore. |
| 01 - Core Gameplay Loop | Survival is part of a larger explore -> gather -> craft -> build -> interact -> automate -> defend -> upgrade -> expand loop. | Recovery and fatigue create preparation decisions without interrupting every loop step. |
| 02 - Player Progression | Health and Stamina are derived player resources; Stamina is mainly for sprinting/combat; no traditional attributes. | Retain Health/Stamina as derived resources and consume progression modifiers rather than redefining level/perk progression. |
| 16 - Combat, Gear and Defence | Health is survivability; Stamina pays strenuous actions; walking/gathering do not drain it by default; no fast universal combat regeneration; 100/100 is a POC reference. | Preserve these rules while moving biological resource truth and regeneration to Set 29 under the approved 29A boundary. |
| 17 - UI/UX | HUD is adaptive, contextual and accessibility-first. | Health, Stamina and Fatigue presentation follows progressive disclosure and redundant warning channels. |
| 20 - Buildings and Settlement Projects | Healthcare and rest capabilities require real functional buildings, stock, staff and routes. | Recovery consumes validated shelter/rest/care capability; 29B does not grant healing because a structure merely looks like a clinic. |
| 25 - Production Governance | Canonical IDs, source ownership, schemas, validation, deterministic saves and release gates are mandatory. | 29B uses stable definitions, explicit owners, validation ranges and migration-safe state. |
| 26E - Swimming, Diving and Underwater Interaction | Aquatic actions use stamina/exertion, equipment-load classes and readable recovery; slot inventory remains authoritative. | Consume swimming/diving activity state without redefining aquatic locomotion, breath, pressure or currents. |
| 29A - Survival, Health and Biological Foundation | Set 29 owns universal Health, stamina regeneration, fatigue and recovery; action costs/movement/death remain external. | Direct governing source for this document. |
| Cross-Set Interface Register v1.0 | One owner per gameplay system; Sets 27, 28 and 30 are consumed through interfaces. | Binding ownership contract. |

Where an earlier source described Health or Stamina as part of Combat, 29B preserves the gameplay intention while applying the approved 29A ownership split: **Combat owns damage/action resolution; Set 29 owns persistent biological resource state and regeneration.**

# Static Table of Contents

- 1. Locked 29B System Identity
- 2. Approved Decision Summary
- 3. Ownership and Non-Ownership Boundary
- 4. Resource Architecture and State Separation
- 5. Health Reference Scale and Maximum Health
- 6. Health Bands, Critical State and Zero-Health Handoff
- 7. Damage-to-Biology Application Flow
- 8. Natural Health Recovery Eligibility
- 9. Natural Health Recovery Rates, Ceilings and Multipliers
- 10. External Healing and Recovery Requests
- 11. Stamina Resource Architecture
- 12. Authoritative Stamina Spend Transaction
- 13. Stamina Regeneration, Delay and Depletion
- 14. Exertion Model and Activity Intensity
- 15. Exertion-to-Fatigue Conversion
- 16. Long-Term Fatigue State
- 17. Fatigue Effects and Guardrails
- 18. Rest, Sleep and Recovery Handoff to 29D
- 19. Hunger, Temperature, Injury, Disease and Poison Modifier Handoffs
- 20. Equipment Load and Physiological Carry Penalty
- 21. Progression, Perks, Magic and Buff Integration
- 22. NPCs, Companions and Workforce Health
- 23. Difficulty and World-Preset Tuning
- 24. Simulation LOD, Scheduling and Persistence
- 25. Multiplayer Authority and Prediction
- 26. UI, Feedback and Accessibility
- 27. Data Definitions and Runtime Records
- 28. Balance, Anti-Grind and Anti-Exploit Rules
- 29. Validation, Test Cases and Acceptance Criteria
- 30. Cross-Set Interface Amendments
- Appendix A. Reference Balance Tables
- Appendix B. Provisional 29B API Contract
- Appendix C. State Machine Reference
- Appendix D. Runtime Record Templates
- Appendix E. Worked Gameplay Examples
- Appendix F. Migration Notes
- Appendix G. Terminology Register

# 1. Locked 29B System Identity

29B is the **biological resource and generic recovery layer**. Its job is not to make every action realistic; its job is to make physical capability predictable, persistent and connected to the world.

| Layer | Time Horizon | Owned State | Examples |
| --- | --- | --- | --- |
| Health | Seconds to days | Current biological survivability. | Damage lowers it; recovery restores it. |
| Stamina | Seconds | Spendable short-horizon physical capacity. | Sprint, attack, block impact, climb or strenuous work. |
| Exertion | Seconds to minutes | Current physiological workload. | Heavy breathing after repeated sprint/climb/combat. |
| Fatigue | Hours to days | Cumulative strain and incomplete recovery. | Long expedition, repeated exhaustion, poor sleep. |
| Injury | Hours to weeks | Persistent tissue/functional condition. | Owned by 29E, consumed here as a recovery modifier. |
| Sleep Pressure | Hours | Need for sleep/rest. | Owned by 29D, consumed here to alter Fatigue/recovery. |

> **Locked Separation Rule**
>
> Restoring Stamina does not automatically remove Fatigue. Restoring Health does not automatically heal an Injury. Sleeping does not automatically refill Health unless the normal biological recovery conditions are also satisfied.

## 1.1 Stable Healthy Baseline

A healthy, fed, temperate and rested character should spend most normal play at or near full Health and low Fatigue. Ordinary walking, construction, farming, conversation, inventory management and routine gathering do not create mandatory Stamina drain in Standard mode.

Survival pressure should appear when the player makes meaningful choices: sustained sprinting, difficult traversal, repeated combat, extreme temperatures, carrying explicit heavy loads, travelling without rest, fighting while injured or continuing work during illness.

## 1.2 No Forced Realism Layer

29B does not simulate heart rate, blood pressure, lactate, calories-per-action or exact muscle recovery. It uses gameplay resources and semantic bands that can be validated, balanced and explained.

# 2. Approved Decision Summary

| Area | Locked 29B Decision |
| --- | --- |
| Health reference | 100 points is the standard human-readable reference and current POC migration baseline. Actual maximum Health may be modified by biological profile and progression. |
| Health bands | Stable 76-100%, Hurt 51-75%, Wounded 26-50%, Critical 1-25%, Depleted 0%. Bands communicate state; they do not replace injuries. |
| Zero Health | 29B emits `CriticalCondition` / `HealthDepleted`; it does not decide death, respawn or downed duration. |
| Natural health regeneration | Exists but is slow, conditional and suppressed during active danger/recent damage. No fast universal combat regeneration. |
| Standard natural recovery delay | 20 simulation seconds after the latest resolved Health damage, and only while recovery eligibility remains true. |
| Standard natural recovery rate | 0.10% of Max Health per simulation second in ordinary safe recovery. Rest/treatment/environment modifiers may improve or suppress it. |
| Natural recovery ceiling | External persistent conditions may cap recoverable Health. 29B composes the strictest active ceiling; 29E/29F/29G define condition-specific limits. |
| Stamina reference | 100 points reference, expressed internally as current/max plus percent-normalised queries. |
| Standard stamina regeneration | 16% of Max Stamina per simulation second after regeneration delay, before biological modifiers. |
| Standard stamina regeneration delay | 1.25 seconds after ordinary spending; 2.25 seconds after true depletion to zero. |
| Stamina spend | Action owner supplies base cost. 29B applies biological cost modifiers and performs one authoritative spend transaction. |
| Stamina floor | Zero Stamina is not automatic helplessness. External action owners decide which emergency/weak actions remain valid. |
| Exertion | Hidden/contextual 0-100 short-term load. Not a permanent player bar. |
| Fatigue | 0-100 long-term strain; higher is worse. Does not directly kill the player in Standard. |
| Fatigue recovery | Meaningful recovery is primarily supplied by 29D sleep/rest quality; passive awake recovery is limited. |
| Ordinary walking | Does not spend Stamina by default. |
| Inventory | No universal kilogram weight. Only declared equipment-load/heavy-carry states contribute physiological penalties. |
| Recovery stacking | Multipliers are bounded; common food/rest/medicine/magic may not create unbounded instant healing. |
| Offline time | Cannot silently deplete Health/Stamina or accumulate lethal Fatigue for the player while the game is closed. |

All numeric values in 29B are **first-pass balance locks for implementation and testing**, not claims of real-world physiology. They may be tuned through validated data without changing system ownership.

# 3. Ownership and Non-Ownership Boundary

## 3.1 29B Owns

- Current and maximum biological Health state composition.
- Health semantic bands.
- Applying already-resolved biological Health loss.
- Generic natural Health recovery eligibility, rate composition and ceiling composition.
- Current and maximum Stamina runtime state composition.
- Authoritative Stamina spend transaction after an action owner supplies base cost.
- Stamina regeneration rate, delay and biological modifiers.
- Exertion state derived from declared activity and recent Stamina use.
- Fatigue accumulation, state bands and biological modifiers.
- Generic recovery state and recovery reason trace.
- Health/Stamina/Fatigue persistence requirements.

## 3.2 29B Does Not Own

- Weapon damage, armour mitigation, blocking, dodging or critical hits - Document 16.
- Sprint speed, jump height, climbing controls, swimming locomotion, mount handling or vehicles - Set 30 / reconciled Set 26 interfaces.
- Death, downed timers, respawn or tombstone recovery - existing Combat/Progression owners.
- Hunger/nutrition values - 29C.
- Temperature/wetness/sleep pressure/rest quality - 29D.
- Injury creation/severity/bleeding/pain - 29E.
- Disease or poison lifecycle - 29F.
- Medicine item effects/treatment actions - 29G.
- Species/ancestry biology profiles - 29H.
- Final network replication/LOD schema - 29I.
- Final canonical schema and API signatures - 29J.
- Prices, wages or hospital costs - Set 27.
- Doctor dialogue, companion care decisions or morale behaviour - Set 28.

## 3.3 Cause, Response and Consequence Pattern

Every cross-system interaction should follow:

1. **External owner determines cause.**
2. **29B determines biological resource response.**
3. **29B publishes state and modifiers.**
4. **External owners determine their gameplay consequence.**

Example: Set 30 determines that the player is sprinting. It sends a strenuous movement request with a base Stamina cost. 29B applies fatigue/injury/temperature/load modifiers and spends the final Stamina amount. Set 30 then consumes the updated Stamina/exertion limits to determine whether sprint can continue.

# 4. Resource Architecture and State Separation

## 4.1 Core Runtime Channels

| Channel | Normalised Range | Player Meaning | Persistence |
| --- | ---: | --- | --- |
| `health_current` | 0..MaxHealth | Current survivability. | Yes. |
| `stamina_current` | 0..MaxStamina | Immediate strenuous-action capacity. | Yes for player/important actors; may refill on controlled load rules where safe. |
| `exertion_load` | 0..100 | Short-lived workload. | Usually no; reconstructable from current activity/recent action state. |
| `fatigue_level` | 0..100 | Long-term accumulated strain. | Yes. |
| `health_recovery_state` | Enum | Why natural recovery is active/suppressed. | State may be reconstructed; key timers persist when relevant. |
| `stamina_regen_delay_remaining` | Seconds | Short recovery lockout. | Usually transient; reconnect restores bounded authoritative value if mid-action. |
| `recent_depletion_count` | Bounded counter/window | Repeated zero-Stamina stress. | Short-lived; may demote into Fatigue contribution before save. |

## 4.2 Resource Independence

The following are prohibited shortcuts:

- Spending Health because Stamina is low unless an explicit external ability is designed to do so.
- Converting every Injury directly into Health loss every frame.
- Refilling Stamina just because Health was healed.
- Clearing Fatigue because the player ate one meal.
- Clearing persistent Injury because Health reached 100%.
- Treating low Health as automatically equivalent to low morale or fear.

## 4.3 Percent-Normalised Calculations

Rates use percentages of current maximum where practical:

`HealthRecoveryPerSecond = MaxHealth * RecoveryRateFraction * RecoveryMultiplier`

`StaminaRegenPerSecond = MaxStamina * StaminaRegenFraction * StaminaRegenMultiplier`

This preserves behaviour when progression or a biological profile changes maximum values.

# 5. Health Reference Scale and Maximum Health

## 5.1 Reference Scale

The default human-readable reference is:

- Base/reference Max Health: **100**.
- Base/reference Max Stamina: **100**.

These are compatibility and balancing anchors, not universal species constants and not permanent caps.

## 5.2 Maximum Health Composition

29B consumes modifiers rather than defining progression rewards:

`EffectiveMaxHealth = BiologicalProfileBaseHealth + ProgressionAdditiveHealth`, then modified by explicit bounded temporary effects.

The final composition contract must support:

- biological profile base value from 29H;
- permanent progression additions from Document 02;
- explicit temporary buffs/debuffs from Magic, items or status owners;
- world-setting modifiers when explicitly configured;
- migration of old saves that assumed 100 maximum.

29B must not infer Max Health from level directly.

## 5.3 Maximum-Health Change Rule

When Max Health changes at runtime:

- Permanent progression increase preserves current Health and may optionally grant the added amount if the progression owner marks `fill_delta=true`.
- Temporary Max-Health buffs should normally preserve current percentage or use an explicitly declared policy.
- Removing a Max-Health buff clamps current Health to the new maximum but does not create a new Injury.
- A temporary maximum reduction cannot kill an actor by itself unless the source explicitly has a lethal biological rule owned by the relevant condition system.

# 6. Health Bands, Critical State and Zero-Health Handoff

| Band | Health % | Meaning | Default Player Feedback |
| --- | ---: | --- | --- |
| Stable | 76-100 | Broadly capable. | Minimal/no Health warning. |
| Hurt | 51-75 | Noticeably damaged but functional. | Contextual Health visibility; mild animation/audio cues. |
| Wounded | 26-50 | Significant survivability loss. | Persistent contextual warning; recovery cause/counter discoverable. |
| Critical | 1-25 | High risk; other systems may restrict demanding actions. | Strong multi-channel warning and rescue/treatment emphasis. |
| Depleted | 0 | Health resource exhausted. | Emit critical/depleted event to external downed/death owner. |

Health bands may inform UI and external decision-making but **do not independently create limb impairment, bleeding, unconsciousness or death**.

## 6.1 Health at Zero

At zero Health, 29B:

1. clamps Health to zero;
2. records the source and timestamp of depletion;
3. publishes `CriticalCondition(true)` and `HealthDepleted`;
4. exposes active Injury/Disease/Poison/recovery context;
5. waits for the external downed/death owner to determine the gameplay state.

If the external owner permits revival or stabilisation, Health restoration occurs through a validated healing/recovery request. 29B never assumes zero Health is automatically permanent death.

# 7. Damage-to-Biology Application Flow

## 7.1 Resolved Damage Input

Document 16 or another authoritative hazard owner supplies a final biological damage request containing at minimum:

- source actor/entity ID;
- cause/action ID;
- resolved Health damage magnitude;
- damage/hazard tags;
- hit/body-region context when available;
- timestamp/simulation tick;
- optional status exposure payload already permitted by the owning system;
- authority/evidence token.

29B does **not** recalculate armour, defence, resistance, hit chance or weapon power.

## 7.2 Health Application

The biological service:

1. validates source and duplicate event ID;
2. applies final Health delta once;
3. starts/restarts the natural-recovery delay;
4. raises Exertion/Fatigue only if the source explicitly carries a biological strain component;
5. forwards injury/bleeding/poison exposure to the appropriate Set 29 specialist service where required;
6. publishes new Health state and reason trace.

## 7.3 Environmental Damage

Fall, fire, temperature, drowning, pressure, disease and poison damage may arrive from different owners, but Health application remains uniform. The source owner determines whether and how much Health damage is produced; 29B commits the biological resource change.

# 8. Natural Health Recovery Eligibility

Natural recovery is a **state**, not merely a timer.

## 8.1 Recovery Eligibility Gates

Natural Health recovery requires all of the following unless a difficulty profile explicitly relaxes them:

- Health > 0, unless the downed/death owner has explicitly authorised recovery from zero.
- No unresolved new Health damage within the configured recovery delay.
- Actor is not in an external `ActiveDanger` / combat-engaged state that suppresses natural regeneration.
- No active biological condition that declares `blocks_natural_health_recovery=true`.
- Recovery potential is greater than zero.
- Actor is not currently performing an action that explicitly suppresses Health recovery.

## 8.2 Standard Recovery Delay

Standard baseline: **20 simulation seconds** after the most recent resolved Health damage.

The timer restarts when new Health damage is committed. It does not restart merely because Stamina was spent.

Difficulty profiles may change the delay:

- Peaceful: 8 s reference.
- Relaxed: 12 s.
- Standard: 20 s.
- Harsh: 30 s.

## 8.3 Active Danger

`ActiveDanger` is supplied by the appropriate combat/event owner. 29B consumes the flag; it does not detect enemies, aggro, line of sight or raid state itself.

Natural recovery is normally suppressed while actively threatened. Explicit healing magic or medicine may still function if their owners permit it.

# 9. Natural Health Recovery Rates, Ceilings and Multipliers

## 9.1 Standard Baseline Rate

Standard natural recovery baseline:

**0.10% of Max Health per simulation second** once eligible.

At 100 Max Health this equals 0.10 Health/second, or 10 Health over 100 seconds before modifiers. This is intentionally too slow to reset combat between individual attacks but useful across safe travel, settlement work and downtime.

## 9.2 Recovery Context Multipliers

29B composes a recovery multiplier from declared inputs:

| Input | Owner | Example Effect on Recovery |
| --- | --- | --- |
| Nutrition/hunger | 29C | Well-fed supports normal recovery; severe hunger suppresses. |
| Thermal/wetness | 29D | Comfortable/dry supports; extreme exposure suppresses. |
| Rest/sleep quality | 29D | Resting/sleeping may improve recovery. |
| Injury | 29E | Severe untreated injury may reduce rate and/or cap ceiling. |
| Disease | 29F | Fever/infection may reduce or block recovery. |
| Poison/toxin | 29F | Active damaging toxin may suppress. |
| Treatment | 29G | Valid care can improve rate or remove blockers. |
| Magical effect | Document 09 | Explicit source may add healing or modify recovery. |
| Shelter/care facility | Document 20 | Supplies validated rest/care capability; it does not itself author the biological value. |

The combined ordinary natural-recovery multiplier is clamped by default to **0.0-3.0** before explicit direct healing effects. This prevents a pile of small buffs from becoming instant regeneration.

## 9.3 Recovery Ceiling

Health recovery may be limited by persistent conditions. Each condition may expose a `recovery_ceiling_fraction` from 0.0-1.0. 29B uses the strictest active ceiling:

`EffectiveRecoveryCeiling = min(all active recovery ceilings, 1.0)`

If no condition supplies a ceiling, the ceiling is 100%.

Examples for design intent only, with exact mapping owned by 29E/29F:

- untreated moderate injury may cap natural recovery below full;
- severe bleeding may block recovery entirely;
- ongoing poison damage may block or reduce it;
- a stabilised and treated injury may raise the ceiling without being cured.

## 9.4 Recovery Does Not Cure Conditions

Natural Health gain never directly:

- removes an Injury instance;
- stops bleeding unless 29E says the bleed has ended;
- cures Disease;
- clears Poison;
- removes Fatigue;
- cancels a treatment requirement.

# 10. External Healing and Recovery Requests

Direct healing from medicine, magic, NPC treatment or scripted world effects is distinct from natural recovery.

## 10.1 Healing Request Contract

An external owner may submit a `HealingRequest` containing:

- source definition ID;
- source actor/entity ID where applicable;
- target actor ID;
- Health amount or percent;
- delivery pattern: instant, pulse, over-time, conditional;
- allowed Health ceiling;
- condition tags affected, if owned by that source;
- interruption rules;
- authority/transaction ID.

29B validates and applies Health restoration but does not invent the magnitude or treatment capability.

## 10.2 Healing Safety Rules

- Duplicate transaction IDs may not heal twice.
- Healing above Max Health is discarded unless an explicit overshield/barrier system owns that effect.
- Food does not become an instant combat potion merely because it has a positive nutrition value.
- Repeated low-cost healing may be rate-limited by treatment/medicine rules rather than by arbitrary hidden 29B cooldowns.
- Direct magical healing may bypass natural-recovery delay when its spell definition explicitly permits it.

# 11. Stamina Resource Architecture

Stamina answers: **How much immediate strenuous physical capacity is available right now?**

It is designed around seconds, not hours.

## 11.1 What Commonly Uses Stamina

Base costs are owned by the action system. Typical strenuous actions include:

- sprinting;
- dodging/evading;
- attacks and heavy attacks;
- blocking impact;
- climbing or difficult traversal;
- swimming strain where the reconciled owner requests it;
- selected tools/physical abilities;
- carrying an explicit heavy object while performing strenuous movement;
- selected rituals or hybrid abilities when their owner explicitly uses Stamina.

Ordinary walking and routine gathering are zero-cost by default.

## 11.2 Stamina State

| State | Rule |
| --- | --- |
| Available | Current Stamina > requested final cost. Action may proceed if its owner allows. |
| Low | <=25% reference warning band. Strong actions may become strategically risky but are not auto-disabled by 29B. |
| Depleted | 0. Emergency/basic actions remain an external owner decision. |
| Delayed | Regeneration delay is active after spending. |
| Recovering | Delay expired and regeneration is allowed. |

# 12. Authoritative Stamina Spend Transaction

The no-duplicate-cost rule from 29A becomes an explicit transaction contract.

## 12.1 Transaction Flow

1. Action owner selects an authoritative action definition and determines `base_stamina_cost`.
2. Action owner submits `StaminaSpendRequest` with action ID, base cost, activity tags and transaction ID.
3. 29B calculates the biological cost multiplier from Fatigue, Injury, Temperature, Hunger, Disease, Poison and declared load state.
4. 29B computes final cost and validates available Stamina.
5. 29B spends Stamina **once** and returns the result.
6. Action owner commits or rejects the action according to its own rules.
7. 29B updates Exertion and the regeneration delay.

## 12.2 Biological Cost Multiplier

The 29B biological cost multiplier is normally clamped to **0.50-2.00** in Standard before any action-owner-specific rules.

This means a biologically excellent state may reduce physical cost but cannot make ordinary strenuous actions free through biological stacking alone, while severe strain cannot multiply a normal action into an absurdly large hidden cost.

Perks or explicit abilities owned elsewhere may apply outside this biological clamp if their owner deliberately allows it.

## 12.3 Insufficient Stamina

If current Stamina is below final cost, 29B returns `insufficient_stamina` with current/max state and modifier trace. The action owner decides whether to:

- reject the action;
- use a weaker variant;
- allow a partial/slow version;
- consume another declared resource;
- permit an emergency action.

29B does not choose a combat move or movement fallback.

# 13. Stamina Regeneration, Delay and Depletion

## 13.1 Standard Regeneration

Standard baseline after delay:

**16% of Max Stamina per simulation second** before biological modifiers.

A healthy 100-Stamina actor therefore refills from zero in about 6.25 seconds once regeneration begins.

## 13.2 Regeneration Delay

| Trigger | Standard Delay |
| --- | ---: |
| Normal strenuous Stamina spend | 1.25 s |
| True depletion to 0 Stamina | 2.25 s |
| External action requests extended suppression | Supplied by owner, bounded by definition/validation. |
| Damage only, no Stamina spend | Does not automatically delay Stamina unless a biological/combat effect explicitly says so. |

A later spend resets the relevant delay to the greater applicable value.

## 13.3 Stamina Regeneration Multiplier

29B composes:

- Fatigue multiplier;
- Injury multiplier from 29E;
- hunger/nutrition multiplier from 29C;
- thermal/wetness multiplier from 29D;
- disease/poison multiplier from 29F;
- equipment/heavy-carry physiological multiplier;
- valid progression/magic/buff modifiers from external owners.

The generic biological regeneration multiplier is normally clamped to **0.35-1.50** in Standard before explicit specialist abilities.

## 13.4 Depletion Consequence

Hitting zero Stamina:

- uses the longer depletion regeneration delay;
- raises Exertion strongly;
- increments a bounded recent-depletion counter;
- contributes a small Fatigue impulse;
- emits a contextual `StaminaDepleted` event.

It does not directly damage Health in Standard.

# 14. Exertion Model and Activity Intensity

Exertion represents how hard the body is working **right now**. It supports breathing, animation, Fatigue conversion and short-term recovery feel without adding another permanently visible survival bar.

## 14.1 Activity Intensity Input

External action/movement owners classify current activity:

| Intensity | Typical Examples | Default Exertion Target |
| --- | --- | ---: |
| Resting | Standing safely, sitting, calm idle. | 0-10 |
| Routine | Walking, ordinary crafting, light gathering. | 10-20 |
| Active | Normal combat footwork, steady work, moderate traversal. | 25-45 |
| Strenuous | Sprinting, repeated attacks, climbing, hard swimming, hauling. | 50-75 |
| Extreme | Maximum sprint, desperate climb, repeated heavy actions, rescue haul. | 75-100 |

The activity owner supplies the classification. 29B does not infer sprinting or climbing from velocity.

## 14.2 Exertion State Bands

| Band | Exertion | Meaning |
| --- | ---: | --- |
| Calm | 0-24 | Low immediate workload. |
| Working | 25-49 | Noticeable effort. |
| Strained | 50-74 | Sustained strenuous work; Fatigue begins accumulating meaningfully. |
| Overexerted | 75-89 | Heavy breathing/strain; Stamina recovery may be less efficient. |
| Maxed | 90-100 | Near short-term physical limit; repeated depletion risk high. |

## 14.3 Exertion Response

Exertion moves toward the current activity target with smoothing rather than snapping. Recent large Stamina spends temporarily raise the target. When strenuous activity stops, Exertion falls quickly over seconds.

Exertion is not normally saved. If the game is saved during an action, the action state and Stamina are authoritative; Exertion can be safely reconstructed or bounded on load.

# 15. Exertion-to-Fatigue Conversion

Short strenuous bursts should not make a character "tired for the day." Fatigue is produced when high Exertion persists or Stamina is repeatedly exhausted.

## 15.1 Standard Fatigue Accrual Draft

| Activity | Standard Fatigue Change |
| --- | ---: |
| Resting / Routine | 0 per minute from activity alone. |
| Active | +0.02 Fatigue/minute. |
| Strenuous | +0.18 Fatigue/minute. |
| Extreme | +0.45 Fatigue/minute. |
| Each true Stamina depletion event | +0.50 impulse, subject to anti-spam window. |

These values are deliberately slow. Four continuous hours of Strenuous activity would add roughly 43 Fatigue before sleep-debt or condition modifiers, while ordinary town life adds almost none.

## 15.2 Anti-Spam Window

Repeated Stamina depletion can add Fatigue only through a bounded rolling window so a player cannot accidentally gain dozens of Fatigue points by rapidly triggering a tiny zero-cost edge case. The default window may count a maximum of **one depletion impulse per 20 simulation seconds**.

## 15.3 Condition Modifiers

Fatigue accrual may be increased by:

- severe hunger or dehydration when enabled;
- thermal stress;
- illness;
- poison/toxin effects;
- serious Injury;
- explicit sleep debt from 29D;
- exceptional magical effects.

The owning specialist defines the modifier; 29B composes it.

# 16. Long-Term Fatigue State

Fatigue uses a simple **0-100 scale where higher is worse**.

| Band | Fatigue | Meaning |
| --- | ---: | --- |
| Rested | 0-19 | Normal capability. |
| Tired | 20-39 | Mild accumulated strain; mostly informational. |
| Fatigued | 40-59 | Noticeable reduced recovery efficiency. |
| Exhausted | 60-79 | Significant strain; prolonged demanding activity becomes inefficient. |
| Spent | 80-94 | Strong penalties and clear need for safe rest. |
| Critical Fatigue | 95-100 | Very poor physical recovery; severe warning. Standard does not directly kill or force unconsciousness. |

## 16.1 Fatigue Persistence

Fatigue persists through save/load. It is not reset by:

- changing areas;
- fast travel unless the travel system explicitly includes safe rest time;
- eating one item;
- regaining Stamina;
- reaching full Health;
- relogging.

## 16.2 Awake Recovery

Safe stationary rest while awake may reduce Fatigue very slowly, primarily to let a player recover from a short overexertion spike without requiring sleep immediately.

Standard reference awake-rest reduction: **-0.05 Fatigue/minute**, capped so it cannot efficiently erase major Fatigue. 29D supplies better sleep/rest-quality recovery.

# 17. Fatigue Effects and Guardrails

29B owns physiological effects only. It does not force social mood, dialogue or movement animations.

## 17.1 Standard Fatigue Modifier Table

| Band | Stamina Regen | Biological Stamina Cost | Work Capacity Export | Natural Health Recovery |
| --- | ---: | ---: | ---: | ---: |
| Rested | x1.00 | x1.00 | x1.00 | x1.00 |
| Tired | x0.95 | x1.00 | x0.98 | x0.98 |
| Fatigued | x0.85 | x1.05 | x0.95 | x0.90 |
| Exhausted | x0.70 | x1.10 | x0.85 | x0.80 |
| Spent | x0.55 | x1.20 | x0.70 | x0.65 |
| Critical Fatigue | x0.40 | x1.35 | x0.50 | x0.50 |

These are first-pass Standard values. Final work-capacity composition may also include Injury/Disease in later documents.

## 17.2 Basic Capability Protection

In Standard:

- Fatigue never disables ordinary walking.
- Fatigue never directly sets Health to zero.
- Fatigue does not delete items or progression.
- Fatigue does not force sleep or unconsciousness by itself.
- Strong penalties are visible before Critical Fatigue.

29D may define optional Harsh-mode sleep-debt consequences, but they must remain readable and configurable.

# 18. Rest, Sleep and Recovery Handoff to 29D

29B owns Fatigue and generic recovery composition; 29D owns sleep pressure, sleep actions, rest quality, shelter comfort and wakefulness rules.

## 18.1 Internal Set 29 Interface

29D should provide 29B with:

- `SleepPressure()`;
- `RestQuality()`;
- `IsSleeping()`;
- `IsResting()`;
- `SleepRecoveryMultiplier()`;
- `ThermalComfortModifier()` where relevant.

29B provides 29D with:

- `Fatigue()`;
- `ExertionBand()`;
- `HealthRecoveryEligibility()`;
- `StaminaState()`;
- `RecoveryReasonTrace()`.

This is an internal Set 29 handoff, not a cross-set ownership amendment.

## 18.2 Sleep Does Not Equal Instant Heal

Sleep may:

- strongly reduce Fatigue;
- improve natural Health recovery rate;
- provide time for medicine/treatment to work;
- clear temporary exertion;
- interact with hunger/temperature.

Sleep does not automatically cure Injuries, Disease or Poison unless their owners explicitly permit recovery over that period.

# 19. Hunger, Temperature, Injury, Disease and Poison Modifier Handoffs

29B uses modifiers rather than reproducing specialist rules.

| Specialist | Inputs to 29B | 29B Use |
| --- | --- | --- |
| 29C Hunger/Nutrition | `stamina_cost_mult`, `stamina_regen_mult`, `health_recovery_mult`, optional `fatigue_gain_mult`. | Changes physical efficiency/recovery. |
| 29D Temperature/Wetness/Sleep | thermal strain, rest quality, sleep pressure, recovery multiplier. | Changes Stamina/Fatigue/Health recovery. |
| 29E Injuries | injury stamina modifier, recovery ceiling, recovery multiplier, work-capacity modifier. | Applies persistent functional strain without redefining injury. |
| 29F Disease/Poison | stamina/recovery/fatigue modifiers and recovery blockers. | Applies illness/toxin consequences. |
| 29G Treatment | healing requests, recovery multiplier, blocker removal, rehabilitation state. | Applies validated treatment benefits. |

## 19.1 Modifier Composition Rule

For ordinary biological multipliers:

- multiply independent contributions;
- clamp at the 29B safety range;
- retain a reason trace showing the largest positive/negative contributors;
- never apply the same condition twice through two interfaces.

# 20. Equipment Load and Physiological Carry Penalty

The existing slot inventory remains authoritative. 29B reacts only to declared load/carry states.

## 20.1 Accepted Inputs

- equipment load band: Unburdened, Light, Standard, Heavy, Overloaded;
- explicit heavy-object carry state;
- carrying another actor;
- specialised ballast/harness state;
- magical or mechanical compensation modifier.

## 20.2 Physiological Effects

29B may use load state to modify:

- Stamina biological cost;
- Stamina regeneration;
- Exertion target;
- Fatigue accumulation;
- `CarryPenalty()` export.

Set 30 remains owner of actual speed, acceleration, climbing and traversal consequences.

## 20.3 Reference Load Modifiers

| Load Band | Stamina Cost | Stamina Regen | Fatigue Gain |
| --- | ---: | ---: | ---: |
| Unburdened | x0.95 | x1.05 | x0.95 |
| Light | x1.00 | x1.00 | x1.00 |
| Standard | x1.00 | x1.00 | x1.00 |
| Heavy | x1.12 | x0.88 | x1.15 |
| Overloaded | x1.30 | x0.65 | x1.40 |

These are physiological references only; Set 30 may apply separate movement handling from the same load band.

# 21. Progression, Perks, Magic and Buff Integration

## 21.1 Player Progression

Document 02 remains owner of level, skill and perk acquisition. It may expose:

- additive Max Health bonus;
- additive Max Stamina bonus;
- Stamina-cost efficiency bonus;
- Stamina-regeneration bonus;
- recovery-efficiency bonus;
- Fatigue-resistance bonus.

29B applies those declared modifiers but does not determine what level grants them.

## 21.2 Diminishing Stacking

Where multiple progression/buff sources affect the same percentage multiplier, 29B may use a diminishing stacking policy rather than raw addition. Final formula is registry-driven and validated in 29J.

## 21.3 Magic

Magic may:

- directly heal Health through an explicit healing request;
- improve Stamina regeneration;
- temporarily reduce Fatigue gain;
- transfer or exchange resources through explicit spell rules;
- create extraordinary states such as overcasting.

Magic System owns spell identity, costs, risks and balance. 29B applies declared biological effects and never invents mana cost or corruption consequence.

# 22. NPCs, Companions and Workforce Health

29B applies to relevant NPCs as well as the player, but simulation fidelity varies.

## 22.1 Named NPCs

Named NPCs persist:

- Health band/current Health when relevant;
- Fatigue band/value when relevant;
- recovery eligibility;
- severe/quest-relevant biological state references;
- scheduled recovery checkpoints.

## 22.2 Routine NPCs and Cohorts

Distant ordinary populations may use cohort summaries such as:

- average/median Fatigue band;
- injured/unavailable workforce fraction;
- recovering fraction;
- health burden index;
- expected work-capacity modifier.

29B does not determine wages or staffing assignment. It exposes biological capacity to Set 27/settlement owners.

## 22.3 Companion Care

Set 28 owns companion decision-making and care behaviour. 29B exposes:

- `CareNeed()`;
- `TreatmentUrgency()`;
- `RecoveryStatus()`;
- `Fatigue()`;
- `CriticalCondition()`.

A companion choosing to rest, seek a doctor or help the player is a Set 28 behaviour decision.

# 23. Difficulty and World-Preset Tuning

The same state machine is used in every preset.

## 23.1 Reference Presets

| Parameter | Peaceful | Relaxed | Standard | Harsh |
| --- | ---: | ---: | ---: | ---: |
| Natural Health recovery delay | 8 s | 12 s | 20 s | 30 s |
| Base natural Health recovery | 0.20%/s | 0.15%/s | 0.10%/s | 0.07%/s |
| Stamina regen | 20%/s | 18%/s | 16%/s | 14%/s |
| Normal Stamina delay | 0.75 s | 1.00 s | 1.25 s | 1.50 s |
| Depletion delay | 1.50 s | 1.75 s | 2.25 s | 3.00 s |
| Activity Fatigue gain | x0.25 | x0.50 | x1.00 | x1.50 |
| Depletion Fatigue impulse | 0.10 | 0.25 | 0.50 | 0.75 |
| Biological cost clamp | 0.60-1.60 | 0.55-1.80 | 0.50-2.00 | 0.50-2.25 |

## 23.2 Peaceful Does Not Remove the System

Peaceful keeps Health, Stamina and recovery because they support combat feedback, movement readability and medical content. It reduces attrition and fatigue pressure rather than replacing the resource model.

## 23.3 Custom Controls

Custom worlds may independently modify:

- Health recovery delay/rate;
- Stamina regeneration rate/delay;
- Fatigue gain multiplier;
- Fatigue effect strength;
- recovery suppression strictness;
- HUD warning intensity;
- whether routine traversal contributes Fatigue.

Values must stay within validated safe ranges unless developer/debug mode is active.

# 24. Simulation LOD, Scheduling and Persistence

## 24.1 Active Player and Local Actors

L0/L1 actors use action-level Stamina transactions and frequent Health/Fatigue updates.

Recommended scheduling:

- Stamina: continuous/fixed simulation step or event-integrated update.
- Exertion: 4-10 Hz is sufficient for gameplay state; presentation may interpolate each frame.
- Health natural recovery: 2-4 Hz or accumulated-time event processing.
- Fatigue: 0.2-1 Hz or event/scheduled accumulation; it does not require frame updates.

## 24.2 Distant Actors

At L2/L3:

- Stamina is not simulated action-by-action unless a specific event needs it.
- Exertion is not persisted as a full value.
- Fatigue may advance from scheduled work/travel intensity summaries.
- Health recovery uses elapsed simulation time, recovery eligibility and condition ceilings.
- important injuries/diseases remain individually traceable.

## 24.3 Save Fields

29B requires persistence of:

- current/max Health inputs or reconstructable modifiers;
- current Stamina for player/important active actors;
- Fatigue;
- last Health-damage simulation timestamp when recovery delay matters;
- natural-recovery suppression state where not reconstructable;
- recent depletion contribution already folded into Fatigue before save;
- schema version.

Exertion may normally be reset to a safe reconstructed value on load unless saving mid-action requires continuity.

## 24.4 Offline Safety

For the player:

- real-world time while the game is closed does not accumulate Fatigue;
- Health does not decay merely because time passed offline;
- Stamina may safely return to full on load only when the save is not in an active danger/action state and the save policy permits it; otherwise persisted current Stamina is restored.

For NPC worlds with optional offline simulation, 29I will define bounded progression and safety caps.

# 25. Multiplayer Authority and Prediction

## 25.1 Server/Host Authority

The authoritative host/server owns:

- current Health;
- current Stamina;
- Fatigue;
- recovery eligibility/timers;
- accepted biological modifiers;
- healing and Stamina transactions.

Clients never authoritatively set these values.

## 25.2 Stamina Prediction

Responsive movement/combat may locally predict Stamina spend using the latest authoritative modifiers. The server validates the action ID and base cost, performs the authoritative transaction, and returns correction if needed.

Prediction may not let a client:

- choose a cheaper base cost;
- suppress Fatigue penalties;
- duplicate regeneration;
- apply healing;
- clear a recovery delay.

## 25.3 Health Prediction

Health loss should normally display from authoritative damage results. Cosmetic hit reaction may predict, but the client may not persist Health change without server confirmation.

# 26. UI, Feedback and Accessibility

## 26.1 Health Presentation

- Health remains available as a clear resource during danger and while damaged.
- Exact numbers may be optional; bar/band presentation remains available.
- Critical Health uses redundant visual/audio/haptic cues.
- UI should distinguish low Health from persistent Injury.

## 26.2 Stamina Presentation

Stamina is contextual:

- visible while sprinting, climbing, fighting or otherwise spending it;
- may fade when full and irrelevant;
- low/depleted state uses non-colour cues;
- regeneration delay can be communicated by bar behaviour rather than extra text.

## 26.3 Fatigue Presentation

Fatigue should normally appear as:

- a status band/condition icon;
- contextual character/survival inspection;
- optional tooltip explaining main causes and best recovery route;
- escalating feedback only at meaningful bands.

Do not pin a permanent Fatigue bar to the standard HUD unless user settings request it.

## 26.4 Exertion Presentation

Exertion is primarily conveyed through:

- breathing intensity;
- animation posture;
- optional controller vibration;
- contextual Stamina behaviour;
- optional accessibility text/icon cue.

Reduced-motion/audio accessibility must provide equivalent non-audio/non-motion information.

## 26.5 Explainability Trace

Inspection may show:

> Stamina recovery: 11.8/s (base 16.0/s; Heavy Load -12%; Fatigued -15%; Warm Meal +5%).

The exact UI wording belongs to UI/UX, but 29B must expose source-labelled modifiers.

# 27. Data Definitions and Runtime Records

29J will finalise schemas. 29B requires the following conceptual records.

## 27.1 `BiologicalResourceProfile`

| Field | Type | Purpose |
| --- | --- | --- |
| `id` | Qualified ID | Stable profile identity. |
| `base_health` | Number | Reference base Max Health. |
| `base_stamina` | Number | Reference base Max Stamina. |
| `health_recovery_rate_fraction` | Number | Baseline natural recovery. |
| `health_recovery_delay_s` | Number | Baseline damage delay. |
| `stamina_regen_fraction_s` | Number | Baseline Stamina regen. |
| `stamina_regen_delay_s` | Number | Normal spend delay. |
| `stamina_depletion_delay_s` | Number | Zero-Stamina delay. |
| `fatigue_profile_id` | Qualified ID | Links long-term fatigue rules. |
| `difficulty_scalable` | Boolean | Whether world profile may scale values. |

## 27.2 `FatigueProfile`

Fields include:

- fatigue band thresholds;
- activity accrual rates;
- depletion impulse;
- anti-spam window;
- Stamina regen/cost multipliers by band;
- health-recovery multiplier by band;
- work-capacity multiplier by band;
- awake-rest recovery cap.

## 27.3 Runtime `BiologicalResourceState`

Minimum fields:

- actor ID;
- current Health;
- current Stamina;
- Fatigue;
- current Exertion band/value if active;
- Stamina regen delay remaining;
- latest Health damage time;
- recovery state;
- modifier/evidence hashes as needed;
- schema version.

# 28. Balance, Anti-Grind and Anti-Exploit Rules

## 28.1 No Combat Reset Exploit

Natural Health regeneration cannot begin simply because the player breaks line of sight for one second. It uses both the 20-second Standard delay and an external danger/recovery-eligibility state.

## 28.2 No Stamina Triple Charging

Movement, Combat and Set 29 may not each subtract Stamina for the same action. Base cost comes from one action owner; 29B performs one final transaction.

## 28.3 No Fatigue Farming

Players should not gain meaningful progression rewards from deliberately exhausting themselves unless a separately owned skill/perk system explicitly rewards relevant training with anti-abuse limits.

## 28.4 No Permanent Zero-Stamina Lock

Even under severe penalties, Stamina regeneration must remain above a validated minimum unless a clearly signposted condition explicitly blocks it. Standard biological clamp prevents routine modifier stacking from creating a permanent zero-regeneration state.

## 28.5 No Instant Full Heal Stack

Natural recovery, food, rest, medicine and generic buffs are bounded. Explicit rare/legendary magic may perform extraordinary healing only through its own costly/validated definition.

## 28.6 No Hidden Fatigue While Idling

Normal idle time in a safe state does not increase Fatigue. Sleep pressure is owned by 29D and must be separately visible/understandable.

## 28.7 No Punishing Build Sessions

Routine building, decoration, inventory management, crafting and settlement planning should not create substantial Fatigue in Standard simply because the player spent many real-world hours doing them.

# 29. Validation, Test Cases and Acceptance Criteria

## 29.1 Core Validation Rules

A valid 29B configuration must prove:

- Max Health and Max Stamina are positive.
- Health/Stamina current values clamp safely after migration/modifier changes.
- recovery delay is non-negative.
- natural recovery cannot exceed declared ceilings.
- generic biological multipliers stay within profile clamps.
- one Stamina transaction ID cannot spend twice.
- one damage transaction ID cannot apply Health loss twice.
- Fatigue stays within 0-100.
- Fatigue cannot create negative Stamina regeneration through ordinary stacking.
- offline player time cannot silently cause lethal biological loss.

## 29.2 Required Gameplay Tests

| Test | Expected Result |
| --- | --- |
| Walk around settlement for 30 minutes Standard | No Stamina drain from ordinary walking; negligible activity Fatigue. |
| Sprint repeatedly | Stamina spends once per movement owner's request; regen begins after delay; Exertion rises/falls. |
| Deplete Stamina to zero | Longer regen delay, depletion event and bounded Fatigue impulse; player still has external emergency actions. |
| Take damage then retreat | No natural Health recovery for 20 s and while `ActiveDanger` remains true. |
| Safe recovery | Health rises at configured rate until current ceiling. |
| Severe recovery blocker | Health stops at declared ceiling or recovery is suppressed with an explainable reason. |
| Heal with medicine/magic | Valid external HealingRequest applies once and does not double on reconnect. |
| Accumulate 60+ Fatigue | Stamina regeneration/work capacity reduce according to band; ordinary walking still works. |
| Save/load while fatigued | Fatigue persists; Exertion reconstructs safely. |
| Multiplayer predicted sprint | Client feel is responsive; server remains authoritative over final Stamina. |
| Change Max Health through progression | Current value follows declared change policy without creating Injury. |
| Peaceful vs Harsh | Same state machine, different rate/delay multipliers only. |

## 29.3 29B Acceptance Criteria

29B is complete when:

1. Health, Stamina, Exertion and Fatigue are distinct and have explicit time horizons.
2. The approved Combat -> Biology ownership split is executable.
3. Natural Health recovery has a locked baseline delay, rate, eligibility and ceiling model.
4. Health at zero hands off cleanly without Set 29 owning death.
5. Stamina base costs remain external while 29B performs one authoritative transaction.
6. Stamina regeneration has a locked Standard baseline and bounded modifier model.
7. Exertion supports short-term workload without becoming another permanent HUD bar.
8. Fatigue has a 0-100 scale, bands, accrual rules and bounded effects.
9. 29D can later own sleep/rest without redefining Fatigue.
10. 29C/29E/29F/29G can supply modifiers without duplicating recovery logic.
11. Equipment load preserves the slot-inventory/no-hidden-weight rule.
12. NPC/workforce interfaces can represent reduced health capacity without transferring economy ownership.
13. Difficulty presets can tune severity without incompatible rulesets.
14. Save/load and multiplayer authority cannot duplicate spend/heal/damage transactions.
15. Every important modifier can be explained through a reason trace.

# 30. Cross-Set Interface Amendments

29B does not transfer ownership. It refines interfaces already identified in 29A and adds only the minimum new handoffs needed to execute this specialist system.

## AM-29-001 Refinement - Movement Exertion Interface

**Set 30 -> Set 29**

Required inputs:

- `CurrentMovementMode()`;
- `ActivityIntensity()`;
- `MovementExertionClass()`;
- `HeavyCarryState()`;
- authoritative movement action ID and base Stamina cost when movement spends Stamina.

**Set 29 -> Set 30**

Returns:

- `TrySpendStamina()` result;
- `StaminaModifier()` / cost and regen components;
- `ExertionLimit()`;
- `CarryPenalty()`;
- `FatigueMovementModifier()`.

Ownership remains unchanged: Set 30 owns movement; Set 29 owns biological resource response.

## AM-29-004 Refinement - Combat/Biology Resource Transaction

**Document 16 -> Set 29**

- resolved `BiologicalDamageRequest`;
- combat `StaminaSpendRequest` with base cost;
- `ActiveDanger`/combat-engaged recovery suppression state.

**Set 29 -> Document 16**

- current Health/Stamina snapshot;
- spend success/failure;
- Health/Fatigue/Stamina modifiers;
- `CriticalCondition()`;
- recovery state where relevant.

Combat continues to own attack resolution, action cost definitions and death/downed behaviour.

## AM-29-003 Refinement - Workforce Capacity

**Set 29 -> Set 27 / settlement consumers**

29B contributes:

- `FatigueWorkCapacityModifier()`;
- `HealthWorkCapacityModifier()`;
- `ExpectedRecoveryWindow()`.

Later 29E/29F add injury/disease components. Set 27 remains owner of wages, production value and economic consequences.

## AM-29-010 - Progression Derived-Resource Interface

**Document 02 -> Set 29**

Proposed inputs:

- `MaxHealthAdditive()`;
- `MaxStaminaAdditive()`;
- `StaminaEfficiencyModifier()`;
- `StaminaRecoveryModifier()`;
- `BiologicalRecoveryModifier()`;
- `FatigueResistanceModifier()`.

Set 29 consumes these values. Document 02 continues to own how levels, skills and perks grant them.

## AM-29-011 - Generic Healing Request Interface

**Magic / Medicine / Treatment owners -> Set 29**

Proposed `HealingRequest` supports source ID, amount/rate, allowed ceiling, duration/pulses, target and transaction identity. Set 29 applies Health restoration atomically while the source system retains ownership of effect magnitude, cost, recipe/spell and eligibility.

## Amendment Status Table

| ID | Purpose | Direction | Ownership Transfer? | Status |
| --- | --- | --- | --- | --- |
| AM-29-001 | Movement exertion/Stamina exchange | Set 30 <-> Set 29 | No | Refined in 29B |
| AM-29-003 | Workforce health/fatigue capacity | Set 29 -> Set 27/Settlement | No | Refined in 29B |
| AM-29-004 | Combat damage/Stamina transaction boundary | Document 16 <-> Set 29 | No | Refined in 29B |
| AM-29-010 | Progression-derived biological resource modifiers | Document 02 -> Set 29 | No | New proposal |
| AM-29-011 | Generic direct healing request | External healing owners -> Set 29 | No | New proposal |

# Appendix A. Reference Balance Tables

## A.1 Health Reference

| Value | Standard Reference |
| --- | ---: |
| Base Max Health | 100 |
| Hurt threshold | <=75% |
| Wounded threshold | <=50% |
| Critical threshold | <=25% |
| Natural recovery delay | 20 s |
| Natural recovery rate | 0.10% Max Health/s |
| Ordinary multiplier clamp | 0.0-3.0 |

## A.2 Stamina Reference

| Value | Standard Reference |
| --- | ---: |
| Base Max Stamina | 100 |
| Base regen | 16% Max Stamina/s |
| Normal spend delay | 1.25 s |
| Zero-depletion delay | 2.25 s |
| Biological regen clamp | 0.35-1.50 |
| Biological cost clamp | 0.50-2.00 |
| Low warning band | <=25% |

## A.3 Fatigue Reference

| Activity/Band | Standard Reference |
| --- | ---: |
| Active accrual | +0.02/min |
| Strenuous accrual | +0.18/min |
| Extreme accrual | +0.45/min |
| Depletion impulse | +0.50, max once/20 s |
| Awake safe-rest recovery | -0.05/min, bounded |
| Fatigued band | 40-59 |
| Exhausted band | 60-79 |
| Spent band | 80-94 |
| Critical Fatigue | 95-100 |

# Appendix B. Provisional 29B API Contract

Final signatures belong to 29J. 29B requires the following semantics.

## B.1 Queries

- `CurrentHealth(actor_id)`
- `MaxHealth(actor_id)`
- `HealthPercent(actor_id)`
- `HealthBand(actor_id)`
- `CurrentStamina(actor_id)`
- `MaxStamina(actor_id)`
- `StaminaPercent(actor_id)`
- `StaminaRegenRate(actor_id)`
- `Fatigue(actor_id)`
- `FatigueBand(actor_id)`
- `ExertionBand(actor_id)`
- `HealthRecoveryEligibility(actor_id)`
- `RecoveryStatus(actor_id)`
- `CriticalCondition(actor_id)`
- `WorkCapacityModifier(actor_id)`
- `RecoveryReasonTrace(actor_id)`

## B.2 Commands / Transactions

- `ApplyResolvedBiologicalDamage(request)`
- `TrySpendStamina(request)`
- `ApplyHealingRequest(request)`
- `ApplyFatigueDelta(source, amount, transaction_id)`
- `SetRecoverySuppression(source, state)`
- `RecomputeBiologicalModifiers(actor_id)`

## B.3 Events

- `HealthChanged`
- `HealthBandChanged`
- `HealthDepleted`
- `StaminaChanged`
- `StaminaDepleted`
- `StaminaRecoveryStarted`
- `FatigueBandChanged`
- `RecoveryStateChanged`
- `CriticalConditionChanged`

# Appendix C. State Machine Reference

## C.1 Health Recovery State

`Suppressed -> Delayed -> Eligible -> Recovering -> Full/Ceiling`

Transitions:

- new damage -> Delayed;
- active danger/blocker -> Suppressed;
- delay expires and gates pass -> Eligible/Recovering;
- new blocker -> Suppressed;
- reaches ceiling -> Full/Ceiling;
- direct healing may change Health independently without changing ownership of the recovery state.

## C.2 Stamina State

`Available -> Spending -> Delayed -> Recovering -> Full`

If spending reaches zero:

`Spending -> Depleted -> Extended Delay -> Recovering`

## C.3 Fatigue State

Fatigue is continuous with band events:

`Rested <-> Tired <-> Fatigued <-> Exhausted <-> Spent <-> Critical Fatigue`

There is no automatic death transition.

# Appendix D. Runtime Record Templates

## D.1 Biological Resource State Example

```text
actor_id: npc.riverward.kael_017
health_current: 68.0
health_max_resolved: 100.0
stamina_current: 41.0
stamina_max_resolved: 100.0
fatigue: 47.0
exertion: 62.0
health_recovery_state: delayed
health_recovery_delay_remaining_s: 8.4
stamina_regen_delay_remaining_s: 0.7
last_health_damage_time: <simulation timestamp>
active_modifier_sources:
  - survival.fatigue.fatigued
  - equipment.load.heavy
schema_version: 1
```

## D.2 Stamina Spend Request Example

```text
transaction_id: tx.stamina.00048291
action_owner: movement
actor_id: player.local.1
action_id: movement.sprint
base_stamina_cost: 6.0
activity_intensity: strenuous
movement_mode: sprinting
context_tags:
  - terrain.uphill
```

29B may return a final biological cost such as 7.1 after current modifiers. Set 30 still owns what sprinting does.

# Appendix E. Worked Gameplay Examples

## E.1 Healthy Builder

The player spends an afternoon building houses and wiring automation inside a safe settlement. They walk, place blocks, craft components and inspect machines. These are Routine activities. Stamina stays full most of the time and activity Fatigue gain is effectively zero. The survival system does not punish a construction-focused session.

## E.2 Mountain Sprint After a Fight

The player leaves combat at 42 Health and 30 Stamina, then sprints uphill. Combat supplies `ActiveDanger=false` only after the encounter truly ends. Set 30 submits sprint Stamina costs. 29B spends them with a Heavy-load multiplier, raises Exertion and delays Stamina regeneration. Health recovery still waits for its 20-second post-damage delay. When the player stops in a safe spot, Stamina recovers within seconds while Health recovers slowly over minutes.

## E.3 Injured Guard

A guard has 85 Health but a severe leg injury. 29E may later expose a Health-recovery ceiling and stamina/work-capacity penalty. 29B applies those modifiers without deciding what the leg injury is. The guard can therefore be "healthy enough" in Health points while still unsuitable for strenuous duty until treated.

## E.4 Long Expedition

A player travels, climbs and fights for several simulated hours. Stamina repeatedly recovers, but sustained Strenuous activity pushes Fatigue into the 50s. They remain functional, but Stamina recovery drops and strenuous costs rise slightly. Returning to an inn and sleeping uses 29D to reduce Fatigue and improve Health recovery over elapsed simulation time.

## E.5 Multiplayer Rescue

A client predicts a sprint toward a downed ally. The server validates each sprint Stamina request. The rescuer reaches zero Stamina and enters the longer depletion delay but is not automatically immobilised. Set 30 may still allow ordinary walking. A healing action on the ally is submitted as a validated healing request; Set 29 applies it once, while the external downed/death owner decides whether revival succeeds.

# Appendix F. Migration Notes

Existing POC/reference behaviour uses 100 Health and 100 Stamina. 29B intentionally preserves these as the default baseline, reducing migration risk.

Migration requirements:

1. Existing saved Health values map directly where Max Health was 100.
2. Existing Stamina values map directly where Max Stamina was 100.
3. If old saves lack Fatigue, initialise at 0 unless a documented active condition requires another value.
4. If old saves lack recovery-delay state, initialise conservatively from active combat/damage state rather than granting free combat regeneration.
5. Old Combat-owned Health writes must be redirected to the 29B biological resource service after damage resolution.
6. Old direct Stamina subtraction in Combat/Movement should migrate to one `StaminaSpendRequest` path to prevent double charging.
7. Existing equipment-load bands remain compatible; the slot inventory is unchanged.

# Appendix G. Terminology Register

| Term | Locked Meaning |
| --- | --- |
| Health | Universal biological survivability resource owned by Set 29. |
| Max Health | Resolved biological capacity after profile/progression/temporary modifiers. |
| Stamina | Short-horizon spendable physical capacity. |
| Exertion | Short-lived current workload; contextual, not normally a permanent HUD resource. |
| Fatigue | Long-horizon accumulated strain, 0-100, higher is worse. |
| Recovery Delay | Time after damage/spend before natural Health/Stamina recovery may begin. |
| Recovery Eligibility | Boolean/gated state determining whether natural Health recovery is allowed. |
| Recovery Ceiling | Maximum Health fraction reachable through current recovery path while conditions remain active. |
| Biological Cost Multiplier | Set 29 modifier applied to an externally owned base Stamina cost. |
| Active Danger | External combat/event state that may suppress natural Health recovery. |
| Depletion | Stamina reaching zero or Health reaching zero; each has different handoff rules. |
| Direct Healing | Explicit externally defined Health restoration, distinct from natural recovery. |
| Work Capacity Modifier | Biological output consumed by settlement/economy systems; does not itself assign jobs or wages. |
