@tool
class_name ForgeOverrideDefinition
extends Resource

@export var schema_version := 1
@export var override_id := ""
@export var target_presentation_id := ""
@export var source_pack_id := "pack.leyforge.project_visuals"
@export var source_layer := "project"
@export var priority := 0
@export var enabled := true
@export var contract_requirement := ""
@export var field_operations: Dictionary = {}
@export var status := "draft"
@export var source_revision := 1
@export var provenance_note := ""
@export var dependencies: PackedStringArray = []


func to_record() -> Dictionary:
	return {
		"schema_version": schema_version,
		"override_id": override_id,
		"target_presentation_id": target_presentation_id,
		"source_pack_id": source_pack_id,
		"source_layer": source_layer,
		"priority": priority,
		"enabled": enabled,
		"contract_requirement": contract_requirement,
		"field_operations": field_operations.duplicate(true),
		"status": status,
		"source_revision": source_revision,
		"provenance_note": provenance_note,
		"dependencies": Array(dependencies),
	}
