class_name ForgeAcousticRuntimeService
extends RefCounted
## Bounded zone/portal acoustics, shelter response and ambience resolution.

var _graphs: Dictionary = {}
var _profiles: Dictionary = {}
var _plans: Dictionary = {}
var _portal_states: Dictionary = {}


func load_and_validate(
		graphs: Array[ForgeAcousticZoneGraph],
		profiles: Array[ForgeAcousticProfile],
		plans: Array[ForgeAmbiencePlan]) -> Dictionary:
	_graphs.clear()
	_profiles.clear()
	_plans.clear()
	_portal_states.clear()
	var diagnostics: Array[Dictionary] = []
	for graph in graphs:
		if graph == null or graph.stable_id.is_empty() or _graphs.has(graph.stable_id):
			diagnostics.append(_diag("ACU-001", "error", "",
				"Acoustic graph ID is missing or duplicated."))
			continue
		_graphs[graph.stable_id] = graph
		_validate_graph(graph, diagnostics)
		for portal in graph.portals:
			_portal_states[_portal_key(graph.stable_id,
				str(portal.get("portal_id", "")))] = float(portal.get("openness", 1.0))
	for profile in profiles:
		if profile == null or profile.stable_id.is_empty() \
				or _profiles.has(profile.stable_id):
			diagnostics.append(_diag("ACU-001", "error", "",
				"Acoustic profile ID is missing or duplicated."))
		else:
			_profiles[profile.stable_id] = profile
	for plan in plans:
		if plan == null or plan.stable_id.is_empty() or _plans.has(plan.stable_id):
			diagnostics.append(_diag("ACU-001", "error", "",
				"Ambience plan ID is missing or duplicated."))
			continue
		_plans[plan.stable_id] = plan
		if not _graphs.has(plan.acoustic_graph_id):
			diagnostics.append(_diag("ACU-002", "error", plan.stable_id,
				"Ambience plan acoustic graph is missing."))
		if plan.components.size() > plan.maximum_active_components:
			diagnostics.append(_diag("BUD-001", "error", plan.stable_id,
				"Ambience source exceeds its component budget."))
	return {"ok": diagnostics.is_empty(), "diagnostics": diagnostics,
		"graph_count": _graphs.size(), "profile_count": _profiles.size(),
		"plan_count": _plans.size()}


func resolve(graph_id: String) -> ForgeAcousticZoneGraph:
	return _graphs.get(graph_id)


func has(graph_id: String) -> bool:
	return _graphs.has(graph_id)


func filtered_list(owner_blueprint_id := "") -> Array[ForgeAcousticZoneGraph]:
	var result: Array[ForgeAcousticZoneGraph] = []
	for graph in _graphs.values():
		if owner_blueprint_id.is_empty() or graph.owner_blueprint_id == owner_blueprint_id:
			result.append(graph)
	result.sort_custom(func(a: ForgeAcousticZoneGraph,
			b: ForgeAcousticZoneGraph) -> bool: return a.stable_id < b.stable_id)
	return result


func zone_at(graph_id: String, point: Vector3) -> String:
	var graph: ForgeAcousticZoneGraph = _graphs.get(graph_id)
	if graph == null:
		return ""
	for zone in graph.zones:
		var minimum := _vector3(zone.get("minimum", [0, 0, 0]))
		var maximum := _vector3(zone.get("maximum", [0, 0, 0]))
		if point.x >= minimum.x and point.y >= minimum.y and point.z >= minimum.z \
				and point.x <= maximum.x and point.y <= maximum.y and point.z <= maximum.z:
			return str(zone.get("zone_id", ""))
	return graph.exterior_zone_id


func set_portal_state(graph_id: String, portal_id: String, openness: float) -> bool:
	var graph: ForgeAcousticZoneGraph = _graphs.get(graph_id)
	if graph == null:
		return false
	for portal in graph.portals:
		if str(portal.get("portal_id", "")) == portal_id:
			_portal_states[_portal_key(graph_id, portal_id)] = clampf(openness, 0.0, 1.0)
			return true
	return false


func source_to_listener(graph_id: String, source_position: Vector3,
		listener_position: Vector3) -> Dictionary:
	var graph: ForgeAcousticZoneGraph = _graphs.get(graph_id)
	if graph == null:
		return {"ok": false, "diagnostic": _diag(
			"ACU-002", "error", graph_id, "Acoustic graph is missing.")}
	var source_zone := zone_at(graph_id, source_position)
	var listener_zone := zone_at(graph_id, listener_position)
	if source_zone == listener_zone:
		return {"ok": true, "source_zone": source_zone,
			"listener_zone": listener_zone, "transmission": 1.0,
			"occlusion": 0.0, "portal_path": []}
	var paths: Array[Dictionary] = [{"zone": source_zone, "transmission": 1.0,
		"portals": PackedStringArray()}]
	var visited := {source_zone: 0}
	for _depth in graph.maximum_path_depth:
		var next_paths: Array[Dictionary] = []
		for path in paths:
			var zone_id := str(path.zone)
			for portal in graph.portals:
				var from_id := str(portal.get("from_zone_id", ""))
				var to_id := str(portal.get("to_zone_id", ""))
				var next_zone := ""
				if from_id == zone_id:
					next_zone = to_id
				elif to_id == zone_id and bool(portal.get("bidirectional", true)):
					next_zone = from_id
				if next_zone.is_empty():
					continue
				var portal_id := str(portal.get("portal_id", ""))
				var openness := float(_portal_states.get(
					_portal_key(graph_id, portal_id), portal.get("openness", 1.0)))
				var transmission := float(path.transmission) * clampf(
					float(portal.get("transmission", 1.0)) * (0.15 + 0.85 * openness), 0.0, 1.0)
				var portal_path: PackedStringArray = path.portals.duplicate()
				portal_path.append(portal_id)
				if next_zone == listener_zone:
					return {"ok": true, "source_zone": source_zone,
						"listener_zone": listener_zone,
						"transmission": transmission,
						"occlusion": 1.0 - transmission,
						"portal_path": Array(portal_path)}
				if not visited.has(next_zone):
					visited[next_zone] = _depth + 1
					next_paths.append({"zone": next_zone,
						"transmission": transmission, "portals": portal_path})
		paths = next_paths
		if paths.is_empty():
			break
	return {"ok": true, "source_zone": source_zone,
		"listener_zone": listener_zone, "transmission": 0.05,
		"occlusion": 0.95, "portal_path": [], "fallback": "sealed_space"}


