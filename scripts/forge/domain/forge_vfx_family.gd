@tool
class_name ForgeVfxFamily
extends ForgePresentationDefinition

@export var parent_family_id := ""
@export var default_graph_id := ""
@export var default_form_ids: PackedStringArray = []
@export var bounded_parameters: Dictionary = {}
@export var fallback_effect_id := ""


func _init() -> void:
	schema_id = "leyforge.forge.vfx-family"
	asset_class = "vfx_family"


func to_record() -> Dictionary:
	return _record({
		"parent_family_id": parent_family_id,
		"default_graph_id": default_graph_id,
		"default_form_ids": Array(default_form_ids),
		"bounded_parameters": bounded_parameters.duplicate(true),
		"fallback_effect_id": fallback_effect_id,
	})
