@tool
class_name ForgeBakeManifest
extends Resource

@export var manifest_schema_version := 1
@export var asset_id := ""
@export var presentation_id := ""
@export var source_revision := 0
@export var source_hash := ""
@export var dependency_hashes: Dictionary = {}
@export var engine_version := ""
@export var baker_version := ""
@export var render_profile := "default"
@export var products: Array[Dictionary] = []
@export var diagnostics_summary: Dictionary = {}
@export var approved_status := "draft"


func to_record() -> Dictionary:
	return {
		"manifest_schema_version": manifest_schema_version,
		"asset_id": asset_id,
		"presentation_id": presentation_id,
		"source_revision": source_revision,
		"source_hash": source_hash,
		"dependency_hashes": dependency_hashes.duplicate(true),
		"engine_version": engine_version,
		"baker_version": baker_version,
		"render_profile": render_profile,
		"products": products.duplicate(true),
		"diagnostics_summary": diagnostics_summary.duplicate(true),
		"approved_status": approved_status,
	}
