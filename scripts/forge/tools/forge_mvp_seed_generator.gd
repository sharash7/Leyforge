extends SceneTree
## One-time deterministic creator for the representative 21A-21F MVP sources.
## It deliberately stops at the golden set; it is not the 21G bulk migration.

var documents := ForgeDocumentService.new()
var bridge := ForgeRegistryBridge.new()
var baker := ForgeBakeService.new()
var failures: Array[String] = []
var generated: Array[String] = []


func _initialize() -> void:
	call_deferred("_run")


func _run() -> void:
	ForgeAccessPolicy.test_override = true
	_create_contracts()
	_create_materials()
	var assets: Array[ForgeAssetDefinition] = [
		_create_grass(),
		_create_stone_brick(),
		_create_chute(),
		_create_furnace(),
		_create_pickaxe(),
		_create_mana_conduit(),
		_create_crusher(),
	]
	_create_pack_manifest(assets)
	for asset in assets:
		if asset == null:
			continue
		var save_result := documents.save_draft(asset)
		if not bool(save_result.get("ok", false)):
			failures.append("save:%s:%s" % [
				asset.forge_asset_id, str(save_result.get("error", ""))])
			continue
		var contract := _contract(asset.presentation_contract_id)
		var bake_result := baker.bake(asset, contract, true)
		if not bool(bake_result.get("ok", false)):
			failures.append("bake:%s:%s" % [
				asset.forge_asset_id, str(bake_result.get("error", ""))])
			continue
		documents.mark_dirty(asset.forge_asset_id)
		var approval_save := documents.save_draft(asset)
		if not bool(approval_save.get("ok", false)):
			failures.append("approval_save:%s" % asset.forge_asset_id)
			continue
		generated.append(asset.forge_asset_id)
	_create_migration_register()
	ForgeAccessPolicy.clear_test_override()
	var report := {
		"ok": failures.is_empty(),
		"asset_count": generated.size(),
		"assets": generated,
		"failures": failures,
	}
	print("FORGE_MVP_SEED %s" % JSON.stringify(report))
	quit(0 if failures.is_empty() else 1)


func _create_contracts() -> void:
	var standard := ForgePresentationContract.new()
	standard.contract_id = "contract.block.standard_cube.v1"
	standard.gameplay_categories = PackedStringArray(["block"])
	standard.required_representations = PackedStringArray([
		"world", "preview", "icon"])
	standard.accessibility_requirements = PackedStringArray([
		"material_not_colour_only"])
	_save_contract(standard)

	var generated_shape := ForgePresentationContract.new()
	generated_shape.contract_id = "contract.block.generated_shape.v1"
	generated_shape.gameplay_categories = PackedStringArray(["block"])
	generated_shape.required_representations = PackedStringArray([
		"world", "preview", "icon"])
	_save_contract(generated_shape)

	var interactive := ForgePresentationContract.new()
	interactive.contract_id = "contract.block.interactive.v1"
	interactive.gameplay_categories = PackedStringArray(["block"])
	interactive.required_representations = PackedStringArray([
		"world", "preview", "icon"])
	_save_contract(interactive)

	var chute := ForgePresentationContract.new()
	chute.contract_id = "contract.automation.chute.v1"
	chute.gameplay_categories = PackedStringArray(["automation", "block"])
	chute.required_representations = PackedStringArray([
		"world", "preview", "icon"])
	chute.required_sockets = PackedStringArray(["input", "output"])
	chute.required_states = PackedStringArray(["flowing", "blocked"])
	chute.critical_responses = PackedStringArray(["blocked"])
	chute.footprint_profile_id = (
		"footprint.presentation.automation.transport.chute")
	chute.supported_variant_dimensions = PackedStringArray(["material"])
	chute.accessibility_requirements = PackedStringArray([
		"direction_not_colour_only", "blocked_text_or_motion"])
	_save_contract(chute)

	var furnace := ForgePresentationContract.new()
	furnace.contract_id = "contract.machine.furnace.v1"
	furnace.gameplay_categories = PackedStringArray(["machine", "block"])
	furnace.required_representations = PackedStringArray([
		"world", "preview", "icon"])
	furnace.required_parts = PackedStringArray(["body", "gear", "flame"])
	furnace.required_sockets = PackedStringArray([
		"item_input", "item_output", "smoke", "work_audio"])
	furnace.required_states = PackedStringArray([
		"processing", "blocked", "damaged"])
	furnace.critical_responses = PackedStringArray(["blocked", "damaged"])
	furnace.footprint_profile_id = (
		"footprint.presentation.functional.furnace.stone")
	furnace.supported_variant_dimensions = PackedStringArray(["material"])
	furnace.accessibility_requirements = PackedStringArray([
		"critical_state_not_flash_only", "audio_has_visual_equivalent"])
	_save_contract(furnace)

	var held_tool := ForgePresentationContract.new()
	held_tool.contract_id = "contract.item.held_tool.v1"
	held_tool.gameplay_categories = PackedStringArray(["item", "tool"])
	held_tool.required_representations = PackedStringArray([
		"held", "dropped", "icon", "preview"])
	_save_contract(held_tool)

	var item_resource := ForgePresentationContract.new()
	item_resource.contract_id = "contract.item.resource.v1"
	item_resource.gameplay_categories = PackedStringArray(["item"])
	item_resource.required_representations = PackedStringArray([
		"dropped", "icon", "preview"])
	_save_contract(item_resource)


