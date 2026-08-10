@tool
class_name ForgeConstructionDelta
extends Resource

@export var schema_version := 1
@export var delta_id := ""
@export var stage_id := ""
@export var display_name := ""
@export var sequence_index := -1
@export var add_element_ids: PackedStringArray = []
@export var remove_element_ids: PackedStringArray = []
@export var enable_marker_role_ids: PackedStringArray = []
@export var disable_marker_role_ids: PackedStringArray = []
@export var dependency_stage_ids: PackedStringArray = []


func to_record() -> Dictionary:
	var record := {
		"schema": "leyforge.forge.construction-delta",
		"schema_version": schema_version,
		"delta_id": delta_id,
		"stage_id": stage_id,
		"add_element_ids": Array(add_element_ids),
		"remove_element_ids": Array(remove_element_ids),
		"enable_marker_role_ids": Array(enable_marker_role_ids),
		"disable_marker_role_ids": Array(disable_marker_role_ids),
		"dependency_stage_ids": Array(dependency_stage_ids),
	}
	if schema_version >= 2 or not display_name.is_empty() or sequence_index >= 0:
		record["display_name"] = display_name
		record["sequence_index"] = sequence_index
	return record


func canonical_hash() -> String:
	return ForgeStableRecord.hash_record(to_record())
