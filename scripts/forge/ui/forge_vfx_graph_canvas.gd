class_name ForgeVfxGraphCanvas
extends VBoxContainer
## Draggable node-and-wire editor for ForgeVfxGraph records.

signal graph_change_requested(
	nodes: Array[Dictionary], edges: Array[Dictionary],
	layout: Dictionary, label: String)
signal status_changed(message: String, is_error: bool)

const NODE_TYPES := [
	"emitter", "shape", "velocity", "force", "colour", "size",
	"light", "collision", "surface", "output",
]

var graph: ForgeVfxGraph
var _graph_edit: GraphEdit
var _type_selector: OptionButton
var _summary: Label
var _rebuilding := false
var _layout_emit_pending := false


func configure(value: ForgeVfxGraph) -> void:
	graph = value
	_build_ui()
	_rebuild_graph()


func _build_ui() -> void:
	add_theme_constant_override("separation", 6)
	var toolbar := HBoxContainer.new()
	_type_selector = OptionButton.new()
	for type_id in NODE_TYPES:
		_type_selector.add_item(type_id.capitalize())
		_type_selector.set_item_metadata(_type_selector.item_count - 1, type_id)
	toolbar.add_child(_type_selector)
	toolbar.add_child(_button("Add node", _add_node))
	toolbar.add_child(_button("Remove selected", _remove_selected))
	toolbar.add_child(_button("Auto arrange", _auto_arrange))
	toolbar.add_child(_button("Connect selected order", _connect_listed))
	add_child(toolbar)
	_graph_edit = GraphEdit.new()
	_graph_edit.name = "VfxVisualGraph"
	_graph_edit.custom_minimum_size = Vector2(760, 480)
	_graph_edit.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	_graph_edit.size_flags_vertical = Control.SIZE_EXPAND_FILL
	_graph_edit.show_grid = true
	_graph_edit.minimap_enabled = true
	_graph_edit.connection_request.connect(_on_connection_request)
	_graph_edit.disconnection_request.connect(_on_disconnection_request)
	add_child(_graph_edit)
	_summary = Label.new()
	_summary.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	add_child(_summary)


func _rebuild_graph() -> void:
	_rebuilding = true
	for child in _graph_edit.get_children():
		if child is GraphNode:
			_graph_edit.remove_child(child)
			child.queue_free()
	var name_by_id := {}
	for index in graph.nodes.size():
		var record: Dictionary = graph.nodes[index]
		var node_id := str(record.get("id", "node_%d" % (index + 1)))
		var node_name := ForgeId.safe_filename(node_id)
		var suffix := 2
		while name_by_id.values().has(node_name):
			node_name = "%s_%d" % [ForgeId.safe_filename(node_id), suffix]
			suffix += 1
		name_by_id[node_id] = node_name
		var node := GraphNode.new()
		node.name = node_name
		node.title = "%s  |  %s" % [node_id, str(record.get("type", "node")).capitalize()]
		node.set_meta("node_id", node_id)
		node.position_offset = _layout_position(node_id, index)
		node.custom_minimum_size = Vector2(220, 120)
		var parameters: Dictionary = record.get("parameters", {})
		if parameters.is_empty():
			var empty := Label.new()
			empty.text = "No parameters"
			node.add_child(empty)
		else:
			var keys := parameters.keys()
			keys.sort()
			for key in keys:
				var row := Label.new()
				row.text = "%s: %s" % [str(key), str(parameters[key])]
				row.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
				node.add_child(row)
		var slot_row := maxi(0, node.get_child_count() - 1)
		node.set_slot(slot_row, true, 0, Color("#75C9D2"),
			true, 0, Color("#E6B85C"))
		node.position_offset_changed.connect(_on_node_position_changed.bind(node))
		_graph_edit.add_child(node)
	for edge in graph.edges:
		var from_id := str(edge.get("from", ""))
		var to_id := str(edge.get("to", ""))
		if name_by_id.has(from_id) and name_by_id.has(to_id):
			_graph_edit.connect_node(str(name_by_id[from_id]), 0,
				str(name_by_id[to_id]), 0)
	_rebuilding = false
	_summary.text = (
		"%d / %d nodes  |  %d connections  |  Spawn bound %d  |  Lifetime %.2fs  |  Cycles %s" % [
			graph.nodes.size(), graph.maximum_nodes, graph.edges.size(),
			graph.maximum_spawn_count, graph.maximum_lifetime_seconds,
			"allowed" if graph.cycles_allowed else "blocked"])


func _add_node() -> void:
	if graph.nodes.size() >= graph.maximum_nodes:
		status_changed.emit("VFX graph already meets its node budget.", true)
		return
	var nodes := graph.nodes.duplicate(true)
	var node_type := str(_type_selector.get_item_metadata(_type_selector.selected))
	var base := node_type
	var node_id := base
	var suffix := 2
	while _has_node(nodes, node_id):
		node_id = "%s_%d" % [base, suffix]
		suffix += 1
	nodes.append({"id": node_id, "type": node_type, "parameters": {}})
	var layout := graph.editor_layout.duplicate(true)
	layout[node_id] = [80.0 + float(nodes.size() - 1) * 240.0, 120.0]
	graph_change_requested.emit(nodes, graph.edges.duplicate(true), layout,
		"Add VFX graph node")


