extends Node
## Data-driven Stage 3 recipe catalog. Content is expressed only through stable
## block/item identities so compact runtime ids can change without corrupting
## recipes or saves.

var _recipes: Dictionary = {}
var _ordered_ids: Array[String] = []
var _patterns: Dictionary = {}


func _ready() -> void:
	_register_stage3_recipes()


func _ref(kind: String, stable_id: String, count: int = 1) -> Dictionary:
	return {"kind": kind, "stable_id": stable_id, "count": count}


func _add(id: String, display_name: String, station: String, inputs: Array,
		output: Dictionary, known_start := false, seconds := 0.0) -> void:
	var definition := {
		"id": id,
		"name": display_name,
		"station": station,
		"inputs": inputs,
		"output": output,
		"known_start": known_start,
		"seconds": seconds,
	}
	_recipes[id] = definition
	_ordered_ids.append(id)


func _register_stage3_recipes() -> void:
	# Two deliberate bootstrap recipes fill gaps in the planning table. They
	# have reduced yield so the authored workbench recipes remain preferable.
	_add("recipe.hand.bootstrap.rough_oak_plank", "Rough Oak Planks", "hand", [
		_ref("item", "item.resource.log_oak"),
	], _ref("item", "item.material.plank_oak", 2), true)
	_add("recipe.hand.bootstrap.stick", "Carved Sticks", "hand", [
		_ref("item", "item.material.plank_oak"),
	], _ref("item", "item.resource.stick", 2), true)
	_add("recipe.hand.tool.crude_pickaxe", "Crude Pickaxe", "hand", [
		_ref("item", "item.resource.stick", 2),
		_ref("item", "item.resource.stone_chunk", 2),
		_ref("item", "item.resource.plant_fibre"),
	], _ref("item", "item.tool.crude_pickaxe"), true)
	_add("recipe.hand.tool.crude_axe", "Crude Axe", "hand", [
		_ref("item", "item.resource.stick", 2),
		_ref("item", "item.resource.stone_chunk"),
		_ref("item", "item.resource.plant_fibre"),
	], _ref("item", "item.tool.crude_axe"), true)
	_add("recipe.hand.material.cobblestone", "Cobblestone Bundle", "hand", [
		_ref("item", "item.resource.stone_chunk", 4),
	], _ref("item", "item.material.cobblestone"), true)
	_add("recipe.workbench.block.workbench_basic", "Workbench", "hand", [
		_ref("item", "item.material.plank_oak", 4),
		_ref("item", "item.resource.stick", 2),
	], _ref("block", "functional.workbench.basic"), true)

	_add("recipe.workbench.material.oak_plank", "Oak Planks", "workbench", [
		_ref("item", "item.resource.log_oak"),
	], _ref("item", "item.material.plank_oak", 4))
	_add("recipe.workbench.material.oak_beam", "Oak Beams", "workbench", [
		_ref("item", "item.resource.log_oak", 2),
	], _ref("item", "item.material.beam_oak", 4))
	_add("recipe.workbench.block.oak_slab", "Oak Slabs", "workbench", [
		_ref("item", "item.material.plank_oak", 6),
	], _ref("block", "construction.slab.oak", 6))
	_add("recipe.workbench.block.oak_stair", "Oak Stairs", "workbench", [
		_ref("item", "item.material.plank_oak", 6),
	], _ref("block", "construction.stair.oak", 4))
	_add("recipe.workbench.material.stone_brick", "Stone Bricks", "workbench", [
		_ref("item", "item.resource.stone_chunk", 4),
	], _ref("item", "item.material.stone_brick", 4))
	_add("recipe.workbench.block.fence_oak", "Oak Fence", "workbench", [
		_ref("item", "item.resource.stick", 4),
		_ref("item", "item.material.plank_oak", 2),
	], _ref("block", "construction.fence.oak", 3))
	_add("recipe.workbench.block.chest_wood", "Wooden Chest", "workbench", [
		_ref("item", "item.material.plank_oak", 8),
	], _ref("block", "storage.chest.wood"))
	_add("recipe.workbench.tool.stone_pickaxe", "Stone Pickaxe", "workbench", [
		_ref("item", "item.resource.stone_chunk", 3),
		_ref("item", "item.resource.stick", 2),
		_ref("item", "item.resource.plant_fibre"),
	], _ref("item", "item.tool.stone_pickaxe"))
	_add("recipe.workbench.tool.stone_axe", "Stone Axe", "workbench", [
		_ref("item", "item.resource.stone_chunk", 3),
		_ref("item", "item.resource.stick", 2),
		_ref("item", "item.resource.plant_fibre"),
	], _ref("item", "item.tool.stone_axe"))
	_add("recipe.workbench.block.furnace_stone", "Stone Furnace", "workbench", [
		_ref("item", "item.component.furnace_core_stone"),
		_ref("item", "item.material.cobblestone", 6),
		_ref("item", "item.material.clay_brick", 2),
	], _ref("block", "functional.furnace.stone"))
	# The full design places these behind a hammer/forge. Stage 4 needs the
	# watchtower hardware chain before those specialist stations exist, so the
	# POC workbench exposes slower, material-neutral manual shaping patterns.
	_add("recipe.workbench.material.iron_rod", "Hand-shaped Iron Rods", "workbench", [
		_ref("item", "item.material.iron_ingot", 2),
	], _ref("item", "item.material.iron_rod", 4))
	_add("recipe.workbench.material.iron_plate", "Hand-shaped Iron Plates", "workbench", [
		_ref("item", "item.material.iron_ingot", 2),
	], _ref("item", "item.material.iron_plate", 4))
	_add("recipe.workbench.material.iron_nails", "Iron Nails", "workbench", [
		_ref("item", "item.material.iron_rod"),
	], _ref("item", "item.material.iron_nails", 8))
	_add("recipe.workbench.block.torch_basic", "Torches", "workbench", [
		_ref("item", "item.resource.coal_chunk"),
		_ref("item", "item.resource.stick"),
	], _ref("block", "light.torch.basic", 4))
	# Stage 5 entry automation. Authored hammer recipes use the workbench as a
	# temporary manual-forming fallback until the dedicated forge arrives.
	_add("recipe.workbench.material.copper_wire", "Copper Wire", "workbench", [
		_ref("item", "item.material.copper_ingot"),
	], _ref("item", "item.material.copper_wire", 4))
	_add("recipe.workbench.material.copper_plate", "Hand-shaped Copper Plates", "workbench", [
		_ref("item", "item.material.copper_ingot", 2),
	], _ref("item", "item.material.copper_plate", 4))
	_add("recipe.workbench.component.gear_copper", "Copper Gears", "workbench", [
		_ref("item", "item.material.copper_plate", 2),
		_ref("item", "item.material.copper_wire"),
	], _ref("item", "item.component.gear_copper", 2))
	_add("recipe.workbench.component.machine_frame_wood", "Wooden Machine Frame", "workbench", [
		_ref("item", "item.material.plank_oak", 6),
		_ref("item", "item.material.beam_oak", 2),
		_ref("item", "item.material.copper_wire", 2),
	], _ref("item", "item.component.machine_frame_wood"))
	_add("recipe.workbench.component.machine_frame_copper", "Copper Machine Frame", "workbench", [
		_ref("item", "item.component.machine_frame_wood"),
		_ref("item", "item.material.copper_plate", 4),
		_ref("item", "item.component.gear_copper", 2),
	], _ref("item", "item.component.machine_frame_copper"))
	_add("recipe.workbench.component.machine_core_basic", "Basic Machine Core", "workbench", [
		_ref("item", "item.component.gear_copper", 2),
		_ref("item", "item.material.copper_wire", 4),
		_ref("item", "item.material.iron_rod"),
	], _ref("item", "item.component.machine_core_basic"))
	_add("recipe.workbench.component.chute_segment", "Item Chute Segments", "workbench", [
		_ref("item", "item.material.plank_oak", 4),
		_ref("item", "item.material.copper_plate", 2),
		_ref("item", "item.material.iron_nails", 2),
	], _ref("item", "item.component.chute_segment", 4))
	_add("recipe.workbench.block.item_chute_basic", "Basic Item Chutes", "workbench", [
		_ref("item", "item.component.chute_segment", 2),
		_ref("item", "item.material.copper_wire"),
	], _ref("block", "automation.transport.chute", 2))
	_add("recipe.workbench.component.miner_head_iron", "Iron Miner Head", "workbench", [
		_ref("item", "item.material.iron_plate", 3),
		_ref("item", "item.material.iron_rod", 2),
		_ref("item", "item.tool.stone_pickaxe"),
	], _ref("item", "item.component.miner_head_iron"))
	_add("recipe.workbench.tool.wrench_basic", "Basic Wrench", "workbench", [
		_ref("item", "item.material.copper_plate", 2),
		_ref("item", "item.component.gear_copper"),
		_ref("item", "item.material.iron_rod"),
	], _ref("item", "item.tool.wrench_basic"))
	_add("recipe.workbench.block.crate_wood", "Wooden Crate", "workbench", [
		_ref("item", "item.material.plank_oak", 6),
		_ref("item", "item.material.beam_oak", 2),
	], _ref("block", "storage.crate.wood"))
	_add("recipe.workbench.block.manual_crank", "Manual Crank", "workbench", [
		_ref("item", "item.material.beam_oak", 2),
		_ref("item", "item.component.gear_copper"),
		_ref("item", "item.material.iron_rod"),
	], _ref("block", "power.crank.basic"))
	_add("recipe.workbench.block.basic_mechanical_miner", "Basic Mechanical Miner", "workbench", [
		_ref("item", "item.component.machine_frame_copper"),
		_ref("item", "item.component.machine_core_basic"),
		_ref("item", "item.component.miner_head_iron"),
		_ref("item", "item.component.gear_copper", 2),
	], _ref("block", "automation.machine.basic_miner"))
	_add("recipe.workbench.block.warehouse_input_hatch", "Village Warehouse Input Hatch", "workbench", [
		_ref("block", "automation.transport.chute"),
		_ref("item", "item.material.iron_plate", 4),
		_ref("item", "item.material.copper_wire", 2),
	], _ref("block", "automation.village.warehouse_input_hatch"))

	_add("recipe.furnace.material.clay_brick", "Clay Brick", "furnace", [
		_ref("item", "item.resource.clay_lump"),
	], _ref("item", "item.material.clay_brick"), false, 10.0)
	_add("recipe.furnace.material.glass_piece", "Glass Piece", "furnace", [
		_ref("item", "item.resource.sand"),
	], _ref("item", "item.material.glass_piece"), false, 12.0)
	_add("recipe.furnace.component.stone_furnace_core", "Stone Furnace Core", "furnace", [
		_ref("item", "item.material.stone_brick", 8),
		_ref("item", "item.material.clay_brick", 2),
		_ref("item", "item.resource.coal_chunk"),
	], _ref("item", "item.component.furnace_core_stone"), false, 20.0)
	_add("recipe.furnace.ingot.copper", "Copper Ingot", "furnace", [
		_ref("item", "item.resource.raw_copper_ore"),
	], _ref("item", "item.material.copper_ingot"), false, 15.0)
	_add("recipe.furnace.ingot.iron", "Iron Ingot", "furnace", [
		_ref("item", "item.resource.raw_iron_ore"),
	], _ref("item", "item.material.iron_ingot"), false, 18.0)
	_register_crafting_patterns()


