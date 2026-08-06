@tool
class_name ForgeBlueprintStateDefinition
extends Resource
## Additive state delta for construction, damage, occupation and restoration.

const CONTRACT_VERSION := "22-stage5-v1"

@export var schema_version := 1
@export var state_id := ""
@export var blueprint_id := ""
@export var state_kind := "intact"
@export var parent_state_id := ""
@export var add_element_ids: PackedStringArray = []
@export var remove_element_ids: PackedStringArray = []
@export var material_role_overrides: Dictionary = {}
@export var enable_marker_role_ids: PackedStringArray = []
@export var disable_marker_role_ids: PackedStringArray = []
@export var enable_network_role_ids: PackedStringArray = []
@export var disable_network_role_ids: PackedStringArray = []
@export var surface_layer_ids: PackedStringArray = []
@export var repair_resource_ids: PackedStringArray = []
@export_range(0.0, 1.0) var damage_ratio := 0.0
@export var aliases: PackedStringArray = []
@export var dependency_ids: PackedStringArray = []
@export var lifecycle := "runtime_candidate"
@export var contract_version := CONTRACT_VERSION


func to_record() -> Dictionary:
	return {
		"schema": "leyforge.forge.blueprint-state-definition",
		"schema_version": schema_version,
		"state_id": state_id,
		"blueprint_id": blueprint_id,
		"state_kind": state_kind,
		"parent_state_id": parent_state_id,
		"add_element_ids": Array(add_element_ids),
		"remove_element_ids": Array(remove_element_ids),
		"material_role_overrides": material_role_overrides.duplicate(true),
		"enable_marker_role_ids": Array(enable_marker_role_ids),
		"disable_marker_role_ids": Array(disable_marker_role_ids),
		"enable_network_role_ids": Array(enable_network_role_ids),
		"disable_network_role_ids": Array(disable_network_role_ids),
		"surface_layer_ids": Array(surface_layer_ids),
		"repair_resource_ids": Array(repair_resource_ids),
		"damage_ratio": damage_ratio,
		"aliases": Array(aliases),
		"dependency_ids": Array(dependency_ids),
		"lifecycle": lifecycle,
		"contract_version": contract_version,
	}


func canonical_hash() -> String:
	return ForgeStableRecord.hash_record(to_record())
