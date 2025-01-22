extends Node2D

var bandera = false

func _process(delta: float) -> void:
	if bandera:
		$TextEdit.text = "Points: " + str(Global.points)

func _on_timer_timeout() -> void:
	$TextEdit.text = "Points: " + str(Global.points)
	$TextEdit.size = Vector2(100,50)
	bandera = true
	$Timer.stop()
