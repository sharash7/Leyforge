extends RefCounted

const SCHEMA := "leyforge-r7-w0-semantic-state-v1"
const LEGACY_ALIASES := {
    "1": "block.leyforge.stone",
    "7": "item.leyforge.copper_ingot",
    "42": "entity.leyforge.test_actor",
}
const SEMANTIC_OBJECTS := [
    {"semantic_id": "block.leyforge.stone", "object_class": "block", "value": 11},
    {"semantic_id": "entity.leyforge.test_actor", "object_class": "entity", "value": 23},
    {"semantic_id": "item.leyforge.copper_ingot", "object_class": "item", "value": 37},
    {"semantic_id": "machine.leyforge.test_press", "object_class": "machine", "value": 41},
    {"semantic_id": "actor.leyforge.test_settler", "object_class": "actor", "value": 53},
]

static func make_state(seed: int) -> Dictionary:
    var objects: Dictionary = {}
    var index := 0
    for template in SEMANTIC_OBJECTS:
        var semantic_id: String = template["semantic_id"]
        objects[semantic_id] = {
            "semantic_id": semantic_id,
            "object_class": template["object_class"],
            "revision": 1,
            "value": template["value"],
            "position": [seed * 17 + index * 3, index * 5 - seed, seed * -11 + index],
            "inventory": ["item.leyforge.copper_ingot"],
            "references": ["block.leyforge.stone"],
            "timer_ticks": index,
        }
        index += 1
    return {
        "schema": SCHEMA,
        "world_definition_id": "world-definition.leyforge.w0",
        "world_id": "world.leyforge.w0.%08d" % seed,
        "world_seed": seed,
        "world_revision": 1,
        "objects": objects,
    }

static func restore_state(value: Dictionary) -> Dictionary:
    var result: Dictionary = value.duplicate(true)
    result["world_seed"] = int(result["world_seed"])
    result["world_revision"] = int(result["world_revision"])
    var objects: Dictionary = result["objects"]
    for semantic_id in objects:
        var item: Dictionary = objects[semantic_id]
        for field in ["revision", "value", "timer_ticks"]:
            item[field] = int(item[field])
        var position: Array = item["position"]
        item["position"] = [int(position[0]), int(position[1]), int(position[2])]
    return result
static func normalized(value: Variant) -> Variant:
    if value is Dictionary:
        var result: Dictionary = {}
        var keys: Array = value.keys()
        keys.sort()
        for key in keys:
            result[str(key)] = normalized(value[key])
        return result
    if value is Array:
        var result: Array = []
        for item in value:
            result.append(normalized(item))
        return result
    return value

static func canonical_json(value: Variant) -> String:
    return JSON.stringify(normalized(value))

static func digest(value: Variant) -> String:
    var context := HashingContext.new()
    context.start(HashingContext.HASH_SHA256)
    context.update(canonical_json(value).to_utf8_buffer())
    return context.finish().hex_encode()

static func object_ids() -> Array[String]:
    var result: Array[String] = []
    for item in SEMANTIC_OBJECTS:
        result.append(str(item["semantic_id"]))
    return result
