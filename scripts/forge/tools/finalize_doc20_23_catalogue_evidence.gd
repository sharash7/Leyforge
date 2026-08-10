@tool
extends SceneTree
## Produces deterministic, non-authorable runtime envelopes and bake receipts
## after the structure/entity and VFX/audio catalogue generators have run.

const LEDGER_PATH := "res://content/forge/catalogues/doc20_23_coverage_ledger.json"
const PRODUCT_ROOT := "res://generated/forge/runtime/catalogue"
const RECEIPT_ROOT := "res://generated/forge/creator_receipts/doc20_23"
const CANONICAL_PRODUCT_SCRIPT := preload(
	"res://scripts/forge/domain/forge_canonical_runtime_product.gd")

var _failures: Array[String] = []
var _products := 0
var _receipts := 0


func _init() -> void:
	DirAccess.make_dir_recursive_absolute(ProjectSettings.globalize_path(PRODUCT_ROOT))
	DirAccess.make_dir_recursive_absolute(ProjectSettings.globalize_path(RECEIPT_ROOT))
	var ledger := _read_json(LEDGER_PATH)
	var records: Array = ledger.get("records", [])
	for index in records.size():
		var record: Dictionary = records[index]
		_finalize_record(record)
		records[index] = record
	ledger.records = records
	if _failures.is_empty():
		_write_json_atomic(LEDGER_PATH, ledger)
	print("DOC20_23_CATALOGUE_EVIDENCE %s" % JSON.stringify({
		"ok": _failures.is_empty(), "records": records.size(),
		"products": _products, "receipts": _receipts, "failures": _failures}))
	quit(0 if _failures.is_empty() else 1)


func _finalize_record(record: Dictionary) -> void:
	var target_id := str(record.get("target_id", ""))
	var source_paths := PackedStringArray(record.get("source_paths", []))
	if target_id.is_empty() or source_paths.is_empty():
		_failures.append("Ledger target has no identity or source: %s" % target_id)
		return
	var first_hashes := _source_hashes(source_paths)
	var second_hashes := _source_hashes(source_paths)
	if first_hashes.is_empty() or first_hashes != second_hashes:
		_failures.append("Two-pass source bake mismatch: %s" % target_id)
		return
	var combined_hash := ForgeStableRecord.hash_record({"sources": first_hashes})
	var slug := ForgeId.safe_filename(target_id)
	var product: Resource = CANONICAL_PRODUCT_SCRIPT.new()
	product.product_id = "runtime.catalogue.%s" % slug
	product.source_id = target_id
	product.source_paths = source_paths
	product.source_hashes = first_hashes
	product.combined_source_hash = combined_hash
	product.dependency_ids = PackedStringArray(record.get("dependency_ids", []))
	var product_path := "%s/%s.tres" % [PRODUCT_ROOT, slug]
	if not _save(product, product_path): return
	_products += 1
	var reloaded_product := ResourceLoader.load(
		product_path, "", ResourceLoader.CACHE_MODE_IGNORE)
	if reloaded_product == null or not reloaded_product.has_method("canonical_hash") \
			or reloaded_product.canonical_hash() != product.canonical_hash():
		_failures.append("Runtime product read-back mismatch: %s" % target_id)
		return
	var receipt := ForgeCreatorBakeReceipt.new()
	receipt.receipt_id = "receipt.creator.catalogue.%s" % slug
	receipt.source_id = target_id
	receipt.source_type_id = "catalogue.%s" % str(record.get("studio", "shared"))
	receipt.source_hash = combined_hash
	receipt.product_kind = "canonical_runtime_source"
	receipt.product_paths = PackedStringArray([product_path])
	receipt.product_hashes = {product_path: product.canonical_hash()}
	receipt.validation_summary = {
		"source_reload_passes": 2,
		"matching_hashes": true,
		"blocking_diagnostics": 0,
		"approval_state": "open",
	}
	var receipt_path := "%s/%s.tres" % [RECEIPT_ROOT,
		ForgeId.safe_filename(receipt.receipt_id)]
	if not _save(receipt, receipt_path): return
	_receipts += 1
	record.runtime_product_paths = [product_path]
	record.bake_receipt_paths = [receipt_path]
	record.status = "review_ready"


func _source_hashes(paths: PackedStringArray) -> Dictionary:
	var hashes := {}
	for path in paths:
		if not FileAccess.file_exists(path):
			_failures.append("Source path is missing: %s" % path)
			return {}
		var resource := ResourceLoader.load(path, "", ResourceLoader.CACHE_MODE_IGNORE)
		if resource == null:
			_failures.append("Source cannot reload: %s" % path)
			return {}
		var source_hash := str(resource.call("canonical_hash")) \
			if resource.has_method("canonical_hash") else FileAccess.get_sha256(path)
		if source_hash.is_empty():
			_failures.append("Source has no deterministic hash: %s" % path)
			return {}
		hashes[path] = source_hash
	return hashes


func _read_json(path: String) -> Dictionary:
	if not FileAccess.file_exists(path):
		_failures.append("Coverage ledger is missing")
		return {}
	var parsed: Variant = JSON.parse_string(FileAccess.get_file_as_string(path))
	if not parsed is Dictionary:
		_failures.append("Coverage ledger JSON is invalid")
		return {}
	return parsed


func _save(resource: Resource, path: String) -> bool:
	var error := ResourceSaver.save(resource, path)
	if error != OK:
		_failures.append("%s=%s" % [path, error_string(error)])
		return false
	return true


func _write_json_atomic(path: String, value: Dictionary) -> void:
	var temporary := "%s.tmp.json" % path.trim_suffix(".json")
	var file := FileAccess.open(temporary, FileAccess.WRITE)
	if file == null:
		_failures.append("Cannot write finalized ledger")
		return
	file.store_string(JSON.stringify(value, "  ", false) + "\n")
	file.close()
	if FileAccess.file_exists(path):
		DirAccess.remove_absolute(ProjectSettings.globalize_path(path))
	var error := DirAccess.rename_absolute(
		ProjectSettings.globalize_path(temporary), ProjectSettings.globalize_path(path))
	if error != OK:
		_failures.append("Cannot promote finalized ledger: %s" % error_string(error))