func rain_response(graph_id: String, listener_position: Vector3,
		rain_intensity: float) -> Dictionary:
	var graph: ForgeAcousticZoneGraph = _graphs.get(graph_id)
	if graph == null:
		return {"ok": false}
	var zone_id := zone_at(graph_id, listener_position)
	var sheltered := zone_id != graph.exterior_zone_id
	var exterior_bleed := 1.0
	if sheltered:
		for zone in graph.zones:
			if str(zone.get("zone_id", "")) == zone_id:
				exterior_bleed = clampf(float(zone.get("exterior_bleed", 0.2)), 0.0, 1.0)
				break
	return {"ok": true, "zone_id": zone_id, "sheltered": sheltered,
		"direct_rain": clampf(rain_intensity, 0.0, 1.0) * (0.0 if sheltered else 1.0),
		"roof_contact": clampf(rain_intensity, 0.0, 1.0) if sheltered else 0.0,
		"exterior_bleed": exterior_bleed,
		"aggregation_policy": "roof_region_contact" if sheltered else "weather_cell"}


func ambience_snapshot(plan_id: String, context: Dictionary) -> Dictionary:
	var plan: ForgeAmbiencePlan = _plans.get(plan_id)
	if plan == null:
		return {"ok": false}
	var active: Array[Dictionary] = []
	for component in plan.components:
		var required_state := str(component.get("required_state", ""))
		if not required_state.is_empty() \
				and not bool(context.get(required_state, false)):
			continue
		active.append(component.duplicate(true))
	active.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		var ap := int(a.get("priority", 0))
		var bp := int(b.get("priority", 0))
		return ap > bp if ap != bp else str(a.get("component_id", "")) < str(b.get("component_id", "")))
	if active.size() > plan.maximum_active_components:
		active.resize(plan.maximum_active_components)
	return {"ok": true, "plan_id": plan_id, "components": active,
		"virtualised_count": maxi(0, plan.components.size() - active.size()),
		"hash": ForgeStableRecord.hash_record({"plan": plan_id,
			"context": context, "components": active})}


func portal_state_snapshot() -> Dictionary:
	return _portal_states.duplicate(true)


func restore_portal_states(records: Dictionary) -> void:
	for key in records:
		if _portal_states.has(key):
			_portal_states[key] = clampf(float(records[key]), 0.0, 1.0)


func _validate_graph(graph: ForgeAcousticZoneGraph,
		diagnostics: Array[Dictionary]) -> void:
	var zone_ids := {graph.exterior_zone_id: true}
	for zone in graph.zones:
		var zone_id := str(zone.get("zone_id", ""))
		var minimum := _vector3(zone.get("minimum", [0, 0, 0]))
		var maximum := _vector3(zone.get("maximum", [0, 0, 0]))
		if zone_id.is_empty() or zone_ids.has(zone_id) \
				or minimum.x > maximum.x or minimum.y > maximum.y \
				or minimum.z > maximum.z:
			diagnostics.append(_diag("ACU-001", "error", graph.stable_id,
				"Acoustic zone is duplicated or has invalid bounds."))
		else:
			zone_ids[zone_id] = true
	var portal_ids := {}
	for portal in graph.portals:
		var portal_id := str(portal.get("portal_id", ""))
		if portal_id.is_empty() or portal_ids.has(portal_id) \
				or not zone_ids.has(str(portal.get("from_zone_id", ""))) \
				or not zone_ids.has(str(portal.get("to_zone_id", ""))):
			diagnostics.append(_diag("ACU-002", "error", graph.stable_id,
				"Acoustic portal is duplicated or references a missing zone."))
		else:
			portal_ids[portal_id] = true


func _portal_key(graph_id: String, portal_id: String) -> String:
	return "%s|%s" % [graph_id, portal_id]


func _vector3(value: Variant) -> Vector3:
	if value is Array and value.size() >= 3:
		return Vector3(float(value[0]), float(value[1]), float(value[2]))
	return Vector3.ZERO


func _diag(code: String, severity: String, target_id: String,
		message: String) -> Dictionary:
	return {"code": code, "severity": severity,
		"target_id": target_id, "message": message}
