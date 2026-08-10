extends Node
## Set 22 Stage 2 rig assembly plus Set 23 spatial resolver gate.

const RUNTIME_ROOT := "res://content/forge/runtime/set22_23"
const HUMANOID_ID := "entity.definition.template.humanoid_standard"
const PIG_ID := "entity.definition.template.pig_quadruped"
const EXPECTED_HASH := (
	"015f3f0e96ee38a8efdfd9102422998190a7185e7dab3bf0fe2b9aa4be443727")
const DENSITY_PATHS := [
	"res://content/forge/entities/density_profiles/density_profile_entity_coarse.tres",
	"res://content/forge/entities/density_profiles/density_profile_entity_colossal_modular.tres",
	"res://content/forge/entities/density_profiles/density_profile_entity_fine.tres",
	"res://content/forge/entities/density_profiles/density_profile_entity_micro_accent.tres",
	"res://content/forge/entities/density_profiles/density_profile_entity_standard.tres",
]

var _checks := 0
var _failures: Array[String] = []
var _hashes: Array[String] = []


func _ready() -> void:
	var semantic := _semantic_registry()
	_verify_schemas_and_manifest()
	_verify_sources(semantic)
	_verify_runtime_contact(semantic)
	_verify_negative_validation(semantic)
	_hashes.sort()
	var deterministic_hash := ForgeStableRecord.hash_record({"hashes": _hashes})
	_check(deterministic_hash.length() == 64,
		"Stage 2 deterministic aggregate is not SHA-256")
	if not EXPECTED_HASH.is_empty():
		_check(deterministic_hash == EXPECTED_HASH,
			"Stage 2 deterministic aggregate hash drifted")
	var report := {
		"ok": _failures.is_empty(),
		"checks": _checks,
		"failures": _failures,
		"deterministic_hash": deterministic_hash,
	}
	print("SET22_STAGE2_SET23_SPATIAL_PROBE %s" % JSON.stringify(report))
	get_tree().quit(0 if _failures.is_empty() else 1)


func _semantic_registry() -> ForgeSemanticRegistry:
	var semantic := ForgeSemanticRegistry.new()
	var report := semantic.load_and_validate()
	_check(bool(report.get("ok", false)),
		"semantic registry did not load for Stage 2")
	_check((report.get("diagnostics", []) as Array).is_empty(),
		"semantic registry emitted Stage 2 diagnostics")
	return semantic


func _verify_schemas_and_manifest() -> void:
	var schemas := ForgeSchemaRegistry.new()
	var expected := {
		"leyforge.forge.rig-joint": "entity_runtime",
		"leyforge.forge.rig-role-binding": "entity_runtime",
		"leyforge.forge.rig-profile": "entity_runtime",
		"leyforge.forge.entity-assembly-profile": "entity_runtime",
		"leyforge.forge.actor-snapshot": "entity_runtime",
		"leyforge.forge.spatial-map": "spatial_runtime",
		"leyforge.forge.runtime-contact": "spatial_runtime",
	}
	_check(schemas.filtered_list("entity_runtime").size() == 5,
		"entity runtime schema family count drifted")
	_check(schemas.filtered_list("spatial_runtime").size() == 2,
		"spatial runtime schema family count drifted")
	for schema_id in expected:
		_check(schemas.has(schema_id),
			"Stage 2 schema is not registered: %s" % schema_id)
		var record := schemas.resolve(schema_id)
		_check(int(record.get("version", 0)) == 1,
			"Stage 2 schema version drifted")
		_check(str(record.get("domain", "")) == expected[schema_id],
			"Stage 2 schema domain drifted")
	var service := ForgeProjectManifestService.new()
	var report := service.load_and_validate()
	_check(bool(report.get("ok", false)),
		"project manifest rejected Stage 2 runtime sources")
	_check((report.get("diagnostics", []) as Array).is_empty(),
		"project manifest emitted Stage 2 diagnostics")
	_check(str(service.manifest.feature_contract_versions.get(
		"set22_stage2", "")) == ForgeRigProfile.CONTRACT_VERSION,
		"project manifest omitted Set 22 Stage 2 contract")
	_check(str(service.manifest.feature_contract_versions.get(
		"set23_spatial", "")) == ForgeSpatialMap.CONTRACT_VERSION,
		"project manifest omitted Set 23 spatial contract")
	_check(RUNTIME_ROOT in service.manifest.source_roots,
		"project manifest omitted shared Stage 2 source root")
	for schema_id in expected:
		_check(service.has(schema_id),
			"manifest lookup omitted Stage 2 schema")


