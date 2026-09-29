extends Area2D

var item_data = preload("res://scripts/item_data.gd").new()

var item = null
var quantity = 0
var tile_position
var display_name

func set_item(_item: String, _quantity: int) -> void:
	item = _item
	quantity = _quantity
	update_display()

func interact():
	var slots = get_tree().get_nodes_in_group("inventory_slot")

	for slot in slots:
		if slot.item == item:
			slot.add_item(item, quantity)
			queue_free()
			return

	for slot in slots:
		if slot.item == null:
			slot.add_item(item, quantity)
			queue_free()
			return

func update_display():
	if quantity != 1:
		$Quantity.text = str(quantity)
	else:
		$Quantity.text = ""
	if item != null:
		$Sprite2D.texture = item_data.items[item]["image"]
		display_name = item_data.items[item]["name"]
	else:
		$Sprite2D.texture = null
		display_name = ""

func _on_input_event(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		var player = get_tree().get_first_node_in_group("player")
		if player != null:
			player.pick_up_item(item, quantity)
			queue_free()
