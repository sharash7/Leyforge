class_name SettlementSitePreview
extends Node3D
## Read-only world overlay for a pending or actively prepared settlement site.
## The survey remains authoritative; this node only explains its footprint and
## the physical edits the village or player can perform.

const CLEAR_COLOR := Color(1.0, 0.34, 0.08, 0.14)
const FILL_COLOR := Color(0.12, 0.78, 1.0, 0.18)
const ROUTE_COLOR := Color(1.0, 0.76, 0.12, 0.22)
const FOOTPRINT_COLOR := Color(0.34, 0.88, 0.48, 0.06)

var plan_hash := ""
var _counts := {
	"clear": 0,
	"fill": 0,
	"route": 0,
	"footprint": 0,
}


func apply_survey(survey: Dictionary) -> bool:
	if str(survey.get("record_type", "")) != "SiteSurvey":
		return false
	var next_hash := str(survey.get("plan_hash", ""))
	if next_hash == plan_hash and get_child_count() > 0:
		return true
	plan_hash = next_hash
	_rebuild(survey)
	return true


func visual_snapshot() -> Dictionary:
	return {
		"plan_hash": plan_hash,
		"clear_cells": int(_counts["clear"]),
		"fill_cells": int(_counts["fill"]),
		"route_cells": int(_counts["route"]),
		"footprint_cells": int(_counts["footprint"]),
		"legend": {
			"orange_box": "clear_or_excavate",
			"cyan_post": "fill_and_level",
			"gold_plate": "access_path",
			"green_plate": "building_footprint",
		},
	}


func _rebuild(survey: Dictionary) -> void:
	for child in get_children():
		remove_child(child)
		child.queue_free()
	_counts = {"clear": 0, "fill": 0, "route": 0, "footprint": 0}

	var clear_values: Array = survey.get("cut_cells", []).duplicate(true)
	clear_values.append_array(survey.get("vegetation_removal", []))
	clear_values.append_array(survey.get("clearance_cells", []))
	var clear_cells := _unique_cells(clear_values)
	var fill_cells := _unique_cells(survey.get("fill_cells", []))
	var footprint_cells := _unique_cells(survey.get("footprint_cells", []))
	var route_cells := _unique_cells((survey.get(
		"route_plan", {}) as Dictionary).get("cells", []))

	_counts["clear"] = clear_cells.size()
	_counts["fill"] = fill_cells.size()
	_counts["route"] = route_cells.size()
	_counts["footprint"] = footprint_cells.size()

	if not footprint_cells.is_empty():
		var footprint_mesh := BoxMesh.new()
		footprint_mesh.size = Vector3(0.84, 0.035, 0.84)
		footprint_mesh.material = _overlay_material(FOOTPRINT_COLOR)
		_add_instances(
			"BuildingFootprint", footprint_mesh,
			_cell_transforms(footprint_cells, Vector3(0.5, 1.025, 0.5)))
	if not route_cells.is_empty():
		var route_mesh := BoxMesh.new()
		route_mesh.size = Vector3(0.72, 0.06, 0.72)
		route_mesh.material = _overlay_material(ROUTE_COLOR)
		_add_instances(
			"AccessPath", route_mesh,
			_cell_transforms(route_cells, Vector3(0.5, 1.055, 0.5)))
	if not clear_cells.is_empty():
		var clear_mesh := BoxMesh.new()
		clear_mesh.size = Vector3(0.90, 0.90, 0.90)
		clear_mesh.material = _overlay_material(CLEAR_COLOR)
		_add_instances(
			"ClearTerrain", clear_mesh,
			_cell_transforms(clear_cells, Vector3(0.5, 0.5, 0.5)))
	if not fill_cells.is_empty():
		var fill_mesh := CylinderMesh.new()
		fill_mesh.top_radius = 0.22
		fill_mesh.bottom_radius = 0.22
		fill_mesh.height = 0.82
		fill_mesh.radial_segments = 6
		fill_mesh.rings = 1
		fill_mesh.material = _overlay_material(FILL_COLOR)
		_add_instances(
			"FillTerrain", fill_mesh,
			_cell_transforms(fill_cells, Vector3(0.5, 0.5, 0.5)))


func _unique_cells(values: Array) -> Array[Array]:
	var seen := {}
	var result: Array[Array] = []
	for value in values:
		if not (value is Array) or value.size() < 3:
			continue
		var cell := [int(value[0]), int(value[1]), int(value[2])]
		var key := "%d:%d:%d" % cell
		if seen.has(key):
			continue
		seen[key] = true
		result.append(cell)
	return result


func _cell_transforms(cells: Array[Array], offset: Vector3) -> Array[Transform3D]:
	var transforms: Array[Transform3D] = []
	for cell in cells:
		transforms.append(Transform3D(
			Basis.IDENTITY,
			Vector3(float(cell[0]), float(cell[1]), float(cell[2])) + offset))
	return transforms


func _add_instances(
		node_name: String, mesh: Mesh,
		transforms: Array[Transform3D]) -> void:
	var multimesh := MultiMesh.new()
	multimesh.transform_format = MultiMesh.TRANSFORM_3D
	multimesh.mesh = mesh
	multimesh.instance_count = transforms.size()
	for index in transforms.size():
		multimesh.set_instance_transform(index, transforms[index])
	var instance := MultiMeshInstance3D.new()
	instance.name = node_name
	instance.multimesh = multimesh
	instance.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	instance.extra_cull_margin = 8.0
	add_child(instance)


func _overlay_material(color: Color) -> StandardMaterial3D:
	var material := StandardMaterial3D.new()
	material.albedo_color = color
	material.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA_DEPTH_PRE_PASS
	material.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	# Depth testing prevents markers behind terrain and other markers from
	# bleeding through the whole site. The low alpha keeps the edited voxel
	# readable while its outer marker surface remains visible.
	material.no_depth_test = false
	material.cull_mode = BaseMaterial3D.CULL_DISABLED
	material.render_priority = 1
	return material
