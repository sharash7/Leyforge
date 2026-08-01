@tool
class_name ForgeBlueprintMaterialRoleSet
extends Resource
## Semantic Blueprint Forge roles resolved to Material DNA IDs.

@export var schema_version := 1
@export var material_role_set_id := ""
@export var display_name := ""
@export var role_bindings: Dictionary = {}
@export var required_role_ids: PackedStringArray = []
@export var culture_ids: PackedStringArray = []
@export var biome_ids: PackedStringArray = []
@export var lifecycle := "draft"
@export var contract_version := "22-stage1-v1"
@export var dependency_ids: PackedStringArray = []


func to_record() -> Dictionary:
	return {
		"schema": "leyforge.forge.blueprint-material-role-set",
		"schema_version": schema_version,
		"material_role_set_id": material_role_set_id,
		"display_name": display_name,
		"role_bindings": role_bindings.duplicate(true),
		"required_role_ids": Array(required_role_ids),
		"culture_ids": Array(culture_ids),
		"biome_ids": Array(biome_ids),
		"lifecycle": lifecycle,
		"contract_version": contract_version,
		"dependency_ids": Array(dependency_ids),
	}


func canonical_hash() -> String:
	return ForgeStableRecord.hash_record(to_record())
