extends Area2D

var tile_position
var display_name = "Cargo Terminal"

@onready var world = $"../MapManager/World"

func _ready() -> void:
	tile_position = world.local_to_map(world.to_local(global_position))

func interact():
	pass
