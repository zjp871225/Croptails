class_name CollectableComponent
extends Area2D

@export var collectable_name: String


func _on_body_entered(body: Node2D) -> void:
	if body is Player or body is PlayerJoy2 or body is PlayerJoyPad:
		InventoryManager.add_collectable(collectable_name)
		print("Collected:",collectable_name)
		get_parent().queue_free()
