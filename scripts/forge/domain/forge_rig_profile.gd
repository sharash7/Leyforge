@tool
class_name ForgeRigProfile
extends Resource
## Versioned semantic rig source for deterministic rigid-part assembly.

const CONTRACT_VERSION := "22-stage2-v1"

@export var schema_version := 1
@export var rig_profile_id := ""
@export var display_name := ""
@export var entity_definition_id := ""
@export var body_plan_id := ""
@export var root_role_id := ""
@export var role_bindings: Array[ForgeRigRoleBinding] = []
@export var joints: Array[ForgeRigJointDefinition] = []
@export var spatial_map_id := ""
@export var socket_reference_ids: PackedStringArray = []
@export var retarget_profile_id := ""
@export var rig_lod_levels: Array[Dictionary] = []
@export var motion_profiles: Dictionary = {}
@export var lifecycle := "draft"
@export var source_status := "validated_runtime_source"
@export var contract_version := CONTRACT_VERSION
@export var dependency_ids: PackedStringArray = []
@export var aliases: PackedStringArray = []
@export var legacy_fallback := ""


func to_record() -> Dictionary:
	var binding_records: Array[Dictionary] = []
	for binding in role_bindings:
		if binding != null:
			binding_records.append(binding.to_record())
	binding_records.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		return str(a.get("role_id", "")) < str(b.get("role_id", "")))
	var joint_records: Array[Dictionary] = []
	for joint in joints:
		if joint != null:
			joint_records.append(joint.to_record())
	joint_records.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		return str(a.get("joint_id", "")) < str(b.get("joint_id", "")))
	return {
		"schema": "leyforge.forge.rig-profile",
		"schema_version": schema_version,
		"rig_profile_id": rig_profile_id,
		"display_name": display_name,
		"entity_definition_id": entity_definition_id,
		"body_plan_id": body_plan_id,
		"root_role_id": root_role_id,
		"role_bindings": binding_records,
		"joints": joint_records,
		"spatial_map_id": spatial_map_id,
		"socket_reference_ids": Array(socket_reference_ids),
		"retarget_profile_id": retarget_profile_id,
		"rig_lod_levels": rig_lod_levels.duplicate(true),
		"motion_profiles": motion_profiles.duplicate(true),
		"lifecycle": lifecycle,
		"source_status": source_status,
		"contract_version": contract_version,
		"dependency_ids": Array(dependency_ids),
		"aliases": Array(aliases),
		"legacy_fallback": legacy_fallback,
	}


func canonical_hash() -> String:
	return ForgeStableRecord.hash_record(to_record())


func binding_for_role(role_id: String) -> ForgeRigRoleBinding:
	for binding in role_bindings:
		if binding != null and binding.role_id == role_id:
			return binding
	return null


func joint_for_child_role(role_id: String) -> ForgeRigJointDefinition:
	for joint in joints:
		if joint != null and joint.child_role_id == role_id:
			return joint
	return null
