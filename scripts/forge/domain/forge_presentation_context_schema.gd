@tool
class_name ForgePresentationContextSchema
extends ForgePresentationDefinition

@export var compatibility_version := 1
@export var field_definitions: Dictionary = {}
@export var required_groups: PackedStringArray = []
@export var unknown_field_policy := "preserve_extension"


func _init() -> void:
	schema_id = "leyforge.forge.presentation-context-schema"
	asset_class = "context_schema"


func to_record() -> Dictionary:
	return _record({
		"compatibility_version": compatibility_version,
		"field_definitions": field_definitions.duplicate(true),
		"required_groups": Array(required_groups),
		"unknown_field_policy": unknown_field_policy,
	})
