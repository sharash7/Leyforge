@tool
class_name ForgeBlueprintInstanceSnapshot
extends Resource
## Save-v17-compatible stable-ID blueprint instance state.

@export var schema_version := 1
@export var instance_id := ""
@export var blueprint_id := ""
@export var product_id := ""
@export var construction_stage_id := "complete"
@export var state_id := ""
@export var transform_record: Dictionary = {}
@export var portal_states: Dictionary = {}
@export var ownership_id := ""
@export var seed := 0


func to_record() -> Dictionary:
	return {
		"schema": "leyforge.forge.blueprint-instance-snapshot",
		"schema_version": schema_version,
		"instance_id": instance_id,
		"blueprint_id": blueprint_id,
		"product_id": product_id,
		"construction_stage_id": construction_stage_id,
		"state_id": state_id,
		"transform_record": transform_record.duplicate(true),
		"portal_states": portal_states.duplicate(true),
		"ownership_id": ownership_id,
		"seed": seed,
	}


func canonical_hash() -> String:
	return ForgeStableRecord.hash_record(to_record())
