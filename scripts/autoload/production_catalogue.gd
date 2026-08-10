extends Node
## Runtime projection of the existing canonical registries through the
## production registry compiler. Numeric IDs remain compatibility indexes;
## stable IDs, pack ownership and compiled records are authoritative here.

signal catalogue_rebuilt(report: Dictionary)

const CONTENT_PATH := "res://data/registry/voxel_registry.json"
const CAPABILITY_PATH := "res://data/registry/core_capability_graph.json"

const PACKS: Array[Dictionary] = [
	{"pack_id": "pack.core.items", "version": "1.0.0", "dependencies": []},
	{"pack_id": "pack.core.blocks", "version": "1.0.0",
		"dependencies": ["pack.core.items"]},
	{"pack_id": "pack.core.recipes", "version": "1.0.0",
		"dependencies": ["pack.core.blocks"]},
	{"pack_id": "pack.core.progression", "version": "1.0.0",
		"dependencies": ["pack.core.recipes"]},
]

var _kernel := ProductionRegistryKernel.new()
var _compilation: Dictionary = {}
var _validation: Dictionary = {}
var _definitions: Dictionary = {}
var _source_counts: Dictionary = {}
var _block_registry: Node
var _item_registry: Node
var _recipe_registry: Node


func _ready() -> void:
	var report := rebuild()
	if not bool(report.get("ok", false)):
		push_error("ProductionCatalogue: compilation failed: %s" \
			% report.get("failures", []))
		return
	print("ProductionCatalogue: compiled %d definitions (%s)" % [
		definition_count(), catalogue_hash().left(12)])


func rebuild() -> Dictionary:
	_kernel = ProductionRegistryKernel.new()
	_compilation.clear()
	_validation.clear()
	_definitions.clear()
	_source_counts.clear()
	var failures: Array[String] = []
	_resolve_runtime_registries(failures)
	_register_schemas(failures)
	var entries := _read_array_file(CONTENT_PATH, failures)
	var capability_document := _read_dictionary_file(CAPABILITY_PATH, failures)
	if not failures.is_empty():
		return _failed_report(failures)

	var content_ids := {}
	var blocks: Array[Dictionary] = []
	var items: Array[Dictionary] = []
	var aliases: Array[Dictionary] = []
	for entry in entries:
		var kind := str(entry.get("type", ""))
		if kind in ["block", "item"]:
			content_ids[str(entry.get("original_id", ""))] = kind
		if kind == "block":
			blocks.append(entry)
		elif kind == "item":
			items.append(entry)
		elif kind == "alias":
			aliases.append(entry)

	var provider_roles := _build_provider_roles(blocks)
	var recipes: Array[Dictionary] = []
	for recipe_id in _recipe_registry.get_all_recipe_ids():
		var recipe: Dictionary = _recipe_registry.get_recipe(recipe_id)
		recipes.append(recipe)
		var output: Dictionary = recipe.get("output", {})
		_append_provider_role(provider_roles,
			str(output.get("stable_id", "")), "recipe:%s" % recipe_id)

	var definitions: Array[Dictionary] = []
	for entry in blocks:
		definitions.append(_block_definition(entry, content_ids))
	for entry in items:
		definitions.append(_item_definition(entry, provider_roles))
	for recipe in recipes:
		definitions.append(_recipe_definition(recipe))
	var capability_nodes := _dictionary_array(
		capability_document.get("nodes", []))
	for node in capability_nodes:
		definitions.append(_capability_definition(node))

	_source_counts = {
		"blocks": blocks.size(),
		"items": items.size(),
		"aliases": aliases.size(),
		"recipes": recipes.size(),
		"capabilities": capability_nodes.size(),
	}
	_validation = _validate_sources(
		blocks, items, aliases, recipes, capability_nodes, definitions)
	if not bool(_validation.get("ok", false)):
		return _failed_report(_validation.get("failures", []))
	_compilation = _kernel.compile_catalogue(PACKS, definitions)
	if not bool(_compilation.get("ok", false)):
		for diagnostic in _compilation.get("diagnostics", []):
			failures.append("%s:%s" % [
				diagnostic.get("code", "compile_error"),
				diagnostic.get("target_id", "")])
		return _failed_report(failures)
	var activation := _kernel.activate_compilation(_compilation)
	if not bool(activation.get("ok", false)):
		return _failed_report([str(activation.get("error", "activation_failed"))])
	for compiled_value in _compilation.get("compiled_definitions", []):
		var compiled: Dictionary = compiled_value
		_definitions[str(compiled.get("qualified_id", ""))] = compiled
	var report := status_report()
	catalogue_rebuilt.emit(report)
	return report


