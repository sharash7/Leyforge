@tool
class_name ForgePresentationProfile
extends ForgePresentationDefinition

@export var allowed_contract_ids: PackedStringArray = []
@export var required_context_fields: PackedStringArray = []
@export var component_ids: Dictionary = {}
@export var spatial_role_ids: PackedStringArray = []
@export var channels: PackedStringArray = []
@export var budget_profile_id := ""
@export var accessibility_profile_id := ""
@export var priority := 0
@export var critical_cue := false


func _init() -> void:
	schema_id = "leyforge.forge.presentation-profile"
	asset_class = "presentation_profile"


func to_record() -> Dictionary:
	return _record({
		"allowed_contract_ids": Array(allowed_contract_ids),
		"required_context_fields": Array(required_context_fields),
		"component_ids": component_ids.duplicate(true),
		"spatial_role_ids": Array(spatial_role_ids),
		"channels": Array(channels),
		"budget_profile_id": budget_profile_id,
		"accessibility_profile_id": accessibility_profile_id,
		"priority": priority,
		"critical_cue": critical_cue,
	})