func _create_grass() -> ForgeAssetDefinition:
	var asset := _new_linked("terrain.grass.basic")
	if asset == null:
		return null
	var palette := _palette(asset, [
		["grass", Color("#4f9d3a")],
		["grass_shadow", Color("#2d682c")],
		["soil", Color("#76502c")],
		["soil_shadow", Color("#4d321d")],
	])
	var surface: ForgeSurfaceSet = asset.surface_set
	for y in surface.height:
		for x in surface.width:
			surface.set_pixel(
				"top", x, y, 0 if (x * 7 + y * 11) % 9 > 1 else 1)
			surface.set_pixel("bottom", x, y, 2 if (x + y) % 7 else 3)
			for face in ["north", "south", "east", "west"]:
				var role := 0 if y < 5 + ((x * 5) % 4) else (
					2 if (x * 3 + y) % 8 else 3)
				surface.set_pixel(face, x, y, role)
	surface.edge_link_rules = {"tile_mode": "seamless", "period": 32}
	surface.random_variant_rules = {
		"stable_seed": true, "rotation_steps": [0, 1, 2, 3]}
	asset.planning_tags.append("golden.standard_surface")
	asset.provenance_note = (
		"21B/21E MVP golden standard block; not a bulk 21G migration.")
	return asset


func _create_stone_brick() -> ForgeAssetDefinition:
	var asset := _new_linked("construction.brick.stone")
	if asset == null:
		return null
	_palette(asset, [
		["stone", Color("#777b7e")],
		["mortar", Color("#41464a")],
		["highlight", Color("#9a9d9f")],
	])
	var surface: ForgeSurfaceSet = asset.surface_set
	for face in ForgeSurfaceSet.FACE_KEYS:
		for y in surface.height:
			for x in surface.width:
				var row_offset := 8 if (y / 8) % 2 == 1 else 0
				var mortar := y % 8 == 0 or (x + row_offset) % 16 == 0
				var role := 1 if mortar else (2 if (x + y * 3) % 19 == 0 else 0)
				surface.set_pixel(face, x, y, role)
	surface.connected_texture_rules = {
		"family": "stone_construction",
		"generated_shapes": ["cube", "slab", "stair", "wall", "beam"],
		"orientation_safe": true,
	}
	asset.planning_tags.append("golden.construction_family")
	return asset


