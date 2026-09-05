class_name HamletRuntime
extends Node3D
## Promotes persistent NPC records into nearby actors and demotes them back to
## record-only simulation outside the hamlet's local range.

const NpcActorScript = preload("res://scripts/world/hamlet_npc_actor.gd")
const ProfessionEngine = preload(
	"res://scripts/settlement/settlement_profession_engine.gd")
const WorksiteVisualScript = preload(
	"res://scripts/world/settlement_worksite_visual.gd")
const SitePreviewScript = preload(
	"res://scripts/world/settlement_site_preview.gd")
const ACTOR_RANGE := 92.0
const DEMOTE_RANGE := 108.0
const BUILD_INTERVAL := 0.32
const BUILDER_WORK_RADIUS := 7.5
const PROFESSION_INTERVAL := 0.5
const PROFESSION_WORK_RADIUS := 4.5
# Historical probes and legacy-world integrations use this stable POC ID.
# Regional settlements resolve their namespaced builder through HamletState.
const BUILDER_ID := "npc.poc.forest_hamlet.builder_talia"

var world: VoxelWorld
var player: Player
var configured := false
var actor_range := ACTOR_RANGE
var demote_range := DEMOTE_RANGE
var _actors: Dictionary = {}
var _worksite_visuals: Dictionary = {}
var _site_preview: SettlementSitePreview
var _visual_stage := -1
var _build_accumulator := 0.0
var _profession_accumulator := 0.0
var _site_preview_accumulator := 0.0
var _settlement_scan_accumulator := 0.0


func configure(p_world: VoxelWorld, p_player: Player) -> void:
	world = p_world
	player = p_player
	configured = world != null and player != null
	if configured:
		_refresh_actor_lod()
		_sync_site_preview(true)


func apply_scalability_profile(profile: Dictionary) -> void:
	actor_range = clampf(
		float(profile.get("npc_actor_range", ACTOR_RANGE)), 64.0, 160.0)
	demote_range = maxf(
		actor_range + 12.0,
		float(profile.get("npc_demote_range", DEMOTE_RANGE)))
	if configured:
		_refresh_actor_lod()


func _process(delta: float) -> void:
	if not configured or not HamletState.initialized:
		return
	SimulationLodManager.advance_runtime_minutes(
		delta * HamletState.MINUTES_PER_REAL_SECOND)
	_settlement_scan_accumulator += delta
	if _settlement_scan_accumulator >= 1.0:
		_settlement_scan_accumulator = 0.0
		_refresh_settlement_focus()
	HamletState.advance_time(delta)
	SettlementManager.advance_far_simulation(
		delta * HamletState.MINUTES_PER_REAL_SECOND)
	_refresh_actor_lod()
	_sync_completed_project_stages()
	_advance_builder_construction(delta)
	_advance_material_professions(delta)
	_sync_worksite_visuals()
	_site_preview_accumulator += delta
	if _site_preview_accumulator >= 0.20:
		_site_preview_accumulator = 0.0
		_sync_site_preview()


func _sync_completed_project_stages() -> void:
	if _actors.is_empty():
		return
	var completed_stages := HamletState.PROJECT_STAGES.size() \
		if bool(HamletState.project.get("complete", false)) \
		else maxi(0, int(HamletState.project.get("stage_index", 1)) - 1)
	if completed_stages == _visual_stage:
		return
	if world.apply_project_blueprint_stages(
			str(HamletState.project.get(
				"definition_id", HamletState.DEFAULT_PROJECT_ID)),
			completed_stages,
			_project_world_anchor()):
		_visual_stage = completed_stages


