class_name ForgeAudioImportService
extends RefCounted
## Optional recorded-audio import; procedural synthesis never depends on it.

const MEDIA_ROOT := "res://content/forge/presentation/set23/user/audio/media"
const SUPPORTED_EXTENSIONS: PackedStringArray = ["wav", "ogg", "mp3"]


func inspect_file(path: String) -> Dictionary:
	if path.is_empty() or not FileAccess.file_exists(path):
		return {"ok": false, "error": "Audio file is missing."}
	var extension := path.get_extension().to_lower()
	if extension not in SUPPORTED_EXTENSIONS:
		return {"ok": false, "error": "Audio format is unsupported; use WAV, OGG or MP3."}
	var file := FileAccess.open(path, FileAccess.READ)
	if file == null:
		return {"ok": false, "error": "Audio file could not be read."}
	var data := file.get_buffer(file.get_length())
	var context := HashingContext.new()
	context.start(HashingContext.HASH_SHA256)
	context.update(data)
	return {
		"ok": true,
		"extension": extension,
		"bytes": data.size(),
		"source_hash": context.finish().hex_encode(),
	}


func import_file(source: ForgeSoundSource, external_path: String) -> Dictionary:
	if not ForgeAccessPolicy.can_author():
		return {"ok": false, "error": "Forge authoring is disabled in this build."}
	if source == null or not ForgeId.is_valid(source.stable_id, "sound.source."):
		return {"ok": false, "error": "Open a valid Sound Source before importing."}
	var inspected := inspect_file(external_path)
	if not bool(inspected.get("ok", false)):
		return inspected
	var directory_error := DirAccess.make_dir_recursive_absolute(
		ProjectSettings.globalize_path(MEDIA_ROOT))
	if directory_error not in [OK, ERR_ALREADY_EXISTS]:
		return {"ok": false, "error": error_string(directory_error)}
	var extension := str(inspected["extension"])
	var target := MEDIA_ROOT.path_join("%s_%s.%s" % [
		ForgeId.safe_filename(source.stable_id),
		str(inspected["source_hash"]).left(12), extension])
	if not FileAccess.file_exists(target):
		var copy_error := DirAccess.copy_absolute(
			ProjectSettings.globalize_path(external_path),
			ProjectSettings.globalize_path(target))
		if copy_error != OK:
			return {"ok": false, "error": error_string(copy_error)}
	source.source_path = target
	source.source_hash = str(inspected["source_hash"])
	source.media_format = extension
	source.source_status = "draft"
	source.transformation_history.append({
		"operation": "forge_audio_import",
		"content_hash": source.source_hash,
		"bytes": inspected["bytes"],
	})
	source.provenance = {
		"origin": "user_import",
		"original_filename": external_path.get_file(),
		"canonical_copy": target,
	}
	return {"ok": true, "path": target, "source_hash": source.source_hash,
		"bytes": inspected["bytes"]}
