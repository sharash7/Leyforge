class_name ForgeWorldPresentationStateService
extends RefCounted
## Optional save-v17 presentation state; gameplay systems remain authoritative.

const STATE_VERSION := 1
const SAVE_VERSION := 17

var surface_store := ForgePersistentSurfaceStore.new()
var _products: Dictionary = {}
var _instances: Dictionary = {}
var _aliases: Dictionary = {}
var _acoustic_portal_states: Dictionary = {}


func load_project_sources(
		root := "res://content/forge/runtime/set22_23_stage5") -> Dictionary:
	var blueprints: Array[ForgeBlueprintDefinition] = []
	var modules: Array[ForgeBlueprintModuleDefinition] = []
	var states: Array[ForgeBlueprintStateDefinition] = []
	var layers: Array[ForgeSurfaceLayer] = []
	_scan_sources(root, blueprints, modules, states, layers)
	var canonical_cottage := ResourceLoader.load(
		"res://content/forge/blueprints/blueprint_golden_small_forest_cottage.tres",
		"", ResourceLoader.CACHE_MODE_IGNORE)
	if canonical_cottage is ForgeBlueprintDefinition:
		blueprints.append(canonical_cottage)
	var foundation_wetness := ResourceLoader.load(
		"res://content/forge/presentation/set23/foundation/" \
		+ "surface_layer_environment_wetness_foundation.tres",
		"", ResourceLoader.CACHE_MODE_IGNORE)
	if foundation_wetness is ForgeSurfaceLayer:
		layers.append(foundation_wetness)
	var compiler := ForgeBlueprintCompiler.new()
	var source_report := compiler.load_and_validate(blueprints, modules, states)
	if not bool(source_report.get("ok", false)):
		return source_report
	var compiled := compiler.compile_all()
	if not bool(compiled.get("ok", false)):
		return compiled
	var products: Array[ForgeBlueprintRuntimeProduct] = []
	products.assign(compiled.get("products", []))
	var configured := configure(products, layers)
	configured["source_hash"] = str(compiled.get("deterministic_hash", ""))
	return configured


func configure(products: Array[ForgeBlueprintRuntimeProduct],
		layers: Array[ForgeSurfaceLayer], aliases: Dictionary = {}) -> Dictionary:
	reset()
	_aliases = aliases.duplicate(true)
	var diagnostics: Array[Dictionary] = []
	for product in products:
		if product == null or product.product_id.is_empty() \
				or _products.has(product.product_id):
			diagnostics.append({"code": "EFB-ID-001", "severity": "critical",
				"message": "World presentation product is missing or duplicated."})
		else:
			_products[product.product_id] = product
	var surface_report := surface_store.load_and_validate(layers)
	diagnostics.append_array(surface_report.get("diagnostics", []))
	return {"ok": diagnostics.is_empty(), "diagnostics": diagnostics,
		"product_count": _products.size(),
		"layer_count": int(surface_report.get("layer_count", 0))}


func reset() -> void:
	_products.clear()
	_instances.clear()
	_aliases.clear()
	_acoustic_portal_states.clear()
	surface_store = ForgePersistentSurfaceStore.new()


func register_instance(snapshot: ForgeBlueprintInstanceSnapshot) -> bool:
	if snapshot == null or snapshot.instance_id.is_empty():
		return false
	var product_id := ForgeId.canonical_id(snapshot.product_id, _aliases)
	if not _products.has(product_id):
		return false
	snapshot.product_id = product_id
	snapshot.blueprint_id = (_products[product_id] as ForgeBlueprintRuntimeProduct).blueprint_id
	_instances[snapshot.instance_id] = snapshot
	return true


func update_instance(instance_id: String, construction_stage_id: String,
		state_id: String) -> bool:
	var snapshot: ForgeBlueprintInstanceSnapshot = _instances.get(instance_id)
	if snapshot == null:
		return false
	snapshot.construction_stage_id = construction_stage_id
	snapshot.state_id = state_id
	return true


func set_portal_state(graph_id: String, portal_id: String, openness: float) -> void:
	_acoustic_portal_states["%s|%s" % [graph_id, portal_id]] = clampf(openness, 0.0, 1.0)


func resolve(instance_id: String) -> ForgeBlueprintInstanceSnapshot:
	return _instances.get(instance_id)


func has(instance_id: String) -> bool:
	return _instances.has(instance_id)


