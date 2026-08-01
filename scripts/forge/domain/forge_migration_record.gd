@tool
class_name ForgeMigrationRecord
extends Resource

@export var schema_version := 2
@export var subject_type := ""
@export var target_id := ""
@export var lifecycle := "active_fallback"
@export var contract_version := "22-foundation-v1"
@export var dependency_information: Dictionary = {}
@export var replacement_strategy := "preserve_fallback"
@export var fallback_id := ""
@export var removal_gate := "approved_replacement_and_regression_evidence"
@export var review_history: Array[Dictionary] = []
@export var gameplay_id := ""
@export var presentation_id := ""
@export var display_name := ""
@export var family := ""
@export var kit_membership: PackedStringArray = []
@export var current_source := "legacy_runtime"
@export var classification := "unreviewed"
@export var priority := "deferred"
@export var target_forge_mode := "surface"
@export var required_representations: PackedStringArray = []
@export var required_states: PackedStringArray = []
@export var contract_impact := "none"
@export var dependencies: PackedStringArray = []
@export var owner := ""
@export var status := "unreviewed"
@export var review_scenes: PackedStringArray = []
@export var fallback := "legacy_runtime"
@export var review_notes := ""
@export var legacy_deprecation_state := "active"


func to_record() -> Dictionary:
	return {
		"schema": "leyforge.forge.migration-record",
		"schema_version": schema_version,
		"subject_type": subject_type,
		"target_id": target_id,
		"lifecycle": lifecycle,
		"contract_version": contract_version,
		"dependency_information": dependency_information.duplicate(true),
		"replacement_strategy": replacement_strategy,
		"fallback_id": fallback_id,
		"removal_gate": removal_gate,
		"review_history": review_history.duplicate(true),
		"gameplay_id": gameplay_id,
		"presentation_id": presentation_id,
		"display_name": display_name,
		"family": family,
		"kit_membership": Array(kit_membership),
		"current_source": current_source,
		"classification": classification,
		"priority": priority,
		"target_forge_mode": target_forge_mode,
		"required_representations": Array(required_representations),
		"required_states": Array(required_states),
		"contract_impact": contract_impact,
		"dependencies": Array(dependencies),
		"owner": owner,
		"status": status,
		"review_scenes": Array(review_scenes),
		"fallback": fallback,
		"review_notes": review_notes,
		"legacy_deprecation_state": legacy_deprecation_state,
	}
