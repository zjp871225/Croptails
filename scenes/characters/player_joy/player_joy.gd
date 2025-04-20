class_name PlayerJoyPad
extends CharacterBody2D

@export var current_tool: DataTypes.Tools = DataTypes.Tools.None

@onready var hit_component: HitComponent = $HitComponent
@onready var joystick = $"../joystick"
@onready var game_screen: CanvasLayer = $"../GameScreen"

var player_direction: Vector2


func _ready() -> void:
	player_direction = Vector2.ZERO
	ToolManager.tool_selected.connect(on_tool_selected)


func on_tool_selected(tool: DataTypes.Tools) -> void:
	current_tool = tool
	hit_component.current_tool = tool

func _physics_process(delta: float) -> void:
	player_direction = joystick.get_now_pos()
