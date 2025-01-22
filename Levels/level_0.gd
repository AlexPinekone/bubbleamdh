extends Node2D

var bandera = false

func _process(delta: float) -> void:
	if bandera:
		$Base/TextEdit.text = "Points: " + str(Global.points)

func _on_timer_timeout() -> void:
	$Base/TextEdit.text = "Points: " + str(Global.points)
	$Base/TextEdit.size = Vector2(100,50)
	bandera = true
	$Spawn/Timer.stop()
	
