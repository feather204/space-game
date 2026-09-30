extends Area2D

var tile_position
var display_name = "Cargo Terminal"

@onready var map_manager = get_tree().current_scene.get_node("MapManager")
@onready var world = map_manager.world

func _ready() -> void:
	tile_position = world.local_to_map(world.to_local(global_position))

func interact():
	pass
