class_name ForgeRuntimeEffects
extends Node3D
## Lightweight runtime consumer for Forge presentation effect cues.
## It owns presentation-only particles and light; gameplay state stays in the
## world and reaches this node only through ForgeStateAdapter snapshots.

var _root: Node3D
var _package: ForgeRuntimePackage
var _particles: Dictionary = {}
var _lights: Dictionary = {}


static func attach(
		root: Node3D, package: ForgeRuntimePackage) -> ForgeRuntimeEffects:
	if root == null or package == null:
		return null
	var existing := root.get_node_or_null("RuntimeEffects")
	if existing is ForgeRuntimeEffects:
		return existing
	var host := ForgeRuntimeEffects.new()
	host.name = "RuntimeEffects"
	root.add_child(host)
	host._setup(root, package)
	return host


func _setup(root: Node3D, package: ForgeRuntimePackage) -> void:
	_root = root
	_package = package
	var adapter := root.get_node_or_null("StateAdapter")
	if adapter is ForgeStateAdapter:
		adapter.effect_cue_requested.connect(_on_effect_requested)
		adapter.effect_cue_stopped.connect(_on_effect_stopped)


func _on_effect_requested(effect_id: String, socket_key: String) -> void:
	var particles := _ensure_particles(effect_id, socket_key)
	if particles != null:
		particles.emitting = true
	var light := _ensure_light(socket_key)
	if light != null:
		light.light_energy = 1.15


func _on_effect_stopped(effect_id: String, socket_key: String) -> void:
	var key := "%s@%s" % [effect_id, socket_key]
	var particles: GPUParticles3D = _particles.get(key)
	if particles != null and is_instance_valid(particles):
		particles.emitting = false
	var light: OmniLight3D = _lights.get(socket_key)
	if light != null and is_instance_valid(light):
		light.light_energy = 0.0


func _ensure_particles(
		effect_id: String, socket_key: String) -> GPUParticles3D:
	var key := "%s@%s" % [effect_id, socket_key]
	var existing: GPUParticles3D = _particles.get(key)
	if existing != null and is_instance_valid(existing):
		return existing
	var socket := _socket_node(socket_key)
	if socket == null:
		return null
	var particles := GPUParticles3D.new()
	particles.name = "%sParticles" % (
		ForgeId.safe_filename(effect_id).to_pascal_case())
	particles.amount = 18
	particles.lifetime = 1.6
	particles.randomness = 0.45
	particles.fixed_fps = 24
	particles.visibility_aabb = AABB(
		Vector3(-0.75, -0.25, -0.75), Vector3(1.5, 2.5, 1.5))
	particles.emitting = false
	var process_material := ParticleProcessMaterial.new()
	process_material.direction = Vector3.UP
	process_material.spread = 24.0
	process_material.initial_velocity_min = 0.22
	process_material.initial_velocity_max = 0.48
	process_material.gravity = Vector3(0.0, 0.08, 0.0)
	process_material.scale_min = 0.7
	process_material.scale_max = 1.35
	process_material.color = Color(0.42, 0.44, 0.46, 0.48)
	particles.process_material = process_material
	var quad := QuadMesh.new()
	quad.size = Vector2(0.12, 0.12)
	var smoke_material := StandardMaterial3D.new()
	smoke_material.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	smoke_material.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	smoke_material.billboard_mode = BaseMaterial3D.BILLBOARD_ENABLED
	smoke_material.albedo_color = Color(0.48, 0.5, 0.52, 0.46)
	quad.material = smoke_material
	particles.draw_pass_1 = quad
	socket.add_child(particles)
	_particles[key] = particles
	return particles


func _ensure_light(socket_key: String) -> OmniLight3D:
	var existing: OmniLight3D = _lights.get(socket_key)
	if existing != null and is_instance_valid(existing):
		return existing
	var socket := _socket_node(socket_key)
	if socket == null:
		return null
	var light := OmniLight3D.new()
	light.name = "ForgeActivityLight"
	light.light_color = Color("#f08a2a")
	light.light_energy = 0.0
	light.omni_range = 3.0
	light.shadow_enabled = false
	socket.add_child(light)
	_lights[socket_key] = light
	return light


func _socket_node(socket_key: String) -> Node3D:
	if _root == null:
		return null
	var socket := _root.get_node_or_null(NodePath(socket_key.to_pascal_case()))
	if socket is Node3D:
		return socket
	for child in _root.find_children("*", "Node3D", true, false):
		if str(child.get_meta("forge_socket_key", "")) == socket_key:
			return child
	return null
