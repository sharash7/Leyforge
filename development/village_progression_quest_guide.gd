class_name VillageProgressionQuestGuide
extends RefCounted
## Ordered manual/automatic certification path for the development-only
## Village Progression Lab. Events are raised by real lab systems rather than
## by mock quest completions.

signal changed

const STEPS: Array[Dictionary] = [
	{
		"id": "resident_arrival",
		"title": "Meet the Founding Residents",
		"instruction": (
			"Confirm the three deterministic adult generalists are visible, "
			+ "moving, jumping one-block rises, labelled, assigned to four "
			+ "real camp beds, and carrying their persistent equipment. "
			+ "Right-click one resident."),
		"requires": ["residents_spawned", "npc_interacted"],
	},
	{
		"id": "camp_foundation",
		"title": "Found a Camp",
		"instruction": (
			"Select the Camp scenario. Inspect its campfire, tents, supply "
			+ "yard, resident records, needs, jobs, and capability gate."),
		"requires": ["scenario.camp"],
		"manual_event": "manual.camp_inspected",
	},
	{
		"id": "creative_supply",
		"title": "Equip the Player",
		"instruction": (
			"Close diagnostics, press C, and grant building materials, tools, "
			+ "food, weapons, and magic components to the real inventory."),
		"requires": ["player_resource"],
	},
	{
		"id": "parcel_survey",
		"title": "Survey Five Construction Parcels",
		"instruction": (
			"Survey the flat, wooded, steep, water-edge, and player-obstructed "
			+ "parcels at several rotations. Inspect clearance, cut/fill, "
			+ "water supports, collisions, tool requirements, route cost, and "
			+ "the stable survey hash. Confirm the player obstruction only "
			+ "after reviewing every affected player-owned block."),
		"requires": ["site_survey_valid", "player_overlap_confirmed"],
		"manual_event": "manual.parcel_surveys_inspected",
	},
	{
		"id": "routes_excavation",
		"title": "Build the Access Route and Excavate",
		"instruction": (
			"Advance real work packages through road connection, vegetation "
			+ "clearing, cut/fill, and foundation preparation. Walk the route "
			+ "and confirm adjacent path cells differ by no more than one "
			+ "block and the occupied volume is dry."),
		"requires": ["work_task_advanced"],
		"manual_event": "manual.route_grade_inspected",
	},
	{
		"id": "tools_inventory_hauling",
		"title": "Verify Tools, Inventories, and Hauling",
		"instruction": (
			"Use axe, pickaxe, and shovel requirements on appropriate blocks. "
			+ "Inspect the worker's equipment durability, carried stack, "
			+ "storage trip, conserved transaction history, and deposited "
			+ "excavation drops."),
		"requires": ["excavation_drop_deposited"],
		"manual_event": "manual.tool_durability_inspected",
	},
	{
		"id": "first_migrant",
		"title": "Admit the First Migrant",
		"instruction": (
			"Inspect the two-day stability and three-day cooldown gates, then "
			+ "force one migration. Confirm a spare reachable bed and real "
			+ "adult job are consumed, while the other settlement is unchanged."),
		"requires": ["migration_forced"],
	},
	{
		"id": "housing_promotion",
		"title": "Build Permanent Housing and Promote",
		"instruction": (
			"Complete a cottage through the real lifecycle. Confirm each "
			+ "resident has one stable residence and bed, damaged housing "
			+ "creates displacement, re-housing clears it, and exact blockers "
			+ "are shown before Camp-to-Hamlet promotion."),
		"requires": [
			"project_completed", "resident_evicted", "resident_rehoused",
			"stage_promoted",
		],
	},
	{
		"id": "door_lifecycle",
		"title": "Operate a Logical Two-Block Door",
		"instruction": (
			"Right-click both halves of a cottage door. Verify facing and "
			+ "hinge, matching upper/lower mesh, collision removal while open, "
			+ "blocked-swing feedback, NPC passage, closing, and snapshot state."),
		"requires": ["project_completed"],
		"manual_event": "manual.door_lifecycle_inspected",
	},
	{
		"id": "household_birth",
		"title": "Form a Household and Raise a Child",
		"instruction": (
			"Form a partnership in permanent housing, inspect the 14-day "
			+ "gestation and 30-day cooldown, force a birth, then advance the "
			+ "newborn through child, adolescent, and adult bands. Confirm "
			+ "children never occupy adult jobs."),
		"requires": ["household_formed", "birth_completed", "child_aged"],
		"manual_event": "manual.child_schedule_inspected",
	},
	{
		"id": "watchtower_continuation",
		"title": "Complete the Watchtower and Continue",
		"instruction": (
			"Complete the compatibility watchtower and immediately inspect the "
			+ "ranked catalogue proposals. Confirm housing, jobs, routes, "
			+ "safety, terrain cost, redundancy, and exact blockers replace "
			+ "the old watchtower dead end."),
		"requires": ["project_completed"],
		"manual_event": "manual.proposals_after_watchtower",
	},
	{
		"id": "warehouse_supply",
		"title": "Stock Settlement Storage",
		"instruction": (
			"Use a selected-resource or exact-requirements grant. Inspect "
			+ "warehouse slots, permissions, requests, and reservations."),
		"requires": ["warehouse_resource"],
		"manual_event": "manual.storage_inspected",
	},
	{
		"id": "hamlet_growth",
		"title": "Grow into a Hamlet",
		"instruction": (
			"Select Hamlet. Confirm the visible homes, farm, kitchen, "
			+ "storehouse, well, service coverage, and resident needs."),
		"requires": ["scenario.hamlet"],
		"manual_event": "manual.hamlet_inspected",
	},
	{
		"id": "project_create",
		"title": "Create a Construction Project",
		"instruction": (
			"Select a watchtower or cottage project, create it, grant exact "
			+ "supplies, and reserve the active stage."),
		"requires": ["project_created", "project_reserved"],
	},
	{
		"id": "project_build",
		"title": "Perform Voxel Construction",
		"instruction": (
			"Advance one block, complete one stage, then complete the project. "
			+ "Confirm real blueprint voxels and resource reservations change."),
		"requires": [
			"project_block", "project_stage_completed", "project_completed",
		],
	},
	{
		"id": "project_cancel",
		"title": "Test Project Cancellation",
		"instruction": (
			"Create another cancellable project, reserve if desired, and "
			+ "cancel it. Inspect its history and returned reservations."),
		"requires": ["project_cancelled"],
	},
	{
		"id": "village_services",
		"title": "Establish a Village",
		"instruction": (
			"Select Village. Inspect the granary, healer, hall, watchtower, "
			+ "warehouse, roads, jobs, storage, and capability services."),
		"requires": ["scenario.village"],
		"manual_event": "manual.village_inspected",
	},
	{
		"id": "building_lifecycle",
		"title": "Damage, Repair, and Operate a Building",
		"instruction": (
			"Damage and repair a building, then deactivate and reactivate it. "
			+ "Confirm service capacity and history respond."),
		"requires": [
			"building_damaged", "building_repaired", "building_toggled",
		],
	},
	{
		"id": "fortified_village",
		"title": "Fortify the Village",
		"instruction": (
			"Select Fortified Village. Inspect barracks, armoury, specialised "
			+ "storage, stone routes, ward infrastructure, and safety coverage."),
		"requires": ["scenario.fortified_village"],
		"manual_event": "manual.fortified_inspected",
	},
	{
		"id": "town_economy",
		"title": "Operate a Town",
		"instruction": (
			"Select Town and simulate 60 minutes in Near mode. Inspect "
			+ "production transactions, inputs, outputs, needs, and jobs."),
		"requires": ["scenario.town", "simulation.near"],
		"manual_event": "manual.transactions_inspected",
	},
	{
		"id": "far_simulation",
		"title": "Verify Distant Simulation",
		"instruction": (
			"Switch to Far mode and simulate another hour. Compare deterministic "
			+ "transactions and the saved simulation timestamp."),
		"requires": ["simulation.far"],
	},
	{
		"id": "automation_loop",
		"title": "Run Settlement Automation",
		"instruction": (
			"Build or load the Town automation chain. Verify worker and chute "
			+ "deliveries, furnace inputs and outputs, conserved storage "
			+ "transactions, job access, near simulation, and far catch-up."),
		"requires": ["scenario.town", "simulation.near", "simulation.far"],
		"manual_event": "manual.automation_loop_inspected",
	},
	{
		"id": "magic_loop",
		"title": "Run the Settlement Magic Loop",
		"instruction": (
			"Load Magical Metropolis, inspect mana infrastructure and "
			+ "capability gates, operate the magic production path, and verify "
			+ "damage, repair, near/far behavior, and saved state."),
		"requires": ["scenario.magical_metropolis"],
		"manual_event": "manual.magic_loop_inspected",
	},
	{
		"id": "city_services",
		"title": "Build a Full City",
		"instruction": (
			"Select City. Walk the generated districts and inspect housing, "
			+ "hospital, academy, governance, emergency, magic, and logistics."),
		"requires": ["scenario.city"],
		"manual_event": "manual.city_inspected",
	},
	{
		"id": "capital_governance",
		"title": "Govern a Capital",
		"instruction": (
			"Select Capital. Inspect high-tier governance, districts, resident "
			+ "capacity, utilities, defence, logistics, culture, and magical "
			+ "service coverage before beginning a megaproject."),
		"requires": ["scenario.capital"],
		"manual_event": "manual.capital_inspected",
	},
	{
		"id": "plan_graph",
		"title": "Run a District or Megaproject Plan",
		"instruction": (
			"Create a district, complex, or megaproject. Grant and reserve a "
			+ "component, then advance it and inspect prerequisites."),
		"requires": ["plan_created", "plan_reserved", "plan_advanced"],
	},
	{
		"id": "plan_recovery",
		"title": "Damage and Restore a Plan Component",
		"instruction": (
			"Damage and repair a plan component. Inspect partial activation, "
			+ "capacity contribution, condition, and history."),
		"requires": ["plan_damaged", "plan_repaired"],
	},
	{
		"id": "raid_defence",
		"title": "Defend the Settlement",
		"instruction": (
			"Open the HUD Raid page and sound the warning. Fight the spawned "
			+ "goblins, inspect preparation/outcome, then repair any damage."),
		"requires": ["raid_started", "raid_resolved"],
		"manual_event": "manual.raid_aftermath_inspected",
	},
	{
		"id": "settlement_isolation",
		"title": "Prove Settlement Isolation",
		"instruction": (
			"Switch to the second settlement, travel there, load a different "
			+ "scenario, and verify its residents, warehouse, projects, "
			+ "reputation, damage, and history did not leak."),
		"requires": [
			"second_settlement_visited", "second_settlement_scenario",
		],
		"manual_event": "manual.isolation_inspected",
	},
	{
		"id": "snapshot_round_trip",
		"title": "Save and Reload the Lab",
		"instruction": (
			"Save the isolated lab snapshot, change both settlements, reload, "
			+ "and confirm voxels, residents, projects, plans, and guide state."),
		"requires": ["snapshot_saved", "snapshot_reloaded"],
	},
	{
		"id": "magical_metropolis",
		"title": "Certify the Complete Progression Ladder",
		"instruction": (
			"Load Magical Metropolis and the partial-damage megaproject preset. "
			+ "Inspect the full capability ladder and record remaining visual, "
			+ "simulation, balance, or usability defects."),
		"requires": ["scenario.magical_metropolis"],
		"manual_event": "manual.final_certification",
	},
]

