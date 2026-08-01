@tool
class_name ForgeProjectManifest
extends Resource

@export var schema_id := "leyforge.forge.project-manifest"
@export var schema_version := 1
@export var project_id := "forge.project.leyforge"
@export var display_name := "Leyforge"
@export var contract_version := "22-foundation-v1"
@export var lifecycle := "foundation"
@export var supported_schema_ids: PackedStringArray = []
@export var semantic_registry_paths: PackedStringArray = []
@export var source_roots: PackedStringArray = []
@export var migration_inventory_paths: PackedStringArray = []
@export var capture_profile_ids: PackedStringArray = []
@export var dependency_ids: PackedStringArray = []


func to_record() -> Dictionary:
	return {
		"schema": schema_id,
		"schema_version": schema_version,
		"project_id": project_id,
		"display_name": display_name,
		"contract_version": contract_version,
		"lifecycle": lifecycle,
		"supported_schema_ids": Array(supported_schema_ids),
		"semantic_registry_paths": Array(semantic_registry_paths),
		"source_roots": Array(source_roots),
		"migration_inventory_paths": Array(migration_inventory_paths),
		"capture_profile_ids": Array(capture_profile_ids),
		"dependency_ids": Array(dependency_ids),
	}


func canonical_hash() -> String:
	return ForgeStableRecord.hash_record(to_record())
