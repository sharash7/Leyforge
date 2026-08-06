@tool
class_name ForgeDiagnostic
extends RefCounted

const INFO := "info"
const WARNING := "warning"
const ERROR := "error"
const CRITICAL := "critical"
const BLOCKER := "blocker"
const CRITICAL_RELEASE_BLOCKER := "critical_release_blocker"

var code := ""
var severity := INFO
var asset_id := ""
var source_field := ""
var source_layer := ""
var message := ""
var consequence := ""
var suggested_fix := ""
var auto_fix_available := false
var related_ids: PackedStringArray = []


static func create(
		p_code: String, p_severity: String, p_asset_id: String,
		p_message: String, p_consequence := "", p_suggested_fix := "",
		p_source_field := "") -> ForgeDiagnostic:
	var value := ForgeDiagnostic.new()
	value.code = p_code
	value.severity = p_severity
	value.asset_id = p_asset_id
	value.message = p_message
	value.consequence = p_consequence
	value.suggested_fix = p_suggested_fix
	value.source_field = p_source_field
	return value


func to_record() -> Dictionary:
	return {
		"code": code,
		"severity": severity,
		"asset_id": asset_id,
		"source_field": source_field,
		"source_layer": source_layer,
		"message": message,
		"consequence": consequence,
		"suggested_fix": suggested_fix,
		"auto_fix_available": auto_fix_available,
		"related_ids": Array(related_ids),
	}
