@tool
class_name ForgeVfxDefinition
extends ForgePresentationDefinition

@export var graph_id := ""
@export var family_definition_id := ""
@export var form_ids: PackedStringArray = []
@export var material_ids: PackedStringArray = []
@export var lifecycle_policy := "one_shot"
@export var maximum_instances := 1
@export var lod_tiers: Array[Dictionary] = []
@export var budget_profile_id := ""
@export var accessibility_profile_id := ""


func _init() -> void:
	schema_id = "leyforge.forge.vfx-definition"
	asset_class = "vfx_effect"


func to_record() -> Dictionary:
	return _record({
		"graph_id": graph_id,
		"family_definition_id": family_definition_id,
		"form_ids": Array(form_ids),
		"material_ids": Array(material_ids),
		"lifecycle_policy": lifecycle_policy,
		"maximum_instances": maximum_instances,
		"lod_tiers": lod_tiers.duplicate(true),
		"budget_profile_id": budget_profile_id,
		"accessibility_profile_id": accessibility_profile_id,
	})
