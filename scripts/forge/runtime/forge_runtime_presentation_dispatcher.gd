class_name ForgeRuntimePresentationDispatcher
extends Node3D
## Shared keyed command consumer for compiled VFX/audio/material presentation.

var vfx_manager: ForgeVfxRuntimeManager
var sound_manager: ForgeSoundRuntimeManager
var material_resolver: ForgeMaterialResponseResolver
var material_response_table_id := "material.presentation.response.foundation"
var command_trace: Array[Dictionary] = []


func configure(
		p_vfx_manager: ForgeVfxRuntimeManager,
		p_sound_manager: ForgeSoundRuntimeManager,
		p_material_resolver: ForgeMaterialResponseResolver) -> Dictionary:
	vfx_manager = p_vfx_manager
	sound_manager = p_sound_manager
	material_resolver = p_material_resolver
	command_trace.clear()
	if vfx_manager == null or sound_manager == null or material_resolver == null:
		return {"ok": false, "diagnostics": [{"code": "REG-003",
			"severity": "critical", "target_id": "presentation.dispatcher",
			"message": "Runtime presentation service is missing."}]}
	if vfx_manager.get_parent() == null:
		add_child(vfx_manager)
	if sound_manager.get_parent() == null:
		add_child(sound_manager)
	return {"ok": true, "diagnostics": []}


func dispatch(command: Dictionary, world_transform: Transform3D) -> Dictionary:
	var verb := str(command.get("command", "play"))
	var component_type := str(command.get("component_type", ""))
	var ownership_key := str(command.get("ownership_key", ""))
	var component_id := str(command.get("component_id", ""))
	var parameters: Dictionary = command.get("parameters", {})
	var seed := int(command.get("deterministic_seed", 0))
	var result := {}
	match component_type:
		"vfx":
			result = _dispatch_vfx(
				verb, ownership_key, component_id, world_transform, parameters, seed)
		"audio":
			result = _dispatch_sound(
				verb, ownership_key, component_id, world_transform, parameters, seed)
		"material_response":
			result = material_resolver.resolve(
				material_response_table_id, parameters)
		"surface":
			result = {"ok": true, "deferred_to_vfx_surface_service": true,
				"component_id": component_id}
		_:
			result = {"ok": true, "legacy_wrapped": true,
				"component_type": component_type, "component_id": component_id}
	var trace_record := {"command": command.duplicate(true),
		"result": _stable_result(result), "position": world_transform.origin}
	trace_record["dispatch_hash"] = ForgeStableRecord.hash_record(trace_record)
	command_trace.append(trace_record)
	return result


func dispatch_all(
		commands: Array, world_transform: Transform3D) -> Dictionary:
	var results: Array[Dictionary] = []
	var ok := true
	for command in commands:
		var result := dispatch(command, world_transform)
		results.append(_stable_result(result))
		ok = ok and bool(result.get("ok", false))
	var report := {"ok": ok, "results": results,
		"command_count": commands.size()}
	report["dispatch_hash"] = ForgeStableRecord.hash_record(report)
	return report


func advance(delta_seconds: float) -> Dictionary:
	var result := {"vfx": vfx_manager.advance(delta_seconds),
		"audio": sound_manager.advance(delta_seconds)}
	result["runtime_hash"] = ForgeStableRecord.hash_record(result)
	return result


func snapshot() -> Dictionary:
	var result := {"vfx": vfx_manager.snapshot(),
		"audio": sound_manager.snapshot(), "command_trace": command_trace.duplicate(true)}
	result["runtime_hash"] = ForgeStableRecord.hash_record(result)
	return result


func _dispatch_vfx(verb: String, key: String, component_id: String,
		transform: Transform3D, parameters: Dictionary, seed: int) -> Dictionary:
	match verb:
		"stop":
			return vfx_manager.stop(key)
		"update":
			return vfx_manager.update(key, parameters, transform)
	return vfx_manager.play(key, component_id, transform, parameters, seed)


func _dispatch_sound(verb: String, key: String, component_id: String,
		transform: Transform3D, parameters: Dictionary, seed: int) -> Dictionary:
	match verb:
		"stop":
			return sound_manager.stop(key)
		"update":
			return sound_manager.update(key, parameters, transform)
	return sound_manager.play(key, component_id, transform, parameters, seed)


func _stable_result(result: Dictionary) -> Dictionary:
	var stable := result.duplicate(true)
	for key in stable.keys():
		if stable[key] is Object:
			stable.erase(key)
	return stable
