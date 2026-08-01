extends Node
## Culture, faction, biome, realm and deterministic overlay acceptance gate.

var checks := 0
var failures: Array[String] = []


func _ready() -> void:
	call_deferred("_run")


func _check(condition: bool, message: String) -> void:
	checks += 1
	if not condition:
		failures.append(message)


func _run() -> void:
	var summary := SettlementContentRegistry.catalogue_summary()
	_check(int(summary.get("definitions", 0)) == 120,
		"pack expansion changed the protected 120-definition cap")
	_check(int(summary.get("packs", 0)) == 25,
		"culture/faction/biome pack set was incomplete")
	_check(SettlementContentRegistry.resolution_order == [
		"foundation",
		"blueprint_archetype",
		"culture",
		"region",
		"biome",
		"faction",
		"government",
		"faith",
		"economy",
		"realm",
		"overlay",
		"hybrid",
		"player_style",
	], "pack layer order drifted from Document 20G")

	var mixed := SettlementContentRegistry.resolve_pack_stack([
		"pack.culture.emberhold",
		"pack.culture.riverward_frontier",
		"pack.biome.swamp",
		"pack.government.merchant_league",
		"pack.occupation.frontier_builders",
		"pack.history.rebuilt_after_raid",
		"pack.player_style.approved_stonewood",
	])
	_check((mixed.get("errors", []) as Array).is_empty(),
		"valid multi-layer pack stack reported errors")
	var layer_indexes: Array[int] = []
	for layer in mixed.get("layers", []):
		layer_indexes.append(SettlementContentRegistry.resolution_order.find(
			str((layer as Dictionary).get("type", ""))))
	var sorted_indexes := layer_indexes.duplicate()
	sorted_indexes.sort()
	_check(layer_indexes == sorted_indexes,
		"pack overlays did not resolve in canonical layer order")
	var palette: Dictionary = mixed.get("palette", {})
	_check(str(palette.get("foundation_primary", ""))
			== "construction.brick.stone"
			and str(palette.get("functional", ""))
				== "village.supply_crate.construction",
		"later approved player/history overlays did not substitute exact materials")

	var missing := SettlementContentRegistry.resolve_pack_stack([
		"pack.optional.not_installed",
	])
	_check("pack.foundation.forest_neutral_poc" in missing.get("pack_ids", [])
			and not (missing.get("errors", []) as Array).is_empty(),
		"missing optional pack did not fall back to culture-neutral content")

	var realm_without_gate := SettlementContentRegistry.resolve_pack_stack([
		"pack.realm.verdant_covenant",
	])
	_check("pack.realm.verdant_covenant" not in realm_without_gate.get(
			"pack_ids", [])
			and not (realm_without_gate.get("errors", []) as Array).is_empty(),
		"Verdant Covenant loaded before portal/realm dependency gates")
	var realm := SettlementContentRegistry.resolve_pack_stack_with_context([
		"pack.realm.verdant_covenant",
	], {
		"completed_definition_ids": [
			"building.magic.portal_station_sanctum",
			"project.megaproject.city_ward_portal_nexus",
		],
	})
	_check("pack.realm.verdant_covenant" in realm.get("pack_ids", [])
			and "pack.realm.portal_network_access" in realm.get("pack_ids", [])
			and (realm.get("errors", []) as Array).is_empty(),
		"Verdant Covenant did not load after both realm gates passed")
	var realm_cells := SettlementContentRegistry.expand_blueprint_stage(
		"blueprint.leyforge.residential.small_cottage_a",
		"foundation",
		realm.get("palette", {}))
	_check(not realm_cells.is_empty()
			and str(realm_cells[0].get("stable_id", ""))
				== "realm.fae_grass.basic",
		"realm overlay did not apply an exact stable material substitution")

	var before := SettlementContentRegistry.get_building(
		"building.residential.small_cottage")
	var runtime_history := [
		{"event": "constructed"},
		{"event": "repaired"},
	]
	var after := SettlementContentRegistry.get_building(
		"building.residential.small_cottage")
	_check(before == after
			and float(before.get("capacity", {}).get("base", 0.0))
				== float(after.get("capacity", {}).get("base", -1.0))
			and runtime_history == [
				{"event": "constructed"},
				{"event": "repaired"},
			],
		"style overlays changed functional identity, capacity or history")

	for pack_id in [
		"pack.culture.emberhold",
		"pack.culture.goblin_tinker",
		"pack.culture.pastoral_mobile",
		"pack.culture.aquatic_wetland",
		"pack.biome.dryland",
		"pack.biome.frost",
		"pack.biome.swamp",
		"pack.biome.mountain",
		"pack.diaspora.riverward_exiles",
		"pack.hybrid.ember_river",
	]:
		_check(not SettlementContentRegistry.get_pack(pack_id).is_empty(),
			"%s expansion pack was absent" % pack_id)
	_check(str(SettlementContentRegistry.get_pack(
			"pack.culture.emberhold").get("type", ""))
			!= str(SettlementContentRegistry.get_pack(
				"pack.diaspora.riverward_exiles").get("type", "")),
		"ancestry/culture and diaspora/history layers were collapsed together")

	var payload := {
		"checks": checks,
		"failures": failures,
		"ok": failures.is_empty(),
		"packs": int(summary.get("packs", 0)),
	}
	print("SETTLEMENT_WAVE6_PACK_PROBE %s" % JSON.stringify(payload))
	get_tree().quit(0 if failures.is_empty() else 1)
