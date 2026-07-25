extends Node
## Captures the real Stage 8 guide, map, and accessibility screens.

const GUIDE_PATH := "res://.summer/verification/phase8_guide_capture.png"
const MAP_PATH := "res://.summer/verification/phase8_map_capture.png"
const SETTINGS_PATH := "res://.summer/verification/phase8_settings_capture.png"


func _ready() -> void:
	call_deferred("_capture")


func _capture() -> void:
	var main: Node3D = $Main
	var hud: Hud = main.get_node("HUD")
	var world: VoxelWorld = main.get_node("VoxelWorld")
	var player: Player = main.get_node("Player")
	UIState.set_setting("ui_scale", 1.0)
	UIState.set_setting("hud_preset", "standard")
	UIState.set_setting("tutorial_mode", "guided")
	for anchor_id in UIState.MAP_ANCHORS:
		UIState.discover_anchor(anchor_id)
	UIState.set_custom_pin(Vector2(world.valley_plan.get_anchor("base_site")))

	hud._open_mode("guide", Vector3i.ZERO)
	hud._refresh_all()
	for _frame in 8:
		await get_tree().process_frame
	var guide_error := get_viewport().get_texture().get_image().save_png(GUIDE_PATH)

	hud._open_mode("map", Vector3i.ZERO)
	hud._refresh_all()
	hud._refresh_map()
	for _frame in 4:
		await get_tree().process_frame
	var map_error := get_viewport().get_texture().get_image().save_png(MAP_PATH)

	hud._open_mode("settings", Vector3i.ZERO)
	hud._refresh_all()
	for _frame in 4:
		await get_tree().process_frame
	var settings_error := get_viewport().get_texture().get_image().save_png(
		SETTINGS_PATH)
	print("PHASE8_UI_CAPTURE guide=%d map=%d settings=%d player=%s" % [
		guide_error, map_error, settings_error, player.global_position])
	get_tree().quit(
		0 if guide_error == OK and map_error == OK and settings_error == OK else 1)