func status_report() -> Dictionary:
	return {
		"ok": bool(_compilation.get("ok", false)) \
			and bool(_validation.get("ok", false)),
		"catalogue_hash": catalogue_hash(),
		"definition_count": definition_count(),
		"pack_order": pack_order(),
		"source_counts": _source_counts.duplicate(true),
		"validation": _validation.duplicate(true),
		"failures": _validation.get("failures", []).duplicate(),
	}


func catalogue_hash() -> String:
	return str(_compilation.get("catalogue_hash", ""))


func definition_count() -> int:
	return _definitions.size()


func pack_order() -> Array:
	return Array(_compilation.get("pack_order", [])).duplicate()


func source_counts() -> Dictionary:
	return _source_counts.duplicate(true)


func validation_report() -> Dictionary:
	return _validation.duplicate(true)


func has_definition(qualified_id: String) -> bool:
	return _definitions.has(qualified_id)


func resolve(qualified_id: String) -> Dictionary:
	return (_definitions.get(qualified_id, {}) as Dictionary).duplicate(true)


func all_definition_ids() -> Array[String]:
	var ids: Array[String] = []
	for qualified_id in _definitions:
		ids.append(str(qualified_id))
	ids.sort()
	return ids


func serialize_registry_state() -> Dictionary:
	return _kernel.serialize_state()


func _resolve_runtime_registries(failures: Array[String]) -> void:
	_block_registry = get_node_or_null("/root/BlockRegistry")
	_item_registry = get_node_or_null("/root/ItemRegistry")
	_recipe_registry = get_node_or_null("/root/RecipeRegistry")
	for pair in [["BlockRegistry", _block_registry],
			["ItemRegistry", _item_registry],
			["RecipeRegistry", _recipe_registry]]:
		if pair[1] == null:
			failures.append("missing_runtime_registry:%s" % pair[0])


func _register_schemas(failures: Array[String]) -> void:
	var schemas: Array[Dictionary] = [
		{"id": "leyforge.production.block", "facets": [
			"facet.identity", "facet.inventory", "facet.presentation",
			"facet.resource_provenance"]},
		{"id": "leyforge.production.item", "facets": [
			"facet.identity", "facet.inventory", "facet.presentation",
			"facet.resource_provenance", "facet.capability"]},
		{"id": "leyforge.production.recipe", "facets": [
			"facet.transformation", "facet.conservation",
			"facet.resource_provenance"]},
		{"id": "leyforge.production.capability", "facets": [
			"facet.capability_graph"]},
	]
	for schema in schemas:
		var result := _kernel.register_schema(
			str(schema.id), 1, PackedStringArray(schema.facets))
		if not bool(result.get("ok", false)):
			failures.append("schema:%s:%s" % [
				schema.id, result.get("error", "registration_failed")])


func _build_provider_roles(blocks: Array[Dictionary]) -> Dictionary:
	var roles := {}
	for entry in blocks:
		var numeric_id := int(entry.get("numeric_id", -1))
		var profile: Dictionary = _block_registry.get_harvest_profile(numeric_id)
		_append_provider_role(roles, str(profile.get("drop_id", "")),
			"world_harvest:%s" % entry.get("original_id", ""))
	return roles


func _append_provider_role(roles: Dictionary, target_id: String,
		role: String) -> void:
	if target_id.is_empty():
		return
	if not roles.has(target_id):
		roles[target_id] = []
	if role not in roles[target_id]:
		roles[target_id].append(role)


func _block_definition(entry: Dictionary, content_ids: Dictionary) -> Dictionary:
	var stable_id := str(entry.get("original_id", ""))
	var numeric_id := int(entry.get("numeric_id", -1))
	var harvest: Dictionary = _block_registry.get_harvest_profile(numeric_id)
	var references: Array[String] = []
	var drop_id := str(harvest.get("drop_id", ""))
	if not drop_id.is_empty() and drop_id != stable_id and content_ids.has(drop_id):
		references.append(drop_id)
	return {
		"qualified_id": stable_id,
		"owner_pack": "pack.core.blocks",
		"schema_id": "leyforge.production.block",
		"schema_version": 1,
		"facets": {
			"facet.identity": {"kind": "block", "numeric_id": numeric_id,
				"unique_id": str(entry.get("unique_id", ""))},
			"facet.inventory": {"projection_kind": "block",
				"recoverable": str(harvest.get("drop_kind", "")) == "block"
				and drop_id == stable_id},
			"facet.presentation": {
				"display_name": str(entry.get("display_name", "")),
				"color_hex": str(entry.get("color_hex", ""))},
			"facet.resource_provenance": {
				"provider_class": "world_block",
				"harvest_output": {"kind": harvest.get("drop_kind", ""),
					"stable_id": drop_id,
					"count": int(harvest.get("drop_count", 0))}},
		},
		"payload": {"category": str(entry.get("category", "")),
			"schematic_tags": Array(entry.get("schematic_tags", [])).duplicate(),
			"harvest_contract": harvest.duplicate(true),
			"identity_status": "legacy_stable_compatible"},
		"references": references,
	}


