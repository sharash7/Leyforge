@tool
class_name ForgeEntityDefinition
extends Resource
## Canonical editable entity source. Runtime rig/actor products are later stages.

@export var schema_version := 1
@export var entity_definition_id := ""
@export var display_name := ""
@export var body_family := "humanoid"
@export var source_namespace := "leyforge"
@export var body_plan: ForgeBodyPlanDefinition
@export var density_profile_id := "density.profile.entity.standard"
@export var material_dna_ids: PackedStringArray = []
@export var entity_role_ids: PackedStringArray = []
@export var capture_profile_id := "capture.profile.entity.current_state"
@export var world_dimensions_meters := Vector3.ONE
@export var gameplay_definition_ids: PackedStringArray = []
@export var extension_points: PackedStringArray = []
@export var template_id := ""
@export var template_locked := false
@export var source_status := "draft"
@export var visual_approval := "open"
@export var lifecycle := "draft"
@export var contract_version := "22-stage1-v1"
@export var dependency_ids: PackedStringArray = []
@export var legacy_fallback := ""


func to_record() -> Dictionary:
	return {
		"schema": "leyforge.forge.entity-definition",
		"schema_version": schema_version,
		"entity_definition_id": entity_definition_id,
		"display_name": display_name,
		"body_family": body_family,
		"source_namespace": source_namespace,
		"body_plan": body_plan.to_record() if body_plan != null else {},
		"density_profile_id": density_profile_id,
		"material_dna_ids": Array(material_dna_ids),
		"entity_role_ids": Array(entity_role_ids),
		"capture_profile_id": capture_profile_id,
		"world_dimensions_meters": world_dimensions_meters,
		"gameplay_definition_ids": Array(gameplay_definition_ids),
		"extension_points": Array(extension_points),
		"template_id": template_id,
		"template_locked": template_locked,
		"source_status": source_status,
		"visual_approval": visual_approval,
		"lifecycle": lifecycle,
		"contract_version": contract_version,
		"dependency_ids": Array(dependency_ids),
		"legacy_fallback": legacy_fallback,
	}


func canonical_hash() -> String:
	return ForgeStableRecord.hash_record(to_record())
