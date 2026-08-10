class_name ForgeCoverageLedgerService
extends RefCounted
## Loads and validates the Documents 20-23 production coverage ledger.

const LEDGER_PATH := "res://content/forge/catalogues/doc20_23_coverage_ledger.json"
const ALLOWED_STATES := [
	"planned_new_work", "authored", "validated", "baked", "review_ready",
	"approved", "changes_requested",
]

func load_ledger(path := LEDGER_PATH) -> Dictionary:
	if not FileAccess.file_exists(path): return {}
	var file := FileAccess.open(path, FileAccess.READ)
	if file == null: return {}
	var parsed: Variant = JSON.parse_string(file.get_as_text())
	return parsed if parsed is Dictionary else {}

func validate(ledger: Dictionary) -> Dictionary:
	var diagnostics: Array[Dictionary] = []
	var seen := {}
	for record_value in ledger.get("records", []):
		var record: Dictionary = record_value
		var target_id := str(record.get("target_id", ""))
		if target_id.is_empty(): diagnostics.append(_error("EFC-LEDGER-001", target_id, "Target ID is required."))
		elif seen.has(target_id): diagnostics.append(_error("EFC-LEDGER-002", target_id, "Duplicate target ID."))
		seen[target_id] = true
		if str(record.get("status", "")) not in ALLOWED_STATES:
			diagnostics.append(_error("EFC-LEDGER-003", target_id, "Unknown lifecycle state."))
		for field in ["category", "source_paths", "dependency_ids", "runtime_product_paths",
				"bake_receipt_paths", "approval_batch_id", "fallback_ids", "evidence_paths"]:
			if not record.has(field): diagnostics.append(_error("EFC-LEDGER-004", target_id, "Missing required ledger field: %s." % field))
	return {"ok": diagnostics.is_empty(), "diagnostics": diagnostics, "record_count": seen.size()}

func records_for_batch(ledger: Dictionary, batch_id: String) -> Array[Dictionary]:
	var result: Array[Dictionary] = []
	for value in ledger.get("records", []):
		var record: Dictionary = value
		if str(record.get("approval_batch_id", "")) == batch_id: result.append(record.duplicate(true))
	return result

func _error(code: String, target_id: String, message: String) -> Dictionary:
	return {"code": code, "severity": "error", "target_id": target_id, "message": message}