func _verify_sources(semantic: ForgeSemanticRegistry) -> void:
	var density := ForgeDensityProfileRegistry.new()
	_check(bool(density.load_and_validate(
		PackedStringArray(DENSITY_PATHS)).get("ok", false)),
		"density registry failed for Stage 2")
	var factory := ForgeRuntimeActorFactory.new()
	var report := factory.load_and_validate(PackedStringArray([
		"res://content/forge/entities",
		"res://content/forge/materials/set22",
		RUNTIME_ROOT,
	]), semantic, density)
	_check(bool(report.get("ok", false)),
		"runtime actor factory rejected golden sources")
	_check((report.get("diagnostics", []) as Array).is_empty(),
		"runtime actor factory retained diagnostics")
	_check(int(report.get("entity_count", 0)) >= 2,
		"runtime actor factory did not retain the two golden entities")
	_check(int(report.get("rig_count", 0)) >= 2,
		"runtime actor factory did not retain the two golden rigs")
	_check(int(report.get("spatial_map_count", 0)) == 2,
		"runtime actor factory did not load two spatial maps")
	_check(int(report.get("assembly_count", 0)) == 2,
		"runtime actor factory did not load two assembly profiles")
	_check(int(report.get("alias_count", 0)) == 6,
		"runtime source aliases were not indexed")
	for stable_id in [
		"entity.rig.profile.humanoid_standard",
		"entity.rig.profile.pig_quadruped",
		"spatial.map.entity.humanoid_standard",
		"spatial.map.entity.pig_quadruped",
		"entity.assembly_profile.humanoid_standard",
		"entity.assembly_profile.pig_quadruped",
	]:
		_check(factory.has(stable_id),
			"runtime factory cannot resolve source: %s" % stable_id)
		_check(not factory.resolve(stable_id).is_empty(),
			"runtime factory returned an empty source record")
	_check(str(factory.resolve("entity.rig.template.humanoid_standard").get(
		"rig_profile_id", "")) == "entity.rig.profile.humanoid_standard",
		"runtime rig alias resolved in the wrong direction")
	_check(str(factory.resolve("spatial.map.template.pig_quadruped").get(
		"spatial_map_id", "")) == "spatial.map.entity.pig_quadruped",
		"runtime spatial-map alias resolved in the wrong direction")
	_check(str(factory.resolve(
		"entity.assembly_profile.template.humanoid_standard").get(
			"assembly_profile_id", "")) ==
			"entity.assembly_profile.humanoid_standard",
		"runtime assembly alias resolved in the wrong direction")
	_verify_resource_round_trips(factory)
	_verify_actor(factory, HUMANOID_ID, 11, [
		"socket.presentation.mouth", "socket.audio.voice",
		"socket.presentation.hand.left", "socket.presentation.hand.right",
		"socket.presentation.foot.left", "socket.presentation.foot.right",
		"socket.equipment.primary", "socket.presentation.damage",
		"runtime_anchor.movement.foot_contact",
	])
	_verify_actor(factory, PIG_ID, 10, [
		"socket.presentation.mouth", "socket.audio.voice",
		"socket.presentation.foot.left", "socket.presentation.foot.right",
		"socket.presentation.damage", "socket.vfx.breath_origin",
		"runtime_anchor.movement.foot_contact",
	])


func _verify_resource_round_trips(factory: ForgeRuntimeActorFactory) -> void:
	var records := factory.filtered_list()
	_check(records.size() >= 8,
		"factory filtered list did not expose the golden entities and runtime sources")
	var root := "user://set22_stage2_roundtrips"
	DirAccess.make_dir_recursive_absolute(ProjectSettings.globalize_path(root))
	for record in records:
		if str(record.get("runtime_kind", "")) == "entity_definition":
			continue
		var source_id := _record_id(record)
		var path := factory.asset_index.foundation_path_for(source_id)
		var resource := ResourceLoader.load(
			path, "", ResourceLoader.CACHE_MODE_IGNORE)
		_check(resource != null,
			"Stage 2 runtime source did not load for round-trip")
		if resource == null:
			continue
		var first_hash := str(resource.call("canonical_hash"))
		_check(first_hash.length() == 64,
			"Stage 2 source hash is not SHA-256")
		var roundtrip_path := "%s/%s.tres" % [
			root, ForgeId.safe_filename(source_id)]
		_check(ResourceSaver.save(resource, roundtrip_path) == OK,
			"Stage 2 source failed to serialise")
		var loaded := ResourceLoader.load(
			roundtrip_path, "", ResourceLoader.CACHE_MODE_IGNORE)
		_check(loaded != null and str(loaded.call("canonical_hash")) == first_hash,
			"Stage 2 source hash changed after round-trip")
		_hashes.append(first_hash)


