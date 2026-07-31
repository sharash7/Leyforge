@tool
class_name ForgePresentationContract
extends Resource

@export var schema_version := 1
@export var contract_id := ""
@export var compatibility_version := 1
@export var gameplay_categories: PackedStringArray = []
@export var required_representations: PackedStringArray = ["world", "preview"]
@export var required_parts: PackedStringArray = []
@export var required_pivots: PackedStringArray = []
@export var required_sockets: PackedStringArray = []
@export var required_states: PackedStringArray = []
@export var critical_responses: PackedStringArray = []
@export var footprint_profile_id := ""
@export var allowed_collision_profiles: PackedStringArray = []
@export var fallback_presentation_id := ""
@export var supported_variant_dimensions: PackedStringArray = []
@export var accessibility_requirements: PackedStringArray = []


func to_record() -> Dictionary:
	return {
		"schema_version": schema_version,
		"contract_id": contract_id,
		"compatibility_version": compatibility_version,
		"gameplay_categories": Array(gameplay_categories),
		"required_representations": Array(required_representations),
		"required_parts": Array(required_parts),
		"required_pivots": Array(required_pivots),
		"required_sockets": Array(required_sockets),
		"required_states": Array(required_states),
		"critical_responses": Array(critical_responses),
		"footprint_profile_id": footprint_profile_id,
		"allowed_collision_profiles": Array(allowed_collision_profiles),
		"fallback_presentation_id": fallback_presentation_id,
		"supported_variant_dimensions": Array(supported_variant_dimensions),
		"accessibility_requirements": Array(accessibility_requirements),
	}
