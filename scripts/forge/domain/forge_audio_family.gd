@tool
class_name ForgeAudioFamily
extends ForgePresentationDefinition

@export var parent_family_id := ""
@export var default_spatial_profile_id := ""
@export var intensity_bands: Array[Dictionary] = []
@export var pitch_range := Vector2(1.0, 1.0)
@export var volume_range_db := Vector2.ZERO
@export var concurrency_defaults: Dictionary = {}
@export var fallback_event_id := ""


func _init() -> void:
	schema_id = "leyforge.forge.audio-family"
	asset_class = "audio_family"


func to_record() -> Dictionary:
	return _record({
		"parent_family_id": parent_family_id,
		"default_spatial_profile_id": default_spatial_profile_id,
		"intensity_bands": intensity_bands.duplicate(true),
		"pitch_range": [pitch_range.x, pitch_range.y],
		"volume_range_db": [volume_range_db.x, volume_range_db.y],
		"concurrency_defaults": concurrency_defaults.duplicate(true),
		"fallback_event_id": fallback_event_id,
	})
