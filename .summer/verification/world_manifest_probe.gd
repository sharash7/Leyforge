extends Node
## WLD-001 probe for persistent, content-locked and repairable world identity.

const WorldManifestScript = preload("res://scripts/world/world_manifest.gd")

var checks := 0
var failures: Array[String] = []


func _ready() -> void:
	_test_seed_manifest_corpus()
	_test_repair_contract()
	_test_legacy_boundary()
	_test_world_manager_integration()
	print(JSON.stringify({"ok": failures.is_empty(), "checks": checks,
		"failures": failures}))
	get_tree().quit(0 if failures.is_empty() else 1)


func _test_seed_manifest_corpus() -> void:
	var manifest_hashes := {}
	var region_ids := {}
	for index in 64:
		var seed_value := ValleyPlan.derive_seed(index, "world.manifest.probe")
		var planner := WorldStructurePlanner.new()
		planner.generate(seed_value, WorldStructurePlanner.VERSION)
		var generation := planner.save_manifest()
		generation["worldgen_version"] = 5
		var world_id := "world.manifest.probe.%03d" % index
		var first := WorldManager.compose_world_manifest(
			world_id, seed_value, str(seed_value), "numeric", generation)
		var second := WorldManager.compose_world_manifest(
			world_id, seed_value, str(seed_value), "numeric", generation)
		var validation := WorldManifestScript.validate(first)
		_expect(bool(validation.get("ok", false)),
			"seed manifest validates: %d" % seed_value)
		_expect(first == second,
			"seed manifest is deterministic: %d" % seed_value)
		_expect(str(first.get("manifest_hash", "")).length() == 64,
			"seed manifest has canonical hash: %d" % seed_value)
		_expect(first.get("generation", {}).get("profile_id") \
			== WorldStructurePlanner.PROFILE_ID,
			"seed manifest uses the production profile: %d" % seed_value)
		_expect(first.get("content_lock", {}).get(
			"registry_generation_hash") == ProductionCatalogue.catalogue_hash(),
			"seed manifest locks the active catalogue: %d" % seed_value)
		var realms: Array = first.get("realms", [])
		_expect(realms.size() == 1 and realms[0].get("realm_id") \
			== "realm.overworld", "seed manifest owns the Overworld: %d" \
			% seed_value)
		var regions: Array = realms[0].get("regions", [])
		_expect(regions.size() == 1 and regions[0].get("source_plan_id") \
			== planner.identity(),
			"starter region retains its source plan: %d" % seed_value)
		manifest_hashes[str(first.get("manifest_hash", ""))] = true
		region_ids[str(regions[0].get("region_id", ""))] = true
	_expect(manifest_hashes.size() == 64,
		"seed corpus produces unique manifest identities")
	_expect(region_ids.size() == 64,
		"seed corpus produces unique starter-region identities")