func _verify_actor(
		factory: ForgeRuntimeActorFactory, entity_id: String,
		expected_parts: int, required_roles: Array) -> void:
	var first := factory.create_actor(entity_id, "%s:first" % entity_id)
	var second := factory.create_actor(entity_id, "%s:second" % entity_id)
	_check(first != null and second != null,
		"golden runtime actor did not instantiate: %s" % entity_id)
	if first == null or second == null:
		return
	add_child(first)
	add_child(second)
	var first_readback := first.read_back()
	var second_readback := second.read_back()
	_check(bool(first_readback.get("ok", false)),
		"golden actor failed semantic read-back")
	_check(bool(second_readback.get("ok", false)),
		"second golden actor failed semantic read-back")
	_check(int(first_readback.get("part_count", 0)) == expected_parts,
		"golden actor rigid-part count drifted")
	_check(int(first_readback.get("role_count", 0)) == expected_parts,
		"golden actor semantic role count drifted")
	for role_id in first.role_nodes:
		var role_node := first.role_node(role_id)
		_check(role_node != null and str(role_node.get_meta(
			"forge_role_id", "")) == role_id,
			"assembled semantic role metadata drifted")
		var mesh_count := 0
		for child in role_node.get_children():
			if child is MeshInstance3D and bool(child.get_meta(
					"forge_rigid_binding", false)):
				mesh_count += 1
		_check(mesh_count == 1,
			"assembled body part did not retain one rigid voxel mesh")
	first.play_semantic_action("idle", true)
	second.play_semantic_action("idle", true)
	first.advance_motion(0.375)
	second.advance_motion(0.375)
	_check(first.pose_hash() == second.pose_hash(),
		"golden idle motion was not deterministic")
	var idle_hash := first.pose_hash()
	first.play_semantic_action("walk", true)
	second.play_semantic_action("walk", true)
	first.advance_motion(0.275)
	second.advance_motion(0.275)
	_check(first.pose_hash() == second.pose_hash(),
		"golden walk motion was not deterministic")
	_check(first.pose_hash() != idle_hash,
		"golden walk motion did not change the semantic pose")
	_hashes.append(first.pose_hash())
	var snapshot := first.snapshot()
	var serialized := JSON.stringify(snapshot)
	var restored_record: Variant = JSON.parse_string(serialized)
	_check(restored_record is Dictionary,
		"actor snapshot was not JSON serialisable")
	var reconstructed := factory.reconstruct(restored_record)
	_check(reconstructed != null,
		"actor snapshot did not reconstruct by stable ID")
	if reconstructed != null:
		add_child(reconstructed)
		_check(reconstructed.snapshot_hash() == first.snapshot_hash(),
			"actor reconstruction changed its stable snapshot")
		_check(reconstructed.pose_hash() == first.pose_hash(),
			"actor reconstruction changed its semantic pose")
		_hashes.append(reconstructed.snapshot_hash())
		_verify_spatial_roles(
			factory.spatial_resolver, reconstructed, required_roles)
		reconstructed.queue_free()
	first.queue_free()
	second.queue_free()


func _verify_spatial_roles(
		resolver: ForgeSpatialResolver, actor: ForgeRuntimeActor,
		required_roles: Array) -> void:
	for role_id in required_roles:
		var result := resolver.resolve(actor.instance_id, str(role_id))
		_check(bool(result.get("ok", false)),
			"required semantic spatial role did not resolve: %s" % role_id)
		_check(str(result.get("quality", "")) == "exact",
			"LOD 0 spatial role did not resolve exactly")
		_check(result.get("transform") is Transform3D,
			"semantic spatial result omitted a transform")
		_hashes.append(resolver.resolution_hash(result))
	var mouth_lod := resolver.resolve(
		actor.instance_id, "socket.presentation.mouth", null, {"lod_level": 2})
	_check(bool(mouth_lod.get("ok", false)) \
		and str(mouth_lod.get("quality", "")) == "approximate",
		"far-LOD mouth role did not use declared approximation")
	_check(str(mouth_lod.get("resolved_reference_id", "")).ends_with(".center"),
		"far-LOD mouth did not remap to entity centre")
	var damage := resolver.resolve(
		actor.instance_id, "socket.presentation.damage", null,
		{"variant_id": "damaged"})
	_check(bool(damage.get("ok", false)) \
		and str(damage.get("quality", "")) == "fallback",
		"damaged spatial variant did not use declared fallback")
	var alias_id := "presentation.spatial.entity.%s.mouth" % (
		"humanoid_standard" if actor.entity_definition.body_family == "humanoid"
		else "pig_quadruped")
	var aliased := resolver.resolve(actor.instance_id, alias_id)
	_check(bool(aliased.get("ok", false)) \
		and str(aliased.get("canonical_role_id", "")) ==
			"socket.presentation.mouth",
		"owner-local spatial import alias resolved in the wrong direction")
	if actor.entity_definition.body_family == "humanoid":
		var mirrored := resolver.resolve(
			actor.instance_id, "socket.presentation.hand.mirror_preview")
		_check(bool(mirrored.get("ok", false)) \
			and str(mirrored.get("mapping_source", "")) == "mirror",
			"explicit spatial mirror mapping did not resolve")


