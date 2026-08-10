@tool
class_name ForgeVfxGraph
extends ForgePresentationDefinition

@export var nodes: Array[Dictionary] = []
@export var edges: Array[Dictionary] = []
@export var parameter_slots: Dictionary = {}
@export var maximum_nodes := 64
@export var maximum_spawn_count := 256
@export var maximum_lifetime_seconds := 30.0
@export var cycles_allowed := false
@export var backend_hint := "cpu_multimesh"
## Editor-only positions keyed by stable node ID. Deliberately excluded from
## to_record()/canonical_hash() so arranging a graph never changes runtime data.
@export var editor_layout: Dictionary = {}


func _init() -> void:
	schema_id = "leyforge.forge.vfx-graph"
	asset_class = "vfx_graph"


func to_record() -> Dictionary:
	return _record({
		"nodes": nodes.duplicate(true),
		"edges": edges.duplicate(true),
		"parameter_slots": parameter_slots.duplicate(true),
		"maximum_nodes": maximum_nodes,
		"maximum_spawn_count": maximum_spawn_count,
		"maximum_lifetime_seconds": maximum_lifetime_seconds,
		"cycles_allowed": cycles_allowed,
		"backend_hint": backend_hint,
	})
