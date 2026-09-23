extends Control

@onready var item_image = $Slot/Image
@onready var quantity_label = $Slot/Quantity

var item = null
var quantity = 0

func add_item(new_item):
	if item == null:
		item = new_item
		quantity = 1
	elif item == new_item:
		quantity += 1
	
	update_display()

func update_display():
	if item == "iron":
		item_image.texture = preload("res://sprites/items/iron_ore.png")
	elif item == "copper":
		item_image.texture = preload("res://sprites/items/copper_ore.png")
	else:
		item_image.texture = null

	quantity_label.text = str(quantity)
