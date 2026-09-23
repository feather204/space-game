extends Node2D

@export var player_scene: PackedScene

@onready var spawn_point = $PlayerSpawn
@onready var world = $MapManager/World

func _ready() -> void:
	# spawn player
	spawn_player()

	# make fake shadows with world tiles
	var shadows = world.duplicate()
	$MapManager.add_child(shadows)
	shadows.position += Vector2(2,2)
	shadows.z_index = -2
	shadows.modulate = Color(0.0, 0.0, 0.0, 0.31)
	shadows.collision_enabled = false

func spawn_player() -> void:
	var player = player_scene.instantiate()
	
	add_child(player)
	player.global_position = spawn_point.global_position
