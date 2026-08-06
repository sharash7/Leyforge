class_name ForgeBlueprintRuntimeAssembler
extends RefCounted
## Stable-ID factory and reconstruction boundary for blueprint products.

var _products: Dictionary = {}
var _aliases: Dictionary = {}


func load_and_validate(products: Array[ForgeBlueprintRuntimeProduct]) -> Dictionary:
	_products.clear()
	_aliases.clear()
	var diagnostics: Array[Dictionary] = []
	for product in products:
		if product == null or product.product_id.is_empty() \
				or _products.has(product.product_id):
			diagnostics.append({"code": "EFB-ID-001", "severity": "critical",
				"target_id": "", "message": "Blueprint runtime product is missing or duplicated."})
			continue
		_products[product.product_id] = product
		for alias_id in product.aliases:
			if _products.has(alias_id) or _aliases.has(alias_id):
				diagnostics.append({"code": "EFB-ID-001", "severity": "critical",
					"target_id": alias_id, "message": "Blueprint runtime alias is ambiguous."})
			else:
				_aliases[alias_id] = product.product_id
	return {"ok": diagnostics.is_empty(), "diagnostics": diagnostics,
		"product_count": _products.size()}


func resolve(product_id: String) -> ForgeBlueprintRuntimeProduct:
	var canonical := ForgeId.canonical_id(product_id, _aliases)
	return _products.get(canonical)


func has(product_id: String) -> bool:
	return resolve(product_id) != null


func filtered_list(blueprint_prefix := "") -> Array[ForgeBlueprintRuntimeProduct]:
	var result: Array[ForgeBlueprintRuntimeProduct] = []
	for product in _products.values():
		if blueprint_prefix.is_empty() or product.blueprint_id.begins_with(blueprint_prefix):
			result.append(product)
	result.sort_custom(func(a: ForgeBlueprintRuntimeProduct,
			b: ForgeBlueprintRuntimeProduct) -> bool:
		return a.product_id < b.product_id)
	return result


func instantiate(product_id: String, instance_id: String,
		stage := "complete", state := "", seed := 0) -> ForgeBlueprintRuntimeInstance:
	var product := resolve(product_id)
	if product == null:
		return null
	var instance := ForgeBlueprintRuntimeInstance.new()
	var report := instance.configure(product, instance_id, stage, state, seed)
	return instance if bool(report.get("ok", false)) else null


func restore(snapshot: ForgeBlueprintInstanceSnapshot) -> ForgeBlueprintRuntimeInstance:
	if snapshot == null:
		return null
	var instance := instantiate(snapshot.product_id, snapshot.instance_id,
		snapshot.construction_stage_id, snapshot.state_id, snapshot.seed)
	if instance == null:
		return null
	instance.ownership_id = snapshot.ownership_id
	var record := snapshot.transform_record
	instance.position = _vector3(record.get("origin", [0, 0, 0]))
	instance.rotation = _vector3(record.get("rotation", [0, 0, 0]))
	instance.scale = _vector3(record.get("scale", [1, 1, 1]))
	return instance


func _vector3(value: Variant) -> Vector3:
	if value is Array and value.size() >= 3:
		return Vector3(float(value[0]), float(value[1]), float(value[2]))
	return Vector3.ZERO
