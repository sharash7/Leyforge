@tool
class_name ForgePresentationDefinition
extends Resource
## Shared source contract for Set 23 Presentation Forge foundation Resources.

const CONTRACT_VERSION := "23-foundation-v1"

@export var schema_id := ""
@export var schema_version := 1
@export var stable_id := ""
@export var display_name := ""
@export var asset_class := ""
@export var family_id := ""
@export var owner_pack_id := "pack.presentation.leyforge.foundation"
@export var contract_version := CONTRACT_VERSION
@export var lifecycle := "draft"
@export var source_status := "foundation_definition"
@export var aliases: PackedStringArray = []
@export var dependency_ids: PackedStringArray = []
@export var optional_dependency_ids: PackedStringArray = []
@export var fallback_ids: PackedStringArray = []
@export var provenance: Dictionary = {}
@export var rights_status := "not_assessed"
@export var review_history: Array[Dictionary] = []
@export var extension_fields: Dictionary = {}


func to_record() -> Dictionary:
	return _record({})


func canonical_hash() -> String:
	return ForgeStableRecord.hash_record(to_record())


func _record(domain_fields: Dictionary) -> Dictionary:
	var record := {
		"schema": schema_id,
		"schema_version": schema_version,
		"stable_id": stable_id,
		"display_name": display_name,
		"asset_class": asset_class,
		"family_id": family_id,
		"owner_pack_id": owner_pack_id,
		"contract_version": contract_version,
		"lifecycle": lifecycle,
		"source_status": source_status,
		"aliases": Array(aliases),
		"dependency_ids": Array(dependency_ids),
		"optional_dependency_ids": Array(optional_dependency_ids),
		"fallback_ids": Array(fallback_ids),
		"provenance": provenance.duplicate(true),
		"rights_status": rights_status,
		"review_history": review_history.duplicate(true),
		"extension_fields": extension_fields.duplicate(true),
	}
	for key in domain_fields:
		record[key] = domain_fields[key]
	return record
