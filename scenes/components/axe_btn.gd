extends TouchScreenButton

@onready var btn = $CanvasLayer/TouchScreenButton

# 在节点就绪时连接信号
func _ready():
	self.connect("pressed", btn, "_on_TouchScreenButton_pressed")
	self.connect("released", btn, "_on_TouchScreenButton_released")

# 处理按下事件
func _on_TouchScreenButton_pressed():
	print("TouchScreenButton was pressed")
	# 在这里执行按下时的逻辑

# 处理释放事件
func _on_TouchScreenButton_released():
	print("TouchScreenButton was released")
	# 在这里执行释放时的逻辑
