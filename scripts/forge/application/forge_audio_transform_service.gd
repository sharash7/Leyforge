class_name ForgeAudioTransformService
extends RefCounted
## Non-destructive PCM editing for imported or Forge-synthesised WAV resources.

const OUTPUT_ROOT := "res://generated/forge/audio/transforms"


func transform(stream: AudioStreamWAV, options: Dictionary) -> Dictionary:
	if stream == null or stream.format != AudioStreamWAV.FORMAT_16_BITS:
		return {"ok": false, "error": "Waveform editing currently requires 16-bit PCM WAV audio."}
	var channels := 2 if stream.stereo else 1
	var frame_size := channels * 2
	if stream.data.is_empty() or stream.data.size() % frame_size != 0:
		return {"ok": false, "error": "WAV sample data is empty or misaligned."}
	var frame_count := stream.data.size() / frame_size
	var start_seconds := clampf(float(options.get("trim_start_seconds", 0.0)),
		0.0, float(frame_count) / float(stream.mix_rate))
	var end_seconds := float(options.get("trim_end_seconds",
		float(frame_count) / float(stream.mix_rate)))
	end_seconds = clampf(end_seconds, start_seconds, float(frame_count) / float(stream.mix_rate))
	var start_frame := floori(start_seconds * stream.mix_rate)
	var end_frame := ceili(end_seconds * stream.mix_rate)
	var output_frames := maxi(1, end_frame - start_frame)
	var samples: Array[int] = []
	samples.resize(output_frames * channels)
	for frame in output_frames:
		for channel in channels:
			var source_frame := start_frame + frame
			if bool(options.get("reverse", false)):
				source_frame = end_frame - 1 - frame
			samples[frame * channels + channel] = stream.data.decode_s16(
				source_frame * frame_size + channel * 2)
	var target_peak_db := float(options.get("normalize_peak_db", 99.0))
	if target_peak_db <= 0.0:
		var peak := 0
		for sample in samples:
			peak = maxi(peak, absi(sample))
		if peak > 0:
			var target := 32767.0 * pow(10.0, target_peak_db / 20.0)
			var gain := target / float(peak)
			for index in samples.size():
				samples[index] = clampi(roundi(float(samples[index]) * gain), -32768, 32767)
	var fade_in_frames := clampi(roundi(float(options.get(
		"fade_in_seconds", 0.0)) * stream.mix_rate), 0, output_frames)
	var fade_out_frames := clampi(roundi(float(options.get(
		"fade_out_seconds", 0.0)) * stream.mix_rate), 0, output_frames)
	for frame in output_frames:
		var gain := 1.0
		if fade_in_frames > 0 and frame < fade_in_frames:
			gain *= float(frame) / float(fade_in_frames)
		if fade_out_frames > 0 and frame >= output_frames - fade_out_frames:
			gain *= float(output_frames - 1 - frame) / float(fade_out_frames)
		if gain < 1.0:
			for channel in channels:
				var index := frame * channels + channel
				samples[index] = roundi(float(samples[index]) * maxf(0.0, gain))
	var data := PackedByteArray()
	data.resize(samples.size() * 2)
	for index in samples.size():
		data.encode_s16(index * 2, samples[index])
	var output := AudioStreamWAV.new()
	output.format = AudioStreamWAV.FORMAT_16_BITS
	output.mix_rate = stream.mix_rate
	output.stereo = stream.stereo
	output.data = data
	var context := HashingContext.new()
	context.start(HashingContext.HASH_SHA256)
	context.update(data)
	return {"ok": true, "stream": output, "data": data,
		"source_hash": context.finish().hex_encode(),
		"duration_seconds": float(output_frames) / float(stream.mix_rate),
		"operations": options.duplicate(true)}


func apply_to_source(source: ForgeSoundSource, options: Dictionary) -> Dictionary:
	if not ForgeAccessPolicy.can_author():
		return {"ok": false, "error": "Forge authoring is disabled in this build."}
	if source == null or source.source_path.is_empty():
		return {"ok": false, "error": "Sound Source has no media to edit."}
	var loaded := ResourceLoader.load(
		source.source_path, "", ResourceLoader.CACHE_MODE_IGNORE)
	if not loaded is AudioStreamWAV:
		return {"ok": false, "error": "Load or import a 16-bit WAV before using waveform tools."}
	var transformed := transform(loaded, options)
	if not bool(transformed.get("ok", false)):
		return transformed
	var error := DirAccess.make_dir_recursive_absolute(
		ProjectSettings.globalize_path(OUTPUT_ROOT))
	if error not in [OK, ERR_ALREADY_EXISTS]:
		return {"ok": false, "error": error_string(error)}
	var target := OUTPUT_ROOT.path_join("%s_%s.tres" % [
		ForgeId.safe_filename(source.stable_id),
		str(transformed.source_hash).left(12)])
	var save_error := ResourceSaver.save(transformed.stream, target)
	if save_error != OK:
		return {"ok": false, "error": error_string(save_error)}
	source.source_path = target
	source.source_hash = str(transformed.source_hash)
	source.media_format = "wav_resource"
	source.sample_rate_hz = (transformed.stream as AudioStreamWAV).mix_rate
	source.duration_seconds = float(transformed.duration_seconds)
	source.transformation_history.append({
		"operation": "forge_waveform_edit",
		"options": options.duplicate(true),
		"output_hash": source.source_hash,
	})
	source.source_status = "draft"
	transformed["path"] = target
	return transformed
