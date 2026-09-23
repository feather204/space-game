extends StaticBody2D

@onready var animated_sprite = $AnimatedSprite2D
@onready var collision_shape = $CollisionShape2D

var open = false
var walkable = false
var tile_position: Vector2i

func _ready() -> void:
	# make it above player
	z_index = 2
	
func _process(_delta: float) -> void:
	# toggle collision based on current frame
	if animated_sprite.frame == 4:
		if walkable == false:
			collision_shape.disabled = false	
		else:
			collision_shape.disabled = true
		
func interact():
	# toggle door open/close
	if open == false:
		walkable = true
		animated_sprite.play("open")
		await animated_sprite.animation_finished
		open = true
	elif open == true:
		walkable = false
		animated_sprite.play_backwards("open")
		await animated_sprite.animation_finished
		open = false
