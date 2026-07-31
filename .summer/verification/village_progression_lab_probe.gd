extends Node
## Automated contract for the editor-only Document 20 progression laboratory.

var failures: Array[String] = []
var checks := 0


func _ready() -> void:
	call_deferred("_run")


func _check(condition: bool, message: String) -> void:
	checks += 1
	if not condition:
		failures.append(message)


func _run() -> void:
	WorldManager.clear_active_world()
	var packed := load("res://development/village_progression_lab.tscn")
	_check(packed is PackedScene, "progression lab scene is not loadable")
	if not (packed is PackedScene):
		_finish()
		return
	var lab: Node = packed.instantiate()
	add_child(lab)
	for _frame in 4:
		await get_tree().process_frame
	_check(
		int(lab.call("lab_settlement_count")) == 2,
		"lab did not create two settlements")
	_check(
		str(lab.call("lab_snapshot_path")).begins_with(
			"user://development/village_progression_lab/"),
		"lab snapshot path is not isolated")
	var lab_player: Player = lab.get("player")
	var lab_world: VoxelWorld = lab.get("world")
	_check(
		lab_player is Player,
		"lab does not use the production first-person player controller")
	_check(
		lab_world != null and lab_world.player == lab_player,
		"lab player is not the voxel world's streaming focus")
	_check(
		bool(lab.call("lab_player_has_streaming_focus")),
		"lab player camera is not the active streaming camera")
	_check(
		lab_player.get_node_or_null("PlayerHumanoid") != null,
		"lab player does not contain the full production humanoid")
	var lab_hud: Hud = lab.get("hud")
	_check(
		lab_hud is Hud and lab_hud.player == lab_player,
		"lab does not wire the production HUD to its player")
	_check(
		lab_hud.get("_creative_entries") is Array
			and (lab_hud.get("_creative_entries") as Array).size() == 312,
		"lab creative catalogue is not the complete block/item catalogue")
	var lab_hamlet_runtime: HamletRuntime = lab.get("hamlet_runtime")
	_check(
		lab_hamlet_runtime != null and lab_hamlet_runtime.configured
			and lab_hamlet_runtime.player == lab_player,
		"lab does not run the nearby settlement/NPC actor runtime")
	_check(
		int(lab.call("lab_active_resident_count")) == 3,
		"lab did not promote all three Camp founders into nearby actors")
	var resident_ids := HamletState.get_npc_ids()
	_check(
		resident_ids.size() == 3
			and resident_ids.all(func(npc_id: String) -> bool:
				return npc_id.begins_with(
					SettlementManager.focused_settlement_id + ".npc.")),
		"lab residents do not use settlement-namespaced identities")
	_check(
		resident_ids.all(func(npc_id: String) -> bool:
			var position: Array = HamletState.get_npc_record(
				npc_id).get("position", [])
			return position.size() == 3 and float(position[1]) > 0.0),
		"lab residents were not grounded on prepared settlement terrain")
	var resident_actor_visuals_valid := true
	for actor_value in (lab_hamlet_runtime.get("_actors") as Dictionary).values():
		var actor: Node = actor_value
		resident_actor_visuals_valid = resident_actor_visuals_valid \
			and actor != null \
			and actor.is_in_group("hamlet_npcs") \
			and actor.get_node_or_null("HumanoidVisual") != null
	_check(
		resident_actor_visuals_valid,
		"promoted residents do not use the real labelled humanoid NPC actor")
	_check(
		int(lab.call("lab_quest_count")) == 31,
		"camp-to-city quest guide does not cover the full capability ladder")
	_check(
		str(lab.call("lab_quest_current_id")) == "resident_arrival",
		"quest guide did not begin with resident arrival and interaction")
	var initial_quest_state: Dictionary = lab.call("lab_quest_state")
	_check(
		bool((initial_quest_state.get("events", {}) as Dictionary).get(
			"residents_spawned", false)),
		"resident promotion did not update the quest guide")
	var quest_overlay: PanelContainer = lab.get("quest_overlay")
	_check(
		quest_overlay != null and quest_overlay.visible
			and str((lab.get("quest_overlay_text") as Label).text).contains(
				"Meet the Founding Residents"),
		"exploration mode does not display the active test quest")
	lab_player.interaction_requested.emit(
		"npc", Vector3i.ZERO, str(resident_ids[0]))
	await get_tree().process_frame
	var interacted_quest_state: Dictionary = lab.call("lab_quest_state")
	_check(
		bool((interacted_quest_state.get("events", {}) as Dictionary).get(
			"npc_interacted", false)),
		"interacting with a real resident did not update the quest guide")
	if lab_hud.craft_open:
		lab_hud.call("_set_craft_open", false)
	lab.call("_verify_current_quest")
	_check(
		str(lab.call("lab_quest_current_id")) == "camp_foundation",
		"verified resident objective did not advance to camp foundation")
	var lab_raid_runtime: RaidRuntime = lab.get("raid_runtime")
	_check(
		lab_raid_runtime != null and lab_raid_runtime.configured,
		"lab does not run the production raid runtime")
	var interface_panel: PanelContainer = lab.get("interface_panel")
	_check(
		interface_panel != null and not interface_panel.visible
			and not lab_player.controls_locked,
		"lab did not start in first-person exploration mode")
	lab.call("_set_interface_open", true)
	_check(
		interface_panel.visible and lab_player.controls_locked
			and Input.mouse_mode == Input.MOUSE_MODE_VISIBLE,
		"opening lab controls did not release the mouse and lock movement")
	lab.call("_set_interface_open", false)
	_check(
		not interface_panel.visible and not lab_player.controls_locked,
		"closing lab controls did not restore first-person input")
	var stream_chunk_before: Vector3i = lab_world.get("_last_player_chunk")
	lab_player.global_position.x += float(VoxelWorld.CHUNK_SIZE * 2)
	lab_world.call("_process", 0.0)
	var stream_chunk_after: Vector3i = lab_world.get("_last_player_chunk")
	_check(
		stream_chunk_after != stream_chunk_before,
		"moving the lab player did not advance the chunk-streaming focus")
	lab.call("_travel_to_selected_settlement")
	var selected_id: String = lab.call("_selected_settlement_id")
	var selected_anchor: Vector2i = (
		lab.get("plot_anchors") as Dictionary).get(
			selected_id, Vector2i.ZERO)
	_check(
		Vector2(
			lab_player.global_position.x - selected_anchor.x,
			lab_player.global_position.z - selected_anchor.y).length() <= 15.0,
		"travel control did not move the player beside the selected settlement")
	var preset_option: OptionButton = lab.get("preset_select")
	var parcel_anchors: Dictionary = lab.get("parcel_anchors")
	_check(
		(parcel_anchors.get(selected_id, {}) as Dictionary).size() == 5,
		"lab did not expose five deliberate Stage B parcels")
	_check(
		(lab.get("prepared_parcels") as Dictionary).is_empty(),
		"lab eagerly mutated every parcel during scene startup")
	_check(
		bool(((lab.call("lab_quest_state") as Dictionary).get(
			"events", {}) as Dictionary).get("scenario.camp", false)),
		"fresh Camp did not update the quest guide")
	_check(
		(lab.get("parcel_select") as OptionButton).item_count == 5
			and (lab.get("rotation_select") as OptionButton).item_count == 4,
		"parcel and four-rotation controls are missing")
	_check(
		SettlementManager.get_project_proposals(selected_id).size() == 133,
		"lab does not expose all projects and plans through real proposals")

	var settlement_option: OptionButton = lab.get("settlement_select")
	settlement_option.select(1)
	settlement_option.item_selected.emit(1)
	lab.call("_travel_to_selected_settlement")
	for _frame in 3:
		await get_tree().process_frame
	var second_settlement_id := str(lab.call("_selected_settlement_id"))
	_check(
		int(lab.call("lab_active_resident_count")) == 3,
		"second settlement did not promote its independent resident roster")
	_check(
		HamletState.get_npc_ids().all(func(npc_id: String) -> bool:
			return npc_id.begins_with(second_settlement_id + ".npc.")),
		"switching settlements left actors from the first settlement active")
	lab.call("lab_quest_event", "second_settlement_scenario")
	var second_quest_events: Dictionary = (
		(lab.call("lab_quest_state") as Dictionary).get("events", {}))
	_check(
		bool(second_quest_events.get("second_settlement_visited", false))
			and bool(second_quest_events.get("second_settlement_scenario", false)),
		"second-settlement travel/scenario did not satisfy isolation guidance")
	settlement_option.select(0)
	settlement_option.item_selected.emit(0)
	lab.call("_travel_to_selected_settlement")
	for _frame in 2:
		await get_tree().process_frame

	var ids: Array = SettlementManager.settlements.keys()
	ids.sort()
	_check(ids.size() == 2, "settlement manager did not retain both lab records")
	if ids.size() == 2:
		SettlementManager.focus_settlement(str(ids[0]))
		var stack := Inventory.make_stack_from_ref({
			"kind": "block",
			"stable_id": "construction.planks.oak",
			"count": 3,
		})
		HamletState.warehouse_add_stack(stack)
		SettlementManager.get_settlement(str(ids[0]))
		SettlementManager.focus_settlement(str(ids[1]))
		_check(
			HamletState.warehouse_count_ref({
				"kind": "block",
				"stable_id": "construction.planks.oak",
				"count": 1,
			}) == 0,
			"warehouse inventory leaked into the second settlement")
		SettlementManager.focus_settlement(str(ids[0]))
		_check(
			HamletState.warehouse_count_ref({
				"kind": "block",
				"stable_id": "construction.planks.oak",
				"count": 1,
			}) == 3,
			"first settlement warehouse did not survive focus switching")

	_check(
		SettlementManager.get_project_proposals(str(ids[0])).size() == 133,
		"focused Camp did not retain its full proposal catalogue")
	var capability := SettlementManager.get_population_report(str(ids[0]))
	_check(
		bool(capability.get("ok", false))
			and int(capability.get("population", 0)) == 3,
		"Camp population report is invalid")
	var resource_select: OptionButton = lab.get("resource_select")
	_check(
		resource_select != null and resource_select.item_count > 0,
		"lab did not expose a chosen-resource grant")
	if resource_select != null and resource_select.item_count > 0:
		var resource_ref: Dictionary = resource_select.get_item_metadata(
			resource_select.selected)
		var resource_before := HamletState.warehouse_count_ref(resource_ref)
		lab.call("_grant_selected_resource")
		_check(
			HamletState.warehouse_count_ref(resource_ref) > resource_before,
			"chosen-resource grant did not reach settlement storage")
	var building_ids := HamletState.runtime_buildings.keys()
	building_ids.sort()
	if not building_ids.is_empty():
		var building_id := str(building_ids[0])
		var condition_before := float(HamletState.runtime_buildings[
			building_id].get("condition", 1.0))
		lab.call("_damage_first_building")
		var condition_damaged := float(HamletState.runtime_buildings[
			building_id].get("condition", 1.0))
		_check(
			condition_damaged < condition_before,
			"building damage control did not reduce condition")
		lab.call("_repair_first_building")
		_check(
			float(HamletState.runtime_buildings[building_id].get(
				"condition", 0.0)) > condition_damaged,
			"building repair control did not restore condition")
		lab.call("_toggle_first_building")
		_check(
			not bool(HamletState.runtime_buildings[building_id].get(
				"active", true)),
			"building deactivate control did not change runtime state")
		lab.call("_toggle_first_building")
		_check(
			bool(HamletState.runtime_buildings[building_id].get(
				"active", false)),
			"building activate control did not restore runtime state")

	_select_metadata(
		lab.get("project_select"), "project.build.wooden_watchtower")
	lab.call("_create_selected_project")
	_check(
		str(HamletState.project.get("definition_id", ""))
			== "project.build.wooden_watchtower",
		"lab did not create the selected real project")
	lab.call("_grant_exact_supplies")
	lab.call("_reserve_active_stage")
	_check(
		HamletState.project_is_building(),
		"exact requirements did not reserve the project stage")
	_check(
		bool(lab.call("_advance_one_block")),
		"lab could not commit one real blueprint voxel")
	var first_stage := int(HamletState.project.get("stage_index", 0))
	lab.call("_complete_active_stage")
	_check(
		bool(HamletState.project.get("complete", false))
			or int(HamletState.project.get("stage_index", 0)) > first_stage,
		"complete-stage control did not advance the project")
	lab.call("_complete_active_project")
	_check(
		bool(HamletState.project.get("complete", false)),
		"complete-project control did not finish the active blueprint")
	_select_metadata(
		lab.get("project_select"), "project.build.small_cottage")
	_select_metadata(lab.get("parcel_select"), "steep")
	lab.call("_create_selected_project")
	lab.call("_cancel_active_project")
	_check(
		bool(HamletState.project.get("cancelled", false)),
		"cancel-project control did not cancel a cancellable project")

	_select_metadata(
		lab.get("plan_select"), "project.megaproject.city_ward_portal_nexus")
	lab.call("_create_selected_plan")
	_check(
		not HamletState.runtime_plans.is_empty(),
		"lab did not create a real settlement plan graph")
	lab.call("_reserve_available_component")
	var component_target: Dictionary = lab.call(
		"_first_building_plan_component")
	_check(
		not component_target.is_empty(),
		"plan component grant/reservation did not begin available work: %s %s"
			% [lab.get("last_message"), HamletState.runtime_plans])
	if not component_target.is_empty():
		lab.call("_advance_available_component")
		var plan_runtime: Dictionary = HamletState.runtime_plans[
			component_target["instance_id"]]
		var component: Dictionary = plan_runtime["component_records"][
			component_target["component_id"]]
		_check(
			float(component.get("progress", 0.0)) > 0.0,
			"advance-component control did not add progress")
		var component_condition := float(component.get("condition", 1.0))
		lab.call("_damage_first_plan_component")
		plan_runtime = HamletState.runtime_plans[
			component_target["instance_id"]]
		component = plan_runtime["component_records"][
			component_target["component_id"]]
		var damaged_condition := float(component.get("condition", 1.0))
		_check(
			damaged_condition < component_condition,
			"plan-component damage control did not reduce condition")
		lab.call("_repair_first_plan_component")
		plan_runtime = HamletState.runtime_plans[
			component_target["instance_id"]]
		component = plan_runtime["component_records"][
			component_target["component_id"]]
		_check(
			float(component.get("condition", 0.0)) > damaged_condition,
			"plan-component repair control did not restore condition")
	var mode_before := str((lab.get("simulation_modes") as Dictionary).get(
		str(ids[0]), "near"))
	lab.call("_toggle_simulation_mode")
	_check(
		str((lab.get("simulation_modes") as Dictionary).get(
			str(ids[0]), "")) != mode_before,
		"near/far simulation control did not switch mode")
	lab.call("_simulate_hour")
	_check(
		not (lab.get("last_simulation") as Dictionary).is_empty()
			and str((lab.get("last_simulation") as Dictionary).get("kernel", ""))
				== "settlement.fixed_step.v1",
		"lab did not use the fixed-step settlement simulation kernel")

	lab.call("lab_quest_event", "probe.snapshot_marker")
	lab.call("_save_snapshot")
	_check(
		FileAccess.file_exists(str(lab.call("lab_snapshot_path"))),
		"lab snapshot was not committed")
	HamletState.reputation_points = 777
	lab.call("_reset_quest_guide")
	lab.call("_load_snapshot")
	_check(
		HamletState.reputation_points != 777,
		"lab snapshot reload did not restore settlement state")
	var restored_quest_events: Dictionary = (
		(lab.call("lab_quest_state") as Dictionary).get("events", {}))
	_check(
		bool(restored_quest_events.get("probe.snapshot_marker", false)),
		"lab snapshot reload did not restore quest-guide progress")
	_check(
		bool(restored_quest_events.get("snapshot_saved", false))
			and bool(restored_quest_events.get("snapshot_reloaded", false)),
		"snapshot actions did not complete their quest-guide milestones")
	_check(
		WorldManager.active_world.is_empty(),
		"lab selected or modified a production world")
	_check(
		SettlementManager.get_project_proposals(
			str(lab.call("_selected_settlement_id"))).any(
				func(value: Dictionary) -> bool:
					return (
						str(value.get("id", ""))
							== "project.build.wooden_watchtower")),
		"watchtower proposal disappeared after progression")
	_check(
		SettlementManager.get_project_proposals(
			str(lab.call("_selected_settlement_id"))).any(
				func(value: Dictionary) -> bool:
					return (
						str(value.get("id", ""))
							== "project.build.small_cottage")),
		"cottage growth proposal disappeared")
	_check(
		VillageProgressionQuestGuide.STEPS.size() == 31,
		"expanded quest guide count drifted")
	lab.call("_reset_lab")
	_check(
		int(lab.call("lab_settlement_count")) == 2,
		"reset control did not rebuild both isolated settlement plots")
	lab.queue_free()
	await get_tree().process_frame
	_finish()


func _select_metadata(option: OptionButton, requested: String) -> void:
	for index in option.item_count:
		if str(option.get_item_metadata(index)) == requested:
			option.select(index)
			return


func _finish() -> void:
	var report := {
		"ok": failures.is_empty(),
		"checks": checks,
		"failures": failures,
	}
	print("VILLAGE_PROGRESSION_LAB_PROBE %s" % JSON.stringify(report))
	get_tree().quit(0 if failures.is_empty() else 1)
