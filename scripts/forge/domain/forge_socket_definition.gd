@tool
class_name ForgeSocketDefinition
extends Resource

@export var schema_version := 1
@export var socket_key := ""
@export var socket_type := "effect"
@export var parent_part_key := ""
@export var local_transform := Transform3D.IDENTITY
@export var direction := Vector3.FORWARD
@export var tags: PackedStringArray = []
@export var contract_required := false


func to_record() -> Dictionary:
	return {
		"schema_version": schema_version,
		"socket_key": socket_key,
		"socket_type": socket_type,
		"parent_part_key": parent_part_key,
		"local_transform": str(local_transform),
		"direction": [direction.x, direction.y, direction.z],
		"tags": Array(tags),
		"contract_required": contract_required,
	}
