@tool
class_name ForgeSoundEvent
extends ForgePresentationDefinition

@export var source_ids: PackedStringArray = []
@export var layer_records: Array[Dictionary] = []
@export var variation_policy := "seeded_round_robin"
@export var loop_policy := "one_shot"
@export var concurrency_group := ""
@export var maximum_voices := 1
@export var spatial_audio_profile_id := ""
@export var bus_id := "audio.bus.sfx"
@export var caption_key := ""
@export var critical_cue := false


func _init() -> void:
	schema_id = "leyforge.forge.sound-event"
	asset_class = "sound_event"


func to_record() -> Dictionary:
	return _record({
		"source_ids": Array(source_ids),
		"layer_records": layer_records.duplicate(true),
		"variation_policy": variation_policy,
		"loop_policy": loop_policy,
		"concurrency_group": concurrency_group,
		"maximum_voices": maximum_voices,
		"spatial_audio_profile_id": spatial_audio_profile_id,
		"bus_id": bus_id,
		"caption_key": caption_key,
		"critical_cue": critical_cue,
	})
