class_name ForgeVfxRuntimeManager
extends Node3D
## CPU/MultiMesh bounded VFX execution with pooling, LOD, and virtualisation.

var budget_manager: ForgePresentationBudgetManager
var _products: Dictionary = {}
var _active: Dictionary = {}
var _pool: Array[MultiMeshInstance3D] = []
var _surface_records: Array[Dictionary] = []
var diagnostics: Array[Dictionary] = []


func load_and_validate(
		products: Array[ForgeCompiledVfxProduct],
		p_budget_manager: ForgePresentationBudgetManager) -> Dictionary:
	_products.clear()
	_clear_active()
	budget_manager = p_budget_manager
	diagnostics.clear()
	if budget_manager == null:
		diagnostics.append(_diagnostic(
			"BUD-001", "critical", "", "VFX budget manager is missing."))
	for product in products:
		if product == null or _products.has(product.source_definition_id) \
				or product.product_hash.length() != 64 \
				or product.product_hash != ForgeStableRecord.hash_record(
					product.to_record(false)):
			diagnostics.append(_diagnostic(
				"VFX-002", "error", "", "Compiled VFX product is invalid or duplicated."))
			continue
		_products[product.source_definition_id] = product
	return {"ok": diagnostics.is_empty(), "product_count": _products.size(),
		"diagnostics": diagnostics.duplicate(true)}


func has(effect_id: String) -> bool:
	return _products.has(effect_id)


func resolve(effect_id: String) -> Dictionary:
	var product := _products.get(effect_id) as ForgeCompiledVfxProduct
	return product.to_record() if product != null else {}


func filtered_list() -> Array[Dictionary]:
	var result: Array[Dictionary] = []
	for product in _products.values():
		result.append((product as ForgeCompiledVfxProduct).to_record())
	result.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		return str(a.get("source_definition_id", "")) < str(
			b.get("source_definition_id", "")))
	return result


func play(
		ownership_key: String, effect_id: String, world_transform: Transform3D,
		parameters: Dictionary = {}, deterministic_seed := 0,
		options: Dictionary = {}) -> Dictionary:
	if _active.has(ownership_key):
		return update(ownership_key, parameters, world_transform)
	var product := _products.get(effect_id) as ForgeCompiledVfxProduct
	if product == null or ownership_key.is_empty():
		return {"ok": false, "diagnostics": [_diagnostic(
			"VFX-002", "error", effect_id, "Compiled VFX product is unavailable.")]}
	var lod := _lod_for(product, float(options.get("distance_meters", 0.0)))
	var requested := _requested_spawn(product, parameters, lod)
	var critical := bool(options.get("critical", false))
	var particle_budget := budget_manager.request(
		"%s|particles" % ownership_key, "particles", requested, critical)
	var light_budget := budget_manager.request(
		"%s|lights" % ownership_key, "lights",
		product.light_request_count, critical)
	var surface_budget := budget_manager.request(
		"%s|surface" % ownership_key, "surface_records",
		product.surface_request_count, critical)
	var particle_count := int(particle_budget.get("granted", 0))
	var virtualised := lod == "hidden" or particle_count == 0
	var instance: MultiMeshInstance3D
	if not virtualised:
		instance = _acquire_instance()
		instance.name = "ForgeVfx_%s" % ForgeId.safe_filename(ownership_key)
		instance.transform = world_transform
		_configure_multimesh(instance, product, particle_count, deterministic_seed)
		instance.visible = true
	var light: OmniLight3D
	if int(light_budget.get("granted", 0)) > 0 and not virtualised:
		light = OmniLight3D.new()
		light.name = "ForgeVfxLight"
		light.light_color = Color(1.0, 0.48, 0.18)
		light.light_energy = clampf(float(parameters.get("intensity", 1.0)), 0.0, 2.0)
		light.omni_range = clampf(float(parameters.get("light_radius", 2.5)), 0.1, 6.0)
		light.shadow_enabled = false
		add_child(light)
		light.transform = world_transform
	var surface_count := int(surface_budget.get("granted", 0))
	for index in surface_count:
		_surface_records.append({"ownership_key": ownership_key,
			"effect_id": effect_id, "record_index": index,
			"position": world_transform.origin,
			"strength": clampf(float(parameters.get("intensity", 1.0)), 0.0, 1.0)})
	var record := {"ownership_key": ownership_key, "effect_id": effect_id,
		"product": product, "instance": instance, "light": light,
		"parameters": parameters.duplicate(true), "seed": deterministic_seed,
		"age": 0.0, "phase": 0.0, "lod": lod,
		"particle_count": particle_count, "surface_count": surface_count,
		"virtualised": virtualised, "quality": particle_budget.get("quality", "full"),
		"world_transform": world_transform}
	_active[ownership_key] = record
	return _public_record(record)


func update(
		ownership_key: String, parameters: Dictionary,
		world_transform: Transform3D = Transform3D.IDENTITY) -> Dictionary:
	if not _active.has(ownership_key):
		return {"ok": false, "reason": "ownership_key_not_active"}
	var record: Dictionary = _active[ownership_key]
	record.parameters.merge(parameters, true)
	if world_transform != Transform3D.IDENTITY:
		record.world_transform = world_transform
		var instance := record.get("instance") as MultiMeshInstance3D
		if instance != null:
			instance.transform = world_transform
		var light := record.get("light") as OmniLight3D
		if light != null:
			light.transform = world_transform
	_active[ownership_key] = record
	return _public_record(record)


