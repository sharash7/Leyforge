@tool
class_name ForgePaintPatternDefinition
extends Resource
## Reusable two-dimensional palette-role pattern for surfaces and voxel slices.

@export var schema_version := 1
@export var pattern_id := ""
@export var display_name := ""
@export var width := 1
@export var height := 1
@export var role_keys: PackedStringArray = []
@export var palette_entries: Array[Dictionary] = []


func role_at(x: int, y: int) -> String:
	if width <= 0 or height <= 0 or role_keys.size() != width * height:
		return ""
	var wrapped_x := posmod(x, width)
	var wrapped_y := posmod(y, height)
	return str(role_keys[wrapped_y * width + wrapped_x])


func capture_surface(
		surface: ForgeSurfaceSet, palette: ForgePaletteDefinition,
		face: String) -> bool:
	if surface == null or palette == null or face not in ForgeSurfaceSet.FACE_KEYS:
		return false
	surface.ensure_faces()
	palette.ensure_default_entries()
	width = surface.width
	height = surface.height
	role_keys = PackedStringArray()
	palette_entries.clear()
	var captured := {}
	for y in height:
		for x in width:
			_append_palette_role(
				palette, surface.get_pixel(face, x, y), captured)
	return role_keys.size() == width * height


func capture_voxel_slice(
		volume: ForgeVoxelVolume, palette: ForgePaletteDefinition,
		axis: int, slice_index: int) -> bool:
	if volume == null or palette == null:
		return false
	var plane := volume.slice_dimensions(axis)
	var raw := volume.slice_cells_copy(axis, slice_index)
	if raw.size() != plane.x * plane.y:
		return false
	palette.ensure_default_entries()
	width = plane.x
	height = plane.y
	role_keys = PackedStringArray()
	palette_entries.clear()
	var captured := {}
	for stored_value in raw:
		if int(stored_value) == 0:
			role_keys.append("")
		else:
			_append_palette_role(palette, int(stored_value) - 1, captured)
	return role_keys.size() == width * height


func palette_entry_for(role_key: String) -> Dictionary:
	for entry in palette_entries:
		if str(entry.get("entry_key", "")) == role_key:
			return entry.duplicate(true)
	return {}


func is_valid_pattern() -> bool:
	return ForgeId.is_valid(pattern_id, "pattern.") \
		and width > 0 and height > 0 \
		and role_keys.size() == width * height


func to_record() -> Dictionary:
	var records: Array[Dictionary] = []
	for entry in palette_entries:
		var record := entry.duplicate(true)
		for key in ["albedo", "emission"]:
			if record.get(key) is Color:
				var color: Color = record[key]
				record[key] = [color.r, color.g, color.b, color.a]
		records.append(record)
	return {
		"schema_version": schema_version,
		"pattern_id": pattern_id,
		"display_name": display_name,
		"width": width,
		"height": height,
		"role_keys": Array(role_keys),
		"palette_entries": records,
	}


func _append_palette_role(
		palette: ForgePaletteDefinition, palette_index: int,
		captured: Dictionary) -> void:
	if palette_index < 0 or palette_index >= palette.entries.size():
		role_keys.append("")
		return
	var entry: Dictionary = palette.entries[palette_index]
	var role_key := str(entry.get("entry_key", "role_%d" % palette_index))
	role_keys.append(role_key)
	if not captured.has(role_key):
		palette_entries.append(entry.duplicate(true))
		captured[role_key] = true
