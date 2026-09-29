extends Node2D

@export var player_scene: PackedScene

@onready var spawn_point = $PlayerSpawn
@onready var world = $MapManager/World

func _ready() -> void:
	# spawn player
	spawn_player()

func spawn_player() -> void:
	var player = player_scene.instantiate()
	
	add_child(player)
	player.global_position = spawn_point.global_position