func filtered_list(blueprint_id := "") -> Array[ForgeBlueprintInstanceSnapshot]:
	var result: Array[ForgeBlueprintInstanceSnapshot] = []
	for snapshot in _instances.values():
		if blueprint_id.is_empty() or snapshot.blueprint_id == blueprint_id:
			result.append(snapshot)
	result.sort_custom(func(a: ForgeBlueprintInstanceSnapshot,
			b: ForgeBlueprintInstanceSnapshot) -> bool:
		return a.instance_id < b.instance_id)
	return result


func serialize_state() -> Dictionary:
	var records: Array[Dictionary] = []
	for snapshot in filtered_list():
		records.append(snapshot.to_record())
	var portal_keys: Array[String] = []
	for key in _acoustic_portal_states:
		portal_keys.append(str(key))
	portal_keys.sort()
	var portal_states := {}
	for key in portal_keys:
		portal_states[key] = _acoustic_portal_states[key]
	return {"schema": "leyforge.forge.world-presentation-state",
		"schema_version": STATE_VERSION, "save_version": SAVE_VERSION,
		"blueprint_instances": records,
		"persistent_surfaces": surface_store.serialize_state(),
		"acoustic_portal_states": portal_states}


func restore_state(state: Variant) -> bool:
	_instances.clear()
	_acoustic_portal_states.clear()
	if state == null or (state is Dictionary and state.is_empty()):
		return surface_store.restore_state({})
	if not state is Dictionary:
		return false
	if int(state.get("schema_version", STATE_VERSION)) != STATE_VERSION \
			or int(state.get("save_version", SAVE_VERSION)) != SAVE_VERSION:
		return false
	var values: Variant = state.get("blueprint_instances", [])
	if not values is Array or values.size() > 16384:
		return false
	for value in values:
		if not value is Dictionary:
			continue
		var product_id := ForgeId.canonical_id(str(value.get("product_id", "")), _aliases)
		if not _products.has(product_id):
			continue
		var snapshot := ForgeBlueprintInstanceSnapshot.new()
		snapshot.instance_id = str(value.get("instance_id", ""))
		if snapshot.instance_id.is_empty() or _instances.has(snapshot.instance_id):
			continue
		snapshot.product_id = product_id
		snapshot.blueprint_id = (_products[product_id] as ForgeBlueprintRuntimeProduct).blueprint_id
		snapshot.construction_stage_id = str(value.get(
			"construction_stage_id", "complete"))
		snapshot.state_id = str(value.get("state_id", ""))
		snapshot.transform_record = value.get("transform_record", {}).duplicate(true)
		snapshot.portal_states = value.get("portal_states", {}).duplicate(true)
		snapshot.ownership_id = str(value.get("ownership_id", ""))
		snapshot.seed = int(value.get("seed", 0))
		_instances[snapshot.instance_id] = snapshot
	var portals: Variant = state.get("acoustic_portal_states", {})
	if portals is Dictionary:
		for key in portals:
			_acoustic_portal_states[str(key)] = clampf(float(portals[key]), 0.0, 1.0)
	return surface_store.restore_state(state.get("persistent_surfaces", {}))


func canonical_hash() -> String:
	return ForgeStableRecord.hash_json_record(serialize_state())


func acoustic_portal_states() -> Dictionary:
	return _acoustic_portal_states.duplicate(true)


func _scan_sources(root: String,
		blueprints: Array[ForgeBlueprintDefinition],
		modules: Array[ForgeBlueprintModuleDefinition],
		states: Array[ForgeBlueprintStateDefinition],
		layers: Array[ForgeSurfaceLayer]) -> void:
	var directory := DirAccess.open(root)
	if directory == null:
		return
	for file_name in DirAccess.get_files_at(root):
		if not file_name.ends_with(".tres"):
			continue
		var resource := ResourceLoader.load(
			root.path_join(file_name), "", ResourceLoader.CACHE_MODE_IGNORE)
		if resource is ForgeBlueprintDefinition:
			blueprints.append(resource)
		elif resource is ForgeBlueprintModuleDefinition:
			modules.append(resource)
		elif resource is ForgeBlueprintStateDefinition:
			states.append(resource)
		elif resource is ForgeSurfaceLayer:
			layers.append(resource)
	for directory_name in DirAccess.get_directories_at(root):
		_scan_sources(root.path_join(directory_name),
			blueprints, modules, states, layers)
