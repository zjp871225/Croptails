class_name PlayerJoy2
extends CharacterBody2D

@export var current_tool: DataTypes.Tools = DataTypes.Tools.None
@onready var joystick: Sprite2D = $"../joystick"
@onready var hit_btn = $"../HitBtn"

var player_direction: Vector2
var is_press_hit_btn: bool

func _ready() -> void:
	player_direction = Vector2.ZERO
	is_press_hit_btn = hit_btn.is_pressed

func _physics_process(delta: float) -> void:
	player_direction = joystick.get_now_pos()
	is_press_hit_btn = hit_btn.is_pressed