var current_index := 0
var events: Dictionary = {}
var completed: Dictionary = {}


func current_step() -> Dictionary:
	return STEPS[clampi(current_index, 0, STEPS.size() - 1)]


func mark_event(event_id: String) -> void:
	if event_id.is_empty() or bool(events.get(event_id, false)):
		return
	events[event_id] = true
	changed.emit()


func mark_current_manual_check() -> bool:
	var event_id := str(current_step().get("manual_event", ""))
	if event_id.is_empty():
		return false
	mark_event(event_id)
	return true


func current_missing_events() -> Array[String]:
	var missing: Array[String] = []
	var step := current_step()
	for event_id in step.get("requires", []):
		if not bool(events.get(str(event_id), false)):
			missing.append(str(event_id))
	var manual_event := str(step.get("manual_event", ""))
	if not manual_event.is_empty() and not bool(events.get(manual_event, false)):
		missing.append(manual_event)
	return missing


func complete_current_if_ready() -> Dictionary:
	var step := current_step()
	var missing := current_missing_events()
	if not missing.is_empty():
		return {
			"ok": false,
			"message": "Still required: %s" % ", ".join(missing),
			"missing": missing,
		}
	completed[str(step["id"])] = true
	if current_index < STEPS.size() - 1:
		current_index += 1
	changed.emit()
	return {
		"ok": true,
		"message": "Objective verified: %s" % step["title"],
	}


func move(direction: int) -> void:
	current_index = clampi(current_index + direction, 0, STEPS.size() - 1)
	changed.emit()


func reset() -> void:
	current_index = 0
	events.clear()
	completed.clear()
	changed.emit()


func progress_text() -> String:
	return "%d/%d objectives verified" % [completed.size(), STEPS.size()]


func serialize_state() -> Dictionary:
	return {
		"version": 1,
		"current_index": current_index,
		"events": events.duplicate(true),
		"completed": completed.duplicate(true),
	}


func restore_state(value: Variant) -> bool:
	if not (value is Dictionary):
		return false
	current_index = clampi(
		int(value.get("current_index", 0)), 0, STEPS.size() - 1)
	events = value.get("events", {}).duplicate(true)
	completed = value.get("completed", {}).duplicate(true)
	changed.emit()
	return true
