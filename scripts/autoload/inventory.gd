extends Node
## Unified Stage 3 inventory.
##
## Stacks retain their namespace (`block` or `item`) and save stable identities.
## Runtime item instances carry durability without changing the registry entry.
## The original 9-slot hotbar and 2x2 craft-grid API remains compatible with
## Stage 1 saves and probes; new systems also use a 27-slot backpack.

signal hotbar_changed
signal storage_changed
signal craft_grid_changed
signal selected_slot_changed(index: int)
signal inventory_changed

const HOTBAR_SIZE := 9
const BACKPACK_SIZE := 27
const CRAFT_SIZE := 9
const MAX_STACK := 64

# Placeable blocks and their carried material-item forms represent the same
# conserved content for crafting, furnace inputs, and village deliveries.
# They remain distinct stack namespaces so placement and item metadata are not
# lost, but matching a recipe/request uses this canonical identity.
const CONTENT_EQUIVALENCES := {
	"block:natural.log.oak": "content.wood.log_oak",
	"item:item.resource.log_oak": "content.wood.log_oak",
	"block:construction.planks.oak": "content.wood.plank_oak",
	"item:item.material.plank_oak": "content.wood.plank_oak",
	"block:construction.beam.oak": "content.wood.beam_oak",
	"item:item.material.beam_oak": "content.wood.beam_oak",
	"block:construction.cobble.stone": "content.stone.cobblestone",
	"item:item.material.cobblestone": "content.stone.cobblestone",
	"block:construction.brick.stone": "content.stone.stone_brick",
	"item:item.material.stone_brick": "content.stone.stone_brick",
	"block:terrain.sand.basic": "content.resource.sand",
	"item:item.resource.sand": "content.resource.sand",
	"block:terrain.clay.basic": "content.resource.clay",
	"item:item.resource.clay_lump": "content.resource.clay",
	"block:ore.coal.basic": "content.resource.coal",
	"item:item.resource.coal_chunk": "content.resource.coal",
	"block:ore.copper.basic": "content.resource.raw_copper",
	"item:item.resource.raw_copper_ore": "content.resource.raw_copper",
	"block:ore.iron.basic": "content.resource.raw_iron",
	"item:item.resource.raw_iron_ore": "content.resource.raw_iron",
}

var hotbar: Array = []
var backpack: Array = []
var craft_grid: Array = []
var craft_output: Dictionary = {}
var crafting_station := "hand"
var active_craft_recipe_id := ""
var _craft_consume: Dictionary = {}
var selected_slot := 0:
	set(value):
		selected_slot = clampi(value, 0, HOTBAR_SIZE - 1)
		selected_slot_changed.emit(selected_slot)

# Kept for the legacy 2x2 panel/save contract.
var _recipes: Array = []


func _ready() -> void:
	hotbar = _empty_slots(HOTBAR_SIZE)
	backpack = _empty_slots(BACKPACK_SIZE)
	craft_grid = _empty_slots(CRAFT_SIZE)
	_register_legacy_recipes()
	# Starter building palette; gathered resources and tools use item stacks.
	add_item(1, 32)
	add_item(2, 32)
	add_item(3, 32)
	add_item(9, 16)


func _empty_slots(size: int) -> Array:
	var slots: Array = []
	slots.resize(size)
	for i in size:
		slots[i] = {}
	return slots


# ---------- Unified stack identity ----------

func stack_kind(stack: Dictionary) -> String:
	return str(stack.get("kind", "block"))


func stack_stable_id(stack: Dictionary) -> String:
	if stack.is_empty():
		return ""
	var id := int(stack.get("id", -1))
	return ItemRegistry.get_stable_id(id) if stack_kind(stack) == "item" \
		else BlockRegistry.get_stable_id(id)


func stack_name(stack: Dictionary) -> String:
	if stack.is_empty():
		return ""
	var id := int(stack.get("id", -1))
	return ItemRegistry.get_item_name(id) if stack_kind(stack) == "item" \
		else BlockRegistry.get_block_name(id)


func stack_color(stack: Dictionary) -> Color:
	if stack.is_empty():
		return Color(0, 0, 0)
	var id := int(stack.get("id", -1))
	return ItemRegistry.get_color(id) if stack_kind(stack) == "item" \
		else BlockRegistry.get_color(id)


func stack_max_count(stack: Dictionary) -> int:
	if stack_kind(stack) == "item":
		return ItemRegistry.get_max_stack(int(stack.get("id", -1)))
	return MAX_STACK


