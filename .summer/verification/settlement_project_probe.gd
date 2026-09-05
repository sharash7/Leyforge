extends Node
## Wave 0 proof that a second structure uses the same project pipeline.

const BUILDER_ID := "npc.poc.forest_hamlet.builder_talia"

var checks := 0
var failures: Array[String] = []


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


func _supply_stage(stage_index: int) -> void:
	_clear_inventory()
	var definition := HamletState.get_project_stage_definition(stage_index)
	for content_ref in definition.get("requirements", []):
		var leftover := Inventory.add_stack(
			Inventory.make_stack_from_ref(content_ref))
		_check(leftover.is_empty(),
			"inventory could not hold project stage resources")
	var transaction := HamletState.deliver_request(str(
		definition.get("request_id", "")))
	_check(bool(transaction.get("complete", false)),
		"project stage request did not complete")
	_check(HamletState.project_is_building(),
		"project stage did not reserve into builder labour")


func _build_stage(
		stage_index: int,
		runtime: HamletRuntime,
		world: VoxelWorld,
		anchor: Vector3i) -> void:
	var project_id := str(HamletState.project.get("definition_id", ""))
	var placements := world.get_project_stage_placements(
		project_id, stage_index, anchor)
	_check(not placements.is_empty(),
		"project stage did not compile visible blueprint cells")
	var builder: HamletNpcActor = runtime._actors[BUILDER_ID]
	var work_target := HamletState.get_npc_target(BUILDER_ID)
	builder.global_position = Vector3(
		work_target.x,
		float(world.surface_height_at(
			floori(work_target.x), floori(work_target.y))) + 0.05,
		work_target.y)
	var safety := placements.size() + 2
	while HamletState.project_is_building() \
			and int(HamletState.project.get("stage_index", 0)) == stage_index \
			and safety > 0:
		runtime._advance_builder_construction(
			HamletRuntime.BUILD_INTERVAL + 0.01)
		safety -= 1
	_check(safety > 0, "project builder did not finish its compiled stage")
	var first: Dictionary = placements[0]
	_check(world.get_block_global(first["position"]) == int(first["block_id"]),
		"project progress advanced without a visible voxel")


func _verify_primitive_hut_shell(
		runtime: HamletRuntime,
		world: VoxelWorld,
		base_site: Vector2i) -> void:
	var site := base_site + Vector2i(14, 0)
	var instance_id := "project_instance.probe.primitive_hut"
	var created := HamletState.create_project_instance(
		"project.build.catalogue_005", instance_id, [site.x, site.y])
	_check(bool(created.get("ok", false)),
		"primitive hut project instance was not created")
	_check(HamletState.activate_project_instance(instance_id),
		"primitive hut project could not become the active build")
	_check(HamletState.PROJECT_STAGES.size() == 4,
		"primitive hut did not load its four data-defined stages")
	var anchor := Vector3i(site.x, world.surface_height_at(site.x, site.y), site.y)
	var prepared := {}
	for stage_index in range(1, 4):
		for placement in world.get_project_stage_placements(
				"project.build.catalogue_005", stage_index, anchor):
			var position: Vector3i = placement["position"]
			var column := Vector2i(
				world.chunk_coord(position.x), world.chunk_coord(position.z))
			if not prepared.has(column):
				prepared[column] = true
				world.prepare_player_column(
					Vector3(position) + Vector3(0.5, 1.0, 0.5))
	for stage_index in range(1, 4):
		_supply_stage(stage_index)
		_build_stage(stage_index, runtime, world, anchor)
	_check(int(HamletState.project.get("stage_index", 0)) == 4
			and bool(HamletState.project.get("awaiting_supplies", false)),
		"primitive hut shell did not advance after every authored block")
	_check(world.is_door_at(anchor + Vector3i(0, 1, -2)),
		"primitive hut shell did not install its two-cell door")


