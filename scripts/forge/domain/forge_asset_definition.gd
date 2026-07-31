@tool
class_name ForgeAssetDefinition
extends Resource
## Canonical editable source for one Forge presentation.

const CURRENT_SCHEMA_VERSION := 1

@export var schema_version := CURRENT_SCHEMA_VERSION
@export var source_revision := 1
@export var forge_asset_id := ""
@export var presentation_id := ""
@export var display_name := ""
@export var asset_kind := "standard_block_surface"
@export var source_status := "draft"
@export var source_pack_id := "pack.leyforge.project_visuals"
@export var gameplay_links: PackedStringArray = []
@export var presentation_contract_id := ""
@export var authoring_profile := "surface.block.standard"
@export var surface_set: Resource
@export var voxel_volume: Resource
@export var parts: Array[Resource] = []
@export var sockets: Array[Resource] = []
@export var palettes: Array[Resource] = []
@export var material_bindings: Dictionary = {}
@export var animation_set: Resource
@export var state_binding: Resource
@export var collision_profile: Resource
@export var footprint_profile: Resource
@export var representation_profiles: Dictionary = {}
@export var variant_sets: Array[Resource] = []
@export var dependency_ids: PackedStringArray = []
@export var planning_tags: PackedStringArray = []
@export var provenance_note := ""


func to_record() -> Dictionary:
	return {
		"schema_version": schema_version,
		"source_revision": source_revision,
		"forge_asset_id": forge_asset_id,
		"presentation_id": presentation_id,
		"display_name": display_name,
		"asset_kind": asset_kind,
		"source_status": source_status,
		"source_pack_id": source_pack_id,
		"gameplay_links": Array(gameplay_links),
		"presentation_contract_id": presentation_contract_id,
		"authoring_profile": authoring_profile,
		"surface_set": _resource_record(surface_set),
		"voxel_volume": _resource_record(voxel_volume),
		"parts": _resource_records(parts),
		"sockets": _resource_records(sockets),
		"palettes": _resource_records(palettes),
		"material_bindings": material_bindings.duplicate(true),
		"animation_set": _resource_record(animation_set),
		"state_binding": _resource_record(state_binding),
		"collision_profile": _resource_record(collision_profile),
		"footprint_profile": _resource_record(footprint_profile),
		"representation_profiles": representation_profiles.duplicate(true),
		"variant_sets": _resource_records(variant_sets),
		"dependency_ids": Array(dependency_ids),
		"planning_tags": Array(planning_tags),
		"provenance_note": provenance_note,
	}


func canonical_hash() -> String:
	return JSON.stringify(to_record()).sha256_text()


func bump_revision() -> void:
	source_revision += 1


static func _resource_record(value: Resource) -> Variant:
	if value == null:
		return null
	if value.has_method("to_record"):
		return value.call("to_record")
	return {"resource_path": value.resource_path}


static func _resource_records(values: Array[Resource]) -> Array:
	var records: Array = []
	for value in values:
		records.append(_resource_record(value))
	return records
