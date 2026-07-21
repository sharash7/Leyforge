extends Node
## Inventory autoload.
## Stage 1 scope: a 9-slot hotbar + a 2x2 crafting grid with output slot.
## Each stack: { "id": int, "count": int }. Empty slot = null (stored as {} internally).

signal hotbar_changed
signal craft_grid_changed
signal selected_slot_changed(index: int)

const HOTBAR_SIZE := 9
const CRAFT_SIZE := 4  # 2x2
const MAX_STACK := 64

var hotbar: Array = []
var craft_grid: Array = []
var craft_output: Dictionary = {}
var selected_slot := 0:
	set(value):
		selected_slot = clampi(value, 0, HOTBAR_SIZE - 1)
		selected_slot_changed.emit(selected_slot)

# Recipes are lists of 4 ingredient block ids (0 = empty) in row-major 2x2 order,
# mapped to an output stack. Keyed by sorted non-zero ids for shapeless matching.
var _recipes: Array = []  # each: { "ingredients": PackedInt32Array(4), "out_id": int, "out_count": int }


func _ready() -> void:
	hotbar.resize(HOTBAR_SIZE)
	craft_grid.resize(CRAFT_SIZE)
	for i in HOTBAR_SIZE:
		hotbar[i] = {}
	for i in CRAFT_SIZE:
		craft_grid[i] = {}
	_register_recipes()
	# Starter kit so block placement is testable immediately.
	add_item(1, 32)   # Grass
	add_item(2, 32)   # Dirt
	add_item(3, 32)   # Stone
	add_item(9, 16)   # Oak Log


func _register_recipes() -> void:
	var oak_log: int = BlockRegistry.get_id_by_name("Oak Log")
	if oak_log < 0:
		oak_log = 9
	var planks: int = BlockRegistry.get_id_by_name("Oak Planks")
	if planks < 0:
		planks = 8  # registry id used for planks in the fallback/design docs
	var workbench: int = BlockRegistry.get_id_by_name("Workbench")
	if workbench < 0:
		workbench = 23

	# 1 log (anywhere) -> 4 planks
	_add_recipe([oak_log], planks, 4)
	# 4 planks filling the 2x2 -> 1 workbench
	_add_recipe([planks, planks, planks, planks], workbench, 1)


func _add_recipe(ingredients: Array, out_id: int, out_count: int) -> void:
	var grid := PackedInt32Array([0, 0, 0, 0])
	for i in mini(ingredients.size(), 4):
		grid[i] = int(ingredients[i])
	_recipes.append({"ingredients": grid, "out_id": out_id, "out_count": out_count})


# ---------- Hotbar ----------

func add_item(id: int, count: int = 1) -> int:
	## Adds up to `count` items; returns how many did NOT fit.
	var remaining := count
	# Top up existing stacks first.
	for i in HOTBAR_SIZE:
		if remaining <= 0:
			break
		var stack: Dictionary = hotbar[i]
		if stack.get("id", -1) == id and stack["count"] < MAX_STACK:
			var move: int = mini(MAX_STACK - stack["count"], remaining)
			stack["count"] += move
			remaining -= move
	# Then fill empty slots.
	for i in HOTBAR_SIZE:
		if remaining <= 0:
			break
		if hotbar[i].is_empty():
			var move: int = mini(MAX_STACK, remaining)
			hotbar[i] = {"id": id, "count": move}
			remaining -= move
	hotbar_changed.emit()
	return remaining


func take_selected(count: int = 1) -> int:
	## Removes up to `count` from the selected slot; returns the block id taken (or -1).
	var stack: Dictionary = hotbar[selected_slot]
	if stack.is_empty():
		return -1
	var id: int = stack["id"]
	stack["count"] -= count
	if stack["count"] <= 0:
		hotbar[selected_slot] = {}
	hotbar_changed.emit()
	return id


func get_selected_stack() -> Dictionary:
	return hotbar[selected_slot]


func select_slot(index: int) -> void:
	selected_slot = index


func cycle_slot(dir: int) -> void:
	selected_slot = (selected_slot + dir + HOTBAR_SIZE) % HOTBAR_SIZE


# ---------- 2x2 Crafting ----------

func set_craft_slot(index: int, stack: Dictionary) -> void:
	craft_grid[index] = stack
	_update_craft_output()
	craft_grid_changed.emit()


func get_craft_slot(index: int) -> Dictionary:
	return craft_grid[index]


func _update_craft_output() -> void:
	craft_output = _match_recipe()


func _match_recipe() -> Dictionary:
	# Shapeless-ish: compare the sorted non-zero ingredient ids.
	var present: Array[int] = []
	for slot in craft_grid:
		if not slot.is_empty():
			present.append(int(slot["id"]))
	present.sort()
	for recipe in _recipes:
		var need: Array[int] = []
		for ing in recipe["ingredients"]:
			if ing != 0:
				need.append(int(ing))
		need.sort()
		if need == present:
			return {"id": recipe["out_id"], "count": recipe["out_count"]}
	return {}


func take_craft_output() -> Dictionary:
	## Consumes one of each crafting ingredient and returns the output stack.
	if craft_output.is_empty():
		return {}
	for i in CRAFT_SIZE:
		var slot: Dictionary = craft_grid[i]
		if slot.is_empty():
			continue
		slot["count"] -= 1
		if slot["count"] <= 0:
			craft_grid[i] = {}
	_update_craft_output()
	craft_grid_changed.emit()
	return craft_output.duplicate()


func move_hotbar_to_craft(hotbar_index: int, craft_index: int, count: int = 1) -> void:
	## Simple one-way move used by the Stage 1 crafting UI (right-click style).
	var src: Dictionary = hotbar[hotbar_index]
	if src.is_empty():
		return
	var dst: Dictionary = craft_grid[craft_index]
	if dst.is_empty():
		var move: int = mini(count, src["count"])
		craft_grid[craft_index] = {"id": src["id"], "count": move}
		src["count"] -= move
	elif dst["id"] == src["id"] and dst["count"] < MAX_STACK:
		var move: int = mini(mini(count, src["count"]), MAX_STACK - dst["count"])
		dst["count"] += move
		src["count"] -= move
	else:
		return
	if src["count"] <= 0:
		hotbar[hotbar_index] = {}
	_update_craft_output()
	hotbar_changed.emit()
	craft_grid_changed.emit()


func return_craft_to_hotbar(craft_index: int) -> void:
	## Sends a crafting slot's contents back to the hotbar.
	var slot: Dictionary = craft_grid[craft_index]
	if slot.is_empty():
		return
	var leftover := add_item(int(slot["id"]), int(slot["count"]))
	if leftover > 0:
		craft_grid[craft_index] = {"id": slot["id"], "count": leftover}
	else:
		craft_grid[craft_index] = {}
	_update_craft_output()
	craft_grid_changed.emit()
