@tool
class_name ForgeContentPackManifest
extends Resource

@export var schema_version := 1
@export var pack_id := ""
@export var display_name := ""
@export var version := "0.1.0"
@export var priority := 0
@export var dependencies: PackedStringArray = []
@export var asset_ids: PackedStringArray = []
@export var override_ids: PackedStringArray = []
@export var enabled_by_default := true
@export var provenance_note := ""


func to_record() -> Dictionary:
	return {
		"schema_version": schema_version,
		"pack_id": pack_id,
		"display_name": display_name,
		"version": version,
		"priority": priority,
		"dependencies": Array(dependencies),
		"asset_ids": Array(asset_ids),
		"override_ids": Array(override_ids),
		"enabled_by_default": enabled_by_default,
		"provenance_note": provenance_note,
	}
