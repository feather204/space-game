extends Control

@onready var interaction_manager = $"../../InteractionManager"

var selected_slot = 0

func _ready() -> void:
	$Slot1.set_selected(true)
	$Slot2.set_selected(false)

func _input(event):
	if event.is_action_pressed("swap"):
		selected_slot = 1 - selected_slot

		$Slot1.set_selected(selected_slot == 0)
		$Slot2.set_selected(selected_slot == 1)

	if event.is_action_pressed("drop"):
		var slot = get_child(selected_slot)
		slot.drop_item(interaction_manager.hovered_tile)

	if event.is_action_pressed("drop_all"):
		var slot = get_child(selected_slot)
		slot.drop_all(interaction_manager.hovered_tile)
