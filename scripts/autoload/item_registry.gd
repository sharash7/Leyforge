extends Node
## ItemRegistry autoload.
## Items share the source JSON with blocks but are loaded into a distinct
## namespace. original_id is authoritative; display names are presentation.

const REGISTRY_PATH := "res://.summer/00_Docs/VoxelRegistry.json"

var _items: Dictionary = {}  # numeric_id -> resolved immutable definition
var _stable_to_id: Dictionary = {}
var _name_to_ids: Dictionary = {}  # display names are allowed to be ambiguous


func _ready() -> void:
	_load_registry()


func _load_registry() -> void:
	_items.clear()
	_stable_to_id.clear()
	_name_to_ids.clear()
	if not FileAccess.file_exists(REGISTRY_PATH):
		push_error("ItemRegistry: registry file not found at %s" % REGISTRY_PATH)
		return
	var data: Variant = JSON.parse_string(FileAccess.get_file_as_string(REGISTRY_PATH))
	if not (data is Array):
		push_error("ItemRegistry: expected a top-level JSON array")
		return
	for entry in data:
		if not (entry is Dictionary) or str(entry.get("type", "")) != "item":
			continue
		var numeric_id := int(entry.get("numeric_id", -1))
		var stable_id := str(entry.get("original_id", ""))
		if numeric_id <= 0 or stable_id.is_empty():
			push_error("ItemRegistry: invalid item identity %s / %d" % [stable_id, numeric_id])
			continue
		if _items.has(numeric_id) or _stable_to_id.has(stable_id):
			push_error("ItemRegistry: duplicate item identity %s / %d" % [stable_id, numeric_id])
			continue
		var definition := {
			"name": str(entry.get("display_name", "Item %d" % numeric_id)),
			"stable_id": stable_id,
			"unique_id": str(entry.get("unique_id", "")),
			"category": str(entry.get("category", "")),
			"color": _entry_color(entry),
		}
		_items[numeric_id] = definition
		_stable_to_id[stable_id] = numeric_id
		var display_key: String = definition["name"].to_lower()
		if not _name_to_ids.has(display_key):
			_name_to_ids[display_key] = []
		_name_to_ids[display_key].append(numeric_id)
	print("ItemRegistry: loaded %d items" % _items.size())


func _entry_color(entry: Dictionary) -> Color:
	var rgb: Array = entry.get("color_rgb", [])
	if rgb.size() < 3:
		return Color(0.55, 0.55, 0.55)
	var alpha: float = float(rgb[3]) if rgb.size() > 3 else 1.0
	return Color(float(rgb[0]), float(rgb[1]), float(rgb[2]), alpha).srgb_to_linear()


func has_item(id: int) -> bool:
	return _items.has(id)


func get_id_by_stable_id(stable_id: String) -> int:
	return int(_stable_to_id.get(stable_id, -1))


func get_stable_id(id: int) -> String:
	return str(_items.get(id, {}).get("stable_id", ""))


func get_item_name(id: int) -> String:
	return str(_items.get(id, {}).get("name", "Item %d" % id))


func get_color(id: int) -> Color:
	return _items.get(id, {}).get("color", Color(0.55, 0.55, 0.55))


func get_max_stack(id: int) -> int:
	return 1 if is_tool(id) else 64


func is_tool(id: int) -> bool:
	return get_stable_id(id).begins_with("item.tool.")


func get_tool_profile(id: int) -> Dictionary:
	## Stage 3 runtime layer for the documented tool families. The source
	## registry remains the authority for identity; balance can later move to
	## authored content data without changing inventory or save formats.
	var stable_id := get_stable_id(id)
	var tool_class := ""
	if "pickaxe" in stable_id:
		tool_class = "pickaxe"
	elif stable_id.ends_with("_axe") or ".axe" in stable_id:
		tool_class = "axe"
	if tool_class.is_empty():
		return {}
	var level := 0
	var durability := 32
	var speed := 1.8
	if ".stone_" in stable_id:
		level = 1
		durability = 96
		speed = 2.8
	elif ".iron_" in stable_id:
		level = 2
		durability = 256
		speed = 4.2
	return {
		"class": tool_class,
		"level": level,
		"max_durability": durability,
		"speed": speed,
	}


func create_instance_stack(id: int) -> Dictionary:
	if not has_item(id):
		return {}
	var stack := {"kind": "item", "id": id, "count": 1}
	var profile := get_tool_profile(id)
	if not profile.is_empty():
		stack["instance"] = {
			"durability": int(profile["max_durability"]),
			"max_durability": int(profile["max_durability"]),
		}
	return stack


func get_place_block_id(id: int) -> int:
	## Explicit stable relationships prevent duplicate display names from
	## conflating item and block identities.
	var item_to_block := {
		"item.resource.log_oak": "natural.log.oak",
		"item.resource.sand": "terrain.sand.basic",
		"item.material.plank_oak": "construction.planks.oak",
		"item.material.beam_oak": "construction.beam.oak",
		"item.material.cobblestone": "construction.cobble.stone",
		"item.material.stone_brick": "construction.brick.stone",
	}
	var block_stable: String = item_to_block.get(get_stable_id(id), "")
	return BlockRegistry.get_id_by_stable_id(block_stable) if not block_stable.is_empty() else -1


func resolve_serialized_id(value: Variant) -> int:
	if value is String:
		return get_id_by_stable_id(value)
	if value is int or value is float:
		var numeric_id := int(value)
		return numeric_id if has_item(numeric_id) else -1
	return -1


func get_ids_by_name(display_name: String) -> Array:
	return _name_to_ids.get(display_name.to_lower(), []).duplicate()


func get_definition(id: int) -> Dictionary:
	return _items.get(id, {}).duplicate()


func get_visual_profile(id: int) -> Dictionary:
	var stable_id := get_stable_id(id)
	var kind := "resource"
	for candidate in [
		"pickaxe", "hammer", "sword", "spear", "staff", "wand", "bow",
		"crystal", "mana", "rune", "ingot", "plate",
	]:
		if candidate in stable_id:
			kind = "staff" if candidate == "wand" else (
				"crystal" if candidate == "mana" else candidate)
			break
	if stable_id.ends_with("_axe") or ".axe" in stable_id:
		kind = "axe"
	elif kind == "resource" and is_tool(id):
		kind = "tool"
	return {
		"source_pixels": [32, 32],
		"assembled_pixels": [32, 32],
		"model_kind": kind,
		"directional": kind in [
			"pickaxe", "axe", "hammer", "sword", "spear", "staff", "bow", "tool",
		],
	}


func get_all_ids() -> Array:
	return _items.keys()
