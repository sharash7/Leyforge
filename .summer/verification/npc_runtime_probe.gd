extends Node
## Render-independent regression probe for the visible Hamlet NPC actors.
## Unlike the project probes, this lets CharacterBody3D physics move the actors
## and requires the builder to reach the site without being teleported there.

const BUILDER_ID := "npc.poc.forest_hamlet.builder_talia"
const MAX_WALK_FRAMES := 240
const MAX_BUILD_FRAMES := 900
const JOB_PRESENTATION := {
	"job.leader.elder": {"tool": "", "action": ""},
	"job.builder.basic": {
		"tool": "item.tool.hammer_basic", "action": "build"},
	"job.farmer.basic": {
		"tool": "item.tool.hoe_basic", "action": "work"},
	"job.guard.militia": {
		"tool": "item.weapon.iron_sword", "action": "guard"},
	"job.merchant.basic": {"tool": "", "action": ""},
	"job.mage.apprentice": {
		"tool": "item.weapon.apprentice_staff", "action": "cast"},
	"job.miner.basic": {
		"tool": "item.tool.stone_pickaxe", "action": "mine"},
	"job.lumberjack.basic": {
		"tool": "item.tool.stone_axe", "action": "chop"},
}

var checks := 0
var failures: Array[String] = []
var _runtime: HamletRuntime


func _ready() -> void:
	call_deferred("_run")


func _check(condition: bool, message: String) -> void:
	checks += 1
	if not condition:
		failures.append(message)


func _clear_inventory() -> void:
	Inventory.hotbar = Inventory._empty_slots(Inventory.HOTBAR_SIZE)
	Inventory.backpack = Inventory._empty_slots(Inventory.BACKPACK_SIZE)
	Inventory.craft_grid = Inventory._empty_slots(Inventory.CRAFT_SIZE)
	Inventory.set_crafting_station("hand")


func _supply_foundation() -> void:
	_clear_inventory()
	var definition := HamletState.get_project_stage_definition(1)
	for content_ref in definition.get("requirements", []):
		var leftover := Inventory.add_stack(
			Inventory.make_stack_from_ref(content_ref))
		_check(leftover.is_empty(), "foundation resources did not fit probe inventory")
	var delivered := HamletState.deliver_request(str(
		definition.get("request_id", "")))
	_check(bool(delivered.get("complete", false)),
		"foundation delivery did not enter builder labour")


