@tool
class_name ForgeStateBindingDefinition
extends Resource

@export var schema_version := 1
@export var state_binding_id := ""
@export var state_contract_id := ""
@export var default_presentation := "idle"
@export var bindings: Array[Dictionary] = []
@export var layer_order: PackedStringArray = [
	"base", "variant", "environment", "activity", "condition", "critical",
]


func to_record() -> Dictionary:
	return {
		"schema_version": schema_version,
		"state_binding_id": state_binding_id,
		"state_contract_id": state_contract_id,
		"default_presentation": default_presentation,
		"bindings": bindings.duplicate(true),
		"layer_order": Array(layer_order),
	}
