@tool
class_name ForgeProceduralStructureProduct
extends Resource
## Replaceable deterministic output for modular finite/continuing structures.

@export var schema_version := 1
@export var product_id := ""
@export var rule_set_id := ""
@export var module_set_id := ""
@export var source_hash := ""
@export var placements: Array[Dictionary] = []
@export var open_connectors: Array[Dictionary] = []
@export var continuation_state: Dictionary = {}
@export var terminated := false


func to_record() -> Dictionary:
	return {
		"schema": "leyforge.forge.procedural-structure-product",
		"schema_version": schema_version,
		"product_id": product_id,
		"rule_set_id": rule_set_id,
		"module_set_id": module_set_id,
		"source_hash": source_hash,
		"placements": placements.duplicate(true),
		"open_connectors": open_connectors.duplicate(true),
		"continuation_state": continuation_state.duplicate(true),
		"terminated": terminated,
	}


func canonical_hash() -> String:
	return ForgeStableRecord.hash_record(to_record())
