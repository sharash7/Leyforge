@tool
class_name ForgeFootprintProfile
extends Resource

@export var schema_version := 1
@export var footprint_profile_id := ""
@export var anchor_cell := Vector3i.ZERO
@export var occupied_cells: Array[Vector3i] = [Vector3i.ZERO]
@export var clearance_cells: Array[Vector3i] = []
@export var allowed_rotations := PackedInt32Array([0, 1, 2, 3])
@export var allowed_placement_faces: PackedStringArray = ["floor"]
@export var support_required := true


func to_record() -> Dictionary:
	var occupied: Array = []
	for cell in occupied_cells:
		occupied.append([cell.x, cell.y, cell.z])
	var clearance: Array = []
	for cell in clearance_cells:
		clearance.append([cell.x, cell.y, cell.z])
	return {
		"schema_version": schema_version,
		"footprint_profile_id": footprint_profile_id,
		"anchor_cell": [anchor_cell.x, anchor_cell.y, anchor_cell.z],
		"occupied_cells": occupied,
		"clearance_cells": clearance,
		"allowed_rotations": Array(allowed_rotations),
		"allowed_placement_faces": Array(allowed_placement_faces),
		"support_required": support_required,
	}
