@tool
class_name ForgeCompiledVfxProduct
extends Resource
## Compact bounded product emitted by the shared Forge bake service.

const CONTRACT_VERSION := "23-vfx-runtime-v1"

@export var schema_version := 1
@export var product_id := ""
@export var source_definition_id := ""
@export var source_hash := ""
@export var dependency_hashes: Dictionary = {}
@export var backend := "cpu_multimesh"
@export var instructions: Array[Dictionary] = []
@export var form_records: Array[Dictionary] = []
@export var maximum_spawn_count := 0
@export var maximum_lifetime_seconds := 0.0
@export var maximum_instances := 0
@export var light_request_count := 0
@export var surface_request_count := 0
@export var lifecycle_policy := "one_shot"
@export var lod_tiers: Array[Dictionary] = []
@export var budget_profile_id := ""
@export var accessibility_profile_id := ""
@export var fallback_ids: PackedStringArray = []
@export var contract_version := CONTRACT_VERSION
@export var product_hash := ""


func to_record(include_hash := true) -> Dictionary:
	var record := {
		"schema": "leyforge.forge.compiled-vfx-product",
		"schema_version": schema_version,
		"product_id": product_id,
		"source_definition_id": source_definition_id,
		"source_hash": source_hash,
		"dependency_hashes": dependency_hashes.duplicate(true),
		"backend": backend,
		"instructions": instructions.duplicate(true),
		"form_records": form_records.duplicate(true),
		"maximum_spawn_count": maximum_spawn_count,
		"maximum_lifetime_seconds": maximum_lifetime_seconds,
		"maximum_instances": maximum_instances,
		"light_request_count": light_request_count,
		"surface_request_count": surface_request_count,
		"lifecycle_policy": lifecycle_policy,
		"lod_tiers": lod_tiers.duplicate(true),
		"budget_profile_id": budget_profile_id,
		"accessibility_profile_id": accessibility_profile_id,
		"fallback_ids": Array(fallback_ids),
		"contract_version": contract_version,
	}
	if include_hash:
		record["product_hash"] = product_hash
	return record


func seal() -> String:
	product_hash = ForgeStableRecord.hash_record(to_record(false))
	return product_hash


func canonical_hash() -> String:
	return ForgeStableRecord.hash_record(to_record())