func _cell(x: int, y: int, kind: String, stable_id: String, count: int = 1) -> Dictionary:
	return {"x": x, "y": y, "ref": _ref(kind, stable_id, count), "count": count}


func _set_pattern(recipe_id: String, width: int, height: int, cells: Array) -> void:
	_patterns[recipe_id] = {
		"shapeless": false,
		"width": width,
		"height": height,
		"cells": cells,
	}


func _set_shapeless(recipe_id: String) -> void:
	_patterns[recipe_id] = {"shapeless": true}


func _register_crafting_patterns() -> void:
	for recipe_id in [
		"recipe.hand.bootstrap.rough_oak_plank",
		"recipe.hand.bootstrap.stick",
		"recipe.hand.material.cobblestone",
		"recipe.workbench.material.oak_plank",
	]:
		_set_shapeless(recipe_id)
	_set_pattern("recipe.hand.tool.crude_pickaxe", 2, 2, [
		_cell(0, 0, "item", "item.resource.stone_chunk", 2),
		_cell(1, 0, "item", "item.resource.plant_fibre"),
		_cell(0, 1, "item", "item.resource.stick", 2),
	])
	_set_pattern("recipe.hand.tool.crude_axe", 2, 2, [
		_cell(0, 0, "item", "item.resource.stone_chunk"),
		_cell(1, 0, "item", "item.resource.plant_fibre"),
		_cell(0, 1, "item", "item.resource.stick", 2),
	])
	_set_pattern("recipe.workbench.block.workbench_basic", 2, 2, [
		_cell(0, 0, "item", "item.material.plank_oak", 2),
		_cell(1, 0, "item", "item.material.plank_oak", 2),
		_cell(0, 1, "item", "item.resource.stick"),
		_cell(1, 1, "item", "item.resource.stick"),
	])
	_set_pattern("recipe.workbench.material.oak_beam", 1, 2, [
		_cell(0, 0, "item", "item.resource.log_oak"),
		_cell(0, 1, "item", "item.resource.log_oak"),
	])
	_set_pattern("recipe.workbench.block.oak_slab", 3, 1, [
		_cell(0, 0, "item", "item.material.plank_oak", 2),
		_cell(1, 0, "item", "item.material.plank_oak", 2),
		_cell(2, 0, "item", "item.material.plank_oak", 2),
	])
	_set_pattern("recipe.workbench.block.oak_stair", 3, 3, [
		_cell(0, 0, "item", "item.material.plank_oak"),
		_cell(0, 1, "item", "item.material.plank_oak"),
		_cell(1, 1, "item", "item.material.plank_oak"),
		_cell(0, 2, "item", "item.material.plank_oak"),
		_cell(1, 2, "item", "item.material.plank_oak"),
		_cell(2, 2, "item", "item.material.plank_oak"),
	])
	_set_pattern("recipe.workbench.material.stone_brick", 2, 2, [
		_cell(0, 0, "item", "item.resource.stone_chunk"),
		_cell(1, 0, "item", "item.resource.stone_chunk"),
		_cell(0, 1, "item", "item.resource.stone_chunk"),
		_cell(1, 1, "item", "item.resource.stone_chunk"),
	])
	_set_pattern("recipe.workbench.block.fence_oak", 3, 2, [
		_cell(0, 0, "item", "item.resource.stick"),
		_cell(1, 0, "item", "item.material.plank_oak"),
		_cell(2, 0, "item", "item.resource.stick"),
		_cell(0, 1, "item", "item.resource.stick"),
		_cell(1, 1, "item", "item.material.plank_oak"),
		_cell(2, 1, "item", "item.resource.stick"),
	])
	var chest_cells: Array = []
	for y in 3:
		for x in 3:
			if x != 1 or y != 1:
				chest_cells.append(_cell(x, y, "item", "item.material.plank_oak"))
	_set_pattern("recipe.workbench.block.chest_wood", 3, 3, chest_cells)
	_set_pattern("recipe.workbench.tool.stone_pickaxe", 3, 3, [
		_cell(0, 0, "item", "item.resource.stone_chunk"),
		_cell(1, 0, "item", "item.resource.stone_chunk"),
		_cell(2, 0, "item", "item.resource.stone_chunk"),
		_cell(1, 1, "item", "item.resource.stick"),
		_cell(1, 2, "item", "item.resource.stick"),
		_cell(0, 2, "item", "item.resource.plant_fibre"),
	])
	_set_pattern("recipe.workbench.tool.stone_axe", 3, 3, [
		_cell(0, 0, "item", "item.resource.stone_chunk"),
		_cell(1, 0, "item", "item.resource.stone_chunk"),
		_cell(0, 1, "item", "item.resource.stone_chunk"),
		_cell(1, 1, "item", "item.resource.stick"),
		_cell(1, 2, "item", "item.resource.stick"),
		_cell(2, 2, "item", "item.resource.plant_fibre"),
	])
	_set_pattern("recipe.workbench.block.furnace_stone", 3, 3, [
		_cell(0, 0, "item", "item.material.cobblestone"),
		_cell(1, 0, "item", "item.material.clay_brick"),
		_cell(2, 0, "item", "item.material.cobblestone"),
		_cell(0, 1, "item", "item.material.cobblestone"),
		_cell(1, 1, "item", "item.component.furnace_core_stone"),
		_cell(2, 1, "item", "item.material.cobblestone"),
		_cell(0, 2, "item", "item.material.cobblestone"),
		_cell(1, 2, "item", "item.material.clay_brick"),
		_cell(2, 2, "item", "item.material.cobblestone"),
	])
	_set_pattern("recipe.workbench.material.iron_rod", 1, 2, [
		_cell(0, 0, "item", "item.material.iron_ingot"),
		_cell(0, 1, "item", "item.material.iron_ingot"),
	])
	_set_pattern("recipe.workbench.material.iron_plate", 2, 1, [
		_cell(0, 0, "item", "item.material.iron_ingot"),
		_cell(1, 0, "item", "item.material.iron_ingot"),
	])
	_set_shapeless("recipe.workbench.material.iron_nails")
	_set_pattern("recipe.workbench.block.torch_basic", 1, 2, [
		_cell(0, 0, "item", "item.resource.coal_chunk"),
		_cell(0, 1, "item", "item.resource.stick"),
	])
	_set_shapeless("recipe.workbench.material.copper_wire")
	_set_pattern("recipe.workbench.material.copper_plate", 2, 1, [
		_cell(0, 0, "item", "item.material.copper_ingot"),
		_cell(1, 0, "item", "item.material.copper_ingot"),
	])
	_set_pattern("recipe.workbench.component.gear_copper", 3, 1, [
		_cell(0, 0, "item", "item.material.copper_plate"),
		_cell(1, 0, "item", "item.material.copper_wire"),
		_cell(2, 0, "item", "item.material.copper_plate"),
	])
	_set_pattern("recipe.workbench.component.machine_frame_wood", 3, 3, [
		_cell(0, 0, "item", "item.material.plank_oak"),
		_cell(1, 0, "item", "item.material.plank_oak"),
		_cell(2, 0, "item", "item.material.plank_oak"),
		_cell(0, 1, "item", "item.material.beam_oak"),
		_cell(1, 1, "item", "item.material.copper_wire", 2),
		_cell(2, 1, "item", "item.material.beam_oak"),
		_cell(0, 2, "item", "item.material.plank_oak"),
		_cell(1, 2, "item", "item.material.plank_oak"),
		_cell(2, 2, "item", "item.material.plank_oak"),
	])
	_set_pattern("recipe.workbench.component.machine_frame_copper", 3, 3, [
		_cell(0, 0, "item", "item.material.copper_plate"),
		_cell(2, 0, "item", "item.material.copper_plate"),
		_cell(0, 1, "item", "item.component.gear_copper"),
		_cell(1, 1, "item", "item.component.machine_frame_wood"),
		_cell(2, 1, "item", "item.component.gear_copper"),
		_cell(0, 2, "item", "item.material.copper_plate"),
		_cell(2, 2, "item", "item.material.copper_plate"),
	])
	_set_pattern("recipe.workbench.component.machine_core_basic", 3, 3, [
		_cell(1, 0, "item", "item.component.gear_copper"),
		_cell(0, 1, "item", "item.material.copper_wire", 2),
		_cell(1, 1, "item", "item.material.iron_rod"),
		_cell(2, 1, "item", "item.material.copper_wire", 2),
		_cell(1, 2, "item", "item.component.gear_copper"),
	])
	_set_pattern("recipe.workbench.component.chute_segment", 3, 3, [
		_cell(0, 0, "item", "item.material.plank_oak"),
		_cell(2, 0, "item", "item.material.plank_oak"),
		_cell(0, 1, "item", "item.material.copper_plate"),
		_cell(1, 1, "item", "item.material.iron_nails", 2),
		_cell(2, 1, "item", "item.material.copper_plate"),
		_cell(0, 2, "item", "item.material.plank_oak"),
		_cell(2, 2, "item", "item.material.plank_oak"),
	])
	_set_pattern("recipe.workbench.block.item_chute_basic", 3, 1, [
		_cell(0, 0, "item", "item.component.chute_segment"),
		_cell(1, 0, "item", "item.material.copper_wire"),
		_cell(2, 0, "item", "item.component.chute_segment"),
	])
	_set_pattern("recipe.workbench.component.miner_head_iron", 3, 3, [
		_cell(0, 0, "item", "item.material.iron_plate"),
		_cell(1, 0, "item", "item.material.iron_plate"),
		_cell(2, 0, "item", "item.material.iron_plate"),
		_cell(0, 1, "item", "item.material.iron_rod"),
		_cell(1, 1, "item", "item.tool.stone_pickaxe"),
		_cell(2, 1, "item", "item.material.iron_rod"),
	])
	_set_pattern("recipe.workbench.tool.wrench_basic", 3, 3, [
		_cell(0, 0, "item", "item.material.copper_plate"),
		_cell(2, 0, "item", "item.material.copper_plate"),
		_cell(1, 1, "item", "item.component.gear_copper"),
		_cell(1, 2, "item", "item.material.iron_rod"),
	])
	_set_pattern("recipe.workbench.block.crate_wood", 3, 3, [
		_cell(0, 0, "item", "item.material.plank_oak"),
		_cell(1, 0, "item", "item.material.plank_oak"),
		_cell(2, 0, "item", "item.material.plank_oak"),
		_cell(0, 1, "item", "item.material.beam_oak"),
		_cell(2, 1, "item", "item.material.beam_oak"),
		_cell(0, 2, "item", "item.material.plank_oak"),
		_cell(1, 2, "item", "item.material.plank_oak"),
		_cell(2, 2, "item", "item.material.plank_oak"),
	])
	_set_pattern("recipe.workbench.block.manual_crank", 3, 3, [
		_cell(0, 0, "item", "item.material.beam_oak"),
		_cell(2, 0, "item", "item.material.beam_oak"),
		_cell(1, 1, "item", "item.component.gear_copper"),
		_cell(1, 2, "item", "item.material.iron_rod"),
	])
	_set_pattern("recipe.workbench.block.basic_mechanical_miner", 3, 3, [
		_cell(1, 0, "item", "item.component.machine_core_basic"),
		_cell(0, 1, "item", "item.component.gear_copper"),
		_cell(1, 1, "item", "item.component.machine_frame_copper"),
		_cell(2, 1, "item", "item.component.gear_copper"),
		_cell(1, 2, "item", "item.component.miner_head_iron"),
	])
	_set_pattern("recipe.workbench.block.warehouse_input_hatch", 3, 3, [
		_cell(0, 0, "item", "item.material.iron_plate"),
		_cell(1, 0, "item", "item.material.copper_wire"),
		_cell(2, 0, "item", "item.material.iron_plate"),
		_cell(1, 1, "block", "automation.transport.chute"),
		_cell(0, 2, "item", "item.material.iron_plate"),
		_cell(1, 2, "item", "item.material.copper_wire"),
		_cell(2, 2, "item", "item.material.iron_plate"),
	])


