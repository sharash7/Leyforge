class_name ForgePresentationTraceRecorder
extends RefCounted
## Compact deterministic contract/context/resolution capture for replay.

const TRACE_VERSION := 1

var registry_snapshot_id := ""
var start_time_msec := 0
var events: Array[Dictionary] = []
var state_samples: Array[Dictionary] = []
var context_packets: Array[Dictionary] = []
var resolver_results: Array[Dictionary] = []
var lifecycle_actions: Array[Dictionary] = []
var diagnostics: Array[Dictionary] = []


func start(p_registry_snapshot_id: String, p_start_time_msec := 0) -> void:
	registry_snapshot_id = p_registry_snapshot_id
	start_time_msec = p_start_time_msec
	events.clear()
	state_samples.clear()
	context_packets.clear()
	resolver_results.clear()
	lifecycle_actions.clear()
	diagnostics.clear()


func record_event(
		event_record: Dictionary, context_packet: Dictionary,
		resolution: Dictionary) -> void:
	events.append(event_record.duplicate(true))
	context_packets.append(context_packet.duplicate(true))
	resolver_results.append(resolution.duplicate(true))
	for command in resolution.get("commands", []):
		lifecycle_actions.append(command.duplicate(true))


func record_state(state_record: Dictionary, resolution: Dictionary) -> void:
	state_samples.append(state_record.duplicate(true))
	resolver_results.append(resolution.duplicate(true))
	for command in resolution.get("commands", []):
		lifecycle_actions.append(command.duplicate(true))


func record_diagnostic(diagnostic: Dictionary) -> void:
	diagnostics.append(diagnostic.duplicate(true))


func capture() -> Dictionary:
	var result := {
		"schema": "leyforge.forge.presentation-trace",
		"trace_version": TRACE_VERSION,
		"registry_snapshot_id": registry_snapshot_id,
		"start_time_msec": start_time_msec,
		"events": events.duplicate(true),
		"state_samples": state_samples.duplicate(true),
		"context_packets": context_packets.duplicate(true),
		"resolver_results": resolver_results.duplicate(true),
		"lifecycle_actions": lifecycle_actions.duplicate(true),
		"diagnostics": diagnostics.duplicate(true),
	}
	result["trace_hash"] = ForgeStableRecord.hash_record(result)
	return result


func validate_trace(trace: Dictionary) -> bool:
	if int(trace.get("trace_version", 0)) != TRACE_VERSION:
		return false
	var expected := str(trace.get("trace_hash", ""))
	var source := trace.duplicate(true)
	source.erase("trace_hash")
	return expected.length() == 64 \
		and ForgeStableRecord.hash_record(source) == expected
