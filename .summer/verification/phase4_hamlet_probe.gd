extends Node

var failures: Array[String] = []


func _ready() -> void:
	call_deferred("_run")


func _check(condition: bool, message: String) -> void:
	if not condition:
		failures.append(message)


func _clear_inventory() -> void:
	Inventory.hotbar = Inventory._empty_slots(Inventory.HOTBAR_SIZE)
	Inventory.backpack = Inventory._empty_slots(Inventory.BACKPACK_SIZE)
	Inventory.craft_grid = Inventory._empty_slots(Inventory.CRAFT_SIZE)
	Inventory.set_crafting_station("hand")


func _give_ref(content_ref: Dictionary) -> void:
	var stack := Inventory.make_stack_from_ref(content_ref)
	var leftover := Inventory.add_stack(stack)
	_check(leftover.is_empty(), "probe inventory could not hold %s" % content_ref)


func _supply_current_stage(stage_index: int) -> void:
	_clear_inventory()
	var definition := HamletState.get_project_stage_definition(stage_index)
	for content_ref in definition["requirements"]:
		_give_ref(content_ref)
	var request_id := str(definition["request_id"])
	var transaction := HamletState.deliver_request(request_id)
	_check(bool(transaction.get("complete", false)),
		"stage request did not complete: %s" % request_id)
	_check(
		int(HamletState.project.get("stage_index", 0)) == stage_index
			and HamletState.project_is_building(),
		"stage %d did not reserve independently and enter builder labour" % stage_index)


func _build_current_stage(
		stage_index: int, runtime: HamletRuntime, world: VoxelWorld) -> void:
	var placements := world.get_watchtower_stage_placements(stage_index)
	var builder: HamletNpcActor = runtime._actors[HamletRuntime.BUILDER_ID]
	var work_target := HamletState.get_npc_target(HamletRuntime.BUILDER_ID)
	builder.global_position = Vector3(
		work_target.x,
		float(world.surface_height_at(floori(work_target.x), floori(work_target.y))) + 0.05,
		work_target.y)
	runtime._advance_builder_construction(HamletRuntime.BUILD_INTERVAL + 0.01)
	_check(int(HamletState.project.get("placed_blocks", 0)) == 1,
		"builder did not place exactly one block on the first stage tick")
	var first: Dictionary = placements[0]
	_check(world.get_block_global(first["position"]) == int(first["block_id"]),
		"builder progress advanced without its first visible voxel")
	var safety := placements.size() + 2
	while HamletState.project_is_building() \
			and int(HamletState.project.get("stage_index", 0)) == stage_index \
			and safety > 0:
		runtime._advance_builder_construction(HamletRuntime.BUILD_INTERVAL + 0.01)
		safety -= 1
	var advanced := bool(HamletState.project.get("complete", false)) \
		if stage_index == HamletState.PROJECT_STAGES.size() \
		else int(HamletState.project.get("stage_index", 0)) == stage_index + 1 \
			and bool(HamletState.project.get("awaiting_supplies", false))
	_check(advanced, "stage %d did not finish after every visible block was placed" % stage_index)


