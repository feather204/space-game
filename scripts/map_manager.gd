extends Node2D

@onready var world = $World
@onready var floors = $Floors
@onready var shadows = $Shadow

func _ready():
	shadows.position = Vector2(2, 4)
	for tile_pos in world.get_used_cells():
		var source_id = world.get_cell_source_id(tile_pos)
		var atlas_coords = world.get_cell_atlas_coords(tile_pos)

		shadows.set_cell(tile_pos, source_id, atlas_coords)