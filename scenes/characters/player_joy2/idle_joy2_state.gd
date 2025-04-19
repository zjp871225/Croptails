extends NodeState

@export var player: PlayerJoy
@export var animated_sprite_2d: AnimatedSprite2D


func _on_process(_delta: float) -> void:
	pass


func _on_physics_process(_delta: float) -> void:
	if !player.joystick.is_drag:
		var direction =player.joystick.pre_vector
		if direction == Vector2.UP:
			animated_sprite_2d.play("idle_back")
		elif direction == Vector2.DOWN:
			animated_sprite_2d.play("idle_front")
		elif direction == Vector2.LEFT:
			animated_sprite_2d.play("idle_left")
		elif direction == Vector2.RIGHT:
			animated_sprite_2d.play("idle_right")
		else:
			animated_sprite_2d.play("idle_front")


func _on_next_transitions() -> void:
	GameInputEvents.movement_input_joy(player.player_direction)

	if GameInputEvents.is_movement_input():
		transition.emit("Walk")
	if GameInputEvents.use_tool("axe"):
		transition.emit("Chopping")
	if GameInputEvents.use_tool("hoe"):
		transition.emit("Tilling")
	if GameInputEvents.use_tool("canteen"):
		transition.emit("Watering")


func _on_enter() -> void:
	pass


func _on_exit() -> void:
	animated_sprite_2d.stop()
