#extends Control
#
#@onready var grid = $Panel/GridContainer
#@export var slot_scene: PackedScene
#
#func _ready() -> void:
	#for i in range(20):
		#var slot = slot_scene.instantiate()
		#grid.add_child(slot)
#
#func _input(event: InputEvent) -> void:
	#if event.is_action_pressed("inventory"):
		#visible = !visible
