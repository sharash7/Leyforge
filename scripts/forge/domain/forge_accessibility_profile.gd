@tool
class_name ForgeAccessibilityProfile
extends ForgePresentationDefinition

@export var reduced_motion_profile_id := ""
@export var reduced_flash_profile_id := ""
@export var colour_independent_profile_id := ""
@export var audio_muted_profile_id := ""
@export var caption_key := ""
@export var directional_indicator_id := ""
@export var equivalent_feedback: Dictionary = {}
@export var critical_event_ids: PackedStringArray = []


func _init() -> void:
	schema_id = "leyforge.forge.accessibility-profile"
	asset_class = "accessibility_profile"


func to_record() -> Dictionary:
	return _record({
		"reduced_motion_profile_id": reduced_motion_profile_id,
		"reduced_flash_profile_id": reduced_flash_profile_id,
		"colour_independent_profile_id": colour_independent_profile_id,
		"audio_muted_profile_id": audio_muted_profile_id,
		"caption_key": caption_key,
		"directional_indicator_id": directional_indicator_id,
		"equivalent_feedback": equivalent_feedback.duplicate(true),
		"critical_event_ids": Array(critical_event_ids),
	})
