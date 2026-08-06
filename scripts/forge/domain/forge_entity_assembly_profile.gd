@tool
class_name ForgeEntityAssemblyProfile
extends Resource
## Stable binding from editable entity source to runtime rig/spatial products.

const CONTRACT_VERSION := "22-stage2-v1"

@export var schema_version := 1
@export var assembly_profile_id := ""
@export var display_name := ""
@export var entity_definition_id := ""
@export var rig_profile_id := ""
@export var spatial_map_id := ""
@export var default_variant_id := "base"
@export var default_lod_level := 0
@export var factory_version := "forge-actor-factory-v1"
@export var reconstruction_version := 1
@export var lifecycle := "draft"
@export var source_status := "validated_runtime_source"
@export var contract_version := CONTRACT_VERSION
@export var dependency_ids: PackedStringArray = []
@export var aliases: PackedStringArray = []
@export var legacy_fallback := ""


func to_record() -> Dictionary:
	return {
		"schema": "leyforge.forge.entity-assembly-profile",
		"schema_version": schema_version,
		"assembly_profile_id": assembly_profile_id,
		"display_name": display_name,
		"entity_definition_id": entity_definition_id,
		"rig_profile_id": rig_profile_id,
		"spatial_map_id": spatial_map_id,
		"default_variant_id": default_variant_id,
		"default_lod_level": default_lod_level,
		"factory_version": factory_version,
		"reconstruction_version": reconstruction_version,
		"lifecycle": lifecycle,
		"source_status": source_status,
		"contract_version": contract_version,
		"dependency_ids": Array(dependency_ids),
		"aliases": Array(aliases),
		"legacy_fallback": legacy_fallback,
	}


func canonical_hash() -> String:
	return ForgeStableRecord.hash_record(to_record())
