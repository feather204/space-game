extends Node2D

@onready var world = $"../MapManager/World"

@export var door_scene: PackedScene

func _ready() -> void:
	for tile_pos in world.get_used_cells():
		var tile_data = world.get_cell_tile_data(tile_pos)
		
		if tile_data:
			var type = tile_data.get_custom_data("type")
			if type == "door":
				var door = door_scene.instantiate()
				door.tile_position = tile_pos
				door.position = world.map_to_local(tile_pos)
				
				add_child(door)
				world.erase_cell(tile_pos)
