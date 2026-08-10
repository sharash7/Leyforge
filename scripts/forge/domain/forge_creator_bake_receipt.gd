@tool
class_name ForgeCreatorBakeReceipt
extends Resource
## Generated proof that an approved creator source matches its runtime output.

@export var schema_version := 1
@export var receipt_id := ""
@export var source_id := ""
@export var source_type_id := ""
@export var source_hash := ""
@export var product_kind := "canonical_source"
@export var product_paths: PackedStringArray = []
@export var product_hashes: Dictionary = {}
@export var validation_summary: Dictionary = {}


func to_record() -> Dictionary:
	return {
		"schema": "leyforge.forge.creator-bake-receipt",
		"schema_version": schema_version,
		"receipt_id": receipt_id,
		"source_id": source_id,
		"source_type_id": source_type_id,
		"source_hash": source_hash,
		"product_kind": product_kind,
		"product_paths": Array(product_paths),
		"product_hashes": product_hashes.duplicate(true),
		"validation_summary": validation_summary.duplicate(true),
	}


func canonical_hash() -> String:
	return ForgeStableRecord.hash_record(to_record())
