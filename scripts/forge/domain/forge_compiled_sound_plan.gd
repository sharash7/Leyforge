@tool
class_name ForgeCompiledSoundPlan
extends Resource
## Compact deterministic Sound Event plan; source media remains external.

const CONTRACT_VERSION := "23-audio-runtime-v1"

@export var schema_version := 1
@export var plan_id := ""
@export var source_event_id := ""
@export var source_hash := ""
@export var source_ids: PackedStringArray = []
@export var layer_records: Array[Dictionary] = []
@export var variation_policy := "seeded_round_robin"
@export var loop_policy := "one_shot"
@export var concurrency_group := ""
@export var maximum_voices := 1
@export var spatial_audio_profile_id := ""
@export var bus_id := "audio.bus.sfx"
@export var caption_key := ""
@export var critical_cue := false
@export var fallback_ids: PackedStringArray = []
@export var contract_version := CONTRACT_VERSION
@export var product_hash := ""


func to_record(include_hash := true) -> Dictionary:
	var record := {
		"schema": "leyforge.forge.compiled-sound-plan",
		"schema_version": schema_version,
		"plan_id": plan_id,
		"source_event_id": source_event_id,
		"source_hash": source_hash,
		"source_ids": Array(source_ids),
		"layer_records": layer_records.duplicate(true),
		"variation_policy": variation_policy,
		"loop_policy": loop_policy,
		"concurrency_group": concurrency_group,
		"maximum_voices": maximum_voices,
		"spatial_audio_profile_id": spatial_audio_profile_id,
		"bus_id": bus_id,
		"caption_key": caption_key,
		"critical_cue": critical_cue,
		"fallback_ids": Array(fallback_ids),
		"contract_version": contract_version,
	}
	if include_hash:
		record["product_hash"] = product_hash
	return record


func seal() -> String:
	product_hash = ForgeStableRecord.hash_record(to_record(false))
	return product_hash


func canonical_hash() -> String:
	return ForgeStableRecord.hash_record(to_record())
