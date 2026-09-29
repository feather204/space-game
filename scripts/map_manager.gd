extends Node2D


@onready var world = $"../MapManager/World"
@onready var shadows = $"../MapManager/Shadow"

func _ready():
	shadows.position = Vector2(2, 2)
	for tile_pos in world.get_used_cells():
		var source_id = world.get_cell_source_id(tile_pos)
		var atlas_coords = world.get_cell_atlas_coords(tile_pos)

		shadows.set_cell(tile_pos, source_id, atlas_coords)
