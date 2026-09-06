extends RefCounted

var _buffer: Object
var _available: bool = false

func _init() -> void:
    _available = ClassDB.class_exists("VoxelBuffer")
    if _available:
        _buffer = ClassDB.instantiate("VoxelBuffer")
        _available = _buffer != null

func execute(semantic_id: String, canonical_value: int, runtime_id: int, mode: String = "normal") -> Dictionary:
    if not _available or mode == "not-ready":
        return {"classification": "NOT-READY", "semantic_id": semantic_id}
    if mode == "failure":
        return {"classification": "PROVIDER-ERROR", "semantic_id": semantic_id}
    _buffer.call("clear")
    _buffer.call("create", 4, 4, 4)
    _buffer.call("set_voxel", runtime_id, 1, 1, 1, 0)
    var observed_runtime_id := int(_buffer.call("get_voxel", 1, 1, 1, 0))
    return {
        "classification": "DELAYED-SUCCESS" if mode == "delayed" else "SUCCESS",
        "semantic_id": semantic_id,
        "canonical_value": canonical_value if observed_runtime_id == runtime_id else -1,
        "provider_local_id": observed_runtime_id,
        "buffer_size": _buffer.call("get_size"),
    }

func provider_identity() -> Dictionary:
    return {
        "lane": "zylann-voxel-tools-gdextension",
        "edition": "v1.7x",
        "class": "VoxelBuffer",
        "ready": _available,
    }
