@tool
class_name ForgeRuntimeContactRecord
extends Resource
## Authoritative transient spatial snapshot. It never owns gameplay outcomes.

const CONTRACT_VERSION := "23-spatial-v1"

@export var schema_version := 1
@export var runtime_anchor_id := ""
@export var event_instance_id := ""
@export var world_position := Vector3.ZERO
@export var world_rotation_degrees := Vector3.ZERO
@export var surface_normal := Vector3.UP
@export var incoming_direction := Vector3.ZERO
@export var source_owner_id := ""
@export var target_owner_id := ""
@export var source_spatial_id := ""
@export var target_spatial_id := ""
@export var struck_voxel := Vector3i.ZERO
@export var struck_face := ""
@export var target_material_id := ""
@export var target_region_id := ""
@export var local_target_position := Vector3.ZERO
@export var lifetime_seconds := 0.25
@export var persistence_conversion_policy := "transient_only"
@export var timestamp_msec := 0
@export var deterministic_seed := 0
@export var contract_version := CONTRACT_VERSION


func to_record() -> Dictionary:
	return {
		"schema": "leyforge.forge.runtime-contact",
		"schema_version": schema_version,
		"runtime_anchor_id": runtime_anchor_id,
		"event_instance_id": event_instance_id,
		"world_position": world_position,
		"world_rotation_degrees": world_rotation_degrees,
		"surface_normal": surface_normal,
		"incoming_direction": incoming_direction,
		"source_owner_id": source_owner_id,
		"target_owner_id": target_owner_id,
		"source_spatial_id": source_spatial_id,
		"target_spatial_id": target_spatial_id,
		"struck_voxel": struck_voxel,
		"struck_face": struck_face,
		"target_material_id": target_material_id,
		"target_region_id": target_region_id,
		"local_target_position": local_target_position,
		"lifetime_seconds": lifetime_seconds,
		"persistence_conversion_policy": persistence_conversion_policy,
		"timestamp_msec": timestamp_msec,
		"deterministic_seed": deterministic_seed,
		"contract_version": contract_version,
	}


func canonical_hash() -> String:
	return ForgeStableRecord.hash_record(to_record())


func world_transform() -> Transform3D:
	var radians := Vector3(
		deg_to_rad(world_rotation_degrees.x),
		deg_to_rad(world_rotation_degrees.y),
		deg_to_rad(world_rotation_degrees.z))
	return Transform3D(Basis.from_euler(radians), world_position)
