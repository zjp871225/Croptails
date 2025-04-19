extends Node2D

var speed = 50

@onready var playerJoy = $PlayerJoy
@onready var joystick = $joystick

func _process(delta: float) -> void:
	var nowPos = joystick.get_now_pos()
	playerJoy.position += nowPos * speed * delta
