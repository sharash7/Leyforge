@tool
class_name ForgePresentationBudgetProfile
extends ForgePresentationDefinition

@export var maximum_particles := 0
@export var maximum_voices := 0
@export var maximum_lights := 0
@export var maximum_surface_records := 0
@export var maximum_updates_per_second := 0
@export var fallback_chain: PackedStringArray = []
@export var critical_reserve: Dictionary = {}


func _init() -> void:
	schema_id = "leyforge.forge.presentation-budget-profile"
	asset_class = "budget_profile"


func to_record() -> Dictionary:
	return _record({
		"maximum_particles": maximum_particles,
		"maximum_voices": maximum_voices,
		"maximum_lights": maximum_lights,
		"maximum_surface_records": maximum_surface_records,
		"maximum_updates_per_second": maximum_updates_per_second,
		"fallback_chain": Array(fallback_chain),
		"critical_reserve": critical_reserve.duplicate(true),
	})
