@tool
class_name ForgeVfxForm
extends ForgePresentationDefinition

@export var form_kind := "cube"
@export var cell_records: Array[Dictionary] = []
@export var palette_role_ids: PackedStringArray = []
@export var pivot := Vector3.ZERO
@export var voxel_size_meters := 0.03125
@export var maximum_cells := 256


func _init() -> void:
	schema_id = "leyforge.forge.vfx-form"
	asset_class = "vfx_form"


func to_record() -> Dictionary:
	return _record({
		"form_kind": form_kind,
		"cell_records": cell_records.duplicate(true),
		"palette_role_ids": Array(palette_role_ids),
		"pivot": pivot,
		"voxel_size_meters": voxel_size_meters,
		"maximum_cells": maximum_cells,
	})
