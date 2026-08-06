@tool
class_name ForgeRuntimeRegistryGeneration
extends Resource
## Immutable-at-publication runtime registry generation for atomic hot reload.

const CONTRACT_VERSION := "23-runtime-registry-v1"

@export var schema_version := 1
@export var generation_id := ""
@export var base_generation_id := ""
@export var contract_version := CONTRACT_VERSION
@export var records: Array[Dictionary] = []
@export var aliases: Dictionary = {}
@export var compatibility_report: Dictionary = {}
@export var validation_diagnostics: Array[Dictionary] = []
@export var publication_state := "staged"
@export var deterministic_seed := 0


func to_record(include_hash := true) -> Dictionary:
	var sorted_records := records.duplicate(true)
	sorted_records.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		return _record_id(a) < _record_id(b))
	var result := {
		"schema": "leyforge.forge.runtime-registry-generation",
		"schema_version": schema_version,
		"generation_id": generation_id,
		"base_generation_id": base_generation_id,
		"contract_version": contract_version,
		"records": sorted_records,
		"aliases": aliases.duplicate(true),
		"compatibility_report": compatibility_report.duplicate(true),
		"validation_diagnostics": validation_diagnostics.duplicate(true),
		"publication_state": publication_state,
		"deterministic_seed": deterministic_seed,
	}
	if include_hash:
		result["generation_hash"] = canonical_hash()
	return result


func canonical_hash() -> String:
	return ForgeStableRecord.hash_record(to_record(false))


static func _record_id(record: Dictionary) -> String:
	for key in ["source_id", "stable_id", "entity_definition_id",
			"blueprint_id", "rig_profile_id", "spatial_map_id",
			"assembly_profile_id", "library_id"]:
		if record.has(key):
			return str(record[key])
	return ""