func stack_matches_ref(stack: Dictionary, content_ref: Dictionary) -> bool:
	if stack.is_empty():
		return false
	return _canonical_content_key(
		stack_kind(stack), stack_stable_id(stack)) == _canonical_content_key(
		str(content_ref.get("kind", "item")),
		str(content_ref.get("stable_id", "")))


func _canonical_content_key(kind: String, stable_id: String) -> String:
	var exact := "%s:%s" % [kind, stable_id]
	return str(CONTENT_EQUIVALENCES.get(exact, exact))


func make_stack_from_ref(content_ref: Dictionary) -> Dictionary:
	var kind := str(content_ref.get("kind", "item"))
	var stable_id := str(content_ref.get("stable_id", ""))
	var count := maxi(1, int(content_ref.get("count", 1)))
	if kind == "block":
		var block_id := BlockRegistry.get_id_by_stable_id(stable_id)
		return {"kind": "block", "id": block_id, "count": count} \
			if block_id > BlockRegistry.AIR else {}
	var item_id := ItemRegistry.get_id_by_stable_id(stable_id)
	if item_id < 0:
		return {}
	if ItemRegistry.is_tool(item_id):
		return ItemRegistry.create_instance_stack(item_id)
	return {"kind": "item", "id": item_id, "count": count}


func _normalise_stack(value: Dictionary) -> Dictionary:
	if value.is_empty():
		return {}
	var kind := stack_kind(value)
	var id := int(value.get("id", -1))
	if kind == "item":
		if not ItemRegistry.has_item(id):
			return {}
	else:
		kind = "block"
		if not BlockRegistry.has_block(id):
			return {}
	var out := value.duplicate(true)
	out["kind"] = kind
	out["id"] = id
	out["count"] = clampi(int(value.get("count", 0)), 0, stack_max_count(out))
	if int(out["count"]) <= 0:
		return {}
	if kind == "item" and ItemRegistry.is_tool(id):
		out["count"] = 1
		if not out.has("instance"):
			out = ItemRegistry.create_instance_stack(id)
	return out


func _can_merge(a: Dictionary, b: Dictionary) -> bool:
	return not a.is_empty() and not b.is_empty() \
		and stack_kind(a) == stack_kind(b) \
		and int(a.get("id", -1)) == int(b.get("id", -2)) \
		and not a.has("instance") and not b.has("instance")


# ---------- Unified storage ----------

func add_stack(value: Dictionary) -> Dictionary:
	## Adds a stack across hotbar then backpack. Returns the leftover stack.
	var incoming := _normalise_stack(value)
	if incoming.is_empty():
		return value.duplicate(true)
	var remaining := int(incoming["count"])
	var slot_groups: Array = [hotbar, backpack]
	for slots in slot_groups:
		for i in slots.size():
			if remaining <= 0:
				break
			var current: Dictionary = slots[i]
			if not _can_merge(current, incoming):
				continue
			var move := mini(stack_max_count(current) - int(current["count"]), remaining)
			if move <= 0:
				continue
			current["count"] = int(current["count"]) + move
			slots[i] = current
			remaining -= move
	for slots in slot_groups:
		for i in slots.size():
			if remaining <= 0:
				break
			if not slots[i].is_empty():
				continue
			var placed := incoming.duplicate(true)
			var move := mini(stack_max_count(placed), remaining)
			placed["count"] = move
			slots[i] = placed
			remaining -= move
	_emit_inventory_changed()
	if remaining <= 0:
		return {}
	incoming["count"] = remaining
	return incoming


func capacity_for_stack(value: Dictionary) -> int:
	var incoming := _normalise_stack(value)
	if incoming.is_empty():
		return 0
	var capacity := 0
	for slots in [hotbar, backpack]:
		for current in slots:
			if current.is_empty():
				capacity += stack_max_count(incoming)
			elif _can_merge(current, incoming):
				capacity += maxi(0, stack_max_count(current) - int(current.get("count", 0)))
	return capacity


func can_add_stack(value: Dictionary) -> bool:
	return capacity_for_stack(value) >= int(value.get("count", 0))


func count_ref(content_ref: Dictionary) -> int:
	var count := 0
	for slots in [hotbar, backpack]:
		for stack in slots:
			if stack_matches_ref(stack, content_ref):
				count += int(stack.get("count", 0))
	return count


