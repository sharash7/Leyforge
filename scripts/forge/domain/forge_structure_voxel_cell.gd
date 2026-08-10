@tool
class_name ForgeStructureVoxelCell
extends Resource
## One persistent gameplay-block cell in a visually authored structure source.
## The stable cell identity lets construction and damage records survive array
## reordering, repainting, and save/load round trips.

@export var schema_version := 1
@export var cell_id := ""
@export var position := Vector3i.ZERO
@export var block_id := ""
@export var placed_stage_id := "stage.foundation"
@export var removed_stage_id := ""
@export var metadata: Dictionary = {}


func to_record() -> Dictionary:
	return {
		"schema": "leyforge.forge.structure-voxel-cell",
		"schema_version": schema_version,
		"cell_id": cell_id,
		"position": [position.x, position.y, position.z],
		"block_id": block_id,
		"placed_stage_id": placed_stage_id,
		"removed_stage_id": removed_stage_id,
		"metadata": metadata.duplicate(true),
	}


func canonical_hash() -> String:
	return ForgeStableRecord.hash_record(to_record())


func duplicate_cell() -> ForgeStructureVoxelCell:
	var value := ForgeStructureVoxelCell.new()
	value.schema_version = schema_version
	value.cell_id = cell_id
	value.position = position
	value.block_id = block_id
	value.placed_stage_id = placed_stage_id
	value.removed_stage_id = removed_stage_id
	value.metadata = metadata.duplicate(true)
	return value
