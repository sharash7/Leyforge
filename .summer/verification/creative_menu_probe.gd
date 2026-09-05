extends Node

var failures: Array[String] = []
@onready var main: Node3D = $Main


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


func _expected_catalogue_entries() -> int:
	var total := 0
	for block_id in BlockRegistry.get_all_ids():
		if int(block_id) > BlockRegistry.AIR \
				and not BlockRegistry.get_stable_id(int(block_id)).is_empty():
			total += 1
	for item_id in ItemRegistry.get_all_ids():
		if not ItemRegistry.get_stable_id(int(item_id)).is_empty():
			total += 1
	return total


func _run() -> void:
	var hud: Hud = main.get_node("HUD")
	_check(InputMap.has_action("toggle_creative"), "creative input action is missing")
	var expected_entries := _expected_catalogue_entries()
	_check(
		hud._creative_entries.size() == expected_entries,
		"creative catalogue omitted registered content")
	hud._open_mode("creative", Vector3i.ZERO)
	hud._refresh_all()
	_check(
		hud._creative_area.visible and hud._creative_list.item_count == expected_entries,
		"creative catalogue did not open or populate")
	_check(
		bool((hud._nav_buttons.get("inventory") as Button).button_pressed)
			and not bool((hud._nav_buttons.get("guide") as Button).button_pressed),
		"navigation selection remained on Guide instead of the visible page")

	hud._rebuild_creative_list("stone pickaxe")
	_check(hud._creative_list.item_count >= 1, "creative search did not find Stone Pickaxe")
	hud._rebuild_creative_list("")

	_clear_inventory()
	var plank_entry := {
		"kind": "block",
		"stable_id": "construction.planks.oak",
		"name": "Oak Planks",
	}
	var granted_planks := hud._grant_creative_content(plank_entry, 130)
	var plank_ref := {
		"kind": "block",
		"stable_id": "construction.planks.oak",
		"count": 130,
	}
	_check(
		granted_planks == 130 and Inventory.count_ref(plank_ref) == 130,
		"creative grant did not span multiple conserved stacks")
	hud._refresh_all()
	_check(hud._hotbar_buttons[0].icon != null, "inventory slot did not receive a 3D thumbnail")
	_check(
		hud.can_drop_stack("hotbar", 0, "trash", 0),
		"creative trash did not accept an inventory drag")
	var deleted_count := int(Inventory.hotbar[0].get("count", 0))
	hud.handle_drop_stack("hotbar", 0, "trash", 0)
	_check(
		Inventory.hotbar[0].is_empty() and Inventory.count_ref(plank_ref) == 130 - deleted_count,
		"creative trash did not delete exactly the dropped stack")

	_clear_inventory()
	var tool_entry := {
		"kind": "item",
		"stable_id": "item.tool.stone_pickaxe",
		"name": "Stone Pickaxe",
	}
	var granted_tools := hud._grant_creative_content(tool_entry, 3)
	var tool_ref := {
		"kind": "item",
		"stable_id": "item.tool.stone_pickaxe",
		"count": 3,
	}
	_check(
		granted_tools == 3 and Inventory.count_ref(tool_ref) == 3,
		"creative grant did not create separate durable tool instances")

	_clear_inventory()
	Inventory.set_crafting_station("workbench")
	Inventory.set_craft_slot(0, Inventory.make_stack_from_ref({
		"kind": "block",
		"stable_id": "construction.planks.oak",
		"count": 1,
	}))
	_check(
		Inventory.active_craft_recipe_id == "recipe.hand.bootstrap.stick",
		"3x3 workbench did not inherit the 2x2 stick recipe")
	var sticks := Inventory.take_craft_output()
	_check(
		Inventory.stack_stable_id(sticks) == "item.resource.stick"
			and int(sticks.get("count", 0)) == 2,
		"3x3 inherited stick recipe produced the wrong result")

	hud._open_mode("village", Vector3i.ZERO)
	hud._refresh_all()
	_check(
		(hud._nav_buttons.get("village") as Button).button_pressed
			and not (hud._nav_buttons.get("guide") as Button).button_pressed,
		"Village page did not own the selected navigation state")
	_check(
		"CURRENT SETTLEMENT PROJECT" in hud._village_project.text
			and "WATCHTOWER PROJECT" not in hud._village_project.text,
		"village overview retained the hard-coded Watchtower Project heading")
	_check(
		hud._hud_hint_label.text.length() < 100,
		"compact HUD bindings still overflow the bottom screen width")

	hud._set_craft_open(false)
	var result := {
		"ok": failures.is_empty(),
		"checks": 15,
		"catalogue_entries": expected_entries,
		"failures": failures,
	}
	print("CREATIVE_MENU_PROBE ", JSON.stringify(result))
	get_tree().quit(0 if failures.is_empty() else 1)
