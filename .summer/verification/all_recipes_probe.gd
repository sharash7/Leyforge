extends Node

var failures: Array[String] = []
var crafting_checked := 0
var furnace_checked := 0


func _ready() -> void:
	call_deferred("_run")


func _check(condition: bool, message: String) -> void:
	if not condition:
		failures.append(message)


func _clear_inventory() -> void:
	Inventory.hotbar = Inventory._empty_slots(Inventory.HOTBAR_SIZE)
	Inventory.backpack = Inventory._empty_slots(Inventory.BACKPACK_SIZE)
	Inventory.craft_grid = Inventory._empty_slots(Inventory.CRAFT_SIZE)
	Inventory.craft_output = {}


func _run() -> void:
	for recipe_id in RecipeRegistry.get_all_recipe_ids():
		ProgressionState.known_recipes[recipe_id] = true
	for recipe_id in RecipeRegistry.get_all_recipe_ids():
		var recipe := RecipeRegistry.get_recipe(recipe_id)
		if str(recipe["station"]) in ["furnace", "mana_furnace"]:
			_verify_furnace_recipe(recipe)
		else:
			_verify_grid_recipe(recipe)
	_verify_hand_recipes_in_workbench()
	_verify_block_material_equivalence()
	_verify_request_delivery_equivalence()

	var result := {
		"ok": failures.is_empty(),
		"checks": crafting_checked + furnace_checked + 11,
		"crafting_recipes": crafting_checked,
		"furnace_recipes": furnace_checked,
		"failures": failures,
	}
	print("ALL_RECIPES_PROBE ", JSON.stringify(result))
	get_tree().quit(0 if failures.is_empty() else 1)


func _verify_grid_recipe(recipe: Dictionary) -> void:
	var recipe_id := str(recipe["id"])
	_clear_inventory()
	Inventory.set_crafting_station(str(recipe["station"]))
	var pattern: Dictionary = RecipeRegistry._patterns.get(recipe_id, {})
	_check(not pattern.is_empty(), "%s has no crafting pattern" % recipe_id)
	if pattern.is_empty():
		return
	if bool(pattern.get("shapeless", false)):
		var indices := Inventory.get_active_craft_indices()
		for i in recipe["inputs"].size():
			Inventory.set_craft_slot(
				indices[i], Inventory.make_stack_from_ref(recipe["inputs"][i]))
	else:
		for cell in pattern["cells"]:
			var index := int(cell["y"]) * 3 + int(cell["x"])
			Inventory.set_craft_slot(
				index, Inventory.make_stack_from_ref(cell["ref"]))
	_check(
		Inventory.active_craft_recipe_id == recipe_id,
		"%s did not match its authored grid slots" % recipe_id)
	var result := Inventory.take_craft_output()
	var output: Dictionary = recipe["output"]
	_check(
		Inventory.stack_stable_id(result) == str(output["stable_id"])
			and int(result.get("count", 0)) == int(output.get("count", 1)),
		"%s produced the wrong output" % recipe_id)
	for index in Inventory.get_active_craft_indices():
		_check(
			Inventory.craft_grid[index].is_empty(),
			"%s did not consume its exact grid ingredients" % recipe_id)
	crafting_checked += 1


func _verify_furnace_recipe(recipe: Dictionary) -> void:
	var inputs: Array = []
	for content_ref in recipe["inputs"]:
		inputs.append(Inventory.make_stack_from_ref(content_ref))
	while inputs.size() < 3:
		inputs.append({})
	var matched := RecipeRegistry.match_furnace_recipe(
		inputs, str(recipe["station"]))
	_check(
		str(matched.get("id", "")) == str(recipe["id"]),
		"%s did not match its furnace inputs" % recipe["id"])
	var output := Inventory.make_stack_from_ref(recipe["output"])
	_check(
		Inventory.stack_stable_id(output) == str(recipe["output"]["stable_id"])
			and int(output.get("count", 0)) == int(recipe["output"].get("count", 1)),
		"%s has an invalid furnace output" % recipe["id"])
	furnace_checked += 1


