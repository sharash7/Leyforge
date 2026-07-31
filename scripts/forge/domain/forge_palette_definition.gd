@tool
class_name ForgePaletteDefinition
extends Resource
## Stable palette roles shared by surface and voxel sources.

@export var schema_version := 1
@export var palette_id := ""
@export var display_name := ""
@export var entries: Array[Dictionary] = []


func ensure_default_entries() -> void:
	if not entries.is_empty():
		return
	entries = [
		{
			"entry_key": "base",
			"albedo": Color("#8a8a8a"),
			"roughness": 0.8,
			"metallic": 0.0,
			"emission": Color.BLACK,
			"opacity": 1.0,
			"material_dna_id": "material.generic.stone",
		},
		{
			"entry_key": "shadow",
			"albedo": Color("#4a4a4a"),
			"roughness": 0.9,
			"metallic": 0.0,
			"emission": Color.BLACK,
			"opacity": 1.0,
			"material_dna_id": "material.generic.stone",
		},
	]


func color_for(index: int) -> Color:
	ensure_default_entries()
	if index < 0 or index >= entries.size():
		return Color.MAGENTA
	return entries[index].get("albedo", Color.MAGENTA)


func material_entry(index: int) -> Dictionary:
	ensure_default_entries()
	return entries[index].duplicate(true) \
		if index >= 0 and index < entries.size() else {}


func to_record() -> Dictionary:
	ensure_default_entries()
	var records: Array = []
	for entry in entries:
		var record := entry.duplicate(true)
		for key in ["albedo", "emission"]:
			if record.get(key) is Color:
				var color: Color = record[key]
				record[key] = [color.r, color.g, color.b, color.a]
		records.append(record)
	return {
		"schema_version": schema_version,
		"palette_id": palette_id,
		"display_name": display_name,
		"entries": records,
	}
