class_name SettlementWorksiteVisual
extends Node3D
## Nearby presentation of one authoritative settlement worksite state.
## It contains no crop timer or production logic; every change is projected
## from the persistent profession task owned by SettlementProfessionEngine.

const VALID_CROP_STATES: Array[String] = [
	"fallow", "tilled", "seeded", "growing", "mature", "harvested",
]

var worksite_instance_id := ""
var crop_state := "fallow"
var phase_progress := 0.0
var _soil_row_count := 0
var _plant_count := 0
var _plant_height := 0.0


func setup(instance_id: String) -> void:
	worksite_instance_id = instance_id
	name = ("WorksiteVisual_%s" % instance_id).validate_node_name()


func apply_state(state: Dictionary) -> bool:
	if str(state.get("schema", "")) \
			!= SettlementProfessionEngine.WORKSITE_STATE_SCHEMA \
			or str(state.get("job_id", "")) != "job.farmer.basic":
		return false
	var next_crop_state := str(state.get("crop_state", "fallow"))
	if next_crop_state not in VALID_CROP_STATES:
		return false
	var next_progress := clampf(float(state.get(
		"phase_progress", 0.0)), 0.0, 1.0)
	if crop_state == next_crop_state and is_equal_approx(
			phase_progress, next_progress) and get_child_count() > 0:
		return true
	crop_state = next_crop_state
	phase_progress = next_progress
	_rebuild()
	return true


func visual_snapshot() -> Dictionary:
	return {
		"worksite_instance_id": worksite_instance_id,
		"crop_state": crop_state,
		"phase_progress": phase_progress,
		"soil_row_count": _soil_row_count,
		"plant_count": _plant_count,
		"plant_height": _plant_height,
	}


func _rebuild() -> void:
	for child in get_children():
		child.queue_free()
	_soil_row_count = 3
	_plant_count = 0
	_plant_height = 0.0
	_add_soil_rows()
	match crop_state:
		"seeded":
			_add_plants(0.12, Color("#72a04b"), 9)
		"growing":
			_add_plants(0.35 + 0.5 * phase_progress, Color("#4f8c3a"), 15)
		"mature":
			_add_plants(0.95, Color("#d6ad43"), 15)
		"harvested":
			_add_plants(0.16, Color("#9b783c"), 9)


func _add_soil_rows() -> void:
	var mesh := BoxMesh.new()
	mesh.size = Vector3(0.7, 0.10, 4.2)
	mesh.material = _material(
		Color("#4b2d1d") if crop_state != "fallow" else Color("#66513b"))
	var transforms: Array[Transform3D] = []
	for x in [-1.2, 0.0, 1.2]:
		transforms.append(Transform3D(Basis.IDENTITY, Vector3(x, 0.05, 0.0)))
	add_child(_multimesh_instance(mesh, transforms, "SoilRows"))


func _add_plants(height: float, color: Color, count: int) -> void:
	_plant_count = count
	_plant_height = height
	var mesh := BoxMesh.new()
	mesh.size = Vector3(0.10, height, 0.10)
	mesh.material = _material(color)
	var transforms: Array[Transform3D] = []
	for index in count:
		var row := index % 3
		var column := index / 3
		var column_count := count / 3
		var z := 0.0 if column_count <= 1 else lerpf(
			-1.7, 1.7, float(column) / float(column_count - 1))
		transforms.append(Transform3D(
			Basis.IDENTITY,
			Vector3(-1.2 + float(row) * 1.2, 0.10 + height * 0.5, z)))
	add_child(_multimesh_instance(mesh, transforms, "CropPlants"))


func _multimesh_instance(
		mesh: Mesh, transforms: Array[Transform3D], node_name: String) -> MultiMeshInstance3D:
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
	return instance


func _material(color: Color) -> StandardMaterial3D:
	var material := StandardMaterial3D.new()
	material.albedo_color = color
	material.roughness = 1.0
	return material
