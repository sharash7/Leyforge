@tool
class_name ForgeProceduralStructureRuleSet
extends Resource
## Bounded generation rules for modular dungeons and continuing structures.

const CONTRACT_VERSION := "forge-authoring-v1"

@export var schema_version := 1
@export var rule_set_id := ""
@export var display_name := "Generation Rules"
@export var module_set_id := ""
@export_range(1, 4096) var maximum_modules := 32
@export_range(0, 256) var maximum_depth := 12
@export_range(1, 4096) var maximum_open_connectors := 64
@export_range(0.0, 1.0, 0.01) var termination_chance := 0.15
@export var allow_loops := false
@export var continuing := false
@export var seed := 1
@export var collision_policy := "module_origin"
@export var required_module_tags: PackedStringArray = []
@export var forbidden_module_tags: PackedStringArray = []
@export_range(1, 4096) var maximum_repeats_per_module := 24
@export_range(0, 4096) var minimum_modules_before_encounter := 2
@export_range(0, 4096) var minimum_modules_before_terminal := 4
@export var dead_end_policy := "terminate_with_cap"
@export_range(1, 4096) var continuation_checkpoint_interval := 8
@export var source_status := "draft"
@export var lifecycle := "draft"
@export var dependency_ids: PackedStringArray = []
@export var contract_version := CONTRACT_VERSION


func to_record() -> Dictionary:
	var dependencies := Array(dependency_ids)
	if not module_set_id.is_empty() and module_set_id not in dependencies:
		dependencies.append(module_set_id)
	return {
		"schema": "leyforge.forge.procedural-structure-rule-set",
		"schema_version": schema_version,
		"rule_set_id": rule_set_id,
		"display_name": display_name,
		"module_set_id": module_set_id,
		"maximum_modules": maximum_modules,
		"maximum_depth": maximum_depth,
		"maximum_open_connectors": maximum_open_connectors,
		"termination_chance": termination_chance,
		"allow_loops": allow_loops,
		"continuing": continuing,
		"seed": seed,
		"collision_policy": collision_policy,
		"required_module_tags": Array(required_module_tags),
		"forbidden_module_tags": Array(forbidden_module_tags),
		"maximum_repeats_per_module": maximum_repeats_per_module,
		"minimum_modules_before_encounter": minimum_modules_before_encounter,
		"minimum_modules_before_terminal": minimum_modules_before_terminal,
		"dead_end_policy": dead_end_policy,
		"continuation_checkpoint_interval": continuation_checkpoint_interval,
		"source_status": source_status,
		"lifecycle": lifecycle,
		"dependency_ids": dependencies,
		"contract_version": contract_version,
	}


func canonical_hash() -> String:
	return ForgeStableRecord.hash_record(to_record())
