extends CharacterBody2D

@export var speed = 75.0
@onready var sprite = $AnimatedSprite2D
@onready var floors = $"../MapManager/Floors"

var on_floor = false

func get_input():
	#look_at(get_global_mouse_position())
	var direction := Input.get_vector("left", "right", "up", "down")

	if on_floor:
		velocity = direction * speed
		$Shadow.visible = true
	else:
		velocity = velocity.lerp(direction * speed, 0.02)
		$Shadow.visible = false

	if velocity.length() > 0 and on_floor:
		sprite.play("walk")
	elif velocity.length() > 0 and not on_floor:
		sprite.play("space")
	else:
		sprite.play("idle")

func _physics_process(_delta: float) -> void:
	var tile_pos = floors.local_to_map(floors.to_local(global_position))
	on_floor = floors.get_cell_source_id(tile_pos) != -1

	print(tile_pos, " ", floors.get_cell_source_id(tile_pos), " ", on_floor)

	get_input()
	move_and_slide()
