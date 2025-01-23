extends Control


func _on_restart_pressed() -> void:
	get_tree().change_scene_to_file("res://Levels/level_0.tscn")


func _on_main_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://Levels/menu.tscn")