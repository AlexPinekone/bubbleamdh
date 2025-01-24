extends Control


func _ready() -> void:
	if Global.points > SaveLoad.highest_record:
		SaveLoad.highest_record = Global.points
	SaveLoad.save_score()
	$MarginContainer/VBoxContainer/Label.text = "Highest Score: "+ str(SaveLoad.highest_record)
	Global.resetVar()

func _on_restart_pressed() -> void:
	get_tree().change_scene_to_file("res://Levels/level_0.tscn")


func _on_main_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://Levels/menu.tscn")