func _create_chute() -> ForgeAssetDefinition:
	var asset := _new_linked("automation.transport.chute")
	if asset == null:
		return null
	_palette(asset, [
		["oak", Color("#875c2f")],
		["iron_band", Color("#555a5d")],
	])
	var volume: ForgeVoxelVolume = asset.voxel_volume
	volume.cells.fill(0)
	_fill_box(volume, Vector3i(2, 5, 7), Vector3i(30, 8, 25), 0)
	_fill_box(volume, Vector3i(2, 8, 7), Vector3i(30, 15, 10), 0)
	_fill_box(volume, Vector3i(2, 8, 22), Vector3i(30, 15, 25), 0)
	_fill_box(volume, Vector3i(3, 6, 6), Vector3i(6, 16, 26), 1)
	_fill_box(volume, Vector3i(26, 6, 6), Vector3i(29, 16, 26), 1)
	asset.sockets = [
		_socket("input", "item_input", Vector3(0.0, 0.3, 0.5), Vector3.LEFT),
		_socket("output", "item_output", Vector3(1.0, 0.3, 0.5), Vector3.RIGHT),
	]
	var collision: ForgeCollisionProfile = asset.collision_profile
	collision.boxes = [
		{"minimum": [0.05, 0.0, 0.2], "maximum": [0.95, 0.25, 0.8]},
		{"minimum": [0.05, 0.25, 0.2], "maximum": [0.15, 0.48, 0.8]},
		{"minimum": [0.85, 0.25, 0.2], "maximum": [0.95, 0.48, 0.8]},
	]
	var variants := ForgeVariantSet.new()
	variants.variant_set_id = "variantset.presentation.automation.transport.chute.material"
	variants.parent_presentation_id = asset.presentation_id
	variants.dimension = "material"
	variants.seed_salt = "chute-wood"
	variants.default_variant_id = "oak"
	variants.entries = [
		{"variant_id": "oak", "weight": 3.0},
		{"variant_id": "pine", "weight": 1.0},
	]
	asset.variant_sets = [variants]
	var state := ForgeStateBindingDefinition.new()
	state.state_binding_id = "statebinding.automation.transport.chute"
	state.state_contract_id = "automation.chute"
	state.bindings = [
		{
			"field": "flowing", "operator": "equals", "value": true,
			"actions": [
				{"type": "material_parameter", "target": "StaticGeometry",
					"parameter": "flow_strength", "value": 1.0},
			],
		},
		{
			"field": "blocked", "operator": "equals", "value": true,
			"actions": [
				{"type": "visibility", "target": "BlockedMarker", "value": true},
				{"type": "audio_cue", "cue_id": "automation.blocked",
					"socket": "output"},
			],
		},
	]
	asset.state_binding = state
	asset.representation_profiles["connection"] = {
		"resolver": "ForgeConnectionResolver",
		"directions": 6,
		"auto_one_step_slopes": true,
	}
	asset.planning_tags.append("golden.connected_chute")
	return asset


