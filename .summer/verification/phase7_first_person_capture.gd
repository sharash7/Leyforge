extends Node
## Captures the real main-scene first-person arm and selected held model.

const OUTPUT_PATH := "res://.summer/verification/phase7_first_person_capture.png"
const SKILL_OUTPUT_PATH := "res://.summer/verification/phase7_skill_bar_capture.png"
const PLAYER_RIG_OUTPUT_PATH := \
	"res://.summer/verification/phase7_player_rig_capture.png"


func _ready() -> void:
	call_deferred("_capture")


func _capture() -> void:
	var main: Node3D = $Main
	var player: Player = main.get_node("Player")
	var pickaxe := Inventory.make_stack_from_ref({
		"kind": "item",
		"stable_id": "item.tool.stone_pickaxe",
		"count": 1,
	})
	Inventory.set_group_slot("hotbar", 0, pickaxe, true)
	Inventory.select_slot(0)
	# Look down enough to prove the shared connected torso, shoulders, arms,
	# legs, and selected item are visible while the owner's head stays culled.
	player.restore_view(0.25, -0.88)
	for _frame in 90:
		await get_tree().process_frame
	var owner_rig: Node3D = player._world_humanoid
	var held_model: Node3D = owner_rig._held_model
	print("PHASE7_FIRST_PERSON_RIG head=%s camera=%s pivot_offset=%s view_hand=%s held=%s screen=%s" % [
		owner_rig.head_anchor.global_position,
		player.camera.global_position,
		player.head.position,
		owner_rig.held_anchor.global_position,
		held_model.global_position if held_model != null else Vector3.ZERO,
		player.camera.unproject_position(held_model.global_position)
			if held_model != null else Vector2.ZERO,
	])
	player.ray.force_raycast_update()
	if player.ray.is_colliding():
		var point := player.ray.get_collision_point()
		var normal := player.ray.get_collision_normal()
		var gp := Vector3i((point - normal * 0.5).floor())
		print("PHASE7_FIRST_PERSON_TARGET gp=%s block=%s through_water=%s highlight=%s" % [
			gp,
			BlockRegistry.get_stable_id(player.world.get_block_global(gp)),
			player._ray_passes_through_water(point),
			player.highlight.visible,
		])
	var image := get_viewport().get_texture().get_image()
	var error := image.save_png(OUTPUT_PATH)
	print("PHASE7_FIRST_PERSON_CAPTURE path=%s error=%d" % [OUTPUT_PATH, error])
	MagicState.unlock_poc_magic("capture")
	MagicState.set_action_bar_active(true)
	MagicState.select_ability_slot(0)
	player.restore_view(0.25, -0.05)
	for _frame in 3:
		await get_tree().process_frame
	var skill_image := get_viewport().get_texture().get_image()
	var skill_error := skill_image.save_png(SKILL_OUTPUT_PATH)
	print("PHASE7_SKILL_BAR_CAPTURE path=%s error=%d" % [
		SKILL_OUTPUT_PATH, skill_error])
	# A temporary observer camera proves that the same first-person rig also
	# owns a complete attached head for future third person.
	MagicState.set_action_bar_active(false)
	player.restore_view(0.25, 0.0)
	player.camera.current = false
	var observer := Camera3D.new()
	add_child(observer)
	# Terrain plus the complete owner rig, including its externally visible head.
	observer.cull_mask = 3
	var side := player.global_transform.basis.x.normalized()
	var forward := -player.global_transform.basis.z.normalized()
	observer.global_position = player.global_position \
		+ forward * 4.0 + side * 2.0 + Vector3(0.0, 2.6, 0.0)
	observer.look_at(player.global_position + Vector3(0.0, 1.0, 0.0))
	observer.current = true
	main.get_node("HUD").visible = false
	for _frame in 3:
		await get_tree().process_frame
	var rig_image := get_viewport().get_texture().get_image()
	var rig_error := rig_image.save_png(PLAYER_RIG_OUTPUT_PATH)
	print("PHASE7_PLAYER_RIG_CAPTURE path=%s error=%d" % [
		PLAYER_RIG_OUTPUT_PATH, rig_error])
	get_tree().quit(
		0 if error == OK and skill_error == OK and rig_error == OK else 1)
