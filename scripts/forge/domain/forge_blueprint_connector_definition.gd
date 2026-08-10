@tool
class_name ForgeBlueprintConnectorDefinition
extends Resource
## A typed, local connection point on a reusable structure/room module.

const CONTRACT_VERSION := "forge-authoring-v1"
const CARDINAL_DIRECTIONS: Array[Vector3i] = [
	Vector3i.RIGHT, Vector3i.LEFT, Vector3i.FORWARD, Vector3i.BACK,
	Vector3i.UP, Vector3i.DOWN,
]

@export var schema_version := 1
@export var connector_id := ""
@export var display_name := "Connection Point"
@export var owner_module_id := ""
@export var socket_role_id := "socket.role.structure.passage"
@export var position := Vector3i.ZERO
@export var direction := Vector3i.FORWARD
@export var connection_tags: PackedStringArray = ["passage"]
@export var blocked_tags: PackedStringArray = []
@export var compatibility_group := "structure.passage"
@export var opening_size := Vector3i(1, 2, 1)
@export var clearance := Vector3i.ONE
@export var elevation_delta := 0
@export var navigation_mode := "walk"
@export var terrain_policy := "inherit_module"
@export var allowed_rotations: PackedInt32Array = [0, 1, 2, 3]
@export var one_way := false
@export_range(1, 8) var maximum_connections := 1
@export var source_status := "draft"
@export var lifecycle := "draft"
@export var dependency_ids: PackedStringArray = []
@export var contract_version := CONTRACT_VERSION


func to_record() -> Dictionary:
	return {
		"schema": "leyforge.forge.blueprint-connector-definition",
		"schema_version": schema_version,
		"connector_id": connector_id,
		"display_name": display_name,
		"owner_module_id": owner_module_id,
		"socket_role_id": socket_role_id,
		"position": [position.x, position.y, position.z],
		"direction": [direction.x, direction.y, direction.z],
		"connection_tags": Array(connection_tags),
		"blocked_tags": Array(blocked_tags),
		"compatibility_group": compatibility_group,
		"opening_size": [opening_size.x, opening_size.y, opening_size.z],
		"clearance": [clearance.x, clearance.y, clearance.z],
		"elevation_delta": elevation_delta,
		"navigation_mode": navigation_mode,
		"terrain_policy": terrain_policy,
		"allowed_rotations": Array(allowed_rotations),
		"one_way": one_way,
		"maximum_connections": maximum_connections,
		"source_status": source_status,
		"lifecycle": lifecycle,
		"dependency_ids": Array(dependency_ids),
		"contract_version": contract_version,
	}


func canonical_hash() -> String:
	return ForgeStableRecord.hash_record(to_record())


func can_connect_to(other: ForgeBlueprintConnectorDefinition) -> bool:
	if other == null or connector_id == other.connector_id:
		return false
	if one_way and other.one_way:
		return false
	if not compatibility_group.is_empty() and not other.compatibility_group.is_empty() \
			and compatibility_group != other.compatibility_group:
		return false
	if not socket_role_id.is_empty() and not other.socket_role_id.is_empty() \
			and socket_role_id != other.socket_role_id:
		return false
	for tag in connection_tags:
		if tag in other.blocked_tags:
			return false
	for tag in other.connection_tags:
		if tag in blocked_tags:
			return false
	if connection_tags.is_empty() or other.connection_tags.is_empty():
		return true
	for tag in connection_tags:
		if tag in other.connection_tags:
			return true
	return false
