extends Node2D

@onready var world = $"../MapManager/World"
@onready var highlight = $Highlight
@onready var hover_label = $"../UI/HoveredName"
@onready var tile_interaction_manager = $"../TileInteractionManager"

var hovered_tile
var hovered_data
var hovered_object

func _process(_delta: float) -> void:
	var mouse_pos = get_global_mouse_position()
	var tile_pos = world.local_to_map(world.to_local(mouse_pos))
	
	# get either object or tile hovered
	hovered_object = null
	for object in get_tree().get_nodes_in_group("interactable"):
		if object.tile_position == tile_pos:
			if object.is_in_group("dropped_item"):
				hovered_object = object
				break
			elif hovered_object == null:
				hovered_object = object
			
	hovered_tile = tile_pos
	hovered_data = world.get_cell_tile_data(tile_pos)
	
	# highlight hovered tile
	hover_label.position = get_viewport().get_mouse_position() + Vector2(10, 10)
	highlight.position = world.map_to_local(tile_pos)

	if hovered_object:
		hover_label.text = hovered_object.display_name
		hover_label.show()
		highlight.show()

	elif hovered_data and hovered_data.get_custom_data("interactable"):
		hover_label.text = hovered_data.get_custom_data("display_name")
		hover_label.show()
		highlight.show()

	else:
		hover_label.text = ""
		hover_label.hide()
		highlight.hide()

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			var player = get_tree().get_first_node_in_group("player")
			# object interaction
			if hovered_object:
				hovered_object.interact()
			# tile interactions
			elif hovered_data:
				var interactable = hovered_data.get_custom_data("interactable")
				if interactable == true:
					tile_interaction_manager.interact(hovered_tile, hovered_data, player)