func _create_furnace() -> ForgeAssetDefinition:
	var asset := _new_linked("functional.furnace.stone")
	if asset == null:
		return null
	_palette(asset, [
		["stone", Color("#65696c")],
		["dark_stone", Color("#323638")],
		["iron", Color("#777d81")],
		["fire", Color("#f08a2a")],
	])
	var body: ForgePartDefinition = asset.parts[0]
	body.part_key = "body"
	var body_volume: ForgeVoxelVolume = body.source_volume
	body_volume.cells.fill(0)
	_fill_box(body_volume, Vector3i(3, 1, 3), Vector3i(29, 30, 29), 0)
	_clear_box(body_volume, Vector3i(10, 7, 0), Vector3i(22, 21, 12))
	var gear_volume := ForgeVoxelVolume.new()
	gear_volume.dimensions = Vector3i(16, 16, 6)
	gear_volume.ensure_storage()
	for z in range(1, 5):
		for y in 16:
			for x in 16:
				var distance := Vector2(x - 7.5, y - 7.5).length()
				if distance >= 4.0 and distance <= 7.2:
					gear_volume.set_cell(Vector3i(x, y, z), 2)
	var gear := ForgePartDefinition.new()
	gear.part_key = "gear"
	gear.source_volume = gear_volume
	gear.local_transform = Transform3D(Basis.IDENTITY, Vector3(0.25, 0.48, -0.02))
	gear.animated = true
	var flame_volume := ForgeVoxelVolume.new()
	flame_volume.dimensions = Vector3i(10, 14, 6)
	flame_volume.ensure_storage()
	for y in 12:
		var radius := maxi(1, 4 - y / 3)
		for z in range(1, 5):
			for x in range(5 - radius, 5 + radius):
				flame_volume.set_cell(Vector3i(x, y, z), 3)
	var flame := ForgePartDefinition.new()
	flame.part_key = "flame"
	flame.source_volume = flame_volume
	flame.local_transform = Transform3D(Basis.IDENTITY, Vector3(0.34, 0.18, -0.03))
	flame.visibility_group = "processing"
	asset.parts = [body, gear, flame]
	asset.sockets = [
		_socket("item_input", "item_input", Vector3(0.15, 0.5, 0.5), Vector3.LEFT),
		_socket("item_output", "item_output", Vector3(0.85, 0.5, 0.5), Vector3.RIGHT),
		_socket("smoke", "effect", Vector3(0.5, 1.0, 0.5), Vector3.UP),
		_socket("work_audio", "audio", Vector3(0.5, 0.45, 0.5), Vector3.FORWARD),
	]
	var animations := ForgeAnimationSet.new()
	animations.animation_set_id = "animations.functional.furnace.stone"
	animations.clips = [
		{
			"clip_id": "work_cycle", "length": 1.0, "loop": true,
			"tracks": [{
				"type": "rotation", "target": "Gear",
				"keys": [
					{"time": 0.0, "value": [0.0, 0.0, 0.0, 1.0]},
					{"time": 0.25, "value": [
						0.0, 0.0, 0.7071068, 0.7071068]},
					{"time": 0.5, "value": [0.0, 0.0, 1.0, 0.0]},
					{"time": 0.75, "value": [
						0.0, 0.0, 0.7071068, -0.7071068]},
					{"time": 1.0, "value": [0.0, 0.0, 0.0, -1.0]},
				],
			}],
			"audio_cues": [{"time": 0.0, "cue_id": "furnace.work_loop"}],
		},
		{
			"clip_id": "ignite", "length": 0.35, "loop": false,
			"tracks": [{
				"type": "scale", "target": "Flame",
				"keys": [
					{"time": 0.0, "value": [0.1, 0.1, 0.1]},
					{"time": 0.35, "value": [1.0, 1.0, 1.0]},
				],
			}],
		},
		{
			"clip_id": "heat_pulse", "length": 0.8, "loop": true,
			"tracks": [{
				"type": "material_parameter",
				"target": (
					"Flame/Geometry:material_override:"
					+ "emission_energy_multiplier"),
				"keys": [
					{"time": 0.0, "value": 0.6},
					{"time": 0.4, "value": 2.2},
					{"time": 0.8, "value": 0.6},
				],
			}],
		},
	]
	var frame_b := ForgeVoxelVolume.new()
	frame_b.dimensions = flame_volume.dimensions
	frame_b.voxel_size_meters = flame_volume.voxel_size_meters
	frame_b.ensure_storage()
	for y in 13:
		var frame_radius := maxi(1, 3 - y / 4)
		for z in range(1, 5):
			for x in range(5 - frame_radius, 5 + frame_radius + 1):
				frame_b.set_cell(Vector3i(x, y, z), 3)
	var magical_flame := ForgeVoxelFrameClip.new()
	magical_flame.clip_id = "magical_flame"
	magical_flame.frames = [
		flame_volume.duplicate(true),
		frame_b,
		flame_volume.duplicate(true),
	]
	magical_flame.frame_durations = PackedFloat32Array([0.12, 0.18, 0.12])
	magical_flame.onion_skin_enabled = true
	magical_flame.reduced_motion_frame = 1
	animations.voxel_frame_clips = [magical_flame]
	asset.animation_set = animations
	var states := ForgeStateBindingDefinition.new()
	states.state_binding_id = "statebinding.functional.furnace.stone"
	states.state_contract_id = "machine.furnace"
	states.bindings = [
		{
			"field": "processing", "operator": "equals", "value": true,
			"layer": "activity", "priority": 10,
			"actions": [
				{"type": "animation", "player": "AnimationPlayer",
					"clip": "work_cycle"},
				{"type": "animation", "player": "VoxelFramePlayer",
					"clip": "magical_flame"},
				{"type": "visibility", "target": "Flame", "value": true},
				{"type": "visibility", "target": "FrameGeometry", "value": true},
				{"type": "material_parameter", "target": "Flame/Geometry",
					"parameter": "emission_energy_multiplier", "value": 2.2},
				{"type": "effect_cue", "effect_id": "furnace.smoke",
					"socket": "smoke"},
				{"type": "audio_cue", "cue_id": "furnace.work_loop",
					"socket": "work_audio"},
			],
		},
		{
			"field": "blocked", "operator": "equals", "value": true,
			"layer": "critical", "priority": 20,
			"actions": [
				{"type": "visibility", "target": "BlockedMarker", "value": true},
				{"type": "audio_cue", "cue_id": "machine.blocked",
					"socket": "work_audio"},
			],
		},
		{
			"field": "damaged", "operator": "greater_equal", "value": 0.5,
			"layer": "condition", "priority": 10,
			"actions": [
				{"type": "visibility", "target": "DamageOverlay", "value": true},
			],
		},
	]
	asset.state_binding = states
	asset.planning_tags.append("golden.animated_furnace")
	return asset