func _verify_hand_recipes_in_workbench() -> void:
	for recipe in RecipeRegistry.get_recipes_for_station("hand"):
		var recipe_id := str(recipe["id"])
		_clear_inventory()
		Inventory.set_crafting_station("workbench")
		var pattern: Dictionary = RecipeRegistry._patterns[recipe_id]
		if bool(pattern.get("shapeless", false)):
			var indices := Inventory.get_active_craft_indices()
			for i in recipe["inputs"].size():
				Inventory.set_craft_slot(
					indices[i], Inventory.make_stack_from_ref(recipe["inputs"][i]))
		else:
			for cell in pattern["cells"]:
				var index := int(cell["y"]) * 3 + int(cell["x"])
				Inventory.set_craft_slot(
					index, Inventory.make_stack_from_ref(cell["ref"]))
		var expected_output := str(recipe["output"]["stable_id"])
		_check(
			not Inventory.craft_output.is_empty()
				and Inventory.stack_stable_id(Inventory.craft_output) == expected_output
				and int(Inventory.craft_output.get("count", 0))
					>= int(recipe["output"].get("count", 1)),
			"%s was not craftable from the 3x3 workbench" % recipe_id)


func _verify_block_material_equivalence() -> void:
	_clear_inventory()
	Inventory.set_crafting_station("hand")
	var block_plank := Inventory.make_stack_from_ref({
		"kind": "block",
		"stable_id": "construction.planks.oak",
		"count": 1,
	})
	Inventory.set_craft_slot(0, block_plank)
	_check(
		Inventory.active_craft_recipe_id == "recipe.hand.bootstrap.stick",
		"placeable Oak Plank block did not match the stick recipe")
	var sticks := Inventory.take_craft_output()
	_check(
		Inventory.stack_stable_id(sticks) == "item.resource.stick"
			and int(sticks.get("count", 0)) == 2,
		"placeable Oak Plank block did not craft two sticks")
	_clear_inventory()
	Inventory.set_crafting_station("workbench")
	var item_log := Inventory.make_stack_from_ref({
		"kind": "block",
		"stable_id": "natural.log.oak",
		"count": 1,
	})
	Inventory.set_craft_slot(0, item_log)
	Inventory.set_craft_slot(1, item_log)
	_check(
		Inventory.craft_output.is_empty(),
		"two horizontal logs incorrectly matched a shaped or shapeless recipe")


func _verify_request_delivery_equivalence() -> void:
	HamletState.initialized = false
	HamletState.initialize(99173, {
		"hamlet": Vector2i.ZERO,
		"warehouse": Vector2i(5, 0),
		"watchtower_site": Vector2i(12, 0),
	})
	HamletState.accept_introduction()
	_clear_inventory()
	var foundation := HamletState.get_project_stage_definition(1)
	for content_ref in foundation["requirements"]:
		Inventory.add_stack(Inventory.make_stack_from_ref(content_ref))
	HamletState.deliver_request(str(foundation["request_id"]))
	HamletState.set_project_stage_total(1)
	HamletState.record_project_block_placed(1)
	_clear_inventory()
	var block_planks := Inventory.make_stack_from_ref({
		"kind": "block",
		"stable_id": "construction.planks.oak",
		"count": 64,
	})
	Inventory.add_stack(block_planks)
	for content_ref in HamletState.get_project_stage_definition(2)["requirements"]:
		if str(content_ref["stable_id"]) != "construction.planks.oak":
			Inventory.add_stack(Inventory.make_stack_from_ref(content_ref))
	var delivery := HamletState.deliver_request("request.watchtower.stage.frame")
	var plank_ref := {
		"kind": "block",
		"stable_id": "construction.planks.oak",
		"count": 12,
	}
	_check(
		int(delivery.get("moved", 0)) == 40
			and int(HamletState.project.get("reserved", {}).get(
				"construction.planks.oak", 0)) == 12,
		"stage request did not accept and reserve Oak Planks from a block stack")
	_check(
		Inventory.count_ref(plank_ref) == 52,
		"stage request did not conserve the remaining 52 Oak Planks")
