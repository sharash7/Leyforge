@tool
class_name ForgeAmbiencePlan
extends ForgePresentationDefinition
## Bounded state-driven ambience composition for a structure or region.

@export var owner_blueprint_id := ""
@export var acoustic_graph_id := ""
@export var components: Array[Dictionary] = []
@export_range(1, 64) var maximum_active_components := 8
@export var reconstruction_policy := "derive_from_authoritative_state"


func _init() -> void:
	schema_id = "leyforge.forge.ambience-plan"
	asset_class = "ambience_plan"


func to_record() -> Dictionary:
	return _record({
		"owner_blueprint_id": owner_blueprint_id,
		"acoustic_graph_id": acoustic_graph_id,
		"components": components.duplicate(true),
		"maximum_active_components": maximum_active_components,
		"reconstruction_policy": reconstruction_policy,
	})
