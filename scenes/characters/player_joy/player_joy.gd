class_name PlayerJoyPad
extends CharacterBody2D

@onready var hit_component: HitComponent = $HitComponent
@export var current_tool: DataTypes.Tools = DataTypes.Tools.None
@onready var joystick = $"../joystick"
@onready var hit_btn: Node2D = $"../HitBtn"

var player_direction: Vector2
var is_press_hit_btn: bool


func _ready() -> void:
	player_direction = Vector2.ZERO
	ToolManager.tool_selected.connect(on_tool_selected)
	is_press_hit_btn = hit_btn.is_pressed


func on_tool_selected(tool: DataTypes.Tools) -> void:
	current_tool = tool
	hit_component.current_tool = tool

func _physics_process(delta: float) -> void:
	player_direction = joystick.get_now_pos()
	is_press_hit_btn = hit_btn.is_pressed
