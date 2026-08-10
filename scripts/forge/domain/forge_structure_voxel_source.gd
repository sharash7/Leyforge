@tool
class_name ForgeStructureVoxelSource
extends Resource
## Sparse, editable gameplay-block grid for buildings and reusable modules.
## Runtime products still receive ordinary ForgeBlueprintElement records.

const DEFAULT_STAGE_IDS := [
	"stage.foundation", "stage.frame", "stage.enclosure",
	"stage.interior", "stage.functional",
]

@export var schema_version := 1
@export var origin := Vector3i.ZERO
@export var dimensions := Vector3i(32, 16, 32)
@export var cells: Array[ForgeStructureVoxelCell] = []
@export var stage_ids := PackedStringArray(DEFAULT_STAGE_IDS)
@export var next_cell_serial := 1
@export var editor_metadata: Dictionary = {}


func ensure_defaults() -> void:
	dimensions = dimensions.max(Vector3i.ONE)
	if stage_ids.is_empty():
		stage_ids = PackedStringArray(DEFAULT_STAGE_IDS)
	next_cell_serial = maxi(1, next_cell_serial)


func contains(position: Vector3i) -> bool:
	return position.x >= origin.x and position.y >= origin.y \
		and position.z >= origin.z and position.x < origin.x + dimensions.x \
		and position.y < origin.y + dimensions.y \
		and position.z < origin.z + dimensions.z


func ensure_contains(position: Vector3i) -> void:
	var old_max := origin + dimensions - Vector3i.ONE
	var new_min := Vector3i(
		mini(origin.x, position.x), mini(origin.y, position.y),
		mini(origin.z, position.z))
	var new_max := Vector3i(
		maxi(old_max.x, position.x), maxi(old_max.y, position.y),
		maxi(old_max.z, position.z))
	origin = new_min
	dimensions = new_max - new_min + Vector3i.ONE


func cell_index(position: Vector3i) -> int:
	for index in cells.size():
		var cell := cells[index]
		if cell != null and cell.position == position:
			return index
	return -1


func cell_at(position: Vector3i) -> ForgeStructureVoxelCell:
	var index := cell_index(position)
	return cells[index] if index >= 0 else null


func place_cell(position: Vector3i, block_id: String, stage_id := "") \
		-> ForgeStructureVoxelCell:
	ensure_defaults()
	ensure_contains(position)
	var resolved_stage := stage_id if not stage_id.is_empty() else stage_ids[0]
	if resolved_stage not in stage_ids:
		stage_ids.append(resolved_stage)
	var value := cell_at(position)
	if value == null:
		value = ForgeStructureVoxelCell.new()
		value.cell_id = "cell_%08d" % next_cell_serial
		next_cell_serial += 1
		value.position = position
		cells.append(value)
	value.block_id = block_id
	value.placed_stage_id = resolved_stage
	value.removed_stage_id = ""
	return value


func remove_cell(position: Vector3i, stage_id := "") -> bool:
	var index := cell_index(position)
	if index < 0:
		return false
	var cell := cells[index]
	var resolved_stage := stage_id.strip_edges()
	if resolved_stage.is_empty() or cell.placed_stage_id == resolved_stage:
		cells.remove_at(index)
	else:
		if resolved_stage not in stage_ids:
			stage_ids.append(resolved_stage)
		cell.removed_stage_id = resolved_stage
	return true


func active_cells(stage_id := "") -> Array[ForgeStructureVoxelCell]:
	ensure_defaults()
	var target_index := stage_ids.size() - 1
	if not stage_id.is_empty() and stage_id in stage_ids:
		target_index = stage_ids.find(stage_id)
	var result: Array[ForgeStructureVoxelCell] = []
	for cell in cells:
		if cell == null:
			continue
		var placed_index := stage_ids.find(cell.placed_stage_id)
		var removed_index := stage_ids.find(cell.removed_stage_id) \
			if not cell.removed_stage_id.is_empty() else -1
		if placed_index >= 0 and placed_index <= target_index \
				and (removed_index < 0 or removed_index > target_index):
			result.append(cell)
	return result


func duplicate_source() -> ForgeStructureVoxelSource:
	var value := ForgeStructureVoxelSource.new()
	value.schema_version = schema_version
	value.origin = origin
	value.dimensions = dimensions
	value.stage_ids = stage_ids.duplicate()
	value.next_cell_serial = next_cell_serial
	value.editor_metadata = editor_metadata.duplicate(true)
	for cell in cells:
		if cell != null:
			value.cells.append(cell.duplicate_cell())
	return value


