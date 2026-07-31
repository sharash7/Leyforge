class_name ForgeStateAdapter
extends Node
## One-way presentation controller. It never mutates gameplay state.

signal presentation_changed(actions: Array[Dictionary])
signal audio_cue_requested(cue_id: String, socket_key: String)
signal effect_cue_requested(effect_id: String, socket_key: String)
signal audio_cue_stopped(cue_id: String, socket_key: String)
signal effect_cue_stopped(effect_id: String, socket_key: String)

@export var state_binding: ForgeStateBindingDefinition
var last_snapshot: Dictionary = {}
var active_actions: Array[Dictionary] = []


func apply_snapshot(snapshot: Dictionary) -> Array[Dictionary]:
	last_snapshot = snapshot.duplicate(true)
	var previous_actions := active_actions.duplicate(true)
	active_actions.clear()
	if state_binding == null:
		return active_actions
	var matched_bindings: Array[Dictionary] = []
	for binding in state_binding.bindings:
		if _matches(binding, snapshot):
			matched_bindings.append(binding)
	matched_bindings.sort_custom(_binding_precedes)
	var channel_actions := {}
	var channel_order: Array[String] = []
	for binding in matched_bindings:
		for action in binding.get("actions", []):
			if not action is Dictionary:
				continue
			var copy: Dictionary = action.duplicate(true)
			copy["_forge_layer"] = str(binding.get("layer", "activity"))
			copy["_forge_priority"] = int(binding.get("priority", 0))
			var channel := _action_channel(copy)
			if not channel_actions.has(channel):
				channel_order.append(channel)
			channel_actions[channel] = copy
	for channel in channel_order:
		active_actions.append(channel_actions[channel])
	_clear_inactive_actions(previous_actions, channel_actions)
	_apply_actions(active_actions)
	presentation_changed.emit(active_actions)
	return active_actions.duplicate(true)


func _clear_inactive_actions(
		previous_actions: Array[Dictionary],
		current_channels: Dictionary) -> void:
	for action in previous_actions:
		if current_channels.has(_action_channel(action)):
			continue
		match str(action.get("type", "")):
			"visibility":
				var target := _find_target(str(action.get("target", "")))
				if target is CanvasItem or target is Node3D:
					target.visible = false
			"animation":
				var player := _find_target(str(
					action.get("player", "AnimationPlayer")))
				if player is AnimationPlayer:
					player.stop()
			"material_parameter":
				_apply_material_parameter(
					action, action.get("inactive_value", 0.0))
			"audio_cue":
				audio_cue_stopped.emit(
					str(action.get("cue_id", "")),
					str(action.get("socket", "")))
			"effect_cue":
				effect_cue_stopped.emit(
					str(action.get("effect_id", "")),
					str(action.get("socket", "")))


func _binding_precedes(left: Dictionary, right: Dictionary) -> bool:
	var left_rank := _layer_rank(str(left.get("layer", "activity")))
	var right_rank := _layer_rank(str(right.get("layer", "activity")))
	if left_rank != right_rank:
		return left_rank < right_rank
	return int(left.get("priority", 0)) < int(right.get("priority", 0))


func _layer_rank(layer: String) -> int:
	var index := state_binding.layer_order.find(layer)
	return index if index >= 0 else state_binding.layer_order.size()


func _action_channel(action: Dictionary) -> String:
	var action_type := str(action.get("type", ""))
	match action_type:
		"visibility":
			return "visibility:%s" % str(action.get("target", ""))
		"animation":
			return "animation:%s" % str(action.get(
				"player", "AnimationPlayer"))
		"material_parameter":
			return "material:%s:%s" % [
				str(action.get("target", "")),
				str(action.get("parameter", "")),
			]
		"audio_cue":
			return "audio:%s" % str(action.get("socket", ""))
		"effect_cue":
			return "effect:%s" % str(action.get("socket", ""))
	return "%s:%s" % [action_type, JSON.stringify(action)]


func _matches(binding: Dictionary, snapshot: Dictionary) -> bool:
	var field := str(binding.get("field", ""))
	if field.is_empty() or not snapshot.has(field):
		return false
	var operation := str(binding.get("operator", "equals"))
	var expected: Variant = binding.get("value")
	var actual: Variant = snapshot[field]
	match operation:
		"equals":
			return actual == expected
		"not_equals":
			return actual != expected
		"greater":
			return float(actual) > float(expected)
		"greater_equal":
			return float(actual) >= float(expected)
		"less":
			return float(actual) < float(expected)
		"less_equal":
			return float(actual) <= float(expected)
	return false


func _apply_actions(actions: Array[Dictionary]) -> void:
	for action in actions:
		var action_type := str(action.get("type", ""))
		match action_type:
			"visibility":
				var target := _find_target(str(action.get("target", "")))
				if target is CanvasItem:
					target.visible = bool(action.get("value", true))
				elif target is Node3D:
					target.visible = bool(action.get("value", true))
			"animation":
				var player := _find_target(str(
					action.get("player", "AnimationPlayer")))
				if player is AnimationPlayer:
					var clip := str(action.get("clip", ""))
					var static_clips: PackedStringArray = player.get_meta(
						"forge_reduced_motion_static_clips",
						PackedStringArray())
					if clip in static_clips:
						player.stop()
					elif player.has_animation(clip):
						player.play(clip)
			"material_parameter":
				_apply_material_parameter(action, action.get("value"))
			"audio_cue":
				audio_cue_requested.emit(
					str(action.get("cue_id", "")),
					str(action.get("socket", "")))
			"effect_cue":
				effect_cue_requested.emit(
					str(action.get("effect_id", "")),
					str(action.get("socket", "")))


func _apply_material_parameter(
		action: Dictionary, value: Variant) -> void:
	var mesh_node := _find_target(str(action.get("target", "")))
	if mesh_node is GeometryInstance3D \
			and mesh_node.material_override is ShaderMaterial:
		var material: ShaderMaterial = mesh_node.material_override
		material.set_shader_parameter(
			str(action.get("parameter", "")), value)
	elif mesh_node is GeometryInstance3D \
			and mesh_node.material_override is BaseMaterial3D:
		var material: BaseMaterial3D = mesh_node.material_override
		material.set(str(action.get("parameter", "")), value)


func _find_target(path: String) -> Node:
	var target := get_node_or_null(NodePath(path))
	if target != null:
		return target
	return get_parent().get_node_or_null(NodePath(path)) \
		if get_parent() != null else null
