class_name ForgeRegistryBridge
extends RefCounted
## Read-only gameplay registry view plus explicit presentation-link derivation.

const REGISTRY_PATH := "res://data/registry/voxel_registry.json"


func all_gameplay_records() -> Array[Dictionary]:
	var records: Array[Dictionary] = []
	var data: Variant = JSON.parse_string(
		FileAccess.get_file_as_string(REGISTRY_PATH))
	if not data is Array:
		return records
	for value in data:
		if not value is Dictionary:
			continue
		var entry: Dictionary = value
		var kind := str(entry.get("type", ""))
		if kind not in ["block", "item"]:
			continue
		var gameplay_id := str(entry.get("original_id", ""))
		var numeric_id := int(entry.get("numeric_id", -1))
		if gameplay_id.is_empty() or numeric_id <= 0:
			continue
		records.append(_record_from_registry(kind, numeric_id, entry))
	records.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		return str(a["gameplay_id"]) < str(b["gameplay_id"]))
	return records


func record_for(gameplay_id: String) -> Dictionary:
	for record in all_gameplay_records():
		if str(record.get("gameplay_id", "")) == gameplay_id:
			return record
	return {}


func presentation_id_for(gameplay_id: String) -> String:
	return ForgeId.presentation_id_for(gameplay_id)


func contract_id_for(kind: String, gameplay_id: String) -> String:
	if kind == "item":
		if gameplay_id.begins_with("item.tool.") \
				or gameplay_id.begins_with("item.weapon."):
			return "contract.item.held_tool.v1"
		return "contract.item.resource.v1"
	var shape := shape_for_stable_id(gameplay_id)
	if shape == "chute":
		return "contract.automation.chute.v1"
	if shape == "furnace":
		return "contract.machine.furnace.v1"
	if shape in ["door", "chest", "workbench", "post"]:
		return "contract.block.interactive.v1"
	return "contract.block.%s.v1" % (
		"standard_cube" if shape == "cube" else "generated_shape")


func authoring_mode_for(kind: String, gameplay_id: String) -> String:
	if kind == "item":
		return "voxel"
	var shape := shape_for_stable_id(gameplay_id)
	if shape == "cube":
		return "surface"
	if shape in ["furnace", "workbench", "chest", "crusher"]:
		return "compound"
	return "voxel"


func shape_for_stable_id(gameplay_id: String) -> String:
	if ".slab." in gameplay_id:
		return "slab"
	if ".stair." in gameplay_id:
		return "stair"
	if "furnace" in gameplay_id:
		return "furnace"
	if "chest" in gameplay_id or "crate" in gameplay_id:
		return "chest"
	if "transport.chute" in gameplay_id:
		return "chute"
	if "crusher" in gameplay_id:
		return "crusher"
	if "conduit" in gameplay_id:
		return "conduit"
	if "door" in gameplay_id:
		return "door"
	if "workbench" in gameplay_id or "rune_table" in gameplay_id:
		return "workbench"
	if gameplay_id in [
		"village.marker.basic", "village.blueprint_marker.basic",
		"village.camp_marker.basic",
	]:
		return "post"
	return "cube"


func _record_from_registry(
		kind: String, numeric_id: int, entry: Dictionary) -> Dictionary:
	var gameplay_id := str(entry.get("original_id", ""))
	return {
		"kind": kind,
		"numeric_id": numeric_id,
		"gameplay_id": gameplay_id,
		"display_name": str(entry.get("display_name", gameplay_id)),
		"category": str(entry.get("category", "")),
		"presentation_id": str(entry.get(
			"presentation_id", presentation_id_for(gameplay_id))),
		"contract_id": str(entry.get(
			"presentation_contract_id", contract_id_for(kind, gameplay_id))),
		"authoring_mode": authoring_mode_for(kind, gameplay_id),
		"legacy_fallback": true,
	}