func _create_pickaxe() -> ForgeAssetDefinition:
	var asset := _new_linked("item.tool.crude_pickaxe")
	if asset == null:
		return null
	_palette(asset, [
		["wood", Color("#83572f")],
		["stone", Color("#777b7e")],
	])
	var volume: ForgeVoxelVolume = asset.voxel_volume
	volume.cells.fill(0)
	_fill_box(volume, Vector3i(14, 3, 14), Vector3i(18, 27, 18), 0)
	_fill_box(volume, Vector3i(5, 23, 13), Vector3i(27, 29, 19), 1)
	_clear_box(volume, Vector3i(8, 23, 13), Vector3i(12, 25, 19))
	_clear_box(volume, Vector3i(20, 27, 13), Vector3i(24, 29, 19))
	asset.representation_profiles = {
		"held": {
			"scale": 0.72,
			"rotation_degrees": [90, 180, 0],
			"grip_contract": "leyforge.canonical_tool_bottom_v1",
		},
		"dropped": {"scale": 0.55, "rotation_degrees": [0, 25, 90]},
		"icon": {"camera": "isometric"},
	}
	asset.planning_tags.append("golden.held_tool")
	return asset


func _create_mana_conduit() -> ForgeAssetDefinition:
	var asset := _new_linked("magic.conduit.mana_basic")
	if asset == null:
		return null
	_palette(asset, [
		["stone", Color("#4c4558")],
		["mana", Color("#54c7dc")],
	])
	var volume: ForgeVoxelVolume = asset.voxel_volume
	volume.cells.fill(0)
	_fill_box(volume, Vector3i(3, 11, 11), Vector3i(29, 21, 21), 0)
	_fill_box(volume, Vector3i(1, 14, 14), Vector3i(31, 18, 18), 1)
	asset.sockets = [
		_socket("input", "power", Vector3(0.0, 0.5, 0.5), Vector3.LEFT),
		_socket("output", "power", Vector3(1.0, 0.5, 0.5), Vector3.RIGHT),
	]
	var states := ForgeStateBindingDefinition.new()
	states.state_binding_id = "statebinding.magic.conduit.mana_basic"
	states.state_contract_id = "magic.conduit"
	states.bindings = [{
		"field": "flow_active", "operator": "equals", "value": true,
		"actions": [{
			"type": "material_parameter", "target": "StaticGeometry",
			"parameter": "flow_strength", "value": 1.0,
		}],
	}]
	asset.state_binding = states
	asset.planning_tags.append("golden.mana_flow")
	return asset


func _create_crusher() -> ForgeAssetDefinition:
	var asset := _new_linked("automation.crusher.basic")
	if asset == null:
		return null
	_palette(asset, [
		["iron", Color("#686e72")],
		["dark", Color("#303437")],
		["warning", Color("#d29d32")],
	])
	var volume: ForgeVoxelVolume = asset.voxel_volume
	if volume == null and not asset.parts.is_empty():
		volume = asset.parts[0].source_volume
	volume.cells.fill(0)
	_fill_box(volume, Vector3i(3, 2, 3), Vector3i(29, 30, 29), 0)
	_clear_box(volume, Vector3i(8, 8, 0), Vector3i(24, 25, 24))
	if not asset.parts.is_empty():
		var body: ForgePartDefinition = asset.parts[0]
		body.part_key = "body"
	var piston_volume := ForgeVoxelVolume.new()
	piston_volume.dimensions = Vector3i(14, 14, 14)
	piston_volume.ensure_storage()
	_fill_box(piston_volume, Vector3i(1, 1, 1), Vector3i(13, 13, 13), 1)
	var piston := ForgePartDefinition.new()
	piston.part_key = "piston"
	piston.source_volume = piston_volume
	piston.local_transform = Transform3D(
		Basis.IDENTITY, Vector3(0.28, 0.45, -0.02))
	piston.animated = true
	asset.parts.append(piston)
	asset.sockets = [
		_socket("item_input", "item_input", Vector3(0.0, 0.5, 0.5), Vector3.LEFT),
		_socket("item_output", "item_output", Vector3(1.0, 0.5, 0.5), Vector3.RIGHT),
		_socket("work_audio", "audio", Vector3(0.5, 0.5, 0.5), Vector3.FORWARD),
	]
	var animations := ForgeAnimationSet.new()
	animations.animation_set_id = "animations.automation.crusher.basic"
	animations.clips = [{
		"clip_id": "crush_cycle", "length": 0.8, "loop": true,
		"tracks": [{
			"type": "position", "target": "Piston",
			"keys": [
				{"time": 0.0, "value": [0.28, 0.45, -0.02]},
				{"time": 0.4, "value": [0.28, 0.22, -0.02]},
				{"time": 0.8, "value": [0.28, 0.45, -0.02]},
			],
		}],
	}]
	asset.animation_set = animations
	var states := ForgeStateBindingDefinition.new()
	states.state_binding_id = "statebinding.automation.crusher.basic"
	states.state_contract_id = "machine.crusher"
	states.bindings = [{
		"field": "processing", "operator": "equals", "value": true,
		"actions": [{
			"type": "animation", "player": "AnimationPlayer",
			"clip": "crush_cycle",
		}],
	}]
	asset.state_binding = states
	# The registry currently classifies this machine through the generic
	# generated-shape contract; its authored parts remain available for the
	# later formal crusher contract without changing gameplay identity.
	asset.planning_tags.append("golden.crusher_state")
	return asset


