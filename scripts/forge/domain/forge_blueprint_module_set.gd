@tool
class_name ForgeBlueprintModuleSet
extends Resource
## Curated room/structure modules and selection weights for finite or continuing generation.

const CONTRACT_VERSION := "forge-authoring-v1"

@export var schema_version := 1
@export var module_set_id := ""
@export var display_name := "Structure Set"
@export var module_ids: PackedStringArray = []
@export var start_module_ids: PackedStringArray = []
@export var end_module_ids: PackedStringArray = []
@export var module_weights: Dictionary = {}
@export var required_tags: PackedStringArray = []
@export var continuation_policy := "finite"
@export var source_status := "draft"
@export var lifecycle := "draft"
@export var dependency_ids: PackedStringArray = []
@export var contract_version := CONTRACT_VERSION


func to_record() -> Dictionary:
	var dependencies := Array(dependency_ids)
	for module_id in module_ids:
		if module_id not in dependencies:
			dependencies.append(module_id)
	return {
		"schema": "leyforge.forge.blueprint-module-set",
		"schema_version": schema_version,
		"module_set_id": module_set_id,
		"display_name": display_name,
		"module_ids": Array(module_ids),
		"start_module_ids": Array(start_module_ids),
		"end_module_ids": Array(end_module_ids),
		"module_weights": module_weights.duplicate(true),
		"required_tags": Array(required_tags),
		"continuation_policy": continuation_policy,
		"source_status": source_status,
		"lifecycle": lifecycle,
		"dependency_ids": dependencies,
		"contract_version": contract_version,
	}


func canonical_hash() -> String:
	return ForgeStableRecord.hash_record(to_record())


func weight_for(module_id: String) -> float:
	return maxf(0.0, float(module_weights.get(module_id, 1.0)))