func _remove_selected() -> void:
	var removed := PackedStringArray()
	for child in _graph_edit.get_children():
		if child is GraphNode and child.selected:
			removed.append(str(child.get_meta("node_id", "")))
	if removed.is_empty():
		status_changed.emit("Select one or more VFX nodes first.", true)
		return
	var nodes: Array[Dictionary] = []
	for record in graph.nodes:
		if str(record.get("id", "")) not in removed:
			nodes.append(record.duplicate(true))
	var edges: Array[Dictionary] = []
	for edge in graph.edges:
		if str(edge.get("from", "")) not in removed \
				and str(edge.get("to", "")) not in removed:
			edges.append(edge.duplicate(true))
	var layout := graph.editor_layout.duplicate(true)
	for node_id in removed:
		layout.erase(node_id)
	graph_change_requested.emit(nodes, edges, layout, "Remove VFX graph nodes")


func _on_connection_request(
		from_node: StringName, _from_port: int,
		to_node: StringName, _to_port: int) -> void:
	var from_id := _node_id(from_node)
	var to_id := _node_id(to_node)
	if from_id.is_empty() or to_id.is_empty() or from_id == to_id:
		return
	var edges := graph.edges.duplicate(true)
	for edge in edges:
		if str(edge.get("from", "")) == from_id \
				and str(edge.get("to", "")) == to_id:
			return
	edges.append({"from": from_id, "to": to_id})
	graph_change_requested.emit(graph.nodes.duplicate(true), edges,
		graph.editor_layout.duplicate(true), "Connect VFX graph nodes")


func _on_disconnection_request(
		from_node: StringName, _from_port: int,
		to_node: StringName, _to_port: int) -> void:
	var from_id := _node_id(from_node)
	var to_id := _node_id(to_node)
	var edges: Array[Dictionary] = []
	for edge in graph.edges:
		if str(edge.get("from", "")) == from_id \
				and str(edge.get("to", "")) == to_id:
			continue
		edges.append(edge.duplicate(true))
	graph_change_requested.emit(graph.nodes.duplicate(true), edges,
		graph.editor_layout.duplicate(true), "Disconnect VFX graph nodes")


func _on_node_position_changed(_node: GraphNode) -> void:
	if _rebuilding or _layout_emit_pending:
		return
	_layout_emit_pending = true
	call_deferred("_emit_layout_change")


func _emit_layout_change() -> void:
	_layout_emit_pending = false
	if _rebuilding:
		return
	var layout := {}
	for child in _graph_edit.get_children():
		if child is GraphNode:
			layout[str(child.get_meta("node_id", ""))] = [
				child.position_offset.x, child.position_offset.y]
	graph_change_requested.emit(graph.nodes.duplicate(true),
		graph.edges.duplicate(true), layout, "Arrange VFX graph nodes")


func _auto_arrange() -> void:
	var layout := {}
	for index in graph.nodes.size():
		var node_id := str(graph.nodes[index].get("id", "node_%d" % index))
		layout[node_id] = [80.0 + float(index % 4) * 260.0,
			80.0 + float(index / 4) * 190.0]
	graph_change_requested.emit(graph.nodes.duplicate(true),
		graph.edges.duplicate(true), layout, "Auto arrange VFX graph")


func _connect_listed() -> void:
	var edges: Array[Dictionary] = []
	for index in maxi(0, graph.nodes.size() - 1):
		edges.append({"from": str(graph.nodes[index].get("id", "")),
			"to": str(graph.nodes[index + 1].get("id", ""))})
	graph_change_requested.emit(graph.nodes.duplicate(true), edges,
		graph.editor_layout.duplicate(true), "Connect VFX nodes in listed order")


func _layout_position(node_id: String, index: int) -> Vector2:
	var value: Variant = graph.editor_layout.get(node_id)
	if value is Vector2:
		return value
	if value is Array and value.size() >= 2:
		return Vector2(float(value[0]), float(value[1]))
	return Vector2(80.0 + float(index % 4) * 260.0,
		80.0 + float(index / 4) * 190.0)


func _node_id(node_name: StringName) -> String:
	var node := _graph_edit.get_node_or_null(NodePath(str(node_name))) as GraphNode
	return str(node.get_meta("node_id", "")) if node != null else ""


func _has_node(nodes: Array[Dictionary], node_id: String) -> bool:
	for record in nodes:
		if str(record.get("id", "")) == node_id:
			return true
	return false


func _button(label: String, action: Callable) -> Button:
	var button := Button.new()
	button.text = label
	button.set_meta("accessible_label", label)
	button.pressed.connect(action)
	return button
