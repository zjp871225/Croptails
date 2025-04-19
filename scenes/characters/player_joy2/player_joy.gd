class_name PlayerJoy
extends CharacterBody2D

@export var current_tool: DataTypes.Tools = DataTypes.Tools.None
@onready var joystick = $"../joystick"
@onready var axe_btn = $"../AxeBtn"

var player_direction: Vector2
var is_press_axe: bool

func _ready() -> void:
	player_direction = Vector2.ZERO
	is_press_axe = axe_btn.is_pressed

func _physics_process(delta: float) -> void:
	player_direction = joystick.get_now_pos()
	is_press_axe = axe_btn.is_pressed
