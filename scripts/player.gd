extends CharacterBody2D

@export var speed = 75.0

func get_input():
	#look_at(get_global_mouse_position())
	var direction := Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed

func _physics_process(_delta: float) -> void:
	get_input()
	move_and_slide()