func _run() -> void:
	var world := VoxelWorld.new()
	add_child(world)
	world.start(1337)
	HamletState.initialize(1337, world.get_valley_anchors())
	SettlementManager.initialize_legacy(1337)
	SettlementManager.bind_world(world)
	SettlementManager.refresh_people_owner()
	SettlementManager.refresh_biology_owner()
	SettlementManager.refresh_social_owner()
	SettlementManager.refresh_political_owner()
	SettlementManager.refresh_movement_owner()
	HamletState.accept_introduction()

	# Prepare every authored NPC, schedule target and project column before actor
	# promotion. The live streamer supplies the same terrain during normal play.
	for npc_id in HamletState.get_npc_ids():
		var record := HamletState.get_npc_record(npc_id)
		var saved: Array = record.get("position", [])
		if saved.size() == 3:
			world.prepare_player_column(Vector3(
				float(saved[0]), float(saved[1]), float(saved[2])))
		var target := HamletState.get_npc_target(npc_id)
		world.prepare_player_column(Vector3(target.x, 20.0, target.y))
	var project_position: Array = HamletState.project.get("position", [])
	if project_position.size() >= 2:
		var project_anchor := Vector3i(
			int(project_position[0]),
			world.surface_height_at(
				int(project_position[0]), int(project_position[1])),
			int(project_position[1]))
		world.prepare_player_column(Vector3(project_anchor))
		for placement in world.get_project_stage_placements(
				str(HamletState.project.get("definition_id", "")),
				int(HamletState.project.get("stage_index", 1)),
				project_anchor):
			world.prepare_player_column(Vector3(placement.get(
				"position", project_anchor)))

	var player := Player.new()
	player.name = "ProbePlayer"
	var head := Node3D.new()
	head.name = "Head"
	var camera := Camera3D.new()
	camera.name = "Camera3D"
	var ray := RayCast3D.new()
	ray.name = "RayCast3D"
	camera.add_child(ray)
	head.add_child(camera)
	player.add_child(head)
	add_child(player)
	player.world = world
	player.global_position = Vector3(
		HamletState.hamlet_anchor.x, 20.0, HamletState.hamlet_anchor.y)

	_runtime = HamletRuntime.new()
	add_child(_runtime)
	_runtime.configure(world, player)
	var npc_ids := HamletState.get_npc_ids()
	_check(_runtime._actors.size() == npc_ids.size(),
		"visible runtime did not promote the complete current NPC roster")
	if _runtime._actors.size() != npc_ids.size():
		_finish()
		return

	var observations := {}
	for npc_id in npc_ids:
		var actor: HamletNpcActor = _runtime._actors[npc_id]
		observations[npc_id] = {
			"start": actor.global_position,
			"minimum_y": actor.global_position.y,
			"maximum_y": actor.global_position.y,
			"previous_velocity_y": actor.velocity.y,
			"jump_launches": 0,
			"illegal_jump_launches": 0,
		}
	for _frame in MAX_WALK_FRAMES:
		await get_tree().physics_frame
		for npc_id in npc_ids:
			var actor: HamletNpcActor = _runtime._actors[npc_id]
			var observation: Dictionary = observations[npc_id]
			observation["minimum_y"] = minf(
				float(observation["minimum_y"]), actor.global_position.y)
			observation["maximum_y"] = maxf(
				float(observation["maximum_y"]), actor.global_position.y)
			if actor.velocity.y > 5.5 \
					and float(observation["previous_velocity_y"]) <= 5.5:
				observation["jump_launches"] = int(
					observation["jump_launches"]) + 1
				var current_y := actor._walkable_surface_y(Vector2i(
					floori(actor.global_position.x),
					floori(actor.global_position.z)))
				var navigation_target := actor._navigation_target()
				var target_y := actor._walkable_surface_y(Vector2i(
					floori(navigation_target.x), floori(navigation_target.z)))
				if current_y <= -100000 or target_y != current_y + 1:
					observation["illegal_jump_launches"] = int(
						observation["illegal_jump_launches"]) + 1
			observation["previous_velocity_y"] = actor.velocity.y
			observations[npc_id] = observation

	for npc_id in npc_ids:
		var actor: HamletNpcActor = _runtime._actors[npc_id]
		var record := HamletState.get_npc_record(npc_id)
		var job_id := str(record.get("job_id", ""))
		var expected: Dictionary = JOB_PRESENTATION.get(job_id, {})
		var observation: Dictionary = observations[npc_id]
		var start: Vector3 = observation["start"]
		var horizontal_progress := Vector2(start.x, start.z).distance_to(
			Vector2(actor.global_position.x, actor.global_position.z))
		_check(not expected.is_empty(),
			"%s has an unclassified current job %s" % [npc_id, job_id])
		_check(str(record.get("schedule_state", "")) == "work",
			"%s did not retain the current work schedule" % npc_id)
		var work: Array = record.get("work", [])
		var expected_target := Vector2(
			float(work[0]) + 0.5, float(work[1]) + 0.5) \
			if work.size() >= 2 else Vector2(INF, INF)
		_check(HamletState.get_npc_target(npc_id).is_equal_approx(expected_target),
			"%s does not navigate toward its authored work target" % npc_id)
		_check(PeopleManager.movement_intent_for_person(npc_id).get(
			"ok", false) and MovementManager.has_mover(npc_id),
			"%s is missing canonical people/movement ownership" % npc_id)
		var expected_tool := str(expected.get("tool", ""))
		var held_tool := Inventory.stack_stable_id(actor._held_stack) \
			if not actor._held_stack.is_empty() else ""
		_check(held_tool == expected_tool,
			"%s presents the wrong current job tool" % npc_id)
		_check(actor._job_action(job_id) == str(expected.get("action", "")),
			"%s presents the wrong current job action" % npc_id)
		_check(horizontal_progress >= 0.4,
			"%s did not make horizontal progress under visible actor physics" % npc_id)
		_check(float(observation["maximum_y"]) \
				- float(observation["minimum_y"]) < 4.0,
			"%s repeatedly bounced instead of following the ground route" % npc_id)
		_check(int(observation["illegal_jump_launches"]) == 0,
			"%s launched a jump without an authored one-block step" % npc_id)
		_check(str(record.get("activity", "")) != "blocked",
			"%s ended the movement pass in a blocked activity" % npc_id)
		observation["end"] = actor.global_position
		observation["horizontal_progress"] = horizontal_progress
		observation["job_id"] = job_id
		observation["tool"] = held_tool
		observation["action"] = actor._job_action(job_id)
		observations[npc_id] = observation
	set_meta("job_observations", observations)

	_supply_foundation()
	var safety := MAX_BUILD_FRAMES
	var builder: HamletNpcActor = _runtime._actors[BUILDER_ID]
	while Vector2(builder.global_position.x, builder.global_position.z).distance_to(
			HamletState.get_npc_target(BUILDER_ID)) \
			> HamletRuntime.BUILDER_WORK_RADIUS and safety > 0:
		await get_tree().physics_frame
		safety -= 1
	# Once physical navigation has put the actor in range, advance one ordinary
	# construction interval. This keeps the probe deterministic under headless
	# render throttling while exercising the same runtime method used each frame.
	_runtime._advance_builder_construction(HamletRuntime.BUILD_INTERVAL + 0.01)
	var builder_record := HamletState.get_npc_record(BUILDER_ID)
	_check(int(HamletState.project.get("placed_blocks", 0)) > 0,
		"builder did not walk into range and place a visible project block")
	_check(Vector2(builder.global_position.x, builder.global_position.z).distance_to(
			HamletState.get_npc_target(BUILDER_ID)) <= HamletRuntime.BUILDER_WORK_RADIUS,
		"builder never reached the authored construction work radius")
	_check(str(builder_record.get("activity", "")) not in ["blocked", ""],
		"builder ended without a valid visible activity")
	_verify_farm_worksite_visual(world)
	_finish()


