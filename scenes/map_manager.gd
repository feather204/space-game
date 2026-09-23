extends Node2D

@export var map_layers: Array[TileMapLayer] = []
#
#func _input(event: InputEvent) -> void:
	#if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		#var global_mouse_pos = get_global_mouse_position()
		#
		#for i in range(0, map_layers.size(), 1):
			#var layer = map_layers[i]
			#
			#var map_pos = layer.local_to_map(layer.to_local(global_mouse_pos))
			#
			#if layer.get_cell_source_id(map_pos) != -1:
				#handle_tile_interaction(layer, map_pos)
				#
				#get_viewport().set_input_as_handled()
				#break
		
func handle_tile_interaction(layer: TileMapLayer, coords: Vector2i) -> void:
	var tile_data = layer.get_cell_tile_data(coords)
	if not tile_data:
		return
	
	print("Clicked layer: ", layer.name, " at grid position: ", coords)
	
	layer.set_cell(coords, -1)
