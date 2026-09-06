extends RefCounted

func rebuild(canonical_state: Dictionary) -> Dictionary:
    var entries: Array = []
    var objects: Dictionary = canonical_state["objects"]
    var ids: Array = objects.keys()
    ids.sort()
    for semantic_id in ids:
        var item: Dictionary = objects[semantic_id]
        entries.append({
            "semantic_id": semantic_id,
            "object_class": item["object_class"],
            "revision": int(item["revision"]),
            "value": int(item["value"]),
            "position": item["position"].duplicate(),
        })
    return {
        "source_revision": int(canonical_state["world_revision"]),
        "entry_count": entries.size(),
        "entries": entries,
    }

func query(read_model: Dictionary) -> Array:
    return read_model["entries"].duplicate(true)

func source_query(canonical_state: Dictionary) -> Array:
    return rebuild(canonical_state)["entries"]