func _advance_builder_construction(delta: float) -> void:
	var builder_id := HamletState.get_npc_id_for_job("job.builder.basic")
	if builder_id.is_empty() or not _actors.has(builder_id):
		_build_accumulator = 0.0
		return
	var actor: HamletNpcActor = _actors[builder_id]
	if not is_instance_valid(actor):
		return
	var builder_record := HamletState.get_npc_record(builder_id)
	if str(builder_record.get("schedule_state", "")) != "work":
		_build_accumulator = 0.0
		return
	# Confirmed settlement projects own explicit access, clearing, levelling,
	# authored-stage, and activation packages. Advance that contract before the
	# legacy direct-blueprint path so site preparation cannot be skipped.
	if not (HamletState.project.get("work_package_ids", []) as Array).is_empty():
		_build_accumulator += delta
		if _build_accumulator < BUILD_INTERVAL:
			return
		_build_accumulator = 0.0
		var result := SettlementManager.advance_project_work(
			HamletState.active_village_id,
			str(HamletState.project.get("instance_id", "")),
			builder_id)
		if bool(result.get("progress_consumed", false)):
			actor.play_action("build", 0.55)
		return
	if not HamletState.project_is_building():
		_build_accumulator = 0.0
		return
	var work: Array = builder_record.get("work", [])
	if work.size() < 2:
		return
	var work_target := Vector2(float(work[0]) + 0.5, float(work[1]) + 0.5)
	var builder_position := Vector2(actor.global_position.x, actor.global_position.z)
	if builder_position.distance_to(work_target) > BUILDER_WORK_RADIUS:
		_build_accumulator = 0.0
		return
	var stage_index := int(HamletState.project.get("stage_index", 1))
	var project_id := str(HamletState.project.get(
		"definition_id", HamletState.DEFAULT_PROJECT_ID))
	var anchor := _project_world_anchor()
	var placements := world.get_project_stage_placements(
		project_id, stage_index, anchor)
	if placements.is_empty():
		return
	HamletState.set_project_stage_total(placements.size())
	var placement_index := int(HamletState.project.get("placed_blocks", 0))
	if placement_index >= placements.size():
		return
	_build_accumulator += delta
	if _build_accumulator < BUILD_INTERVAL:
		return
	_build_accumulator = 0.0
	actor.play_action("build", 0.55)
	var project_definition := SettlementContentRegistry.get_project(project_id)
	var stage_definition := HamletState.get_project_stage_definition(stage_index)
	if world.place_blueprint_stage_cell(
			str(project_definition.get("blueprint_id", "")),
			str(stage_definition.get("id", "")),
			anchor,
			placement_index):
		var was_complete := bool(HamletState.project.get("complete", false))
		HamletState.record_project_block_placed(placements.size())
		if not was_complete and bool(HamletState.project.get("complete", false)) \
				and SettlementManager.initialized:
			var completion_handoff: Dictionary = (
				SettlementManager.register_completed_project(
				HamletState.active_village_id,
				str(HamletState.project.get("instance_id", "")),
				anchor))
			if not bool(completion_handoff.get("ok", false)):
				push_warning("HamletRuntime: project completion handoff failed: %s" \
					% completion_handoff)


func _advance_material_professions(delta: float) -> void:
	_profession_accumulator += delta
	if _profession_accumulator < PROFESSION_INTERVAL:
		return
	var elapsed_minutes := _profession_accumulator \
		* HamletState.MINUTES_PER_REAL_SECOND
	_profession_accumulator = 0.0
	for job_id in ProfessionEngine.material_job_ids():
		var resident_id := HamletState.get_npc_id_for_job(job_id)
		if resident_id.is_empty() or not _actors.has(resident_id):
			continue
		var actor: HamletNpcActor = _actors[resident_id]
		if not is_instance_valid(actor):
			continue
		var evidence := _profession_arrival_evidence(resident_id, actor)
		var result := HamletState.advance_material_profession(
			resident_id, elapsed_minutes, evidence)
		if not bool(result.get("ok", false)):
			continue
		var resident: Dictionary = result.get("resident", {})
		var task: Dictionary = resident.get("current_task", {})
		if str(task.get("status", "")) == "active":
			actor.play_action({
				"job.farmer.basic": "work",
				"job.miner.basic": "mine",
				"job.lumberjack.basic": "chop",
			}.get(job_id, "work"), PROFESSION_INTERVAL + 0.1)


