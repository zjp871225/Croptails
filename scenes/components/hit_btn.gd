extends Node2D

var is_pressed = false


func _on_touch_screen_button_pressed() -> void:
	is_pressed = true


func _on_touch_screen_button_released() -> void:
	is_pressed = false