func _new_linked(gameplay_id: String) -> ForgeAssetDefinition:
	var record := bridge.record_for(gameplay_id)
	if record.is_empty():
		failures.append("missing_registry:%s" % gameplay_id)
		return null
	var asset := documents.create_from_registry(record)
	asset.source_status = "draft"
	asset.source_revision = 1
	asset.planning_tags.append("forge_mvp_golden")
	return asset


func _palette(
		asset: ForgeAssetDefinition, entries: Array) -> ForgePaletteDefinition:
	var palette := ForgePaletteDefinition.new()
	palette.palette_id = "palette.%s" % (
		asset.gameplay_links[0] if not asset.gameplay_links.is_empty()
		else asset.forge_asset_id)
	palette.display_name = "%s MVP Palette" % asset.display_name
	for index in entries.size():
		var entry: Array = entries[index]
		var role := str(entry[0])
		var material_family := "stone"
		if role in ["oak", "wood"]:
			material_family = "wood"
		elif "iron" in role:
			material_family = "iron"
		elif "mana" in role:
			material_family = "mana"
		elif role in ["fire", "warning"]:
			material_family = "fire"
		palette.entries.append({
			"entry_key": role,
			"albedo": entry[1],
			"roughness": 0.82,
			"metallic": 0.12 if "iron" in role else 0.0,
			"emission": entry[1] if role in [
				"fire", "mana", "warning"] else Color.BLACK,
			"opacity": 1.0,
			"material_dna_id": "material.mvp.%s" % material_family,
		})
	asset.palettes = [palette]
	return palette


func _socket(
		key: String, type: String, position: Vector3,
		direction: Vector3) -> ForgeSocketDefinition:
	var socket := ForgeSocketDefinition.new()
	socket.socket_key = key
	socket.socket_type = type
	socket.local_transform = Transform3D(Basis.IDENTITY, position)
	socket.direction = direction
	socket.contract_required = true
	return socket


func _fill_box(
		volume: ForgeVoxelVolume, minimum: Vector3i,
		maximum: Vector3i, palette_index: int) -> void:
	for z in range(minimum.z, maximum.z):
		for y in range(minimum.y, maximum.y):
			for x in range(minimum.x, maximum.x):
				volume.set_cell(Vector3i(x, y, z), palette_index)


func _clear_box(
		volume: ForgeVoxelVolume, minimum: Vector3i,
		maximum: Vector3i) -> void:
	for z in range(minimum.z, maximum.z):
		for y in range(minimum.y, maximum.y):
			for x in range(minimum.x, maximum.x):
				volume.clear_cell(Vector3i(x, y, z))


func _save_contract(contract: ForgePresentationContract) -> void:
	var root := "res://content/forge/contracts"
	var error := DirAccess.make_dir_recursive_absolute(
		ProjectSettings.globalize_path(root))
	if error not in [OK, ERR_ALREADY_EXISTS]:
		failures.append("contract_dir:%s" % error_string(error))
		return
	var path := root.path_join(
		"%s.tres" % ForgeId.safe_filename(contract.contract_id))
	var save_error := ResourceSaver.save(contract, path)
	if save_error != OK:
		failures.append("contract:%s:%s" % [
			contract.contract_id, error_string(save_error)])


