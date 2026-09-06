extends Node

const ProofRunner = preload("res://src/proof_runner.gd")

func _ready() -> void:
    var build_manifest := _load_build_manifest()
    if build_manifest.is_empty():
        print("LEYFORGE_RESULT " + JSON.stringify({"outcome": "FAIL", "error": "missing build manifest"}))
        get_tree().quit(2)
        return
    var arguments := _parse_arguments(OS.get_cmdline_user_args())
    var mode := str(arguments.get("mode", "smoke"))
    var runner = ProofRunner.new()
    if mode == "smoke":
        var self_report: Dictionary = runner.smoke(str(build_manifest["role"]), str(build_manifest["build_identity"]))
        print("LEYFORGE_SELF_REPORT " + JSON.stringify(self_report))
        get_tree().quit(0 if self_report.get("status") == "PASS" else 3)
        return
    if mode == "proof":
        var proof_id := str(arguments.get("proof-id", ""))
        var run_id := str(arguments.get("run-id", ""))
        var observed: Dictionary = runner.run(proof_id, run_id, str(build_manifest["role"]), str(build_manifest["build_identity"]))
        print("LEYFORGE_RESULT " + JSON.stringify(observed))
        get_tree().quit(0 if observed.get("outcome") in ["PASS", "INCONCLUSIVE"] else 4)
        return
    print("LEYFORGE_RESULT " + JSON.stringify({"outcome": "FAIL", "error": "unsupported mode", "mode": mode}))
    get_tree().quit(2)

func _load_build_manifest() -> Dictionary:
    var file := FileAccess.open("res://build_manifest.json", FileAccess.READ)
    if file == null:
        return {}
    var parsed = JSON.parse_string(file.get_as_text())
    return parsed if parsed is Dictionary else {}

func _parse_arguments(values: PackedStringArray) -> Dictionary:
    var result: Dictionary = {}
    var index := 0
    while index < values.size():
        var key := values[index].trim_prefix("--")
        if index + 1 < values.size() and values[index + 1].begins_with("--") == false:
            result[key] = values[index + 1]
            index += 2
        else:
            result[key] = true
            index += 1
    return result
