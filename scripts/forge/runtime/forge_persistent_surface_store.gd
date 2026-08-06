class_name ForgePersistentSurfaceStore
extends RefCounted
## Bounded, mergeable and save-v17-compatible persistent presentation store.

const STATE_VERSION := 1
const SAVE_VERSION := 17

var _layers: Dictionary = {}
var _records: Dictionary = {}


func load_and_validate(layers: Array[ForgeSurfaceLayer]) -> Dictionary:
	_layers.clear()
	_records.clear()
	var diagnostics: Array[Dictionary] = []
	for layer in layers:
		if layer == null or layer.stable_id.is_empty() or _layers.has(layer.stable_id):
			diagnostics.append(_diag("SRC-001", "error", "",
				"Persistent surface layer is missing or duplicated."))
			continue
		if layer.maximum_records_per_chunk <= 0 \
				or layer.maximum_records_per_chunk > 1024:
			diagnostics.append(_diag("BUD-001", "error", layer.stable_id,
				"Persistent surface record budget is unsafe."))
		if layer.persistence_policy == "persistent" \
				and layer.save_policy != "v17_optional_record":
			diagnostics.append(_diag("SRC-001", "error", layer.stable_id,
				"Persistent surface layer lacks the v17 optional save policy."))
		_layers[layer.stable_id] = layer
	return {"ok": diagnostics.is_empty(), "diagnostics": diagnostics,
		"layer_count": _layers.size()}


func apply_layer(layer_id: String, owner_id: String, chunk_key: String,
		position: Vector3, intensity: float, tick: int, seed := 0,
		metadata: Dictionary = {}) -> Dictionary:
	var layer: ForgeSurfaceLayer = _layers.get(layer_id)
	if layer == null:
		return {"ok": false, "diagnostic": _diag(
			"SRC-001", "error", layer_id, "Surface layer is not registered.")}
	var merge_key := _merge_key(layer_id, owner_id, chunk_key, position)
	var existing_id := _record_id_for_merge_key(merge_key)
	if not existing_id.is_empty():
		var existing: ForgePersistentSurfaceRecord = _records[existing_id]
		match layer.merge_policy:
			"replace_weaker":
				existing.intensity = maxf(existing.intensity, clampf(intensity, 0.0, 1.0))
			"accumulate_clamped":
				existing.intensity = clampf(existing.intensity + intensity, 0.0, 1.0)
			_:
				existing.intensity = clampf(intensity, 0.0, 1.0)
		existing.expires_tick = _expiry_tick(layer, tick)
		existing.metadata.merge(metadata, true)
		return {"ok": true, "merged": true, "record": existing,
			"record_id": existing.record_id}
	_evict_chunk_if_needed(layer, chunk_key)
	var record := ForgePersistentSurfaceRecord.new()
	record.record_id = "surface.record.%s" % ForgeStableRecord.hash_record({
		"layer": layer_id, "owner": owner_id, "chunk": chunk_key,
		"position": [position.x, position.y, position.z], "seed": seed,
	}).substr(0, 20)
	record.layer_id = layer_id
	record.owner_id = owner_id
	record.chunk_key = chunk_key
	record.position = position
	record.intensity = clampf(intensity, 0.0, 1.0)
	record.created_tick = tick
	record.expires_tick = _expiry_tick(layer, tick)
	record.seed = seed
	record.metadata = metadata.duplicate(true)
	_records[record.record_id] = record
	return {"ok": true, "merged": false, "record": record,
		"record_id": record.record_id}


func advance(current_tick: int) -> int:
	var expired: Array[String] = []
	for record_id in _records:
		var record: ForgePersistentSurfaceRecord = _records[record_id]
		if record.expires_tick > 0 and record.expires_tick <= current_tick:
			expired.append(record_id)
	for record_id in expired:
		_records.erase(record_id)
	return expired.size()


func serialize_state() -> Dictionary:
	var records: Array[Dictionary] = []
	var ids: Array[String] = []
	for record_id in _records:
		ids.append(str(record_id))
	ids.sort()
	for record_id in ids:
		var record: ForgePersistentSurfaceRecord = _records[record_id]
		var layer: ForgeSurfaceLayer = _layers.get(record.layer_id)
		if layer != null and layer.save_policy == "v17_optional_record":
			records.append(record.to_record())
	return {"schema": "leyforge.forge.persistent-surface-state",
		"schema_version": STATE_VERSION, "save_version": SAVE_VERSION,
		"records": records}


