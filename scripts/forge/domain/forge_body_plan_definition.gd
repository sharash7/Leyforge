@tool
class_name ForgeBodyPlanDefinition
extends Resource

@export var schema_version := 1
@export var body_plan_id := ""
@export var display_name := ""
@export var family := "humanoid"
@export var source_namespace := "leyforge"
@export var density_profile_id := "density.profile.entity.standard"
@export var world_dimensions_meters := Vector3.ONE
@export var forward_axis := Vector3.FORWARD
@export var up_axis := Vector3.UP
@export var root_part_id := ""
# `parts` remains the Stage 0 dictionary compatibility surface. New sources use
# typed body_parts and serialise through the same canonical `parts` field.
@export var parts: Array[Dictionary] = []
@export var body_parts: Array[ForgeBodyPartDefinition] = []
@export var required_entity_roles: PackedStringArray = []
@export var symmetry_groups: Array[Dictionary] = []
@export var contact_sets: Array[Dictionary] = []
@export var extension_points: PackedStringArray = []
@export var template_locked := false
@export var contract_id := ""
@export var lifecycle := "draft"
@export var dependency_ids: PackedStringArray = []


func to_record() -> Dictionary:
	var part_records: Array = []
	if not body_parts.is_empty():
		for part in body_parts:
			if part != null:
				part_records.append(part.to_record())
	else:
		part_records = parts.duplicate(true)
	return {
		"schema": "leyforge.forge.body-plan",
		"schema_version": schema_version,
		"body_plan_id": body_plan_id,
		"display_name": display_name,
		"family": family,
		"source_namespace": source_namespace,
		"density_profile_id": density_profile_id,
		"world_dimensions_meters": world_dimensions_meters,
		"forward_axis": forward_axis,
		"up_axis": up_axis,
		"root_part_id": root_part_id,
		"parts": part_records,
		"required_entity_roles": Array(required_entity_roles),
		"symmetry_groups": symmetry_groups.duplicate(true),
		"contact_sets": contact_sets.duplicate(true),
		"extension_points": Array(extension_points),
		"template_locked": template_locked,
		"contract_id": contract_id,
		"lifecycle": lifecycle,
		"dependency_ids": Array(dependency_ids),
	}


func canonical_hash() -> String:
	return ForgeStableRecord.hash_record(to_record())


func find_body_part(part_id: String) -> ForgeBodyPartDefinition:
	for part in body_parts:
		if part != null and part.body_part_id == part_id:
			return part
	return null
