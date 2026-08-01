@tool
class_name ForgeBlueprintElement
extends Resource

@export var schema_version := 1
@export var element_id := ""
@export var element_kind := "module"
@export var module_id := ""
@export var child_blueprint_id := ""
@export var material_role_id := ""
@export var marker_role_ids: PackedStringArray = []
@export var socket_role_ids: PackedStringArray = []
@export var network_role_ids: PackedStringArray = []
@export var stage_id := ""
@export var position := Vector3i.ZERO
@export var size := Vector3i.ONE
@export_range(0, 3) var rotation_quarters := 0
@export var optional := false
@export var source_id := ""
@export var metadata: Dictionary = {}


func to_record() -> Dictionary:
	return {
		"schema": "leyforge.forge.blueprint-element",
		"schema_version": schema_version,
		"element_id": element_id,
		"element_kind": element_kind,
		"module_id": module_id,
		"child_blueprint_id": child_blueprint_id,
		"material_role_id": material_role_id,
		"marker_role_ids": Array(marker_role_ids),
		"socket_role_ids": Array(socket_role_ids),
		"network_role_ids": Array(network_role_ids),
		"stage_id": stage_id,
		"position": [position.x, position.y, position.z],
		"size": [size.x, size.y, size.z],
		"rotation_quarters": rotation_quarters,
		"optional": optional,
		"source_id": source_id,
		"metadata": metadata.duplicate(true),
	}


func canonical_hash() -> String:
	return ForgeStableRecord.hash_record(to_record())
