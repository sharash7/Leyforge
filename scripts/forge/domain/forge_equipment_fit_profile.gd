@tool
class_name ForgeEquipmentFitProfile
extends Resource
## Equipment alignment contract using semantic sockets, never scene paths.

const CONTRACT_VERSION := "22-stage3-v1"

@export var schema_version := 1
@export var equipment_profile_id := ""
@export var display_name := ""
@export var equipment_asset_id := ""
@export var compatible_rig_profile_ids: PackedStringArray = []
@export var socket_role_id := "socket.equipment.primary"
@export var local_position := Vector3.ZERO
@export var local_rotation_degrees := Vector3.ZERO
@export var local_scale := Vector3.ONE
@export var release_spatial_role_id := "runtime_anchor.block.mining_impact"
@export var fallback_socket_role_id := "anchor.presentation.center"
@export var occupancy_policy := "single"
@export var lifecycle := "draft"
@export var contract_version := CONTRACT_VERSION
@export var dependency_ids: PackedStringArray = []
@export var legacy_fallback := ""


func to_record() -> Dictionary:
	return {
		"schema": "leyforge.forge.equipment-fit-profile",
		"schema_version": schema_version,
		"equipment_profile_id": equipment_profile_id,
		"display_name": display_name,
		"equipment_asset_id": equipment_asset_id,
		"compatible_rig_profile_ids": Array(compatible_rig_profile_ids),
		"socket_role_id": socket_role_id,
		"local_position": local_position,
		"local_rotation_degrees": local_rotation_degrees,
		"local_scale": local_scale,
		"release_spatial_role_id": release_spatial_role_id,
		"fallback_socket_role_id": fallback_socket_role_id,
		"occupancy_policy": occupancy_policy,
		"lifecycle": lifecycle,
		"contract_version": contract_version,
		"dependency_ids": Array(dependency_ids),
		"legacy_fallback": legacy_fallback,
	}


func canonical_hash() -> String:
	return ForgeStableRecord.hash_record(to_record())
