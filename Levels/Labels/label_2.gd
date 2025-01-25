extends Label

func _ready():
	self.add_theme_color_override("font_color", Color(0, 0, 1)) 
	self.add_theme_stylebox_override("underline", StyleBoxEmpty.new())

func _gui_input(event):
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == Input.MouseButton.LEFT:
			OS.shell_open("https://www.tupaginaweb.com")