func _verify_farm_worksite_visual(world: VoxelWorld) -> void:
	var instance_id := "building.probe.visible_farm"
	var farm_x := HamletState.hamlet_anchor.x + 10
	var farm_z := HamletState.hamlet_anchor.y + 4
	world.prepare_player_column(Vector3(farm_x + 4, 20.0, farm_z))
	HamletState.runtime_buildings[instance_id] = {
		"instance_id": instance_id,
		"definition_id": "building.food.basic_farm_plot",
		"owner_id": HamletState.active_village_id,
		"active": true,
		"condition": 1.0,
		"position": [farm_x, farm_z],
		"worksite_state": {
			"schema": SettlementProfessionEngine.WORKSITE_STATE_SCHEMA,
			"version": SettlementProfessionEngine.WORKSITE_STATE_VERSION,
			"job_id": "job.farmer.basic",
			"crop_state": "mature",
			"phase_progress": 1.0,
		},
	}
	_runtime._sync_worksite_visuals()
	_check(_runtime.active_worksite_visual_count() == 1,
		"near Hamlet runtime did not promote the farm worksite visual")
	var visual: Node3D = _runtime._worksite_visuals.get(instance_id)
	var snapshot: Dictionary = visual.visual_snapshot() \
		if is_instance_valid(visual) else {}
	_check(int(snapshot.get("plant_count", 0)) == 15 \
			and is_equal_approx(float(snapshot.get("plant_height", 0.0)), 0.95),
		"mature authoritative crop state projected the wrong visible plants")
	HamletState.runtime_buildings.erase(instance_id)
	_runtime._sync_worksite_visuals()
	_check(_runtime.active_worksite_visual_count() == 0,
		"removed worksite retained a stale visible crop projection")


func _finish() -> void:
	var result := {
		"ok": failures.is_empty(),
		"checks": checks,
		"failures": failures,
		"placed_blocks": int(HamletState.project.get("placed_blocks", 0)),
		"jobs": get_meta("job_observations", {}),
		"builder": _actor_diagnostics(BUILDER_ID),
	}
	print("NPC_RUNTIME_PROBE %s" % JSON.stringify(result))
	get_tree().quit(0 if failures.is_empty() else 1)


func _actor_diagnostics(actor_id: String) -> Dictionary:
	if not is_instance_valid(_runtime):
		return {}
	if not _runtime._actors.has(actor_id):
		return {}
	var actor: HamletNpcActor = _runtime._actors[actor_id]
	var current_cell := Vector2i(
		floori(actor.global_position.x), floori(actor.global_position.z))
	var navigation_target := actor._navigation_target()
	var target_cell := Vector2i(
		floori(navigation_target.x), floori(navigation_target.z))
	var route_summary := {}
	if SettlementManager._terrain_planner != null:
		var plan := SettlementManager._terrain_planner.plan_access_route(
			HamletState.active_village_id,
			Vector3i(current_cell.x, floori(actor.global_position.y), current_cell.y),
			Vector3i(target_cell.x, floori(navigation_target.y), target_cell.y))
		route_summary = {
			"valid": plan.get("valid", false),
			"reason": plan.get("reason", ""),
			"cell_count": (plan.get("cells", []) as Array).size(),
			"maximum_step": plan.get("maximum_step", -1),
		}
	return {
		"position": actor.global_position,
		"target": HamletState.get_npc_target(actor_id),
		"waypoint": actor._waypoint,
		"navigation_target": navigation_target,
		"path_size": actor._navigation_path.size(),
		"path_index": actor._navigation_index,
		"route_failure": actor._last_route_failure,
		"current_surface": actor.world.surface_height_at(
			current_cell.x, current_cell.y),
		"current_walkable": actor._walkable_surface_y(current_cell),
		"target_surface": actor.world.surface_height_at(
			target_cell.x, target_cell.y),
		"target_walkable": actor._walkable_surface_y(target_cell),
		"route_plan": route_summary,
		"blocked_seconds": actor._blocked_seconds,
		"speed": MovementManager.max_speed(actor_id),
		"activity": HamletState.get_npc_record(actor_id).get("activity", ""),
		"schedule_state": HamletState.get_npc_record(actor_id).get(
			"schedule_state", ""),
		"project_building": HamletState.project_is_building(),
		"work_distance": Vector2(
			actor.global_position.x, actor.global_position.z).distance_to(Vector2(
				float((HamletState.get_npc_record(actor_id).get(
					"work", [0, 0]) as Array)[0]) + 0.5,
				float((HamletState.get_npc_record(actor_id).get(
					"work", [0, 0]) as Array)[1]) + 0.5)),
	}