func _item_definition(entry: Dictionary, provider_roles: Dictionary) -> Dictionary:
	var stable_id := str(entry.get("original_id", ""))
	var numeric_id := int(entry.get("numeric_id", -1))
	var roles: Array = provider_roles.get(stable_id, []).duplicate()
	roles.sort()
	var tool_profile: Dictionary = _item_registry.get_tool_profile(numeric_id)
	return {
		"qualified_id": stable_id,
		"owner_pack": "pack.core.items",
		"schema_id": "leyforge.production.item",
		"schema_version": 1,
		"facets": {
			"facet.identity": {"kind": "item", "numeric_id": numeric_id,
				"unique_id": str(entry.get("unique_id", ""))},
			"facet.inventory": {"max_stack": _item_registry.get_max_stack(numeric_id),
				"instance_state": not tool_profile.is_empty()},
			"facet.presentation": {
				"display_name": str(entry.get("display_name", "")),
				"color_hex": str(entry.get("color_hex", ""))},
			"facet.resource_provenance": {
				"provider_roles": roles,
				"admission_status": "runtime_provider" if not roles.is_empty()
				else "catalogue_only"},
			"facet.capability": {"tool_profile": tool_profile},
		},
		"payload": {"category": str(entry.get("category", "")),
			"schematic_tags": Array(entry.get("schematic_tags", [])).duplicate(),
			"identity_status": "legacy_stable_compatible"},
		"references": [],
	}


func _recipe_definition(recipe: Dictionary) -> Dictionary:
	var inputs: Array[Dictionary] = []
	var references: Array[String] = []
	for input_value in recipe.get("inputs", []):
		var input: Dictionary = input_value
		inputs.append(_typed_content_ref(input))
		_append_unique_reference(references, str(input.get("stable_id", "")))
	var output: Dictionary = recipe.get("output", {})
	var typed_output := _typed_content_ref(output)
	_append_unique_reference(references, str(output.get("stable_id", "")))
	references.sort()
	return {
		"qualified_id": str(recipe.get("id", "")),
		"owner_pack": "pack.core.recipes",
		"schema_id": "leyforge.production.recipe",
		"schema_version": 1,
		"facets": {
			"facet.transformation": {"inputs": inputs,
				"outputs": [typed_output], "byproducts": []},
			"facet.conservation": {
				"profile_id": "conservation.core.atomic_transform",
				"reservation_policy": "exact_inputs",
				"commit_policy": "atomic_once",
				"sink_policy": "none",
				"state_transfer": "recipe_declared"},
			"facet.resource_provenance": {
				"output_provenance": "recipe_transaction",
				"source_recipe_id": str(recipe.get("id", ""))},
		},
		"payload": {"display_name": str(recipe.get("name", "")),
			"station": str(recipe.get("station", "")),
			"known_start": bool(recipe.get("known_start", false)),
			"seconds": float(recipe.get("seconds", 0.0)),
			"mana_cost": float(recipe.get("mana_cost", 0.0))},
		"references": references,
	}


func _typed_content_ref(content_ref: Dictionary) -> Dictionary:
	var kind := str(content_ref.get("kind", ""))
	return {"reference_type": "block_projection_ref" if kind == "block"
		else "item_ref", "kind": kind,
		"stable_id": str(content_ref.get("stable_id", "")),
		"quantity": int(content_ref.get("count", 0)), "unit_class": "count"}


func _capability_definition(node: Dictionary) -> Dictionary:
	var references: Array[String] = []
	for field in ["requires", "provider_refs", "fallback_refs"]:
		for value in node.get(field, []):
			_append_unique_reference(references, str(value))
	references.sort()
	return {
		"qualified_id": str(node.get("id", "")),
		"owner_pack": "pack.core.progression",
		"schema_id": "leyforge.production.capability",
		"schema_version": 1,
		"facets": {"facet.capability_graph": {
			"ordinal": int(node.get("ordinal", -1)),
			"status": str(node.get("status", "planned")),
			"requires": Array(node.get("requires", [])).duplicate(),
			"provider_refs": Array(node.get("provider_refs", [])).duplicate(),
			"fallback_refs": Array(node.get("fallback_refs", [])).duplicate()}},
		"payload": {"display_name": str(node.get("display_name", "")),
			"graph_id": "capability.graph.core.production"},
		"references": references,
	}


