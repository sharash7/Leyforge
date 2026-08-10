class_name WorldManifest
extends RefCounted
## Persistent seed-derived identity for Document 24 worlds.
## Runtime deltas never belong here; the manifest explains the immutable base.

const SCHEMA := "leyforge.world.manifest"
const VERSION := 1
const OVERWORLD_ID := "realm.overworld"


static func create(world_id: String, resolved_seed: int, seed_original: String,
		seed_kind: String, generation: Dictionary,
		enabled_content_packs: Array, registry_generation_hash: String,
		legacy_import := false) -> Dictionary:
	var profile_id := str(generation.get("profile_id", ""))
	var worldgen_version := int(generation.get("worldgen_version", 0))
	var plan_version := int(generation.get(
		"version", generation.get("plan_version", 0)))
	var realm_seed := _derive_seed(resolved_seed, OVERWORLD_ID)
	var region_id := "region.overworld.starter.%08x" % _derive_seed(
		resolved_seed, "%s:v%d" % [profile_id, plan_version])
	var packs: Array[String] = []
	for pack_value in enabled_content_packs:
		var pack_id := str(pack_value)
		if not pack_id.is_empty() and pack_id not in packs:
			packs.append(pack_id)
	packs.sort()
	var manifest := {
		"schema": SCHEMA,
		"schema_version": VERSION,
		"world_id": world_id,
		"resolved_seed": resolved_seed,
		"seed_original": seed_original,
		"seed_kind": seed_kind,
		"legacy_import": legacy_import,
		"generation": {
			"worldgen_version": worldgen_version,
			"plan_version": plan_version,
			"profile_id": profile_id,
			"plan_id": str(generation.get("plan_id", "")),
			"algorithm_id": str(generation.get("algorithm_id", "")),
			"starter_mode": str(generation.get("starter_mode", "")),
			"site_plan_hash": str(generation.get("site_plan_hash", "")),
			"placement_rule_hash": str(generation.get(
				"placement_rule_hash", "")),
			"regional_config_id": str(generation.get(
				"config_id", generation.get("regional_config_id", ""))),
		},
		"content_lock": {
			"enabled_pack_ids": packs,
			"registry_generation_hash": registry_generation_hash,
		},
		"realms": [{
			"realm_id": OVERWORLD_ID,
			"realm_seed": realm_seed,
			"regions": [{
				"region_id": region_id,
				"region_seed": _derive_seed(realm_seed, region_id),
				"role": "starter_region",
				"source_plan_id": str(generation.get("plan_id", "")),
			}],
		}],
		"migration_history": [],
		"repair_history": [],
	}
	manifest["manifest_hash"] = canonical_hash(manifest)
	return manifest


static func validate(manifest: Dictionary) -> Dictionary:
	var failures: Array[String] = []
	if manifest.get("schema") != SCHEMA \
			or int(manifest.get("schema_version", 0)) != VERSION:
		failures.append("unsupported_manifest_schema")
	if str(manifest.get("world_id", "")).is_empty():
		failures.append("missing_world_id")
	var generation: Dictionary = manifest.get("generation", {})
	if int(generation.get("worldgen_version", 0)) <= 0 \
			or int(generation.get("plan_version", 0)) <= 0:
		failures.append("invalid_generation_version")
	var profile_id := str(generation.get("profile_id", ""))
	if profile_id.is_empty():
		failures.append("missing_profile_id")
	if not bool(manifest.get("legacy_import", false)) \
			and "controlled_poc" in profile_id:
		failures.append("production_manifest_uses_archived_profile")
	var required_generation_fields: Array[String] = ["plan_id"]
	if not bool(manifest.get("legacy_import", false)):
		required_generation_fields.append_array([
			"site_plan_hash", "placement_rule_hash"])
	for field in required_generation_fields:
		if str(generation.get(field, "")).is_empty():
			failures.append("missing_generation_field:%s" % field)
	var content_lock: Dictionary = manifest.get("content_lock", {})
	if (content_lock.get("enabled_pack_ids", []) as Array).is_empty():
		failures.append("missing_enabled_content_packs")
	if str(content_lock.get("registry_generation_hash", "")).length() != 64:
		failures.append("invalid_registry_generation_hash")
	var realm_ids := {}
	var region_ids := {}
	for realm_value in manifest.get("realms", []):
		var realm: Dictionary = realm_value
		var realm_id := str(realm.get("realm_id", ""))
		if realm_id.is_empty() or realm_ids.has(realm_id):
			failures.append("invalid_or_duplicate_realm_id:%s" % realm_id)
		realm_ids[realm_id] = true
		for region_value in realm.get("regions", []):
			var region: Dictionary = region_value
			var region_id := str(region.get("region_id", ""))
			if region_id.is_empty() or region_ids.has(region_id):
				failures.append("invalid_or_duplicate_region_id:%s" % region_id)
			region_ids[region_id] = true
	if realm_ids.is_empty() or region_ids.is_empty():
		failures.append("world_topology_is_empty")
	if str(manifest.get("manifest_hash", "")) != canonical_hash(manifest):
		failures.append("manifest_hash_mismatch")
	return {"ok": failures.is_empty(), "failures": failures,
		"realm_count": realm_ids.size(), "region_count": region_ids.size()}


static func repair(source: Dictionary, expected: Dictionary) -> Dictionary:
	if str(source.get("world_id", expected.get("world_id", ""))) \
			!= str(expected.get("world_id", "")):
		return {"ok": false, "error": "world_identity_mismatch"}
	if int(source.get("resolved_seed", expected.get("resolved_seed", 0))) \
			!= int(expected.get("resolved_seed", 0)):
		return {"ok": false, "error": "world_seed_mismatch"}
	var source_report := validate(source) if not source.is_empty() \
		else {"ok": false}
	if bool(source_report.get("ok", false)):
		return {"ok": true, "repaired": false,
			"actions": [], "manifest": source.duplicate(true)}
	var repaired := expected.duplicate(true)
	var actions: Array[String] = ["reconstructed_derivable_world_manifest"]
	var migration_history: Variant = source.get("migration_history", [])
	if migration_history is Array:
		repaired["migration_history"] = migration_history.duplicate(true)
	repaired["repair_history"] = Array(source.get(
		"repair_history", [])).duplicate(true)
	repaired["repair_history"].append({
		"repair_id": "repair.world_manifest.canonical_reconstruction",
		"source_hash": str(source.get("manifest_hash", "missing")),
		"reason_codes": source_report.get(
			"failures", ["manifest_missing"]).duplicate(),
	})
	repaired["manifest_hash"] = canonical_hash(repaired)
	var repaired_report := validate(repaired)
	return {"ok": bool(repaired_report.get("ok", false)),
		"repaired": true, "actions": actions, "manifest": repaired,
		"failures": repaired_report.get("failures", [])}


static func canonical_hash(manifest: Dictionary) -> String:
	var payload := manifest.duplicate(true)
	payload.erase("manifest_hash")
	return ForgeStableRecord.hash_json_record(payload)


static func _derive_seed(parent_seed: int, scope_id: String) -> int:
	var digest := ("%d:%s" % [parent_seed, scope_id]).sha256_text()
	var value := digest.substr(0, 8).hex_to_int() & 0x7FFFFFFF
	return 1 if value == 0 else value
