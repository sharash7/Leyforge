@tool
class_name ForgePartDefinition
extends Resource

@export var schema_version := 1
@export var part_key := ""
@export var parent_part_key := ""
@export var source_volume: Resource
@export var local_transform := Transform3D.IDENTITY
@export var pivot_transform := Transform3D.IDENTITY
@export var material_bindings: Dictionary = {}
@export var animated := false
@export var visibility_group := ""
@export var collision_role := "visual"
@export var state_tags: PackedStringArray = []


func to_record() -> Dictionary:
	return {
		"schema_version": schema_version,
		"part_key": part_key,
		"parent_part_key": parent_part_key,
		"source_volume": (
			source_volume.call("to_record")
			if source_volume != null and source_volume.has_method("to_record")
			else null),
		"local_transform": str(local_transform),
		"pivot_transform": str(pivot_transform),
		"material_bindings": material_bindings.duplicate(true),
		"animated": animated,
		"visibility_group": visibility_group,
		"collision_role": collision_role,
		"state_tags": Array(state_tags),
	}
