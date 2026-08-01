@tool
class_name ForgeContentPackManifest
extends Resource

@export var schema_version := 2
@export var pack_id := ""
@export var display_name := ""
@export var version := "0.1.0"
@export var priority := 0
@export var dependencies: PackedStringArray = []
@export var asset_ids: PackedStringArray = []
@export var override_ids: PackedStringArray = []
@export var enabled_by_default := true
@export var provenance_note := ""
@export var subject_type := "content_pack"
@export var target_id := ""
@export var lifecycle := "active"
@export var contract_version := "22-foundation-v1"
@export var dependency_information: Dictionary = {}
@export var replacement_strategy := "additive"
@export var fallback := ""
@export var removal_gate := "explicit_pack_migration"
@export var review_history: Array[Dictionary] = []


func to_record() -> Dictionary:
	return {
		"schema": "leyforge.forge.content-pack",
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
		"subject_type": subject_type,
		"target_id": target_id if not target_id.is_empty() else pack_id,
		"lifecycle": lifecycle,
		"contract_version": contract_version,
		"dependency_information": dependency_information.duplicate(true),
		"replacement_strategy": replacement_strategy,
		"fallback": fallback,
		"removal_gate": removal_gate,
		"review_history": review_history.duplicate(true),
	}
