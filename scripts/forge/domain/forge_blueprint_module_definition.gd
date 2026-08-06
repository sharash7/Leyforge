@tool
class_name ForgeBlueprintModuleDefinition
extends Resource
## Reusable semantic/physical Blueprint Forge module source.

const CONTRACT_VERSION := "22-stage5-v1"

@export var schema_version := 1
@export var module_id := ""
@export var display_name := ""
@export var module_kind := "assembly"
@export var elements: Array[ForgeBlueprintElement] = []
@export var aliases: PackedStringArray = []
@export var dependency_ids: PackedStringArray = []
@export var lifecycle := "runtime_candidate"
@export var contract_version := CONTRACT_VERSION


func to_record() -> Dictionary:
	var records: Array[Dictionary] = []
	for element in elements:
		if element != null:
			records.append(element.to_record())
	return {
		"schema": "leyforge.forge.blueprint-module-definition",
		"schema_version": schema_version,
		"module_id": module_id,
		"display_name": display_name,
		"module_kind": module_kind,
		"elements": records,
		"aliases": Array(aliases),
		"dependency_ids": Array(dependency_ids),
		"lifecycle": lifecycle,
		"contract_version": contract_version,
	}


func canonical_hash() -> String:
	return ForgeStableRecord.hash_record(to_record())
