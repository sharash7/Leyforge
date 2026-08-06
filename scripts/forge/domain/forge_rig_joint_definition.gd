@tool
class_name ForgeRigJointDefinition
extends Resource
## One deterministic joint in a semantic Entity Forge rig profile.

const JOINT_TYPES: PackedStringArray = [
	"fixed", "hinge", "ball", "twist", "slider", "planar", "chain",
	"spring_follow", "compound",
]

@export var schema_version := 1
@export var joint_id := ""
@export var parent_role_id := ""
@export var child_role_id := ""
@export var joint_type := "fixed"
@export var primary_axis := Vector3.RIGHT
@export var rest_position_meters := Vector3.ZERO
@export var rest_rotation_degrees := Vector3.ZERO
@export var minimum_angles_degrees := Vector3.ZERO
@export var maximum_angles_degrees := Vector3.ZERO
@export var stiffness := 1.0
@export var damping := 1.0
@export var lod_min := 0
@export var lod_max := 3
@export var procedural_hook := ""
@export var lifecycle := "draft"


func to_record() -> Dictionary:
	return {
		"schema": "leyforge.forge.rig-joint",
		"schema_version": schema_version,
		"joint_id": joint_id,
		"parent_role_id": parent_role_id,
		"child_role_id": child_role_id,
		"joint_type": joint_type,
		"primary_axis": primary_axis,
		"rest_position_meters": rest_position_meters,
		"rest_rotation_degrees": rest_rotation_degrees,
		"minimum_angles_degrees": minimum_angles_degrees,
		"maximum_angles_degrees": maximum_angles_degrees,
		"stiffness": stiffness,
		"damping": damping,
		"lod_min": lod_min,
		"lod_max": lod_max,
		"procedural_hook": procedural_hook,
		"lifecycle": lifecycle,
	}


func canonical_hash() -> String:
	return ForgeStableRecord.hash_record(to_record())