func to_element_records() -> Array[Dictionary]:
	var records: Array[Dictionary] = []
	for cell in cells:
		if cell == null:
			continue
		records.append({
			"schema": "leyforge.forge.blueprint-element",
			"schema_version": 1,
			"element_id": "voxel.%s" % ForgeId.safe_filename(cell.cell_id),
			"element_kind": "block",
			"module_id": "",
			"child_blueprint_id": "",
			"material_role_id": "",
			"marker_role_ids": [],
			"socket_role_ids": [],
			"network_role_ids": [],
			"stage_id": cell.placed_stage_id,
			"position": [cell.position.x, cell.position.y, cell.position.z],
			"size": [1, 1, 1],
			"rotation_quarters": 0,
			"optional": false,
			"source_id": cell.block_id,
			"metadata": {
				"structure_voxel_cell_id": cell.cell_id,
				"removed_stage_id": cell.removed_stage_id,
			},
		})
	records.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		return str(a.get("element_id", "")) < str(b.get("element_id", "")))
	return records


func generated_stage_records(
		declared_deltas: Array[ForgeConstructionDelta] = []) -> Array[Dictionary]:
	ensure_defaults()
	var declared_by_id := {}
	for delta in declared_deltas:
		if delta != null:
			declared_by_id[delta.stage_id] = delta
	var records: Array[Dictionary] = []
	for index in stage_ids.size():
		var stage_id := str(stage_ids[index])
		var adds := PackedStringArray()
		var removes := PackedStringArray()
		for cell in cells:
			if cell == null:
				continue
			var element_id := "voxel.%s" % ForgeId.safe_filename(cell.cell_id)
			if cell.placed_stage_id == stage_id:
				adds.append(element_id)
			if cell.removed_stage_id == stage_id:
				removes.append(element_id)
		adds.sort()
		removes.sort()
		var declared: ForgeConstructionDelta = declared_by_id.get(stage_id)
		var dependencies := PackedStringArray()
		var enabled := PackedStringArray()
		var disabled := PackedStringArray()
		var display_name := stage_id.trim_prefix("stage.").replace("_", " ").capitalize()
		if index > 0:
			dependencies.append(str(stage_ids[index - 1]))
		if declared != null:
			display_name = declared.display_name \
				if not declared.display_name.is_empty() else display_name
			dependencies = declared.dependency_stage_ids.duplicate() \
				if not declared.dependency_stage_ids.is_empty() else dependencies
			enabled = declared.enable_marker_role_ids.duplicate()
			disabled = declared.disable_marker_role_ids.duplicate()
		records.append({
			"schema": "leyforge.forge.construction-delta",
			"schema_version": 2,
			"delta_id": declared.delta_id if declared != null \
				else "construction.delta.%s" % ForgeId.safe_filename(stage_id),
			"stage_id": stage_id,
			"display_name": display_name,
			"sequence_index": index,
			"add_element_ids": Array(adds),
			"remove_element_ids": Array(removes),
			"enable_marker_role_ids": Array(enabled),
			"disable_marker_role_ids": Array(disabled),
			"dependency_stage_ids": Array(dependencies),
		})
	return records


func to_record() -> Dictionary:
	var cell_records: Array[Dictionary] = []
	for cell in cells:
		if cell != null:
			cell_records.append(cell.to_record())
	cell_records.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		var a_position: Array = a.get("position", [0, 0, 0])
		var b_position: Array = b.get("position", [0, 0, 0])
		if a_position != b_position:
			return str(a_position) < str(b_position)
		return str(a.get("cell_id", "")) < str(b.get("cell_id", "")))
	return {
		"schema": "leyforge.forge.structure-voxel-source",
		"schema_version": schema_version,
		"origin": [origin.x, origin.y, origin.z],
		"dimensions": [dimensions.x, dimensions.y, dimensions.z],
		"cells": cell_records,
		"stage_ids": Array(stage_ids),
		"next_cell_serial": next_cell_serial,
	}


func canonical_hash() -> String:
	return ForgeStableRecord.hash_record(to_record())


static func from_elements(elements: Array[ForgeBlueprintElement]) \
		-> ForgeStructureVoxelSource:
	var value := ForgeStructureVoxelSource.new()
	value.ensure_defaults()
	for element in elements:
		if element == null or element.source_id.is_empty() \
				or not element.module_id.is_empty() \
				or element.element_kind in [
					"marker", "semantic_marker", "socket", "network",
					"child_blueprint", "module"]:
			continue
		var extent := element.size.max(Vector3i.ONE)
		for x in extent.x:
			for y in extent.y:
				for z in extent.z:
					var cell := value.place_cell(
						element.position + Vector3i(x, y, z), element.source_id,
						element.stage_id if not element.stage_id.is_empty() \
						else value.stage_ids[0])
					cell.metadata["converted_from_element_id"] = element.element_id
	return value
