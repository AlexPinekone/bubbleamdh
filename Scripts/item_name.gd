extends TextEdit

func show_Name(titulo: String):
	text = titulo
	visible = true
	$"../timerItemName".start()

func _on_timer_item_name_timeout() -> void:
	visible = false
