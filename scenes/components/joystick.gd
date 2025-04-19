extends Sprite2D

@onready var hit_btn: Node2D = $"../HitBtn"

var maxLen = 110
var ondraging = -1
var is_drag = false
var pre_vector = Vector2.ZERO

func _ready() -> void:
	$point.position = Vector2.ZERO

func _input(event):
	if hit_btn.is_pressed:
		is_drag = false
	if event is InputEventScreenDrag or (event is InputEventScreenTouch 
	and event.is_pressed() 
	and not hit_btn.is_pressed):
		is_drag = true
		var cur_pos = get_now_pos()
		pre_vector = GameInputEvents.movement_input_joy(cur_pos)
		print("pre:",pre_vector)
		var mouse_pos = (event.position - self.global_position).length()
		
		if mouse_pos <= maxLen or event.get_index() == ondraging:
			ondraging = event.get_index()
			$point.set_global_position(event.position)
			
			if $point.position.length() > maxLen:
				$point.set_position(cur_pos * maxLen)
		
	if event is InputEventScreenTouch and !event.is_pressed():
		if event.get_index() == ondraging:
			set_center()
			ondraging = -1
			
func get_point_position():
	return $point.position

func get_now_pos():
	return get_point_position().normalized()

func set_center():
	is_drag = false
	var tween = get_tree().create_tween()
	tween.tween_property($point, "position", Vector2(0,0), 0.2).set_trans(Tween.TRANS_LINEAR)
	#$point.position = Vector2.ZERO
