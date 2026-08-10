class_name ForgeCreatorRuntimeRegistry
extends RefCounted
## Runtime-only view of approved creator outputs. Receipts are the trust boundary:
## source and generated products must still match their recorded canonical hashes.

const RECEIPT_ROOT := "res://generated/forge/creator_receipts"
const SOURCE_ROOT := "res://content/forge"

var entries: Dictionary = {}
var stale_entries: Dictionary = {}


func reload() -> Dictionary:
	entries.clear()
	stale_entries.clear()
	var sources := _source_index()
	for path in _resource_paths(RECEIPT_ROOT):
		var loaded := ResourceLoader.load(path, "", ResourceLoader.CACHE_MODE_IGNORE)
		if not loaded is ForgeCreatorBakeReceipt:
			continue
		var receipt: ForgeCreatorBakeReceipt = loaded
		var verification := _verify_receipt(receipt, sources)
		verification["receipt"] = receipt
		verification["receipt_path"] = path
		if bool(verification.get("ok", false)):
			entries[receipt.source_id] = verification
		else:
			stale_entries[receipt.source_id] = verification
	return {
		"ok": stale_entries.is_empty(),
		"active_count": entries.size(),
		"stale_count": stale_entries.size(),
		"active_ids": PackedStringArray(entries.keys()),
		"stale_ids": PackedStringArray(stale_entries.keys()),
	}


func resolve(source_id: String) -> Dictionary:
	if entries.has(source_id):
		var record: Dictionary = entries[source_id]
		return {
			"ok": true,
			"source_id": source_id,
			"source": record.get("source"),
			"products": record.get("products", []),
			"receipt": record.get("receipt"),
			"product_kind": (record.get("receipt") as ForgeCreatorBakeReceipt).product_kind,
			"provenance": {
				"layer": "approved_creator",
				"source_hash": (record.get("receipt") as ForgeCreatorBakeReceipt).source_hash,
				"receipt_path": str(record.get("receipt_path", "")),
			},
		}
	if stale_entries.has(source_id):
		return {"ok": false, "source_id": source_id, "fallback": "stale_creator_output",
			"reason": str((stale_entries[source_id] as Dictionary).get("reason", ""))}
	return {"ok": false, "source_id": source_id, "fallback": "unapproved_creator_source"}


func product_for(source_id: String, index := 0) -> Resource:
	var resolution := resolve(source_id)
	if not bool(resolution.get("ok", false)):
		return null
	var products: Array = resolution.get("products", [])
	return products[index] if index >= 0 and index < products.size() else null


func is_active(source_id: String) -> bool:
	return entries.has(source_id)


func _verify_receipt(
		receipt: ForgeCreatorBakeReceipt, sources: Dictionary) -> Dictionary:
	if receipt.source_id.is_empty() or receipt.source_hash.is_empty():
		return {"ok": false, "reason": "Receipt has no source identity or hash."}
	var source: Resource = sources.get(receipt.source_id)
	if source == null:
		return {"ok": false, "reason": "Approved source no longer exists."}
	if _canonical_hash(source) != receipt.source_hash:
		return {"ok": false, "reason": "Source changed after its last approval."}
	var products: Array[Resource] = []
	for path in receipt.product_paths:
		if not str(path).begins_with("res://generated/forge/") \
				or not ResourceLoader.exists(path):
			return {"ok": false, "reason": "Recorded generated product is missing."}
		var product := ResourceLoader.load(path, "", ResourceLoader.CACHE_MODE_IGNORE)
		if product == null:
			return {"ok": false, "reason": "Recorded generated product cannot be loaded."}
		var expected_hash := str(receipt.product_hashes.get(path, ""))
		if expected_hash.is_empty() or _canonical_hash(product) != expected_hash:
			return {"ok": false, "reason": "Generated product changed outside approval."}
		products.append(product)
	return {"ok": true, "source": source, "products": products}


func _source_index() -> Dictionary:
	var result := {}
	var registry := ForgeAuthoringTypeRegistry.new()
	for path in _resource_paths(SOURCE_ROOT):
		var source := ResourceLoader.load(path, "", ResourceLoader.CACHE_MODE_IGNORE)
		var descriptor := registry.for_resource(source)
		if descriptor == null:
			continue
		var source_id := descriptor.identity(source)
		if not source_id.is_empty():
			result[source_id] = source
	return result


func _resource_paths(root: String) -> PackedStringArray:
	var results := PackedStringArray()
	var directory := DirAccess.open(root)
	if directory == null:
		return results
	directory.list_dir_begin()
	var entry := directory.get_next()
	while not entry.is_empty():
		if not entry.begins_with("."):
			var path := root.path_join(entry)
			if directory.current_is_dir():
				results.append_array(_resource_paths(path))
			elif (entry.ends_with(".tres") or entry.ends_with(".res")) \
					and ".previous." not in entry and ".tmp." not in entry:
				results.append(path)
		entry = directory.get_next()
	directory.list_dir_end()
	return results


func _canonical_hash(resource: Resource) -> String:
	return str(resource.call("canonical_hash")) \
		if resource != null and resource.has_method("canonical_hash") else ""
