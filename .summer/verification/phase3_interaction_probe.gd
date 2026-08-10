extends Node

var failures: Array[String] = []


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


func _stack(kind: String, stable_id: String, count: int) -> Dictionary:
	return Inventory.make_stack_from_ref({
		"kind": kind,
		"stable_id": stable_id,
		"count": count,
	})


func _run() -> void:
	var inventory_before := Inventory.serialize_state()
	var progression_before := ProgressionState.serialize_state()
	ProgressionState.reset()
	_clear_inventory()

	# Hand grid: one log may be placed anywhere in the active 2x2 area.
	Inventory.set_craft_slot(3, _stack("block", "natural.log.oak", 1))
	_check(Inventory.active_craft_recipe_id == "recipe.hand.bootstrap.rough_oak_plank",
		"hand grid did not match the rough plank recipe")
	var rough_result := Inventory.take_craft_output()
	_check(Inventory.stack_stable_id(rough_result) == "construction.planks.oak"
			and int(rough_result.get("count", 0)) == 2,
		"hand-grid output was not preserved and delivered")
	_check(Inventory.craft_grid[3].is_empty(), "hand-grid ingredient was not consumed")

	# Workbench grid: the Minecraft-style chest ring must reject a filled centre.
	_clear_inventory()
	ProgressionState.discover_station("functional.workbench.basic")
	Inventory.set_crafting_station("workbench")
	var plank := _stack("block", "construction.planks.oak", 1)
	for index in [0, 1, 2, 3, 5, 6, 7, 8]:
		Inventory.set_craft_slot(index, plank)
	_check(Inventory.active_craft_recipe_id == "recipe.workbench.block.chest_wood",
		"workbench chest ring did not match")
	Inventory.set_craft_slot(4, plank)
	_check(Inventory.craft_output.is_empty(), "filled chest centre incorrectly matched")
	Inventory.set_craft_slot(4, {})
	var chest_result := Inventory.take_craft_output()
	_check(Inventory.stack_stable_id(chest_result) == "storage.chest.wood",
		"chest recipe did not create the registered chest block")

	# Shape orientation is meaningful: vertical ingots form rods, horizontal
	# ingots form plates, and coal above a stick forms torches.
	_clear_inventory()
	ProgressionState.discover_station("functional.workbench.basic")
	Inventory.set_crafting_station("workbench")
	var ingot := _stack("item", "item.material.iron_ingot", 1)
	Inventory.set_craft_slot(0, ingot)
	Inventory.set_craft_slot(3, ingot)
	_check(Inventory.active_craft_recipe_id == "recipe.workbench.material.iron_rod",
		"vertical iron pattern did not resolve to rods")
	Inventory.set_craft_slot(3, {})
	Inventory.set_craft_slot(1, ingot)
	_check(Inventory.active_craft_recipe_id == "recipe.workbench.material.iron_plate",
		"horizontal iron pattern did not resolve to plates")
	Inventory.set_craft_slot(0, _stack("item", "item.resource.coal_chunk", 1))
	Inventory.set_craft_slot(1, {})
	Inventory.set_craft_slot(3, _stack("item", "item.resource.stick", 1))
	_check(Inventory.active_craft_recipe_id == "recipe.workbench.block.torch_basic",
		"coal-over-stick torch pattern did not resolve")

	# Drag/drop storage contract: move and merge without duplication.
	_clear_inventory()
	Inventory.set_group_slot("hotbar", 0, _stack("item", "item.resource.stick", 5))
	_check(Inventory.transfer_group_slot("hotbar", 0, "backpack", 4, 3),
		"drag transfer was rejected")
	_check(int(Inventory.hotbar[0].get("count", 0)) == 2
			and int(Inventory.backpack[4].get("count", 0)) == 3,
		"drag transfer did not conserve the stack")

	# Functional-block state: chest stacks and double-slab identity survive save.
	var world: VoxelWorld = load("res://scripts/world/voxel_world.gd").new()
	add_child(world)
	var chest_pos := Vector3i(2, 12, 2)
	var slab_pos := Vector3i(3, 12, 2)
	var chest_slots: Array = []
	chest_slots.resize(27)
	for i in 27:
		chest_slots[i] = {}
	chest_slots[0] = _stack("item", "item.resource.stone_chunk", 7)
	world._chests[world._edit_key(chest_pos)] = chest_slots
	world._double_slabs[world._edit_key(slab_pos)] = true
	var block_entities := world.serialize_block_entities()
	world._chests.clear()
	world._double_slabs.clear()
	world.apply_block_entities(block_entities)
	_check(int(world.get_chest_slot(chest_pos, 0).get("count", 0)) == 7,
		"chest contents did not survive serialization")
	var slab_drop := world.get_custom_drop(slab_pos)
	_check(str(slab_drop.get("stable_id", "")) == "construction.slab.oak"
			and int(slab_drop.get("count", 0)) == 2,
		"double slab did not preserve two slab drops")

	Inventory.restore_state(inventory_before)
	ProgressionState.restore_state(progression_before)
	var result := {
		"ok": failures.is_empty(),
		"checks": 15,
		"failures": failures,
	}
	print("PHASE3_INTERACTION_PROBE ", JSON.stringify(result))
	get_tree().quit(0 if failures.is_empty() else 1)
