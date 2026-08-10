class_name ForgeGuideStateEvaluator
extends RefCounted
## Evaluates guide progress from actual UI/document state. It never mutates a source.

func find_target(root: Node, target_id: String) -> Control:
	if root == null or target_id.is_empty(): return null
	return root.find_child(target_id, true, false) as Control

func evaluate(step: Dictionary, root: Node, context: Dictionary = {}) -> Dictionary:
	var target_id := str(step.get("target_id", ""))
	var target := find_target(root, target_id)
	if not target_id.is_empty() and target == null:
		return {"complete": false, "reachable": false, "message": "The guide target '%s' is not available on this page." % target_id}
	var condition: Dictionary = step.get("completion", {})
	var kind := str(condition.get("kind", "manual_observation"))
	var complete := false
	match kind:
		"control_has_text": complete = target is LineEdit and not target.text.strip_edges().is_empty()
		"control_selected": complete = target is OptionButton and target.selected >= 0
		"document_exists": complete = context.get("current_resource") != null
		"document_saved": complete = not bool(context.get("dirty", true))
		"validation_clear": complete = bool(context.get("validation_clear", false))
		"preview_available": complete = bool(context.get("preview_available", false))
		"manual_observation": complete = bool(context.get("confirmed_steps", {}).get(str(step.get("step_id", "")), false))
	return {"complete": complete, "reachable": true, "message": "Complete" if complete else "Waiting for the described result"}

func focus_target(step: Dictionary, root: Node) -> bool:
	var target := find_target(root, str(step.get("target_id", "")))
	if target == null or not target.is_visible_in_tree(): return false
	target.grab_focus()
	return true
