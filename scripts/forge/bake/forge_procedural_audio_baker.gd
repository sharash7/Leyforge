class_name ForgeProceduralAudioBaker
extends RefCounted
## Deterministic PCM synthesis for the Audio Forge virtual instrument.

const MIN_SAMPLE_RATE := 8000
const MAX_SAMPLE_RATE := 96000
const MAX_SECONDS := 12.0
const MAX_OSCILLATORS := 8


func render_note(
		patch: ForgeSynthPatchDefinition, midi_note: int,
		duration_override := -1.0) -> Dictionary:
	if patch == null:
		return {"ok": false, "error": "No synth patch is open."}
	var diagnostics := ForgePresentationValidationService.new().validate(patch)
	for diagnostic in diagnostics:
		if diagnostic.severity in [
				ForgeDiagnostic.ERROR, ForgeDiagnostic.CRITICAL,
				ForgeDiagnostic.BLOCKER, ForgeDiagnostic.CRITICAL_RELEASE_BLOCKER]:
			return {
				"ok": false,
				"error": "Synth patch validation failed.",
				"diagnostics": _diagnostic_records(diagnostics),
			}
	var sample_rate := clampi(patch.sample_rate_hz, MIN_SAMPLE_RATE, MAX_SAMPLE_RATE)
	var note_seconds := patch.note_duration_seconds \
		if duration_override <= 0.0 else duration_override
	note_seconds = clampf(note_seconds, 0.02, 10.0)
	var release_seconds := clampf(float(
		patch.amplitude_envelope.get("release_seconds", 0.2)), 0.0, 2.0)
	var total_seconds := minf(MAX_SECONDS, note_seconds + release_seconds)
	var sample_count := maxi(1, ceili(total_seconds * float(sample_rate)))
	var pcm := PackedByteArray()
	pcm.resize(sample_count * 2)
	var rng := RandomNumberGenerator.new()
	rng.seed = int(patch.noise_seed) ^ (midi_note * 104729)
	var master_gain := pow(10.0, patch.master_gain_db / 20.0)
	var peak := 0.0
	var clipped_samples := 0
	var low_state := 0.0
	var high_state := 0.0
	var previous_input := 0.0
	for sample_index in sample_count:
		var time := float(sample_index) / float(sample_rate)
		var lfo := _lfo_value(patch.modulation, time)
		var mixed := 0.0
		var oscillator_count := mini(patch.oscillators.size(), MAX_OSCILLATORS)
		for oscillator_index in oscillator_count:
			var oscillator: Dictionary = patch.oscillators[oscillator_index]
			mixed += _oscillator_sample(
				patch, oscillator, midi_note, time, lfo, rng,
				oscillator_index)
		mixed /= maxf(1.0, float(oscillator_count))
		mixed *= _amplitude_envelope(
			patch.amplitude_envelope, time, note_seconds, release_seconds)
		mixed *= _amplitude_modulation(patch.modulation, lfo)
		mixed *= master_gain
		var filtered := _filter_sample(
			mixed, patch.filter_settings, sample_rate,
			low_state, high_state, previous_input)
		low_state = float(filtered[1])
		high_state = float(filtered[2])
		previous_input = mixed
		var value := float(filtered[0])
		peak = maxf(peak, absf(value))
		if absf(value) > 1.0:
			clipped_samples += 1
		value = clampf(value, -1.0, 1.0)
		pcm.encode_s16(sample_index * 2, int(round(value * 32767.0)))
	var stream := AudioStreamWAV.new()
	stream.format = AudioStreamWAV.FORMAT_16_BITS
	stream.mix_rate = sample_rate
	stream.stereo = false
	stream.data = pcm
	var hash_context := HashingContext.new()
	hash_context.start(HashingContext.HASH_SHA256)
	hash_context.update(pcm)
	var source_hash := hash_context.finish().hex_encode()
	return {
		"ok": true,
		"stream": stream,
		"pcm": pcm,
		"source_hash": source_hash,
		"sample_rate_hz": sample_rate,
		"sample_count": sample_count,
		"duration_seconds": total_seconds,
		"peak": peak,
		"clipped_samples": clipped_samples,
		"midi_note": clampi(midi_note, 0, 127),
		"frequency_hz": patch.frequency_for_note(clampi(midi_note, 0, 127)),
		"waveform_preview": _waveform_preview(pcm, 96),
	}


