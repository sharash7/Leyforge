class_name ForgeVfxGraphCompiler
extends RefCounted
## Flattens validated VFX graphs into bounded runtime instructions.

var _graphs: Dictionary = {}
var _forms: Dictionary = {}
var _definitions: Dictionary = {}
var diagnostics: Array[Dictionary] = []


func load_and_validate(
		graphs: Array[ForgeVfxGraph], forms: Array[ForgeVfxForm],
		definitions: Array[ForgeVfxDefinition]) -> Dictionary:
	_graphs.clear()
	_forms.clear()
	_definitions.clear()
	diagnostics.clear()
	var validator := ForgePresentationValidationService.new()
	_register(graphs, _graphs, "vfx_graph", validator)
	_register(forms, _forms, "vfx_form", validator)
	_register(definitions, _definitions, "vfx_effect", validator)
	for definition in _definitions.values():
		if not _graphs.has(definition.graph_id):
			diagnostics.append(_diagnostic(
				"VFX-002", "error", definition.stable_id,
				"VFX graph dependency is missing."))
		for form_id in definition.form_ids:
			if not _forms.has(form_id):
				diagnostics.append(_diagnostic(
					"VFX-001", "error", definition.stable_id,
					"VFX voxel form dependency is missing."))
	return {"ok": diagnostics.is_empty(), "graph_count": _graphs.size(),
		"form_count": _forms.size(), "definition_count": _definitions.size(),
		"diagnostics": diagnostics.duplicate(true)}


func has(definition_id: String) -> bool:
	return _definitions.has(definition_id)


func resolve(definition_id: String) -> Dictionary:
	var definition := _definitions.get(definition_id) as ForgeVfxDefinition
	return definition.to_record() if definition != null else {}


func filtered_list() -> Array[Dictionary]:
	var result: Array[Dictionary] = []
	for definition in _definitions.values():
		result.append((definition as ForgeVfxDefinition).to_record())
	result.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		return str(a.get("stable_id", "")) < str(b.get("stable_id", "")))
	return result


func compile(definition_id: String) -> Dictionary:
	var definition := _definitions.get(definition_id) as ForgeVfxDefinition
	if definition == null:
		return {"ok": false, "diagnostics": [_diagnostic(
			"VFX-002", "error", definition_id, "VFX definition is unavailable.")]}
	var graph := _graphs.get(definition.graph_id) as ForgeVfxGraph
	if graph == null:
		return {"ok": false, "diagnostics": [_diagnostic(
			"VFX-002", "error", definition_id, "VFX graph is unavailable.")]}
	var ordered := _topological_nodes(graph)
	if ordered.is_empty() and not graph.nodes.is_empty():
		return {"ok": false, "diagnostics": [_diagnostic(
			"VFX-002", "error", definition_id,
			"VFX graph cannot compile because it contains a cycle.")]}
	var product := ForgeCompiledVfxProduct.new()
	product.product_id = "runtime.vfx.%s" % definition.stable_id.trim_prefix("vfx.")
	product.source_definition_id = definition.stable_id
	product.source_hash = definition.canonical_hash()
	product.backend = graph.backend_hint
	product.instructions = ordered
	product.maximum_spawn_count = graph.maximum_spawn_count
	product.maximum_lifetime_seconds = graph.maximum_lifetime_seconds
	product.maximum_instances = definition.maximum_instances
	product.lifecycle_policy = definition.lifecycle_policy
	product.lod_tiers = definition.lod_tiers.duplicate(true)
	product.budget_profile_id = definition.budget_profile_id
	product.accessibility_profile_id = definition.accessibility_profile_id
	product.fallback_ids = definition.fallback_ids
	product.dependency_hashes[graph.stable_id] = graph.canonical_hash()
	for form_id in definition.form_ids:
		var form := _forms.get(form_id) as ForgeVfxForm
		if form != null:
			product.form_records.append(form.to_record())
			product.dependency_hashes[form_id] = form.canonical_hash()
	for instruction in ordered:
		match str(instruction.get("type", "")):
			"light_request":
				product.light_request_count += int(instruction.get("maximum", 1))
			"surface_write":
				product.surface_request_count += int(instruction.get("maximum", 1))
	product.light_request_count = mini(product.light_request_count, 4)
	product.surface_request_count = mini(product.surface_request_count, 64)
	product.seal()
	return {"ok": true, "product": product,
		"product_hash": product.product_hash, "diagnostics": []}


func compile_all() -> Dictionary:
	var products: Array[ForgeCompiledVfxProduct] = []
	var failures: Array[Dictionary] = []
	var ids: Array = _definitions.keys()
	ids.sort()
	for definition_id in ids:
		var result := compile(str(definition_id))
		if bool(result.get("ok", false)):
			products.append(result.product)
		else:
			failures.append_array(result.get("diagnostics", []))
	return {"ok": failures.is_empty(), "products": products,
		"diagnostics": failures}


func _register(values: Array, target: Dictionary, expected_class: String,
		validator: ForgePresentationValidationService) -> void:
	for value in values:
		if value == null or target.has(value.stable_id):
			diagnostics.append(_diagnostic(
				"REG-001", "critical", "", "%s is empty or duplicated." % expected_class))
			continue
		for diagnostic in validator.validate(value):
			diagnostics.append(diagnostic.to_record())
		target[value.stable_id] = value


func _topological_nodes(graph: ForgeVfxGraph) -> Array[Dictionary]:
	var by_id := {}
	var indegree := {}
	var outgoing := {}
	for node in graph.nodes:
		var node_id := str(node.get("id", ""))
		by_id[node_id] = node
		indegree[node_id] = 0
		outgoing[node_id] = []
	for edge in graph.edges:
		var from_id := str(edge.get("from", ""))
		var to_id := str(edge.get("to", ""))
		outgoing[from_id].append(to_id)
		indegree[to_id] = int(indegree[to_id]) + 1
	var ready: Array[String] = []
	for node_id in indegree:
		if int(indegree[node_id]) == 0:
			ready.append(node_id)
	ready.sort()
	var result: Array[Dictionary] = []
	while not ready.is_empty():
		var node_id: String = ready.pop_front()
		var instruction: Dictionary = by_id[node_id].duplicate(true)
		instruction["order"] = result.size()
		result.append(instruction)
		var targets: Array = outgoing[node_id]
		targets.sort()
		for target_id in targets:
			indegree[target_id] = int(indegree[target_id]) - 1
			if int(indegree[target_id]) == 0:
				ready.append(target_id)
		ready.sort()
	return result if result.size() == graph.nodes.size() else []


func _diagnostic(code: String, severity: String, target_id: String,
		message: String) -> Dictionary:
	return {"code": code, "severity": severity,
		"target_id": target_id, "message": message}
