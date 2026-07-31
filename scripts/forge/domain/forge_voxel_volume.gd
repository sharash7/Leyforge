@tool
class_name ForgeVoxelVolume
extends Resource
## Compact palette-indexed authoring volume. Zero is empty; N stores palette N-1.

@export var schema_version := 1
@export var dimensions := Vector3i(32, 32, 32)
@export var density_profile := "voxel.standard.block"
@export var voxel_size_meters := 0.03125
@export var cells := PackedByteArray()
@export var helper_flags := PackedByteArray()


func ensure_storage() -> void:
	var required_size := maxi(1, dimensions.x * dimensions.y * dimensions.z)
	if cells.size() != required_size:
		var replacement := PackedByteArray()
		replacement.resize(required_size)
		for index in mini(cells.size(), replacement.size()):
			replacement[index] = cells[index]
		cells = replacement
	if helper_flags.size() != required_size:
		var replacement_flags := PackedByteArray()
		replacement_flags.resize(required_size)
		for index in mini(helper_flags.size(), replacement_flags.size()):
			replacement_flags[index] = helper_flags[index]
		helper_flags = replacement_flags


func index_of(position: Vector3i) -> int:
	return (position.z * dimensions.y + position.y) * dimensions.x + position.x


func contains(position: Vector3i) -> bool:
	return position.x >= 0 and position.y >= 0 and position.z >= 0 \
		and position.x < dimensions.x and position.y < dimensions.y \
		and position.z < dimensions.z


func set_cell(position: Vector3i, palette_index: int) -> bool:
	if not contains(position):
		return false
	ensure_storage()
	cells[index_of(position)] = clampi(palette_index + 1, 0, 255)
	return true


func clear_cell(position: Vector3i) -> bool:
	if not contains(position):
		return false
	ensure_storage()
	cells[index_of(position)] = 0
	return true


func get_cell(position: Vector3i) -> int:
	if not contains(position):
		return -1
	ensure_storage()
	return int(cells[index_of(position)]) - 1


func set_helper_flag(position: Vector3i, flag: int) -> bool:
	if not contains(position):
		return false
	ensure_storage()
	helper_flags[index_of(position)] = clampi(flag, 0, 255)
	return true


func occupied_count() -> int:
	ensure_storage()
	var count := 0
	for value in cells:
		if value != 0:
			count += 1
	return count


func resize_volume(new_dimensions: Vector3i) -> bool:
	if new_dimensions.x <= 0 or new_dimensions.y <= 0 or new_dimensions.z <= 0:
		return false
	ensure_storage()
	var old_dimensions := dimensions
	var old_cells := cells.duplicate()
	var old_flags := helper_flags.duplicate()
	dimensions = new_dimensions
	cells = PackedByteArray()
	helper_flags = PackedByteArray()
	ensure_storage()
	var shared := Vector3i(
		mini(old_dimensions.x, dimensions.x),
		mini(old_dimensions.y, dimensions.y),
		mini(old_dimensions.z, dimensions.z))
	for z in shared.z:
		for y in shared.y:
			for x in shared.x:
				var old_index := (z * old_dimensions.y + y) * old_dimensions.x + x
				var new_index := index_of(Vector3i(x, y, z))
				cells[new_index] = old_cells[old_index]
				helper_flags[new_index] = old_flags[old_index]
	return true


func to_record() -> Dictionary:
	ensure_storage()
	return {
		"schema_version": schema_version,
		"dimensions": [dimensions.x, dimensions.y, dimensions.z],
		"density_profile": density_profile,
		"voxel_size_meters": voxel_size_meters,
		"cells": Array(cells),
		"helper_flags": Array(helper_flags),
	}
