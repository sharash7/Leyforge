@tool
class_name ForgeRigRoleBinding
extends Resource
## Stable semantic-role to rigid voxel-part binding.

const BINDING_MODES: PackedStringArray = [
	"rigid_part", "constrained_skin", "helper", "virtual",
]

@export var schema_version := 1
@export var role_id := ""
@export var body_part_id := ""
@export var parent_role_id := ""
@export var joint_id := ""
@export var binding_mode := "rigid_part"
@export var required := true
@export var mirror_role_id := ""
@export var lod_group := "core"
@export var fallback_role_id := ""


func to_record() -> Dictionary:
	return {
		"schema": "leyforge.forge.rig-role-binding",
		"schema_version": schema_version,
		"role_id": role_id,
		"body_part_id": body_part_id,
		"parent_role_id": parent_role_id,
		"joint_id": joint_id,
		"binding_mode": binding_mode,
		"required": required,
		"mirror_role_id": mirror_role_id,
		"lod_group": lod_group,
		"fallback_role_id": fallback_role_id,
	}


func canonical_hash() -> String:
	return ForgeStableRecord.hash_record(to_record())
