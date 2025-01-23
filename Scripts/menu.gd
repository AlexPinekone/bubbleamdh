extends Control

func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://Levels/level_0.tscn")

func _on_credits_pressed() -> void:
	get_tree().change_scene_to_file("res://Levels/creditos.tscn")

func _on_quit_pressed() -> void:
	get_tree().quit()
