extends RefCounted

const SemanticRegistry = preload("res://src/domain/semantic_registry.gd")

var world_definition: Dictionary
var canonical_state: Dictionary
var world_session_id: String
var role: String = "single-player"
var frame_epoch: int = 0
var peer_bindings: Dictionary = {}

static func create(seed: int, session_suffix: String = "primary") -> RefCounted:
    var instance = new()
    instance.world_definition = {
        "world_definition_id": "world-definition.leyforge.w0",
        "seed": seed,
        "schema": SemanticRegistry.SCHEMA,
    }
    instance.canonical_state = SemanticRegistry.make_state(seed)
    instance.world_session_id = "world-session.leyforge.%08d.%s" % [seed, session_suffix]
    return instance

func canonical_snapshot() -> Dictionary:
    return canonical_state.duplicate(true)

func canonical_digest() -> String:
    return SemanticRegistry.digest(canonical_snapshot())

func advance(ticks: int) -> void:
    canonical_state["world_revision"] = int(canonical_state["world_revision"]) + ticks
    var objects: Dictionary = canonical_state["objects"]
    for semantic_id in objects:
        var item: Dictionary = objects[semantic_id]
        item["timer_ticks"] = int(item["timer_ticks"]) + ticks
        item["revision"] = int(item["revision"]) + ticks

func save_payload() -> String:
    return SemanticRegistry.canonical_json({
        "world_definition": world_definition,
        "canonical_state": canonical_state,
        "world_session_id": world_session_id,
    })

static func load_payload(payload: String) -> RefCounted:
    var decoded = JSON.parse_string(payload)
    if not decoded is Dictionary:
        return null
    var instance = new()
    instance.world_definition = decoded["world_definition"]
    instance.canonical_state = SemanticRegistry.restore_state(decoded["canonical_state"])
    instance.world_session_id = str(decoded["world_session_id"])
    return instance

func promote_to_listen_host(host_peer_id: int) -> void:
    role = "listen-host"
    peer_bindings[host_peer_id] = "actor.leyforge.test_settler"

func bind_remote_peer(peer_id: int, semantic_actor_id: String) -> void:
    peer_bindings[peer_id] = semantic_actor_id

func unbind_peer(peer_id: int) -> void:
    peer_bindings.erase(peer_id)

func return_to_local() -> void:
    role = "single-player"
    peer_bindings.clear()