func get_recipe(id: String) -> Dictionary:
	return _recipes.get(id, {}).duplicate(true)


func get_recipes_for_station(station: String) -> Array[Dictionary]:
	var out: Array[Dictionary] = []
	for id in _ordered_ids:
		var recipe: Dictionary = _recipes[id]
		if str(recipe["station"]) == station:
			out.append(recipe.duplicate(true))
	return out


func find_furnace_recipe_for(stack: Dictionary) -> Dictionary:
	if stack.is_empty():
		return {}
	for recipe in get_recipes_for_station("furnace"):
		var inputs: Array = recipe["inputs"]
		if inputs.size() != 1:
			continue
		if Inventory.stack_matches_ref(stack, inputs[0]) \
				and int(stack.get("count", 0)) >= int(inputs[0]["count"]):
			return recipe
	return {}


func match_furnace_recipe(inputs: Array) -> Dictionary:
	for recipe in get_recipes_for_station("furnace"):
		var matches := true
		for content_ref in recipe["inputs"]:
			var available := 0
			for stack in inputs:
				if Inventory.stack_matches_ref(stack, content_ref):
					available += int(stack.get("count", 0))
			if available < int(content_ref["count"]):
				matches = false
				break
		if matches:
			return recipe
	return {}


func match_crafting_grid(grid: Array, grid_size: int, station: String) -> Dictionary:
	# Exact shaped layouts take precedence over broad shapeless conversions.
	# Otherwise two vertical logs are claimed by the one-log plank recipe before
	# the more specific beam pattern can be considered.
	var recipes := get_recipes_for_station(station)
	if station == "workbench":
		# A workbench is a strict superset of hand crafting. Workbench recipes
		# stay first so its efficient four-plank conversion wins over the
		# reduced-yield hand fallback when both accept one Oak Log.
		recipes.append_array(get_recipes_for_station("hand"))
	for match_shapeless in [false, true]:
		for recipe in recipes:
			var recipe_id := str(recipe["id"])
			if not ProgressionState.is_recipe_known(recipe_id) or not _patterns.has(recipe_id):
				continue
			var pattern: Dictionary = _patterns[recipe_id]
			if bool(pattern.get("shapeless", false)) != match_shapeless:
				continue
			var consume := _match_shapeless(grid, grid_size, recipe) \
				if match_shapeless else _match_shaped(grid, grid_size, pattern)
			if consume is Dictionary and not consume.is_empty():
				recipe["consume"] = consume
				return recipe
	return {}


