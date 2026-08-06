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
	})
