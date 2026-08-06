@tool
class_name ForgePresentationEventContract
extends ForgePresentationDefinition

@export var compatibility_version := 1
@export var owner_system := ""
@export var payload_fields: Dictionary = {}
@export var required_context_fields: PackedStringArray = []
@export var authority_policy := "authoritative"
@export var frequency_class := "standard"
@export var replication_policy := "local"
@export var replay_policy := "recordable"
@export var persistence_class := "transient"
@export var allowed_outputs: PackedStringArray = []
@export var accessibility_importance := "decorative"


func _init() -> void:
	schema_id = "leyforge.forge.presentation-event-contract"
	asset_class = "event_contract"


func to_record() -> Dictionary:
	return _record({
		"compatibility_version": compatibility_version,
		"owner_system": owner_system,
		"payload_fields": payload_fields.duplicate(true),
		"required_context_fields": Array(required_context_fields),
		"authority_policy": authority_policy,
		"frequency_class": frequency_class,
		"replication_policy": replication_policy,
		"replay_policy": replay_policy,
		"persistence_class": persistence_class,
		"allowed_outputs": Array(allowed_outputs),
		"accessibility_importance": accessibility_importance,
	})