func remove_ref(content_ref: Dictionary, count: int) -> bool:
	if count <= 0 or count_ref(content_ref) < count:
		return false
	var remaining := count
	# Backpack is consumed before the visible hotbar where possible.
	for slots in [backpack, hotbar]:
		for i in slots.size():
			if remaining <= 0:
				break
			var stack: Dictionary = slots[i]
			if not stack_matches_ref(stack, content_ref):
				continue
			var move := mini(remaining, int(stack["count"]))
			stack["count"] = int(stack["count"]) - move
			remaining -= move
			slots[i] = {} if int(stack["count"]) <= 0 else stack
	_emit_inventory_changed()
	return remaining == 0


func craft_recipe(recipe_id: String) -> Dictionary:
	## Consumes and delivers as one transaction.
	var recipe := RecipeRegistry.get_recipe(recipe_id)
	if recipe.is_empty() or not ProgressionState.is_recipe_known(recipe_id):
		return {}
	for content_ref in recipe["inputs"]:
		if count_ref(content_ref) < int(content_ref["count"]):
			return {}
	var hotbar_before := hotbar.duplicate(true)
	var backpack_before := backpack.duplicate(true)
	for content_ref in recipe["inputs"]:
		if not remove_ref(content_ref, int(content_ref["count"])):
			hotbar.assign(hotbar_before)
			backpack.assign(backpack_before)
			_emit_inventory_changed()
			return {}
	var result := make_stack_from_ref(recipe["output"])
	var leftover := add_stack(result)
	if not leftover.is_empty():
		hotbar.assign(hotbar_before)
		backpack.assign(backpack_before)
		_emit_inventory_changed()
		return {}
	ProgressionState.record_craft(
		recipe_id, str(recipe["output"]["stable_id"]), int(recipe["output"].get("count", 1)))
	return result


func take_selected_stack(count: int = 1) -> Dictionary:
	var stack: Dictionary = hotbar[selected_slot]
	if stack.is_empty() or count <= 0:
		return {}
	var move := mini(count, int(stack["count"]))
	var taken := stack.duplicate(true)
	taken["count"] = move
	stack["count"] = int(stack["count"]) - move
	hotbar[selected_slot] = {} if int(stack["count"]) <= 0 else stack
	_emit_inventory_changed()
	return taken


func damage_selected_tool(amount: int = 1) -> bool:
	## Returns true when a tool instance absorbed the durability cost.
	var stack: Dictionary = hotbar[selected_slot]
	if stack.is_empty() or stack_kind(stack) != "item" \
			or not ItemRegistry.is_tool(int(stack.get("id", -1))):
		return false
	var instance: Dictionary = stack.get("instance", {}).duplicate()
	instance["durability"] = maxi(0, int(instance.get("durability", 1)) - amount)
	if int(instance["durability"]) <= 0:
		hotbar[selected_slot] = {}
	else:
		stack["instance"] = instance
		hotbar[selected_slot] = stack
	_emit_inventory_changed()
	return true


func swap_backpack_with_selected(backpack_index: int) -> void:
	if backpack_index < 0 or backpack_index >= BACKPACK_SIZE:
		return
	var held: Dictionary = hotbar[selected_slot]
	var stored: Dictionary = backpack[backpack_index]
	if _can_merge(held, stored):
		var move := mini(stack_max_count(held) - int(held["count"]), int(stored["count"]))
		held["count"] = int(held["count"]) + move
		stored["count"] = int(stored["count"]) - move
		hotbar[selected_slot] = held
		backpack[backpack_index] = {} if int(stored["count"]) <= 0 else stored
	else:
		hotbar[selected_slot] = stored
		backpack[backpack_index] = held
	_emit_inventory_changed()


func get_group_slot(group: String, index: int) -> Dictionary:
	if group == "hotbar" and index >= 0 and index < HOTBAR_SIZE:
		return hotbar[index]
	if group == "backpack" and index >= 0 and index < BACKPACK_SIZE:
		return backpack[index]
	if group == "craft" and index >= 0 and index < CRAFT_SIZE:
		return craft_grid[index]
	return {}


func set_group_slot(group: String, index: int, stack: Dictionary, emit := true) -> bool:
	var normal := _normalise_stack(stack)
	if group == "hotbar" and index >= 0 and index < HOTBAR_SIZE:
		hotbar[index] = normal
	elif group == "backpack" and index >= 0 and index < BACKPACK_SIZE:
		backpack[index] = normal
	elif group == "craft" and index >= 0 and index < CRAFT_SIZE \
			and get_active_craft_indices().has(index):
		craft_grid[index] = normal
	else:
		return false
	if emit:
		if group == "craft":
			_update_craft_output()
			craft_grid_changed.emit()
		_emit_inventory_changed()
	return true


