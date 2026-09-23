extends Node2D

@onready var world = $"../MapManager/World"
@onready var highlight = $Highlight

var hovered_tile
var hovered_data
var hovered_object

func _process(_delta: float) -> void:
	var mouse_pos = get_global_mouse_position()
	var tile_pos = world.local_to_map(world.to_local(mouse_pos))
	
	hovered_object = null
	for object in get_tree().get_nodes_in_group("interactable"):
		if object.tile_position == tile_pos:
			hovered_object = object
			break
			
	hovered_tile = tile_pos
	hovered_data = world.get_cell_tile_data(tile_pos)
	
	# highlight hovered tile
	if hovered_object:
		highlight.position = world.map_to_local(tile_pos)
		highlight.show()
	elif hovered_data:
		var interactable = hovered_data.get_custom_data("interactable")
		
		if interactable == true:
			highlight.position = world.map_to_local(tile_pos)
			highlight.show()
		else:
			highlight.hide()
	else:
		highlight.hide()

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			if hovered_object:
				hovered_object.interact()
			elif hovered_data:
				var interactable = hovered_data.get_custom_data("interactable")
				if interactable == true:
					var type = hovered_data.get_custom_data("type")
					if type == "asteroid":
						print("mined")