func _test_repair_contract() -> void:
	var planner := WorldStructurePlanner.new()
	planner.generate(424242, WorldStructurePlanner.VERSION)
	var generation := planner.save_manifest()
	generation["worldgen_version"] = 5
	var expected := WorldManager.compose_world_manifest(
		"world.manifest.repair", 424242, "424242", "numeric", generation)
	var missing := WorldManifestScript.repair({}, expected)
	_expect(bool(missing.get("ok", false)) and bool(missing.get("repaired", false)),
		"missing manifest is repaired from derivable identity")
	_expect(missing.get("actions", []) \
		== ["reconstructed_derivable_world_manifest"],
		"manifest repair records its action")
	_expect(bool(WorldManifestScript.validate(missing.get("manifest", {})).get(
		"ok", false)), "repaired manifest validates")
	var repeated := WorldManifestScript.repair({}, expected)
	_expect(repeated.get("manifest") == missing.get("manifest"),
		"missing-manifest repair is deterministic")

	var tampered := expected.duplicate(true)
	tampered["generation"]["site_plan_hash"] = "tampered"
	_expect(not bool(WorldManifestScript.validate(tampered).get("ok", false)),
		"tampered manifest hash is rejected")
	var repaired := WorldManifestScript.repair(tampered, expected)
	_expect(bool(repaired.get("ok", false)),
		"tampered derivable manifest is repairable")
	_expect(repaired.get("manifest", {}).get("generation", {}).get(
		"site_plan_hash") == generation.get("site_plan_hash"),
		"repair restores the canonical site-plan hash")
	_expect((repaired.get("manifest", {}).get(
		"repair_history", []) as Array).size() == 1,
		"repair evidence is persisted")
	var valid := WorldManifestScript.repair(expected, expected)
	_expect(bool(valid.get("ok", false)) and not bool(valid.get(
		"repaired", true)), "valid manifest is left unchanged")
	_expect(valid.get("manifest") == expected,
		"valid manifest round-trips losslessly")
	var wrong_world := tampered.duplicate(true)
	wrong_world["world_id"] = "world.manifest.other"
	_expect(WorldManifestScript.repair(wrong_world, expected).get("error") \
		== "world_identity_mismatch", "repair cannot change world identity")
	var wrong_seed := tampered.duplicate(true)
	wrong_seed["resolved_seed"] = 7
	_expect(WorldManifestScript.repair(wrong_seed, expected).get("error") \
		== "world_seed_mismatch", "repair cannot change the world seed")
	var json_round_trip = JSON.parse_string(JSON.stringify(expected))
	_expect(bool(WorldManifestScript.validate(json_round_trip).get("ok", false)),
		"manifest remains valid across JSON persistence")


func _test_legacy_boundary() -> void:
	var planner := ValleyPlan.new()
	planner.generate(1337, ValleyPlan.VERSION)
	var generation := planner.save_manifest()
	generation["worldgen_version"] = 2
	var legacy := WorldManifestScript.create(
		"world.manifest.legacy", 1337, "1337", "legacy", generation,
		ProductionCatalogue.pack_order(), ProductionCatalogue.catalogue_hash(), true)
	var legacy_validation := WorldManifestScript.validate(legacy)
	_expect(bool(legacy_validation.get("ok", false)),
		"explicit legacy-import manifest remains readable: %s" \
		% legacy_validation)
	legacy["legacy_import"] = false
	legacy["manifest_hash"] = WorldManifestScript.canonical_hash(legacy)
	_expect("production_manifest_uses_archived_profile" in WorldManifestScript.validate(
		legacy).get("failures", []),
		"archived profile is rejected for a production manifest")


func _test_world_manager_integration() -> void:
	var root := "user://verification_world_manifest_%d" % Time.get_ticks_msec()
	_expect(WorldManager.configure_verification_root(root),
		"world manifest probe receives an isolated world root")
	var created := WorldManager.create_world("Manifest Frontier", "Manifest Seed")
	_expect(bool(created.get("ok", false)),
		"WorldManager creates a manifested world")
	var world: Dictionary = created.get("world", {})
	var manifest: Dictionary = world.get("world_manifest", {})
	_expect(not manifest.is_empty(), "new world metadata embeds its manifest")
	var manifest_validation := WorldManifestScript.validate(manifest)
	_expect(bool(manifest_validation.get("ok", false)),
		"new world metadata manifest validates: %s" % manifest_validation)
	_expect(world.get("world_manifest_hash") == manifest.get("manifest_hash"),
		"world card exposes the manifest hash")
	_expect(WorldManager.active_world_manifest() == manifest,
		"active world returns the persisted manifest")
	_expect(WorldManager.active_generation_request().get(
		"world_manifest", {}) == manifest,
		"generation request carries world identity evidence")
	_expect("controlled_poc" not in str(manifest.get(
		"generation", {}).get("profile_id", "")),
		"new WorldManager worlds contain no archived POC profile")
	WorldManager.clear_active_world()
	WorldManager.clear_verification_root()


func _expect(condition: bool, message: String) -> void:
	checks += 1
	if not condition:
		failures.append(message)
