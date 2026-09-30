extends Node2D

@onready var map_manager = get_tree().current_scene.get_node("MapManager")
@onready var world = map_manager.world
@onready var shadows = map_manager.shadows

func interact(tile_pos, tile_data, _player):
	var type = tile_data.get_custom_data("type")
	
	if type == "asteroid":
		var asteroid_material = tile_data.get_custom_data("material")
		var slots = get_tree().get_nodes_in_group("inventory_slot")
		var mined = false

		for slot in slots:
			if slot.item == asteroid_material:
				slot.add_item(asteroid_material, 1)
				mined = true
				break

		if not mined:
			for slot in slots:
				if slot.item == null:
					slot.add_item(asteroid_material, 1)
					mined = true
					break
			
		if mined:
			world.erase_cell(tile_pos)
			shadows.erase_cell(tile_pos)
