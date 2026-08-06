@tool
class_name ForgeAnimationEventMarker
extends Resource
## Named semantic timing marker; gameplay confirmation remains authoritative.

@export var schema_version := 1
@export var marker_id := ""
@export var event_contract_id := ""
@export var normalized_time := 0.0
@export var spatial_role_id := ""
@export var payload_defaults: Dictionary = {}
@export var authority_class := "presentation_timing"
@export var contact_kind := ""
@export var required := false


func to_record() -> Dictionary:
	return {
		"schema": "leyforge.forge.animation-event-marker",
		"schema_version": schema_version,
		"marker_id": marker_id,
		"event_contract_id": event_contract_id,
		"normalized_time": normalized_time,
		"spatial_role_id": spatial_role_id,
		"payload_defaults": payload_defaults.duplicate(true),
		"authority_class": authority_class,
		"contact_kind": contact_kind,
		"required": required,
	}


func canonical_hash() -> String:
	return ForgeStableRecord.hash_record(to_record())
