@tool
class_name ForgePersistentSurfaceRecord
extends Resource
## Optional bounded presentation aftermath record stored inside save v17.

@export var schema_version := 1
@export var record_id := ""
@export var layer_id := ""
@export var owner_id := ""
@export var chunk_key := ""
@export var position := Vector3.ZERO
@export_range(0.0, 1.0) var intensity := 0.0
@export var created_tick := 0
@export var expires_tick := 0
@export var seed := 0
@export var metadata: Dictionary = {}


func to_record() -> Dictionary:
	return {
		"schema": "leyforge.forge.persistent-surface-record",
		"schema_version": schema_version,
		"record_id": record_id,
		"layer_id": layer_id,
		"owner_id": owner_id,
		"chunk_key": chunk_key,
		"position": [position.x, position.y, position.z],
		"intensity": intensity,
		"created_tick": created_tick,
		"expires_tick": expires_tick,
		"seed": seed,
		"metadata": metadata.duplicate(true),
	}


func canonical_hash() -> String:
	return ForgeStableRecord.hash_record(to_record())