func _run() -> void:
	var world: VoxelWorld = load("res://scripts/world/voxel_world.gd").new()
	add_child(world)
	world.start(20420)
	HamletState.initialize(20420, world.get_valley_anchors())
	HamletState.accept_introduction()

	var hamlet: Vector2i = world.get_valley_anchors()["hamlet"]
	var site := hamlet + Vector2i(11, 8)
	var instance_id := "project_instance.probe.small_cottage"
	var created := HamletState.create_project_instance(
		"project.build.small_cottage", instance_id, [site.x, site.y])
	_check(bool(created.get("ok", false)),
		"generic cottage project instance was not created")
	_check(HamletState.activate_project_instance(instance_id),
		"generic cottage project could not become the active build")
	_check(HamletState.PROJECT_STAGES.size() == 5,
		"cottage did not load its five data-defined stages")
	_check(str(HamletState.project.get("blueprint_id", ""))
			== "blueprint.leyforge.residential.small_cottage_a",
		"cottage runtime did not retain its blueprint identity")
	var initial_statuses := HamletState.request_status_counts()
	_check(int(initial_statuses.get(HamletState.REQUEST_ACTIVE, 0)) >= 1
			and int(initial_statuses.get(HamletState.REQUEST_DEFERRED, 0)) == 4,
		"project request stages were not separated into active and deferred work")

	var anchor := Vector3i(site.x, world.surface_height_at(site.x, site.y), site.y)
	var prepared := {}
	for stage_index in range(1, HamletState.PROJECT_STAGES.size() + 1):
		for placement in world.get_project_stage_placements(
				"project.build.small_cottage", stage_index, anchor):
			var position: Vector3i = placement["position"]
			var column := Vector2i(
				world.chunk_coord(position.x), world.chunk_coord(position.z))
			if not prepared.has(column):
				prepared[column] = true
				world.prepare_player_column(
					Vector3(position) + Vector3(0.5, 1.0, 0.5))

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
	for npc_id in HamletState.get_npc_ids():
		var saved: Array = HamletState.get_npc_record(
			npc_id).get("position", [])
		if saved.size() == 3:
			world.prepare_player_column(Vector3(
				float(saved[0]), float(saved[1]), float(saved[2])))
	var runtime: HamletRuntime = load(
		"res://scripts/world/hamlet_runtime.gd").new()
	add_child(runtime)
	runtime.configure(world, dummy_player)
	_check(runtime._actors.has(BUILDER_ID),
		"builder actor was not promoted for generic construction")

	for stage_index in range(1, HamletState.PROJECT_STAGES.size() + 1):
		_supply_stage(stage_index)
		_build_stage(stage_index, runtime, world, anchor)
	_check(bool(HamletState.project.get("complete", false)),
		"cottage did not activate after all data-defined stages")
	var cottage_instance_id := "building_instance.probe.small_cottage"
	var cottage: Dictionary = HamletState.runtime_buildings.get(
		cottage_instance_id, {})
	_check(str(cottage.get("definition_id", ""))
			== "building.residential.small_cottage"
			and bool(cottage.get("active", false)),
		"cottage activation did not create a building runtime record")
	var completed_statuses := HamletState.request_status_counts()
	_check(int(completed_statuses.get(HamletState.REQUEST_COMPLETED, 0))
			>= HamletState.PROJECT_STAGES.size(),
		"completed project requests did not move into board history")

	var damage := HamletState.apply_building_damage(
		cottage_instance_id, 0.25, "probe.weather")
	var repair := HamletState.repair_building(cottage_instance_id, 0.25)
	_check(is_equal_approx(float(damage.get("condition", 0.0)), 0.75)
			and is_equal_approx(float(repair.get("condition", 0.0)), 1.0),
		"generic building damage and repair did not preserve condition")
	var needs := HamletState.aggregate_settlement_needs({"housing": 1.0})
	_check(str(needs.get("housing", {}).get("state", "")) in [
			"stable", "thriving"],
		"active cottage did not contribute through the seven-needs aggregator")
	_verify_primitive_hut_shell(runtime, world, site)

	var saved_state := HamletState.serialize_state()
	HamletState.runtime_buildings.clear()
	_check(HamletState.restore_state(saved_state, 20420)
			and HamletState.runtime_buildings.has(cottage_instance_id),
		"cottage runtime record did not survive save and load")

	var cancel_site := site + Vector2i(9, 0)
	var cancel_id := "project_instance.probe.cancelled_cottage"
	_check(bool(HamletState.create_project_instance(
		"project.build.small_cottage",
		cancel_id,
		[cancel_site.x, cancel_site.y]).get("ok", false))
			and HamletState.activate_project_instance(cancel_id),
		"second generic project could not enter the construction pipeline")
	_supply_stage(1)
	var cancel_result := HamletState.cancel_project_instance(cancel_id)
	var foundation := HamletState.get_project_stage_definition(1)
	var stone_ref: Dictionary = (
		foundation.get("requirements", []) as Array)[0]
	_check(bool(cancel_result.get("ok", false))
			and HamletState.warehouse_count_ref(stone_ref)
				== int(stone_ref.get("count", 0)),
		"project cancellation did not return every reserved resource")
	_check(int(HamletState.request_status_counts().get(
		HamletState.REQUEST_FAILED, 0)) > 0,
		"cancelled project requests did not enter the failed board category")

	var payload := {
		"checks": checks,
		"failures": failures,
		"ok": failures.is_empty(),
	}
	print("SETTLEMENT_PROJECT_PROBE %s" % JSON.stringify(payload))
	get_tree().quit(0 if failures.is_empty() else 1)
