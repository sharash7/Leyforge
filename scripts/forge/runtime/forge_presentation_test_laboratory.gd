class_name ForgePresentationTestLaboratory
extends RefCounted
## Shared capture/replay, A/B, accessibility and stress scenario laboratory.

var diagnostics: Array[Dictionary] = []
var _scenarios: Dictionary = {}
var _aliases: Dictionary = {}
var _captures: Dictionary = {}


func load_and_validate(
		scenarios: Array[ForgePresentationTestScenario]) -> Dictionary:
	diagnostics.clear()
	_scenarios.clear()
	_aliases.clear()
	_captures.clear()
	var validator := ForgePresentationValidationService.new()
	for scenario in scenarios:
		if scenario == null or _scenarios.has(scenario.stable_id):
			diagnostics.append(_diagnostic(
				"TST-001", "critical", "", "Test scenario is empty or duplicated."))
			continue
		_scenarios[scenario.stable_id] = scenario
		for alias_id in scenario.aliases:
			if _aliases.has(alias_id):
				diagnostics.append(_diagnostic(
					"REG-001", "critical", alias_id,
					"Test scenario alias is duplicated."))
			else:
				_aliases[alias_id] = scenario.stable_id
		for diagnostic in validator.validate(scenario):
			diagnostics.append(diagnostic.to_record())
	return {"ok": diagnostics.is_empty(),
		"scenario_count": _scenarios.size(), "alias_count": _aliases.size(),
		"diagnostics": diagnostics.duplicate(true)}


func capture(
		scenario_id: String, registry_generation_id: String,
		deterministic_seed := 23006,
		options: Dictionary = {}) -> Dictionary:
	var canonical := ForgeId.canonical_id(scenario_id, _aliases)
	var scenario := _scenarios.get(canonical) as ForgePresentationTestScenario
	if scenario == null:
		return _failure("TST-001", canonical, "Presentation test scenario is unknown.")
	var recorder := ForgePresentationTraceRecorder.new()
	recorder.start(registry_generation_id, int(options.get("start_time_msec", 0)))
	var action_index := 0
	for action in scenario.action_records:
		var event_record := {"contract_id": str(action.get("contract_id", "")),
			"owner_id": str(action.get("owner_id", "test.laboratory")),
			"owner_instance_id": "test:%s" % canonical,
			"payload": action.duplicate(true),
			"timestamp_msec": action_index * 100,
			"sequence_id": "%s:%04d" % [canonical, action_index],
			"deterministic_seed": deterministic_seed + action_index,
			"authority_state": "authoritative"}
		event_record["event_hash"] = ForgeStableRecord.hash_record(event_record)
		var context := {"schema_id": "context.schema.test.laboratory",
			"contract_id": event_record.contract_id,
			"fields": {"scenario_id": canonical,
				"quality": str(options.get("quality", "full")),
				"accessibility": str(options.get("accessibility", "default"))}}
		context["context_hash"] = ForgeStableRecord.hash_record(context)
		var resolution := {"ok": true, "commands": [{
			"verb": str(action.get("action", "observe")),
			"ownership_key": "%s:%04d" % [canonical, action_index]}]}
		resolution["resolution_hash"] = ForgeStableRecord.hash_record(resolution)
		recorder.record_event(event_record, context, resolution)
		action_index += 1
	var trace := recorder.capture()
	var capture_id := "capture.presentation.%s.%s" % [
		ForgeId.safe_filename(canonical), trace.trace_hash.substr(0, 16)]
	_captures[capture_id] = trace
	return {"ok": true, "capture_id": capture_id,
		"scenario_id": canonical, "trace": trace,
		"manual_review_status": scenario.manual_review_status}


func replay(capture_id: String) -> Dictionary:
	if not _captures.has(capture_id):
		return _failure("TST-001", capture_id, "Presentation capture is unknown.")
	var trace: Dictionary = _captures[capture_id]
	var recorder := ForgePresentationTraceRecorder.new()
	if not recorder.validate_trace(trace):
		return _failure("TST-001", capture_id, "Presentation capture hash is invalid.")
	var records: Array[Dictionary] = []
	for index in trace.get("events", []).size():
		var event: Dictionary = trace.events[index]
		var context: Dictionary = trace.context_packets[index]
		var resolution: Dictionary = trace.resolver_results[index]
		records.append({"event_hash": event.event_hash,
			"context_hash": context.context_hash,
			"resolution_hash": resolution.resolution_hash,
			"commands": resolution.commands.duplicate(true)})
	var result := {"ok": true, "capture_id": capture_id,
		"records": records, "source_trace_hash": trace.trace_hash}
	result["replay_hash"] = ForgeStableRecord.hash_record(result)
	return result


func compare(
		left_capture_id: String, right_capture_id: String) -> Dictionary:
	if not _captures.has(left_capture_id) or not _captures.has(right_capture_id):
		return _failure("TST-001", "capture.compare",
			"Both presentation captures are required for comparison.")
	var left: Dictionary = _captures[left_capture_id]
	var right: Dictionary = _captures[right_capture_id]
	var result := {"ok": true, "left_capture_id": left_capture_id,
		"right_capture_id": right_capture_id,
		"same_trace": left.trace_hash == right.trace_hash,
		"left_trace_hash": left.trace_hash,
		"right_trace_hash": right.trace_hash,
		"manual_approval_required": true}
	result["comparison_hash"] = ForgeStableRecord.hash_record(result)
	return result


func accessibility_matrix(scenario_id: String) -> Dictionary:
	var canonical := ForgeId.canonical_id(scenario_id, _aliases)
	var scenario := _scenarios.get(canonical) as ForgePresentationTestScenario
	if scenario == null:
		return _failure("TST-001", canonical, "Presentation test scenario is unknown.")
	var cells: Array[Dictionary] = []
	for quality in scenario.quality_tiers:
		for accessibility in scenario.accessibility_modes:
			cells.append({"quality": quality, "accessibility": accessibility,
				"manual_review_status": "open"})
	return {"ok": true, "scenario_id": canonical, "cells": cells,
		"cell_count": cells.size()}


func resolve(scenario_id: String) -> Dictionary:
	var canonical := ForgeId.canonical_id(scenario_id, _aliases)
	var scenario := _scenarios.get(canonical) as ForgePresentationTestScenario
	return scenario.to_record() if scenario != null else {}


func has(scenario_id: String) -> bool:
	return not resolve(scenario_id).is_empty()


func filtered_list() -> Array[Dictionary]:
	var result: Array[Dictionary] = []
	for scenario in _scenarios.values():
		result.append((scenario as ForgePresentationTestScenario).to_record())
	result.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		return str(a.stable_id) < str(b.stable_id))
	return result


func _failure(code: String, target_id: String, message: String) -> Dictionary:
	return {"ok": false, "diagnostics": [_diagnostic(
		code, "error", target_id, message)]}


func _diagnostic(code: String, severity: String, target_id: String,
		message: String) -> Dictionary:
	return {"code": code, "severity": severity,
		"target_id": target_id, "message": message}
