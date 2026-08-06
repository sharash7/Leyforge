@tool
class_name ForgeGameplayProxyProfile
extends Resource
## Presentation-aligned proxy declaration; gameplay remains authoritative.

const CONTRACT_VERSION := "22-stage3-v1"

@export var schema_version := 1
@export var gameplay_proxy_profile_id := ""
@export var display_name := ""
@export var entity_definition_id := ""
@export var collision_shape := "capsule"
@export var collision_size_meters := Vector3(0.5, 1.8, 0.5)
@export var region_proxies: Array[Dictionary] = []
@export var interaction_role_ids: PackedStringArray = []
@export var ai_marker_role_ids: PackedStringArray = []
@export var compatibility_review := "open"
@export var lifecycle := "draft"
@export var contract_version := CONTRACT_VERSION
@export var dependency_ids: PackedStringArray = []


func to_record() -> Dictionary:
	return {
		"schema": "leyforge.forge.gameplay-proxy-profile",
		"schema_version": schema_version,
		"gameplay_proxy_profile_id": gameplay_proxy_profile_id,
		"display_name": display_name,
		"entity_definition_id": entity_definition_id,
		"collision_shape": collision_shape,
		"collision_size_meters": collision_size_meters,
		"region_proxies": region_proxies.duplicate(true),
		"interaction_role_ids": Array(interaction_role_ids),
		"ai_marker_role_ids": Array(ai_marker_role_ids),
		"compatibility_review": compatibility_review,
		"lifecycle": lifecycle,
		"contract_version": contract_version,
		"dependency_ids": Array(dependency_ids),
	}


func canonical_hash() -> String:
	return ForgeStableRecord.hash_record(to_record())
