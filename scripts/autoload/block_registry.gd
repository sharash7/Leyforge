extends Node
## BlockRegistry autoload.
## Loads block definitions from res://.summer/00_Docs/VoxelRegistry.json.
## Numeric ids are compact runtime indexes; original_id is the stable identity
## used by recipes, saves, and cross-registry relationships.
##
## Block id 0 is always AIR (not in the registry JSON; reserved).

const REGISTRY_PATH := "res://.summer/00_Docs/VoxelRegistry.json"
const AIR := 0
const AIR_STABLE_ID := "core.block.air"

# Stage 1 saves were written before block/item separation. These item ids could
# leak into block inventories/world edits through duplicate display names.
const LEGACY_NUMERIC_ALIASES := {
	142: "natural.log.oak",
	167: "construction.planks.oak",
	168: "construction.beam.oak",
	169: "construction.cobble.stone",
	170: "construction.brick.stone",
	224: "construction.roof.tile_clay",
}

var _blocks: Dictionary = {}  # numeric_id (int) -> resolved immutable definition
var _name_to_id: Dictionary = {}
var _stable_to_id: Dictionary = {}


func _ready() -> void:
	_load_registry()


func _load_registry() -> void:
	_blocks.clear()
	_name_to_id.clear()
	_stable_to_id.clear()
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
		if str(entry.get("type", "")) != "block":
			continue
		var nid := int(entry.get("numeric_id", -1))
		if nid <= 0:
			continue
		var stable_id := str(entry.get("original_id", ""))
		if stable_id.is_empty():
			push_error("BlockRegistry: block %d has no stable original_id" % nid)
			continue
		if _blocks.has(nid) or _stable_to_id.has(stable_id):
			push_error("BlockRegistry: duplicate block identity %s / %d" % [stable_id, nid])
			continue
		var col := Color(1, 1, 1)
		var rgb: Array = entry.get("color_rgb", [])
		if rgb.size() >= 3:
			var a: float = float(rgb[3]) if rgb.size() > 3 else 1.0
			# Registry RGB values mirror their authored sRGB hex colours. Godot's
			# 3D materials expect linear values; using sRGB values directly washed
			# sand toward white and made the full terrain palette overly bright.
			col = Color(float(rgb[0]), float(rgb[1]), float(rgb[2]), a).srgb_to_linear()
		_blocks[nid] = {
			"name": str(entry.get("display_name", "Block %d" % nid)),
			"color": col,
			"stable_id": stable_id,
			"unique_id": str(entry.get("unique_id", "")),
			"category": str(entry.get("category", "")),
		}
		_stable_to_id[stable_id] = nid
		var display_key: String = _blocks[nid]["name"].to_lower()
		if _name_to_id.has(display_key):
			push_warning("BlockRegistry: duplicate block display name %s" % _blocks[nid]["name"])
		else:
			_name_to_id[display_key] = nid
	if _blocks.is_empty():
		_load_fallback()
	print("BlockRegistry: loaded %d blocks" % _blocks.size())


func _load_fallback() -> void:
	# Minimal survival set so the game still runs if the JSON is missing.
	_blocks = {
		1: {"name": "Grass Block", "color": Color(0.24, 0.86, 0.21).srgb_to_linear(), "stable_id": "terrain.grass.basic", "unique_id": "", "category": "Terrain / Soil"},
		2: {"name": "Dirt Block", "color": Color(0.45, 0.3, 0.15).srgb_to_linear(), "stable_id": "terrain.dirt.basic", "unique_id": "", "category": "Terrain / Soil"},
		3: {"name": "Stone Block", "color": Color(0.5, 0.5, 0.52).srgb_to_linear(), "stable_id": "terrain.stone.basic", "unique_id": "", "category": "Terrain / Stone"},
		9: {"name": "Oak Log", "color": Color(0.4, 0.2, 0.05).srgb_to_linear(), "stable_id": "natural.log.oak", "unique_id": "", "category": "Natural / Wood"},
		10: {"name": "Oak Leaves", "color": Color(0.1, 0.4, 0.1).srgb_to_linear(), "stable_id": "natural.leaves.oak", "unique_id": "", "category": "Natural / Foliage"},
		11: {"name": "Oak Planks", "color": Color(0.58, 0.38, 0.16).srgb_to_linear(), "stable_id": "construction.planks.oak", "unique_id": "", "category": "Construction / Wood"},
		23: {"name": "Workbench", "color": Color(0.185, 0.418, 0.74).srgb_to_linear(), "stable_id": "functional.workbench.basic", "unique_id": "", "category": "Functional / Crafting"},
	}
	_name_to_id.clear()
	_stable_to_id.clear()
	for nid in _blocks:
		_name_to_id[_blocks[nid]["name"].to_lower()] = nid
		_stable_to_id[_blocks[nid]["stable_id"]] = nid
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


