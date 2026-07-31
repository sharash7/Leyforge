@tool
class_name ForgeVariantSet
extends Resource

@export var schema_version := 1
@export var variant_set_id := ""
@export var parent_presentation_id := ""
@export var dimension := "material"
@export var selector_source := "deterministic_seed"
@export var default_variant_id := ""
@export var entries: Array[Dictionary] = []
@export var composition_priority := 0
@export var seed_salt := ""
@export var persist_selection := false
@export var contract_version := 1


func to_record() -> Dictionary:
	return {
		"schema_version": schema_version,
		"variant_set_id": variant_set_id,
		"parent_presentation_id": parent_presentation_id,
		"dimension": dimension,
		"selector_source": selector_source,
		"default_variant_id": default_variant_id,
		"entries": entries.duplicate(true),
		"composition_priority": composition_priority,
		"seed_salt": seed_salt,
		"persist_selection": persist_selection,
		"contract_version": contract_version,
	}
