@tool
class_name ForgeSpatialMap
extends Resource
## Owner-local authored spatial map shared by entity and presentation runtime.

const CONTRACT_VERSION := "23-spatial-v1"

@export var schema_version := 1
@export var spatial_map_id := ""
@export var display_name := ""
@export var owner_asset_id := ""
@export var references: Array[ForgeSpatialReference] = []
@export var alias_mappings: Dictionary = {}
@export var mirror_mappings: Array[Dictionary] = []
@export var required_role_ids: PackedStringArray = []
@export var supported_variant_ids: PackedStringArray = ["base"]
@export var supported_lod_levels: Array[int] = [0, 1, 2]
@export var lifecycle := "draft"
@export var source_status := "validated_runtime_source"
@export var contract_version := CONTRACT_VERSION
@export var dependency_ids: PackedStringArray = []
@export var aliases: PackedStringArray = []
@export var legacy_fallback := ""


func to_record() -> Dictionary:
	var reference_records: Array[Dictionary] = []
	for reference in references:
		if reference != null:
			reference_records.append(reference.to_record())
	reference_records.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		return str(a.get("stable_id", "")) < str(b.get("stable_id", "")))
	return {
		"schema": "leyforge.forge.spatial-map",
		"schema_version": schema_version,
		"spatial_map_id": spatial_map_id,
		"display_name": display_name,
		"owner_asset_id": owner_asset_id,
		"references": reference_records,
		"alias_mappings": alias_mappings.duplicate(true),
		"mirror_mappings": mirror_mappings.duplicate(true),
		"required_role_ids": Array(required_role_ids),
		"supported_variant_ids": Array(supported_variant_ids),
		"supported_lod_levels": supported_lod_levels.duplicate(),
		"lifecycle": lifecycle,
		"source_status": source_status,
		"contract_version": contract_version,
		"dependency_ids": Array(dependency_ids),
		"aliases": Array(aliases),
		"legacy_fallback": legacy_fallback,
	}


func canonical_hash() -> String:
	return ForgeStableRecord.hash_record(to_record())


func reference_for_role(role_id: String) -> ForgeSpatialReference:
	for reference in references:
		if reference != null and reference.semantic_role_id == role_id:
			return reference
	return null


func reference_by_id(reference_id: String) -> ForgeSpatialReference:
	for reference in references:
		if reference != null and reference.stable_id == reference_id:
			return reference
	return null