func transfer_group_slot(source_group: String, source_index: int,
		destination_group: String, destination_index: int, count: int = -1) -> bool:
	if source_group == destination_group and source_index == destination_index:
		return false
	var source := get_group_slot(source_group, source_index).duplicate(true)
	var destination := get_group_slot(destination_group, destination_index).duplicate(true)
	if source.is_empty():
		return false
	if destination_group == "craft" and not get_active_craft_indices().has(destination_index):
		return false
	var move_count := int(source["count"]) if count < 0 else mini(count, int(source["count"]))
	if destination.is_empty():
		var moved := source.duplicate(true)
		moved["count"] = move_count
		source["count"] = int(source["count"]) - move_count
		destination = moved
	elif _can_merge(destination, source):
		var move := mini(move_count, stack_max_count(destination) - int(destination["count"]))
		if move <= 0:
			return false
		destination["count"] = int(destination["count"]) + move
		source["count"] = int(source["count"]) - move
	elif move_count == int(source["count"]):
		var swap := destination
		destination = source
		source = swap
	else:
		return false
	if not set_group_slot(source_group, source_index,
			{} if int(source.get("count", 0)) <= 0 else source, false):
		return false
	if not set_group_slot(destination_group, destination_index, destination, false):
		# Both endpoints were already validated, so this is defensive only.
		return false
	_update_craft_output()
	_emit_inventory_changed()
	craft_grid_changed.emit()
	return true


func _emit_inventory_changed() -> void:
	hotbar_changed.emit()
	storage_changed.emit()
	inventory_changed.emit()


# ---------- Stage 1 compatibility hotbar ----------

func add_item(id: int, count: int = 1) -> int:
	## Legacy block-only hotbar insertion.
	if count <= 0:
		return 0
	if not BlockRegistry.has_block(id):
		return count
	var remaining := count
	for i in HOTBAR_SIZE:
		var stack: Dictionary = hotbar[i]
		if remaining > 0 and stack_kind(stack) == "block" \
				and int(stack.get("id", -1)) == id and int(stack.get("count", 0)) < MAX_STACK:
			var move := mini(MAX_STACK - int(stack["count"]), remaining)
			stack["count"] = int(stack["count"]) + move
			hotbar[i] = stack
			remaining -= move
	for i in HOTBAR_SIZE:
		if remaining <= 0:
			break
		if hotbar[i].is_empty():
			var move := mini(MAX_STACK, remaining)
			hotbar[i] = {"kind": "block", "id": id, "count": move}
			remaining -= move
	_emit_inventory_changed()
	return remaining


func capacity_for(id: int) -> int:
	if not BlockRegistry.has_block(id):
		return 0
	var capacity := 0
	for stack in hotbar:
		if stack.is_empty():
			capacity += MAX_STACK
		elif stack_kind(stack) == "block" and int(stack.get("id", -1)) == id:
			capacity += maxi(0, MAX_STACK - int(stack.get("count", 0)))
	return capacity


func can_add_item(id: int, count: int = 1) -> bool:
	return count >= 0 and capacity_for(id) >= count


func take_selected(count: int = 1) -> int:
	var stack: Dictionary = hotbar[selected_slot]
	if stack.is_empty() or stack_kind(stack) != "block":
		return -1
	var id := int(stack["id"])
	take_selected_stack(count)
	return id


func get_selected_stack() -> Dictionary:
	return hotbar[selected_slot]


func select_slot(index: int) -> void:
	selected_slot = index


func cycle_slot(dir: int) -> void:
	selected_slot = (selected_slot + dir + HOTBAR_SIZE) % HOTBAR_SIZE


# ---------- Minecraft-style grid crafting ----------

func _register_legacy_recipes() -> void:
	var oak_log := BlockRegistry.get_id_by_stable_id("natural.log.oak")
	var planks := BlockRegistry.get_id_by_stable_id("construction.planks.oak")
	var workbench := BlockRegistry.get_id_by_stable_id("functional.workbench.basic")
	_add_legacy_recipe([oak_log], planks, 4)
	_add_legacy_recipe([planks, planks, planks, planks], workbench, 1)


func _add_legacy_recipe(ingredients: Array, out_id: int, out_count: int) -> void:
	var grid := PackedInt32Array([0, 0, 0, 0])
	for i in mini(ingredients.size(), 4):
		grid[i] = int(ingredients[i])
	_recipes.append({"ingredients": grid, "out_id": out_id, "out_count": out_count})


