class_name ForgeMaterialResponseResolver
extends RefCounted
## Deterministic material/action/environment response with safe fallback.

var _tables: Dictionary = {}
var diagnostics: Array[Dictionary] = []


func load_and_validate(tables: Array[ForgeMaterialResponseTable]) -> Dictionary:
	_tables.clear()
	diagnostics.clear()
	for table in tables:
		if table == null or _tables.has(table.stable_id):
			diagnostics.append(_diagnostic(
				"REG-001", "critical", "", "Response table is empty or duplicated."))
			continue
		for diagnostic in ForgePresentationValidationService.new().validate(table):
			diagnostics.append(diagnostic.to_record())
		_tables[table.stable_id] = table
	return {"ok": diagnostics.is_empty(), "table_count": _tables.size(),
		"diagnostics": diagnostics.duplicate(true)}


func has(table_id: String) -> bool:
	return _tables.has(table_id)


func resolve_source(table_id: String) -> Dictionary:
	var table := _tables.get(table_id) as ForgeMaterialResponseTable
	return table.to_record() if table != null else {}


func filtered_list() -> Array[Dictionary]:
	var result: Array[Dictionary] = []
	for table in _tables.values():
		result.append((table as ForgeMaterialResponseTable).to_record())
	result.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		return str(a.get("stable_id", "")) < str(b.get("stable_id", "")))
	return result


func resolve(table_id: String, context: Dictionary) -> Dictionary:
	var table := _tables.get(table_id) as ForgeMaterialResponseTable
	if table == null:
		return {"ok": false, "diagnostics": [_diagnostic(
			"REG-003", "error", table_id, "Material response table is unavailable.")]}
	var candidates: Array[Dictionary] = []
	for index in table.response_records.size():
		var record: Dictionary = table.response_records[index]
		var score := _score(record, context)
		if score >= 0:
			candidates.append({"record": record, "score": score, "index": index})
	candidates.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		if int(a.score) != int(b.score):
			return int(a.score) > int(b.score)
		return int(a.index) < int(b.index))
	var result := {"ok": true, "table_id": table_id,
		"context": context.duplicate(true), "fallback_order": Array(
			table.material_fallback_order)}
	if candidates.is_empty():
		result["profile_id"] = table.default_profile_id
		result["quality"] = "safe_default"
		result["matched_record"] = {}
	else:
		result["profile_id"] = str(candidates[0].record.get(
			"profile_id", table.default_profile_id))
		result["quality"] = "exact" if int(candidates[0].score) >= 600 else "fallback"
		result["matched_record"] = candidates[0].record.duplicate(true)
	result["resolution_hash"] = ForgeStableRecord.hash_record(result)
	return result


func _score(record: Dictionary, context: Dictionary) -> int:
	var score := 0
	var selectors := ["action", "surface", "target_family", "wetness_band",
		"environment", "state", "intensity_band"]
	for selector in selectors:
		if not record.has(selector):
			continue
		if str(record[selector]) == "any":
			score += 10
			continue
		if not context.has(selector) or str(record[selector]) != str(context[selector]):
			return -1
		score += 100
	return score


func _diagnostic(code: String, severity: String, target_id: String,
		message: String) -> Dictionary:
	return {"code": code, "severity": severity,
		"target_id": target_id, "message": message}
