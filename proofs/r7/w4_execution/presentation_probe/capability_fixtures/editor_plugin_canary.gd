@tool
extends RefCounted


func editor_capability_canary() -> String:
	return "must-be-denied-before-instantiation"
