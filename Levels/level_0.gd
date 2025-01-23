extends Node2D

@onready var pause_menu: Control = $Pause/PauseMenu
var paused = false
var bandera = false

func _ready() -> void:
	$Base/Health.max_value = $Base/Player.max_health
	$Base/Health.value = $Base/Player.health

func _process(delta: float) -> void:
	if bandera:
		$Base/TextEdit.text = "Points: " + str(Global.points)
	if Input.is_action_just_pressed("pause"):
		pauseMenu()
		
	$Base/Health.max_value = $Base/Player.max_health
	if $Base/Player.health <= 0:
		Global.resetVar()
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		get_tree().change_scene_to_file("res://Levels/game_over.tscn")

func _on_timer_timeout() -> void:
	$Base/TextEdit.text = "Points: " + str(Global.points)
	$Base/TextEdit.size = Vector2(100,50)
	bandera = true
	$Spawn/Timer.stop()
	
func pauseMenu():
	if paused:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		pause_menu.hide()
		get_tree().paused = false
	else:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		get_tree().paused = true
		pause_menu.show()
		
	paused = !paused
	
