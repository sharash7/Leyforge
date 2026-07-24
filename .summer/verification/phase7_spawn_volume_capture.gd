extends Node
## Real-renderer reference for the camp-owned goblin spawner and raid force.

const OUTPUT_PATH := \
	"res://.summer/verification/phase7_spawn_volume_capture.png"


func _ready() -> void:
	call_deferred("_capture")


func _capture() -> void:
	var main: Node3D = $Main
	var world: VoxelWorld = main.get_node("VoxelWorld")
	var player: Player = main.get_node("Player")
	var raid_runtime: RaidRuntime = main.get_node("RaidRuntime")
	CombatState.reset_raid()
	var begun := raid_runtime.begin_raid()
	if not bool(begun.get("ok", false)):
		push_error("Spawn-volume capture could not begin raid: %s" % begun)
		get_tree().quit(1)
		return
	CombatState.advance(CombatState.RAID_WARNING_SECONDS + 0.1)
	raid_runtime._refresh_phase()
	raid_runtime._refresh_actors()
	var volume := raid_runtime.get_camp_spawn_volume_definition()
	var center_value: Array = volume.get("center", [])
	if center_value.size() < 3:
		push_error("Spawn-volume capture has no camp volume")
		get_tree().quit(1)
		return
	var center := Vector3(
		float(center_value[0]), float(center_value[1]), float(center_value[2]))
	var player_x := floori(center.x + 13.0)
	var player_z := floori(center.z + 13.0)
	player.global_position = Vector3(
		float(player_x) + 0.5,
		float(world.surface_height_at(player_x, player_z)) + 1.2,
		float(player_z) + 0.5)
	world.prepare_player_column(player.global_position)
	world.prepare_player_column(center)
	player.camera.current = false
	main.get_node("HUD").visible = false
	var observer := Camera3D.new()
	observer.cull_mask = 3
	add_child(observer)
	observer.global_position = center + Vector3(10.5, 6.5, 11.5)
	observer.look_at(center + Vector3(0.0, 0.3, 0.0))
	observer.current = true
	for _frame in 90:
		await get_tree().process_frame
	var positions_inside := true
	for enemy_id in CombatState.get_enemy_ids():
		var record := CombatState.get_enemy_record(enemy_id)
		var saved: Array = record.get("spawn_position", [])
		if saved.size() < 3:
			positions_inside = false
			continue
		positions_inside = positions_inside and bool(
			raid_runtime._camp_spawn_volume.call(
				"contains_world_xz",
				Vector3(float(saved[0]), float(saved[1]), float(saved[2]))))
	var image := get_viewport().get_texture().get_image()
	var error := image.save_png(OUTPUT_PATH)
	print("PHASE7_SPAWN_VOLUME_CAPTURE path=%s error=%d actors=%d inside=%s volume=%s" % [
		OUTPUT_PATH, error, raid_runtime.active_actor_count(),
		positions_inside, volume.get("id", "")])
	get_tree().quit(
		0 if error == OK and positions_inside
			and raid_runtime.active_actor_count() == 4 else 1)