func _profession_arrival_evidence(
		resident_id: String, actor: HamletNpcActor) -> Dictionary:
	if not MovementManager.initialized or not MovementManager.has_mover(resident_id):
		return {}
	var resident := HamletState.get_npc_record(resident_id)
	var task: Dictionary = resident.get("current_task", {})
	var workplace_id := str(task.get("workplace_instance_id", ""))
	var destination: Array = task.get("destination", [])
	if workplace_id.is_empty() or destination.size() < 3:
		return {}
	var target := Vector2(float(destination[0]), float(destination[2]))
	if Vector2(actor.global_position.x, actor.global_position.z).distance_to(
			target) > PROFESSION_WORK_RADIUS:
		return {}
	var mover := MovementManager.mover_record(resident_id)
	var intent_id := str(mover.get("movement_goal_ref", ""))
	var intent := MovementManager.movement_intent(intent_id)
	if str(intent.get("movement_status", "")) != "Arrived":
		return {}
	var goal: Array = intent.get("goal_position", [])
	if goal.size() >= 3 and Vector2(float(goal[0]), float(goal[2])).distance_to(
			target) > PROFESSION_WORK_RADIUS:
		return {}
	var evidence_refs: Array = intent.get("evidence_refs", [])
	if evidence_refs.is_empty():
		return {}
	return {
		"arrived": true,
		"mover_id": resident_id,
		"destination_ref": workplace_id,
		"movement_intent_id": intent_id,
		"evidence_id": str(evidence_refs.back()),
		"position": [
			actor.global_position.x,
			actor.global_position.y,
			actor.global_position.z,
		],
		"lod_mode": "near",
	}


func _project_world_anchor() -> Vector3i:
	var position: Array = HamletState.project.get("position", [])
	var x := HamletState.watchtower_anchor.x
	var z := HamletState.watchtower_anchor.y
	if position.size() >= 2:
		x = int(position[0])
		z = int(position[1])
	return Vector3i(x, world.surface_height_at(x, z), z)


func _refresh_actor_lod() -> void:
	var hamlet := Vector3(
		float(HamletState.hamlet_anchor.x) + 0.5,
		player.global_position.y,
		float(HamletState.hamlet_anchor.y) + 0.5)
	var distance := player.global_position.distance_to(hamlet)
	if distance <= actor_range:
		for npc_id in HamletState.get_npc_ids():
			var record := HamletState.get_npc_record(npc_id)
			if _actors.has(npc_id) or not bool(record.get("alive", true)):
				continue
			var saved: Array = record.get("position", [])
			if saved.size() < 3:
				continue
			if float(saved[1]) <= 0.0:
				var surface_y := world.surface_height_at(
					floori(float(saved[0])), floori(float(saved[2])))
				saved[1] = float(surface_y) + 0.05
				HamletState.update_npc_position(
					npc_id,
					Vector3(float(saved[0]), float(saved[1]), float(saved[2])))
			var spawn_gp := Vector3i(
				floori(float(saved[0])),
				clampi(floori(float(saved[1])), 0, VoxelWorld.WORLD_HEIGHT - 1),
				floori(float(saved[2])))
			# Wait for normal player-centred streaming to prepare both the
			# villager's feet and ground. This avoids a visible fall through an
			# empty, not-yet-generated column.
			if not world.is_voxel_loaded_at(spawn_gp) \
					or not world.is_voxel_loaded_at(
						Vector3i(spawn_gp.x, maxi(0, spawn_gp.y - 1), spawn_gp.z)):
				continue
			if not _transition_npc_lod(npc_id, "local", "actor"):
				continue
			var actor: HamletNpcActor = NpcActorScript.new()
			actor.setup(world, npc_id)
			add_child(actor)
			_actors[npc_id] = actor
		_sync_worksite_visuals()
	elif distance >= demote_range:
		_clear_actors(true)
		_clear_worksite_visuals()


func _refresh_settlement_focus() -> void:
	if world == null or player == null \
			or not world.is_regional_worldgen():
		return
	var nearby := SettlementManager.materialize_nearby(
		world,
		Vector2(player.global_position.x, player.global_position.z),
		actor_range)
	if nearby.is_empty():
		return
	var nearest_id := str(nearby[0].get("settlement_id", ""))
	if nearest_id.is_empty() \
			or nearest_id == SettlementManager.focused_settlement_id:
		return
	focus_settlement(nearest_id)


