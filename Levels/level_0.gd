extends Node2D

@onready var pause_menu: Control = $Pause/PauseMenu
@onready var back_music: AudioStreamPlayer2D = $Base/backMusic

var paused = false
var bandera = false

func _ready() -> void:
	$Base/Health.max_value = $Base/Player.max_health
	$Base/Health.value = $Base/Player.health
	back_music.play()

func _process(delta: float) -> void:
	if bandera:
		$Base/TextEdit.text = "Points: " + str(Global.points)
		
	$Base/Health.max_value = $Base/Player.max_health
	if $Base/Player.health <= 0:
		back_music.stop()
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
		pause_menu.show()
		get_tree().paused = true
		
	paused = !paused
	
