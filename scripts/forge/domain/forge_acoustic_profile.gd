@tool
class_name ForgeAcousticProfile
extends ForgePresentationDefinition

@export var acoustic_kind := "zone"
@export var zone_role_ids: PackedStringArray = []
@export var portal_role_ids: PackedStringArray = []
@export var reverb_profile_id := ""
@export var transmission := 1.0
@export var occlusion := 0.0
@export var fallback_profile_id := ""


func _init() -> void:
	schema_id = "leyforge.forge.acoustic-profile"
	asset_class = "acoustic_profile"


func to_record() -> Dictionary:
	return _record({
		"acoustic_kind": acoustic_kind,
		"zone_role_ids": Array(zone_role_ids),
		"portal_role_ids": Array(portal_role_ids),
		"reverb_profile_id": reverb_profile_id,
		"transmission": transmission,
		"occlusion": occlusion,
		"fallback_profile_id": fallback_profile_id,
	})
