@tool
class_name ForgeBlueprintRuntimeProduct
extends Resource
## Replaceable compiled Blueprint Forge product consumed by runtime assembly.

const CONTRACT_VERSION := "22-stage5-runtime-v1"

@export var schema_version := 1
@export var product_id := ""
@export var blueprint_id := ""
@export var source_hash := ""
@export var compiled_elements: Array[Dictionary] = []
@export var construction_stage_records: Array[Dictionary] = []
@export var state_records: Array[Dictionary] = []
@export var material_bindings: Dictionary = {}
@export var placement_record: Dictionary = {}
@export var legacy_fallback := ""
@export var aliases: PackedStringArray = []
@export var dependency_ids: PackedStringArray = []
@export var lifecycle := "generated_candidate"
@export var contract_version := CONTRACT_VERSION


func to_record() -> Dictionary:
	return {
		"schema": "leyforge.forge.blueprint-runtime-product",
		"schema_version": schema_version,
		"product_id": product_id,
		"blueprint_id": blueprint_id,
		"source_hash": source_hash,
		"compiled_elements": compiled_elements.duplicate(true),
		"construction_stage_records": construction_stage_records.duplicate(true),
		"state_records": state_records.duplicate(true),
		"material_bindings": material_bindings.duplicate(true),
		"placement_record": placement_record.duplicate(true),
		"legacy_fallback": legacy_fallback,
		"aliases": Array(aliases),
		"dependency_ids": Array(dependency_ids),
		"lifecycle": lifecycle,
		"contract_version": contract_version,
	}


func canonical_hash() -> String:
	return ForgeStableRecord.hash_record(to_record())
