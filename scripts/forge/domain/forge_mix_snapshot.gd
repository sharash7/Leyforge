@tool
class_name ForgeMixSnapshot
extends ForgePresentationDefinition

@export var bus_targets_db: Dictionary = {}
@export var transition_seconds := 0.25
@export var priority := 0
@export var stacking_policy := "highest_priority"
@export var protected_bus_ids: PackedStringArray = []


func _init() -> void:
	schema_id = "leyforge.forge.mix-snapshot"
	asset_class = "mix_snapshot"


func to_record() -> Dictionary:
	return _record({
		"bus_targets_db": bus_targets_db.duplicate(true),
		"transition_seconds": transition_seconds,
		"priority": priority,
		"stacking_policy": stacking_policy,
		"protected_bus_ids": Array(protected_bus_ids),
	})
