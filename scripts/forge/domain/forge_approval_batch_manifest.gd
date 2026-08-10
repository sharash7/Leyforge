@tool
class_name ForgeApprovalBatchManifest
extends Resource
## Human review boundary. Automated tools may prepare but never approve a batch.

@export var schema_version := 1
@export var batch_id := ""
@export var display_name := ""
@export var studio := ""
@export var category := ""
@export var target_ids: PackedStringArray = []
@export var evidence_paths: PackedStringArray = []
@export var status := "review_ready"
@export var reviewer := ""
@export var reviewed_at := ""
@export var notes := ""

func to_record() -> Dictionary:
	return {"schema": "leyforge.forge.approval-batch-manifest", "schema_version": schema_version,
		"batch_id": batch_id, "display_name": display_name, "studio": studio,
		"category": category, "target_ids": Array(target_ids),
		"evidence_paths": Array(evidence_paths), "status": status,
		"reviewer": reviewer, "reviewed_at": reviewed_at, "notes": notes}
