@tool
class_name ForgeSpatialAudioProfile
extends ForgePresentationDefinition

@export var maximum_distance_meters := 24.0
@export var attenuation_model := "inverse_distance"
@export var directionality := 0.0
@export var occlusion_policy := "none"
@export var reverb_send := 0.0
@export var priority := 0
@export var virtualisation_policy := "stop"


func _init() -> void:
	schema_id = "leyforge.forge.spatial-audio-profile"
	asset_class = "spatial_audio_profile"


func to_record() -> Dictionary:
	return _record({
		"maximum_distance_meters": maximum_distance_meters,
		"attenuation_model": attenuation_model,
		"directionality": directionality,
		"occlusion_policy": occlusion_policy,
		"reverb_send": reverb_send,
		"priority": priority,
		"virtualisation_policy": virtualisation_policy,
	})
