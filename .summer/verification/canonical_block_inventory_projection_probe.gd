extends Node

const LEGACY_PROJECTIONS := {
	"item.resource.log_oak": ["natural.log.oak", 142],
	"item.resource.sand": ["terrain.sand.basic", 149],
	"item.material.plank_oak": ["construction.planks.oak", 167],
	"item.material.beam_oak": ["construction.beam.oak", 168],
	"item.material.cobblestone": ["construction.cobble.stone", 169],
	"item.material.stone_brick": ["construction.brick.stone", 170],
	"item.material.roof_tile_clay": ["construction.roof.tile_clay", 224],
}
const HARVEST_PROJECTIONS := {
	"natural.log.oak": "natural.log.oak",
	"terrain.sand.basic": "terrain.sand.basic",
	"construction.planks.oak": "construction.planks.oak",
	"construction.beam.oak": "construction.beam.oak",
	"construction.cobble.stone": "construction.cobble.stone",
	"construction.brick.stone": "construction.brick.stone",
}

var failures: Array[String] = []
var checks := 0


func _ready() -> void:
	call_deferred("_run")


func _check(condition: bool, message: String) -> void:
	checks += 1
	if not condition:
		failures.append(message)


func _run() -> void:
	_check(BlockRegistry.get_all_ids().size() == 143, "canonical Block count changed")
	_check(ItemRegistry.get_all_ids().size() == 162, "proxy Items remain active")
	for legacy_id in LEGACY_PROJECTIONS:
		_verify_projection(legacy_id, LEGACY_PROJECTIONS[legacy_id])
	for block_stable_id in HARVEST_PROJECTIONS:
		var block_id := BlockRegistry.get_id_by_stable_id(block_stable_id)
		var profile := BlockRegistry.get_harvest_profile(block_id)
		_check(str(profile.get("drop_kind", "")) == "block",
			"recoverable Block harvest changed namespace: %s" % block_stable_id)
		_check(str(profile.get("drop_id", "")) == HARVEST_PROJECTIONS[block_stable_id],
			"recoverable Block harvest changed identity: %s" % block_stable_id)
		_check(int(profile.get("drop_count", 0)) == 1,
			"recoverable Block harvest changed quantity: %s" % block_stable_id)
	_verify_inventory_restore_conservation()
	_verify_recipe_refs()
	var result := {
		"ok": failures.is_empty(),
		"checks": checks,
		"aliases": LEGACY_PROJECTIONS.size(),
		"failures": failures,
	}
	print("CANONICAL_BLOCK_INVENTORY_PROJECTION_RUNTIME_PROBE ", JSON.stringify(result))
	get_tree().quit(0 if failures.is_empty() else 1)


func _verify_projection(legacy_id: String, values: Array) -> void:
	var replacement := str(values[0])
	var numeric_id := int(values[1])
	var block_id := BlockRegistry.get_id_by_stable_id(replacement)
	_check(ItemRegistry.get_id_by_stable_id(legacy_id) == -1,
		"legacy alias remains an active Item: %s" % legacy_id)
	var projection := BlockRegistry.legacy_item_projection(legacy_id)
	_check(not projection.is_empty(), "legacy alias does not project: %s" % legacy_id)
	_check(str(projection.get("stable_id", "")) == replacement,
		"legacy alias projects to wrong stable ID: %s" % legacy_id)
	_check(int(projection.get("id", -1)) == block_id,
		"legacy alias projects to wrong runtime ID: %s" % legacy_id)
	_check(BlockRegistry.resolve_serialized_id(legacy_id) == block_id,
		"legacy stable ID does not resolve to Block: %s" % legacy_id)
	_check(BlockRegistry.resolve_serialized_id(numeric_id) == block_id,
		"legacy numeric ID does not resolve to Block: %s" % legacy_id)
	var restored := Inventory.deserialize_stack({"item_id": legacy_id, "count": 3})
	_check(Inventory.stack_kind(restored) == "block",
		"legacy serialized Item did not become Block: %s" % legacy_id)
	_check(int(restored.get("id", -1)) == block_id,
		"legacy serialized Item became wrong Block: %s" % legacy_id)
	_check(int(restored.get("count", 0)) == 3,
		"legacy serialized Item quantity changed: %s" % legacy_id)
	var serialized := Inventory.serialize_stack(restored)
	_check(not serialized.has("item_id"),
		"migrated stack serialized back into Item namespace: %s" % legacy_id)
	_check(str(serialized.get("block_id", "")) == replacement,
		"migrated stack serialized wrong Block identity: %s" % legacy_id)
	var numeric := Inventory.deserialize_stack({"item_id": numeric_id, "count": 2})
	_check(int(numeric.get("id", -1)) == block_id,
		"legacy numeric stack did not migrate: %s" % legacy_id)
	var made := Inventory.make_stack_from_ref({
		"kind": "item", "stable_id": legacy_id, "count": 4,
	})
	_check(Inventory.stack_kind(made) == "block",
		"legacy content ref did not project to Block: %s" % legacy_id)
	_check(int(made.get("id", -1)) == block_id,
		"legacy content ref projected to wrong Block: %s" % legacy_id)
	_check(int(made.get("count", 0)) == 4,
		"legacy content ref quantity changed: %s" % legacy_id)


func _verify_inventory_restore_conservation() -> void:
	var empty_slots: Array = []
	empty_slots.resize(Inventory.HOTBAR_SIZE)
	for index in empty_slots.size():
		empty_slots[index] = {}
	empty_slots[0] = {"item_id": "item.resource.log_oak", "count": 5}
	empty_slots[1] = {"item_id": 142, "count": 6}
	Inventory.restore_state({"hotbar": empty_slots, "selected_slot": 0})
	var canonical_ref := {
		"kind": "block", "stable_id": "natural.log.oak", "count": 1,
	}
	_check(Inventory.count_ref(canonical_ref) == 11,
		"inventory restore did not conserve projected quantity")
	var saved := Inventory.serialize_state()
	var first: Dictionary = saved["hotbar"][0]
	var second: Dictionary = saved["hotbar"][1]
	_check(str(first.get("block_id", "")) == "natural.log.oak",
		"stable legacy stack did not serialize canonically")
	_check(str(second.get("block_id", "")) == "natural.log.oak",
		"numeric legacy stack did not serialize canonically")
	_check(not first.has("item_id"), "stable legacy Item identity survived save")
	_check(not second.has("item_id"), "numeric legacy Item identity survived save")
	_check(int(first.get("count", 0)) + int(second.get("count", 0)) == 11,
		"save round-trip changed projected quantity")


func _verify_recipe_refs() -> void:
	var aliases := LEGACY_PROJECTIONS.keys()
	var has_legacy := false
	var all_resolve := true
	for recipe_id in RecipeRegistry.get_all_recipe_ids():
		var recipe := RecipeRegistry.get_recipe(recipe_id)
		var refs: Array = recipe.get("inputs", []).duplicate()
		refs.append(recipe.get("output", {}))
		for content_ref in refs:
			if str(content_ref.get("stable_id", "")) in aliases:
				has_legacy = true
			if Inventory.make_stack_from_ref(content_ref).is_empty():
				all_resolve = false
	_check(not has_legacy, "active RecipeRegistry contains a retired proxy ID")
	_check(all_resolve, "canonical recipe reference does not resolve")
