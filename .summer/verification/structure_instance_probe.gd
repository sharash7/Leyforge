extends Node
## STR-001 owner-boundary probe for construction, combat, persistence and LOD.

class DamageWorld:
	extends RefCounted
	var block_id := 0
	var writes := 0

	func _init(initial_block_id: int) -> void:
		block_id = initial_block_id

	func get_hamlet_station_position(_station_id: String) -> Vector3i:
		return Vector3i.ZERO

	func prepare_player_column(_position: Vector3) -> void:
		pass

	func get_block_global(_position: Vector3i) -> int:
		return block_id

	func set_block_global(_position: Vector3i, next_block_id: int) -> bool:
		writes += 1
		block_id = next_block_id
		return true


var checks := 0
var failures: Array[String] = []


func _ready() -> void:
	call_deferred("_run")


func _run() -> void:
	ProductionKernel.reset_for_verification()
	StructureManager.reset()
	StructureManager.initialize(424242, "world.structure.probe")
	_test_construction_handoff()
	_test_consequences_and_lod()
	_test_persistence()
	_test_generated_and_migration_handoffs()
	_test_hamlet_and_combat_integration()
	print("STRUCTURE_INSTANCE_PROBE %s" % JSON.stringify({
		"ok": failures.is_empty(),
		"checks": checks,
		"failures": failures,
		"structure_count": StructureManager.structure_count(),
	}))
	get_tree().quit(0 if failures.is_empty() else 1)


func _project_fixture() -> Dictionary:
	return {
		"id": "project.build.small_cottage",
		"instance_id": "project_instance.probe.structure.cottage",
		"definition_id": "project.build.small_cottage",
		"building_definition_id": "building.residential.small_cottage",
		"blueprint_id": "blueprint.leyforge.residential.small_cottage_a",
		"owner_id": "settlement.probe.structure",
		"position": [12, -8],
		"complete": true,
	}


func _test_construction_handoff() -> void:
	var incomplete := _project_fixture()
	incomplete["complete"] = false
	_expect(StructureManager.handoff_completed_project(incomplete).get(
		"error") == "project_not_complete",
		"incomplete construction cannot create structure truth")
	var malformed := _project_fixture()
	malformed["instance_id"] = ""
	_expect(StructureManager.handoff_completed_project(malformed).get(
		"error") == "construction_identity_required",
		"construction handoff requires stable identity")

	var project := _project_fixture()
	var handoff := StructureManager.handoff_completed_project(project, {
		"day": 4,
		"clock_minutes": 615.0,
	})
	var instance_id := StructureManager.structure_instance_id_for_project(
		str(project["instance_id"]))
	_expect(bool(handoff.get("ok", false)) \
			and not bool(handoff.get("duplicate", true)),
		"completed project hands one structure to its owner")
	_expect(instance_id == "building_instance.probe.structure.cottage",
		"construction identity bridges the existing building-instance ID")
	_expect(StructureManager.structure_count() == 1 \
			and StructureManager.has_structure(instance_id),
		"structure owner stores one canonical instance")
	var record := StructureManager.get_structure(instance_id)
	_expect(str(record.get("record_type", "")) == "StructureInstance" \
			and int(record.get("version", 0)) == 1,
		"canonical record is versioned StructureInstance")
	_expect(str(record.get("definition_id", "")) \
			== "building.residential.small_cottage" \
			and str(record.get("source_project_id", "")) \
			== str(project["instance_id"]),
		"structure retains definition and source project identities")
	_expect(str(record.get("owner_id", "")) == "settlement.probe.structure" \
			and str(record.get("settlement_id", "")) \
			== "settlement.probe.structure",
		"structure ownership is explicit and stable")
	_expect(record.get("position", []) == [12, -8] \
			and str(record.get("lifecycle_state", "")) == "complete" \
			and is_equal_approx(float(record.get("condition", 0.0)), 1.0),
		"completed structure owns physical position and condition")
	_expect(str(record.get("state_hash", "")).length() == 64 \
			and bool(StructureManager.validate_structure_record(
				record, 424242).get("ok", false)),
		"structure state has a valid canonical hash")
	var kernel_state := ProductionKernel.serialize_state()
	_expect((kernel_state.get("evidence", []) as Array).size() == 1 \
			and (kernel_state.get("events", []) as Array).size() == 1,
		"construction completion commits shared evidence and event")

	var duplicate := StructureManager.handoff_completed_project(project)
	_expect(bool(duplicate.get("ok", false)) \
			and bool(duplicate.get("duplicate", false)) \
			and StructureManager.structure_count() == 1,
		"identical construction handoff is idempotent")
	_expect(int(StructureManager.get_structure(instance_id).get(
		"revision", 0)) == 1 \
			and (ProductionKernel.serialize_state().get(
				"evidence", []) as Array).size() == 1,
		"idempotent handoff cannot reset state or duplicate evidence")
	var conflict := project.duplicate(true)
	conflict["building_definition_id"] = "building.storage.small_storehouse"
	_expect(StructureManager.handoff_completed_project(conflict).get(
		"error") == "structure_identity_conflict",
		"same instance ID cannot be reassigned to another definition")