func focus_settlement(settlement_id: String) -> bool:
	## Switches the compatibility facade and its promoted actors as one
	## transaction. Development scenes and explicit travel controls use this
	## instead of leaving actors from the previous settlement attached.
	if settlement_id.is_empty():
		return false
	if settlement_id == SettlementManager.focused_settlement_id:
		if configured:
			_refresh_actor_lod()
		return true
	if not _clear_actors(true):
		return false
	if not SettlementManager.focus_settlement(settlement_id):
		return false
	_visual_stage = -1
	_build_accumulator = 0.0
	if configured:
		_refresh_actor_lod()
	return true


func refresh_focused_settlement() -> void:
	_clear_actors(false)
	_visual_stage = -1
	_build_accumulator = 0.0
	if configured:
		_refresh_actor_lod()


func _clear_actors(save_positions: bool) -> bool:
	var all_demoted := true
	for npc_id in _actors.keys():
		var actor: HamletNpcActor = _actors[npc_id]
		if not is_instance_valid(actor):
			continue
		if save_positions and HamletState.npc_records.has(str(npc_id)):
			HamletState.update_npc_position(str(npc_id), actor.global_position)
		if not _transition_npc_lod(str(npc_id), "distant", "record"):
			all_demoted = false
			continue
		actor.queue_free()
		_actors.erase(npc_id)
	return all_demoted


func _sync_worksite_visuals() -> void:
	if world == null or player == null:
		return
	var wanted := {}
	for instance_value in HamletState.runtime_buildings:
		var instance_id := str(instance_value)
		var building: Dictionary = HamletState.runtime_buildings[instance_value]
		var state: Dictionary = building.get("worksite_state", {})
		if str(state.get("schema", "")) != ProfessionEngine.WORKSITE_STATE_SCHEMA \
				or str(state.get("job_id", "")) != "job.farmer.basic":
			continue
		var position: Array = building.get("position", [])
		if position.size() < 2:
			continue
		wanted[instance_id] = true
		var visual: Node3D
		if _worksite_visuals.has(instance_id) \
				and is_instance_valid(_worksite_visuals[instance_id]):
			visual = _worksite_visuals[instance_id]
		else:
			visual = WorksiteVisualScript.new()
			visual.setup(instance_id)
			add_child(visual)
			_worksite_visuals[instance_id] = visual
		var x := float(position[0]) + 4.0
		var z := float(position[2]) if position.size() >= 3 else float(position[1])
		visual.global_position = Vector3(
			x, float(world.surface_height_at(floori(x), floori(z))) + 0.06, z)
		visual.apply_state(state)
	for instance_value in _worksite_visuals.keys():
		var instance_id := str(instance_value)
		if wanted.has(instance_id):
			continue
		var visual: Node = _worksite_visuals[instance_value]
		if is_instance_valid(visual):
			visual.queue_free()
		_worksite_visuals.erase(instance_value)


func _clear_worksite_visuals() -> void:
	for visual_value in _worksite_visuals.values():
		var visual: Node = visual_value
		if is_instance_valid(visual):
			visual.queue_free()
	_worksite_visuals.clear()


func active_worksite_visual_count() -> int:
	return _worksite_visuals.size()


func _sync_site_preview(force_rebuild := false) -> void:
	if world == null or not SettlementManager.initialized \
			or HamletState.active_village_id.is_empty():
		_clear_site_preview()
		return
	var record: Dictionary = SettlementManager.settlements.get(
		HamletState.active_village_id, {})
	var survey: Dictionary = record.get("pending_survey", {})
	if survey.is_empty():
		var project: Dictionary = HamletState.project
		if bool(project.get("complete", false)) \
				or bool(project.get("cancelled", false)):
			_clear_site_preview()
			return
		var package_ids: Array = project.get("work_package_ids", [])
		var package_index := int(project.get("work_package_index", 0))
		if package_index >= package_ids.size():
			_clear_site_preview()
			return
		var packages: Dictionary = record.get("work_packages", {})
		var active_package: Dictionary = packages.get(
			str(package_ids[package_index]), {})
		if str(active_package.get("kind", "")) not in [
			"route", "vegetation", "terrain", "clearance", "fill",
		]:
			_clear_site_preview()
			return
		survey = (record.get("surveys", {}) as Dictionary).get(
			str(project.get("site_survey_hash", "")), {})
	if survey.is_empty():
		_clear_site_preview()
		return
	if _site_preview == null or not is_instance_valid(_site_preview):
		_site_preview = SitePreviewScript.new()
		_site_preview.name = "SettlementSitePreview"
		add_child(_site_preview)
	elif force_rebuild:
		_site_preview.plan_hash = ""
	_site_preview.apply_survey(survey)


