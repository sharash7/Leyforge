extends Node

const PROOF_IDS := [
	"PRD04-PROOF-49", "PRD04-PROOF-50", "PRD04-PROOF-51", "PRD04-PROOF-52",
	"PRD04-PROOF-53", "PRD04-PROOF-54", "PRD04-PROOF-55", "PRD04-PROOF-56",
	"PRD04-PROOF-57", "PRD04-PROOF-58", "PRD04-PROOF-59", "PRD04-PROOF-60",
	"PRD04-PROOF-61", "PRD04-PROOF-62", "PRD04-PROOF-71"
]

func _ready() -> void:
	var args := OS.get_cmdline_user_args()
	var readiness_mode := args.has("--readiness-self-report")
	var report := {
		"schema_version": "prd07-w4-fixture-08-readiness-self-report-v1",
		"status": "PASS" if readiness_mode else "REFUSED",
		"fixture_id": "FIXTURE-08",
		"fixture_revision": "W4-R1",
		"stable_proof_ids": PROOF_IDS,
		"presentation_case_count": 7,
		"configuration_case_count": 9,
		"map_modes": ["field", "surveyed", "magical-relief", "flat", "non-drag", "list"],
		"authorised_knowledge_separate_from_live_truth": true,
		"proof_execution_started": false,
		"identity_allocation_started": false,
		"production_runtime": false,
		"gameplay_permission": "CLOSED"
	}
	print("LEYFORGE_W4_READINESS_SELF_REPORT " + JSON.stringify(report))
	get_tree().quit(0 if readiness_mode else 2)
