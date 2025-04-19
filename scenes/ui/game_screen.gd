extends CanvasLayer

var is_press_hit_button:bool = false


func _on_hit_button_hit_press() -> void:
	#print("hit press")
	is_press_hit_button = true



func _on_hit_button_hit_release() -> void:
	#print("hit release")
	is_press_hit_button = false
