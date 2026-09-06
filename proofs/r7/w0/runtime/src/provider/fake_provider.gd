extends RefCounted

var ready: bool = true
var fail_next: bool = false
var delayed: bool = false
var storage: Dictionary = {}

func reset() -> void:
    ready = true
    fail_next = false
    delayed = false
    storage.clear()

func execute(semantic_id: String, canonical_value: int, runtime_id: int, mode: String = "normal") -> Dictionary:
    if mode == "not-ready" or not ready:
        return {"classification": "NOT-READY", "semantic_id": semantic_id}
    if mode == "failure" or fail_next:
        fail_next = false
        return {"classification": "PROVIDER-ERROR", "semantic_id": semantic_id}
    storage[runtime_id] = canonical_value
    return {
        "classification": "DELAYED-SUCCESS" if mode == "delayed" or delayed else "SUCCESS",
        "semantic_id": semantic_id,
        "canonical_value": int(storage[runtime_id]),
        "provider_local_id": runtime_id,
    }

func provider_identity() -> Dictionary:
    return {"lane": "deterministic-fake", "edition": "fixture", "ready": ready}
