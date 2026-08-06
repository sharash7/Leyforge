@tool
class_name ForgeSurfaceLayer
extends ForgePresentationDefinition

@export var layer_kind := "wetness"
@export var surface_mask_role_id := ""
@export var persistence_policy := "transient"
@export var expiry_seconds := 0.0
@export var maximum_records_per_chunk := 0
@export var merge_policy := "replace_weaker"
@export var save_policy := "not_saved"


func _init() -> void:
	schema_id = "leyforge.forge.surface-layer"
	asset_class = "surface_layer"


func to_record() -> Dictionary:
	return _record({
		"layer_kind": layer_kind,
		"surface_mask_role_id": surface_mask_role_id,
		"persistence_policy": persistence_policy,
		"expiry_seconds": expiry_seconds,
		"maximum_records_per_chunk": maximum_records_per_chunk,
		"merge_policy": merge_policy,
		"save_policy": save_policy,
	})
