@tool
class_name ForgeCollisionProfile
extends Resource

@export var schema_version := 1
@export var collision_profile_id := ""
@export var collision_kind := "box_set"
@export var boxes: Array[Dictionary] = []
@export var contract_sensitive := true


func to_record() -> Dictionary:
	return {
		"schema_version": schema_version,
		"collision_profile_id": collision_profile_id,
		"collision_kind": collision_kind,
		"boxes": boxes.duplicate(true),
		"contract_sensitive": contract_sensitive,
	}
