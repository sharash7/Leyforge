extends Node

const ProviderProbe = preload("res://src/provider_probe.gd")

func _ready() -> void:
    var build_manifest := _load_build_manifest()
    if build_manifest.is_empty():
        print("LEYFORGE_W1_PROVIDER_REPORT " + JSON.stringify({"outcome": "FAIL", "error": "missing build manifest"}))
        get_tree().quit(2)
        return
    var arguments := _parse_arguments(OS.get_cmdline_user_args())
    var mode := str(arguments.get("mode", "smoke"))
    var probe = ProviderProbe.new()
    if mode == "smoke":
        var report: Dictionary = probe.smoke(str(build_manifest["role"]), str(build_manifest["build_identity"]))
        print("LEYFORGE_W1_SELF_REPORT " + JSON.stringify(report))
        get_tree().quit(0 if report.get("status") == "PASS" else 3)
        return
    if mode == "provider":
        var report: Dictionary = probe.run(
            str(arguments.get("proof-id", "")),
            str(arguments.get("run-id", "")),
            str(build_manifest["role"]),
            str(build_manifest["build_identity"]),
            int(arguments.get("iterations", "256"))
        )
        print("LEYFORGE_W1_PROVIDER_REPORT " + JSON.stringify(report))
        get_tree().quit(0 if report.get("outcome") == "PASS" else 4)
        return
    print("LEYFORGE_W1_PROVIDER_REPORT " + JSON.stringify({"outcome": "FAIL", "error": "unsupported mode", "mode": mode}))
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
