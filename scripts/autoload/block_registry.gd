extends Node
## BlockRegistry autoload.
## Loads block definitions from res://.summer/00_Docs/VoxelRegistry.json
## and exposes color + name lookups by numeric block id.
##
## Block id 0 is always AIR (not in the registry JSON; reserved).

const REGISTRY_PATH := "res://.summer/00_Docs/VoxelRegistry.json"
const AIR := 0

var _blocks: Dictionary = {}  # numeric_id (int) -> { name, color, unique_id }
var _name_to_id: Dictionary = {}


func _ready() -> void:
	_load_registry()


func _load_registry() -> void:
	if not FileAccess.file_exists(REGISTRY_PATH):
		push_error("BlockRegistry: registry file not found at %s" % REGISTRY_PATH)
		_load_fallback()
		return
	var text := FileAccess.get_file_as_string(REGISTRY_PATH)
	var data: Variant = JSON.parse_string(text)
	if data == null:
		push_error("BlockRegistry: failed to parse registry JSON")
		_load_fallback()
		return
	var entries: Array
	if data is Array:
		entries = data
	elif data is Dictionary:
		# Tolerate wrapper keys like { "blocks": [...] }.
		for key in data.keys():
			if data[key] is Array:
				entries = data[key]
				break
	for entry in entries:
		if not (entry is Dictionary):
			continue
		var nid := int(entry.get("numeric_id", -1))
		if nid <= 0:
			continue
		var col := Color(1, 1, 1)
		var rgb: Array = entry.get("color_rgb", [])
		if rgb.size() >= 3:
			var a: float = float(rgb[3]) if rgb.size() > 3 else 1.0
			col = Color(float(rgb[0]), float(rgb[1]), float(rgb[2]), a)
		_blocks[nid] = {
			"name": str(entry.get("display_name", "Block %d" % nid)),
			"color": col,
			"unique_id": str(entry.get("unique_id", "")),
		}
		_name_to_id[_blocks[nid]["name"].to_lower()] = nid
	if _blocks.is_empty():
		_load_fallback()
	print("BlockRegistry: loaded %d blocks" % _blocks.size())


func _load_fallback() -> void:
	# Minimal survival set so the game still runs if the JSON is missing.
	_blocks = {
		1: {"name": "Grass", "color": Color(0.24, 0.86, 0.21), "unique_id": ""},
		2: {"name": "Dirt", "color": Color(0.45, 0.3, 0.15), "unique_id": ""},
		3: {"name": "Stone", "color": Color(0.5, 0.5, 0.52), "unique_id": ""},
		9: {"name": "Oak Log", "color": Color(0.4, 0.2, 0.05), "unique_id": ""},
		10: {"name": "Oak Leaves", "color": Color(0.1, 0.4, 0.1), "unique_id": ""},
		23: {"name": "Workbench", "color": Color(0.185, 0.418, 0.74), "unique_id": ""},
	}
	_name_to_id.clear()
	for nid in _blocks:
		_name_to_id[_blocks[nid]["name"].to_lower()] = nid
	push_warning("BlockRegistry: using fallback block set (%d blocks)" % _blocks.size())


func is_air(id: int) -> bool:
	return id == AIR


func is_water(id: int) -> bool:
	# Fluid blocks are rendered on a transparent surface and excluded from
	# collision. Keep in sync with the registry's "Fluid" category.
	return id == 7


func has_block(id: int) -> bool:
	return _blocks.has(id)


func get_block_name(id: int) -> String:
	if id == AIR:
		return "Air"
	if _blocks.has(id):
		return _blocks[id]["name"]
	return "Block %d" % id


func get_color(id: int) -> Color:
	if _blocks.has(id):
		return _blocks[id]["color"]
	return Color(1, 0, 1)  # magenta = missing definition


func get_id_by_name(display_name: String) -> int:
	return int(_name_to_id.get(display_name.to_lower(), -1))


func get_all_ids() -> Array:
	return _blocks.keys()
