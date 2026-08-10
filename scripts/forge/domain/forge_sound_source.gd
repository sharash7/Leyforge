@tool
class_name ForgeSoundSource
extends ForgePresentationDefinition

@export var source_path := ""
@export var source_hash := ""
@export var media_format := "wav"
@export var channel_layout := "mono"
@export var sample_rate_hz := 48000
@export var duration_seconds := 0.0
@export var transformation_history: Array[Dictionary] = []
@export var procedural_recipe_id := ""
@export var procedural_seed := 0
@export var generator_version := ""
@export var waveform_preview: PackedFloat32Array = []
@export var regions: Array[Dictionary] = []
@export var loop_start_seconds := -1.0
@export var loop_end_seconds := -1.0
@export var processing_settings: Dictionary = {}
@export var loudness_analysis: Dictionary = {}


func _init() -> void:
	schema_id = "leyforge.forge.sound-source"
	asset_class = "sound_source"


func to_record() -> Dictionary:
	return _record({
		"source_path": source_path,
		"source_hash": source_hash,
		"media_format": media_format,
		"channel_layout": channel_layout,
		"sample_rate_hz": sample_rate_hz,
		"duration_seconds": duration_seconds,
		"transformation_history": transformation_history.duplicate(true),
		"procedural_recipe_id": procedural_recipe_id,
		"procedural_seed": procedural_seed,
		"generator_version": generator_version,
		"waveform_preview": Array(waveform_preview),
		"regions": regions.duplicate(true),
		"loop_start_seconds": loop_start_seconds,
		"loop_end_seconds": loop_end_seconds,
		"processing_settings": processing_settings.duplicate(true),
		"loudness_analysis": loudness_analysis.duplicate(true),
	})