func _validate_sources(blocks: Array[Dictionary], items: Array[Dictionary],
		aliases: Array[Dictionary], recipes: Array[Dictionary],
		capabilities: Array[Dictionary], definitions: Array[Dictionary]) -> Dictionary:
	var failures: Array[String] = []
	var warnings: Array[String] = []
	var block_ids := {}
	var item_ids := {}
	for block in blocks:
		block_ids[str(block.get("original_id", ""))] = true
	for item in items:
		var stable_id := str(item.get("original_id", ""))
		item_ids[stable_id] = true
		if block_ids.has(stable_id) or stable_id.begins_with("item.block."):
			failures.append("recoverable_block_item_duplicate:%s" % stable_id)
	for alias in aliases:
		var retired_id := str(alias.get("original_id", ""))
		if item_ids.has(retired_id):
			failures.append("retired_alias_is_active_item:%s" % retired_id)

	for recipe in recipes:
		var recipe_id := str(recipe.get("id", ""))
		if (recipe.get("inputs", []) as Array).is_empty():
			failures.append("recipe_has_no_inputs:%s" % recipe_id)
		for input in recipe.get("inputs", []):
			if int((input as Dictionary).get("count", 0)) <= 0:
				failures.append("recipe_nonpositive_input:%s" % recipe_id)
		if int((recipe.get("output", {}) as Dictionary).get("count", 0)) <= 0:
			failures.append("recipe_nonpositive_output:%s" % recipe_id)

	var capability_graph_records: Array[Dictionary] = []
	var ordinals := {}
	var planned_capabilities := 0
	for capability in capabilities:
		var capability_id := str(capability.get("id", ""))
		var ordinal := int(capability.get("ordinal", -1))
		if ordinals.has(ordinal):
			failures.append("duplicate_capability_ordinal:%d" % ordinal)
		ordinals[ordinal] = true
		if str(capability.get("status", "")) == "available" \
				and (capability.get("provider_refs", []) as Array).is_empty():
			failures.append("available_capability_has_no_provider:%s" \
				% capability_id)
		if str(capability.get("status", "")) == "planned":
			planned_capabilities += 1
		capability_graph_records.append({"source_id": capability_id,
			"dependency_ids": capability.get("requires", [])})
	var graph := ForgeDependencyGraph.new()
	var graph_report := graph.rebuild(capability_graph_records)
	if not (graph_report.get("cycles", []) as Array).is_empty():
		failures.append("capability_dependency_cycle")
	if planned_capabilities > 0:
		warnings.append("planned_capabilities_without_runtime_provider:%d" \
			% planned_capabilities)
	var catalogue_only_items := 0
	for definition in definitions:
		if str(definition.get("schema_id", "")) != "leyforge.production.item":
			continue
		var provenance: Dictionary = definition.get("facets", {}).get(
			"facet.resource_provenance", {})
		if str(provenance.get("admission_status", "")) == "catalogue_only":
			catalogue_only_items += 1
	if catalogue_only_items > 0:
		warnings.append("catalogue_only_items_without_runtime_provider:%d" \
			% catalogue_only_items)

	return {"ok": failures.is_empty(), "failures": failures,
		"warnings": warnings, "definition_source_count": definitions.size(),
		"recipe_conservation_contracts": recipes.size(),
		"capability_nodes": capabilities.size(),
		"planned_capabilities": planned_capabilities,
		"catalogue_only_items": catalogue_only_items}


func _append_unique_reference(references: Array[String], value: String) -> void:
	if not value.is_empty() and value not in references:
		references.append(value)


func _read_array_file(path: String, failures: Array[String]) -> Array[Dictionary]:
	var parsed = _read_json(path, failures)
	return _dictionary_array(parsed if parsed is Array else [])


func _read_dictionary_file(path: String,
		failures: Array[String]) -> Dictionary:
	var parsed = _read_json(path, failures)
	return parsed if parsed is Dictionary else {}


func _read_json(path: String, failures: Array[String]) -> Variant:
	if not FileAccess.file_exists(path):
		failures.append("missing_source:%s" % path)
		return null
	var parsed = JSON.parse_string(FileAccess.get_file_as_string(path))
	if parsed == null:
		failures.append("invalid_json:%s" % path)
	return parsed


func _dictionary_array(values: Array) -> Array[Dictionary]:
	var result: Array[Dictionary] = []
	for value in values:
		if value is Dictionary:
			result.append((value as Dictionary).duplicate(true))
	return result


func _failed_report(failures: Array) -> Dictionary:
	return {"ok": false, "failures": failures.duplicate(),
		"source_counts": _source_counts.duplicate(true)}
