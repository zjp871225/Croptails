extends Sprite2D

var is_up_pressed := false
var is_down_pressed := false
var is_right_pressed := false
var is_left_pressed := false
var pre_vector = Vector2.ZERO

func _on_up_pressed() -> void:
	is_up_pressed = true


func _on_up_released() -> void:
	is_up_pressed = false


func _on_right_pressed() -> void:
	is_right_pressed = true


func _on_right_released() -> void:
	is_right_pressed = false


func _on_left_pressed() -> void:
	is_left_pressed = true


func _on_left_released() -> void:
	is_left_pressed = false


func _on_down_pressed() -> void:
	is_down_pressed = true


func _on_down_released() -> void:
	is_down_pressed = false


func get_now_pos():
	var direction
	if is_up_pressed:
		direction = Vector2.UP
	elif is_down_pressed:
		direction = Vector2.DOWN
	elif is_right_pressed:
		direction = Vector2.RIGHT
	elif is_left_pressed:
		direction = Vector2.LEFT
	else:
		direction = Vector2.ZERO
	if direction != Vector2.ZERO:
		pre_vector = direction
	return direction