func _create_materials() -> void:
	for value in [
		["material.mvp.stone", "MVP Stone", "stone", 0.90, 0.0, 0.0, "opaque"],
		["material.mvp.wood", "MVP Wood", "wood", 0.82, 0.0, 0.0, "opaque"],
		["material.mvp.iron", "MVP Iron", "metal", 0.48, 0.72, 0.0, "opaque"],
		["material.mvp.mana", "MVP Mana", "magic", 0.30, 0.0, 1.0, "emissive"],
		["material.mvp.fire", "MVP Fire", "effect", 0.25, 0.0, 1.0, "emissive"],
		["material.mvp.glass", "MVP Glass", "glass", 0.12, 0.0, 0.0, "transparent"],
	]:
		var material := ForgeMaterialDefinition.new()
		material.material_id = str(value[0])
		material.display_name = str(value[1])
		material.family = str(value[2])
		material.roughness_default = float(value[3])
		material.metallic_default = float(value[4])
		material.emission_default = float(value[5])
		material.rendering_class = str(value[6])
		material.opacity_mode = (
			"alpha" if material.rendering_class == "transparent"
			else "opaque")
		material.overlay_compatibility = PackedStringArray([
			"damage", "wet", "corruption", "warning"])
		material.animation_parameters = PackedStringArray([
			"emission_strength", "flow_strength"])
		var root := "res://content/forge/materials"
		DirAccess.make_dir_recursive_absolute(
			ProjectSettings.globalize_path(root))
		var path := root.path_join(
			"%s.tres" % ForgeId.safe_filename(material.material_id))
		var error := ResourceSaver.save(material, path)
		if error != OK:
			failures.append("material:%s:%s" % [
				material.material_id, error_string(error)])


func _create_pack_manifest(assets: Array[ForgeAssetDefinition]) -> void:
	var manifest := ForgeContentPackManifest.new()
	manifest.pack_id = "pack.leyforge.project_visuals"
	manifest.display_name = "Leyforge Project Visuals"
	manifest.version = "0.1.0"
	manifest.priority = 100
	manifest.provenance_note = (
		"Project-owned 21A-21F MVP golden sources; broader migration is deferred.")
	for asset in assets:
		if asset != null:
			manifest.asset_ids.append(asset.forge_asset_id)
	var root := "res://content/forge/packs"
	DirAccess.make_dir_recursive_absolute(ProjectSettings.globalize_path(root))
	var path := root.path_join(
		"%s.tres" % ForgeId.safe_filename(manifest.pack_id))
	var error := ResourceSaver.save(manifest, path)
	if error != OK:
		failures.append("pack:%s:%s" % [
			manifest.pack_id, error_string(error)])


func _contract(contract_id: String) -> ForgePresentationContract:
	var path := "res://content/forge/contracts/%s.tres" % (
		ForgeId.safe_filename(contract_id))
	var resource := ResourceLoader.load(
		path, "", ResourceLoader.CACHE_MODE_IGNORE)
	return resource if resource is ForgePresentationContract else null


func _create_migration_register() -> void:
	var approved_gameplay := {}
	for source_id in generated:
		var gameplay_id := source_id.trim_prefix("forge_asset.")
		approved_gameplay[gameplay_id] = true
	var records: Array[Dictionary] = []
	for record in bridge.all_gameplay_records():
		var migration := ForgeMigrationService.new().build_migration_record(record)
		if approved_gameplay.has(migration.gameplay_id):
			migration.current_source = "forge_source"
			migration.classification = "mvp_golden"
			migration.priority = "mvp_complete"
			migration.status = "approved"
			migration.review_notes = (
				"Representative 21A-21F MVP asset; does not authorise bulk 21G migration.")
		else:
			migration.status = "unreviewed"
			migration.priority = "deferred"
		records.append(migration.to_record())
	var payload := {
		"schema": "leyforge.forge.migration-register",
		"version": 1,
		"generated_from": "data/registry/voxel_registry.json",
		"bulk_migration_started": false,
		"mvp_golden_count": generated.size(),
		"records": records,
	}
	var root := "res://content/forge/migration"
	DirAccess.make_dir_recursive_absolute(ProjectSettings.globalize_path(root))
	var path := root.path_join("registry_migration_register.json")
	var file := FileAccess.open(path, FileAccess.WRITE)
	if file == null:
		failures.append("migration_register:open_failed")
		return
	file.store_string(JSON.stringify(payload, "\t"))
