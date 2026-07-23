extends Node

var failures: Array[String] = []
@onready var main: Node3D = $Main


func _ready() -> void:
	call_deferred("_run")


func _check(condition: bool, message: String) -> void:
	if not condition:
		failures.append(message)


func _run() -> void:
	var world: VoxelWorld = main.get_node("VoxelWorld")
	var player: Player = main.get_node("Player")
	var spawn := world.find_spawn()
	var column_x := world.chunk_coord(floori(spawn.x))
	var column_z := world.chunk_coord(floori(spawn.z))
	var center := Vector3i(
		column_x * VoxelWorld.CHUNK_SIZE + 8,
		24,
		column_z * VoxelWorld.CHUNK_SIZE + 8)
	world.prepare_player_column(Vector3(center) + Vector3(0.5, 2.0, 0.5))
	_build_platform(world, center)

	var slab_id := BlockRegistry.get_id_by_stable_id("construction.slab.oak")
	world.set_block_global(Vector3i(center.x, center.y + 1, center.z), slab_id)
	_rebuild_test_chunk(world, center)
	var slab_start := Vector3(center.x + 0.5, center.y + 1.05, center.z + 2.4)
	var slab_result := await _walk_test(player, slab_start, 0.0, true)
	_check(bool(slab_result["crossed"]), "player did not cross the half-slab")
	_check(float(slab_result["max_y"]) >= slab_start.y + 0.30,
		"player never stepped up onto the half-slab")

	var stair_id := BlockRegistry.get_id_by_stable_id("construction.stair.oak")
	world.set_block_global(Vector3i(center.x, center.y + 1, center.z), stair_id)
	_rebuild_test_chunk(world, center)
	var stair_start := Vector3(center.x + 0.5, center.y + 1.05, center.z - 2.4)
	var stair_result := await _walk_test(player, stair_start, PI, false)
	_check(bool(stair_result["crossed"]), "player did not cross the stair from its low side")
	_check(float(stair_result["max_y"]) >= stair_start.y + 0.30,
		"player never climbed the stair collision")

	Input.action_release("move_forward")
	var result := {
		"ok": failures.is_empty(),
		"checks": 4,
		"slab": slab_result,
		"stair": stair_result,
		"failures": failures,
	}
	print("PHASE3_TRAVERSAL_PROBE ", JSON.stringify(result))
	get_tree().quit(0 if failures.is_empty() else 1)


func _build_platform(world: VoxelWorld, center: Vector3i) -> void:
	var stone_id := BlockRegistry.get_id_by_stable_id("terrain.stone.basic")
	for dx in range(-3, 4):
		for dz in range(-4, 5):
			world.set_block_global(
				Vector3i(center.x + dx, center.y, center.z + dz), stone_id)
			for dy in range(1, 5):
				world.set_block_global(
					Vector3i(center.x + dx, center.y + dy, center.z + dz),
					BlockRegistry.AIR)
	_rebuild_test_chunk(world, center)


func _rebuild_test_chunk(world: VoxelWorld, center: Vector3i) -> void:
	var cc := Vector3i(
		world.chunk_coord(center.x),
		world.chunk_coord(center.y),
		world.chunk_coord(center.z))
	if world.chunks.has(cc):
		world.chunks[cc].rebuild()


func _walk_test(player: Player, start: Vector3, yaw: float, moves_negative_z: bool) -> Dictionary:
	player.global_position = start
	player.velocity = Vector3.ZERO
	player.rotation.y = yaw
	player._yaw = yaw
	player.head.rotation.x = 0.0
	for _i in 8:
		await get_tree().physics_frame
	var max_y := player.global_position.y
	Input.action_press("move_forward")
	for _i in 55:
		await get_tree().physics_frame
		max_y = maxf(max_y, player.global_position.y)
	Input.action_release("move_forward")
	var crossed := player.global_position.z < start.z - 2.8 \
		if moves_negative_z else player.global_position.z > start.z + 2.8
	return {
		"crossed": crossed,
		"max_y": max_y,
		"final": [
			player.global_position.x,
			player.global_position.y,
			player.global_position.z,
		],
	}