func _test_consequences_and_lod() -> void:
	var instance_id := "building_instance.probe.structure.cottage"
	_expect(StructureManager.record_damage("structure.missing", 0.1, {
		"consequence_id": "missing.damage",
	}).get("error") == "unknown_structure",
		"damage cannot materialise an unknown structure")
	_expect(StructureManager.can_accept_consequence(
		instance_id, "invent", "invalid", 0.1).get("error") \
		== "unknown_consequence_type",
		"structure owner rejects unknown consequence kinds")
	_expect(StructureManager.can_accept_consequence(
		instance_id, "damage", "", 0.1).get("error") \
		== "invalid_consequence",
		"structure consequence requires an idempotency identity")
	_expect(bool(StructureManager.can_accept_consequence(
		instance_id, "damage", "weather.1", 0.25).get("ok", false)),
		"valid damage consequence passes owner preflight")

	var damage := StructureManager.record_damage(instance_id, 0.25, {
		"consequence_id": "weather.1",
		"source_owner": "weather",
		"source_event_id": "storm.probe.1",
		"position": [12, 4, -8],
		"material_ref": "construction.beam.oak",
	})
	_expect(bool(damage.get("ok", false)) \
			and is_equal_approx(float(damage.get("condition", 0.0)), 0.75) \
			and str(damage.get("lifecycle_state", "")) == "damaged",
		"owner commits damage and derives damaged lifecycle")
	var damaged := StructureManager.get_structure(instance_id)
	_expect((damaged.get("damage_history", []) as Array).size() == 1 \
			and (damaged.get("repair_history", []) as Array).is_empty() \
			and int(damaged.get("revision", 0)) == 2,
		"damage history and revision advance exactly once")
	_expect((damaged.get("evidence_refs", []) as Array).size() == 2 \
			and str(damage.get("evidence_id", "")).begins_with("evidence."),
		"damage consequence retains committed evidence")
	var duplicate := StructureManager.record_damage(instance_id, 0.25, {
		"consequence_id": "weather.1",
	})
	_expect(bool(duplicate.get("ok", false)) \
			and bool(duplicate.get("duplicate", false)) \
			and is_equal_approx(float(duplicate.get("condition", 0.0)), 0.75),
		"replayed damage is idempotent")
	_expect(StructureManager.record_damage(instance_id, 0.2, {
		"consequence_id": "weather.1",
	}).get("error") == "consequence_conflict",
		"changed replay payload is rejected as a conflict")
	var destroyed := StructureManager.record_damage(instance_id, 0.9, {
		"consequence_id": "weather.2",
		"source_owner": "weather",
	})
	_expect(is_equal_approx(float(destroyed.get("condition", 1.0)), 0.0) \
			and str(destroyed.get("lifecycle_state", "")) == "destroyed",
		"condition zero derives destroyed lifecycle")
	var repaired := StructureManager.record_repair(instance_id, 0.4, {
		"consequence_id": "builder.repair.1",
		"source_owner": "settlement",
	})
	_expect(is_equal_approx(float(repaired.get("condition", 0.0)), 0.4) \
			and str(repaired.get("lifecycle_state", "")) == "damaged",
		"partial repair revives structure without claiming completion")
	var completed := StructureManager.record_repair(instance_id, 1.0, {
		"consequence_id": "builder.repair.2",
		"source_owner": "settlement",
	})
	_expect(is_equal_approx(float(completed.get("condition", 0.0)), 1.0) \
			and str(completed.get("lifecycle_state", "")) == "complete",
		"bounded repair restores complete lifecycle")
	_expect(StructureManager.record_repair(instance_id, 0.1, {
		"consequence_id": "builder.repair.3",
	}).get("error") == "structure_not_damaged",
		"fully repaired structure rejects invented repair work")
	var final_record := StructureManager.get_structure(instance_id)
	_expect((final_record.get("damage_history", []) as Array).size() == 2 \
			and (final_record.get("repair_history", []) as Array).size() == 2 \
			and int(final_record.get("revision", 0)) == 5,
		"canonical histories preserve every committed consequence")
	_expect(bool(StructureManager.validate_structure_record(
		final_record, 424242).get("ok", false)),
		"mutated structure retains a valid state hash")

	for mode in ["local", "regional", "dormant"]:
		var view := StructureManager.project_lod(instance_id, mode)
		_expect(str(view.get("lod_mode", "")) == mode \
				and str(view.get("structure_instance_id", "")) == instance_id,
			"%s LOD preserves structure identity" % mode)
		_expect(str(view.get("owner_id", "")) \
				== str(final_record.get("owner_id", "")) \
				and is_equal_approx(float(view.get("condition", -1.0)), 1.0),
			"%s LOD preserves ownership and quantities" % mode)
		_expect(int(view.get("damage_count", -1)) == 2 \
				and int(view.get("repair_count", -1)) == 2,
			"%s LOD exposes reconciled consequence counts" % mode)
		_expect(bool(StructureManager.validate_lod_view(view).get("ok", false)),
			"%s LOD validates against canonical owner state" % mode)
	var local := StructureManager.project_lod(instance_id, "local")
	_expect(local.has("blueprint_id") and local.has("evidence_refs"),
		"local LOD retains detailed blueprint and evidence projection")
	_expect(not StructureManager.project_lod(
		instance_id, "dormant").has("position"),
		"dormant LOD omits local physical detail")
	var tampered_lod := local.duplicate(true)
	tampered_lod["condition"] = 0.5
	_expect(StructureManager.validate_lod_view(tampered_lod).get(
		"error") == "lod_state_mismatch",
		"LOD drift is detected against owner truth")
	_expect(StructureManager.project_lod(instance_id, "invalid").is_empty(),
		"unknown LOD mode cannot create a projection")


