extends TextureButton

signal hit_press
signal hit_release




func _on_button_down() -> void:
	hit_press.emit()


func _on_button_up() -> void:
	hit_release.emit()