func set_craft_slot(index: int, stack: Dictionary) -> void:
	if index < 0 or index >= CRAFT_SIZE:
		return
	craft_grid[index] = _normalise_stack(stack)
	_update_craft_output()
	craft_grid_changed.emit()


func set_crafting_station(station: String) -> void:
	crafting_station = station if station in ["workbench", "rune_table"] else "hand"
	# A 2x2 hand grid uses the top-left cells of the persistent 3x3 storage.
	# Return inaccessible workbench-only cells before shrinking the view.
	if crafting_station == "hand":
		for index in [2, 5, 6, 7, 8]:
			if not craft_grid[index].is_empty():
				var leftover := add_stack(craft_grid[index])
				craft_grid[index] = leftover
	_update_craft_output()
	craft_grid_changed.emit()


func get_active_craft_indices() -> Array[int]:
	var indices: Array[int] = [0, 1, 3, 4]
	if crafting_station in ["workbench", "rune_table"]:
		indices = [0, 1, 2, 3, 4, 5, 6, 7, 8]
	return indices


func get_craft_slot(index: int) -> Dictionary:
	return craft_grid[index]


func _update_craft_output() -> void:
	active_craft_recipe_id = ""
	_craft_consume.clear()
	var grid_size := 2 if crafting_station == "hand" else 3
	var recipe := RecipeRegistry.match_crafting_grid(craft_grid, grid_size, crafting_station)
	if not recipe.is_empty():
		active_craft_recipe_id = str(recipe["id"])
		_craft_consume = recipe["consume"].duplicate()
		craft_output = make_stack_from_ref(recipe["output"])
		return
	craft_output = _match_legacy_recipe()


func _match_legacy_recipe() -> Dictionary:
	var present: Array[int] = []
	for slot in craft_grid:
		if not slot.is_empty() and stack_kind(slot) == "block":
			present.append(int(slot["id"]))
	present.sort()
	for recipe in _recipes:
		var need: Array[int] = []
		for ingredient in recipe["ingredients"]:
			if ingredient != 0:
				need.append(int(ingredient))
		need.sort()
		if need == present:
			return {"kind": "block", "id": recipe["out_id"], "count": recipe["out_count"]}
	return {}


func take_craft_output() -> Dictionary:
	if craft_output.is_empty():
		return {}
	var result := craft_output.duplicate(true)
	var hotbar_before := hotbar.duplicate(true)
	var backpack_before := backpack.duplicate(true)
	var craft_before := craft_grid.duplicate(true)
	if not active_craft_recipe_id.is_empty():
		for index in _craft_consume:
			var slot: Dictionary = craft_grid[int(index)]
			slot["count"] = int(slot["count"]) - int(_craft_consume[index])
			craft_grid[int(index)] = {} if int(slot["count"]) <= 0 else slot
		if not add_stack(result).is_empty():
			hotbar.assign(hotbar_before)
			backpack.assign(backpack_before)
			craft_grid.assign(craft_before)
			_update_craft_output()
			_emit_inventory_changed()
			craft_grid_changed.emit()
			return {}
		var recipe := RecipeRegistry.get_recipe(active_craft_recipe_id)
		ProgressionState.record_craft(
			active_craft_recipe_id,
			str(recipe.get("output", {}).get("stable_id", "")),
			int(recipe.get("output", {}).get("count", 1)))
	else:
		if not can_add_item(int(result["id"]), int(result["count"])):
			return {}
		for i in CRAFT_SIZE:
			var slot: Dictionary = craft_grid[i]
			if slot.is_empty():
				continue
			slot["count"] = int(slot["count"]) - 1
			craft_grid[i] = {} if int(slot["count"]) <= 0 else slot
		if add_item(int(result["id"]), int(result["count"])) != 0:
			hotbar.assign(hotbar_before)
			backpack.assign(backpack_before)
			craft_grid.assign(craft_before)
			_update_craft_output()
			_emit_inventory_changed()
			craft_grid_changed.emit()
			return {}
	_update_craft_output()
	craft_grid_changed.emit()
	return result


