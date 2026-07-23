class_name InventorySlotButton
extends Button
## Small reusable drag/drop endpoint. HUD owns the authoritative transfer rules;
## this control only carries source/destination coordinates.

var slot_group := ""
var slot_index := -1
var hud: Node


func setup(owner_hud: Node, group: String, index: int) -> void:
	hud = owner_hud
	slot_group = group
	slot_index = index


func _get_drag_data(_at_position: Vector2) -> Variant:
	if hud == null:
		return null
	var stack: Dictionary = hud.get_drag_stack(slot_group, slot_index)
	if stack.is_empty():
		return null
	var preview := Label.new()
	preview.text = "%s ×%d" % [Inventory.stack_name(stack), int(stack.get("count", 1))]
	preview.add_theme_color_override("font_color", Color.WHITE)
	preview.add_theme_color_override("font_shadow_color", Color.BLACK)
	preview.add_theme_constant_override("shadow_offset_x", 1)
	preview.add_theme_constant_override("shadow_offset_y", 1)
	set_drag_preview(preview)
	return {
		"group": slot_group,
		"index": slot_index,
	}


func _can_drop_data(_at_position: Vector2, data: Variant) -> bool:
	return hud != null and data is Dictionary \
		and hud.can_drop_stack(str(data.get("group", "")), int(data.get("index", -1)),
			slot_group, slot_index)


func _drop_data(_at_position: Vector2, data: Variant) -> void:
	if hud != null and data is Dictionary:
		hud.handle_drop_stack(
			str(data.get("group", "")), int(data.get("index", -1)),
			slot_group, slot_index)