func get_shape(id: int) -> String:
	var stable_id := get_stable_id(id)
	if ".slab." in stable_id:
		return "slab"
	if ".stair." in stable_id:
		return "stair"
	return "cube"


func get_harvest_profile(id: int) -> Dictionary:
	## Stable item/block relationships and the initial POC harvest gates.
	## Unknown construction blocks intentionally drop themselves.
	var stable_id := get_stable_id(id)
	var profile := {
		"hardness": 1.0,
		"tool": "",
		"level": 0,
		"drop_kind": "block",
		"drop_id": stable_id,
		"drop_count": 1,
	}
	var mappings := {
		"natural.log.oak": ["axe", 0, "item.resource.log_oak", 1, 1.2],
		"natural.leaves.oak": ["", 0, "item.resource.plant_fibre", 1, 0.2],
		"terrain.stone.basic": ["pickaxe", 0, "item.resource.stone_chunk", 1, 1.8],
		"terrain.clay.basic": ["", 0, "item.resource.clay_lump", 1, 0.8],
		"terrain.sand.basic": ["", 0, "item.resource.sand", 1, 0.5],
		"ore.coal.basic": ["pickaxe", 0, "item.resource.coal_chunk", 1, 2.0],
		"ore.copper.basic": ["pickaxe", 1, "item.resource.raw_copper_ore", 1, 2.5],
		"ore.iron.basic": ["pickaxe", 1, "item.resource.raw_iron_ore", 1, 3.0],
		"ore.mana_crystal.basic": ["pickaxe", 2, "item.resource.raw_mana_crystal", 1, 4.0],
		"construction.planks.oak": ["axe", 0, "item.material.plank_oak", 1, 0.9],
		"construction.beam.oak": ["axe", 0, "item.material.beam_oak", 1, 1.1],
		"construction.cobble.stone": ["pickaxe", 0, "item.material.cobblestone", 1, 1.5],
		"construction.brick.stone": ["pickaxe", 0, "item.material.stone_brick", 1, 1.6],
	}
	if mappings.has(stable_id):
		var values: Array = mappings[stable_id]
		profile["tool"] = str(values[0])
		profile["level"] = int(values[1])
		profile["drop_kind"] = "item"
		profile["drop_id"] = str(values[2])
		profile["drop_count"] = int(values[3])
		profile["hardness"] = float(values[4])
	return profile


func get_id_by_name(display_name: String) -> int:
	return int(_name_to_id.get(display_name.to_lower(), -1))


func get_id_by_stable_id(stable_id: String) -> int:
	if stable_id == AIR_STABLE_ID:
		return AIR
	return int(_stable_to_id.get(stable_id, -1))


func get_stable_id(id: int) -> String:
	if id == AIR:
		return AIR_STABLE_ID
	if _blocks.has(id):
		return str(_blocks[id]["stable_id"])
	return ""


func resolve_serialized_id(value: Variant) -> int:
	## Resolves current stable ids and the numeric ids used by legacy v2 saves.
	if value is String:
		return get_id_by_stable_id(value)
	if value is int or value is float:
		var legacy_id := int(value)
		if LEGACY_NUMERIC_ALIASES.has(legacy_id):
			return get_id_by_stable_id(LEGACY_NUMERIC_ALIASES[legacy_id])
		return legacy_id if legacy_id == AIR or _blocks.has(legacy_id) else -1
	return -1


func get_definition(id: int) -> Dictionary:
	return _blocks.get(id, {}).duplicate()


func get_all_ids() -> Array:
	return _blocks.keys()
