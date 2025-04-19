class_name GameInputEvents

static var direction: Vector2

static func movement_input() -> Vector2:
	if Input.is_action_pressed("walk_left"):
		direction = Vector2.LEFT
	elif Input.is_action_pressed("walk_right"):
		direction = Vector2.RIGHT
	elif Input.is_action_pressed("walk_up"):
		direction = Vector2.UP
	elif Input.is_action_pressed("walk_down"):
		direction = Vector2.DOWN
	else:
		direction = Vector2.ZERO

	return direction


static func movement_input_joy(current_direction: Vector2) -> Vector2:
	if current_direction == Vector2.ZERO:
		direction = current_direction
		return current_direction

	if Input.is_action_pressed("walk_left") or is_close_to_direction(current_direction, Vector2.LEFT):
		direction = Vector2.LEFT
	elif Input.is_action_pressed("walk_right") or is_close_to_direction(current_direction, Vector2.RIGHT):
		direction = Vector2.RIGHT
	elif Input.is_action_pressed("walk_up") or is_close_to_direction(current_direction, Vector2.UP):
		direction = Vector2.UP
	elif Input.is_action_pressed("walk_down") or is_close_to_direction(current_direction, Vector2.DOWN):
		direction = Vector2.DOWN
	else:
		direction = Vector2.ZERO

	return direction


static func is_movement_input() -> bool:
	return direction != Vector2.ZERO


static func is_movement_joy_input(current_direction) -> bool:
	return current_direction != Vector2.ZERO


static func use_tool(btn_type) -> bool:
	var use_tool_value = Input.is_action_just_pressed(btn_type)
	#print("use_tool:",use_tool_value)
	return use_tool_value
	

static func is_close_to_direction(current_vector: Vector2, dest_vector: Vector2, angle_threshold: float = 45.0) -> bool:
	var angle_to_direction = current_vector.angle_to(dest_vector)
	var angle_in_degrees = rad_to_deg(angle_to_direction)
	return abs(angle_in_degrees) < angle_threshold
