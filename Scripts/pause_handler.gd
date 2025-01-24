extends Control

@onready var main = $'../..'

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
			main.pauseMenu()
