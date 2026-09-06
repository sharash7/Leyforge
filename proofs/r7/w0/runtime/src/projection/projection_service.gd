extends RefCounted

var _bindings: Dictionary = {}
var _next_handle: int = 1000

func rebuild(canonical_object: Dictionary, runtime_id: int, pending_derived_work: bool = false) -> Dictionary:
    var semantic_id := str(canonical_object["semantic_id"])
    _next_handle += 1
    var projection := {
        "semantic_id": semantic_id,
        "object_class": canonical_object["object_class"],
        "canonical_revision": int(canonical_object["revision"]),
        "runtime_id": runtime_id,
        "runtime_handle": _next_handle,
        "pending_derived_work": pending_derived_work,
    }
    _bindings[semantic_id] = projection
    return projection

func destroy(semantic_id: String) -> void:
    _bindings.erase(semantic_id)

func get_binding(semantic_id: String) -> Dictionary:
    return _bindings.get(semantic_id, {})

func binding_count(semantic_id: String) -> int:
    return 1 if _bindings.has(semantic_id) else 0

func total_bindings() -> int:
    return _bindings.size()
