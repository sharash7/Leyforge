extends Node
## DATA-001 adoption probe for the current Core physical catalogue.

const CONTENT_PATH := "res://data/registry/voxel_registry.json"
const CAPABILITY_PATH := "res://data/registry/core_capability_graph.json"

var checks := 0
var failures: Array[String] = []


func _ready() -> void:
	_test_summary_and_determinism()
	_test_blocks()
	_test_items_and_identity_boundary()
	_test_recipe_conservation()
	_test_capability_graph()
	print(JSON.stringify({"ok": failures.is_empty(), "checks": checks,
		"failures": failures, "catalogue_hash": ProductionCatalogue.catalogue_hash(),
		"definitions": ProductionCatalogue.definition_count()}))
	get_tree().quit(0 if failures.is_empty() else 1)


func _test_summary_and_determinism() -> void:
	var report := ProductionCatalogue.status_report()
	_expect(bool(report.get("ok", false)), "production catalogue is active")
	_expect(ProductionCatalogue.definition_count() == 372,
		"catalogue compiles 372 current definitions")
	_expect(ProductionCatalogue.catalogue_hash().length() == 64,
		"catalogue exposes a SHA-256 generation hash")
	_expect(ProductionCatalogue.pack_order() == [
		"pack.core.items", "pack.core.blocks", "pack.core.recipes",
		"pack.core.progression"], "Core packs resolve in dependency order")
	var counts := ProductionCatalogue.source_counts()
	_expect(int(counts.get("blocks", 0)) == 143, "all 143 Blocks are projected")
	_expect(int(counts.get("items", 0)) == 162, "all 162 Items are projected")
	_expect(int(counts.get("aliases", 0)) == 7,
		"all seven retired aliases remain migration-only evidence")
	_expect(int(counts.get("recipes", 0)) == 56, "all 56 recipes are projected")
	_expect(int(counts.get("capabilities", 0)) == 11,
		"CAP-00 through CAP-10 are represented")
	var validation := ProductionCatalogue.validation_report()
	_expect(bool(validation.get("ok", false)),
		"source catalogue validation has no blocking failures")
	_expect(int(validation.get("recipe_conservation_contracts", 0)) == 56,
		"every recipe has a conservation contract")
	_expect(int(validation.get("planned_capabilities", 0)) == 2,
		"CAP-09 and CAP-10 remain explicitly planned")
	_expect(int(validation.get("catalogue_only_items", 0)) > 0,
		"unprovided catalogue-only Items remain visible as a production gap")
	var first_hash := ProductionCatalogue.catalogue_hash()
	var rebuilt := ProductionCatalogue.rebuild()
	_expect(bool(rebuilt.get("ok", false)), "catalogue rebuild succeeds")
	_expect(ProductionCatalogue.catalogue_hash() == first_hash,
		"catalogue rebuild is deterministic")


func _test_blocks() -> void:
	for numeric_id in BlockRegistry.get_all_ids():
		var stable_id := BlockRegistry.get_stable_id(int(numeric_id))
		var compiled := ProductionCatalogue.resolve(stable_id)
		_expect(not compiled.is_empty(), "Block is compiled: %s" % stable_id)
		_expect(compiled.get("schema_id") == "leyforge.production.block",
			"Block uses the production Block schema: %s" % stable_id)
		_expect(int(compiled.get("facets", {}).get(
			"facet.identity", {}).get("numeric_id", -1)) == int(numeric_id),
			"Block numeric compatibility ID is preserved: %s" % stable_id)
		_expect(compiled.get("facets", {}).get(
			"facet.inventory", {}).get("projection_kind") == "block",
			"Block exposes an inventory projection: %s" % stable_id)
		_expect(str(compiled.get("source_hash", "")).length() == 64,
			"Block has canonical source evidence: %s" % stable_id)


func _test_items_and_identity_boundary() -> void:
	var block_ids := {}
	for numeric_id in BlockRegistry.get_all_ids():
		block_ids[BlockRegistry.get_stable_id(int(numeric_id))] = true
	for numeric_id in ItemRegistry.get_all_ids():
		var stable_id := ItemRegistry.get_stable_id(int(numeric_id))
		var compiled := ProductionCatalogue.resolve(stable_id)
		_expect(not compiled.is_empty(), "Item is compiled: %s" % stable_id)
		_expect(compiled.get("schema_id") == "leyforge.production.item",
			"Item uses the production Item schema: %s" % stable_id)
		_expect(int(compiled.get("facets", {}).get(
			"facet.identity", {}).get("numeric_id", -1)) == int(numeric_id),
			"Item numeric compatibility ID is preserved: %s" % stable_id)
		_expect(not block_ids.has(stable_id),
			"Item does not duplicate a canonical Block: %s" % stable_id)
		_expect(not stable_id.begins_with("item.block."),
			"Item is not a block-item proxy: %s" % stable_id)
		_expect(str(compiled.get("source_hash", "")).length() == 64,
			"Item has canonical source evidence: %s" % stable_id)
	var entries := _json_array(CONTENT_PATH)
	for entry in entries:
		if str(entry.get("type", "")) != "alias":
			continue
		var retired_id := str(entry.get("original_id", ""))
		_expect(ItemRegistry.get_id_by_stable_id(retired_id) < 0,
			"retired proxy is not an active Item: %s" % retired_id)
		_expect(BlockRegistry.legacy_item_projection(retired_id).get(
			"stable_id", "") == entry.get("replacement_stable_id", ""),
			"retired proxy projects to its canonical Block: %s" % retired_id)


