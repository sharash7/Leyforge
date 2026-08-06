@tool
class_name ForgePresentationBinding
extends ForgePresentationDefinition

@export var owner_id := ""
@export var event_contract_id := ""
@export var state_contract_id := ""
@export var profile_id := ""
@export var spatial_role_id := ""
@export var conditions: Dictionary = {}
@export var parameter_mappings: Array[Dictionary] = []
@export var channel := "temporary_event"
@export var priority := 0


func _init() -> void:
	schema_id = "leyforge.forge.presentation-binding"
	asset_class = "presentation_binding"


func to_record() -> Dictionary:
	return _record({
		"owner_id": owner_id,
		"event_contract_id": event_contract_id,
		"state_contract_id": state_contract_id,
		"profile_id": profile_id,
		"spatial_role_id": spatial_role_id,
		"conditions": conditions.duplicate(true),
		"parameter_mappings": parameter_mappings.duplicate(true),
		"channel": channel,
		"priority": priority,
	})
