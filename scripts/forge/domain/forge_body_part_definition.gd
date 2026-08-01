@tool
class_name ForgeBodyPartDefinition
extends Resource
## One typed node in an editable, acyclic Entity Forge body graph.

@export var schema_version := 1
@export var body_part_id := ""
@export var display_name := ""
@export var parent_part_id := ""
@export var node_type := "body_part"
@export var anatomy_role_id := ""
@export var voxel_source: ForgeVoxelVolume
@export var density_profile_id := "density.profile.entity.standard"
@export var material_dna_id := ""
@export var local_position_meters := Vector3.ZERO
@export var local_rotation_degrees := Vector3.ZERO
@export var local_scale := Vector3.ONE
@export var pivot_id := ""
@export var side_token := "centre"
@export var rig_role := ""
@export var region_ids: PackedStringArray = []
@export var socket_role_ids: PackedStringArray = []
@export var contact_marker_ids: PackedStringArray = []
@export var visibility_rules: PackedStringArray = []
@export var planning_status := "poc"
@export var lifecycle := "draft"
@export var dependency_ids: PackedStringArray = []


func to_record() -> Dictionary:
	return {
		"schema": "leyforge.forge.body-part",
		"schema_version": schema_version,
		"body_part_id": body_part_id,
		"display_name": display_name,
		"parent_part_id": parent_part_id,
		"node_type": node_type,
		"anatomy_role_id": anatomy_role_id,
		"voxel_source": (
			voxel_source.to_record() if voxel_source != null else {}),
		"density_profile_id": density_profile_id,
		"material_dna_id": material_dna_id,
		"local_position_meters": local_position_meters,
		"local_rotation_degrees": local_rotation_degrees,
		"local_scale": local_scale,
		"pivot_id": pivot_id,
		"side_token": side_token,
		"rig_role": rig_role,
		"region_ids": Array(region_ids),
		"socket_role_ids": Array(socket_role_ids),
		"contact_marker_ids": Array(contact_marker_ids),
		"visibility_rules": Array(visibility_rules),
		"planning_status": planning_status,
		"lifecycle": lifecycle,
		"dependency_ids": Array(dependency_ids),
	}


func canonical_hash() -> String:
	return ForgeStableRecord.hash_record(to_record())


func physical_size_meters() -> Vector3:
	if voxel_source == null:
		return Vector3.ZERO
	return Vector3(voxel_source.dimensions) * voxel_source.voxel_size_meters