func _test_persistence() -> void:
	var structure_state := StructureManager.serialize_state()
	var kernel_state := ProductionKernel.serialize_state()
	var json_state: Variant = JSON.parse_string(JSON.stringify(structure_state))
	var expected_ids := StructureManager.structure_ids()
	var expected_hash := str(StructureManager.get_structure(
		"building_instance.probe.structure.cottage").get("state_hash", ""))
	ProductionKernel.reset_for_verification()
	StructureManager.reset()
	_expect(ProductionKernel.restore_state(kernel_state),
		"shared evidence restores before owner state")
	_expect(StructureManager.restore_state(
		json_state, 424242, "world.structure.probe"),
		"StructureInstance state survives JSON save round-trip")
	_expect(StructureManager.structure_ids() == expected_ids \
			and str(StructureManager.get_structure(
				"building_instance.probe.structure.cottage").get(
					"state_hash", "")) == expected_hash,
		"save round-trip preserves identity and canonical state hash")
	var before := StructureManager.serialize_state()
	_expect(not StructureManager.restore_state(
		json_state, 7, "world.structure.probe") \
			and StructureManager.serialize_state() == before,
		"wrong-seed state is rejected without mutating owner state")
	_expect(not StructureManager.restore_state(
		json_state, 424242, "world.other") \
			and StructureManager.serialize_state() == before,
		"wrong-world state is rejected without mutating owner state")
	var tampered: Dictionary = json_state.duplicate(true)
	tampered["structures"][0]["condition"] = 0.5
	_expect(not StructureManager.restore_state(
		tampered, 424242, "world.structure.probe") \
			and StructureManager.serialize_state() == before,
		"tampered state hash is rejected atomically")
	var duplicate_record: Dictionary = json_state.duplicate(true)
	duplicate_record["structures"].append(
		duplicate_record["structures"][0].duplicate(true))
	_expect(not StructureManager.restore_state(
		duplicate_record, 424242, "world.structure.probe") \
			and StructureManager.serialize_state() == before,
		"duplicate structure identity is rejected atomically")


