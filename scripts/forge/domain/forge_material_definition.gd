@tool
class_name ForgeMaterialDefinition
extends Resource
## Shared Material DNA and state-overlay compatibility.

@export var schema_version := 1
@export var material_id := ""
@export var display_name := ""
@export var family := ""
@export var parent_material_id := ""
@export var rendering_class := "opaque"
@export var roughness_default := 0.8
@export var metallic_default := 0.0
@export var emission_default := 0.0
@export var opacity_mode := "opaque"
@export var texture_sampling_profile := "pixel_nearest"
@export var overlay_compatibility: PackedStringArray = []
@export var animation_parameters: PackedStringArray = []
@export var settings: Dictionary = {}
@export var applicable_domains: PackedStringArray = []
@export var semantic_role_ids: PackedStringArray = []
@export var swatch_hexes: PackedStringArray = []
@export var source_status := "draft"
@export var lifecycle := "draft"
@export var contract_version := ""


func to_record() -> Dictionary:
	return {
		"schema_version": schema_version,
		"material_id": material_id,
		"display_name": display_name,
		"family": family,
		"parent_material_id": parent_material_id,
		"rendering_class": rendering_class,
		"roughness_default": roughness_default,
		"metallic_default": metallic_default,
		"emission_default": emission_default,
		"opacity_mode": opacity_mode,
		"texture_sampling_profile": texture_sampling_profile,
		"overlay_compatibility": Array(overlay_compatibility),
		"animation_parameters": Array(animation_parameters),
		"settings": settings.duplicate(true),
		"applicable_domains": Array(applicable_domains),
		"semantic_role_ids": Array(semantic_role_ids),
		"swatch_hexes": Array(swatch_hexes),
		"source_status": source_status,
		"lifecycle": lifecycle,
		"contract_version": contract_version,
	}


func canonical_hash() -> String:
	return ForgeStableRecord.hash_record(to_record())
