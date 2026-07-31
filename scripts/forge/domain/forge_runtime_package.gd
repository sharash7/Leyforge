@tool
class_name ForgeRuntimePackage
extends Resource

@export var schema_version := 1
@export var presentation_id := ""
@export var contract_version := 1
@export var root_scene_path := ""
@export var mesh_path := ""
@export var material_paths: PackedStringArray = []
@export var collision_path := ""
@export var animation_library_path := ""
@export var state_binding_path := ""
@export var icon_path := ""
@export var bounds := AABB()
@export var socket_map: Dictionary = {}
@export var lod_profile: Dictionary = {}
@export var variant_compatibility: PackedStringArray = []
@export var runtime_metadata: Dictionary = {}
@export var product_hash := ""


func to_record() -> Dictionary:
	return {
		"schema_version": schema_version,
		"presentation_id": presentation_id,
		"contract_version": contract_version,
		"root_scene_path": root_scene_path,
		"mesh_path": mesh_path,
		"material_paths": Array(material_paths),
		"collision_path": collision_path,
		"animation_library_path": animation_library_path,
		"state_binding_path": state_binding_path,
		"icon_path": icon_path,
		"bounds": str(bounds),
		"socket_map": socket_map.duplicate(true),
		"lod_profile": lod_profile.duplicate(true),
		"variant_compatibility": Array(variant_compatibility),
		"runtime_metadata": runtime_metadata.duplicate(true),
		"product_hash": product_hash,
	}
