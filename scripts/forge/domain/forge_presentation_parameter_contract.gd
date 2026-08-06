@tool
class_name ForgePresentationParameterContract
extends ForgePresentationDefinition

@export var value_type := "float"
@export var minimum_value := 0.0
@export var maximum_value := 1.0
@export var default_value: Variant = 0.0
@export var normalised := true
@export var mapping_policy := "clamp"
@export var smoothing_policy := "none"


func _init() -> void:
	schema_id = "leyforge.forge.presentation-parameter-contract"
	asset_class = "parameter_contract"


func to_record() -> Dictionary:
	return _record({
		"value_type": value_type,
		"minimum_value": minimum_value,
		"maximum_value": maximum_value,
		"default_value": default_value,
		"normalised": normalised,
		"mapping_policy": mapping_policy,
		"smoothing_policy": smoothing_policy,
	})
