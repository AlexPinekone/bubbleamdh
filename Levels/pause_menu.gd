extends Control

@onready var main = $'../..'

func _on_resume_pressed() -> void:
	main.pauseMenu()

func _on_quit_pressed() -> void:
	main.pauseMenu()
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	get_tree().change_scene_to_file("res://Levels/menu.tscn")
