extends NodeState

@export var player: PlayerJoyPad
@export var animate_sprite_2d: AnimatedSprite2D
@export var hit_component_collision_shape: CollisionShape2D

func _ready() -> void:
	hit_component_collision_shape.disabled = true
	hit_component_collision_shape.position = Vector2.ZERO

func _on_process(_delta: float) -> void:
	pass


func _on_physics_process(_delta: float) -> void:
	pass


func _on_next_transitions() -> void:
	# 如果没有播放，则切换到闲置状态
	if !animate_sprite_2d.is_playing():
		transition.emit("Idle")


func _on_enter() -> void:
#	print("chopping:",player.joystick.is_drag)
	if !player.joystick.is_drag:
		var direction = player.joystick.pre_vector
		if direction == Vector2.UP:
			animate_sprite_2d.play("chopping_back")
			hit_component_collision_shape.position = Vector2(0, -18)
		elif direction == Vector2.DOWN:
			animate_sprite_2d.play("chopping_front")
			hit_component_collision_shape.position = Vector2(0, 3)
		elif direction == Vector2.LEFT:
			animate_sprite_2d.play("chopping_left")
			hit_component_collision_shape.position = Vector2(-9, 0)
		elif direction == Vector2.RIGHT:
			animate_sprite_2d.play("chopping_right")
			hit_component_collision_shape.position = Vector2(9, 0)
		else:
			animate_sprite_2d.play("chopping_front")
			hit_component_collision_shape.position = Vector2(0, 3)
		hit_component_collision_shape.disabled = false

func _on_exit() -> void:
	animate_sprite_2d.stop()
	hit_component_collision_shape.disabled = true
