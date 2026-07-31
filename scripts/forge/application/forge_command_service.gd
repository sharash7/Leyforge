class_name ForgeCommandService
extends RefCounted
## Shared undo/redo history for the EditorPlugin and in-game host.

signal history_changed(can_undo: bool, can_redo: bool)

var undo_stack: Array[Dictionary] = []
var redo_stack: Array[Dictionary] = []
var max_history := 256


func execute(label: String, apply_action: Callable, revert_action: Callable) -> bool:
	if not apply_action.is_valid() or not revert_action.is_valid():
		return false
	apply_action.call()
	undo_stack.append({
		"label": label,
		"apply": apply_action,
		"revert": revert_action,
	})
	if undo_stack.size() > max_history:
		undo_stack.pop_front()
	redo_stack.clear()
	_emit_history()
	return true


func undo() -> bool:
	if undo_stack.is_empty():
		return false
	var command: Dictionary = undo_stack.pop_back()
	var revert_action: Callable = command["revert"]
	revert_action.call()
	redo_stack.append(command)
	_emit_history()
	return true


func redo() -> bool:
	if redo_stack.is_empty():
		return false
	var command: Dictionary = redo_stack.pop_back()
	var apply_action: Callable = command["apply"]
	apply_action.call()
	undo_stack.append(command)
	_emit_history()
	return true


func clear() -> void:
	undo_stack.clear()
	redo_stack.clear()
	_emit_history()


func undo_label() -> String:
	return str(undo_stack.back().get("label", "")) if not undo_stack.is_empty() else ""


func redo_label() -> String:
	return str(redo_stack.back().get("label", "")) if not redo_stack.is_empty() else ""


func _emit_history() -> void:
	history_changed.emit(not undo_stack.is_empty(), not redo_stack.is_empty())
