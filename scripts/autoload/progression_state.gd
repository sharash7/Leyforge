extends Node
## Lightweight, persistent Stage 3 progression hooks. Later knowledge, quest,
## village, and research systems can subscribe to these stable identities.

signal progression_changed

var discovered_content: Dictionary = {}
var known_recipes: Dictionary = {}
var harvested_counts: Dictionary = {}
var crafted_counts: Dictionary = {}
var refined_counts: Dictionary = {}


func _ready() -> void:
	reset()


func reset() -> void:
	discovered_content.clear()
	known_recipes.clear()
	harvested_counts.clear()
	crafted_counts.clear()
	refined_counts.clear()
	for recipe_id in RecipeRegistry.get_all_recipe_ids():
		var recipe := RecipeRegistry.get_recipe(recipe_id)
		if bool(recipe.get("known_start", false)):
			known_recipes[recipe_id] = true
	progression_changed.emit()


func discover_content(stable_id: String) -> void:
	if stable_id.is_empty() or discovered_content.has(stable_id):
		return
	discovered_content[stable_id] = true
	_refresh_recipe_knowledge()
	progression_changed.emit()


func discover_station(stable_id: String) -> void:
	discover_content(stable_id)
	var station := ""
	if stable_id == "functional.workbench.basic":
		station = "workbench"
	elif stable_id == "functional.furnace.stone":
		station = "furnace"
	elif stable_id == "magic.rune_table.basic":
		station = "rune_table"
	elif stable_id == "magic.furnace.mana":
		station = "mana_furnace"
	if station.is_empty():
		return
	if station == "rune_table" and not has_basic_magic_knowledge():
		return
	for recipe in RecipeRegistry.get_recipes_for_station(station):
		known_recipes[str(recipe["id"])] = true
	progression_changed.emit()


func unlock_basic_magic(source_id: String) -> void:
	discovered_content["knowledge.magic.basic_rune"] = true
	if not source_id.is_empty():
		discovered_content[source_id] = true
	for recipe in RecipeRegistry.get_recipes_for_station("rune_table"):
		known_recipes[str(recipe["id"])] = true
	progression_changed.emit()


func has_basic_magic_knowledge() -> bool:
	return discovered_content.has("knowledge.magic.basic_rune")


func record_harvest(stable_id: String, count: int = 1) -> void:
	discover_content(stable_id)
	harvested_counts[stable_id] = int(harvested_counts.get(stable_id, 0)) + count
	progression_changed.emit()


func record_craft(recipe_id: String, output_stable_id: String, count: int = 1) -> void:
	known_recipes[recipe_id] = true
	discover_content(output_stable_id)
	crafted_counts[recipe_id] = int(crafted_counts.get(recipe_id, 0)) + count
	progression_changed.emit()


func record_refine(recipe_id: String, output_stable_id: String, count: int = 1) -> void:
	known_recipes[recipe_id] = true
	discover_content(output_stable_id)
	refined_counts[recipe_id] = int(refined_counts.get(recipe_id, 0)) + count
	progression_changed.emit()


func is_recipe_known(recipe_id: String) -> bool:
	return known_recipes.has(recipe_id)


func _refresh_recipe_knowledge() -> void:
	# Furnace transformations become known when their primary input is found.
	for station in ["furnace", "mana_furnace"]:
		for recipe in RecipeRegistry.get_recipes_for_station(station):
			var inputs: Array = recipe["inputs"]
			if not inputs.is_empty() and discovered_content.has(str(inputs[0]["stable_id"])):
				known_recipes[str(recipe["id"])] = true
	if has_basic_magic_knowledge():
		for recipe in RecipeRegistry.get_recipes_for_station("rune_table"):
			known_recipes[str(recipe["id"])] = true


func serialize_state() -> Dictionary:
	return {
		"discovered_content": discovered_content.keys(),
		"known_recipes": known_recipes.keys(),
		"harvested_counts": harvested_counts.duplicate(),
		"crafted_counts": crafted_counts.duplicate(),
		"refined_counts": refined_counts.duplicate(),
	}


func restore_state(data: Dictionary) -> void:
	reset()
	for stable_id in data.get("discovered_content", []):
		discovered_content[str(stable_id)] = true
	for recipe_id in data.get("known_recipes", []):
		if not RecipeRegistry.get_recipe(str(recipe_id)).is_empty():
			known_recipes[str(recipe_id)] = true
	var harvest_value: Variant = data.get("harvested_counts", {})
	if harvest_value is Dictionary:
		harvested_counts = harvest_value.duplicate()
	var crafted_value: Variant = data.get("crafted_counts", {})
	if crafted_value is Dictionary:
		crafted_counts = crafted_value.duplicate()
	var refined_value: Variant = data.get("refined_counts", {})
	if refined_value is Dictionary:
		refined_counts = refined_value.duplicate()
	_refresh_recipe_knowledge()
	progression_changed.emit()
