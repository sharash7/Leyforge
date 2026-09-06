# EVT-001 Implementation Path Plan

## Summary

Implement `EVT-001` as the next package after `MOV-001`: a canonical quest, event, and world-history owner for Documents `15` and `24`, built on top of the existing `ProductionKernel` evidence and transaction substrate rather than as a second journal system.

This package should:
- add one authoritative event/quest/history domain,
- migrate current raid, settlement-project, and settlement-request consequence tracking onto that owner,
- preserve legacy compatibility views in `CombatState` and `HamletState`,
- extend save `v18` with an ordered event domain,
- add focused verification for idempotency, migration, and cross-owner consequence binding.

## Current State Analysis

### Roadmap Position

- `MOV-001` is completed and `EVT-001` is the next planned package in both [production-path.json](file:///d:/AI/Projects/leyforge/.summer/requirements/production-path.json) and [full-game-implementation-roadmap.md](file:///d:/AI/Projects/leyforge/.summer/plans/full-game-implementation-roadmap.md).
- `EVT-001` deliverables are already defined as:
  - event journal,
  - quest graph state,
  - world consequence references,
  - acceptance: events bind existing identities and remain idempotent.

### Existing Runtime Shape

- There is no event/quest/history autoload in [project.godot](file:///d:/AI/Projects/leyforge/project.godot).
- Save `v18` currently persists: inventory, progression, magic, settlements, hamlet, combat, production kernel, structures, simulation LOD, people, biology, social, political, movement, UI, Forge presentation, worldgen, and manifest in [main.gd](file:///d:/AI/Projects/leyforge/scripts/main.gd#L224-L275).
- Restore order in [main.gd](file:///d:/AI/Projects/leyforge/scripts/main.gd#L655-L820) rebuilds the kernel and owner domains first, then compatibility layers like `SettlementManager` / `HamletState`, then `CombatState`.
- `ProductionKernel` already provides evidence envelopes and transaction tracking in [production_kernel.gd](file:///d:/AI/Projects/leyforge/scripts/core/production_kernel.gd), so `EVT-001` should consume kernel evidence instead of duplicating low-level transaction storage.

### Current Gap

- Current event-like truth is scattered:
  - `CombatState` owns a local `event_history` array and `_record_event()` helper in [combat_state.gd](file:///d:/AI/Projects/leyforge/scripts/autoload/combat_state.gd#L30-L31) and [combat_state.gd](file:///d:/AI/Projects/leyforge/scripts/autoload/combat_state.gd#L819-L827).
  - `HamletState` owns request-complete, project-stage, and building-history logs in [hamlet_state.gd](file:///d:/AI/Projects/leyforge/scripts/autoload/hamlet_state.gd).
  - `SocialManager` owns dialogue evidence and knowledge provenance, but explicitly not quest authority in [social_manager.gd](file:///d:/AI/Projects/leyforge/scripts/autoload/social_manager.gd).
- Coverage already calls this out: there is no generic quest/event/history owner, only local raid and project history evidence in [implementation-coverage.json](file:///d:/AI/Projects/leyforge/.summer/requirements/implementation-coverage.json).

### Scope Decision

- This plan covers `EVT-001` only.
- It does not plan `SET-001`, `REALM-001`, `COMBAT-001`, or a broader milestone rewrite, except where `EVT-001` must expose interfaces those future packages depend on.

## Assumptions And Decisions

### Decisions

- Add a new canonical autoload named `EventManager`.
- Keep `ProductionKernel` as the low-level evidence and transaction envelope owner.
- Make `EventManager` the only owner of:
  - event records,
  - quest records and objective state,
  - world-history chronicle entries,
  - cross-owner consequence references.
- Treat `CombatState.event_history`, `HamletState.project["history"]`, building histories, and request completion logs as compatibility projections or legacy migration inputs, not final authority.
- Restore the event domain after specialist identity owners are restored and before compatibility systems replay or project their state.
- Do not implement full authored quest content in this package. `EVT-001` provides the runtime owner, event graph, and objective-binding substrate first.

### Non-Goals

- No realm persistence implementation.
- No economy, settlement-growth, or maritime runtime work.
- No large UI overhaul beyond lightweight read/query hooks needed for verification and future consumers.
- No duplication of Set 28 dialogue or Set 29 biological truth.

## Proposed Architecture

### New Authoritative Owner

Create `res://scripts/autoload/event_manager.gd` as the `EVT-001` owner with four top-level stores:

- `_events_by_id`
  - canonical event lifecycle records,
  - source owner, family, type, participants, time, location, evidence refs,
  - linked settlement, structure, world, and actor refs,
  - status and revision.
- `_quests_by_id`
  - quest state and objective graph records,
  - objective completion state,
  - event evidence refs that advanced or blocked each objective,
  - participant/context bindings.
- `_history_by_id`
  - stable world-history chronicle entries,
  - references to source events and consequence owners,
  - category tags for settlement, combat, travel, world-state, and migration.
- `_transactions_by_id`
  - package-level idempotency and replay suppression for `EVT-001` commands,
  - built on top of `ProductionKernel` transaction/evidence ids.

### Event Record Contract

Use a single event record shape:

```text
{
  "event_id": String,
  "event_family": String,
  "event_type": String,
  "status": String,                # proposed | active | resolved | cancelled | archived
  "source_owner": String,          # set15.event, set16.combat, set20.settlement, etc.
  "world_seed": int,
  "world_id": String,
  "settlement_ref": String,
  "structure_refs": Array[String],
  "participant_refs": Array[String],
  "location": Dictionary,
  "time_ref": Dictionary,          # kernel world-time snapshot
  "source_evidence_refs": Array[String],
  "consequence_refs": Array[Dictionary],
  "history_entry_refs": Array[String],
  "metadata": Dictionary,
  "revision": int
}
```

### Quest Record Contract

Provide a minimal, future-proof quest structure:

```text
{
  "quest_id": String,
  "template_id": String,
  "status": String,                # offered | active | blocked | completed | failed | archived
  "owner_scope_ref": String,
  "participant_refs": Array[String],
  "objective_records": Array[Dictionary],
  "required_event_refs": Array[String],
  "history_entry_refs": Array[String],
  "revision": int
}
```

Each objective record should store:
- `objective_id`
- `kind`
- `status`
-
 `required_predicates`
- `required_event_families`
- `completion_event_refs`
- `blocking_reason`

### History Entry Contract

History entries should be append-only references, not duplicate full state:

```text
{
  "history_id": String,
  "kind": String,                  # raid, settlement_project, request_complete, damage, repair, quest, migration
  "title": String,
  "summary": String,
  "event_ref": String,
  "consequence_refs": Array[Dictionary],
  "settlement_ref": String,
  "world_ref": String,
  "time_ref": Dictionary,
  "tags": Array[String]
}
```

## Proposed Changes

### 1. Add EventManager Autoload

**File:** `d:\AI\Projects\leyforge\scripts\autoload\event_manager.gd`  
**Why:** Create the missing authoritative owner for Document `15` and Set `24` event/history truth.  
**How:**
- Add lifecycle methods:
  - `reset()`
  - `initialize(seed_value, requested_world_id)`
  - `serialize_state()`
  - `restore_state(value, expected_seed, expected_world_id)`
- Add primary commands:
  - `register_event(payload: Dictionary) -> Dictionary`
  - `resolve_event(payload: Dictionary) -> Dictionary`
  - `attach_consequence(payload: Dictionary) -> Dictionary`
  - `record_history_entry(payload: Dictionary) -> Dictionary`
  - `register_quest(payload: Dictionary) -> Dictionary`
  - `advance_quest_from_event(payload: Dictionary) -> Dictionary`
- Add queries:
  - `has_event(event_id)`
  - `get_event(event_id)`
  - `get_recent_history(limit, settlement_ref := "", kind := "")`
  - `get_quest(quest_id)`
  - `quest_ids(status := "")`
- Enforce idempotency by requiring stable `transaction_id` and/or `event_id` and checking existing event or transaction revisions before mutation.
- Use `ProductionKernel.make_evidence_envelope()`, `begin_transaction()`, and `commit_transaction()` for kernel-compatible evidence binding.

### 2. Register EventManager In Project Boot

**File:** `d:\AI\Projects\leyforge\project.godot`  
**Why:** Make `EventManager` a canonical domain owner like `PeopleManager`, `SocialManager`, and `MovementManager`.  
**How:**
- Add `EventManager="*res://scripts/autoload/event_manager.gd"` to `[autoload]`.
- Place it with the other specialist owners, between `PoliticalManager` and `MovementManager` for readability.

### 3. Add Event Domain To Reset, Save, And Restore

**File:** `d:\AI\Projects\leyforge\scripts\main.gd`  
**Why:** `EVT-001` must survive reloads and become part of the ordered owner restore path.  
**How:**
- In `_reset_world_autoloads()`, call `EventManager.reset()`.
- In save assembly, add `"events": EventManager.serialize_state()`.
- In restore flow:
  - restore `ProductionKernel`,
  - restore structure / LOD / people / biology / social / political / movement,
  - restore `EventManager`,
  - then restore compatibility systems and consumers such as `SettlementManager`, `HamletState`, and `CombatState`.
- On missing or incompatible event state, initialize a fresh event owner instead of failing the full restore.
- Keep save format at `v18` unless a concrete schema incompatibility requires `v19`; prefer additive migration inside the new event payload first.

### 4. Migrate CombatState To EventManager Authority

**File:** `d:\AI\Projects\leyforge\scripts\autoload\combat_state.gd`  
**Why:** Raid lifecycle is the clearest existing event system and should become the first `EVT-001` authority client.  
**How:**
- Keep the current public behavior and compatibility summary methods.
- Replace `_record_event()` so it writes canonical raid lifecycle events through `EventManager.register_event()` and `EventManager.record_history_entry()`.
- Convert the local `event_history` array into:
  - a derived compatibility cache, or
  - a migration-only field that is rebuilt from `EventManager` history queries on restore.
- When raid outcomes create structure damage, theft, or injury aftermath, attach consequence refs through `EventManager.attach_consequence()` instead of storing only free-form local history rows.
- Preserve raid-specific state such as `phase`, `enemy_records`, and `outcome` inside `CombatState`; only move the lifecycle/event chronicle truth to `EventManager`.

### 5. Migrate Settlement Request And Project Consequence Logging

**File:** `d:\AI\Projects\leyforge\scripts\autoload\hamlet_state.gd`  
**Why:** Request completions, project-stage reservations, project completions, and repair/damage histories are currently local and should feed the new event owner.  
**How:**
- On request completion in `deliver_request()`, create or resolve an authoritative settlement event rather than only synthesizing a local string token.
- On project stage reservation/completion and project activation, write event records and chronicle entries with stable ids based on `settlement_id`, `project_instance_id`, and stage index.
- On `apply_building_damage()` and `repair_building()`, attach structure consequence refs to the relevant event entry if one exists; otherwise emit a standalone settlement consequence event.
- Keep `project["history"]`, `runtime_buildings["history"]`, and `delivery_ledger` for UI compatibility, but treat them as projections whose rows include canonical `event_ref` or `history_ref`.

### 6. Add Event Read-Model Hooks For Future Consumers

**Files:**  
- `d:\AI\Projects\leyforge\scripts\autoload\settlement_manager.gd`  
- `d:\AI\Projects\leyforge\scripts\autoload\social_manager.gd`  
- `d:\AI\Projects\leyforge\scripts\autoload\political_manager.gd`  
**Why:** Future `SET-001`, `COMBAT-001`, `REALM-001`, and UI work will need typed event queries without breaking owner boundaries.  
**How:**
- Do not move authority into these managers.
- Add only narrow query/adaptor usage where needed:
  - settlement views can fetch recent settlement history from `EventManager`,
  - social flows can reference `event_ref` for dialogue provenance without owning event truth,
  - political or permission changes can reference event evidence ids when needed.
- Avoid direct mutation from these managers into quest/event state except through typed `EventManager` commands.

### 7. Add Save And Legacy Migration Rules

**Files:**  
- `d:\AI\Projects\leyforge\scripts\autoload\event_manager.gd`  
- `d:\AI\Projects\leyforge\scripts\main.gd`  
**Why:** Old saves and current local histories must remain loadable without duplicating consequences.  
**How:**
- If the save contains no `events` domain:
  - seed an empty `EventManager`,
  - import legacy `CombatState.event_history` as canonical event/history rows,
  - import legacy `HamletState.project["history"]` and selected building history rows as canonical history entries,
  - mark imported rows with migration tags like `legacy_import.v18_to_evt001`.
- Use deterministic import ids so loading the same legacy save twice cannot duplicate events.
- Do not attempt to backfill every local text row into rich quest state; migrate only stable, referenceable history facts.

### 8. Add Focused Verification Coverage

**Files:**  
- `d:\AI\Projects\leyforge\.summer\verification\event_owner_probe.gd`  
- `d:\AI\Projects\leyforge\.summer\verification\event_owner_probe.tscn`  
- `d:\AI\Projects\leyforge\.summer\verification\phase4_save_probe.gd`  
- `d:\AI\Projects\leyforge\.summer\verification\run_current_regression_gate.ps1`  
**Why:** `EVT-001` is a new owner boundary and must prove idempotency, save/load integrity, and compatibility migration.  
**How:**
- Add a dedicated `event_owner_probe` to verify:
  - event registration,
  - duplicate suppression,
  - consequence attachment,
  - quest objective advancement from event evidence,
  - legacy-history import.
- Extend `phase4_save_probe.gd` to verify the new `events` domain round-trips with save `v18` and that legacy no-event payloads import once.
- Add the new probe scene to `run_current_regression_gate.ps1` with an explicit expected check count after implementation.

### 9. Update Governance Evidence After Implementation

**Files:**  
- `d:\AI\Projects\leyforge\.summer\requirements\implementation-coverage.json`  
- `d:\AI\Projects\leyforge\.summer\requirements\IMPLEMENTATION_COVERAGE.md`  
- `d:\AI\Projects\leyforge\.summer\requirements\production-path.json`  
- `d:\AI\Projects\leyforge\.summer\plans\full-game-implementation-roadmap.md`  
**Why:** The roadmap and coverage ledger are part of the production authority and must reflect the new completed package honestly.  
**How:**
- Mark `EVT-001` in progress or completed only when its acceptance criteria are actually passing.
- Update the Document `15` and `24` implementation rows with real evidence from the new probe and migration behavior.
- Keep `COMBAT-001`, `REALM-001`, and `SET-001` dependent, not implicitly completed.

## Data Flow

### Raid Lifecycle

1. `CombatState.begin_raid()` decides raid start conditions.
2. `CombatState` calls `EventManager.register_event()` with a stable raid event id.
3. `EventManager` opens a kernel transaction and binds the event to kernel evidence.
4. `CombatState` later resolves the raid and attaches:
   - structure damage consequence refs,
   - theft consequence refs,
   - biological aftermath refs.
5. `EventManager` writes a history entry.
6. `CombatState` exposes compatibility summaries by querying canonical event/history refs.

### Settlement Request / Project

1. `HamletState.deliver_request()` completes a request.
2. `HamletState` writes a canonical settlement event through `EventManager`.
3. Project stage reservation/completion emits stage-specific event records.
4. `SocialManager` and `PoliticalManager` continue consuming evidence refs for reputation and permissions without owning event truth.

### Save / Restore

1. Save writes the `events` domain after specialist owners are serialized.
2. Restore rebuilds specialist owners first.
3. `EventManager.restore_state()` restores canonical event/quest/history state.
4. Compatibility systems restore next and project or import legacy event views only as needed.

## Edge Cases And Failure Modes

- Duplicate raid resolution after retry or reload must not duplicate history or consequence refs.
- Legacy saves with only `CombatState.event_history` or `HamletState.project["history"]` must import once and remain stable on subsequent saves.
- `EventManager` must reject events that reference missing evidence ids unless the command explicitly creates and commits the evidence first.
- `EventManager` must reject malformed participant refs, empty ids, or invalid status transitions.
- Settlement and combat compatibility UIs must remain readable even before all old local history arrays are fully retired.
- If `EventManager` restore fails, gameplay should fall back to a fresh event owner and warn, not corrupt the rest of the restore flow.

## Alternatives Considered

### Option A: Leave Event Truth In CombatState And HamletState

**Pros**
- Lower short-term code churn.
- Minimal save-domain changes.

**Cons**
- Blocks `REALM-001`, `COMBAT-001`, and quest integration.
- Keeps event authority fragmented.
- Makes idempotent cross-owner consequence binding much harder.

**Decision**
- Rejected.

### Option B: Put Quest/Event State Directly Into ProductionKernel

**Pros**
- Fewer owner files.
- Reuses existing evidence journal directly.

**Cons**
- Violates the current architecture where the kernel is substrate, not specialist gameplay owner.
- Blurs owner boundaries with future economy, movement, biology, and social packages.

**Decision**
- Rejected.

### Option C: Add Dedicated EventManager On Top Of ProductionKernel

**Pros**
- Matches existing owner architecture.
- Keeps `ProductionKernel` generic.
- Creates a clean dependency target for later realm/combat/settlement packages.

**Cons**
- Adds one more save domain and one more owner reconciliation path.

**Decision**
- Chosen.

## Verification Steps

### Targeted Probes

- Run the new `event_owner_probe.tscn`.
- Run `phase4_save_probe.tscn` after extending it for event-domain migration and replay checks.
- Run `production_kernel_probe.tscn` to ensure `EVT-001` still uses the kernel correctly.
- Run the existing `movement_owner_probe.tscn`, `social_owner_probe.tscn`, and `political_owner_probe.tscn` to confirm owner-boundary regressions were not introduced.

### Gate Runs

- Run `powershell -NoProfile -ExecutionPolicy Bypass -File .summer\verification\run_current_regression_gate.ps1`
- Run `powershell -NoProfile -ExecutionPolicy Bypass -File .summer\verification\run_phase0_gate.ps1`

### Acceptance Criteria

- `EventManager` becomes the sole authority for event, quest, and history records.
- Raid lifecycle events, request completions, and project-stage milestones produce canonical event/history refs.
- Replaying the same transaction ids does not duplicate event rows or consequences.
- Save `v18` round-trips the event domain cleanly.
- Legacy saves without an `events` domain migrate once and remain stable.
- Coverage and roadmap artifacts can honestly move `EVT-001` from `planned` to `completed` only if the new probes and current regression gate pass.