func _verify_runtime_contact(semantic: ForgeSemanticRegistry) -> void:
	var contact := ForgeRuntimeContactRecord.new()
	contact.runtime_anchor_id = "runtime_anchor.block.mining_impact"
	contact.event_instance_id = "mining-impact:0001"
	contact.world_position = Vector3(4.25, 8.5, -2.75)
	contact.surface_normal = Vector3.UP
	contact.incoming_direction = Vector3.DOWN
	contact.source_owner_id = "player:one"
	contact.target_owner_id = "voxel:4,8,-3"
	contact.struck_voxel = Vector3i(4, 8, -3)
	contact.struck_face = "top"
	contact.target_material_id = "material.stone"
	contact.timestamp_msec = 1000
	contact.deterministic_seed = 23001
	var diagnostics := ForgeValidationService.new().validate_runtime_contact_source(
		contact, semantic)
	_check(diagnostics.is_empty(),
		"valid runtime contact emitted diagnostics")
	var path := "user://set22_stage2_runtime_contact.tres"
	_check(ResourceSaver.save(contact, path) == OK,
		"runtime contact did not serialise")
	var loaded := ResourceLoader.load(
		path, "", ResourceLoader.CACHE_MODE_IGNORE) as ForgeRuntimeContactRecord
	_check(loaded != null and loaded.canonical_hash() == contact.canonical_hash(),
		"runtime contact changed after Resource round-trip")
	var resolver := ForgeSpatialResolver.new()
	var result := resolver.resolve(
		"unbound-owner", contact.runtime_anchor_id, contact)
	_check(bool(result.get("ok", false)) \
		and str(result.get("mapping_source", "")) == "runtime_contact",
		"runtime contact did not resolve independently of scene paths")
	_check((result.get("transform") as Transform3D).origin == contact.world_position,
		"runtime contact transform drifted")
	_hashes.append(contact.canonical_hash())
	_hashes.append(resolver.resolution_hash(result))


func _verify_negative_validation(semantic: ForgeSemanticRegistry) -> void:
	var validator := ForgeValidationService.new()
	var bad_rig := ForgeRigProfile.new()
	bad_rig.rig_profile_id = "entity.rig.invalid"
	bad_rig.entity_definition_id = HUMANOID_ID
	bad_rig.body_plan_id = "entity.body_plan.template.humanoid_standard"
	bad_rig.root_role_id = "anatomy.role.humanoid.pelvis"
	var root := ForgeRigRoleBinding.new()
	root.role_id = "anatomy.role.humanoid.pelvis"
	root.body_part_id = "entity.body_part.template.humanoid_standard.pelvis"
	root.parent_role_id = "anatomy.role.humanoid.head"
	var head := ForgeRigRoleBinding.new()
	head.role_id = "anatomy.role.humanoid.head"
	head.body_part_id = "entity.body_part.template.humanoid_standard.head"
	head.parent_role_id = root.role_id
	bad_rig.role_bindings = [root, head]
	var rig_diagnostics := validator.validate_rig_source(
		bad_rig, null, semantic)
	_check(_has_code(rig_diagnostics, "EFB-RIG-001"),
		"cyclic malformed rig did not emit EFB-RIG-001")
	var bad_map := ForgeSpatialMap.new()
	bad_map.spatial_map_id = "spatial.map.invalid"
	bad_map.owner_asset_id = HUMANOID_ID
	bad_map.references = []
	bad_map.alias_mappings = {"socket.bad": ["socket.one", "socket.two"]}
	var map_diagnostics := validator.validate_spatial_map_source(
		bad_map, semantic)
	_check(_has_code(map_diagnostics, "SPT-001"),
		"empty malformed spatial map did not emit SPT-001")
	var bad_contact := ForgeRuntimeContactRecord.new()
	bad_contact.runtime_anchor_id = "runtime_anchor.block.mining_impact"
	bad_contact.event_instance_id = "broken"
	bad_contact.surface_normal = Vector3.ZERO
	bad_contact.lifetime_seconds = 0.0
	var contact_diagnostics := validator.validate_runtime_contact_source(
		bad_contact, semantic)
	_check(_has_code(contact_diagnostics, "SPT-003"),
		"malformed runtime contact did not emit SPT-003")


func _record_id(record: Dictionary) -> String:
	for key in ["rig_profile_id", "spatial_map_id", "assembly_profile_id"]:
		if record.has(key):
			return str(record[key])
	return ""


func _has_code(diagnostics: Array, code: String) -> bool:
	for diagnostic in diagnostics:
		if diagnostic is ForgeDiagnostic and diagnostic.code == code:
			return true
	return false


func _check(condition: bool, message: String) -> void:
	_checks += 1
	if not condition:
		_failures.append(message)