func bake_source(
		patch: ForgeSynthPatchDefinition, midi_note: int,
		target_path: String, source_id: String) -> Dictionary:
	if not ForgeAccessPolicy.can_author():
		return {"ok": false, "error": "Forge authoring is disabled in this build."}
	if not ForgeId.is_valid(source_id, "sound.source."):
		return {"ok": false, "error": "Generated sound source ID is invalid."}
	if not target_path.begins_with("res://generated/forge/audio/") \
			or not target_path.ends_with(".tres"):
		return {"ok": false, "error": "Generated synth output path is outside the audio bake root."}
	var rendered := render_note(patch, midi_note)
	if not bool(rendered.get("ok", false)):
		return rendered
	var directory_error := DirAccess.make_dir_recursive_absolute(
		ProjectSettings.globalize_path(target_path.get_base_dir()))
	if directory_error not in [OK, ERR_ALREADY_EXISTS]:
		return {"ok": false, "error": error_string(directory_error)}
	var stream: AudioStreamWAV = rendered["stream"]
	var save_error := ResourceSaver.save(stream, target_path)
	if save_error != OK:
		return {"ok": false, "error": error_string(save_error)}
	var source := ForgeSoundSource.new()
	source.stable_id = source_id
	source.display_name = "%s Note %d" % [patch.display_name, midi_note]
	source.source_path = target_path
	source.source_hash = str(rendered["source_hash"])
	source.media_format = "procedural_pcm_resource"
	source.channel_layout = "mono"
	source.sample_rate_hz = int(rendered["sample_rate_hz"])
	source.duration_seconds = float(rendered["duration_seconds"])
	source.transformation_history = [{
		"operation": "forge_synth_render",
		"synth_patch_id": patch.stable_id,
		"synth_patch_hash": patch.canonical_hash(),
		"midi_note": midi_note,
		"frequency_hz": rendered["frequency_hz"],
	}]
	source.procedural_recipe_id = patch.stable_id
	source.procedural_seed = patch.noise_seed
	source.generator_version = patch.generator_version
	source.waveform_preview = rendered.waveform_preview
	source.regions = [{"region_id": "note", "start_seconds": 0.0,
		"end_seconds": source.duration_seconds}]
	source.processing_settings = {"non_destructive": true, "normalise_peak_db": -1.0}
	source.loudness_analysis = {"peak_linear": rendered.peak,
		"peak_db": linear_to_db(maxf(float(rendered.peak), 0.000001)),
		"clipped_samples": rendered.clipped_samples,
		"silent": float(rendered.peak) < 0.0001}
	source.dependency_ids = PackedStringArray([patch.stable_id])
	source.provenance = {
		"origin": "audio_forge_synth",
		"file_upload_required": false,
		"source_patch_id": patch.stable_id,
	}
	source.rights_status = "owned"
	source.source_status = "draft"
	return {
		"ok": true,
		"path": target_path,
		"sound_source": source,
		"render": rendered,
	}


func _waveform_preview(pcm: PackedByteArray, points: int) -> PackedFloat32Array:
	var result := PackedFloat32Array()
	var sample_count := int(pcm.size() / 2)
	if sample_count <= 0 or points <= 0: return result
	for point in points:
		var start := int(float(point) * sample_count / points)
		var finish := maxi(start + 1, int(float(point + 1) * sample_count / points))
		var peak := 0.0
		for sample_index in range(start, mini(finish, sample_count)):
			peak = maxf(peak, absf(float(pcm.decode_s16(sample_index * 2)) / 32767.0))
		result.append(peak)
	return result


