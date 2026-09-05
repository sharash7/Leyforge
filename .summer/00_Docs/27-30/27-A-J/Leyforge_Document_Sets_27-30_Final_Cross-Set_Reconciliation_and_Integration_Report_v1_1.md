# Leyforge Document Sets 27-30 - Final Cross-Set Reconciliation and Integration Report

**Revision:** 1.1 / Package Integration v0.2  
**Date:** 8 August 2026  
**Sets Reviewed:** 27, 28, 29 and 30  
**Additional dependency reviewed:** Document 26E - Swimming, Diving and Underwater Player Interaction

# 1. Executive Result

The final design reconciliation pass is complete.

The four document sets were already strongly aligned: they consistently separated economic, social, biological and movement authority. The pass found one genuine ownership collision and several duplicated interface proposals created because the sets were drafted in parallel.

The result is:

- **XSI-30-001 is resolved.** Detailed swimming remains owned by 26E; Set 30 keeps the universal `Aquatic` movement facade and cross-medium transition/API responsibilities.
- Set 27 caravan/guided-transport requests and Set 30 physical execution are consolidated into one `TransportMissionRequest` / `TransportExecutionSnapshot` family.
- Set 28 formation, passenger, companion-travel and assignment-travel proposals are consolidated with Set 30's formation and `ExternalMovementIntent` contracts.
- Set 29 and Set 30 now have one canonical movement-exertion protocol and one canonical physical-impact/biological-consequence protocol.
- Route **truth** remains Set 30-owned; actor route **knowledge/belief** remains Set 28C-owned.
- Cross-set world time, evidence/idempotency and promotion/demotion are treated as shared technical envelopes without creating a fifth gameplay owner.
- No independent `AssignmentCarryFeasibility()` gameplay formula is created; integration composes Set 29 and Set 30 outputs.

# 2. What XSI-30-001 Was

XSI-30-001 existed because the original Sets 27-30 ownership register placed **Swimming** under Set 30, while the already approved Maritime Set 26 had a full specialist document - **26E** - defining water-contact states, wading, surface swimming, diving, underwater locomotion, current/wave response, aquatic NPC behaviour, vessel-side movement handoffs, networking and persistence.

Keeping both as owners would violate the project's one-owner-per-system rule.

# 3. Final XSI-30-001 Decision

**Adopted resolution: Option A.**

26E remains the detailed aquatic-locomotion provider.

Set 30 owns:

- the universal `Aquatic` top-level mode exposed through the Movement API;
- land/air/traversal to aquatic handoff coordination;
- aquatic back to land/traversal re-entry validation;
- route/navigation integration around aquatic-provider edges;
- common movement networking/persistence envelopes where the provider uses them.

This preserves the mature Set 26 design and prevents a duplicate swimming controller.

# 4. Canonical Interface Families Created

The final register v1.1 consolidates parallel proposals into eleven interface families:

1. shared world time, presence and evidence;
2. economy/social commercial terms;
3. economy/biology demand and capacity;
4. economy/movement transport mission and execution;
5. social/biology care and availability;
6. social/movement permission, formation and travel intent;
7. route truth/knowledge/confidence;
8. biology/movement exertion and mobility;
9. physical impact/biological consequence;
10. cross-set simulation promotion/demotion;
11. aquatic locomotion provider boundary.

# 5. Key Integration Decisions

## 5.1 Caravan and Trade

Set 27 owns the reason, contract, value, cargo commitment and economic success/failure of a trip.

Set 30 owns the physical journey, capacity, route accessibility, ETA, vehicle/mount condition, delays and arrival evidence.

An expected arrival is never stock.

## 5.2 Formations and Companions

Set 28 owns whether companions agree to travel, who is assigned as passenger, and the preferred formation/role ordering.

Set 30 owns seat feasibility, physical attachment, route movement, formation slot positions, compression through narrow spaces, separation and regroup movement.

## 5.3 Stamina and Movement

Set 30 reports the physical activity context. Set 29 converts that context into actual Stamina/Fatigue/biological permission and returns a movement-facing decision.

Route estimation uses a side-effect-free estimate mode, so opening a map cannot spend Stamina.

## 5.4 Falls

Set 30 reports physical impact evidence.

Set 29 decides injury/Health consequence and returns any resulting mobility restriction.

## 5.5 Route Knowledge

Set 30 owns whether a route is physically open.

Set 28C owns what an actor believes/knows about that route, including rumours, confidence and provenance.

This prevents the map/path planner from becoming a hidden omniscience system.

# 6. Updated Document Sets

All four packages are revised to a **v0.2 Reconciled package level**.

The specialist gameplay documents remain v0.1 where their gameplay rules did not change. The final integration document (`J`) in each set is replaced with a v0.2 version that adopts the new register and explicitly supersedes provisional interface-status wording in earlier documents.

Each package also contains:

- `Leyforge_Document_Sets_27-30_Cross-Set_Interface_Register_v1_1_Final_Reconciled`;
- a package reconciliation notice;
- the updated final integration document for that set.

# 7. Files Functionally Amended

| Set | Updated Final Integration Document | Primary Changes |
| --- | --- | --- |
| 27 | 27J v0.2 | Adopts canonical economy/social/biology/transport contracts; final reconciliation no longer pending. |
| 28 | 28J v0.2 | Adopts canonical social/economy/biology/movement contracts; route knowledge and formation/travel intent frozen. |
| 29 | 29J v0.2 | Adopts canonical movement exertion, impact, world-time/LOD and population-health interfaces; swimming conflict marked resolved. |
| 30 | 30J v0.2 | Resolves XSI-30-001 and XSI-30-002/003/005/006/007/008/010/011/012/013; marks external-only dependencies separately. |

# 8. Historical Provisional Wording

Earlier specialist documents sometimes say an interface is "proposed", "pending final reconciliation" or "requires Set X review". Those statements are retained as the historical development record unless the gameplay rule itself required alteration.

For package v0.2, the following precedence applies:

1. Cross-Set Interface Register v1.1;
2. the set's updated `J` v0.2 final-integration document;
3. specialist document gameplay rules;
4. earlier provisional interface-status text.

This avoids rewriting dozens of otherwise-correct specialist documents simply to change status wording.

# 9. Remaining Work Outside This Pass

The following are implementation/integration tasks, not unresolved 27-30 design conflicts:

- register the final interface schemas through Set 25;
- amend older pre-27 documents to consume these interfaces during the main integration pass;
- finalise the external Environment Movement Field owner mapping;
- finalise Automation/Magic readiness adapters for powered/guided transport;
- implement and profile the contracts in Godot/Summer Engine.

# 10. Final Assessment

Sets 27-30 now form a coherent four-layer architecture:

```text
Set 27: Why value moves / what it is worth / what is owed
Set 28: Who agrees / believes / trusts / is assigned
Set 29: What the body can biologically sustain
Set 30: What can physically move / where / how long it takes
```

That separation is strong enough to support the game's later AI, settlement, automation and living-world systems without creating four competing versions of the same truth.

---

**End of Final Cross-Set Reconciliation and Integration Report**
