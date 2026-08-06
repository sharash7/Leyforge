class_name ForgeBlueprintCompiler
extends RefCounted
## Deterministically flattens blueprint modules into replaceable runtime data.

var _blueprints: Array[ForgeBlueprintDefinition] = []
var _modules: Dictionary = {}
var _states_by_blueprint: Dictionary = {}
var _diagnostics: Array[Dictionary] = []


func load_and_validate(
		blueprints: Array[ForgeBlueprintDefinition],
		modules: Array[ForgeBlueprintModuleDefinition],
		states: Array[ForgeBlueprintStateDefinition]) -> Dictionary:
	_blueprints = blueprints.duplicate()
	_modules.clear()
	_states_by_blueprint.clear()
	_diagnostics.clear()
	for module in modules:
		if module == null or module.module_id.is_empty() \
				or _modules.has(module.module_id):
			_diagnostics.append(_diag(
				"EFB-ID-001", "critical", "", "Blueprint module ID is missing or duplicated."))
			continue
		_modules[module.module_id] = module
	for state in states:
		if state == null:
			continue
		var records: Array = _states_by_blueprint.get(state.blueprint_id, [])
		records.append(state)
		_states_by_blueprint[state.blueprint_id] = records
	var blueprint_ids := {}
	for blueprint in _blueprints:
		if blueprint == null or blueprint.blueprint_id.is_empty() \
				or blueprint_ids.has(blueprint.blueprint_id):
			_diagnostics.append(_diag(
				"EFB-ID-001", "critical", "", "Blueprint source ID is missing or duplicated."))
			continue
		blueprint_ids[blueprint.blueprint_id] = true
		for module_id in blueprint.module_ids:
			if not _modules.has(module_id):
				_diagnostics.append(_diag(
					"EFB-DEP-001", "error", blueprint.blueprint_id,
					"Blueprint module dependency is missing: %s" % module_id))
		for element in blueprint.elements:
			if element != null and not element.module_id.is_empty() \
					and not _modules.has(element.module_id):
				_diagnostics.append(_diag(
					"EFB-DEP-001", "error", blueprint.blueprint_id,
					"Blueprint element module is missing: %s" % element.module_id))
	return {"ok": _diagnostics.is_empty(),
		"diagnostics": _diagnostics.duplicate(true)}


func compile_all() -> Dictionary:
	if not _diagnostics.is_empty():
		return {"ok": false, "diagnostics": _diagnostics.duplicate(true),
			"products": []}
	var products: Array[ForgeBlueprintRuntimeProduct] = []
	for blueprint in _blueprints:
		var result := compile(blueprint.blueprint_id)
		if not bool(result.get("ok", false)):
			return {"ok": false, "diagnostics": result.get("diagnostics", []),
				"products": products}
		products.append(result.product)
	products.sort_custom(func(a: ForgeBlueprintRuntimeProduct,
			b: ForgeBlueprintRuntimeProduct) -> bool:
		return a.product_id < b.product_id)
	return {"ok": true, "diagnostics": [], "products": products,
		"deterministic_hash": _products_hash(products)}


func compile(blueprint_id: String) -> Dictionary:
	var blueprint: ForgeBlueprintDefinition
	for candidate in _blueprints:
		if candidate.blueprint_id == blueprint_id:
			blueprint = candidate
			break
	if blueprint == null:
		return {"ok": false, "diagnostics": [_diag(
			"EFB-DEP-001", "error", blueprint_id, "Blueprint source is missing.")]}
	var flattened: Array[Dictionary] = []
	for element in blueprint.elements:
		if element == null:
			continue
		if element.module_id.is_empty():
			flattened.append(element.to_record())
		else:
			var module: ForgeBlueprintModuleDefinition = _modules.get(element.module_id)
			for module_element in module.elements:
				if module_element == null:
					continue
				var record := module_element.to_record()
				record["element_id"] = "%s/%s" % [element.element_id,
					module_element.element_id]
				var local_position: Array = record.get("position", [0, 0, 0])
				record["position"] = [
					int(local_position[0]) + element.position.x,
					int(local_position[1]) + element.position.y,
					int(local_position[2]) + element.position.z]
				record["rotation_quarters"] = posmod(
					int(record.get("rotation_quarters", 0)) + element.rotation_quarters, 4)
				record["module_id"] = element.module_id
				flattened.append(record)
	flattened.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		return str(a.get("element_id", "")) < str(b.get("element_id", "")))
	var stage_records: Array[Dictionary] = []
	for delta in blueprint.construction_deltas:
		if delta != null:
			stage_records.append(delta.to_record())
	stage_records.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		return str(a.get("stage_id", "")) < str(b.get("stage_id", "")))
	var state_records: Array[Dictionary] = []
	for state_value in _states_by_blueprint.get(blueprint.blueprint_id, []):
		var state: ForgeBlueprintStateDefinition = state_value
		state_records.append(state.to_record())
	state_records.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		return str(a.get("state_id", "")) < str(b.get("state_id", "")))
	var product := ForgeBlueprintRuntimeProduct.new()
	product.product_id = "runtime.blueprint.%s" % blueprint.blueprint_id.trim_prefix(
		"blueprint.")
	product.blueprint_id = blueprint.blueprint_id
	product.compiled_elements = flattened
	product.construction_stage_records = stage_records
	product.state_records = state_records
	product.material_bindings = (
		blueprint.material_role_set.role_bindings.duplicate(true)
		if blueprint.material_role_set != null else {})
	product.placement_record = (
		blueprint.placement_profile.to_record()
		if blueprint.placement_profile != null else {})
	product.legacy_fallback = blueprint.legacy_fallback
	product.dependency_ids = blueprint.dependency_ids.duplicate()
	product.source_hash = ForgeStableRecord.hash_record({
		"blueprint": blueprint.to_record(),
		"modules": _module_hashes(blueprint),
		"states": state_records})
	return {"ok": true, "diagnostics": [], "product": product}


func _module_hashes(blueprint: ForgeBlueprintDefinition) -> Dictionary:
	var result := {}
	var ids: Array[String] = []
	for module_id in blueprint.module_ids:
		ids.append(module_id)
	for element in blueprint.elements:
		if element != null and not element.module_id.is_empty() \
				and element.module_id not in ids:
			ids.append(element.module_id)
	ids.sort()
	for module_id in ids:
		var module: ForgeBlueprintModuleDefinition = _modules.get(module_id)
		if module != null:
			result[module_id] = module.canonical_hash()
	return result


func _products_hash(products: Array[ForgeBlueprintRuntimeProduct]) -> String:
	var hashes: Array[String] = []
	for product in products:
		hashes.append(product.canonical_hash())
	return ForgeStableRecord.hash_record({"products": hashes})


func _diag(code: String, severity: String, target_id: String,
		message: String) -> Dictionary:
	return {"code": code, "severity": severity,
		"target_id": target_id, "message": message}
