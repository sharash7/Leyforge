@tool
class_name ForgePresentationStateContract
extends ForgePresentationDefinition

@export var compatibility_version := 1
@export var owner_system := ""
@export var state_fields: Dictionary = {}
@export var update_policy := "on_change"
@export var reconstruction_policy := "read_authoritative_state"
@export var replication_policy := "authoritative_snapshot"


func _init() -> void:
	schema_id = "leyforge.forge.presentation-state-contract"
	asset_class = "state_contract"


func to_record() -> Dictionary:
	return _record({
		"compatibility_version": compatibility_version,
		"owner_system": owner_system,
		"state_fields": state_fields.duplicate(true),
		"update_policy": update_policy,
		"reconstruction_policy": reconstruction_policy,
		"replication_policy": replication_policy,
	})