func _active_grid_indices(grid_size: int) -> Array[int]:
	var indices: Array[int] = []
	for y in grid_size:
		for x in grid_size:
			indices.append(y * 3 + x)
	return indices


func _match_shapeless(grid: Array, grid_size: int, recipe: Dictionary) -> Dictionary:
	var active := _active_grid_indices(grid_size)
	for index in active:
		var stack: Dictionary = grid[index]
		if stack.is_empty():
			continue
		var allowed := false
		for content_ref in recipe["inputs"]:
			if Inventory.stack_matches_ref(stack, content_ref):
				allowed = true
				break
		if not allowed:
			return {}
	var consume := {}
	for content_ref in recipe["inputs"]:
		var remaining := int(content_ref["count"])
		for index in active:
			if remaining <= 0:
				break
			var stack: Dictionary = grid[index]
			if not Inventory.stack_matches_ref(stack, content_ref):
				continue
			var move := mini(remaining, int(stack.get("count", 0)))
			if move > 0:
				consume[index] = int(consume.get(index, 0)) + move
				remaining -= move
		if remaining > 0:
			return {}
	# Every occupied slot must contribute to the match. This rejects unrelated
	# extras and prevents two separate log stacks in the wrong beam orientation
	# from falling through to the one-log shapeless plank conversion.
	for index in active:
		if not grid[index].is_empty() and int(consume.get(index, 0)) <= 0:
			return {}
	return consume


