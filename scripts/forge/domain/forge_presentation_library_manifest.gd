@tool
class_name ForgePresentationLibraryManifest
extends Resource
## Auditable Forest Hamlet catalogue target and current source membership.

const CONTRACT_VERSION := "23-production-library-v1"

@export var schema_version := 1
@export var library_id := "presentation.library.forest_hamlet"
@export var display_name := "Forest Hamlet Presentation Library"
@export var contract_version := CONTRACT_VERSION
@export var target_counts: Dictionary = {}
@export var catalogue_ids: Dictionary = {}
@export var source_roots: PackedStringArray = []
@export var audio_source_planning_range := Vector2i(700, 1100)
@export var audio_source_count_is_completion_gate := false
@export var provenance_policy := "per_source_required"
@export var rights_policy := "verified_usable_rights_required"
@export var lifecycle := "draft"
@export var source_status := "planned_new_work"
@export var dependency_ids: PackedStringArray = []
@export var aliases: PackedStringArray = []
@export var review_gates: Dictionary = {
	"visual": "open",
	"listening": "open",
	"accessibility": "open",
	"rights": "open",
	"performance_tier": "open",
	"owner": "open",
}


func to_record() -> Dictionary:
	var sorted_catalogue := {}
	var keys := catalogue_ids.keys()
	keys.sort()
	for key in keys:
		var values: Array = Array(catalogue_ids[key]).duplicate()
		values.sort()
		sorted_catalogue[key] = values
	return {
		"schema": "leyforge.forge.presentation-library-manifest",
		"schema_version": schema_version,
		"library_id": library_id,
		"display_name": display_name,
		"contract_version": contract_version,
		"target_counts": target_counts.duplicate(true),
		"catalogue_ids": sorted_catalogue,
		"source_roots": Array(source_roots),
		"audio_source_planning_range": audio_source_planning_range,
		"audio_source_count_is_completion_gate": audio_source_count_is_completion_gate,
		"provenance_policy": provenance_policy,
		"rights_policy": rights_policy,
		"lifecycle": lifecycle,
		"source_status": source_status,
		"dependency_ids": Array(dependency_ids),
		"aliases": Array(aliases),
		"review_gates": review_gates.duplicate(true),
	}


func canonical_hash() -> String:
	return ForgeStableRecord.hash_record(to_record())