func _oscillator_sample(
		patch: ForgeSynthPatchDefinition, oscillator: Dictionary,
		midi_note: int, time: float, lfo: float,
		rng: RandomNumberGenerator, oscillator_index: int) -> float:
	var octave := clampi(int(oscillator.get("octave", 0)), -4, 4)
	var detune := clampf(float(oscillator.get("detune_cents", 0.0)), -2400.0, 2400.0)
	var pitch_lfo := clampf(float(
		patch.modulation.get("pitch_depth_cents", 0.0)), -2400.0, 2400.0) * lfo
	var frequency := patch.frequency_for_note(clampi(midi_note, 0, 127))
	frequency *= pow(2.0, float(octave))
	frequency *= pow(2.0, (detune + pitch_lfo) / 1200.0)
	var phase_offset := float(oscillator.get("phase", 0.0)) \
		+ float(oscillator_index) * 0.00003125
	var phase := fmod(time * frequency + phase_offset, 1.0)
	if phase < 0.0:
		phase += 1.0
	var waveform := str(oscillator.get("waveform", "sine"))
	var sample := 0.0
	match waveform:
		"triangle":
			sample = 1.0 - 4.0 * absf(phase - 0.5)
		"saw":
			sample = 2.0 * phase - 1.0
		"square":
			sample = 1.0 if phase < 0.5 else -1.0
		"pulse":
			var pulse_width := clampf(float(
				oscillator.get("pulse_width", 0.5)), 0.02, 0.98)
			sample = 1.0 if phase < pulse_width else -1.0
		"noise":
			sample = rng.randf_range(-1.0, 1.0)
		"impulse":
			sample = 1.0 if phase < minf(0.02, frequency / float(patch.sample_rate_hz)) else 0.0
		_:
			sample = sin(TAU * phase)
	return sample * clampf(float(oscillator.get("level", 0.8)), 0.0, 1.0)


func _amplitude_envelope(
		envelope: Dictionary, time: float,
		note_seconds: float, release_seconds: float) -> float:
	var attack := maxf(0.0, float(envelope.get("attack_seconds", 0.01)))
	var decay := maxf(0.0, float(envelope.get("decay_seconds", 0.12)))
	var sustain := clampf(float(envelope.get("sustain_level", 0.7)), 0.0, 1.0)
	if attack > 0.0 and time < attack:
		return time / attack
	if decay > 0.0 and time < attack + decay:
		return lerpf(1.0, sustain, (time - attack) / decay)
	if time < note_seconds:
		return sustain
	if release_seconds <= 0.0:
		return 0.0
	return sustain * clampf(1.0 - (time - note_seconds) / release_seconds, 0.0, 1.0)


func _lfo_value(modulation: Dictionary, time: float) -> float:
	var rate := clampf(float(modulation.get("lfo_rate_hz", 0.0)), 0.0, 40.0)
	if rate <= 0.0:
		return 0.0
	var phase := fmod(time * rate, 1.0)
	match str(modulation.get("lfo_waveform", "sine")):
		"triangle":
			return 1.0 - 4.0 * absf(phase - 0.5)
		"square":
			return 1.0 if phase < 0.5 else -1.0
		_:
			return sin(TAU * phase)


func _amplitude_modulation(modulation: Dictionary, lfo: float) -> float:
	var depth := clampf(float(modulation.get("amplitude_depth", 0.0)), 0.0, 1.0)
	return clampf(1.0 - depth + depth * (lfo + 1.0) * 0.5, 0.0, 1.0)


func _filter_sample(
		input: float, settings: Dictionary, sample_rate: int,
		low_state: float, high_state: float, previous_input: float) -> Array[float]:
	var filter_type := str(settings.get("type", "none"))
	if filter_type == "none":
		return [input, input, input]
	var cutoff := clampf(float(settings.get("cutoff_hz", 12000.0)),
		20.0, float(sample_rate) * 0.49)
	var dt := 1.0 / float(sample_rate)
	var rc := 1.0 / (TAU * cutoff)
	if filter_type == "high_pass":
		var high_alpha := rc / (rc + dt)
		var high := high_alpha * (high_state + input - previous_input)
		return [high, low_state, high]
	var low_alpha := dt / (rc + dt)
	var low := low_state + low_alpha * (input - low_state)
	return [low, low, high_state]


func _diagnostic_records(diagnostics: Array[ForgeDiagnostic]) -> Array[Dictionary]:
	var records: Array[Dictionary] = []
	for diagnostic in diagnostics:
		records.append(diagnostic.to_record())
	return records
