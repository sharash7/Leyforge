@tool
class_name ForgeEntityVariantProfile
extends Resource
## Deterministic appearance/equipment selection over a canonical entity source.

const CONTRACT_VERSION := "22-stage3-v1"

@export var schema_version := 1
@export var variant_profile_id := ""
@export var display_name := ""
@export var entity_definition_id := ""
@export var entity_role_ids: PackedStringArray = []
@export var material_variant_ids: PackedStringArray = []
@export var equipment_profile_ids: PackedStringArray = []
@export var proportion_scale := Vector3.ONE
@export var seed_channels: PackedStringArray = [
	"body", "materials", "equipment", "markings"]
@export var inheritance_profile_id := ""
@export var lifecycle := "draft"
@export var source_status := "validated_runtime_source"
@export var contract_version := CONTRACT_VERSION
@export var dependency_ids: PackedStringArray = []
@export var aliases: PackedStringArray = []
@export var legacy_fallback := ""


func to_record() -> Dictionary:
	return {
		"schema": "leyforge.forge.entity-variant-profile",
		"schema_version": schema_version,
		"variant_profile_id": variant_profile_id,
		"display_name": display_name,
		"entity_definition_id": entity_definition_id,
		"entity_role_ids": Array(entity_role_ids),
		"material_variant_ids": Array(material_variant_ids),
		"equipment_profile_ids": Array(equipment_profile_ids),
		"proportion_scale": proportion_scale,
		"seed_channels": Array(seed_channels),
		"inheritance_profile_id": inheritance_profile_id,
		"lifecycle": lifecycle,
		"source_status": source_status,
		"contract_version": contract_version,
		"dependency_ids": Array(dependency_ids),
		"aliases": Array(aliases),
		"legacy_fallback": legacy_fallback,
	}


func canonical_hash() -> String:
	return ForgeStableRecord.hash_record(to_record())
