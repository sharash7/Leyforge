class_name ForgeOverrideResolver
extends RefCounted
## Deterministic field-level resolver with provenance and safe fallback.

const LAYER_RANK := {
	"base": 0,
	"project": 10,
	"content_pack": 20,
	"world": 30,
	"preview": 40,
}


func resolve(
		base_record: Dictionary, overrides: Array[ForgeOverrideDefinition],
		fallback_record: Dictionary = {}) -> Dictionary:
	var resolved := base_record.duplicate(true)
	var provenance := {}
	var diagnostics: Array[Dictionary] = []
	for key in resolved:
		provenance[key] = {"layer": "base", "source_id": "base"}
	var ordered := overrides.duplicate()
	ordered.sort_custom(func(a: ForgeOverrideDefinition, b: ForgeOverrideDefinition) -> bool:
		var a_rank := int(LAYER_RANK.get(a.source_layer, 999))
		var b_rank := int(LAYER_RANK.get(b.source_layer, 999))
		if a_rank != b_rank:
			return a_rank < b_rank
		if a.priority != b.priority:
			return a.priority < b.priority
		return a.override_id < b.override_id)
	var last_field_owner := {}
	for override in ordered:
		if not override.enabled or override.status in ["rejected", "disabled"]:
			continue
		for field in override.field_operations:
			var owner_key := "%s:%d:%s" % [
				override.source_layer, override.priority, field]
			if last_field_owner.has(owner_key):
				diagnostics.append({
					"code": "FORGE-OVR-001",
					"severity": "error",
					"field": field,
					"message": "Equal-priority overrides conflict.",
					"candidates": [
						last_field_owner[owner_key], override.override_id],
				})
				continue
			last_field_owner[owner_key] = override.override_id
			var operation: Variant = override.field_operations[field]
			var result := _apply_operation(resolved, str(field), operation)
			if not bool(result["ok"]):
				diagnostics.append(result["diagnostic"])
				if fallback_record.has(field):
					resolved[field] = fallback_record[field]
					provenance[field] = {
						"layer": "fallback",
						"source_id": "last_valid",
					}
				continue
			provenance[field] = {
				"layer": override.source_layer,
				"source_id": override.override_id,
				"pack_id": override.source_pack_id,
				"priority": override.priority,
			}
	return {
		"record": resolved,
		"provenance": provenance,
		"diagnostics": diagnostics,
		"ok": diagnostics.filter(func(value: Dictionary) -> bool:
			return str(value.get("severity", "")) in [
				"error", "critical"]).is_empty(),
	}


func select_variant(
		variant_set: ForgeVariantSet, stable_context: String,
		explicit_variant_id := "") -> Dictionary:
	if variant_set == null or variant_set.entries.is_empty():
		return {}
	if not explicit_variant_id.is_empty():
		for entry in variant_set.entries:
			if str(entry.get("variant_id", "")) == explicit_variant_id:
				return entry.duplicate(true)
	var eligible: Array[Dictionary] = []
	var total_weight := 0.0
	for entry in variant_set.entries:
		var weight := maxf(0.0, float(entry.get("weight", 1.0)))
		if weight <= 0.0:
			continue
		eligible.append(entry)
		total_weight += weight
	if eligible.is_empty():
		return {}
	var hash_text := "%s|%s|%s" % [
		variant_set.variant_set_id, variant_set.seed_salt, stable_context]
	var sample := float(hash_text.sha256_text().substr(0, 8).hex_to_int()) \
		/ float(0xffffffff)
	var cursor := sample * total_weight
	for entry in eligible:
		cursor -= maxf(0.0, float(entry.get("weight", 1.0)))
		if cursor <= 0.0:
			return entry.duplicate(true)
	return eligible.back().duplicate(true)


func revert_field(
		override: ForgeOverrideDefinition, field: String) -> bool:
	if override == null or not override.field_operations.has(field):
		return false
	override.field_operations.erase(field)
	override.source_revision += 1
	return true


func _apply_operation(
		record: Dictionary, field: String, operation: Variant) -> Dictionary:
	var op := "replace"
	var value: Variant = operation
	if operation is Dictionary and operation.has("op"):
		op = str(operation.get("op", "replace"))
		value = operation.get("value")
	match op:
		"inherit":
			return {"ok": true}
		"replace":
			record[field] = value
		"clear":
			record.erase(field)
		"merge":
			if not record.get(field) is Dictionary or not value is Dictionary:
				return _operation_error(field, "Merge requires dictionaries.")
			var merged: Dictionary = record[field].duplicate(true)
			for key in value:
				merged[key] = value[key]
			record[field] = merged
		"append":
			if not record.get(field) is Array or not value is Array:
				return _operation_error(field, "Append requires arrays.")
			var appended: Array = record[field].duplicate(true)
			appended.append_array(value)
			record[field] = appended
		_:
			return _operation_error(field, "Unsupported override operation %s." % op)
	return {"ok": true}


func _operation_error(field: String, message: String) -> Dictionary:
	return {
		"ok": false,
		"diagnostic": {
			"code": "FORGE-OVR-002",
			"severity": "error",
			"field": field,
			"message": message,
		},
	}
