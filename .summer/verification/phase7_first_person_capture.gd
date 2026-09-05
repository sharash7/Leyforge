extends Node
## Captures the real main-scene first-person arm and selected held model.

const SitePreviewScript = preload(
	"res://scripts/world/settlement_site_preview.gd")

const OUTPUT_PATH := "res://.summer/verification/phase7_first_person_capture.png"
const BLOCK_OUTPUT_PATH := \
	"res://.summer/verification/phase7_first_person_block_capture.png"
const SITE_OUTPUT_PATH := \
	"res://.summer/verification/phase7_site_preview_capture.png"
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
	var held_block := Inventory.make_stack_from_ref({
		"kind": "block",
		"stable_id": "construction.planks.oak",
		"count": 1,
	})
	Inventory.set_group_slot("hotbar", 0, held_block, true)
	Inventory.select_slot(0)
	for _frame in 4:
		await get_tree().process_frame
	var block_image := get_viewport().get_texture().get_image()
	var block_error := block_image.save_png(BLOCK_OUTPUT_PATH)
	print("PHASE7_FIRST_PERSON_BLOCK_CAPTURE path=%s error=%d" % [
		BLOCK_OUTPUT_PATH, block_error])
	var forward := -player.global_transform.basis.z.normalized()
	var preview_x := floori(player.global_position.x + forward.x * 4.0)
	var preview_z := floori(player.global_position.z + forward.z * 4.0)
	var preview_y := player.world.surface_height_at(preview_x, preview_z)
	var preview: SettlementSitePreview = SitePreviewScript.new()
	main.add_child(preview)
	preview.apply_survey({
		"record_type": "SiteSurvey",
		"plan_hash": "capture.site.preview",
		"footprint_cells": [
			[preview_x - 1, preview_y, preview_z],
			[preview_x, preview_y, preview_z],
			[preview_x + 1, preview_y, preview_z],
		],
		"cut_cells": [[preview_x - 1, preview_y, preview_z]],
		"fill_cells": [[preview_x + 1, preview_y + 1, preview_z]],
		"vegetation_removal": [],
		"clearance_cells": [],
		"route_plan": {
			"cells": [[preview_x, preview_y, preview_z - 1]],
		},
	})
	for _frame in 4:
		await get_tree().process_frame
	var site_image := get_viewport().get_texture().get_image()
	var site_error := site_image.save_png(SITE_OUTPUT_PATH)
	print("PHASE7_SITE_PREVIEW_CAPTURE path=%s error=%d" % [
		SITE_OUTPUT_PATH, site_error])
	preview.queue_free()
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
	forward = -player.global_transform.basis.z.normalized()
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
		0 if error == OK and block_error == OK and site_error == OK \
			and skill_error == OK and rig_error == OK else 1)
