extends CharacterBody2D

@export var SPEED = 75.0

func get_input():
	#look_at(get_global_mouse_position())
	var direction := Input.get_vector("left", "right", "up", "down")
	velocity = direction * SPEED

func _physics_process(delta: float) -> void:
	get_input()
	move_and_slide()
