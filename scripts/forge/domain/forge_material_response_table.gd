@tool
class_name ForgeMaterialResponseTable
extends ForgePresentationDefinition

@export var response_records: Array[Dictionary] = []
@export var material_fallback_order: PackedStringArray = []
@export var default_profile_id := ""
@export var unsupported_policy := "safe_default"


func _init() -> void:
	schema_id = "leyforge.forge.material-response-table"
	asset_class = "material_response_table"


func to_record() -> Dictionary:
	return _record({
		"response_records": response_records.duplicate(true),
		"material_fallback_order": Array(material_fallback_order),
		"default_profile_id": default_profile_id,
		"unsupported_policy": unsupported_policy,
	})
