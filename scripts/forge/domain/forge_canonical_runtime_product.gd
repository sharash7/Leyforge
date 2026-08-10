@tool
class_name ForgeCanonicalRuntimeProduct
extends Resource
## Read-only runtime catalogue envelope for Forge sources consumed directly by ID.

const CONTRACT_VERSION := "20-23-production-v1"

@export var schema_version := 1
@export var product_id := ""
@export var source_id := ""
@export var source_paths: PackedStringArray = []
@export var source_hashes: Dictionary = {}
@export var combined_source_hash := ""
@export var dependency_ids: PackedStringArray = []
@export var lifecycle := "generated_candidate"
@export var contract_version := CONTRACT_VERSION


func to_record() -> Dictionary:
	return {
		"schema": "leyforge.forge.canonical-runtime-product",
		"schema_version": schema_version,
		"product_id": product_id,
		"source_id": source_id,
		"source_paths": Array(source_paths),
		"source_hashes": source_hashes.duplicate(true),
		"combined_source_hash": combined_source_hash,
		"dependency_ids": Array(dependency_ids),
		"lifecycle": lifecycle,
		"contract_version": contract_version,
	}


func canonical_hash() -> String:
	return ForgeStableRecord.hash_record(to_record())
