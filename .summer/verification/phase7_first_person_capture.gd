extends Node
## Captures the real main-scene first-person arm and selected held model.

const OUTPUT_PATH := "res://.summer/verification/phase7_first_person_capture.png"


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
	player.restore_view(0.25, -0.10)
	for _frame in 90:
		await get_tree().process_frame
	var image := get_viewport().get_texture().get_image()
	var error := image.save_png(OUTPUT_PATH)
	print("PHASE7_FIRST_PERSON_CAPTURE path=%s error=%d" % [OUTPUT_PATH, error])
	get_tree().quit(0 if error == OK else 1)
