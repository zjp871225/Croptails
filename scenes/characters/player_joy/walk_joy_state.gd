extends NodeState

@export var player:PlayerJoyPad
@export var animated_sprite_2d: AnimatedSprite2D
@export var speed: int = 50

func _on_process(_delta : float) -> void:
	pass


func _on_physics_process(_delta : float) -> void:
	print("walk:",player.joystick.is_drag)
	var direction:Vector2 = GameInputEvents.movement_input_joy(player.player_direction)
	if direction == Vector2.UP:
		animated_sprite_2d.play("walk_back")
	elif direction == Vector2.DOWN:
		animated_sprite_2d.play("walk_front")
	elif direction == Vector2.RIGHT:
		animated_sprite_2d.play("walk_right")
	elif direction == Vector2.LEFT:
		animated_sprite_2d.play("walk_left")
	
	player.velocity = player.player_direction * speed
	player.move_and_slide()
	


func _on_next_transitions() -> void:
	if !GameInputEvents.is_movement_joy_input(player.player_direction):
		transition.emit("Idle")


func _on_enter() -> void:
	pass


func _on_exit() -> void:
	animated_sprite_2d.stop()
