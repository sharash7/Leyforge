@tool
class_name ForgePlacementProfile
extends Resource

@export var schema_version := 1
@export var placement_profile_id := ""
@export var allowed_zone_role_ids: PackedStringArray = []
@export var required_socket_role_ids: PackedStringArray = []
@export var required_network_role_ids: PackedStringArray = []
@export var footprint_min := Vector3i.ZERO
@export var footprint_max := Vector3i.ZERO
@export var max_slope := 0
@export var terrain_mode := "minor_levelling"
@export var lifecycle := "draft"


func to_record() -> Dictionary:
	return {
		"schema": "leyforge.forge.placement-profile",
		"schema_version": schema_version,
		"placement_profile_id": placement_profile_id,
		"allowed_zone_role_ids": Array(allowed_zone_role_ids),
		"required_socket_role_ids": Array(required_socket_role_ids),
		"required_network_role_ids": Array(required_network_role_ids),
		"footprint_min": [footprint_min.x, footprint_min.y, footprint_min.z],
		"footprint_max": [footprint_max.x, footprint_max.y, footprint_max.z],
		"max_slope": max_slope,
		"terrain_mode": terrain_mode,
		"lifecycle": lifecycle,
	}


func canonical_hash() -> String:
	return ForgeStableRecord.hash_record(to_record())