func move_hotbar_to_craft(hotbar_index: int, craft_index: int, count: int = 1) -> void:
	if hotbar_index < 0 or hotbar_index >= HOTBAR_SIZE \
			or craft_index < 0 or craft_index >= CRAFT_SIZE:
		return
	var source: Dictionary = hotbar[hotbar_index]
	if source.is_empty() or not get_active_craft_indices().has(craft_index):
		return
	var destination: Dictionary = craft_grid[craft_index]
	if destination.is_empty():
		var move := mini(count, int(source["count"]))
		destination = source.duplicate(true)
		destination["count"] = move
		source["count"] = int(source["count"]) - move
	elif _can_merge(destination, source):
		var move := mini(mini(count, int(source["count"])), MAX_STACK - int(destination["count"]))
		destination["count"] = int(destination["count"]) + move
		source["count"] = int(source["count"]) - move
	else:
		return
	craft_grid[craft_index] = destination
	hotbar[hotbar_index] = {} if int(source["count"]) <= 0 else source
	_update_craft_output()
	_emit_inventory_changed()
	craft_grid_changed.emit()


func return_craft_to_hotbar(craft_index: int) -> void:
	if craft_index < 0 or craft_index >= CRAFT_SIZE:
		return
	var slot: Dictionary = craft_grid[craft_index]
	if slot.is_empty():
		return
	var leftover := add_stack(slot)
	craft_grid[craft_index] = leftover
	_update_craft_output()
	craft_grid_changed.emit()


# ---------- Stable persistence ----------

func serialize_state() -> Dictionary:
	return {
		"hotbar": _serialize_slots(hotbar),
		"backpack": _serialize_slots(backpack),
		"craft_grid": _serialize_slots(craft_grid),
		"crafting_station": crafting_station,
		"selected_slot": selected_slot,
	}


func restore_state(data: Dictionary) -> void:
	hotbar.assign(_deserialize_slots(data.get("hotbar", []), HOTBAR_SIZE))
	backpack.assign(_deserialize_slots(data.get("backpack", []), BACKPACK_SIZE))
	var saved_grid: Variant = data.get("craft_grid", [])
	if saved_grid is Array and saved_grid.size() == 4:
		craft_grid.assign(_empty_slots(CRAFT_SIZE))
		for mapping in [[0, 0], [1, 1], [2, 3], [3, 4]]:
			craft_grid[int(mapping[1])] = deserialize_stack(saved_grid[int(mapping[0])])
	else:
		craft_grid.assign(_deserialize_slots(saved_grid, CRAFT_SIZE))
	var saved_station := str(data.get("crafting_station", "hand"))
	crafting_station = saved_station \
		if saved_station in ["workbench", "rune_table"] else "hand"
	selected_slot = clampi(int(data.get("selected_slot", 0)), 0, HOTBAR_SIZE - 1)
	_update_craft_output()
	_emit_inventory_changed()
	craft_grid_changed.emit()


func serialize_stack(stack: Dictionary) -> Dictionary:
	var normal := _normalise_stack(stack)
	if normal.is_empty():
		return {}
	var out := {"count": int(normal["count"])}
	if stack_kind(normal) == "item":
		out["item_id"] = ItemRegistry.get_stable_id(int(normal["id"]))
		if normal.has("instance"):
			out["instance"] = normal["instance"].duplicate(true)
	else:
		out["block_id"] = BlockRegistry.get_stable_id(int(normal["id"]))
	if str(out.get("item_id", out.get("block_id", ""))).is_empty():
		return {}
	return out


func deserialize_stack(value: Variant) -> Dictionary:
	if not (value is Dictionary) or value.is_empty():
		return {}
	var raw: Dictionary = value
	var stack := {}
	if raw.has("item_id"):
		var item_id := ItemRegistry.resolve_serialized_id(raw["item_id"])
		if item_id >= 0:
			stack = {"kind": "item", "id": item_id, "count": int(raw.get("count", 0))}
			if raw.get("instance", {}) is Dictionary and not raw.get("instance", {}).is_empty():
				stack["instance"] = raw["instance"].duplicate(true)
	else:
		var id_value: Variant = raw.get("block_id", raw.get("id", -1))
		var block_id := BlockRegistry.resolve_serialized_id(id_value)
		if block_id > BlockRegistry.AIR:
			stack = {"kind": "block", "id": block_id, "count": int(raw.get("count", 0))}
	return _normalise_stack(stack)


func _serialize_slots(slots: Array) -> Array:
	var out: Array = []
	for stack in slots:
		out.append(serialize_stack(stack))
	return out


func _deserialize_slots(value: Variant, expected_size: int) -> Array:
	var out := _empty_slots(expected_size)
	if not (value is Array):
		return out
	var source: Array = value
	for i in mini(source.size(), expected_size):
		out[i] = deserialize_stack(source[i])
	return out
