extends StaticBody2D

@onready var animated_sprite = $AnimatedSprite2D
@onready var collision_shape = $CollisionShape2D

var open = false
var walkable = false

func _ready() -> void:
	z_index = 2

func _process(delta: float) -> void:
	if animated_sprite.frame == 4:
		if walkable == false:
			collision_shape.disabled = false	
		else:
			collision_shape.disabled = true
		
func toggle_door():
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


func _on_area_2d_mouse_entered() -> void:
	animated_sprite.modulate = Color(1.3,1.3,1.3)

func _on_area_2d_mouse_exited() -> void:
	animated_sprite.modulate = Color.WHITE

func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			toggle_door()