func restore_state(state: Variant) -> bool:
	_records.clear()
	if state == null or (state is Dictionary and state.is_empty()):
		return true
	if not state is Dictionary:
		return false
	if int(state.get("schema_version", STATE_VERSION)) != STATE_VERSION \
			or int(state.get("save_version", SAVE_VERSION)) != SAVE_VERSION:
		return false
	var records_value: Variant = state.get("records", [])
	if not records_value is Array or records_value.size() > 32768:
		return false
	for value in records_value:
		if not value is Dictionary:
			continue
		var layer_id := str(value.get("layer_id", ""))
		var layer: ForgeSurfaceLayer = _layers.get(layer_id)
		if layer == null or layer.save_policy != "v17_optional_record":
			continue
		var record := ForgePersistentSurfaceRecord.new()
		record.record_id = str(value.get("record_id", ""))
		if not ForgeId.is_valid(record.record_id, "surface.record.") \
				or _records.has(record.record_id):
			continue
		record.layer_id = layer_id
		record.owner_id = str(value.get("owner_id", ""))
		record.chunk_key = str(value.get("chunk_key", ""))
		record.position = _vector3(value.get("position", [0, 0, 0]))
		record.intensity = clampf(float(value.get("intensity", 0.0)), 0.0, 1.0)
		record.created_tick = int(value.get("created_tick", 0))
		record.expires_tick = int(value.get("expires_tick", 0))
		record.seed = int(value.get("seed", 0))
		record.metadata = value.get("metadata", {}).duplicate(true)
		_records[record.record_id] = record
	return true


func filtered_list(layer_id := "", chunk_key := "") -> Array[ForgePersistentSurfaceRecord]:
	var result: Array[ForgePersistentSurfaceRecord] = []
	for record in _records.values():
		if (layer_id.is_empty() or record.layer_id == layer_id) \
				and (chunk_key.is_empty() or record.chunk_key == chunk_key):
			result.append(record)
	result.sort_custom(func(a: ForgePersistentSurfaceRecord,
			b: ForgePersistentSurfaceRecord) -> bool: return a.record_id < b.record_id)
	return result


func canonical_hash() -> String:
	return ForgeStableRecord.hash_json_record(serialize_state())


func _evict_chunk_if_needed(layer: ForgeSurfaceLayer, chunk_key: String) -> void:
	var same_chunk := filtered_list(layer.stable_id, chunk_key)
	if same_chunk.size() < layer.maximum_records_per_chunk:
		return
	same_chunk.sort_custom(func(a: ForgePersistentSurfaceRecord,
			b: ForgePersistentSurfaceRecord) -> bool:
		return a.intensity < b.intensity if not is_equal_approx(a.intensity, b.intensity) \
			else a.created_tick < b.created_tick)
	_records.erase(same_chunk[0].record_id)


func _record_id_for_merge_key(merge_key: String) -> String:
	for record_id in _records:
		var record: ForgePersistentSurfaceRecord = _records[record_id]
		if _merge_key(record.layer_id, record.owner_id,
				record.chunk_key, record.position) == merge_key:
			return record_id
	return ""


func _merge_key(layer_id: String, owner_id: String,
		chunk_key: String, position: Vector3) -> String:
	return "%s|%s|%s|%.2f|%.2f|%.2f" % [layer_id, owner_id, chunk_key,
		position.x, position.y, position.z]


func _expiry_tick(layer: ForgeSurfaceLayer, tick: int) -> int:
	return tick + int(ceil(layer.expiry_seconds)) \
		if layer.expiry_seconds > 0.0 else 0


func _vector3(value: Variant) -> Vector3:
	if value is Array and value.size() >= 3:
		return Vector3(float(value[0]), float(value[1]), float(value[2]))
	return Vector3.ZERO


func _diag(code: String, severity: String, target_id: String,
		message: String) -> Dictionary:
	return {"code": code, "severity": severity,
		"target_id": target_id, "message": message}
