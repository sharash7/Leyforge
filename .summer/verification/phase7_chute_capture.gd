extends Node
## Real-renderer proof for corner and multi-input chute mesh alignment.

const OUTPUT_PATH := "res://.summer/verification/phase7_chute_capture.png"


func _ready() -> void:
	call_deferred("_capture")


func _capture() -> void:
	var main: Node3D = $Main
	var world: VoxelWorld = main.get_node("VoxelWorld")
	var player: Player = main.get_node("Player")
	var hud: CanvasLayer = main.get_node("HUD")
	var origin := Vector3i(
		floori(player.global_position.x),
		world.surface_height_at(
			floori(player.global_position.x),
			floori(player.global_position.z)) + 1,
		floori(player.global_position.z))
	world.prepare_player_column(Vector3(origin))
	world.prepare_player_column(Vector3(origin + Vector3i(0, 0, -4)))
	var floor_id := BlockRegistry.get_id_by_stable_id("construction.planks.oak")
	for dx in range(-7, 8):
		for dz in range(-7, 2):
			world.set_block_global(
				origin + Vector3i(dx, -1, dz), floor_id)
			world.set_block_global(
				origin + Vector3i(dx, 0, dz), BlockRegistry.AIR)
			world.set_block_global(
				origin + Vector3i(dx, 1, dz), BlockRegistry.AIR)
	var chute_id := BlockRegistry.get_id_by_stable_id(
		"automation.transport.chute")
	var chute_positions: Array[Vector3i] = [
		# Left: a true north/east corner.
		origin + Vector3i(-4, 0, -4),
		origin + Vector3i(-4, 0, -5),
		origin + Vector3i(-3, 0, -4),
		# Centre: a north/east/south T with a closed west wall.
		origin + Vector3i(0, 0, -4),
		origin + Vector3i(0, 0, -5),
		origin + Vector3i(1, 0, -4),
		origin + Vector3i(0, 0, -3),
		# Right: a north/east/south/west junction.
		origin + Vector3i(4, 0, -4),
		origin + Vector3i(4, 0, -5),
		origin + Vector3i(5, 0, -4),
		origin + Vector3i(4, 0, -3),
		origin + Vector3i(3, 0, -4),
	]
	var placed_count := 0
	for position in chute_positions:
		if world.set_block_global(position, chute_id):
			placed_count += 1
		world.set_block_orientation(position, 0)
	print("PHASE7_CHUTE_CELLS placed=%d requested=%d" % [
		placed_count, chute_positions.size()])
	player.visible = false
	player.camera.current = false
	var camera := Camera3D.new()
	add_child(camera)
	camera.global_position = Vector3(origin) + Vector3(0.5, 6.0, 4.0)
	camera.look_at(
		Vector3(origin) + Vector3(0.5, 0.15, -4.0), Vector3.UP)
	camera.current = true
	hud.visible = false
	player.highlight.visible = false
	for _frame in 90:
		await get_tree().process_frame
	var image := get_viewport().get_texture().get_image()
	var error := image.save_png(OUTPUT_PATH)
	print("PHASE7_CHUTE_CAPTURE path=%s error=%d" % [OUTPUT_PATH, error])
	get_tree().quit(0 if error == OK else 1)