func _test_generated_and_migration_handoffs() -> void:
	var generated := StructureManager.register_seeded_structure({
		"world_seed": 424242,
		"settlement_id": "settlement.probe.structure",
		"owner_id": "settlement.probe.structure",
		"anchor_id": "warehouse",
		"definition_id": "building.storage.village_warehouse",
		"position": [3, 9],
		"generation_evidence": "world.manifest.probe",
	})
	var generated_id := StructureManager.seeded_structure_instance_id(
		"settlement.probe.structure", "warehouse")
	_expect(bool(generated.get("ok", false)) \
			and StructureManager.find_structure_for_anchor(
				"settlement.probe.structure", "warehouse") == generated_id,
		"world assembly hands generated warehouse to structure owner")
	_expect(str(StructureManager.get_structure(generated_id).get(
		"source_kind", "")) == "worldgen",
		"generated structure retains worldgen provenance")
	_expect(bool(StructureManager.register_seeded_structure({
		"world_seed": 424242,
		"settlement_id": "settlement.probe.structure",
		"owner_id": "settlement.probe.structure",
		"anchor_id": "warehouse",
		"definition_id": "building.storage.village_warehouse",
		"position": [3, 9],
	}).get("duplicate", false)),
		"generated structure handoff is idempotent")
	_expect(StructureManager.register_seeded_structure({
		"world_seed": 424242,
		"settlement_id": "settlement.probe.structure",
		"owner_id": "settlement.probe.structure",
		"anchor_id": "warehouse",
		"definition_id": "building.storage.small_storehouse",
		"position": [3, 9],
	}).get("error") == "structure_identity_conflict",
		"worldgen cannot replace an owned structure definition")

	var legacy_id := "building_instance.probe.legacy.storehouse"
	var adopted := StructureManager.adopt_legacy_building({
		"instance_id": legacy_id,
		"definition_id": "building.storage.small_storehouse",
		"blueprint_id": "",
		"owner_id": "settlement.probe.structure",
		"position": [8, 4],
		"condition": 0.6,
	}, {
		"world_seed": 424242,
		"settlement_id": "settlement.probe.structure",
		"migration_id": "probe.legacy",
	})
	_expect(bool(adopted.get("ok", false)) \
			and is_equal_approx(float(StructureManager.get_structure(
				legacy_id).get("condition", 0.0)), 0.6),
		"legacy compatibility building migrates without losing condition")
	var view := StructureManager.compatibility_building_view(legacy_id, {
		"staffing": 0.75,
	})
	_expect(str(view.get("authoritative_record_type", "")) \
			== "StructureInstance" \
			and is_equal_approx(float(view.get("staffing", 0.0)), 0.75) \
			and is_equal_approx(float(view.get("condition", 0.0)), 0.6),
		"compatibility view preserves service fields while projecting owner truth")


