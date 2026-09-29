extends Control

@onready var item_image = $Slot/Image
@onready var quantity_label = $Slot/Quantity
@onready var world = get_tree().current_scene.get_node("MapManager/World")

var item_data = preload("res://scripts/item_data.gd").new()

var item = null
var quantity = 0
var selected = false

func set_selected(value):
	selected = value
	
	$Slot/Selected.visible = selected

func add_item(_new_item, _quantity):
	if item == null:
		item = _new_item
		quantity = _quantity
	elif item == _new_item:
		quantity += _quantity
	
	update_display()

func update_display():
	if quantity == 0:
		item = null

	if item != null:
		item_image.texture = item_data.items[item]["image"]
	else:
		item_image.texture = null

	quantity_label.text = str(quantity) if quantity >= 1 else ""

func drop_item(tile_pos):
	if item != null:

		for dropped_item in get_tree().get_nodes_in_group("dropped_item"):
			if dropped_item.tile_position == tile_pos:
				if dropped_item.item == item:
					dropped_item.quantity += quantity
					dropped_item.update_display()
					clear_slot()
				return

		var dropped_item = preload("res://scenes/dropped_item.tscn").instantiate()	
		dropped_item.set_item(item, quantity)
		dropped_item.tile_position = tile_pos

		world.add_child(dropped_item)
		dropped_item.position = world.map_to_local(tile_pos)

		clear_slot()

func clear_slot():
	item = null
	quantity = 0
	update_display()