func _run() -> void:
	var world: VoxelWorld = load("res://scripts/world/voxel_world.gd").new()
	# This probe performs all required column preparation synchronously. Keep
	# the background mesher idle so immediate headless shutdown cannot wait on
	# an unrelated streaming job.
	world.set_process(false)
	add_child(world)
	world.start(1337)
	HamletState.initialize(1337, world.get_valley_anchors())
	_check(HamletState.get_npc_ids().size() == 8, "the authored eight-NPC roster is incomplete")
	_check(HamletState.get_npc_record(
		"npc.poc.forest_hamlet.builder_talia").get("name", "") == "Talia Stonehand",
		"stable NPC identity did not resolve")
	_check(HamletState.reputation_state == HamletState.REP_STRANGER,
		"a fresh hamlet did not start at Stranger")
	_check(not HamletState.permission_enabled("request_delivery"),
		"request delivery was not trust-gated")
	_check(HamletState.accept_introduction(), "elder introduction did not advance trust")
	_check(HamletState.permission_enabled("request_delivery"),
		"Helpful Outsider did not unlock board deliveries")
	var foundation_request := str(HamletState.PROJECT_STAGES[0]["request_id"])
	var frame_request := str(HamletState.PROJECT_STAGES[1]["request_id"])
	_check(
		HamletState.is_request_available(foundation_request)
			and not HamletState.is_request_available(frame_request),
		"future-stage materials were not gated behind the foundation")

	var watchtower: Vector2i = world.get_valley_anchors()["watchtower_site"]
	world.prepare_player_column(Vector3(watchtower.x, 20.0, watchtower.y))
	var prepared_columns := {}
	for stage_index in range(1, HamletState.PROJECT_STAGES.size() + 1):
		for placement in world.get_watchtower_stage_placements(stage_index):
			var position: Vector3i = placement["position"]
			var column := Vector2i(
				world.chunk_coord(position.x), world.chunk_coord(position.z))
			if prepared_columns.has(column):
				continue
			prepared_columns[column] = true
			world.prepare_player_column(Vector3(position) + Vector3(0.5, 1.0, 0.5))
	var dummy_player: Player = load("res://scripts/player/player.gd").new()
	dummy_player.name = "ProbePlayer"
	var head := Node3D.new()
	head.name = "Head"
	var camera := Camera3D.new()
	camera.name = "Camera3D"
	var ray := RayCast3D.new()
	ray.name = "RayCast3D"
	camera.add_child(ray)
	head.add_child(camera)
	dummy_player.add_child(head)
	add_child(dummy_player)
	dummy_player.world = world
	dummy_player.global_position = Vector3(
		HamletState.hamlet_anchor.x, 20.0, HamletState.hamlet_anchor.y)
	# Runtime actors intentionally wait for streamed terrain collision. Prepare
	# their saved columns before asserting the full local roster.
	for npc_id in HamletState.get_npc_ids():
		var npc_record := HamletState.get_npc_record(npc_id)
		var saved_position: Array = npc_record.get("position", [])
		if saved_position.size() == 3:
			world.prepare_player_column(Vector3(
				float(saved_position[0]), float(saved_position[1]),
				float(saved_position[2])))
	var runtime: HamletRuntime = load("res://scripts/world/hamlet_runtime.gd").new()
	add_child(runtime)
	runtime.configure(world, dummy_player)
	_check(runtime.active_actor_count() == 8,
		"nearby record promotion did not create all eight NPC actors")
	var farmer: HamletNpcActor = runtime._actors[
		"npc.poc.forest_hamlet.farmer_bram"]
	var first_waypoint: Vector2 = farmer._waypoint
	farmer._choose_waypoint()
	_check(first_waypoint.distance_to(farmer._waypoint) > 0.1,
		"NPC local schedule target did not produce changing movement waypoints")

	for stage_index in range(1, HamletState.PROJECT_STAGES.size() + 1):
		_supply_current_stage(stage_index)
		_build_current_stage(stage_index, runtime, world)
	_check(
		bool(HamletState.project.get("complete", false))
			and is_equal_approx(float(HamletState.project.get("stage_progress", 0.0)), 1.0),
		"finished tower reset to zero progress instead of completing at 100 percent")
	_check("Complete (100%)" in HamletState.project_status_text(),
		"completed project status did not report completion")
	_check(HamletState.reputation_state == HamletState.REP_ALLY,
		"completed staged project did not advance the trust ladder")
	_check(HamletState.permission_enabled("warehouse_withdraw"),
		"Trusted Ally did not gain warehouse withdrawal permission")
	var stage_event_refs: Dictionary = {}
	var stage_event_entries := 0
	var every_stage_event_is_canonical := true
	for history_value in HamletState.project.get("history", []):
		var history_entry: Dictionary = history_value
		if str(history_entry.get("event", "")) not in [
			"stage_reserved", "stage_completed",
		]:
			continue
		stage_event_entries += 1
		var event_ref := str(history_entry.get("event_ref", ""))
		if event_ref.is_empty() or not EventManager.has_event(event_ref):
			every_stage_event_is_canonical = false
		else:
			stage_event_refs[event_ref] = true
	var expected_stage_events := HamletState.PROJECT_STAGES.size() * 2 - 1
	_check(stage_event_entries == expected_stage_events
			and stage_event_refs.size() == expected_stage_events
			and every_stage_event_is_canonical,
		"project stages did not retain distinct canonical reserve/completion events")

	var saved := HamletState.serialize_state()
	var expected_rowan_name := str(HamletState.get_npc_record(
		"npc.poc.forest_hamlet.elder_rowan")["name"])
	HamletState.npc_records.clear()
	HamletState.project["stage"] = "corrupted"
	_check(HamletState.restore_state(saved, 1337), "hamlet save state was rejected")
	_check(
		str(HamletState.project["stage"]) == "complete"
			and float(HamletState.project["stage_progress"]) == 1.0,
		"completed project state did not survive save/restore")
	_check(str(HamletState.get_npc_record(
		"npc.poc.forest_hamlet.elder_rowan")["name"]) == expected_rowan_name,
		"NPC identity did not survive save/restore")

	var warehouse_pos := world.get_hamlet_station_position("warehouse")
	world.prepare_player_column(Vector3(warehouse_pos) + Vector3(0.5, 1.0, 0.5))
	_check(world.station_type_at(warehouse_pos) == "warehouse",
		"authored warehouse voxel did not resolve as an RMB interaction")
	var board_pos := world.get_hamlet_station_position("request_board")
	world.prepare_player_column(Vector3(board_pos) + Vector3(0.5, 1.0, 0.5))
	_check(world.station_type_at(board_pos) == "request_board",
		"authored request-board marker did not resolve as an RMB interaction")
	var actor_collision_ok := true
	for actor in runtime._actors.values():
		if actor.collision_layer != 2 or actor.collision_mask != 1:
			actor_collision_ok = false
	_check(actor_collision_ok,
		"NPC actors still collide with and vibrate against one another")
	_check((dummy_player.ray.collision_mask & 2) != 0,
		"player interaction ray no longer includes the stable NPC collision layer")
	dummy_player.global_position += Vector3(500.0, 0.0, 500.0)
	runtime._refresh_actor_lod()
	_check(runtime.active_actor_count() == 0,
		"distant NPC actors were not demoted back to persistent records")

	var result := {
		"ok": failures.is_empty(),
		"checks": 42,
		"npc_count": HamletState.get_npc_ids().size(),
		"reputation": HamletState.reputation_name(),
		"project_stage": HamletState.project.get("stage", ""),
		"failures": failures,
	}
	print("PHASE4_HAMLET_PROBE ", JSON.stringify(result))
	get_tree().quit(0 if failures.is_empty() else 1)