func _test_hamlet_and_combat_integration() -> void:
	ProductionKernel.reset_for_verification()
	StructureManager.reset()
	StructureManager.initialize(7331, "world.structure.integration")
	var anchors := {
		"hamlet": Vector2i(0, 0),
		"warehouse": Vector2i(6, 0),
		"watchtower_site": Vector2i(10, 0),
		"goblin_camp": Vector2i(120, 0),
	}
	HamletState.initialized = false
	HamletState.initialize(7331, anchors)
	var warehouse_id := StructureManager.find_structure_for_anchor(
		HamletState.active_village_id, "warehouse")
	_expect(not warehouse_id.is_empty() \
			and StructureManager.has_structure(warehouse_id),
		"settlement bootstrap owns seeded warehouse before combat starts")

	HamletState.project["complete"] = true
	HamletState.project["stage"] = "complete"
	HamletState.project["stage_progress"] = 1.0
	HamletState._activate_project_building()
	var watchtower_id := StructureManager.structure_instance_id_for_project(
		str(HamletState.project.get("instance_id", "")))
	_expect(StructureManager.has_structure(watchtower_id) \
			and HamletState.runtime_buildings.has(watchtower_id),
		"Hamlet construction activation hands completion to owner")
	var compatibility: Dictionary = HamletState.runtime_buildings[watchtower_id]
	_expect(str(compatibility.get("authoritative_record_type", "")) \
			== "StructureInstance" \
			and str(compatibility.get("authoritative_state_hash", "")) \
			== str(StructureManager.get_structure(watchtower_id).get(
				"state_hash", "")),
		"settlement building record is an explicit compatibility projection")
	var damage := HamletState.apply_building_damage(
		watchtower_id, 0.25, "probe.weather")
	var repair := HamletState.repair_building(watchtower_id, 0.25)
	_expect(is_equal_approx(float(damage.get("condition", 0.0)), 0.75) \
			and is_equal_approx(float(repair.get("condition", 0.0)), 1.0) \
			and is_equal_approx(float(StructureManager.get_structure(
				watchtower_id).get("condition", 0.0)), 1.0),
		"settlement damage and repair mutate canonical condition")
	var hamlet_saved := HamletState.serialize_state()
	HamletState.runtime_buildings.clear()
	_expect(HamletState.restore_state(hamlet_saved, 7331) \
			and HamletState.runtime_buildings.has(watchtower_id) \
			and str(HamletState.runtime_buildings[watchtower_id].get(
				"authoritative_state_hash", "")) \
			== str(StructureManager.get_structure(watchtower_id).get(
				"state_hash", "")),
		"Hamlet restore reprojects rather than replacing structure truth")

	CombatState.initialized = false
	CombatState.initialize(7331, anchors)
	CombatState._build_damage_plan(1)
	_expect(CombatState.damage_records.size() == 1 \
			and str(CombatState.damage_records[0].get(
				"structure_instance_id", "")) == warehouse_id,
		"raid plan targets an existing owned StructureInstance")
	var block_id := BlockRegistry.get_id_by_stable_id("terrain.stone.basic")
	_expect(block_id > 0, "combat boundary fixture resolves a physical Block")
	var world := DamageWorld.new(block_id)
	var invalid: Dictionary = CombatState.damage_records[0].duplicate(true)
	invalid["structure_instance_id"] = "structure_instance.missing"
	CombatState.damage_records = [invalid]
	var structure_count := StructureManager.structure_count()
	CombatState.materialize_damage(world)
	_expect(world.writes == 0 and world.block_id == block_id \
			and StructureManager.structure_count() == structure_count,
		"combat cannot edit voxels or invent truth for unknown structure")

	var valid := invalid.duplicate(true)
	valid["structure_instance_id"] = warehouse_id
	CombatState.damage_records = [valid]
	CombatState.materialize_damage(world)
	var materialized: Dictionary = CombatState.damage_records[0]
	_expect(world.writes == 1 and BlockRegistry.is_air(world.block_id) \
			and not (materialized.get("position", []) as Array).is_empty(),
		"accepted combat consequence materialises its voxel edit")
	_expect(is_equal_approx(float(StructureManager.get_structure(
		warehouse_id).get("condition", 0.0)), 0.9) \
			and not str(materialized.get(
				"structure_evidence_id", "")).is_empty(),
		"combat damage commits condition and evidence through owner")

	Inventory.reset()
	var beam_ref := {
		"kind": "block",
		"stable_id": "construction.beam.oak",
		"count": 1,
	}
	var leftover := Inventory.add_stack(Inventory.make_stack_from_ref(beam_ref))
	_expect(leftover.is_empty() and Inventory.count_ref(beam_ref) == 1,
		"repair fixture reserves its Oak Beam")
	var repaired := CombatState.repair_next_damage(world)
	_expect(bool(repaired.get("ok", false)) \
			and world.writes == 2 and world.block_id == block_id \
			and Inventory.count_ref(beam_ref) == 0,
		"combat repair atomically restores voxel and consumes material")
	_expect(is_equal_approx(float(StructureManager.get_structure(
		warehouse_id).get("condition", 0.0)), 1.0) \
			and bool(CombatState.damage_records[0].get("repaired", false)) \
			and not str(CombatState.damage_records[0].get(
				"structure_repair_evidence_id", "")).is_empty(),
		"combat repair commits canonical owner evidence exactly once")


func _expect(condition: bool, message: String) -> void:
	checks += 1
	if not condition:
		failures.append(message)
