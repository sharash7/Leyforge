@tool
class_name ForgeSynthPatchDefinition
extends ForgePresentationDefinition
## File-free, deterministic instrument/noise source authored inside Audio Forge.

const WAVEFORMS: PackedStringArray = [
	"sine", "triangle", "saw", "square", "pulse", "noise", "impulse",
]

@export_range(300.0, 500.0, 0.1) var tuning_a4_hz := 440.0
@export_range(0, 127) var reference_midi_note := 69
@export_range(0, 127) var preview_midi_note := 60
@export_range(-100.0, 100.0, 0.1) var preview_cent_offset := 0.0
@export var generator_version := "forge-audio-v1"
@export var oscillators: Array[Dictionary] = [{
	"waveform": "sine",
	"level": 0.8,
	"detune_cents": 0.0,
	"octave": 0,
	"phase": 0.0,
	"pulse_width": 0.5,
}]
@export var amplitude_envelope: Dictionary = {
	"attack_seconds": 0.01,
	"decay_seconds": 0.12,
	"sustain_level": 0.7,
	"release_seconds": 0.2,
}
@export var filter_settings: Dictionary = {
	"type": "low_pass",
	"cutoff_hz": 12000.0,
	"resonance": 0.0,
}
@export var modulation: Dictionary = {
	"lfo_waveform": "sine",
	"lfo_rate_hz": 0.0,
	"pitch_depth_cents": 0.0,
	"amplitude_depth": 0.0,
}
@export_range(-60.0, 6.0, 0.1) var master_gain_db := -6.0
@export_range(8000, 96000, 1000) var sample_rate_hz := 48000
@export_range(0.02, 10.0, 0.01) var note_duration_seconds := 0.8
@export_range(1, 64) var maximum_polyphony := 8
@export var noise_seed := 1


func _init() -> void:
	schema_id = "leyforge.forge.synth-patch"
	asset_class = "synth_patch"
	source_status = "draft"
	rights_status = "owned"


func to_record() -> Dictionary:
	return _record({
		"tuning_a4_hz": tuning_a4_hz,
		"reference_midi_note": reference_midi_note,
		"preview_midi_note": preview_midi_note,
		"preview_cent_offset": preview_cent_offset,
		"generator_version": generator_version,
		"oscillators": oscillators.duplicate(true),
		"amplitude_envelope": amplitude_envelope.duplicate(true),
		"filter_settings": filter_settings.duplicate(true),
		"modulation": modulation.duplicate(true),
		"master_gain_db": master_gain_db,
		"sample_rate_hz": sample_rate_hz,
		"note_duration_seconds": note_duration_seconds,
		"maximum_polyphony": maximum_polyphony,
		"noise_seed": noise_seed,
	})


func frequency_for_note(midi_note: int) -> float:
	return tuning_a4_hz * pow(2.0,
		(float(midi_note - reference_midi_note) + preview_cent_offset / 100.0) / 12.0)
