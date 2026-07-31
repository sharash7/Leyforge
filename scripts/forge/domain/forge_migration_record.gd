@tool
class_name ForgeMigrationRecord
extends Resource

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