func stop(ownership_key: String) -> Dictionary:
	if not _active.has(ownership_key):
		return {"ok": true, "stopped": false}
	var record: Dictionary = _active[ownership_key]
	_release_record(record)
	_active.erase(ownership_key)
	return {"ok": true, "stopped": true, "ownership_key": ownership_key}


func advance(delta_seconds: float) -> Dictionary:
	var stopped: Array[String] = []
	if delta_seconds < 0.0:
		return {"ok": false, "stopped": stopped}
	var keys: Array = _active.keys()
	keys.sort()
	for ownership_key in keys:
		var record: Dictionary = _active[ownership_key]
		var product := record.product as ForgeCompiledVfxProduct
		record.age = float(record.age) + delta_seconds
		record.phase = fposmod(float(record.phase) + delta_seconds,
			maxf(product.maximum_lifetime_seconds, 0.001))
		if product.lifecycle_policy == "one_shot" \
				and float(record.age) >= product.maximum_lifetime_seconds:
			stop(str(ownership_key))
			stopped.append(str(ownership_key))
			continue
		_active[ownership_key] = record
	return {"ok": true, "active_count": _active.size(), "stopped": stopped,
		"snapshot_hash": snapshot().runtime_hash}


func snapshot() -> Dictionary:
	var records: Array[Dictionary] = []
	for record in _active.values():
		records.append(_public_record(record))
	records.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		return str(a.get("ownership_key", "")) < str(b.get("ownership_key", "")))
	var surfaces := _surface_records.duplicate(true)
	surfaces.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		return "%s:%s" % [a.ownership_key, a.record_index] < "%s:%s" % [
			b.ownership_key, b.record_index])
	var result := {"active": records, "surface_records": surfaces,
		"pool_size": _pool.size(), "budget": budget_manager.snapshot()}
	result["runtime_hash"] = ForgeStableRecord.hash_record(result)
	return result


func _requested_spawn(
		product: ForgeCompiledVfxProduct, parameters: Dictionary,
		lod: String) -> int:
	var requested := 1
	for instruction in product.instructions:
		if str(instruction.get("type", "")) in ["bounded_spawn", "emitter"]:
			requested = maxi(requested, int(instruction.get("maximum", 1)))
	requested = mini(requested, product.maximum_spawn_count)
	requested = mini(requested, product.maximum_instances)
	requested = int(round(requested * clampf(
		float(parameters.get("intensity", 1.0)), 0.05, 1.0)))
	var scale := 1.0 if lod == "near" else 0.5 if lod == "mid" else 0.2
	return maxi(1, int(round(requested * scale))) if lod != "hidden" else 0


func _lod_for(product: ForgeCompiledVfxProduct, distance: float) -> String:
	if distance >= 96.0:
		return "hidden"
	if distance >= 48.0:
		return "far"
	if distance >= 20.0:
		return "mid"
	return "near"


func _acquire_instance() -> MultiMeshInstance3D:
	var instance: MultiMeshInstance3D
	if _pool.is_empty():
		instance = MultiMeshInstance3D.new()
		add_child(instance)
	else:
		instance = _pool.pop_back()
	return instance


func _configure_multimesh(
		instance: MultiMeshInstance3D, product: ForgeCompiledVfxProduct,
		count: int, seed: int) -> void:
	var multimesh := MultiMesh.new()
	multimesh.transform_format = MultiMesh.TRANSFORM_3D
	var cube := BoxMesh.new()
	cube.size = Vector3.ONE * 0.08
	var material := StandardMaterial3D.new()
	material.albedo_color = Color(0.72, 0.62, 0.48, 0.9)
	material.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	cube.material = material
	multimesh.mesh = cube
	multimesh.instance_count = count
	var random := RandomNumberGenerator.new()
	random.seed = seed
	for index in count:
		var offset := Vector3(random.randf_range(-0.35, 0.35),
			random.randf_range(0.0, 0.55), random.randf_range(-0.35, 0.35))
		multimesh.set_instance_transform(index, Transform3D(Basis.IDENTITY, offset))
	instance.multimesh = multimesh
	instance.set_meta("forge_vfx_product_id", product.product_id)


func _public_record(record: Dictionary) -> Dictionary:
	var product := record.product as ForgeCompiledVfxProduct
	var result := {"ok": true, "ownership_key": record.ownership_key,
		"effect_id": record.effect_id, "product_id": product.product_id,
		"product_hash": product.product_hash, "parameters": record.parameters.duplicate(true),
		"seed": record.seed, "age": record.age, "phase": record.phase,
		"lod": record.lod, "particle_count": record.particle_count,
		"surface_count": record.surface_count, "virtualised": record.virtualised,
		"quality": record.quality,
		"position": (record.world_transform as Transform3D).origin}
	result["instance_hash"] = ForgeStableRecord.hash_record(result)
	return result


func _release_record(record: Dictionary) -> void:
	var instance := record.get("instance") as MultiMeshInstance3D
	if instance != null:
		instance.visible = false
		instance.multimesh = null
		_pool.append(instance)
	var light := record.get("light") as OmniLight3D
	if light != null:
		light.free()
	var key := str(record.ownership_key)
	budget_manager.release("%s|particles" % key)
	budget_manager.release("%s|lights" % key)
	budget_manager.release("%s|surface" % key)
	_surface_records = _surface_records.filter(func(surface: Dictionary) -> bool:
		return str(surface.get("ownership_key", "")) != key)


func _clear_active() -> void:
	for record in _active.values():
		_release_record(record)
	_active.clear()


func _diagnostic(code: String, severity: String, target_id: String,
		message: String) -> Dictionary:
	return {"code": code, "severity": severity,
		"target_id": target_id, "message": message}