func _clear_site_preview() -> void:
	if _site_preview != null and is_instance_valid(_site_preview):
		_site_preview.queue_free()
	_site_preview = null


func active_site_preview_snapshot() -> Dictionary:
	return _site_preview.visual_snapshot() \
		if _site_preview != null and is_instance_valid(_site_preview) else {}


func prepare_for_save() -> void:
	## Save the promoted actor positions and owner snapshots without changing
	## their representation or freeing nodes from the running scene.
	for npc_id in _actors.keys():
		var actor: HamletNpcActor = _actors[npc_id]
		if not is_instance_valid(actor):
			continue
		HamletState.update_npc_position(str(npc_id), actor.global_position)
		_refresh_npc_lod_snapshot(str(npc_id), "actor")


func _transition_npc_lod(
		npc_id: String, target_mode: String, representation: String) -> bool:
	if not SimulationLodManager.initialized:
		return true
	var snapshot := HamletState.npc_lod_snapshot(npc_id)
	if snapshot.is_empty():
		return false
	var state: Dictionary = snapshot.get("state", {})
	var current_representation := (
		"actor" if _actors.has(npc_id) else "record")
	state["representation"] = current_representation
	snapshot["state"] = state
	var owner_id := HamletState.active_village_id
	if not SimulationLodManager.has_subject(npc_id):
		var initial_mode := "distant" if target_mode == "local" else "local"
		var registered := SimulationLodManager.register_subject(
			npc_id, "resident", owner_id, owner_id, initial_mode, snapshot)
		if not bool(registered.get("ok", false)):
			return false
	else:
		var refreshed := SimulationLodManager.refresh_subject(
			npc_id, snapshot, owner_id)
		if not bool(refreshed.get("ok", false)):
			return false
	var before: Dictionary = SimulationLodManager.subject_record(
		npc_id).get("snapshot", {})
	var after := before.duplicate(true)
	var after_state: Dictionary = after.get("state", {})
	after_state["representation"] = representation
	after["state"] = after_state
	var current_mode := str(SimulationLodManager.subject_record(
		npc_id).get("lod_mode", ""))
	if current_mode == target_mode:
		var refreshed := bool(SimulationLodManager.refresh_subject(
			npc_id, after, owner_id).get("ok", false))
		return refreshed and _transition_movement_lod(npc_id, target_mode)
	var transitioned := SimulationLodManager.transition_subject(
		npc_id, target_mode, before, after, "", {"owner_id": owner_id})
	return bool(transitioned.get("ok", false)) \
		and _transition_movement_lod(npc_id, target_mode)


func _transition_movement_lod(npc_id: String, target_mode: String) -> bool:
	if not MovementManager.initialized or not MovementManager.has_mover(npc_id):
		return true
	var movement_lod := "local" if target_mode == "local" else "distant"
	var result := MovementManager.transition_lod(npc_id, movement_lod, {
		"transition_id": "simulation_lod.%s.%s" % [npc_id, target_mode],
		"transition_reason": "hamlet_actor_streaming",
	})
	return bool(result.get("ok", false))


func _refresh_npc_lod_snapshot(npc_id: String, representation: String) -> bool:
	if not SimulationLodManager.initialized:
		return true
	var snapshot := HamletState.npc_lod_snapshot(npc_id)
	if snapshot.is_empty():
		return false
	var state: Dictionary = snapshot.get("state", {})
	state["representation"] = representation
	snapshot["state"] = state
	var owner_id := HamletState.active_village_id
	if not SimulationLodManager.has_subject(npc_id):
		return bool(SimulationLodManager.register_subject(
			npc_id, "resident", owner_id, owner_id,
			"local" if representation == "actor" else "distant",
			snapshot).get("ok", false))
	return bool(SimulationLodManager.refresh_subject(
		npc_id, snapshot, owner_id).get("ok", false))


func active_actor_count() -> int:
	return _actors.size()