func _test_recipe_conservation() -> void:
	for recipe_id in RecipeRegistry.get_all_recipe_ids():
		var source := RecipeRegistry.get_recipe(recipe_id)
		var compiled := ProductionCatalogue.resolve(recipe_id)
		_expect(not compiled.is_empty(), "Recipe is compiled: %s" % recipe_id)
		_expect(compiled.get("schema_id") == "leyforge.production.recipe",
			"Recipe uses the production Recipe schema: %s" % recipe_id)
		var facets: Dictionary = compiled.get("facets", {})
		var transformation: Dictionary = facets.get("facet.transformation", {})
		var conservation: Dictionary = facets.get("facet.conservation", {})
		_expect((transformation.get("inputs", []) as Array).size() \
			== (source.get("inputs", []) as Array).size(),
			"Recipe preserves every authoritative input: %s" % recipe_id)
		_expect((transformation.get("outputs", []) as Array).size() == 1,
			"Recipe declares its primary output: %s" % recipe_id)
		_expect(conservation.get("reservation_policy") == "exact_inputs",
			"Recipe reserves exact physical inputs: %s" % recipe_id)
		_expect(conservation.get("commit_policy") == "atomic_once",
			"Recipe commits exactly once: %s" % recipe_id)
		_expect(conservation.get("sink_policy") == "none",
			"Recipe has no undeclared material sink: %s" % recipe_id)
		var source_refs := _recipe_content_ids(source)
		var compiled_refs: Array = compiled.get("references", [])
		_expect(compiled_refs.size() == source_refs.size(),
			"Recipe references every physical input/output once: %s" % recipe_id)
		for stable_id in source_refs:
			_expect(ProductionCatalogue.has_definition(stable_id),
				"Recipe content resolves canonically: %s -> %s" % [
					recipe_id, stable_id])


func _test_capability_graph() -> void:
	var document := _json_dictionary(CAPABILITY_PATH)
	for node_value in document.get("nodes", []):
		var node: Dictionary = node_value
		var capability_id := str(node.get("id", ""))
		var compiled := ProductionCatalogue.resolve(capability_id)
		_expect(not compiled.is_empty(),
			"Capability is compiled: %s" % capability_id)
		_expect(compiled.get("schema_id") == "leyforge.production.capability",
			"Capability uses the production schema: %s" % capability_id)
		var graph_facet: Dictionary = compiled.get("facets", {}).get(
			"facet.capability_graph", {})
		_expect(int(graph_facet.get("ordinal", -1)) \
			== int(node.get("ordinal", -2)),
			"Capability ordinal is preserved: %s" % capability_id)
		_expect(graph_facet.get("requires", []) == node.get("requires", []),
			"Capability dependencies are preserved: %s" % capability_id)
		_expect(str(graph_facet.get("status", "")) == str(node.get("status", "")),
			"Capability admission status is explicit: %s" % capability_id)
		if str(node.get("status", "")) == "available":
			_expect(not (node.get("provider_refs", []) as Array).is_empty(),
				"available capability has a provider: %s" % capability_id)
		else:
			_expect((node.get("provider_refs", []) as Array).is_empty(),
				"planned capability does not claim a false provider: %s" \
				% capability_id)
		for provider_id in node.get("provider_refs", []):
			_expect(ProductionCatalogue.has_definition(str(provider_id)),
				"Capability provider resolves: %s -> %s" % [
					capability_id, provider_id])


func _recipe_content_ids(recipe: Dictionary) -> Array[String]:
	var ids: Array[String] = []
	for input_value in recipe.get("inputs", []):
		var stable_id := str((input_value as Dictionary).get("stable_id", ""))
		if stable_id not in ids:
			ids.append(stable_id)
	var output_id := str((recipe.get("output", {}) as Dictionary).get(
		"stable_id", ""))
	if output_id not in ids:
		ids.append(output_id)
	ids.sort()
	return ids


func _json_array(path: String) -> Array[Dictionary]:
	var parsed = JSON.parse_string(FileAccess.get_file_as_string(path))
	var result: Array[Dictionary] = []
	if parsed is Array:
		for value in parsed:
			if value is Dictionary:
				result.append(value)
	return result


func _json_dictionary(path: String) -> Dictionary:
	var parsed = JSON.parse_string(FileAccess.get_file_as_string(path))
	return parsed if parsed is Dictionary else {}


func _expect(condition: bool, message: String) -> void:
	checks += 1
	if not condition:
		failures.append(message)

