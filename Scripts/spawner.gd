extends Node2D

@onready var enemy = preload("res://Nodos/Personajes/enemy.tscn")

func _ready() -> void:
	generate_enemy()

func _on_timer_timeout() -> void:
	generate_enemy()
	
func generate_enemy():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var random = rng.randi_range(1,4)
	
	match random:
		1:
			position = Vector2(rng.randi_range(-330,330),230)
		2:
			position = Vector2(rng.randi_range(-330,330),-210)
		3:
			position = Vector2(330, rng.randi_range(-210,230))
		4:
			position = Vector2(-330, rng.randi_range(-210,230))
	
	var ene = enemy.instantiate()
	ene.position = position
	get_parent().get_node("EnemyHandler").add_child(ene)
