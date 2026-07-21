extends Node3D
## Stage 1 entry point: wires the world, player, and HUD together.

@onready var world: VoxelWorld = $VoxelWorld
@onready var player: Player = $Player
@onready var hud: Hud = $HUD


func _ready() -> void:
	player.world = world
	hud.player = player
	player.global_position = world.find_spawn()
	print("MAIN: player spawned at ", player.global_position)
