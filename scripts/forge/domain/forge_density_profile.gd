@tool
class_name ForgeDensityProfile
extends Resource
## Versioned authoring-density contract shared by Entity Forge sources.

@export var schema_version := 1
@export var density_profile_id := ""
@export var display_name := ""
@export var voxels_per_meter := 32
@export var voxel_size_meters := 0.03125
@export var minimum_part_dimensions := Vector3i.ONE
@export var maximum_part_dimensions := Vector3i(64, 64, 64)
@export var intended_body_families: PackedStringArray = []
@export var mixed_density_policy := "explicit_transition_required"
@export var world_block_meters := 1.0
@export var lifecycle := "draft"
@export var contract_version := "22-stage1-v1"


func to_record() -> Dictionary:
	return {
		"schema": "leyforge.forge.density-profile",
		"schema_version": schema_version,
		"density_profile_id": density_profile_id,
		"display_name": display_name,
		"voxels_per_meter": voxels_per_meter,
		"voxel_size_meters": voxel_size_meters,
		"minimum_part_dimensions": minimum_part_dimensions,
		"maximum_part_dimensions": maximum_part_dimensions,
		"intended_body_families": Array(intended_body_families),
		"mixed_density_policy": mixed_density_policy,
		"world_block_meters": world_block_meters,
		"lifecycle": lifecycle,
		"contract_version": contract_version,
	}


func canonical_hash() -> String:
	return ForgeStableRecord.hash_record(to_record())