func _match_shaped(grid: Array, grid_size: int, pattern: Dictionary) -> Dictionary:
	var width := int(pattern["width"])
	var height := int(pattern["height"])
	if width > grid_size or height > grid_size:
		return {}
	for offset_y in range(0, grid_size - height + 1):
		for offset_x in range(0, grid_size - width + 1):
			var expected := {}
			for cell in pattern["cells"]:
				var index := (offset_y + int(cell["y"])) * 3 + offset_x + int(cell["x"])
				expected[index] = cell
			var consume := {}
			var valid := true
			for index in _active_grid_indices(grid_size):
				var stack: Dictionary = grid[index]
				if expected.has(index):
					var cell: Dictionary = expected[index]
					if not Inventory.stack_matches_ref(stack, cell["ref"]) \
							or int(stack.get("count", 0)) < int(cell["count"]):
						valid = false
						break
					consume[index] = int(cell["count"])
				elif not stack.is_empty():
					valid = false
					break
			if valid:
				return consume
	return {}


func is_furnace_ingredient(stack: Dictionary) -> bool:
	for recipe in get_recipes_for_station("furnace"):
		for content_ref in recipe["inputs"]:
			if Inventory.stack_matches_ref(stack, content_ref):
				return true
	return false


func get_all_recipe_ids() -> Array[String]:
	return _ordered_ids.duplicate()
